Attribute VB_Name = "mdlDatabase"
Option Explicit

Public Cnn As New ADODB.Connection
Public Rst As New ADODB.Recordset
Public sql As String
Public m_Username As String
Public m_Permission As String

Public Sub ConnectDB()
    If Cnn.state = 1 Then Cnn.Close
    Cnn.ConnectionString = "Provider=SQLOLEDB.1;Password=olanla;Persist Security Info=True;User ID=Admin;Data Source=DATE"
    Cnn.ConnectionTimeout = 60
    Cnn.CursorLocation = adUseClient
    Cnn.Open
End Sub

Public Sub DisconnectDB()
    On Error Resume Next
    Cnn.Close
End Sub

Public Sub OpenRst(SQL_ As String)
  On Error Resume Next
  If Rst.state = 1 Then Rst.Close
  Rst.Open SQL_, Cnn, adOpenKeyset, adLockOptimistic
End Sub

Public Function QQ(src As String) As String ' Replace all (') with ('') , for SQL command
  Dim st As String
  Dim s As String
  Dim i As Integer
  st = ""
  For i = 1 To Len(src)
    s = Mid(src, i, 1)
    If s = "'" Then st = st & "''" Else st = st & s
  Next i
  QQ = st
End Function

