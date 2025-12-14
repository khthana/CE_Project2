VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Begin VB.Form frmMasterSchedule 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "MasterSchedule"
   ClientHeight    =   7815
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6510
   Icon            =   "frmMasterSchedule.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   7815
   ScaleWidth      =   6510
   WindowState     =   2  'Maximized
   Begin MSFlexGridLib.MSFlexGrid flxShowMasterSchedule 
      Height          =   7335
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   6015
      _ExtentX        =   10610
      _ExtentY        =   12938
      _Version        =   393216
      Appearance      =   0
   End
End
Attribute VB_Name = "frmMasterSchedule"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim intLowestLevel As Integer
Dim intMaxLowestLevel As Integer
Dim strDate(52) As String
Dim lngDateNew(52) As Long
'Dim intDayNextYear(52) As Long
Dim intDay(12), intDayNextYear(12) As Integer
Dim lngDateMin, lngDateMax As Long


'Private Sub cmdAdd_Click()
'        Dim blnCheck As Boolean
'        Dim intItemID, intQty, intWeek As Integer
'
'        blnCheck = Check1
'
'        If blnCheck Then
'            intItemID = Val(txtItemID.Text)
'            intQty = Val(txtQty.Text)
'            intWeek = Val(txtIntervalWeek.Text)
'
'
'            DataEnvironment1.AddMasterSchedule intItemID, intQty, strDate(intWeek), intWeek
'            'flxShowMasterSchedule.Clear
'            ShowData
'        Else
'            'TabIndex = 1
'            MsgBox "ข้อมูลผิดพลาดกรุณาแก้ไข", vbOKOnly
'        End If
'
''            flxShowMasterSchedule.Rows = flxShowMasterSchedule.Rows + 1
''            flxShowMasterSchedule.Row = flxShowMasterSchedule.Rows - 2
''            flxShowMasterSchedule.Col = 0
''            flxShowMasterSchedule.Text = txtItemID.Text
''            flxShowMasterSchedule.Col = 1
''            flxShowMasterSchedule.Text = txtQty.Text
''            flxShowMasterSchedule.Col = 2
''            flxShowMasterSchedule.Text = txtIntervalDate.Text
''            flxShowMasterSchedule.Col = 3
''            flxShowMasterSchedule.Text = txtIntervalWeek.Text
''
'
'End Sub

'Private Sub cmdSave_Click()
'    'txtTest.Text = CalLow(txtTest.Text)
'End Sub


'Private Sub flxShowMasterSchedule_Click()
'
'        flxShowMasterSchedule.Col = 0
'        txtItemID.Text = flxShowMasterSchedule.Text
'        flxShowMasterSchedule.Col = 1
'        txtQty.Text = flxShowMasterSchedule.Text
'        flxShowMasterSchedule.Col = 2
'        txtIntervalDate.Text = flxShowMasterSchedule.Text
'        flxShowMasterSchedule.Col = 3
'        txtIntervalWeek.Text = flxShowMasterSchedule.Text
'
'
'End Sub

Private Sub Form_Load()
'
'    If DataEnvironment1.BOMConnection.State = adStateOpen Then
'    DataEnvironment1.BOMConnection.Close
'    DataEnvironment1.BOMConnection.Open
'  End If
'  If DataEnvironment1.BOMConnection.State = adStateClosed Then
'    DataEnvironment1.BOMConnection.Open
'End If
    'ShowData
    FindDate
    AddMasterSchedule
    ShowData
    
    
'    If DataEnvironment1.BOMConnection.State = adStateOpen Then
'    DataEnvironment1.BOMConnection.Close
'    DataEnvironment1.BOMConnection.Open
'  End If
'  If DataEnvironment1.BOMConnection.State = adStateClosed Then
'    DataEnvironment1.BOMConnection.Open
'End If
End Sub


'Private Function Check1() As Boolean
'    Dim intItemID, j As Integer
'    Dim lngCurrentDate, lngCurrentDay, lngCurrentMonth, lngCurrentYear As Long
'    Dim intCurrentWeek As Integer
'    Dim i As Boolean
'    Dim intMinimumWeek As Integer
'    Dim intcriticalpath As Integer
'    Dim intPlanWeek
'
'
'
'    intItemID = Val(txtItemID.Text)
'    DataEnvironment1.Check1 intItemID
'    intcriticalpath = DataEnvironment1.rsCheck1.Fields("CriticalPath").Value
'
'    lngCurrentDay = Day(Date) * 1000000
'    lngCurrentMonth = Month(Date) * 10000
'    lngCurrentYear = Year(Date)
'    lngCurrentDate = lngCurrentDay + lngCurrentMonth + lngCurrentYear
'    j = 1
'    i = False
'
'    If lngCurrentDate > lngDate(52) Then
'        Check1 = False
'    End If
'
'    Do While i = False
'
'        If lngCurrentDate < lngDate(j) Then
'            intCurrentWeek = j
'            i = True
'        Else
'            j = j + 1
'        End If
'
'    Loop
'
'    intMinimumWeek = intCurrentWeek + intcriticalpath
'    intPlanWeek = Val(txtIntervalWeek.Text)
'
'    If intPlanWeek >= intMinimumWeek Then
'        Check1 = True
'    Else
'        Check1 = False
'    End If
'
'End Function
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

'Private Sub txtIntervalWeek_Change()
'    Dim intIntervalWeek As String
'
'    intIntervalWeek = Val(txtIntervalWeek.Text)
'
'    If intIntervalWeek > 52 Then
'        txtIntervalWeek.Text = "52"
'    End If
'
'    If intIntervalWeek < 1 Then
'        txtIntervalWeek.Text = "1"
'    End If
'
'    txtIntervalDate.Text = strDate(intIntervalWeek)
'
'End Sub

Private Sub ShowData()
    Dim icol As Integer
    Dim intTest As Integer
    DataEnvironment1.ShowMasterSchedule lngDateNew(1)
    'DataEnvironment1.rsShowMasterSchedule.Open
    
    With flxShowMasterSchedule
'        .Row = 1
        .Cols = DataEnvironment1.rsShowMasterSchedule.Fields.Count
        
'        For icol = 0 To DataEnvironment1.rsShowMasterSchedule.Fields.Count - 1
'            .Col = icol
'            .Text = DataEnvironment1.rsShowMasterSchedule.Fields(icol).Name
'        Next
        
        DataEnvironment1.rsShowMasterSchedule.MoveFirst
        intTest = DataEnvironment1.rsShowMasterSchedule.RecordCount
        DataEnvironment1.rsShowMasterSchedule.MoveFirst
        Do While Not DataEnvironment1.rsShowMasterSchedule.EOF
            .Rows = .Rows + 1
            .Row = .Rows - 2
                For icol = 0 To DataEnvironment1.rsShowMasterSchedule.Fields.Count - 1
                    .Col = icol
                    .Text = DataEnvironment1.rsShowMasterSchedule(icol)
                Next
                
            DataEnvironment1.rsShowMasterSchedule.MoveNext
        Loop
    End With
    
    With flxShowMasterSchedule
        .ColWidth(0) = 500
        .ColWidth(1) = 1400
        .ColWidth(2) = 5400
'        .ColWidth(3) = 1400
        .FormatString = "ItemID| ปริมาณที่ผลิต |วันที่เสร็จ        "
    End With
    
    DataEnvironment1.rsShowMasterSchedule.Close

'  DataEnvironment1.rsSelectMasterSchedule.MoveFirst
'
'  Do While Not DataEnvironment1.rsSelectMasterSchedule.EOF
'
'    DataEnvironment1.BOMConnection.Close
'    DataEnvironment1.BOMConnection.Open
'    DataEnvironment1.rsFindMaxLowestLevel.Open
'    intMaxLowestLevel = DataEnvironment1.rsFindMaxLowestLevel.Fields("MaxLowestLevel").Value
'    DataEnvironment1.rsFindMaxLowestLevel.Close
'
'    For intLowestLevel = 0 To intMaxLowestLevel
'
'
'
'    Next
'
'  Loop
  
  'DataGrid1.DataMember = "ShowMasterSchedule"

End Sub

Private Sub AddMasterSchedule()
Dim i, intNoFinishGoods As Integer
Dim lngDay, lngMonth, lngYear, lngDate, lngTmp1, lngDayMin As Long

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
    DataEnvironment1.DeleteMasterSchedule lngDateMin
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

