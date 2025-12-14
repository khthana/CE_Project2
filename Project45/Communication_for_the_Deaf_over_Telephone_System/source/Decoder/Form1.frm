VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   7140
   ClientLeft      =   1650
   ClientTop       =   810
   ClientWidth     =   8100
   LinkTopic       =   "Form1"
   ScaleHeight     =   7140
   ScaleWidth      =   8100
   Begin MSComDlg.CommonDialog Dialog1 
      Left            =   1785
      Top             =   5460
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
      DefaultExt      =   "txt"
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Load from File"
      Height          =   750
      Left            =   2730
      TabIndex        =   29
      Top             =   4620
      Width           =   540
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Clear"
      Height          =   330
      Left            =   7245
      TabIndex        =   27
      TabStop         =   0   'False
      Top             =   5040
      Width           =   750
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Remove"
      Height          =   330
      Left            =   7245
      TabIndex        =   28
      TabStop         =   0   'False
      Top             =   4725
      Width           =   750
   End
   Begin VB.CommandButton Command1 
      Caption         =   "<"
      Height          =   750
      Left            =   2730
      TabIndex        =   26
      Top             =   3780
      Width           =   540
   End
   Begin VB.TextBox Text3 
      Height          =   1590
      Left            =   105
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   25
      Top             =   3780
      Width           =   2535
   End
   Begin VB.ListBox List2 
      Height          =   1530
      ItemData        =   "Form1.frx":0000
      Left            =   3360
      List            =   "Form1.frx":0002
      TabIndex        =   24
      TabStop         =   0   'False
      Top             =   5460
      Width           =   4635
   End
   Begin VB.ListBox List1 
      Height          =   1530
      ItemData        =   "Form1.frx":0004
      Left            =   3360
      List            =   "Form1.frx":0006
      TabIndex        =   23
      TabStop         =   0   'False
      Top             =   3780
      Width           =   3795
   End
   Begin VB.CommandButton cmdComboMatch 
      Caption         =   "Combo Match Test"
      Height          =   960
      Left            =   7245
      TabIndex        =   22
      TabStop         =   0   'False
      Top             =   3780
      Width           =   750
   End
   Begin VB.ListBox lstMatch 
      Height          =   2790
      ItemData        =   "Form1.frx":0008
      Left            =   6510
      List            =   "Form1.frx":000A
      Sorted          =   -1  'True
      TabIndex        =   21
      TabStop         =   0   'False
      Top             =   105
      Width           =   1485
   End
   Begin VB.CommandButton cmdMatch 
      Caption         =   "Match Char"
      Height          =   1380
      Left            =   5670
      TabIndex        =   20
      TabStop         =   0   'False
      Top             =   105
      Width           =   750
   End
   Begin VB.ListBox lstChar 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2700
      Left            =   105
      TabIndex        =   19
      TabStop         =   0   'False
      Top             =   105
      Width           =   1035
   End
   Begin VB.ListBox lstPattern 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2700
      Left            =   1200
      TabIndex        =   18
      TabStop         =   0   'False
      Top             =   105
      Width           =   1620
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   645
      Left            =   5670
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   2310
      Width           =   750
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset"
      Height          =   645
      Left            =   5670
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   1575
      Width           =   750
   End
   Begin VB.CommandButton Command 
      Caption         =   "#"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Index           =   11
      Left            =   4725
      Style           =   1  'Graphical
      TabIndex        =   16
      TabStop         =   0   'False
      Top             =   2310
      Width           =   750
   End
   Begin VB.CommandButton Command 
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Index           =   0
      Left            =   3885
      Style           =   1  'Graphical
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   2310
      Width           =   750
   End
   Begin VB.CommandButton Command 
      Caption         =   "*"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Index           =   10
      Left            =   3045
      Style           =   1  'Graphical
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   2310
      Width           =   750
   End
   Begin VB.CommandButton Command 
      Caption         =   "9"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Index           =   9
      Left            =   4725
      Style           =   1  'Graphical
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   1575
      Width           =   750
   End
   Begin VB.CommandButton Command 
      Caption         =   "8"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Index           =   8
      Left            =   3885
      Style           =   1  'Graphical
      TabIndex        =   13
      TabStop         =   0   'False
      Top             =   1575
      Width           =   750
   End
   Begin VB.CommandButton Command 
      Caption         =   "7"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Index           =   7
      Left            =   3045
      Style           =   1  'Graphical
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   1575
      Width           =   750
   End
   Begin VB.CommandButton Command 
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Index           =   6
      Left            =   4725
      Style           =   1  'Graphical
      TabIndex        =   11
      TabStop         =   0   'False
      Top             =   840
      Width           =   750
   End
   Begin VB.CommandButton Command 
      Caption         =   "5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Index           =   5
      Left            =   3885
      Style           =   1  'Graphical
      TabIndex        =   10
      TabStop         =   0   'False
      Top             =   840
      Width           =   750
   End
   Begin VB.CommandButton Command 
      Caption         =   "4"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Index           =   4
      Left            =   3045
      Style           =   1  'Graphical
      TabIndex        =   9
      TabStop         =   0   'False
      Top             =   840
      Width           =   750
   End
   Begin VB.CommandButton Command 
      Caption         =   "3"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Index           =   3
      Left            =   4725
      Style           =   1  'Graphical
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   105
      Width           =   750
   End
   Begin VB.CommandButton Command 
      Caption         =   "2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Index           =   2
      Left            =   3885
      Style           =   1  'Graphical
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   105
      Width           =   750
   End
   Begin VB.TextBox Text2 
      Height          =   345
      Left            =   1050
      Locked          =   -1  'True
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   3360
      Width           =   6945
   End
   Begin VB.TextBox Text1 
      Height          =   345
      Left            =   1050
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   3045
      Width           =   6945
   End
   Begin VB.CommandButton Command 
      Caption         =   "1"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   645
      Index           =   1
      Left            =   3045
      Style           =   1  'Graphical
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   105
      Width           =   750
   End
   Begin VB.Label Label2 
      Caption         =   "ค่าที่แปลได้"
      Height          =   330
      Left            =   105
      TabIndex        =   4
      Top             =   3360
      Width           =   2010
   End
   Begin VB.Label Label1 
      Caption         =   "ปุ่มที่กด"
      Height          =   330
      Left            =   105
      TabIndex        =   3
      Top             =   3045
      Width           =   2010
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private InBuff As String
Private OutBuff As String

Public Sub AddList(ByVal ch As String, ByVal ptrn As String)
  lstChar.AddItem "   " & ch '*** 3 spaces
  lstPattern.AddItem ptrn
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

Public Sub MatchPattern(ByVal st As String, ByRef Buff As String)
  Dim i As Integer
  Dim index, score As Integer
  Dim ch As String
  index = -1
  score = -1
  For i = 0 To lstPattern.ListCount - 1
    If Match(st, lstPattern.List(i)) Then
      If Len(lstPattern.List(i)) > score Then
        index = i
        score = Len(lstPattern.List(i))
      End If
    End If
  Next i
  
  If index > -1 Then
    ch = Right(lstChar.List(index), Len(lstChar.List(index)) - 3) '*** -3 space
    Select Case ch
      Case "<DEL>"
        If (Len(Buff) > 0) Then Buff = Left(Buff, Len(Buff) - 1)
      Case "<CLEAR>"
        Buff = ""
      Case Else
        Buff = Buff & ch
    End Select
  End If
End Sub

Public Sub NewKeyPress(ch As String)
  Dim st As String
  
  If (Right(InBuff, 1) = "#") And (ch = "#") Then
    Text2.Text = OutBuff
    InBuff = ""
    OutBuff = ""
    Exit Sub
  End If
 
  If (Right(InBuff, 2) = "**") And (ch <> "*") Then
    MatchPattern Left(InBuff, Len(InBuff) - 2), OutBuff
    InBuff = ch
    Exit Sub
  End If
  
  InBuff = InBuff & ch
End Sub
'--------------------------------------------------------------------

Private Sub cmdComboMatch_Click()
  Dim j As Integer
  Dim i As Integer
  Dim index, score As Integer
  Dim ch As String
  Dim a(20) As Integer
  Dim matchindex As Integer
  Dim st As String
  List2.Clear
  For j = 0 To List1.ListCount - 1
    index = -1
    score = -1
    matchindex = 1
    For i = 0 To lstPattern.ListCount - 1
      If Match(List1.List(j), lstPattern.List(i)) Then
        If (Len(lstPattern.List(i))) = score Then
          matchindex = matchindex + 1
          a(matchindex) = i
        End If
        If (Len(lstPattern.List(i))) > score Then
          matchindex = 1
          score = Len(lstPattern.List(i))
          a(matchindex) = i
        End If
      End If
    Next i
    
    st = ""
    For i = 1 To matchindex
      st = st + "  " + lstChar.List(a(i))
    Next i
    List2.AddItem (List1.List(j) & vbTab & " - " & st)
  Next j
End Sub

Private Sub cmdExit_Click()
  Unload Me
End Sub

Private Sub cmdMatch_Click()
  lstMatch.Clear
  Dim i As Integer
  Dim index, score As Integer
  Dim ch As String
  index = -1
  score = -1
  For i = 0 To lstPattern.ListCount - 1
    If Match(Text1.Text, lstPattern.List(i)) Then
      lstMatch.AddItem (Len(lstPattern.List(i)) & "    " & lstChar.List(i))
    End If
  Next i
  lstMatch.ListIndex = lstMatch.ListCount - 1
  List1.AddItem Text1.Text
  List1.ListIndex = List1.ListCount - 1
  cmdReset_Click
End Sub

Private Sub cmdReset_Click()
  Dim i As Integer
  For i = 0 To 11
    Command(i).BackColor = &H8000000F
  Next i
  InBuff = ""
  OutBuff = ""
  Text1.Text = ""
  Text2.Text = ""
End Sub

Private Sub Command_Click(index As Integer)
  Dim ch As String
  Dim i As Integer
  For i = 0 To 11
    Command(i).BackColor = &H8000000F
  Next i
  Command(index).BackColor = RGB(128, 128, 255)
  
  Select Case index
    Case 0 To 9
      ch = index
    Case 10
      ch = "*"
    Case 11
      ch = "#"
  End Select
  Text1.Text = Text1.Text & ch
  NewKeyPress (ch)
  Text1.SetFocus
End Sub

Private Sub Command1_Click()
Dim i As Integer
  Text3.Text = ""
  For i = 0 To List1.ListCount - 1
    Text3.Text = Text3.Text & List1.List(i) & vbCrLf
  Next i
End Sub

Private Sub Command2_Click()
  List1.Clear
  List2.Clear
End Sub

Private Sub Command3_Click()
  On Error Resume Next
  List1.RemoveItem List1.ListIndex
End Sub

Private Sub Command4_Click()
Dim st As String
On Error GoTo ErrH
  List1.Clear
  Dialog1.ShowOpen
  Open Dialog1.FileName For Input As #1
  Do While Not EOF(1)   ' Loop until end of file.
    Line Input #1, st   ' Read line into variable.
    List1.AddItem st
  Loop
  Close #1
ErrH:
End Sub

Private Sub Form_Load()
  lstPattern.Clear
  lstChar.Clear
  '-------------
  Dim s1, s2 As String
  Open "codec.txt" For Input As #1
  Do While Not EOF(1)
    Input #1, s1, s2
    If s1 = "DQ" Then AddList """", s2 Else AddList s1, s2
  Loop
  Close #1
  '-------------
  lstPattern.ListIndex = 0
  lstChar.ListIndex = 0
  cmdReset_Click
End Sub

Private Sub lstChar_Click()
  lstPattern.ListIndex = lstChar.ListIndex
End Sub

Private Sub lstPattern_Click()
  lstChar.ListIndex = lstPattern.ListIndex
End Sub
