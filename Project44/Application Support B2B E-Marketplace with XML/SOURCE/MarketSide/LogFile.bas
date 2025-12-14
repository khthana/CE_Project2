Attribute VB_Name = "LogFile"
Option Explicit

Public Sub AddLog(ByVal txt As String)
        Dim fso As FileSystemObject
        Dim txtstr As TextStream
        
        Set fso = New FileSystemObject
        If fso.FileExists(LogFileName) Then
                Set txtstr = fso.OpenTextFile(LogFileName, ForAppending)
        Else
                Set txtstr = fso.CreateTextFile(LogFileName, False)
        End If
        txtstr.WriteLine txt
        txtstr.Close
        Set fso = Nothing
End Sub

Public Sub ClearLog()
        Dim fso As FileSystemObject
        Dim txtstr As TextStream
        
        Set fso = New FileSystemObject
        Set txtstr = fso.CreateTextFile(LogFileName, True)
        txtstr.Close
        Set fso = Nothing
End Sub

Public Sub CopyLog(ByVal NewFile As String)
        Dim fso As FileSystemObject
        
        Set fso = New FileSystemObject
        fso.CopyFile LogFileName, NewFile, True
        Set fso = Nothing
End Sub
