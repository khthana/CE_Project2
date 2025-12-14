VERSION 5.00
Begin VB.Form Graph2 
   Caption         =   "รายงานอัตราการใช้เครื่องแต่ละวัน"
   ClientHeight    =   8505
   ClientLeft      =   435
   ClientTop       =   1500
   ClientWidth     =   14895
   BeginProperty Font 
      Name            =   "Angsana New"
      Size            =   14.25
      Charset         =   222
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   ScaleHeight     =   8505
   ScaleWidth      =   14895
   Begin VB.CommandButton Command1 
      Caption         =   "เมนูหลัก"
      Height          =   375
      Left            =   11640
      TabIndex        =   0
      Top             =   8040
      Width           =   2295
   End
   Begin VB.Line Line26 
      BorderColor     =   &H000000FF&
      X1              =   8760
      X2              =   8040
      Y1              =   1800
      Y2              =   2040
   End
   Begin VB.Line Line25 
      BorderColor     =   &H000000FF&
      X1              =   6240
      X2              =   8520
      Y1              =   2160
      Y2              =   2760
   End
   Begin VB.Line Line24 
      BorderColor     =   &H000000FF&
      X1              =   9240
      X2              =   9240
      Y1              =   3360
      Y2              =   2280
   End
   Begin VB.Line Line23 
      BorderColor     =   &H000000FF&
      X1              =   9480
      X2              =   9480
      Y1              =   5880
      Y2              =   4440
   End
   Begin VB.Line Line22 
      BorderColor     =   &H000000FF&
      X1              =   8760
      X2              =   9720
      Y1              =   4080
      Y2              =   3960
   End
   Begin VB.Line Line21 
      BorderColor     =   &H000000FF&
      X1              =   5760
      X2              =   7680
      Y1              =   5760
      Y2              =   5880
   End
   Begin VB.Line Line20 
      BorderColor     =   &H000000FF&
      X1              =   7080
      X2              =   8520
      Y1              =   4200
      Y2              =   4200
   End
   Begin VB.Line Line19 
      BorderColor     =   &H000000FF&
      X1              =   6720
      X2              =   7800
      Y1              =   5160
      Y2              =   5160
   End
   Begin VB.Line Line18 
      BorderColor     =   &H000000FF&
      X1              =   6840
      X2              =   8640
      Y1              =   4680
      Y2              =   4680
   End
   Begin VB.Line Line17 
      BorderColor     =   &H000000FF&
      X1              =   6600
      X2              =   8640
      Y1              =   3120
      Y2              =   2880
   End
   Begin VB.Line Line16 
      BorderColor     =   &H000000FF&
      X1              =   6480
      X2              =   8880
      Y1              =   3480
      Y2              =   3240
   End
   Begin VB.Line Line15 
      BorderColor     =   &H000000FF&
      X1              =   6120
      X2              =   8160
      Y1              =   3720
      Y2              =   3600
   End
   Begin VB.Line Line14 
      BorderColor     =   &H000000FF&
      X1              =   5400
      X2              =   6960
      Y1              =   3960
      Y2              =   3960
   End
   Begin VB.Line Line13 
      BorderColor     =   &H000000FF&
      X1              =   3240
      X2              =   5640
      Y1              =   5040
      Y2              =   5280
   End
   Begin VB.Line Line12 
      BorderColor     =   &H000000FF&
      X1              =   3360
      X2              =   6120
      Y1              =   4080
      Y2              =   4440
   End
   Begin VB.Line Line11 
      BorderColor     =   &H000000FF&
      X1              =   2280
      X2              =   5400
      Y1              =   4320
      Y2              =   4560
   End
   Begin VB.Line Line10 
      BorderColor     =   &H000000FF&
      X1              =   2880
      X2              =   4080
      Y1              =   3840
      Y2              =   3840
   End
   Begin VB.Line Line9 
      BorderColor     =   &H000000FF&
      X1              =   2760
      X2              =   4440
      Y1              =   3720
      Y2              =   3720
   End
   Begin VB.Line Line8 
      BorderColor     =   &H000000FF&
      X1              =   2760
      X2              =   4440
      Y1              =   3480
      Y2              =   3480
   End
   Begin VB.Line Line7 
      BorderColor     =   &H000000FF&
      X1              =   2760
      X2              =   4920
      Y1              =   3600
      Y2              =   3600
   End
   Begin VB.Line Line6 
      BorderColor     =   &H000000FF&
      X1              =   2760
      X2              =   5160
      Y1              =   3360
      Y2              =   3360
   End
   Begin VB.Line Line5 
      BorderColor     =   &H000000FF&
      X1              =   2760
      X2              =   5400
      Y1              =   3240
      Y2              =   3240
   End
   Begin VB.Line Line4 
      BorderColor     =   &H000000FF&
      X1              =   2760
      X2              =   5640
      Y1              =   3120
      Y2              =   3120
   End
   Begin VB.Line Line3 
      BorderColor     =   &H000000FF&
      X1              =   2760
      X2              =   5520
      Y1              =   3000
      Y2              =   3000
   End
   Begin VB.Label Label37 
      Caption         =   "เวลา"
      Height          =   375
      Left            =   14280
      TabIndex        =   37
      Top             =   7680
      Width           =   615
   End
   Begin VB.Label Label36 
      Caption         =   "ปริมาณผู้ใช้"
      Height          =   495
      Left            =   120
      TabIndex        =   36
      Top             =   480
      Width           =   1215
   End
   Begin VB.Label Label35 
      Caption         =   "      อัตราการล็อกอินเข้าระบบในแต่ละวัน"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   24
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   4080
      TabIndex        =   35
      Top             =   360
      Width           =   5535
   End
   Begin VB.Line Line1 
      X1              =   480
      X2              =   14760
      Y1              =   7080
      Y2              =   7080
   End
   Begin VB.Label Lable1 
      Caption         =   "00.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   480
      TabIndex        =   34
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label1 
      Caption         =   "01.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1080
      TabIndex        =   33
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label2 
      Caption         =   "02.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1680
      TabIndex        =   32
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label3 
      Caption         =   "03.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2280
      TabIndex        =   31
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label4 
      Caption         =   "04.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2880
      TabIndex        =   30
      Top             =   7200
      Width           =   615
   End
   Begin VB.Label Label5 
      Caption         =   "05.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3480
      TabIndex        =   29
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label6 
      Caption         =   "06.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4080
      TabIndex        =   28
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label7 
      Caption         =   "07.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4680
      TabIndex        =   27
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label8 
      Caption         =   "08.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5280
      TabIndex        =   26
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label9 
      Caption         =   "09.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5880
      TabIndex        =   25
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label10 
      Caption         =   "10.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6480
      TabIndex        =   24
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label11 
      Caption         =   "11.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   7080
      TabIndex        =   23
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label12 
      Caption         =   "12.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   7680
      TabIndex        =   22
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label13 
      Caption         =   "13.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   8280
      TabIndex        =   21
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label14 
      Caption         =   "14.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   8880
      TabIndex        =   20
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label16 
      Caption         =   "16.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   10080
      TabIndex        =   19
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label17 
      Caption         =   "17.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   10680
      TabIndex        =   18
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label18 
      Caption         =   "18.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   11280
      TabIndex        =   17
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label19 
      Caption         =   "19.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   11880
      TabIndex        =   16
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label20 
      Caption         =   "20.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   12480
      TabIndex        =   15
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label21 
      Caption         =   "21.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   13080
      TabIndex        =   14
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label22 
      Caption         =   "22.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   13680
      TabIndex        =   13
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label23 
      Caption         =   "23.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   14280
      TabIndex        =   12
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label24 
      Caption         =   "15.00"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   9480
      TabIndex        =   11
      Top             =   7200
      Width           =   495
   End
   Begin VB.Label Label25 
      Caption         =   "100"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   10
      Top             =   1080
      Width           =   255
   End
   Begin VB.Label Label26 
      Caption         =   "90"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   9
      Top             =   1560
      Width           =   255
   End
   Begin VB.Label Label27 
      Caption         =   "80"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   8
      Top             =   2160
      Width           =   255
   End
   Begin VB.Label Label28 
      Caption         =   "70"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   7
      Top             =   2760
      Width           =   255
   End
   Begin VB.Label Label29 
      Caption         =   "60"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   6
      Top             =   3360
      Width           =   255
   End
   Begin VB.Label Label30 
      Caption         =   "50"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   3960
      Width           =   255
   End
   Begin VB.Label Label31 
      Caption         =   "40"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   4560
      Width           =   255
   End
   Begin VB.Label Label32 
      Caption         =   "30"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   5160
      Width           =   255
   End
   Begin VB.Label Label33 
      Caption         =   "20"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   5760
      Width           =   255
   End
   Begin VB.Label Label34 
      Caption         =   "10"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   6360
      Width           =   255
   End
   Begin VB.Line Line2 
      X1              =   480
      X2              =   480
      Y1              =   960
      Y2              =   7080
   End
End
Attribute VB_Name = "Graph2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command2_Click()
Call protline(Line3, 0, 5, 1, 7)
Call protline(Line4, 1, 7, 2, 10)
'Call protline(Line5, 0, 5, 2, 5)
'Call protline(Line6, 0, 5, 2, 5)
'Call protline(Line7, 0, 5, 2, 5)
'Call protline(Line8, 0, 5, 2, 5)
'Call protline(Line9, 0, 5, 2, 5)
''Call protline(Line10, 0, 5, 2, 5)
'Call protline(Line11, 0, 5, 2, 5)
'Call protline(Line12, 0, 5, 2, 5)
'Call protline(Line13, 0, 5, 2, 5)
'Call protline(Line14, 0, 5, 2, 5)
'Call protline(Line15, 0, 5, 2, 5)
'Call protline(Line16, 0, 5, 2, 5)
'Call protline(Line17, 0, 5, 2, 5)
'Call protline(Line18, 0, 5, 2, 5)
'Call protline(Line19, 0, 5, 2, 5)
'Call protline(Line20, 0, 5, 2, 5)
''Call protline(Line21, 0, 5, 2, 5)
'Call protline(Line22, 0, 5, 2, 5)
'Call protline(Line23, 0, 5, 2, 5)
''Call protline(Line24, 0, 5, 2, 5)
'Call protline(Line25, 0, 5, 2, 5)
'Call protline(Line26, 0, 5, 2, 5)
Line3.Visible = True
Line4.Visible = True
'Line5.Visible = True
'Line6.Visible = True
'Line7.Visible = True
'Line8.Visible = True
'Line9.Visible = True
'Line10.Visible = True
'Line11.Visible = True
''Line12.Visible = True
'Line13.Visible = True
'Line14.Visible = True
''Line15.Visible = True
'Line16.Visible = True
'Line17.Visible = True
'Line18.Visible = True
'Line19.Visible = True
'Line20.Visible = True
'Line21.Visible = True
'Line22.Visible = True
'Line23.Visible = True
'Line24.Visible = True
'Line25.Visible = True
'Line26.Visible = True

End Sub

Private Sub Form_Load()

Line3.Visible = False
Line4.Visible = False
Line5.Visible = False
Line6.Visible = False
Line7.Visible = False
Line8.Visible = False
Line9.Visible = False
Line10.Visible = False
Line11.Visible = False
Line12.Visible = False
Line13.Visible = False
Line14.Visible = False
Line15.Visible = False
Line16.Visible = False
Line17.Visible = False
Line18.Visible = False
Line19.Visible = False
Line20.Visible = False
Line21.Visible = False
Line22.Visible = False
Line23.Visible = False
Line24.Visible = False
Line25.Visible = False
Line26.Visible = False

End Sub

Private Sub protline(test As Control, a As Integer, b As Integer, c As Integer, d As Integer)
    test.X1 = (960 + (600 * a))
    test.Y1 = (7080 - (120 * b))
    test.X2 = (960 + (600 * c))
    test.Y2 = (7080 - (120 * d))
    test.Refresh
End Sub
