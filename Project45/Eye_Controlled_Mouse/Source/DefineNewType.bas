Attribute VB_Name = "DefineNewType"
Option Explicit

Type PointTopBottom
    'index Y value
    Top As Integer
    Bottom As Integer
End Type

Type PointLeftRight
    'index X value
    Left As Integer
    Right As Integer
End Type

Type Position
    X As Integer
    Y As Integer
End Type

Type PositionWindow
    ' X,Y is Position of Window and MaxBlack is Amout of Point Color is Black
    X As Integer
    Y As Integer
    MaxBlack As Double
End Type

Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Type POINTAPI
    X As Long
    Y As Long
End Type

Type RangeRGB
    one As Integer
    two As Integer
    three As Integer
End Type

Type PosTime
    X As Integer
    Y As Integer
    Time As Integer
End Type



