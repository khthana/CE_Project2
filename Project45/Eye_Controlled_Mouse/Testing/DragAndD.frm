VERSION 5.00
Begin VB.Form Form6 
   BackColor       =   &H8000000E&
   Caption         =   "Drag and Drop Test"
   ClientHeight    =   11010
   ClientLeft      =   270
   ClientTop       =   240
   ClientWidth     =   15240
   LinkTopic       =   "Form6"
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   Begin VB.CommandButton MenuB 
      Caption         =   "Menu"
      Height          =   495
      Left            =   9000
      TabIndex        =   6
      Top             =   10200
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.CommandButton ExitB 
      Caption         =   "Exit"
      Height          =   495
      Left            =   7800
      TabIndex        =   5
      Top             =   10200
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   14280
      Top             =   10320
   End
   Begin VB.PictureBox Picture2 
      BackColor       =   &H8000000E&
      BorderStyle     =   0  'None
      Height          =   3015
      Left            =   9840
      Picture         =   "DragAndD.frx":0000
      ScaleHeight     =   3015
      ScaleWidth      =   2895
      TabIndex        =   1
      Top             =   1320
      Width           =   2895
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H8000000E&
      BorderStyle     =   0  'None
      DragMode        =   1  'Automatic
      Height          =   2055
      Left            =   3600
      Negotiate       =   -1  'True
      Picture         =   "DragAndD.frx":3FD5
      ScaleHeight     =   2055
      ScaleWidth      =   2055
      TabIndex        =   0
      Top             =   6240
      Width           =   2055
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Use Time -->"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   14.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   10560
      TabIndex        =   4
      Top             =   10200
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Sec."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   14.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   13320
      TabIndex        =   3
      Top             =   10200
      Width           =   615
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   12480
      TabIndex        =   2
      Top             =   10200
      Width           =   735
   End
End
Attribute VB_Name = "Form6"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim t As Integer
Private Sub ExitB_Click()
End
End Sub
Private Sub Form_Load()
t = 0
End Sub

Private Sub MenuB_Click()
Unload Me
First.Show
End Sub

Private Sub Picture2_DragDrop(Source As Control, x As Single, y As Single)
Timer1.Enabled = False
Picture2.Picture = LoadPicture("C:\basket.jpg")
Picture1.Visible = False
ExitB.Visible = True
MenuB.Visible = True
Label3.Visible = True
End Sub

Private Sub Timer1_Timer()
t = t + 1
Label1.Caption = t
End Sub
