Attribute VB_Name = "mdlGeneral"
Option Explicit

Public Sub UnloadApp()
  On Error Resume Next
  DisconnectDB
  End
  Unload frmLogin
  Unload frmMenu
  Unload frmConfig
  Unload frmLoginMan
  Unload frmStatusRep

End Sub

Public Sub CenterForm(frm As Form)
  frm.Left = (Screen.Width - frm.Width) / 2
  frm.Top = (Screen.Height - frm.Height) / 2
End Sub
