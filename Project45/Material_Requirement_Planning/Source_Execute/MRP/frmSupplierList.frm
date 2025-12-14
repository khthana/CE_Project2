VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Begin VB.Form frmSupplierList 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Supplier"
   ClientHeight    =   4065
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5265
   Icon            =   "frmSupplierList.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4065
   ScaleWidth      =   5265
   StartUpPosition =   2  'CenterScreen
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid mfgSupplierList 
      Height          =   3615
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   4935
      _ExtentX        =   8705
      _ExtentY        =   6376
      _Version        =   393216
      Cols            =   3
      FixedCols       =   0
      BackColorBkg    =   12632256
      Appearance      =   0
      _NumberOfBands  =   1
      _Band(0).Cols   =   3
   End
End
Attribute VB_Name = "frmSupplierList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
Dim hSysMenu As Long
Dim sqlSupplier As String

hSysMenu = GetSystemMenu(Me.hwnd, False)
RemoveMenu hSysMenu, 6, MF_REMOVE Or MF_BYPOSITION
RemoveMenu hSysMenu, 5, MF_REMOVE Or MF_BYPOSITION

With DataEnInventories.rsSupplierName
   If .State = adStateOpen Then .Close
    .Open
        If .RecordCount = 0 Then
            MsgBox "ไม่มีชื่อบริษัทตัวแทนจำหน่ายสินค้าเลย !", vbOKOnly + vbInformation, "Supplier"
            Exit Sub
        Else
            Set mfgSupplierList.DataSource = DataEnInventories.rsSupplierName
                With mfgSupplierList
                    .ColWidth(0) = 900
                    .ColWidth(1) = 2000
                    .ColWidth(2) = 1500
                    .TextMatrix(0, 0) = "รหัส"
                    .TextMatrix(0, 1) = "ชื่อบริษัทภาษาอังกฤษ"
                    .TextMatrix(0, 2) = "ชื่อบริษัทภาษาไทย"
                End With
        End If
End With
End Sub

Private Sub mfgSupplierList_Click()
    With mfgSupplierList
        tmpSupplierCode = RTrim(.TextMatrix(.Row, 0))
        tmpSupplierName = RTrim(.TextMatrix(.Row, 1))
    End With
        frmSupplierList.Hide
End Sub
