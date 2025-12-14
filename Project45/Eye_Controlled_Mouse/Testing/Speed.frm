VERSION 5.00
Begin VB.Form Form4 
   Caption         =   "Form4"
   ClientHeight    =   11010
   ClientLeft      =   60
   ClientTop       =   30
   ClientWidth     =   15240
   LinkTopic       =   "Form4"
   ScaleHeight     =   11010
   ScaleWidth      =   15240
   Begin VB.CommandButton StartB 
      Caption         =   "START"
      Height          =   615
      Left            =   480
      TabIndex        =   2
      Top             =   10200
      Width           =   1335
   End
   Begin VB.CommandButton ExitB 
      Caption         =   "EXIT"
      Height          =   615
      Left            =   13320
      TabIndex        =   1
      Top             =   9960
      Width           =   1335
   End
   Begin VB.PictureBox Picture1 
      Height          =   1335
      Left            =   9120
      Picture         =   "Speed.frx":0000
      ScaleHeight     =   1275
      ScaleWidth      =   1275
      TabIndex        =   0
      Top             =   5400
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   2160
      Top             =   10320
   End
   Begin VB.Label Label1 
      Caption         =   "Time"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   14.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   375
      Left            =   14160
      TabIndex        =   3
      Top             =   120
      Width           =   855
   End
End
Attribute VB_Name = "Form4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim countT As Integer
Dim X1, Y1, X2, Y2 As Double
Dim Distance As Double
Dim i As Integer
Dim Pos1 As POINTAPI
Dim Pos2 As POINTAPI

Private Sub ExitB_Click()
Form5.Show
Unload Me
End Sub

Private Sub Picture1_Click()
GetCursorPos Pos2
Distance = Abs(Sqr((Pos1.x - Pos2.x) ^ 2 + (Pos1.y - Pos2.y) ^ 2))
'Distance = Abs(Sqr((X1 - X2) ^ 2 + (Y1 - Y2) ^ 2))

'rateDC(i) = countT / Distance 'sec/distance
rateDC(i) = Distance / countT
i = i + 1
If i = 10 Then
Unload Me
Form5.Show
End If
countT = 1
X1 = X2  'Picture Position
Y1 = Y2

Pos1 = Pos2 'Mouse Position

Randomize   ' Initialize random-number generator.
X2 = Int((10200 * Rnd) + 3240)  ' Generate random value between
Randomize   ' Initialize random-number generator.
Y2 = Int((5400 * Rnd) + 3200)  ' Generate random value between
Picture1.Left = X2
Picture1.Top = Y2
End Sub

Private Sub StartB_Click()
Picture1.Visible = True
Timer1.Enabled = True
countT = 1
i = 0
X1 = StartB.Left
Y1 = StartB.Top
X2 = Picture1.Left
Y2 = Picture1.Top
GetCursorPos Pos1
End Sub

Private Sub Timer1_Timer()
countT = countT + 1
Label1.Caption = countT
End Sub
