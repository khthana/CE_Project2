Attribute VB_Name = "mdAirlineService"
Option Explicit

Public Const DateExpire  As Integer = 1
Public Const OlalaAgencyID As String = "{6EE31E53-5DE6-49A8-B774-F60DB8DC818B}"

Public Enum AircraftClass
    AllClass = 0
    FirstClass = 1
    BusinessClass = 2
    EconomicClass = 3
End Enum

Public Enum Confirmation
    NotConfirm = 0
    Confirm = 1
    Cancel = 2
End Enum

Public Enum Ordering
    Default = 0
    AirlineName = 1
    LowestPrice = 2
    ShortestPath = 3
    DepartTime = 4
    ArriveTime = 5
End Enum

Public Enum AirlineSeatType
    AllSeat = 0
    Window = 1
    Aisle = 2
End Enum

