VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3705
   ClientLeft      =   1905
   ClientTop       =   2280
   ClientWidth     =   7650
   LinkTopic       =   "Form1"
   ScaleHeight     =   3705
   ScaleWidth      =   7650
   Begin VB.TextBox Text3 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   105
      TabIndex        =   0
      Top             =   105
      Width           =   540
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Add to List"
      Height          =   1380
      Left            =   6825
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   105
      Width           =   750
   End
   Begin VB.TextBox Text2 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   735
      TabIndex        =   16
      TabStop         =   0   'False
      Top             =   105
      Width           =   3270
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2325
      Left            =   105
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   525
      Width           =   3900
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
      Left            =   4200
      Style           =   1  'Graphical
      TabIndex        =   14
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
      Left            =   5040
      Style           =   1  'Graphical
      TabIndex        =   13
      TabStop         =   0   'False
      Top             =   105
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
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   105
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
      Left            =   4200
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
      Left            =   5040
      Style           =   1  'Graphical
      TabIndex        =   10
      TabStop         =   0   'False
      Top             =   840
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
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   9
      TabStop         =   0   'False
      Top             =   840
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
      Left            =   4200
      Style           =   1  'Graphical
      TabIndex        =   8
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
      Left            =   5040
      Style           =   1  'Graphical
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   1575
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
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   1575
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
      Left            =   4200
      Style           =   1  'Graphical
      TabIndex        =   5
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
      Left            =   5040
      Style           =   1  'Graphical
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   2310
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
      Left            =   5880
      Style           =   1  'Graphical
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   2310
      Width           =   750
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset"
      Height          =   645
      Left            =   6825
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   1575
      Width           =   750
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Exit"
      Height          =   645
      Left            =   6825
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   2310
      Width           =   750
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdAdd_Click()
  'Text1.Text = Text1.Text & "  AddList " & """" & Text3.Text & """" & ", " & """" & Text2.Text & """" & vbCrLf
  If Text3.Text = """" Then
    Text1.Text = Text1.Text & """" & "DQ" & """" & ", " & """" & Text2.Text & """" & vbCrLf
  Else
    Text1.Text = Text1.Text & """" & Text3.Text & """" & ", " & """" & Text2.Text & """" & vbCrLf
  End If
  Text1.SelStart = Len(Text1.Text)
  Dim i As Integer
  For i = 0 To 11
    Command(i).BackColor = &H8000000F
  Next i
  Text2.Text = ""
  Text3.SelStart = 0
  Text3.SelLength = 10
  Text3.SetFocus
End Sub

Private Sub cmdExit_Click()
  Unload Me
End Sub

Private Sub cmdReset_Click()
  Dim i As Integer
  For i = 0 To 11
    Command(i).BackColor = &H8000000F
  Next i
  Text2.Text = ""
  Text3.SelStart = 0
  Text3.SelLength = 10
  Text3.SetFocus
End Sub

Private Sub Command_Click(Index As Integer)
  Dim ch As String
  Dim i As Integer
  For i = 0 To 11
    Command(i).BackColor = &H8000000F
  Next i
  Command(Index).BackColor = RGB(128, 128, 255)
  
  Select Case Index
    Case 0 To 9
      ch = Index
    Case 10
      ch = "*"
    Case 11
      ch = "#"
  End Select
  Text2.Text = Text2.Text & ch
  Text3.SelStart = 0
  Text3.SelLength = 10
  Text3.SetFocus
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  Clipboard.Clear
  Clipboard.SetText Text1.Text
End Sub
