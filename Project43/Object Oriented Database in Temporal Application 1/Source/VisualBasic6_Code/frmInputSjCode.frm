VERSION 5.00
Begin VB.Form frmInputSjCode 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "ป้อนรหัสวิชาที่ต้องการลงทะเบียน"
   ClientHeight    =   1110
   ClientLeft      =   4740
   ClientTop       =   1845
   ClientWidth     =   5265
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1110
   ScaleWidth      =   5265
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtInputSj 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1200
      MaxLength       =   8
      TabIndex        =   0
      Top             =   120
      Width           =   1935
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "ยกเลิก"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3480
      TabIndex        =   3
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "ตกลง"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3480
      TabIndex        =   1
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "รหัสวิชา"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   360
      TabIndex        =   2
      Top             =   120
      Width           =   630
   End
End
Attribute VB_Name = "frmInputSjCode"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'Dim Subject As Object
Dim Status As Integer
Dim SjCodeOld As String

Private Sub CancelButton_Click()
 Unload frmInputSjCode
End Sub

Private Sub Form_Load()
    Status = 0
    ClearScreen
    
End Sub

Private Sub ClearScreen()
   txtInputSj = ""
'   ClearObjects
End Sub

Private Sub ClearObjects()
    If Not Subject Is Nothing Then
        Subject.sys_close
        Set Subject = Nothing
    End If
End Sub

Private Sub OKButton_Click()
Dim pers As Object
Dim i As Integer
Dim duplicatesub As Boolean

duplicatesub = False
If Not (Subject Is Nothing) Then
   For i = 1 To Reg.ThSj.count
      If Reg.ThSj.GetAt(i) = Subject Then duplicatesub = True
        ' MsgBox "วิชารหัส " + txtInputSj.text + " มีอยู่แล้วในรายการลงทะเบียน  1"
   Next
   If duplicatesub Then
     duplicatesub = False
 '    'ClearObjects
 '   ' txtInputSj.text = ""
 '     ' txtInputSj = ""
  '    Subject.sys_close
      MsgBox "วิชารหัส " + txtInputSj.text + " มีอยู่แล้วในรายการลงทะเบียน"
     Unload frmInputSjCode
  '    'ClearScreen
  '    'txtInputSj.SetFocus
  '   ' frmInputSjCode.Show
     Exit Sub
    End If
    
     Set pers = cache.Static("RegTranH")
      i = pers.AddRegSj(Reg.sys_Id, Subject.sys_Id)
   'Reg.ThSj.InsertObject (Subject.sys_Oid())
   'Reg.sys_save
   'ClearScreen
'   Dim item As ListItem
  'Position = Position + 1
'  Set item = frmRegister.lvReg.ListItems.Add
'  item.text = Position
'  item.text = frmRegister.lvReg.ListItems.count + 1
'  item.SubItems(1) = Subject.SjCode.GetAt(Subject.SjCode.count()).val
'  item.SubItems(2) = Subject.SjName.GetAt(Subject.SjName.count()).val
'  item.SubItems(3) = Subject.SjCrd
  'Position = Position + 1
  'frmRegister.labCrdInTerm.Caption = Reg.GetCrd()
  frmRegister.LoadData
  Unload frmInputSjCode
End If
End Sub

Private Sub txtInputSj_LostFocus()
    ' user keys in SjCode
    If txtInputSj = "" Then
        If Not (Subject Is Nothing) Then Subject.sys_close
        Set Subject = cache.New("Subject")
        ClearScreen
        Exit Sub
    Else
        If Status = 0 Then
            LoadSubject (txtInputSj.text)
        End If
    End If
    
End Sub

Private Sub LoadSubject(SubCode As String)
    On Error GoTo objerr
    Dim pers As Object
    Dim id As Long
    
    ClearObjects
    'Find Oid
    Set pers = cache.Static("Subject")
    id = pers.ReturnSjCodeId(SubCode)
    If id <> 0 Then
        Set Subject = cache.OpenId("Subject", id)
        ClearScreen
        txtInputSj = SubCode
        Status = 1
    Else
         If Not (Subject Is Nothing) Then Subject.sys_close
        MsgBox "ไม่พบวิชารหัส " + txtInputSj.text
        ClearScreen
        txtInputSj.SetFocus
    End If

    Exit Sub
objerr:
    VBErrorBox "โหลดวิชาล้มเหลว"
    ClearScreen
End Sub
