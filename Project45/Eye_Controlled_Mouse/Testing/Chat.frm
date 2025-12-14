VERSION 5.00
Object = "{65E121D4-0C60-11D2-A9FC-0000F8754DA1}#2.0#0"; "mschrt20.ocx"
Begin VB.Form Form5 
   Caption         =   "Chart"
   ClientHeight    =   7260
   ClientLeft      =   6330
   ClientTop       =   1095
   ClientWidth     =   8130
   LinkTopic       =   "Form5"
   ScaleHeight     =   7260
   ScaleWidth      =   8130
   Begin VB.CommandButton Command2 
      Caption         =   "Exit"
      Height          =   375
      Left            =   6720
      TabIndex        =   2
      Top             =   6480
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Menu"
      Height          =   375
      Left            =   360
      TabIndex        =   1
      Top             =   6480
      Width           =   975
   End
   Begin MSChart20Lib.MSChart MSChart1 
      Height          =   5535
      Left            =   0
      OleObjectBlob   =   "Chat.frx":0000
      TabIndex        =   0
      Top             =   0
      Width           =   7695
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Pixel/Sec"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5640
      TabIndex        =   5
      Top             =   6120
      Width           =   1215
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Label2"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00808000&
      Height          =   375
      Left            =   3480
      TabIndex        =   4
      Top             =   6000
      Width           =   2895
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Average"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00400000&
      Height          =   495
      Left            =   1920
      TabIndex        =   3
      Top             =   6000
      Width           =   1335
   End
End
Attribute VB_Name = "Form5"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Avg As Double
Dim i As Integer

Private Sub Command1_Click()
Unload Me
First.Show
End Sub

Private Sub Command2_Click()
End
End Sub

Private Sub Form_Load()
Avg = 0
MSChart1.chartType = VtChChartType2dBar
MSChart1.ChartData = rateDC
MSChart1.ColumnLabel = "Distance/Sec"
MSChart1.RowLabel = "Time"
MSChart1.TitleText = "Distances/Sec."
i = 0
Do While rateDC(i + 1) <> 0
Avg = rateDC(i) + rateDC(i + 1)
i = i + 1
Loop
Label2.Caption = Round((Avg / (i + 1)), 2)
End Sub

