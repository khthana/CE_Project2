VERSION 5.00
Begin VB.Form Main 
   Caption         =   "TQBE"
   ClientHeight    =   3855
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7470
   LinkTopic       =   "Form2"
   ScaleHeight     =   3855
   ScaleWidth      =   7470
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdexit 
      Caption         =   "Exit"
      Height          =   495
      Left            =   3960
      TabIndex        =   2
      Top             =   2760
      Width           =   1455
   End
   Begin VB.CommandButton cmdEnter 
      Caption         =   "Enter"
      Height          =   495
      Left            =   1680
      TabIndex        =   1
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Label Label1 
      Caption         =   "ภาษาเรียกค้นตามตัวอย่างเชิงเวลาบนฐานข้อมูลเชิงเวลา"
      BeginProperty Font 
         Name            =   "AngsanaUPC"
         Size            =   24
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   240
      TabIndex        =   3
      Top             =   480
      Width           =   6975
   End
   Begin VB.Label Tqbe 
      Caption         =   "TQBE on Temporal Database"
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
      Left            =   1200
      TabIndex        =   0
      Top             =   1440
      Width           =   5175
   End
End
Attribute VB_Name = "Main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdEnter_Click()
    Form1.Show
    Unload Me
End Sub

Private Sub cmdexit_Click()
    End
End Sub

Private Sub Form_Load()
    Left = (Screen.Width - Width) \ 2
    Top = (Screen.Height - Height) \ 2
End Sub

