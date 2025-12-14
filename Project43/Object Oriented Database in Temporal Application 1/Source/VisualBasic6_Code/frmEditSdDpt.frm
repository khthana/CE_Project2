VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmEditSdId 
   Caption         =   "แก้ไขรหัสนักศึกษา"
   ClientHeight    =   3600
   ClientLeft      =   3630
   ClientTop       =   1890
   ClientWidth     =   5370
   LinkTopic       =   "Form1"
   ScaleHeight     =   3600
   ScaleWidth      =   5370
   Begin MSComCtl2.DTPicker dtpSdIdFromDate 
      Height          =   375
      Left            =   1920
      TabIndex        =   8
      Top             =   2640
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   661
      _Version        =   393216
      CustomFormat    =   "dd/mm/yyyy"
      Format          =   24510465
      CurrentDate     =   36960
   End
   Begin MSComCtl2.DTPicker dtpSdIdToDate 
      Height          =   375
      Left            =   3600
      TabIndex        =   7
      Top             =   2640
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   661
      _Version        =   393216
      CustomFormat    =   "dd/mm/yyyy"
      Format          =   24510465
      CurrentDate     =   2958465
   End
   Begin VB.CommandButton cmdSdIdClose 
      Caption         =   "ปิด"
      Height          =   375
      Left            =   3600
      TabIndex        =   6
      Top             =   3120
      Width           =   1455
   End
   Begin VB.CommandButton cmdSdIdAdd 
      Caption         =   "แก้ไข"
      Height          =   375
      Left            =   240
      TabIndex        =   5
      Top             =   3120
      Width           =   1335
   End
   Begin VB.TextBox txtSdId1 
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   2640
      Width           =   1455
   End
   Begin MSComctlLib.ListView lvSdId 
      Height          =   2055
      Left            =   720
      TabIndex        =   0
      Top             =   240
      Width           =   3975
      _ExtentX        =   7011
      _ExtentY        =   3625
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "ถึงวันที่"
      Height          =   210
      Left            =   3960
      TabIndex        =   4
      Top             =   2400
      Width           =   495
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "จากวันที่"
      Height          =   210
      Left            =   2280
      TabIndex        =   3
      Top             =   2400
      Width           =   585
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "รหัสนักศึกษา"
      Height          =   210
      Left            =   480
      TabIndex        =   2
      Top             =   2400
      Width           =   930
   End
End
Attribute VB_Name = "frmEditSdId"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdSdIdClose_Click()
  frmEditSdId.Hide
End Sub


Private Sub Form_Load()
    LoadlvSdId
End Sub

Private Sub LoadlvSdId()
    Dim idhistkey As String, idhist As Object
    Dim item As ListItem, idcount As Integer

   lvSdId.View = lvwReport
   lvSdId.FullRowSelect = True
   lvSdId.ColumnHeaders.Clear
   lvSdId.ColumnHeaders.Add , , "รหัสวิชา", 1300, lvwColumnLeft
   lvSdId.ColumnHeaders.Add , , "จากวันที่", 1300, lvwColumnCenter
   lvSdId.ColumnHeaders.Add , , "ถึงวันที่", 1300, lvwColumnCenter
   lvSdId.ListItems.Clear
   
   lvSdId.ListItems.Clear
   Erase SdIdHistory
    idcount = 0
    idhistkey = ""
    Set idhist = Student.SdId.GetNext(idhistkey)
    Do While Not idhist Is Nothing
        Set item = lvSdId.ListItems.Add
        item.Text = idhist.Val
        item.SubItems(1) = idhist.FromDate
        item.SubItems(1) = Format(item.SubItems(1), "mm/dd/yyyy")
        item.SubItems(2) = idhist.ToDate
        item.SubItems(2) = Format(item.SubItems(2), "mm/dd/yyyy")
        idcount = idcount + 1
        ReDim Preserve SdIdHistory(idcount)
        Set SdIdHistory(idcount) = idhist
        Set idhist = Student.SdId.GetNext(idhistkey)
    Loop

   End Sub

Private Sub cmdSdIdAdd_Click()
Dim item As ListItem, items As Integer
items = lvSdId.ListItems.Count
 If (txtSdId1 <> "") And (dtpSdIdFromDate.Value <= dtpSdIdToDate.Value) Then
        Set item = lvSdId.ListItems.Add
        item.Text = txtSdId1
        item.SubItems(1) = Format(dtpSdIdFromDate.Value, "mm/dd/yyyy")
        item.SubItems(2) = dtpSdIdToDate.Value
End If

ClearInputSdId
End Sub

Private Sub ClearInputSdId()
 txtSdId1.Text = ""
 dtpSdIdFromDate.Value = Now
 dtpSdIdToDate.Value = "12/12/10542"
 End Sub



