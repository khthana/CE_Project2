VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Main Menu : ระบบฐานข้อมูลบุคลากร"
   ClientHeight    =   4920
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8985
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MouseIcon       =   "frmMain.frx":014A
   Picture         =   "frmMain.frx":058C
   ScaleHeight     =   4920
   ScaleWidth      =   8985
   StartUpPosition =   3  'Windows Default
   Begin VB.Label Label4 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Query 2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   615
      Left            =   6480
      MouseIcon       =   "frmMain.frx":488D
      MousePointer    =   99  'Custom
      TabIndex        =   3
      Top             =   3840
      Width           =   1935
   End
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "Query 1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   615
      Left            =   4320
      MouseIcon       =   "frmMain.frx":4CCF
      MousePointer    =   99  'Custom
      TabIndex        =   2
      Top             =   3840
      Width           =   1935
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "การแต่งตั้งอัตราใหม่"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   495
      Left            =   4440
      MouseIcon       =   "frmMain.frx":5111
      MousePointer    =   99  'Custom
      TabIndex        =   1
      Top             =   3120
      Width           =   3975
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      BackStyle       =   0  'Transparent
      Caption         =   "ข้อมูลและประวัติการทำงานบุคลากร"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   615
      Left            =   1680
      MouseIcon       =   "frmMain.frx":5553
      MousePointer    =   99  'Custom
      TabIndex        =   0
      Top             =   2400
      Width           =   6735
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Label1_Click()
    frmPerson.Show 0
    Unload Me
End Sub

Private Sub Label2_Click()
    frmNewEmpPos.Show 0
    Unload Me
End Sub

Private Sub Label3_Click()
    frmQuery1.Show 0
    Unload Me
End Sub

Private Sub Label4_Click()
    frmQuery2.Show 0
    Unload Me
End Sub
