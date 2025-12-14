VERSION 5.00
Begin VB.Form LoginForm 
   Caption         =   "Login"
   ClientHeight    =   2415
   ClientLeft      =   4065
   ClientTop       =   3810
   ClientWidth     =   4860
   LinkTopic       =   "Form1"
   ScaleHeight     =   2415
   ScaleWidth      =   4860
   Begin VB.TextBox txtLogin 
      Height          =   375
      Left            =   1200
      TabIndex        =   5
      Text            =   "Administrator"
      Top             =   720
      Width           =   2895
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "OK"
      Height          =   375
      Left            =   1920
      TabIndex        =   2
      Top             =   1920
      Width           =   1095
   End
   Begin VB.TextBox txtPassword 
      Height          =   375
      IMEMode         =   3  'DISABLE
      Left            =   1200
      PasswordChar    =   "*"
      TabIndex        =   1
      Top             =   1200
      Width           =   2895
   End
   Begin VB.TextBox txtServer 
      Height          =   375
      IMEMode         =   3  'DISABLE
      Left            =   1200
      TabIndex        =   0
      Top             =   240
      Width           =   2895
   End
   Begin VB.Label lblLogin 
      Caption         =   "Login"
      Height          =   375
      Left            =   240
      TabIndex        =   6
      Top             =   720
      Width           =   855
   End
   Begin VB.Label lblPassward 
      Caption         =   "Password"
      Height          =   375
      Left            =   240
      TabIndex        =   4
      Top             =   1200
      Width           =   855
   End
   Begin VB.Label lblServer 
      Caption         =   "Server"
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Top             =   240
      Width           =   735
   End
End
Attribute VB_Name = "LoginForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public txtserv As String
Public txtlog As String
Public txtpwd As String
Private Sub cmdOk_Click()
On Error GoTo error_server
   If txtServer.Text <> "" Then
        If txtLogin.Text <> "" Then
        txtserv = txtServer.Text
        txtlog = txtLogin.Text
        txtpwd = txtPassword.Text
        CubeBrowser.Show
        Unload Me
        Else
        MsgBox "please insert user name:", vbOKOnly, "User name"
        End If
    Else
        MsgBox "Please insert server name:", vbOKOnly, "Server name"
    End If
    Exit Sub
error_server:
      MsgBox Err.Description, vbOKOnly, "error message"
    
    
End Sub

