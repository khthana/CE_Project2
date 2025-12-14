VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 3  'UsesTransaction
END
Attribute VB_Name = "IAirlineModify"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Dim oContext As ObjectContext
Dim oSql As Object

Private Sub Class_Initialize()
    Set oContext = GetObjectContext
    Set oSql = CreateObject("AirlineDBService.IAirlineDB")
End Sub

Private Sub Class_Terminate()
    If Not oContext Is Nothing Then
        Set oContext = Nothing
    End If
    If Not oSql Is Nothing Then
        Set oSql = Nothing
    End If
End Sub

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
            strResult = "[AirlineService.dll,AirlineService.IModify,ConfirmBooking]:[1]" & vbCrLf & _
                                  strSqlResult & vbCrLf & _
                                  "Sql Commmand : " & vbCrLf & _
                                  strCommand
            ConfirmBooking = False
            oContext.SetAbort
        End If
    Else
        strResult = "[AirlineService.dll,AirlineService.IModify,ConfirmBooking]:[2]" & mstrResult
        ConfirmBooking = False
        oContext.SetAbort
    End If
    Exit Function
Oops:
    strResult = "[AirlineService.dll,AirlineService.IModify,ConfirmBooking]:[3]" & Err.Description
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
        strCommand = "SELECT CustomerBookingID " & vbCrLf & _
                                      "FROM     CustomerBooking " & vbCrLf & _
                                      "WHERE BookingID = '" & BookingID & "' "
        Set rsCustomerBooking = New ADODB.Recordset
        If Not oSql.SqlExecute(strCommand, strSqlResult, rsCustomerBooking) Then
            strResult = "[AirlineService.dll,AirlineService.IAirlineModify,CancelBooking]:[3]" & vbCrLf & _
                                  strSqlResult & vbCrLf & _
                                  "Sql Commmand : " & vbCrLf & _
                                  strCommand
            CancelBooking = False
            oContext.SetAbort
            Exit Function
        End If
        
        If rsCustomerBooking.EOF And rsCustomerBooking.BOF Then
            strResult = "[AirlineService.dll,AirlineService.IAirlineModify,CancelBooking]:[4]" & vbCrLf & "No content in CustomerBooking to cancel"
            CancelBooking = False
            oContext.SetAbort
            Exit Function
        End If
        
        Dim strCustomerBookingID As String
        While Not rsCustomerBooking.EOF
            strCustomerBookingID = rsCustomerBooking("CustomerBookingID")
            strCommand = "DELETE FROM SubRouteBooking " & _
                                          "WHERE  CustomerBookingID = '" & strCustomerBookingID & "' "
            If Not oSql.SqlExecute(strCommand, strSqlResult) Then
                strResult = "[AirlineService.dll,AirlineService.IAirlineModify,CancelBooking]:[5]" & vbCrLf & _
                                      strSqlResult & vbCrLf & _
                                      "Sql Commmand : " & vbCrLf & _
                                      strCommand
                CancelBooking = False
                oContext.SetAbort
                Exit Function
            End If
            
            strCommand = "DELETE FROM CustomerBooking " & vbCrLf & _
                                          "WHERE  CustomerBookingID = '" & strCustomerBookingID & "' "
            If Not oSql.SqlExecute(strCommand, strSqlResult) Then
                strResult = "[AirlineService.dll,AirlineService.IAirlineModify,CancelBooking]:[6]" & vbCrLf & _
                                      strSqlResult & vbCrLf & _
                                      "Sql Commmand : " & vbCrLf & _
                                      strCommand
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
            strResult = "[AirlineService.dll,AirlineService.IModify,CancelBooking]:[1]" & vbCrLf & _
                                  strSqlResult & vbCrLf & _
                                  "Sql Commmand : " & vbCrLf & _
                                  strCommand
            CancelBooking = False
            oContext.SetAbort
        End If
    Else
        strResult = "[AirlineService.dll,AirlineService.IModify,CancelBooking]:[2]" & vbCrLf & mstrResult
        CancelBooking = False
        oContext.SetAbort
    End If
    Exit Function
Oops:
    strResult = "[AirlineService.dll,AirlineService.IModify,CancelBooking]:[Exception]" & vbCrLf & Err.Description
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
    
    strCommand = "SELECT Confirmation " & vbCrLf & _
                                  "FROM Booking " & vbCrLf & _
                                  "WHERE BookingID = '" & BookingID & "'"
    If oSql.SqlExecute(strCommand, strSqlResult, rs) Then
        If rs.EOF And rs.BOF Then
            strResult = "No information about this BookingID." & vbCrLf & strCommand
            CheckValidation = False
        Else
            If rs("Confirmation") = Confirmation.NotConfirm Then
                strCommand = "SELECT     MIN(T2.DepartDate) " & vbCrLf & _
                                              "FROM         CustomerBooking T1, " & vbCrLf & _
                                              "                      SubRouteBooking T2 " & vbCrLf & _
                                              "WHERE      T1.BookingID = '" & BookingID & "' " & vbCrLf & _
                                              "                        AND T2.CustomerBookingID = T1.CustomerBookingID "
                If oSql.SqlExecute(strCommand, strSqlResult, rs) Then
                    If rs.EOF And rs.BOF Then
                        strResult = vbCrLf & _
                              strSqlResult & vbCrLf & _
                              "Sql Commmand : " & vbCrLf & _
                              strCommand
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
                    strResult = strSqlResult
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
                              "Sql Commmand : " & vbCrLf & _
                              strCommand
        CheckValidation = False
    End If
    
    Set rs = Nothing
    Exit Function
Oops:
    strResult = Err.Description
    CheckValidation = False
End Function
