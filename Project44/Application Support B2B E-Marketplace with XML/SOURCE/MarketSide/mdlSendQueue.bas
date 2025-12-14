Attribute VB_Name = "mdlSendQueue"
Option Explicit

Public Sub AddQueue(ByVal FilePaths As String, ByVal remoteUserID As String)
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim qid As Integer
        
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        conn.ConnectionString = DBconString
        conn.CursorLocation = adUseClient
        conn.Open
        rcs.Open "select max(QID) as maxQ from sendqueue", conn
        If IsNull(rcs!maxQ) Then
                qid = 1
        Else
                qid = rcs!maxQ + 1
        End If
        rcs.Close
        rcs.Open "SendQueue", conn, 1, 3
        rcs.AddNew
                rcs!qid = qid
                rcs!filePath = FilePaths
                rcs!remoteUserID = remoteUserID
        rcs.Update
        rcs.Close
        conn.Close
        Set rcs = Nothing
        Set conn = Nothing
End Sub

Public Function IsEndOfQueue() As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        conn.ConnectionString = DBconString
        conn.CursorLocation = adUseClient
        conn.Open
        rcs.Open "SendQueue", conn, 1, 3
        If rcs.RecordCount > 0 Then
                IsEndOfQueue = False
        Else
                IsEndOfQueue = True
        End If
        rcs.Close
        conn.Close
        Set rcs = Nothing
        Set conn = Nothing
End Function

Public Function GetFilePath(ByRef remoteUserID As String) As String
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        conn.ConnectionString = DBconString
        conn.CursorLocation = adUseClient
        conn.Open
        rcs.Open "SendQueue", conn, 1, 3
        If rcs.RecordCount > 0 Then
                If Not (rcs.BOF) Then rcs.MoveFirst
                GetFilePath = rcs!filePath
                remoteUserID = rcs!remoteUserID
                rcs.Delete adAffectCurrent
        Else
                GetFilePath = ""
        End If
        rcs.Close
        conn.Close
        Set rcs = Nothing
        Set conn = Nothing
End Function
