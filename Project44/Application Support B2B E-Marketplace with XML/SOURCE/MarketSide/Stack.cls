VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Stack"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'------------ Implement Stack --------------
Option Explicit
Option Base 1
Const max_stack = 20

Private top As Integer
Private item(max_stack) As Integer
Private flagEmpty As Boolean
Private flagFull As Boolean
Private flagError As Boolean

Public Sub push(ByVal st As Integer)
    If top < max_stack Then
        item(top) = st
        top = top + 1
        If top = max_stack Then
            flagFull = True
        Else
            flagFull = False
        End If
        flagEmpty = False
    Else
        MsgBox "Stack Full !!!" & vbCrLf & "Can not push stack", vbCritical + vbOKOnly, "Error!!! Stack Full"
        flagError = True
    End If
End Sub

Public Function pop() As Integer
    If top > 1 Then
        top = top - 1
        pop = item(top)
        If top = 1 Then
            flagEmpty = True
        Else
            flagEmpty = False
        End If
        flagFull = False
    Else
        MsgBox "Stack Empty !!!" & vbCrLf & "Can not pop stack", vbCritical + vbOKOnly, "Error!!! Stack Empty"
        flagError = True
    End If
End Function

Public Property Get isEmpty() As Boolean
    isEmpty = flagEmpty
End Property

Public Property Get isFull() As Boolean
    isFull = flagFull
End Property

Public Property Get isError() As Boolean
    isError = flagError
End Property

Private Sub Class_Initialize()
    top = 1
    flagEmpty = True
    flagFull = False
    flagError = False
End Sub
