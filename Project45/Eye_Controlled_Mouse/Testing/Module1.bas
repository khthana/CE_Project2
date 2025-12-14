Attribute VB_Name = "Module1"
Public Declare Function SetCursorPos Lib "user32" (ByVal x As Long, ByVal y As Long) As Long
Public Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Global mistake As Integer
Global UseTime As Integer
Global rateDC(10) As Double

Type POINTAPI
    x As Long
    y As Long
End Type
