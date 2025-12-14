VERSION 5.00
Begin VB.Form frmMain 
   BackColor       =   &H000B0091&
   Caption         =   "Menu"
   ClientHeight    =   2280
   ClientLeft      =   4020
   ClientTop       =   3780
   ClientWidth     =   4560
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   Moveable        =   0   'False
   ScaleHeight     =   2280
   ScaleWidth      =   4560
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton btnLogOff 
      Caption         =   "Log Off"
      Height          =   615
      Left            =   720
      TabIndex        =   2
      Top             =   1080
      Width           =   3135
   End
   Begin VB.CommandButton btnEditAdmin 
      Caption         =   "Edit Admin"
      Height          =   615
      Left            =   2280
      Picture         =   "frmMain.frx":030A
      TabIndex        =   1
      Top             =   480
      Width           =   1575
   End
   Begin VB.CommandButton btnEditUser 
      Caption         =   "Edit User"
      Height          =   615
      Left            =   720
      TabIndex        =   0
      Top             =   480
      Width           =   1575
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
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnEditAdmin_Click()
  frmAdmin.Show
  Me.Hide
End Sub

Private Sub btnEditUser_Click()
  frmUser.Show
  Me.Hide
End Sub

Private Sub btnLogOff_Click()
  Unload Me
End Sub

Private Sub Form_Unload(Cancel As Integer)
  frmLogin.Show
End Sub

Private Sub Picture1_Click()

End Sub
