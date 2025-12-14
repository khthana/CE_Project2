VERSION 5.00
Begin VB.Form ระบบสืบค้นข้อมูลนักศึกษา 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ระบบสืบค้นข้อมูลนักศึกษา"
   ClientHeight    =   8115
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5235
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8115
   ScaleWidth      =   5235
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture2 
      Height          =   7095
      Left            =   0
      Picture         =   "intro.frx":0000
      ScaleHeight     =   7035
      ScaleWidth      =   5115
      TabIndex        =   3
      Top             =   120
      Width           =   5175
   End
   Begin VB.PictureBox Picture1 
      Height          =   15
      Left            =   480
      ScaleHeight     =   15
      ScaleWidth      =   1695
      TabIndex        =   2
      Top             =   1200
      Width           =   1695
   End
   Begin VB.CommandButton CmdExit 
      Caption         =   "ออกจากโปรแกรม"
      Height          =   735
      Left            =   3000
      TabIndex        =   1
      Top             =   7200
      Width           =   1575
   End
   Begin VB.CommandButton CmdEnter 
      Caption         =   "เข้าสู่ระบบ"
      Height          =   735
      Index           =   0
      Left            =   960
      Picture         =   "intro.frx":14726
      TabIndex        =   0
      Top             =   7200
      Width           =   1575
   End
End
Attribute VB_Name = "ระบบสืบค้นข้อมูลนักศึกษา"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click(Index As Integer)

End Sub

Private Sub Frame1_DragDrop(Source As Control, X As Single, Y As Single)

End Sub

Private Sub CmdEnter_Click(Index As Integer)
MainScreen.Show
Me.Hide
End Sub

Private Sub cmdExit_Click()
Beep
End
End Sub

