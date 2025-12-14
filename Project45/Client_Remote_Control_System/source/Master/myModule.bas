Attribute VB_Name = "myModule"
Public nodeX As New myNode 'statrt 0
Public slave As New Collection 'start 1
Public tmpIP As String

Public Function getIPbySocketArrayIndex(ByVal Index As Integer) As String
    Dim i As Integer
    getIPbySocketArrayIndex = ""
    For i = 1 To slave.Count
        'MsgBox slave.Item(i).SocketIndex
        If slave(i).SocketIndex = Index Then
            getIPbySocketArrayIndex = slave(i).IP
        End If
    Next i
End Function

Public Function getSocketArrayIndexByIP(ByVal IP As String) As Integer
    Dim i As Integer
    getSocketArrayIndexByIP = -1
    For i = 1 To slave.Count
        If slave(i).IP = IP Then
            getSocketArrayIndexByIP = slave(i).SocketIndex
        End If
    Next i
End Function

Public Function getIPbyName(ByVal Name As String) As String
    Dim i As Integer
    getIPbyName = ""
    For i = 1 To slave.Count
        If slave(i).Name = Name Then
            getIPbyName = slave(i).IP
        End If
    Next i
End Function
