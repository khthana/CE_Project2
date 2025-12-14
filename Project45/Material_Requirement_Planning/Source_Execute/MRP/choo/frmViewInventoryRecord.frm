VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Begin VB.Form frmViewInventoryRecord 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Calculating Inventory Record"
   ClientHeight    =   7935
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   6015
   Icon            =   "frmViewInventoryRecord.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   7935
   ScaleWidth      =   6015
   WindowState     =   2  'Maximized
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
      Height          =   7455
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   13150
      _Version        =   393216
      Cols            =   5
      BackColorBkg    =   12632256
      Appearance      =   0
      RowSizingMode   =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _NumberOfBands  =   2
      _Band(0).Cols   =   3
      _Band(0).GridLinesBand=   1
      _Band(0).TextStyleBand=   0
      _Band(0).TextStyleHeader=   0
      _Band(0)._NumMapCols=   2
      _Band(0)._MapCol(0)._Name=   "ItemID"
      _Band(0)._MapCol(0)._RSIndex=   0
      _Band(0)._MapCol(0)._Alignment=   7
      _Band(0)._MapCol(1)._Name=   "ItemName"
      _Band(0)._MapCol(1)._RSIndex=   1
      _Band(1).BandIndent=   1
      _Band(1).Cols   =   2
      _Band(1).GridLinesBand=   1
      _Band(1).TextStyleBand=   0
      _Band(1).TextStyleHeader=   0
      _Band(1)._ParentBand=   0
      _Band(1)._NumMapCols=   5
      _Band(1)._MapCol(0)._Name=   "ช่วงเวลา"
      _Band(1)._MapCol(0)._RSIndex=   0
      _Band(1)._MapCol(0)._Alignment=   7
      _Band(1)._MapCol(0)._Hidden=   -1  'True
      _Band(1)._MapCol(1)._Name=   "วันสั่งผลิต"
      _Band(1)._MapCol(1)._RSIndex=   1
      _Band(1)._MapCol(2)._Name=   "ItemID"
      _Band(1)._MapCol(2)._RSIndex=   2
      _Band(1)._MapCol(2)._Alignment=   7
      _Band(1)._MapCol(2)._Hidden=   -1  'True
      _Band(1)._MapCol(3)._Name=   "ItemName"
      _Band(1)._MapCol(3)._RSIndex=   3
      _Band(1)._MapCol(3)._Hidden=   -1  'True
      _Band(1)._MapCol(4)._Name=   "จำนวนที่ผลิต"
      _Band(1)._MapCol(4)._RSIndex=   4
      _Band(1)._MapCol(4)._Alignment=   7
   End
End
Attribute VB_Name = "frmViewInventoryRecord"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim intLowestLevel As Integer
Dim intMaxLowestLevel As Integer
Dim lngDateNew(52) As Long
Dim intDayNextYear(12) As Integer
Dim intDay(12)  As Integer
Dim lngStartDate As Long
Dim strDate(52) As String



Private Sub Form_Load()
  
  On Error GoTo HaveError

  'DataEnvironment1.BOMConnection.Close
  If DataEnvironment1.BOMConnection.State = adStateOpen Then
    DataEnvironment1.BOMConnection.Close
    DataEnvironment1.BOMConnection.Open
  End If
  If DataEnvironment1.BOMConnection.State = adStateClosed Then
    DataEnvironment1.BOMConnection.Open
End If
'FindDate
'AddMasterSchedule

  DataEnvironment1.rsFindMaxLowestLevel.Open
'  If DataEnvironment1.rsFindMaxLowestLevel.EOF Then
'If DataEnvironment1.rsFindMaxLowestLevel.Fields("MaxLowestLevel").Value Then
'If MsgBox("ยังไม่มีการสั่งซื้อจึงยังไม่มีการผลิต", vbOKCancel, "Error!") = vbOK Then
'    frmPurchase.Caption = "Purchase"
'    Load frmPurchase
'    frmPurchase.Show
'    Unload frmViewInventoryRecord
'  End If
'    End If
  intMaxLowestLevel = DataEnvironment1.rsFindMaxLowestLevel.Fields("MaxLowestLevel").Value
  DataEnvironment1.rsFindMaxLowestLevel.Close
   
  For intLowestLevel = 0 To intMaxLowestLevel
    
    If intLowestLevel = 0 Then
        initial
        UpdateOnhand
        lngStartDate = Year(Date) * 10000 + Month(Date) * 100 + Day(Date)
        DataEnvironment1.ClearInventoryRecord lngStartDate

    End If
      
    statement1
    statement2
    statement3
    statement4
  
  Next
  
  DataEnvironment1.ShowItemID_ItemName lngDateNew(1)

'  DataEnvironment1.rsShowItemID_ItemName.Close
'  DataEnvironment1.rsShowItemID_ItemName.Open
 
  MSHFlexGrid1.ColWidth(0) = 300
  MSHFlexGrid1.ColWidth(4) = 800
  MSHFlexGrid1.ColWidth(5) = 800
  MSHFlexGrid1.ColWidth(0, 1) = 1000
  MSHFlexGrid1.ColWidth(1, 1) = 1300
  MSHFlexGrid1.ColWidth(2, 1) = 1100
  MSHFlexGrid1.Width = 6000
  MSHFlexGrid1.Height = 8800
  
  Set MSHFlexGrid1.DataSource = DataEnvironment1.rsShowItemID_ItemName
  DataEnvironment1.rsShowItemID_ItemName.Close
  MSHFlexGrid1.CollapseAll
  frmViewInventoryRecord.Caption = "Calculation Complete"
  
  Exit Sub
HaveError:
  MsgBox "Error Number: " & Err & " " & Error, vbOKOnly
End Sub

Private Sub UpdateOnhand()
    Dim i, intNoOfRecord As Integer
    Dim intItemID() As Integer
    Dim intPEI As Integer
    Dim intAllocatedQuantities As Integer
    Dim intSafetyStock As Integer
    Dim intOnHand As Integer
    Dim lngYear, lngMonth, lngDay, lngDate As Long
    Dim blnStartDate As Boolean
    
    lngYear = Year(Date)
    lngMonth = Month(Date)
    lngDay = Day(Date)
   Do While blnStartDate = False
        
        If Weekday(DateSerial(lngYear, lngMonth, lngDay)) = 2 Then
            blnStartDate = True
        Else
            If lngDay = 1 Then
                If lngMonth = 1 Then
                    lngYear = lngYear - 1
                    lngMonth = 12
                    lngDay = 31
                Else
                    lngMonth = lngMonth - 1
                    lngDay = intDay(lngMonth)
                End If
            Else
                lngDay = lngDay - 1
            End If
        End If
            
    Loop
    
    lngDate = lngYear * 10000 + lngMonth * 100 + lngDay
    
    DataEnvironment1.rsSelectItemIDInventoryRecord.Open
     intNoOfRecord = DataEnvironment1.rsSelectItemIDInventoryRecord.RecordCount
    ReDim intItemID(intNoOfRecord) As Integer
     DataEnvironment1.rsSelectItemIDInventoryRecord.MoveFirst
     
     For i = 1 To intNoOfRecord
        intItemID(i) = DataEnvironment1.rsSelectItemIDInventoryRecord.Fields("ItemID").Value
        DataEnvironment1.rsSelectItemIDInventoryRecord.MoveNext
    Next
    
    For i = 1 To intNoOfRecord
        DataEnvironment1.SelectAllocated_Safety intItemID(i)
        DataEnvironment1.SelectForUpdateOnhand intItemID(i), lngDate
        intAllocatedQuantities = DataEnvironment1.rsSelectAllocated_Safety.Fields("AllocatedQuantities").Value
        intSafetyStock = DataEnvironment1.rsSelectAllocated_Safety.Fields("SafetyStock").Value
        If Not DataEnvironment1.rsSelectForUpdateOnhand.EOF Then
            intPEI = DataEnvironment1.rsSelectForUpdateOnhand.Fields("PEI").Value
            intOnHand = intPEI + intAllocatedQuantities + intSafetyStock
            DataEnvironment1.UpdateOnhand intOnHand, intItemID(i)
        
            
        End If
      
'        DataEnvironment1.UpdateOnhand intOnHand, intItemID(i)
        
        DataEnvironment1.rsSelectAllocated_Safety.Close
        DataEnvironment1.rsSelectForUpdateOnhand.Close
    Next
        
End Sub
Private Sub initial()

Dim strDate(52) As String
Dim i, j, k As Integer
Dim intYear, intYearBuda As Integer
Dim strYear, strMonth, strDay As String
Dim intNumberOfItem, intItemID As Integer
Dim strItemName As String

Dim blnTmp1(52) As Boolean
Dim intNextYear As Integer
Dim lngYearNew, lngMonthNew, lngDayNew As Long

    For i = 1 To 12
        Select Case i
            Case 1
                intDay(1) = 31
            Case 2
                intYear = Year(Date)
                If intYear Mod 4 = 0 Then
                    intDay(2) = 29
                Else
                    intDay(2) = 28
                End If
            Case 3
                intDay(3) = 31
            Case 4
                intDay(4) = 30
            Case 5
                intDay(5) = 31
            Case 6
                intDay(6) = 30
            Case 7
                intDay(7) = 31
            Case 8
                intDay(8) = 31
            Case 9
                intDay(9) = 30
            Case 10
                intDay(10) = 31
            Case 11
                intDay(11) = 30
            Case 12
                intDay(12) = 31
        End Select
    Next
    
    For i = 1 To 12
        Select Case i
            Case 1
                intDayNextYear(1) = 31
            Case 2
                intNextYear = Year(Date) + 1
                If intNextYear Mod 4 = 0 Then
                    intDayNextYear(2) = 29
                Else
                    intDayNextYear(2) = 28
                End If
            Case 3
                intDayNextYear(3) = 31
            Case 4
                intDayNextYear(4) = 30
            Case 5
                intDayNextYear(5) = 31
            Case 6
                intDayNextYear(6) = 30
            Case 7
                intDayNextYear(7) = 31
            Case 8
                intDayNextYear(8) = 31
            Case 9
                intDayNextYear(9) = 30
            Case 10
                intDayNextYear(10) = 31
            Case 11
                intDayNextYear(11) = 30
            Case 12
                intDayNextYear(12) = 31
        End Select
    Next
    intYear = Year(Date)
    lngYearNew = intYear * 10000
   
    strYear = Str(intYear)
    k = 1
    j = Day(Date) + 1
    
    Do While k <= 52
        For i = Month(Date) To 12
            lngMonthNew = i * 100
            strMonth = Str(i)
            Do While j <= intDay(i)
                
                If Weekday(DateSerial(intYear, i, j)) = 2 Then
                    lngDayNew = j
                    strDay = Str(j)
                    strDate(k) = strDay & "/" & strMonth & "/" & strYear
                    lngDateNew(k) = lngYearNew + lngMonthNew + lngDayNew
                    If k < 52 Then
                        k = k + 1
                    Else
                        GoTo nextStatement
                    End If
            
                End If
                
                 j = j + 1
                             
            Loop
             j = 1
        Next
        
        intYear = Year(Date) + 1
        lngYearNew = intYear * 10000
        strYear = Str(intYear)
        For i = 1 To 12
            lngMonthNew = i * 100
            strMonth = Str(i)
            For j = 1 To intDayNextYear(i)
                If Weekday(DateSerial(intYear, i, j)) = 2 Then
                    lngDayNew = j
                    lngDateNew(k) = lngYearNew + lngMonthNew + lngDayNew
                    strDay = Str(j)
                    strDate(k) = strDay & "/" & strMonth & "/" & strYear
                
                    If k < 52 Then
                        k = k + 1
                    Else
                        GoTo nextStatement
                    End If
            
                End If
            Next
        Next
                
    Loop
    
nextStatement:
    
    DataEnvironment1.rsSelectItemID_ItemName.Open
    DataEnvironment1.rsSelectItemID_ItemName.MoveFirst
    intNumberOfItem = DataEnvironment1.rsSelectItemID_ItemName.RecordCount
    DataEnvironment1.rsSelectItemID_ItemName.MoveFirst
    
    For j = 1 To 52
        'DataEnvironment1.rsSelectForCheckIntervalDate.Close
        'DataEnvironment1.rsSelectForCheckIntervalDate.Open
        DataEnvironment1.SelectForCheckIntervalDate strDate(53 - j)
        If DataEnvironment1.rsSelectForCheckIntervalDate.EOF Then
            blnTmp1(53 - j) = True
        Else
            blnTmp1(53 - j) = False
        End If
        DataEnvironment1.rsSelectForCheckIntervalDate.Close
    Next
    
    For i = 1 To intNumberOfItem
        
        intItemID = DataEnvironment1.rsSelectItemID_ItemName.Fields("ItemID").Value
        strItemName = DataEnvironment1.rsSelectItemID_ItemName.Fields("ItemName").Value
        For j = 1 To 52
               
            If blnTmp1(j) Then
            
                DataEnvironment1.InsertInitialInventoryRecord strDate(j), intItemID, strItemName, lngDateNew(j)
            Else
                
                DataEnvironment1.CheckNewItemID intItemID, lngDateNew(j)
                If DataEnvironment1.rsCheckNewItemID.EOF Then
                    DataEnvironment1.InsertInitialInventoryRecord strDate(j), intItemID, strItemName, lngDateNew(j)
                    DataEnvironment1.rsCheckNewItemID.Close
                Else
                    DataEnvironment1.rsCheckNewItemID.Close
                End If
            End If
            
        Next
        
        DataEnvironment1.rsSelectItemID_ItemName.MoveNext
        DataEnvironment1.CheckItemID_ItemName intItemID
        If Not DataEnvironment1.rsCheckItemID_ItemName.EOF Then
            
            If strItemName <> DataEnvironment1.rsCheckItemID_ItemName.Fields("ItemName").Value Then
                DataEnvironment1.UpdateItemName strItemName, lngDateNew(1), intItemID
            End If
            DataEnvironment1.rsCheckItemID_ItemName.Close
        End If
        
    Next
    
    DataEnvironment1.rsSelectItemID_ItemName.Close
    
End Sub

Private Sub statement1()   'Load GR From Master Schedule
    
    If intLowestLevel = 0 Then

        DataEnvironment1.UpdateInventoryRecord1
        
    End If
    
End Sub

Private Sub statement2()
    
    Dim intIndex, i, j As Integer
    Dim intGR, intSR, intAI, intNR, intAIOld, intPOR, intAINew As Integer
    Dim intOnHand, intSafetyStock, intAllocatedQuantities As Integer
    Dim intGROld, intBIOld, intSROld, intBI As Integer
    Dim intPEI, intPEIOld, intPEIFirst As Integer
    Dim intLotSize, intTmp1, intIncrease, intFutureSR As Integer
    Dim blnFutureSR As Boolean
    Dim intPORForPEI As Integer
    Dim intBIFuture As Integer
    
    'DataEnvironment1.BOMConnection.Close
    'DataEnvironment1.BOMConnection.Open
    
    intIndex = 0
    intGR = 0
    intSR = 0
    intAI = 0
    intNR = 0
    intAIOld = 0
    intPOR = 0
    intAINew = 0
    intOnHand = 0
    intSafetyStock = 0
    intAllocatedQuantities = 0
    intGROld = 0
    intBIOld = 0
    intSROld = 0
    intBI = 0
    intPEI = 0
    intPEIOld = 0
    intPEIFirst = 0
    blnFutureSR = False
    
    DataEnvironment1.selectItemID intLowestLevel
    'DataEnvironment1.CountItemID intLowestLevel
    intIndex = DataEnvironment1.rsselectItemID.RecordCount
    
    Dim intItemID() As Integer
    ReDim intItemID(intIndex) As Integer
    DataEnvironment1.rsselectItemID.MoveFirst
    
    For i = 1 To intIndex
        intItemID(i) = DataEnvironment1.rsselectItemID.Fields("ItemID").Value
        DataEnvironment1.rsselectItemID.MoveNext
    Next
    
    For i = 1 To intIndex

        DataEnvironment1.selectGR_SR_AI intItemID(i), lngDateNew(1)
        DataEnvironment1.rsselectGR_SR_AI.MoveFirst
        'DataEnvironment1.selectInitialAI intItemID(i)
        
        'intAIOld = intMaterialInStock - intSpareMaterial - intAssignedMaterial
        
        For j = 1 To 52
            
            If j = 1 Then
                DataEnvironment1.SelectOnhand_SafetyStock intItemID(i)
                intOnHand = DataEnvironment1.rsSelectOnhand_SafetyStock.Fields("OnHand").Value
                intSafetyStock = DataEnvironment1.rsSelectOnhand_SafetyStock.Fields("SafetyStock").Value
                intAllocatedQuantities = DataEnvironment1.rsSelectOnhand_SafetyStock.Fields("AllocatedQuantities").Value
                intBI = intOnHand - intSafetyStock - intAllocatedQuantities
                If intBI < 0 Then
                    intBI = 0
                End If
                intBIOld = intBI
                intGR = DataEnvironment1.rsselectGR_SR_AI.Fields("GR").Value
                If blnFutureSR = True Then
                    intSR = intFutureSR
                    blnFutureSR = False
                Else
                    intSR = DataEnvironment1.rsselectGR_SR_AI.Fields("SR").Value
                End If
                intGROld = intGR
                intSROld = intSR
                intAINew = intBI + intSR
                intNR = intGR - intAINew
            
                If intNR < 0 Then
                    intNR = 0
                    intPOR = 0
                Else
                    intPOR = intNR
                End If
                
                DataEnvironment1.SelectLotSize intItemID(i)
                intLotSize = DataEnvironment1.rsSelectLotSize.Fields("LotSize").Value
                DataEnvironment1.rsSelectLotSize.Close
                If intPOR > 0 And intPOR < intLotSize Then
                    
                    intPOR = intLotSize
                    
                End If
                
                
'                If intPOR > 0 Then
'                    DataEnvironment1.SelectLotSize intItemID(i)
'                    intLotSize = DataEnvironment1.rsSelectLotSize.Fields("LotSize").Value
'                    DataEnvironment1.rsSelectLotSize.Close
'                    intTmp1 = intPOR Mod intLotSize
'                    If intTmp1 > 0 Then
'                        intIncrease = intLotSize - intTmp1
'                    Else
'                        intIncrease = 0
'                    End If
'                    intPOR = intPOR + intIncrease
'                    If j < 52 Then
'                        DataEnvironment1.SelectSRFuture intItemID(i), lngDateNew(j + 1)
'                        intFutureSR = DataEnvironment1.rsSelectSRFuture.Fields("SR").Value
'                        intFutureSR = intFutureSR + intIncrease
'                        DataEnvironment1.rsSelectSRFuture.Close
'                    End If
'
'                    If j < 52 Then
'                        DataEnvironment1.updateSRF intFutureSR, intItemID(i), lngDateNew(j + 1)
'                    End If
'                    blnFutureSR = True
'                End If
                intPEIFirst = intOnHand - intSafetyStock - intAllocatedQuantities
                intPEI = intPOR + intSR + intPEIFirst - intGR
                intPEIOld = intPEI
                
                DataEnvironment1.UpdateNR_POR_AI intNR, intPOR, intAINew, intBI, intPEI, intItemID(i), lngDateNew(j)
                'intAIOld = intAINew
                DataEnvironment1.rsselectGR_SR_AI.MoveNext
                DataEnvironment1.rsSelectOnhand_SafetyStock.Close
            
            Else
                intGR = DataEnvironment1.rsselectGR_SR_AI.Fields("GR").Value
                If blnFutureSR = True Then
                    intSR = intFutureSR
                    blnFutureSR = False
                Else
                    intSR = DataEnvironment1.rsselectGR_SR_AI.Fields("SR").Value
                End If
                intBI = intBIFuture
                'intBI = intBIOld - intGROld + intSROld
                If intBI < 0 Then
                    intBI = 0
                End If
                intAINew = intBI + intSR
                intNR = intGR - intAINew
            
                If intNR < 0 Then
                    intNR = 0
                    intPOR = 0
                Else
                    intPOR = intNR
                End If
                
                DataEnvironment1.SelectLotSize intItemID(i)
                intLotSize = DataEnvironment1.rsSelectLotSize.Fields("LotSize").Value
                DataEnvironment1.rsSelectLotSize.Close
                If intPOR > 0 And intPOR < intLotSize Then
                    
                    intPOR = intLotSize
                    
                End If
'                DataEnvironment1.SelectLotSize intItemID(i)
'                intLotSize = DataEnvironment1.rsSelectLotSize.Fields("LotSize").Value
'                DataEnvironment1.rsSelectLotSize.Close
'                If intPOR > 0 And intPOR Mod intLotSize <> 0 Then
'
'                    intTmp1 = intPOR Mod intLotSize
'                    intIncrease = intLotSize - intTmp1
'
'                    intPOR = intPOR + intIncrease
'                    If j < 52 Then
'                        DataEnvironment1.SelectSRFuture intItemID(i), lngDateNew(j + 1)
'                        intFutureSR = DataEnvironment1.rsSelectSRFuture.Fields("SR").Value
'                        intFutureSR = intFutureSR + intIncrease
'                        DataEnvironment1.rsSelectSRFuture.Close
'                    End If
'
''                    If j < 52 Then
''                        DataEnvironment1.updateSRF intFutureSR, intItemID(i), lngDateNew(j + 1)
''                    End If
''                    blnFutureSR = True
'                End If
                
                
                intPEI = intPOR + intSR + intPEIOld - intGR
                intPEIOld = intPEI
                intBIFuture = intPEI
                
                DataEnvironment1.UpdateNR_POR_AI intNR, intPOR, intAINew, intBI, intPEI, intItemID(i), lngDateNew(j)
                'intAIOld = intAINew
                DataEnvironment1.rsselectGR_SR_AI.MoveNext
'                DataEnvironment1.rsselectGR_SR_AI.Fields("SR").Value = intFutureSR
                intBIOld = intBI
                intGROld = intGR
                intSROld = intSR
            End If
            'DataEnvironment1.rsSelectLotSize.Close
        Next
        
        DataEnvironment1.rsselectGR_SR_AI.Close
        
    Next
    
    DataEnvironment1.rsselectItemID.Close
    'DataEnvironment1.rsCountItemID.Close
            
End Sub

Private Sub statement3()
    Dim intIndex, i, j, intLotSize As Integer
    Dim intPOR, intPREL, intLeadTime, intCriteria As Integer
    Dim strCriteria, userCriteria As String
    
    intIndex = 0
    intPOR = 0
    intPREL = 0
    intLeadTime = 0
    intCriteria = 0
    strCriteria = ""
    userCriteria = ""
    
    DataEnvironment1.selectItemID intLowestLevel
    'DataEnvironment1.CountItemID intLowestLevel
    intIndex = DataEnvironment1.rsselectItemID.RecordCount
    
    Dim intItemID() As Integer
    ReDim intItemID(intIndex) As Integer
    DataEnvironment1.rsselectItemID.MoveFirst
    
    For i = 1 To intIndex
       
        intItemID(i) = DataEnvironment1.rsselectItemID.Fields("ItemID").Value
        DataEnvironment1.rsselectItemID.MoveNext
    Next
    
    For i = 1 To intIndex

        DataEnvironment1.SelectPOR intItemID(i), lngDateNew(1)
        DataEnvironment1.SelectLeadTime intItemID(i)
        intLeadTime = DataEnvironment1.rsSelectLeadTime.Fields("LeadTime").Value
        
        For j = 1 To 52 - intLeadTime
            
            intCriteria = intLeadTime + j
            strCriteria = Str(lngDateNew(intCriteria))
            userCriteria = "intDate like '" & strCriteria & "'"
            DataEnvironment1.rsSelectPOR.MoveFirst
            DataEnvironment1.rsSelectPOR.Find userCriteria, , adSearchForward
            
            If Not DataEnvironment1.rsSelectPOR.EOF Then
                
                intPREL = DataEnvironment1.rsSelectPOR.Fields("POR").Value
'                DataEnvironment1.SelectLotSize intItemID(i)
'                intLotSize = DataEnvironment1.rsSelectLotSize.Fields("LotSize").Value
'
'                intTemp1 = intPREL Mod intLotSize
                
                
                
                DataEnvironment1.UpdatePREL intPREL, intItemID(i), lngDateNew(j)

            End If
'            DataEnvironment1.rsSelectLotSize.Close
        Next
        DataEnvironment1.rsSelectPOR.Close
        DataEnvironment1.rsSelectLeadTime.Close

    Next
    DataEnvironment1.rsselectItemID.Close
    'DataEnvironment1.rsCountItemID.Close
            
    
End Sub

Private Sub statement4() ' fill New GR OF Child Module
     
    Dim intModuleID, intBOMID, i, j, intIndex As Integer
    Dim intChildItemID, intChildUnit, intGRChild, intNumberOfChildren As Integer
    Dim intPREL, intIncrease As Integer
    
    intModuleID = 0
    intBOMID = 0
    intIndex = 0
    intChildItemID = 0
    intChildUnit = 0
    intGRChild = 0
    intNumberOfChildren = 0
    intPREL = 0
    intIncrease = 0
    
    If intLowestLevel <> intMaxLowestLevel Then
    
        DataEnvironment1.selectItemID intLowestLevel
        'DataEnvironment1.CountItemID intLowestLevel
        intIndex = DataEnvironment1.rsselectItemID.RecordCount
    
        Dim intItemID() As Integer
        ReDim intItemID(intIndex) As Integer
        DataEnvironment1.rsselectItemID.MoveFirst
    
        For i = 1 To intIndex
            intItemID(i) = DataEnvironment1.rsselectItemID.Fields("ItemID").Value
            DataEnvironment1.rsselectItemID.MoveNext
        Next
        
        For i = 1 To intIndex
            DataEnvironment1.SelectBOMID_ModuleID intItemID(i)
            DataEnvironment1.rsSelectBOMID_ModuleID.MoveFirst
            
            intModuleID = DataEnvironment1.rsSelectBOMID_ModuleID.Fields("ModuleID").Value
            intBOMID = DataEnvironment1.rsSelectBOMID_ModuleID.Fields("BOMID").Value
            
            DataEnvironment1.SelectItemID_UnitChildren intBOMID, intModuleID
            If Not DataEnvironment1.rsSelectItemID_UnitChildren.EOF Then
                DataEnvironment1.rsSelectItemID_UnitChildren.MoveFirst
            End If
                
            Do While Not DataEnvironment1.rsSelectItemID_UnitChildren.EOF
                
                intChildUnit = DataEnvironment1.rsSelectItemID_UnitChildren.Fields("Unit").Value
                intChildItemID = DataEnvironment1.rsSelectItemID_UnitChildren.Fields("ItemID").Value
                
                For j = 1 To 52
                
                    DataEnvironment1.SelectGRForUpdate intChildItemID, lngDateNew(j)
                    intGRChild = DataEnvironment1.rsSelectGRForUpdate.Fields("GR").Value
                    DataEnvironment1.SelectPREL intItemID(i), lngDateNew(j)
                    intPREL = DataEnvironment1.rsSelectPREL.Fields("PREL").Value
                    intIncrease = intChildUnit * intPREL
                    
                    intGRChild = intGRChild + intIncrease
                    
                    DataEnvironment1.UpdateGRChildren intGRChild, intChildItemID, lngDateNew(j)
                    
                    DataEnvironment1.rsSelectGRForUpdate.Close
                    DataEnvironment1.rsSelectPREL.Close
            
                Next
                
                DataEnvironment1.rsSelectItemID_UnitChildren.MoveNext
            Loop
            
            DataEnvironment1.rsSelectItemID_UnitChildren.Close
            DataEnvironment1.rsSelectBOMID_ModuleID.Close
            
        Next
        
        DataEnvironment1.rsselectItemID.Close
        'DataEnvironment1.rsCountItemID.Close
           
    End If
    
End Sub



Private Sub Form_Terminate()
    Unload frmViewInventoryRecord
    DataEnvironment1.BOMConnection.Close
    With DataEnvironment1
    If .rsCheck1.State = adStateOpen Then
        .rsCheck1.Close
    End If
    
    If .rsCheckInventoryRecord.State = adStateOpen Then
        .rsCheckInventoryRecord.Close
    End If
    If .rsCheckItemID_ItemName.State = adStateOpen Then
        .rsCheckItemID_ItemName.Close
    End If
    If .rsCheckMasterSchedule.State = adStateOpen Then
        .rsCheckMasterSchedule.Close
    End If
    If .rsCheckNewItemID.State = adStateOpen Then
        .rsCheckNewItemID.Close
    End If
    If .rsCountItemID.State = adStateOpen Then
        .rsCountItemID.Close
    End If
    If .rsFindMaxLowestLevel.State = adStateOpen Then
        .rsFindMaxLowestLevel.Close
    End If
    If .rsFindNoOfBOM.State = adStateOpen Then
        .rsFindNoOfBOM.Close
    End If
    If .rsListAllBom.State = adStateOpen Then
        .rsListAllBom.Close
    End If
    If .rsRowOfMasterSchedule.State = adStateOpen Then
        .rsRowOfMasterSchedule.Close
    End If
    If .rsSelectAllFinishGoods.State = adStateOpen Then
        .rsSelectAllFinishGoods.Close
    End If
    If .rsSelectAllocated_Safety.State = adStateOpen Then
        .rsSelectAllocated_Safety.Close
    End If
    If .rsSelectBOMID_ModuleID.State = adStateOpen Then
        .rsSelectBOMID_ModuleID.Close
    End If
    If .rsSelectCriticalPath.State = adStateOpen Then
        .rsSelectCriticalPath.Close
    End If
    If .rsSelectCusOrderDetail.State = adStateOpen Then
        .rsSelectCusOrderDetail.Close
    End If
    If .rsSelectCusOrderID.State = adStateOpen Then
        .rsSelectCusOrderID.Close
    End If
    If .rsSelectForCheckIntervalDate.State = adStateOpen Then
        .rsSelectForCheckIntervalDate.Close
    End If
    If .rsSelectForUpdateOnhand.State = adStateOpen Then
        .rsSelectForUpdateOnhand.Close
    End If
    If .rsselectGR_SR_AI.State = adStateOpen Then
        .rsselectGR_SR_AI.Close
    End If
    If .rsSelectGRForUpdate.State = adStateOpen Then
        .rsSelectGRForUpdate.Close
    End If
    If .rsselectInitialAI.State = adStateOpen Then
        .rsselectInitialAI.Close
    End If
    If .rsselectItemID.State = adStateOpen Then
        .rsselectItemID.Close
    End If
    If .rsSelectItemID_ItemName.State = adStateOpen Then
        .rsSelectItemID_ItemName.Close
    End If
    If .rsSelectItemID_UnitChildren.State = adStateOpen Then
        .rsSelectItemID_UnitChildren.Close
    End If
    If .rsSelectItemIDInventoryRecord.State = adStateOpen Then
        .rsSelectItemIDInventoryRecord.Close
    End If
    If .rsSelectLeadTime.State = adStateOpen Then
        .rsSelectLeadTime.Close
    End If
    If .rsSelectLotSize.State = adStateOpen Then
        .rsSelectLotSize.Close
    End If
    If .rsSelectMasterSchedule.State = adStateOpen Then
        .rsSelectMasterSchedule.Close
    End If
    If .rsSelectMaxIntervalDate.State = adStateOpen Then
        .rsSelectMaxIntervalDate.Close
    End If
    If .rsSelectOnhand_SafetyStock.State = adStateOpen Then
        .rsSelectOnhand_SafetyStock.Close
    End If
    If .rsSelectParent.State = adStateOpen Then
        .rsSelectParent.Close
    End If
    If .rsSelectPOR.State = adStateOpen Then
        .rsSelectPOR.Close
    End If
    If .rsSelectPREL.State = adStateOpen Then
        .rsSelectPREL.Close
    End If
    If .rsSelectPurchareDetail.State = adStateOpen Then
        .rsSelectPurchareDetail.Close
    End If
    If .rsSelectSRForUpdate.State = adStateOpen Then
        .rsSelectSRForUpdate.Close
    End If
    If .rsSelectSRFuture.State = adStateOpen Then
        .rsSelectSRFuture.Close
    End If
    If .rsShowBomDetail.State = adStateOpen Then
        .rsShowBomDetail.Close
    End If
    If .rsShowInventoryDetail.State = adStateOpen Then
        .rsShowInventoryDetail.Close
    End If
    If .rsShowItemID_ItemName.State = adStateOpen Then
        .rsShowItemID_ItemName.Close
    End If
    If .rsShowMasterSchedule.State = adStateOpen Then
        .rsShowMasterSchedule.Close
    End If
    If .rsShowOutput.State = adStateOpen Then
        .rsShowOutput.Close
    End If
    If .rsShowPrice.State = adStateOpen Then
        .rsShowPrice.Close
    End If
    
    

    End With
End Sub

Private Sub FindDate()



    Dim i, j, k As Integer
    Dim intYear, intYearBuda As Integer
    Dim strYear, strMonth, strDay As String
    Dim intNumberOfItem, intItemID As Integer
    Dim strItemName As String
    Dim lngMonthNew, lngDayNew, lngYearNew As Long
    Dim intNextYear As Integer
        
    'DataEnvironment1.rsCheckInventoryRecord.Open
    'If DataEnvironment1.rsCheckInventoryRecord.EOF Then
        For i = 1 To 12
            Select Case i
                Case 1
                    intDay(1) = 31
                Case 2
                    intYear = Year(Date)
                    If intYear Mod 4 = 0 Then
                        intDay(2) = 29
                    Else
                        intDay(2) = 28
                    End If
                Case 3
                    intDay(3) = 31
                Case 4
                    intDay(4) = 30
                Case 5
                    intDay(5) = 31
                Case 6
                    intDay(6) = 30
                Case 7
                    intDay(7) = 31
                Case 8
                    intDay(8) = 31
                Case 9
                    intDay(9) = 30
                Case 10
                    intDay(10) = 31
                Case 11
                    intDay(11) = 30
                Case 12
                    intDay(12) = 31
            End Select
        Next
        
        For i = 1 To 12
        Select Case i
            Case 1
                intDayNextYear(1) = 31
            Case 2
                intNextYear = Year(Date) + 1
                If intNextYear Mod 4 = 0 Then
                    intDayNextYear(2) = 29
                Else
                    intDayNextYear(2) = 28
                End If
            Case 3
                intDayNextYear(3) = 31
            Case 4
                intDayNextYear(4) = 30
            Case 5
                intDayNextYear(5) = 31
            Case 6
                intDayNextYear(6) = 30
            Case 7
                intDayNextYear(7) = 31
            Case 8
                intDayNextYear(8) = 31
            Case 9
                intDayNextYear(9) = 30
            Case 10
                intDayNextYear(10) = 31
            Case 11
                intDayNextYear(11) = 30
            Case 12
                intDayNextYear(12) = 31
        End Select
    Next
    
    intYear = Year(Date)
    lngYearNew = intYear * 10000
   
    strYear = Str(intYear)
    k = 1
    j = Day(Date)
    
    Do While k <= 52
        For i = Month(Date) To 12
            lngMonthNew = i * 100
            strMonth = Str(i)
            Do While j <= intDay(i)
                
                If Weekday(DateSerial(intYear, i, j)) = 2 Then
                    lngDayNew = j
                    strDay = Str(j)
                    strDate(k) = strDay & "/" & strMonth & "/" & strYear
                    lngDateNew(k) = lngYearNew + lngMonthNew + lngDayNew
                    If k < 52 Then
                        k = k + 1
                    Else
                        GoTo nextStatement
                    End If
            
                End If
                
                 j = j + 1
                             
            Loop
             j = 1
        Next
        
        intYear = Year(Date) + 1
        lngYearNew = intYear * 10000
        strYear = Str(intYear)
        For i = 1 To 12
            lngMonthNew = i * 100
            strMonth = Str(i)
            For j = 1 To intDayNextYear(i)
                If Weekday(DateSerial(intYear, i, j)) = 2 Then
                    lngDayNew = j
                    lngDateNew(k) = lngYearNew + lngMonthNew + lngDayNew
                    strDay = Str(j)
                    strDate(k) = strDay & "/" & strMonth & "/" & strYear
                
                    If k < 52 Then
                        k = k + 1
                    Else
                        GoTo nextStatement
                    End If
            
                End If
            Next
        Next
                
    Loop
    
nextStatement:
    
'    DataEnvironment1.rsSelectItemID_ItemName.Open
'    DataEnvironment1.rsSelectItemID_ItemName.MoveFirst
'    intNumberOfItem = DataEnvironment1.rsSelectItemID_ItemName.RecordCount
'    DataEnvironment1.rsSelectItemID_ItemName.MoveFirst
    
'    For i = 1 To intNumberOfItem
'
'        intItemID = DataEnvironment1.rsSelectItemID_ItemName.Fields("ItemID").Value
'        strItemName = DataEnvironment1.rsSelectItemID_ItemName.Fields("ItemName").Value
'        For j = 1 To 52
'
'        DataEnvironment1.InsertInitialInventoryRecord j, strDate(j), intItemID, strItemName
'        Next
'
'        DataEnvironment1.rsSelectItemID_ItemName.MoveNext
'
'    Next
'
'    DataEnvironment1.rsSelectItemID_ItemName.Close
'    DataEnvironment1.rsCheckInventoryRecord.Close

'End If
    

End Sub

Private Sub AddMasterSchedule()
Dim i, intNoFinishGoods As Integer
Dim lngDay, lngMonth, lngYear, lngDate, lngTmp1, lngDayMin As Long
Dim lngDateMin, lngDateMax As Long
Dim AddsMasterSchedule() As MasterSchedule
Dim j, k, intCustomerOrderID, intNoCusOrderID, intIndex, intCountItemID, intCusItemID, intQty As Integer
Dim blnStartDate As Boolean

    lngYear = Year(Date)
    lngMonth = Month(Date)
    lngDay = Day(Date)
    lngDateMax = lngYear * 10000 + lngMonth * 100 + lngDay
    
    Do While blnStartDate = False
        
        If Weekday(DateSerial(lngYear, lngMonth, lngDay)) = 2 Then
            blnStartDate = True
        Else
            If lngDay = 1 Then
                If lngMonth = 1 Then
                    lngYear = lngYear - 1
                    lngMonth = 12
                    lngDay = 31
                Else
                    lngMonth = lngMonth - 1
                    lngDay = intDay(lngMonth)
                End If
            Else
                lngDay = lngDay - 1
            End If
        End If
            
    Loop
    
    lngDateMin = lngYear * 10000 + lngMonth * 100 + lngDay
    DataEnvironment1.SelectCusOrderID lngDateMin, lngDateMax
    
    If DataEnvironment1.rsSelectCusOrderID.EOF Then
        GoTo endSub
    End If
    
    DataEnvironment1.rsSelectAllFinishGoods.Open
    intNoFinishGoods = DataEnvironment1.rsSelectAllFinishGoods.RecordCount
    ReDim AddsMasterSchedule(intNoFinishGoods) As MasterSchedule
    DataEnvironment1.rsSelectAllFinishGoods.MoveFirst
    
    For i = 1 To intNoFinishGoods
        AddsMasterSchedule(i).intItemID = DataEnvironment1.rsSelectAllFinishGoods.Fields("ItemID").Value
        DataEnvironment1.SelectCriticalPath AddsMasterSchedule(i).intItemID
        intIndex = DataEnvironment1.rsSelectCriticalPath.Fields("CriticalPath").Value + 1
        AddsMasterSchedule(i).strIntervalDate = strDate(intIndex)
        AddsMasterSchedule(i).lngDate = lngDateNew(intIndex)
        DataEnvironment1.rsSelectAllFinishGoods.MoveNext
        DataEnvironment1.rsSelectCriticalPath.Close
    Next
    
    intNoCusOrderID = DataEnvironment1.rsSelectCusOrderID.RecordCount
    DataEnvironment1.rsSelectCusOrderID.MoveFirst
    
    For i = 1 To intNoCusOrderID
        
        intCustomerOrderID = DataEnvironment1.rsSelectCusOrderID.Fields("CustomerOrderID").Value
        DataEnvironment1.SelectCusOrderDetail intCustomerOrderID
        
        intCountItemID = DataEnvironment1.rsSelectCusOrderDetail.RecordCount
        DataEnvironment1.rsSelectCusOrderDetail.MoveFirst
        
        For j = 1 To intCountItemID
            intCusItemID = DataEnvironment1.rsSelectCusOrderDetail.Fields("ItemID").Value
            intQty = DataEnvironment1.rsSelectCusOrderDetail.Fields("OrderQty").Value
            For k = 1 To intNoFinishGoods
                If AddsMasterSchedule(k).intItemID = intCusItemID Then
                    AddsMasterSchedule(k).intQty = AddsMasterSchedule(k).intQty + intQty
                End If
            Next
            DataEnvironment1.rsSelectCusOrderDetail.MoveNext
        Next
        DataEnvironment1.rsSelectCusOrderDetail.Close
        DataEnvironment1.rsSelectCusOrderID.MoveNext
        
    Next
    
    For i = 1 To intNoFinishGoods
        DataEnvironment1.CheckMasterSchedule AddsMasterSchedule(i).intItemID, AddsMasterSchedule(i).lngDate
        If DataEnvironment1.rsCheckMasterSchedule.EOF Then
            DataEnvironment1.InsertMasterSchedule AddsMasterSchedule(i).intItemID, AddsMasterSchedule(i).intQty, AddsMasterSchedule(i).strIntervalDate, AddsMasterSchedule(i).lngDate
        Else
            DataEnvironment1.UpdateMasterSchedule AddsMasterSchedule(i).intItemID, AddsMasterSchedule(i).intQty, AddsMasterSchedule(i).strIntervalDate, AddsMasterSchedule(i).lngDate, AddsMasterSchedule(i).intItemID, AddsMasterSchedule(i).lngDate
        End If
        DataEnvironment1.rsCheckMasterSchedule.Close
    Next
    
      DataEnvironment1.rsSelectAllFinishGoods.Close
endSub:
End Sub

Private Sub Label1_Click()

End Sub
