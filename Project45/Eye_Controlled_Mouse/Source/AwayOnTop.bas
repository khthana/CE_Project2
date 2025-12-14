Attribute VB_Name = "AwayOnTop"
'Option Explicit

'----------------Declare For Away On TOp---------------------
Public Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, y, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Public Const HWND_TOPMOST = -1
Public Const HWND_NOTOPMOST = -2
Public Const SWP_NOMOVE = &H2
Public Const SWP_NOSIZE = &H1
Public Const TOPMOST_FLAGS = SWP_NOMOVE Or SWP_NOSIZE

'*********************Away on top**************************
'-----------Don't use----------------
Public Sub MakeNormal(hwnd As Long)
   SetWindowPos hwnd, HWND_NOTOPMOST, 0, 0, 0, 0, OPMOST_FLAGS
End Sub
'--------------use-------------------
Public Sub MakeTopMost(hwnd As Long)
   SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, TOPMOST_FLAGS
End Sub

