VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CreateRecordset"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

' Create RecordSet
Public Function CreateReserveAirSeatRecordSet() As ADODB.Recordset
  Dim ReserveAirSeatRS As ADODB.Recordset
  Set ReserveAirSeatRS = New ADODB.Recordset
  With ReserveAirSeatRS.Fields
    .Append "CustomerID", adBSTR, 50, adFldIsNullable & adFldUpdatable
    .Append "FlightID", adBSTR, 50, adFldUpdatable & adFldIsNullable
    .Append "SrcIdx", adInteger, , adFldUpdatable & adFldIsNullable
    .Append "DstIdx", adInteger, , adFldUpdatable & adFldIsNullable
    .Append "DepartDate", adBSTR, 50, adFldUpdatable & adFldIsNullable
    .Append "SeatType", adInteger, , adFldUpdatable & adFldIsNullable
    .Append "ClassType", adInteger, , adFldUpdatable
    .Append "CanSmoking", adBoolean, , adFldUpdatable & adFldIsNullable
    .Append "Price", adCurrency, , adFldUpdatable & adFldIsNullable
    ReserveAirSeatRS.Open
  End With
  Set CreateReserveAirSeatRecordSet = ReserveAirSeatRS
End Function

Public Function CreateReserveBusSeatRecordSet() As ADODB.Recordset
    Dim ReserveBusSeatRS As ADODB.Recordset
    Set ReserveBusSeatRS = New ADODB.Recordset
    
    With ReserveBusSeatRS.Fields
        .Append "CustomerID", adBSTR, 50, adFldIsNullable & adFldUpdatable
        .Append "RouteID", adInteger, , adFldUpdatable & adFldIsNullable
        .Append "SrcIdx", adInteger, , adFldUpdatable & adFldIsNullable
        .Append "DstIdx", adInteger, , adFldUpdatable & adFldIsNullable
        .Append "DepartDate", adBSTR, 50, adFldUpdatable & adFldIsNullable
        .Append "SeatType", adInteger, , adFldUpdatable & adFldIsNullable
        .Append "Price", adCurrency, , adFldUpdatable & adFldIsNullable
        ReserveBusSeatRS.Open
    End With
    Set CreateReserveBusSeatRecordSet = ReserveBusSeatRS
End Function

Public Function CreateReserveHotelRoomRecordSet() As ADODB.Recordset
    Dim ReserveHotelRoomRecordSet As ADODB.Recordset
    Set ReserveHotelRoomRecordSet = New ADODB.Recordset
    
    With ReserveHotelRoomRecordSet.Fields
        .Append "BookCheckInTime", adBSTR, 50, adFldIsNullable & adFldUpdatable
        .Append "BookCheckOutTime", adBSTR, 50, adFldIsNullable & adFldUpdatable
        .Append "HotelID", adBSTR, 50, adFldIsNullable & adFldUpdatable
        .Append "PricePerDay", adCurrency, , adFldIsNullable & adFldUpdatable
        .Append "Description", adBSTR, 150, adFldIsNullable & adFldUpdatable
        .Append "NumberOfSingleBed", adInteger, , adFldIsNullable & adFldUpdatable
        .Append "NumberOfCoupleBed", adInteger, , adFldIsNullable & adFldUpdatable
        .Append "RoomClass", adInteger, , adFldIsNullable & adFldUpdatable
        .Append "Floor", adInteger, , adFldIsNullable & adFldUpdatable
        .Append "RoomAmount", adInteger, , adFldIsNullable & adFldUpdatable
        .Append "CustomerID", adBSTR, 50, adFldIsNullable & adFldUpdatable
        ReserveHotelRoomRecordSet.Open
    End With
    Set CreateReserveHotelRoomRecordSet = ReserveHotelRoomRecordSet
End Function

Public Function CreateTravellerIDPersonalBookingIDRS() As ADODB.Recordset
    Dim TravellerIDPersonalBookingIDRS As ADODB.Recordset
    Set TravellerIDPersonalBookingIDRS = New ADODB.Recordset
    With TravellerIDPersonalBookingIDRS.Fields
        .Append "TravellerID", adBSTR, 50, adFldUpdatable
        .Append "PersonalBookingID", adBSTR, 50, adFldUpdatable
    End With
    Set CreateTravellerIDPersonalBookingIDRS = TravellerIDPersonalBookingIDRS
End Function

Public Function CreateReserveResultRS() As ADODB.Recordset
    Dim ReserveResultRS As ADODB.Recordset
    Set ReserveResultRS = New ADODB.Recordset
    With ReserveResultRS.Fields
        .Append "ElementNo", adInteger, , adFldIsNullable & adFldUpdatable
        .Append "ReserveNo", adBSTR, 50, adFldIsNullable & adFldUpdatable
        .Append "Description", adBSTR, 150, adFldIsNullable & adFldUpdatable
        ReserveResultRS.Open
    End With
    Set CreateReserveResultRS = ReserveResultRS
End Function

'////////////////////////////////////////
'///// Add to RecordSet
'////////////////////////////////////////
Public Sub AddAirSeatReserve(ByRef ReserveAirSeatRS As ADODB.Recordset, _
    ByVal FlightID As String, ByVal SrcIdx As Integer, _
    ByVal DstIdx As Integer, ByVal ClassType As Integer, _
    ByVal DepartTime As String, ByVal Price As Currency, _
    ByRef strResult As String, _
    ByVal CustomerID As String, _
    Optional ByVal SeatType As Integer = 0, _
    Optional ByVal CanSmoking As Boolean = False)
  
  On Error GoTo Oops
        strResult = ""
        With ReserveAirSeatRS
            .AddNew
            .Fields("CustomerID") = CustomerID
            .Fields("FlightID") = FlightID
            .Fields("SrcIdx") = SrcIdx
            .Fields("DstIdx") = DstIdx
            .Fields("DepartDate") = DepartTime
            .Fields("ClassType") = ClassType
            .Fields("CanSmoking") = CanSmoking
            .Fields("SeatType") = SeatType
            .Fields("Price") = Price
            .Update
        End With
    Exit Sub
Oops:
    strResult = "Error"
End Sub

Public Sub AddBusSeatReserve(ByRef ReserveBusSeatRS As ADODB.Recordset, _
  ByVal RouteID As Integer, ByVal SrcIdx As Integer, _
  ByVal DstIdx As Integer, ByVal DepartTime As String, _
  ByVal Price As Currency, ByRef strResult As String, _
  ByVal CustomerID As String, _
  Optional ByVal SeatType As Integer = 0)
  
  On Error GoTo Oops:
  strResult = ""
  With ReserveBusSeatRS
    .AddNew
    .Fields("CustomerID") = CustomerID
    .Fields("RouteID") = RouteID
    .Fields("SrcIdx") = SrcIdx
    .Fields("DstIdx") = DstIdx
    .Fields("DepartDate") = DepartTime
    .Fields("SeatType") = SeatType
    .Fields("Price") = Price
    .Update
  End With
  Exit Sub
Oops:
  strResult = "Error"
End Sub

Public Sub AddReserveHotelRoomRecordSet(ByRef ReserveHotelRoomRS As ADODB.Recordset, _
    ByVal BookCheckInTime As String, _
    ByVal BookCheckOutTime As String, ByVal HotelID As String, ByVal PricePerDay As Currency, _
    ByVal Description As String, ByVal NumberOfSingleBed As Integer, _
    ByVal NumberOfCoupleBed As Integer, ByVal RoomClass As Integer, _
    ByVal Floor As Integer, ByVal RoomAmout As Integer, ByVal CustomerID As String, _
    ByRef strResult As String)
    
    On Error GoTo Oops:
        strResult = ""
        With ReserveHotelRoomRS
            .AddNew
            .Fields("BookCheckInTime") = BookCheckInTime
            .Fields("BookCheckOutTime") = BookCheckOutTime
            .Fields("HotelID") = HotelID
            .Fields("PricePerDay") = PricePerDay
            .Fields("Description") = Description
            .Fields("NumberOfSingleBed") = NumberOfSingleBed
            .Fields("NumberOfCoupleBed") = NumberOfCoupleBed
            .Fields("RoomClass") = RoomClass
            .Fields("Floor") = Floor
            .Fields("RoomAmount") = RoomAmout
            .Fields("CustomerID") = CustomerID
            .Update
        End With
    Exit Sub
Oops:
    strResult = "Error"
End Sub

Public Function AddReserveResultRS(ByRef ReserveRS As ADODB.Recordset, _
  ByVal ElementNo As Integer, ByVal ReserveNo As String, _
  ByVal Description As String, ByRef strResult As String)
  
  With ReserveRS
    .AddNew
    .Fields("ElementNo") = ElementNo
    .Fields("ReserveNo") = ReserveNo
    .Fields("Description") = Description
    .Update
  End With
End Function

'Public Sub AddReserveRSToResultRS(ByRef SourceRS As ADODB.Recordset, _
'  ByRef DestRS As ADODB.Recordset, ByVal ElementNo As Integer, _
'  ByRef strResult As String)
'
'  Dim ReserveNo As String
'  Dim Description As String
'  Dim TotalAddRow As Integer
'  Dim count As Integer
'
'  TotalAddRow = SourceRS.RecordCount + 1
'
'  For count = 1 To TotalAddRow
'      DestRS(0).Value = ElementNo
'      DestRS(1).Value = SourceRS(2).Value
'      DestRS(2).Value = SourceRS(3).Value
'  Next count
'End Sub

Public Sub AddReserveRSToResultRS(ByVal SourceRS As ADODB.Recordset, _
                                  ByRef DestRS As ADODB.Recordset, _
                                  ByVal ElementNo As Integer, _
                                  ByVal Increasing As String, _
                                  ByRef strResult As String)
On Error GoTo Oops:
    Dim ElementCount As Integer
    ElementCount = ElementNo

    If SourceRS.EOF And SourceRS.BOF Then
        strResult = "DestRS have no information"
        Exit Sub
    End If
    SourceRS.MoveFirst

    If Increasing = 0 Then
        While Not SourceRS.EOF
            DestRS.AddNew
            DestRS.Fields("ElementNo") = ElementCount
            DestRS.Fields("ReserveNo") = SourceRS.Fields(2)
            DestRS.Fields("Description") = SourceRS.Fields(3)
            DestRS.Update
            SourceRS.MoveNext
        Wend
    Else
        While Not SourceRS.EOF
            DestRS.AddNew
            DestRS.Fields("ElementNo") = ElementCount
            DestRS.Fields("ReserveNo") = SourceRS.Fields(2)
            DestRS.Fields("Description") = SourceRS.Fields(3)
            DestRS.Update
            ElementCount = ElementCount + 1
            SourceRS.MoveNext
        Wend
    End If
    strResult = ""
Exit Sub

Oops:
    strResult = Err.Description
End Sub


Public Function CutStringByChar(ByRef StrSource As String, _
  ByVal CharSymbol As String, _
  ByRef SubString As String) As Boolean
  
  Dim tmpStr As String
  Dim strResult As String
  Dim StrSourceLen As Integer
  Dim EndStrPos As Integer
  
  tmpStr = StrSource
  StrSourceLen = Len(tmpStr)
  strResult = Left(tmpStr, 1)
  EndStrPos = InStr(1, StrSource, CharSymbol)
  If EndStrPos > 0 Then
    strResult = Left(StrSource, EndStrPos - 1)
    StrSource = Right(tmpStr, StrSourceLen - EndStrPos)
    SubString = strResult
    CutStringByChar = True
  ElseIf StrSourceLen > 0 Then
    strResult = StrSource
    StrSource = ""
    SubString = strResult
    CutStringByChar = True
  Else
    CutStringByChar = False
  End If
End Function


