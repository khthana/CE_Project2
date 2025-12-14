VERSION 5.00
Begin VB.Form frmLogin 
   BackColor       =   &H00EFF5F5&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Login"
   ClientHeight    =   2820
   ClientLeft      =   3435
   ClientTop       =   1725
   ClientWidth     =   6795
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2820
   ScaleWidth      =   6795
   Begin Project1.zText txtUsername 
      Height          =   330
      Left            =   1995
      TabIndex        =   3
      Top             =   1575
      Width           =   2430
      _ExtentX        =   4286
      _ExtentY        =   582
      c1Border        =   15878310
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Text            =   ""
   End
   Begin Project1.zCommand btnLogin 
      Height          =   330
      Left            =   4620
      Top             =   1575
      Width           =   1380
      _ExtentX        =   2434
      _ExtentY        =   582
      cDownFore       =   8388736
      Style           =   0
      Caption         =   "Login"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmLogin.frx":0000
      PictureDown     =   "frmLogin.frx":085D
   End
   Begin Project1.zCommand btnExit 
      Height          =   330
      Left            =   4620
      Top             =   1995
      Width           =   1380
      _ExtentX        =   2434
      _ExtentY        =   582
      cDownFore       =   8388736
      Style           =   0
      Caption         =   "Exit"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmLogin.frx":0CB4
      PictureDown     =   "frmLogin.frx":1511
   End
   Begin Project1.zText txtPassword 
      Height          =   330
      Left            =   1995
      TabIndex        =   4
      Top             =   1995
      Width           =   2430
      _ExtentX        =   4286
      _ExtentY        =   582
      c1Border        =   15878310
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PasswordChar    =   "*"
      Text            =   ""
   End
   Begin VB.Label Label5 
      BackColor       =   &H00C0C0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "Login"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1365
      TabIndex        =   5
      Top             =   1050
      Width           =   960
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   735
      Picture         =   "frmLogin.frx":1968
      Top             =   945
      Width           =   480
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H80000018&
      BackStyle       =   0  'Transparent
      Caption         =   "Village Security Program"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   20.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   630
      Left            =   210
      TabIndex        =   2
      Top             =   210
      Width           =   6255
   End
   Begin VB.Shape Shape3 
      BorderColor     =   &H00B0CE22&
      BorderWidth     =   2
      FillColor       =   &H00E9FAD1&
      FillStyle       =   0  'Solid
      Height          =   570
      Left            =   210
      Top             =   210
      Width           =   6330
   End
   Begin VB.Label Label3 
      BackColor       =   &H80000018&
      BackStyle       =   0  'Transparent
      Caption         =   "User name"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   735
      TabIndex        =   1
      Top             =   1575
      Width           =   1020
   End
   Begin VB.Label Label4 
      BackColor       =   &H80000018&
      BackStyle       =   0  'Transparent
      Caption         =   "Password"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   735
      TabIndex        =   0
      Top             =   1995
      Width           =   1035
   End
   Begin VB.Shape Shape4 
      BackColor       =   &H00E1FEFF&
      BorderColor     =   &H001C6E94&
      BorderWidth     =   2
      FillColor       =   &H00E1FEFF&
      FillStyle       =   0  'Solid
      Height          =   2640
      Left            =   105
      Top             =   105
      Width           =   6600
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnExit_Click()
    UnloadApp
End Sub

Private Sub btnLogin_Click()
    sql = "SELECT Count(*) FROM [Login] WHERE [Username]='" & QQ(txtUsername.Text) & "' AND [Password]='" & QQ(txtPassword.Text) & "'"
    OpenRst sql
    
    If Rst.Fields(0).Value > 0 Then
        sql = "SELECT * FROM [Login] WHERE [Username]='" & QQ(txtUsername.Text) & "' AND [Password]='" & QQ(txtPassword.Text) & "'"
        OpenRst sql
        m_Username = Rst.Fields(0).Value
        m_Permission = Rst.Fields(2).Value
        CenterForm frmMenu
        frmMenu.Show
        Me.Hide
    Else
        MsgBox "Invalid Username or Password.", vbCritical
        txtPassword.SelStart = 0
        txtPassword.SelLength = 999
        txtPassword.SetFocus
    End If
End Sub

Private Sub Form_Load()
    ConnectDB
    CenterForm Me
    'txtUsername = "Admin"
    'txtPassword = "olanla"
    'btnLogin_Click
End Sub

Private Sub Form_Unload(Cancel As Integer)
    UnloadApp
End Sub
