VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Begin VB.Form frmTransactionLog 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "รายการ Log"
   ClientHeight    =   6975
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11895
   Icon            =   "frmTransactionLog.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   6975
   ScaleWidth      =   11895
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid mfgLog 
      Height          =   6495
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   11415
      _ExtentX        =   20135
      _ExtentY        =   11456
      _Version        =   393216
      FixedCols       =   0
      BackColorBkg    =   12632256
      Appearance      =   0
      _NumberOfBands  =   1
      _Band(0).Cols   =   2
   End
End
Attribute VB_Name = "frmTransactionLog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()

 frmTransactionLog.WindowState = 2
            
            With DataEnInventories.rsTransaction
            If .State = adStateOpen Then .Close
            .Open
            If .RecordCount <> 0 Then
                Set mfgLog.DataSource = DataEnInventories.rsTransaction
                With mfgLog
                    .TextMatrix(0, 0) = "หมายเลขรายการ Log"
                    .TextMatrix(0, 1) = "ประเภทรายการ"
                    .TextMatrix(0, 2) = "รหัสสินค้า"
                    .TextMatrix(0, 3) = "ชื่อสินค้า"
                    .TextMatrix(0, 4) = "ปริมาณที่เปลี่ยนแปลง"
                    .TextMatrix(0, 5) = "วันที่ทำรายการ"
                    .TextMatrix(0, 6) = "เอกสารอ้างอิง"
                
                    .ColWidth(0) = 1700
                    .ColWidth(1) = 1300
                    .ColWidth(2) = 1100
                    .ColWidth(3) = 2000
                    .ColWidth(4) = 1700
                    .ColWidth(5) = 2000
                    .ColWidth(6) = 1500
                End With
                    MFGRowColor mfgLog, 57, 253, 218
            End If
    End With
End Sub
