VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form frmHedit 
   BackColor       =   &H00800080&
   Caption         =   "Edit Temporal Database"
   ClientHeight    =   5820
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7125
   LinkTopic       =   "Form1"
   ScaleHeight     =   5820
   ScaleWidth      =   7125
   StartUpPosition =   3  'Windows Default
   Begin TabDlg.SSTab SSTab 
      Height          =   5535
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6855
      _ExtentX        =   12091
      _ExtentY        =   9763
      _Version        =   393216
      Tabs            =   10
      Tab             =   1
      TabsPerRow      =   5
      TabHeight       =   520
      WordWrap        =   0   'False
      BackColor       =   8388736
      ForeColor       =   4210752
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TabCaption(0)   =   "คำนำหน้า"
      TabPicture(0)   =   "frmHedit.frx":0000
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "cmdClear(0)"
      Tab(0).Control(1)=   "cmdInsert(0)"
      Tab(0).Control(2)=   "cmdDelete(0)"
      Tab(0).Control(3)=   "cmdUpdate(0)"
      Tab(0).Control(4)=   "cmdNew(0)"
      Tab(0).Control(5)=   "Frame1(0)"
      Tab(0).Control(6)=   "lvEObj(0)"
      Tab(0).Control(7)=   "Label3(0)"
      Tab(0).ControlCount=   8
      TabCaption(1)   =   "ชื่อ"
      TabPicture(1)   =   "frmHedit.frx":001C
      Tab(1).ControlEnabled=   -1  'True
      Tab(1).Control(0)=   "Label3(1)"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "lvEObj(1)"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).Control(2)=   "Frame1(1)"
      Tab(1).Control(2).Enabled=   0   'False
      Tab(1).Control(3)=   "cmdNew(1)"
      Tab(1).Control(3).Enabled=   0   'False
      Tab(1).Control(4)=   "cmdUpdate(1)"
      Tab(1).Control(4).Enabled=   0   'False
      Tab(1).Control(5)=   "cmdDelete(1)"
      Tab(1).Control(5).Enabled=   0   'False
      Tab(1).Control(6)=   "cmdInsert(1)"
      Tab(1).Control(6).Enabled=   0   'False
      Tab(1).Control(7)=   "cmdClear(1)"
      Tab(1).Control(7).Enabled=   0   'False
      Tab(1).ControlCount=   8
      TabCaption(2)   =   "นามสกุล"
      TabPicture(2)   =   "frmHedit.frx":0038
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "cmdClear(2)"
      Tab(2).Control(1)=   "cmdInsert(2)"
      Tab(2).Control(2)=   "cmdDelete(2)"
      Tab(2).Control(3)=   "cmdUpdate(2)"
      Tab(2).Control(4)=   "cmdNew(2)"
      Tab(2).Control(5)=   "Frame1(2)"
      Tab(2).Control(6)=   "lvEObj(2)"
      Tab(2).Control(7)=   "Label3(2)"
      Tab(2).ControlCount=   8
      TabCaption(3)   =   "สถานภาพ"
      TabPicture(3)   =   "frmHedit.frx":0054
      Tab(3).ControlEnabled=   0   'False
      Tab(3).Control(0)=   "cmdClear(3)"
      Tab(3).Control(1)=   "cmdInsert(3)"
      Tab(3).Control(2)=   "cmdDelete(3)"
      Tab(3).Control(3)=   "cmdUpdate(3)"
      Tab(3).Control(4)=   "cmdNew(3)"
      Tab(3).Control(5)=   "Frame1(3)"
      Tab(3).Control(6)=   "lvEObj(3)"
      Tab(3).Control(7)=   "Label3(3)"
      Tab(3).ControlCount=   8
      TabCaption(4)   =   "ที่อยู่"
      TabPicture(4)   =   "frmHedit.frx":0070
      Tab(4).ControlEnabled=   0   'False
      Tab(4).Control(0)=   "cmdClear(4)"
      Tab(4).Control(1)=   "cmdInsert(4)"
      Tab(4).Control(2)=   "cmdDelete(4)"
      Tab(4).Control(3)=   "cmdUpdate(4)"
      Tab(4).Control(4)=   "cmdNew(4)"
      Tab(4).Control(5)=   "Frame1(4)"
      Tab(4).Control(6)=   "lvEObj(4)"
      Tab(4).Control(7)=   "Label3(4)"
      Tab(4).ControlCount=   8
      TabCaption(5)   =   "เบอร์โทรศัพท์"
      TabPicture(5)   =   "frmHedit.frx":008C
      Tab(5).ControlEnabled=   0   'False
      Tab(5).Control(0)=   "cmdClear(5)"
      Tab(5).Control(1)=   "cmdInsert(5)"
      Tab(5).Control(2)=   "cmdDelete(5)"
      Tab(5).Control(3)=   "cmdUpdate(5)"
      Tab(5).Control(4)=   "cmdNew(5)"
      Tab(5).Control(5)=   "Frame1(5)"
      Tab(5).Control(6)=   "lvEObj(5)"
      Tab(5).Control(7)=   "Label3(5)"
      Tab(5).ControlCount=   8
      TabCaption(6)   =   "มือถือ/เพจเจอร์"
      TabPicture(6)   =   "frmHedit.frx":00A8
      Tab(6).ControlEnabled=   0   'False
      Tab(6).Control(0)=   "cmdClear(6)"
      Tab(6).Control(1)=   "cmdInsert(6)"
      Tab(6).Control(2)=   "cmdDelete(6)"
      Tab(6).Control(3)=   "cmdUpdate(6)"
      Tab(6).Control(4)=   "cmdNew(6)"
      Tab(6).Control(5)=   "Frame1(6)"
      Tab(6).Control(6)=   "lvEObj(6)"
      Tab(6).Control(7)=   "Label3(6)"
      Tab(6).ControlCount=   8
      TabCaption(7)   =   "บัตรเสียภาษี"
      TabPicture(7)   =   "frmHedit.frx":00C4
      Tab(7).ControlEnabled=   0   'False
      Tab(7).Control(0)=   "cmdClear(7)"
      Tab(7).Control(1)=   "cmdInsert(7)"
      Tab(7).Control(2)=   "cmdDelete(7)"
      Tab(7).Control(3)=   "cmdUpdate(7)"
      Tab(7).Control(4)=   "cmdNew(7)"
      Tab(7).Control(5)=   "Frame1(7)"
      Tab(7).Control(6)=   "lvEObj(7)"
      Tab(7).Control(7)=   "Label3(7)"
      Tab(7).ControlCount=   8
      TabCaption(8)   =   "บัญชีธนาคาร"
      TabPicture(8)   =   "frmHedit.frx":00E0
      Tab(8).ControlEnabled=   0   'False
      Tab(8).Control(0)=   "cmdClear(8)"
      Tab(8).Control(1)=   "cmdInsert(8)"
      Tab(8).Control(2)=   "cmdDelete(8)"
      Tab(8).Control(3)=   "cmdUpdate(8)"
      Tab(8).Control(4)=   "cmdNew(8)"
      Tab(8).Control(5)=   "Frame1(8)"
      Tab(8).Control(6)=   "lvEObj(8)"
      Tab(8).Control(7)=   "Label3(8)"
      Tab(8).ControlCount=   8
      TabCaption(9)   =   "ประกันสังคม"
      TabPicture(9)   =   "frmHedit.frx":00FC
      Tab(9).ControlEnabled=   0   'False
      Tab(9).Control(0)=   "Label3(9)"
      Tab(9).Control(1)=   "lvEObj(9)"
      Tab(9).Control(2)=   "Frame1(9)"
      Tab(9).Control(3)=   "cmdNew(9)"
      Tab(9).Control(4)=   "cmdUpdate(9)"
      Tab(9).Control(5)=   "cmdDelete(9)"
      Tab(9).Control(6)=   "cmdInsert(9)"
      Tab(9).Control(7)=   "cmdClear(9)"
      Tab(9).ControlCount=   8
      Begin VB.CommandButton cmdClear 
         Caption         =   "Clear"
         Height          =   375
         Index           =   9
         Left            =   -74640
         TabIndex        =   143
         Top             =   4920
         Width           =   735
      End
      Begin VB.CommandButton cmdInsert 
         Caption         =   "Insert"
         Height          =   375
         Index           =   9
         Left            =   -70320
         TabIndex        =   141
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdDelete 
         Caption         =   "Delete"
         Height          =   375
         Index           =   9
         Left            =   -72240
         TabIndex        =   139
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdUpdate 
         Caption         =   "Update"
         Height          =   375
         Index           =   9
         Left            =   -69360
         TabIndex        =   142
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdNew 
         Caption         =   "New"
         Height          =   375
         Index           =   9
         Left            =   -71280
         TabIndex        =   140
         Top             =   3120
         Width           =   855
      End
      Begin VB.Frame Frame1 
         Caption         =   "Edit Temporal"
         Height          =   1575
         Index           =   9
         Left            =   -73800
         TabIndex        =   243
         Top             =   3720
         Width           =   5295
         Begin VB.TextBox txtMonthTo 
            Height          =   375
            Index           =   9
            Left            =   3600
            MaxLength       =   2
            TabIndex        =   136
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtMonthFrom 
            Height          =   375
            Index           =   9
            Left            =   1200
            MaxLength       =   2
            TabIndex        =   133
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtObj 
            Height          =   375
            Index           =   9
            Left            =   1200
            TabIndex        =   132
            Top             =   360
            Width           =   3855
         End
         Begin VB.TextBox txtDateFrom 
            Height          =   375
            Index           =   9
            Left            =   1680
            MaxLength       =   2
            TabIndex        =   134
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearFrom 
            Height          =   375
            Index           =   9
            Left            =   2160
            MaxLength       =   4
            TabIndex        =   135
            Top             =   840
            Width           =   495
         End
         Begin VB.TextBox txtDateTo 
            Height          =   375
            Index           =   9
            Left            =   4080
            MaxLength       =   2
            TabIndex        =   137
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearTo 
            Height          =   375
            Index           =   9
            Left            =   4560
            MaxLength       =   4
            TabIndex        =   138
            Top             =   840
            Width           =   495
         End
         Begin VB.Label Label6 
            Caption         =   "To Date :"
            Height          =   255
            Index           =   9
            Left            =   2760
            TabIndex        =   252
            Top             =   960
            Width           =   735
         End
         Begin VB.Label Label5 
            Caption         =   "From Date :"
            Height          =   255
            Index           =   9
            Left            =   240
            TabIndex        =   251
            Top             =   960
            Width           =   855
         End
         Begin VB.Label Label4 
            Caption         =   "Social No. :"
            Height          =   255
            Index           =   9
            Left            =   240
            TabIndex        =   250
            Top             =   480
            Width           =   975
         End
         Begin VB.Label Label1 
            Caption         =   "/"
            Height          =   255
            Index           =   9
            Left            =   1560
            TabIndex        =   249
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label7 
            Caption         =   "/"
            Height          =   255
            Index           =   9
            Left            =   2040
            TabIndex        =   248
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label8 
            Caption         =   "/"
            Height          =   255
            Index           =   9
            Left            =   3960
            TabIndex        =   247
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label9 
            Caption         =   "/"
            Height          =   255
            Index           =   9
            Left            =   4440
            TabIndex        =   246
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label10 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   9
            Left            =   1440
            TabIndex        =   245
            Top             =   1200
            Width           =   975
         End
         Begin VB.Label Label11 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   9
            Left            =   3840
            TabIndex        =   244
            Top             =   1200
            Width           =   975
         End
      End
      Begin VB.CommandButton cmdClear 
         Caption         =   "Clear"
         Height          =   375
         Index           =   8
         Left            =   -74640
         TabIndex        =   130
         Top             =   4920
         Width           =   735
      End
      Begin VB.CommandButton cmdInsert 
         Caption         =   "Insert"
         Height          =   375
         Index           =   8
         Left            =   -70320
         TabIndex        =   128
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdDelete 
         Caption         =   "Delete"
         Height          =   375
         Index           =   8
         Left            =   -72240
         TabIndex        =   126
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdUpdate 
         Caption         =   "Update"
         Height          =   375
         Index           =   8
         Left            =   -69360
         TabIndex        =   129
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdNew 
         Caption         =   "New"
         Height          =   375
         Index           =   8
         Left            =   -71280
         TabIndex        =   127
         Top             =   3120
         Width           =   855
      End
      Begin VB.Frame Frame1 
         Caption         =   "Edit Temporal"
         Height          =   1575
         Index           =   8
         Left            =   -73800
         TabIndex        =   232
         Top             =   3720
         Width           =   5295
         Begin VB.TextBox txtMonthTo 
            Height          =   375
            Index           =   8
            Left            =   3600
            MaxLength       =   2
            TabIndex        =   123
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtMonthFrom 
            Height          =   375
            Index           =   8
            Left            =   1200
            MaxLength       =   2
            TabIndex        =   120
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtObj 
            Height          =   375
            Index           =   8
            Left            =   1200
            TabIndex        =   119
            Top             =   360
            Width           =   3855
         End
         Begin VB.TextBox txtDateFrom 
            Height          =   375
            Index           =   8
            Left            =   1680
            MaxLength       =   2
            TabIndex        =   121
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearFrom 
            Height          =   375
            Index           =   8
            Left            =   2160
            MaxLength       =   4
            TabIndex        =   122
            Top             =   840
            Width           =   495
         End
         Begin VB.TextBox txtDateTo 
            Height          =   375
            Index           =   8
            Left            =   4080
            MaxLength       =   2
            TabIndex        =   124
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearTo 
            Height          =   375
            Index           =   8
            Left            =   4560
            MaxLength       =   4
            TabIndex        =   125
            Top             =   840
            Width           =   495
         End
         Begin VB.Label Label6 
            Caption         =   "To Date :"
            Height          =   255
            Index           =   8
            Left            =   2760
            TabIndex        =   241
            Top             =   960
            Width           =   735
         End
         Begin VB.Label Label5 
            Caption         =   "From Date :"
            Height          =   255
            Index           =   8
            Left            =   240
            TabIndex        =   240
            Top             =   960
            Width           =   855
         End
         Begin VB.Label Label4 
            Caption         =   "Account No. :"
            Height          =   255
            Index           =   8
            Left            =   120
            TabIndex        =   239
            Top             =   480
            Width           =   1095
         End
         Begin VB.Label Label1 
            Caption         =   "/"
            Height          =   255
            Index           =   8
            Left            =   1560
            TabIndex        =   238
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label7 
            Caption         =   "/"
            Height          =   255
            Index           =   8
            Left            =   2040
            TabIndex        =   237
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label8 
            Caption         =   "/"
            Height          =   255
            Index           =   8
            Left            =   3960
            TabIndex        =   236
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label9 
            Caption         =   "/"
            Height          =   255
            Index           =   8
            Left            =   4440
            TabIndex        =   235
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label10 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   8
            Left            =   1440
            TabIndex        =   234
            Top             =   1200
            Width           =   975
         End
         Begin VB.Label Label11 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   8
            Left            =   3840
            TabIndex        =   233
            Top             =   1200
            Width           =   975
         End
      End
      Begin VB.CommandButton cmdClear 
         Caption         =   "Clear"
         Height          =   375
         Index           =   7
         Left            =   -74640
         TabIndex        =   117
         Top             =   4920
         Width           =   735
      End
      Begin VB.CommandButton cmdInsert 
         Caption         =   "Insert"
         Height          =   375
         Index           =   7
         Left            =   -70320
         TabIndex        =   115
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdDelete 
         Caption         =   "Delete"
         Height          =   375
         Index           =   7
         Left            =   -72240
         TabIndex        =   113
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdUpdate 
         Caption         =   "Update"
         Height          =   375
         Index           =   7
         Left            =   -69360
         TabIndex        =   116
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdNew 
         Caption         =   "New"
         Height          =   375
         Index           =   7
         Left            =   -71280
         TabIndex        =   114
         Top             =   3120
         Width           =   855
      End
      Begin VB.Frame Frame1 
         Caption         =   "Edit Temporal"
         Height          =   1575
         Index           =   7
         Left            =   -73800
         TabIndex        =   221
         Top             =   3720
         Width           =   5295
         Begin VB.TextBox txtMonthTo 
            Height          =   375
            Index           =   7
            Left            =   3600
            MaxLength       =   2
            TabIndex        =   110
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtMonthFrom 
            Height          =   375
            Index           =   7
            Left            =   1200
            MaxLength       =   2
            TabIndex        =   107
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtObj 
            Height          =   375
            Index           =   7
            Left            =   1200
            TabIndex        =   106
            Top             =   360
            Width           =   3855
         End
         Begin VB.TextBox txtDateFrom 
            Height          =   375
            Index           =   7
            Left            =   1680
            MaxLength       =   2
            TabIndex        =   108
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearFrom 
            Height          =   375
            Index           =   7
            Left            =   2160
            MaxLength       =   4
            TabIndex        =   109
            Top             =   840
            Width           =   495
         End
         Begin VB.TextBox txtDateTo 
            Height          =   375
            Index           =   7
            Left            =   4080
            MaxLength       =   2
            TabIndex        =   111
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearTo 
            Height          =   375
            Index           =   7
            Left            =   4560
            MaxLength       =   4
            TabIndex        =   112
            Top             =   840
            Width           =   495
         End
         Begin VB.Label Label6 
            Caption         =   "To Date :"
            Height          =   255
            Index           =   7
            Left            =   2760
            TabIndex        =   230
            Top             =   960
            Width           =   735
         End
         Begin VB.Label Label5 
            Caption         =   "From Date :"
            Height          =   255
            Index           =   7
            Left            =   240
            TabIndex        =   229
            Top             =   960
            Width           =   855
         End
         Begin VB.Label Label4 
            Caption         =   "Tax No. :"
            Height          =   255
            Index           =   7
            Left            =   480
            TabIndex        =   228
            Top             =   480
            Width           =   735
         End
         Begin VB.Label Label1 
            Caption         =   "/"
            Height          =   255
            Index           =   7
            Left            =   1560
            TabIndex        =   227
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label7 
            Caption         =   "/"
            Height          =   255
            Index           =   7
            Left            =   2040
            TabIndex        =   226
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label8 
            Caption         =   "/"
            Height          =   255
            Index           =   7
            Left            =   3960
            TabIndex        =   225
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label9 
            Caption         =   "/"
            Height          =   255
            Index           =   7
            Left            =   4440
            TabIndex        =   224
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label10 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   7
            Left            =   1440
            TabIndex        =   223
            Top             =   1200
            Width           =   975
         End
         Begin VB.Label Label11 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   7
            Left            =   3840
            TabIndex        =   222
            Top             =   1200
            Width           =   975
         End
      End
      Begin VB.CommandButton cmdClear 
         Caption         =   "Clear"
         Height          =   375
         Index           =   6
         Left            =   -74640
         TabIndex        =   104
         Top             =   4920
         Width           =   735
      End
      Begin VB.CommandButton cmdInsert 
         Caption         =   "Insert"
         Height          =   375
         Index           =   6
         Left            =   -70320
         TabIndex        =   102
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdDelete 
         Caption         =   "Delete"
         Height          =   375
         Index           =   6
         Left            =   -72240
         TabIndex        =   100
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdUpdate 
         Caption         =   "Update"
         Height          =   375
         Index           =   6
         Left            =   -69360
         TabIndex        =   103
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdNew 
         Caption         =   "New"
         Height          =   375
         Index           =   6
         Left            =   -71280
         TabIndex        =   101
         Top             =   3120
         Width           =   855
      End
      Begin VB.Frame Frame1 
         Caption         =   "Edit Temporal"
         Height          =   1575
         Index           =   6
         Left            =   -73800
         TabIndex        =   210
         Top             =   3720
         Width           =   5295
         Begin VB.TextBox txtMonthTo 
            Height          =   375
            Index           =   6
            Left            =   3600
            MaxLength       =   2
            TabIndex        =   97
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtMonthFrom 
            Height          =   375
            Index           =   6
            Left            =   1200
            MaxLength       =   2
            TabIndex        =   94
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtObj 
            Height          =   375
            Index           =   6
            Left            =   1200
            TabIndex        =   93
            Top             =   360
            Width           =   3855
         End
         Begin VB.TextBox txtDateFrom 
            Height          =   375
            Index           =   6
            Left            =   1680
            MaxLength       =   2
            TabIndex        =   95
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearFrom 
            Height          =   375
            Index           =   6
            Left            =   2160
            MaxLength       =   4
            TabIndex        =   96
            Top             =   840
            Width           =   495
         End
         Begin VB.TextBox txtDateTo 
            Height          =   375
            Index           =   6
            Left            =   4080
            MaxLength       =   2
            TabIndex        =   98
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearTo 
            Height          =   375
            Index           =   6
            Left            =   4560
            MaxLength       =   4
            TabIndex        =   99
            Top             =   840
            Width           =   495
         End
         Begin VB.Label Label6 
            Caption         =   "To Date :"
            Height          =   255
            Index           =   6
            Left            =   2760
            TabIndex        =   219
            Top             =   960
            Width           =   735
         End
         Begin VB.Label Label5 
            Caption         =   "From Date :"
            Height          =   255
            Index           =   6
            Left            =   240
            TabIndex        =   218
            Top             =   960
            Width           =   855
         End
         Begin VB.Label Label4 
            Caption         =   "Mobile Phone/Pager :"
            Height          =   615
            Index           =   6
            Left            =   120
            TabIndex        =   217
            Top             =   240
            Width           =   1095
         End
         Begin VB.Label Label1 
            Caption         =   "/"
            Height          =   255
            Index           =   6
            Left            =   1560
            TabIndex        =   216
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label7 
            Caption         =   "/"
            Height          =   255
            Index           =   6
            Left            =   2040
            TabIndex        =   215
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label8 
            Caption         =   "/"
            Height          =   255
            Index           =   6
            Left            =   3960
            TabIndex        =   214
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label9 
            Caption         =   "/"
            Height          =   255
            Index           =   6
            Left            =   4440
            TabIndex        =   213
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label10 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   6
            Left            =   1440
            TabIndex        =   212
            Top             =   1200
            Width           =   975
         End
         Begin VB.Label Label11 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   6
            Left            =   3840
            TabIndex        =   211
            Top             =   1200
            Width           =   975
         End
      End
      Begin VB.CommandButton cmdClear 
         Caption         =   "Clear"
         Height          =   375
         Index           =   5
         Left            =   -74640
         TabIndex        =   91
         Top             =   4920
         Width           =   735
      End
      Begin VB.CommandButton cmdInsert 
         Caption         =   "Insert"
         Height          =   375
         Index           =   5
         Left            =   -70320
         TabIndex        =   89
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdDelete 
         Caption         =   "Delete"
         Height          =   375
         Index           =   5
         Left            =   -72240
         TabIndex        =   87
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdUpdate 
         Caption         =   "Update"
         Height          =   375
         Index           =   5
         Left            =   -69360
         TabIndex        =   90
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdNew 
         Caption         =   "New"
         Height          =   375
         Index           =   5
         Left            =   -71280
         TabIndex        =   88
         Top             =   3120
         Width           =   855
      End
      Begin VB.Frame Frame1 
         Caption         =   "Edit Temporal"
         Height          =   1575
         Index           =   5
         Left            =   -73800
         TabIndex        =   199
         Top             =   3720
         Width           =   5295
         Begin VB.TextBox txtMonthTo 
            Height          =   375
            Index           =   5
            Left            =   3600
            MaxLength       =   2
            TabIndex        =   84
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtMonthFrom 
            Height          =   375
            Index           =   5
            Left            =   1200
            MaxLength       =   2
            TabIndex        =   81
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtObj 
            Height          =   375
            Index           =   5
            Left            =   1200
            TabIndex        =   80
            Top             =   360
            Width           =   3855
         End
         Begin VB.TextBox txtDateFrom 
            Height          =   375
            Index           =   5
            Left            =   1680
            MaxLength       =   2
            TabIndex        =   82
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearFrom 
            Height          =   375
            Index           =   5
            Left            =   2160
            MaxLength       =   4
            TabIndex        =   83
            Top             =   840
            Width           =   495
         End
         Begin VB.TextBox txtDateTo 
            Height          =   375
            Index           =   5
            Left            =   4080
            MaxLength       =   2
            TabIndex        =   85
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearTo 
            Height          =   375
            Index           =   5
            Left            =   4560
            MaxLength       =   4
            TabIndex        =   86
            Top             =   840
            Width           =   495
         End
         Begin VB.Label Label6 
            Caption         =   "To Date :"
            Height          =   255
            Index           =   5
            Left            =   2760
            TabIndex        =   208
            Top             =   960
            Width           =   735
         End
         Begin VB.Label Label5 
            Caption         =   "From Date :"
            Height          =   255
            Index           =   5
            Left            =   240
            TabIndex        =   207
            Top             =   960
            Width           =   855
         End
         Begin VB.Label Label4 
            Caption         =   "Telephone :"
            Height          =   255
            Index           =   5
            Left            =   240
            TabIndex        =   206
            Top             =   480
            Width           =   975
         End
         Begin VB.Label Label1 
            Caption         =   "/"
            Height          =   255
            Index           =   5
            Left            =   1560
            TabIndex        =   205
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label7 
            Caption         =   "/"
            Height          =   255
            Index           =   5
            Left            =   2040
            TabIndex        =   204
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label8 
            Caption         =   "/"
            Height          =   255
            Index           =   5
            Left            =   3960
            TabIndex        =   203
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label9 
            Caption         =   "/"
            Height          =   255
            Index           =   5
            Left            =   4440
            TabIndex        =   202
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label10 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   5
            Left            =   1440
            TabIndex        =   201
            Top             =   1200
            Width           =   975
         End
         Begin VB.Label Label11 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   5
            Left            =   3840
            TabIndex        =   200
            Top             =   1200
            Width           =   975
         End
      End
      Begin VB.CommandButton cmdClear 
         Caption         =   "Clear"
         Height          =   375
         Index           =   4
         Left            =   -74880
         TabIndex        =   78
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdInsert 
         Caption         =   "Insert"
         Height          =   375
         Index           =   4
         Left            =   -70320
         TabIndex        =   76
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdDelete 
         Caption         =   "Delete"
         Height          =   375
         Index           =   4
         Left            =   -72240
         TabIndex        =   74
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdUpdate 
         Caption         =   "Update"
         Height          =   375
         Index           =   4
         Left            =   -69360
         TabIndex        =   77
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdNew 
         Caption         =   "New"
         Height          =   375
         Index           =   4
         Left            =   -71280
         TabIndex        =   75
         Top             =   3120
         Width           =   855
      End
      Begin VB.Frame Frame1 
         Caption         =   "Edit Temporal"
         Height          =   1815
         Index           =   4
         Left            =   -74880
         TabIndex        =   188
         Top             =   3600
         Width           =   6495
         Begin VB.TextBox txtZipCode 
            Height          =   315
            Left            =   5640
            TabIndex        =   67
            Top             =   720
            Width           =   735
         End
         Begin VB.TextBox txtProvince 
            Height          =   315
            Left            =   3840
            TabIndex        =   66
            Top             =   720
            Width           =   1335
         End
         Begin VB.TextBox txtAmphur 
            Height          =   315
            Left            =   2160
            TabIndex        =   65
            Top             =   720
            Width           =   975
         End
         Begin VB.TextBox txtTumbon 
            Height          =   315
            Left            =   600
            TabIndex        =   64
            Top             =   720
            Width           =   855
         End
         Begin VB.TextBox txtMooTee 
            Height          =   315
            Left            =   5760
            TabIndex        =   63
            Top             =   360
            Width           =   615
         End
         Begin VB.TextBox txtStreet 
            Height          =   315
            Left            =   3960
            TabIndex        =   62
            Top             =   360
            Width           =   1215
         End
         Begin VB.TextBox txtSoi 
            Height          =   315
            Left            =   2520
            TabIndex        =   61
            Top             =   360
            Width           =   855
         End
         Begin VB.TextBox txtMonthTo 
            Height          =   375
            Index           =   4
            Left            =   4920
            MaxLength       =   2
            TabIndex        =   71
            Top             =   1080
            Width           =   375
         End
         Begin VB.TextBox txtMonthFrom 
            Height          =   375
            Index           =   4
            Left            =   2520
            MaxLength       =   2
            TabIndex        =   68
            Top             =   1080
            Width           =   375
         End
         Begin VB.TextBox txtObj 
            Height          =   315
            Index           =   4
            Left            =   960
            TabIndex        =   60
            Top             =   360
            Width           =   975
         End
         Begin VB.TextBox txtDateFrom 
            Height          =   375
            Index           =   4
            Left            =   3000
            MaxLength       =   2
            TabIndex        =   69
            Top             =   1080
            Width           =   375
         End
         Begin VB.TextBox txtYearFrom 
            Height          =   375
            Index           =   4
            Left            =   3480
            MaxLength       =   4
            TabIndex        =   70
            Top             =   1080
            Width           =   495
         End
         Begin VB.TextBox txtDateTo 
            Height          =   375
            Index           =   4
            Left            =   5400
            MaxLength       =   2
            TabIndex        =   72
            Top             =   1080
            Width           =   375
         End
         Begin VB.TextBox txtYearTo 
            Height          =   375
            Index           =   4
            Left            =   5880
            MaxLength       =   4
            TabIndex        =   73
            Top             =   1080
            Width           =   495
         End
         Begin VB.Label Label20 
            Caption         =   "Zip :"
            Height          =   255
            Left            =   5280
            TabIndex        =   263
            Top             =   720
            Width           =   375
         End
         Begin VB.Label Label19 
            Caption         =   "จังหวัด :"
            Height          =   255
            Left            =   3240
            TabIndex        =   262
            Top             =   720
            Width           =   615
         End
         Begin VB.Label Label18 
            Caption         =   "อำเภอ :"
            Height          =   255
            Left            =   1560
            TabIndex        =   261
            Top             =   720
            Width           =   615
         End
         Begin VB.Label Label17 
            Caption         =   "ตำบล :"
            Height          =   255
            Left            =   120
            TabIndex        =   260
            Top             =   720
            Width           =   495
         End
         Begin VB.Label Label16 
            Caption         =   "หมู่ที่ :"
            Height          =   255
            Left            =   5280
            TabIndex        =   259
            Top             =   360
            Width           =   495
         End
         Begin VB.Label Label15 
            Caption         =   "ถนน :"
            Height          =   255
            Left            =   3480
            TabIndex        =   258
            Top             =   360
            Width           =   495
         End
         Begin VB.Label Label14 
            Caption         =   "ซอย :"
            Height          =   255
            Left            =   2040
            TabIndex        =   257
            Top             =   360
            Width           =   495
         End
         Begin VB.Label Label6 
            Caption         =   "To Date :"
            Height          =   255
            Index           =   4
            Left            =   4080
            TabIndex        =   197
            Top             =   1200
            Width           =   735
         End
         Begin VB.Label Label5 
            Caption         =   "From Date :"
            Height          =   255
            Index           =   4
            Left            =   1560
            TabIndex        =   196
            Top             =   1200
            Width           =   855
         End
         Begin VB.Label Label4 
            Caption         =   "บ้านเลขที่ :"
            Height          =   255
            Index           =   4
            Left            =   120
            TabIndex        =   195
            Top             =   360
            Width           =   855
         End
         Begin VB.Label Label1 
            Caption         =   "/"
            Height          =   255
            Index           =   4
            Left            =   2880
            TabIndex        =   194
            Top             =   1200
            Width           =   135
         End
         Begin VB.Label Label7 
            Caption         =   "/"
            Height          =   255
            Index           =   4
            Left            =   3360
            TabIndex        =   193
            Top             =   1200
            Width           =   135
         End
         Begin VB.Label Label8 
            Caption         =   "/"
            Height          =   255
            Index           =   4
            Left            =   5280
            TabIndex        =   192
            Top             =   1200
            Width           =   135
         End
         Begin VB.Label Label9 
            Caption         =   "/"
            Height          =   255
            Index           =   4
            Left            =   5760
            TabIndex        =   191
            Top             =   1200
            Width           =   135
         End
         Begin VB.Label Label10 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   4
            Left            =   2760
            TabIndex        =   190
            Top             =   1440
            Width           =   975
         End
         Begin VB.Label Label11 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   4
            Left            =   5160
            TabIndex        =   189
            Top             =   1440
            Width           =   975
         End
      End
      Begin VB.CommandButton cmdClear 
         Caption         =   "Clear"
         Height          =   375
         Index           =   3
         Left            =   -74640
         TabIndex        =   58
         Top             =   4920
         Width           =   735
      End
      Begin VB.CommandButton cmdInsert 
         Caption         =   "Insert"
         Height          =   375
         Index           =   3
         Left            =   -70320
         TabIndex        =   56
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdDelete 
         Caption         =   "Delete"
         Height          =   375
         Index           =   3
         Left            =   -72240
         TabIndex        =   54
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdUpdate 
         Caption         =   "Update"
         Height          =   375
         Index           =   3
         Left            =   -69360
         TabIndex        =   57
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdNew 
         Caption         =   "New"
         Height          =   375
         Index           =   3
         Left            =   -71280
         TabIndex        =   55
         Top             =   3120
         Width           =   855
      End
      Begin VB.Frame Frame1 
         Caption         =   "Edit Temporal"
         Height          =   1575
         Index           =   3
         Left            =   -73800
         TabIndex        =   177
         Top             =   3720
         Width           =   5295
         Begin VB.ComboBox cboStatus 
            Height          =   330
            ItemData        =   "frmHedit.frx":0118
            Left            =   1200
            List            =   "frmHedit.frx":011A
            Style           =   2  'Dropdown List
            TabIndex        =   46
            Top             =   360
            Width           =   3855
         End
         Begin VB.TextBox txtMonthTo 
            Height          =   375
            Index           =   3
            Left            =   3600
            MaxLength       =   2
            TabIndex        =   51
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtMonthFrom 
            Height          =   375
            Index           =   3
            Left            =   1200
            MaxLength       =   2
            TabIndex        =   48
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtObj 
            Height          =   375
            Index           =   3
            Left            =   1200
            TabIndex        =   47
            Top             =   360
            Visible         =   0   'False
            Width           =   3855
         End
         Begin VB.TextBox txtDateFrom 
            Height          =   375
            Index           =   3
            Left            =   1680
            MaxLength       =   2
            TabIndex        =   49
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearFrom 
            Height          =   375
            Index           =   3
            Left            =   2160
            MaxLength       =   4
            TabIndex        =   50
            Top             =   840
            Width           =   495
         End
         Begin VB.TextBox txtDateTo 
            Height          =   375
            Index           =   3
            Left            =   4080
            MaxLength       =   2
            TabIndex        =   52
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearTo 
            Height          =   375
            Index           =   3
            Left            =   4560
            MaxLength       =   4
            TabIndex        =   53
            Top             =   840
            Width           =   495
         End
         Begin VB.Label Label6 
            Caption         =   "To Date :"
            Height          =   255
            Index           =   3
            Left            =   2760
            TabIndex        =   186
            Top             =   960
            Width           =   735
         End
         Begin VB.Label Label5 
            Caption         =   "From Date :"
            Height          =   255
            Index           =   3
            Left            =   240
            TabIndex        =   185
            Top             =   960
            Width           =   855
         End
         Begin VB.Label Label4 
            Caption         =   "Status :"
            Height          =   255
            Index           =   3
            Left            =   600
            TabIndex        =   184
            Top             =   480
            Width           =   615
         End
         Begin VB.Label Label1 
            Caption         =   "/"
            Height          =   255
            Index           =   3
            Left            =   1560
            TabIndex        =   183
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label7 
            Caption         =   "/"
            Height          =   255
            Index           =   3
            Left            =   2040
            TabIndex        =   182
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label8 
            Caption         =   "/"
            Height          =   255
            Index           =   3
            Left            =   3960
            TabIndex        =   181
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label9 
            Caption         =   "/"
            Height          =   255
            Index           =   3
            Left            =   4440
            TabIndex        =   180
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label10 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   3
            Left            =   1440
            TabIndex        =   179
            Top             =   1200
            Width           =   975
         End
         Begin VB.Label Label11 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   3
            Left            =   3840
            TabIndex        =   178
            Top             =   1200
            Width           =   975
         End
      End
      Begin VB.CommandButton cmdClear 
         Caption         =   "Clear"
         Height          =   375
         Index           =   2
         Left            =   -74640
         TabIndex        =   44
         Top             =   4920
         Width           =   735
      End
      Begin VB.CommandButton cmdInsert 
         Caption         =   "Insert"
         Height          =   375
         Index           =   2
         Left            =   -70320
         TabIndex        =   42
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdDelete 
         Caption         =   "Delete"
         Height          =   375
         Index           =   2
         Left            =   -72240
         TabIndex        =   40
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdUpdate 
         Caption         =   "Update"
         Height          =   375
         Index           =   2
         Left            =   -69360
         TabIndex        =   43
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdNew 
         Caption         =   "New"
         Height          =   375
         Index           =   2
         Left            =   -71280
         TabIndex        =   41
         Top             =   3120
         Width           =   855
      End
      Begin VB.Frame Frame1 
         Caption         =   "Edit Temporal"
         Height          =   1575
         Index           =   2
         Left            =   -73800
         TabIndex        =   166
         Top             =   3720
         Width           =   5295
         Begin VB.TextBox txtTLastName 
            Height          =   375
            Left            =   1200
            TabIndex        =   32
            Top             =   360
            Width           =   1455
         End
         Begin VB.TextBox txtMonthTo 
            Height          =   375
            Index           =   2
            Left            =   3600
            MaxLength       =   2
            TabIndex        =   37
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtMonthFrom 
            Height          =   375
            Index           =   2
            Left            =   1200
            MaxLength       =   2
            TabIndex        =   34
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtObj 
            Height          =   375
            Index           =   2
            Left            =   3600
            TabIndex        =   33
            Top             =   360
            Width           =   1455
         End
         Begin VB.TextBox txtDateFrom 
            Height          =   375
            Index           =   2
            Left            =   1680
            MaxLength       =   2
            TabIndex        =   35
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearFrom 
            Height          =   375
            Index           =   2
            Left            =   2160
            MaxLength       =   4
            TabIndex        =   36
            Top             =   840
            Width           =   495
         End
         Begin VB.TextBox txtDateTo 
            Height          =   375
            Index           =   2
            Left            =   4080
            MaxLength       =   2
            TabIndex        =   38
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearTo 
            Height          =   375
            Index           =   2
            Left            =   4560
            MaxLength       =   4
            TabIndex        =   39
            Top             =   840
            Width           =   495
         End
         Begin VB.Label Label12 
            Caption         =   "นามสกุล :"
            Height          =   255
            Left            =   480
            TabIndex        =   255
            Top             =   480
            Width           =   735
         End
         Begin VB.Label Label6 
            Caption         =   "To Date :"
            Height          =   255
            Index           =   2
            Left            =   2760
            TabIndex        =   175
            Top             =   960
            Width           =   735
         End
         Begin VB.Label Label5 
            Caption         =   "From Date :"
            Height          =   255
            Index           =   2
            Left            =   240
            TabIndex        =   174
            Top             =   960
            Width           =   855
         End
         Begin VB.Label Label4 
            Caption         =   "LastName :"
            Height          =   255
            Index           =   2
            Left            =   2760
            TabIndex        =   173
            Top             =   480
            Width           =   975
         End
         Begin VB.Label Label1 
            Caption         =   "/"
            Height          =   255
            Index           =   2
            Left            =   1560
            TabIndex        =   172
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label7 
            Caption         =   "/"
            Height          =   255
            Index           =   2
            Left            =   2040
            TabIndex        =   171
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label8 
            Caption         =   "/"
            Height          =   255
            Index           =   2
            Left            =   3960
            TabIndex        =   170
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label9 
            Caption         =   "/"
            Height          =   255
            Index           =   2
            Left            =   4440
            TabIndex        =   169
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label10 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   2
            Left            =   1440
            TabIndex        =   168
            Top             =   1200
            Width           =   975
         End
         Begin VB.Label Label11 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   2
            Left            =   3840
            TabIndex        =   167
            Top             =   1200
            Width           =   975
         End
      End
      Begin VB.CommandButton cmdClear 
         Caption         =   "Clear"
         Height          =   375
         Index           =   1
         Left            =   360
         TabIndex        =   30
         Top             =   4920
         Width           =   735
      End
      Begin VB.CommandButton cmdInsert 
         Caption         =   "Insert"
         Height          =   375
         Index           =   1
         Left            =   4680
         TabIndex        =   28
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdDelete 
         Caption         =   "Delete"
         Height          =   375
         Index           =   1
         Left            =   2760
         TabIndex        =   26
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdUpdate 
         Caption         =   "Update"
         Height          =   375
         Index           =   1
         Left            =   5640
         TabIndex        =   29
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdNew 
         Caption         =   "New"
         Height          =   375
         Index           =   1
         Left            =   3720
         TabIndex        =   27
         Top             =   3120
         Width           =   855
      End
      Begin VB.Frame Frame1 
         Caption         =   "Edit Temporal"
         Height          =   1575
         Index           =   1
         Left            =   1200
         TabIndex        =   155
         Top             =   3720
         Width           =   5295
         Begin VB.TextBox txtTName 
            Height          =   375
            Left            =   1200
            TabIndex        =   18
            Top             =   360
            Width           =   1455
         End
         Begin VB.TextBox txtMonthTo 
            Height          =   375
            Index           =   1
            Left            =   3600
            MaxLength       =   2
            TabIndex        =   23
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtMonthFrom 
            Height          =   375
            Index           =   1
            Left            =   1200
            MaxLength       =   2
            TabIndex        =   20
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtObj 
            Height          =   375
            Index           =   1
            Left            =   3600
            TabIndex        =   19
            Top             =   360
            Width           =   1455
         End
         Begin VB.TextBox txtDateFrom 
            Height          =   375
            Index           =   1
            Left            =   1680
            MaxLength       =   2
            TabIndex        =   21
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearFrom 
            Height          =   375
            Index           =   1
            Left            =   2160
            MaxLength       =   4
            TabIndex        =   22
            Top             =   840
            Width           =   495
         End
         Begin VB.TextBox txtDateTo 
            Height          =   375
            Index           =   1
            Left            =   4080
            MaxLength       =   2
            TabIndex        =   24
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearTo 
            Height          =   375
            Index           =   1
            Left            =   4560
            MaxLength       =   4
            TabIndex        =   25
            Top             =   840
            Width           =   495
         End
         Begin VB.Label Label2 
            Caption         =   "ชื่อ :"
            Height          =   255
            Left            =   840
            TabIndex        =   254
            Top             =   480
            Width           =   375
         End
         Begin VB.Label Label6 
            Caption         =   "To Date :"
            Height          =   255
            Index           =   1
            Left            =   2760
            TabIndex        =   164
            Top             =   960
            Width           =   735
         End
         Begin VB.Label Label5 
            Caption         =   "From Date :"
            Height          =   255
            Index           =   1
            Left            =   240
            TabIndex        =   163
            Top             =   960
            Width           =   855
         End
         Begin VB.Label Label4 
            Caption         =   "Name :"
            Height          =   255
            Index           =   1
            Left            =   3000
            TabIndex        =   162
            Top             =   480
            Width           =   615
         End
         Begin VB.Label Label1 
            Caption         =   "/"
            Height          =   255
            Index           =   1
            Left            =   1560
            TabIndex        =   161
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label7 
            Caption         =   "/"
            Height          =   255
            Index           =   1
            Left            =   2040
            TabIndex        =   160
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label8 
            Caption         =   "/"
            Height          =   255
            Index           =   1
            Left            =   3960
            TabIndex        =   159
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label9 
            Caption         =   "/"
            Height          =   255
            Index           =   1
            Left            =   4440
            TabIndex        =   158
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label10 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   1
            Left            =   1440
            TabIndex        =   157
            Top             =   1200
            Width           =   975
         End
         Begin VB.Label Label11 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   1
            Left            =   3840
            TabIndex        =   156
            Top             =   1200
            Width           =   975
         End
      End
      Begin VB.CommandButton cmdClear 
         Caption         =   "Clear"
         Height          =   375
         Index           =   0
         Left            =   -74640
         TabIndex        =   16
         Top             =   4920
         Width           =   735
      End
      Begin VB.CommandButton cmdInsert 
         Caption         =   "Insert"
         Height          =   375
         Index           =   0
         Left            =   -70320
         TabIndex        =   14
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdDelete 
         Caption         =   "Delete"
         Height          =   375
         Index           =   0
         Left            =   -72240
         TabIndex        =   12
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdUpdate 
         Caption         =   "Update"
         Height          =   375
         Index           =   0
         Left            =   -69360
         TabIndex        =   15
         Top             =   3120
         Width           =   855
      End
      Begin VB.CommandButton cmdNew 
         Caption         =   "New"
         Height          =   375
         Index           =   0
         Left            =   -71280
         TabIndex        =   13
         Top             =   3120
         Width           =   855
      End
      Begin VB.Frame Frame1 
         Caption         =   "Edit Temporal"
         Height          =   1575
         Index           =   0
         Left            =   -73800
         TabIndex        =   144
         Top             =   3720
         Width           =   5295
         Begin VB.ComboBox cboETitle 
            Height          =   330
            Left            =   3600
            Style           =   2  'Dropdown List
            TabIndex        =   3
            Top             =   360
            Width           =   1455
         End
         Begin VB.ComboBox cboTTitle 
            Height          =   330
            Left            =   1200
            Style           =   2  'Dropdown List
            TabIndex        =   2
            Top             =   360
            Width           =   1455
         End
         Begin VB.TextBox txtTTitle 
            Height          =   375
            Left            =   1200
            TabIndex        =   4
            Top             =   360
            Visible         =   0   'False
            Width           =   1455
         End
         Begin VB.TextBox txtMonthTo 
            Height          =   375
            Index           =   0
            Left            =   3600
            MaxLength       =   2
            TabIndex        =   9
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtMonthFrom 
            Height          =   375
            Index           =   0
            Left            =   1200
            MaxLength       =   2
            TabIndex        =   6
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtObj 
            Height          =   375
            Index           =   0
            Left            =   3600
            TabIndex        =   5
            Top             =   360
            Visible         =   0   'False
            Width           =   1455
         End
         Begin VB.TextBox txtDateFrom 
            Height          =   375
            Index           =   0
            Left            =   1680
            MaxLength       =   2
            TabIndex        =   7
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearFrom 
            Height          =   375
            Index           =   0
            Left            =   2160
            MaxLength       =   4
            TabIndex        =   8
            Top             =   840
            Width           =   495
         End
         Begin VB.TextBox txtDateTo 
            Height          =   375
            Index           =   0
            Left            =   4080
            MaxLength       =   2
            TabIndex        =   10
            Top             =   840
            Width           =   375
         End
         Begin VB.TextBox txtYearTo 
            Height          =   375
            Index           =   0
            Left            =   4560
            MaxLength       =   4
            TabIndex        =   11
            Top             =   840
            Width           =   495
         End
         Begin VB.Label Label13 
            Caption         =   "คำนำหน้าชื่อ :"
            Height          =   255
            Left            =   120
            TabIndex        =   256
            Top             =   480
            Width           =   975
         End
         Begin VB.Label Label6 
            Caption         =   "To Date :"
            Height          =   255
            Index           =   0
            Left            =   2760
            TabIndex        =   153
            Top             =   960
            Width           =   735
         End
         Begin VB.Label Label5 
            Caption         =   "From Date :"
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   152
            Top             =   960
            Width           =   855
         End
         Begin VB.Label Label4 
            Caption         =   "Title :"
            Height          =   255
            Index           =   0
            Left            =   3000
            TabIndex        =   151
            Top             =   480
            Width           =   615
         End
         Begin VB.Label Label1 
            Caption         =   "/"
            Height          =   255
            Index           =   0
            Left            =   1560
            TabIndex        =   150
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label7 
            Caption         =   "/"
            Height          =   255
            Index           =   0
            Left            =   2040
            TabIndex        =   149
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label8 
            Caption         =   "/"
            Height          =   255
            Index           =   0
            Left            =   3960
            TabIndex        =   148
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label9 
            Caption         =   "/"
            Height          =   255
            Index           =   0
            Left            =   4440
            TabIndex        =   147
            Top             =   960
            Width           =   135
         End
         Begin VB.Label Label10 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   0
            Left            =   1440
            TabIndex        =   146
            Top             =   1200
            Width           =   975
         End
         Begin VB.Label Label11 
            Caption         =   "mm/dd/yyyy"
            Height          =   255
            Index           =   0
            Left            =   3840
            TabIndex        =   145
            Top             =   1200
            Width           =   975
         End
      End
      Begin MSComctlLib.ListView lvEObj 
         Height          =   1935
         Index           =   0
         Left            =   -74040
         TabIndex        =   1
         Top             =   1080
         Width           =   5535
         _ExtentX        =   9763
         _ExtentY        =   3413
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin MSComctlLib.ListView lvEObj 
         Height          =   1935
         Index           =   1
         Left            =   960
         TabIndex        =   17
         Top             =   1080
         Width           =   5535
         _ExtentX        =   9763
         _ExtentY        =   3413
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin MSComctlLib.ListView lvEObj 
         Height          =   1935
         Index           =   2
         Left            =   -74040
         TabIndex        =   31
         Top             =   1080
         Width           =   5535
         _ExtentX        =   9763
         _ExtentY        =   3413
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin MSComctlLib.ListView lvEObj 
         Height          =   1935
         Index           =   3
         Left            =   -73320
         TabIndex        =   45
         Top             =   1080
         Width           =   4815
         _ExtentX        =   8493
         _ExtentY        =   3413
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin MSComctlLib.ListView lvEObj 
         Height          =   1935
         Index           =   4
         Left            =   -74040
         TabIndex        =   59
         Top             =   1080
         Width           =   5535
         _ExtentX        =   9763
         _ExtentY        =   3413
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin MSComctlLib.ListView lvEObj 
         Height          =   1935
         Index           =   5
         Left            =   -73320
         TabIndex        =   79
         Top             =   1080
         Width           =   4815
         _ExtentX        =   8493
         _ExtentY        =   3413
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin MSComctlLib.ListView lvEObj 
         Height          =   1935
         Index           =   6
         Left            =   -73320
         TabIndex        =   92
         Top             =   1080
         Width           =   4815
         _ExtentX        =   8493
         _ExtentY        =   3413
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin MSComctlLib.ListView lvEObj 
         Height          =   1935
         Index           =   7
         Left            =   -73320
         TabIndex        =   105
         Top             =   1080
         Width           =   4815
         _ExtentX        =   8493
         _ExtentY        =   3413
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin MSComctlLib.ListView lvEObj 
         Height          =   1935
         Index           =   8
         Left            =   -73320
         TabIndex        =   118
         Top             =   1080
         Width           =   4815
         _ExtentX        =   8493
         _ExtentY        =   3413
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin MSComctlLib.ListView lvEObj 
         Height          =   1935
         Index           =   9
         Left            =   -73320
         TabIndex        =   131
         Top             =   1080
         Width           =   4815
         _ExtentX        =   8493
         _ExtentY        =   3413
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin VB.Label Label3 
         Caption         =   "History :"
         Height          =   255
         Index           =   9
         Left            =   -74040
         TabIndex        =   253
         Top             =   1080
         Width           =   615
      End
      Begin VB.Label Label3 
         Caption         =   "History :"
         Height          =   255
         Index           =   8
         Left            =   -74040
         TabIndex        =   242
         Top             =   1080
         Width           =   615
      End
      Begin VB.Label Label3 
         Caption         =   "History :"
         Height          =   255
         Index           =   7
         Left            =   -74040
         TabIndex        =   231
         Top             =   1080
         Width           =   615
      End
      Begin VB.Label Label3 
         Caption         =   "History :"
         Height          =   255
         Index           =   6
         Left            =   -74040
         TabIndex        =   220
         Top             =   1080
         Width           =   615
      End
      Begin VB.Label Label3 
         Caption         =   "History :"
         Height          =   255
         Index           =   5
         Left            =   -74040
         TabIndex        =   209
         Top             =   1080
         Width           =   615
      End
      Begin VB.Label Label3 
         Caption         =   "History :"
         Height          =   255
         Index           =   4
         Left            =   -74640
         TabIndex        =   198
         Top             =   1080
         Width           =   615
      End
      Begin VB.Label Label3 
         Caption         =   "History :"
         Height          =   255
         Index           =   3
         Left            =   -74040
         TabIndex        =   187
         Top             =   1080
         Width           =   615
      End
      Begin VB.Label Label3 
         Caption         =   "History :"
         Height          =   255
         Index           =   2
         Left            =   -74640
         TabIndex        =   176
         Top             =   1080
         Width           =   615
      End
      Begin VB.Label Label3 
         Caption         =   "History :"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   165
         Top             =   1080
         Width           =   615
      End
      Begin VB.Label Label3 
         Caption         =   "History :"
         Height          =   255
         Index           =   0
         Left            =   -74640
         TabIndex        =   154
         Top             =   1080
         Width           =   615
      End
   End
End
Attribute VB_Name = "frmHedit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public Indicator As Integer
Dim FromDate As String, ToDate As String
Dim FromLessThanTo As Boolean, Kong As Boolean
Dim EObj() As Object

Private Sub clearEdit(Index As Integer)
    txtObj(Index) = ""
    txtMonthFrom(Index) = ""
    txtDateFrom(Index) = ""
    txtYearFrom(Index) = ""
    txtMonthTo(Index) = ""
    txtDateTo(Index) = ""
    txtYearTo(Index) = ""
    txtTName = ""
    txtTLastName = ""
    txtTTitle = ""
    txtSoi = ""
    txtStreet = ""
    txtMooTee = ""
    txtTumbon = ""
    txtAmphur = ""
    txtProvince = ""
    txtZipCode = ""
End Sub

Private Sub MakeDate(Index As Integer)
    FromDate = ""
    ToDate = ""
    If (txtMonthFrom(Index) <> "" And txtDateFrom(Index) <> "" And txtYearFrom(Index) <> "") Then
        FromDate = txtMonthFrom(Index) + "/" + txtDateFrom(Index) + "/" + txtYearFrom(Index)
    End If
    If (txtMonthTo(Index) <> "" And txtDateTo(Index) <> "" And txtYearTo(Index) <> "") Then
        ToDate = txtMonthTo(Index) + "/" + txtDateTo(Index) + "/" + txtYearTo(Index)
    End If
End Sub

Private Sub CompareDate(Index As Integer)
    If (FromDate = "") Or (ToDate = "") Then Exit Sub
    FromLessThanTo = False
    If CInt(txtYearFrom(Index)) < 40 Then txtYearFrom(Index).Text = "20" + txtYearFrom(Index).Text
    If CInt(txtYearTo(Index)) < 40 Then txtYearTo(Index).Text = "20" + txtYearTo(Index).Text
    If CInt(txtYearFrom(Index)) < CInt(txtYearTo(Index)) Then FromLessThanTo = True
    If CInt(txtYearFrom(Index)) = CInt(txtYearTo(Index)) Then
        If CInt(txtMonthFrom(Index)) < CInt(txtMonthTo(Index)) Then
            FromLessThanTo = True
        ElseIf CInt(txtMonthFrom(Index)) = CInt(txtMonthTo(Index)) Then
            If CInt(txtDateFrom(Index)) < CInt(txtDateTo(Index)) Then
                FromLessThanTo = True
            End If
        End If
    End If
End Sub

Private Sub cmdDelete_Click(Index As Integer)
    On Error GoTo DeleteError
    
    Dim Prop As String
    Prop = GetPropertyName(Index)
    
    MakeDate (Index)
    CompareDate (Index)
    
    getCombobox (Index)
    If (txtObj(Index) <> "") And (FromDate <> "") And (ToDate <> "") And (FromLessThanTo = True) Then
        If SSTab.Tab <> 4 Then
            Per.Delete Prop, Prop, no, txtObj(Index).Text, FromDate, ToDate
        Else
            Per.AddressDelete no, FromDate, ToDate, txtObj(Index).Text, txtSoi.Text, txtStreet.Text, txtMooTee.Text, txtTumbon.Text, txtAmphur.Text, txtProvince.Text, txtZipCode.Text
        End If
        If SSTab.Tab = 0 Then Per.Delete "TTitle", "TTitle", no, Per.TTitle.GetAt(1).TTitleDisplayToLogical(txtTTitle.Text), FromDate, ToDate
        If SSTab.Tab = 1 Then Per.Delete "TFirstName", "TFirstName", no, txtTName.Text, FromDate, ToDate
        If SSTab.Tab = 2 Then Per.Delete "TLastName", "TLastName", no, txtTLastName.Text, FromDate, ToDate
        LoadHistory (Index)
        clearEdit (Index)
        Exit Sub
    Else
        MsgBox "You should fill all fields or check your data again", , "ข้อมูลบุคลากร"
    End If
    Exit Sub
        
DeleteError:
    VBErrorBox "Delete failed"
    ClearScreen (Index)
    LoadHistory (Index)
End Sub

Private Sub cmdNew_Click(Index As Integer)
    
    On Error GoTo objAddErr
    
    Dim Prop As String
    Prop = GetPropertyName(Index)
    
    MakeDate (Index)
    
    getCombobox (Index)
    If (txtObj(Index) <> "") And (FromDate <> "") Then
        If Per.CheckFrom(Prop, no, FromDate) Then
            If SSTab.Tab <> 4 Then
                Per.Append Prop, Prop, no, txtObj(Index).Text, FromDate
            Else
                Per.AddressAppend no, FromDate, txtObj(Index).Text, txtSoi.Text, txtStreet.Text, txtMooTee.Text, txtTumbon.Text, txtAmphur.Text, txtProvince.Text, txtZipCode.Text
            End If
            If SSTab.Tab = 0 Then Per.Append "TTitle", "TTitle", no, Per.TTitle.GetAt(1).TTitleDisplayToLogical(txtTTitle.Text), FromDate
            If SSTab.Tab = 1 Then Per.Append "TFirstName", "TFirstName", no, txtTName.Text, FromDate
            If SSTab.Tab = 2 Then Per.Append "TLastName", "TLastName", no, txtTLastName.Text, FromDate
            clearEdit (Index)
        Else
            MsgBox "No Overlap Time", , "ข้อมูลบุคลากร"
        End If
    Else
        MsgBox "You should fill Name and FromDate", , "ข้อมูลบุคลากร"
    End If
    
    LoadHistory (Index)
    Exit Sub
    
objAddErr:
    VBErrorBox "Append new record failed"
    ClearScreen (Index)
    LoadHistory (Index)
End Sub

Private Sub cmdInsert_Click(Index As Integer)
    
    On Error GoTo objInErr
    
    Dim Prop As String
    Prop = GetPropertyName(Index)
    
    MakeDate (Index)
    CompareDate (Index)
    
    getCombobox (Index)
    Dim st As Integer, ss As String
    If (txtObj(Index) <> "") And (FromDate <> "") And (ToDate <> "") And (FromLessThanTo = True) Then
        If SSTab.Tab <> 4 Then
            ss = txtObj(Index).Text
            st = Per.Insert(Prop, Prop, no, txtObj(Index).Text, FromDate, ToDate)
        Else
            st = Per.AddressInsert(no, FromDate, ToDate, txtObj(Index).Text, txtSoi.Text, txtStreet.Text, txtMooTee.Text, txtTumbon.Text, txtAmphur.Text, txtProvince.Text, txtZipCode.Text)
        End If
        If SSTab.Tab = 0 Then st = Per.Insert("TTitle", "TTitle", no, Per.TTitle.GetAt(1).TTitleDisplayToLogical(txtTTitle.Text), FromDate, ToDate)
        If SSTab.Tab = 1 Then st = Per.Insert("TFirstName", "TFirstName", no, txtTName.Text, FromDate, ToDate)
        If SSTab.Tab = 2 Then st = Per.Insert("TLastName", "TLastName", no, txtTLastName.Text, FromDate, ToDate)
        'MsgBox st, , "ข้อมูลบุคลากร"
        LoadHistory (Index)
        clearEdit (Index)
        Exit Sub
    Else
        MsgBox "You should fill all fields or check your data again", , "ข้อมูลบุคลากร"
    End If
    Exit Sub
        
objInErr:
    VBErrorBox "Insert failed"
    ClearScreen (Index)
    LoadHistory (Index)
End Sub

Private Sub cmdUpdate_Click(Index As Integer)
    
    On Error GoTo objUpdateErr
    
    Dim Prop As String
    Prop = GetPropertyName(Index)
    
    MakeDate (Index)
    CompareDate (Index)
    
    getCombobox (Index)
    Dim st As String
    If (txtObj(Index).Text <> "") And (FromDate <> "") And (ToDate <> "") And (FromLessThanTo = True) Then
        If SSTab.Tab <> 4 Then
            st = Per.Update(Prop, Prop, no, Indicator, txtObj(Index).Text, FromDate, ToDate)
        Else
            st = Per.AddressUpdate(no, Indicator, FromDate, ToDate, txtObj(Index).Text, txtSoi.Text, txtStreet.Text, txtMooTee.Text, txtTumbon.Text, txtAmphur.Text, txtProvince.Text, txtZipCode.Text)
        End If
        If SSTab.Tab = 0 Then st = Per.Update("TTitle", "TTitle", no, Indicator, Per.TTitle.GetAt(1).TTitleDisplayToLogical(txtTTitle.Text), FromDate, ToDate)
        If SSTab.Tab = 1 Then st = Per.Update("TFirstName", "TFirstName", no, Indicator, txtTName.Text, FromDate, ToDate)
        If SSTab.Tab = 2 Then st = Per.Update("TLastName", "TLastName", no, Indicator, txtTLastName.Text, FromDate, ToDate)
        
        If st <> "Update Complete" Then MsgBox st, , "ข้อมูลบุคลากร"
        LoadHistory (Index)
        clearEdit (Index)
    Else
        MsgBox "You should fill all fields or check your data again", , "ข้อมูลบุคลากร"
    End If
    Exit Sub
    
objUpdateErr:
    VBErrorBox "Update failed"
    ClearScreen (Index)
    LoadHistory (Index)
End Sub

Private Sub getCombobox(Index As Integer)
    If SSTab.Tab = 0 Then
        txtObj(Index).Text = Per.ETitle.GetAt(1).ETitleDisplayToLogical(cboETitle.Text)
        txtTTitle.Text = cboTTitle.Text
    End If
    If SSTab.Tab = 3 Then txtObj(Index).Text = cboStatus.Text
End Sub

Private Sub Form_Load()
    Kong = False
End Sub

Private Sub lvEObj_Click(Index As Integer)
    If lvEObj(Index).ListItems.Count = 0 Then Exit Sub

    Dim NameObj As Object, FromArray, ToArray
        
    Set NameObj = EObj(lvEObj(Index).SelectedItem.Index)
    NameObj.sys_incrementcount
    
    FromArray = Split(NameObj.FromDate, "/", -1, 1)
    ToArray = Split(NameObj.ToDate, "/", -1, 1)
    
    Indicator = lvEObj(Index).SelectedItem.Index
    
    txtObj(Index) = ReturnObj(Index, NameObj)
    If SSTab.Tab = 0 Then
        txtTTitle.Text = Per.TTitle.GetAt(Indicator).TTitleLogicalToDisplay(Per.TTitle.GetAt(Indicator).TTitle)
        Call findCombo(cboETitle, txtObj(Index).Text)
        Call findCombo(cboTTitle, txtTTitle.Text)
    End If
    If SSTab.Tab = 1 Then txtTName.Text = Per.TFirstName.GetAt(Indicator).TFirstName
    If SSTab.Tab = 2 Then txtTLastName.Text = Per.TLastName.GetAt(Indicator).TLastName
    If SSTab.Tab = 3 Then Call findCombo(cboStatus, txtObj(Index).Text)
    If SSTab.Tab = 4 Then
        txtObj(Index).Text = Per.Address.GetAt(Indicator).AddNo
        txtSoi.Text = Per.Address.GetAt(Indicator).Soi
        txtStreet.Text = Per.Address.GetAt(Indicator).Street
        txtMooTee.Text = Per.Address.GetAt(Indicator).MooTee
        txtTumbon.Text = Per.Address.GetAt(Indicator).Tumbon
        txtAmphur.Text = Per.Address.GetAt(Indicator).Amphur
        txtProvince.Text = Per.Address.GetAt(Indicator).Province
        txtZipCode.Text = Per.Address.GetAt(Indicator).ZipCode
    End If
    txtMonthFrom(Index) = FromArray(0)
    txtDateFrom(Index) = FromArray(1)
    txtYearFrom(Index) = FromArray(2)
    txtMonthTo(Index) = ToArray(0)
    txtDateTo(Index) = ToArray(1)
    txtYearTo(Index) = ToArray(2)
    Kong = False
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

Private Sub cboTTitle_Click()
    If Kong Then Exit Sub
    If cboTTitle.Text = "นาย" Then
        findCombo cboETitle, "Mr."
        Kong = False
    Else
        If cboTTitle.Text = "น.ส." Then
            findCombo cboETitle, "Miss"
            Kong = False
        Else
            findCombo cboETitle, "Mrs."
            Kong = False
        End If
    End If
End Sub

Private Sub cboETitle_Click()
    If Kong Then Exit Sub
    If cboETitle.Text = "Mr." Then
        findCombo cboTTitle, "นาย"
        Kong = False
    Else
        If cboETitle.Text = "Miss" Then
            findCombo cboTTitle, "น.ส."
            Kong = False
        Else
            findCombo cboTTitle, "นาง"
            Kong = False
        End If
    End If
End Sub

Private Sub cmdClear_Click(Index As Integer)
    clearEdit (Index)
End Sub

Private Sub ClearScreen(Index As Integer)
    clearEdit (Index)
    lvEObj(Index).ColumnHeaders.Clear
    lvEObj(Index).ListItems.Clear
End Sub

Private Sub VBErrorBox(Title As String)
    ' Produces an error box from the VB Err object, with the specified Title
    Dim msg As String
    msg = ""
    msg = msg & "Error From        : " & Err.Source & vbCr
    msg = msg & "Error Number      : " & Err.Number & vbCr
    msg = msg & "Error Description : " & Err.Description
    MsgBox msg, , Title
End Sub

Function GetPropertyName(Index As Integer) As String
    Select Case Index
        Case 0
            GetPropertyName = "ETitle"
        Case 1
            GetPropertyName = "EFirstName"
        Case 2
            GetPropertyName = "ELastName"
        Case 3
            GetPropertyName = "Status"
        Case 4
            GetPropertyName = "Address"
        Case 5
            GetPropertyName = "Telephone"
        Case 6
            GetPropertyName = "CellOrPager"
        Case 7
            GetPropertyName = "TaxNo"
        Case 8
            GetPropertyName = "BankNo"
        Case 9
            GetPropertyName = "SocialNo"
    End Select
End Function

Function ReturnObj(Index As Integer, NameObj As Object) As String
    Select Case SSTab.Tab
        Case 0
            ReturnObj = NameObj.ETitleLogicalToDisplay(NameObj.ETitle)
        Case 1
            ReturnObj = NameObj.EFirstName
        Case 2
            ReturnObj = NameObj.ELastName
        Case 3
            ReturnObj = NameObj.StatusLogicalToDisplay(NameObj.Status)
        Case 4
            ReturnObj = NameObj.AddNo
        Case 5
            ReturnObj = NameObj.Telephone
        Case 6
            ReturnObj = NameObj.CellOrPager
        Case 7
            ReturnObj = NameObj.TaxNo
        Case 8
            ReturnObj = NameObj.BankNo
        Case 9
            ReturnObj = NameObj.SocialNo
    End Select
End Function

Public Sub LoadHistory(Index As Integer)
    Select Case SSTab.Tab
        Case 0
            LoadETitle (0)
        Case 1
            LoadEFirstName (1)
        Case 2
            LoadELastName (2)
        Case 3
            LoadStatus (3)
        Case 4
            LoadAddress (4)
        Case 5
            LoadTelephone (5)
        Case 6
            LoadCellOrPager (6)
        Case 7
            LoadTaxNo (7)
        Case 8
            LoadBankNo (8)
        Case 9
            LoadSocialNo (9)
    End Select
End Sub

Private Sub SSTab_Click(Index As Integer)
    LoadHistory (Index)
End Sub

Public Sub LoadEFirstName(Index As Integer)
    Dim ehist As Object, tehist As Object
    Dim item As ListItem, ecount As Integer, i As Integer
    lvEObj(Index).View = lvwReport
    lvEObj(Index).FullRowSelect = True
    lvEObj(Index).ColumnHeaders.Clear
    lvEObj(Index).ColumnHeaders.Add , , "ชื่อ", 1400, lvwColumnLeft
    lvEObj(Index).ColumnHeaders.Add , , "Name", 1400, lvwColumnLeft
    lvEObj(Index).ColumnHeaders.Add , , "From date", 1200, lvwColumnCenter
    lvEObj(Index).ColumnHeaders.Add , , "To date", 1200, lvwColumnCenter
    lvEObj(Index).ListItems.Clear
    Erase EObj
    ecount = 0
    i = 1
    Set ehist = Per.EFirstName.GetAt(1)
    Set tehist = Per.TFirstName.GetAt(1)
    Do While Not ehist Is Nothing
        Set item = lvEObj(Index).ListItems.Add
        item.Text = tehist.TFirstName
        item.SubItems(1) = ehist.EFirstName
        item.SubItems(2) = ehist.FromDate
        item.SubItems(3) = ehist.ToDate
        ecount = ecount + 1
        ReDim Preserve EObj(ecount)
        Set EObj(ecount) = ehist
        i = i + 1
        Set ehist = Per.EFirstName.GetAt(i)
        Set tehist = Per.TFirstName.GetAt(i)
    Loop
    clearEdit (Index)
End Sub

Public Sub LoadELastName(Index As Integer)
    Dim ehist As Object, tehist As Object
    Dim item As ListItem, ecount As Integer, i As Integer
    lvEObj(Index).View = lvwReport
    lvEObj(Index).FullRowSelect = True
    lvEObj(Index).ColumnHeaders.Clear
    lvEObj(Index).ColumnHeaders.Add , , "นามสกุล", 1400, lvwColumnLeft
    lvEObj(Index).ColumnHeaders.Add , , "Last Name", 1400, lvwColumnLeft
    lvEObj(Index).ColumnHeaders.Add , , "From date", 1200, lvwColumnCenter
    lvEObj(Index).ColumnHeaders.Add , , "To date", 1200, lvwColumnCenter
    lvEObj(Index).ListItems.Clear
    Erase EObj
    ecount = 0
    i = 1
    Set ehist = Per.ELastName.GetAt(1)
    Set tehist = Per.TLastName.GetAt(1)
    Do While Not ehist Is Nothing
        Set item = lvEObj(Index).ListItems.Add
        item.Text = tehist.TLastName
        item.SubItems(1) = ehist.ELastName
        item.SubItems(2) = ehist.FromDate
        item.SubItems(3) = ehist.ToDate
        ecount = ecount + 1
        ReDim Preserve EObj(ecount)
        Set EObj(ecount) = ehist
        i = i + 1
        Set ehist = Per.ELastName.GetAt(i)
        Set tehist = Per.TLastName.GetAt(i)
    Loop
    clearEdit (Index)
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

Public Sub LoadStatus(Index As Integer)
    LoadStatusCombo
    Dim ehist As Object
    Dim item As ListItem, ecount As Integer, i As Integer
    lvEObj(Index).View = lvwReport
    lvEObj(Index).FullRowSelect = True
    lvEObj(Index).ColumnHeaders.Clear
    lvEObj(Index).ColumnHeaders.Add , , "สถานภาพ", 2100, lvwColumnLeft
    lvEObj(Index).ColumnHeaders.Add , , "From date", 1200, lvwColumnCenter
    lvEObj(Index).ColumnHeaders.Add , , "To date", 1200, lvwColumnCenter
    lvEObj(Index).ListItems.Clear
    Erase EObj
    ecount = 0
    i = 1
    Set ehist = Per.Status.GetAt(1)
    Do While Not ehist Is Nothing
        Set item = lvEObj(Index).ListItems.Add
        item.Text = ehist.StatusLogicalToDisplay(ehist.Status)
        item.SubItems(1) = ehist.FromDate
        item.SubItems(2) = ehist.ToDate
        ecount = ecount + 1
        ReDim Preserve EObj(ecount)
        Set EObj(ecount) = ehist
        i = i + 1
        Set ehist = Per.Status.GetAt(i)
    Loop
    clearEdit (Index)
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

Public Sub LoadETitle(Index As Integer)
    LoadETitleCombo
    LoadTTitleCombo
    Dim ehist As Object, tehist As Object
    Dim item As ListItem, ecount As Integer, i As Integer
    lvEObj(Index).View = lvwReport
    lvEObj(Index).FullRowSelect = True
    lvEObj(Index).ColumnHeaders.Clear
    lvEObj(Index).ColumnHeaders.Add , , "คำนำหน้า", 1400, lvwColumnLeft
    lvEObj(Index).ColumnHeaders.Add , , "Title", 1400, lvwColumnLeft
    lvEObj(Index).ColumnHeaders.Add , , "From date", 1200, lvwColumnCenter
    lvEObj(Index).ColumnHeaders.Add , , "To date", 1200, lvwColumnCenter
    lvEObj(Index).ListItems.Clear
    Erase EObj
    ecount = 0
    i = 1
    Set ehist = Per.ETitle.GetAt(1)
    Set tehist = Per.TTitle.GetAt(1)
    Do While Not ehist Is Nothing
        Set item = lvEObj(Index).ListItems.Add
        item.Text = tehist.TTitleLogicalToDisplay(tehist.TTitle)
        item.SubItems(1) = ehist.ETitleLogicalToDisplay(ehist.ETitle)
        item.SubItems(2) = ehist.FromDate
        item.SubItems(3) = ehist.ToDate
        ecount = ecount + 1
        ReDim Preserve EObj(ecount)
        Set EObj(ecount) = ehist
        i = i + 1
        Set ehist = Per.ETitle.GetAt(i)
        Set tehist = Per.TTitle.GetAt(i)
    Loop
    clearEdit (Index)
End Sub

Public Sub LoadAddress(Index As Integer)
    Dim ehist As Object, st As String
    Dim item As ListItem, ecount As Integer, i As Integer
    lvEObj(Index).View = lvwReport
    lvEObj(Index).FullRowSelect = True
    lvEObj(Index).ColumnHeaders.Clear
    lvEObj(Index).ColumnHeaders.Add , , "ที่อยู่", 2800, lvwColumnLeft
    lvEObj(Index).ColumnHeaders.Add , , "From date", 1200, lvwColumnCenter
    lvEObj(Index).ColumnHeaders.Add , , "To date", 1200, lvwColumnCenter
    lvEObj(Index).ListItems.Clear
    Erase EObj
    ecount = 0
    i = 1
    Set ehist = Per.Address.GetAt(1)
    Do While Not ehist Is Nothing
        Set item = lvEObj(Index).ListItems.Add
        st = ehist.AddNo
        If ehist.Soi <> "" Then st = st + " ซ." + ehist.Soi
        If ehist.Street <> "" Then st = st + " ถนน" + ehist.Street
        If ehist.MooTee <> "" Then st = st + " หมู่ที่" + ehist.MooTee
        If ehist.Tumbon <> "" Then st = st + " ต." + ehist.Tumbon
        st = st + " อ." + ehist.Amphur + " จ." + ehist.Province + " " + ehist.ZipCode
        item.Text = st
        item.SubItems(1) = ehist.FromDate
        item.SubItems(2) = ehist.ToDate
        ecount = ecount + 1
        ReDim Preserve EObj(ecount)
        Set EObj(ecount) = ehist
        i = i + 1
        Set ehist = Per.Address.GetAt(i)
    Loop
    clearEdit (Index)
End Sub

Public Sub LoadTelephone(Index As Integer)
    Dim ehist As Object
    Dim item As ListItem, ecount As Integer, i As Integer
    lvEObj(Index).View = lvwReport
    lvEObj(Index).FullRowSelect = True
    lvEObj(Index).ColumnHeaders.Clear
    lvEObj(Index).ColumnHeaders.Add , , "โทรศัพท์", 2100, lvwColumnLeft
    lvEObj(Index).ColumnHeaders.Add , , "From date", 1200, lvwColumnCenter
    lvEObj(Index).ColumnHeaders.Add , , "To date", 1200, lvwColumnCenter
    lvEObj(Index).ListItems.Clear
    Erase EObj
    ecount = 0
    i = 1
    Set ehist = Per.Telephone.GetAt(1)
    Do While Not ehist Is Nothing
        Set item = lvEObj(Index).ListItems.Add
        item.Text = ehist.Telephone
        item.SubItems(1) = ehist.FromDate
        item.SubItems(2) = ehist.ToDate
        ecount = ecount + 1
        ReDim Preserve EObj(ecount)
        Set EObj(ecount) = ehist
        i = i + 1
        Set ehist = Per.Telephone.GetAt(i)
    Loop
    clearEdit (Index)
End Sub

Public Sub LoadCellOrPager(Index As Integer)
    Dim ehist As Object
    Dim item As ListItem, ecount As Integer, i As Integer
    lvEObj(Index).View = lvwReport
    lvEObj(Index).FullRowSelect = True
    lvEObj(Index).ColumnHeaders.Clear
    lvEObj(Index).ColumnHeaders.Add , , "มือถือ / เพจเจอร์", 2100, lvwColumnLeft
    lvEObj(Index).ColumnHeaders.Add , , "From date", 1200, lvwColumnCenter
    lvEObj(Index).ColumnHeaders.Add , , "To date", 1200, lvwColumnCenter
    lvEObj(Index).ListItems.Clear
    Erase EObj
    ecount = 0
    i = 1
    Set ehist = Per.CellOrPager.GetAt(1)
    Do While Not ehist Is Nothing
        Set item = lvEObj(Index).ListItems.Add
        item.Text = ehist.CellOrPager
        item.SubItems(1) = ehist.FromDate
        item.SubItems(2) = ehist.ToDate
        ecount = ecount + 1
        ReDim Preserve EObj(ecount)
        Set EObj(ecount) = ehist
        i = i + 1
        Set ehist = Per.CellOrPager.GetAt(i)
    Loop
    clearEdit (Index)
    If lvEObj(Index).ListItems.Count = 0 Then
        cmdInsert(Index).Enabled = False
        cmdDelete(Index).Enabled = False
        cmdUpdate(Index).Enabled = False
    Else
        cmdInsert(Index).Enabled = True
        cmdDelete(Index).Enabled = True
        cmdUpdate(Index).Enabled = True
    End If
End Sub

Public Sub LoadTaxNo(Index As Integer)
    Dim ehist As Object
    Dim item As ListItem, ecount As Integer, i As Integer
    lvEObj(Index).View = lvwReport
    lvEObj(Index).FullRowSelect = True
    lvEObj(Index).ColumnHeaders.Clear
    lvEObj(Index).ColumnHeaders.Add , , "หมายเลขประจำตัวผู้เสียภาษี", 2100, lvwColumnLeft
    lvEObj(Index).ColumnHeaders.Add , , "From date", 1200, lvwColumnCenter
    lvEObj(Index).ColumnHeaders.Add , , "To date", 1200, lvwColumnCenter
    lvEObj(Index).ListItems.Clear
    Erase EObj
    ecount = 0
    i = 1
    Set ehist = Per.TaxNo.GetAt(1)
    Do While Not ehist Is Nothing
        Set item = lvEObj(Index).ListItems.Add
        item.Text = ehist.TaxNo
        item.SubItems(1) = ehist.FromDate
        item.SubItems(2) = ehist.ToDate
        ecount = ecount + 1
        ReDim Preserve EObj(ecount)
        Set EObj(ecount) = ehist
        i = i + 1
        Set ehist = Per.TaxNo.GetAt(i)
    Loop
    clearEdit (Index)
End Sub

Public Sub LoadBankNo(Index As Integer)
    Dim ehist As Object
    Dim item As ListItem, ecount As Integer, i As Integer
    lvEObj(Index).View = lvwReport
    lvEObj(Index).FullRowSelect = True
    lvEObj(Index).ColumnHeaders.Clear
    lvEObj(Index).ColumnHeaders.Add , , "หมายเลขบัญชีธนาคาร", 2100, lvwColumnLeft
    lvEObj(Index).ColumnHeaders.Add , , "From date", 1200, lvwColumnCenter
    lvEObj(Index).ColumnHeaders.Add , , "To date", 1200, lvwColumnCenter
    lvEObj(Index).ListItems.Clear
    Erase EObj
    ecount = 0
    i = 1
    Set ehist = Per.BankNo.GetAt(1)
    Do While Not ehist Is Nothing
        Set item = lvEObj(Index).ListItems.Add
        item.Text = ehist.BankNo
        item.SubItems(1) = ehist.FromDate
        item.SubItems(2) = ehist.ToDate
        ecount = ecount + 1
        ReDim Preserve EObj(ecount)
        Set EObj(ecount) = ehist
        i = i + 1
        Set ehist = Per.BankNo.GetAt(i)
    Loop
    clearEdit (Index)
End Sub

Public Sub LoadSocialNo(Index As Integer)
    Dim ehist As Object
    Dim item As ListItem, ecount As Integer, i As Integer
    lvEObj(Index).View = lvwReport
    lvEObj(Index).FullRowSelect = True
    lvEObj(Index).ColumnHeaders.Clear
    lvEObj(Index).ColumnHeaders.Add , , "หมายเลขประกันสังคม", 2100, lvwColumnLeft
    lvEObj(Index).ColumnHeaders.Add , , "From date", 1200, lvwColumnCenter
    lvEObj(Index).ColumnHeaders.Add , , "To date", 1200, lvwColumnCenter
    lvEObj(Index).ListItems.Clear
    Erase EObj
    ecount = 0
    i = 1
    Set ehist = Per.SocialNo.GetAt(1)
    Do While Not ehist Is Nothing
        Set item = lvEObj(Index).ListItems.Add
        item.Text = ehist.SocialNo
        item.SubItems(1) = ehist.FromDate
        item.SubItems(2) = ehist.ToDate
        ecount = ecount + 1
        ReDim Preserve EObj(ecount)
        Set EObj(ecount) = ehist
        i = i + 1
        Set ehist = Per.SocialNo.GetAt(i)
    Loop
    clearEdit (Index)
End Sub

