VERSION 5.00
Begin VB.Form Form2 
   BackColor       =   &H0080FF80&
   Caption         =   "Level 2"
   ClientHeight    =   11010
   ClientLeft      =   -105
   ClientTop       =   345
   ClientWidth     =   15240
   LinkTopic       =   "Form2"
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   Begin VB.PictureBox Picture1 
      Height          =   1455
      Index           =   7
      Left            =   7320
      Picture         =   "Level2.frx":0000
      ScaleHeight     =   1395
      ScaleWidth      =   1395
      TabIndex        =   11
      Top             =   4800
      Width           =   1455
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   1920
      Top             =   10200
   End
   Begin VB.CommandButton START 
      Caption         =   "START"
      Height          =   495
      Left            =   480
      TabIndex        =   9
      Top             =   10200
      Width           =   975
   End
   Begin VB.PictureBox Picture1 
      Height          =   1455
      Index           =   6
      Left            =   2640
      Picture         =   "Level2.frx":2FDD
      ScaleHeight     =   1395
      ScaleWidth      =   1395
      TabIndex        =   8
      Top             =   5040
      Width           =   1455
   End
   Begin VB.PictureBox Picture1 
      Height          =   1455
      Index           =   5
      Left            =   12480
      Picture         =   "Level2.frx":5FBA
      ScaleHeight     =   1395
      ScaleWidth      =   1395
      TabIndex        =   7
      Top             =   4440
      Width           =   1455
   End
   Begin VB.PictureBox Picture1 
      Height          =   1455
      Index           =   4
      Left            =   11280
      Picture         =   "Level2.frx":8F97
      ScaleHeight     =   1395
      ScaleWidth      =   1395
      TabIndex        =   6
      Top             =   7680
      Width           =   1455
   End
   Begin VB.PictureBox Picture1 
      Height          =   1455
      Index           =   3
      Left            =   480
      Picture         =   "Level2.frx":BF74
      ScaleHeight     =   1395
      ScaleWidth      =   1395
      TabIndex        =   5
      Top             =   2400
      Width           =   1455
   End
   Begin VB.PictureBox Picture1 
      Height          =   1455
      Index           =   2
      Left            =   6480
      Picture         =   "Level2.frx":EF51
      ScaleHeight     =   1395
      ScaleWidth      =   1395
      TabIndex        =   4
      Top             =   8880
      Width           =   1455
   End
   Begin VB.PictureBox Picture1 
      Height          =   1455
      Index           =   1
      Left            =   9360
      Picture         =   "Level2.frx":11F2E
      ScaleHeight     =   1395
      ScaleWidth      =   1395
      TabIndex        =   3
      Top             =   600
      Width           =   1455
   End
   Begin VB.PictureBox Picture1 
      Height          =   1455
      Index           =   0
      Left            =   5640
      Picture         =   "Level2.frx":14F0B
      ScaleHeight     =   1395
      ScaleWidth      =   1395
      TabIndex        =   2
      Top             =   960
      Width           =   1455
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Label3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   735
      Left            =   3000
      TabIndex        =   10
      Top             =   10080
      Visible         =   0   'False
      Width           =   3135
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "END"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   855
      Left            =   12960
      TabIndex        =   1
      Top             =   960
      Width           =   1215
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "START"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   495
      Left            =   720
      TabIndex        =   0
      Top             =   8520
      Width           =   1695
   End
   Begin VB.Shape Shape3 
      BackColor       =   &H0000FFFF&
      BackStyle       =   1  'Opaque
      Height          =   975
      Left            =   12840
      Shape           =   2  'Oval
      Top             =   720
      Width           =   1335
   End
   Begin VB.Shape Shape1 
      BackStyle       =   1  'Opaque
      Height          =   975
      Left            =   600
      Shape           =   2  'Oval
      Top             =   8280
      Width           =   1815
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
mistake = 0
UseTime = 0
End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Label3.Caption = "IN THE WAY"
End Sub

Private Sub Label1_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Label3.Caption = "START"
End Sub

Private Sub Label2_Click()
If mistake <> 0 Then mistake = mistake - 1
Unload Me
Form3.Label3 = "Bump"
Form3.Show
End Sub

Private Sub Label3_Change()
If Label3.Caption = "Bump" Then mistake = mistake + 1
End Sub

Private Sub Picture1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
Label3.Caption = "Bump"
End Sub

Private Sub Start_Click()
SetCursorPos 70, 590
Label3.Visible = True
Timer1.Enabled = True
End Sub

Private Sub Timer1_Timer()
UseTime = UseTime + 1
If UseTime Mod 2 = 0 Then Call Label3_Change
End Sub


