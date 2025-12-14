VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsAvrNumber"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private DataArray() As Double   ' Data array
Private ArrayLen As Integer     ' Total array length
Private ValidCount As Integer   ' Number of array member that valid
Private NextIndex As Integer    ' Next array index to store new value

Private AverageVal As Double    ' Average value

Public Sub CreateArray(ByVal Count As Integer)     ' Create number array
    If (Count < 1) Then Exit Sub
    
    ' Redim array
    ReDim DataArray(0 To (Count - 1)) As Double
    ArrayLen = Count
    NextIndex = 0
    ValidCount = 0
    AverageVal = 0
End Sub

Public Sub AddValue(ByVal NewValue As Double)    ' Add new value
    DataArray(NextIndex) = NewValue
    NextIndex = NextIndex + 1
    If (ValidCount < ArrayLen) Then ValidCount = ValidCount + 1
    If (NextIndex >= ArrayLen) Then NextIndex = 0
    
    ' Calculate for average
    If (ValidCount <= 0) Then AverageVal = 0: Exit Sub

    Dim Sum As Double
    Dim i As Integer
    Sum = 0
    For i = 0 To (ValidCount - 1)
        Sum = Sum + DataArray(i)
    Next i
    AverageVal = Sum / ValidCount
End Sub

Public Function GetAverage() As Double    ' Find average value of valid values
    GetAverage = AverageVal
End Function

Public Sub Clear()  ' Clear all data
    NextIndex = 0
    ValidCount = 0
    AverageVal = 0
End Sub
