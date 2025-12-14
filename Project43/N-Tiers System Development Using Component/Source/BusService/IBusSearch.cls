VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 1  'NoTransaction
END
Attribute VB_Name = "IBusSearch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Dim oSql As Object
'Dim oContext As ObjectContext

Private Sub Class_Initialize()
    Set oSql = CreateObject("DBService.IDatabase")
'    Set oContext = GetObjectContext
End Sub

Private Sub Class_Terminate()
    If Not oSql Is Nothing Then
        Set oSql = Nothing
    End If
'    If Not oContext Is Nothing Then
'        Set oContext = Nothing
'    End If
End Sub

Public Function SearchBusBooking(ByVal BookingID As String, _
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
'        .Append "FirstName", adBSTR, 50, adFldUpdatable & adFldIsNullable
'        .Append "LastName", adBSTR, 50, adFldUpdatable & adFldIsNullable
        .Append "DepartDate", adDate, , adFldUpdatable & adFldIsNullable
        .Append "SeatNo", adBSTR, 10, adFldUpdatable & adFldIsNullable
        .Append "ClassName", adBSTR, 50, adFldUpdatable & adFldIsNullable
        .Append "Price", adCurrency, , adFldUpdatable & adFldIsNullable
        .Append "SourceStation", adBSTR, 50, adFldUpdatable & adFldIsNullable
        .Append "DepartTime", adDate, , adFldUpdatable & adFldIsNullable
        .Append "DestStation", adBSTR, 50, adFldUpdatable & adFldIsNullable
        .Append "ArriveTime", adDate, , adFldUpdatable & adFldIsNullable
        .Append "CompanyName", adBSTR, 50, adFldUpdatable & adFldIsNullable
    End With
    rsLastResult.Open
            
    strCommand = "SELECT    T3.CustomerBookingID, " & vbCrLf & _
                                  "                     T4.DepartDate, T4.SeatNo, T9.ClassName, T3.Price, " & vbCrLf & _
                                  "                     MIN(T6.Idx) AS 'SIndex' , MAX(T7.Idx) AS 'DIndex', T10.CompanyName, T8.RouteID " & vbCrLf & _
                                  "FROM        Booking T2, " & vbCrLf & _
                                  "                     CustomerBooking T3, " & vbCrLf & _
                                  "                     SubRouteBooking T4, SubRouteBooking T5, " & vbCrLf & _
                                  "                     RouteSubRoute T6, RouteSubRoute T7, " & vbCrLf & _
                                  "                     Route T8, " & vbCrLf & _
                                  "                     BusClass T9, " & vbCrLf & _
                                  "                     BusCompany T10 "
   strCommand = strCommand & vbCrLf & _
                                  "WHERE    T2.BookingID = '" & BookingID & "' " & vbCrLf & _
                                  "                     AND T3.BookingID = T2.BookingID " & vbCrLf & _
                                  "                     AND T5.CustomerBookingID = T3.CustomerBookingID" & vbCrLf & _
                                  "                     AND T4.CustomerBookingID = T3.CustomerBookingID " & vbCrLf & _
                                  "                     AND T4.RouteID = T5.RouteID " & vbCrLf & _
                                  "                     AND T7.RouteID = T5.RouteID " & vbCrLf & _
                                  "                     AND T6.RouteID = T4.RouteID " & vbCrLf & _
                                  "                     AND T7.SubRouteID = T5.SubRouteID " & vbCrLf & _
                                  "                     AND T6.SubRouteID = T4.SubRouteID " & vbCrLf & _
                                  "                     AND T8.RouteID = T4.RouteID " & vbCrLf & _
                                  "                     AND T9.ClassID = T8.ClassID " & vbCrLf & _
                                  "                     AND T10.CompanyID = T8.CompanyID " & vbCrLf & _
                                  "GROUP BY T3.CustomerBookingID,T4.DepartDate, T4.SeatNo, T3.Price, T9.ClassName, T10.CompanyName, T8.RouteID " & vbCrLf & _
                                  "ORDER BY T4.DepartDate, T4.SeatNo "
            
            
'    strCommand = "SELECT    T3.CustomerBookingID, " & vbCrLf & _
                                  "                     T1.FirstName, T1.LastName, " & vbCrLf & _
                                  "                     T4.DepartDate, T4.SeatNo, T9.ClassName, T3.Price, " & vbCrLf & _
                                  "                     MIN(T6.Idx) AS 'SIndex' , MAX(T7.Idx) AS 'DIndex', T10.CompanyName, T8.RouteID " & vbCrLf & _
                                  "FROM        Customer T1, " & vbCrLf & _
                                  "                     Booking T2, " & vbCrLf & _
                                  "                     CustomerBooking T3, " & vbCrLf & _
                                  "                     SubRouteBooking T4, SubRouteBooking T5, " & vbCrLf & _
                                  "                     RouteSubRoute T6, RouteSubRoute T7, " & vbCrLf & _
                                  "                     Route T8, " & vbCrLf & _
                                  "                     BusClass T9, " & vbCrLf & _
                                  "                     BusCompany T10 "
 '   strCommand = strCommand & vbCrLf & _
                                  "WHERE    T2.BookingID = '" & BookingID & "' " & vbCrLf & _
                                  "                     AND T1.CustomerID = T3.CustomerID " & vbCrLf & _
                                  "                     AND T3.BookingID = T2.BookingID " & vbCrLf & _
                                  "                     AND T5.CustomerBookingID = T3.CustomerBookingID" & vbCrLf & _
                                  "                     AND T4.CustomerBookingID = T3.CustomerBookingID " & vbCrLf & _
                                  "                     AND T4.RouteID = T5.RouteID " & vbCrLf & _
                                  "                     AND T7.RouteID = T5.RouteID " & vbCrLf & _
                                  "                     AND T6.RouteID = T4.RouteID " & vbCrLf & _
                                  "                     AND T7.SubRouteID = T5.SubRouteID " & vbCrLf & _
                                  "                     AND T6.SubRouteID = T4.SubRouteID " & vbCrLf & _
                                  "                     AND T8.RouteID = T4.RouteID " & vbCrLf & _
                                  "                     AND T9.ClassID = T8.ClassID " & vbCrLf & _
                                  "                     AND T10.CompanyID = T8.CompanyID " & vbCrLf & _
                                  "GROUP BY T3.CustomerBookingID, T1.FirstName, T1.LastName, T4.DepartDate, T4.SeatNo, T3.Price, T9.ClassName, T10.CompanyName, T8.RouteID " & vbCrLf & _
                                  "ORDER BY T1.FirstName, T1.LastName, T4.DepartDate, T4.SeatNo "
                
    
    If oSql.SqlExecute(strCommand, strSqlResult, rsFirstResult) Then
        If rsFirstResult.EOF And rsFirstResult.BOF Then
            strResult = "[BusService.dll,BusService.IBusSearch,SearchBusBooking]:[1]" & vbCrLf & "Can not find information about this BookingID"
            Exit Function
        End If
        
'        Set SearchBusBooking = rsFirstResult
'        strResult = ""
'        Exit Function
        
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
                                          "FROM        RouteSubRoute T1, " & vbCrLf & _
                                          "                     SubRoute T2, " & vbCrLf & _
                                          "                     Place T3 " & vbCrLf & _
                                          "WHERE    T1.RouteID = " & rsFirstResult("RouteID") & vbCrLf & _
                                          "                     AND T1.Idx = " & rsFirstResult("SIndex") & vbCrLf & _
                                          "                     AND T1.SubRouteID = T2.SubRouteID " & vbCrLf & _
                                          "                     AND T3.PlaceID = T2.SrcStation "
            If Not oSql.SqlExecute(strCommand, strSqlResult, rsSource) Then
                strResult = "[BusService.dll,BusService.IBusSearch,SearchBusBooking]:[2]" & vbCrLf & strSqlResult
                Exit Function
            End If
            dtDepartTime = rsSource("DepartTime")
            strSourceStation = rsSource("PlaceName")
    
            strCommand = "SELECT    T1.ArriveTime , T3.PlaceName  " & vbCrLf & _
                                          "FROM        RouteSubRoute T1, " & vbCrLf & _
                                          "                     SubRoute T2, " & vbCrLf & _
                                          "                     Place T3 " & vbCrLf & _
                                          "WHERE    T1.RouteID = " & rsFirstResult("RouteID") & vbCrLf & _
                                          "                     AND T1.Idx = " & rsFirstResult("DIndex") & vbCrLf & _
                                          "                     AND T1.SubRouteID = T2.SubRouteID " & vbCrLf & _
                                          "                     AND T3.PlaceID = T2.DstStation "
            If Not oSql.SqlExecute(strCommand, strSqlResult, rsSource) Then
                strResult = "[BusService.dll,BusService.IBusSearch,SearchBusBooking]:[3]" & vbCrLf & strSqlResult
                Exit Function
            End If
            dtArriveTime = rsSource("ArriveTime")
            strDestStation = rsSource("PlaceName")
    
            With rsLastResult
                .AddNew
'                .Fields("FirstName") = rsFirstResult.Fields("FirstName")
'                .Fields("LastName") = rsFirstResult.Fields("LastName")
                .Fields("DepartDate") = rsFirstResult("DepartDate")
                .Fields("SeatNo") = rsFirstResult.Fields("SeatNo")
                .Fields("ClassName") = rsFirstResult("ClassName")
                .Fields("Price") = rsFirstResult("Price")
                .Fields("SourceStation") = strSourceStation
                .Fields("DepartTime") = dtDepartTime
                .Fields("DestStation") = strDestStation
                .Fields("ArriveTime") = dtArriveTime
                .Fields("CompanyName") = rsFirstResult("CompanyName")
                .Update
            End With
            rsFirstResult.MoveNext
        Wend
        Set SearchBusBooking = rsLastResult
        strResult = ""
    Else
        strResult = "[BusService.dll,BusService.IBusSearch,SearchBusBooking]:[1]" & vbCrLf & strSqlResult
    End If
    Exit Function

Oops:
    strResult = "[BusService.dll,BusService.IBusSearch,SearchBusBooking]:[Exception]" & vbCrLf & Err.Description
End Function

Public Function SearchCompany(ByVal Keyword As String, _
                                                                  ByRef strResult As String) _
                                                                  As ADODB.Recordset
On Error GoTo Oops:
    Dim strSqlResult As String
    Dim strCommand As String
    Dim rsResult As ADODB.Recordset
    Set rsResult = New ADODB.Recordset
    strCommand = "SELECT    CompanyID, CompanyName " & _
                                 "FROM         BusCompany "
    If Keyword <> "" Then
        strCommand = strCommand & "WHERE Description LIKE '%" & Keyword & "%'"
    End If
    If oSql.SqlExecute(strCommand, strSqlResult, rsResult) Then
        If rsResult.EOF And rsResult.BOF Then
            strResult = "Not Found"
        Else
            Set SearchCompany = rsResult
            strResult = "Found"
        End If
    Else
        strResult = "[BusService.dll,BusService.ISearch,SearchCompany]:[1]" & vbCrLf & _
                              strSqlResult & vbCrLf & _
                              "Sql Command : " & vbCrLf & _
                              """" & strCommand & """"
'        oContext.SetAbort
    End If
    Exit Function

Oops:
    strResult = "[BusService.dll,BusService.ISearch,SearchCompany]:[Exception]" & vbCrLf & Err.Description
'    oContext.SetAbort
End Function

Public Function SearchStation(ByVal Keyword As String, _
                                                            ByRef strResult As String) _
                                                            As ADODB.Recordset
On Error GoTo Oops:
    Dim strSqlResult As String
    Dim strCommand As String
    Dim rsResult As ADODB.Recordset
    
    Set rsResult = New ADODB.Recordset
    strCommand = "SELECT  PlaceID, PlaceName " & _
                                 "FROM       Place "
    
    If Keyword <> "" Then
        strCommand = strCommand & "WHERE Description LIKE '%" & Keyword & "%'"
    End If
    
    If oSql.SqlExecute(strCommand, strSqlResult, rsResult) Then
        If rsResult.EOF And rsResult.BOF Then
            strResult = "Not Found"
        Else
            strResult = "Found"
            Set SearchStation = rsResult
        End If
    Else
        strResult = "[BusService.dll,BusService.ISearch,SearchStation]:[1]" & vbCrLf & _
                              strSqlResult & vbCrLf & _
                              "Sql Command : " & vbCrLf & _
                              """" & strCommand & """"
'        oContext.SetAbort
    End If
    Exit Function
    
Oops:
    strResult = "[BusService.dll,BusService.ISearch,SearchStation]:[Exception]" & vbCrLf & Err.Description
'    oContext.SetAbort
End Function

Public Function SearchBus(ByVal StartDate As String, _
                                                      ByVal TotalUsingDay As Integer, _
                                                      ByRef strResult As String, _
                                                      Optional ByVal NumOfCoach As Integer = 1, _
                                                      Optional ByVal TotalSeat As Integer = 0, _
                                                      Optional ByVal AirCond As Boolean = False, _
                                                      Optional ByVal Toilet As Boolean = False, _
                                                      Optional ByVal Ordering As Integer = 0) _
                                                      As ADODB.Recordset
On Error GoTo Oops:
    Dim strSqlResult As String
    Dim strCommand As String
    Dim strTotalSeat As String
    Dim strAirCond As String
    Dim strToilet As String
    Dim strUsingDate As String
    Dim dtUsingDate As Date
    Dim iCount As Integer
    Dim rsResult As ADODB.Recordset
    Dim rsBusName As ADODB.Recordset
    
    dtUsingDate = StartDate
    strUsingDate = "T4.UsingDate = '" & dtUsingDate & "' "
    
    If TotalUsingDay > 1 Then
        For iCount = 2 To TotalUsingDay
            dtUsingDate = dtUsingDate + 1
            strUsingDate = strUsingDate & vbCrLf & " OR T4.UsingDate = '" & dtUsingDate & "' "
        Next iCount
    End If
    
    If AirCond Then
        strAirCond = " AND T2.AirCond = 0 "
    Else
        strAirCond = ""
    End If
    
    If Toilet Then
        strToilet = " AND T2.Toilet = 0 "
    Else
        strToilet = ""
    End If
    
    Select Case TotalSeat
        Case 0
            strToilet = ""
        Case 1
            strToilet = " AND T2.TotalSeat = 24 "
        Case 2
            strToilet = " AND T2.TotalSeat = 32 "
        Case 3
            strToilet = " AND T2.TotalSeat = 36 "
        Case 4
            strToilet = " AND T2.TotalSeat = 40 "
        Case 5
            strToilet = " AND T2.TotalSeat = 48 "
        Case Else
            strToilet = ""
    End Select
    
    strCommand = "SELECT      T3.CompanyName, " & vbCrLf & _
                                  "                       T2.ModelName, " & vbCrLf & _
                                  "                       ~ T2.AirCond, ~ T2.Toilet, T2.TotalSeat, T2.RentCost, T2.Description, T2.ModelID, T3.CompanyID " & vbCrLf & _
                                  "FROM          Bus T1, " & vbCrLf & _
                                  "                       BusModel T2, " & vbCrLf & _
                                  "                       BusCompany T3 " & vbCrLf & _
                                  "WHERE      T2.ModelID = T1.ModelID " & vbCrLf & _
                                  "                       AND T3.CompanyID = T1.CompanyID " & vbCrLf & _
                                  strToilet & vbCrLf & _
                                  strAirCond & vbCrLf & _
                                  strToilet & vbCrLf & _
                                  "                        AND T1.BusID NOT IN "
    strCommand = strCommand & vbCrLf & _
                                  "( SELECT    T4.BusID " & vbCrLf & _
                                  "FROM           BusBooking T4 " & vbCrLf & _
                                  "WHERE       T4.BusID = T1.BusID" & vbCrLf & _
                                  "                         AND ( " & strUsingDate & vbCrLf & _
                                  "                         ) ) " & vbCrLf & _
                                  "GROUP BY T3.CompanyName, T2.ModelName,T2.AirCond, T2.Toilet, T2.RentCost, " & vbCrLf & _
                                  "                         T2.TotalSeat, T2.Description, T2.ModelID, T3.CompanyID " & vbCrLf & _
                                  "HAVING       COUNT(T1.BusID) >= " & NumOfCoach & " " & vbCrLf & _
                                  "ORDER BY T3.CompanyName, T2.ModelName "
    
    
    
    If oSql.SqlExecute(strCommand, strSqlResult, rsResult) Then
        If rsResult.EOF And rsResult.BOF Then
            strResult = "Not Found"
        Else
            strResult = ""
            Set SearchBus = rsResult
        End If
    Else
        strResult = "[BusService.dll,BusService.ISearch,SearchBus]:[2]" & vbCrLf & _
                              strSqlResult & vbCrLf & _
                              "Sql Command : " & vbCrLf & _
                              """" & strCommand & """"
'        oContext.SetAbort
    End If
    Exit Function
    
Oops:
    strResult = "[BusService.dll,BusService.ISearch,SearchSeat]:[Exception]" & vbCrLf & Err.Description
End Function

Public Function SearchSeat(ByVal SrcStationID As String, _
                                                        ByVal DstStationID As String, _
                                                        ByVal TotalSeat As Integer, _
                                                        ByRef strResult As String, _
                                                        Optional ByVal DepartDate As String = "", _
                                                        Optional ByVal CompanyID As Integer = 0, _
                                                        Optional ByVal ClassType As Integer = BusClass.AllClass, _
                                                        Optional ByVal SeatType As Integer = BusSeat.AllSeat, _
                                                        Optional ByVal iOrder As Integer = 0) _
                                                        As ADODB.Recordset
On Error GoTo Oops:
    Dim strSqlResult As String
    Dim strCommand As String
    Dim strSelectedCompany As String
    Dim strSelectedClassType As String
    Dim strSelectedSeatType As String
    Dim strOrdering As String
    Dim rsResult As ADODB.Recordset
    
    Set rsResult = New ADODB.Recordset
    
    ' Check date value
    If DepartDate = "" Then
        DepartDate = CStr(DateValue(Now))
    Else
        If DateValue(DepartDate) < DateValue(Now) Then
        Else
            strResult = "[BusService.dll,BusService.IBusSearch,SearchSeat]:[1]" & vbCrLf & "Date is expired"
        End If
    End If
    
    ' Check company of bus.
    If CompanyID = 0 Then
        strSelectedCompany = ""
    Else
        strSelectedCompany = " AND T7.CompanyID = " & CompanyID & " "
    End If
    
    ' Check class of bus.
    Select Case ClassType
        Case BusClass.AllClass
            strSelectedClassType = ""
        Case BusClass.Air1VIP
            strSelectedClassType = " AND T7.ClassID = 1 "
        Case BusClass.Air1
            strSelectedClassType = " AND T7.ClassID = 2 "
        Case BusClass.Air2
            strSelectedClassType = " AND T7.ClassID = 3 "
        Case Else
            strSelectedClassType = ""
    End Select
    
    ' Checking type of seat.
    Select Case SeatType
        Case BusSeat.AllSeat
            strSelectedSeatType = ""
        Case BusSeat.Aisle
            strSelectedSeatType = " AND T8.Window = 1 "
        Case BusSeat.Window
            strSelectedSeatType = " AND T8.Window = 0 "
        Case Else
            strSelectedSeatType = ""
    End Select
    
    ' Cheack sort condition
    Select Case iOrder
        Case Ordering.Default
            strOrdering = " ORDER BY T1.CompanyName, T3.DepartTime "
        Case Ordering.CompanyName
            strOrdering = " ORDER BY T1.CompanyName, T3.DepartTime "
        Case Ordering.LowestPrice
            strOrdering = " ORDER BY (SUM(T12.Distance) * T2.PricePerKm) + T13.Fee, T1.CompanyName, T3.DepartTime "
        Case Ordering.ShortestPath
            strOrdering = " ORDER BY SUM(T12.Distance), T1.CompanyName, T3.DepartTime "
        Case Ordering.DepartTime
            strOrdering = " ORDER BY T3.DepartTime, T1.CompanyName "
        Case Ordering.ArriveTime
            strOrdering = " ORDER BY T4.ArriveTime, T1.CompanyName "
        Case Else
            strOrdering = " ORDER BY T1.CompanyName, T3.DepartTime "
    End Select
        
    ' Create SQL command.
    strCommand = "SELECT       T1.CompanyName, T2.ClassName, " & vbCrLf & _
                                  "                        T3.DepartTime, T4.ArriveTime, " & vbCrLf & _
                                  "                        T3.RouteID , T3.Idx AS 'SIndex', T4.Idx AS 'DIndex', " & vbCrLf & _
                                  "                         SUM(T12.Distance) AS 'Distance', " & vbCrLf & _
                                  "                         (SUM(T12.Distance) * T2.PricePerKm) + T13.Fee AS 'Price', T7.Description " & vbCrLf & _
                                  "FROM           BusCompany T1, " & vbCrLf & _
                                  "                        BusClass T2, " & vbCrLf & _
                                  "                        RouteSubRoute T3, RouteSubRoute T4, RouteSubRoute T11," & vbCrLf & _
                                  "                        SubRoute T5, SubRoute T6, SubRoute T12," & vbCrLf & _
                                  "                        Route T7, " & vbCrLf & _
                                  "                        BusFee T13 " & vbCrLf
    strCommand = strCommand & _
                                  "WHERE       T5.SrcStation = '" & SrcStationID & "'" & vbCrLf & _
                                  "                         AND T6.DstStation = '" & DstStationID & "'" & vbCrLf & _
                                  "                         AND T5.SubRouteID = T3.SubRouteID " & vbCrLf & _
                                  "                         AND T6.SubRouteID = T4.SubRouteID " & vbCrLf & _
                                  "                         AND T3.RouteID = T4.RouteID " & vbCrLf & _
                                  "                         AND T11.RouteID = T3.RouteID " & vbCrLf & _
                                  "                         AND T11.Idx BETWEEN T3.Idx AND T4.Idx " & vbCrLf & _
                                  "                         AND T12.SubRouteID = T11.SubRouteID " & vbCrLf & _
                                  "                         AND T3.Idx <= T4.Idx " & vbCrLf & _
                                  "                         AND T7.RouteID = T3.RouteID " & vbCrLf & _
                                  "                         AND T1.CompanyID = T7.CompanyID " & vbCrLf & _
                                  "                         AND T2.ClassID = T7.ClassID " & vbCrLf & _
                                  "                         AND T13.CompanyID = T1.CompanyID " & vbCrLf & _
                                  "                         AND T13.ClassID = T2.ClassID " & vbCrLf & _
                                  strSelectedCompany & vbCrLf & _
                                  strSelectedClassType & vbCrLf & _
                                  "                         AND " & TotalSeat & " <= " & vbCrLf
    strCommand = strCommand & vbCrLf & _
                                  "(SELECT COUNT(DISTINCT T8.SeatNo) " & vbCrLf & _
                                  "FROM      Seat T8 " & vbCrLf & _
                                  "WHERE   T7.ModelID = T8.ModelID " & vbCrLf & _
                                  strSelectedSeatType & vbCrLf & _
                                  "                    AND T8.SeatNo NOT IN ( " & vbCrLf & _
                                  "SELECT    DISTINCT T9.SeatNo " & vbCrLf & _
                                  "FROM        SubRouteBooking T9, " & vbCrLf & _
                                  "                     RouteSubRoute T10 " & vbCrLf & _
                                  "WHERE    T9.DepartDate = '" & DepartDate & "' " & vbCrLf & _
                                  "                     AND T9.RouteID = T7.RouteID " & vbCrLf & _
                                  "                     AND T9.RouteID = T10.RouteID " & vbCrLf & _
                                  "                     AND T9.SubRouteID = T10.SubRouteID " & vbCrLf & _
                                  "                     AND T10.Idx >= T3.Idx " & vbCrLf & _
                                  "                     AND T10.Idx <=  T4.Idx )) " & vbCrLf
    strCommand = strCommand & vbCrLf & _
                                  "GROUP BY     T1.CompanyName, T2.ClassName, " & vbCrLf & _
                                  "                            T3.DepartTime, T4.ArriveTime, " & vbCrLf & _
                                  "                            T3.RouteID , T3.Idx, T4.Idx, T2.PricePerKm, T13.Fee, T7.Description " & vbCrLf & _
                                  strOrdering & vbCrLf
        
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
                              "Sql Command : " & vbCrLf & _
                              """" & strCommand & """"
'        oContext.SetAbort
    End If
    Exit Function

Oops:
    strResult = "[BusService.dll,BusService.ISearch,SearchSeat]:[Exception]" & vbCrLf & Err.Description
'    oContext.SetAbort
End Function

'Public Function SearchRoute(ByVal SrcStationID As String, _
'                                                           ByVal DstStationID As String, _
'                                                           Optional ByVal CompanyID As Integer = 0, _
'                                                           Optional ByVal ClassType As Integer = BusClass.AllClass) _
'                                                           As ADODB.Recordset
'On Error GoTo Oops:
'    Dim strCommand As String
'    Dim strSelectedCompany As String
'    Dim strSelectedClassType As String
'    Dim rs As ADODB.Recordset
'    Set rs = New ADODB.Recordset
'    ' Checking company that user selected.
'    If CompanyID = 0 Then
'        strSelectedCompany = ""
'    Else
'        strSelectedCompany = " AND T7.CompanyID = " & CompanyID & " "
'    End If
'    ' Checking class that user selected.
'    Select Case ClassType
'        Case BusClass.AllClass
'            strSelectedClassType = ""
'        Case BusClass.Air1VIP
'            strSelectedClassType = " AND T7.ClassID = 1 "
'        Case BusClass.Air1
'            strSelectedClassType = " AND T7.ClassID = 2 "
'        Case BusClass.Air2
'            strSelectedClassType = " AND T7.ClassID = 3 "
'    End Select
'    ' Create SQL command
'    strCommand = "SELECT       T1.CompanyName, T2.ClassName, " & _
'                                  "                        T3.DepartTime, T4.ArriveTime, " & _
'                                  "                        T3.RouteID , T3.Idx, T4.Idx " & _
'                                  "FROM           BusCompany T1, " & _
'                                  "                        BusClass T2, " & _
'                                  "                        RouteSubRoute T3, RouteSubRoute T4, " & _
'                                  "                        SubRoute T5, SubRoute T6, " & _
'                                  "                        Route T7 " & _
'                                  "WHERE       T5.SrcStation = '" & SrcStationID & "'" & _
'                                  "                         AND T6.DstStation = '" & DstStationID & "'" & _
'                                  "                         AND T5.SubRouteID = T3.SubRouteID " & _
'                                  "                         AND T6.SubRouteID = T4.SubRouteID " & _
'                                  "                         AND T3.RouteID = T4.RouteID " & _
'                                  "                         AND T3.Idx <= T4.Idx " & _
'                                  "                         AND T7.RouteID = T3.RouteID " & _
'                                  "                         AND T1.CompanyID = T7.CompanyID " & _
'                                  "                         AND T2.ClassID = T7.ClassID " & strSelectedCompany & strSelectedClassType
'        MsgBox strCommand '????????????????
'        If oSql.SqlExecute(strCommand, rs) Then
'            Set SearchRoute = rs
'        Else
'            MsgBox "Error at : BusService.ISearch : SearchRoute" '????????????????????????
'        End If
'        Exit Function
'Oops:
'        Debug.Print "Error at : BusService.ISearch : SearchRoute :: " & vbCrLf & Err.Description '??????????????
'End Function
