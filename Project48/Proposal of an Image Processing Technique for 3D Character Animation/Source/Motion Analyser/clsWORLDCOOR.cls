VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsWORLDCOOR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private mvarX As New clsAvrNumber
Private mvarY As New clsAvrNumber
Private mvarZ As New clsAvrNumber
Private mvarMoveTh As Double ' Threshold to clear array (in metre)

Public Sub SetXYZ(vNewX As Double, vNewY As Double, vNewZ As Double)
    Dim dx As Double, dy As Double, dz As Double
    dx = vNewX - mvarX.GetAverage
    dy = vNewY - mvarY.GetAverage
    dz = vNewZ - mvarZ.GetAverage
    If (Sqr(dx * dx + dy * dy + dz * dz) > mvarMoveTh) Then ' If move out of threshold, clear array
        mvarX.Clear
        mvarY.Clear
        mvarZ.Clear
    End If
    
    ' Update
    mvarX.AddValue vNewX
    mvarY.AddValue vNewY
    mvarZ.AddValue vNewZ
End Sub

Public Sub NewAverage(ArrSize As Integer)  ' Create new array
    mvarX.CreateArray ArrSize
    mvarY.CreateArray ArrSize
    mvarZ.CreateArray ArrSize
End Sub

Public Property Get MoveThreshold() As Double
    MoveThreshold = mvarMoveTh
End Property

Public Property Let MoveThreshold(ByVal vNewMT As Double)
    mvarMoveTh = vNewMT
End Property

Public Property Get X() As Double
    X = mvarX.GetAverage
End Property

Public Property Get Y() As Double
    Y = mvarY.GetAverage
End Property

Public Property Get Z() As Double
    Z = mvarZ.GetAverage
End Property

