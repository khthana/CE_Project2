VERSION 5.00
Begin VB.Form frmLogin 
   BackColor       =   &H000B0091&
   Caption         =   "โปรแกรมเพิ่มเครดิตของธุรการ"
   ClientHeight    =   2250
   ClientLeft      =   4020
   ClientTop       =   3780
   ClientWidth     =   4560
   Icon            =   "frmLogin.frx":0000
   LinkTopic       =   "Form1"
   Moveable        =   0   'False
   ScaleHeight     =   2250
   ScaleWidth      =   4560
   StartUpPosition =   2  'CenterScreen
   WhatsThisHelp   =   -1  'True
   Begin VB.CommandButton btnExit 
      Caption         =   "Exit"
      Height          =   375
      Left            =   2880
      TabIndex        =   5
      Top             =   1440
      Width           =   1215
   End
   Begin VB.CommandButton btnLogin 
      Caption         =   "Login"
      Height          =   375
      Left            =   1680
      TabIndex        =   2
      Top             =   1440
      Width           =   1215
   End
   Begin VB.TextBox txtPassword 
      Height          =   375
      IMEMode         =   3  'DISABLE
      Left            =   1680
      PasswordChar    =   "*"
      TabIndex        =   1
      Text            =   "admin"
      Top             =   960
      Width           =   2415
   End
   Begin VB.TextBox txtUsername 
      Height          =   375
      Left            =   1680
      TabIndex        =   0
      Text            =   "Admin"
      Top             =   480
      Width           =   2415
   End
   Begin VB.Label Label2 
      BackColor       =   &H00C0FFFF&
      Caption         =   "รหัสผ่าน"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   480
      TabIndex        =   4
      Top             =   960
      Width           =   1095
   End
   Begin VB.Label Label1 
      BackColor       =   &H00C0FFFF&
      Caption         =   "ชือผู้ใช้"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   480
      TabIndex        =   3
      Top             =   480
      Width           =   1095
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00C0FFFF&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00FF0000&
      BorderWidth     =   4
      Height          =   2055
      Left            =   120
      Top             =   120
      Width           =   4335
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnExit_Click()
  CloseApp
End Sub

Private Sub btnLogin_Click()
  If TryLogin(txtUsername, txtPassword) Then
    frmMain.Show
    Me.Hide
  Else
    MsgBox "Invalid Username or Password"
  End If
End Sub

