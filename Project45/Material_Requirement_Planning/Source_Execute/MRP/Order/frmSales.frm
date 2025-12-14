VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmSales 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Sales Order"
   ClientHeight    =   7230
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11880
   Icon            =   "frmSales.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   7230
   ScaleWidth      =   11880
   Begin VB.CommandButton cmdDelete 
      Caption         =   "ลบรายการสั่งซื้อ"
      Height          =   855
      Left            =   10200
      MouseIcon       =   "frmSales.frx":1272
      MousePointer    =   99  'Custom
      Picture         =   "frmSales.frx":157C
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   2520
      Width           =   1575
   End
   Begin MSMask.MaskEdBox mskCustomerOrder 
      Height          =   315
      Left            =   8520
      TabIndex        =   4
      Top             =   6240
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   556
      _Version        =   393216
      Appearance      =   0
      ForeColor       =   255
      Format          =   "###"
      PromptChar      =   "_"
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid mfgItem 
      Height          =   2535
      Left            =   240
      TabIndex        =   23
      Top             =   3240
      Width           =   9855
      _ExtentX        =   17383
      _ExtentY        =   4471
      _Version        =   393216
      Cols            =   8
      FixedCols       =   0
      BackColorBkg    =   12632256
      Appearance      =   0
      _NumberOfBands  =   1
      _Band(0).Cols   =   8
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "รายการสินค้า"
      ForeColor       =   &H80000008&
      Height          =   1095
      Left            =   240
      TabIndex        =   13
      Top             =   2040
      Width           =   9855
      Begin VB.CommandButton cmdSaleItemList 
         Caption         =   ">"
         Height          =   270
         Left            =   1440
         MouseIcon       =   "frmSales.frx":19BE
         MousePointer    =   99  'Custom
         TabIndex        =   38
         Top             =   480
         Width           =   270
      End
      Begin VB.CommandButton cmdAddItem 
         Caption         =   "เพิ่มสินค้า"
         Height          =   495
         Left            =   8400
         MouseIcon       =   "frmSales.frx":1CC8
         MousePointer    =   99  'Custom
         TabIndex        =   22
         Top             =   360
         Width           =   1335
      End
      Begin MSMask.MaskEdBox mskAmount 
         Height          =   315
         Left            =   6480
         TabIndex        =   3
         Top             =   480
         Width           =   615
         _ExtentX        =   1085
         _ExtentY        =   556
         _Version        =   393216
         Appearance      =   0
         BackColor       =   -2147483629
         Format          =   "###"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtItemModel 
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         Height          =   315
         Left            =   120
         TabIndex        =   2
         Top             =   480
         Width           =   1575
      End
      Begin VB.Label lblBrandName 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   4560
         TabIndex        =   18
         Top             =   480
         Width           =   975
      End
      Begin VB.Label lblSellPrice 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   5520
         TabIndex        =   33
         Top             =   480
         Width           =   975
      End
      Begin VB.Label Label14 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "ราคา :"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   5520
         TabIndex        =   32
         Top             =   240
         Width           =   855
      End
      Begin VB.Label lblItemType 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   3480
         TabIndex        =   31
         Top             =   480
         Width           =   1095
      End
      Begin VB.Label Label13 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "ประเภท :"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   3480
         TabIndex        =   30
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lblNet 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   7200
         TabIndex        =   21
         Top             =   480
         Width           =   1095
      End
      Begin VB.Label Label8 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "รวมเป็นเงิน :"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   7200
         TabIndex        =   20
         Top             =   240
         Width           =   1095
      End
      Begin VB.Label Label7 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "จำนวน : "
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   6480
         TabIndex        =   19
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lblName 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   1680
         TabIndex        =   15
         Top             =   480
         Width           =   1815
      End
      Begin VB.Label Label6 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "ยี่ห้อ :"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   4560
         TabIndex        =   17
         Top             =   240
         Width           =   735
      End
      Begin VB.Label Label5 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "ชื่อสินค้า :"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   1680
         TabIndex        =   16
         Top             =   240
         Width           =   855
      End
      Begin VB.Label Label4 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "รหัสสินค้า :"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   14
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.CommandButton cmdCalculate 
      Caption         =   "คำนวณค่าสินค้า"
      Height          =   855
      Left            =   10200
      MouseIcon       =   "frmSales.frx":1FD2
      MousePointer    =   99  'Custom
      Picture         =   "frmSales.frx":22DC
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   1680
      Width           =   1575
   End
   Begin VB.CommandButton cmdAddToDatabase 
      Caption         =   "บันทึกรายการขาย"
      Height          =   855
      Left            =   10200
      MouseIcon       =   "frmSales.frx":271E
      MousePointer    =   99  'Custom
      Picture         =   "frmSales.frx":2A28
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   840
      Width           =   1575
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "ข้อมูลลูกค้า"
      ForeColor       =   &H80000008&
      Height          =   1215
      Left            =   240
      TabIndex        =   7
      Top             =   720
      Width           =   9855
      Begin VB.TextBox txtOrderDetail 
         Appearance      =   0  'Flat
         Height          =   405
         Left            =   960
         TabIndex        =   36
         Top             =   720
         Width           =   3495
      End
      Begin VB.TextBox txtAddress 
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         ForeColor       =   &H00000000&
         Height          =   855
         Left            =   5160
         MultiLine       =   -1  'True
         TabIndex        =   1
         Top             =   240
         Width           =   4575
      End
      Begin VB.TextBox txtName 
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   960
         TabIndex        =   0
         Top             =   240
         Width           =   3495
      End
      Begin VB.Label Label16 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "Detail : "
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   360
         TabIndex        =   37
         Top             =   840
         Width           =   495
      End
      Begin VB.Label Label3 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "ที่อยู่ :"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   4680
         TabIndex        =   9
         Top             =   360
         Width           =   615
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "ชื่อ-สกุล :"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   240
         TabIndex        =   8
         Top             =   360
         Width           =   615
      End
   End
   Begin VB.Label Label15 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "หมายเลขขาย :"
      ForeColor       =   &H80000008&
      Height          =   315
      Left            =   240
      TabIndex        =   35
      Top             =   240
      Width           =   1095
   End
   Begin VB.Label lblSO 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   315
      Left            =   1440
      TabIndex        =   34
      Top             =   240
      Width           =   1695
   End
   Begin VB.Label lblNetTotal 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "0,000.00"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1054
         SubFormatType   =   0
      EndProperty
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Left            =   8520
      TabIndex        =   29
      Top             =   6600
      Width           =   1575
   End
   Begin VB.Label Label12 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "รวมทั้งสิ้น :"
      ForeColor       =   &H80000008&
      Height          =   315
      Left            =   6960
      TabIndex        =   28
      Top             =   6600
      Width           =   855
   End
   Begin VB.Label Label11 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "ชุด"
      ForeColor       =   &H80000008&
      Height          =   315
      Left            =   9480
      TabIndex        =   27
      Top             =   6240
      Width           =   495
   End
   Begin VB.Label Label10 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "จำนวนชุดที่ขาย :"
      ForeColor       =   &H80000008&
      Height          =   315
      Left            =   6960
      TabIndex        =   26
      Top             =   6240
      Width           =   1335
   End
   Begin VB.Label lblNetTotalPerOne 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "0,000.00"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1054
         SubFormatType   =   0
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   315
      Left            =   8520
      TabIndex        =   25
      Top             =   5880
      Width           =   1575
   End
   Begin VB.Label Label9 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "รวมเป็นเงิน (ต่อชุด) :"
      ForeColor       =   &H80000008&
      Height          =   315
      Left            =   6960
      TabIndex        =   24
      Top             =   5880
      Width           =   1575
   End
   Begin VB.Label lblToday 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H80000008&
      Height          =   315
      Left            =   8880
      TabIndex        =   6
      Top             =   240
      Width           =   2895
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "วันที่ :"
      ForeColor       =   &H80000008&
      Height          =   315
      Left            =   8400
      TabIndex        =   5
      Top             =   240
      Width           =   495
   End
End
Attribute VB_Name = "frmSales"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim tmpTLCode As String

Private Sub cmdSaleItemList_Click()
    If txtName.Text = "" And txtAddress.Text = "" Then
        MsgBox "กรุณาใส่ข้อมูลลูกค้า !", vbOKOnly + vbExclamation, "Sales Order"
        txtName.SetFocus
        Exit Sub
    End If
    frmSaleItemList.Show vbModal

txtItemModel.Text = tmpSaleItemID
'lblName.Caption = tmpShortName

txtItemModel.SetFocus

 '   txtItemModel.SelStart = 0
  '  txtItemModel.SelLength = Len(txtItemModel.Text)
    
    With DataEnInventories.rsSale01 'rsItem
        If .State = adStateOpen Then .Close
        If txtItemModel.Text = "" Then Exit Sub
        DataEnInventories.Sale01 txtItemModel.Text
        '.Open
            If .RecordCount = 0 Then
                MsgBox "สินค้ารุ่น " & txtItemModel.Text & " ไม่มี !", vbOKOnly + vbInformation, "Sales Order"
                txtItemModel.SetFocus
                txtItemModel.SelStart = 0
                txtItemModel.SelLength = Len(txtItemModel.Text)
                Exit Sub
            Else
                SendKeys "{Tab}"
                'KeyAscii = 0
                With DataEnInventories.rsSale01 'rsItem
                    txtItemModel.Text = UCase(txtItemModel.Text)
                    lblName.Caption = .Fields("ItemName").Value
                    lblItemType.Caption = .Fields("ItemTypeName").Value
                    lblBrandName.Caption = .Fields("BrandName").Value
                    mskAmount.Text = 1
                    mskAmount.SelStart = 0
                    mskAmount.SelLength = Len(mskAmount.Text)
                    lblSellPrice.Caption = .Fields("SellPrice").Value
                    lblNet.Caption = .Fields("SellPrice").Value * Val(mskAmount.Text)
                End With
            End If
    End With


End Sub

Private Sub Form_Load()
    frmSales.WindowState = 2
    lblToday.Caption = Format(Date, "dd mmmm yyyy")
    mskCustomerOrder.Text = 1
    
    txtItemModel.MaxLength = 3
    txtName.MaxLength = 254
    txtAddress.MaxLength = 254

    cmdAddToDatabase.Enabled = False
    Call AutoCreateSOCode
End Sub

Private Sub txtItemModel_KeyPress(KeyAscii As Integer)
If txtName.Text = "" And txtAddress.Text = "" Then Exit Sub

If KeyAscii = 13 Then

With DataEnInventories.rsSale01 'rsItem
        If .State = adStateOpen Then .Close
                
        DataEnInventories.Sale01 txtItemModel.Text
        '.Open
            If .RecordCount = 0 Then
                MsgBox "สินค้ารุ่น " & txtItemModel.Text & " ไม่มี !", vbOKOnly + vbInformation, "Sales Order"
                txtItemModel.SetFocus
                txtItemModel.SelStart = 0
                txtItemModel.SelLength = Len(txtItemModel.Text)
                Exit Sub
            Else
                SendKeys "{Tab}"
                KeyAscii = 0
                With DataEnInventories.rsSale01 'rsItem
                    txtItemModel.Text = UCase(txtItemModel.Text)
                    lblName.Caption = .Fields("ItemName").Value
                    lblItemType.Caption = .Fields("ItemTypeName").Value
                    lblBrandName.Caption = .Fields("BrandName").Value
                    mskAmount.Text = 1
                    mskAmount.SelStart = 0
                    mskAmount.SelLength = Len(mskAmount.Text)
                    lblSellPrice.Caption = .Fields("SellPrice").Value
                    lblNet.Caption = .Fields("SellPrice").Value * Val(mskAmount.Text)
                End With
            End If
    End With
End If
End Sub

Private Sub cmdAddItem_Click()
Dim i As Integer
Dim NewRow As Integer

    If (mskAmount.Text = "") Or (Val(mskAmount.Text) = 0) Then Exit Sub
    With mfgItem
        For i = 1 To mfgItem.Rows - 2
            If UCase(Trim(txtItemModel.Text)) = UCase(Trim(.TextMatrix(i, 0))) Then
                MsgBox "คุณเลือกรายการสินค้าซ้ำ!", vbOKOnly + vbCritical, "Sales Order"
                txtItemModel.SetFocus
                txtItemModel.SelStart = 0
                txtItemModel.SelLength = Len(txtItemModel.Text)
                Exit Sub
            End If
        Next
    End With

    With mfgItem
        NewRow = .Rows - 1
        .TextMatrix(NewRow, 0) = Trim(txtItemModel.Text)         'รหัสสินค้า
        .TextMatrix(NewRow, 1) = Trim(lblName.Caption)
        .TextMatrix(NewRow, 2) = Trim(lblItemType.Caption)
        .TextMatrix(NewRow, 3) = Trim(lblBrandName.Caption)
        .TextMatrix(NewRow, 4) = lblSellPrice.Caption
        .TextMatrix(NewRow, 5) = mskAmount.Text
        .TextMatrix(NewRow, 6) = lblNet.Caption
        .TextMatrix(NewRow, 7) = DataEnInventories.rsSale01.Fields("ItemTypeID") 'rsItem.Fields("ItemTypeCode")
        .Rows = .Rows + 1
    End With
        Call CalculateNetTotal
        Call ClearItemData
        Call OrderItemGrid
        MFGRowColor mfgItem, 57, 253, 218
        cmdAddToDatabase.Enabled = True
        txtItemModel.SetFocus
End Sub

Private Sub cmdAddToDatabase_Click()
Dim i As Integer
Dim tmpItemModel As String
Dim tmpNumberInStock As Integer
Dim tmpItemNum As String
Dim lngYear, lngMonth, lngDay, lngDate As Long

If MsgBox("คุณต้องการบันทึกรายการขายหมายเลข " & lblSO.Caption & " ใช่หรือไม่? ", vbYesNo + vbQuestion, "Sales Order") = vbYes Then
    MsgBox "บันทึกการขาย เรียบร้อยแล้ว", vbOKOnly + vbInformation, "Sales Order"

    If (txtName.Text = "") Or (txtAddress.Text = "") Then
        MsgBox "กรุณาใส่ข้อมูลลูกค้าให้ครบด้วย !", vbOKOnly + vbInformation, "Sales Order"
        txtName.SetFocus
        Exit Sub
    End If
    
        lngYear = Year(Date)
        lngMonth = Month(Date)
        lngDay = Day(Date)
        lngDate = lngYear * 10000 + lngMonth * 100 + lngDay
DataEnInventories.InsertCustomerOrder lblSO.Caption, txtName.Text, txtAddress.Text, lblToday.Caption, lblNetTotal.Caption, lngDate
Call AutoCreateTLCode
        
    With mfgItem
        For i = 1 To .Rows - 2
            tmpItemModel = .TextMatrix(i, 0)
            
            tmpItemNum = (Val(.TextMatrix(i, 5)) * Val(mskCustomerOrder.Text))
            
            DataEnInventories.InsertCustomerOrderDetail lblSO.Caption, tmpItemModel, txtOrderDetail.Text, tmpItemNum, Val(.TextMatrix(i, 6) * Val(mskCustomerOrder.Text))
            
            tmpItemNum = "-" & Val(.TextMatrix(i, 5)) * Val(mskCustomerOrder.Text)
            DataEnInventories.InsertTransactionLOGsale tmpTLCode, tmpItemModel, tmpItemNum, Date, lblSO.Caption
        
        Next
    End With
        
    DataEnInventories.UpdateRunningNumberSOcode lblSO.Caption, tmpTLCode
    Call ClearItemData
    Call cmdDelete_Click
    Call AutoCreateSOCode
    txtName.Text = ""
    txtName.SetFocus
    txtAddress.Text = ""
    mskCustomerOrder.Text = "1"
Else
End If
End Sub

Private Sub cmdCalculate_Click()
    Call CalculateNetTotal
End Sub

Private Sub cmdDelete_Click()
Dim i As Integer
    For i = 1 To mfgItem.Rows - 2
        If mfgItem.Rows > 2 Then
            mfgItem.Rows = mfgItem.Rows - 1
        End If
    Next
    With mfgItem
        .TextMatrix(1, 0) = ""
        .TextMatrix(1, 1) = ""
        .TextMatrix(1, 2) = ""
        .TextMatrix(1, 3) = ""
        .TextMatrix(1, 4) = ""
        .TextMatrix(1, 5) = ""
        .TextMatrix(1, 6) = ""
    End With
    lblNetTotalPerOne.Caption = ""
    lblNetTotal.Caption = ""
    
    txtItemModel.SetFocus
End Sub

Private Sub mfgItem_DblClick()
Dim GRow As Integer

GRow = mfgItem.Row
If mfgItem.Rows = 2 Then Exit Sub
If mfgItem.TextMatrix(GRow, 0) = "" Then Exit Sub

With mfgItem
    txtItemModel.Text = .TextMatrix(.Row, 0)
    lblName.Caption = .TextMatrix(.Row, 1)
    lblItemType.Caption = .TextMatrix(.Row, 2)
    lblBrandName.Caption = .TextMatrix(.Row, 3)
    lblSellPrice.Caption = .TextMatrix(.Row, 4)
    mskAmount.Text = .TextMatrix(.Row, 5)
    lblNet.Caption = .TextMatrix(.Row, 6)
    .RemoveItem GRow
    If .Rows = 2 Then
        cmdAddToDatabase.Enabled = False
    End If
End With
    Call CalculateNetTotal
    MFGRowColor mfgItem, 57, 253, 218
End Sub

Private Sub mskAmount_Change()
    With DataEnInventories.rsSale01 'rsItem
        If (Not .EOF) Or (Not .BOF) Then
            lblNet.Caption = .Fields("SellPrice").Value * Val(mskAmount.Text)
        End If
    End With
End Sub

Private Sub mskAmount_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Call cmdAddItem_Click
    End If
End Sub

Private Sub mskCustomerOrder_Change()
    Call CalculateNetTotal
End Sub

Private Sub txtAddress_KeyPress(KeyAscii As Integer)
    If txtAddress.Text = "" Then Exit Sub
    
    If KeyAscii = 13 Then
        SendKeys "{Tab}"
        KeyAscii = 0
    End If
End Sub

Private Sub CalculateNetTotal()
Dim i As Integer
Dim tmpNetTotal As Long
Dim tmpNetTotalPerOne As Long

tmpNetTotalPerOne = 0
tmpNetTotal = 0

    With mfgItem
        For i = 1 To .Rows - 2
            tmpNetTotal = tmpNetTotal + (Val(mskCustomerOrder.Text) * Val(.TextMatrix(i, 4)) * Val(.TextMatrix(i, 5)))
            tmpNetTotalPerOne = tmpNetTotalPerOne + Val(.TextMatrix(i, 4)) * Val(.TextMatrix(i, 5))
        Next
    End With
    
    lblNetTotalPerOne.Caption = Format(tmpNetTotalPerOne, "#,000.00")
    lblNetTotal.Caption = Format(tmpNetTotal, "#,000.00")
End Sub

Private Sub OrderItemGrid()
    With mfgItem
        .TextMatrix(0, 0) = "รหัสสินค้า"
        .TextMatrix(0, 1) = "ชื่อสินค้า"
        .TextMatrix(0, 2) = "ประเภทสินค้า"
        .TextMatrix(0, 3) = "ยี่ห้อ"
        .TextMatrix(0, 4) = "ราคาขาย/หน่วย"
        .TextMatrix(0, 5) = "จำนวน"
        .TextMatrix(0, 6) = "รวมเป็นเงิน"
        
        .ColWidth(0) = 900
        .ColWidth(1) = 2900
        .ColWidth(2) = 1200
        .ColWidth(3) = 1200
        .ColWidth(4) = 1350
        .ColWidth(5) = 800
        .ColWidth(6) = 1000
        .ColWidth(7) = 0
    End With
End Sub

Private Sub AutoCreateSOCode()
Dim tmpRunningNumber As String

With DataEnInventories.rsSOCode
    If .State = adStateOpen Then .Close
    .Open
        If .RecordCount = 0 Then
            .AddNew
            .Fields("SOCode").Value = "0000000001"
            .Update
            tmpRunningNumber = "0000000001"
        ElseIf (.Fields("SOCode").Value = "") Or (IsNull(.Fields("SOCode").Value)) Then
            tmpRunningNumber = "0000000001"
        Else
            tmpRunningNumber = Format(Right$(.Fields("SOCode").Value, 10) + 1, "0000000000")
        End If
End With
    lblSO.Caption = "SO-" & tmpRunningNumber
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

Private Sub ClearItemData()
    txtItemModel.Text = ""
    lblName.Caption = ""
    lblItemType.Caption = ""
    lblBrandName.Caption = ""
    lblSellPrice.Caption = ""
    mskAmount.Text = ""
    lblNet = ""
End Sub

Private Sub cmdExit_Click()
    If MsgBox("คุณต้องการออกจากหน้าจอการขาย ใช่หรือไม่?", vbYesNo + vbQuestion, "คำยืนยัน") = vbYes Then
        Unload Me
    End If
End Sub

Private Sub txtName_KeyPress(KeyAscii As Integer)
    If txtName.Text = "" Then Exit Sub
    
    If KeyAscii = 13 Then
        SendKeys "{Tab}"
        KeyAscii = 0
    End If
End Sub

