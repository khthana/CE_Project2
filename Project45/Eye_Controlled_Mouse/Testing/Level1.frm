VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00C0FFC0&
   Caption         =   "Level 1"
   ClientHeight    =   11010
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   15240
   LinkTopic       =   "Form1"
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   Begin VB.CommandButton Start 
      Caption         =   "Start"
      Height          =   495
      Left            =   480
      TabIndex        =   4
      Top             =   10200
      Width           =   1215
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   8400
      Top             =   360
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H0080FF80&
      BorderStyle     =   0  'None
      Height          =   975
      Left            =   2280
      TabIndex        =   3
      Top             =   4200
      Width           =   11295
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "END"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   29.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   975
      Left            =   13560
      TabIndex        =   1
      Top             =   4320
      Width           =   1335
   End
   Begin VB.Shape Shape2 
      BackStyle       =   1  'Opaque
      Height          =   1215
      Left            =   13440
      Shape           =   3  'Circle
      Top             =   4080
      Width           =   1575
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Label3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   495
      Left            =   9240
      TabIndex        =   2
      Top             =   240
      Visible         =   0   'False
      Width           =   5775
   End
   Begin VB.Label Label1 
      BackColor       =   &H000000FF&
      Caption         =   "START"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   975
      Left            =   720
      TabIndex        =   0
      Top             =   4200
      Width           =   1575
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
mistake = 0
UseTime = 0
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Label3.Caption = "OUT THE WAY"
End Sub

Private Sub Frame1_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Label3.Caption = "IN THE WAY"
End Sub

Private Sub Label1_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Label3.Caption = "START"
End Sub

Private Sub Label2_Click()
If mistake <> 0 Then mistake = mistake - 1
Unload Me
Form3.Label3.Caption = "OUT THE WAY"
Form3.Show
End Sub

Private Sub Label3_Change()
If Label3.Caption = "OUT THE WAY" Then mistake = mistake + 1
End Sub

Private Sub Start_Click()
SetCursorPos 113, 310
Label3.Visible = True
Timer1.Enabled = True
End Sub

Private Sub Timer1_Timer()
UseTime = UseTime + 1
If UseTime Mod 2 = 0 Then Call Label3_Change
End Sub


