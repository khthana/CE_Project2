VERSION 5.00
Begin VB.Form Graph1 
   Caption         =   "รายงานอัตราผู้ใช้แต่ละวัน"
   ClientHeight    =   8985
   ClientLeft      =   240
   ClientTop       =   1305
   ClientWidth     =   15015
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
   ScaleHeight     =   8985
   ScaleWidth      =   15015
   Begin VB.CommandButton Command1 
      Caption         =   "เมนูหลัก"
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
      TabIndex        =   0
      Top             =   8520
      Width           =   2295
   End
   Begin VB.Line Line25 
      BorderColor     =   &H000000FF&
      X1              =   13920
      X2              =   14640
      Y1              =   3120
      Y2              =   4560
   End
   Begin VB.Line Line24 
      BorderColor     =   &H000000FF&
      X1              =   13320
      X2              =   13920
      Y1              =   3000
      Y2              =   3120
   End
   Begin VB.Line Line23 
      BorderColor     =   &H000000FF&
      X1              =   12600
      X2              =   13320
      Y1              =   2880
      Y2              =   3000
   End
   Begin VB.Line Line22 
      BorderColor     =   &H000000FF&
      X1              =   12000
      X2              =   12600
      Y1              =   3000
      Y2              =   2880
   End
   Begin VB.Line Line21 
      BorderColor     =   &H000000FF&
      X1              =   11760
      X2              =   12000
      Y1              =   3120
      Y2              =   3000
   End
   Begin VB.Line Line20 
      BorderColor     =   &H000000FF&
      X1              =   11040
      X2              =   11760
      Y1              =   3360
      Y2              =   3120
   End
   Begin VB.Line Line19 
      BorderColor     =   &H000000FF&
      X1              =   10320
      X2              =   11040
      Y1              =   3840
      Y2              =   3360
   End
   Begin VB.Line Line18 
      BorderColor     =   &H000000FF&
      X1              =   9600
      X2              =   10320
      Y1              =   3960
      Y2              =   3840
   End
   Begin VB.Line Line17 
      BorderColor     =   &H000000FF&
      X1              =   9120
      X2              =   9600
      Y1              =   4440
      Y2              =   3960
   End
   Begin VB.Line Line16 
      BorderColor     =   &H000000FF&
      X1              =   8520
      X2              =   9120
      Y1              =   4440
      Y2              =   4440
   End
   Begin VB.Line Line15 
      BorderColor     =   &H000000FF&
      X1              =   7680
      X2              =   8520
      Y1              =   4200
      Y2              =   4440
   End
   Begin VB.Line Line14 
      BorderColor     =   &H000000FF&
      X1              =   7200
      X2              =   7680
      Y1              =   4920
      Y2              =   4200
   End
   Begin VB.Line Line13 
      BorderColor     =   &H000000FF&
      X1              =   6600
      X2              =   7200
      Y1              =   5160
      Y2              =   4920
   End
   Begin VB.Line Line12 
      BorderColor     =   &H000000FF&
      X1              =   6000
      X2              =   6600
      Y1              =   5760
      Y2              =   5160
   End
   Begin VB.Line Line11 
      BorderColor     =   &H000000FF&
      X1              =   5040
      X2              =   5520
      Y1              =   6480
      Y2              =   6360
   End
   Begin VB.Line Line10 
      BorderColor     =   &H000000FF&
      X1              =   4320
      X2              =   5040
      Y1              =   6840
      Y2              =   6480
   End
   Begin VB.Line Line9 
      BorderColor     =   &H000000FF&
      X1              =   3720
      X2              =   4320
      Y1              =   6840
      Y2              =   6840
   End
   Begin VB.Line Line8 
      BorderColor     =   &H000000FF&
      X1              =   3120
      X2              =   3720
      Y1              =   6720
      Y2              =   6840
   End
   Begin VB.Line Line7 
      BorderColor     =   &H000000FF&
      X1              =   2520
      X2              =   3120
      Y1              =   6840
      Y2              =   6720
   End
   Begin VB.Label Label37 
      Caption         =   "เวลา"
      Height          =   375
      Left            =   14280
      TabIndex        =   38
      Top             =   8040
      Width           =   495
   End
   Begin VB.Label Label36 
      Caption         =   "ปริมาณผู้ใช้"
      Height          =   375
      Left            =   120
      TabIndex        =   37
      Top             =   960
      Width           =   1215
   End
   Begin VB.Line Line6 
      BorderColor     =   &H000000FF&
      X1              =   5520
      X2              =   6000
      Y1              =   6360
      Y2              =   5760
   End
   Begin VB.Line Line5 
      BorderColor     =   &H000000FF&
      X1              =   1320
      X2              =   2520
      Y1              =   6960
      Y2              =   6840
   End
   Begin VB.Line Line4 
      BorderColor     =   &H000000FF&
      X1              =   840
      X2              =   1320
      Y1              =   7200
      Y2              =   6960
   End
   Begin VB.Line Line3 
      BorderColor     =   &H000000FF&
      X1              =   480
      X2              =   840
      Y1              =   7560
      Y2              =   7200
   End
   Begin VB.Line Line2 
      X1              =   480
      X2              =   480
      Y1              =   1440
      Y2              =   7560
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
      Height          =   255
      Left            =   120
      TabIndex        =   36
      Top             =   6840
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
      Height          =   255
      Left            =   120
      TabIndex        =   35
      Top             =   6240
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
      Height          =   255
      Left            =   120
      TabIndex        =   34
      Top             =   5640
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
      Height          =   255
      Left            =   120
      TabIndex        =   33
      Top             =   5040
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
      Height          =   255
      Left            =   120
      TabIndex        =   32
      Top             =   4440
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
      Height          =   255
      Left            =   120
      TabIndex        =   31
      Top             =   3840
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
      Height          =   255
      Left            =   120
      TabIndex        =   30
      Top             =   3240
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
      Height          =   255
      Left            =   120
      TabIndex        =   29
      Top             =   2640
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
      Height          =   255
      Left            =   120
      TabIndex        =   28
      Top             =   2040
      Width           =   255
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
      Height          =   255
      Left            =   0
      TabIndex        =   27
      Top             =   1560
      Width           =   375
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
      Height          =   255
      Left            =   9480
      TabIndex        =   26
      Top             =   7680
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
      Height          =   255
      Left            =   14280
      TabIndex        =   25
      Top             =   7680
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
      Height          =   255
      Left            =   13680
      TabIndex        =   24
      Top             =   7680
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
      Height          =   255
      Left            =   13080
      TabIndex        =   23
      Top             =   7680
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
      Height          =   255
      Left            =   12480
      TabIndex        =   22
      Top             =   7680
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
      Height          =   255
      Left            =   11880
      TabIndex        =   21
      Top             =   7680
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
      Height          =   255
      Left            =   11280
      TabIndex        =   20
      Top             =   7680
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
      Height          =   255
      Left            =   10680
      TabIndex        =   19
      Top             =   7680
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
      Height          =   255
      Left            =   10080
      TabIndex        =   18
      Top             =   7680
      Width           =   495
   End
   Begin VB.Label Label15 
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
      Height          =   15
      Left            =   7560
      TabIndex        =   17
      Top             =   5760
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
      Height          =   255
      Left            =   8880
      TabIndex        =   16
      Top             =   7680
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
      Height          =   255
      Left            =   8280
      TabIndex        =   15
      Top             =   7680
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
      Height          =   255
      Left            =   7680
      TabIndex        =   14
      Top             =   7680
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
      Height          =   255
      Left            =   7080
      TabIndex        =   13
      Top             =   7680
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
      Height          =   255
      Left            =   6480
      TabIndex        =   12
      Top             =   7680
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
      Height          =   255
      Left            =   5880
      TabIndex        =   11
      Top             =   7680
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
      Height          =   255
      Left            =   5280
      TabIndex        =   10
      Top             =   7680
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
      Height          =   255
      Left            =   4680
      TabIndex        =   9
      Top             =   7680
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
      Height          =   255
      Left            =   4080
      TabIndex        =   8
      Top             =   7680
      Width           =   495
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
      Height          =   255
      Left            =   3480
      TabIndex        =   7
      Top             =   7680
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
      Height          =   255
      Left            =   2880
      TabIndex        =   6
      Top             =   7680
      Width           =   615
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
      Height          =   255
      Left            =   2280
      TabIndex        =   5
      Top             =   7680
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
      Height          =   255
      Left            =   1680
      TabIndex        =   4
      Top             =   7680
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
      Height          =   255
      Left            =   1080
      TabIndex        =   3
      Top             =   7680
      Width           =   495
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
      Height          =   255
      Left            =   480
      TabIndex        =   2
      Top             =   7680
      Width           =   495
   End
   Begin VB.Line Line1 
      X1              =   480
      X2              =   14760
      Y1              =   7560
      Y2              =   7560
   End
   Begin VB.Label Label35 
      Caption         =   "อัตราผู้ใช้งานในแต่ละวัน"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   24
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4080
      TabIndex        =   1
      Top             =   480
      Width           =   3855
   End
End
Attribute VB_Name = "Graph1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    MainMenuForm.Show
    Unload Me
End Sub

