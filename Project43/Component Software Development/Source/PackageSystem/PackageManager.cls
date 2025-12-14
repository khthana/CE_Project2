VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 4  'RequiresNewTransaction
END
Attribute VB_Name = "PackageManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
' ObjectContext Component
Dim objctx As ObjectContext

' OlalaTourDB Connector
Dim dbConnector As Object

' OlalaGuidCreator
Dim GuidCreator As Object

' RecordSet and RecordSet Creator Components
Dim RSCreator As Object

' UserSystem Components
Dim AdminManager As Object
Dim MemberManager As Object
Dim TravellerManager As Object
Dim FoodTypeManager As Object

' PackageDetail Components
Dim AirlineReserve As Object
Dim BusModify As Object
Dim BusReserve As Object
Dim HotelBooking As Object
Dim RestuarantBooking As Object
Dim PlaceManager As Object
Dim a As String

' LogSystem Components
Dim SystemLog As Object

Const OlalaTourBusCompanyCustomerID = "{6EE31E53-5DE6-49A8-B774-F60DB8DC818B}"
Const OlalaTourAirlineCustomerID = "{6EE31E53-5DE6-49A8-B774-F60DB8DC818B}"
Const OlalaTourHotelCustomerID = "{EB8714FB-4202-46AF-9B11-92A693AFA8EF}"
Const OlalaTourRestaurantCustomerID = "{1C69E09F-C2DB-4F67-8B82-04D8E7D1AC04}"

Private Sub Class_Initialize()
    Set objctx = GetObjectContext
  
    ' Create OlalaTourDBConnector Components
    Set dbConnector = CreateObject("OlalaTourDBConnector.OlalaTourDBConnector")
    
    ' OlalaGuid Creator Components
    Set GuidCreator = CreateObject("OlalaGuidCreator.OlalaGuidCreator")

    ' Create RecordSet and RecordSet Creator Components
    Set RSCreator = CreateObject("RecordSetCreator.CreateRecordSet")

    ' Create UserSystem Components
    Set AdminManager = CreateObject("UserSystem.AdminManager")
    Set MemberManager = CreateObject("UserSystem.MemberManager")
    Set TravellerManager = CreateObject("UserSystem.TravellerManager")
    Set FoodTypeManager = CreateObject("UserSystem.FoodType")

    ' Create PackageDetail Components
    Set AirlineReserve = CreateObject("AirlineService.IAirlineReserve")
    Set BusReserve = CreateObject("BusService.IBusReserve")
    Set HotelBooking = CreateObject("HotelManager.HotelBooking")
    Set PlaceManager = CreateObject("PlaceSystem.PlaceManager")
    Set RestuarantBooking = CreateObject("Restaurant_BookingPrj.Restaurant_Booking")
  
    Set SystemLog = CreateObject("LogSystem.SystemLogManager")
End Sub

Private Sub Class_Terminate()
    If Not objctx Is Nothing Then
        Set objctx = Nothing
    End If
End Sub

Private Function CutStringByChar(ByRef StrSource As String, _
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

'//////////////////////////////////////////
'/////// Create Methods
'//////////////////////////////////////////

Public Function Create(ByVal ReserveList As String, _
                                                  ByRef strResult As String) As ADODB.Recordset
    
    Dim PackageID As String
    Dim AdminID As String
    Dim PackageName As String
    Dim Description As String
    Dim ArriveTime As String
    Dim DepartTime As String
    Dim TotalPrice As Currency
    Dim TotalElement As Integer
    Dim ReserveType As String
    
    Dim CurrentStr As String
    Dim strError As String
    Dim tmpStr As String
    Dim BookingID As String
    Dim SQLCmd As String
    
    Dim ReserveDetail As String
    
    Dim i, j, k As Integer
    Dim tmp As String
  
    Dim ResultRS As ADODB.Recordset
    Dim TempResultRS As ADODB.Recordset
    Dim GroupAirReserveRS As ADODB.Recordset
    Dim BusReserveRS As ADODB.Recordset
    Dim HotelReserveRS As ADODB.Recordset
    Dim RestaurantReserveRS As ADODB.Recordset
    
    Dim AirCreaftSeatGroupBookingID As String
    Dim BusGroupBookingID As String
    Dim HotelRoomGroupBookingID As String
    Dim RestaurantGroupBookingID As String
    Dim PackageTourGroupBookingID As String
    Dim ReserveAircraftSeatCount As Integer
    Dim ReserveBusCount As Integer
    Dim ReserveHotelRoomCount As Integer
    Dim ReserveRestaurantCount As Integer
    
    On Error GoTo Oops:
        '//////////////////////////////////////////////
        '//// Initialize Path of this Method
        '//////////////////////////////////////////////
        
        Set ResultRS = New ADODB.Recordset
        Set TempResultRS = New ADODB.Recordset
        Set GroupAirReserveRS = New ADODB.Recordset
        Set BusReserveRS = New ADODB.Recordset
        Set HotelReserveRS = New ADODB.Recordset
        Set RestaurantReserveRS = New ADODB.Recordset
        
        Set GroupAirReserveRS = RSCreator.CreateGroupAirSeatRecordSet
        Set BusReserveRS = RSCreator.CreateReserveBusRecordSet
        Set HotelReserveRS = RSCreator.CreateReserveHotelRoomRecordSet
        Set RestaurantReserveRS = RSCreator.CreateReserveRestaurantRecordSet
        Set ResultRS = RSCreator.CreateReserveResultRS
        
        AirCreaftSeatGroupBookingID = ""
        BusGroupBookingID = ""
        HotelRoomGroupBookingID = ""
        RestaurantGroupBookingID = ""
        
        ReserveBusCount = 0
        ReserveAircraftSeatCount = 0
        ReserveHotelRoomCount = 0
        ReserveRestaurantCount = 0
        
        ' //////////////////////////////////////////////
        '//// Get Command Header
        '///////////////////////////////////////////////
        tmpStr = ReserveList
        strResult = tmpStr
        If CutStringByChar(tmpStr, ",", CurrentStr) Then
            AdminID = CurrentStr
        Else
            strError = "Error At AdminID" & AdminID
            GoTo Oops:
        End If
        
        If CutStringByChar(tmpStr, ",", CurrentStr) Then
            PackageName = CurrentStr
        Else
            strError = "Error At PackageName" & PackageName
            GoTo Oops:
        End If
        
        If CutStringByChar(tmpStr, ",", CurrentStr) Then
            Description = CurrentStr
        Else
            strError = "Error At Description" & Description
            GoTo Oops:
        End If
        
        If CutStringByChar(tmpStr, ",", CurrentStr) Then
            DepartTime = CurrentStr
        Else
            strError = "Error At Departtime" & DepartTime
            GoTo Oops:
        End If
        
        If CutStringByChar(tmpStr, ",", CurrentStr) Then
            ArriveTime = CurrentStr
        Else
            strError = "Error At Arrivetime" & ArriveTime
            GoTo Oops:
        End If
        
        If CutStringByChar(tmpStr, ",", CurrentStr) Then
            TotalPrice = CCur(CDbl(CurrentStr))
        Else
            strError = "Error At Arrivetime" & TotalPrice
            GoTo Oops:
        End If
                
        If CutStringByChar(tmpStr, "{", CurrentStr) Then
            TotalElement = CInt(CurrentStr)
        Else
            strError = CurrentStr '"Error At TotalElement"
            GoTo Oops:
        End If
    
        strError = tmpStr
        PackageID = GuidCreator.Create
        
        For i = 1 To TotalElement
            If CutStringByChar(tmpStr, "[", CurrentStr) Then
                ReserveType = CurrentStr
            Else
                strError = "Error at Begin of ReserveType Element:" & CStr(i)
                GoTo Oops:
            End If
            
            If CutStringByChar(tmpStr, "]", CurrentStr) Then
                ReserveDetail = CurrentStr
            Else
                strError = "Error at End of ReserveDetail Element:" & CStr(i)
                GoTo Oops:
            End If
            strError = strError & ReserveDetail

            '////////////////////////////////////////////////////////////////////////
            '// Call Reserve Method By ReserveType and ReserveList
            '////////////////////////////////////////////////////////////////////////
            
            Select Case ReserveType
                Case "PA":
                    ReserveAircraftSeatCount = ReserveAircraftSeatCount + 1
                    strError = "AddReserveGroupAirSeat PackageID, CurrentStr, strResult, GroupAirReserveRS"
                    AddReserveGroupAirSeat PackageID, CurrentStr, strError, GroupAirReserveRS
                    If strError <> "" Then
                        GoTo Oops
                    End If
                    
                Case "PB":
                    ReserveBusCount = ReserveBusCount + 1
                    strError = "AddReserveGroupAirSeat PackageID, CurrentStr, strResult, GroupAirReserveRS"
                    AddReserveBus PackageID, CurrentStr, strError, BusReserveRS
                    
                    If strError <> "" Then
                        GoTo Oops
                    End If
                    
                    
            
                Case "PH":
                    ReserveHotelRoomCount = ReserveHotelRoomCount + 1
                    strError = "Before Call AddReserveHotelRoom PackageID, CurrentStr, strError, HotelReserveRS"
                    AddReserveHotelRoom PackageID, CurrentStr, strError, HotelReserveRS
                    If strError <> "" Then
                        GoTo Oops
                    End If
                    
                Case "PR":
                    ReserveRestaurantCount = ReserveRestaurantCount + 1
                    strError = "Before Call AddReserveRestaurant PackageID, CurrentStr, strResult, RestaurantReserveRS"
                    AddReserveRestaurant PackageID, CurrentStr, strError, RestaurantReserveRS
                    strError = ""
                    If strError <> "" Then
                        GoTo Oops
                    End If
                    
                Case "PP":
                     AddPlace PackageID, CurrentStr, strResult
                            
                Case Else
                    strError = "ReserveType """ & ReserveType & """"
                    GoTo Oops
            End Select
        Next i
        
        '///////////////////////////////////////////////////////////
        '//// ReserveAirlineSeat
        '///////////////////////////////////////////////////////////
        strError = "ReserveAirSeatCount = " & ReserveAircraftSeatCount
        If ReserveAircraftSeatCount <> 0 Then
            If Not (GroupAirReserveRS.EOF And GroupAirReserveRS.BOF) Then
                GroupAirReserveRS.MoveFirst
                strError = "Before Call Air BookPackageSeat"
                Set TempResultRS = AirlineReserve.BookPackageSeat(GroupAirReserveRS, strError)
                MsgBox strError
                RSCreator.AddReserveRSToResultRS TempResultRS, ResultRS, 1, 1, strError
                TempResultRS.MoveFirst
                AirCreaftSeatGroupBookingID = TempResultRS(1)
                If strError <> "" Then
                    GoTo Oops
                Else
                    strError = "After Reserve Air "
                End If
            Else
                strError = "GroupAirReserveRS is EOF and BOF" & GroupAirReserveRS(2).Name
                GoTo Oops
            End If
        End If
        
        '///////////////////////////////////////////////////////////
        '//// ReserveBus
        '///////////////////////////////////////////////////////////
        strError = "ReserveBusCount = " & ReserveBusCount
        If ReserveBusCount <> 0 Then
            If Not (BusReserveRS.EOF And BusReserveRS.BOF) Then
                BusReserveRS.MoveFirst
                strError = "Before Call Bus BookPackageSeat"
                
                Set TempResultRS = BusReserve.BookBus(OlalaTourBusCompanyCustomerID, BusReserveRS, strError)
                MsgBox strError
                RSCreator.AddReserveRSToResultRS TempResultRS, ResultRS, 1, 1, strError
                TempResultRS.MoveFirst
                BusGroupBookingID = TempResultRS(1)
                If strError <> "" Then
                    GoTo Oops
                Else
                    strError = "After Reserve Air "
                End If
            Else
                strError = "GroupAirReserveRS is EOF and BOF" & GroupAirReserveRS(2).Name
                GoTo Oops
            End If
        End If
        
        '///////////////////////////////////////////////////////////
        '//// ReserveHotelRoom
        '///////////////////////////////////////////////////////////
        strError = "ReserveHotelRoomCount = " & ReserveHotelRoomCount
        If ReserveHotelRoomCount <> 0 Then
            strError = " Before If Not (BusReserveRS.EOF And BusReserveRS.BOF) Then"
            If Not (HotelReserveRS.EOF And HotelReserveRS.BOF) Then
                strError = "Before HotelReserveRS.MoveFirst"
                HotelReserveRS.MoveFirst
                strError = "Before Call HotelBooking"
                Set TempResultRS = HotelBooking.Create(HotelReserveRS, strError)
                If strError <> "Reserve OK" Then
                    GoTo Oops
                Else
                    strError = "After Reserve HotelRoom "
                End If
                TempResultRS.MoveFirst
                HotelRoomGroupBookingID = TempResultRS(1)
            
                strError = "Before Call UpdateBookingTable"
            
                RSCreator.AddReserveRSToResultRS TempResultRS, ResultRS, 1, 1, strError
                If strError <> "" Then
                    GoTo Oops
                Else
                    strError = "After Reserve HotelRoom2 "
                End If
               
            Else
                strError = "HotelReserveRS.EOF And HotelReserveRS.BOF" & HotelReserveRS(2).Name
                GoTo Oops
            End If
        End If
        
        '///////////////////////////////////////////////////////////
        '//// ReserveRestaurant
        '///////////////////////////////////////////////////////////
        strError = "ReserveRestaurantCount = " & ReserveRestaurantCount
        If ReserveRestaurantCount <> 0 Then
            strError = " Before If Not (RestaurantReserveRS.EOF And RestaurantReserveRS.BOF) Then"
            If Not (RestaurantReserveRS.EOF And RestaurantReserveRS.BOF) Then
                RestaurantReserveRS.MoveFirst
                strError = "Before Call RestuarantBooking.Create(RestaurantReserveRS, strError)"
                Set TempResultRS = RestuarantBooking.CreateReserve(RestaurantReserveRS, strError)
                If strError <> "Reserve OK" Then
                    GoTo Oops
                Else
                    strError = "After Reserve Restuarant "
                End If
                TempResultRS.MoveFirst
                RestaurantGroupBookingID = TempResultRS(1)
            
                strError = "Before Call UpdateBookingTable"
            
                RSCreator.AddReserveRSToResultRS TempResultRS, ResultRS, 1, 1, strError
                If strError <> "" Then
                    GoTo Oops
                Else
                    strError = "After Reserve HotelRoom2 "
                End If
               
            Else
                strError = "RestaurantReserveRS.EOF And RestaurantReserveRS.BOF"
                GoTo Oops
            End If
        End If
        
        CreatePackageTour PackageID, PackageName, Description, DepartTime, ArriveTime, _
            TotalPrice, BusGroupBookingID, HotelRoomGroupBookingID, AirCreaftSeatGroupBookingID, _
            RestaurantGroupBookingID, AdminID, strError
        If strError <> "" Then
            GoTo Oops
        Else
            strError = "After Call CreatePackageTour "
        End If
            
        SystemLog.Add "Create PackageName : " & PackageName, AdminID
    
        Set Create = ResultRS
        objctx.SetComplete
        strResult = "Complete :" & CStr(TotalElement) & " Elements "
    Exit Function
    
Oops:
    If strError = "" Then
        strResult = "Error At Reserve" & Err.Description & " Set Abort"
        MsgBox Err.Description
    Else
        strResult = strError & "and Set Abort"
        MsgBox strError
        MsgBox Err.Description
    End If
    
    strResult = strResult & TotalElement & Err.Description
    objctx.SetAbort
End Function

Private Sub AddReserveGroupAirSeat(ByVal PackageID As String, ByVal ReserveDetail As String, _
    ByRef strResult As String, ByRef GroupAirSeatReserveRS As ADODB.Recordset)
    
    Dim tmpStr As String
    Dim CurrentStr As String
    Dim strError As String
    
    Dim TotalSeat As Integer
    Dim FlightID As String
    Dim SrcIdx As Integer
    Dim DstIdx As Integer
    Dim DepartDate As String
    Dim ClassType As Integer
    Dim Price As Currency
      
    On Error GoTo Oops
        tmpStr = ReserveDetail
  
        CutStringByChar tmpStr, ",", CurrentStr
        strError = "TotalSeat = " & CurrentStr
        TotalSeat = CInt(CurrentStr)
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "FlightID = " & CurrentStr
        FlightID = CurrentStr
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "SrcIdx = " & CurrentStr
        SrcIdx = CInt(CurrentStr)
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "DstIdx = " & CurrentStr
        DstIdx = CInt(CurrentStr)
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "DepartDate = " & CurrentStr
        DepartDate = CurrentStr
         
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "ClassType = " & CurrentStr
        ClassType = CInt(CurrentStr)
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "NumberOfCoupleBed  = " & CurrentStr
         Price = CCur(CDbl(CurrentStr))
     
        a = "RSCreator.AddGroupAirSeat GroupAirSeatReserveRS, TotalSeat, FlightID, SrcIdx, DstIdx, DepartDate, ClassType, Price"
        RSCreator.AddGroupAirSeat GroupAirSeatReserveRS, OlalaTourAirlineCustomerID, TotalSeat, FlightID, SrcIdx, DstIdx, _
            DepartDate, ClassType, Price, strError
        If strError <> "" Then
            GoTo Oops
        End If
        
        a = "If (GroupAirSeatReserveRS.EOF And GroupAirSeatReserveRS.BOF) Then"
        If (GroupAirSeatReserveRS.EOF And GroupAirSeatReserveRS.BOF) Then
            strError = "Recordset is empty"
            GoTo Oops
        End If
        objctx.SetComplete
        strResult = ""
        'DateOfReserve = BookCheckInTime
    Exit Sub
    
Oops:
    objctx.SetAbort
    MsgBox Err.Description
    If strError = "" Then
        strResult = "Error At AddReserveGroupAirSeat" & Err.Description
    Else
        strResult = strError & Err.Description & a
    End If

End Sub

Private Sub AddReserveBus(ByVal PackageID As String, ByVal ReserveDetail As String, _
    ByRef strResult As String, ByRef BusReserveRS As ADODB.Recordset)
    
    Dim tmpStr As String
    Dim CurrentStr As String
    Dim strError As String
    
    Dim CompanyID As Integer
    Dim ModelID As Integer
    Dim NumOfCoach As Integer
    Dim StartDate As String
    Dim UsingDay As Integer
    
    On Error GoTo Oops
        tmpStr = ReserveDetail
  
        CutStringByChar tmpStr, ",", CurrentStr
        strError = "CompanyID = " & CurrentStr
        CompanyID = CInt(CurrentStr)
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "ModelID = " & CurrentStr
        ModelID = CInt(CurrentStr)
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "NumOfCoach = " & CurrentStr
        NumOfCoach = CInt(CurrentStr)
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "StartDate = " & CurrentStr
        StartDate = CurrentStr
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "UsingDay = " & CurrentStr
        UsingDay = CInt(CurrentStr)
         
        a = "RSCreator.AddBusReserve BusReserveRS, CompanyID, ModelID, NumOfCoach , StartDate , UsingDay"
        RSCreator.AddBusReserve BusReserveRS, CompanyID, ModelID, NumOfCoach, StartDate, UsingDay, strError
        If strError <> "" Then
            MsgBox Err.Description
            GoTo Oops
        End If
        
        a = "If (GroupAirSeatReserveRS.EOF And GroupAirSeatReserveRS.BOF) Then"
        If (BusReserveRS.EOF And BusReserveRS.BOF) Then
            strError = "Recordset is empty"
            GoTo Oops
        End If
        objctx.SetComplete
        strResult = ""
        'DateOfReserve = BookCheckInTime
    Exit Sub
    
Oops:
    objctx.SetAbort
    If strError = "" Then
        strResult = "Error At AddReserveBus " & Err.Description
    Else
        strResult = strError & Err.Description & a
    End If

End Sub

Private Sub AddReserveHotelRoom(ByVal PackageID As String, ByVal ReserveDetail As String, _
    ByRef strResult As String, ByRef HotelReserveRS As ADODB.Recordset)
    
    Dim tmpStr As String
    Dim CurrentStr As String
    Dim strError As String
    
    Dim BookCheckInTime As String
    Dim BookCheckOutTime As String
    Dim HotelID As String
    Dim PricePerDay As Currency
    Dim Description As String
    Dim NumberOfSingleBed As Integer
    Dim NumberOfCoupleBed As Integer
    Dim RoomClass As Integer
    Dim Floor As Integer
    Dim RoomAmount As Integer
    Dim HotelCustID As String
  
    On Error GoTo Oops
        tmpStr = ReserveDetail
  
        CutStringByChar tmpStr, ",", CurrentStr
        strError = "BookCheckInTime = " & CurrentStr
        BookCheckInTime = CurrentStr
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "BookCheckOutTime = " & CurrentStr
        BookCheckOutTime = CurrentStr
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "HotelID = " & CurrentStr
        HotelID = CurrentStr
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "PricePerDay = " & CurrentStr
        PricePerDay = CCur(CDbl(CurrentStr))
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "Description = " & CurrentStr
        Description = CurrentStr
         
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "NumberOfSingleBed = " & CurrentStr
        NumberOfSingleBed = CInt(CurrentStr)
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "NumberOfCoupleBed  = " & CurrentStr
         NumberOfCoupleBed = CInt(CurrentStr)
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "RoomClass = " & CurrentStr
         RoomClass = CInt(CurrentStr)
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "Floor = " & CurrentStr
        Floor = CInt(CurrentStr)
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "RoomAmout = " & CurrentStr
         RoomAmount = CInt(CurrentStr)
        
        a = "Before RSCreator.AddReserveHotelRoomRecordSet HotelReserveRS, BookCheckInTime,BookCheckOutTime, HotelID, PricePerDay, Description, NumberOfSingleBed, NumberOfCoupleBed, RoomClass, Floor, RoomAmount, HotelCustID, strResult"
        RSCreator.AddReserveHotelRoomRecordSet HotelReserveRS, BookCheckInTime, _
            BookCheckOutTime, HotelID, PricePerDay, Description, NumberOfSingleBed, _
            NumberOfCoupleBed, RoomClass, Floor, RoomAmount, OlalaTourHotelCustomerID, strError
        If strError <> "" Then
            'strError = "Error At RSCreator.AddReserveHotelRoomRecordSet HotelReserveRS, BookCheckInTime, BookCheckOutTime, HotelID, PricePerDay, Description, NumberOfSingleBed, NumberOfCoupleBed, RoomClass, Floor, RoomAmount, HotelCustID, strResultRSCreator.AddBusSeatReserve BusReserveRS, RouteID, SrcIdx, DstIdx, DepartTime, Price, strError, TravellerID, SeatType" & Err.Description
            GoTo Oops
        End If
        
        a = "Before If (HotelReserveRS.EOF And HotelReserveRS.BOF) Then"
        If (HotelReserveRS.EOF And HotelReserveRS.BOF) Then
            strError = "Recordset is empty"
            GoTo Oops
        End If
        objctx.SetComplete
        strResult = ""
        'DateOfReserve = BookCheckInTime
    Exit Sub
    
Oops:
    objctx.SetAbort
    If strError = "" Then
        strResult = "Error At AddReserveHotelRoom" & Err.Description
    Else
        strResult = strError & Err.Description & a
    End If

End Sub

Private Sub AddReserveRestaurant(ByVal PackageID As String, ByVal ReserveDetail As String, _
    ByRef strResult As String, ByRef RestuarantReserveRS As ADODB.Recordset)
    
    Dim tmpStr As String
    Dim CurrentStr As String
    Dim strError As String
    
    Dim RestaurantID As String
    Dim Meal As String
    Dim ReserveDate As String
    Dim NoOfReserveSeat As Currency
  
    On Error GoTo Oops
        tmpStr = ReserveDetail
  
        CutStringByChar tmpStr, ",", CurrentStr
        strError = "BookCheckInTime = " & CurrentStr
        RestaurantID = CurrentStr
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "BookCheckOutTime = " & CurrentStr
        Meal = CInt(CurrentStr)
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "HotelID = " & CurrentStr
        ReserveDate = CurrentStr
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "PricePerDay = " & CurrentStr
        NoOfReserveSeat = CInt(CurrentStr)
     
        
        a = "RSCreator.AddReserveRestaurantRecordSet RestuarantReserveRS, RestaurantID, Meal, ReserveDate, NoOfReserveSeat, OlalaTourRestaurantCustomerID, strError"
        RSCreator.AddReserveRestaurantRecordSet RestuarantReserveRS, _
            RestaurantID, Meal, ReserveDate, NoOfReserveSeat, OlalaTourRestaurantCustomerID, strError
        If strError <> "" Then
            GoTo Oops
        End If
        
        a = "If (RestuarantReserveRS.EOF And RestuarantReserveRS.BOF) Then"
        If (RestuarantReserveRS.EOF And RestuarantReserveRS.BOF) Then
            strError = "Recordset is empty"
            GoTo Oops
        End If
        objctx.SetComplete
        strResult = ""
    Exit Sub
    
Oops:
    objctx.SetAbort
    If strError = "" Then
        strResult = "Error At AddReserveRestaurant" & Err.Description
    Else
        strResult = strError & Err.Description & a
    End If

End Sub

Private Sub AddPlace(ByVal PackageID As String, ByVal ReserveDetail As String, _
    ByRef strResult As String)
    
    Dim PlaceID As String
    Dim ArriveTime As String
    Dim DepartTime As String
    Dim AddResult As Integer
    
    Dim tmpStr As String
    Dim strError As String
    Dim CurrentStr As String
    
    On Error GoTo Oops:
        tmpStr = ReserveDetail
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "BookCheckOutTime = " & CurrentStr
        PlaceID = CurrentStr
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "HotelID = " & CurrentStr
        ArriveTime = CurrentStr
     
        CutStringByChar tmpStr, ",", CurrentStr
        strError = strError & "PricePerDay = " & CurrentStr
        DepartTime = CurrentStr
        
        AddResult = PlaceManager.Add(PackageID, PlaceID, ArriveTime, DepartTime)
        If AddResult = 0 Then
            GoTo Oops
        End If
        strResult = ""
        objctx.SetComplete
        Exit Sub
Oops:
    strResult = "Cannot Add Place " & PlaceID & "ErrorMessage : " & Err.Description
    objctx.SetAbort
End Sub

Private Sub CreatePackageTour(ByVal PackageID As String, ByVal PackageName As String, _
    ByVal Description As String, ByVal DepartTime As String, ByVal ArriveTime As String, _
    ByVal TotalPrice As Currency, ByVal BusGroupBookingID As String, _
    ByVal HotelRoomGroupBookingID As String, ByVal AirCreaftSeatGroupBookingID As String, _
    ByVal RestaurantGroupBookingID As String, ByVal AdminID As String, ByRef strResult As String)
           
    Dim strError As String
    Dim SQLCmd As String
    Dim CurrentTime As String
  
  On Error GoTo Oops:
  
    CurrentTime = Now
    SQLCmd = "INSERT INTO PackageTour VALUES('" & PackageID & "', '" & _
        PackageName & "', '" & Description & "', '" & DepartTime & "', '" & ArriveTime & "', " & _
        TotalPrice & ", 0, '" & BusGroupBookingID & "', '" & HotelRoomGroupBookingID & "', '" & _
        AirCreaftSeatGroupBookingID & "', '" & RestaurantGroupBookingID & "', '" & _
        AdminID & "', '" & CurrentTime & "')"
    strError = SQLCmd
    dbConnector.ExecSQLCmd SQLCmd
    objctx.SetComplete
    strResult = ""
     
  Exit Sub
Oops:
  objctx.SetAbort
  
  If strError <> "" Then
    strResult = "Error at OlalaAgencyView.UpdateBooking  " & vbCrLf _
      & "SQLCmd = " & strError & Err.Description
  Else
    strResult = "Error While Execute SQLCmd :" & vbCrLf & _
      SQLCmd
  End If
End Sub

Public Function ViewAllPackage(ByRef strResult As String) As ADODB.Recordset
    Dim SQLCmd As String
    Dim MyRecordSet As ADODB.Recordset
    Set MyRecordSet = New ADODB.Recordset
    SQLCmd = "SELECT PackageID, PackageName, Description, DepartTime, ArriveTime, TotalPrice, " & _
        "Confirmed, AdminID, CreateTime FROM PackageTour"
    Set MyRecordSet = dbConnector.QueryCmd(SQLCmd)
    
    If (MyRecordSet.EOF And MyRecordSet.BOF) Then
        strResult = "Not Found"
    Else
        strResult = ""
    End If
    Set ViewAllPackage = MyRecordSet
End Function

Public Function ViewGroupBookingID(ByVal PackageID As String, ByRef strResult As String) As ADODB.Recordset
    Dim SQLCmd As String
    Dim MyRecordSet As ADODB.Recordset
    Set MyRecordSet = New ADODB.Recordset
    SQLCmd = "SELECT AircraftTicketGroupBookingID, BusGroupBookingID, HotelGroupBooking,  " & _
        " RestaurantGroupBookingID FROM PackageTour " & _
        "WHERE PackageID = '" & PackageID & "'"
    Set MyRecordSet = dbConnector.QueryCmd(SQLCmd)
    
    If (MyRecordSet.EOF And MyRecordSet.BOF) Then
        strResult = "Not Found"
    Else
        strResult = ""
    End If
    Set ViewGroupBookingID = MyRecordSet
End Function

Public Function ViewReserveHotelRoomForPackageTour(ByVal BookingID As String, ByRef strResult As String) As ADODB.Recordset
    Dim strError As String
    Dim MyRecordSet As ADODB.Recordset
    Set MyRecordSet = HotelBooking.ViewBooking(BookingID)
    If (MyRecordSet.EOF And MyRecordSet.BOF) Then
        strResult = "Error"
    Else
        strResult = ""
    End If
    Set ViewReserveHotelRoomForPackageTour = MyRecordSet
End Function

Public Function ViewReserveRestaurantForPackageTour(ByVal BookingID As String, ByRef strResult As String) As ADODB.Recordset
    Dim strError As String
    Dim MyRecordSet As ADODB.Recordset
    Set MyRecordSet = RestuarantBooking.ViewBooking(BookingID)
    If (MyRecordSet.EOF And MyRecordSet.BOF) Then
        strResult = "Error"
    Else
        strResult = ""
    End If
    Set ViewReserveRestaurantForPackageTour = MyRecordSet
End Function

Public Function ViewPackagePlace(ByVal PackageID As String, ByRef strResult As String) As ADODB.Recordset
    Dim SQLCmd As String
    Dim MyRecordSet As ADODB.Recordset
    Set MyRecordSet = New ADODB.Recordset
    SQLCmd = "SELECT P.PlaceName, P.Country, P.State, P.Province, P.Description " & _
        "FROM Place P, PackagePlace PP " & _
        "WHERE PP.PackageID = '" & PackageID & "' AND " & _
        "PP.PlaceID = P.PlaceID"
    Set MyRecordSet = dbConnector.QueryCmd(SQLCmd)
    
    If (MyRecordSet.EOF And MyRecordSet.BOF) Then
        strResult = "Not Found"
    Else
        strResult = ""
    End If
    Set ViewPackagePlace = MyRecordSet
End Function

Public Function Confirm(ByVal PackageID As String, ByRef strResult As String) As Currency
    
End Function
