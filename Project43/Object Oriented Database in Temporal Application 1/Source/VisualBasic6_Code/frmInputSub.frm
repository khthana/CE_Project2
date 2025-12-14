VERSION 5.00
Begin VB.Form frmInputSub 
   Caption         =   "ใส่รหัสวิชา"
   ClientHeight    =   1590
   ClientLeft      =   4155
   ClientTop       =   2895
   ClientWidth     =   4545
   LinkTopic       =   "Form1"
   ScaleHeight     =   1590
   ScaleWidth      =   4545
   Begin VB.TextBox txtInputSub 
      Height          =   375
      Left            =   1200
      TabIndex        =   2
      Top             =   240
      Width           =   2415
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   2760
      TabIndex        =   1
      Top             =   960
      Width           =   1215
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "Ok"
      Height          =   495
      Left            =   600
      TabIndex        =   0
      Top             =   960
      Width           =   1215
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "รหัสวิชา"
      Height          =   210
      Left            =   480
      TabIndex        =   3
      Top             =   360
      Width           =   555
   End
End
Attribute VB_Name = "frmInputSub"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCancel_Click()
  Unload frmInputSub
End Sub

Private Sub cmdOk_Click()
Unload frmInputSub
End Sub
