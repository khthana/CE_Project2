VERSION 5.00
Begin VB.Form Welcome 
   BorderStyle     =   0  'None
   Caption         =   "CE-KMITL ProPIS 1.45e Client"
   ClientHeight    =   4515
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7515
   Icon            =   "Welcome.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Welcome.frx":0442
   ScaleHeight     =   4515
   ScaleWidth      =   7515
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   5000
      Left            =   6120
      Top             =   240
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      ForeColor       =   &H00808080&
      Height          =   255
      Left            =   360
      TabIndex        =   0
      Top             =   4200
      Width           =   4575
   End
   Begin VB.Image Image1 
      Height          =   4500
      Left            =   0
      Picture         =   "Welcome.frx":2DDAD
      ToolTipText     =   "Click here to continue..."
      Top             =   0
      Width           =   7500
   End
End
Attribute VB_Name = "Welcome"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    Label1.Caption = "Version " + Format(App.Major, "0") + "." + Format(App.Minor, "00") + " build " + Format(App.Revision, "0")
    Timer1.Enabled = True
End Sub

Private Sub Image1_Click()
    Unload Welcome
    Load MainMDI
    MainMDI.Show
End Sub

Private Sub Timer1_Timer()
    Image1_Click
End Sub
