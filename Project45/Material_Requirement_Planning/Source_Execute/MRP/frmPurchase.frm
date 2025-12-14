VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmPurchase 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "ใบสั่งสินค้า"
   ClientHeight    =   7095
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11655
   Icon            =   "frmPurchase.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   7095
   ScaleWidth      =   11655
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "ข้อมูลการสั่ง"
      ForeColor       =   &H80000008&
      Height          =   2175
      Left            =   120
      TabIndex        =   36
      Top             =   0
      Width           =   9795
      Begin VB.CommandButton cmdSupplierList 
         Caption         =   ">"
         Height          =   255
         Left            =   3240
         MouseIcon       =   "frmPurchase.frx":0CCA
         MousePointer    =   99  'Custom
         TabIndex        =   39
         Top             =   720
         Width           =   270
      End
      Begin MSComCtl2.DTPicker dtpReceivedItem 
         Height          =   315
         Left            =   1560
         TabIndex        =   37
         Top             =   1680
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   556
         _Version        =   393216
         Format          =   19595264
         CurrentDate     =   37595
      End
      Begin MSComCtl2.DTPicker dtpDueDate 
         Height          =   315
         Left            =   1560
         TabIndex        =   38
         Top             =   1320
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   556
         _Version        =   393216
         Format          =   19595264
         CurrentDate     =   37595
      End
      Begin VB.TextBox txtSupplierCode 
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         Height          =   315
         Left            =   1560
         TabIndex        =   0
         Top             =   720
         Width           =   1935
      End
      Begin VB.Label lblToday 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   6480
         TabIndex        =   47
         Top             =   360
         Width           =   2415
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "วันสั่งซื้อ : "
         ForeColor       =   &H80000008&
         Height          =   252
         Left            =   5760
         TabIndex        =   45
         Top             =   360
         Width           =   732
      End
      Begin VB.Label Label3 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "ตัวแทนจำหน่าย : "
         ForeColor       =   &H80000008&
         Height          =   252
         Left            =   120
         TabIndex        =   44
         Top             =   720
         Width           =   1452
      End
      Begin VB.Label Label5 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "วันชำระเงิน : "
         ForeColor       =   &H80000008&
         Height          =   252
         Left            =   600
         TabIndex        =   43
         Top             =   1320
         Width           =   972
      End
      Begin VB.Label Label8 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "วันรับสินค้า : "
         ForeColor       =   &H80000008&
         Height          =   252
         Left            =   600
         TabIndex        =   42
         Top             =   1680
         Width           =   972
      End
      Begin VB.Label lblPORunningNumber 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   1560
         TabIndex        =   41
         Top             =   360
         Width           =   1935
      End
      Begin VB.Label lblSupplierName 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   495
         Left            =   3600
         TabIndex        =   40
         Top             =   720
         Width           =   5295
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         BackColor       =   &H80000013&
         Caption         =   "เลขที่ : PO- "
         ForeColor       =   &H80000001&
         Height          =   252
         Left            =   120
         TabIndex        =   46
         Top             =   360
         Width           =   1452
      End
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "ข้อมูลสินค้า"
      ForeColor       =   &H80000008&
      Height          =   4725
      Left            =   120
      TabIndex        =   6
      Top             =   2280
      Width           =   9795
      Begin VB.CommandButton cmdAddItem 
         Caption         =   "เพิ่มสินค้า"
         Height          =   585
         Left            =   8520
         MouseIcon       =   "frmPurchase.frx":0FD4
         MousePointer    =   99  'Custom
         TabIndex        =   10
         Top             =   240
         Width           =   1155
      End
      Begin VB.CommandButton cmdItemList 
         Caption         =   ">"
         Height          =   270
         Left            =   1290
         MouseIcon       =   "frmPurchase.frx":12DE
         MousePointer    =   99  'Custom
         TabIndex        =   8
         Top             =   500
         Width           =   270
      End
      Begin MSMask.MaskEdBox mskVAT 
         Height          =   315
         Left            =   720
         TabIndex        =   7
         Top             =   3480
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   556
         _Version        =   393216
         Appearance      =   0
         Format          =   "##"
         PromptChar      =   "_"
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid mfgItem 
         Height          =   2055
         Left            =   60
         TabIndex        =   9
         Top             =   960
         Width           =   9615
         _ExtentX        =   16960
         _ExtentY        =   3625
         _Version        =   393216
         Cols            =   8
         FixedCols       =   0
         BackColorBkg    =   12632256
         Appearance      =   0
         _NumberOfBands  =   1
         _Band(0).Cols   =   8
      End
      Begin MSMask.MaskEdBox mskDiscount 
         Height          =   315
         Left            =   720
         TabIndex        =   11
         Top             =   3120
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   556
         _Version        =   393216
         Appearance      =   0
         Format          =   "##"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskAmount 
         Height          =   315
         Left            =   6720
         TabIndex        =   2
         Top             =   480
         Width           =   555
         _ExtentX        =   979
         _ExtentY        =   556
         _Version        =   393216
         Appearance      =   0
         Format          =   "###"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtItemModel 
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         DataField       =   "pr_code"
         DataSource      =   "Adodc1"
         Height          =   315
         Left            =   60
         MaxLength       =   13
         TabIndex        =   1
         Top             =   480
         Width           =   1515
      End
      Begin VB.Label Label9 
         BackColor       =   &H80000013&
         Caption         =   "รหัสสินค้า : "
         ForeColor       =   &H80000001&
         Height          =   195
         Left            =   120
         TabIndex        =   35
         Top             =   240
         Width           =   1425
      End
      Begin VB.Label Label10 
         BackColor       =   &H00C0C0C0&
         Caption         =   "ชื่อสินค้า :"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Index           =   0
         Left            =   1560
         TabIndex        =   34
         Top             =   240
         Width           =   855
      End
      Begin VB.Label Label11 
         BackColor       =   &H00C0C0C0&
         Caption         =   "รุ่น :"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   4320
         TabIndex        =   33
         Top             =   240
         Width           =   495
      End
      Begin VB.Label Label13 
         BackColor       =   &H00C0C0C0&
         Caption         =   "ราคา :"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Index           =   0
         Left            =   5640
         TabIndex        =   32
         Top             =   240
         Width           =   525
      End
      Begin VB.Label Label16 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "รวมเป็นเงิน :"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   7320
         TabIndex        =   31
         Top             =   240
         Width           =   945
      End
      Begin VB.Label Label20 
         BackColor       =   &H00C0C0C0&
         Caption         =   "ภาษีมูลค่าเพิ่ม :"
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   6360
         TabIndex        =   30
         Top             =   3840
         Width           =   1575
      End
      Begin VB.Label Label19 
         BackColor       =   &H00C0C0C0&
         Caption         =   "ยอดสุทธิ :"
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   6360
         TabIndex        =   29
         Top             =   4200
         Width           =   1575
      End
      Begin VB.Label Label18 
         BackColor       =   &H00C0C0C0&
         Caption         =   "ส่วนลด :"
         ForeColor       =   &H00C00000&
         Height          =   315
         Index           =   0
         Left            =   120
         TabIndex        =   28
         Top             =   3120
         Width           =   675
      End
      Begin VB.Label Label17 
         BackColor       =   &H00C0C0C0&
         Caption         =   "ยอดสุทธิก่อนหักส่วนลด :"
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   6360
         TabIndex        =   27
         Top             =   3120
         Width           =   1815
      End
      Begin VB.Label Label10 
         BackColor       =   &H00C0C0C0&
         Caption         =   "ยี่ห้อ :"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Index           =   1
         Left            =   3360
         TabIndex        =   26
         Top             =   240
         Width           =   465
      End
      Begin VB.Label Label13 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "จำนวน :"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Index           =   1
         Left            =   6720
         TabIndex        =   25
         Top             =   240
         Width           =   585
      End
      Begin VB.Label Label18 
         BackColor       =   &H00C0C0C0&
         Caption         =   "%"
         ForeColor       =   &H00C00000&
         Height          =   195
         Index           =   1
         Left            =   1560
         TabIndex        =   24
         Top             =   3480
         Width           =   195
      End
      Begin VB.Label Label7 
         BackColor       =   &H00C0C0C0&
         Caption         =   "ส่วนลด :"
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   6360
         TabIndex        =   23
         Top             =   3480
         Width           =   1575
      End
      Begin VB.Label lblName 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   1560
         TabIndex        =   22
         Top             =   480
         Width           =   1815
      End
      Begin VB.Label lblBrand 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   3360
         TabIndex        =   21
         Top             =   480
         Width           =   975
      End
      Begin VB.Label lblModel 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   4320
         TabIndex        =   20
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label lblCost 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   5640
         TabIndex        =   19
         Top             =   480
         Width           =   1095
      End
      Begin VB.Label Label21 
         BackColor       =   &H00C0C0C0&
         Caption         =   "VAT :"
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   120
         TabIndex        =   18
         Top             =   3480
         Width           =   495
      End
      Begin VB.Label Label22 
         BackColor       =   &H00C0C0C0&
         Caption         =   "%"
         ForeColor       =   &H00C00000&
         Height          =   195
         Left            =   1560
         TabIndex        =   17
         Top             =   3120
         Width           =   135
      End
      Begin VB.Label lblBeforeDiscount 
         Alignment       =   1  'Right Justify
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
         Left            =   8280
         TabIndex        =   16
         Top             =   3120
         Width           =   1335
      End
      Begin VB.Label lblDiscount 
         Alignment       =   1  'Right Justify
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
         Left            =   8280
         TabIndex        =   15
         Top             =   3480
         Width           =   1335
      End
      Begin VB.Label lblVAT 
         Alignment       =   1  'Right Justify
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
         Left            =   8280
         TabIndex        =   14
         Top             =   3840
         Width           =   1335
      End
      Begin VB.Label lblNetTotal 
         Alignment       =   1  'Right Justify
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
         Left            =   8280
         TabIndex        =   13
         Top             =   4200
         Width           =   1335
      End
      Begin VB.Label lblNet 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   7320
         TabIndex        =   12
         Top             =   480
         Width           =   1095
      End
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "ลบรายการสินค้า"
      Height          =   855
      Left            =   10080
      MouseIcon       =   "frmPurchase.frx":15E8
      MousePointer    =   99  'Custom
      Picture         =   "frmPurchase.frx":18F2
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   1800
      Width           =   1455
   End
   Begin VB.CommandButton cmdCalculate 
      Caption         =   "คำนวณค่าสินค้า"
      Height          =   855
      Left            =   10080
      MouseIcon       =   "frmPurchase.frx":1D34
      MousePointer    =   99  'Custom
      Picture         =   "frmPurchase.frx":203E
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   960
      Width           =   1455
   End
   Begin VB.CommandButton cmdAddToDatabase 
      Caption         =   "บันทึกการสั่งซื้อ"
      Height          =   855
      Left            =   10080
      MouseIcon       =   "frmPurchase.frx":2480
      MousePointer    =   99  'Custom
      Picture         =   "frmPurchase.frx":278A
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   120
      Width           =   1455
   End
End
Attribute VB_Name = "frmPurchase"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'รายการสินค้าที่สั่งซื้อ

Private Sub Form_Load()
    frmPurchase.WindowState = 2
    lblToday.Caption = Format(Date, "dd mmmm yyyy")
    dtpDueDate.Value = Format(DateAdd("m", 1, Date), "dd mm yyyy")
    dtpReceivedItem.Value = Format(DateAdd("d", 5, Date), "dd mm yyyy")
    
    Call AutoCreatePOCode
    
    mskVAT.Text = 0
    mskDiscount.Text = 0
    cmdAddToDatabase.Enabled = False
    Call OrderItemGrid
End Sub




Private Sub txtSupplierCode_Change()
txtItemModel.Text = ""
Call ClearItemData
End Sub

Private Sub txtSupplierCode_KeyPress(KeyAscii As Integer)

If txtSupplierCode.Text = "" Then Exit Sub
    
    If KeyAscii = 13 Then
        
        With DataEnInventories.rsparameterSupplier
        If .State = adStateOpen Then .Close

        DataEnInventories.parameterSupplier txtSupplierCode.Text
        
                    If .RecordCount = 0 Then
                    MsgBox "ไม่มีชื่อ Supplier ตามที่คุณต้องการ !", vbOKOnly + vbInformation, "Purchase"
                    txtSupplierCode.SetFocus
                    txtSupplierCode.SelStart = 0
                    txtSupplierCode.SelLength = Len(txtSupplierCode.Text)
                    Exit Sub
                Else
                       txtSupplierCode.Text = .Fields("SupplierID").Value
                        lblSupplierName.Caption = .Fields("SupplierNameEnglish").Value
                        
                        SendKeys "{Tab}"
                        KeyAscii = 0
                End If
        End With
    End If
End Sub

Private Sub txtItemModel_KeyPress(KeyAscii As Integer)
Dim sqlItem As String

If KeyAscii = 13 Then
    If txtSupplierCode.Text = "" Then
        MsgBox "กรุณาเลือกบริษัทตัวแทนจำหน่ายสินค้าก่อน !", vbOKOnly + vbExclamation, "ข้อผิดพลาด"
        txtSupplierCode.SetFocus
    End If
    
    If txtItemModel.Text = "" Then Exit Sub

    With DataEnInventories.rsparameterItemDetail
        If .State = adStateOpen Then .Close
        '.Open

        DataEnInventories.parameterItemDetail txtSupplierCode.Text, txtItemModel.Text
        If .RecordCount = 0 Then
                MsgBox "รหัสสินค้าที่คุณต้องการไม่มี ", vbOKOnly + vbInformation, "ผลการตรวจสอบ"
                txtItemModel.SetFocus
                txtItemModel.SelStart = 0
                txtItemModel.SelLength = Len(txtItemModel.Text)
                Exit Sub
            Else
                With DataEnInventories.rsparameterItemDetail
                    txtItemModel.Text = UCase(txtItemModel.Text)
                    lblName.Caption = .Fields("ItemName").Value
                    lblBrand.Caption = UCase(.Fields("BrandName").Value)
                    lblModel.Caption = UCase(.Fields("Version").Value)
                    lblCost.Caption = .Fields("SellPrice").Value
                    lblNet.Caption = lblCost.Caption
                    tmpItemTypeCode = Trim(.Fields("ItemTypeID").Value)
                End With
                    SendKeys "{Tab}"
                    
                    DataEnInventories.parameterInventoryLotSize txtItemModel.Text
                    With DataEnInventories.rsparameterInventoryLotSize
                    mskAmount.Text = .Fields("LotSize").Value
                    End With
                    
                    mskAmount.SelStart = 0
                    mskAmount.SelLength = Len(mskAmount.Text)
                    KeyAscii = 0
            End If
    End With
End If
End Sub

Private Sub cmdAddItem_Click()
Dim i As Integer
Dim NewRow As Integer

If txtItemModel.Text <> "" Then
    With DataEnInventories.rsparameterInventoryLotSize
        If .State = adStateOpen Then .Close
        '.Open
        DataEnInventories.parameterInventoryLotSize txtItemModel.Text
    End With
    With DataEnInventories.rsparameterInventoryLotSize
            If CInt(mskAmount.Text) < (.Fields("LotSize").Value) Then
            MsgBox "สั่งสินค้าน้อยกว่า LotSize !", vbOKOnly, "Warning"
            End If
    End With

If (txtItemModel.Text = "") Or (mskAmount.Text = "") Or (Val(mskAmount.Text) = 0) Or _
        (lblName.Caption = "") Then Exit Sub

    With mfgItem
        For i = 1 To mfgItem.Rows - 2
            If UCase(Trim(txtItemModel.Text)) = UCase(Trim(.TextMatrix(i, 0))) Then
                MsgBox "คุณเลือกรายการสินค้าซ้ำ!", vbOKOnly + vbCritical, "Purchase"
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
        .TextMatrix(NewRow, 2) = Trim(lblBrand.Caption)
        .TextMatrix(NewRow, 3) = Trim(lblModel.Caption)
        .TextMatrix(NewRow, 4) = lblCost.Caption
        .TextMatrix(NewRow, 5) = mskAmount.Text
        .TextMatrix(NewRow, 6) = lblNet.Caption
        .TextMatrix(NewRow, 7) = tmpItemTypeCode
        .Rows = .Rows + 1
    End With
    
    With mfgItem
        If .TextMatrix(1, 0) <> "" Then
        txtSupplierCode.Enabled = False
        cmdSupplierList.Enabled = False
        End If
    End With
    
    Call ClearItemData
    MFGRowColor mfgItem, 57, 253, 218
    cmdAddToDatabase.Enabled = True
    txtItemModel.Text = ""
    txtItemModel.SetFocus
    Call CalculateNetTotal
    End If
End Sub

Private Sub cmdAddToDatabase_Click()
Dim i As Integer
Dim tmpAmount As Single                 'ยอดรวมก่อนหักส่วนลด
Dim tmpDiscount As Single               'ส่วนลด
Dim tmpVAT As Single                       'ภาษีมูลค่าเพิ่ม
Dim tmpNet As Single                         'ยอดสุทธิ
Dim tmpPO_ID As String

If mfgItem.Rows = 2 Then Exit Sub

If MsgBox("คุณต้องการบันทึกใบสั่งซื้อหมายเลข " & lblPORunningNumber.Caption & " ใช่หรือไม่ ?", vbYesNo + vbQuestion, "Purchase") = vbYes Then
    MsgBox "บันทึกข้อมูล เรียบร้อยแล้ว", vbOKOnly + vbInformation, "Purchase"

Call AutoCreatePOCode

tmpPO_ID = "PO-" & lblPORunningNumber.Caption
'With DataEnInventories.rsInsertPurchase
        'If .State = adStateOpen Then .Close
        '.Open
        
        'DataEnInventories.InsertPurchase lblPORunningNumber.Caption, txtSupplierCode.Text, lblToday.Caption, dtpReceivedItem.Value, dtpDueDate.Value, lblNetTotal.Caption
        DataEnInventories.InsertPurchase tmpPO_ID, txtSupplierCode.Text, lblToday.Caption, dtpReceivedItem.Value, dtpDueDate.Value, lblNetTotal.Caption

'End With


'----------------------------------------------------------------

With mfgItem
    For i = 1 To mfgItem.Rows - 2
           
        tmpAmount = Val(.TextMatrix(i, 4)) * Val(.TextMatrix(i, 5))   'ยอดรวมก่อนหักส่วนลด
        tmpDiscount = tmpAmount * (Val(mskDiscount.Text) / 100)  'ส่วนลด
        tmpVAT = (tmpAmount - tmpDiscount) * (Val(mskVAT.Text / 100))  'ภาษีมูลค่าเพิ่ม
        tmpNet = (tmpAmount - tmpDiscount) + tmpVAT         'ยอดสุทธิ
           
          
        DataEnInventories.InsertPurchase_Detail tmpPO_ID, .TextMatrix(i, 0), .TextMatrix(i, 5), tmpDiscount, tmpVAT, tmpNet
    Next
End With

DataEnInventories.UpdateRunningNumber lblPORunningNumber.Caption

    Call AutoCreatePOCode
    Call cmdDelete_Click
    txtSupplierCode.Text = ""
    lblSupplierName.Caption = ""
    lblBeforeDiscount.Caption = ""
    lblDiscount.Caption = ""
    lblVAT.Caption = ""
    lblNetTotal.Caption = ""
    
    txtSupplierCode.Enabled = True
    cmdSupplierList.Enabled = True
    
    mskDiscount.Text = "0"
    mskVAT.Text = "0"
    
    
    txtSupplierCode.SetFocus
    cmdAddToDatabase.Enabled = False
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
        .TextMatrix(1, 7) = ""
    End With
    txtItemModel.SetFocus
End Sub

Private Sub cmdSupplierList_Click()
    frmSupplierList.Show vbModal
    txtSupplierCode.Text = tmpSupplierCode
    lblSupplierName.Caption = tmpSupplierName
End Sub

Private Sub cmdItemList_Click()
    If txtSupplierCode.Text = "" Then
        MsgBox "กรุณาเลือกบริษัทตัวแทนจำหน่ายสินค้าก่อน !", vbOKOnly + vbExclamation, "ข้อผิดพลาด"
        txtSupplierCode.SetFocus
        Exit Sub
    End If
    tmpSupplierCode = Trim(txtSupplierCode.Text)
    frmItemList.Show vbModal
    
    txtItemModel.Text = tmpItemModel
    lblName.Caption = tmpShortName
    lblBrand.Caption = tmpBrandName
    lblModel.Caption = tmpItemTypeCode
    lblCost.Caption = tmpCost
    lblNet.Caption = tmpCost
    
    mskAmount.SetFocus
    
    If txtItemModel.Text <> "" Then
    With DataEnInventories.rsparameterInventoryLotSize
        If .State = adStateOpen Then .Close
        DataEnInventories.parameterInventoryLotSize txtItemModel.Text
    End With
        With DataEnInventories.rsparameterInventoryLotSize
        mskAmount.Text = .Fields("LotSize").Value
        End With
    End If
    'mskAmount.Text = "10"
    mskAmount.SelStart = 0
    mskAmount.SelLength = Len(mskAmount.Text)
End Sub

Private Sub mfgItem_DblClick()
Dim GRow As Integer

GRow = mfgItem.Row
If mfgItem.Rows = 2 Then Exit Sub
If mfgItem.TextMatrix(GRow, 0) = "" Then Exit Sub

With mfgItem
    txtItemModel.Text = .TextMatrix(.Row, 0)
    lblName.Caption = .TextMatrix(.Row, 1)
    lblBrand.Caption = .TextMatrix(.Row, 2)
    lblModel.Caption = .TextMatrix(.Row, 3)
    lblCost.Caption = .TextMatrix(.Row, 4)
    mskAmount.Text = .TextMatrix(.Row, 5)
    lblNet.Caption = .TextMatrix(.Row, 6)
    tmpItemTypeCode = .TextMatrix(.Row, 7)
    .RemoveItem GRow
    If .Rows = 2 Then
        cmdAddToDatabase.Enabled = False
    End If
End With

    With mfgItem
        If .TextMatrix(1, 0) = "" Then
        txtSupplierCode.Enabled = True
        cmdSupplierList.Enabled = True
        End If
    End With

    Call CalculateNetTotal
    MFGRowColor mfgItem, 57, 253, 218
End Sub

Private Sub mskAmount_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then
    If (mskAmount.Text = "___") Or (Val(mskAmount.Text) = 0) Then Exit Sub
    Call cmdAddItem_Click
End If
End Sub

Private Sub mskAmount_Change()
    lblNet.Caption = Val(lblCost.Caption) * Val(mskAmount.Text)
End Sub

Private Sub mskDiscount_Change()
    Call CalculateNetTotal
End Sub

Private Sub mskVAT_Change()
    Call CalculateNetTotal
End Sub

Private Sub cmdExit_Click()
    If MsgBox("คุณต้องการออกจากหน้าจอการสั่งซื้อ ใช่หรือไม่?", vbYesNo + vbQuestion, "คำยืนยัน") = vbYes Then
        Unload Me
    End If
End Sub

Private Sub CalculateNetTotal()
Dim i As Integer
Dim tmpNet As Long

Dim tmpDiscountRate As Single
Dim tmpVATRate As Single

Dim tmpDiscount As Single
Dim tmpVAT As Single

tmpNet = 0
tmpDiscountRate = Format(Val(mskDiscount.Text) / 100, "00.00")
tmpVATRate = Format(Val(mskVAT.Text) / 100, "00.00")

With mfgItem
    For i = 1 To mfgItem.Rows - 2
        tmpNet = tmpNet + Val(.TextMatrix(i, 6))
    Next
End With
    lblBeforeDiscount.Caption = Format(tmpNet, "#,000.00")
    
    tmpDiscount = tmpNet * tmpDiscountRate
    lblDiscount.Caption = Format(tmpDiscount, "#,000.00")
    
    tmpVAT = (tmpNet - tmpDiscount) * tmpVATRate
    lblVAT.Caption = Format(tmpVAT, "#,000.00")
    
    lblNetTotal.Caption = Format(tmpNet - tmpDiscount + tmpVAT, "#,000.00")
End Sub

Private Sub ClearItemData()
    lblName.Caption = ""
    lblBrand.Caption = ""
    lblModel.Caption = ""
    lblCost.Caption = ""
    mskAmount.Text = ""
    lblNet.Caption = ""
End Sub

Private Sub OrderItemGrid()
    With mfgItem
        .TextMatrix(0, 0) = "รหัสสินค้า"
        .TextMatrix(0, 1) = "ชื่อสินค้า"
        .TextMatrix(0, 2) = "ยี่ห้อ"
        .TextMatrix(0, 3) = "รุ่น"
        .TextMatrix(0, 4) = "ราคา"
        .TextMatrix(0, 5) = "จำนวน"
        .TextMatrix(0, 6) = "รวมเป็นเงิน"
        
        .ColWidth(0) = 900
        .ColWidth(1) = 3200
        .ColWidth(2) = 1000
        .ColWidth(3) = 1350
        .ColWidth(4) = 900
        .ColWidth(5) = 800
        .ColWidth(6) = 1000
        .ColWidth(7) = 0
    End With
End Sub

Private Sub AutoCreatePOCode()
Dim tmpRunningNumber As String

With DataEnInventories.rsRunningNumber
    If .State = adStateOpen Then .Close
    .Open
        If .RecordCount = 0 Then
            .AddNew
            .Fields("PORunningNumber").Value = "0000000001"
            .Update
            tmpRunningNumber = "0000000001"
            ElseIf (.Fields("PORunningNumber").Value = "") Or (IsNull(.Fields("PORunningNumber").Value)) Then
                tmpRunningNumber = "0000000001"
        Else
                tmpRunningNumber = Format(.Fields("PORunningNumber").Value + 1, "0000000000")
        End If
End With
    lblPORunningNumber.Caption = tmpRunningNumber
End Sub

