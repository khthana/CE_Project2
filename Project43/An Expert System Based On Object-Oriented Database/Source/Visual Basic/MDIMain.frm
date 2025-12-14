VERSION 5.00
Begin VB.MDIForm MDIMain 
   BackColor       =   &H8000000F&
   Caption         =   "Frame-Based Expert System"
   ClientHeight    =   7500
   ClientLeft      =   1530
   ClientTop       =   930
   ClientWidth     =   9465
   LinkTopic       =   "MDIForm1"
   Picture         =   "MDIMain.frx":0000
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuAct 
      Caption         =   "&Activities"
      Begin VB.Menu mnuActDevelop 
         Caption         =   "&Develop"
      End
      Begin VB.Menu mnuActConsult 
         Caption         =   "&Consult"
      End
   End
End
Attribute VB_Name = "MDIMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim cache As New cacheobject.Factory

Private Sub mnuActConsult_Click()

    Load formConsult
    
End Sub

Private Sub mnuActDevelop_Click()

    Load formDevelop
    formDevelop.Visible = True
    
End Sub

Private Sub mnuExit_Click()
    
    End

End Sub
