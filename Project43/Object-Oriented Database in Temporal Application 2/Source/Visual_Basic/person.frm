VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmPerson 
   BackColor       =   &H00808000&
   Caption         =   "ฐานข้อมูลบุคลากร"
   ClientHeight    =   6750
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   12735
   Icon            =   "person.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6750
   ScaleWidth      =   12735
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdExitNew 
      Caption         =   "E&xit New"
      Height          =   375
      Left            =   10800
      TabIndex        =   77
      Top             =   1200
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "&Save"
      Height          =   375
      Left            =   9960
      TabIndex        =   76
      Top             =   1200
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.CommandButton cmdNew 
      Caption         =   "&New"
      Height          =   375
      Left            =   11760
      TabIndex        =   75
      Top             =   1200
      Width           =   855
   End
   Begin VB.TextBox txtPerID 
      Height          =   315
      Left            =   1200
      MaxLength       =   5
      TabIndex        =   1
      Top             =   840
      Width           =   615
   End
   Begin TabDlg.SSTab SSTabPer 
      Height          =   5175
      Left            =   120
      TabIndex        =   2
      Top             =   1440
      Width           =   12495
      _ExtentX        =   22040
      _ExtentY        =   9128
      _Version        =   393216
      Style           =   1
      Tabs            =   2
      Tab             =   1
      TabHeight       =   520
      WordWrap        =   0   'False
      BackColor       =   8421440
      ForeColor       =   -2147483638
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TabCaption(0)   =   "ข้อมูลบุคลากร"
      TabPicture(0)   =   "person.frx":0442
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "Frame1"
      Tab(0).Control(1)=   "Frame2"
      Tab(0).Control(2)=   "Frame3"
      Tab(0).Control(3)=   "Frame4"
      Tab(0).ControlCount=   4
      TabCaption(1)   =   "การทำงาน"
      TabPicture(1)   =   "person.frx":045E
      Tab(1).ControlEnabled=   -1  'True
      Tab(1).Control(0)=   "Label39"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "Label40"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).Control(2)=   "Frame6"
      Tab(1).Control(2).Enabled=   0   'False
      Tab(1).Control(3)=   "Frame5"
      Tab(1).Control(3).Enabled=   0   'False
      Tab(1).Control(4)=   "Frame7"
      Tab(1).Control(4).Enabled=   0   'False
      Tab(1).Control(5)=   "cmdHDecorate"
      Tab(1).Control(5).Enabled=   0   'False
      Tab(1).Control(6)=   "cmdHWorkStatus"
      Tab(1).Control(6).Enabled=   0   'False
      Tab(1).Control(7)=   "Frame8"
      Tab(1).Control(7).Enabled=   0   'False
      Tab(1).Control(8)=   "Frame9"
      Tab(1).Control(8).Enabled=   0   'False
      Tab(1).Control(9)=   "cboWorkStatus"
      Tab(1).Control(9).Enabled=   0   'False
      Tab(1).Control(10)=   "cboDecorate"
      Tab(1).Control(10).Enabled=   0   'False
      Tab(1).ControlCount=   11
      Begin VB.ComboBox cboDecorate 
         Height          =   330
         Left            =   8040
         Style           =   2  'Dropdown List
         TabIndex        =   64
         Top             =   1080
         Width           =   3255
      End
      Begin VB.ComboBox cboWorkStatus 
         Height          =   330
         Left            =   8040
         Style           =   2  'Dropdown List
         TabIndex        =   62
         Top             =   720
         Width           =   3255
      End
      Begin VB.Frame Frame9 
         Height          =   1695
         Left            =   6120
         TabIndex        =   130
         Top             =   3120
         Width           =   6135
         Begin VB.CommandButton cmdHPenalty 
            Caption         =   "ประวัติการถูกลงโทษ"
            Height          =   375
            Left            =   120
            TabIndex        =   74
            Top             =   1200
            Width           =   5895
         End
         Begin VB.CommandButton cmdHEduTor 
            Caption         =   "ประวัติการลาศึกษาต่อ"
            Height          =   375
            Left            =   120
            TabIndex        =   73
            Top             =   720
            Width           =   5895
         End
         Begin VB.CommandButton cmdHSeminar 
            Caption         =   "ประวัติการอบรม"
            Height          =   375
            Left            =   4320
            TabIndex        =   72
            Top             =   240
            Width           =   1695
         End
         Begin VB.CommandButton cmdHResearch 
            Caption         =   "ประวัติการทำวิจัย"
            Height          =   375
            Left            =   2160
            TabIndex        =   71
            Top             =   240
            Width           =   2055
         End
         Begin VB.CommandButton cmdHTraining 
            Caption         =   "ประวัติการดูงาน/ฝึกงาน"
            Height          =   375
            Left            =   120
            TabIndex        =   70
            Top             =   240
            Width           =   1935
         End
      End
      Begin VB.Frame Frame8 
         Caption         =   "การลา"
         Height          =   1575
         Left            =   6120
         TabIndex        =   126
         Top             =   1440
         Width           =   6135
         Begin VB.TextBox txtLeaveAmount 
            Height          =   315
            Left            =   1920
            TabIndex        =   66
            Top             =   360
            Width           =   3255
         End
         Begin VB.TextBox txtLeaveday 
            Enabled         =   0   'False
            Height          =   315
            Left            =   1920
            TabIndex        =   67
            Top             =   720
            Width           =   3255
         End
         Begin VB.TextBox txtLeaveRemain 
            Enabled         =   0   'False
            Height          =   315
            Left            =   1920
            TabIndex        =   68
            Top             =   1080
            Width           =   3255
         End
         Begin VB.CommandButton cmdHLeave 
            Caption         =   "History"
            Height          =   375
            Left            =   5280
            TabIndex        =   69
            Top             =   1080
            Width           =   735
         End
         Begin VB.Label Label44 
            Caption         =   " จำนวนลาประจำปี :"
            Height          =   255
            Left            =   480
            TabIndex        =   129
            Top             =   360
            Width           =   1455
         End
         Begin VB.Label Label43 
            Caption         =   "จำนวนวันลาไปแล้ว :"
            Height          =   255
            Left            =   360
            TabIndex        =   128
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label Label42 
            Caption         =   "เหลือวันลา :"
            Height          =   255
            Left            =   960
            TabIndex        =   127
            Top             =   1080
            Width           =   975
         End
      End
      Begin VB.CommandButton cmdHWorkStatus 
         Caption         =   "History"
         Height          =   375
         Left            =   11400
         TabIndex        =   63
         Top             =   720
         Width           =   735
      End
      Begin VB.CommandButton cmdHDecorate 
         Caption         =   "History"
         Height          =   375
         Left            =   11400
         TabIndex        =   65
         Top             =   1080
         Width           =   735
      End
      Begin VB.Frame Frame7 
         Height          =   1815
         Left            =   240
         TabIndex        =   120
         Top             =   3000
         Width           =   5775
         Begin VB.ComboBox cboSalStep 
            Height          =   330
            Left            =   1560
            Style           =   2  'Dropdown List
            TabIndex        =   60
            Top             =   840
            Width           =   3255
         End
         Begin VB.ComboBox cboGovLevel 
            Height          =   330
            Left            =   1560
            Style           =   2  'Dropdown List
            TabIndex        =   58
            Top             =   480
            Width           =   1215
         End
         Begin VB.TextBox txtSalRate 
            Enabled         =   0   'False
            Height          =   315
            Left            =   1560
            TabIndex        =   61
            Top             =   1200
            Width           =   3255
         End
         Begin VB.CommandButton cmdHGovLevel 
            Caption         =   "History"
            Height          =   375
            Left            =   4920
            TabIndex        =   59
            Top             =   1200
            Width           =   735
         End
         Begin VB.Label Label38 
            Caption         =   " ระดับ (ซี) :"
            Height          =   255
            Left            =   720
            TabIndex        =   123
            Top             =   480
            Width           =   855
         End
         Begin VB.Label Label37 
            Caption         =   "ลำดับขั้นเงินเดือน :"
            Height          =   255
            Left            =   120
            TabIndex        =   122
            Top             =   840
            Width           =   1455
         End
         Begin VB.Label Label36 
            Caption         =   "อัตราเงินเดือน :"
            Height          =   255
            Left            =   360
            TabIndex        =   121
            Top             =   1200
            Width           =   1215
         End
      End
      Begin VB.Frame Frame5 
         Height          =   1095
         Left            =   240
         TabIndex        =   113
         Top             =   480
         Width           =   5775
         Begin VB.ComboBox cboDepartment 
            Height          =   330
            Left            =   1560
            Style           =   2  'Dropdown List
            TabIndex        =   51
            Top             =   600
            Width           =   3255
         End
         Begin VB.CommandButton cmdDpt 
            Caption         =   "History"
            Height          =   375
            Left            =   4920
            TabIndex        =   52
            Top             =   600
            Width           =   735
         End
         Begin VB.ComboBox cboMngPos 
            Height          =   330
            Left            =   1560
            Style           =   2  'Dropdown List
            TabIndex        =   49
            Top             =   240
            Width           =   3255
         End
         Begin VB.CommandButton cmdHMngPos 
            Caption         =   "History"
            Height          =   375
            Left            =   4920
            TabIndex        =   50
            Top             =   240
            Width           =   735
         End
         Begin VB.Label Label45 
            Caption         =   "  หน่วยงาน :"
            Height          =   255
            Left            =   600
            TabIndex        =   132
            Top             =   600
            Width           =   975
         End
         Begin VB.Label Label30 
            Caption         =   "  ตำแหน่งบริหาร :"
            Height          =   255
            Left            =   240
            TabIndex        =   114
            Top             =   240
            Width           =   1335
         End
      End
      Begin VB.Frame Frame6 
         Caption         =   "อัตรา"
         Height          =   1455
         Left            =   240
         TabIndex        =   115
         Top             =   1560
         Width           =   5775
         Begin VB.ComboBox cboEmpNo 
            Height          =   330
            Left            =   1560
            Sorted          =   -1  'True
            Style           =   2  'Dropdown List
            TabIndex        =   53
            Top             =   240
            Width           =   1215
         End
         Begin VB.CommandButton cmdHEmpPos 
            Caption         =   "History"
            Height          =   375
            Left            =   4920
            TabIndex        =   57
            Top             =   960
            Width           =   735
         End
         Begin VB.TextBox txtEmpGroup 
            Enabled         =   0   'False
            Height          =   315
            Left            =   1560
            TabIndex        =   56
            Top             =   960
            Width           =   3255
         End
         Begin VB.TextBox txtEmpType 
            Enabled         =   0   'False
            Height          =   315
            Left            =   1560
            TabIndex        =   55
            Top             =   600
            Width           =   3255
         End
         Begin VB.TextBox txtEmpName 
            Enabled         =   0   'False
            Height          =   315
            Left            =   3720
            TabIndex        =   54
            Top             =   240
            Width           =   1095
         End
         Begin VB.Label Label34 
            Caption         =   "สายงาน :"
            Height          =   255
            Left            =   840
            TabIndex        =   119
            Top             =   960
            Width           =   735
         End
         Begin VB.Label Label33 
            Caption         =   "ประเภทข้าราชการ :"
            Height          =   255
            Left            =   120
            TabIndex        =   118
            Top             =   600
            Width           =   1455
         End
         Begin VB.Label Label32 
            Caption         =   "ชื่ออัตรา :"
            Height          =   255
            Left            =   3000
            TabIndex        =   117
            Top             =   240
            Width           =   735
         End
         Begin VB.Label Label31 
            Caption         =   " รหัส :"
            Height          =   255
            Left            =   1080
            TabIndex        =   116
            Top             =   240
            Width           =   495
         End
      End
      Begin VB.Frame Frame1 
         Caption         =   "ที่อยู่"
         Height          =   1575
         Left            =   -68520
         TabIndex        =   99
         Top             =   480
         Width           =   5895
         Begin VB.TextBox txtAddNo 
            Height          =   315
            Left            =   960
            TabIndex        =   31
            Top             =   240
            Width           =   1095
         End
         Begin VB.TextBox txtSoi 
            Height          =   315
            Left            =   2640
            TabIndex        =   32
            Top             =   240
            Width           =   975
         End
         Begin VB.TextBox txtStreet 
            Height          =   315
            Left            =   4200
            TabIndex        =   33
            Top             =   240
            Width           =   1575
         End
         Begin VB.TextBox txtMooTee 
            Height          =   315
            Left            =   960
            TabIndex        =   34
            Top             =   600
            Width           =   615
         End
         Begin VB.TextBox txtTumbon 
            Height          =   315
            Left            =   2280
            TabIndex        =   35
            Top             =   600
            Width           =   1215
         End
         Begin VB.TextBox txtAmphur 
            Height          =   315
            Left            =   4200
            TabIndex        =   36
            Top             =   600
            Width           =   1575
         End
         Begin VB.TextBox txtProvince 
            Height          =   315
            Left            =   960
            TabIndex        =   37
            Top             =   960
            Width           =   1695
         End
         Begin VB.TextBox txtZipCode 
            Height          =   315
            Left            =   3840
            MaxLength       =   5
            TabIndex        =   38
            Top             =   960
            Width           =   1095
         End
         Begin VB.CommandButton cmdHAddress 
            Caption         =   "History"
            Height          =   375
            Left            =   5040
            TabIndex        =   39
            Top             =   960
            Width           =   735
         End
         Begin VB.Label Label6 
            Caption         =   "บ้านเลขที่ :"
            Height          =   255
            Left            =   120
            TabIndex        =   107
            Top             =   360
            Width           =   855
         End
         Begin VB.Label Label7 
            Caption         =   "ซอย :"
            Height          =   255
            Left            =   2160
            TabIndex        =   106
            Top             =   360
            Width           =   495
         End
         Begin VB.Label Label8 
            Caption         =   "ถนน :"
            Height          =   255
            Left            =   3720
            TabIndex        =   105
            Top             =   360
            Width           =   495
         End
         Begin VB.Label Label9 
            Caption         =   "หมู่ที่ :"
            Height          =   255
            Left            =   480
            TabIndex        =   104
            Top             =   720
            Width           =   495
         End
         Begin VB.Label Label10 
            Caption         =   "ตำบล :"
            Height          =   255
            Left            =   1800
            TabIndex        =   103
            Top             =   720
            Width           =   495
         End
         Begin VB.Label Label11 
            Caption         =   "อำเภอ :"
            Height          =   255
            Left            =   3600
            TabIndex        =   102
            Top             =   720
            Width           =   615
         End
         Begin VB.Label Label12 
            Caption         =   "จังหวัด :"
            Height          =   255
            Left            =   360
            TabIndex        =   101
            Top             =   1080
            Width           =   735
         End
         Begin VB.Label Label13 
            Caption         =   "รหัสไปรษณีย์ :"
            Height          =   255
            Left            =   2760
            TabIndex        =   100
            Top             =   1080
            Width           =   1095
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "ครอบครัว"
         Height          =   1575
         Left            =   -68520
         TabIndex        =   95
         Top             =   2040
         Width           =   5895
         Begin VB.TextBox txtFather 
            Height          =   315
            Left            =   1320
            TabIndex        =   40
            Top             =   360
            Width           =   4335
         End
         Begin VB.TextBox txtMother 
            Height          =   315
            Left            =   1320
            TabIndex        =   41
            Top             =   720
            Width           =   4335
         End
         Begin VB.TextBox txtSpouse 
            Height          =   315
            Left            =   1320
            TabIndex        =   42
            Top             =   1080
            Width           =   4335
         End
         Begin VB.Label Label16 
            Caption         =   " ชื่อ-สกุล บิดา :"
            Height          =   255
            Left            =   240
            TabIndex        =   98
            Top             =   480
            Width           =   1095
         End
         Begin VB.Label Label17 
            Caption         =   "ชื่อ-สกุล มารดา :"
            Height          =   255
            Left            =   120
            TabIndex        =   97
            Top             =   840
            Width           =   1215
         End
         Begin VB.Label Label18 
            Caption         =   "ชื่อ-สกุล คู่สมรส :"
            Height          =   255
            Left            =   120
            TabIndex        =   96
            Top             =   1200
            Width           =   1215
         End
      End
      Begin VB.Frame Frame3 
         Height          =   4575
         Left            =   -74880
         TabIndex        =   82
         Top             =   480
         Width           =   6255
         Begin VB.TextBox txtFinishDate 
            Enabled         =   0   'False
            Height          =   315
            Left            =   4080
            TabIndex        =   29
            Top             =   3600
            Width           =   1215
         End
         Begin VB.ComboBox cboEducation 
            Height          =   330
            Left            =   1200
            Style           =   2  'Dropdown List
            TabIndex        =   27
            Top             =   3240
            Width           =   4095
         End
         Begin VB.ComboBox cboYear 
            Height          =   330
            ItemData        =   "person.frx":047A
            Left            =   2640
            List            =   "person.frx":05BC
            TabIndex        =   17
            Text            =   "1980"
            Top             =   1440
            Width           =   735
         End
         Begin VB.ComboBox cboDate 
            Height          =   330
            ItemData        =   "person.frx":083C
            Left            =   1920
            List            =   "person.frx":089D
            Style           =   2  'Dropdown List
            TabIndex        =   16
            Top             =   1440
            Width           =   615
         End
         Begin VB.ComboBox cboMonth 
            Height          =   330
            ItemData        =   "person.frx":0914
            Left            =   1200
            List            =   "person.frx":093C
            Style           =   2  'Dropdown List
            TabIndex        =   15
            Top             =   1440
            Width           =   615
         End
         Begin VB.CommandButton cmdHEdu 
            Caption         =   "History"
            Height          =   375
            Left            =   5400
            TabIndex        =   28
            Top             =   3240
            Width           =   735
         End
         Begin VB.ComboBox cboTTitle 
            Height          =   330
            Left            =   1200
            Style           =   2  'Dropdown List
            TabIndex        =   3
            Top             =   240
            Width           =   1455
         End
         Begin VB.ComboBox cboETitle 
            Height          =   330
            Left            =   3720
            Style           =   2  'Dropdown List
            TabIndex        =   9
            Top             =   240
            Width           =   1575
         End
         Begin VB.CommandButton cmdHTTitle 
            Caption         =   "History"
            Height          =   375
            Left            =   2760
            TabIndex        =   4
            Top             =   240
            Width           =   735
         End
         Begin VB.CommandButton cmdHETitle 
            Caption         =   "History"
            Height          =   375
            Left            =   5400
            TabIndex        =   10
            Top             =   240
            Width           =   735
         End
         Begin VB.CommandButton cmdHStatus 
            Caption         =   "History"
            Height          =   375
            Left            =   5400
            TabIndex        =   22
            Top             =   1800
            Width           =   735
         End
         Begin VB.CommandButton cmdHMobile 
            Caption         =   "History"
            Height          =   375
            Left            =   5400
            TabIndex        =   26
            Top             =   2760
            Width           =   735
         End
         Begin VB.CommandButton cmdHTel 
            Caption         =   "History"
            Height          =   375
            Left            =   5400
            TabIndex        =   24
            Top             =   2400
            Width           =   735
         End
         Begin VB.ComboBox cboSex 
            Height          =   330
            ItemData        =   "person.frx":0967
            Left            =   1200
            List            =   "person.frx":0969
            Style           =   2  'Dropdown List
            TabIndex        =   20
            Top             =   1800
            Width           =   1575
         End
         Begin VB.TextBox txtTelephone 
            Height          =   315
            Left            =   1200
            TabIndex        =   23
            Top             =   2400
            Width           =   4095
         End
         Begin VB.TextBox txtCellOrPager 
            Height          =   315
            Left            =   1560
            TabIndex        =   25
            Top             =   2760
            Width           =   3735
         End
         Begin VB.CommandButton cmdHTLastName 
            Caption         =   "History"
            Height          =   375
            Left            =   2760
            TabIndex        =   8
            Top             =   960
            Width           =   735
         End
         Begin VB.CommandButton cmdHTFirstName 
            Caption         =   "History"
            Height          =   375
            Left            =   2760
            TabIndex        =   6
            Top             =   600
            Width           =   735
         End
         Begin VB.TextBox txtTLastName 
            Height          =   315
            Left            =   1200
            TabIndex        =   7
            Top             =   960
            Width           =   1455
         End
         Begin VB.TextBox txtTFirstName 
            Height          =   315
            Left            =   1200
            TabIndex        =   5
            Top             =   600
            Width           =   1455
         End
         Begin VB.TextBox txtAge 
            Enabled         =   0   'False
            Height          =   315
            Left            =   5640
            TabIndex        =   19
            Top             =   1440
            Width           =   495
         End
         Begin VB.CommandButton cmdHELastName 
            Caption         =   "History"
            Height          =   375
            Left            =   5400
            TabIndex        =   14
            Top             =   960
            Width           =   735
         End
         Begin VB.TextBox txtELastName 
            Height          =   315
            Left            =   3720
            TabIndex        =   13
            Top             =   960
            Width           =   1575
         End
         Begin VB.CommandButton cmdHEFirstName 
            Caption         =   "History"
            Height          =   375
            Left            =   5400
            TabIndex        =   12
            Top             =   600
            Width           =   735
         End
         Begin VB.TextBox txtEFirstName 
            Height          =   315
            Left            =   3720
            TabIndex        =   11
            Top             =   600
            Width           =   1575
         End
         Begin VB.TextBox txtSick 
            Height          =   315
            Left            =   1200
            TabIndex        =   30
            Top             =   4080
            Width           =   4935
         End
         Begin VB.ComboBox cboStatus 
            Height          =   330
            Left            =   4080
            Style           =   2  'Dropdown List
            TabIndex        =   21
            Top             =   1800
            Width           =   1215
         End
         Begin VB.TextBox txtDOB 
            Height          =   315
            Left            =   2760
            MaxLength       =   10
            TabIndex        =   18
            Top             =   1440
            Visible         =   0   'False
            Width           =   975
         End
         Begin VB.Label Label41 
            Caption         =   "วันเกษียณอายุราชการ :"
            Height          =   255
            Left            =   2280
            TabIndex        =   131
            Top             =   3600
            Width           =   1815
         End
         Begin VB.Label Label29 
            Caption         =   "/"
            Height          =   255
            Left            =   2520
            TabIndex        =   112
            Top             =   1440
            Width           =   135
         End
         Begin VB.Label Label28 
            Caption         =   "/"
            Height          =   255
            Left            =   1800
            TabIndex        =   111
            Top             =   1440
            Width           =   135
         End
         Begin VB.Label lblLastName 
            Caption         =   "Last Name :"
            Height          =   255
            Left            =   2760
            TabIndex        =   110
            Top             =   960
            Visible         =   0   'False
            Width           =   975
         End
         Begin VB.Label lblFirstName 
            Caption         =   "First Name :"
            Height          =   255
            Left            =   2760
            TabIndex        =   109
            Top             =   600
            Visible         =   0   'False
            Width           =   855
         End
         Begin VB.Label lblTitle 
            Caption         =   "Title :"
            Height          =   255
            Left            =   3240
            TabIndex        =   108
            Top             =   240
            Visible         =   0   'False
            Width           =   495
         End
         Begin VB.Label Label27 
            Caption         =   "การศึกษา :"
            Height          =   255
            Left            =   240
            TabIndex        =   94
            Top             =   3360
            Width           =   855
         End
         Begin VB.Label Label25 
            Caption         =   " เดือน/วัน/ปี ค.ศ."
            Height          =   255
            Left            =   3360
            TabIndex        =   93
            Top             =   1440
            Width           =   1335
         End
         Begin VB.Label Label24 
            Caption         =   " คำนำหน้า :"
            Height          =   255
            Left            =   240
            TabIndex        =   92
            Top             =   240
            Width           =   975
         End
         Begin VB.Label Label23 
            Caption         =   " เพศ :"
            Height          =   255
            Left            =   600
            TabIndex        =   91
            Top             =   1800
            Width           =   495
         End
         Begin VB.Label Label22 
            Caption         =   "สถานภาพ :"
            Height          =   255
            Left            =   3240
            TabIndex        =   90
            Top             =   1800
            Width           =   855
         End
         Begin VB.Label Label15 
            Caption         =   "โทรศัพท์ :"
            Height          =   255
            Left            =   360
            TabIndex        =   89
            Top             =   2400
            Width           =   735
         End
         Begin VB.Label Label14 
            Alignment       =   1  'Right Justify
            Caption         =   "มือถือ / เพจเจอร์ :"
            Height          =   255
            Left            =   120
            TabIndex        =   88
            Top             =   2760
            Width           =   1335
         End
         Begin VB.Label Label5 
            Caption         =   " อายุ :"
            Height          =   255
            Left            =   5160
            TabIndex        =   87
            Top             =   1440
            Width           =   495
         End
         Begin VB.Label Label4 
            Caption         =   "วันเกิด :"
            Height          =   255
            Left            =   480
            TabIndex        =   86
            Top             =   1440
            Width           =   735
         End
         Begin VB.Label Label3 
            Caption         =   "นามสกุล :"
            Height          =   255
            Left            =   360
            TabIndex        =   85
            Top             =   960
            Width           =   735
         End
         Begin VB.Label Label2 
            Caption         =   "ชื่อ :"
            Height          =   255
            Left            =   720
            TabIndex        =   84
            Top             =   600
            Width           =   375
         End
         Begin VB.Label Label26 
            Caption         =   "โรคประจำตัว :"
            Height          =   255
            Left            =   120
            TabIndex        =   83
            Top             =   4080
            Width           =   1095
         End
      End
      Begin VB.Frame Frame4 
         Height          =   1455
         Left            =   -68520
         TabIndex        =   78
         Top             =   3600
         Width           =   5895
         Begin VB.CommandButton cmdHBank 
            Caption         =   "History"
            Height          =   375
            Left            =   5040
            TabIndex        =   46
            Top             =   600
            Width           =   735
         End
         Begin VB.CommandButton cmdHSocial 
            Caption         =   "History"
            Height          =   375
            Left            =   5040
            TabIndex        =   48
            Top             =   960
            Width           =   735
         End
         Begin VB.CommandButton cmdHTax 
            Caption         =   "History"
            Height          =   375
            Left            =   5040
            TabIndex        =   44
            Top             =   240
            Width           =   735
         End
         Begin VB.TextBox txtBank 
            Height          =   315
            Left            =   2280
            TabIndex        =   45
            Top             =   600
            Width           =   2655
         End
         Begin VB.TextBox txtSocial 
            Height          =   315
            Left            =   2280
            TabIndex        =   47
            Top             =   960
            Width           =   2655
         End
         Begin VB.TextBox txtTax 
            Height          =   315
            Left            =   2280
            TabIndex        =   43
            Top             =   240
            Width           =   2655
         End
         Begin VB.Label Label21 
            Caption         =   " หมายเลขบัญชีธนาคาร :"
            Height          =   255
            Left            =   480
            TabIndex        =   81
            Top             =   720
            Width           =   1695
         End
         Begin VB.Label Label20 
            Caption         =   "หมายเลขประกันสังคม :"
            Height          =   255
            Left            =   600
            TabIndex        =   80
            Top             =   1080
            Width           =   1695
         End
         Begin VB.Label Label19 
            Caption         =   "หมายเลขประจำตัวผู้เสียภาษี :"
            Height          =   255
            Left            =   120
            TabIndex        =   79
            Top             =   360
            Width           =   2055
         End
      End
      Begin VB.Label Label40 
         Caption         =   "เครื่องราชอิสริยาภรณ์ :"
         Height          =   255
         Left            =   6360
         TabIndex        =   125
         Top             =   1080
         Width           =   1695
      End
      Begin VB.Label Label39 
         Caption         =   " สถานะการทำงาน :"
         Height          =   255
         Left            =   6600
         TabIndex        =   124
         Top             =   720
         Width           =   1455
      End
   End
   Begin VB.Image Image1 
      Height          =   720
      Left            =   11760
      Picture         =   "person.frx":096B
      ToolTipText     =   "Home"
      Top             =   120
      Width           =   945
   End
   Begin VB.Label Label46 
      Alignment       =   2  'Center
      BackColor       =   &H00C0FFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "งานบุคลากร"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   615
      Left            =   120
      TabIndex        =   133
      Top             =   120
      Width           =   12495
   End
   Begin VB.Label Label1 
      BackColor       =   &H00808000&
      Caption         =   "Person ID :"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   960
      Width           =   975
   End
End
Attribute VB_Name = "frmPerson"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim NewStatus As Boolean, Kong As Boolean

Private Sub cmdSetProperties(Prop As Integer, boo As Boolean)
    '1 = Enabled, 2 = Visible, 3 = TextBox&Enabled
    Select Case Prop
        Case 1
            cmdHEFirstName.Enabled = boo
            cmdHELastName.Enabled = boo
            cmdHTFirstName.Enabled = boo
            cmdHTLastName.Enabled = boo
            cmdHAddress.Enabled = boo
            cmdHTax.Enabled = boo
            cmdHSocial.Enabled = boo
            cmdHBank.Enabled = boo
            cmdHETitle.Enabled = boo
            cmdHTTitle.Enabled = boo
            cmdHStatus.Enabled = boo
            cmdHTel.Enabled = boo
            cmdHMobile.Enabled = boo
            cmdHEdu.Enabled = boo
            cmdHMngPos.Enabled = boo
            cmdDpt.Enabled = boo
            cmdHEmpPos.Enabled = boo
            cmdHGovLevel.Enabled = boo
            cmdHWorkStatus.Enabled = boo
            cmdHDecorate.Enabled = boo
            cmdHLeave.Enabled = boo
            cmdHTraining.Enabled = boo
            cmdHResearch.Enabled = boo
            cmdHSeminar.Enabled = boo
            cmdHEduTor.Enabled = boo
            cmdHPenalty.Enabled = boo
        Case 2
            cmdHTTitle.Visible = boo
            cmdHTFirstName.Visible = boo
            cmdHTLastName.Visible = boo
            lblTitle.Visible = Not boo
            lblFirstName.Visible = Not boo
            lblLastName.Visible = Not boo
        Case 3
            txtEFirstName.Enabled = boo
            txtELastName.Enabled = boo
            txtTFirstName.Enabled = boo
            txtTLastName.Enabled = boo
            cboMonth.Enabled = boo
            cboDate.Enabled = boo
            cboYear.Enabled = boo
            cboSex.Enabled = boo
            cboETitle.Enabled = boo
            cboTTitle.Enabled = boo
            cboStatus.Enabled = boo
            cboEducation.Enabled = boo
            txtSick.Enabled = boo
            txtAddNo.Enabled = boo
            txtSoi.Enabled = boo
            txtStreet.Enabled = boo
            txtMooTee.Enabled = boo
            txtTumbon.Enabled = boo
            txtAmphur.Enabled = boo
            txtProvince.Enabled = boo
            txtZipCode.Enabled = boo
            txtTelephone.Enabled = boo
            txtCellOrPager.Enabled = boo
            txtFather.Enabled = boo
            txtMother.Enabled = boo
            txtSpouse.Enabled = boo
            txtTax.Enabled = boo
            txtSocial.Enabled = boo
            txtBank.Enabled = boo
            cboMngPos.Enabled = boo
            cboDepartment.Enabled = boo
            cboEmpNo.Enabled = boo
            cboGovLevel.Enabled = boo
            cboSalStep.Enabled = boo
            cboWorkStatus.Enabled = boo
            cboDecorate.Enabled = boo
            txtLeaveAmount.Enabled = boo
    End Select
End Sub

Private Sub MakeDate()
    Dim ccDate As String
    ccDate = ""
    If (cboMonth <> "" And cboDate <> "" And cboYear <> "") Then
        ccDate = cboMonth.Text + "/" + cboDate.Text + "/" + cboYear.Text
    End If
    txtDOB.Text = ccDate
End Sub

Private Sub findCombo(obj As Object, st As String)
    Dim i As Integer, j As Integer
    j = obj.ListCount - 1
    For i = 0 To j
        If (obj.List(i) = st) Then
            Kong = True
            obj.Text = obj.List(i)
            i = j + 1
        End If
    Next i
End Sub

Private Sub cboSex_Click()
    If Kong Then Exit Sub
    If cboSex.Text = "Male" Then
        findCombo cboTTitle, "นาย"
        Kong = False
        findCombo cboETitle, "Mr."
        Kong = False
    Else
        findCombo cboTTitle, "น.ส."
        Kong = False
        findCombo cboETitle, "Miss"
        Kong = False
    End If
End Sub

Private Sub cboTTitle_Click()
    If Kong Then Exit Sub
    If cboTTitle.Text = "นาย" Then
        findCombo cboETitle, "Mr."
        Kong = False
        findCombo cboSex, "Male"
        Kong = False
    Else
        findCombo cboSex, "Female"
        Kong = False
        If cboTTitle.Text = "นาง" Then
            findCombo cboETitle, "Mrs."
            Kong = False
            findCombo cboStatus, "Married"
            Kong = False
        Else
            findCombo cboETitle, "Miss"
            Kong = False
            findCombo cboStatus, "Single"
            Kong = False
            txtSpouse.Enabled = False
        End If
    End If
End Sub

Private Sub cboETitle_Click()
    If Kong Then Exit Sub
    If cboETitle.Text = "Mr." Then
        findCombo cboTTitle, "นาย"
        Kong = False
        findCombo cboSex, "Male"
        Kong = False
    Else
        findCombo cboSex, "Female"
        Kong = False
        If cboETitle.Text = "Mrs." Then
            findCombo cboTTitle, "นาง"
            Kong = False
            findCombo cboStatus, "Married"
            Kong = False
        Else
            findCombo cboTTitle, "น.ส."
            Kong = False
            findCombo cboStatus, "Single"
            Kong = False
            txtSpouse.Enabled = False
        End If
    End If
End Sub

Private Sub cmdDpt_Click()
    frmDepartment.Show 0
    frmDepartment.LoadDepartment
End Sub

Private Sub cmdExitNew_Click()
    cmdSave.Visible = False
    cmdExitNew.Visible = False
    cmdSetProperties 2, True
    cmdSetProperties 3, False
    txtPerID.Enabled = True
    ClearScreen
    cmdSetProperties 1, False
    NewStatus = False
End Sub

Private Sub cmdHAddress_Click()
    frmHedit.Show 0
    frmHedit.LoadAddress (4)
    frmHedit.SSTab.Tab = 4
End Sub

Private Sub cmdHBank_Click()
    frmHedit.Show 0
    frmHedit.LoadBankNo (8)
    frmHedit.SSTab.Tab = 8
End Sub

Private Sub cmdHDecorate_Click()
    frmDecorate.Show 0
    frmDecorate.LoadDecorate
End Sub

Private Sub cmdHEdu_Click()
    frmEducation.Show 0
    frmEducation.LoadEducation
End Sub

Private Sub cmdHEduTor_Click()
    frmStudyMore.Show 0
    frmStudyMore.LoadStudyMore
End Sub

Private Sub cmdHEFirstName_Click()
    frmHedit.Show 0
    frmHedit.LoadEFirstName (1)
    frmHedit.SSTab.Tab = 1
End Sub

Private Sub cmdHELastName_Click()
    frmHedit.Show 0
    frmHedit.LoadELastName (2)
    frmHedit.SSTab.Tab = 2
End Sub

Private Sub cmdHEmpPos_Click()
    frmEmpPos.Show 0
    frmEmpPos.LoadEmpPos
End Sub

Private Sub cmdHETitle_Click()
    frmHedit.Show 0
    frmHedit.LoadETitle (0)
    frmHedit.SSTab.Tab = 0
End Sub

Private Sub cmdHGovLevel_Click()
    frmGovLevel.Show 0
    frmGovLevel.LoadGovLevel
End Sub

Private Sub cmdHLeave_Click()
    frmLeaveType.Show 0
    frmLeaveType.LoadLeaveType
End Sub

Private Sub cmdHMngPos_Click()
    frmMngPos.Show 0
    frmMngPos.LoadMngPos
End Sub

Private Sub cmdHMobile_Click()
    frmHedit.Show 0
    frmHedit.LoadCellOrPager (6)
    frmHedit.SSTab.Tab = 6
End Sub

Private Sub cmdHPenalty_Click()
    frmPenalty.Show 0
    frmPenalty.LoadPenalty
End Sub

Private Sub cmdHResearch_Click()
    frmResearch.Show 0
    frmResearch.LoadResearch
End Sub

Private Sub cmdHSeminar_Click()
    frmSeminar.Show 0
    frmSeminar.LoadSeminar
End Sub

Private Sub cmdHSocial_Click()
    frmHedit.Show 0
    frmHedit.LoadSocialNo (9)
    frmHedit.SSTab.Tab = 9
End Sub

Private Sub cmdHStatus_Click()
    frmHedit.Show 0
    frmHedit.LoadStatus (3)
    frmHedit.SSTab.Tab = 3
End Sub

Private Sub cmdHTax_Click()
    frmHedit.Show 0
    frmHedit.LoadTaxNo (7)
    frmHedit.SSTab.Tab = 7
End Sub

Private Sub cmdHTel_Click()
    frmHedit.Show 0
    frmHedit.LoadTelephone (5)
    frmHedit.SSTab.Tab = 5
End Sub

Private Sub cmdHTFirstName_Click()
    frmHedit.Show 0
    frmHedit.LoadEFirstName (1)
    frmHedit.SSTab.Tab = 1
End Sub

Private Sub cmdHTLastName_Click()
    frmHedit.Show 0
    frmHedit.LoadELastName (2)
    frmHedit.SSTab.Tab = 2
End Sub

Private Sub cmdHTraining_Click()
    frmTraining.Show 0
    frmTraining.LoadTraining
End Sub

Private Sub cmdHTTitle_Click()
    frmHedit.Show 0
    frmHedit.LoadETitle (0)
    frmHedit.SSTab.Tab = 0
End Sub

Private Sub cmdHWorkStatus_Click()
    frmWorkStatus.Show 0
    frmWorkStatus.LoadWorkStatus
End Sub

Private Sub cmdNew_Click()
    ClearScreen
    cboMngPos.Enabled = False
    cboDecorate.Enabled = False
    cmdSetProperties 2, False
    cmdSetProperties 3, True
    cmdSetProperties 1, False
    cmdSave.Visible = True
    cmdExitNew.Visible = True
    cboSex.Enabled = True
    cboETitle.Enabled = True
    cboTTitle.Enabled = True
    cboStatus.Enabled = True
    cboEducation.Enabled = True
    NewStatus = True
End Sub

Private Function CheckPosNo() As Boolean
    CheckPosNo = False
    Dim obj As Object, EmpPos As Object
    Dim i As Integer, aa As Integer
    Set obj = cache.Static("Person.Per")
    i = obj.TotalAmount("EmpPos")
    For aa = 1 To i
        Set EmpPos = cache.OpenId("Person.EmpPos", aa)
        If (cboEmpNo.Text = EmpPos.PosNo) And (EmpPos.REmpPoss.Count <> 0) Then
            aa = i
            MsgBox "รหัสอัตราซ้ำ กรุณาเปลี่ยนใหม่", , "บุคลากร"
            CheckPosNo = True
        End If
    Next aa
End Function

Private Sub cmdSave_Click()
    Dim i As Integer
    MakeDate
    If CheckPosNo Then Exit Sub
    If (txtEFirstName <> "") And (txtELastName <> "") And (Len(txtPerID.Text) = 5) _
        And (txtDOB <> "") And (cboETitle <> "") And (cboTTitle <> "") _
        And (cboStatus <> "") And (txtTFirstName <> "") And (txtTLastName <> "") _
        And (txtAddNo <> "") And (txtAmphur <> "") And (txtLeaveAmount <> "") _
        And (txtProvince <> "") And (txtZipCode <> "") _
        And (txtTelephone <> "") And (txtFather <> "") And (txtMother <> "") _
        And (txtTax <> "") And (txtBank <> "") And (txtSocial <> "") _
        And (cboEmpNo <> "") And (cboDepartment <> "") And (cboEducation <> "") _
        And (cboGovLevel <> "") And (cboSalStep <> "") _
        And (cboWorkStatus <> "") Then
        i = MsgBox("Do you really wanna Save ?", vbYesNo, "บุคลากร")
        
        If i = vbYes Then
            Dim obj As Object, Bo As Integer
            Set obj = cache.Static("Person.Per")
            Bo = obj.FindOID(txtPerID.Text)
            If Bo = 0 Then
                obj.CreatePer txtPerID.Text, cboETitle.Text, cboTTitle.Text, _
                    txtTFirstName.Text, txtTLastName.Text, _
                    txtEFirstName.Text, txtELastName.Text, txtDOB.Text, _
                    cboSex.Text, cboStatus.Text, txtAddNo.Text, txtSoi.Text, _
                    txtStreet.Text, txtMooTee.Text, txtTumbon.Text, txtAmphur.Text, _
                    txtProvince.Text, txtZipCode.Text
                obj.CreatePer2 txtTelephone.Text, _
                    txtCellOrPager.Text, txtSick.Text, txtFather.Text, _
                    txtMother.Text, txtSpouse.Text, txtTax.Text, txtBank.Text, _
                    txtSocial.Text
                obj.CreatePer3 cboEmpNo.Text, cboDepartment.Text, _
                    cboEducation.Text, cboGovLevel.Text, cboSalStep.Text, _
                    cboWorkStatus.Text, txtLeaveAmount.Text
                ClearScreen
            Else
                MsgBox "Denied...Now, There is Person ID """ + txtPerID.Text + """ Already", , "บุคลากร"
            End If
        End If
    Else
        MsgBox "Please Fill out All blanks, Thank you", , "บุคลากร"
    End If
    txtPerID.SetFocus
    Exit Sub
End Sub

Private Sub Form_Load()
    ConnectObjects "PROJECT"
    cmdSetProperties 1, False
    cmdSetProperties 3, False
    NewStatus = False
    SSTabPer.Tab = 0
    LoadSexCombo
    LoadETitleCombo
    LoadTTitleCombo
    LoadStatusCombo
    LoadEducationCombo
    LoadEmpPosCombo
    LoadMngPosCombo
    LoadDepartmentCombo
    LoadWorkStatusCombo
    LoadGovLevelCombo
    LoadDecorateCombo
    LoadSalStepCombo
End Sub

Private Sub LoadSexCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, sexes() As String
    Set obj = cache.Static("Person.Per")
    displays = obj.SexDISPLAYLIST
    delimd = Left(displays, 1)
    sexes = Split(displays, delimd)
    cboSex.Clear
    For i = 1 To UBound(sexes)
        cboSex.AddItem sexes(i)
    Next i
End Sub

Private Sub LoadETitleCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, etitles() As String
    Set obj = cache.Static("Person.ETitle")
    displays = obj.ETitleDISPLAYLIST
    delimd = Left(displays, 1)
    etitles = Split(displays, delimd)
    cboETitle.Clear
    For i = 1 To UBound(etitles)
        cboETitle.AddItem etitles(i)
    Next i
End Sub

Private Sub LoadTTitleCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, ttitles() As String
    Set obj = cache.Static("Person.TTitle")
    displays = obj.TTitleDISPLAYLIST
    delimd = Left(displays, 1)
    ttitles = Split(displays, delimd)
    cboTTitle.Clear
    For i = 1 To UBound(ttitles)
        cboTTitle.AddItem ttitles(i)
    Next i
End Sub

Private Sub LoadStatusCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, statuss() As String
    Set obj = cache.Static("Person.Status")
    displays = obj.StatusDISPLAYLIST
    delimd = Left(displays, 1)
    statuss = Split(displays, delimd)
    cboStatus.Clear
    For i = 1 To UBound(statuss)
        cboStatus.AddItem statuss(i)
    Next i
End Sub

Private Sub LoadEducationCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, educations() As String
    Set obj = cache.Static("Person.Education")
    displays = obj.EducationDISPLAYLIST
    delimd = Left(displays, 1)
    educations = Split(displays, delimd)
    cboEducation.Clear
    For i = 1 To UBound(educations)
        cboEducation.AddItem educations(i)
    Next i
End Sub

Private Sub LoadMngPosCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, objs() As String
    Set obj = cache.Static("Person.MngPos")
    displays = obj.MngPosDISPLAYLIST
    delimd = Left(displays, 1)
    objs = Split(displays, delimd)
    cboMngPos.Clear
    For i = 1 To UBound(objs)
        cboMngPos.AddItem objs(i)
    Next i
End Sub

Public Sub LoadEmpPosCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, objs() As String
    Set obj = cache.Static("Person.EmpPos")
    displays = obj.EmpPosDISPLAYLIST
    delimd = Left(displays, 1)
    objs = Split(displays, delimd)
    cboEmpNo.Clear
    For i = 1 To UBound(objs)
        cboEmpNo.AddItem objs(i)
    Next i
End Sub

Private Sub LoadDepartmentCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, objs() As String
    Set obj = cache.Static("Person.Department")
    displays = obj.DepartmentDISPLAYLIST
    delimd = Left(displays, 1)
    objs = Split(displays, delimd)
    cboDepartment.Clear
    For i = 1 To UBound(objs)
        cboDepartment.AddItem objs(i)
    Next i
End Sub

Private Sub LoadWorkStatusCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, objs() As String
    Set obj = cache.Static("Person.WorkStatus")
    displays = obj.WorkStatusDISPLAYLIST
    delimd = Left(displays, 1)
    objs = Split(displays, delimd)
    cboWorkStatus.Clear
    For i = 1 To UBound(objs)
        cboWorkStatus.AddItem objs(i)
    Next i
End Sub

Private Sub LoadGovLevelCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, objs() As String
    Set obj = cache.Static("Person.GovLevel")
    displays = obj.GovLevelDISPLAYLIST
    delimd = Left(displays, 1)
    objs = Split(displays, delimd)
    cboGovLevel.Clear
    For i = 1 To UBound(objs)
        cboGovLevel.AddItem objs(i)
    Next i
End Sub

Private Sub LoadDecorateCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, objs() As String
    Set obj = cache.Static("Person.Decorate")
    displays = obj.DecorateDISPLAYLIST
    delimd = Left(displays, 1)
    objs = Split(displays, delimd)
    cboDecorate.Clear
    For i = 1 To UBound(objs)
        cboDecorate.AddItem objs(i)
    Next i
End Sub

Private Sub LoadSalStepCombo()
    Dim obj As Object, i As Integer
    Dim displays As String, delimd As String, objs() As String
    Set obj = cache.Static("Person.GovLevel")
    displays = obj.SalStepDISPLAYLIST
    delimd = Left(displays, 1)
    objs = Split(displays, delimd)
    cboSalStep.Clear
    For i = 1 To UBound(objs)
        cboSalStep.AddItem objs(i)
    Next i
End Sub

Private Sub ConnectObjects(Address As String)
    ' Connects Cacheobject to the Cacheserver specified in Address
    Dim ok As Boolean
    Set cache = CreateObject("CacheObject.Factory")
    If Address = "" Then
        Address = cache.ConnectDlg
        If Address = "" Then End
    End If
    ok = cache.Connect(Address)
    If Not ok Then
        MsgBox "Failed to Connect to Cache Object Server", , "Cache Connection"
        End
    End If
End Sub

Private Sub ClearScreen()
    txtPerID = ""
    txtEFirstName = ""
    txtELastName = ""
    txtTFirstName = ""
    txtTLastName = ""
    findCombo cboMonth, "1"
    Kong = False
    findCombo cboDate, "1"
    Kong = False
    cboYear.Text = "1980"
    txtAge = ""
    txtFinishDate = ""
    txtSick = ""
    txtAddNo = ""
    txtSoi = ""
    txtStreet = ""
    txtMooTee = ""
    txtTumbon = ""
    txtAmphur = ""
    txtProvince = ""
    txtZipCode = ""
    txtTelephone = ""
    txtCellOrPager = ""
    txtFather = ""
    txtMother = ""
    txtSpouse = ""
    txtTax = ""
    txtSocial = ""
    txtBank = ""
    txtEmpName = ""
    txtEmpType = ""
    txtEmpGroup = ""
    txtSalRate = ""
    txtLeaveAmount = ""
    txtLeaveday = ""
    txtLeaveRemain = ""
    txtPerID.SetFocus
End Sub

Private Sub LoadPer(id As String)
    On Error GoTo objerr
    
    ClearObjects
    
    Dim obj As Object
    Set obj = cache.Static("Person.Per")
    no = obj.FindOID(id)
        
    If no = 0 Then
        MsgBox "Now, There is no this Person ID", , "บุคลากร"
        cmdSetProperties 1, False
        ClearScreen
    Else
    
        Set Per = cache.OpenId("Person.Per", no)
        
        Dim i As Integer
        i = Per.EFirstName.Count
        txtEFirstName.Text = Per.EFirstName.GetAt(i).EFirstName
        txtTFirstName.Text = Per.TFirstName.GetAt(i).TFirstName
    
        Dim k As Integer
        k = Per.ELastName.Count
        txtELastName.Text = Per.ELastName.GetAt(k).ELastName
        txtTLastName.Text = Per.TLastName.GetAt(k).TLastName
        
        cmdSetProperties 1, True
        
        Dim DateArr() As String
        'txtDOB.Text = Per.birthday
        DateArr = Split(Per.birthday, "/", -1, 1)
        findCombo cboMonth, DateArr(0)
        Kong = False
        findCombo cboDate, DateArr(1)
        Kong = False
        cboYear.Text = DateArr(2)
        
        txtAge.Text = Per.Age
        cboSex = Per.SexLogicalToDisplay(Per.Sex)
        
        Dim j As Integer, kk As Integer, mm As Integer
        j = Per.ETitle.Count
        kk = Per.TTitle.Count
        mm = Per.Status.Count
        
        cboETitle = Per.ETitle.GetAt(j).ETitleLogicalToDisplay(Per.ETitle.GetAt(j).ETitle)
        cboTTitle = Per.TTitle.GetAt(kk).TTitleLogicalToDisplay(Per.TTitle.GetAt(kk).TTitle)
        cboStatus = Per.Status.GetAt(mm).StatusLogicalToDisplay(Per.Status.GetAt(mm).Status)
        cmdSetProperties 3, False
        
        Dim nn As Integer
        nn = Per.Address.Count
        txtAddNo.Text = Per.Address.GetAt(nn).AddNo
        txtSoi.Text = Per.Address.GetAt(nn).Soi
        txtStreet.Text = Per.Address.GetAt(nn).Street
        txtMooTee.Text = Per.Address.GetAt(nn).MooTee
        txtTumbon.Text = Per.Address.GetAt(nn).Tumbon
        txtAmphur.Text = Per.Address.GetAt(nn).Amphur
        txtProvince.Text = Per.Address.GetAt(nn).Province
        txtZipCode.Text = Per.Address.GetAt(nn).ZipCode
        
        Dim aa As Integer, bb As Integer, cc As Integer, Dd As Integer, ee As Integer
        aa = Per.Telephone.Count
        bb = Per.CellOrPager.Count
        cc = Per.TaxNo.Count
        Dd = Per.BankNo.Count
        ee = Per.SocialNo.Count
        
        txtTelephone = Per.Telephone.GetAt(aa).Telephone
        txtCellOrPager = Per.CellOrPager.GetAt(bb).CellOrPager
        
        txtFinishDate = Per.FinishDate
        
        txtTax = Per.TaxNo.GetAt(cc).TaxNo
        txtBank = Per.BankNo.GetAt(Dd).BankNo
        txtSocial = Per.SocialNo.GetAt(ee).SocialNo
        
        txtSick = Per.Sick
        txtFather = Per.FatherName
        txtMother = Per.MotherName
        txtSpouse = Per.SpouseName
        
        aa = Per.REducations.Count
        findCombo cboEducation, Per.REducations.GetAt(aa).Education.Education
        aa = Per.RMngPoss.Count
        If aa <> 0 Then findCombo cboMngPos, Per.RMngPoss.GetAt(aa).MngPos.MngPos
        aa = Per.RDepartments.Count
        findCombo cboDepartment, Per.RDepartments.GetAt(aa).Department.DeptName
        aa = Per.REmpPoss.Count
        findCombo cboEmpNo, Per.REmpPoss.GetAt(aa).EmpPos.PosNo
        txtEmpName = Per.REmpPoss.GetAt(aa).EmpPos.PosName
        txtEmpGroup = Per.REmpPoss.GetAt(aa).EmpPos.EmpGroup.GroupName
        txtEmpType = Per.REmpPoss.GetAt(aa).EmpPos.EmpType.EmpType
        aa = Per.RGovLevels.Count
        findCombo cboGovLevel, Per.RGovLevels.GetAt(aa).GovLevel.GovLevel
        findCombo cboSalStep, Per.RGovLevels.GetAt(aa).GovLevel.SalStep
        txtSalRate = Per.RGovLevels.GetAt(aa).GovLevel.SalRate
        aa = Per.RWorkStatuss.Count
        findCombo cboWorkStatus, Per.RWorkStatuss.GetAt(aa).WorkStatus.WorkStatus
        aa = Per.RDecorates.Count
        If aa <> 0 Then findCombo cboDecorate, Per.RDecorates.GetAt(aa).Decorate.DecName
        aa = Per.LeaveAmount.Count
        txtLeaveAmount = Per.LeaveAmount.GetAt(aa).LeaveAmount
        aa = Per.LeaveDay.Count
        Dim day As Integer
        day = 0
        For i = 1 To aa
            day = day + CInt(Per.LeaveDay.GetAt(aa).LeaveDay)
        Next i
        If aa <> 0 Then txtLeaveday = day
        If txtLeaveday <> "" Then
            txtLeaveRemain = CInt(txtLeaveAmount.Text) - CInt(txtLeaveday.Text)
        Else
            txtLeaveRemain = txtLeaveAmount.Text
        End If
    End If
    Exit Sub
objerr:
    VBErrorBox "LoadPer failed"
    'ClearScreen
End Sub

Private Sub VBErrorBox(Title As String)
    Dim msg As String
    msg = ""
    msg = msg & "Error From        : " & Err.Source & vbCr
    msg = msg & "Error Number      : " & Err.Number & vbCr
    msg = msg & "Error Description : " & Err.Description
    MsgBox msg, , Title
End Sub

Private Sub ClearObjects()
    If Not Per Is Nothing Then
        Per.sys_close
        Set Per = Nothing
    End If
End Sub

Private Sub Image1_Click()
    frmMain.Show 0
    Unload Me
End Sub

Private Sub txtPerID_Change()
    If (Len(txtPerID.Text) = 5) And (NewStatus = False) Then
        If txtPerID = "" Then
            If Not (Per Is Nothing) Then Per.sys_close
            ClearScreen
        Else
            LoadPer (txtPerID.Text)
        End If
    End If
End Sub
