VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.Form frmItemSendToday 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "ตรวจสอบรายการสินค้าที่ยังไม่ได้รับ"
   ClientHeight    =   6375
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10935
   Icon            =   "frmItemSendToday.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6375
   ScaleWidth      =   10935
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "ระบุเงื่อนไข"
      ForeColor       =   &H80000008&
      Height          =   1215
      Left            =   120
      TabIndex        =   3
      Top             =   120
      Width           =   10695
      Begin VB.CommandButton cmdOK 
         Caption         =   "ตกลง"
         Height          =   375
         Left            =   4440
         MouseIcon       =   "frmItemSendToday.frx":27A2
         MousePointer    =   99  'Custom
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   480
         Width           =   1695
      End
      Begin MSMask.MaskEdBox mskEnd 
         Height          =   315
         Left            =   2880
         TabIndex        =   1
         Top             =   480
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   556
         _Version        =   393216
         Appearance      =   0
         MaxLength       =   10
         Mask            =   "##########"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox mskStart 
         Height          =   315
         Left            =   720
         TabIndex        =   0
         Top             =   480
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   556
         _Version        =   393216
         Appearance      =   0
         MaxLength       =   10
         Mask            =   "##########"
         PromptChar      =   "_"
      End
      Begin VB.Label lblPOEnd 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "PO-"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   2520
         TabIndex        =   6
         Top             =   480
         Width           =   375
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "ถึง:"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   2160
         TabIndex        =   5
         Top             =   480
         Width           =   255
      End
      Begin VB.Label lblPOStart 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "PO-"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   360
         TabIndex        =   4
         Top             =   480
         Width           =   375
      End
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid mfgItemList 
      Height          =   4815
      Left            =   120
      TabIndex        =   2
      Top             =   1440
      Width           =   10695
      _ExtentX        =   18865
      _ExtentY        =   8493
      _Version        =   393216
      FixedCols       =   0
      BackColorBkg    =   12632256
      Appearance      =   0
      _NumberOfBands  =   1
      _Band(0).Cols   =   2
   End
End
Attribute VB_Name = "frmItemSendToday"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
frmItemSendToday.WindowState = 2

End Sub

Private Sub cmdOK_Click()
Dim POStart As String
Dim POEnd As String
If (mskStart.Text = "__________") Or (mskEnd.Text = "__________") Then Exit Sub

    POStart = "PO-" & mskStart.Text
    POEnd = "PO-" & mskEnd.Text
    
    With DataEnInventories.rsSelectPurchase ' rsItemList
        If .State = adStateOpen Then .Close
        DataEnInventories.SelectPurchase POStart, POEnd
            If .RecordCount = 0 Then
                MsgBox "ไม่มีรายการสั่งซื้อสินค้าตามที่คุณต้องการ", vbOKOnly + vbInformation, "Item Purchase"
                Set mfgItemList.DataSource = DataEnInventories.rsSelectPurchase 'rsItemList
                mfgItemList.Refresh
                Call OrderGrid
                mskStart.Text = "__________"
                mskStart.SetFocus
                mskEnd.Text = "__________"
                Exit Sub
            Else
                Set mfgItemList.DataSource = DataEnInventories.rsSelectPurchase 'rsItemList
                Call OrderGrid
                MFGRowColor mfgItemList, 57, 253, 218
            End If
    End With
End Sub

Private Sub OrderGrid()
    With mfgItemList
        .ColWidth(0) = 1500
        .ColWidth(1) = 1100
        .ColWidth(2) = 1600
        .ColWidth(3) = 1000
        .ColWidth(4) = 3000
        .ColWidth(5) = 0
        .ColWidth(6) = 1000
        .ColWidth(7) = 0
        .ColWidth(8) = 1000
        .ColWidth(9) = 0
              
        .TextMatrix(0, 0) = "ลำดับรายการใบ PO"
        .TextMatrix(0, 1) = "รหัสสินค้า"
        .TextMatrix(0, 2) = "ชื่อสินค้า"
        .TextMatrix(0, 3) = "จำนวนสินค้า"
        .TextMatrix(0, 4) = "ตัวแทนจำหน่าย"
        .TextMatrix(0, 6) = "วันสั่งสินค้า"
        .TextMatrix(0, 8) = "วันรับสินค้า"
    End With
End Sub

Private Sub mskEnd_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then Call cmdOK_Click
End Sub

Private Sub mskStart_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        SendKeys "{Tab}"
        KeyAscii = 0
    End If
End Sub
