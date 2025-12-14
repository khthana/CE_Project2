VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 3  'UsesTransaction
END
Attribute VB_Name = "IAirlineReserve"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Dim oSql As Object
Dim oContext As ObjectContext

Private Sub Class_Initialize()
    Set oContext = GetObjectContext
    Set oSql = CreateObject("AirlineDBService.IAirlineDB")
End Sub

Private Sub Class_Terminate()
    If Not oSql Is Nothing Then
        Set oSql = Nothing
    End If
    If Not oContext Is Nothing Then
        Set oContext = Nothing
    End If
End Sub

Private Function GenGUID() As String
    Dim oGUID As Object
    Set oGUID = oContext.CreateInstance("AirGuidCreator.AirlineGuidCreator")
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
                                  "'" & strTelephoneNo & "' )"
    If Not oSql.SqlExecute(strCommand, strSqlResult) Then
        strResult = "[AirlineService.dll,AirlineService.IAirlineSearch,CreateCustomer]:[1]" & vbCrLf & _
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
    strResult = "[AirlineService.dll,AirlineService.IAirlineReserve,CreateCustomer]:[Exception]" & vbCrLf & Err.Description
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
                    strError = "[AirlineService.dll,AirlineService.IAirlieSearch,BookSeat]:[1]" & vbCrLf & "Some record not have CustomerID : """ & CStr(rsBookSeatInfo("CustomerID")) & """"
                    oContext.SetAbort
                    Exit Function
                Else
                    strCustomerID = CStr(rsBookSeatInfo("CustomerID"))
                End If
                                
                .AddNew '@@@@@@@@@@@@@@@@@@@@@
                .Fields("CustomerID") = strCustomerID '@@@@@@@@@@@@@@@@
                .Fields("BookingID") = strBookingID     '@@@@@@@@@@@@@@@@

                strCustomerBookingID = GenGUID()
                
                Dim iSrcIdx As Integer
                Dim iDstIdx As Integer
                Dim strFlightID As String
                Dim strDepartDate As String
                Dim strSelectedSeatType As String
                Dim strSelectedClassType As String
                Dim strCanBeSmoked As String
                Dim curPrice As Currency

                If IsNull(rsBookSeatInfo("FlightID")) Then
                    strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[2]" & vbCrLf & "Some record not have RouteID."
                    oContext.SetAbort
                    Exit Function
                Else
                    strFlightID = Trim(rsBookSeatInfo("FlightID"))
                End If

                If IsNull(rsBookSeatInfo("SrcIdx")) Then
                    strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[3]" & vbCrLf & "Some record not have Source Index."
                    oContext.SetAbort
                    Exit Function
                Else
                    iSrcIdx = CInt(rsBookSeatInfo("SrcIdx"))
                End If

                If IsNull(rsBookSeatInfo("DstIdx")) Then
                    strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[4]" & vbCrLf & "Some record not have Destination Index."
                    oContext.SetAbort
                    Exit Function
                Else
                    iDstIdx = CInt(rsBookSeatInfo("DstIdx"))
                End If

                If IsNull(rsBookSeatInfo("DepartDate")) Then
                    strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[5]" & vbCrLf & "Some record not have DepartDate."
                    oContext.SetAbort
                    Exit Function
                Else
                    strDepartDate = Trim(rsBookSeatInfo("DepartDate"))
                End If

                If IsNull(rsBookSeatInfo("SeatType")) Then
                    strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[6]" & vbCrLf & "Some record not have Type of Seat."
                    oContext.SetAbort
                    Exit Function
                Else
                    Select Case CInt(rsBookSeatInfo("SeatType"))
                        Case AirlineSeatType.AllSeat
                            strSelectedSeatType = ""
                        Case AirlineSeatType.Aisle
                            strSelectedSeatType = " AND T1.Aisle = 0 "
                        Case AirlineSeatType.Window
                            strSelectedSeatType = " AND T1.Window = 0 "
                        Case Else
                            strSelectedSeatType = ""
                    End Select
                End If

                If IsNull(rsBookSeatInfo("Price")) Then
                    strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[7]" & vbCrLf & "Some record not have Price."
                    oContext.SetAbort
                    Exit Function
                Else
                    curPrice = CCur(rsBookSeatInfo("Price"))
                End If

                If IsNull(rsBookSeatInfo("ClassType")) Then
                    strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[8]" & vbCrLf & "Some record not have class of aircraft."
                    oContext.SetAbort
                    Exit Function
                Else
                    Select Case CInt(rsBookSeatInfo("ClassType"))
                        Case AircraftClass.FirstClass
                            strSelectedClassType = " AND T1.ClassID =  1 "
                        Case AircraftClass.BusinessClass
                            strSelectedClassType = " AND T1.ClassID =  2 "
                        Case AircraftClass.EconomicClass
                            strSelectedClassType = " AND T1.ClassID =  3 "
                        Case Else
                            strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[9]" & vbCrLf & "Some record don't select class of aircraft."
                            oContext.SetAbort
                            Exit Function
                    End Select
                End If

                If IsNull(rsBookSeatInfo("CanSmoking")) Then
                    strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[10]" & vbCrLf & "Some record not have information about select smoking seat."
                    oContext.SetAbort
                    Exit Function
                Else
                    If CBool(rsBookSeatInfo("CanSmoking")) Then
                        strCanBeSmoked = " AND T1.Smoking = 0 "
                    Else
                        strCanBeSmoked = ""
                    End If
                End If

                strCommand = "SELECT     T1.SeatNo " & vbCrLf & _
                                              "FROM          Seat T1, " & vbCrLf & _
                                              "                       Flight T2 " & vbCrLf & _
                                              "WHERE      T2.FlightID = '" & strFlightID & "' " & vbCrLf & _
                                              "                       AND T2.AircraftID = T1.AircraftID " & vbCrLf & _
                                              strSelectedSeatType & vbCrLf & _
                                              strSelectedClassType & vbCrLf & _
                                              strCanBeSmoked & vbCrLf & _
                                              "                       AND T1.SeatNo NOT IN ( " & vbCrLf & _
                                              "SELECT      DISTINCT T3.SeatNo " & vbCrLf & _
                                              "FROM          SubRouteBooking T3, " & vbCrLf & _
                                              "                       FlightSubRoute T4 " & vbCrLf & _
                                              "WHERE      T3.DepartDate = '" & strDepartDate & "' " & vbCrLf & _
                                              "                       AND T3.FlightID = '" & strFlightID & "' " & vbCrLf & _
                                              "                       AND T3.FlightID = T4.FlightID " & vbCrLf & _
                                              "                       AND T3.SubRouteID = T4.SubRouteID " & vbCrLf & _
                                              "                       AND T4.Idx >= " & iSrcIdx & " " & vbCrLf & _
                                              "                       AND T4.Idx <= " & iDstIdx & " ) " & vbCrLf & _
                                              "ORDER BY T1.SeatNo "
                
                Dim strSeatNo As String
                Dim rsAvailableSeat As ADODB.Recordset
                Set rsAvailableSeat = New ADODB.Recordset
                If Not oSql.SqlExecute(strCommand, strSqlResult, rsAvailableSeat) Then
                    Set rsAvailableSeat = Nothing
                    strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[11]" & vbCrLf & _
                                       strSqlResult & vbCrLf & _
                                       "Sql Commmand : " & vbCrLf & _
                                       strCommand
                    oContext.SetAbort
                    Exit Function
                End If
                If (rsAvailableSeat.EOF And rsAvailableSeat.BOF) Then
                    strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[12]" & vbCrLf & "Can not find seat that can book." & vbCrLf & strCommand
                    oContext.SetAbort
                    Exit Function
                Else
                    rsAvailableSeat.MoveFirst
                    strSeatNo = Trim(rsAvailableSeat("SeatNo"))
                    .Fields("SeatNo") = strSeatNo   ' @@@@@@@@@@@@@@@@@@@@@@
                    .Fields("Price") = curPrice           ' @@@@@@@@@@@@@@@@@@@@@@
                End If
                Set rsAvailableSeat = Nothing

                Dim rsAvailableSubRoute As ADODB.Recordset
                Set rsAvailableSubRoute = New ADODB.Recordset
                strCommand = "SELECT    T1.SubRouteID " & vbCrLf & _
                                              "FROM        FlightSubRoute T1 " & vbCrLf & _
                                              "WHERE    T1.FlightID = '" & strFlightID & "' " & vbCrLf & _
                                              "                     AND T1.Idx >= " & iSrcIdx & " AND T1.Idx <= " & iDstIdx
                If Not oSql.SqlExecute(strCommand, strSqlResult, rsAvailableSubRoute) Then
                    Set rsAvailableSubRoute = Nothing
                    strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[13]" & vbCrLf & _
                                       strSqlResult & vbCrLf & _
                                       "Sql Commmand : " & vbCrLf & _
                                       strCommand
                    oContext.SetAbort
                    Exit Function
                End If
                If (rsAvailableSubRoute.EOF And rsAvailableSubRoute.BOF) Then
                    strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[14]" & vbCrLf & "No available subroute that can Book."
                    oContext.SetAbort
                    Exit Function
                Else
                    rsAvailableSubRoute.MoveFirst
                    While Not rsAvailableSubRoute.EOF
                        Dim iSubRouteID As Integer
                        If IsNull(rsAvailableSubRoute("SubRouteID")) Then
                            strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[15]" & vbCrLf & "SubRouteID have null value from search availble SubRoute."
                            oContext.SetAbort
                        Exit Function
                        Else
                            iSubRouteID = CInt(rsAvailableSubRoute("SubRouteID"))
                        End If

                        strCommand = "INSERT INTO   SubRouteBooking " & vbCrLf & _
                                                      "VALUES              ( '" & strDepartDate & "', " & vbCrLf & _
                                                                                        "'" & strFlightID & "', " & vbCrLf & _
                                                                                        iSubRouteID & ", " & vbCrLf & _
                                                                                        "'" & strSeatNo & "', " & vbCrLf & _
                                                                                        "'" & strCustomerBookingID & "' ) "
                        If Not oSql.SqlExecute(strCommand, strSqlResult) Then
                            strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[16]" & vbCrLf & _
                                               strSqlResult & vbCrLf & _
                                               "Sql Commmand : " & vbCrLf & _
                                               strCommand
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
                    strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[17]" & vbCrLf & _
                                       strSqlResult & vbCrLf & _
                                       "Sql Commmand : " & vbCrLf & _
                                       strCommand
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
                strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[18]" & vbCrLf & _
                                   strSqlResult & vbCrLf & _
                                   "Sql Commmand : " & vbCrLf & _
                                   strCommand
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
    strError = "[AirlineService.dll,AirlineService.IAirlineReserve,BookSeat]:[Exception]" & vbCrLf & Err.Description & vbCrLf
    oContext.SetAbort
End Function

Public Function BookPackageSeat(ByVal rsGroupBookPackageSeat As ADODB.Recordset, _
                                                                       ByRef strResult As String) _
                                                                       As ADODB.Recordset
On Error GoTo Oops:
    Dim iCount As Integer
    Dim strError As String
    Dim rsBookPackageSeat As ADODB.Recordset
    Dim rsBookPackageSeatResult As ADODB.Recordset
    
    Set rsBookPackageSeat = New ADODB.Recordset
    With rsBookPackageSeat.Fields
        .Append "CustomerID", adBSTR, 50, adFldIsNullable & adFldUpdatable
        .Append "FlightID", adBSTR, 50, adFldUpdatable & adFldIsNullable
        .Append "SrcIdx", adInteger, , adFldUpdatable & adFldIsNullable
        .Append "DstIdx", adInteger, , adFldUpdatable & adFldIsNullable
        .Append "DepartDate", adBSTR, 50, adFldUpdatable & adFldIsNullable
        .Append "SeatType", adInteger, , adFldUpdatable & adFldIsNullable
        .Append "ClassType", adInteger, , adFldUpdatable & adFldIsNullable
        .Append "CanSmoking", adBoolean, , adFldUpdatable & adFldIsNullable
        .Append "Price", adCurrency, , adFldUpdatable & adFldIsNullable
    End With
    rsBookPackageSeat.Open
    
    If rsGroupBookPackageSeat.EOF And rsGroupBookPackageSeat.BOF Then
        strResult = "[AirlineService.dll,AirlineService.IAirlineReserve,BookPackageSeat]:[1]" & vbCrLf & "No information to BookPackageSeat"
        oContext.SetAbort
        Exit Function
    End If
    
    rsGroupBookPackageSeat.MoveFirst
    While Not rsGroupBookPackageSeat.EOF
        
        If IsNull(rsGroupBookPackageSeat("AgencyID")) Then
            strResult = "[AirlineService.dll,AirlineService.IAirlineReserve,BookPackageSeat]:[2]" & vbCrLf & "Some input-recordset not have information about AgencyID"
            oContext.SetAbort
            Exit Function
        End If
        
        If CStr(rsGroupBookPackageSeat("AgencyID")) <> OlalaAgencyID Then
            strResult = "[AirlineService.dll,AirlineService.IAirlineReserve,BookPackageSeat]:[3]" & vbCrLf & "Some input-recordset have Incorrect CustomerID"
            oContext.SetAbort
            Exit Function
        End If
        
        If IsNull(rsGroupBookPackageSeat("TotalSeat")) Then
            strResult = "[AirlineService.dll,AirlineService.IAirlineReserve,BookPackageSeat]:[4]" & vbCrLf & "Some input-recordset not have information about TotalSeat"
            oContext.SetAbort
            Exit Function
        End If
        
        If IsNull(rsGroupBookPackageSeat("FlightID")) Then
            strResult = "[AirlineService.dll,AirlineService.IAirlineReserve,BookPackageSeat]:[5]" & vbCrLf & "Some input-recordset not have information about FlightID"
            oContext.SetAbort
            Exit Function
        End If
    
        If IsNull(rsGroupBookPackageSeat("SrcIdx")) Then
            strResult = "[AirlineService.dll,AirlineService.IAirlineReserve,BookPackageSeat]:[6]" & vbCrLf & "Some input-recordset not have information about SrcIdx"
            oContext.SetAbort
            Exit Function
        End If
        
        If IsNull(rsGroupBookPackageSeat("DstIdx")) Then
            strResult = "[AirlineService.dll,AirlineService.IAirlineReserve,BookPackageSeat]:[7]" & vbCrLf & "Some input-recordset not have information about DstIdx"
            oContext.SetAbort
            Exit Function
        End If
        
        If IsNull(rsGroupBookPackageSeat("DepartDate")) Then
            strResult = "[AirlineService.dll,AirlineService.IAirlineReserve,BookPackageSeat]:[8]" & vbCrLf & "Some input-recordset not have information about DepartDate"
            oContext.SetAbort
            Exit Function
        End If
        
        If IsNull(rsGroupBookPackageSeat("ClassType")) Then
            strResult = "[AirlineService.dll,AirlineService.IAirlineReserve,BookPackageSeat]:[9]" & vbCrLf & "Some input-recordset not have information about ClassType"
            oContext.SetAbort
            Exit Function
        End If
        
        If IsNull(rsGroupBookPackageSeat("Price")) Then
            strResult = "[AirlineService.dll,AirlineService.IAirlineReserve,BookPackageSeat]:[10]" & vbCrLf & "Some input-recordset not have information about Price"
            oContext.SetAbort
            Exit Function
        End If
        
        With rsBookPackageSeat
            For iCount = 1 To CInt(rsGroupBookPackageSeat("TotalSeat"))
            .AddNew
            .Fields("CustomerID") = CStr(rsGroupBookPackageSeat("AgencyID"))
            .Fields("FlightID") = CStr(rsGroupBookPackageSeat("FlightID"))
            .Fields("SrcIdx") = CInt(rsGroupBookPackageSeat("SrcIdx"))
            .Fields("DstIdx") = CInt(rsGroupBookPackageSeat("DstIdx"))
            .Fields("DepartDate") = CStr(rsGroupBookPackageSeat("DepartDate"))
            .Fields("SeatType") = 0
            .Fields("ClassType") = CInt(rsGroupBookPackageSeat("ClassType"))
            .Fields("CanSmoking") = False
            .Fields("Price") = CCur(rsGroupBookPackageSeat("Price"))
            .Update
            Next iCount
        End With
        
        rsGroupBookPackageSeat.MoveNext
    Wend
            
    rsBookPackageSeat.MoveFirst
    Set rsBookPackageSeatResult = BookSeat(rsBookPackageSeat, strError)
    If strError = "" Then
        strResult = ""
        Set BookPackageSeat = rsBookPackageSeatResult
        oContext.SetComplete
    Else
        strResult = "[AirlineService.dll,AirlineService.IAirlineReserve,BookPackageSeat]:[11]" & vbCrLf & strError
        oContext.SetAbort
    End If
    Exit Function
    
Oops:
     strResult = "[AirlineService.dll,AirlineService.IAirlineReserve,BookPackageSeat]:[Exception]" & vbCrLf & Err.Description
     oContext.SetAbort
End Function
