VERSION 5.00
Object = "{BF448208-70DE-11CF-947B-0020AF75C4BA}#1.0#0"; "navctl32.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Form4 
   Caption         =   "ADMISSION"
   ClientHeight    =   9600
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11880
   Icon            =   "Form4.frx":0000
   LinkTopic       =   "Form4"
   Picture         =   "Form4.frx":030A
   ScaleHeight     =   9600
   ScaleWidth      =   11880
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Left            =   8400
      Top             =   120
   End
   Begin VB.TextBox tx_datetime 
      BackColor       =   &H8000000B&
      Height          =   285
      Left            =   9840
      TabIndex        =   122
      Top             =   240
      Width           =   1455
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   8505
      Left            =   360
      TabIndex        =   44
      Top             =   720
      Width           =   10995
      _ExtentX        =   19394
      _ExtentY        =   15002
      _Version        =   393216
      Tabs            =   4
      Tab             =   3
      TabsPerRow      =   5
      TabHeight       =   882
      TabCaption(0)   =   "New Admit"
      TabPicture(0)   =   "Form4.frx":17667C
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "Frame3"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "cmn_exit(0)"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).ControlCount=   2
      TabCaption(1)   =   "Query"
      TabPicture(1)   =   "Form4.frx":176996
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "Frame2"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "cmn_exit(1)"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).ControlCount=   2
      TabCaption(2)   =   "Insert / Check Out"
      TabPicture(2)   =   "Form4.frx":176CB0
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "Frame1"
      Tab(2).Control(0).Enabled=   0   'False
      Tab(2).Control(1)=   "cmi_clear"
      Tab(2).Control(1).Enabled=   0   'False
      Tab(2).Control(2)=   "cmi_checkout"
      Tab(2).Control(2).Enabled=   0   'False
      Tab(2).Control(3)=   "Check1"
      Tab(2).Control(3).Enabled=   0   'False
      Tab(2).Control(4)=   "txi_checkout"
      Tab(2).Control(4).Enabled=   0   'False
      Tab(2).Control(5)=   "cmn_exit(2)"
      Tab(2).Control(5).Enabled=   0   'False
      Tab(2).ControlCount=   6
      TabCaption(3)   =   "สั่งยา /สั่ง LAB"
      TabPicture(3)   =   "Form4.frx":176FCA
      Tab(3).ControlEnabled=   -1  'True
      Tab(3).Control(0)=   "Frame19"
      Tab(3).Control(0).Enabled=   0   'False
      Tab(3).Control(1)=   "cmc_confirm"
      Tab(3).Control(1).Enabled=   0   'False
      Tab(3).Control(2)=   "cmn_exit(3)"
      Tab(3).Control(2).Enabled=   0   'False
      Tab(3).ControlCount=   3
      Begin VB.CommandButton cmn_exit 
         Caption         =   "Exit"
         Height          =   735
         Index           =   3
         Left            =   9240
         Picture         =   "Form4.frx":1772E4
         Style           =   1  'Graphical
         TabIndex        =   39
         Top             =   7560
         Width           =   1335
      End
      Begin VB.CommandButton cmn_exit 
         Caption         =   "Exit"
         Height          =   615
         Index           =   2
         Left            =   -65520
         TabIndex        =   126
         Top             =   7680
         Width           =   1215
      End
      Begin VB.CommandButton cmn_exit 
         Caption         =   "Exit"
         Height          =   615
         Index           =   1
         Left            =   -65520
         TabIndex        =   125
         Top             =   7680
         Width           =   1215
      End
      Begin VB.CommandButton cmn_exit 
         Caption         =   "Exit"
         Height          =   615
         Index           =   0
         Left            =   -65520
         TabIndex        =   124
         Top             =   7680
         Width           =   1215
      End
      Begin VB.CommandButton cmc_confirm 
         Caption         =   "Confirm"
         Height          =   735
         Left            =   7440
         Picture         =   "Form4.frx":1775EE
         Style           =   1  'Graphical
         TabIndex        =   38
         Top             =   7560
         Width           =   1455
      End
      Begin VB.Frame Frame19 
         Height          =   6855
         Left            =   360
         TabIndex        =   103
         Top             =   600
         Width           =   10215
         Begin VB.Frame Frame23 
            Caption         =   "สั่งยารักษา"
            Height          =   4935
            Left            =   0
            TabIndex        =   115
            Top             =   1800
            Width           =   5055
            Begin VB.ComboBox cbc_med 
               Height          =   315
               Left            =   240
               TabIndex        =   34
               Text            =   "หรือเลือกชื่อยา"
               Top             =   720
               Width           =   3255
            End
            Begin VB.TextBox txc_quan 
               Height          =   285
               Left            =   840
               TabIndex        =   35
               Top             =   1200
               Width           =   855
            End
            Begin VB.CommandButton cbc_add 
               Caption         =   "ADD"
               Height          =   495
               Left            =   600
               TabIndex        =   36
               Top             =   1680
               Width           =   1095
            End
            Begin VB.CommandButton cbc_rem 
               Caption         =   "REMOVE"
               Height          =   495
               Left            =   2040
               TabIndex        =   117
               Top             =   1680
               Width           =   1095
            End
            Begin VB.ComboBox cbc_medcode 
               Height          =   315
               Left            =   240
               TabIndex        =   33
               Text            =   "เลือกรหัสยา"
               Top             =   240
               Width           =   1935
            End
            Begin MSComctlLib.ListView lsc_med 
               Height          =   2415
               Left            =   240
               TabIndex        =   116
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
            Begin VB.Label Label46 
               Caption         =   "ปริมาณ"
               Height          =   255
               Left            =   240
               TabIndex        =   119
               Top             =   1200
               Width           =   495
            End
            Begin VB.Label Label45 
               Caption         =   "หน่วย"
               Height          =   255
               Left            =   1800
               TabIndex        =   118
               Top             =   1200
               Width           =   495
            End
         End
         Begin VB.Frame Frame22 
            Caption         =   "แลปส่งตรวจ"
            Height          =   4935
            Left            =   5280
            TabIndex        =   113
            Top             =   1800
            Width           =   4815
            Begin VB.CommandButton cbc_clearlist 
               Caption         =   "Clear All"
               Height          =   495
               Left            =   2040
               TabIndex        =   114
               Top             =   4200
               Width           =   975
            End
            Begin MSComctlLib.ListView lsc_lab 
               Height          =   3615
               Left            =   960
               TabIndex        =   37
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
         End
         Begin VB.Frame Frame21 
            Caption         =   "Condition"
            Height          =   855
            Left            =   0
            TabIndex        =   111
            Top             =   120
            Width           =   10095
            Begin VB.ComboBox cbc_an 
               DataSource      =   "admission_nav"
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
               Left            =   600
               TabIndex        =   32
               Text            =   "admission.ad_code"
               Top             =   360
               Width           =   1935
            End
            Begin VB.Label Label44 
               Caption         =   "A.N."
               Height          =   255
               Left            =   240
               TabIndex        =   112
               Top             =   360
               Width           =   375
            End
         End
         Begin VB.Frame Frame20 
            Caption         =   "รายละเอียดคนไข้"
            Height          =   855
            Left            =   0
            TabIndex        =   104
            Top             =   960
            Width           =   10095
            Begin VB.TextBox txc_sur 
               Enabled         =   0   'False
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
               Left            =   4680
               TabIndex        =   107
               Top             =   360
               Width           =   1455
            End
            Begin VB.TextBox txc_name 
               Enabled         =   0   'False
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
               Left            =   2520
               TabIndex        =   106
               Top             =   360
               Width           =   1455
            End
            Begin VB.TextBox txc_hn 
               Enabled         =   0   'False
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
               TabIndex        =   105
               Top             =   360
               Width           =   1455
            End
            Begin VB.Label Label43 
               Caption         =   "นามสกุล"
               Height          =   255
               Left            =   4080
               TabIndex        =   110
               Top             =   360
               Width           =   615
            End
            Begin VB.Label Label42 
               Caption         =   "ชื่อ"
               Height          =   255
               Left            =   2280
               TabIndex        =   109
               Top             =   360
               Width           =   375
            End
            Begin VB.Label Label37 
               Caption         =   "H.N."
               Height          =   255
               Left            =   240
               TabIndex        =   108
               Top             =   360
               Width           =   375
            End
         End
      End
      Begin VB.Frame Frame2 
         Height          =   6975
         Left            =   -74640
         TabIndex        =   71
         Top             =   600
         Width           =   10335
         Begin VB.Frame Frame16 
            Caption         =   "Condition Admit"
            Height          =   1215
            Left            =   120
            TabIndex        =   86
            Top             =   120
            Width           =   10095
            Begin VB.OptionButton opq_an 
               Caption         =   "A.N."
               Height          =   255
               Left            =   3360
               TabIndex        =   8
               Top             =   240
               Width           =   615
            End
            Begin VB.OptionButton opq_hn 
               Caption         =   "H.N."
               Height          =   255
               Left            =   360
               TabIndex        =   121
               Top             =   240
               Value           =   -1  'True
               Width           =   735
            End
            Begin VB.ComboBox cbq_hn 
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
               Left            =   1080
               Sorted          =   -1  'True
               TabIndex        =   7
               Text            =   "patience.hn"
               Top             =   240
               Width           =   1935
            End
            Begin VB.ComboBox cbq_an 
               DataSource      =   "admission_nav"
               Enabled         =   0   'False
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
               Left            =   3960
               Sorted          =   -1  'True
               TabIndex        =   9
               Top             =   240
               Width           =   1935
            End
            Begin VB.Frame Frame17 
               Enabled         =   0   'False
               Height          =   615
               Left            =   1080
               TabIndex        =   87
               Top             =   600
               Width           =   7335
               Begin VB.TextBox txq_to 
                  Enabled         =   0   'False
                  Height          =   285
                  Left            =   5040
                  TabIndex        =   41
                  Top             =   240
                  Width           =   2055
               End
               Begin VB.ComboBox cbq_from 
                  Enabled         =   0   'False
                  Height          =   315
                  Left            =   2280
                  TabIndex        =   11
                  Top             =   240
                  Width           =   2295
               End
               Begin VB.OptionButton opq_current 
                  Caption         =   "Currrent"
                  Height          =   195
                  Left            =   240
                  TabIndex        =   88
                  Top             =   240
                  Value           =   -1  'True
                  Width           =   855
               End
               Begin VB.OptionButton opq_past 
                  Caption         =   "อดีต"
                  Height          =   255
                  Left            =   1560
                  TabIndex        =   10
                  Top             =   240
                  Width           =   615
               End
               Begin VB.Label Label41 
                  Caption         =   "TO"
                  Height          =   255
                  Left            =   4680
                  TabIndex        =   89
                  Top             =   240
                  Width           =   255
               End
            End
            Begin VB.CommandButton cmq_query 
               Caption         =   "Query"
               Enabled         =   0   'False
               Height          =   615
               Left            =   8760
               TabIndex        =   12
               Top             =   360
               Width           =   1095
            End
         End
         Begin VB.Frame Frame6 
            Caption         =   "การตรวจประจำวัน"
            Height          =   4215
            Left            =   120
            TabIndex        =   82
            Top             =   2640
            Width           =   10095
            Begin VB.Frame Frame14 
               Caption         =   "แผนการพยาบาล"
               Height          =   3975
               Left            =   3360
               TabIndex        =   84
               Top             =   240
               Width           =   3375
               Begin VB.CommandButton cmd_nurse 
                  Caption         =   "Nursing Plan"
                  Enabled         =   0   'False
                  Height          =   2895
                  Left            =   240
                  TabIndex        =   14
                  Top             =   480
                  Width           =   2895
               End
            End
            Begin VB.Frame Frame13 
               Caption         =   "บันทึกการวินิจฉัย"
               Height          =   3975
               Left            =   6720
               TabIndex        =   83
               Top             =   240
               Width           =   3375
               Begin VB.CommandButton cmd_diag 
                  Caption         =   "Diagnosis Record"
                  Enabled         =   0   'False
                  Height          =   2895
                  Left            =   240
                  TabIndex        =   16
                  Top             =   480
                  Width           =   2895
               End
            End
            Begin VB.Frame Frame15 
               Caption         =   "ผลตรวจ"
               Height          =   3975
               Left            =   0
               TabIndex        =   85
               Top             =   240
               Width           =   3375
               Begin VB.CommandButton cmd_dialydiag 
                  Caption         =   "Dialy Diagnosis"
                  Enabled         =   0   'False
                  Height          =   2895
                  Left            =   240
                  TabIndex        =   13
                  Top             =   480
                  Width           =   2895
               End
            End
         End
         Begin VB.Frame Frame5 
            Caption         =   "รายละเอียดคนไข้"
            Height          =   1335
            Left            =   120
            TabIndex        =   72
            Top             =   1320
            Width           =   10095
            Begin VB.TextBox txq_hn 
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
               TabIndex        =   40
               Top             =   360
               Width           =   855
            End
            Begin VB.TextBox txq_an 
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
               Left            =   2040
               TabIndex        =   76
               Top             =   360
               Width           =   735
            End
            Begin VB.TextBox txq_name 
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
               Left            =   3240
               TabIndex        =   75
               Top             =   360
               Width           =   1455
            End
            Begin VB.TextBox txq_sur 
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
               Left            =   5520
               TabIndex        =   74
               Top             =   360
               Width           =   1455
            End
            Begin VB.TextBox txq_dateadmit 
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
               Left            =   7920
               TabIndex        =   73
               Top             =   360
               Width           =   1935
            End
            Begin VB.Label Label31 
               Caption         =   "H.N."
               Height          =   255
               Left            =   240
               TabIndex        =   81
               Top             =   360
               Width           =   375
            End
            Begin VB.Label Label30 
               Caption         =   "A.N."
               Height          =   255
               Left            =   1680
               TabIndex        =   80
               Top             =   360
               Width           =   375
            End
            Begin VB.Label Label29 
               Caption         =   "ชื่อ"
               Height          =   255
               Left            =   3000
               TabIndex        =   79
               Top             =   360
               Width           =   375
            End
            Begin VB.Label Label28 
               Caption         =   "นามสกุล"
               Height          =   255
               Left            =   4920
               TabIndex        =   78
               Top             =   360
               Width           =   615
            End
            Begin VB.Label Label27 
               Caption         =   "วันที่ Admit"
               Height          =   255
               Left            =   7080
               TabIndex        =   77
               Top             =   360
               Width           =   855
            End
         End
      End
      Begin VB.TextBox txi_checkout 
         Enabled         =   0   'False
         Height          =   285
         Left            =   -74280
         TabIndex        =   29
         Top             =   7920
         Width           =   1695
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Check1"
         Enabled         =   0   'False
         Height          =   255
         Left            =   -74640
         TabIndex        =   28
         Top             =   7920
         Width           =   255
      End
      Begin VB.CommandButton cmi_checkout 
         Caption         =   "Check Out"
         Enabled         =   0   'False
         Height          =   615
         Left            =   -72480
         TabIndex        =   30
         Top             =   7680
         Width           =   1335
      End
      Begin VB.CommandButton cmi_clear 
         Caption         =   "Clear All"
         Height          =   615
         Left            =   -67440
         TabIndex        =   31
         Top             =   7680
         Width           =   1455
      End
      Begin VB.Frame Frame3 
         Height          =   6975
         Left            =   -74640
         TabIndex        =   46
         Top             =   600
         Width           =   10335
         Begin VB.CommandButton cmn_clear 
            Caption         =   "Clear"
            Height          =   615
            Left            =   3360
            TabIndex        =   6
            Top             =   4320
            Width           =   1095
         End
         Begin VB.CommandButton cmn_confirm 
            Caption         =   "Confirm New"
            Enabled         =   0   'False
            Height          =   615
            Left            =   1800
            TabIndex        =   5
            Top             =   4320
            Width           =   1095
         End
         Begin VB.Frame Frame4 
            Caption         =   "Add New Admit"
            Height          =   3855
            Left            =   120
            TabIndex        =   47
            Top             =   240
            Width           =   6015
            Begin VB.TextBox txn_docname 
               Enabled         =   0   'False
               Height          =   285
               Left            =   3000
               TabIndex        =   102
               Top             =   1800
               Width           =   2535
            End
            Begin VB.Frame Frame18 
               Height          =   1335
               Left            =   0
               TabIndex        =   94
               Top             =   240
               Width           =   6015
               Begin VB.TextBox txn_sur 
                  Enabled         =   0   'False
                  Height          =   285
                  Left            =   3480
                  TabIndex        =   99
                  Top             =   840
                  Width           =   2055
               End
               Begin VB.TextBox txn_name 
                  DataSource      =   "patience_nav"
                  Enabled         =   0   'False
                  Height          =   285
                  Left            =   720
                  TabIndex        =   98
                  Top             =   840
                  Width           =   1935
               End
               Begin VB.ComboBox cbn_hn 
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
                  Left            =   720
                  Sorted          =   -1  'True
                  TabIndex        =   0
                  Text            =   "patience.hn"
                  Top             =   360
                  Width           =   1935
               End
               Begin VB.Label Label9 
                  Caption         =   "H.N."
                  Height          =   255
                  Left            =   360
                  TabIndex        =   97
                  Top             =   360
                  Width           =   375
               End
               Begin VB.Label Label10 
                  Caption         =   "ชื่อ"
                  Height          =   255
                  Left            =   360
                  TabIndex        =   96
                  Top             =   840
                  Width           =   255
               End
               Begin VB.Label Label11 
                  Caption         =   "นามสกุล"
                  Height          =   255
                  Left            =   2760
                  TabIndex        =   95
                  Top             =   840
                  Width           =   735
               End
            End
            Begin VB.ComboBox cbn_room 
               Height          =   315
               Left            =   1680
               TabIndex        =   2
               Top             =   2280
               Width           =   1695
            End
            Begin VB.TextBox txn_indate 
               Height          =   285
               Left            =   1680
               TabIndex        =   4
               Top             =   3240
               Width           =   1935
            End
            Begin VB.ComboBox cbn_package 
               Height          =   315
               Left            =   1680
               TabIndex        =   3
               Top             =   2760
               Width           =   2295
            End
            Begin VB.ComboBox cbn_doccode 
               Height          =   315
               ItemData        =   "Form4.frx":1778F8
               Left            =   1680
               List            =   "Form4.frx":1778FA
               TabIndex        =   1
               Top             =   1800
               Width           =   1095
            End
            Begin VB.Label Label36 
               Caption         =   "ห้องพัก"
               Height          =   255
               Left            =   600
               TabIndex        =   93
               Top             =   2280
               Width           =   615
            End
            Begin VB.Label Label3 
               Caption         =   "วันที่ Admit"
               Height          =   255
               Left            =   600
               TabIndex        =   50
               Top             =   3240
               Width           =   855
            End
            Begin VB.Label Label2 
               Caption         =   "package"
               Height          =   255
               Left            =   600
               TabIndex        =   49
               Top             =   2760
               Width           =   735
            End
            Begin VB.Label Label1 
               Caption         =   "หมอเจ้าของไข้"
               Height          =   255
               Left            =   480
               TabIndex        =   48
               Top             =   1800
               Width           =   1095
            End
         End
      End
      Begin VB.Frame Frame1 
         Height          =   6975
         Left            =   -74640
         TabIndex        =   45
         Top             =   600
         Width           =   10335
         Begin VB.Frame Frame7 
            Caption         =   "Condition Admit"
            Height          =   975
            Left            =   120
            TabIndex        =   51
            Top             =   120
            Width           =   10095
            Begin VB.OptionButton opi_an 
               Caption         =   "A.N."
               Height          =   255
               Left            =   3480
               TabIndex        =   120
               Top             =   360
               Value           =   -1  'True
               Width           =   615
            End
            Begin VB.ComboBox cbi_an 
               Height          =   315
               Left            =   4200
               TabIndex        =   15
               Text            =   "admission.ad_code"
               Top             =   360
               Width           =   2055
            End
            Begin VB.ComboBox cbi_hn 
               Enabled         =   0   'False
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
               Left            =   1080
               TabIndex        =   18
               Text            =   "patience.hn"
               Top             =   360
               Width           =   1935
            End
            Begin VB.OptionButton opi_hn 
               Caption         =   "H.N."
               Height          =   255
               Left            =   360
               TabIndex        =   17
               Top             =   360
               Width           =   735
            End
         End
         Begin VB.Frame Frame9 
            Caption         =   "รายละเอียดคนไข้"
            Height          =   1335
            Left            =   120
            TabIndex        =   53
            Top             =   1200
            Width           =   10095
            Begin VB.TextBox txi_hn 
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
               TabIndex        =   90
               Top             =   360
               Width           =   1455
            End
            Begin VB.TextBox txi_intime 
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
               Left            =   7920
               TabIndex        =   61
               Top             =   840
               Width           =   1935
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
               Height          =   285
               Left            =   6600
               TabIndex        =   59
               Top             =   360
               Width           =   1455
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
               Left            =   4440
               TabIndex        =   57
               Top             =   360
               Width           =   1455
            End
            Begin VB.TextBox txi_an 
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
               Left            =   2520
               TabIndex        =   55
               Top             =   360
               Width           =   1455
            End
            Begin VB.Label Label14 
               Caption         =   "วันที่ Admit"
               Height          =   255
               Left            =   7080
               TabIndex        =   62
               Top             =   840
               Width           =   855
            End
            Begin VB.Label Label13 
               Caption         =   "นามสกุล"
               Height          =   255
               Left            =   6000
               TabIndex        =   60
               Top             =   360
               Width           =   615
            End
            Begin VB.Label Label12 
               Caption         =   "ชื่อ"
               Height          =   255
               Left            =   4200
               TabIndex        =   58
               Top             =   360
               Width           =   375
            End
            Begin VB.Label Label8 
               Caption         =   "A.N."
               Height          =   255
               Left            =   2160
               TabIndex        =   56
               Top             =   360
               Width           =   375
            End
            Begin VB.Label Label6 
               Caption         =   "H.N."
               Height          =   255
               Left            =   240
               TabIndex        =   54
               Top             =   360
               Width           =   375
            End
         End
         Begin VB.Frame Frame8 
            Caption         =   "การตรวจประจำวัน"
            Enabled         =   0   'False
            Height          =   4215
            Left            =   120
            TabIndex        =   52
            Top             =   2640
            Width           =   10095
            Begin VB.CommandButton cmi_clear2 
               Caption         =   "Clear"
               Height          =   615
               Left            =   8520
               TabIndex        =   27
               Top             =   3360
               Width           =   1455
            End
            Begin VB.CommandButton cmi_insert 
               Caption         =   "Insert"
               Height          =   615
               Left            =   6600
               TabIndex        =   26
               Top             =   3360
               Width           =   1455
            End
            Begin VB.Frame Frame12 
               Caption         =   "Diagnosis Record"
               Height          =   1095
               Left            =   5160
               TabIndex        =   70
               Top             =   1800
               Width           =   4575
               Begin VB.TextBox txi_dia 
                  Height          =   285
                  Left            =   360
                  TabIndex        =   43
                  Top             =   480
                  Width           =   2655
               End
               Begin VB.CommandButton cmi_browsed 
                  Caption         =   "Browse"
                  Height          =   375
                  Left            =   3240
                  TabIndex        =   25
                  Top             =   480
                  Width           =   855
               End
            End
            Begin VB.Frame Frame11 
               Caption         =   "Nursing Plan"
               Height          =   1095
               Left            =   5160
               TabIndex        =   69
               Top             =   600
               Width           =   4575
               Begin MSComDlg.CommonDialog cmd_dialog 
                  Left            =   4080
                  Top             =   120
                  _ExtentX        =   847
                  _ExtentY        =   847
                  _Version        =   393216
               End
               Begin VB.CommandButton cmi_browsen 
                  Caption         =   "Browse"
                  Height          =   375
                  Left            =   3240
                  TabIndex        =   24
                  Top             =   480
                  Width           =   855
               End
               Begin VB.TextBox txi_np 
                  Height          =   285
                  Left            =   360
                  TabIndex        =   42
                  Top             =   480
                  Width           =   2655
               End
            End
            Begin VB.Frame Frame10 
               Caption         =   "ผลตรวจ"
               Height          =   2535
               Left            =   360
               TabIndex        =   63
               Top             =   480
               Width           =   4455
               Begin VB.TextBox txi_hbp 
                  Height          =   285
                  Left            =   3240
                  TabIndex        =   21
                  Top             =   840
                  Width           =   495
               End
               Begin VB.TextBox txi_p 
                  Height          =   285
                  Left            =   2520
                  TabIndex        =   23
                  Top             =   1800
                  Width           =   495
               End
               Begin VB.TextBox txi_r 
                  Height          =   285
                  Left            =   2520
                  TabIndex        =   22
                  Top             =   1320
                  Width           =   495
               End
               Begin VB.TextBox txi_lbp 
                  Height          =   285
                  Left            =   2520
                  TabIndex        =   20
                  Top             =   840
                  Width           =   495
               End
               Begin VB.TextBox txi_t 
                  Height          =   285
                  Left            =   2520
                  TabIndex        =   19
                  Top             =   360
                  Width           =   495
               End
               Begin VB.Label Label22 
                  Caption         =   "/"
                  Height          =   255
                  Left            =   3120
                  TabIndex        =   68
                  Top             =   840
                  Width           =   135
               End
               Begin VB.Label Label21 
                  Caption         =   "อัตราการหายใจ (R)"
                  Height          =   255
                  Left            =   960
                  TabIndex        =   67
                  Top             =   1320
                  Width           =   1455
               End
               Begin VB.Label Label20 
                  Caption         =   "ความดัน (BP)"
                  Height          =   255
                  Left            =   1440
                  TabIndex        =   66
                  Top             =   840
                  Width           =   975
               End
               Begin VB.Label Label19 
                  Caption         =   "อัตราการเต้นหัวใจ (P)"
                  Height          =   255
                  Left            =   720
                  TabIndex        =   65
                  Top             =   1800
                  Width           =   1695
               End
               Begin VB.Label Label18 
                  Caption         =   "อุณหภูมิ (T)"
                  Height          =   255
                  Left            =   1560
                  TabIndex        =   64
                  Top             =   360
                  Width           =   855
               End
            End
         End
      End
   End
   Begin Navctl32Lib.NavControl patience_nav 
      Height          =   600
      Left            =   0
      TabIndex        =   91
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
      ModelFile       =   "g:\informix\Data Director\nuvo_hospital.MLX"
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
   Begin Navctl32Lib.NavControl admission_nav 
      Height          =   600
      Left            =   1320
      TabIndex        =   101
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
      ModelFile       =   "g:\informix\Data Director\nuvo_hospital.MLX"
      DataPath        =   ""
      Table           =   "admission"
      DataGroup       =   "admission"
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
      Ctrl5Caption    =   "admission - #"
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
   Begin VB.Label Label4 
      Caption         =   "DateTime ::"
      Height          =   255
      Left            =   8880
      TabIndex        =   123
      Top             =   240
      Width           =   855
   End
   Begin VB.Label Label5 
      Caption         =   "hn"
      Height          =   300
      Left            =   1890
      TabIndex        =   100
      Top             =   1925
      Width           =   240
   End
   Begin VB.Label Label35 
      Caption         =   "hn"
      Height          =   300
      Left            =   2235
      TabIndex        =   92
      Top             =   2315
      Width           =   240
   End
End
Attribute VB_Name = "Form4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public rowid_patience As Integer
Public rowid_addiag As Integer
Public rowid_admit As Integer
Public rowid_doc As Integer
Public rowid_package As Integer
Public rowid_room As Integer
Public ptime As String
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

Public Sub packagearray()
On Error GoTo error1
     sql = "select rowid,package_name from admission_package"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    i = 0
    nrecord = oVtable.TotalRecordCount - 1
    ReDim package_char(nrecord) As String
    ReDim package_id(nrecord) As Integer
    While Not oVtable.EOT
        package_id(i) = oVtable.Columns(1).Value
        package_char(i) = oVtable.Columns(2).Value
        i = i + 1
        oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Public Sub roomarray()
On Error GoTo error1
     sql = "select rowid,room_id from room"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    i = 0
    nrecord = oVtable.TotalRecordCount - 1
    ReDim room_num(nrecord) As Integer
    ReDim room_id(nrecord) As Integer
    While Not oVtable.EOT
        room_id(i) = oVtable.Columns(1).Value
        room_num(i) = oVtable.Columns(2).Value
        i = i + 1
        oVtable.NextRecord
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

Private Sub cbc_add_Click()
Dim index As ListItem
    If cbc_med.Text <> "หรือเลือกชื่อยา" And txc_quan <> "" Then
        Set index = lsc_med.ListItems.Add
        index.Text = cbc_medcode.Text
        index.SubItems(1) = cbc_med.Text
        index.SubItems(2) = txc_quan
        txc_quan = ""
        i = cbfindpos(cbc_med, cbc_med.Text)
        cbc_med.RemoveItem (i)
        cbc_medcode.RemoveItem (i)
        cbc_med = "หรือเลือกชื่อยา"
        cbc_medcode = "เลือกรหัสยา"
    End If
End Sub

Private Sub cbc_an_Click()
On Error GoTo error1
    If cbc_an.Text <> "" Then
' FIND HN FROM AN
    sql = "select rowid from admission where ad_code = " & cbc_an.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_admit = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    sql = "execute function A2P(" & rowid_admit & ");"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_patience = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
'FIND HN FROM ROWID PATIENCE
    sql = "select hn from patience where rowid = " & rowid_patience
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txc_hn.Text = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
' FIND NAME FROM HN
    sql = "execute procedure current_pat_name('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar where code = " & txc_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txc_name.Text = oVtable.Columns(3).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
'FIND SUR FROM HN
    sql = "execute procedure current_pat_sur('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar where code = " & txc_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txc_sur.Text = oVtable.Columns(3).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub


Private Sub cbc_clearlist_Click()
    For i = 1 To lsc_lab.ListItems.Count
        lsc_lab.ListItems(i).Checked = False
    Next i
End Sub

Private Sub cbc_med_Click()
On Error GoTo error1
    i = 0
    Do While ((med_char(i) <> cbc_med.Text) And (i <= UBound(med_id)))
    i = i + 1
    Loop
    cbc_medcode = med_code(i)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbc_medcode_Click()
On Error GoTo error1
    i = 0
    Do While ((med_code(i) <> cbc_medcode.Text) And (i <= UBound(med_id)))
    i = i + 1
    Loop
    cbc_med = med_char(i)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbc_rem_Click()
Dim index As ListItem
    i = lsc_med.SelectedItem.index
    cbc_medcode.AddItem (lsc_med.SelectedItem.Text)
    cbc_med.AddItem (lsc_med.SelectedItem.SubItems(1))
    lsc_med.ListItems.Remove (i)
End Sub

Private Sub cbi_an_Click()
On Error GoTo error1
    If cbi_an.Text <> "" Then
    Frame8.Enabled = True
    txi_an = cbi_an.Text
    cbi_hn.Text = ""
    Check1.Enabled = True
    
    ' FIND HN FROM AN
    sql = "select rowid,out_time from admission where ad_code = " & cbi_an.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_admit = oVtable.Columns(1).Value
    out = oVtable.Columns(2).Value
    If out = "" Then Check1.Enabled = True
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    sql = "execute function A2P(" & rowid_admit & ");"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_patience = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
'FIND HN FROM ROWID PATIENCE
    sql = "select hn from patience where rowid = " & rowid_patience
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txi_hn.Text = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
' FIND NAME FROM HN
    sql = "execute procedure current_pat_name('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar where code = " & txi_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txi_name.Text = oVtable.Columns(3).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
'FIND SUR FROM HN
    sql = "execute procedure current_pat_sur('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar where code = " & txi_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txi_sur.Text = oVtable.Columns(3).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
'FIND IN_TIME FROM ROWID_ADMIT
    sql = "select in_time from admission where rowid = " & rowid_admit
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txi_intime.Text = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbi_hn_Click()
On Error GoTo error1
    If cbi_hn <> "" Then
    Frame8.Enabled = True
    cbi_an.Text = ""
    'FIND ROWID PATIENCE FROM HN
    sql = "select rowid from patience where hn = " & cbi_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_patience = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    txi_hn.Text = cbi_hn
    ' FIND AN FROM ROWID PATIENCE
    sql = "execute function P2A(" & rowid_patience & ",'" & forever & "');"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
If Not oVtable Is Nothing Then
    rowid_admit = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    sql = "select ad_code,out_time from admission where rowid = " & rowid_admit
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txi_an = oVtable.Columns(1).Value
    out = oVtable.Columns(2).Value
    If out = "" Then Check1.Enabled = True
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    'FIND IN_TIME,OUT_TIME FROM ROWID_ADMIT
    sql = "select in_time,out_time from admission where rowid = " & rowid_admit
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
If oVtable.Columns(2).Value = "" Then
    txi_intime.Text = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    Check1.Enabled = True
    ' FIND NAME FROM HN
    sql = "execute procedure current_pat_name('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar where code = " & txi_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txi_name.Text = oVtable.Columns(3).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    'FIND SUR FROM HN
    sql = "execute procedure current_pat_sur('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar where code = " & txi_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txi_sur.Text = oVtable.Columns(3).Value
Else: MsgBox "ไม่สามารถใส่ค่าได้เนื่องจากไม่ใช่คนไข้ในปัจจุบัน", OK = vbOKOnly, "ERROR"
End If
     patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
Else: MsgBox "ไม่สามารถใส่ค่าได้เนื่องจากไม่ใช่คนไข้ในปัจจุบัน", OK = vbOKOnly, "ERROR"
End If
    End If

GoTo end1
error1:
    If Err = 13 Then
    MsgBox "คนไข้คนนี้ไม่เคยมีการ ADMIT", vbOKOnly, "ERROR"
    Else
    MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
    End If
end1:
End Sub

Private Sub cbn_doccode_Click()
On Error GoTo error1
    i = 0
    Do While (doc_code(i) <> cbn_doccode.Text)
        i = i + 1
    Loop
    txn_docname.Text = doc_char(i)
    rowid_doc = doc_id(i)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub Cbn_hn_Click()
Dim oVtable As ddoTable
On Error GoTo error1
    If cbn_hn.Text <> "" Then
    txn_name = ""
    txn_sur = ""
    cbn_doccode.Text = ""
    txn_docname = ""
    cbn_room.Text = ""
    cbn_package.Text = ""
    cmn_confirm.Enabled = True
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

Private Sub cbn_name_Click()
Dim oVtable1 As ddoTable
On Error GoTo error1
    cbn_name.Text = cbn_name.SelText
    'FIND HN FROM ROWID OF NAME
    sql = "execute procedure current_pat_name('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar where name = """ & cbn_name.Text & """"
    Set oVtable1 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    cbn_hn.Text = oVtable1.Columns(2).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable1.Name)
    'FIND SUR FROM HN
    sql = "execute procedure current_pat_sur('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar where code = """ & cbn_hn.Text & """"
    Set oVtable1 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    cbn_sur.Text = oVtable1.Columns(3).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable1.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbn_sur_Click()
Dim oVtable1 As ddoTable
On Error GoTo error1
    cbn_sur.Text = cbn_sur.SelText
    'FIND HN FROM SUR
    sql = "execute procedure current_pat_sur('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar where name = """ & cbn_sur.Text & """"
    Set oVtable1 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    cbn_hn.Text = oVtable1.Columns(2).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable1.Name)
    ' FIND NAME FROM HN
    sql = "execute procedure current_pat_name('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar where code = """ & cbn_hn.Text & """"
    Set oVtable1 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    cbn_name.Text = oVtable1.Columns(3).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable1.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Public Sub form_ini()
Dim oVtable As ddoTable
On Error GoTo error1
'ADD ITEM CBN_NAME
    sql = "execute procedure current_pat_name('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    nrecord = oVtable.TotalRecordCount
    ReDim name_id(nrecord) As Integer
    ReDim name_char(nrecord) As String
    i = 0
    While Not oVtable.EOT
        name_id(i) = oVtable.Columns(1).Value
        cbn_name.AddItem (oVtable.Columns(3).Value)
        name_char(i) = oVtable.Columns(3).Value
        oVtable.NextRecord
        i = i + 1
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
'ADD ITEM CBN_SUR
    sql = "execute procedure current_pat_sur('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    nrecord = oVtable.TotalRecordCount - 1
    ReDim sur_id(nrecord) As Integer
    ReDim sur_char(nrecord) As String
    i = 0
    While Not oVtable.EOT
        sur_id(i) = oVtable.Columns(1).Value
        cbn_sur.AddItem (oVtable.Columns(3).Value)
        sur_char(i) = oVtable.Columns(3).Value
        oVtable.NextRecord
        i = i + 1
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub
Sub form_ini2()
Dim oVtable As ddoTable
    Call docarray
    Call packagearray
    Call roomarray
    'Call medarray
    'Call disarray
    'Call medarray
    cbn_hn.clear
    sql = "select hn from patience"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    While Not oVtable.EOT
        cbn_hn.AddItem (oVtable.Columns(1).Value)
        oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
'ADD DOCCODR TO CBN_DOCCODE
    cbn_doccode.clear
    For i = 0 To UBound(doc_id)
        cbn_doccode.AddItem (doc_code(i))
    Next i
 'ADD PACKAGE NAME TO CBN_PACKAGE
    cbn_package.clear
    For i = 0 To UBound(package_id)
        cbn_package.AddItem (package_char(i))
    Next i
'ADD ROOM NUMBER TO CBN_ROOM
    cbn_room.clear
    For i = 0 To UBound(room_id)
        cbn_room.AddItem (room_num(i))
    Next i
    txn_indate.Text = datetime
End Sub

Sub form_ini3()
Dim oVtable As ddoTable
    Call medarray
    Call labarray
    cbc_med.clear
    cbc_medcode.clear
    For i = 0 To UBound(med_id)
        cbc_med.AddItem (med_char(i))
        cbc_medcode.AddItem (med_code(i))
    Next i
    lsc_lab.ListItems.clear
    For i = 0 To UBound(lab_id)
        Set index = lsc_lab.ListItems.Add
        index.Text = lab_char(i)
    Next i
End Sub

Private Sub cbn_package_Click()
On Error GoTo error1
    i = 0
    Do While (package_char(i) <> cbn_package.Text)
        i = i + 1
    Loop
    rowid_package = package_id(i)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub


Private Sub cbn_room_Click()
On Error GoTo error1
    i = 0
    Do While (room_num(i) <> cbn_room.Text)
        i = i + 1
    Loop
    rowid_room = room_id(i)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Sub getrowid_setoflab()
On Error GoTo error1
    c = 0
    n = 0
    p = 0
' find number of lab แต่ละชนิด  ตามที่เลือก
For j = 1 To lsc_lab.ListItems.Count
        If lsc_lab.ListItems(j).Checked = True Then
             X = lsc_lab.ListItems(j).Text
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
    For j = 1 To lsc_lab.ListItems.Count
        If lsc_lab.ListItems(j).Checked = True Then
             X = lsc_lab.ListItems(j).Text
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
    X = lsc_med.ListItems.Count - 1
    If X >= 0 Then
            ReDim rowid_setofmed(X) As Integer
            ReDim rowid_setofmedquan(X) As Integer
    End If
    Y = 0
    For j = 1 To lsc_med.ListItems.Count
            X = lsc_med.ListItems(j).Text
            i = 0
            Do While (med_code(i) <> CInt(X))
            i = i + 1
            Loop
            rowid_setofmed(Y) = med_id(i)
            rowid_setofmedquan(Y) = lsc_med.ListItems(j).SubItems(2)
            Y = Y + 1
    Next j
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Function Insert_Pic(file As String) As Integer
    Dim sql As String
    Dim oVtable As ddoTable
    Dim tmp(10) As Integer
On Error GoTo error1
    If (file <> "") Then
    sql = "insert into photo values (0,filetoblob('" & file & " ','client'));"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select rowid from photo where pic=filetoblob(""" & file & """,'client');"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    i = 0
    While Not oVtable.EOT
        tmp(i) = oVtable.Columns(1).Value
        oVtable.NextRecord
        i = i + 1
    Wend
    Insert_Pic = tmp(0)
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    Else: MsgBox "เลือกไฟล์ก่อนซิครับ", OK = vbOKOnly, "Insert Picture Error"
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function

Sub allocate_med()
On Error GoTo error1
    X = lsc_med.ListItems.Count
    If X > 0 Then
    For i = 0 To UBound(rowid_setofmed)
        sql = "execute procedure UMOPA(" & rowid_admit & "," & rowid_setofmed(i) & "," & rowid_setofmedquan(i) & ");"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    Next i
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Sub allocate_lab()
On Error GoTo error1
    X = 0
    For i = 1 To lsc_lab.ListItems.Count
        If lsc_lab.ListItems(i).Checked = True Then X = X + 1
    Next i
    If X > 0 Then
        If n > 0 Then
        For i = 0 To UBound(rowid_setoflabn)
                sql = "execute procedure allocate_LRNA(" & rowid_admit & "," & rowid_setoflabn(i) & ");"
                patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        Next i
        End If
        If c > 0 Then
        For i = 0 To UBound(rowid_setoflabc)
                sql = "execute procedure allocate_LRCA(" & rowid_admit & "," & rowid_setoflabc(i) & ");"
                patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        Next i
        End If
        If p > 0 Then
        For i = 0 To UBound(rowid_setoflabp)
                sql = "execute procedure allocate_LRPA(" & rowid_admit & "," & rowid_setoflabp(i) & ");"
                patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        Next i
        End If
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbq_an_Click()
Dim oVtable As ddoTable
On Error GoTo error1
    If cbq_an.Text <> "" Then
    txq_hn.Text = ""
    txq_an.Text = ""
    txq_name.Text = ""
    txq_sur.Text = ""
    txq_dateadmit = ""
    cbq_hn.Text = ""

    sql = "select rowid from admission where ad_code = " & cbq_an.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_admit = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    sql = "execute function A2P(" & rowid_admit & ");"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_patience = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)

    opq_past.Enabled = False
    cmq_query.Enabled = True
    Frame17.Enabled = True
    cmd_dialydiag.Enabled = False
    cmd_nurse.Enabled = False
    cmd_diag.Enabled = False
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbq_from_Click()
    i = cbfindpos(cbq_from, cbq_from.Text)
    txq_to = setofadmit_to(i)
    rowid_admit = setofadmit_rowid(i)
End Sub

Private Sub cbq_hn_Click()
Dim oVtable As ddoTable
On Error GoTo error1
    If cbq_hn.Text <> "" Then
    txq_hn.Text = ""
    txq_an.Text = ""
    txq_name.Text = ""
    txq_sur.Text = ""
    txq_dateadmit = ""
    cbq_an.Text = ""
    

    sql = "select rowid from patience where hn = " & cbq_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_patience = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    sql = "execute procedure alladmission(" & rowid_patience & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        cbq_an.Text = ""
        cbq_from.clear
        txq_to.Text = ""

    nrecord = oVtable.TotalRecordCount - 1
    ReDim setofadmit_rowid(nrecord) As Integer
    ReDim setofadmit_from(nrecord) As String
    ReDim setofadmit_to(nrecord) As String
    i = 0
    While Not oVtable.EOT
    rowid = oVtable.Columns(1).Value
    If rowid <> "" Then
        sql = "select ad_code from admission where rowid = " & rowid
        Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    '        cbq_an.AddItem (oVtable2.Columns(1).Value)
            setofadmit_rowid(i) = rowid
            setofadmit_from(i) = (Replace(oVtable.Columns(2).Value, ":00.00000", ""))
            setofadmit_to(i) = (Replace(oVtable.Columns(3).Value, ":00.00000", ""))
            cbq_from.AddItem (setofadmit_from(i))
            i = i + 1
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
    End If
    oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    If rowid <> "" Then
        opq_past.Enabled = True
        cmq_query.Enabled = True
        Frame17.Enabled = True
        cmd_nurse.Enabled = False
        cmd_diag.Enabled = False
        cmd_dialydiag.Enabled = False
    Else: MsgBox "ยังไม่มีการ Admit", OK = vbOKOnly, "Insert Picture Error"
    End If
    
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub Check1_Click()
    If Check1.Value = 1 Then
        txi_checkout.Enabled = True
        cmi_checkout.Enabled = True
        txi_checkout.Text = datetime
    Else: cmi_checkout.Enabled = False
        txi_checkout = ""
        txi_checkout.Enabled = False
    End If
End Sub

Private Sub cmc_confirm_Click()
    Call getrowid_setoflab
    Call getrowid_setofmed
    Call allocate_med
    Call allocate_lab
  
    cmc_confirm.Enabled = False
End Sub

Private Sub cmd_diag_Click()
    rowtemp = rowid_admit
    diagnosis_record.Show
End Sub

Private Sub cmd_dialydiag_Click()
    rowtemp = rowid_admit
    dialy_diag.Show
End Sub

Private Sub cmd_nurse_Click()
    rowtemp = rowid_admit
    nursing_plan.Show
End Sub

Private Sub cmi_browsed_Click()
    cmd_dialog.ShowOpen
    txi_dia.Text = cmd_dialog.FileName
End Sub

Private Sub cmi_browsen_Click()
    cmd_dialog.ShowOpen
    txi_np.Text = cmd_dialog.FileName
End Sub

Private Sub cmi_checkout_Click()
On Error GoTo error1
    sql = "update admission set out_time ='" & txi_checkout & "' where rowid =" & rowid_admit
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    cmi_checkout.Enabled = False
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cmi_clear_Click()
    cmi_insert.Enabled = True
    cbi_an.Text = ""
    cbi_hn.Text = ""
    txi_hn = ""
    txi_an = ""
    txi_name = ""
    txi_sur = ""
    txi_intime = ""
    txi_t = ""
    txi_hbp = ""
    txi_lbp = ""
    txi_r = ""
    txi_p = ""
    txi_np = ""
    txi_dia = ""
    Frame8.Enabled = False
End Sub

Private Sub cmi_clear2_Click()
    txi_t = ""
    txi_hbp = ""
    txi_lbp = ""
    txi_r = ""
    txi_p = ""
    txi_np = ""
    txi_dia = ""
End Sub

Private Sub cmi_insert_Click()
On Error GoTo error1
    If txi_t.Text <> "" Then
        t = txi_t.Text
    Else: t = "null"
    End If
    If txi_p.Text <> "" Then
        p = txi_p.Text
    Else: p = "null"
    End If
    If txi_r.Text <> "" Then
        r = txi_r.Text
    Else: r = "null"
    End If
    If txi_lbp.Text <> "" Then
        lbp = txi_lbp.Text
    Else: lbp = "null"
    End If
    If txi_hbp.Text <> "" Then
        hbp = txi_hbp.Text
    Else: hbp = "null"
    End If
    If txi_np.Text <> "" Then
        np = "filetoblob('" & txi_np.Text & "','client')"
    Else: np = "null"
    End If
    If txi_dia.Text <> "" Then
        dia = "filetoblob('" & txi_dia.Text & "','client')"
    Else: dia = "null"
    End If
    sql = "execute procedure update_ad_dia(" & rowid_admit & _
            "," & t & "," & p & "," & r & "," & lbp & "," & hbp & "," & np & "," & dia & ");"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    cmi_insert.Enabled = False
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cmn_clear_Click()
    cbn_hn.Text = ""
    txn_name = ""
    txn_sur = ""
    cbn_doccode.Text = ""
    txn_docname = ""
    cbn_room.Text = ""
    cbn_package.Text = ""
End Sub

Private Sub cmn_confirm_Click()
Dim oVtable As ddoTable
Dim oVtablex As ddoTable
On Error GoTo error1
SSTab1.TabEnabled(1) = True
SSTab1.TabEnabled(2) = True
SSTab1.TabEnabled(3) = True
If (cbn_doccode.Text <> "" And cbn_room.Text <> "" And cbn_package.Text <> "") Then

sql = "execute procedure admitOkorNot(" & rowid_patience & ");"
patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
sql = "select * from result"
Set oVtablex = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
If oVtablex.Columns(1).Value = "t" Then
'Allocate New daily_diagnosis
sql = "insert into ad_diagnosis values(0,""set{row(null," & datetime & "," & forever & ")}"","
sql = sql & """set{row(null," & datetime & "," & forever & ")}"","
sql = sql & """set{row(null," & datetime & "," & forever & ")}"","
sql = sql & """set{row(null," & datetime & "," & forever & ")}"","
sql = sql & """set{row(null," & datetime & "," & forever & ")}"","
sql = sql & """set{row(null," & datetime & "," & forever & ")}"","
sql = sql & """set{row(null," & datetime & "," & forever & ")}"");"
Debug.Print sql
patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
'Find Rowid_addiag from max_addiag
sql = "select max(ad_diagnosis_code) from ad_diagnosis"
Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
maxid = oVtable.Columns(1).Value
patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
sql = "select rowid from ad_diagnosis where ad_diagnosis_code = " & maxid
Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
rowid_addiag = oVtable.Columns(1).Value
patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
'Add New Record to Admit Table
sql = "insert into admission values(0," & rowid_doc & "," & rowid_package & "," & rowid_room & "," & rowid_addiag & ",'" & txn_indate & "',null)"
patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
'Find Present Rowid Admission
sql = "select max(ad_code) from admission"
Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
rowid_admit = oVtable.Columns(1).Value
sql = "select rowid from admission where ad_code = " & rowid_admit
Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
rowid_admit = oVtable.Columns(1).Value
patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
'Update Admission to Patience
sql = "execute procedure UA2P(" & rowid_admit & "," & rowid_patience & ")"
patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
cmn_confirm.Enabled = False
cmn_clear_Click
Else: MsgBox "คนไข้รายนี้ยังอยู่ในโรงพยาบาล", OK = vbOKOnly, "ERROR"
End If
patience_nav.ddoDataGroup.DeleteVirtualTable (oVtablex.Name)

Else: MsgBox "กรุณาใส่ค่าให้ครบก่อน", OK = vbOKOnly, "ERROR"
End If

GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Function findcurrentadmit() As Integer
On Error GoTo error1
    i = 0
    Do While (setofadmit_to(i) <> "9999-12-31 23:59")
        i = i + 1
    Loop
    findcurrentadmit = i
error1:
End Function

Private Sub cmn_exit_Click(index As Integer)
    Unload Me
    startform.Show
End Sub

Private Sub cmq_query_Click()
Dim oVtable As ddoTable
Dim i As Integer
On Error GoTo error1
    If opq_current.Value = True Then
        ptime = forever
        If opq_hn.Value = True Then
            i = findcurrentadmit()
            If (i <> Empty Or i = 0) Then
                rowid_admit = setofadmit_rowid(i)
            Else: GoTo error1
            End If
        End If
    ElseIf cbq_from.Text <> "" Then
        ptime = txq_to.Text
    End If
 
    sql = "execute procedure atname(" & rowid_patience & ",'" & ptime & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "execute procedure checkresult()"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
If oVtable.Columns(1).Value <> "nothing" Then
    txq_name = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure atsurname(" & rowid_patience & ",'" & ptime & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txq_sur = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "select in_time from admission where rowid = " & rowid_admit
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txq_dateadmit.Text = Replace(oVtable.Columns(1).Value, ":00.00000", "")
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)

    If opq_hn.Value = True Then
        txq_hn.Text = cbq_hn.Text
        sql = "select ad_code from admission where rowid = " & rowid_admit
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        txq_an.Text = oVtable.Columns(1).Value
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    ElseIf opq_an.Value = True Then
        txq_an.Text = cbq_an.Text
        sql = "select hn from patience where rowid = " & rowid_patience
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        txq_hn.Text = oVtable.Columns(1).Value
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
    
    
    
    sql = "execute procedure allnurse(" & rowid_admit & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable.TotalRecordCount > 1 Then
        cmd_nurse.Enabled = True
    Else: cmd_nurse.Enabled = False
    End If
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure alldiag(" & rowid_admit & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable.TotalRecordCount > 1 Then
        cmd_diag.Enabled = True
    Else: cmd_diag.Enabled = False
    End If
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
'CHECK ALL DIALY DIAG
    sql = "execute procedure alltemp(" & rowid_admit & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable.TotalRecordCount > 1 Then
        cmd_dialydiag.Enabled = True
    End If
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
'CHECK ALL DIALY DIAG
    sql = "execute procedure alltemp(" & rowid_admit & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable.TotalRecordCount > 1 Then
        cmd_dialydiag.Enabled = True
    End If
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    sql = "execute procedure allrep(" & rowid_admit & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable.TotalRecordCount > 1 Then
        cmd_dialydiag.Enabled = True
    End If
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    sql = "execute procedure allpulse(" & rowid_admit & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable.TotalRecordCount > 1 Then
        cmd_dialydiag.Enabled = True
    End If
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    sql = "execute procedure allbp(" & rowid_admit & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable.TotalRecordCount > 1 Then
        cmd_dialydiag.Enabled = True
    End If
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)

Else: MsgBox "คนไข้รายนี้ไม่มีการ Admit ในช่วงเวลาที่ค้นหา", OK = vbOKOnly, "Not Match"
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
End If
    GoTo end1
error1:
    MsgBox "คนไข้รายนี้ไม่มีการ Admit ในปัจจุบัน", OK = vbOKOnly, "Not Match"
end1:
End Sub

Private Sub Form_activate()
On Error GoTo error1
    'Call form_ini
    datetime = CalDate()
    If SSTab1.Tab = 0 Then Call form_ini2
    If SSTab1.Tab = 1 Then
        cbq_an.clear
        sql = "select ad_code from admission"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        While Not oVtable.EOT
                cbq_an.AddItem (oVtable.Columns(1).Value)
                oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        cbq_hn.clear
        sql = "select hn from patience"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        While Not oVtable.EOT
                cbq_hn.AddItem (oVtable.Columns(1).Value)
                oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
    
    sql = "select ad_code from admission"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable Is Nothing Then
        SSTab1.TabEnabled(1) = False
        SSTab1.TabEnabled(2) = False
        SSTab1.TabEnabled(3) = False
    Else
    If SSTab1.Tab = 2 Then
        cbi_an.clear
        sql = "select ad_code from admission where out_time is null"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        If Not oVtable Is Nothing Then
        While Not oVtable.EOT
                cbi_an.AddItem (oVtable.Columns(1).Value)
                oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        End If
        cbi_hn.clear
        sql = "select hn from patience"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        While Not oVtable.EOT
                cbi_hn.AddItem (oVtable.Columns(1).Value)
                oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    ElseIf SSTab1.Tab = 3 Then
        Call form_ini3
        cbc_an.clear
        sql = "select ad_code from admission where out_time is null"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        If Not oVtable Is Nothing Then
        While Not oVtable.EOT
                cbc_an.AddItem (oVtable.Columns(1).Value)
                oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        End If
    End If
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub opi_an_Click()
    If opi_an.Value = True Then
    cbi_an.Enabled = True
    cbi_hn.Enabled = False
    Frame8.Enabled = False
    Check1.Enabled = False
    End If
End Sub

Private Sub opi_hn_Click()
    If opi_hn.Value = True Then
    cbi_hn.Enabled = True
    cbi_an.Enabled = False
    Frame8.Enabled = False
    Check1.Enabled = False
    End If
End Sub

Private Sub opq_an_Click()
    If opq_an.Value = True Then
        cbq_an.Enabled = True
        cbq_hn.Enabled = False
        opq_current.Value = True
        cbq_from.clear
        txq_to = ""
    End If
End Sub

Private Sub opq_current_Click()
    If opq_current.Value = True Then
        cbq_from.Text = ""
        txq_to.Text = ""
        cbq_from.Enabled = False
        txq_to.Enabled = False
    End If
End Sub

Private Sub opq_hn_Click()
    If opq_hn.Value = True Then
        cbq_hn.Enabled = True
        cbq_an.Enabled = False
    End If
End Sub

Private Sub opq_past_Click()
    If opq_past.Value = True Then
    cbq_from.Enabled = True
    txq_to.Enabled = True
    End If
    
End Sub

Private Sub SSTab1_Click(PreviousTab As Integer)
On Error GoTo error1
    If SSTab1.Tab = 0 Then Call form_ini2
    If SSTab1.Tab = 1 Then
        cbq_an.clear
        sql = "select ad_code from admission"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        While Not oVtable.EOT
                cbq_an.AddItem (oVtable.Columns(1).Value)
                oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        cbq_hn.clear
        sql = "select hn from patience"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        While Not oVtable.EOT
                cbq_hn.AddItem (oVtable.Columns(1).Value)
                oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
    
    sql = "select ad_code from admission where out_time is null"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable Is Nothing Then
        SSTab1.TabEnabled(2) = False
        SSTab1.TabEnabled(3) = False
    Else
    If SSTab1.Tab = 2 Then
        cbi_an.clear
        sql = "select ad_code from admission where out_time is null"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        While Not oVtable.EOT
                cbi_an.AddItem (oVtable.Columns(1).Value)
                oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        cbi_hn.clear
        sql = "select hn from patience"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        While Not oVtable.EOT
                cbi_hn.AddItem (oVtable.Columns(1).Value)
                oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    ElseIf SSTab1.Tab = 3 Then
        Call form_ini3
        cbc_an.clear
        sql = "select ad_code from admission where out_time is null"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        While Not oVtable.EOT
                cbc_an.AddItem (oVtable.Columns(1).Value)
                oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
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
'NumDataLinks=8
'[DataLink]
'GroupName=patience
'ControlName=Combo11
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
'ControlName=Combo3
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
'ControlName=cbi_hn
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
'GroupName=admission
'ControlName=cbq_an
'ClassId=2
'Synchronize=0
'GetAllData=1
'StoreSelect=1
'SortOrder=0
'SortFlag=0
'DefaultType=1
'TrimTrailingBlanks=0
'DataSource=admission_nav
'DataField=ad_code
'AssociationType=2
'SourceType=1
'[DataLinkButtonInfo]
'[EndDataLinkButtonInfo]
'[DataLinkPath]
'NumElements=1
'[DataLinkPathInfo]
'TableName=admission
'NumColumns=1
'ColumnName=ad_code
'[EndDataLinkPathInfo]
'[EndDataLinkPath]
'[EndDataLink]
'[DataLink]
'GroupName=admission
'ControlName=cbc_an
'ClassId=2
'Synchronize=0
'GetAllData=1
'StoreSelect=1
'SortOrder=0
'SortFlag=0
'DefaultType=1
'TrimTrailingBlanks=0
'DataSource=admission_nav
'DataField=ad_code
'AssociationType=2
'SourceType=1
'[DataLinkButtonInfo]
'[EndDataLinkButtonInfo]
'[DataLinkPath]
'NumElements=1
'[DataLinkPathInfo]
'TableName=admission
'NumColumns=1
'ColumnName=ad_code
'[EndDataLinkPathInfo]
'[EndDataLinkPath]
'[EndDataLink]
'[DataLink]
'GroupName=admission
'ControlName=cbi_an
'ClassId=2
'Synchronize=0
'GetAllData=1
'StoreSelect=1
'SortOrder=0
'SortFlag=0
'DefaultType=1
'TrimTrailingBlanks=0
'DataSource=admission_nav
'DataField=ad_code
'AssociationType=2
'SourceType=1
'[DataLinkButtonInfo]
'[EndDataLinkButtonInfo]
'[DataLinkPath]
'NumElements=1
'[DataLinkPathInfo]
'TableName=admission
'NumColumns=1
'ColumnName=ad_code
'[EndDataLinkPathInfo]
'[EndDataLinkPath]
'[EndDataLink]
'[DataDirectorInfoEnd]
'End Sub
