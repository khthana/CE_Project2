VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmReceivedItem 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Check Received Order"
   ClientHeight    =   7155
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11880
   Icon            =   "frmReceivedItem.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   7155
   ScaleWidth      =   11880
   Begin VB.Frame Frame3 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "ข้อมูลใบสั่ง"
      ForeColor       =   &H80000008&
      Height          =   2295
      Left            =   9240
      TabIndex        =   15
      Top             =   1440
      Width           =   2535
      Begin VB.Label lblNetTotal 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "รวม :"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   120
         TabIndex        =   19
         Top             =   1560
         Width           =   2295
      End
      Begin VB.Label lblDueDate 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "วันชำระเงิน :"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   120
         TabIndex        =   18
         Top             =   1200
         Width           =   2295
      End
      Begin VB.Label lblReceiveDate 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "วันรับสินค้า :"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   120
         TabIndex        =   17
         Top             =   840
         Width           =   2295
      End
      Begin VB.Label lblOrderDate 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "วันสั่งสินค้า :"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   120
         TabIndex        =   16
         Top             =   480
         Width           =   2295
      End
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Supplier"
      ForeColor       =   &H80000008&
      Height          =   1575
      Left            =   120
      TabIndex        =   6
      Top             =   1440
      Width           =   9015
      Begin VB.Label lblTelephone 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   5760
         TabIndex        =   14
         Top             =   720
         Width           =   3015
      End
      Begin VB.Label Label5 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "เบอร์โทรศัพท์ :"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   4560
         TabIndex        =   13
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label lblContactName 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   5760
         TabIndex        =   12
         Top             =   360
         Width           =   3015
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "เจ้าหน้าที่ติดต่อ :"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   4560
         TabIndex        =   11
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label lblAddress 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   615
         Left            =   960
         TabIndex        =   10
         Top             =   720
         Width           =   3375
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "ที่อยู่ :"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   240
         TabIndex        =   9
         Top             =   720
         Width           =   495
      End
      Begin VB.Label lblSupplierName 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   960
         TabIndex        =   7
         Top             =   360
         Width           =   3375
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "ชื่อบริษัท :"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   240
         TabIndex        =   8
         Top             =   360
         Width           =   855
      End
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "บันทึก"
      Height          =   855
      Left            =   9480
      MouseIcon       =   "frmReceivedItem.frx":0442
      MousePointer    =   99  'Custom
      Picture         =   "frmReceivedItem.frx":074C
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   6120
      Width           =   2055
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid mfgItem 
      Height          =   3855
      Left            =   120
      TabIndex        =   4
      Top             =   3120
      Width           =   9015
      _ExtentX        =   15901
      _ExtentY        =   6800
      _Version        =   393216
      FixedCols       =   0
      BackColorBkg    =   12632256
      Appearance      =   0
      _NumberOfBands  =   1
      _Band(0).Cols   =   2
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "หมายเลขใบสั่งซื้อ"
      ForeColor       =   &H80000008&
      Height          =   1215
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   9015
      Begin VB.CommandButton cmdOK 
         Caption         =   "ตกลง"
         Height          =   735
         Left            =   2880
         MouseIcon       =   "frmReceivedItem.frx":1586
         MousePointer    =   99  'Custom
         Picture         =   "frmReceivedItem.frx":1890
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   240
         Width           =   1935
      End
      Begin MSMask.MaskEdBox mskPO 
         Height          =   315
         Left            =   1200
         TabIndex        =   0
         Top             =   360
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         Appearance      =   0
         MaxLength       =   10
         Mask            =   "##########"
         PromptChar      =   "_"
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H80000013&
         Caption         =   "รหัสใบ PO : "
         ForeColor       =   &H80000001&
         Height          =   255
         Left            =   120
         TabIndex        =   2
         Top             =   360
         Width           =   1095
      End
   End
End
Attribute VB_Name = "frmReceivedItem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim tmpmskPO1 As String
Dim tmpTLCode As String

Private Sub Form_Load()
frmReceivedItem.WindowState = 2

End Sub

Private Sub cmdOK_Click()
Dim tmpmskPO As String
If mskPO.Text = "__________" Then Exit Sub
    
With DataEnInventories.rsparameterCheckOrder
        If .State = adStateOpen Then .Close
'.Open
tmpmskPO = "PO-" & mskPO.Text
tmpmskPO1 = tmpmskPO
DataEnInventories.parameterCheckOrder tmpmskPO ' mskPO.Text
End With

    With DataEnInventories.rsparameterCheckOrder
        'If .State = adStateOpen Then .Close
        '.Open
            If .RecordCount = 0 Then
                MsgBox "หมายเลขใบสั่งซื้อ " & mskPO.Text & " ไม่มี หรือรับรายการสินค้าไปแล้ว", vbOKOnly + vbExclamation, "CheckOrder"
                Set mfgItem.DataSource = DataEnInventories.rsparameterCheckOrder
                mfgItem.Refresh
                Call ClearData
                mskPO.SetFocus
                mskPO.SelStart = 0
                mskPO.SelLength = Len(mskPO.Text)
                Exit Sub
            Else
                Set mfgItem.DataSource = DataEnInventories.rsparameterCheckOrder
                Call OrderGrid
                    With DataEnInventories.rsparameterCheckOrder
                        lblSupplierName.Caption = .Fields("SupplierNameEnglish").Value
                        lblAddress.Caption = .Fields("Address").Value
                        lblContactName.Caption = .Fields("ContactName").Value
                        lblTelephone.Caption = .Fields("Telephone").Value
                    
                        lblOrderDate.Caption = "วันสั่งสินค้า : " & Format(.Fields("OrderDate").Value, "dd/mm/yyyy")
                        lblReceiveDate.Caption = "วันรับสินค้า : " & Format(Date, "dd/mm/yy") 'Format(.Fields("ReceiveDate").Value, "dd/mm/yyyy")
                        lblDueDate.Caption = "วันชำระเงิน : " & Format(.Fields("DueDate").Value, "dd/mm/yyyy")
                        lblNetTotal.Caption = "รวม : " & Format(.Fields("NetTotal").Value, "#,000.00") & " บาท"
                    End With
            End If
    End With
    MFGRowColor mfgItem, 57, 253, 218
End Sub

Private Sub cmdAdd_Click()
Dim i, intDay(12), intYear, intNoOfItem, intItemID, intQty, j As Integer
Dim lngYear, lngMonth, lngDay, lngDate As Long
Dim tmpItemModel As String
Dim POCode As String
Dim tmpNumberInStock As Integer
Dim tmpItemNum As String
Dim blnTrueDay As Boolean


POCode = "PO-" & mskPO.Text

If mskPO.Text <> "__________" Then
    If MsgBox("คุณต้องการบันทึกรายการสินค้า ใช่หรือไม่ ?", vbYesNo + vbQuestion, "Check Received Order") = vbYes Then
        MsgBox "บันทึกลงฐานข้อมูลเรียบร้อยแล้ว", vbOKOnly + vbInformation, "Check Received Order"
        
        DataEnInventories.UpdateReceiveDate Date, POCode
        

Call AutoCreateTLCode

With mfgItem
    For i = 1 To .Rows - 1
        tmpItemModel = .TextMatrix(i, 0)

If tmpItemModel <> "" Then


'----------------------------------------------------------------------------------
        'With DataEnInventories.rsparaOnHand
         '       If .State = adStateOpen Then .Close
        '-----.Open
        'DataEnInventories.paraOnHand tmpItemModel
        'End With
        
        'With DataEnInventories.rsparaOnHand
                '-------If .State = adStateOpen Then .Close
                '----------.Open
                'tmpNumberInStock = .Fields("OnHand").Value + Val(mfgItem.TextMatrix(i, 20))
         
        'DataEnInventories.parameterUpdateOnHand tmpNumberInStock, tmpItemModel
        'DataEnInventories.parameterUpdateQtySR tmpItemModel
        'End With
'---------------------------------------------------------------------
If DataEnvironment1.BOMConnection.State = adStateOpen Then
    DataEnvironment1.BOMConnection.Close
    DataEnvironment1.BOMConnection.Open
  End If
  If DataEnvironment1.BOMConnection.State = adStateClosed Then
    DataEnvironment1.BOMConnection.Open
End If
DataEnvironment1.SelectPurchareDetail tmpmskPO1

For j = 1 To 12
            Select Case j
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
lngYear = Year(Date)
lngMonth = Month(Date)
lngDay = Day(Date)

Do While blnTrueDay = False
    
    If Weekday(DateSerial(lngYear, lngMonth, lngDay)) = 2 Then
        lngDate = lngYear * 10000 + lngMonth * 100 + lngDay
        blnTrueDay = True
    Else
        If lngDay = intDay(lngMonth) Then
                If lngMonth = 12 Then
                    lngYear = lngYear + 1
                    lngMonth = 1
                    lngDay = 1
                Else
                    lngMonth = lngMonth + 1
                    lngDay = 1
                End If
            Else
                lngDay = lngDay + 1
            End If
        End If
        
Loop

'lngDate = lngYear * 10000 + lngMonth * 100 + lngDay

DataEnvironment1.rsSelectPurchareDetail.MoveFirst
intNoOfItem = DataEnvironment1.rsSelectPurchareDetail.RecordCount

For j = 1 To intNoOfItem
    intItemID = DataEnvironment1.rsSelectPurchareDetail.Fields("ItemID").Value
    intQty = DataEnvironment1.rsSelectPurchareDetail.Fields("QtySR").Value
    DataEnvironment1.SelectSRForUpdate intItemID, lngDate
    intQty = intQty + DataEnvironment1.rsSelectSRForUpdate.Fields("SR").Value
    
    DataEnvironment1.UpdateSR intQty, intItemID, lngDate
    
    DataEnvironment1.rsSelectPurchareDetail.MoveNext
    DataEnvironment1.UpdateQtySR tmpmskPO1, intItemID
    DataEnvironment1.rsSelectSRForUpdate.Close
Next

If DataEnvironment1.BOMConnection.State = adStateOpen Then
    DataEnvironment1.BOMConnection.Close
    DataEnvironment1.BOMConnection.Open
  End If
  If DataEnvironment1.BOMConnection.State = adStateClosed Then
    DataEnvironment1.BOMConnection.Open
End If
    
    
tmpItemNum = "+" & .TextMatrix(i, 20)

DataEnInventories.InsertTransactionLog tmpTLCode, tmpItemModel, tmpItemNum, .TextMatrix(i, 4), "02", Date, POCode


  End If
Next
  
DataEnInventories.UpdateTLCode tmpTLCode
DataEnInventories.parameterUpdateIsReceived POCode

End With

        Call ClearData
        Call ClearDataInGrid
        mskPO.Text = "__________"
        mskPO.SetFocus
    
    
    
    Else
    End If
End If
End Sub

Private Sub AutoCreateTLCode()
    With DataEnInventories.rsTLCode
        If .State = adStateOpen Then .Close
        .Open
            If .RecordCount = 0 Then
                .AddNew
                .Fields("TLCode").Value = "0000000001"
                .Update
                tmpTLCode = "0000000001"
            ElseIf (.Fields("TLCode").Value = "") Or (IsNull(.Fields("TLCode").Value)) Then
                tmpTLCode = "0000000001"
            Else
                tmpTLCode = Format(Trim(.Fields("TLCode").Value + 1), "0000000000")
            End If
        End With
End Sub

Private Sub ClearData()
    lblSupplierName.Caption = ""
    lblAddress.Caption = ""
    lblContactName.Caption = ""
    lblTelephone.Caption = ""
    lblOrderDate.Caption = "วันสั่งสินค้า :"
    lblReceiveDate.Caption = "วันรับสินค้า :"
    lblDueDate.Caption = "วันชำระเงิน :"
    lblNetTotal.Caption = "รวมทั้งสิ้น :"
End Sub

Private Sub OrderGrid()
    With mfgItem
        .ColWidth(0) = 1000          'รหัสสินค้า
        .ColWidth(1) = 1000         'ชื่อสินค้า
        .ColWidth(2) = 1000         'รุ่น
        .ColWidth(3) = 1000            'รหัส PurchaseOrder
        .ColWidth(4) = 0
        .ColWidth(5) = 0
        .ColWidth(6) = 0
        .ColWidth(7) = 0
        .ColWidth(8) = 1500         'ราคารวม
        .ColWidth(9) = 0
        .ColWidth(10) = 0
        .ColWidth(11) = 0
        .ColWidth(12) = 0
        .ColWidth(13) = 0
        .ColWidth(14) = 0
        .ColWidth(15) = 0
        .ColWidth(16) = 0
        .ColWidth(17) = 0
        .ColWidth(18) = 0
        .ColWidth(19) = 0
        .ColWidth(20) = 1500            'จำนวน
        .ColWidth(21) = 0
        '.ColWidth(22) = 0
        
        .TextMatrix(0, 0) = "รหัสสินค้า"
        .TextMatrix(0, 1) = "ชื่อสินค้า"
        .TextMatrix(0, 2) = "รุ่น"
        .TextMatrix(0, 3) = "รหัส PurchaseOrder"
        '.TextMatrix(0, 15) = "ประเภท"
        .TextMatrix(0, 8) = "ราคารวม"
        .TextMatrix(0, 20) = "จำนวน"
    End With
End Sub

Private Sub ClearDataInGrid()
Dim i As Integer

With mfgItem
    For i = 1 To .Rows - 1
        If .Rows > 2 Then
            .Rows = .Rows - 1
        End If
        .TextMatrix(1, 0) = ""
        .TextMatrix(1, 1) = ""
        .TextMatrix(1, 2) = ""
        .TextMatrix(1, 3) = ""
        .TextMatrix(1, 8) = ""
        .TextMatrix(1, 20) = ""
    Next
End With
End Sub

Private Sub mskPO_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then Call cmdOK_Click
End Sub
