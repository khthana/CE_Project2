VERSION 5.00
Begin VB.Form Thanks 
   Caption         =   "Thanks"
   ClientHeight    =   6300
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9030
   BeginProperty Font 
      Name            =   "CordiaUPC"
      Size            =   24
      Charset         =   222
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Thanks.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6300
   ScaleWidth      =   9030
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   7680
      TabIndex        =   3
      Top             =   5760
      Width           =   1095
   End
   Begin VB.CommandButton cmdNext 
      Caption         =   "&Next >"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   6240
      TabIndex        =   2
      Top             =   5760
      Width           =   1095
   End
   Begin VB.PictureBox Picture2 
      Height          =   60
      Left            =   240
      ScaleHeight     =   0
      ScaleWidth      =   8475
      TabIndex        =   1
      Top             =   5520
      Width           =   8535
   End
   Begin VB.PictureBox Picture1 
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5175
      Left            =   240
      Picture         =   "Thanks.frx":0442
      ScaleHeight     =   5175
      ScaleWidth      =   2055
      TabIndex        =   0
      Top             =   240
      Width           =   2055
   End
   Begin VB.Label Label3 
      Caption         =   "Thanks for using Automatic Voice Sending System"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   14.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2520
      TabIndex        =   7
      Top             =   240
      Width           =   6375
   End
   Begin VB.Label Label4 
      Caption         =   "This Wizard helps you to make a voice messaging to the telephone."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2520
      TabIndex        =   6
      Top             =   840
      Width           =   5895
   End
   Begin VB.Label Label5 
      Caption         =   "Click Next to continue."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2520
      TabIndex        =   5
      Top             =   1320
      Width           =   1695
   End
   Begin VB.Label Label6 
      Caption         =   "Click Cancel to exit."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2520
      TabIndex        =   4
      Top             =   1560
      Width           =   1695
   End
End
Attribute VB_Name = "Thanks"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    End
End Sub

Private Sub cmdNext_Click()
    Me.Hide
    AddList.Show
End Sub
