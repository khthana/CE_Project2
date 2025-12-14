Attribute VB_Name = "Database"
Option Explicit

Public Cnn As New ADODB.Connection
Public Rst As New ADODB.Recordset
Public sql As String

Public Sub ConnectDB()
  Dim str As String
  Dim uid As String
  Dim pwd As String
  str = "Provider=SQLOLEDB.1;Persist Security Info=True;User ID=sa;Initial Catalog=dataprint;Data Source=COOLSHARKS"
  uid = ""
  pwd = ""
  Cnn.CursorLocation = adUseClient
  Cnn.ConnectionTimeout = 60
  Cnn.Open str, uid, pwd
End Sub

Public Function TryLogin(usr As String, pwd As String) As Boolean
  sql = "SELECT * FROM Admin WHERE Username='" & QQ(usr) & "' AND Password = '" & QQ(pwd) & "'"
  OpenRst sql
  If Rst.RecordCount > 0 Then TryLogin = True Else TryLogin = False
End Function

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

Public Sub main()
  ConnectDB
  frmLogin.Show
End Sub

Public Sub CloseApp()
  If Cnn.State = 1 Then Cnn.Close
  Do While Forms.Count > 0
    Unload Forms(0)
   Loop
End Sub

Public Function IsNumber(v As String) As Boolean ' Check if it is a valid number (Currency is invalid, no comma (,) allowed)
  IsNumber = (IsNumeric(v) And (InStr(1, v, ",") = 0))
End Function

Public Sub OpenRst(sql As String)
  If Rst.State = 1 Then Rst.Close
  Debug.Print sql
  Rst.Open sql, Cnn, adOpenDynamic, adLockOptimistic
End Sub
