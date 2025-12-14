VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmEditStudent 
   Caption         =   "แก้ไขประวัตินักศึกษาเฉพาะข้อมูลเชิงเวลา"
   ClientHeight    =   4980
   ClientLeft      =   255
   ClientTop       =   1665
   ClientWidth     =   5085
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   9.75
      Charset         =   222
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   4980
   ScaleWidth      =   5085
   Begin VB.CommandButton cmdSdIdClose 
      Caption         =   "ปิดหน้าต่าง"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2520
      TabIndex        =   6
      Top             =   4080
      Width           =   1935
   End
   Begin VB.CommandButton cmdSdIdClear 
      Caption         =   "ล้างหน้าจอ"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   360
      TabIndex        =   5
      Top             =   4080
      Width           =   1935
   End
   Begin VB.Frame Frame1 
      Caption         =   "ประวัติรหัสนักศึกษา"
      Height          =   3735
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   4695
      Begin VB.TextBox txtSdIdToDate 
         Height          =   375
         Left            =   3240
         TabIndex        =   12
         Top             =   2520
         Width           =   1335
      End
      Begin VB.TextBox txtSdIdFromDate 
         Height          =   375
         Left            =   1920
         MaxLength       =   10
         TabIndex        =   11
         Top             =   2520
         Width           =   1335
      End
      Begin VB.CommandButton cmdSdIdDelete 
         Caption         =   "ลบ"
         Height          =   375
         Left            =   3120
         TabIndex        =   4
         Top             =   3120
         Width           =   1455
      End
      Begin VB.CommandButton cmdSdIdUpdate 
         Caption         =   "แก้ไข"
         Height          =   375
         Left            =   1560
         TabIndex        =   3
         Top             =   3120
         Width           =   1455
      End
      Begin VB.CommandButton cmdSdIdAdd 
         Caption         =   "เพิ่ม"
         Height          =   375
         Left            =   120
         TabIndex        =   2
         Top             =   3120
         Width           =   1335
      End
      Begin VB.TextBox txtSdId 
         Height          =   375
         Left            =   240
         MaxLength       =   8
         TabIndex        =   1
         Top             =   2520
         Width           =   1575
      End
      Begin MSComctlLib.ListView lvSdId 
         Height          =   1695
         Left            =   360
         TabIndex        =   7
         Top             =   360
         Width           =   3975
         _ExtentX        =   7011
         _ExtentY        =   2990
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
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
         Height          =   240
         Left            =   3600
         TabIndex        =   10
         Top             =   2160
         Width           =   555
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "จากวันที่"
         Height          =   240
         Left            =   2160
         TabIndex        =   9
         Top             =   2160
         Width           =   675
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "รหัสนักศึกษา"
         Height          =   240
         Left            =   600
         TabIndex        =   8
         Top             =   2160
         Width           =   1050
      End
   End
End
Attribute VB_Name = "frmEditStudent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Add As Boolean
Dim Student As Object
Dim SdIdHistory() As Object
Dim Std As Object
Dim id As Long
Dim Index As Integer
Dim idhistkey As String, idhist As Object
Dim item As ListItem, idcount As Integer


Private Sub cmdSdIdClose_Click()
 Unload frmEditStudent
End Sub



Private Sub Form_Load()
     Add = True
     Index = 0
    ClearScreen
    LoadlvSd
End Sub

Private Sub LoadlvSd()

   lvSdId.View = lvwReport
   lvSdId.FullRowSelect = True
   lvSdId.ColumnHeaders.Clear
   lvSdId.ColumnHeaders.Add , , "รหัสนักศึกษา", 1300, lvwColumnLeft
   lvSdId.ColumnHeaders.Add , , "จากวันที่", 1300, lvwColumnCenter
   lvSdId.ColumnHeaders.Add , , "ถึงวันที่", 1300, lvwColumnCenter
   lvSdId.ListItems.Clear
End Sub

Private Sub ClearScreen()

    txtSdId.text = ""
    cmdSdIdAdd.Enabled = False
    cmdSdIdDelete.Enabled = False
    cmdSdIdUpdate.Enabled = False
    txtSdIdFromDate.text = ""
    txtSdIdToDate.text = ""
    lvSdId.ListItems.Clear
      
End Sub

Private Sub cmdSdIdClear_Click()
    ClearObjects
    ClearScreen
    txtSdId.SetFocus
    Add = True
End Sub

Private Sub ClearObjects()
    If Not Student Is Nothing Then
        Student.sys_close
        Set Student = Nothing
    End If
End Sub

Private Sub txtSdId_LostFocus()
    ' user keys in SdId
    If txtSdId.text = "" Then
        If Not (Student Is Nothing) Then Student.sys_close
        ClearScreen
        Exit Sub
    End If
    
    If Add Then
        LoadStudent (txtSdId.text)
    End If
        
End Sub

Private Sub LoadStudent(SdId As String)
    On Error GoTo objerr
    
    
    ClearObjects
    'Find Oid
    Set Std = cache.Static("Student")
    id = Std.FindOID(SdId)
    'txtTest.Text = id
    If id = 0 Then
      MsgBox "ไม่มีรหัสนักศึกษา " & txtSdId.text & " อยู่ในฐานข้อมูล ณ ปัจจุบัน"
      Exit Sub
    End If
    If id <> 0 Then
        Set Student = cache.OpenId("Student", id)
        ClearScreen
        txtSdId.text = Student.SdId.GetAt(Student.SdId.Count()).val
        
        LoadlvSdId
        
        cmdSdIdAdd.Enabled = True
        cmdSdIdUpdate.Enabled = True
        cmdSdIdDelete.Enabled = True
        
        Add = False
               
        Exit Sub
objerr:
    VBErrorBox "โหลดข้อมูลประวัติล้มเหลว !"
    ClearScreen
    
    End If
End Sub

Private Sub LoadlvSdId()
    'load history and plan of lvSjCode
        lvSdId.ListItems.Clear
        Erase SdIdHistory
        idcount = 0
        idhistkey = ""
        Set idhist = Student.SdId.GetNext(idhistkey)
        Do While Not idhist Is Nothing
             Set item = lvSdId.ListItems.Add
             item.text = idhist.val
             item.SubItems(1) = Format(idhist.FromDate, "mm/dd/yyyy")
       '      item.SubItems(1) = Student.SdInDtLogicalToOdbc(idhist.FromDate)
           
'             item.SubItems(2) = Student.SdInDtLogicalToOdbc(idhist.ToDate)
             item.SubItems(2) = Format(idhist.ToDate, "mm/dd/yyyy")
             idcount = idcount + 1
             ReDim Preserve SdIdHistory(idcount)
             Set SdIdHistory(idcount) = idhist
             Set idhist = Student.SdId.GetNext(idhistkey)
        Loop
End Sub


Private Sub cmdSdIdAdd_Click()
    Dim message As String
    Dim FromDate As String
    Dim ToDate As String
    
  '  FromDate = Student.SdInDtOdbcToLogical(txtSdIdFromDate.Text)
  '  ToDate = Student.SdInDtOdbcToLogical(txtSdIdToDate.Text)
    Set Std = cache.Static("Student")
    id = Student.sys_Id
'   message = std.InsertSSdId(id, txtSdId.Text, dtpSdIdFromDate.Value, dtpSdIdToDate.Value)
    message = Std.InsertSSdId2(id, txtSdId.text, txtSdIdFromDate.text, txtSdIdToDate.text)
    MsgBox message, vbOKOnly
    LoadlvSdId
End Sub

Private Sub cmdSdIdUpdate_Click()
    Dim message As String
    Dim FromDate As String
    Dim ToDate As String
    
 '   FromDate = Student.SdInDtOdbcToLogical(txtSdIdFromDate.Text)
 '   ToDate = Student.SdInDtOdbcToLogical(txtSdIdToDate.Text)
'    FromDate = Format(dtpSdIdFromDate, "mm/dd/yyyy")
 '   ToDate = Format(dtpSdIdToDate, "mm/dd/yyyy")
    Set Std = cache.Static("Student")
    id = Student.sys_Id
      '  message = std.UpdateSSdId(id, txtSdId.Text, dtpSdIdFromDate.Value, dtpSdIdToDate.Value)
   message = Std.UpdateSSdId2(id, txtSdId.text, txtSdIdFromDate.text, txtSdIdToDate.text)
    MsgBox message, vbOKOnly
    LoadlvSdId

End Sub

Private Sub cmdSdIdDelete_Click()
    Dim message As String
    Dim FromDate As String
    Dim ToDate As String
    
'    FromDate = Student.SdInDtOdbcToLogical(txtSdIdFromDate.Text)
'    ToDate = Student.SdInDtOdbcToLogical(txtSdIdToDate.Text)
'    FromDate = Format(dtpSdIdFromDate, "mm/dd/yyyy")
 '   ToDate = Format(dtpSdIdToDate, "mm/dd/yyyy")
    Set Std = cache.Static("Student")
    id = Student.sys_Id
    message = Std.DeleteSSdId2(id, txtSdIdFromDate.text, txtSdIdToDate.text)
'    message = std.DeleteSSdId(id, index)
    MsgBox message, vbOKOnly
    LoadlvSdId
    
End Sub

Private Sub lvSdId_DblClick()
   Dim itemselected  As Integer
   
   itemselected = lvSdId.SelectedItem.Index
   Index = itemselected
   txtSdId.text = lvSdId.ListItems(itemselected).text
   txtSdIdFromDate.text = lvSdId.ListItems(itemselected).SubItems(1)
   txtSdIdToDate.text = lvSdId.ListItems(itemselected).SubItems(2)
   cmdSdIdUpdate.Enabled = True
   cmdSdIdDelete.Enabled = True
   'txtSdId.SetFocus
   
End Sub

Private Sub lvSdId_Click()
   Dim itemselected  As Integer
   
   itemselected = lvSdId.SelectedItem.Index
   Index = itemselected
   txtSdId.text = lvSdId.ListItems(itemselected).text
   txtSdIdFromDate.text = lvSdId.ListItems(itemselected).SubItems(1)
   txtSdIdToDate.text = lvSdId.ListItems(itemselected).SubItems(2)
   cmdSdIdUpdate.Enabled = True
   cmdSdIdDelete.Enabled = True
   'txtSdId.SetFocus
   
End Sub

