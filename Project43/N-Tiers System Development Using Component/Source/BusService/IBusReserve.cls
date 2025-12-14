VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 2  'RequiresTransaction
END
Attribute VB_Name = "IBusReserve"
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

Private Function GenGUID() As String
    Dim oGUID As Object
    Set oGUID = oContext.CreateInstance("GuidCreator.GuidCreator")
    GenGUID = oGUID.CreateGuid()
    If Not oGUID Is Nothing Then
        Set oGUID = Nothing
    End If
End Function

Public Function CreateCustomer(ByVal strFirstName As String, _
                                                               ByVal strLastName As String, _
                                                               ByVal strAddress As String, _
                                                               ByVal strTelephoneNo As String, _
                                                               ByRef strResult As String) _
                                                               As String
On Error GoTo Oops:
    Dim strCommand As String
    Dim strCustomerID As String
    Dim strSqlResult As String
                    
    strCustomerID = GenGUID
                    
    strCommand = "INSERT INTO Customer VALUES ( " & vbCrLf & _
                                  "'" & strCustomerID & "', " & vbCrLf & _
                                  "'" & strFirstName & "', " & vbCrLf & _
                                  "'" & strLastName & "', " & vbCrLf & _
                                  "'" & strAddress & "', " & vbCrLf & _
                                  "'" & strTelephoneNo & "')"
    If Not oSql.SqlExecute(strCommand, strSqlResult) Then
        strResult = "[BusService.dll,BusService.IBusSearch,CreateCustomer]:[1]" & vbCrLf & _
                           strSqlResult & vbCrLf & _
                           "Sql Command : " & vbCrLf & _
                           """" & strCommand & """"
        oContext.SetAbort
        Exit Function
    End If
    strResult = ""
    CreateCustomer = strCustomerID
    Exit Function

Oops:
    strResult = "[BusService.dll,BusService.IBusReserve,CreateCustomer]:[Exception]" & vbCrLf & Err.Description
End Function

Public Function BookBus(ByVal AgencyID As String, _
                                                   ByVal rsBookBusInfo As ADODB.Recordset, _
                                                   ByRef strResult As String) _
                                                   As Recordset
On Error GoTo Oops:
    Dim iCommand As Integer
    Dim iCompanyID As Integer
    Dim iModelID As Integer
    Dim iUsingDay As Integer
    Dim iNumOfCoach As Integer
    Dim iCount As Integer
    Dim strUsingDate As String
    Dim strCommand As String
    Dim strSqlResult As String
    Dim strBookingID As String
    Dim dtUsingDate As Date
    Dim dtInsertDate As Date
    Dim rsTmp As ADODB.Recordset
    Dim rsBookBusResult As ADODB.Recordset
    
    If AgencyID <> OlalaAgencyID Then
        strResult = "[BusService.dll,BusService.IBusService,BookBus]:[0]" & vbCrLf & "Incorrect AgencyID"
        oContext.SetAbort
        Exit Function
    End If
    
    strBookingID = GenGUID
    Set rsTmp = New ADODB.Recordset
    Set rsBookBusResult = New ADODB.Recordset
    With rsBookBusResult.Fields
        .Append "BookingID", adBSTR, 50, adFldUpdatable & adFldIsNullable
        .Append "CustomerID", adBSTR, 50, adFldUpdatable & adFldIsNullable
        .Append "ReserveNo", adBSTR, 50, adFldUpdatable & adFldIsNullable
        .Append "Price", adCurrency, , adFldUpdatable & adFldIsNullable
    End With
    rsBookBusResult.Open
    
    If rsBookBusInfo.EOF And rsBookBusInfo.BOF Then
        strResult = "[BusService.dll,BusService.IBusService,BookBus]:[1]" & vbCrLf & "No information to BookBus"
        oContext.SetAbort
        Exit Function
    End If
    
    rsBookBusInfo.MoveFirst
    While Not rsBookBusInfo.EOF
    
        If IsNull(rsBookBusInfo("CompanyID")) Then
            strResult = "[BusService.dll,BusService.IBusService,BookBus]:[2]" & vbCrLf & "Some recordset don't have CompanyID"
            oContext.SetAbort
            Exit Function
        End If
        
        If IsNull(rsBookBusInfo("ModelID")) Then
            strResult = "[BusService.dll,BusService.IBusService,BookBus]:[3]" & vbCrLf & "Some recordset don't have ModelID"
            oContext.SetAbort
            Exit Function
        End If
        
        If IsNull(rsBookBusInfo("NumOfCoach")) Then
            strResult = "[BusService.dll,BusService.IBusService,BookBus]:[3]" & vbCrLf & "Some recordset don't have NumOfCoach"
            oContext.SetAbort
            Exit Function
        End If
        
        If IsNull(rsBookBusInfo("StartDate")) Then
            strResult = "[BusService.dll,BusService.IBusService,BookBus]:[4]" & vbCrLf & "Some recordset don't have StartDate"
            oContext.SetAbort
            Exit Function
        End If
            
        If IsNull(rsBookBusInfo("UsingDay")) Then
            strResult = "[BusService.dll,BusService.IBusService,BookBus]:[5]" & vbCrLf & "Some recordset don't have UsingDay"
            oContext.SetAbort
            Exit Function
        End If
            
        iCompanyID = CInt(rsBookBusInfo("CompanyID"))
        iModelID = CInt(rsBookBusInfo("ModelID"))
        iUsingDay = CInt(rsBookBusInfo("UsingDay"))
        iNumOfCoach = CInt(rsBookBusInfo("NumOfCoach"))
        dtUsingDate = CDate(rsBookBusInfo("StartDate"))
        dtInsertDate = CDate(rsBookBusInfo("StartDate"))
        
        strUsingDate = "T4.UsingDate = '" & dtUsingDate & "' "
        If iUsingDay > 1 Then
            For iCount = 2 To iUsingDay
                dtUsingDate = dtUsingDate + 1
                strUsingDate = strUsingDate & vbCrLf & " OR T4.UsingDate = '" & dtUsingDate & "' "
            Next iCount
        End If
        
        
        strCommand = "SELECT     T1.BusID, T1.BusName, T2.RentCost " & vbCrLf & _
                                     "FROM          Bus T1, " & vbCrLf & _
                                     "                       BusModel T2, " & vbCrLf & _
                                     "                       BusCompany T3 " & vbCrLf & _
                                     "WHERE      T2.ModelID = T1.ModelID " & vbCrLf & _
                                     "                       AND T2.ModelID = " & iModelID & " " & vbCrLf & _
                                     "                       AND T3.CompanyID = " & iCompanyID & " " & vbCrLf & _
                                     "                       AND T3.CompanyID = T1.CompanyID " & vbCrLf & _
                                     "                        AND T1.BusID NOT IN "
        strCommand = strCommand & vbCrLf & _
                                      "( SELECT    T4.BusID " & vbCrLf & _
                                      "FROM           BusBooking T4 " & vbCrLf & _
                                      "WHERE       T4.BusID = T1.BusID" & vbCrLf & _
                                      "                         AND ( " & strUsingDate & vbCrLf & _
                                      "                         ) ) "

        If Not oSql.SqlExecute(strCommand, strSqlResult, rsTmp) Then
            strResult = "[BusService.dll,BusService.IBusService,BookBus]:[6]" & vbCrLf & strSqlResult
            oContext.SetAbort
            Exit Function
        End If
        
        If rsTmp.EOF And rsTmp.BOF Then
            strResult = "[BusService.dll,BusService.IBusService,BookBus]:[7]" & vbCrLf & "Can not find Bus that can reserve"
            oContext.SetAbort
            Exit Function
        End If
        
        rsTmp.MoveFirst
        Dim i As Integer
        i = 0
        While Not rsTmp.EOF
            i = i + 1
            rsTmp.MoveNext
        Wend
        If i < iNumOfCoach Then
            strResult = "[BusService.dll,BusService.IBusService,BookBus]:[8]" & vbCrLf & "Not enough bus that can reserve."
            oContext.SetAbort
            Exit Function
        End If
         
        rsTmp.MoveFirst
        Dim dtTmpDate As Date
        dtTmpDate = dtInsertDate
        For iCount = 1 To iNumOfCoach
            dtInsertDate = dtTmpDate
            For i = 1 To iUsingDay
                strCommand = "INSERT INTO BusBooking " & vbCrLf & _
                                              "VALUES ( '" & dtInsertDate & "', '" & rsTmp("BusID") & "', '" & strBookingID & "', " & rsTmp("RentCost") & " ) "
                If Not oSql.SqlExecute(strCommand, strSqlResult) Then
                    strResult = "[BusService.dll,BusService.IBusService,BookBus]:[9]" & vbCrLf & strSqlResult & vbCrLf & strCommand
                    oContext.SetAbort
                    Exit Function
                End If
                dtInsertDate = dtInsertDate + 1
            Next i
            
            rsBookBusResult.AddNew
            rsBookBusResult("BookingID") = strBookingID
            rsBookBusResult("CustomerID") = OlalaAgencyID
            rsBookBusResult("ReserveNo") = rsTmp("BusName")
            rsBookBusResult("Price") = rsTmp("RentCost")
            rsBookBusResult.Update
            
            rsTmp.MoveNext
        Next iCount
        
        rsBookBusInfo.MoveNext
    Wend
        
        strResult = ""
        Set BookBus = rsBookBusResult
        oContext.SetComplete
    Exit Function

Oops:
    strResult = "[BusService.dll,BusService.IBusService,BookBus]:[Exception]" & vbCrLf & Err.Description
    oContext.SetAbort
End Function

Public Function BookSeat(ByVal rsBookSeatInfo As ADODB.Recordset, strError As String) As Recordset
On Error GoTo Oops:
    Dim strSqlResult As String
    Dim strCommand As String
    Dim strCustomerID As String
    Dim strBookingID As String
    Dim strCustomerBookingID As String
    Dim rsBookSeatResult As ADODB.Recordset
    
    Set rsBookSeatResult = New ADODB.Recordset
    strBookingID = GenGUID()
    
    With rsBookSeatResult.Fields
        .Append "CustomerID", adVarChar, 50, adFldUpdatable
        .Append "BookingID", adVarChar, 50, adFldUpdatable
        .Append "SeatNo", adVarChar, 10, adFldUpdatable
        .Append "Price", adCurrency, , adFldUpdatable
    End With
    
    With rsBookSeatResult
        .Open
        If Not (rsBookSeatInfo.EOF And rsBookSeatInfo.BOF) Then
            While Not rsBookSeatInfo.EOF
            
                If IsNull(rsBookSeatInfo("CustomerID")) Or rsBookSeatInfo("CustomerID") = "" Then
                    strError = "[BusService.dll,BusService.IBusSearch,BookSeat]:[1]" & vbCrLf & "Some record not have CustomerID"
                    oContext.SetAbort
                    Exit Function
                Else
                    strCustomerID = CStr(rsBookSeatInfo("CustomerID"))
                End If
    
                .AddNew '@@@@@@@@@@@@@@@@@@@@@
                .Fields("CustomerID") = strCustomerID '@@@@@@@@@@@@@@@@
                .Fields("BookingID") = strBookingID     '@@@@@@@@@@@@@@@@
                
                strCustomerBookingID = GenGUID()
                
                Dim iRouteID As Integer
                Dim iSrcIdx As Integer
                Dim iDstIdx As Integer
                Dim strDepartDate As String
                Dim strSelectedSeatType As String
                Dim curPrice As Currency
                If IsNull(rsBookSeatInfo("RouteID")) Then
                    strError = "[BusService.dll,BusService.IBusSearch,BookSeat]:[2]" & vbCrLf & "Some record not have RouteID"
                    oContext.SetAbort
                    Exit Function
                Else
                    iRouteID = CInt(rsBookSeatInfo("RouteID"))
                End If
                If IsNull(rsBookSeatInfo("SrcIdx")) Then
                    strError = "[BusService.dll,BusService.IBusSearch,BookSeat]:[3]" & vbCrLf & "Some record not have Source Index"
                    oContext.SetAbort
                    Exit Function
                Else
                    iSrcIdx = CInt(rsBookSeatInfo("SrcIdx"))
                End If
                If IsNull(rsBookSeatInfo("DstIdx")) Then
                    strError = "[BusService.dll,BusService.IBusSearch,BookSeat]:[4]" & vbCrLf & "Some record not have Destination Index"
                    oContext.SetAbort
                    Exit Function
                Else
                    iDstIdx = CInt(rsBookSeatInfo("DstIdx"))
                End If
                If IsNull(rsBookSeatInfo("DepartDate")) Then
                    strError = "[BusService.dll,BusService.IBusSearch,BookSeat]:[5]" & vbCrLf & "Some record not have DepartDate"
                    oContext.SetAbort
                    Exit Function
                Else
                    strDepartDate = CStr(rsBookSeatInfo("DepartDate"))
                End If
                If IsNull(rsBookSeatInfo("SeatType")) Then
                    strError = "[BusService.dll,BusService.IBusSearch,BookSeat]:[6]" & vbCrLf & "Some record not have Type of Seat"
                    oContext.SetAbort
                    Exit Function
                Else
                    Select Case CInt(rsBookSeatInfo("SeatType"))
                        Case BusSeat.AllSeat
                            strSelectedSeatType = ""
                        Case BusSeat.Aisle
                            strSelectedSeatType = " AND T1.Window = 1 "
                        Case BusSeat.Window
                            strSelectedSeatType = " AND T1.Window = 0 "
                        Case Else
                            strSelectedSeatType = ""
                    End Select
                End If
                If IsNull(rsBookSeatInfo("Price")) Then
                    strError = "[BusService.dll,BusService.IBusSearch,BookSeat]:[7]" & vbCrLf & "Some record not have Price"
                    oContext.SetAbort
                    Exit Function
                Else
                    curPrice = CCur(rsBookSeatInfo("Price"))
                End If
                
                strCommand = "SELECT     T1.SeatNo " & vbCrLf & _
                                              "FROM          Seat T1, " & vbCrLf & _
                                              "                       Route T2 " & vbCrLf & _
                                              "WHERE      T2.RouteID = " & iRouteID & " " & vbCrLf & _
                                              "                       AND T2.ModelID = T1.ModelID " & vbCrLf & _
                                              strSelectedSeatType & vbCrLf & _
                                              "                       AND T1.SeatNo NOT IN ( " & vbCrLf & _
                                              "SELECT      DISTINCT T3.SeatNo " & vbCrLf & _
                                              "FROM          SubRouteBooking T3, " & vbCrLf & _
                                              "                       RouteSubRoute T4 " & vbCrLf & _
                                              "WHERE      T3.DepartDate = '" & strDepartDate & "'  " & vbCrLf & _
                                              "                       AND T3.RouteID = " & iRouteID & " " & vbCrLf & _
                                              "                       AND T3.RouteID = T4.RouteID " & vbCrLf & _
                                              "                       AND T3.SubRouteID = T4.SubRouteID " & vbCrLf & _
                                              "                       AND T4.Idx >= " & iSrcIdx & " " & vbCrLf & _
                                              "                       AND T4.Idx <= " & iDstIdx & " ) " & vbCrLf & _
                                              "ORDER BY T1.SeatNo "
                
                Dim strSeatNo As String
                Dim rsAvailableSeat As ADODB.Recordset
                Set rsAvailableSeat = New ADODB.Recordset
                If Not oSql.SqlExecute(strCommand, strSqlResult, rsAvailableSeat) Then
                    Set rsAvailableSeat = Nothing
                    strError = "[BusService.dll,BusService.IBusSearch,BookSeat]:[8]" & vbCrLf & _
                                      strSqlResult & vbCrLf & _
                                      "Sql Command : " & vbCrLf & _
                                      """" & strCommand & """"
                    oContext.SetAbort
                    Exit Function
                End If
                If (rsAvailableSeat.EOF And rsAvailableSeat.BOF) Then
                    strError = "[BusService.dll,BusService.IBusSearch,BookSeat]:[9]" & vbCrLf & "Can not find seat that can book"
                    oContext.SetAbort
                    Exit Function
                Else
                    rsAvailableSeat.MoveFirst
                    strSeatNo = CStr(rsAvailableSeat("SeatNo"))
                    .Fields("SeatNo") = strSeatNo   ' @@@@@@@@@@@@@@@@@@@@@@
                    .Fields("Price") = curPrice           ' @@@@@@@@@@@@@@@@@@@@@@
                End If
                Set rsAvailableSeat = Nothing

                Dim rsAvailableSubRoute As ADODB.Recordset
                Set rsAvailableSubRoute = New ADODB.Recordset
                strCommand = "SELECT    T1.SubRouteID " & vbCrLf & _
                                              "FROM        RouteSubRoute T1 " & vbCrLf & _
                                              "WHERE    T1.RouteID = " & iRouteID & vbCrLf & _
                                              "                     AND T1.Idx >= " & iSrcIdx & " AND T1.Idx <= " & iDstIdx
                If Not oSql.SqlExecute(strCommand, strSqlResult, rsAvailableSubRoute) Then
                    Set rsAvailableSubRoute = Nothing
                    strError = "[BusService.dll,BusService.IBusSearch,BookSeat]:[10]" & vbCrLf & _
                                      strSqlResult & vbCrLf & _
                                      "Sql Command : " & vbCrLf & _
                                      """" & strCommand & """"
                    oContext.SetAbort
                    Exit Function
                End If
                If (rsAvailableSubRoute.EOF And rsAvailableSubRoute.BOF) Then
                    strError = "[BusService.dll,BusService.IBusSearch,BookSeat]:[11]" & vbCrLf & "No available subroute that can Book."
                    oContext.SetAbort
                    Exit Function
                Else
                    rsAvailableSubRoute.MoveFirst
                    While Not rsAvailableSubRoute.EOF
                        Dim iSubRouteID As Integer
                        If IsNull(rsAvailableSubRoute("SubRouteID")) Then
                            strError = "[BusService.dll,BusService.IBusSearch,BookSeat]:[12]" & vbCrLf & "SubRouteID have null value from search availble SubRoute."
                            oContext.SetAbort
                        Exit Function
                        Else
                            iSubRouteID = CInt(rsAvailableSubRoute("SubRouteID"))
                        End If
                    
                        strCommand = "INSERT INTO   SubRouteBooking " & vbCrLf & _
                                                      "VALUES              ( '" & strDepartDate & "', " & vbCrLf & _
                                                                                        iRouteID & ", " & vbCrLf & _
                                                                                        iSubRouteID & ", " & vbCrLf & _
                                                                                        "'" & strSeatNo & "', " & vbCrLf & _
                                                                                        "'" & strCustomerBookingID & "' ) "
                        If Not oSql.SqlExecute(strCommand, strSqlResult) Then
                            strError = "[BusService.dll,BusService.IBusSearch,BookSeat]:[13]" & vbCrLf & _
                                              strSqlResult & vbCrLf & _
                                              "Sql Command : " & vbCrLf & _
                                              """" & strCommand & """"
                            oContext.SetAbort
                            Exit Function
                        End If
                    
                        rsAvailableSubRoute.MoveNext
                    Wend
                End If
                
                If Not rsAvailableSubRoute Is Nothing Then
                    Set rsAvailableSubRoute = Nothing
                End If
                
                strCommand = "INSERT INTO   CustomerBooking " & vbCrLf & _
                                             "VALUES               ( '" & strCustomerBookingID & "', " & vbCrLf & _
                                                                                "'" & strBookingID & "', " & vbCrLf & _
                                                                                "'" & strCustomerID & "', " & vbCrLf & _
                                                                                curPrice & " ) "
                If Not oSql.SqlExecute(strCommand, strSqlResult) Then
                    strError = "[BusService.dll,BusService.IBusSearch,BookSeat]:[14]" & vbCrLf & _
                              strSqlResult & vbCrLf & _
                              "Sql Command : " & vbCrLf & _
                              """" & strCommand & """"
                    oContext.SetAbort
                    Exit Function
                End If
                            
                .Update
                rsBookSeatInfo.MoveNext
            Wend
            
            strCommand = "INSERT INTO    Booking " & vbCrLf & _
                                          "VALUES               ( '" & strBookingID & "', " & vbCrLf & _
                                                                            Confirmation.NotConfirm & ", " & vbCrLf & _
                                          "                                 NULL, " & vbCrLf & _
                                          "                                 NULL " & " )"
            If Not oSql.SqlExecute(strCommand, strSqlResult) Then
                strError = "[BusService.dll,BusService.IBusSearch,BookSeat]:[15]" & vbCrLf & _
                                  strSqlResult & vbCrLf & _
                                  "Sql Command : " & vbCrLf & _
                                  """" & strCommand & """"
                oContext.SetAbort
                Exit Function
            End If
            
        End If
    End With
    
    rsBookSeatResult.MoveFirst
    Set BookSeat = rsBookSeatResult
    strError = ""
    
    If Not oSql Is Nothing Then
        Set oSql = Nothing
    End If
    
    oContext.SetComplete
    Exit Function

Oops:
    If Not oSql Is Nothing Then
        Set oSql = Nothing
    End If
    If Not rsBookSeatResult Is Nothing Then
        Set rsBookSeatResult = Nothing
    End If
    
    strError = "[BusService.dll,BusService.IBusSearch,BookSeat]:[Exception]" & vbCrLf & Err.Description
    oContext.SetAbort
End Function
