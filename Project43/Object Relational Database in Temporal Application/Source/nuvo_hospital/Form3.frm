VERSION 5.00
Object = "{BF448208-70DE-11CF-947B-0020AF75C4BA}#1.0#0"; "navctl32.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Form3 
   Caption         =   "DIAGNOSIS RESULTS"
   ClientHeight    =   9600
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11880
   Icon            =   "Form3.frx":0000
   LinkTopic       =   "Form3"
   Picture         =   "Form3.frx":030A
   ScaleHeight     =   9600
   ScaleWidth      =   11880
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox tx_datetime 
      BackColor       =   &H8000000B&
      Height          =   285
      Left            =   9840
      TabIndex        =   124
      Top             =   240
      Width           =   1455
   End
   Begin VB.Timer Timer1 
      Left            =   8400
      Top             =   120
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   8505
      Left            =   360
      TabIndex        =   0
      Top             =   840
      Width           =   10995
      _ExtentX        =   19394
      _ExtentY        =   15002
      _Version        =   393216
      Tabs            =   5
      Tab             =   1
      TabsPerRow      =   5
      TabHeight       =   882
      TabCaption(0)   =   "Query"
      TabPicture(0)   =   "Form3.frx":17667C
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "cmd_exit(0)"
      Tab(0).Control(1)=   "Frame2"
      Tab(0).ControlCount=   2
      TabCaption(1)   =   "New Record"
      TabPicture(1)   =   "Form3.frx":176996
      Tab(1).ControlEnabled=   -1  'True
      Tab(1).Control(0)=   "Frame9"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "cmn_confirm"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).Control(2)=   "cmd_exit(1)"
      Tab(1).Control(2).Enabled=   0   'False
      Tab(1).ControlCount=   3
      TabCaption(2)   =   "LAB RESULT"
      TabPicture(2)   =   "Form3.frx":176CB0
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "cmd_exit(2)"
      Tab(2).Control(1)=   "Frame5"
      Tab(2).ControlCount=   2
      TabCaption(3)   =   "X-RAY RESULT"
      TabPicture(3)   =   "Form3.frx":176FCA
      Tab(3).ControlEnabled=   0   'False
      Tab(3).Control(0)=   "cmd_exit(3)"
      Tab(3).Control(1)=   "Frame14"
      Tab(3).ControlCount=   2
      TabCaption(4)   =   "MEDICAL RESULT"
      TabPicture(4)   =   "Form3.frx":1772E4
      Tab(4).ControlEnabled=   0   'False
      Tab(4).Control(0)=   "cmd_exit(4)"
      Tab(4).Control(1)=   "Frame4"
      Tab(4).ControlCount=   2
      Begin VB.CommandButton cmd_exit 
         Caption         =   "EXIT"
         Height          =   495
         Index           =   4
         Left            =   -65520
         TabIndex        =   29
         Top             =   7800
         Width           =   1095
      End
      Begin VB.CommandButton cmd_exit 
         Caption         =   "EXIT"
         Height          =   495
         Index           =   3
         Left            =   -65520
         TabIndex        =   129
         Top             =   7800
         Width           =   1095
      End
      Begin VB.CommandButton cmd_exit 
         Caption         =   "EXIT"
         Height          =   495
         Index           =   2
         Left            =   -65520
         TabIndex        =   128
         Top             =   7800
         Width           =   1095
      End
      Begin VB.CommandButton cmd_exit 
         Caption         =   "EXIT"
         Height          =   735
         Index           =   1
         Left            =   9480
         Picture         =   "Form3.frx":1775FE
         Style           =   1  'Graphical
         TabIndex        =   127
         Top             =   7680
         Width           =   1215
      End
      Begin VB.Frame Frame4 
         Caption         =   "ผลการสั่งยา"
         Height          =   7095
         Left            =   -74640
         TabIndex        =   111
         Top             =   600
         Width           =   10215
         Begin VB.Frame Frame11 
            Caption         =   "Condition"
            Height          =   1215
            Left            =   0
            TabIndex        =   115
            Top             =   240
            Width           =   10215
            Begin VB.TextBox txm_name 
               Enabled         =   0   'False
               Height          =   285
               Left            =   3960
               TabIndex        =   117
               Top             =   360
               Width           =   1935
            End
            Begin VB.TextBox txm_sur 
               Enabled         =   0   'False
               Height          =   285
               Left            =   6960
               TabIndex        =   116
               Top             =   360
               Width           =   1935
            End
            Begin VB.ComboBox cbm_hn 
               DataSource      =   "patience_nav"
               Height          =   315
               Left            =   720
               Sorted          =   -1  'True
               TabIndex        =   25
               Top             =   360
               Width           =   2175
            End
            Begin VB.TextBox txm_datetime 
               Enabled         =   0   'False
               Height          =   285
               Left            =   960
               TabIndex        =   26
               Top             =   840
               Width           =   1935
            End
            Begin VB.CommandButton cmm_query 
               Caption         =   "Query"
               Enabled         =   0   'False
               Height          =   375
               Left            =   3240
               TabIndex        =   27
               Top             =   720
               Width           =   975
            End
            Begin VB.Label Label24 
               Caption         =   "H.N."
               Height          =   255
               Left            =   360
               TabIndex        =   121
               Top             =   360
               Width           =   375
            End
            Begin VB.Label Label23 
               Caption         =   "ชื่อ"
               Height          =   255
               Left            =   3600
               TabIndex        =   120
               Top             =   360
               Width           =   255
            End
            Begin VB.Label Label22 
               Caption         =   "นามสกุล"
               Height          =   255
               Left            =   6240
               TabIndex        =   119
               Top             =   360
               Width           =   735
            End
            Begin VB.Label Label21 
               Caption         =   "วันเวลา"
               Height          =   255
               Left            =   360
               TabIndex        =   118
               Top             =   840
               Width           =   615
            End
         End
         Begin VB.Frame Frame6 
            Caption         =   "ผลการสั่งยา ทั้งหมดทุกช่วงเวลา จำแนกตามชนิด"
            Enabled         =   0   'False
            Height          =   5535
            Left            =   4440
            TabIndex        =   112
            Top             =   1560
            Width           =   5775
            Begin MSComctlLib.ListView lsm3 
               Height          =   4695
               Left            =   2400
               TabIndex        =   113
               Top             =   360
               Width           =   3015
               _ExtentX        =   5318
               _ExtentY        =   8281
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
                  Text            =   "ผล"
                  Object.Width           =   1411
               EndProperty
               BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   1
                  Text            =   "Valid From"
                  Object.Width           =   2117
               EndProperty
               BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   2
                  Text            =   "Valid To"
                  Object.Width           =   2117
               EndProperty
            End
            Begin MSComctlLib.ListView lsm1 
               Height          =   3255
               Left            =   240
               TabIndex        =   28
               Top             =   840
               Width           =   1815
               _ExtentX        =   3201
               _ExtentY        =   5741
               View            =   2
               LabelEdit       =   1
               LabelWrap       =   -1  'True
               HideSelection   =   0   'False
               _Version        =   393217
               ForeColor       =   -2147483640
               BackColor       =   -2147483643
               BorderStyle     =   1
               Appearance      =   1
               NumItems        =   0
            End
            Begin VB.Label Label3 
               Caption         =   "เลือกผลแลปที่ต้องการ"
               Height          =   255
               Left            =   360
               TabIndex        =   114
               Top             =   480
               Width           =   1575
            End
         End
         Begin MSComctlLib.ListView lsm2 
            Height          =   4815
            Left            =   240
            TabIndex        =   122
            Top             =   2040
            Width           =   3975
            _ExtentX        =   7011
            _ExtentY        =   8493
            View            =   3
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            FullRowSelect   =   -1  'True
            GridLines       =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   1
            Enabled         =   0   'False
            NumItems        =   4
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "ชื่อยา"
               Object.Width           =   1764
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Text            =   "จำนวนที่สั่ง"
               Object.Width           =   1764
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Text            =   "T_ST"
               Object.Width           =   1764
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Text            =   "T_SP"
               Object.Width           =   1764
            EndProperty
         End
         Begin VB.Label medresult 
            Caption         =   "ผลการสั่งยา ทั้งหมด ณ"
            Height          =   255
            Left            =   240
            TabIndex        =   123
            Top             =   1680
            Width           =   3735
         End
      End
      Begin VB.Frame Frame14 
         Caption         =   "ผล X-RAY"
         Height          =   6855
         Left            =   -74640
         TabIndex        =   77
         Top             =   600
         Width           =   10215
         Begin VB.Frame Frame17 
            Caption         =   "ผล"
            Height          =   5535
            Left            =   0
            TabIndex        =   107
            Top             =   1320
            Width           =   10215
            Begin VB.ComboBox cbx_datetime 
               Enabled         =   0   'False
               Height          =   315
               Left            =   1080
               TabIndex        =   22
               Top             =   2520
               Width           =   2175
            End
            Begin VB.CommandButton cmx_next 
               Caption         =   "NEXT >> "
               Enabled         =   0   'False
               Height          =   375
               Left            =   2880
               TabIndex        =   24
               Top             =   3120
               Width           =   855
            End
            Begin VB.CommandButton cmx_back 
               Caption         =   "<< BACK"
               Enabled         =   0   'False
               Height          =   375
               Left            =   360
               TabIndex        =   23
               Top             =   3120
               Width           =   855
            End
            Begin VB.ComboBox cbx_xray 
               Height          =   315
               Left            =   480
               TabIndex        =   21
               Top             =   240
               Width           =   3375
            End
            Begin VB.Label txx_from 
               Caption         =   "Valid From  : YYYY-MM-DD XX:XX"
               Height          =   255
               Left            =   1200
               TabIndex        =   110
               Top             =   4920
               Width           =   2535
            End
            Begin VB.Label txx_to 
               Caption         =   "TO : YYYY-MM-DD XX:XX"
               Height          =   255
               Left            =   1800
               TabIndex        =   109
               Top             =   5160
               Width           =   1935
            End
            Begin VB.Label Label5 
               Caption         =   "วันเวลา"
               Height          =   255
               Left            =   360
               TabIndex        =   108
               Top             =   2520
               Width           =   615
            End
            Begin VB.Image imgx 
               Height          =   5175
               Left            =   4080
               Stretch         =   -1  'True
               Top             =   240
               Width           =   5895
            End
         End
         Begin VB.Frame Frame16 
            Caption         =   "Condition"
            Height          =   975
            Left            =   0
            TabIndex        =   79
            Top             =   240
            Width           =   10215
            Begin VB.TextBox txx_name 
               Height          =   285
               Left            =   3960
               TabIndex        =   81
               Top             =   360
               Width           =   1935
            End
            Begin VB.TextBox txx_sur 
               Height          =   285
               Left            =   6960
               TabIndex        =   80
               Top             =   360
               Width           =   1935
            End
            Begin VB.ComboBox cbx_hn 
               Height          =   315
               Left            =   720
               Sorted          =   -1  'True
               TabIndex        =   20
               Top             =   360
               Width           =   2175
            End
            Begin VB.Label Label35 
               Caption         =   "H.N."
               Height          =   255
               Left            =   360
               TabIndex        =   84
               Top             =   360
               Width           =   375
            End
            Begin VB.Label Label34 
               Caption         =   "ชื่อ"
               Height          =   255
               Left            =   3600
               TabIndex        =   83
               Top             =   360
               Width           =   255
            End
            Begin VB.Label Label33 
               Caption         =   "นามสกุล"
               Height          =   255
               Left            =   6240
               TabIndex        =   82
               Top             =   360
               Width           =   735
            End
         End
      End
      Begin VB.CommandButton cmd_exit 
         Caption         =   "EXIT"
         Height          =   495
         Index           =   0
         Left            =   -65400
         TabIndex        =   56
         Top             =   7800
         Width           =   1095
      End
      Begin VB.Frame Frame5 
         Caption         =   "ผลแลป"
         Height          =   7095
         Left            =   -74640
         TabIndex        =   51
         Top             =   600
         Width           =   10215
         Begin VB.Frame Frame15 
            Caption         =   "ผล LAB ทั้งหมดทุกช่วงเวลา จำแนกตามชนิด"
            Enabled         =   0   'False
            Height          =   5535
            Left            =   4440
            TabIndex        =   65
            Top             =   1560
            Width           =   5775
            Begin MSComctlLib.ListView lsl3 
               Height          =   4695
               Left            =   2400
               TabIndex        =   78
               Top             =   360
               Width           =   3015
               _ExtentX        =   5318
               _ExtentY        =   8281
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
                  Text            =   "ผล"
                  Object.Width           =   1411
               EndProperty
               BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   1
                  Text            =   "Valid From"
                  Object.Width           =   2117
               EndProperty
               BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   2
                  Text            =   "Valid To"
                  Object.Width           =   2117
               EndProperty
            End
            Begin MSComctlLib.ListView lsl1 
               Height          =   3255
               Left            =   240
               TabIndex        =   19
               Top             =   840
               Width           =   1815
               _ExtentX        =   3201
               _ExtentY        =   5741
               View            =   2
               LabelEdit       =   1
               LabelWrap       =   -1  'True
               HideSelection   =   0   'False
               FullRowSelect   =   -1  'True
               _Version        =   393217
               ForeColor       =   -2147483640
               BackColor       =   -2147483643
               BorderStyle     =   1
               Appearance      =   1
               NumItems        =   0
            End
            Begin VB.Label Label7 
               Caption         =   "เลือกผลแลปที่ต้องการ"
               Height          =   255
               Left            =   360
               TabIndex        =   105
               Top             =   480
               Width           =   1575
            End
         End
         Begin VB.Frame Frame12 
            Caption         =   "Condition"
            Height          =   1215
            Left            =   0
            TabIndex        =   52
            Top             =   240
            Width           =   10215
            Begin VB.CommandButton cml_query 
               Caption         =   "Query"
               Enabled         =   0   'False
               Height          =   375
               Left            =   3240
               TabIndex        =   18
               Top             =   720
               Width           =   975
            End
            Begin VB.TextBox txl_datetime 
               Enabled         =   0   'False
               Height          =   285
               Left            =   960
               TabIndex        =   17
               Top             =   840
               Width           =   1935
            End
            Begin VB.ComboBox cbl_hn 
               Height          =   315
               Left            =   720
               Sorted          =   -1  'True
               TabIndex        =   16
               Top             =   360
               Width           =   2175
            End
            Begin VB.TextBox txl_sur 
               Enabled         =   0   'False
               Height          =   285
               Left            =   6960
               TabIndex        =   61
               Top             =   360
               Width           =   1935
            End
            Begin VB.TextBox txl_name 
               Enabled         =   0   'False
               Height          =   285
               Left            =   3960
               TabIndex        =   60
               Top             =   360
               Width           =   1935
            End
            Begin VB.Label Label4 
               Caption         =   "วันเวลา"
               Height          =   255
               Left            =   360
               TabIndex        =   103
               Top             =   840
               Width           =   615
            End
            Begin VB.Label Label32 
               Caption         =   "นามสกุล"
               Height          =   255
               Left            =   6240
               TabIndex        =   55
               Top             =   360
               Width           =   735
            End
            Begin VB.Label Label31 
               Caption         =   "ชื่อ"
               Height          =   255
               Left            =   3600
               TabIndex        =   54
               Top             =   360
               Width           =   255
            End
            Begin VB.Label Label30 
               Caption         =   "H.N."
               Height          =   255
               Left            =   360
               TabIndex        =   53
               Top             =   360
               Width           =   375
            End
         End
         Begin MSComctlLib.ListView lsl2 
            Height          =   4815
            Left            =   240
            TabIndex        =   104
            Top             =   2040
            Width           =   3975
            _ExtentX        =   7011
            _ExtentY        =   8493
            View            =   3
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            FullRowSelect   =   -1  'True
            GridLines       =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   1
            Enabled         =   0   'False
            NumItems        =   7
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "ชื่อแลป"
               Object.Width           =   1764
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Text            =   "ผลการตรวจ"
               Object.Width           =   1764
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Text            =   "หน่วย"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Text            =   "ค่าต่ำสุด"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   4
               Text            =   "ค่าสูงสุด"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   5
               Text            =   "T_ST"
               Object.Width           =   1764
            EndProperty
            BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   6
               Text            =   "T_SP"
               Object.Width           =   1764
            EndProperty
         End
         Begin VB.Label labresult 
            Caption         =   "ผล LAB ทั้งหมด ณ"
            Height          =   255
            Left            =   240
            TabIndex        =   106
            Top             =   1680
            Width           =   3735
         End
      End
      Begin VB.CommandButton cmn_confirm 
         Caption         =   "Confirm"
         Height          =   735
         Left            =   7560
         Picture         =   "Form3.frx":177908
         Style           =   1  'Graphical
         TabIndex        =   15
         Top             =   7680
         Width           =   1575
      End
      Begin VB.Frame Frame2 
         Height          =   7095
         Left            =   -74640
         TabIndex        =   30
         Top             =   600
         Width           =   10335
         Begin VB.Frame Frame1 
            Caption         =   "Condition"
            Height          =   1215
            Left            =   120
            TabIndex        =   64
            Top             =   120
            Width           =   3495
            Begin VB.ComboBox cbq_hn 
               DataSource      =   "patience_nav"
               BeginProperty Font 
                  Name            =   "MS Dialog"
                  Size            =   7.5
                  Charset         =   222
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   315
               Left            =   960
               Sorted          =   -1  'True
               Style           =   2  'Dropdown List
               TabIndex        =   1
               Top             =   480
               Width           =   1935
            End
            Begin VB.Label Label1 
               Caption         =   "H.N."
               Height          =   375
               Left            =   480
               TabIndex        =   76
               Top             =   480
               Width           =   375
            End
         End
         Begin VB.Frame Frame13 
            Caption         =   "รายละเอียดคนไข้"
            Enabled         =   0   'False
            Height          =   2055
            Left            =   3600
            TabIndex        =   57
            Top             =   120
            Width           =   6615
            Begin VB.TextBox txq_med 
               Height          =   285
               Left            =   960
               TabIndex        =   99
               Top             =   1560
               Width           =   3975
            End
            Begin VB.TextBox txq_bgroup 
               Height          =   285
               Left            =   4080
               TabIndex        =   97
               Top             =   720
               Width           =   375
            End
            Begin VB.TextBox txq_birth 
               Height          =   285
               Left            =   2040
               TabIndex        =   95
               Top             =   720
               Width           =   975
            End
            Begin VB.TextBox txq_sex 
               Height          =   285
               Left            =   600
               TabIndex        =   93
               Top             =   720
               Width           =   495
            End
            Begin VB.TextBox txq_dis 
               Height          =   285
               Left            =   600
               TabIndex        =   70
               Top             =   1200
               Width           =   4335
            End
            Begin VB.TextBox txq_sur 
               Height          =   285
               Left            =   3240
               TabIndex        =   63
               Top             =   240
               Width           =   1695
            End
            Begin VB.TextBox txq_name 
               Height          =   285
               Left            =   600
               TabIndex        =   62
               Top             =   240
               Width           =   1935
            End
            Begin VB.Image img_pat 
               Height          =   1575
               Left            =   5160
               Stretch         =   -1  'True
               Top             =   240
               Width           =   1215
            End
            Begin VB.Label Label29 
               Caption         =   "ยาที่แพ้"
               Height          =   255
               Left            =   240
               TabIndex        =   100
               Top             =   1560
               Width           =   615
            End
            Begin VB.Label Label27 
               Caption         =   "กรุ๊ปเลือด"
               Height          =   255
               Left            =   3240
               TabIndex        =   98
               Top             =   720
               Width           =   735
            End
            Begin VB.Label Label26 
               Caption         =   "วันเกิด"
               Height          =   255
               Left            =   1440
               TabIndex        =   96
               Top             =   720
               Width           =   495
            End
            Begin VB.Label Label2 
               Caption         =   "เพศ"
               Height          =   255
               Left            =   240
               TabIndex        =   94
               Top             =   720
               Width           =   375
            End
            Begin VB.Label Label48 
               Caption         =   "โรค"
               Height          =   255
               Left            =   240
               TabIndex        =   69
               Top             =   1200
               Width           =   375
            End
            Begin VB.Label Label44 
               Caption         =   "ชื่อ"
               Height          =   255
               Left            =   240
               TabIndex        =   59
               Top             =   240
               Width           =   255
            End
            Begin VB.Label textsurname 
               Caption         =   "นามสกุล"
               Height          =   255
               Left            =   2640
               TabIndex        =   58
               Top             =   240
               Width           =   735
            End
         End
         Begin VB.Frame Frame3 
            Caption         =   "ผลการวินิจฉัย"
            Enabled         =   0   'False
            Height          =   4935
            Left            =   120
            TabIndex        =   31
            Top             =   2040
            Width           =   10095
            Begin VB.TextBox txq_dn 
               Height          =   285
               Left            =   6720
               TabIndex        =   130
               Top             =   360
               Width           =   615
            End
            Begin VB.CommandButton cmq_next 
               Caption         =   "NEXT >>"
               Height          =   495
               Left            =   8760
               TabIndex        =   4
               Top             =   2880
               Width           =   975
            End
            Begin VB.CommandButton cmq_back 
               Caption         =   "<< BACK"
               Height          =   495
               Left            =   6720
               TabIndex        =   3
               Top             =   2880
               Width           =   975
            End
            Begin VB.TextBox txq_doc 
               Height          =   285
               Left            =   7680
               TabIndex        =   91
               Top             =   1080
               Width           =   1815
            End
            Begin VB.TextBox txq_height 
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
               Left            =   8160
               TabIndex        =   86
               Top             =   720
               Width           =   615
            End
            Begin VB.TextBox txq_weight 
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
               Left            =   8160
               TabIndex        =   85
               Top             =   360
               Width           =   615
            End
            Begin VB.ComboBox cbq_datetime 
               Height          =   315
               Left            =   7560
               TabIndex        =   2
               Top             =   2040
               Width           =   2175
            End
            Begin VB.Label Label12 
               Caption         =   "D.N."
               Height          =   255
               Left            =   6360
               TabIndex        =   131
               Top             =   360
               Width           =   375
            End
            Begin VB.Label txq_to 
               Caption         =   "TO : YYYY-MM-DD XX:XX"
               Height          =   255
               Left            =   6960
               TabIndex        =   102
               Top             =   3960
               Width           =   1935
            End
            Begin VB.Label txq_from 
               Caption         =   "Valid From  : YYYY-MM-DD XX:XX"
               Height          =   255
               Left            =   6360
               TabIndex        =   101
               Top             =   3720
               Width           =   2535
            End
            Begin VB.Label Label38 
               Caption         =   "ชื่อหมอผู้วินิจฉัย"
               Height          =   255
               Left            =   6360
               TabIndex        =   92
               Top             =   1080
               Width           =   1215
            End
            Begin VB.Label Label39 
               Caption         =   "เซนติเมตร"
               Height          =   255
               Left            =   8880
               TabIndex        =   90
               Top             =   720
               Width           =   855
            End
            Begin VB.Label Label40 
               Caption         =   "กิโลกรัม"
               Height          =   255
               Left            =   8880
               TabIndex        =   89
               Top             =   360
               Width           =   615
            End
            Begin VB.Label Label41 
               Caption         =   "ส่วนสูง"
               Height          =   255
               Left            =   7680
               TabIndex        =   88
               Top             =   720
               Width           =   495
            End
            Begin VB.Label Label42 
               Caption         =   "น้ำหนัก"
               Height          =   255
               Left            =   7560
               TabIndex        =   87
               Top             =   360
               Width           =   615
            End
            Begin VB.Label Label8 
               Caption         =   "วันเวลา"
               Height          =   255
               Left            =   6720
               TabIndex        =   32
               Top             =   2040
               Width           =   615
            End
            Begin VB.Image img1 
               Height          =   4575
               Left            =   120
               Stretch         =   -1  'True
               Top             =   240
               Width           =   6135
            End
         End
      End
      Begin VB.Frame Frame9 
         Height          =   7095
         Left            =   360
         TabIndex        =   33
         Top             =   600
         Width           =   10335
         Begin VB.Frame Frame10 
            Height          =   1815
            Left            =   120
            TabIndex        =   36
            Top             =   120
            Width           =   10095
            Begin MSComDlg.CommonDialog cmdialog 
               Left            =   9600
               Top             =   120
               _ExtentX        =   847
               _ExtentY        =   847
               _Version        =   393216
            End
            Begin VB.TextBox txn_docname 
               Enabled         =   0   'False
               Height          =   285
               Left            =   7440
               TabIndex        =   74
               Top             =   1320
               Width           =   2295
            End
            Begin VB.ComboBox cb_doccode 
               Height          =   315
               Left            =   6120
               Style           =   2  'Dropdown List
               TabIndex        =   9
               Top             =   1320
               Width           =   1095
            End
            Begin VB.TextBox txn_sur 
               Enabled         =   0   'False
               Height          =   285
               Left            =   3240
               TabIndex        =   72
               Top             =   720
               Width           =   1695
            End
            Begin VB.TextBox txn_name 
               Enabled         =   0   'False
               Height          =   285
               Left            =   480
               TabIndex        =   71
               Top             =   720
               Width           =   1935
            End
            Begin VB.CommandButton Command9 
               Caption         =   "Browse"
               Height          =   375
               Left            =   8880
               TabIndex        =   8
               Top             =   600
               Width           =   735
            End
            Begin VB.TextBox txn_resultdiag 
               Height          =   285
               Left            =   6120
               TabIndex        =   45
               Top             =   600
               Width           =   2415
            End
            Begin VB.TextBox txn_height 
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
               TabIndex        =   7
               Top             =   1320
               Width           =   615
            End
            Begin VB.TextBox txn_weight 
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
               Left            =   1200
               TabIndex        =   6
               Top             =   1320
               Width           =   615
            End
            Begin VB.ComboBox cbn_hn 
               DataSource      =   "patience_nav"
               BeginProperty Font 
                  Name            =   "MS Dialog"
                  Size            =   7.5
                  Charset         =   222
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   315
               Left            =   480
               Sorted          =   -1  'True
               TabIndex        =   5
               Top             =   240
               Width           =   1935
            End
            Begin VB.Label Label49 
               Caption         =   "รหัสหมอ"
               Height          =   255
               Left            =   6120
               TabIndex        =   73
               Top             =   1080
               Width           =   615
            End
            Begin VB.Label Label18 
               Caption         =   "ชื่อหมอผู้วินิจฉัย"
               Height          =   255
               Left            =   7440
               TabIndex        =   46
               Top             =   1080
               Width           =   1215
            End
            Begin VB.Label Label17 
               Caption         =   "ผลการวินิจฉัย"
               Height          =   255
               Left            =   6120
               TabIndex        =   44
               Top             =   360
               Width           =   1095
            End
            Begin VB.Label Label16 
               Caption         =   "เซนติเมตร"
               Height          =   255
               Left            =   4080
               TabIndex        =   43
               Top             =   1320
               Width           =   855
            End
            Begin VB.Label Label15 
               Caption         =   "กิโลกรัม"
               Height          =   255
               Left            =   1920
               TabIndex        =   42
               Top             =   1320
               Width           =   615
            End
            Begin VB.Label Label14 
               Caption         =   "ส่วนสูง"
               Height          =   255
               Left            =   2760
               TabIndex        =   41
               Top             =   1320
               Width           =   495
            End
            Begin VB.Label Label13 
               Caption         =   "น้ำหนัก"
               Height          =   255
               Left            =   600
               TabIndex        =   40
               Top             =   1320
               Width           =   615
            End
            Begin VB.Label Label11 
               Caption         =   "นามสกุล"
               Height          =   255
               Left            =   2520
               TabIndex        =   39
               Top             =   720
               Width           =   735
            End
            Begin VB.Label Label10 
               Caption         =   "ชื่อ"
               Height          =   255
               Left            =   120
               TabIndex        =   38
               Top             =   720
               Width           =   255
            End
            Begin VB.Label Label9 
               Caption         =   "H.N."
               Height          =   255
               Left            =   120
               TabIndex        =   37
               Top             =   240
               Width           =   375
            End
         End
         Begin VB.Frame Frame8 
            Caption         =   "แลปส่งตรวจ"
            Height          =   4935
            Left            =   5400
            TabIndex        =   35
            Top             =   2040
            Width           =   4815
            Begin MSComctlLib.ListView lsn_lab 
               Height          =   3615
               Left            =   960
               TabIndex        =   14
               Top             =   480
               Width           =   3015
               _ExtentX        =   5318
               _ExtentY        =   6376
               View            =   3
               LabelWrap       =   -1  'True
               HideSelection   =   -1  'True
               Checkboxes      =   -1  'True
               FullRowSelect   =   -1  'True
               _Version        =   393217
               ForeColor       =   -2147483640
               BackColor       =   -2147483643
               BorderStyle     =   1
               Appearance      =   1
               NumItems        =   1
               BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  Text            =   "ชื่อ LAB"
                  Object.Width           =   5292
               EndProperty
            End
            Begin VB.CommandButton clear 
               Caption         =   "Clear All"
               Height          =   495
               Left            =   2040
               TabIndex        =   47
               Top             =   4200
               Width           =   975
            End
         End
         Begin VB.Frame Frame7 
            Caption         =   "สั่งยารักษา"
            Height          =   4935
            Left            =   120
            TabIndex        =   34
            Top             =   2040
            Width           =   5055
            Begin MSComctlLib.ListView lsn_med 
               Height          =   2415
               Left            =   240
               TabIndex        =   75
               Top             =   2280
               Width           =   4455
               _ExtentX        =   7858
               _ExtentY        =   4260
               View            =   3
               LabelWrap       =   -1  'True
               HideSelection   =   -1  'True
               FullRowSelect   =   -1  'True
               GridLines       =   -1  'True
               _Version        =   393217
               ForeColor       =   -2147483640
               BackColor       =   -2147483643
               BorderStyle     =   1
               Appearance      =   1
               NumItems        =   3
               BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  Text            =   "รหัสยา"
                  Object.Width           =   1235
               EndProperty
               BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   1
                  Text            =   "ชื่อยา"
                  Object.Width           =   5292
               EndProperty
               BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   2
                  Text            =   "ปริมาณ"
                  Object.Width           =   1235
               EndProperty
            End
            Begin VB.ComboBox cbn_medcode 
               Height          =   315
               Left            =   240
               TabIndex        =   10
               Text            =   "เลือกรหัสยา"
               Top             =   240
               Width           =   1935
            End
            Begin VB.CommandButton cbn_rem 
               Caption         =   "<< REMOVE"
               Height          =   495
               Left            =   2040
               TabIndex        =   50
               Top             =   1680
               Width           =   1095
            End
            Begin VB.CommandButton cbn_add 
               Caption         =   "ADD >>"
               Height          =   495
               Left            =   600
               TabIndex        =   13
               Top             =   1680
               Width           =   1095
            End
            Begin VB.TextBox txn_quan 
               Height          =   285
               Left            =   840
               TabIndex        =   12
               Top             =   1200
               Width           =   855
            End
            Begin VB.ComboBox cbn_med 
               Height          =   315
               Left            =   240
               TabIndex        =   11
               Text            =   "หรือเลือกชื่อยา"
               Top             =   720
               Width           =   3255
            End
            Begin VB.Label Label20 
               Caption         =   "หน่วย"
               Height          =   255
               Left            =   1800
               TabIndex        =   49
               Top             =   1200
               Width           =   495
            End
            Begin VB.Label Label19 
               Caption         =   "ปริมาณ"
               Height          =   255
               Left            =   240
               TabIndex        =   48
               Top             =   1200
               Width           =   495
            End
         End
      End
   End
   Begin Navctl32Lib.NavControl patience_nav 
      Height          =   600
      Left            =   0
      TabIndex        =   68
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
   Begin Navctl32Lib.NavControl med_nav 
      Height          =   600
      Left            =   1320
      TabIndex        =   126
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
      Table           =   "medicine"
      DataGroup       =   "medicine"
      DefaultButtonSize=   1
      SaveButtonVisible=   -1  'True
      QueryButtonVisible=   -1  'True
      QBEButtonVisible=   -1  'True
      InsertButtonVisible=   -1  'True
      DeleteButtonVisible=   -1  'True
      LayoutMode      =   1
      ControlCount    =   14
      DisableChoreoEvents=   -1  'True
      NewStyle        =   -1  'True
      TableDataSource =   -1  'True
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
      Ctrl5Caption    =   "medicine - #"
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
   Begin VB.Label Label25 
      Caption         =   "DateTime ::"
      Height          =   255
      Left            =   8880
      TabIndex        =   125
      Top             =   240
      Width           =   855
   End
   Begin VB.Label Label46 
      Caption         =   "med_code"
      Height          =   300
      Left            =   -960
      TabIndex        =   67
      Top             =   3755
      Width           =   960
   End
   Begin VB.Label Label6 
      Caption         =   "med_code"
      Height          =   300
      Left            =   600
      TabIndex        =   66
      Top             =   8840
      Width           =   960
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public rowid_doc As Integer
Public rowid_med As Integer
Public rowid_patience As Integer
Public rowid_diag As Integer
Public rowid_pic As Integer
Public rowid_lab As Integer
Public c As Integer
Public n As Integer
Public p As Integer


Public Sub medarray()
On Error GoTo error1
    sql = "Select rowid,med_code,sci_name from medicine"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    nrecord = oVtable.TotalRecordCount - 1
    nmedarr = nrecord
    ReDim med_char(nrecord) As String
    ReDim med_id(nrecord) As Integer
    ReDim med_code(nrecord) As Integer
    i = 0
    While Not oVtable.EOT
        med_id(i) = oVtable.Columns(1).Value
        med_code(i) = oVtable.Columns(2).Value
        med_char(i) = oVtable.Columns(3).Value
        oVtable.NextRecord
        i = i + 1
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Public Sub docarray()
On Error GoTo error1
    sql = "execute procedure set2table_doctor('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select therowid, thecode,name from result_rowchar"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    i = 0
    nrecord = oVtable.TotalRecordCount - 1
    ReDim doc_char(nrecord) As String
    ReDim doc_id(nrecord) As Integer
    ReDim doc_code(nrecord) As Integer
    While Not oVtable.EOT
        doc_id(i) = oVtable.Columns(1).Value
        doc_code(i) = oVtable.Columns(2).Value
        doc_char(i) = oVtable.Columns(3).Value
        oVtable.NextRecord
        i = i + 1
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Public Sub disarray()
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
        oVtable.NextRecord
        i = i + 1
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Public Sub labarray()
On Error GoTo error1
    sql = "execute procedure set2table_lab();"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from lab_list"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    i = 0
    While Not oVtable.EOT
      i = i + 1
      oVtable.NextRecord
    Wend
    nrecord = i - 1
    ReDim lab_id(nrecord) As Integer
    ReDim lab_code(nrecord) As Integer
    ReDim lab_char(nrecord) As String
    ReDim lab_type(nrecord) As String
    i = 0
    oVtable.FirstRecord
    While Not oVtable.EOT
        lab_id(i) = oVtable.Columns(1).Value
        lab_code(i) = oVtable.Columns(2).Value
        lab_char(i) = oVtable.Columns(3).Value
        lab_type(i) = oVtable.Columns(4).Value
        oVtable.NextRecord
        i = i + 1
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub
Private Sub cb_doccode_Click()
On Error GoTo error1
    If cb_doccode.Text <> "" Then
    i = 0
    Do While doc_code(i) <> CInt(cb_doccode.Text)
    i = i + 1
    Loop
    txn_docname.Text = doc_char(i)
    rowid_doc = doc_id(i)
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbl_hn_Click()
Dim oVtable As ddoTable
Dim oVtable2 As ddoTable
Dim index As ListItem
    If cbl_hn.Text <> "" Then
    txl_name.Enabled = True
    txl_sur.Enabled = True
    txl_datetime.Enabled = True
    cml_query.Enabled = True
    lsl2.ListItems.clear
    lsl3.ListItems.clear
    txl_datetime = datetime
    End If
End Sub

Private Sub cbm_hn_click()
    If cbm_hn.Text <> "" Then
    txm_name.Enabled = True
    txm_sur.Enabled = True
    txm_datetime.Enabled = True
    cmm_query.Enabled = True
    lsm2.ListItems.clear
    lsm3.ListItems.clear
    txm_datetime = datetime
    End If
End Sub

Private Sub cbn_add_Click()
Dim index As ListItem
On Error GoTo error1
    If cbn_med.Text <> "หรือเลือกชื่อยา" And txn_quan <> "" Then
        Set index = lsn_med.ListItems.Add
        index.Text = cbn_medcode.Text
        index.SubItems(1) = cbn_med.Text
        index.SubItems(2) = txn_quan
        txn_quan = ""
        i = cbfindpos(cbn_med, cbn_med.Text)
        cbn_med.RemoveItem (i)
        cbn_medcode.RemoveItem (i)
        cbn_med = "หรือเลือกชื่อยา"
        cbn_medcode = "เลือกรหัสยา"
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub Cbn_hn_Click()
Dim oVtable As ddoTable
On Error GoTo error1
    If cbn_hn.Text <> "" Then
' FIND NAME FROM HN
    sql = "execute procedure current_pat_name('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar where code = """ & cbn_hn.Text & """"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_patience = oVtable.Columns(1).Value
    txn_name.Text = oVtable.Columns(3).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
'FIND SUR FROM HN
    sql = "execute procedure current_pat_sur('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar where code = """ & cbn_hn.Text & """"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txn_sur.Text = oVtable.Columns(3).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Function cbfindpos(obj As Object, str As String) As Integer
On Error GoTo error1
    i = 0
    Do While ((i <= obj.ListCount) And (obj.List(i) <> str))
        i = i + 1
    Loop
    cbfindpos = i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function

Private Sub cbn_med_Click()
On Error GoTo error1
    i = 0
    Do While ((med_char(i) <> cbn_med.Text) And (i <= UBound(med_id)))
    i = i + 1
    Loop
    cbn_medcode = med_code(i)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbn_medcode_Click()
On Error GoTo error1
    i = 0
    Do While ((med_code(i) <> cbn_medcode.Text) And (i <= UBound(med_id)))
    i = i + 1
    Loop
    cbn_med = med_char(i)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbn_rem_Click()
Dim index As ListItem
    i = lsn_med.SelectedItem.index
    cbn_medcode.AddItem (lsn_med.SelectedItem.Text)
    cbn_med.AddItem (lsn_med.SelectedItem.SubItems(1))
    lsn_med.ListItems.Remove (i)
End Sub

Function findposlab(str As String) As Integer
On Error GoTo error1
    i = 0
    Do While (lab_char(i) <> str)
    i = i + 1
    Loop
    findposlab = i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function

Function findposdiag(str As String) As Integer
On Error GoTo error1
    i = 0
    Do While (diag_to(i) <> str)
    i = i + 1
    Loop
    findposdiag = i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function

Sub getrowid_setoflab()
On Error GoTo error1
    c = 0
    n = 0
    p = 0
' find number of lab แต่ละชนิด  ตามที่เลือก
For j = 1 To lsn_lab.ListItems.Count
        If lsn_lab.ListItems(j).Checked = True Then
             X = lsn_lab.ListItems(j).Text
            i = 0
            Do While (lab_char(i) <> X)
            i = i + 1
            Loop
            If lab_type(i) = "c" Then
                c = c + 1
            ElseIf lab_type(i) = "n" Then
                n = n + 1
            ElseIf lab_type(i) = "p" Then
                p = p + 1
            End If
        End If
    Next j
If c > 0 Then ReDim rowid_setoflabc(c - 1) As Integer
If n > 0 Then ReDim rowid_setoflabn(n - 1) As Integer
If p > 0 Then ReDim rowid_setoflabp(p - 1) As Integer
   c = 0
   n = 0
   p = 0
   'เก็บค่า rowid ของ lab ลง set
    For j = 1 To lsn_lab.ListItems.Count
        If lsn_lab.ListItems(j).Checked = True Then
             X = lsn_lab.ListItems(j).Text
            i = 0
            Do While (lab_char(i) <> X)
            i = i + 1
            Loop
            If lab_type(i) = "c" Then
                rowid_setoflabc(c) = lab_id(i)
                c = c + 1
            ElseIf lab_type(i) = "n" Then
                rowid_setoflabn(n) = lab_id(i)
                n = n + 1
            ElseIf lab_type(i) = "p" Then
                rowid_setoflabp(p) = lab_id(i)
                p = p + 1
            End If
        End If
    Next j
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Sub getrowid_setofmed()
On Error GoTo error1
    X = lsn_med.ListItems.Count - 1
    If X >= 0 Then
            ReDim rowid_setofmed(X) As Integer
            ReDim rowid_setofmedquan(X) As Integer
    End If
    Y = 0
    For j = 1 To lsn_med.ListItems.Count
            X = lsn_med.ListItems(j).Text
            i = 0
            Do While (med_code(i) <> CInt(X))
            i = i + 1
            Loop
            rowid_setofmed(Y) = med_id(i)
            rowid_setofmedquan(Y) = lsn_med.ListItems(j).SubItems(2)
            Y = Y + 1
    Next j
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub
Sub insert_diagnosis()
On Error GoTo error1
    file = "filetoblob('" & txn_resultdiag & "','client')"
    sql = "insert into diagnosis values(0,'" & txn_weight & "','" & txn_height & "'," & rowid_doc & "," & file & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub
Sub update_patience()
On Error GoTo error1
    sql = "execute procedure UD2P (" & rowid_diag & "," & rowid_patience & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Sub getrowid_diag()
Dim oVtable As ddoTable
On Error GoTo error1
    sql = "select max(dia_code) from diagnosis"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    maxdia = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    sql = "select rowid from diagnosis where dia_code = " & maxdia
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_diag = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub
Sub insert_lab()
On Error GoTo error1
    X = 0
    For i = 1 To lsn_lab.ListItems.Count
    If lsn_lab.ListItems(i).Checked Then X = X + 1
    Next i
    If X > 0 Then
        If c > 0 Then
            For i = 0 To UBound(rowid_setoflabc)
            sql = "insert into LRCD values (" & rowid_diag & "," & rowid_setoflabc(i) & ",null)"
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
            Next i
        End If
        If n > 0 Then
            For i = 0 To UBound(rowid_setoflabn)
            sql = "insert into LRND values (" & rowid_diag & "," & rowid_setoflabn(i) & ",null)"
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
            Next i
        End If
        If p > 0 Then
            For i = 0 To UBound(rowid_setoflabp)
            sql = "insert into LRPD values (" & rowid_diag & "," & rowid_setoflabp(i) & ",null)"
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
            Next i
        End If
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Sub insert_med()
On Error GoTo error1
    X = lsn_med.ListItems.Count
    If X > 0 Then
    For i = 0 To UBound(rowid_setofmed)
    sql = "insert into MOD values (" & rowid_diag & "," & rowid_setofmed(i) & "," & rowid_setofmedquan(i) & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "execute procedure UMOPD(" & rowid_diag & "," & rowid_setofmed(i) & "," & rowid_setofmedquan(i) & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    Next i
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbq_datetime_Click()
On Error GoTo error1
    i = cbfindpos(cbq_datetime, cbq_datetime.Text)
    rowid_diag = diag_col(i)
    If i = UBound(diag_col) Then
        cmq_next.Enabled = False
    Else: cmq_next.Enabled = True
    End If
    If i = LBound(diag_col) Then
        cmq_back.Enabled = False
    Else: cmq_back.Enabled = True
    End If
    txq_from.Caption = "Valid From  : " & diag_from(i)
    txq_to.Caption = "TO : " & diag_to(i)
    sql = "select lotofile(diagnose_record,'" & App.Path & "\d.jpg!','client') from diagnosis where rowid = " & rowid_diag
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    Set img1.Picture = LoadPicture(App.Path & "\d.jpg")
    
    sql = "select weight,height,doctor from diagnosis where rowid = " & rowid_diag
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txq_weight = oVtable.Columns(1).Value
    txq_height = oVtable.Columns(2).Value
    txq_doc = oVtable.Columns(3).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "select dia_code from diagnosis where rowid = " & diag_col(i)
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txq_dn = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)

GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub


Private Sub cbq_hn_Click()
Dim oVtable As ddoTable
On Error GoTo error1
    If cbq_hn.Text <> "" Then
    Frame3.Enabled = True
    Frame13.Enabled = True
    Set img1.Picture = LoadPicture(App.Path & "\null.jpg")
    txq_weight = ""
    txq_height = ""
    txq_doc = ""
    cbq_datetime.clear
    cmq_back.Enabled = False
    cmq_next.Enabled = False

    sql = "select rowid,birthday,sex,blood_group from patience where hn = " & cbq_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_patience = oVtable.Columns(1).Value
    txq_birth = oVtable.Columns(2).Value
    txq_sex = oVtable.Columns(3).Value
    txq_bgroup = oVtable.Columns(4).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure atname(" & rowid_patience & ",'" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txq_name = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure atsurname(" & rowid_patience & ",'" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txq_sur = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure atdis(" & rowid_patience & ",'" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    While Not oVtable.EOT
        rowid = oVtable.Columns(1).Value
        If rowid <> "" Then
            sql = "select sci_name from disease where rowid = " & rowid
            Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
                txq_dis = txq_dis & Trim(oVtable2.Columns(1).Value) & "   "
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
        End If
        oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure atmed(" & rowid_patience & ",'" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    While Not oVtable.EOT
        rowid = oVtable.Columns(1).Value
        If rowid <> "" Then
            sql = "select sci_name from medicine where rowid = " & rowid
            Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
                txq_med = txq_med & Trim(oVtable.Columns(1).Value) & "   "
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
        End If
        oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure atpicture(" & rowid_patience & ",'" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_pic = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    sql = "select lotofile(pic,'" & App.Path & "\a.jpg!','client') from photo where rowid = " & rowid_pic
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    Set img_pat.Picture = LoadPicture(App.Path & "\a.jpg")
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure R2DI(" & rowid_patience & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "execute procedure checkresult_rowch();"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    nrecord = oVtable.TotalRecordCount - 1
If oVtable.Columns(1).Value <> "nothing" Then
    ReDim diag_col(nrecord) As Integer
    ReDim diag_from(nrecord) As String
    ReDim diag_to(nrecord) As String
    i = 0
    While Not oVtable.EOT
        diag_col(i) = oVtable.Columns(1).Value
            sql = "select dia_code from diagnosis where rowid = " & diag_col(i)
            Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        txq_dn = oVtable2.Columns(1).Value
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
        diag_from(i) = Replace(oVtable.Columns(4).Value, ":00.00000", "")
        diag_to(i) = Replace(oVtable.Columns(5).Value, ":00.00000", "")
        cbq_datetime.AddItem (diag_to(i))
        i = i + 1
        oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)

    i = findposdiag("9999-12-31 23:59")
    cbq_datetime.Text = diag_to(i)
    rowid_diag = diag_col(i)
    If i = UBound(diag_col) Then
        cmq_next.Enabled = False
    Else: cmq_next.Enabled = True
    End If
    If i = LBound(diag_col) Then
        cmq_back.Enabled = False
    Else: cmq_back.Enabled = True
    End If
    txq_from.Caption = "Valid From  : " & diag_from(i)
    txq_to.Caption = "TO : " & diag_to(i)
    sql = "select lotofile(diagnose_record,'" & App.Path & "\d.jpg!','client') from diagnosis where rowid = " & rowid_diag
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    Set img1.Picture = LoadPicture(App.Path & "\d.jpg")
    
    sql = "select weight,height,doctor from diagnosis where rowid = " & rowid_diag
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txq_weight = oVtable.Columns(1).Value
    txq_height = oVtable.Columns(2).Value
            
            rowid = oVtable.Columns(3).Value
            If rowid <> "" Then
            i = 0
            Do While doc_id(i) <> CInt(rowid)
                i = i + 1
            Loop
    txq_doc.Text = doc_char(i)
            End If

Else: MsgBox "ยังไม่เคยมีการวินิจฉัย", vbOKOnly, "No Data Match"
End If
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbx_datetime_Click()
On Error GoTo error1
    i = cbfindpos(cbx_datetime, cbx_datetime.Text)
    If i = UBound(setofdate) Then
         cmx_next.Enabled = False
    Else: cmx_next.Enabled = True
    End If
    If i = LBound(setofdate) Then
         cmx_back.Enabled = False
    Else: cmx_back.Enabled = True
    End If
    
    sql = "execute procedure RL2LRP(" & rowid_patience & "," & rowid_lab & ");"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result where t_st = '" & cbx_datetime & "'"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
        rowid_labphoto = oVtable.Columns(1).Value
        txx_from.Caption = "Valid From  : " & Replace(oVtable.Columns(2).Value, ":00.00000", "")
        txx_to.Caption = "To : " & Replace(oVtable.Columns(3).Value, ":00.00000", "")
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        sql = "select lotofile(pic,'" & App.Path & "\lab.jpg!','client') from photo where rowid = " & rowid_labphoto
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    End If
    Set imgx.Picture = LoadPicture(App.Path & "\lab.jpg")
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)

GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbx_hn_Click()
Dim oVtable As ddoTable
On Error GoTo error1
    If cbx_hn.Text <> "" Then
    cbx_xray.Enabled = False
    sql = "select rowid from patience where hn = " & cbx_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_patience = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure atname(" & rowid_patience & ",'" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txx_name = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure atsurname(" & rowid_patience & ",'" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txx_sur = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)

    sql = "execute procedure QLN(" & rowid_patience & ");"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "execute procedure checklab_list();"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from lab_list"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable.Columns(1).Value <> "nothing" Then
   nrecord = 0
    While Not oVtable.EOT
        nrecord = nrecord + 1
        oVtable.NextRecord
    Wend
    oVtable.FirstRecord
    nrecord = nrecord - 1
    ReDim lab_id(nrecord) As Integer
    ReDim lab_code(nrecord) As Integer
    ReDim lab_char(nrecord) As String
    ReDim lab_type(nrecord) As String
    i = 0
    While Not oVtable.EOT
        lab_id(i) = oVtable.Columns(1).Value
        lab_code(i) = Trim(oVtable.Columns(2).Value)
        lab_char(i) = Trim(oVtable.Columns(3).Value)
        lab_type(i) = oVtable.Columns(4).Value
        oVtable.NextRecord
        i = i + 1
    Wend
    End If
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)

    ' Insert lab name of all picture lab into cbx_xray
    sql = "execute procedure QLN(" & rowid_patience & ");"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "execute procedure checklab_list();"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from lab_list"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable.Columns(1).Value <> "nothing" Then
    cbx_xray.Enabled = True
    cbx_xray.clear
    nrecord = 0
    While Not oVtable.EOT
        nrecord = nrecord + 1
        oVtable.NextRecord
    Wend
    nrecord = nrecord - 1
    oVtable.FirstRecord
    ReDim lab_id(nrecord) As Integer
    ReDim lab_code(nrecord) As Integer
    ReDim lab_char(nrecord) As String
    ReDim lab_type(nrecord) As String
    i = 0
    While Not oVtable.EOT
        lab_id(i) = oVtable.Columns(1).Value
        lab_code(i) = Trim(oVtable.Columns(2).Value)
        lab_char(i) = Trim(oVtable.Columns(3).Value)
        lab_type(i) = oVtable.Columns(4).Value
        If lab_type(i) = "p" Then cbx_xray.AddItem (lab_char(i))
        oVtable.NextRecord
        i = i + 1
    Wend
    End If
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbx_xray_Click()
Dim oVtable As ddoTable
On Error GoTo error1
    If cbx_xray.Text <> "" Then
    cbx_datetime.Enabled = True
    cbx_datetime.clear
    Set imgx.Picture = LoadPicture("c:\null.jpg")
    i = findposlab(cbx_xray.Text)
    rowid_lab = lab_id(i)
            If lab_type(i) = "p" Then
            sql = "execute procedure RL2LRP(" & rowid_patience & "," & rowid_lab & ");"
            End If
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
            sql = "select * from result;"
            Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
            If Not oVtable Is Nothing Then
                nrecord = 0
                While Not oVtable.EOT
                    nrecord = nrecord + 1
                    oVtable.NextRecord
                Wend
                nrecord = nrecord - 1
                oVtable.FirstRecord
                ReDim setofdate(nrecord) As String
                i = 0
                While Not oVtable.EOT
                    setofdate(i) = (Replace(oVtable.Columns(2).Value, ":00.00000", ""))
                    cbx_datetime.AddItem (Replace(oVtable.Columns(2).Value, ":00.00000", ""))
                    i = i + 1
                    oVtable.NextRecord
                Wend
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
            End If
           
            cbx_datetime.Text = setofdate(i - 1)
            cbx_datetime_Click
        End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub clear_Click()
    For i = 1 To lsn_lab.ListItems.Count
    lsn_lab.ListItems(i).Checked = False
    Next i
End Sub

Private Sub cmd_exit_Click(index As Integer)
    Unload Me
    startform.Show
End Sub

Private Sub cml_query_Click()
Dim oVtable As ddoTable
Dim oVtable2 As ddoTable
Dim index As ListItem
On Error GoTo error1
    lsl1.ListItems.clear
    lsl2.ListItems.clear
    lsl3.ListItems.clear
    Form3.MousePointer = 11

    sql = "select rowid from patience where hn = " & cbl_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_patience = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure atname(" & rowid_patience & ",'" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txl_name = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure atsurname(" & rowid_patience & ",'" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txl_sur = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure QLN(" & rowid_patience & ");"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "execute procedure checklab_list();"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from lab_list"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable.Columns(1).Value <> "nothing" Then
    nrecord = 0
    While Not oVtable.EOT
        nrecord = nrecord + 1
        oVtable.NextRecord
    Wend
    nrecord = nrecord - 1
    oVtable.FirstRecord
    ReDim lab_id(nrecord) As Integer
    ReDim lab_code(nrecord) As Integer
    ReDim lab_char(nrecord) As String
    ReDim lab_type(nrecord) As String
    i = 0
    While Not oVtable.EOT
        lab_id(i) = oVtable.Columns(1).Value
        lab_code(i) = Trim(oVtable.Columns(2).Value)
        lab_char(i) = Trim(oVtable.Columns(3).Value)
        lab_type(i) = oVtable.Columns(4).Value
        If lab_type(i) <> "p" Then lsl1.ListItems.Add.Text = lab_char(i)
        oVtable.NextRecord
        i = i + 1
    Wend
    End If
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)

    ' Insert lab + result + time of all number lab into lablist2
    sql = "execute procedure RT2LRN(" & rowid_patience & ",'" & txl_datetime & "');"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "execute procedure checkresult();"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable.Columns(1).Value <> "nothing" Then
    While Not oVtable.EOT
        rowid_lab = oVtable.Columns(2).Value
        sql = "select name,standard_from,standard_to,unit  from lab_number where rowid = " & rowid_lab
        Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        Set index = lsl2.ListItems.Add
        index.Text = Trim(oVtable2.Columns(1).Value)
        index.SubItems(1) = oVtable.Columns(3).Value
        index.SubItems(2) = oVtable2.Columns(4).Value
        index.SubItems(3) = oVtable2.Columns(2).Value
        index.SubItems(4) = oVtable2.Columns(3).Value
        index.SubItems(5) = Replace(oVtable.Columns(4).Value, ":00.00000", "")
        index.SubItems(6) = Replace(oVtable.Columns(5).Value, ":00.00000", "")
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
        oVtable.NextRecord
    Wend
    End If
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)

    ' Insert lab + result + time of all char lab into lablist2
    sql = "execute procedure RT2LRC(" & rowid_patience & ",'" & txl_datetime & "');"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "execute procedure checkresult();"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable.Columns(1).Value <> "nothing" Then
    While Not oVtable.EOT
        rowid_lab = oVtable.Columns(2).Value
        sql = "select name from lab_char where rowid = " & rowid_lab
        Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        Set index = lsl2.ListItems.Add
        index.Text = Trim(oVtable2.Columns(1).Value)
        index.SubItems(1) = oVtable.Columns(3).Value
        index.SubItems(2) = ""
        index.SubItems(3) = ""
        index.SubItems(4) = ""
        index.SubItems(5) = Replace(oVtable.Columns(4).Value, ":00.00000", "")
        index.SubItems(6) = Replace(oVtable.Columns(5).Value, ":00.00000", "")
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
        oVtable.NextRecord
    Wend
    End If
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    labresult.Caption = "ผล LAB ทั้งหมด ณ  " & txl_datetime
    Form3.MousePointer = 0
    Frame15.Enabled = True
    lsl2.Enabled = True

GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cmm_query_Click()
Dim oVtable As ddoTable
Dim oVtable2 As ddoTable
Dim index As ListItem
On Error GoTo error1
    lsm1.ListItems.clear
    lsm2.ListItems.clear
    lsm3.ListItems.clear
    Form3.MousePointer = 11

    sql = "select rowid from patience where hn = " & cbm_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_patience = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure atname(" & rowid_patience & ",'" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txm_name = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure atsurname(" & rowid_patience & ",'" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txm_sur = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "select medicine from MOP where patience = " & rowid_patience
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
    nrecord = oVtable.TotalRecordCount - 1
    ReDim med_id(nrecord) As Integer
    ReDim med_code(nrecord) As Integer
    ReDim med_char(nrecord) As String
    i = 0
    While Not oVtable.EOT
        rowid_med = oVtable.Columns(1).Value
        sql = "select med_code, sci_name from medicine where rowid = " & rowid_med
        Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        med_id(i) = oVtable.Columns(1).Value
        med_code(i) = Trim(oVtable2.Columns(1).Value)
        med_char(i) = Trim(oVtable2.Columns(2).Value)
        lsm1.ListItems.Add.Text = med_char(i)
        oVtable.NextRecord
        i = i + 1
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If

    ' Insert medicine + result + time of all number medicine into medlist2
    sql = "execute procedure RT2MOP(" & rowid_patience & ",'" & txm_datetime & "');"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "execute procedure checkresult();"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable.Columns(1).Value <> "nothing" Then
    While Not oVtable.EOT
        rowid_med = oVtable.Columns(2).Value
        sql = "select sci_name from medicine where rowid = " & rowid_med
        Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        Set index = lsm2.ListItems.Add
        index.Text = Trim(oVtable2.Columns(1).Value)
        index.SubItems(1) = oVtable.Columns(3).Value
        index.SubItems(2) = Replace(oVtable.Columns(4).Value, ":00.00000", "")
        index.SubItems(3) = Replace(oVtable.Columns(5).Value, ":00.00000", "")
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
        oVtable.NextRecord
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
    Wend
    End If
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    medresult.Caption = "ผลการสั่งยา ทั้งหมด ณ  " & txm_datetime
    Form3.MousePointer = 0
    Frame6.Enabled = True
    lsm2.Enabled = True

GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub


Private Sub cmn_confirm_Click()
   Call getrowid_setoflab
   Call getrowid_setofmed
   If (txn_weight <> "" And txn_height <> "" And cb_doccode.Text <> "" And txn_resultdiag <> "") Then
   Call insert_diagnosis
   Call getrowid_diag
   Call update_patience
   Call insert_lab
   Call insert_med
   cmn_confirm.Enabled = False
   Else: MsgBox "กรุณาใส่ผลการวินิจฉัย หรือน้ำหนัก หรือส่วนสูง หรือรหัสหมอ ให้ครบ", vbOKOnly, "ERROR"
   End If
End Sub

Private Sub cmq_back_Click()
On Error GoTo error1
    i = findposdiag(cbq_datetime.Text)
    i = i - 1
    cbq_datetime.Text = diag_to(i)
    rowid_diag = diag_col(i)
    If i = UBound(diag_col) Then
        cmq_next.Enabled = False
    Else: cmq_next.Enabled = True
    End If
    If i = LBound(diag_col) Then
        cmq_back.Enabled = False
    Else: cmq_back.Enabled = True
    End If
    txq_from.Caption = "Valid From  : " & diag_from(i)
    txq_to.Caption = "TO : " & diag_to(i)
    sql = "select lotofile(diagnose_record,'" & App.Path & "\d.jpg!','client') from diagnosis where rowid = " & rowid_diag
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    Set img1.Picture = LoadPicture(App.Path & "\d.jpg")
    
    sql = "select weight,height,doctor from diagnosis where rowid = " & rowid_diag
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txq_weight = oVtable.Columns(1).Value
    txq_height = oVtable.Columns(2).Value
            
            rowid = oVtable.Columns(3).Value
            If rowid <> "" Then
            i = 0
            Do While doc_id(i) <> CInt(rowid)
                i = i + 1
            Loop
    txq_doc.Text = doc_char(i)
            End If

    sql = "select dia_code from diagnosis where rowid = " & rowid_diag
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txq_dn = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)

GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cmq_next_Click()
On Error GoTo error1
    i = findposdiag(cbq_datetime.Text)
    i = i + 1
    cbq_datetime.Text = diag_to(i)
    rowid_diag = diag_col(i)
    If i = UBound(diag_col) Then
        cmq_next.Enabled = False
    Else: cmq_next.Enabled = True
    End If
    If i = LBound(diag_col) Then
        cmq_back.Enabled = False
    Else: cmq_back.Enabled = True
    End If
    txq_from.Caption = "Valid From  : " & diag_from(i)
    txq_to.Caption = "TO : " & diag_to(i)
    sql = "select lotofile(diagnose_record,'" & App.Path & "\d.jpg!','client') from diagnosis where rowid = " & rowid_diag
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    Set img1.Picture = LoadPicture(App.Path & "\d.jpg")
    
    sql = "select weight,height,doctor from diagnosis where rowid = " & rowid_diag
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txq_weight = oVtable.Columns(1).Value
    txq_height = oVtable.Columns(2).Value
            
            rowid = oVtable.Columns(3).Value
            If rowid <> "" Then
            i = 0
            Do While doc_id(i) <> CInt(rowid)
                i = i + 1
            Loop
    txq_doc.Text = doc_char(i)
            End If
            
    sql = "select dia_code from diagnosis where rowid = " & rowid_diag
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txq_dn = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)

GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cmx_back_Click()
On Error GoTo error1
    i = cbfindpos(cbx_datetime, cbx_datetime.Text)
    i = i - 1
    cbx_datetime.Text = cbx_datetime.List(i)
    sql = "execute procedure RL2LRP(" & rowid_patience & "," & rowid_lab & ");"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result where t_st = '" & cbx_datetime & "'"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
        rowid_labphoto = oVtable.Columns(1).Value
        txx_from.Caption = "Valid From  : " & Replace(oVtable.Columns(2).Value, ":00.00000", "")
        txx_to.Caption = "To : " & Replace(oVtable.Columns(3).Value, ":00.00000", "")
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        sql = "select lotofile(pic,'" & App.Path & "\lab.jpg!','client') from photo where rowid = " & rowid_labphoto
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    End If
    Set imgx.Picture = LoadPicture(App.Path & "\lab.jpg")
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
  
    If i = UBound(setofdate) Then
         cmx_next.Enabled = False
    Else: cmx_next.Enabled = True
    End If
    If i = LBound(setofdate) Then
         cmx_back.Enabled = False
    Else: cmx_back.Enabled = True
    End If

GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cmx_next_Click()
On Error GoTo error1
    i = cbfindpos(cbx_datetime, cbx_datetime.Text)
    i = i + 1
    cbx_datetime.Text = cbx_datetime.List(i)
    sql = "execute procedure RL2LRP(" & rowid_patience & "," & rowid_lab & ");"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result where t_st = '" & cbx_datetime & "'"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
        rowid_labphoto = oVtable.Columns(1).Value
        txx_from.Caption = "Valid From  : " & Replace(oVtable.Columns(2).Value, ":00.00000", "")
        txx_to.Caption = "To : " & Replace(oVtable.Columns(3).Value, ":00.00000", "")
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        sql = "select lotofile(pic,'" & App.Path & "\lab.jpg!','client') from photo where rowid = " & rowid_labphoto
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    End If
    Set imgx.Picture = LoadPicture(App.Path & "\lab.jpg")
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
  
    If i = UBound(setofdate) Then
         cmx_next.Enabled = False
    Else: cmx_next.Enabled = True
    End If
    If i = LBound(setofdate) Then
         cmx_back.Enabled = False
    Else: cmx_back.Enabled = True
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub


Private Sub Command9_Click()
    cmdialog.ShowOpen
    txn_resultdiag.Text = cmdialog.FileName
End Sub

Sub tab1_load()
On Error GoTo error1
    cbn_med.clear
    cbn_medcode.clear
    cb_doccode.clear
    lsn_lab.ListItems.clear
        cbq_hn.clear
        cbn_hn.clear
        cbl_hn.clear
        cbx_hn.clear
        cbm_hn.clear
        sql = "select hn from patience"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        While Not oVtable.EOT
                cbq_hn.AddItem (oVtable.Columns(1).Value)
                cbn_hn.AddItem (oVtable.Columns(1).Value)
                cbl_hn.AddItem (oVtable.Columns(1).Value)
                cbx_hn.AddItem (oVtable.Columns(1).Value)
                cbm_hn.AddItem (oVtable.Columns(1).Value)
                oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    
    For i = 0 To UBound(med_id)
        cbn_med.AddItem (med_char(i))
        cbn_medcode.AddItem (med_code(i))
    Next i
    For i = 0 To UBound(doc_id)
        cb_doccode.AddItem (doc_code(i))
    Next i
    For i = 0 To UBound(lab_id)
        Set index = lsn_lab.ListItems.Add
        index.Text = lab_char(i)
    Next i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub Form_activate()
    Dim oVtable As ddoTable
'Set oEngine = CreateObject("datadirector.engine")
'Set oModel = oEngine.Models("G:\Informix\Data Director\nuvo_hospital.mlx")
'Set oProject = oEngine.CurrentProject
'Set odatagroup = oProject.DataGroups
'Set oRoutine = oModel.Routines
    datetime = CalDate()
    Call medarray
    Call docarray
    Call labarray
'    Call disarray
    Call tab1_load
End Sub



Private Sub lsl1_Click()
Dim oVtable As ddoTable
Dim index As ListItem
On Error GoTo error1
        lsl3.ListItems.clear
        i = lsl1.SelectedItem.index
        If lsl1.ListItems(i).Selected Then
            i = i - 1
            rowid_lab = lab_id(i)
            If lab_type(i) = "n" Then
            sql = "execute procedure RL2LRN(" & rowid_patience & "," & rowid_lab & ");"
            ElseIf lab_type(i) = "c" Then
            sql = "execute procedure RL2LRC(" & rowid_patience & "," & rowid_lab & ");"
            End If
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
            sql = "select * from result;"
            Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
            If Not oVtable Is Nothing Then
                While Not oVtable.EOT
                    Set index = lsl3.ListItems.Add
                    index.Text = oVtable.Columns(1).Value
                    index.SubItems(1) = oVtable.Columns(2).Value
                    index.SubItems(2) = oVtable.Columns(3).Value
                    oVtable.NextRecord
                Wend
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
            End If
        End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub lsm1_Click()
Dim oVtable As ddoTable
Dim index As ListItem
On Error GoTo error1
        lsm3.ListItems.clear
        i = lsm1.SelectedItem.index
        If lsm1.ListItems(i).Selected Then
            i = i - 1
            rowid_med = med_id(i)
            sql = "execute procedure RM2Q(" & rowid_patience & "," & rowid_med & ");"
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
            sql = "select * from result;"
            Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
            If Not oVtable Is Nothing Then
                While Not oVtable.EOT
                    Set index = lsm3.ListItems.Add
                    index.Text = oVtable.Columns(1).Value
                    index.SubItems(1) = oVtable.Columns(2).Value
                    index.SubItems(2) = oVtable.Columns(3).Value
                    oVtable.NextRecord
                Wend
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
            End If
        End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub SSTab1_Click(PreviousTab As Integer)
    Call tab1_load
End Sub

Private Sub Timer1_Timer()
    If Timer1.Interval > 0 Then
        datetime = CalDate
        tx_datetime = datetime
    End If
End Sub

'Private Sub DataDirector_Info()
'[DataDirectorInfoStart]
'NumDataLinks=5
'[DataLink]
'GroupName=patience
'ControlName=cbl_hn
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
'ControlName=cbm_hn
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
'ControlName=cbn_hn
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
'[DataLink]
'GroupName=patience
'ControlName=cbx_hn
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
