VERSION 5.00
Begin VB.Form FrmShowResult 
   Caption         =   "Result Form"
   ClientHeight    =   4995
   ClientLeft      =   4740
   ClientTop       =   4380
   ClientWidth     =   7875
   LinkTopic       =   "Form1"
   ScaleHeight     =   4995
   ScaleWidth      =   7875
   Begin VB.CommandButton NextBtn 
      Caption         =   "Next >>"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6240
      TabIndex        =   18
      Top             =   4320
      Width           =   1215
   End
   Begin VB.CommandButton BackBtn 
      Caption         =   "<< Back"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5040
      TabIndex        =   17
      Top             =   4320
      Width           =   1215
   End
   Begin VB.TextBox txtAddress 
      Height          =   1455
      Left            =   4680
      MultiLine       =   -1  'True
      TabIndex        =   16
      Top             =   2640
      Width           =   2655
   End
   Begin VB.TextBox txtHeight 
      Height          =   375
      Left            =   6240
      TabIndex        =   14
      Top             =   2160
      Width           =   975
   End
   Begin VB.TextBox txtWieght 
      Height          =   375
      Left            =   4680
      TabIndex        =   12
      Top             =   2160
      Width           =   735
   End
   Begin VB.TextBox txtAge 
      Height          =   375
      Left            =   6240
      TabIndex        =   10
      Top             =   1680
      Width           =   855
   End
   Begin VB.TextBox txtSex 
      Height          =   375
      Left            =   4680
      TabIndex        =   8
      Top             =   1680
      Width           =   735
   End
   Begin VB.TextBox txtID 
      Height          =   375
      Left            =   4680
      TabIndex        =   7
      Top             =   240
      Width           =   855
   End
   Begin VB.TextBox txtSurename 
      Height          =   375
      Left            =   4680
      TabIndex        =   4
      Top             =   1200
      Width           =   2415
   End
   Begin VB.TextBox txtName 
      Height          =   375
      Left            =   4680
      TabIndex        =   2
      Top             =   720
      Width           =   2415
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   3255
      Left            =   480
      ScaleHeight     =   3255
      ScaleWidth      =   2775
      TabIndex        =   0
      Top             =   480
      Width           =   2775
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Address :"
      Height          =   195
      Left            =   3720
      TabIndex        =   15
      Top             =   2760
      Width           =   660
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Height :"
      Height          =   195
      Left            =   5640
      TabIndex        =   13
      Top             =   2280
      Width           =   555
   End
   Begin VB.Label lblWeight 
      AutoSize        =   -1  'True
      Caption         =   "Weight :"
      Height          =   195
      Left            =   3720
      TabIndex        =   11
      Top             =   2280
      Width           =   600
   End
   Begin VB.Label lblAge 
      AutoSize        =   -1  'True
      Caption         =   "Age :"
      Height          =   195
      Left            =   5760
      TabIndex        =   9
      Top             =   1800
      Width           =   375
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "ID :"
      Height          =   195
      Left            =   3720
      TabIndex        =   6
      Top             =   360
      Width           =   255
   End
   Begin VB.Label lblSex 
      AutoSize        =   -1  'True
      Caption         =   "Sex"
      Height          =   195
      Left            =   3720
      TabIndex        =   5
      Top             =   1800
      Width           =   270
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "LastName :"
      Height          =   210
      Left            =   3720
      TabIndex        =   3
      Top             =   1320
      Width           =   810
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "FirstName :"
      Height          =   210
      Left            =   3720
      TabIndex        =   1
      Top             =   840
      Width           =   795
   End
End
Attribute VB_Name = "FrmShowResult"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
    'Create the OraSession Object.
    Set OraSession = CreateObject("OracleInProcServer.XOraSession")
'Create the OraDatabase Object by opening a connection to Oracle
    Set OraDatabase = OraSession.DbOpenDatabase("exOracle", "teety/bobo", &H0&)
'Create the OraDynaset Object.
    Set OraDynaset = OraDatabase.CreateDynaset("select * from Project order by id asc", &H0&)
    'Sql_Command = GetSql_Command
    'Trim (Sql_Command)
End Sub

Private Sub NextBtn_Click()
    OraDynaset.FindNext Sql_Command
     If OraDynaset.NoMatch Then
        MsgBox "Can not Find Record"
    Else
        FileName = OraDynaset.Fields("path")
        Picture1 = LoadPicture(FileName)
        txtID.Text = OraDynaset.Fields("id")
        txtName.Text = OraDynaset.Fields("name")
        txtSurename.Text = OraDynaset.Fields("surename")
        txtSex.Text = OraDynaset.Fields("sex")
        txtAge.Text = OraDynaset.Fields("age")
        txtHeight.Text = OraDynaset.Fields("Heigth")
        txtWieght.Text = OraDynaset.Fields("Weigth")
        'FrmShowResult.Show
    End If
End Sub
