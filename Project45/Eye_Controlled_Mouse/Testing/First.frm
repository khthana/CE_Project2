VERSION 5.00
Begin VB.Form First 
   BackColor       =   &H00FFFFFF&
   Caption         =   "Menu"
   ClientHeight    =   6030
   ClientLeft      =   10440
   ClientTop       =   1095
   ClientWidth     =   4050
   LinkTopic       =   "Form6"
   ScaleHeight     =   6030
   ScaleWidth      =   4050
   Begin VB.CommandButton Command5 
      Caption         =   "Enter"
      Height          =   375
      Left            =   360
      TabIndex        =   7
      Top             =   2520
      Width           =   1215
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Exit"
      Height          =   375
      Left            =   2760
      TabIndex        =   5
      Top             =   5400
      Width           =   975
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Level 2"
      Height          =   375
      Left            =   360
      TabIndex        =   4
      Top             =   4680
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Level 1"
      Height          =   375
      Left            =   360
      TabIndex        =   3
      Top             =   3960
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Enter"
      Height          =   375
      Left            =   360
      TabIndex        =   2
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Drag and Drop Speed Test"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   14.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   495
      Left            =   360
      TabIndex        =   6
      Top             =   1920
      Width           =   3615
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Control Test"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   14.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   375
      Left            =   360
      TabIndex        =   1
      Top             =   3240
      Width           =   1935
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Speed Test"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   14.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   375
      Left            =   360
      TabIndex        =   0
      Top             =   600
      Width           =   1695
   End
End
Attribute VB_Name = "First"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Me.Hide
Form4.Show
End Sub

Private Sub Command2_Click()
Me.Hide
Form1.Show
End Sub

Private Sub Command3_Click()
Me.Hide
Form2.Show
End Sub

Private Sub Command4_Click()
End
End Sub

Private Sub Command5_Click()
Unload Me
Form6.Show
End Sub

