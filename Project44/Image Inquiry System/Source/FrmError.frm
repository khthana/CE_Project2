VERSION 5.00
Begin VB.Form FrmError 
   Caption         =   "Result Form"
   ClientHeight    =   1410
   ClientLeft      =   4770
   ClientTop       =   4230
   ClientWidth     =   3840
   LinkTopic       =   "Form1"
   ScaleHeight     =   1410
   ScaleWidth      =   3840
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   375
      Left            =   1440
      TabIndex        =   0
      Top             =   840
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Can't find this person in the Database"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Width           =   3375
   End
End
Attribute VB_Name = "FrmError"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Unload FrmError
End Sub


