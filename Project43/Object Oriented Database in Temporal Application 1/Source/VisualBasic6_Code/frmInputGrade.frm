VERSION 5.00
Begin VB.Form frmInputGrade 
   Caption         =   "ป้อนเกรด"
   ClientHeight    =   1050
   ClientLeft      =   4770
   ClientTop       =   1920
   ClientWidth     =   5265
   LinkTopic       =   "Form1"
   ScaleHeight     =   1050
   ScaleWidth      =   5265
   Begin VB.CommandButton cmdCancel 
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
      Left            =   3600
      TabIndex        =   2
      Top             =   600
      Width           =   1335
   End
   Begin VB.CommandButton cmdOk 
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
      Left            =   3600
      TabIndex        =   1
      Top             =   120
      Width           =   1335
   End
   Begin VB.TextBox txtGrade 
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
      Left            =   1320
      MaxLength       =   2
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "ป้อนเกรด"
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
      Left            =   480
      TabIndex        =   3
      Top             =   120
      Width           =   750
   End
End
Attribute VB_Name = "frmInputGrade"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Option Explicit
Dim Subject As Object
Dim Status As Integer
Dim SjCodeOld As String

Private Sub cmdCancel_Click()
 Unload frmInputGrade
 End Sub

Private Sub Form_Load()
 Dim i As Integer
 i = frmGrade.lvReg.SelectedItem.Index
 
    Status = 0
    ClearScreen
     frmInputGrade.Caption = "ป้อนเกรดวิชา " + frmGrade.lvReg.ListItems.item(i).SubItems(2)
     
End Sub

Private Sub ClearScreen()
   txtGrade = ""
'   ClearObjects
End Sub

Private Sub ClearObjects()
    If Not Subject Is Nothing Then
        Subject.sys_close
        Set Subject = Nothing
    End If
End Sub

Private Sub cmdOK_Click()
Dim pers As Object
Dim i As Integer
Dim ok As Boolean

'duplicatesub = False
If Not (Reg Is Nothing) Then
  ' For i = 1 To Reg.ThSj.Count
   '   If Reg.ThSj.GetAt(i) = Subject Then duplicatesub = True
        ' MsgBox "วิชารหัส " + txtInputSj.text + " มีอยู่แล้วในรายการลงทะเบียน  1"
   'Next
 i = frmGrade.lvReg.SelectedItem.Index
 If txtGrade.text <> "" Then
   ok = Reg.ThGrade.SetAt(Reg.ThGradeDisplayToLogical(txtGrade.text), i)
      Reg.sys_Save
   ' frmGrade.LoadData
   frmGrade.lvReg.ListItems(i).SubItems(4) = txtGrade.text
   frmGrade.CalGPAandCrdCum
   Unload frmInputGrade

Else: txtGrade.SetFocus
End If
   'ClearScreen
End If
End Sub

