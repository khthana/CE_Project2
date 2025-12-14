VERSION 5.00
Object = "{BF448208-70DE-11CF-947B-0020AF75C4BA}#1.0#0"; "navctl32.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form register 
   BackColor       =   &H8000000B&
   Caption         =   "REGISTER"
   ClientHeight    =   9600
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11880
   ForeColor       =   &H8000000F&
   Icon            =   "register.frx":0000
   LinkTopic       =   "Form1"
   Picture         =   "register.frx":030A
   ScaleHeight     =   9600
   ScaleWidth      =   11880
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmd_exit 
      Caption         =   "EXIT"
      Height          =   615
      Left            =   10080
      Picture         =   "register.frx":17667C
      Style           =   1  'Graphical
      TabIndex        =   72
      Top             =   8880
      Width           =   1335
   End
   Begin VB.TextBox tx_datetime 
      BackColor       =   &H8000000B&
      Height          =   285
      Left            =   9840
      TabIndex        =   141
      Top             =   240
      Width           =   1455
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   8400
      Top             =   120
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   8175
      Left            =   360
      TabIndex        =   74
      Top             =   600
      Width           =   11055
      _ExtentX        =   19500
      _ExtentY        =   14420
      _Version        =   393216
      Tab             =   1
      TabsPerRow      =   5
      TabHeight       =   882
      TabMaxWidth     =   5
      BackColor       =   -2147483638
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TabCaption(0)   =   " Query"
      TabPicture(0)   =   "register.frx":176986
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "Frame13"
      Tab(0).Control(1)=   "frq_cond"
      Tab(0).Control(2)=   "Frame6"
      Tab(0).ControlCount=   3
      TabCaption(1)   =   "Insert"
      TabPicture(1)   =   "register.frx":176CA0
      Tab(1).ControlEnabled=   -1  'True
      Tab(1).Control(0)=   "confirmi"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "cmi_clearall"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).Control(2)=   "Frame1"
      Tab(1).Control(2).Enabled=   0   'False
      Tab(1).Control(3)=   "Frame2"
      Tab(1).Control(3).Enabled=   0   'False
      Tab(1).Control(4)=   "Frame3"
      Tab(1).Control(4).Enabled=   0   'False
      Tab(1).Control(5)=   "Frame4"
      Tab(1).Control(5).Enabled=   0   'False
      Tab(1).Control(6)=   "Frame5"
      Tab(1).Control(6).Enabled=   0   'False
      Tab(1).ControlCount=   7
      TabCaption(2)   =   "Edit and Update"
      TabPicture(2)   =   "register.frx":176FBA
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "cbe_hn"
      Tab(2).Control(1)=   "ch_med"
      Tab(2).Control(2)=   "ch_dis"
      Tab(2).Control(3)=   "ch_tel"
      Tab(2).Control(4)=   "ch_add"
      Tab(2).Control(5)=   "cme_clear"
      Tab(2).Control(6)=   "cme_change"
      Tab(2).Control(7)=   "op_nontemp"
      Tab(2).Control(8)=   "op_temp"
      Tab(2).Control(9)=   "fre_med"
      Tab(2).Control(10)=   "fre_dis"
      Tab(2).Control(11)=   "fre_tel"
      Tab(2).Control(12)=   "fre_add"
      Tab(2).Control(13)=   "fre_name"
      Tab(2).Control(14)=   "Label30"
      Tab(2).Control(15)=   "Label27"
      Tab(2).ControlCount=   16
      Begin VB.ComboBox cbe_hn 
         Height          =   315
         Left            =   -74040
         Sorted          =   -1  'True
         TabIndex        =   42
         Top             =   720
         Width           =   1935
      End
      Begin VB.Frame Frame6 
         Caption         =   "Result"
         Enabled         =   0   'False
         Height          =   5535
         Left            =   -74760
         TabIndex        =   135
         Top             =   2640
         Width           =   10335
         Begin VB.Frame Frame7 
            Caption         =   "รูปถ่าย"
            Height          =   3615
            Left            =   8400
            TabIndex        =   136
            Top             =   1920
            Width           =   1935
            Begin VB.TextBox txq_to 
               Enabled         =   0   'False
               Height          =   285
               Left            =   360
               TabIndex        =   138
               Top             =   3120
               Width           =   1455
            End
            Begin VB.TextBox txq_from 
               Enabled         =   0   'False
               Height          =   285
               Left            =   360
               TabIndex        =   137
               Top             =   2520
               Width           =   1455
            End
            Begin VB.CommandButton cmq_next 
               Caption         =   ">>"
               Enabled         =   0   'False
               Height          =   255
               Left            =   1320
               TabIndex        =   20
               Top             =   1920
               Width           =   375
            End
            Begin VB.CommandButton cmq_back 
               Caption         =   "<<"
               Enabled         =   0   'False
               Height          =   255
               Left            =   240
               TabIndex        =   19
               Top             =   1920
               Width           =   375
            End
            Begin VB.Image pic_q 
               Height          =   1575
               Left            =   240
               Stretch         =   -1  'True
               Top             =   240
               Width           =   1455
            End
            Begin VB.Label Label29 
               Caption         =   "To"
               Height          =   255
               Left            =   120
               TabIndex        =   140
               Top             =   2880
               Width           =   375
            End
            Begin VB.Label Label28 
               Caption         =   "From"
               Height          =   255
               Left            =   120
               TabIndex        =   139
               Top             =   2280
               Width           =   375
            End
         End
         Begin VB.ListBox lsq2 
            Height          =   2010
            ItemData        =   "register.frx":1772D4
            Left            =   240
            List            =   "register.frx":1772F3
            TabIndex        =   16
            Top             =   2400
            Width           =   1575
         End
         Begin VB.CommandButton cmq_querry2 
            Caption         =   "Query >>"
            Height          =   495
            Left            =   1920
            TabIndex        =   17
            Top             =   3000
            Width           =   1215
         End
         Begin MSComctlLib.ListView lsq3 
            Height          =   2655
            Left            =   3360
            TabIndex        =   18
            Top             =   2400
            Width           =   4935
            _ExtentX        =   8705
            _ExtentY        =   4683
            View            =   3
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            GridLines       =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   1
            NumItems        =   3
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "Attribute"
               Object.Width           =   3263
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Text            =   "From"
               Object.Width           =   2646
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Text            =   "To"
               Object.Width           =   2646
            EndProperty
         End
         Begin MSComctlLib.ListView lsq1 
            Height          =   1455
            Left            =   240
            TabIndex        =   15
            Top             =   360
            Width           =   9975
            _ExtentX        =   17595
            _ExtentY        =   2566
            View            =   3
            LabelEdit       =   1
            LabelWrap       =   -1  'True
            HideSelection   =   0   'False
            FullRowSelect   =   -1  'True
            GridLines       =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   1
            NumItems        =   13
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "HN"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Text            =   "NAME"
               Object.Width           =   1764
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Text            =   "SURNAME"
               Object.Width           =   1764
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Text            =   "BIRTHDATE"
               Object.Width           =   1764
            EndProperty
            BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   4
               Text            =   "SEX"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   5
               Text            =   "IDNUMBER"
               Object.Width           =   1764
            EndProperty
            BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   6
               Text            =   "BG"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   7
               Text            =   "ADDRESS"
               Object.Width           =   5292
            EndProperty
            BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   8
               Text            =   "TEL_NUMBER"
               Object.Width           =   2646
            EndProperty
            BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   9
               Text            =   "DISEASE"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   10
               Text            =   "ALERGY_MEDICINE"
               Object.Width           =   4410
            EndProperty
            BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   11
               Text            =   "D.N."
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(13) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   12
               Text            =   "A.N."
               Object.Width           =   882
            EndProperty
         End
      End
      Begin VB.Frame frq_cond 
         Caption         =   "Condition"
         Height          =   855
         Left            =   -74640
         TabIndex        =   128
         Top             =   600
         Width           =   10335
         Begin VB.OptionButton opq_name 
            Caption         =   "ชื่อ"
            Height          =   255
            Left            =   3720
            TabIndex        =   2
            Top             =   360
            Width           =   495
         End
         Begin VB.OptionButton opq_hn 
            Caption         =   "H.N."
            Height          =   255
            Left            =   600
            TabIndex        =   0
            Top             =   360
            Value           =   -1  'True
            Width           =   735
         End
         Begin VB.ComboBox cbq_sur 
            Enabled         =   0   'False
            Height          =   315
            Left            =   6840
            Sorted          =   -1  'True
            TabIndex        =   4
            Top             =   360
            Width           =   1815
         End
         Begin VB.ComboBox cbq_name 
            Enabled         =   0   'False
            Height          =   315
            ItemData        =   "register.frx":177351
            Left            =   4200
            List            =   "register.frx":177353
            Sorted          =   -1  'True
            TabIndex        =   3
            Top             =   360
            Width           =   1815
         End
         Begin VB.ComboBox cbq_hn 
            Height          =   315
            ItemData        =   "register.frx":177355
            Left            =   1320
            List            =   "register.frx":177357
            Sorted          =   -1  'True
            TabIndex        =   1
            Text            =   "cbq_hn"
            Top             =   360
            Width           =   1695
         End
         Begin VB.Label Label34 
            Caption         =   "นามสกุล"
            BeginProperty Font 
               Name            =   "CordiaUPC"
               Size            =   12
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   6240
            TabIndex        =   129
            Top             =   360
            Width           =   615
         End
      End
      Begin VB.CheckBox ch_med 
         Caption         =   "Check8"
         Height          =   255
         Left            =   -68640
         TabIndex        =   67
         Top             =   4320
         Width           =   255
      End
      Begin VB.CheckBox ch_dis 
         Caption         =   "Check7"
         Height          =   255
         Left            =   -68280
         TabIndex        =   64
         Top             =   960
         Width           =   255
      End
      Begin VB.CheckBox ch_tel 
         Caption         =   "Check6"
         Height          =   255
         Left            =   -73560
         TabIndex        =   61
         Top             =   6360
         Width           =   255
      End
      Begin VB.CheckBox ch_add 
         Caption         =   "Check5"
         Height          =   255
         Left            =   -74280
         TabIndex        =   54
         Top             =   4320
         Width           =   255
      End
      Begin VB.Frame Frame5 
         Height          =   3135
         Left            =   240
         TabIndex        =   117
         Top             =   960
         Width           =   5175
         Begin MSComDlg.CommonDialog Browse_Cmdialog 
            Left            =   4560
            Top             =   840
            _ExtentX        =   847
            _ExtentY        =   847
            _Version        =   393216
         End
         Begin VB.TextBox txi_sur 
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   7.5
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   270
            Left            =   3240
            TabIndex        =   22
            Top             =   360
            Width           =   1695
         End
         Begin VB.TextBox txi_birth 
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   9.75
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   840
            TabIndex        =   25
            Top             =   1320
            Width           =   1455
         End
         Begin VB.OptionButton opi_male 
            Caption         =   "ชาย"
            BeginProperty Font 
               Name            =   "CordiaUPC"
               Size            =   12
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   840
            TabIndex        =   118
            Top             =   1800
            Value           =   -1  'True
            Width           =   855
         End
         Begin VB.OptionButton opi_female 
            Caption         =   "หญิง"
            BeginProperty Font 
               Name            =   "CordiaUPC"
               Size            =   12
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   1680
            TabIndex        =   26
            Top             =   1800
            Width           =   735
         End
         Begin VB.TextBox txi_id 
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   9.75
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   1920
            MaxLength       =   13
            TabIndex        =   27
            Top             =   2160
            Width           =   1815
         End
         Begin VB.TextBox txi_gblood 
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   7.5
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   1080
            TabIndex        =   28
            Top             =   2640
            Width           =   375
         End
         Begin VB.TextBox txi_name 
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   7.5
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   600
            TabIndex        =   21
            Top             =   360
            Width           =   1575
         End
         Begin VB.TextBox txi_pic 
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   7.5
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   600
            TabIndex        =   23
            Text            =   "{Default}"
            Top             =   840
            Width           =   2775
         End
         Begin VB.CommandButton Browsei 
            Caption         =   "Browse"
            Height          =   375
            Left            =   3480
            TabIndex        =   24
            Top             =   840
            Width           =   855
         End
         Begin VB.Label Label13 
            Caption         =   "*วันเกิด"
            BeginProperty Font 
               Name            =   "CordiaUPC"
               Size            =   12
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   240
            TabIndex        =   125
            Top             =   1320
            Width           =   495
         End
         Begin VB.Label Label12 
            Caption         =   "*เพศ"
            BeginProperty Font 
               Name            =   "CordiaUPC"
               Size            =   12
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   240
            TabIndex        =   124
            Top             =   1800
            Width           =   375
         End
         Begin VB.Label Label11 
            Caption         =   "*เลขประจำตัวประชาชน"
            BeginProperty Font 
               Name            =   "CordiaUPC"
               Size            =   12
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   240
            TabIndex        =   123
            Top             =   2160
            Width           =   1695
         End
         Begin VB.Label Label10 
            Caption         =   "กรุ๊ปเลือด"
            BeginProperty Font 
               Name            =   "CordiaUPC"
               Size            =   12
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   360
            TabIndex        =   122
            Top             =   2640
            Width           =   735
         End
         Begin VB.Label Label9 
            Caption         =   "*ชื่อ"
            Height          =   255
            Left            =   240
            TabIndex        =   121
            Top             =   360
            Width           =   495
         End
         Begin VB.Label Label8 
            Caption         =   "รูป"
            Height          =   255
            Left            =   240
            TabIndex        =   120
            Top             =   840
            Width           =   255
         End
         Begin VB.Label Label7 
            Caption         =   "*นามสกุล"
            Height          =   255
            Left            =   2520
            TabIndex        =   119
            Top             =   360
            Width           =   735
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "ที่อยู่"
         Height          =   1815
         Left            =   240
         TabIndex        =   110
         Top             =   4320
         Width           =   5175
         Begin VB.TextBox txi_homeid 
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   7.5
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   1080
            TabIndex        =   29
            Top             =   360
            Width           =   1575
         End
         Begin VB.TextBox txi_road 
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   7.5
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   3360
            TabIndex        =   30
            Top             =   360
            Width           =   1575
         End
         Begin VB.TextBox txi_tambon 
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   7.5
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   960
            TabIndex        =   31
            Top             =   840
            Width           =   1455
         End
         Begin VB.TextBox txi_ampher 
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   7.5
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   3360
            TabIndex        =   32
            Top             =   840
            Width           =   1575
         End
         Begin VB.TextBox txi_janwat 
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   7.5
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   960
            TabIndex        =   33
            Top             =   1320
            Width           =   1455
         End
         Begin VB.TextBox txi_zip 
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   7.5
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   285
            Left            =   3840
            TabIndex        =   34
            Top             =   1320
            Width           =   1095
         End
         Begin VB.Label Label6 
            Caption         =   "*บ้านเลขที่"
            Height          =   255
            Left            =   360
            TabIndex        =   116
            Top             =   360
            Width           =   735
         End
         Begin VB.Label Label5 
            Caption         =   "*ถนน"
            Height          =   255
            Left            =   2760
            TabIndex        =   115
            Top             =   360
            Width           =   495
         End
         Begin VB.Label Label4 
            Caption         =   "*ตำบล"
            Height          =   255
            Left            =   360
            TabIndex        =   114
            Top             =   840
            Width           =   615
         End
         Begin VB.Label Label3 
            Caption         =   "*อำเภอ"
            Height          =   255
            Left            =   2760
            TabIndex        =   113
            Top             =   840
            Width           =   495
         End
         Begin VB.Label Label2 
            Caption         =   "*จังหวัด"
            Height          =   255
            Left            =   360
            TabIndex        =   112
            Top             =   1320
            Width           =   615
         End
         Begin VB.Label Label1 
            Caption         =   "*รหัสไปรษณีย์"
            Height          =   255
            Left            =   2760
            TabIndex        =   111
            Top             =   1320
            Width           =   975
         End
      End
      Begin VB.Frame Frame3 
         Caption         =   "เบอร์โทรศัพท์"
         Height          =   1575
         Left            =   240
         TabIndex        =   107
         Top             =   6360
         Width           =   5175
         Begin VB.TextBox txi_phoneadd 
            Height          =   285
            Left            =   240
            TabIndex        =   35
            Top             =   360
            Width           =   1695
         End
         Begin VB.CommandButton cmit_add 
            Caption         =   "Add >>"
            Height          =   375
            Left            =   2160
            TabIndex        =   36
            Top             =   360
            Width           =   975
         End
         Begin VB.CommandButton cmit_rem 
            Caption         =   "Remove"
            Height          =   375
            Left            =   2160
            TabIndex        =   109
            Top             =   960
            Width           =   975
         End
         Begin VB.ListBox lsi_phone 
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   7.5
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   1230
            ItemData        =   "register.frx":177359
            Left            =   3240
            List            =   "register.frx":17735B
            TabIndex        =   108
            Top             =   240
            Width           =   1815
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "โรค"
         Height          =   3135
         Left            =   5640
         TabIndex        =   104
         Top             =   960
         Width           =   5055
         Begin VB.ListBox lsi_disadd 
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   7.5
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   2400
            ItemData        =   "register.frx":17735D
            Left            =   240
            List            =   "register.frx":17735F
            TabIndex        =   37
            Top             =   480
            Width           =   1815
         End
         Begin VB.ListBox lsi_dis 
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   7.5
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   1230
            ItemData        =   "register.frx":177361
            Left            =   3120
            List            =   "register.frx":177363
            TabIndex        =   106
            Top             =   480
            Width           =   1695
         End
         Begin VB.CommandButton cmid_add 
            Caption         =   "Add >>"
            Height          =   375
            Left            =   2160
            TabIndex        =   38
            Top             =   600
            Width           =   855
         End
         Begin VB.CommandButton cmie_rem 
            Caption         =   "Remove"
            Height          =   375
            Left            =   2160
            TabIndex        =   105
            Top             =   1200
            Width           =   855
         End
      End
      Begin VB.Frame Frame1 
         Caption         =   "ยาที่แพ้"
         Height          =   2655
         Left            =   5640
         TabIndex        =   101
         Top             =   4320
         Width           =   5055
         Begin VB.ListBox lsi_medadd 
            Columns         =   1
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   7.5
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   2010
            ItemData        =   "register.frx":177365
            Left            =   240
            List            =   "register.frx":177367
            TabIndex        =   39
            Top             =   360
            Width           =   1815
         End
         Begin VB.ListBox lsi_med 
            BeginProperty Font 
               Name            =   "MS Dialog"
               Size            =   7.5
               Charset         =   222
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   1230
            ItemData        =   "register.frx":177369
            Left            =   3120
            List            =   "register.frx":17736B
            TabIndex        =   103
            Top             =   360
            Width           =   1695
         End
         Begin VB.CommandButton cmim_add 
            Caption         =   "Add >>"
            Height          =   375
            Left            =   2160
            TabIndex        =   40
            Top             =   480
            Width           =   855
         End
         Begin VB.CommandButton cmim_rem 
            Caption         =   "Remove"
            Height          =   375
            Left            =   2160
            TabIndex        =   102
            Top             =   1080
            Width           =   855
         End
      End
      Begin VB.CommandButton cme_clear 
         Caption         =   "Clear All"
         Height          =   735
         Left            =   -65640
         Picture         =   "register.frx":17736D
         Style           =   1  'Graphical
         TabIndex        =   71
         Top             =   7080
         Width           =   1335
      End
      Begin VB.CommandButton cme_change 
         Caption         =   "Confirm Changed"
         Height          =   735
         Left            =   -67320
         Picture         =   "register.frx":177677
         Style           =   1  'Graphical
         TabIndex        =   70
         Top             =   7080
         Width           =   1455
      End
      Begin VB.OptionButton op_nontemp 
         Caption         =   "EDIT"
         Height          =   375
         Left            =   -69000
         TabIndex        =   43
         Top             =   7440
         Width           =   1335
      End
      Begin VB.OptionButton op_temp 
         Caption         =   "UPDATE"
         Height          =   375
         Left            =   -69000
         TabIndex        =   100
         Top             =   7080
         Value           =   -1  'True
         Width           =   1095
      End
      Begin VB.Frame fre_med 
         Caption         =   "ยาที่แพ้"
         Enabled         =   0   'False
         Height          =   2655
         Left            =   -69360
         TabIndex        =   97
         Top             =   4320
         Width           =   5055
         Begin VB.CommandButton cme_remmed 
            Caption         =   "Remove"
            Enabled         =   0   'False
            Height          =   375
            Left            =   2160
            TabIndex        =   69
            Top             =   600
            Width           =   855
         End
         Begin VB.CommandButton cme_addmed 
            Caption         =   "<< Undo"
            Enabled         =   0   'False
            Height          =   375
            Left            =   2160
            TabIndex        =   99
            Top             =   1200
            Width           =   855
         End
         Begin VB.ListBox lse_med 
            BackColor       =   &H8000000B&
            Enabled         =   0   'False
            Height          =   2010
            ItemData        =   "register.frx":177981
            Left            =   240
            List            =   "register.frx":177983
            TabIndex        =   68
            Top             =   360
            Width           =   1815
         End
         Begin VB.ListBox lse_medrem 
            BackColor       =   &H8000000B&
            Enabled         =   0   'False
            Height          =   1815
            ItemData        =   "register.frx":177985
            Left            =   3120
            List            =   "register.frx":177987
            TabIndex        =   98
            Top             =   600
            Width           =   1695
         End
         Begin VB.Label Label33 
            Caption         =   "REMOVED"
            Height          =   255
            Left            =   3600
            TabIndex        =   145
            Top             =   360
            Width           =   855
         End
      End
      Begin VB.Frame fre_dis 
         Caption         =   "โรคประจำตัว"
         Enabled         =   0   'False
         Height          =   3135
         Left            =   -69360
         TabIndex        =   94
         Top             =   960
         Width           =   5055
         Begin VB.CommandButton cme_remdis 
            Caption         =   "Remove "
            Enabled         =   0   'False
            Height          =   375
            Left            =   2160
            TabIndex        =   66
            Top             =   720
            Width           =   855
         End
         Begin VB.CommandButton cme_adddis 
            Caption         =   "<< Undo"
            Enabled         =   0   'False
            Height          =   375
            Left            =   2160
            TabIndex        =   96
            Top             =   1320
            Width           =   855
         End
         Begin VB.ListBox lse_dis 
            BackColor       =   &H8000000B&
            Enabled         =   0   'False
            Height          =   2205
            ItemData        =   "register.frx":177989
            Left            =   240
            List            =   "register.frx":17798B
            TabIndex        =   65
            Top             =   480
            Width           =   1815
         End
         Begin VB.ListBox lse_disrem 
            BackColor       =   &H8000000B&
            Enabled         =   0   'False
            Height          =   2010
            ItemData        =   "register.frx":17798D
            Left            =   3120
            List            =   "register.frx":17798F
            TabIndex        =   95
            Top             =   720
            Width           =   1695
         End
         Begin VB.Label Label32 
            Caption         =   "REMOVED"
            Height          =   255
            Left            =   3480
            TabIndex        =   144
            Top             =   480
            Width           =   975
         End
      End
      Begin VB.Frame fre_tel 
         Caption         =   "เบอร์โทรศัพท์"
         Enabled         =   0   'False
         Height          =   1575
         Left            =   -74760
         TabIndex        =   92
         Top             =   6360
         Width           =   5175
         Begin VB.ListBox lse_phonerem 
            BackColor       =   &H8000000B&
            Enabled         =   0   'False
            Height          =   840
            ItemData        =   "register.frx":177991
            Left            =   3120
            List            =   "register.frx":177993
            TabIndex        =   143
            Top             =   480
            Width           =   1815
         End
         Begin VB.ListBox lse_phone 
            BackColor       =   &H8000000B&
            Enabled         =   0   'False
            Height          =   1230
            ItemData        =   "register.frx":177995
            Left            =   120
            List            =   "register.frx":177997
            TabIndex        =   62
            Top             =   240
            Width           =   1815
         End
         Begin VB.CommandButton cme_remphone 
            Caption         =   "Remove"
            Enabled         =   0   'False
            Height          =   375
            Left            =   2040
            TabIndex        =   63
            Top             =   360
            Width           =   975
         End
         Begin VB.CommandButton cme_addphone 
            Caption         =   "<< Undo"
            Enabled         =   0   'False
            Height          =   375
            Left            =   2040
            TabIndex        =   93
            Top             =   960
            Width           =   975
         End
         Begin VB.Label Label35 
            Caption         =   "REMOVED"
            Height          =   255
            Left            =   3480
            TabIndex        =   146
            Top             =   240
            Width           =   975
         End
      End
      Begin VB.Frame fre_add 
         Caption         =   "ที่อยู่"
         Enabled         =   0   'False
         Height          =   1815
         Left            =   -74760
         TabIndex        =   85
         Top             =   4320
         Width           =   5175
         Begin VB.TextBox txe_zip 
            BackColor       =   &H8000000B&
            Height          =   285
            Left            =   3840
            TabIndex        =   60
            Top             =   1320
            Width           =   1095
         End
         Begin VB.TextBox txe_janwat 
            BackColor       =   &H8000000B&
            Height          =   285
            Left            =   960
            TabIndex        =   59
            Top             =   1320
            Width           =   1455
         End
         Begin VB.TextBox txe_ampher 
            BackColor       =   &H8000000B&
            Height          =   285
            Left            =   3360
            TabIndex        =   58
            Top             =   840
            Width           =   1575
         End
         Begin VB.TextBox txe_tambon 
            BackColor       =   &H8000000B&
            Height          =   285
            Left            =   960
            TabIndex        =   57
            Top             =   840
            Width           =   1455
         End
         Begin VB.TextBox txe_road 
            BackColor       =   &H8000000B&
            Height          =   285
            Left            =   3360
            TabIndex        =   56
            Top             =   360
            Width           =   1575
         End
         Begin VB.TextBox txe_homeid 
            BackColor       =   &H8000000B&
            Height          =   285
            Left            =   1080
            TabIndex        =   55
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label Label21 
            Caption         =   "*รหัสไปรษณีย์"
            Height          =   255
            Left            =   2760
            TabIndex        =   91
            Top             =   1320
            Width           =   975
         End
         Begin VB.Label Label22 
            Caption         =   "*จังหวัด"
            Height          =   255
            Left            =   240
            TabIndex        =   90
            Top             =   1320
            Width           =   615
         End
         Begin VB.Label Label23 
            Caption         =   "*อำเภอ"
            Height          =   255
            Left            =   2760
            TabIndex        =   89
            Top             =   840
            Width           =   495
         End
         Begin VB.Label Label24 
            Caption         =   "*ตำบล"
            Height          =   255
            Left            =   240
            TabIndex        =   88
            Top             =   840
            Width           =   615
         End
         Begin VB.Label Label25 
            Caption         =   "*ถนน"
            Height          =   255
            Left            =   2760
            TabIndex        =   87
            Top             =   360
            Width           =   495
         End
         Begin VB.Label Label26 
            Caption         =   "*บ้านเลขที่"
            Height          =   255
            Left            =   240
            TabIndex        =   86
            Top             =   360
            Width           =   735
         End
      End
      Begin VB.Frame fre_name 
         Height          =   3135
         Left            =   -74760
         TabIndex        =   76
         Top             =   960
         Width           =   5175
         Begin MSComDlg.CommonDialog cmd_dialog 
            Left            =   4200
            Top             =   840
            _ExtentX        =   847
            _ExtentY        =   847
            _Version        =   393216
         End
         Begin VB.CheckBox ch_pic 
            Caption         =   "Check1"
            Height          =   255
            Left            =   120
            TabIndex        =   48
            Top             =   840
            Width           =   255
         End
         Begin VB.CheckBox ch_name 
            Caption         =   "Check1"
            Height          =   255
            Left            =   120
            TabIndex        =   44
            Top             =   360
            Width           =   255
         End
         Begin VB.CommandButton cme_browse 
            Caption         =   "Browse"
            Height          =   375
            Left            =   3120
            TabIndex        =   49
            Top             =   840
            Width           =   855
         End
         Begin VB.TextBox txe_pic 
            BackColor       =   &H8000000B&
            Enabled         =   0   'False
            Height          =   285
            Left            =   720
            TabIndex        =   73
            Top             =   840
            Width           =   2055
         End
         Begin VB.TextBox txe_name 
            BackColor       =   &H8000000B&
            Enabled         =   0   'False
            Height          =   285
            Left            =   720
            TabIndex        =   45
            Top             =   360
            Width           =   1575
         End
         Begin VB.TextBox txe_gblood 
            BackColor       =   &H8000000B&
            Enabled         =   0   'False
            Height          =   285
            Left            =   1080
            TabIndex        =   53
            Top             =   2640
            Width           =   375
         End
         Begin VB.TextBox txe_id 
            BackColor       =   &H8000000B&
            Enabled         =   0   'False
            Height          =   285
            Left            =   1920
            MaxLength       =   13
            TabIndex        =   52
            Top             =   2160
            Width           =   1815
         End
         Begin VB.OptionButton ope_female 
            Caption         =   "หญิง"
            Enabled         =   0   'False
            BeginProperty Font 
               Name            =   "CordiaUPC"
               Size            =   12
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   1680
            TabIndex        =   51
            Top             =   1800
            Width           =   735
         End
         Begin VB.OptionButton ope_male 
            Caption         =   "ชาย"
            Enabled         =   0   'False
            BeginProperty Font 
               Name            =   "CordiaUPC"
               Size            =   12
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   840
            TabIndex        =   77
            Top             =   1800
            Value           =   -1  'True
            Width           =   855
         End
         Begin VB.TextBox txe_birth 
            BackColor       =   &H8000000B&
            Enabled         =   0   'False
            Height          =   285
            Left            =   840
            TabIndex        =   50
            Top             =   1320
            Width           =   1455
         End
         Begin VB.TextBox txe_sur 
            BackColor       =   &H8000000B&
            Enabled         =   0   'False
            Height          =   285
            Left            =   3360
            TabIndex        =   47
            Top             =   360
            Width           =   1575
         End
         Begin VB.CheckBox ch_sur 
            Caption         =   "Check1"
            Height          =   255
            Left            =   2400
            TabIndex        =   46
            Top             =   360
            Width           =   255
         End
         Begin VB.Label Label20 
            Caption         =   "*นามสกุล"
            BeginProperty Font 
               Name            =   "CordiaUPC"
               Size            =   12
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   2640
            TabIndex        =   78
            Top             =   360
            Width           =   615
         End
         Begin VB.Label Label14 
            Caption         =   "รูป"
            Height          =   255
            Left            =   360
            TabIndex        =   84
            Top             =   840
            Width           =   255
         End
         Begin VB.Label Label15 
            Caption         =   "*ชื่อ"
            Height          =   255
            Left            =   360
            TabIndex        =   83
            Top             =   360
            Width           =   495
         End
         Begin VB.Label Label16 
            Caption         =   "กรุ๊ปเลือด"
            BeginProperty Font 
               Name            =   "CordiaUPC"
               Size            =   12
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   240
            TabIndex        =   82
            Top             =   2640
            Width           =   735
         End
         Begin VB.Label Label17 
            Caption         =   "*เลขประจำตัวประชาชน"
            BeginProperty Font 
               Name            =   "CordiaUPC"
               Size            =   12
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   240
            TabIndex        =   81
            Top             =   2160
            Width           =   1695
         End
         Begin VB.Label Label18 
            Caption         =   "*เพศ"
            BeginProperty Font 
               Name            =   "CordiaUPC"
               Size            =   12
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   240
            TabIndex        =   80
            Top             =   1800
            Width           =   495
         End
         Begin VB.Label Label19 
            Caption         =   "*วันเกิด"
            BeginProperty Font 
               Name            =   "CordiaUPC"
               Size            =   12
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   240
            TabIndex        =   79
            Top             =   1320
            Width           =   495
         End
      End
      Begin VB.CommandButton cmi_clearall 
         Caption         =   "Clear All"
         Height          =   615
         Left            =   8400
         TabIndex        =   75
         Top             =   7200
         Width           =   1095
      End
      Begin VB.CommandButton confirmi 
         Caption         =   "Confirm"
         Height          =   615
         Left            =   6600
         TabIndex        =   41
         Top             =   7200
         Width           =   1215
      End
      Begin VB.Frame Frame13 
         Caption         =   "Query Mode"
         Height          =   1215
         Left            =   -73920
         TabIndex        =   130
         Top             =   1440
         Width           =   8895
         Begin VB.TextBox txq_date2 
            Height          =   285
            HideSelection   =   0   'False
            Left            =   6360
            TabIndex        =   12
            Text            =   "31"
            Top             =   480
            Width           =   375
         End
         Begin VB.TextBox txq_month2 
            Height          =   285
            HideSelection   =   0   'False
            Left            =   5880
            TabIndex        =   11
            Text            =   "12"
            Top             =   480
            Width           =   375
         End
         Begin VB.TextBox txq_year2 
            Height          =   285
            HideSelection   =   0   'False
            Left            =   5280
            TabIndex        =   10
            Text            =   "9999"
            Top             =   480
            Width           =   495
         End
         Begin VB.TextBox txq_date 
            Height          =   285
            HideSelection   =   0   'False
            Left            =   4560
            TabIndex        =   9
            Text            =   "DD"
            Top             =   480
            Width           =   375
         End
         Begin VB.TextBox txq_month 
            Height          =   285
            HideSelection   =   0   'False
            Left            =   4080
            TabIndex        =   8
            Text            =   "MM"
            Top             =   480
            Width           =   375
         End
         Begin VB.TextBox txq_year 
            Height          =   285
            HideSelection   =   0   'False
            Left            =   3480
            TabIndex        =   7
            Text            =   "YYYY"
            Top             =   480
            Width           =   495
         End
         Begin VB.OptionButton opq_nonsequenced 
            Caption         =   "ค้นหาทั้งหมด (Non-Sequenced)"
            Enabled         =   0   'False
            Height          =   255
            Left            =   360
            TabIndex        =   13
            Top             =   840
            Width           =   2535
         End
         Begin VB.OptionButton opq_ptime 
            Caption         =   "ตามช่วงเวลา (Sequenced)"
            Height          =   375
            Left            =   360
            TabIndex        =   6
            Top             =   480
            Width           =   2175
         End
         Begin VB.OptionButton opq_current 
            Caption         =   "Current"
            Height          =   255
            Left            =   360
            TabIndex        =   5
            Top             =   240
            Value           =   -1  'True
            Width           =   855
         End
         Begin VB.CommandButton cmq_query1 
            Caption         =   "Query"
            Enabled         =   0   'False
            Height          =   495
            Left            =   7320
            TabIndex        =   14
            Top             =   360
            Width           =   1215
         End
         Begin VB.Label Label37 
            Caption         =   "FROM              /         /           TO            /         /"
            Height          =   255
            Left            =   2880
            TabIndex        =   147
            Top             =   480
            Width           =   3495
         End
         Begin VB.Label Label36 
            Caption         =   "-"
            Height          =   255
            Left            =   2400
            TabIndex        =   134
            Top             =   480
            Width           =   135
         End
      End
      Begin VB.Label Label30 
         Caption         =   "H.N."
         Height          =   255
         Left            =   -74520
         TabIndex        =   127
         Top             =   720
         Width           =   375
      End
      Begin VB.Label Label27 
         Caption         =   "Hint ::  If you want to change value in Temporal Mode, you have to check box before."
         Height          =   255
         Left            =   -70320
         TabIndex        =   126
         Top             =   7920
         Width           =   6135
      End
   End
   Begin Navctl32Lib.NavControl patience_nav 
      Height          =   600
      Left            =   0
      TabIndex        =   132
      Top             =   0
      Visible         =   0   'False
      Width           =   1350
      _Version        =   65536
      _ExtentX        =   2381
      _ExtentY        =   1058
      _StockProps     =   4
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DOF             =   -1  'True
      ModelFile       =   "D:\hospital_install\nuvohospital_vb\nuvo_hospital.MLT"
      DataPath        =   ""
      Table           =   "patience"
      DataGroup       =   "patience"
      DefaultButtonSize=   1
      SaveButtonVisible=   -1  'True
      QueryButtonVisible=   -1  'True
      QBEButtonVisible=   -1  'True
      InsertButtonVisible=   -1  'True
      DeleteButtonVisible=   -1  'True
      LayoutMode      =   1
      StatusForeColor =   -2147483630
      ControlCount    =   14
      Mode01LastWidth =   90
      Mode01LastHeight=   40
      Ctrl0Style      =   1
      Ctrl0Caption    =   ""
      Ctrl0Width      =   30
      Ctrl0Height     =   20
      Ctrl1ID         =   1
      Ctrl1Style      =   1
      Ctrl1Caption    =   ""
      Ctrl1Left       =   26
      Ctrl1Width      =   31
      Ctrl1Height     =   20
      Ctrl2ID         =   2
      Ctrl2Style      =   1
      Ctrl2Caption    =   ""
      Ctrl2Left       =   57
      Ctrl2Width      =   31
      Ctrl2Height     =   20
      Ctrl3ID         =   3
      Ctrl3Style      =   1
      Ctrl3Caption    =   ""
      Ctrl3Left       =   88
      Ctrl3Width      =   31
      Ctrl3Height     =   20
      Ctrl4ID         =   4
      Ctrl4Visible    =   -1  'True
      Ctrl4Style      =   1
      Ctrl4Caption    =   "New"
      Ctrl4Width      =   30
      Ctrl4Height     =   20
      Ctrl5ID         =   5
      Ctrl5Style      =   2
      Ctrl5Caption    =   "patience - #"
      Ctrl5Top        =   20
      Ctrl5Width      =   150
      Ctrl5Height     =   20
      Ctrl6ID         =   9
      Ctrl6Visible    =   -1  'True
      Ctrl6Style      =   2
      Ctrl6Caption    =   "Query"
      Ctrl6Top        =   20
      Ctrl6Width      =   45
      Ctrl6Height     =   20
      Ctrl7ID         =   10
      Ctrl7Visible    =   -1  'True
      Ctrl7Style      =   2
      Ctrl7Caption    =   "Save"
      Ctrl7Left       =   45
      Ctrl7Top        =   20
      Ctrl7Width      =   45
      Ctrl7Height     =   20
      Ctrl8ID         =   11
      Ctrl8Visible    =   -1  'True
      Ctrl8Style      =   1
      Ctrl8Caption    =   "Delete"
      Ctrl8Left       =   30
      Ctrl8Width      =   30
      Ctrl8Height     =   20
      Ctrl9ID         =   12
      Ctrl9Visible    =   -1  'True
      Ctrl9Style      =   1
      Ctrl9Caption    =   "QBE"
      Ctrl9Left       =   60
      Ctrl9Width      =   30
      Ctrl9Height     =   20
      Ctrl10ID        =   100
      Ctrl10Style     =   2
      Ctrl10Caption   =   "Caption!"
      Ctrl10Width     =   22
      Ctrl10Height    =   18
      Ctrl11ID        =   6
      Ctrl11Style     =   1
      Ctrl11Caption   =   ""
      Ctrl11Top       =   40
      Ctrl11Width     =   50
      Ctrl11Height    =   20
      Ctrl12ID        =   7
      Ctrl12Style     =   1
      Ctrl12Caption   =   ""
      Ctrl12Left      =   1
      Ctrl12Top       =   40
      Ctrl12Width     =   99
      Ctrl12Height    =   20
      Ctrl13ID        =   8
      Ctrl13Style     =   1
      Ctrl13Caption   =   ""
      Ctrl13Left      =   100
      Ctrl13Top       =   40
      Ctrl13Width     =   50
      Ctrl13Height    =   20
   End
   Begin VB.Label Label31 
      Caption         =   "DateTime ::"
      Height          =   255
      Left            =   8880
      TabIndex        =   142
      Top             =   240
      Width           =   855
   End
   Begin VB.Label Label58 
      Caption         =   "hn"
      Height          =   300
      Left            =   2130
      TabIndex        =   133
      Top             =   2015
      Width           =   240
   End
   Begin VB.Label Label57 
      Caption         =   "hn"
      Height          =   300
      Left            =   5100
      TabIndex        =   131
      Top             =   4610
      Width           =   240
   End
End
Attribute VB_Name = "register"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public rowid_patience As Integer
Public rowid_admit As Integer
Public rowid_lab As Integer
Public ptime As String
Public ptime2 As String
Public listno As Integer
Public rowid_pic As Integer

Private Sub Browsei_Click()
   Browse_Cmdialog.ShowOpen
   txi_pic = Browse_Cmdialog.FileName
   pic_default = App.Path & "\null.jpg"
   If txi_pic = "" Then txi_pic = pic_default
End Sub

Private Sub cbq_hn_Change()
On Error GoTo error1
    If cbq_hn.Text <> "" Then
    lsq1.ListItems.clear
    lsq3.ListItems.clear
    Frame6.Enabled = False
    Set pic_q.Picture = LoadPicture(App.Path & "\null.jpg")
    txq_from = ""
    txq_to = ""
    cmq_back.Enabled = False
    cmq_next.Enabled = False
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbq_hn_Click()
Dim oVtable As ddoTable
On Error GoTo error1
    sql = "select rowid from patience where hn = " & cbq_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_patience = oVtable.Columns(1).Value
    cmq_query1.Enabled = True
    lsq1.ListItems.clear
    lsq3.ListItems.clear
    Frame6.Enabled = False
    Set pic_q.Picture = LoadPicture(App.Path & "\null.jpg")
    txq_from = ""
    txq_to = ""
    cmq_back.Enabled = False
    cmq_next.Enabled = False
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbq_name_Change()
On Error GoTo error1
    lsq1.ListItems.clear
    lsq3.ListItems.clear
    Frame6.Enabled = False
    Set pic_q.Picture = LoadPicture(App.Path & "\null.jpg")
    txq_from = ""
    txq_to = ""
    cmq_back.Enabled = False
    cmq_next.Enabled = False
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbq_name_Click()
On Error GoTo error1
    lsq1.ListItems.clear
    lsq3.ListItems.clear
    Frame6.Enabled = False
    Set pic_q.Picture = LoadPicture(App.Path & "\null.jpg")
    If cbq_name.ListIndex <> 0 Then
    i = findposname(cbq_name.Text)
    rowid_patience = name_id(i)
    cmq_query1.Enabled = True
    End If
    txq_from = ""
    txq_to = ""
    cmq_back.Enabled = False
    cmq_next.Enabled = False
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbq_sur_Change()
On Error GoTo error1
    lsq1.ListItems.clear
    lsq3.ListItems.clear
    Frame6.Enabled = False
    Set pic_q.Picture = LoadPicture(App.Path & "\null.jpg")
    txq_from = ""
    txq_to = ""
    cmq_back.Enabled = False
    cmq_next.Enabled = False
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbq_sur_Click()
On Error GoTo error1
    lsq1.ListItems.clear
    lsq3.ListItems.clear
    Frame6.Enabled = False
    Set pic_q.Picture = LoadPicture(App.Path & "\null.jpg")
    If cbq_sur.ListIndex <> 0 Then
    i = findpossur(cbq_sur.Text)
    rowid_patience = sur_id(i)
    cmq_query1.Enabled = True
    End If
    lsq1.ListItems.clear
    lsq3.ListItems.clear
    Frame6.Enabled = False
    Set pic_q.Picture = LoadPicture(App.Path & "\null.jpg")
    txq_from = ""
    txq_to = ""
    cmq_back.Enabled = False
    cmq_next.Enabled = False
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub ch_add_Click()
    If ch_add.Value = 1 Then
        fre_add.Enabled = True
        txe_homeid.Enabled = True
        txe_homeid.BackColor = &H80000005
        txe_road.Enabled = True
        txe_road.BackColor = &H80000005
        txe_tambon.Enabled = True
        txe_tambon.BackColor = &H80000005
        txe_ampher.Enabled = True
        txe_ampher.BackColor = &H80000005
        txe_janwat.Enabled = True
        txe_janwat.BackColor = &H80000005
        txe_zip.Enabled = True
        txe_zip.BackColor = &H80000005
    Else
        fre_add.Enabled = False
        txe_homeid.Enabled = False
        txe_homeid.BackColor = &H8000000B
        txe_road.Enabled = False
        txe_road.BackColor = &H8000000B
        txe_tambon.Enabled = False
        txe_tambon.BackColor = &H8000000B
        txe_ampher.Enabled = False
        txe_ampher.BackColor = &H8000000B
        txe_janwat.Enabled = False
        txe_janwat.BackColor = &H8000000B
        txe_zip.Enabled = False
        txe_zip.BackColor = &H8000000B
    End If
End Sub

Private Sub ch_dis_Click()
    If ch_dis.Value = 1 Then
        fre_dis.Enabled = True
        lse_disrem.Enabled = True
        lse_dis.Enabled = True
        lse_dis.BackColor = &H80000005
        cme_adddis.Enabled = True
        cme_remdis.Enabled = True
Else
        fre_dis.Enabled = False
        lse_disrem.Enabled = False
        lse_dis.Enabled = False
        lse_dis.BackColor = &H8000000B
        cme_adddis.Enabled = False
        cme_remdis.Enabled = False
    End If
End Sub

Private Sub ch_med_Click()
    If ch_med.Value = 1 Then
        fre_med.Enabled = True
        lse_medrem.Enabled = True
        lse_med.Enabled = True
        lse_med.BackColor = &H80000005
        cme_addmed.Enabled = True
        cme_remmed.Enabled = True
Else
        fre_med.Enabled = False
        lse_medrem.Enabled = False
        lse_med.Enabled = False
        lse_med.BackColor = &H8000000B
        cme_addmed.Enabled = False
        cme_remmed.Enabled = False
    End If
End Sub

Private Sub ch_name_Click()
    If ch_name.Value = 1 Then
    txe_name.Enabled = True
    txe_name.BackColor = &H80000005
    Else
    txe_name.Enabled = False
    txe_name.BackColor = &H8000000B
    End If
End Sub

Private Sub ch_pic_Click()
    If ch_pic.Value = 1 Then
    txe_pic.Enabled = True
    txe_pic.BackColor = &H80000005
    Else
    txe_pic.Enabled = False
    txe_pic.BackColor = &H8000000B
    End If
End Sub

Private Sub ch_sur_Click()
    If ch_sur.Value = 1 Then
    txe_sur.Enabled = True
    txe_sur.BackColor = &H80000005
    Else
    txe_sur.Enabled = False
    txe_sur.BackColor = &H8000000B
    End If
End Sub

Private Sub ch_tel_Click()
    If ch_tel.Value = 1 Then
        fre_tel.Enabled = True
        lse_phonerem.Enabled = True
        lse_phone.Enabled = True
        lse_phone.BackColor = &H80000005
        cme_addphone.Enabled = True
        cme_remphone.Enabled = True
Else
        fre_tel.Enabled = False
        lse_phonerem.Enabled = False
        lse_phone.Enabled = False
        lse_phone.BackColor = &H8000000B
        cme_addphone.Enabled = False
        cme_remphone.Enabled = False
    End If
End Sub

Function txicheck() As Boolean
On Error GoTo error1
    If (txi_name <> "" And txi_sur <> "" And txi_birth <> "" And txi_id <> "" And txi_homeid <> "" And txi_road <> "" And txi_tambon <> "" And txi_ampher <> "" And txi_janwat <> "") Then
      txicheck = True
    Else: txicheck = False
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function

Function Insert_Pic(tx_pic As Object) As Integer
On Error GoTo error1
    Dim sql As String
    Dim oVtable As ddoTable
    Dim tmp(10) As Integer
    If (tx_pic <> "{Default}") Then
    sql = "insert into photo values (0,filetoblob('" & tx_pic & "','client'));"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select rowid from photo where pic=filetoblob('" & tx_pic & "','client');"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    i = 0
    While Not oVtable.EOT
        tmp(i) = oVtable.Columns(1).Value
        oVtable.NextRecord
        i = i + 1
    Wend
    Insert_Pic = tmp(0)
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    Else: Insert_Pic = 257
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function

Function findposdis(X As String) As Integer
On Error GoTo error1
    i = 0
    Do While dis_char(i) <> X
        i = i + 1
    Loop
    findposdis = i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function

Function findposmed(X As String) As Integer
On Error GoTo error1
    i = 0
    Do While med_char(i) <> X
        i = i + 1
    Loop
    findposmed = i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function
Function findposname(X As String) As Integer
On Error GoTo error1
    i = 0
    Do While name_char(i) <> X
        i = i + 1
    Loop
    findposname = i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function
Function findpossur(X As String) As Integer
On Error GoTo error1
    i = 0
    Do While sur_char(i) <> X
        i = i + 1
    Loop
    findpossur = i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function


Sub Insert_Patience(rowid_pic As Integer)
On Error GoTo error1
    Dim sql, set_tel, set_dis, set_med As String
    Dim txi As String
    Dim pos As Integer
    If opi_male.Value = True Then
        txi_sex = "m"
    Else: txi_sex = "f"
    End If
    'BLOOD GROUP CAN BE NULL
    If txi_gblood.Text <> "" Then
        gbloodstr = "'" & txi_gblood & "'"
    Else: gbloodstr = Null
    End If
    ' SET OF TELEPHONE NUMBER
    lscount = lsi_phone.ListCount
    set_tel = """set{row(null," & datetime & "," & forever & ")"
    If lscount <> 0 Then
        For i = 0 To lscount - 1
        set_tel = set_tel & ",row('" & lsi_phone.List(i) & "'," & datetime & "," & forever & ")"
        Next i
    End If
    set_tel = set_tel & "}"""
    
    ' SET OF DISEASE
    lscount = lsi_dis.ListCount
    set_dis = """set{row(null," & datetime & "," & forever & ")"
    If lscount <> 0 Then
    i = 0
    For i = 0 To lscount - 1
    pos = findposdis(lsi_dis.List(i))
    set_dis = set_dis & ",row(" & dis_id(pos) & "," & datetime & "," & forever & ")"
    Next i
    End If
    set_dis = set_dis & "}"""
     
     'SET OF MEDICINE
    lscount = lsi_med.ListCount
    set_med = """set{row(null," & datetime & "," & forever & ")"
    If lscount <> 0 Then
    For i = 0 To lscount - 1
    pos = findposmed(lsi_med.List(i))
    set_med = set_med & ",row(" & med_id(pos) & "," & datetime & "," & forever & ")"
    Next i
    End If
    set_med = set_med & "}"""
    
    sql = "insert into patience values(0," & _
        """set{row(" & rowid_pic & "," & datetime & "," & forever & ")}""," & _
        """set{row('" & txi_name & "'," & datetime & "," & forever & ")}""," & _
        """set{row('" & txi_sur & "'," & datetime & "," & forever & ")}""," & _
        "'" & txi_birth & "'," & _
        "'" & txi_sex & "'," & _
        txi_id & "," & _
        gbloodstr & "," & _
        """set{row(" & txi_homeid & ",'" & txi_road & "','" & txi_tambon & "','" & txi_ampher & "','" & txi_janwat & "','" & txi_zip & "'," & datetime & "," & forever & ")}""," & _
        set_tel & "," & _
        set_dis & "," & _
        set_med & "," & _
        """set{row(null," & datetime & ",9999-12-31 23:59)}""," & _
        """set{row(null," & datetime & ",9999-12-31 23:59)}""" & _
        ");"
    Debug.Print sql
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cmd_exit_Click()
    Unload Me
    startform.Show
End Sub

Private Sub cbe_hn_Click()
Dim oVtable As ddoTable
On Error GoTo error1
    If cbe_hn.Text <> "" Then
    register.MousePointer = 11
    lse_dis.clear
    lse_disrem.clear
    lse_med.clear
    lse_medrem.clear
    lse_phone.clear
    lse_phonerem.clear
    
    sql = "select rowid from patience where hn = " & cbe_hn
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_patience = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    ptime = forever
    Call query1
    i = 0
        txe_name = name_col(i)
        txe_sur = sur_col(i)
        txe_birth = birth_col(i)
        If sex_col(i) = "f" Then ope_female.Value = True
        txe_id = idnum_col(i)
        txe_gblood = blood_col(i)
        'ADDRESS
            X = InStr(1, address_col(i), ",  ")
            txe_homeid = Mid(address_col(i), 1, X - 1)
            Y = X + 3
            X = InStr(Y, address_col(i), ",  ")
            txe_road = Mid(address_col(i), Y, X - Y)
            Y = X + 3
            X = InStr(Y, address_col(i), ",  ")
            txe_tambon = Mid(address_col(i), Y, X - Y)
            Y = X + 3
            X = InStr(Y, address_col(i), ",  ")
            txe_ampher = Mid(address_col(i), Y, X - Y)
            Y = X + 3
            X = InStr(Y, address_col(i), ",  ")
            txe_janwat = Mid(address_col(i), Y, X - Y)
            Y = X + 3
            txe_zip = Mid(address_col(i), Y, Len(address_col(i)) - Y)
        
        'TELEPHONE
            Y = 1
            Do While (Y > 0 And Y < Len(tel_col(i)))
            X = InStr(Y, tel_col(i), ",  ")
            If X <> 0 Then
                lse_phone.AddItem (Mid(tel_col(i), Y, X - Y))
                Y = X + 3
            End If
            Loop

        'DISEASE
            Y = 1
            Do While (Y > 0 And Y < Len(dis_col(i)))
            X = InStr(Y, dis_col(i), ",  ")
            If X <> 0 Then
                lse_dis.AddItem (Mid(dis_col(i), Y, X - Y))
                Y = X + 3
            End If
            Loop
        
        'MEDICINE
            Y = 1
            Do While (Y > 0 And Y < Len(med_col(i)))
            X = InStr(Y, med_col(i), ",  ")
            If X <> 0 Then
                lse_med.AddItem (Mid(med_col(i), Y, X - Y))
                Y = X + 3
            End If
            Loop
            
        'PICTURE
        sql = "execute procedure atpicture(" & rowid_patience & ",'9999-12-31 23:59');"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        rowid_pic = oVtable.Columns(1).Value
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        If rowid_pic = 257 Then
            txe_pic = "{Default}"
        Else: txe_pic = rowid_pic
        End If
    register.MousePointer = 0
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Sub temporal_edit()
On Error GoTo error1
    If ch_name.Value = 1 Then
    sql = "execute procedure updateT(" & rowid_patience & ",null,'" & txe_name & "',null,null,null,null,null,null,null);"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    End If
    If ch_sur.Value = 1 Then
    sql = "execute procedure updateT(" & rowid_patience & ",null,null,'" & txe_sur & "',null,null,null,null,null,null);"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    End If
    If ch_pic.Value = 1 Then
    If (txe_pic <> CStr(rowid_pic) And txe_pic <> "{Default}") Then rowid_pic = Insert_Pic(txe_pic)
    sql = "execute procedure updateT(" & rowid_patience & "," & rowid_pic & ",null,null,null,null,null,null,null,null);"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    End If
    If ch_add.Value = 1 Then
    sql = "execute procedure updateT(" & rowid_patience & ",null,null,null,'" & txe_homeid & "','" & txe_road & "','" & txe_tambon & "','" & txe_ampher & "','" & txe_janwat & "','" & txe_zip & ");"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    End If
    If ch_tel.Value = 1 Then
        i = 0
            settemp = """set{"
            While i < lse_phonerem.ListCount - 1
            settemp = settemp & "'" & lse_phonerem.List(i) & "',"
            i = i + 1
            Wend
            settemp = settemp & "'" & lse_phonerem.List(i) & "'}"""
       sql = "execute procedure createsettable('c');"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "insert into set_table values(1," & settemp & ");"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "execute procedure updateTtel(" & rowid_patience & ");"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    End If
    If ch_dis.Value = 1 Then
        i = 0
            settemp = """set{"
            While i < lse_disrem.ListCount - 1
            sql = "select rowid from disease where sci_name = '" & lse_disrem.List(i) & "'"
            Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
            rowid = oVtable.Columns(1).Value
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
            settemp = settemp & rowid & ","
            i = i + 1
            Wend
            sql = "select rowid from disease where sci_name = '" & lse_disrem.List(i) & "'"
            Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
            rowid = oVtable.Columns(1).Value
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
            settemp = settemp & rowid & "}"""
        
        sql = "execute procedure createsettable('n');"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "insert into set_table values(1," & settemp & ");"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "execute procedure updateTdis(" & rowid_patience & ");"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    End If
    If ch_med.Value = 1 Then
        i = 0
            settemp = """set{"
            While i < lse_medrem.ListCount - 1
            sql = "select rowid from medicine where sci_name = '" & lse_medrem.List(i) & "'"
            Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
            rowid = oVtable.Columns(1).Value
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
            settemp = settemp & rowid & ","
            i = i + 1
            Wend
            sql = "select rowid from medicine where sci_name = '" & lse_medrem.List(i) & "'"
            Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
            rowid = oVtable.Columns(1).Value
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
            settemp = settemp & rowid & "}"""
        
        sql = "execute procedure createsettable('n');"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "insert into set_table values(1," & settemp & ");"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "execute procedure updateTmed(" & rowid_patience & ");"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    End If

GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Sub nontemporal_edit()
On Error GoTo error1
    If (txe_pic <> CStr(rowid_pic) And txe_pic <> "{Default}") Then rowid_pic = Insert_Pic(txe_pic)
    If ope_male.Value = True Then
        sexstr = "m"
    Else: sexstr = "f"
    End If
    sql = "execute procedure updateNT(" & _
            rowid_patience & "," & _
            rowid_pic & "," & _
            "'" & txe_name & "','" & txe_sur & "','" & txe_birth & "','" & sexstr & "','" & txe_id & "','" & txe_gblood & "'," & _
            txe_homeid & ",'" & txe_road & "','" & txe_tambon & "','" & txe_ampher & "','" & txe_janwat & "','" & txe_zip & "');"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)

    'UPDATE TEL
    lscount = lse_phonerem.ListCount
        If lscount <> 0 Then
        For i = 0 To lscount - 1
            telstr = lse_phonerem.List(i)
            sql = "execute procedure updateNTtel(" & rowid_patience & ",'" & telstr & "');"
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        Next i
    End If
    'UPDATE DISEASE
    lscount = lse_disrem.ListCount
        If lscount <> 0 Then
        For i = 0 To lscount - 1
            disstr = lse_disrem.List(i)
            sql = "select rowid from disease where sci_name = """ & disstr & """"
            Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
            rowid = oVtable.Columns(1).Value
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
            sql = "execute procedure updateNTdis(" & rowid_patience & "," & rowid & ");"
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        Next i
    End If
    'UPDATE MEDICINE
    lscount = lse_medrem.ListCount
        If lscount <> 0 Then
        For i = 0 To lscount - 1
            medstr = lse_medrem.List(i)
            sql = "select rowid from medicine where sci_name = """ & medstr & """"
            Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
            rowid = oVtable.Columns(1).Value
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
            sql = "execute procedure updateNTmed(" & rowid_patience & "," & rowid & ");"
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        Next i
    End If
 
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cme_adddis_Click()
  lselect = lse_disrem.ListIndex
  If lselect >= 0 Then
  lse_dis.AddItem (lse_disrem.List(lselect))
  lse_disrem.RemoveItem (lselect)
  End If
End Sub

Private Sub cme_addmed_Click()
  lselect = lse_medrem.ListIndex
  If lselect >= 0 Then
  lse_med.AddItem (lse_medrem.List(lselect))
  lse_medrem.RemoveItem (lselect)
  End If
End Sub

Private Sub cme_addphone_Click()
  lselect = lse_phonerem.ListIndex
  If lselect >= 0 Then
  lse_phone.AddItem (lse_phonerem.List(lselect))
  lse_phonerem.RemoveItem (lselect)
  End If
End Sub

Private Sub cme_browse_Click()
    cmd_dialog.ShowOpen
    txe_pic = cmd_dialog.FileName
    pic_default = App.Path & "\null.jpg"
    If txe_pic = "" Then txe_pic = pic_default
End Sub

Private Sub cme_change_Click()
    If op_temp.Value = True Then
            Call temporal_edit
    Else: Call nontemporal_edit
    End If
    cme_change.Enabled = False
End Sub

Private Sub cme_clear_Click()
    Unload Me
    register.Show
End Sub

Private Sub cme_remdis_Click()
  lselect = lse_dis.ListIndex
  If lselect >= 0 Then
  lse_disrem.AddItem (lse_dis.List(lselect))
  lse_dis.RemoveItem (lselect)
  End If
End Sub

Private Sub cme_remmed_Click()
  lselect = lse_med.ListIndex
  If lselect >= 0 Then
  lse_medrem.AddItem (lse_med.List(lselect))
  lse_med.RemoveItem (lselect)
  End If
End Sub

Private Sub cme_remphone_Click()
  lselect = lse_phone.ListIndex
  If lselect >= 0 Then
  lse_phonerem.AddItem (lse_phone.List(lselect))
  lse_phone.RemoveItem (lselect)
  End If
End Sub

Private Sub cmi_clearall_Click()
    Unload Me
    register.Show
End Sub

Private Sub cmid_add_Click()
  lselect = lsi_disadd.ListIndex
  If lselect >= 0 Then
  lsi_dis.AddItem (lsi_disadd.List(lselect))
  lsi_disadd.RemoveItem (lselect)
  End If
End Sub

Private Sub cmie_rem_Click()
  lselect = lsi_dis.ListIndex
  If lselect >= 0 Then
  lsi_disadd.AddItem (lsi_dis.List(lselect))
  lsi_dis.RemoveItem (lselect)
  End If
End Sub

Private Sub cmim_add_Click()
  lselect = lsi_medadd.ListIndex
  If lselect >= 0 Then
  lsi_med.AddItem (lsi_medadd.List(lselect))
  lsi_medadd.RemoveItem (lselect)
  End If
End Sub

Private Sub cmim_rem_Click()
  lselect = lsi_med.ListIndex
  If lselect >= 0 Then
  lsi_medadd.AddItem (lsi_med.List(lselect))
  lsi_med.RemoveItem (lselect)
  End If
End Sub

Private Sub cmit_add_Click()
    lsi_phone.AddItem (txi_phoneadd)
    txi_phoneadd.Text = ""
End Sub

Private Sub cmit_rem_Click()
   lselect = lsi_phone.ListIndex
  If lselect >= 0 Then
  lsi_phone.RemoveItem (lselect)
  End If
End Sub

Sub query1()
On Error GoTo error1
Dim oVtable As ddoTable
Dim oVtable2 As ddoTable
    i = 0
    ReDim id_col(i) As Integer
    ReDim hn_col(i) As Integer
    ReDim name_col(i) As String
    ReDim sur_col(i) As String
    ReDim birth_col(i) As Date
    ReDim sex_col(i) As String
    ReDim idnum_col(i) As String
    ReDim blood_col(i) As String
    ReDim address_col(i) As String
    ReDim tel_col(i) As String
    ReDim dis_col(i) As String
    ReDim med_col(i) As String
    ReDim diag_col(i) As Integer
    ReDim admit_col(i) As Integer
    'QUERY ALL ATTRIBUTE IN PTIME FROM ROWID
    i = 0
    id_col(i) = rowid_patience
'    hn_col(i) = cbq_hn.Text
    Call queryall(i)
    Call showquery1

GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub


Sub queryall(i)
On Error GoTo error1
        sql = "select hn from patience where rowid =" & rowid_patience
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        hn_col(i) = oVtable.Columns(1).Value
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        
        sql = "execute procedure atname(" & rowid_patience & ",'" & ptime & "')"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "execute procedure checkresult();"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result;"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
If oVtable.Columns(1).Value <> "nothing" Then
    name_col(i) = Trim(oVtable.Columns(1).Value)
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        
        sql = "execute procedure atsurname(" & rowid_patience & ",'" & ptime & "')"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    sur_col(i) = Trim(oVtable.Columns(1).Value)
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
        sql = "select birthday,sex,id_num,blood_group from patience where rowid = " & rowid_patience
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    birth_col(i) = oVtable.Columns(1).Value
    sex_col(i) = oVtable.Columns(2).Value
    idnum_col(i) = oVtable.Columns(3).Value
    blood_col(i) = oVtable.Columns(4).Value
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
     
        sql = "execute procedure ataddress(" & rowid_patience & ",'" & ptime & "')"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    address_col(i) = Trim(oVtable.Columns(1).Value) & ",  " & _
                                Trim(oVtable.Columns(2).Value) & ",  " & _
                                Trim(oVtable.Columns(3).Value) & ",  " & _
                                Trim(oVtable.Columns(4).Value) & ",  " & _
                                Trim(oVtable.Columns(5).Value) & ",  " & _
                                Trim(oVtable.Columns(6).Value)
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        
        sql = "execute procedure attel(" & rowid_patience & ",'" & ptime & "')"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "execute procedure checkresult();"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result;"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        If oVtable.Columns(1).Value <> "nothing" Then
        While Not oVtable.EOT
                tel = Trim(oVtable.Columns(1).Value)
            If tel <> "" Then
                tel_col(i) = tel_col(i) & tel & ",  "
            End If
                oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        Else: patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        End If
        
        sql = "execute procedure atdiagnosis(" & rowid_patience & ",'" & ptime & "')"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "execute procedure checkresult();"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        If oVtable.Columns(1).Value <> "nothing" Then
        rowid = oVtable.Columns(1).Value
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
            If rowid <> "" Then
            sql = "select dia_code from diagnosis where rowid = " & rowid
            Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        diag_col(i) = oVtable2.Columns(1).Value
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
            End If
        Else: patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        End If
        
        sql = "execute procedure atadmission(" & rowid_patience & ",'" & ptime & "')"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "execute procedure checkresult();"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        If oVtable.Columns(1).Value <> "nothing" Then
        rowid = oVtable.Columns(1).Value
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        If rowid <> "" Then
        sql = "select ad_code from admission where rowid = " & rowid
        Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    admit_col(i) = oVtable2.Columns(1).Value
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
        End If
        Else: patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        End If
        
        sql = "execute procedure atmed(" & rowid_patience & ",'" & ptime & "')"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "execute procedure checkresult();"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        If oVtable.Columns(1).Value <> "nothing" Then
        While Not oVtable.EOT
        rowid = oVtable.Columns(1).Value
        If rowid <> "" Then
        sql = "select sci_name from medicine where rowid = " & rowid
        Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    med_col(i) = med_col(i) & Trim(oVtable2.Columns(1).Value) & ",  "
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
        End If
        oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        Else: patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        End If
  
        sql = "execute procedure atdis(" & rowid_patience & ",'" & ptime & "')"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "execute procedure checkresult();"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        If oVtable.Columns(1).Value <> "nothing" Then
        While Not oVtable.EOT
        rowid = oVtable.Columns(1).Value
        If rowid <> "" Then
        sql = "select sci_name from disease where rowid = " & rowid
        Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    dis_col(i) = dis_col(i) & Trim(oVtable2.Columns(1).Value) & ",  "
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
        End If
        oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        Else: patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        End If
Else:  patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
End If

GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Sub setquery()
Dim oVtable As ddoTable
Dim oVtable2 As ddoTable
On Error GoTo error1
    i = UBound(id_col)
    ReDim hn_col(i) As Integer
    ReDim name_col(i) As String
    ReDim sur_col(i) As String
    ReDim birth_col(i) As Date
    ReDim sex_col(i) As String
    ReDim idnum_col(i) As String
    ReDim blood_col(i) As String
    ReDim address_col(i) As String
    ReDim tel_col(i) As String
    ReDim dis_col(i) As String
    ReDim med_col(i) As String
    ReDim diag_col(i) As Integer
    ReDim admit_col(i) As Integer
    'QUERY ALL ATTRIBUTE IN PTIME FROM ROWID
    For i = 0 To UBound(id_col)
        rowid_patience = id_col(i)
        Call queryall(i)
    Next i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub
        

Sub query2()
Dim oVtable As ddoTable
On Error GoTo error1
'    If listno < 1 Then listno = 1
    If opq_current.Value = True Then
    sql = "execute procedure NT2ROWID('" & cbq_name.Text & "','" & ptime & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    Else: sql = "execute procedure nameNSEQ('" & cbq_name.Text & "');"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    End If

    sql = "execute procedure checksingle_int();"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from single_int"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
If oVtable.Columns(1).Value <> "nothing" Then
    i = oVtable.TotalRecordCount - 1
    ReDim id_col(i) As Integer
    j = 0
    While Not oVtable.EOT
        id_col(j) = oVtable.Columns(1).Value
        j = j + 1
        oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    Call setquery
    Call showquery1
    Else: MsgBox "No data match", OK = vbOKOnly, "Not Found"
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Sub query3()
Dim oVtable As ddoTable
On Error GoTo error1
    If opq_nonsequenced.Value = False Then
    sql = "execute procedure ST2ROWID('" & cbq_sur.Text & "','" & ptime & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    Else: sql = "execute procedure surnameNSEQ('" & cbq_sur.Text & "');"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    End If
    sql = "execute procedure checksingle_int();"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from single_int"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
If oVtable.Columns(1).Value <> "nothing" Then
    i = oVtable.TotalRecordCount - 1
    ReDim id_col(i) As Integer
    j = 0
    While Not oVtable.EOT
        id_col(j) = oVtable.Columns(1).Value
        j = j + 1
        oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    Call setquery
    Call showquery1
    Else: MsgBox "No data match", OK = vbOKOnly, "Not Found"
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Sub query4()
Dim oVtable As ddoTable
On Error GoTo error1
    If opq_nonsequenced.Value = False Then
    sql = "execute procedure NST2ROWID('" & cbq_name.Text & "','" & cbq_sur.Text & "','" & ptime & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
     Else: sql = "execute procedure nameNSEQ('" & cbq_name.Text & "','" & cbq_sur.Text & "');"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    End If
   sql = "execute procedure checksingle_int();"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from single_int"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable.Columns(1).Value <> "nothing" Then
    i = oVtable.TotalRecordCount - 1
    ReDim id_col(i) As Integer
    j = 0
    While Not oVtable.EOT
        id_col(j) = oVtable.Columns(1).Value
        j = j + 1
        oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    Call setquery
    Call showquery1
    Else: MsgBox "No data match", OK = vbOKOnly, "Not Found"
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Sub showquery1()
Dim index As ListItem
On Error GoTo error1
    For i = 0 To UBound(id_col)
        Set index = lsq1.ListItems.Add
        index.Text = hn_col(i)
        index.SubItems(1) = name_col(i)
        index.SubItems(2) = sur_col(i)
        index.SubItems(3) = birth_col(i)
        index.SubItems(4) = sex_col(i)
        index.SubItems(5) = idnum_col(i)
        index.SubItems(6) = blood_col(i)
        index.SubItems(7) = address_col(i)
        index.SubItems(8) = tel_col(i)
        index.SubItems(9) = dis_col(i)
        index.SubItems(10) = med_col(i)
        index.SubItems(11) = diag_col(i)
        index.SubItems(12) = admit_col(i)
    Next i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cmq_back_Click()
On Error GoTo error1
    i = 0
    Do While (pic_show(i) = False)
        i = i + 1
    Loop
    i = i - 1
    If i = UBound(pic_col) Then
        cmq_next.Enabled = False
    Else: cmq_next.Enabled = True
    End If
    If i = LBound(pic_col) Then
        cmq_back.Enabled = False
    Else: cmq_back.Enabled = True
    End If
    sql = "select lotofile(pic,'" & App.Path & "\a.jpg!','client') from photo where rowid = " & pic_col(i)
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    Set pic_q.Picture = LoadPicture(App.Path & "\a.jpg")
    txq_from.Text = pic_from(i)
    txq_to.Text = pic_to(i)
    pic_show(i) = True
    pic_show(i + 1) = False
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cmq_next_Click()
On Error GoTo error1
    i = 0
    Do While (pic_show(i) = False)
        i = i + 1
    Loop
    i = i + 1
    If i = UBound(pic_col) Then
        cmq_next.Enabled = False
    Else: cmq_next.Enabled = True
    End If
    If i = LBound(pic_col) Then
        cmq_back.Enabled = False
    Else: cmq_back.Enabled = True
    End If
    sql = "select lotofile(pic,'" & App.Path & "\a.jpg!','client') from photo where rowid = " & pic_col(i)
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    Set pic_q.Picture = LoadPicture(App.Path & "\a.jpg")
    txq_from.Text = pic_from(i)
    txq_to.Text = pic_to(i)
    pic_show(i) = True
    pic_show(i - 1) = False
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cmq_querry2_Click()
Dim oVtable As ddoTable
Dim oVtable2 As ddoTable
Dim index As ListItem
On Error GoTo error1
If Not opq_name.Value Then
    If (listno < 1 And listno > lsq1.ListItems.Count) Then MsgBox "Please select one patience", OK = vbOKOnly, "Error Message"
End If
If Not lsq2.Selected(8) Then lsq3.ListItems.clear
If lsq2.Selected(0) Then
    sql = "execute procedure allname(" & rowid_patience & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    lsq3.ColumnHeaders(1).Text = "Name"
    While Not oVtable.EOT
    Set index = lsq3.ListItems.Add
    index.Text = Trim(oVtable.Columns(1).Value)
    index.SubItems(1) = Replace(oVtable.Columns(2).Value, ":00.00000", "")
    index.SubItems(2) = Replace(oVtable.Columns(3).Value, ":00.00000", "")
    oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
ElseIf lsq2.Selected(1) Then
    sql = "execute procedure allsurname(" & rowid_patience & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    lsq3.ColumnHeaders(1).Text = "Surname"
    While Not oVtable.EOT
    Set index = lsq3.ListItems.Add
    index.Text = Trim(oVtable.Columns(1).Value)
    index.SubItems(1) = Replace(oVtable.Columns(2).Value, ":00.00000", "")
    index.SubItems(2) = Replace(oVtable.Columns(3).Value, ":00.00000", "")
    oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
ElseIf lsq2.Selected(2) Then
    sql = "execute procedure alladdress(" & rowid_patience & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    lsq3.ColumnHeaders(1).Text = "Address"
    While Not oVtable.EOT
    Set index = lsq3.ListItems.Add
    index.Text = Trim(oVtable.Columns(1).Value) & "  " & _
                        Trim(oVtable.Columns(2).Value) & "  " & _
                        Trim(oVtable.Columns(3).Value) & "  " & _
                        Trim(oVtable.Columns(4).Value) & "  " & _
                        Trim(oVtable.Columns(5).Value) & "  " & _
                        Trim(oVtable.Columns(6).Value)
    index.SubItems(1) = Replace(oVtable.Columns(7).Value, ":00.00000", "")
    index.SubItems(2) = Replace(oVtable.Columns(8).Value, ":00.00000", "")
    oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
ElseIf lsq2.Selected(3) Then
    sql = "execute procedure alltel(" & rowid_patience & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    lsq3.ColumnHeaders(1).Text = "TELEPHONE NUMBER"
    While Not oVtable.EOT
    rowid = Trim(oVtable.Columns(1).Value)
    If rowid <> "" Then
    Set index = lsq3.ListItems.Add
    index.Text = rowid
    index.SubItems(1) = Replace(oVtable.Columns(2).Value, ":00.00000", "")
    index.SubItems(2) = Replace(oVtable.Columns(3).Value, ":00.00000", "")
    End If
    oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
ElseIf lsq2.Selected(4) Then
    sql = "execute procedure alldis(" & rowid_patience & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    lsq3.ColumnHeaders(1).Text = "Disease"
    While Not oVtable.EOT
    rowid = oVtable.Columns(1).Value
    If rowid <> "" Then
    sql = "select sci_name from disease where rowid = " & rowid
    Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    Set index = lsq3.ListItems.Add
    index.Text = oVtable2.Columns(1).Value
    index.SubItems(1) = Replace(oVtable.Columns(2).Value, ":00.00000", "")
    index.SubItems(2) = Replace(oVtable.Columns(3).Value, ":00.00000", "")
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
    End If
    oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
ElseIf lsq2.Selected(5) Then
    sql = "execute procedure allmed(" & rowid_patience & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    lsq3.ColumnHeaders(1).Text = "Allergy Medicine"
    While Not oVtable.EOT
    rowid = oVtable.Columns(1).Value
    If rowid <> "" Then
    sql = "select sci_name from medicine where rowid = " & rowid
    Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    Set index = lsq3.ListItems.Add
    index.Text = oVtable2.Columns(1).Value
    index.SubItems(1) = Replace(oVtable.Columns(2).Value, ":00.00000", "")
    index.SubItems(2) = Replace(oVtable.Columns(3).Value, ":00.00000", "")
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
    End If
    oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
ElseIf lsq2.Selected(6) Then
    sql = "execute procedure alldiagnosis(" & rowid_patience & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    While Not oVtable.EOT
    rowid = oVtable.Columns(1).Value
    If rowid <> "" Then
    sql = "select dia_code from diagnosis where rowid = " & rowid
    Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    Set index = lsq3.ListItems.Add
    lsq3.ColumnHeaders(1).Text = "D.N."
    index.Text = oVtable2.Columns(1).Value
    index.SubItems(1) = Replace(oVtable.Columns(2).Value, ":00.00000", "")
    index.SubItems(2) = Replace(oVtable.Columns(3).Value, ":00.00000", "")
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
    End If
    oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
ElseIf lsq2.Selected(7) Then
    sql = "execute procedure alladmission(" & rowid_patience & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    While Not oVtable.EOT
    rowid = oVtable.Columns(1).Value
    If rowid <> "" Then
    sql = "select ad_code from admission where rowid = " & rowid
    Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    Set index = lsq3.ListItems.Add
    lsq3.ColumnHeaders(1).Text = "A.N."
    index.Text = oVtable2.Columns(1).Value
    index.SubItems(1) = Replace(oVtable.Columns(2).Value, ":00.00000", "")
    index.SubItems(2) = Replace(oVtable.Columns(3).Value, ":00.00000", "")
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
    End If
    oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
ElseIf lsq2.Selected(8) Then
    sql = "execute procedure allpicture(" & rowid_patience & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid = oVtable.Columns(1).Value
    nrecord = oVtable.TotalRecordCount - 1
    ReDim pic_col(nrecord) As Integer
    ReDim pic_from(nrecord) As String
    ReDim pic_to(nrecord) As String
    ReDim pic_show(nrecord) As Boolean
    i = 0
    While Not oVtable.EOT
        pic_col(i) = oVtable.Columns(1).Value
        pic_from(i) = Replace(oVtable.Columns(2).Value, ":00.00000", "")
        pic_to(i) = Replace(oVtable.Columns(3).Value, ":00.00000", "")
        i = i + 1
        oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    i = i - 1
    sql = "select lotofile(pic,'" & App.Path & "\a.jpg!','client') from photo where rowid = " & pic_col(i)
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    Set pic_q.Picture = LoadPicture(App.Path & "\a.jpg")
    txq_from.Text = pic_from(i)
    txq_to.Text = pic_to(i)
    pic_show(i) = True
    If i = UBound(pic_col) Then
        cmq_next.Enabled = False
    Else: cmq_next.Enabled = True
    End If
    If i = LBound(pic_col) Then
        cmq_back.Enabled = False
    Else: cmq_back.Enabled = True
    End If
End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub
' FIND RESULT IN SEQUENCE MODE FROM CBG_NAME
Sub query5()
On Error GoTo error1
            sql = "execute procedure NFT2ROWID('" & cbq_name.Text & "','" & ptime & "','" & ptime2 & "');"
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
            sql = "execute procedure checkresult"
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
            sql = "select * from result"
            Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
            nrecord = 0
            While Not oVtable.EOT
                nrecord = nrecord + 1
                oVtable.NextRecord
            Wend
            nrecord = nrecord - 1
            i = 0
            oVtable.FirstRecord
            ReDim id_col(nrecord) As Integer
            If oVtable.Columns(1).Value <> "nothing" Then
                While Not oVtable.EOT
                    Set index = lsq1.ListItems.Add
                    index.Text = oVtable.Columns(1).Value
                        sql = "select rowid from patience where hn = " & index.Text
                        Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
                    id_col(i) = oVtable2.Columns(1).Value
                        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
                    index.SubItems(1) = Trim(oVtable.Columns(2).Value)
                    index.SubItems(2) = Trim(oVtable.Columns(3).Value)
                    index.SubItems(3) = Replace(oVtable.Columns(4).Value, ":00.00000", "")
                    index.SubItems(4) = Replace(oVtable.Columns(5).Value, ":00.00000", "")
                    oVtable.NextRecord
                    i = i + 1
                Wend
            End If
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

' FIND RESULT IN SEQUENCE MODE FROM CBG_SUR
Sub query6()
On Error GoTo error1
            sql = "execute procedure SNFT2ROWID('" & cbq_sur.Text & "','" & ptime & "','" & ptime2 & "');"
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
            sql = "execute procedure checkresult"
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
            sql = "select * from result"
            Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
            nrecord = 0
            While Not oVtable.EOT
                nrecord = nrecord + 1
                oVtable.NextRecord
            Wend
            nrecord = nrecord - 1
            i = 0
            oVtable.FirstRecord
            ReDim id_col(nrecord) As Integer
            If oVtable.Columns(1).Value <> "nothing" Then
                While Not oVtable.EOT
                    Set index = lsq1.ListItems.Add
                    index.Text = oVtable.Columns(1).Value
                        sql = "select rowid from patience where hn = " & index.Text
                        Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
                    id_col(i) = oVtable2.Columns(1).Value
                        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
                    index.SubItems(1) = Trim(oVtable.Columns(2).Value)
                    index.SubItems(2) = Trim(oVtable.Columns(3).Value)
                    index.SubItems(3) = Replace(oVtable.Columns(4).Value, ":00.00000", "")
                    index.SubItems(4) = Replace(oVtable.Columns(5).Value, ":00.00000", "")
                    oVtable.NextRecord
                    i = i + 1
                Wend
            End If
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

' FIND RESULT IN SEQUENCE MODE FROM CBG_NAME
Sub query7()
On Error GoTo error1
            sql = "execute procedure NSFT2ROWID('" & cbq_name.Text & "','" & cbq_sur.Text & "','" & ptime & "','" & ptime2 & "');"
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
            sql = "execute procedure checkresult"
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
            sql = "select * from result"
            Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
            nrecord = 0
            While Not oVtable.EOT
                nrecord = nrecord + 1
                oVtable.NextRecord
            Wend
            nrecord = nrecord - 1
            i = 0
            oVtable.FirstRecord
            ReDim id_col(nrecord) As Integer
            If oVtable.Columns(1).Value <> "nothing" Then
                While Not oVtable.EOT
                    Set index = lsq1.ListItems.Add
                    index.Text = oVtable.Columns(1).Value
                        sql = "select rowid from patience where hn = " & index.Text
                        Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
                    id_col(i) = oVtable2.Columns(1).Value
                        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
                    index.SubItems(1) = Trim(oVtable.Columns(2).Value)
                    index.SubItems(2) = Trim(oVtable.Columns(3).Value)
                    index.SubItems(3) = Replace(oVtable.Columns(4).Value, ":00.00000", "")
                    index.SubItems(4) = Replace(oVtable.Columns(5).Value, ":00.00000", "")
                    oVtable.NextRecord
                    i = i + 1
                Wend
            End If
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cmq_query1_Click()
Dim oVtable As ddoTable
Dim index As ListItem
On Error GoTo error1
    register.MousePointer = 11
    lsq1.ListItems.clear
    lsq1.ListItems.clear
    If (opq_current.Value = True Or opq_nonsequenced.Value = True) Then
        ptime = forever
        lsq1.ColumnHeaders(4).Text = "BIRTHDATE"
        lsq1.ColumnHeaders(5).Text = "SEX"
        lsq1.ColumnHeaders(4).Width = 1500
        lsq1.ColumnHeaders(5).Width = 500
        lsq1.ColumnHeaders(6).Text = "IDNUMBER"
        lsq1.ColumnHeaders(7).Text = "BG"
        lsq1.ColumnHeaders(8).Text = "ADDRESS"
        lsq1.ColumnHeaders(9).Text = "TEL_NUMBER"
        lsq1.ColumnHeaders(10).Text = "DISEASE"
        lsq1.ColumnHeaders(11).Text = "ALLERGY_MEDICINE"
        lsq1.ColumnHeaders(12).Text = "D.N."
        lsq1.ColumnHeaders(13).Text = "A.N."

    ElseIf opq_ptime = True Then
        tmp_from = txq_year & "-" & txq_month & "-" & txq_date
        tmp_to = txq_year2 & "-" & txq_month2 & "-" & txq_date2
        If (IsDate(tmp_from) And IsDate(tmp_to)) Then
        ptime = tmp_from & " " & "00:00"
        ptime2 = tmp_to & " " & "00:00"
        Else: MsgBox "ค่าวันที่ไม่ถูกต้อง", OK = vbOKOnly, "Time Value Invalid"
        End If
        lsq1.ColumnHeaders(4).Text = "From"
        lsq1.ColumnHeaders(5).Text = "To"
        lsq1.ColumnHeaders(4).Width = 1500
        lsq1.ColumnHeaders(5).Width = 1500
        For i = 6 To 13
            lsq1.ColumnHeaders(i).Text = ""
        Next i
    End If

    If opq_hn.Value Then
        Call query1
    ElseIf cbq_sur.Text = "" Then
        If opq_ptime.Value = False Then
            Call query2
        Else
            Call query5
        End If
    ElseIf cbq_name.Text = "" Then
        If opq_ptime.Value = False Then
            Call query3
        Else
            Call query6
        End If
    ElseIf (cbq_name.Text <> "" And cbq_sur.Text <> "") Then
        If opq_ptime.Value = False Then
            Call query4
        Else
            Call query7
        End If
    End If
    register.MousePointer = 0
    Frame6.Enabled = True

GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub



Private Sub confirmi_Click()
Dim rowid_pic As Integer
On Error GoTo error1
    cbq_hn.DataChanged = True
    cbe_hn.DataChanged = True
    caninsert = txicheck()
    If caninsert = True Then
        rowid_pic = Insert_Pic(txi_pic)
        Call Insert_Patience(rowid_pic)
        confirmi.Enabled = False
    Else: MsgBox "กรุณาตรวจสอบค่าที่ใส่ให้ครบ", OK = vbOKOnly, "Insert Patience Error"
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Public Sub medarray()
On Error GoTo error1
    sql = "Select rowid,sci_name from medicine"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    nrecord = oVtable.TotalRecordCount - 1
    ReDim med_char(nrecord) As String
    ReDim med_id(nrecord) As Integer
    i = 0
    While Not oVtable.EOT
        med_id(i) = oVtable.Columns(1).Value
        med_char(i) = oVtable.Columns(2).Value
        lsi_medadd.AddItem (oVtable.Columns(2).Value)
        oVtable.NextRecord
        i = i + 1
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub disarray()
On Error GoTo error1
    sql = "execute procedure set2table_disease('" & forever & "');"
    'sql = " { Call set2result_disease('" & forever & "') }"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "Select * from result_rowchar"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    nrecord = oVtable.TotalRecordCount - 1
    ReDim dis_char(nrecord) As String
    ReDim dis_id(nrecord) As Integer
    i = 0
    While Not oVtable.EOT
        dis_id(i) = oVtable.Columns(1).Value
        dis_char(i) = oVtable.Columns(3).Value
        lsi_disadd.AddItem (oVtable.Columns(3).Value)
        oVtable.NextRecord
        i = i + 1
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Sub namearray()
Dim oVtable1 As ddoTable
Dim oVtable2 As ddoTable
On Error GoTo error1
    sql = "execute function CAPN()"
    Set oVtable1 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    nrecord = oVtable1.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable1.Name)
    ReDim name_char(nrecord - 1)
    ReDim name_id(nrecord - 1)
    i = 0
    sql = "select rowid from patience"
    Set oVtable1 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    While Not oVtable1.EOT
    rowid_patience = oVtable1.Columns(1).Value
    sql = "execute procedure allname(" & rowid_patience & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    While Not oVtable2.EOT
        name_char(i) = Trim(oVtable2.Columns(1).Value)
        name_id(i) = rowid_patience
        i = i + 1
        oVtable2.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
    oVtable1.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable1.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Sub surarray()
Dim oVtable1 As ddoTable
Dim oVtable2 As ddoTable
On Error GoTo error1
    sql = "execute function CAPS()"
    Set oVtable1 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    nrecord = oVtable1.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable1.Name)
    ReDim sur_char(nrecord - 1)
    ReDim sur_id(nrecord - 1)
    i = 0
    sql = "select rowid from patience"
    Set oVtable1 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    While Not oVtable1.EOT
    rowid_patience = oVtable1.Columns(1).Value
    sql = "execute procedure allsurname(" & rowid_patience & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    While Not oVtable2.EOT
        sur_char(i) = Trim(oVtable2.Columns(1).Value)
        sur_id(i) = rowid_patience
        i = i + 1
        oVtable2.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
    oVtable1.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable1.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Public Sub Insert_ini()
Dim sql As String
Dim oVtable As ddoTable
Dim tmparr(1 To 100, 1 To 3) As String
Dim tmpstr As String
Dim pasrow, pasrownext As Long

    'GET SET DISEASE TO DIS ARRAY
    Call disarray
    
    'GET SET MEDICNE TO MED ARRAY
    Call medarray

'While Not oVtable.EOT
'        i = 1
'        tmpstr = oVtable.Columns(1).Value
'        While i < Len(tmpstr)
'            posrow = InStr(i, tmpstr, "ROW(")
'            If posrow <> 0 Then
'            posrownext = InStr(posrow + 1, tmpstr, "ROW")
'            If posrownext = 0 Then
'                posrownext = InStr(posrow, tmpstr, ")")
'                i = Len(tmpstr)
'
'            Else: i = posrownext + 1
'            End If
'            Else: i = Len(tmpstr)
'            End If
'            Wend
'        oVtable.NextRecord
'Wend
    
End Sub


Sub tab0_ini()
On Error GoTo error1
Call namearray
Call surarray
cbq_name.List(0) = ""
For i = 0 To UBound(name_id)
    For j = 0 To cbq_name.ListCount
    If cbq_name.List(j) <> name_char(i) Then
        found = False
    Else: found = True
            Exit For
    End If
    Next j
    If Not found Then cbq_name.AddItem (name_char(i))
Next i
cbq_sur.List(0) = ""
For i = 0 To UBound(sur_id)
    For j = 0 To cbq_sur.ListCount
    If cbq_sur.List(j) <> sur_char(i) Then
        found = False
    Else: found = True
            Exit For
    End If
    Next j
    If Not found Then cbq_sur.AddItem (sur_char(i))
Next i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub Form_activate()
    datetime = CalDate()
    register.MousePointer = 11
    register.Visible = False
    Call Insert_ini
    SSTab1_Click (SSTab1.Tab)
    register.Visible = True
    register.MousePointer = 0
End Sub

Private Sub Form_Load()
Set oEngine = CreateObject("datadirector.engine")
Set oModel = oEngine.Models("G:\Informix\Data Director\nuvo_hospital.mlx")
Set oProject = oEngine.CurrentProject
'Set oRoutine = oProject.DataGroups.ROUTINE
'Dim oEngine As ddoEngine
'Dim oProject As ddoProject
'Dim oModel As ddoModel
'Dim oDataGroup As ddoDataGroups
'Dim olnkhn As ddoDataLink
'Dim oLogonInfo As ddoLogonInfo

'Set oEngine = CreateObject("DataDirector.Engine")
'Set oEngine = New ddoEngine
'Set oProject = oEngine.CurrentProject
'Set oModel = oEngine.Models("G:\Informix\Data Director\nuvo_hospital.mlx")
'Set oDataGroup = oProject.DataGroups
'
   
'End If
cbq_hn.DataChanged = True
cbe_hn.DataChanged = True
End Sub







Private Sub lsq1_ItemClick(ByVal Item As MSComctlLib.ListItem)
On Error GoTo error1
    listno = lsq1.SelectedItem.index
    rowid_patience = id_col(listno - 1)
    lsq3.ListItems.clear
    Set pic_q.Picture = LoadPicture(App.Path & "\null.jpg")
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub


Private Sub op_nontemp_Click()
    op_temp.Value = False
    op_nontemp.Value = True
    ch_name.Value = 1
    ch_sur.Value = 1
    ch_pic.Value = 1
    txe_birth.Enabled = True
    txe_birth.BackColor = &H80000005
    txe_id.Enabled = True
    txe_id.BackColor = &H80000005
    txe_gblood.Enabled = True
    txe_gblood.BackColor = &H80000005
    ope_male.Enabled = True
    ope_female.Enabled = True
    ch_add.Value = 1
    ch_tel.Value = 1
    ch_dis.Value = 1
    ch_med.Value = 1
End Sub

Private Sub op_temp_Click()
    op_temp.Value = True
    op_nontemp.Value = False
    ch_name.Value = 0
    ch_sur.Value = 0
    ch_pic.Value = 0
    txe_birth.Enabled = False
    txe_birth.BackColor = &H8000000B
    txe_id.Enabled = False
    txe_id.BackColor = &H8000000B
    txe_gblood.Enabled = False
    txe_gblood.BackColor = &H8000000B
    ope_male.Enabled = False
    ope_female.Enabled = False
    ch_add.Value = 0
    ch_tel.Value = 0
    ch_dis.Value = 0
    ch_med.Value = 0
End Sub

Private Sub opq_current_Click()
    If opq_current.Enabled = True Then
        txq_year.Enabled = False
        txq_month.Enabled = False
        txq_date.Enabled = False
        txq_year2.Enabled = False
        txq_month2.Enabled = False
        txq_date2.Enabled = False
        txq_year = YYYY
        txq_month = MM
        txq_date = DD
        txq_year2 = 9999
        txq_month2 = 12
        txq_date2 = 31
    End If
End Sub

Private Sub opq_hn_Click()
    If opq_hn.Value = True Then
        cbq_hn.Enabled = True
        cbq_name.Text = ""
        cbq_sur.Text = ""
        cbq_name.Enabled = False
        cbq_sur.Enabled = False
        cmq_query1.Enabled = True
        opq_nonsequenced.Enabled = False
        opq_ptime.Enabled = False
    End If
End Sub

Private Sub opq_name_Click()
    If opq_name.Value = True Then
        cbq_hn.Enabled = False
        cbq_name.Enabled = True
        cbq_sur.Enabled = True
        cbq_hn.Text = ""
        cmq_query1.Enabled = True
        opq_nonsequenced.Enabled = True
    End If
End Sub

Private Sub opq_nonsequenced_Click()
    If opq_nonsequenced.Enabled = True Then
        txq_year.Enabled = False
        txq_month.Enabled = False
        txq_date.Enabled = False
        txq_year2.Enabled = False
        txq_month2.Enabled = False
        txq_date2.Enabled = False
        txq_year = YYYY
        txq_month = MM
        txq_date = DD
        txq_year2 = 9999
        txq_month2 = 12
        txq_date2 = 31
    End If
End Sub

Private Sub opq_ptime_Click()
    If opq_ptime.Value = True Then
        txq_year.Enabled = True
        txq_month.Enabled = True
        txq_date.Enabled = True
        txq_year2.Enabled = True
        txq_month2.Enabled = True
        txq_date2.Enabled = True
        
    End If
End Sub


Private Sub SSTab1_Click(PreviousTab As Integer)
Dim oVtable As ddoTable
On Error GoTo error1
    lsq1.ListItems.clear
    If (SSTab1.Tab = 0) Then
        sql = "select hn from patience"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        If Not oVtable Is Nothing Then
        register.MousePointer = 11
        cbq_hn.clear
        nrecord = 0
        While Not oVtable.EOT
            nrecord = nrecord + 1
            oVtable.NextRecord
        Wend
        nrecord = nrecord - 1
        ReDim id_col(nrecord) As Integer
        i = 0
        oVtable.FirstRecord
        While Not oVtable.EOT
            cbq_hn.AddItem (oVtable.Columns(1).Value)
            id_col(i) = oVtable.Columns(1).Value
            i = i + 1
            oVtable.NextRecord
        Wend
        Call tab0_ini
        register.MousePointer = 0
        Else: GoTo error2
        End If
    ElseIf SSTab1.Tab = 2 Then
        sql = "select hn from patience"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        If Not oVtable Is Nothing Then
        register.MousePointer = 11
        cbe_hn.clear
        nrecord = 0
        While Not oVtable.EOT
            nrecord = nrecord + 1
            oVtable.NextRecord
        Wend
        nrecord = nrecord - 1
        ReDim id_col(nrecord) As Integer
        i = 0
        oVtable.FirstRecord
        While Not oVtable.EOT
            cbe_hn.AddItem (oVtable.Columns(1).Value)
            id_col(i) = oVtable.Columns(1).Value
            i = i + 1
            oVtable.NextRecord
        Wend
        register.MousePointer = 0
        Else: GoTo error2
        End If
    End If

GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
GoTo end1
error2: MsgBox "ไม่มีผู้ป่วยในโรงพยาบาลเลย กรุณา INSERT ก่อน", vbOKOnly, "System Message"
        SSTab1.Tab = 1

end1:
End Sub

Private Sub Timer1_Timer()
    If Timer1.Interval > 0 Then
        datetime = CalDate
        tx_datetime = datetime
    End If
End Sub
'Private Sub DataDirector_Info()
'[DataDirectorInfoStart]
'NumDataLinks=2
'[DataLink]
'GroupName=patience
'ControlName=cbe_hn
'ClassId=2
'Synchronize=0
'GetAllData=1
'StoreSelect=1
'SortOrder=0
'SortFlag=0
'DefaultType=0
'TrimTrailingBlanks=0
'DataSource=patience_nav
'DataField=hn
'AssociationType=2
'SourceType=1
'[DataLinkButtonInfo]
'[EndDataLinkButtonInfo]
'[DataLinkPath]
'NumElements=1
'[DataLinkPathInfo]
'TableName=patience
'NumColumns=1
'ColumnName=hn
'[EndDataLinkPathInfo]
'[EndDataLinkPath]
'[EndDataLink]
'[DataLink]
'GroupName=patience
'ControlName=cbq_hn
'ClassId=2
'Synchronize=0
'GetAllData=1
'StoreSelect=1
'SortOrder=0
'SortFlag=0
'DefaultType=0
'TrimTrailingBlanks=0
'DataSource=patience_nav
'DataField=hn
'AssociationType=2
'SourceType=1
'[DataLinkButtonInfo]
'[EndDataLinkButtonInfo]
'[DataLinkPath]
'NumElements=1
'[DataLinkPathInfo]
'TableName=patience
'NumColumns=1
'ColumnName=hn
'[EndDataLinkPathInfo]
'[EndDataLinkPath]
'[EndDataLink]
'[DataDirectorInfoEnd]
'End Sub
