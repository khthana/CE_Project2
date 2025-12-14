VERSION 5.00
Begin VB.Form frphone 
   AutoRedraw      =   -1  'True
   BackColor       =   &H0080C0FF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Select Phone Directory"
   ClientHeight    =   4860
   ClientLeft      =   6255
   ClientTop       =   3180
   ClientWidth     =   3165
   Icon            =   "frphone.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4860
   ScaleWidth      =   3165
   StartUpPosition =   1  'CenterOwner
   Visible         =   0   'False
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "&Select"
      Height          =   495
      Left            =   1920
      TabIndex        =   2
      Top             =   4320
      Width           =   1095
   End
   Begin VB.DirListBox dirphone 
      Height          =   3450
      Left            =   120
      TabIndex        =   1
      Top             =   720
      Width           =   2895
   End
   Begin VB.DriveListBox drvphone 
      Height          =   330
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   2895
   End
End
Attribute VB_Name = "frphone"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cmdOK_Click()
    PhonePath = dirphone.Path
    Unload Me
End Sub

Private Sub drvphone_Change()
    dirphone.Path = drvphone.Drive
End Sub

Private Sub Form_Load()
    dirphone.Path = PhonePath
End Sub
