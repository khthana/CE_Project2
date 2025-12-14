VERSION 5.00
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Begin VB.Form frmAllItemLowLimit 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "ตรวจสอบรายการสินค้าที่ต้องสั่งซื้อ"
   ClientHeight    =   6495
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11895
   Icon            =   "frmAllItemLowLimit.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6495
   ScaleWidth      =   11895
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid mfgItemList 
      Height          =   4695
      Left            =   240
      TabIndex        =   4
      Top             =   1560
      Width           =   11415
      _ExtentX        =   20135
      _ExtentY        =   8281
      _Version        =   393216
      Cols            =   3
      FixedCols       =   0
      BackColorBkg    =   12632256
      Appearance      =   0
      _NumberOfBands  =   1
      _Band(0).Cols   =   3
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "ระบุประเภทสินค้า"
      ForeColor       =   &H80000008&
      Height          =   975
      Left            =   240
      TabIndex        =   0
      Top             =   480
      Width           =   4095
      Begin VB.CommandButton cmdOK 
         Caption         =   "ตกลง"
         Height          =   375
         Left            =   1920
         MouseIcon       =   "frmAllItemLowLimit.frx":27A2
         MousePointer    =   99  'Custom
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   360
         Width           =   1935
      End
      Begin MSDataListLib.DataCombo dcbItemType 
         Bindings        =   "frmAllItemLowLimit.frx":2AAC
         DataField       =   "ItemTypeName"
         DataMember      =   "SelectItemType"
         DataSource      =   "DataEnInventories"
         Height          =   315
         Left            =   240
         TabIndex        =   1
         Top             =   360
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   556
         _Version        =   393216
         Appearance      =   0
         Text            =   ""
      End
   End
   Begin VB.Label lblItemNum 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "รวมทั้งสิ้น : รายการ"
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   9240
      TabIndex        =   3
      Top             =   1080
      Width           =   2415
   End
End
Attribute VB_Name = "frmAllItemLowLimit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
frmAllItemLowLimit.WindowState = 2

    Set dcbItemType.RowSource = DataEnInventories.rsSelectItemType
    dcbItemType.ListField = "ItemTypeName"
    dcbItemType.BoundColumn = "ItemTypeID"
End Sub

Private Sub cmdOK_Click()
Dim sqlItemList As String
If dcbItemType.BoundText = "" Then Exit Sub


With DataEnInventories.rsSelectItemLowLimit
    If .State = adStateOpen Then .Close
'    .Open
DataEnInventories.SelectItemLowLimit dcbItemType.Text
End With

With DataEnInventories.rsSelectItemLowLimit
        If .RecordCount = 0 Then
            MsgBox "ไม่มีรายการสินค้าที่ต้องสั่งซื้อ ", vbOKOnly + vbInformation, "Item Low Limit"
            Set mfgItemList.DataSource = DataEnInventories.rsSelectItemLowLimit
            mfgItemList.Refresh
            lblItemNum.Caption = "รวมทั้งสิ้น : รายการ"
            Call OrderGrid
            dcbItemType.SetFocus
            Exit Sub
        Else
            Set mfgItemList.DataSource = DataEnInventories.rsSelectItemLowLimit 'rsItemList
            lblItemNum.Caption = "รวมทั้งสิ้น : " & .RecordCount & " รายการ"
            Call OrderGrid
        End If
End With
    MFGRowColor mfgItemList, 57, 253, 218
End Sub

Private Sub OrderGrid()
    With mfgItemList
        .ColWidth(0) = 1500
        .ColWidth(1) = 1500
        .ColWidth(2) = 1000
        .ColWidth(3) = 1000
        .ColWidth(4) = 1000
        .ColWidth(5) = 0
        .ColWidth(6) = 1500
        .ColWidth(7) = 0
        .ColWidth(8) = 1000
        .ColWidth(9) = 1000
              
        .TextMatrix(0, 0) = "รหัสสินค้า"
        .TextMatrix(0, 1) = "ชื่อสินค้า"
        .TextMatrix(0, 2) = "ยี่ห้อ"
        .TextMatrix(0, 3) = "ราคา"
        .TextMatrix(0, 4) = "จำนวนสินค้าที่มี"
        
        .TextMatrix(0, 6) = "ตัวแทนจำหน่าย"
        .TextMatrix(0, 8) = "รหัสชนิดสินค้า"
        .TextMatrix(0, 9) = "ชนิดสินค้า"
    End With
End Sub

Private Sub dcbItemType_KeyDown(KeyCode As Integer, Shift As Integer)
    KeyCode = 0
End Sub

Private Sub dcbItemType_KeyPress(KeyAscii As Integer)
    KeyAscii = 0
End Sub
