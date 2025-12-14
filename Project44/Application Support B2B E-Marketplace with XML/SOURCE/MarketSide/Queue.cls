VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Queue"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Dim conn As ADODB.Connection
Dim rcs As ADODB.Recordset
Dim ConnectionString As String
Dim Status As Boolean

Public Property Let SetConnectionString(ByVal conString As String)
        ConnectionString = conString
End Property

Public Property Get GetConnectionString() As String
        GetConnectionString = ConnectionString
End Property

Public Property Get EndQueue() As Boolean
        EndQueue = Status
End Property

Public Function CheckMessage() As Boolean
        conn.Open ConnectionString
        Set rcs = conn.Execute("select * from Queue")
        If (rcs.EOF) And (rcs.BOF) Then
                CheckMessage = False
                rcs.Close
                conn.Close
        Else
                CheckMessage = True
                Status = True
        End If
End Function

Public Function GetMessage() As String
        If Status Then
                If Not (rcs.EOF) Then
                        GetMessage = rcs!Item
                        'conn.Execute "delete from Queue where qid =" & rcs!qid
                        'rcs.MoveNext
                Else
                        rcs.Close
                        conn.Close
                        GetMessage = ""
                        Status = False
                End If
        End If
End Function

Public Sub AddQueue(ByVal Item As String, ByVal intType As Integer)
        Dim rs As ADODB.Recordset
        Set rs = New ADODB.Recordset
        Dim sql As String
        
        If Status Then
                Set rs = conn.Execute("select max(QID) as maxQ from Queue")
                If IsNull(rs!maxQ) Then
                        sql = "insert into queue value (1, '" & Item & "', " & intType & ")"
                Else
                        sql = "insert into queue value (" & Str$(rs!maxQ + 1) & ",'" & Item & "', " & intType & ")"
                End If
                conn.Execute sql
                rs.Close
        Else
                If conn.State <> adStateClosed Then conn.Close
                conn.Open ConnectionString
                
                Set rs = conn.Execute("select max(QID) as maxQ from Queue")
                If IsNull(rs!maxQ) Then
                        sql = "insert into queue  values (1, '" & Item & "', " & intType & ")"
                Else
                        sql = "insert into queue  values (" & Str$(rs!maxQ + 1) & ",'" & Item & "', " & intType & ")"
                End If
                conn.Execute sql
                rs.Close
                conn.Close
        End If
        Set rs = Nothing
End Sub

Private Sub Class_Initialize()
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        Status = False
End Sub

Private Sub Class_Terminate()
        Set rcs = Nothing
        Set conn = Nothing
End Sub

Public Sub RemoveQueue()
        conn.Execute "delete from Queue where qid =" & rcs!qid
        rcs.MoveNext
End Sub
