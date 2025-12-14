Attribute VB_Name = "dtmfDecoder"
Option Explicit

Const MAX_CODEC = 600
Public aChar(MAX_CODEC) As String ' array of char
Public aPattern(MAX_CODEC) As String ' array of pattern
Public CodecCount As Integer ' count
Public InBuff As String ' input buffer (DTMF)
Public OutBuff As String ' ouput buffer (Text)

Public Sub AddCodec(ByVal ch As String, ByVal ptrn As String)
  aChar(CodecCount) = ch
  aPattern(CodecCount) = ptrn
  CodecCount = CodecCount + 1
End Sub

Public Sub LoadCodec()
  Dim s1, s2 As String
  Open App.Path & "\codec.txt" For Input As #1
  CodecCount = 0
  Do While Not EOF(1)
    Input #1, s1, s2
    If s1 = "DQ" Then AddCodec """", s2 Else AddCodec s1, s2
  Loop
  Close #1
End Sub

Public Function Match(st As String, ptrn As String) As Boolean
  Dim i, j As Integer
  Dim matched As Integer
  
  matched = 0
  i = 1
  j = 1
  Do While ((i <= Len(st)) And (j <= Len(ptrn)))
    If (Mid(st, i, 1) = Mid(ptrn, j, 1)) Then
      j = j + 1
      matched = matched + 1
    End If
    i = i + 1
  Loop
  Match = (matched = Len(ptrn))
End Function

Public Function MatchPattern(ByVal st As String, ByRef Buff As String) As String
  Dim i As Integer
  Dim index, score As Integer
  Dim ch As String
  index = -1
  score = -1
  For i = 0 To CodecCount - 1
    If Match(st, aPattern(i)) Then
      If Len(aPattern(i)) > score Then
        index = i
        score = Len(aPattern(i))
      End If
    End If
  Next i
  
  ch = ""
  If index > -1 Then
    ch = aChar(index)
    Select Case ch
      Case "<DEL>"
        If (Len(Buff) > 0) Then Buff = Left(Buff, Len(Buff) - 1)
      Case "<CLEAR>"
        Buff = ""
      Case Else
        Buff = Buff & ch
    End Select
  End If
  MatchPattern = ch
End Function

