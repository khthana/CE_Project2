VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Begin VB.Form frmSaleItemList 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Sale Item List"
   ClientHeight    =   3990
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   6375
   Icon            =   "frmSaleItemList.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3990
   ScaleWidth      =   6375
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
Attribute VB_Name = "frmSaleItemList"
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

With DataEnInventories.rsSelectInventoryDetail
    If .State = adStateOpen Then .Close
    .Open

        If .RecordCount = 0 Then
            Unload frmItemList
            MsgBox "ไม่มีรายการสินค้าตามที่คุณต้องการ !", vbOKOnly + vbInformation, "Sales Order"
        Else
            Set mfgItemList.DataSource = DataEnInventories.rsSelectInventoryDetail
            With mfgItemList
                .TextMatrix(0, 0) = "รหัสสินค้า"
                .TextMatrix(0, 1) = "ชื่อสินค้า"
                                
                .ColWidth(0) = 2000
                .ColWidth(1) = 2000
                
            End With
        End If
End With
End Sub

Private Sub mfgItemList_Click()
    With mfgItemList
        tmpSaleItemID = Trim(.TextMatrix(.Row, 0))
        tmpSaleItemName = Trim(.TextMatrix(.Row, 1))
        'tmpBrandName = Trim(.TextMatrix(.Row, 2))
        'tmpItemTypeCode = Trim(.TextMatrix(.Row, 3))
        'tmpCost = Trim(.TextMatrix(.Row, 4))
        'tmpSellPrice = Trim(.TextMatrix(.Row, 5))

    End With
        frmSaleItemList.Hide
End Sub

