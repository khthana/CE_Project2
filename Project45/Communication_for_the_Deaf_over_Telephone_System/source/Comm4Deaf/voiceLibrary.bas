Attribute VB_Name = "voiceLibrary"
Option Explicit

Public Cnn As New ADODB.Connection
Public Rst As New ADODB.Recordset
Public WavePath As String ' wave folder

Public Sub ConnectDB()
  Cnn.ConnectionTimeout = 60
  Cnn.CursorLocation = adUseClient
  Cnn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.3.51;Persist Security Info=False;Data Source=" & App.Path & "\wave.mdb"
  Cnn.Open
End Sub

Public Sub DisconnectDB()
  Cnn.Close
End Sub

Public Function GetFilenameOf(ByVal Word As String) As String
  Dim sql As String
  If Rst.State = 1 Then Rst.Close
  sql = "SELECT [Filename] FROM [Wave] WHERE [Word] = '" & QQ(Word) & "'"
  Rst.Open sql, Cnn, adOpenDynamic, adLockOptimistic
  If Rst.RecordCount > 0 Then
    GetFilenameOf = Rst.Fields(0).Value
  Else
    GetFilenameOf = ""
  End If
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

Public Function CutWord(ByRef StrIn As String) As String
  StrIn = Trim(StrIn)
  Dim i As Integer
  i = InStr(StrIn, " ")
  If i = 0 Then
    CutWord = StrIn
    StrIn = ""
  Else
    CutWord = Left(StrIn, i - 1)
    StrIn = Right(StrIn, Len(StrIn) - i)
  End If
End Function

Public Function FilterWords(ByVal StrIn As String) As String
  Dim Word As String
  Dim StrOut As String
  
  StrOut = ""
  Word = CutWord(StrIn)
  Do While (Word <> "")
    If (GetFilenameOf(Word) <> "") Then
      StrOut = StrOut & Word & " "
    End If
    Word = CutWord(StrIn)
  Loop
  FilterWords = StrOut
End Function

Public Function MakeWave(ByVal StrIn As String, ByVal OutputFilename As String) As String
  Dim a(50) As String
  Dim i, n As Integer
  Dim Word As String
  Dim StrOut As String
  Dim Filename As String
  Dim f1, f2, f3 As String
  
  n = 0
  StrOut = ""
  Word = CutWord(StrIn)
  Do While (Word <> "")
    Filename = GetFilenameOf(Word)
    If (Filename <> "") Then
      StrOut = StrOut & Word & " "
      a(n) = Filename '& ".wav"
      n = n + 1
    End If
    Word = CutWord(StrIn)
  Loop
   
  f3 = OutputFilename
  f1 = WavePath & "empty.wav"
  
  For i = 0 To n - 1
    f2 = WavePath & a(i)
    MergeWave f1, f2, f3
    f1 = f3
  Next i
  
  MakeWave = StrOut
End Function


