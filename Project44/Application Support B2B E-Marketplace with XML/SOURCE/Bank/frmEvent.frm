VERSION 5.00
Begin VB.Form frmEvent 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Log Event"
   ClientHeight    =   6345
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5460
   Icon            =   "frmEvent.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6345
   ScaleWidth      =   5460
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtEvent 
      Height          =   6255
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Top             =   0
      Width           =   5415
   End
End
Attribute VB_Name = "frmEvent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
        frmEvent.Width = mdiMain.ScaleWidth / 2
        frmEvent.Height = mdiMain.ScaleHeight
        frmEvent.top = 0
        frmEvent.Left = 0
        txtEvent.Width = frmEvent.ScaleWidth
        txtEvent.Height = frmEvent.ScaleHeight
End Sub

Public Sub AddEvent(ByVal txt As String)
       txtEvent.Text = txt & vbCrLf & txtEvent
End Sub

Public Sub ClearEvent()
        txtEvent.Text = ""
End Sub
