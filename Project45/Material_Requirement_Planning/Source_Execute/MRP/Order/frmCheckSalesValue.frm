VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form frmCheckSalesValue 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "ตรวจสอบรายการสินค้าที่ขาย"
   ClientHeight    =   7215
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10335
   Icon            =   "frmCheckSalesValue.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   7215
   ScaleWidth      =   10335
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid mfgSODetail 
      Height          =   2655
      Left            =   240
      TabIndex        =   9
      Top             =   4320
      Width           =   9855
      _ExtentX        =   17383
      _ExtentY        =   4683
      _Version        =   393216
      Cols            =   7
      FixedCols       =   0
      BackColorBkg    =   12632256
      Appearance      =   0
      _NumberOfBands  =   1
      _Band(0).Cols   =   7
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid mfgSOList 
      Height          =   2535
      Left            =   240
      TabIndex        =   8
      Top             =   1320
      Width           =   9855
      _ExtentX        =   17383
      _ExtentY        =   4471
      _Version        =   393216
      Cols            =   6
      FixedCols       =   0
      BackColorBkg    =   12632256
      Appearance      =   0
      _NumberOfBands  =   1
      _Band(0).Cols   =   6
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "รายการสินค้าที่ขาย"
      ForeColor       =   &H80000008&
      Height          =   855
      Left            =   240
      TabIndex        =   3
      Top             =   120
      Width           =   9855
      Begin VB.CommandButton cmdOK 
         Caption         =   "ตกลง"
         Height          =   375
         Left            =   6360
         MouseIcon       =   "frmCheckSalesValue.frx":0442
         MousePointer    =   99  'Custom
         TabIndex        =   2
         Top             =   360
         Width           =   1455
      End
      Begin MSComCtl2.DTPicker dtpStart 
         Height          =   315
         Left            =   1200
         TabIndex        =   0
         Top             =   360
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   556
         _Version        =   393216
         Format          =   19660800
         CurrentDate     =   36946
      End
      Begin MSComCtl2.DTPicker dtpEnd 
         Height          =   315
         Left            =   3840
         TabIndex        =   1
         Top             =   360
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   556
         _Version        =   393216
         Format          =   19660800
         CurrentDate     =   36946
      End
      Begin VB.Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "ถึง :"
         Height          =   315
         Left            =   3480
         TabIndex        =   5
         Top             =   360
         Width           =   375
      End
      Begin VB.Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "ตั้งแต่วันที่ :"
         Height          =   315
         Left            =   240
         TabIndex        =   4
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.Label Label4 
      BackColor       =   &H00C0C0C0&
      Caption         =   "รายละเอียด :"
      Height          =   255
      Left            =   240
      TabIndex        =   7
      Top             =   4080
      Width           =   1215
   End
   Begin VB.Label Label3 
      BackColor       =   &H00C0C0C0&
      Caption         =   "รายการขาย :"
      Height          =   255
      Left            =   240
      TabIndex        =   6
      Top             =   1080
      Width           =   1095
   End
End
Attribute VB_Name = "frmCheckSalesValue"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
frmCheckSalesValue.WindowState = 2
dtpStart.Value = Date
dtpEnd.Value = Date

End Sub

Private Sub cmdOK_Click()
Dim i As Integer

With DataEnInventories.rsSelectCustomerOrder 'rsCustomerOrder
 If .State = adStateOpen Then .Close
'.Open
DataEnInventories.SelectCustomerOrder dtpStart, dtpEnd 'DateThaiFormat(dtpStart), DateThaiFormat(dtpEnd)
   
        If .RecordCount = 0 Then
            MsgBox "ช่วงวันที่ที่คุณระบุ ไม่มีการขายสินค้า!", vbOKOnly + vbExclamation, "Check Sales Value"
            
            Set mfgSOList.DataSource = DataEnInventories.rsSelectCustomerOrder 'rsCustomerOrder
            mfgSOList.Refresh
            Call OrderSOListGrid
            
            With mfgSODetail
                For i = 1 To .Rows - 2
                    If .Rows > 2 Then
                        .Rows = .Rows - 1
                    End If
                Next
                    .TextMatrix(1, 0) = ""
                    .TextMatrix(1, 1) = ""
                    .TextMatrix(1, 2) = ""
                    .TextMatrix(1, 3) = ""
                    .TextMatrix(1, 4) = ""
                    .TextMatrix(1, 5) = ""
                    .TextMatrix(1, 6) = ""
            End With
        Else
            Set mfgSOList.DataSource = DataEnInventories.rsSelectCustomerOrder 'rsCustomerOrder
            Call OrderSOListGrid
            MFGRowColor mfgSOList, 57, 253, 218
            mfgSOList.Refresh
        End If
End With
End Sub

Private Sub mfgSOList_Click()

With mfgSOList

'With DataEnInventories.rsSelectCustomerOrderDetail
'If .State = adStateOpen Then .Close
'.Open
DataEnInventories.SelectCustomerOrderDetail .TextMatrix(.Row, 0)

'End With
End With


With DataEnInventories.rsSelectCustomerOrderDetail 'rsCustomerOrderDetail

        Set mfgSODetail.DataSource = DataEnInventories.rsSelectCustomerOrderDetail 'rsCustomerOrderDetail
        Call OrderSODetailGrid
            
            If .State = adStateOpen Then .Close
            
        MFGRowColor mfgSODetail, 57, 253, 218

End With
End Sub

Private Sub OrderSOListGrid()
    With mfgSOList
        .ColWidth(0) = 1600
        .ColWidth(1) = 2300
        .ColWidth(2) = 3300
        .ColWidth(3) = 1000
        .ColWidth(4) = 1200
        .ColWidth(5) = 0
              
        .TextMatrix(0, 0) = "หมายเลขรายการขาย"
        .TextMatrix(0, 1) = "ชื่อ-สกุล ลูกค้า"
        .TextMatrix(0, 2) = "ที่อยู่"
        .TextMatrix(0, 3) = "วันที่สั่ง"
        .TextMatrix(0, 4) = "ยอดขาย"
    End With
End Sub

Private Sub OrderSODetailGrid()
    With mfgSODetail
        .ColWidth(0) = 1400
        .ColWidth(1) = 1000
        .ColWidth(2) = 3000
        .ColWidth(3) = 1100
        .ColWidth(4) = 600
        .ColWidth(5) = 1000
        .ColWidth(6) = 1000
        
        
        .TextMatrix(0, 0) = "หมายเลขรายการขาย"
        .TextMatrix(0, 1) = "รหัสสินค้า"
        .TextMatrix(0, 2) = "ชื่อสินค้า"
        .TextMatrix(0, 3) = "ประเภทสินค้า"
        .TextMatrix(0, 4) = "จำนวน"
        .TextMatrix(0, 5) = "ราคา/หน่วย"
        .TextMatrix(0, 6) = "รวมเป็นเงิน"
    End With
End Sub



