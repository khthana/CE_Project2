VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 3  'UsesTransaction
END
Attribute VB_Name = "IBusModify"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Dim oContext As ObjectContext
Dim oSql As Object

Private Sub Class_Initialize()
    Set oContext = GetObjectContext
    Set oSql = CreateObject("DBService.IDatabase")
End Sub

Private Sub Class_Terminate()
    If Not oContext Is Nothing Then
        Set oContext = Nothing
    End If
    If Not oSql Is Nothing Then
        Set oSql = Nothing
    End If
End Sub

                                                      
Public Function SearchBusBooking(ByVal BookingID As String, _
                                                                       ByRef strResult As String) _
                                                                       As ADODB.Recordset
End Function
                                                      
Public Function SearchSeatBooking(ByVal BookingID As String, _
                                                                         ByRef strResult As String) _
                                                                         As ADODB.Recordset
End Function


Public Function ModifySeatBooking(ByVal BookingID As String, _
                                                                       ByVal rsModifySeatInfo As ADODB.Recordset, _
                                                                       ByRef strResult As String) _
                                                                       As ADODB.Recordset
On Error GoTo Oops:
Dim a As String
    Dim strMessage As String
    Dim strCommand As String
    Dim rsModifySeatResult As ADODB.Recordset
    
    ' Checking BookingID can be modified.
a = 1
    If Not CheckValidation(BookingID, strMessage) Then
        strResult = "[BusService.dll,BusService.IModify,ModifySeatBooking]:" & strMessage
        oContext.SetAbort
        Exit Function
    End If
    
    Set rsModifySeatResult = New ADODB.Recordset
    
    ' Create Recordset that use to be output of this method.
a = 2
    With rsModifySeatResult.Fields
        .Append "CustomerID", adVarChar, 50, adFldUpdatable
        .Append "SeatNo", adVarChar, 10, adFldUpdatable
        .Append "Price", adPropVariant, , adFldUpdatable
    End With
    
    If rsModifySeatInfo.EOF And rsModifySeatInfo.BOF Then
        strResult = "[BusService.dll,BusService.IModify,ModifySeatBooking]:No information to modify booking."
        oContext.SetAbort
        Exit Function
    End If
    
    ' Select each row of recordset-input to modify booking.
a = 3
    While Not rsModifySeatInfo.EOF
        
        If IsNull(rsModifySeatInfo("CustomerBookingID")) Then
            ' Modify Ẻ Adding
        Else
            If IsNull(rsModifySeatInfo("RouteID")) Then
                ' Modify Ẻ Deleting
            Else
                ' Modify Ẻ Modify
            End If
        End If
        
        rsModifySeatInfo.MoveNext
    Wend
    
    Exit Function
Oops:
    strResult = "[BusService.dll,BusService.IModify,ModifySeatBooking]:" & Err.Description
    oContext.SetAbort
End Function

Public Function ConfirmBooking(ByVal BookingID As String, ByRef strResult As String) As Boolean
On Error GoTo Oops:
    Dim strSqlResult As String
    Dim strCommand As String
    Dim mstrResult As String
    If CheckValidation(BookingID, mstrResult) Then
        strCommand = "UPDATE Booking " & vbCrLf & _
                                      "SET          Confirmation = " & Confirmation.Confirm & " " & vbCrLf & _
                                      "WHERE  BookingID = '" & BookingID & "'"
        If oSql.SqlExecute(strCommand, strSqlResult) Then
            strResult = "Completed"
            ConfirmBooking = True
            oContext.SetComplete
        Else
            strResult = "[BusService.dll,BusService.IModify,ConfirmBooking]:[1]" & vbCrLf & _
                                  strSqlResult & vbCrLf & _
                                  "Sql Command : " & vbCrLf & _
                                  """" & strCommand & """"
            ConfirmBooking = False
            oContext.SetAbort
        End If
    Else
        strResult = "[BusService.dll,BusService.IModify,ConfirmBooking]:[2]" & mstrResult
        ConfirmBooking = False
        oContext.SetAbort
    End If
    Exit Function
Oops:
    strResult = "[BusService.dll,BusService.IModify,ConfirmBooking]:[3]" & Err.Description
    ConfirmBooking = False
    oContext.SetAbort
End Function

Public Function CancelBooking(ByVal BookingID As String, ByRef strResult As String) As Boolean
On Error GoTo Oops:
    Dim strSqlResult As String
    Dim strCommand As String
    Dim mstrResult As String
    Dim rsCustomerBooking As ADODB.Recordset
    If CheckValidation(BookingID, mstrResult) Then
        strCommand = "SELECT CustomerBookingID " & _
                                      "FROM     CustomerBooking " & _
                                      "WHERE BookingID = '" & BookingID & "' "
        Set rsCustomerBooking = New ADODB.Recordset
        If Not oSql.SqlExecute(strCommand, strSqlResult, rsCustomerBooking) Then
            strResult = "[AirlineService.dll,AirlineService.IAirlineModify,CancelBooking]:[3]" & vbCrLf & _
                                  strSqlResult & vbCrLf & _
                                  "Sql Command : " & vbCrLf & _
                                  """" & strCommand & """"
            CancelBooking = False
            oContext.SetAbort
            Exit Function
        End If
        
        If rsCustomerBooking.EOF And rsCustomerBooking.BOF Then
            strResult = "[BusService.dll,BusService.IBusModify,CancelBooking]:[4]" & vbCrLf & "No content in CustomerBooking to cancel"
            CancelBooking = False
            oContext.SetAbort
            Exit Function
        End If
        
        Dim strCustomerBookingID As String
        While Not rsCustomerBooking.EOF
            strCustomerBookingID = rsCustomerBooking("CustomerBookingID")
            strCommand = "DELETE FROM SubRouteBooking " & vbCrLf & _
                                          "WHERE  CustomerBookingID = '" & strCustomerBookingID & "' "
            If Not oSql.SqlExecute(strCommand, strSqlResult) Then
                strResult = "[BusService.dll,BusService.IBusModify,CancelBooking]:[5]" & vbCrLf & _
                                      strSqlResult & vbCrLf & _
                                      "Sql Command : " & vbCrLf & _
                                      """" & strCommand & """"
                CancelBooking = False
                oContext.SetAbort
                Exit Function
            End If
            
            strCommand = "DELETE FROM CustomerBooking " & vbCrLf & _
                                          "WHERE  CustomerBookingID = '" & strCustomerBookingID & "' "
            If Not oSql.SqlExecute(strCommand, strSqlResult) Then
                strResult = "[BusService.dll,BusService.IBusModify,CancelBooking]:[6]" & vbCrLf & _
                                      strSqlResult & vbCrLf & _
                                      "Sql Command : " & vbCrLf & _
                                      """" & strCommand & """"
                CancelBooking = False
                oContext.SetAbort
            End If
                        
            rsCustomerBooking.MoveNext
        Wend
        
        strCommand = "UPDATE Booking " & vbCrLf & _
                                      "SET          Confirmation = " & Confirmation.Cancel & " " & vbCrLf & _
                                      "WHERE  BookingID = '" & BookingID & "'"
        If oSql.SqlExecute(strCommand, strSqlResult) Then
            strResult = "Completed"
            CancelBooking = True
            oContext.SetComplete
        Else
            strResult = "[BusService.dll,BusService.IBusModify,CancelBooking]:[1]" & vbCrLf & _
                                  strSqlResult & vbCrLf & _
                                  "Sql Command : " & vbCrLf & _
                                  """" & strCommand & """"
            CancelBooking = False
            oContext.SetAbort
        End If
    Else
        strResult = "[BusService.dll,BusService.IBusModify,CancelBooking]:[2]" & vbCrLf & mstrResult
        CancelBooking = False
        oContext.SetAbort
    End If
    Exit Function
Oops:
    strResult = "[BusService.dll,BusService.IBusModify,CancelBooking]:[Exception]" & vbCrLf & Err.Description
    CancelBooking = False
    oContext.SetAbort
End Function

Private Function CheckValidation(ByVal BookingID As String, ByRef strResult As String) As Boolean
On Error GoTo Oops:
    Dim strSqlResult As String
    Dim dtBookingDate  As Date
    Dim strCommand As String
    Dim rs As ADODB.Recordset
    
    Set rs = New ADODB.Recordset
    
    strCommand = "SELECT Confirmation " & _
                                  "FROM Booking " & _
                                  "WHERE BookingID = '" & BookingID & "'"
    If oSql.SqlExecute(strCommand, strSqlResult, rs) Then
        If rs.EOF And rs.BOF Then
            strResult = "No information about this BookingID." & vbCrLf & strCommand
            CheckValidation = False
        Else
            If rs("Confirmation") = Confirmation.NotConfirm Then
                strCommand = "SELECT     MIN(T2.DepartDate) " & _
                                              "FROM         CustomerBooking T1, " & vbCrLf & _
                                              "                      SubRouteBooking T2 " & vbCrLf & _
                                              "WHERE      T1.BookingID = '" & BookingID & "' " & vbCrLf & _
                                              "                        AND T2.CustomerBookingID = T1.CustomerBookingID "
                If oSql.SqlExecute(strCommand, strSqlResult, rs) Then
                    If rs.EOF And rs.BOF Then
                        strResult = "No information about minimum DepartDate of Booking"
                        CheckValidation = False
                    Else
                        dtBookingDate = rs(0)
                        If DateValue(Now) <= (dtBookingDate - DateExpire) Then
                            strResult = "Found"
                            CheckValidation = True
                        Else
                            strResult = "Date expire to confirm, cancel or modify booking."
                            CheckValidation = False
                        End If
                    End If
                Else
                    strResult = vbCrLf & _
                                          strSqlResult & vbCrLf & _
                                          "Sql Command : " & vbCrLf & _
                                          """" & strCommand & """"
                    CheckValidation = False
                End If
            Else
                strResult = "This BookingID has already confirm or cancel."
                CheckValidation = False
            End If
        End If
    Else
        strResult = vbCrLf & _
                              strSqlResult & vbCrLf & _
                              "Sql Command : " & vbCrLf & _
                              """" & strCommand & """"
        CheckValidation = False
    End If
    
    Set rs = Nothing
    Exit Function
Oops:
    strResult = Err.Description
    CheckValidation = False
End Function
