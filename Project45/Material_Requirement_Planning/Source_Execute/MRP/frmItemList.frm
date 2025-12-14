VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Begin VB.Form frmItemList 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ItemDetail"
   ClientHeight    =   4005
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6420
   Icon            =   "frmItemList.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4005
   ScaleWidth      =   6420
   StartUpPosition =   2  'CenterScreen
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid mfgItemList 
      Height          =   3735
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6135
      _ExtentX        =   10821
      _ExtentY        =   6588
      _Version        =   393216
      FixedCols       =   0
      BackColorBkg    =   12632256
      Appearance      =   0
      _NumberOfBands  =   1
      _Band(0).Cols   =   2
   End
End
Attribute VB_Name = "frmItemList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
Dim hSysMenu As Long

hSysMenu = GetSystemMenu(Me.hwnd, False)
RemoveMenu hSysMenu, 6, MF_REMOVE Or MF_BYPOSITION
RemoveMenu hSysMenu, 5, MF_REMOVE Or MF_BYPOSITION
End Sub

Private Sub Form_Activate()

With DataEnInventories.rsparameterItemPurchase
    If .State = adStateOpen Then .Close
'    .Open
DataEnInventories.parameterItemPurchase tmpSupplierCode
End With
    
With DataEnInventories.rsparameterItemPurchase
    'If .State = adStateOpen Then .Close
    '.Open

        If .RecordCount = 0 Then
            Unload frmItemList
            MsgBox "ไม่มีรายการสินค้าตามที่คุณต้องการ !", vbOKOnly + vbInformation, "ItemDetail"
        Else
            Set mfgItemList.DataSource = DataEnInventories.rsparameterItemPurchase
            With mfgItemList
                .TextMatrix(0, 0) = "รหัสสินค้า"
                .TextMatrix(0, 1) = "ชื่อสินค้า"
                .TextMatrix(0, 2) = "ยี่ห้อ"
                .TextMatrix(0, 3) = "รุ่นสินค้า"
                .TextMatrix(0, 4) = "ต้นทุน"
                .TextMatrix(0, 5) = "ราคาขาย"
                
                .ColWidth(0) = 1000
                .ColWidth(1) = 1000
                .ColWidth(2) = 1000
                .ColWidth(3) = 1000
                .ColWidth(4) = 1000
                .ColWidth(5) = 1000
                .ColWidth(6) = 0
                .ColWidth(7) = 0
            End With
        End If
End With
End Sub

Private Sub mfgItemList_Click()
    With mfgItemList
        tmpItemModel = Trim(.TextMatrix(.Row, 0))
        tmpShortName = Trim(.TextMatrix(.Row, 1))
        tmpBrandName = Trim(.TextMatrix(.Row, 2))
        tmpItemTypeCode = Trim(.TextMatrix(.Row, 3))
        tmpCost = Trim(.TextMatrix(.Row, 4))
        tmpSellPrice = Trim(.TextMatrix(.Row, 5))

    End With
        frmItemList.Hide
End Sub
