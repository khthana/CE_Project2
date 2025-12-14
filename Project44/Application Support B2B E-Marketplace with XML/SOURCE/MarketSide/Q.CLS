VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Q"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Option Base 1

Const MaxItem = 20
Dim Item(MaxItem) As Integer
Dim count As Integer
Dim head As Integer
Dim tail As Integer

Public Function EnQueue(ByVal i As Integer) As Boolean
        If count < MaxItem Then
                Item(tail) = i
                If tail = MaxItem Then
                        tail = 1
                Else
                        tail = tail + 1
                End If
                count = count + 1
                EnQueue = True
        Else
                EnQueue = False
                MsgBox "Queue is Full"
        End If
End Function

Public Function GetItem() As Integer
        If count > 0 Then
                GetItem = Item(head)
                If head = MaxItem Then
                        head = 1
                Else
                        head = head + 1
                End If
                count = count - 1
        Else
                MsgBox "Queue Empty"
        End If
End Function

Private Sub Class_Initialize()
        head = 1
        tail = 1
        count = 0
End Sub

Public Function IsEmpty() As Boolean
        If count > 0 Then
                IsEmpty = False
        Else
                IsEmpty = True
        End If
End Function

Public Function IsFull() As Boolean
        If count < MaxItem Then
                IsFull = False
        Else
                IsFull = True
        End If
End Function
