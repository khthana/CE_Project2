VERSION 5.00
Begin VB.Form frmMenu 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Main Menu"
   ClientHeight    =   3270
   ClientLeft      =   3420
   ClientTop       =   4890
   ClientWidth     =   7320
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3270
   ScaleWidth      =   7320
   Begin Project1.zCommand btnStatusRep 
      Height          =   645
      Left            =   525
      Top             =   1575
      Width           =   2115
      _ExtentX        =   3731
      _ExtentY        =   1138
      cDownFore       =   33023
      Style           =   0
      Caption         =   "Status Report"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmMenu.frx":0000
      PictureDown     =   "frmMenu.frx":085C
   End
   Begin Project1.zCommand btnConfig 
      Height          =   645
      Left            =   2625
      Top             =   1575
      Width           =   2115
      _ExtentX        =   3731
      _ExtentY        =   1138
      cDownFore       =   65280
      Style           =   0
      Caption         =   "Configuration"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmMenu.frx":0E61
      PictureDown     =   "frmMenu.frx":15E0
   End
   Begin Project1.zCommand btnLoginMan 
      Height          =   645
      Left            =   4725
      Top             =   1575
      Width           =   2115
      _ExtentX        =   3731
      _ExtentY        =   1138
      cDownFore       =   16744576
      Style           =   0
      Caption         =   "Login Management"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmMenu.frx":19F7
      PictureDown     =   "frmMenu.frx":22E0
   End
   Begin Project1.zCommand btnLogOff 
      Height          =   330
      Left            =   2310
      Top             =   2625
      Width           =   1380
      _ExtentX        =   2434
      _ExtentY        =   582
      cDownFore       =   8388736
      Style           =   0
      Caption         =   "Log Off"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmMenu.frx":2BC9
      PictureDown     =   "frmMenu.frx":3426
   End
   Begin Project1.zCommand btnExit 
      Height          =   330
      Left            =   3675
      Top             =   2625
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
      PictureUp       =   "frmMenu.frx":387D
      PictureDown     =   "frmMenu.frx":40DA
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
      Left            =   525
      TabIndex        =   0
      Top             =   525
      Width           =   6255
   End
   Begin VB.Shape Shape3 
      BorderColor     =   &H00B0CE22&
      BorderWidth     =   2
      FillColor       =   &H00E9FAD1&
      FillStyle       =   0  'Solid
      Height          =   780
      Left            =   525
      Top             =   420
      Width           =   6270
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H008195CB&
      BorderWidth     =   2
      FillColor       =   &H00ECF5F7&
      FillStyle       =   0  'Solid
      Height          =   2235
      Left            =   210
      Top             =   210
      Width           =   6900
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00FA8E3F&
      BorderWidth     =   4
      FillColor       =   &H00F4E3C8&
      FillStyle       =   0  'Solid
      Height          =   3090
      Left            =   105
      Top             =   105
      Width           =   7140
   End
End
Attribute VB_Name = "frmMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnConfig_Click()
    CenterForm frmConfig
    frmConfig.Show
    Me.Hide
End Sub

Private Sub btnExit_Click()
    Unload Me
End Sub

Private Sub btnLoginMan_Click()
    CenterForm frmLoginMan
    frmLoginMan.Show
    Me.Hide
End Sub

Private Sub btnLogOff_Click()
    CenterForm frmLogin
    frmLogin.Show
    Me.Hide
End Sub

Private Sub btnStatusRep_Click()
    CenterForm frmStatusRep
    frmStatusRep.Show
    Me.Hide
End Sub

Private Sub Form_Load()
    If m_Permission = 0 Then
      btnConfig.Enabled = False
      btnLoginMan.Enabled = False
      m_Permission = 0
    Else
      btnConfig.Enabled = True
      btnLoginMan.Enabled = True
      m_Permission = 0
    End If

End Sub

Private Sub Form_Unload(Cancel As Integer)
    UnloadApp
End Sub
