VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 1  'NoTransaction
END
Attribute VB_Name = "IAirlineSearch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Dim oSql As Object
'Dim oContext As ObjectContext

Private Sub Class_Initialize()
    'Set oContext = GetObjectContext
    Set oSql = CreateObject("AirlineDBService.IAirlineDB")
End Sub

Private Sub Class_Terminate()
    If Not oSql Is Nothing Then
        Set oSql = Nothing
    End If
'    If Not oContext Is Nothing Then
'        Set oContext = Nothing
'    End If
End Sub

Public Function SearchAirlineBooking(ByVal BookingID As String, _
                                                                          ByRef strResult As String) _
                                                                          As ADODB.Recordset
On Error GoTo Oops:
    Dim strCommand As String
    Dim strSqlResult As String
    Dim rsFirstResult As ADODB.Recordset
    Dim rsLastResult As ADODB.Recordset
        
    Set rsFirstResult = New ADODB.Recordset
    Set rsLastResult = New ADODB.Recordset
    
    With rsLastResult.Fields
        .Append "FirstName", adBSTR, 50, adFldUpdatable & adFldIsNullable
        .Append "LastName", adBSTR, 50, adFldUpdatable & adFldIsNullable
        .Append "FlightID", adBSTR, 10, adFldUpdatable & adFldIsNullable
        .Append "DepartDate", adDate, , adFldUpdatable & adFldIsNullable
        .Append "SeatNo", adBSTR, 10, adFldUpdatable & adFldIsNullable
        .Append "ClassName", adBSTR, 50, adFldUpdatable & adFldIsNullable
        .Append "Price", adCurrency, , adFldUpdatable & adFldIsNullable
        .Append "SourceStation", adBSTR, 50, adFldUpdatable & adFldIsNullable
        .Append "DepartTime", adDate, , adFldUpdatable & adFldIsNullable
        .Append "DestStation", adBSTR, 50, adFldUpdatable & adFldIsNullable
        .Append "ArriveTime", adDate, , adFldUpdatable & adFldIsNullable
        .Append "AirlineName", adBSTR, 50, adFldUpdatable & adFldIsNullable
    End With
    rsLastResult.Open
    
    strCommand = "SELECT    T3.CustomerBookingID, " & vbCrLf & _
                                  "                     T1.FirstName, T1.LastName, " & vbCrLf & _
                                  "                     T8.FlightID, T4.DepartDate, T4.SeatNo, T9.ClassName, T3.Price, " & vbCrLf & _
                                  "                     MIN(T6.Idx) AS 'SIndex', MAX(T7.Idx) AS 'DIndex', T10.AirlineName "
    strCommand = strCommand & vbCrLf & _
                                  "FROM        Customer T1, " & vbCrLf & _
                                  "                     Booking T2, " & vbCrLf & _
                                  "                     CustomerBooking T3, " & vbCrLf & _
                                  "                     SubRouteBooking T4, SubRouteBooking T5, " & vbCrLf & _
                                  "                     FlightSubRoute T6, FlightSubRoute T7, " & vbCrLf & _
                                  "                     Flight T8, " & vbCrLf & _
                                  "                     AircraftClass T9, " & vbCrLf & _
                                  "                     Airline T10, " & vbCrLf & _
                                  "                     Seat T11, " & vbCrLf & _
                                  "                     AircraftType T12 "
    strCommand = strCommand & vbCrLf & _
                                  "WHERE    T2.BookingID = '" & BookingID & "' " & vbCrLf & _
                                  "                     AND T1.CustomerID = T3.CustomerID " & vbCrLf & _
                                  "                     AND T3.BookingID = T2.BookingID " & vbCrLf & _
                                  "                     AND T5.CustomerBookingID = T3.CustomerBookingID" & vbCrLf & _
                                  "                     AND T4.CustomerBookingID = T3.CustomerBookingID " & vbCrLf & _
                                  "                     AND T4.FlightID = T5.FlightID " & vbCrLf & _
                                  "                     AND T7.FlightID = T5.FlightID " & vbCrLf & _
                                  "                     AND T6.FlightID = T4.FlightID " & vbCrLf & _
                                  "                     AND T7.SubRouteID = T5.SubRouteID " & vbCrLf & _
                                  "                     AND T6.SubRouteID = T4.SubRouteID " & vbCrLf & _
                                  "                     AND T11.SeatNo = T4.SeatNo " & vbCrLf & _
                                  "                     AND T8.FlightID = T4.FlightID " & vbCrLf & _
                                  "                     AND T11.AircraftID = T8.AircraftID " & vbCrLf & _
                                  "                     AND T11.ClassID = T9.ClassID " & vbCrLf & _
                                  "                     AND T10.AirlineID = T8.AirlineID " & vbCrLf & _
                                  "GROUP BY     T3.CustomerBookingID, T1.FirstName, T1.LastName, T4.DepartDate, T4.SeatNo, T3.Price, " & vbCrLf & _
                                  "                             T9.ClassName, T10.AirlineName, T8.FlightID " & vbCrLf & _
                                  "ORDER BY      T1.FirstName, T1.LastName, T4.DepartDate, T4.SeatNo "
    
    If oSql.SqlExecute(strCommand, strSqlResult, rsFirstResult) Then
        If rsFirstResult.EOF And rsFirstResult.BOF Then
            strResult = "[BusService.dll,BusService.IBusSearch,SearchBusBooking]:[1]" & vbCrLf & "Can not find information about this BookingID"
            Exit Function
        End If
        
        rsFirstResult.MoveFirst
        
        Dim rsSource As ADODB.Recordset
        Dim rsDest As ADODB.Recordset
        Dim dtDepartTime As Date
        Dim dtArriveTime As Date
        Dim strSourceStation As String
        Dim strDestStation As String

        Set rsSource = New ADODB.Recordset
        Set rsDest = New ADODB.Recordset
        While Not rsFirstResult.EOF

            strCommand = "SELECT    T1.DepartTime, T3.PlaceName  " & vbCrLf & _
                                          "FROM        FlightSubRoute T1, " & vbCrLf & _
                                          "                     SubRoute T2, " & vbCrLf & _
                                          "                     Place T3 " & vbCrLf & _
                                          "WHERE    T1.FlightID = '" & rsFirstResult("FlightID") & "' " & vbCrLf & _
                                          "                     AND T1.Idx = " & rsFirstResult("SIndex") & vbCrLf & _
                                          "                     AND T1.SubRouteID = T2.SubRouteID " & vbCrLf & _
                                          "                     AND T3.PlaceID = T2.SrcAirport "
            If Not oSql.SqlExecute(strCommand, strSqlResult, rsSource) Then
                strResult = "[BusService.dll,BusService.IBusSearch,SearchBusBooking]k:[2]" & vbCrLf & strSqlResult & vbCrLf & strCommand
                Exit Function
            End If
            dtDepartTime = rsSource("DepartTime")
            strSourceStation = rsSource("PlaceName")
    
            strCommand = "SELECT    T1.ArriveTime , T3.PlaceName  " & vbCrLf & _
                                          "FROM        FlightSubRoute T1, " & vbCrLf & _
                                          "                     SubRoute T2, " & vbCrLf & _
                                          "                     Place T3 " & vbCrLf & _
                                          "WHERE    T1.FlightID = '" & rsFirstResult("FlightID") & "' " & vbCrLf & _
                                          "                     AND T1.Idx = " & rsFirstResult("DIndex") & vbCrLf & _
                                          "                     AND T1.SubRouteID = T2.SubRouteID " & vbCrLf & _
                                          "                     AND T3.PlaceID = T2.DstAirport "
            If Not oSql.SqlExecute(strCommand, strSqlResult, rsSource) Then
                strResult = "[BusService.dll,BusService.IBusSearch,SearchBusBooking]:[3]" & vbCrLf & strSqlResult
                Exit Function
            End If
            dtArriveTime = rsSource("ArriveTime")
            strDestStation = rsSource("PlaceName")
    
            With rsLastResult
                .AddNew
                .Fields("FirstName") = rsFirstResult.Fields("FirstName")
                .Fields("LastName") = rsFirstResult.Fields("LastName")
                .Fields("FlightID") = rsFirstResult("FlightID")
                .Fields("DepartDate") = rsFirstResult("DepartDate")
                .Fields("SeatNo") = rsFirstResult.Fields("SeatNo")
                .Fields("ClassName") = rsFirstResult("ClassName")
                .Fields("Price") = rsFirstResult("Price")
                .Fields("SourceStation") = strSourceStation
                .Fields("DepartTime") = dtDepartTime
                .Fields("DestStation") = strDestStation
                .Fields("ArriveTime") = dtArriveTime
                .Fields("AirlineName") = rsFirstResult("AirlineName")
                .Update
            End With
            rsFirstResult.MoveNext
        Wend
        Set SearchAirlineBooking = rsLastResult
        strResult = ""
    Else
        strResult = "[BusService.dll,BusService.IBusSearch,SearchBusBooking]:[1]" & vbCrLf & strSqlResult
    End If
    Exit Function

Oops:
    strResult = "[BusService.dll,BusService.IBusSearch,SearchBusBooking]:[Exception]" & vbCrLf & Err.Description
End Function

Public Function SearchAirline(ByVal Keyword As String, _
                                                           ByRef strResult As String) _
                                                           As ADODB.Recordset
On Error GoTo Oops:
    Dim strSqlResult As String
    Dim strCommand As String
    Dim rsResult As ADODB.Recordset
    
    Set rsResult = New ADODB.Recordset
    strCommand = "SELECT AirlineID, AirlineName " & vbCrLf & _
                                  "FROM     Airline "
    
    If Keyword <> "" Then
        strCommand = strCommand & "WHERE Description LIKE '%" & Keyword & "%'"
    End If
    
    If oSql.SqlExecute(strCommand, strSqlResult, rsResult) Then
        If rsResult.EOF And rsResult.BOF Then
            strResult = "Not Found"
        Else
            Set SearchAirline = rsResult
            strResult = "Found"
        End If
    Else
        strResult = "[AirlineService.dll,AirlineService.ISearch,SearchAirline]:[1]" & vbCrLf & _
                              strSqlResult & vbCrLf & _
                              "Sql Commmand : " & vbCrLf & _
                              strCommand
        'oContext.SetAbort
    End If
    Exit Function

Oops:
    strResult = "[AirlineService.dll,AirlineService.ISearch,SearchCompany]:[Exception]" & vbCrLf & Err.Description
    'oContext.SetAbort
End Function

Public Function SearchAirport(ByVal Keyword As String, _
                                                            ByRef strResult As String) _
                                                            As ADODB.Recordset
On Error GoTo Oops:
    Dim strSqlResult As String
    Dim strCommand As String
    Dim rsResult As ADODB.Recordset
    
    Set rsResult = New ADODB.Recordset
    strCommand = "SELECT  PlaceID, PlaceName " & vbCrLf & _
                                 "FROM       Place "
    
    If Keyword <> "" Then
        strCommand = strCommand & "WHERE Description LIKE '%" & Keyword & "%'"
    End If
    
    If oSql.SqlExecute(strCommand, strSqlResult, rsResult) Then
        If rsResult.EOF And rsResult.BOF Then
            strResult = "Not Found"
        Else
            strResult = "Found"
            Set SearchAirport = rsResult
        End If
    Else
        strResult = "[AirlineService.dll,AirlineService.ISearch,SearchAirport]:[1]" & vbCrLf & _
                              strSqlResult & vbCrLf & _
                              "Sql Commmand : " & vbCrLf & _
                              strCommand
        'oContext.SetAbort
    End If
    Exit Function
    
Oops:
    strResult = "[AirlineService.dll,AirlineService.ISearch,SearchAirport]:[Exception]" & vbCrLf & Err.Description
    'oContext.SetAbort
End Function

Public Function SearchSeat(ByVal strSrcAirportID As String, _
                                                        ByVal strDstAirportID As String, _
                                                        ByVal iTotalSeat As Integer, _
                                                        ByRef strResult As String, _
                                                        Optional ByVal strDate As String = "", _
                                                        Optional ByVal iAirlineID As Integer = 0, _
                                                        Optional ByVal iClassType As Integer = 0, _
                                                        Optional ByVal iSeatType As Integer = 0, _
                                                        Optional ByVal blCanSmoking As Boolean = False, _
                                                        Optional ByVal blNonStop As Boolean = False, _
                                                        Optional ByVal iOrder As Integer = 0) _
                                                        As ADODB.Recordset
On Error GoTo Oops:
    Dim strSqlResult As String
    Dim strCommand As String
    Dim strAirlineID As String
    Dim strClassType As String
    Dim strSeatType As String
    Dim strCanSmoking As String
    Dim strOrdering As String
    Dim strNonStop As String
    Dim rsResult As ADODB.Recordset

    Set rsResult = New ADODB.Recordset
    
    If iTotalSeat <= 0 Then
        iTotalSeat = 1
    End If

    If strDate = "" Then
        strDate = CStr(DateValue(Now))
    Else
        If DateValue(strDate) < DateValue(Now) Then
            strResult = "[AirlineService.dll,AirlineService.IAirlineSearch,SearchSeat]:[1]" & vbCrLf & "Date is expire."
            'oContext.SetAbort
            Exit Function
        End If
    End If

    If iAirlineID = 0 Then
        strAirlineID = ""
    Else
        strAirlineID = " AND T1.AirlineID = " & iAirlineID & " "
    End If

    If iClassType = 0 Then
        strClassType = ""
    Else
        strClassType = " AND T2.ClassID = " & iClassType & " "
    End If

    Select Case iSeatType
        Case AirlineSeatType.AllSeat
            strSeatType = ""
        Case AirlineSeatType.Window
            strSeatType = " AND T15.Window = 0 "
        Case AirlineSeatType.Aisle
            strSeatType = " AND T15.Aisle = 0 "
        Case Else
            strSeatType = ""
    End Select

    If blCanSmoking Then
        strCanSmoking = " AND T15.Smoking = 0  "
    Else
        strCanSmoking = ""
    End If

    Select Case iOrder
        Case Ordering.Default
            strOrdering = " ORDER BY    T1.AirlineName, T11.FlightID "
        Case Ordering.AirlineName
            strOrdering = " ORDER BY    T1.AirlineName, T11.FlightID "
        Case Ordering.LowestPrice
            strOrdering = " ORDER BY    ( SUM(DISTINCT T10.Distance) * T12.PricePerKm ) + T11.Fee + T12.Fee, " & _
                                      "                             T1.AirlineName, T11.FlightID "
        Case Ordering.ShortestPath
            strOrdering = " ORDER BY    SUM(DISTINCT T10.Distance) "
        Case Ordering.DepartTime
            strOrdering = " ORDER BY    T5.DepartTime "
        Case Ordering.ArriveTime
            strOrdering = " ORDER BY    T6.ArriveTime "
        Case Else
            strOrdering = "ORDER BY    T1.AirlineName, T11.FlightID "
    End Select

    If blNonStop Then
        strNonStop = " HAVING  COUNT(DISTINCT T10.SubRouteID) = 1 "
    Else
        strNonStop = ""
    End If

    'strCommand = "SELECT     *  From SubRouteBooking  WHERE  DepartDate =  '" & strDate & "'"
    'strCommand = "SELECT     *  From SubRouteBooking  WHERE  DepartDate = CONVERT(DATETIME, '" & strDate & "' , 101)"

    strCommand = "SELECT     T1.AirlineName, T11.FlightID,T3.AircraftName, " & vbCrLf & _
                                  "                      T2.ClassName, T2.ClassID, " & vbCrLf & _
                                  "                      T5.DepartTime, T6.ArriveTime, " & vbCrLf & _
                                  "                      T5.Idx AS 'SIndex', T6.Idx AS 'DIndex',  " & vbCrLf & _
                                  "                      SUM(DISTINCT T10.Distance) AS 'Distance', " & vbCrLf & _
                                  "                      ( SUM(DISTINCT T10.Distance) * T12.PricePerKm ) + T11.Fee + T12.Fee AS 'Price', " & vbCrLf & _
                                  "                      T11.Description " & vbCrLf & _
                                  "FROM         Airline T1, " & vbCrLf & _
                                  "                      AircraftClass T2, " & vbCrLf & _
                                  "                      AircraftType T3, " & vbCrLf & _
                                  "                      ClassType T4, " & vbCrLf & _
                                  "                      FlightSubRoute T5, FlightSubRoute T6, FlightSubRoute T7, " & vbCrLf & _
                                  "                      SubRoute T8, SubRoute T9, SubRoute T10, " & vbCrLf & _
                                  "                      Flight T11, " & vbCrLf & _
                                  "                      ClassFee T12 " & vbCrLf
    strCommand = strCommand & _
                                  "WHERE     T8.SrcAirport = '" & strSrcAirportID & "'" & vbCrLf & _
                                  "                      AND T9.DstAirport = '" & strDstAirportID & "'" & vbCrLf & _
                                  "                      AND T8.SubRouteID = T5.SubRouteID " & vbCrLf & _
                                  "                      AND T9.SubRouteID = T6.SubRouteID " & vbCrLf & _
                                  "                      AND T5.FlightID = T6.FlightID " & vbCrLf & _
                                  "                      AND T5.Idx <= T6.Idx " & vbCrLf & _
                                  "                      AND T11.FlightID = T5.FlightID " & vbCrLf & _
                                  "                      AND T1.AirlineID = T11.AirlineID " & vbCrLf & _
                                  "                      AND T3.AircraftID = T11.AircraftID " & vbCrLf & _
                                  "                      AND T4.AirCraftID = T3.AircraftID " & vbCrLf & _
                                  "                      AND T2.ClassID = T4.ClassID " & vbCrLf & _
                                  "                      AND T12.AirlineID = T1.AirlineID " & vbCrLf & _
                                  "                      AND T12.ClassID =  T2.ClassID " & vbCrLf
    strCommand = strCommand & vbCrLf & _
                                  strAirlineID & vbCrLf & _
                                  strClassType & vbCrLf & _
                                  "                      AND T7.FlightID = T11.FlightID " & vbCrLf & _
                                  "                      AND T7.Idx BETWEEN T5.Idx AND T6.Idx " & vbCrLf & _
                                  "                      AND T10.SubRouteID = T7.SubRouteID " & vbCrLf & _
                                  "                      AND " & iTotalSeat & " <= " & vbCrLf
    strCommand = strCommand & _
                                  " ( SELECT        COUNT(DISTINCT T15.SeatNo) " & vbCrLf & _
                                  "    FROM            Seat T15 " & vbCrLf & _
                                  "    WHERE        T15.AircraftID = T11.AircraftID " & vbCrLf & _
                                  strSeatType & vbCrLf & _
                                  strCanSmoking & vbCrLf & _
                                  "                             AND T15.ClassID = T2.ClassID " & vbCrLf & _
                                  "                             AND T15.SeatNo NOT IN " & vbCrLf & _
                                  " ( SELECT        DISTINCT T16.SeatNo " & vbCrLf & _
                                  "    FROM            SubRouteBooking T16, " & vbCrLf & _
                                  "                             FlightSubRoute T17 " & vbCrLf & _
                                  "    WHERE        T16.DepartDate = '" & strDate & "' " & vbCrLf & _
                                  "                             AND T16.FlightID = T11.FlightID " & vbCrLf & _
                                  "                             AND T16.FlightID = T17.FlightID " & vbCrLf & _
                                  "                             AND T16.SubRouteID = T17.SubRouteID " & vbCrLf & _
                                  "                             AND T17.Idx BETWEEN T5.Idx AND T6.Idx " & vbCrLf & _
                                  " ) ) " & vbCrLf
    strCommand = strCommand & vbCrLf & _
                                  "GROUP BY    T1.AirlineName, T11.FlightID, T3.AircraftName, " & vbCrLf & _
                                  "                           T2.ClassName, T2.ClassID, " & vbCrLf & _
                                  "                           T5.DepartTime, T6.ArriveTime, " & vbCrLf & _
                                  "                           T5.Idx, T6.Idx, " & vbCrLf & _
                                  "                           T11.Fee, " & vbCrLf & _
                                  "                           T12.PricePerKm, T12.Fee, T11.Description " & vbCrLf & _
                                  strNonStop & vbCrLf & _
                                  strOrdering

    If oSql.SqlExecute(strCommand, strSqlResult, rsResult) Then
        If rsResult.EOF And rsResult.BOF Then
            strResult = "Not Found"
        Else
            strResult = "Found"
            Set SearchSeat = rsResult
        End If
    Else
        strResult = "[BusService.dll,BusService.ISearch,SearchSeat]:[2]" & vbCrLf & _
                              strSqlResult & vbCrLf & _
                              "Sql Commmand : " & vbCrLf & _
                              strCommand
        'oContext.SetAbort
    End If
    Exit Function

Oops:
    strResult = "[AirlineService.dll,AirlineService.IAirlineSearch,SearchSeat]:[Exception]" & Err.Description & vbCrLf
    'oContext.SetAbort
End Function

