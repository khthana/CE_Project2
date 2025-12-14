VERSION 5.00
Object = "{BF448208-70DE-11CF-947B-0020AF75C4BA}#1.0#0"; "navctl32.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form MainScreen 
   Caption         =   "ระบบสืบค้นข้อมูลนักศึกษา"
   ClientHeight    =   7020
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   8835
   LinkTopic       =   "Form1"
   ScaleHeight     =   7020
   ScaleWidth      =   8835
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Height          =   6855
      Left            =   120
      TabIndex        =   1
      Top             =   0
      Width           =   8655
      Begin VB.CommandButton cmdExit 
         BackColor       =   &H00C0FFC0&
         Cancel          =   -1  'True
         Caption         =   "ออก"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   14.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   4920
         MaskColor       =   &H000000FF&
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   6480
         UseMaskColor    =   -1  'True
         Width           =   3615
      End
      Begin TabDlg.SSTab SSTab1 
         Height          =   6255
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   8415
         _ExtentX        =   14843
         _ExtentY        =   11033
         _Version        =   393216
         TabHeight       =   520
         BackColor       =   12632256
         ForeColor       =   16711680
         TabCaption(0)   =   "Insert"
         TabPicture(0)   =   "input.frx":0000
         Tab(0).ControlEnabled=   -1  'True
         Tab(0).Control(0)=   "FrameInsert(0)"
         Tab(0).Control(0).Enabled=   0   'False
         Tab(0).ControlCount=   1
         TabCaption(1)   =   "Update / Delete"
         TabPicture(1)   =   "input.frx":001C
         Tab(1).ControlEnabled=   0   'False
         Tab(1).Control(0)=   "Frame6"
         Tab(1).ControlCount=   1
         TabCaption(2)   =   "Query"
         TabPicture(2)   =   "input.frx":0038
         Tab(2).ControlEnabled=   0   'False
         Tab(2).Control(0)=   "Frame5"
         Tab(2).ControlCount=   1
         Begin VB.Frame Frame6 
            Caption         =   "For update"
            ForeColor       =   &H00FFFF80&
            Height          =   5655
            Left            =   -74880
            TabIndex        =   86
            Top             =   480
            Width           =   8175
            Begin TabDlg.SSTab SSTab3 
               Height          =   5295
               Left            =   120
               TabIndex        =   87
               Top             =   240
               Width           =   7935
               _ExtentX        =   13996
               _ExtentY        =   9340
               _Version        =   393216
               Tab             =   2
               TabHeight       =   520
               TabCaption(0)   =   "แก้ไขข้อมูลนักศึกษา"
               TabPicture(0)   =   "input.frx":0054
               Tab(0).ControlEnabled=   0   'False
               Tab(0).Control(0)=   "Frame8"
               Tab(0).ControlCount=   1
               TabCaption(1)   =   "แก้ไขข้อมูลรายวิชา"
               TabPicture(1)   =   "input.frx":0070
               Tab(1).ControlEnabled=   0   'False
               Tab(1).Control(0)=   "Frame9"
               Tab(1).ControlCount=   1
               TabCaption(2)   =   "แก้ไขข้อมูลลงทะเบียน"
               TabPicture(2)   =   "input.frx":008C
               Tab(2).ControlEnabled=   -1  'True
               Tab(2).Control(0)=   "Frame10"
               Tab(2).Control(0).Enabled=   0   'False
               Tab(2).ControlCount=   1
               Begin VB.Frame Frame8 
                  Height          =   4695
                  Left            =   -74880
                  TabIndex        =   107
                  Top             =   480
                  Width           =   7695
                  Begin VB.CommandButton Command23 
                     Caption         =   "Delete"
                     Height          =   375
                     Left            =   4920
                     TabIndex        =   178
                     Top             =   4200
                     Width           =   1935
                  End
                  Begin VB.Frame Frame20 
                     Height          =   975
                     Left            =   120
                     TabIndex        =   172
                     Top             =   240
                     Width           =   1215
                     Begin VB.ComboBox Combo19 
                        Height          =   315
                        Left            =   120
                        TabIndex        =   173
                        Top             =   480
                        Width           =   855
                     End
                     Begin VB.Label Label41 
                        Caption         =   "Student serial"
                        Height          =   255
                        Left            =   120
                        TabIndex        =   174
                        Top             =   240
                        Width           =   975
                     End
                  End
                  Begin VB.CommandButton Command19 
                     Caption         =   "ยกเลิกทั้งหมด"
                     Height          =   375
                     Left            =   2640
                     TabIndex        =   137
                     Top             =   240
                     Width           =   1335
                  End
                  Begin VB.CheckBox Check2 
                     Caption         =   "รหัสนักศึกษา"
                     Height          =   255
                     Left            =   1440
                     TabIndex        =   136
                     Top             =   960
                     Width           =   1335
                  End
                  Begin VB.TextBox Text23 
                     Height          =   285
                     Left            =   2760
                     MaxLength       =   70
                     TabIndex        =   134
                     Top             =   2760
                     Width           =   4095
                  End
                  Begin VB.Frame Frame2 
                     Caption         =   "วันที่ Update--------------------- (Month/Day/Year )"
                     Height          =   855
                     Index           =   4
                     Left            =   1200
                     TabIndex        =   119
                     Top             =   3240
                     Width           =   3495
                     Begin MSComCtl2.DTPicker DTPicker4 
                        Height          =   375
                        Left            =   1560
                        TabIndex        =   120
                        Top             =   360
                        Width           =   1455
                        _ExtentX        =   2566
                        _ExtentY        =   661
                        _Version        =   393216
                        Format          =   24182785
                        CurrentDate     =   36328
                     End
                  End
                  Begin VB.CheckBox Check4 
                     Caption         =   "ชื่อ"
                     Height          =   255
                     Left            =   1800
                     TabIndex        =   118
                     Top             =   1680
                     Width           =   855
                  End
                  Begin VB.CheckBox Check5 
                     Caption         =   "นามสกุล"
                     Height          =   255
                     Left            =   1800
                     TabIndex        =   117
                     Top             =   2040
                     Width           =   975
                  End
                  Begin VB.CheckBox Check6 
                     Caption         =   "สาขาวิชา"
                     Height          =   255
                     Left            =   1800
                     TabIndex        =   116
                     Top             =   2400
                     Width           =   975
                  End
                  Begin VB.CheckBox Check7 
                     Caption         =   "ที่อยู่"
                     Height          =   375
                     Left            =   1800
                     TabIndex        =   115
                     Top             =   2760
                     Width           =   975
                  End
                  Begin VB.TextBox Text18 
                     Height          =   285
                     Left            =   2760
                     MaxLength       =   8
                     TabIndex        =   114
                     Top             =   960
                     Width           =   855
                  End
                  Begin VB.TextBox Text19 
                     Height          =   285
                     Left            =   2760
                     MaxLength       =   5
                     TabIndex        =   113
                     Top             =   1320
                     Width           =   615
                  End
                  Begin VB.TextBox Text20 
                     Height          =   285
                     Left            =   2760
                     MaxLength       =   30
                     TabIndex        =   112
                     Top             =   1680
                     Width           =   2175
                  End
                  Begin VB.TextBox Text21 
                     Height          =   285
                     Left            =   2760
                     MaxLength       =   30
                     TabIndex        =   111
                     Top             =   2040
                     Width           =   2175
                  End
                  Begin VB.TextBox Text22 
                     Height          =   285
                     Left            =   2760
                     MaxLength       =   30
                     TabIndex        =   110
                     Top             =   2400
                     Width           =   3255
                  End
                  Begin VB.CommandButton Command13 
                     Caption         =   "แก้ไขทั้งหมด"
                     Height          =   375
                     Left            =   1440
                     TabIndex        =   109
                     Top             =   240
                     Width           =   1095
                  End
                  Begin VB.CommandButton Command17 
                     Caption         =   "Update"
                     Height          =   375
                     Left            =   1320
                     TabIndex        =   108
                     Top             =   4200
                     Width           =   3375
                  End
                  Begin VB.Label Label44 
                     Caption         =   "คำนำหน้า"
                     Height          =   255
                     Left            =   2040
                     TabIndex        =   147
                     Top             =   1320
                     Width           =   735
                  End
               End
               Begin VB.Frame Frame9 
                  Height          =   4695
                  Left            =   -74880
                  TabIndex        =   92
                  Top             =   480
                  Width           =   7695
                  Begin VB.CommandButton Command24 
                     Caption         =   "Delete"
                     Height          =   375
                     Left            =   5400
                     TabIndex        =   179
                     Top             =   4200
                     Width           =   1695
                  End
                  Begin VB.Frame Frame21 
                     Height          =   975
                     Left            =   120
                     TabIndex        =   175
                     Top             =   360
                     Width           =   1215
                     Begin VB.ComboBox Combo20 
                        Height          =   315
                        Left            =   120
                        TabIndex        =   176
                        Top             =   480
                        Width           =   975
                     End
                     Begin VB.Label Label42 
                        Caption         =   "Sub serial"
                        Height          =   255
                        Left            =   240
                        TabIndex        =   177
                        Top             =   240
                        Width           =   855
                     End
                  End
                  Begin VB.CommandButton Command20 
                     Caption         =   "ยกเลิกทั้งหมด"
                     Height          =   375
                     Left            =   2640
                     TabIndex        =   149
                     Top             =   360
                     Width           =   1215
                  End
                  Begin VB.CommandButton Command12 
                     Caption         =   "แก้ไขทั้งหมด"
                     Height          =   375
                     Left            =   1440
                     TabIndex        =   148
                     Top             =   360
                     Width           =   1095
                  End
                  Begin VB.TextBox Text29 
                     Height          =   285
                     Left            =   2760
                     MaxLength       =   50
                     TabIndex        =   135
                     Top             =   2760
                     Width           =   3975
                  End
                  Begin VB.Frame Frame2 
                     Caption         =   "วันที่ Update--------------------- (Month/Day/Year )"
                     Height          =   855
                     Index           =   5
                     Left            =   1440
                     TabIndex        =   105
                     Top             =   3240
                     Width           =   3735
                     Begin MSComCtl2.DTPicker DTPicker5 
                        Height          =   375
                        Left            =   2040
                        TabIndex        =   106
                        Top             =   360
                        Width           =   1575
                        _ExtentX        =   2778
                        _ExtentY        =   661
                        _Version        =   393216
                        Format          =   24182785
                        CurrentDate     =   36328
                     End
                  End
                  Begin VB.CheckBox Check8 
                     Caption         =   "รหัสวิชา"
                     Height          =   255
                     Left            =   1440
                     TabIndex        =   104
                     Top             =   960
                     Width           =   1335
                  End
                  Begin VB.CheckBox Check9 
                     Caption         =   "ชื่อวิชา"
                     Height          =   255
                     Left            =   1440
                     TabIndex        =   103
                     Top             =   1320
                     Width           =   1335
                  End
                  Begin VB.CheckBox Check10 
                     Caption         =   "หน่วยกิต"
                     Height          =   255
                     Left            =   1440
                     TabIndex        =   102
                     Top             =   1680
                     Width           =   1215
                  End
                  Begin VB.CheckBox Check11 
                     Caption         =   "อาจารย์ผู้สอน"
                     Height          =   255
                     Left            =   1440
                     TabIndex        =   101
                     Top             =   2040
                     Width           =   1335
                  End
                  Begin VB.CheckBox Check12 
                     Caption         =   "เวลาที่สอน"
                     Height          =   255
                     Left            =   1440
                     TabIndex        =   100
                     Top             =   2400
                     Width           =   1335
                  End
                  Begin VB.CheckBox Check13 
                     Caption         =   "หนังสือที่ใช้"
                     Height          =   255
                     Left            =   1440
                     TabIndex        =   99
                     Top             =   2760
                     Width           =   1335
                  End
                  Begin VB.TextBox Text24 
                     Height          =   285
                     Left            =   2760
                     MaxLength       =   8
                     TabIndex        =   98
                     Top             =   960
                     Width           =   855
                  End
                  Begin VB.TextBox Text25 
                     Height          =   285
                     Left            =   2760
                     MaxLength       =   50
                     TabIndex        =   97
                     Top             =   1320
                     Width           =   3135
                  End
                  Begin VB.TextBox Text26 
                     Height          =   285
                     Left            =   2760
                     MaxLength       =   1
                     TabIndex        =   96
                     Top             =   1680
                     Width           =   375
                  End
                  Begin VB.TextBox Text27 
                     Height          =   285
                     Left            =   2760
                     MaxLength       =   30
                     TabIndex        =   95
                     Top             =   2040
                     Width           =   2535
                  End
                  Begin VB.TextBox Text28 
                     Height          =   285
                     Left            =   2760
                     MaxLength       =   30
                     TabIndex        =   94
                     Top             =   2400
                     Width           =   3135
                  End
                  Begin VB.CommandButton Command14 
                     Caption         =   "Update"
                     Height          =   375
                     Left            =   1560
                     TabIndex        =   93
                     Top             =   4200
                     Width           =   3495
                  End
               End
               Begin VB.Frame Frame10 
                  Height          =   4695
                  Left            =   120
                  TabIndex        =   88
                  Top             =   480
                  Width           =   7575
                  Begin VB.Frame Frame14 
                     Caption         =   "แก้ไขเกรด"
                     Height          =   3135
                     Left            =   120
                     TabIndex        =   127
                     Top             =   120
                     Width           =   7335
                     Begin VB.ComboBox Combo25 
                        Height          =   315
                        ItemData        =   "input.frx":00A8
                        Left            =   6000
                        List            =   "input.frx":00B8
                        TabIndex        =   166
                        Text            =   "1"
                        Top             =   960
                        Width           =   855
                     End
                     Begin VB.CheckBox Check3 
                        Caption         =   "แก้ไข section"
                        Height          =   255
                        Left            =   4800
                        TabIndex        =   165
                        Top             =   2520
                        Width           =   1335
                     End
                     Begin VB.Frame Frame19 
                        Caption         =   "Subject "
                        Height          =   2895
                        Left            =   2400
                        TabIndex        =   156
                        Top             =   240
                        Width           =   2055
                        Begin VB.TextBox Text11 
                           Height          =   285
                           Left            =   120
                           Locked          =   -1  'True
                           MaxLength       =   8
                           TabIndex        =   212
                           Top             =   1200
                           Width           =   1815
                        End
                        Begin VB.TextBox Text13 
                           Height          =   285
                           Left            =   120
                           Locked          =   -1  'True
                           MaxLength       =   8
                           TabIndex        =   169
                           Top             =   2400
                           Width           =   1815
                        End
                        Begin VB.TextBox Text12 
                           Height          =   285
                           Left            =   120
                           Locked          =   -1  'True
                           MaxLength       =   50
                           TabIndex        =   168
                           Top             =   1800
                           Width           =   1815
                        End
                        Begin VB.ComboBox Combo17 
                           Height          =   315
                           Left            =   360
                           TabIndex        =   157
                           Top             =   600
                           Width           =   1215
                        End
                        Begin VB.Label Label30 
                           Caption         =   "Subject serial"
                           Height          =   255
                           Left            =   360
                           TabIndex        =   214
                           Top             =   240
                           Width           =   975
                        End
                        Begin VB.Label Label13 
                           Caption         =   "หน่วยกิต"
                           Height          =   255
                           Left            =   120
                           TabIndex        =   171
                           Top             =   2160
                           Width           =   735
                        End
                        Begin VB.Label Label11 
                           Caption         =   "ชื่อวิชา"
                           Height          =   255
                           Left            =   120
                           TabIndex        =   170
                           Top             =   1560
                           Width           =   1095
                        End
                        Begin VB.Label Label38 
                           Caption         =   "รหัสรายวิชา"
                           Height          =   255
                           Left            =   120
                           TabIndex        =   167
                           Top             =   960
                           Width           =   855
                        End
                     End
                     Begin VB.Frame Frame18 
                        Caption         =   "Student"
                        Height          =   2895
                        Left            =   240
                        TabIndex        =   154
                        Top             =   240
                        Width           =   2175
                        Begin VB.TextBox Text44 
                           Height          =   285
                           Left            =   240
                           Locked          =   -1  'True
                           TabIndex        =   211
                           Top             =   2400
                           Width           =   1815
                        End
                        Begin VB.TextBox Text42 
                           Height          =   285
                           Left            =   240
                           Locked          =   -1  'True
                           MaxLength       =   30
                           TabIndex        =   159
                           Top             =   1200
                           Width           =   1815
                        End
                        Begin VB.TextBox Text43 
                           Height          =   285
                           Left            =   240
                           Locked          =   -1  'True
                           MaxLength       =   30
                           TabIndex        =   158
                           Top             =   1800
                           Width           =   1815
                        End
                        Begin VB.ComboBox Combo16 
                           Height          =   315
                           Left            =   360
                           TabIndex        =   155
                           Top             =   600
                           Width           =   1215
                        End
                        Begin VB.Label Label27 
                           Caption         =   "Student serial"
                           Height          =   255
                           Left            =   360
                           TabIndex        =   213
                           Top             =   240
                           Width           =   1095
                        End
                        Begin VB.Label Label39 
                           Caption         =   "รหัสนักศึกษา"
                           Height          =   255
                           Left            =   240
                           TabIndex        =   162
                           Top             =   960
                           Width           =   975
                        End
                        Begin VB.Label Label35 
                           Caption         =   "ชื่อ"
                           Height          =   255
                           Left            =   240
                           TabIndex        =   161
                           Top             =   1560
                           Width           =   255
                        End
                        Begin VB.Label Label40 
                           Caption         =   "นามสกุล"
                           Height          =   255
                           Left            =   240
                           TabIndex        =   160
                           Top             =   2160
                           Width           =   615
                        End
                     End
                     Begin VB.CheckBox Check1 
                        Caption         =   "แก้เกรด"
                        Height          =   255
                        Left            =   4800
                        TabIndex        =   133
                        Top             =   1920
                        Width           =   975
                     End
                     Begin VB.ComboBox Combo18 
                        Height          =   315
                        ItemData        =   "input.frx":00C8
                        Left            =   5760
                        List            =   "input.frx":00E7
                        TabIndex        =   132
                        Text            =   "A"
                        Top             =   1920
                        Width           =   855
                     End
                     Begin VB.ComboBox Combo15 
                        Height          =   315
                        ItemData        =   "input.frx":0109
                        Left            =   4800
                        List            =   "input.frx":0113
                        TabIndex        =   129
                        Text            =   "1"
                        Top             =   960
                        Width           =   855
                     End
                     Begin VB.ComboBox Combo14 
                        Height          =   315
                        ItemData        =   "input.frx":011D
                        Left            =   6120
                        List            =   "input.frx":0127
                        TabIndex        =   128
                        Text            =   "1"
                        Top             =   2520
                        Width           =   855
                     End
                     Begin VB.Label Label37 
                        Caption         =   "ปีที่"
                        Height          =   255
                        Left            =   6240
                        TabIndex        =   131
                        Top             =   720
                        Width           =   255
                     End
                     Begin VB.Label Label36 
                        Caption         =   "เทอมที่"
                        Height          =   255
                        Left            =   4920
                        TabIndex        =   130
                        Top             =   600
                        Width           =   495
                     End
                  End
                  Begin VB.Frame Frame2 
                     Caption         =   "วันที่ Update------ (Month/Day/Year )"
                     Height          =   735
                     Index           =   6
                     Left            =   1920
                     TabIndex        =   90
                     Top             =   3360
                     Width           =   3015
                     Begin MSComCtl2.DTPicker DTPicker6 
                        Height          =   375
                        Left            =   1200
                        TabIndex        =   91
                        Top             =   240
                        Width           =   1575
                        _ExtentX        =   2778
                        _ExtentY        =   661
                        _Version        =   393216
                        Format          =   24182785
                        CurrentDate     =   36328
                     End
                  End
                  Begin VB.CommandButton Command15 
                     Caption         =   "Update"
                     Height          =   375
                     Left            =   1920
                     TabIndex        =   89
                     Top             =   4200
                     Width           =   2895
                  End
               End
            End
         End
         Begin VB.Frame FrameInsert 
            Caption         =   "For Insert"
            ForeColor       =   &H00FFFF80&
            Height          =   5775
            Index           =   0
            Left            =   240
            TabIndex        =   45
            Top             =   360
            Width           =   8175
            Begin TabDlg.SSTab SSTab2 
               Height          =   5415
               Left            =   120
               TabIndex        =   46
               Top             =   240
               Width           =   7935
               _ExtentX        =   13996
               _ExtentY        =   9551
               _Version        =   393216
               Style           =   1
               Tab             =   2
               TabHeight       =   520
               BackColor       =   12632256
               ForeColor       =   12632256
               TabCaption(0)   =   "ข้อมูลนักศึกษา"
               TabPicture(0)   =   "input.frx":0131
               Tab(0).ControlEnabled=   0   'False
               Tab(0).Control(0)=   "Frame2(1)"
               Tab(0).ControlCount=   1
               TabCaption(1)   =   "ข้อมูลรายวิชา"
               TabPicture(1)   =   "input.frx":014D
               Tab(1).ControlEnabled=   0   'False
               Tab(1).Control(0)=   "Frame3"
               Tab(1).ControlCount=   1
               TabCaption(2)   =   "ข้อมูลลงทะเบียน"
               TabPicture(2)   =   "input.frx":0169
               Tab(2).ControlEnabled=   -1  'True
               Tab(2).Control(0)=   "Frame4"
               Tab(2).Control(0).Enabled=   0   'False
               Tab(2).ControlCount=   1
               Begin VB.Frame Frame4 
                  Caption         =   "ข้อมูลลงทะเบียน Register Table"
                  Height          =   4935
                  Left            =   120
                  TabIndex        =   79
                  Top             =   360
                  Width           =   7695
                  Begin VB.Frame Frame22 
                     Height          =   855
                     Left            =   120
                     TabIndex        =   180
                     Top             =   1440
                     Width           =   7455
                     Begin VB.TextBox Text48 
                        Height          =   285
                        Left            =   6240
                        TabIndex        =   197
                        Top             =   360
                        Width           =   855
                     End
                     Begin VB.TextBox Text47 
                        Height          =   285
                        Left            =   2520
                        TabIndex        =   196
                        Top             =   360
                        Width           =   3495
                     End
                     Begin VB.TextBox Text46 
                        Height          =   285
                        Left            =   1440
                        TabIndex        =   195
                        Top             =   360
                        Width           =   975
                     End
                     Begin VB.ComboBox Combo26 
                        Height          =   315
                        Left            =   240
                        TabIndex        =   181
                        Top             =   360
                        Width           =   1095
                     End
                     Begin VB.Label Label49 
                        Caption         =   "หน่วยกิต"
                        Height          =   255
                        Left            =   6240
                        TabIndex        =   200
                        Top             =   120
                        Width           =   735
                     End
                     Begin VB.Label Label48 
                        Caption         =   "ชื่อวิชา"
                        Height          =   255
                        Left            =   2640
                        TabIndex        =   199
                        Top             =   120
                        Width           =   495
                     End
                     Begin VB.Label Label20 
                        Caption         =   "รหัสรายวิชา"
                        Height          =   255
                        Left            =   1440
                        TabIndex        =   198
                        Top             =   120
                        Width           =   855
                     End
                     Begin VB.Label Label47 
                        Caption         =   "sub  serial"
                        Height          =   255
                        Left            =   240
                        TabIndex        =   182
                        Top             =   120
                        Width           =   855
                     End
                  End
                  Begin VB.Frame Frame17 
                     Height          =   735
                     Left            =   120
                     TabIndex        =   150
                     Top             =   480
                     Width           =   7455
                     Begin VB.TextBox Text15 
                        Height          =   285
                        Left            =   5280
                        MaxLength       =   30
                        TabIndex        =   189
                        Top             =   360
                        Width           =   1815
                     End
                     Begin VB.TextBox Text14 
                        Height          =   285
                        Left            =   3360
                        MaxLength       =   30
                        TabIndex        =   187
                        Top             =   360
                        Width           =   1815
                     End
                     Begin VB.TextBox Text10 
                        Height          =   285
                        Left            =   1440
                        MaxLength       =   8
                        TabIndex        =   184
                        Top             =   360
                        Width           =   855
                     End
                     Begin VB.TextBox Text45 
                        Height          =   285
                        Left            =   2520
                        MaxLength       =   5
                        TabIndex        =   183
                        Top             =   360
                        Width           =   735
                     End
                     Begin VB.ComboBox Combo24 
                        Height          =   315
                        Left            =   240
                        TabIndex        =   152
                        Top             =   360
                        Width           =   1095
                     End
                     Begin VB.Label Label24 
                        Caption         =   "นามสกุล"
                        Height          =   255
                        Left            =   5400
                        TabIndex        =   190
                        Top             =   120
                        Width           =   615
                     End
                     Begin VB.Label Label23 
                        Caption         =   "ชื่อนักศึกษา"
                        Height          =   255
                        Left            =   3600
                        TabIndex        =   188
                        Top             =   120
                        Width           =   855
                     End
                     Begin VB.Label Label9 
                        Caption         =   "รหัสนักศึกษา"
                        Height          =   255
                        Left            =   1440
                        TabIndex        =   186
                        Top             =   120
                        Width           =   975
                     End
                     Begin VB.Label Label45 
                        Caption         =   "คำนำหน้า"
                        Height          =   255
                        Left            =   2520
                        TabIndex        =   185
                        Top             =   120
                        Width           =   735
                     End
                     Begin VB.Label Label46 
                        Caption         =   "student serial"
                        Height          =   255
                        Left            =   240
                        TabIndex        =   151
                        Top             =   120
                        Width           =   975
                     End
                  End
                  Begin VB.Frame Frame7 
                     Caption         =   "ใส่ข้อมูลรายวิชา"
                     Height          =   2295
                     Left            =   120
                     TabIndex        =   80
                     Top             =   2400
                     Width           =   7455
                     Begin VB.ComboBox Combo4 
                        Height          =   315
                        ItemData        =   "input.frx":0185
                        Left            =   1800
                        List            =   "input.frx":0195
                        TabIndex        =   192
                        Text            =   "1"
                        Top             =   240
                        Width           =   735
                     End
                     Begin VB.ComboBox Combo3 
                        Height          =   315
                        ItemData        =   "input.frx":01A5
                        Left            =   720
                        List            =   "input.frx":01AF
                        TabIndex        =   191
                        Text            =   "1"
                        Top             =   240
                        Width           =   615
                     End
                     Begin VB.ComboBox Combo6 
                        Height          =   315
                        ItemData        =   "input.frx":01B9
                        Left            =   1440
                        List            =   "input.frx":01C3
                        TabIndex        =   163
                        Text            =   "2"
                        Top             =   960
                        Width           =   615
                     End
                     Begin MSComctlLib.ListView ListView5 
                        Height          =   2295
                        Left            =   3720
                        TabIndex        =   153
                        Top             =   360
                        Width           =   3735
                        _ExtentX        =   6588
                        _ExtentY        =   4048
                        View            =   3
                        LabelWrap       =   -1  'True
                        HideSelection   =   -1  'True
                        GridLines       =   -1  'True
                        _Version        =   393217
                        ForeColor       =   -2147483640
                        BackColor       =   -2147483643
                        BorderStyle     =   1
                        Appearance      =   1
                        NumItems        =   4
                        BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                           Text            =   "รหัสรายวิชา"
                           Object.Width           =   1764
                        EndProperty
                        BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                           Alignment       =   2
                           SubItemIndex    =   1
                           Text            =   "ชื่อรายวิชา"
                           Object.Width           =   3175
                        EndProperty
                        BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                           Alignment       =   2
                           SubItemIndex    =   2
                           Text            =   "หน่วยกิต"
                           Object.Width           =   1499
                        EndProperty
                        BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                           SubItemIndex    =   3
                           Object.Width           =   2540
                        EndProperty
                     End
                     Begin VB.CommandButton CmdInsert3 
                        Caption         =   "Insert"
                        Height          =   1215
                        Left            =   2760
                        TabIndex        =   84
                        Top             =   240
                        Width           =   855
                     End
                     Begin VB.ComboBox Combo5 
                        Height          =   315
                        ItemData        =   "input.frx":01CD
                        Left            =   600
                        List            =   "input.frx":01EC
                        TabIndex        =   83
                        Text            =   "A"
                        Top             =   960
                        Width           =   615
                     End
                     Begin VB.Frame Frame2 
                        Caption         =   "Valid from -- (Month/Day/Year )"
                        Height          =   735
                        Index           =   3
                        Left            =   120
                        TabIndex        =   81
                        Top             =   1320
                        Width           =   2535
                        Begin MSComCtl2.DTPicker DTPicker3 
                           Height          =   375
                           Left            =   720
                           TabIndex        =   82
                           Top             =   240
                           Width           =   1095
                           _ExtentX        =   1931
                           _ExtentY        =   661
                           _Version        =   393216
                           Format          =   24182785
                           CurrentDate     =   35500
                        End
                     End
                     Begin VB.Label Label50 
                        Caption         =   "รายวิชาที่อยู่ในทะเบืยน"
                        Height          =   255
                        Left            =   4440
                        TabIndex        =   201
                        Top             =   120
                        Width           =   1695
                     End
                     Begin VB.Label Label19 
                        Caption         =   "ปีที่"
                        Height          =   255
                        Left            =   1440
                        TabIndex        =   194
                        Top             =   240
                        Width           =   375
                     End
                     Begin VB.Label Label12 
                        Caption         =   "เทอมที่"
                        Height          =   255
                        Left            =   120
                        TabIndex        =   193
                        Top             =   240
                        Width           =   495
                     End
                     Begin VB.Label Label10 
                        Caption         =   "section"
                        Height          =   255
                        Left            =   1440
                        TabIndex        =   164
                        Top             =   720
                        Width           =   615
                     End
                     Begin VB.Label Label14 
                        Caption         =   "เกรด"
                        Height          =   255
                        Left            =   600
                        TabIndex        =   85
                        Top             =   720
                        Width           =   615
                     End
                  End
               End
               Begin VB.Frame Frame3 
                  Caption         =   "ข้อมูลรายวิชา Subject Table"
                  Height          =   4455
                  Left            =   -74880
                  TabIndex        =   63
                  Top             =   600
                  Width           =   7575
                  Begin VB.CommandButton CmdInsert2 
                     Caption         =   "Insert"
                     Height          =   375
                     Left            =   2280
                     TabIndex        =   72
                     Top             =   3480
                     Width           =   1335
                  End
                  Begin VB.TextBox Text17 
                     Height          =   285
                     Left            =   2160
                     MaxLength       =   50
                     TabIndex        =   71
                     Text            =   "09:30-12:30 (Monday)"
                     Top             =   1800
                     Width           =   2775
                  End
                  Begin VB.TextBox Text16 
                     Height          =   285
                     Left            =   2160
                     MaxLength       =   70
                     TabIndex        =   70
                     Text            =   "Computer Basic"
                     Top             =   2160
                     Width           =   3255
                  End
                  Begin VB.TextBox Text9 
                     Height          =   285
                     Left            =   2160
                     MaxLength       =   70
                     TabIndex        =   69
                     Text            =   "Dr. Tuksin Yamamoto"
                     Top             =   1440
                     Width           =   3255
                  End
                  Begin VB.TextBox Text8 
                     Height          =   285
                     Left            =   2160
                     MaxLength       =   1
                     TabIndex        =   68
                     Text            =   "3"
                     Top             =   1080
                     Width           =   255
                  End
                  Begin VB.TextBox Text7 
                     Height          =   285
                     Left            =   2160
                     MaxLength       =   70
                     TabIndex        =   67
                     Text            =   "Computer Basic"
                     Top             =   720
                     Width           =   3255
                  End
                  Begin VB.TextBox Text6 
                     Height          =   285
                     Left            =   2160
                     MaxLength       =   8
                     TabIndex        =   66
                     Text            =   "01073001"
                     Top             =   360
                     Width           =   855
                  End
                  Begin VB.Frame Frame2 
                     Caption         =   "Valid from  --------------- (Month/Day/Year )"
                     Height          =   735
                     Index           =   2
                     Left            =   2160
                     TabIndex        =   64
                     Top             =   2640
                     Width           =   4695
                     Begin MSComCtl2.DTPicker DTPicker2 
                        Height          =   375
                        Left            =   1920
                        TabIndex        =   65
                        Top             =   240
                        Width           =   1215
                        _ExtentX        =   2143
                        _ExtentY        =   661
                        _Version        =   393216
                        Format          =   24182785
                        CurrentDate     =   35500
                     End
                  End
                  Begin VB.Label Label17 
                     Caption         =   "เวลาที่สอน"
                     Height          =   255
                     Index           =   0
                     Left            =   1200
                     TabIndex        =   78
                     Top             =   1800
                     Width           =   855
                  End
                  Begin VB.Label Label16 
                     Caption         =   "หนังสือที่ใช้"
                     Height          =   375
                     Index           =   0
                     Left            =   1200
                     TabIndex        =   77
                     Top             =   2160
                     Width           =   855
                  End
                  Begin VB.Label Label8 
                     Caption         =   "อาจารย์ผู้สอน"
                     Height          =   255
                     Index           =   0
                     Left            =   1080
                     TabIndex        =   76
                     Top             =   1440
                     Width           =   975
                  End
                  Begin VB.Label Label7 
                     Caption         =   "หน่วยกิต"
                     Height          =   255
                     Index           =   0
                     Left            =   1320
                     TabIndex        =   75
                     Top             =   1080
                     Width           =   615
                  End
                  Begin VB.Label Label6 
                     Caption         =   "ชื่อวิชา"
                     Height          =   255
                     Index           =   1
                     Left            =   1440
                     TabIndex        =   74
                     Top             =   720
                     Width           =   735
                  End
                  Begin VB.Label cmdSubID 
                     Caption         =   "รหัสวิชา"
                     Height          =   255
                     Index           =   0
                     Left            =   1440
                     TabIndex        =   73
                     Top             =   360
                     Width           =   735
                  End
               End
               Begin VB.Frame Frame2 
                  Caption         =   "ข้อมูลนักศึกษา Student Table"
                  Height          =   4575
                  Index           =   1
                  Left            =   -74760
                  TabIndex        =   47
                  Top             =   600
                  Width           =   7575
                  Begin VB.ComboBox ComboPrename 
                     Height          =   315
                     ItemData        =   "input.frx":020E
                     Left            =   2160
                     List            =   "input.frx":0218
                     TabIndex        =   56
                     Text            =   "Mr."
                     Top             =   720
                     Width           =   855
                  End
                  Begin VB.Frame Frame2 
                     Caption         =   "Valid from  --------------- (Month/Day/Year )"
                     Height          =   735
                     Index           =   0
                     Left            =   2160
                     TabIndex        =   54
                     Top             =   2640
                     Width           =   4455
                     Begin MSComCtl2.DTPicker DTPicker1 
                        Height          =   375
                        Left            =   1920
                        TabIndex        =   55
                        Top             =   240
                        Width           =   1095
                        _ExtentX        =   1931
                        _ExtentY        =   661
                        _Version        =   393216
                        Format          =   24182785
                        CurrentDate     =   35500
                     End
                  End
                  Begin VB.CommandButton cmdInsert1 
                     Caption         =   "Insert"
                     Height          =   375
                     Index           =   0
                     Left            =   2160
                     TabIndex        =   53
                     Top             =   3480
                     Width           =   1455
                  End
                  Begin VB.TextBox Text1 
                     Height          =   300
                     Left            =   2160
                     MaxLength       =   8
                     TabIndex        =   52
                     Text            =   "41013539"
                     Top             =   360
                     Width           =   840
                  End
                  Begin VB.TextBox Text2 
                     Height          =   315
                     Left            =   2160
                     MaxLength       =   30
                     TabIndex        =   51
                     Text            =   "Prayong"
                     Top             =   1080
                     Width           =   2160
                  End
                  Begin VB.TextBox Text3 
                     Height          =   300
                     Left            =   2160
                     MaxLength       =   30
                     TabIndex        =   50
                     Text            =   "Tanon"
                     Top             =   1440
                     Width           =   2160
                  End
                  Begin VB.TextBox Text4 
                     Height          =   300
                     Left            =   2160
                     MaxLength       =   50
                     TabIndex        =   49
                     Text            =   "computer"
                     Top             =   1800
                     Width           =   3720
                  End
                  Begin VB.TextBox Text5 
                     Height          =   300
                     Left            =   2160
                     MaxLength       =   70
                     TabIndex        =   48
                     Text            =   "Bangkok"
                     Top             =   2160
                     Width           =   4440
                  End
                  Begin VB.Label Label18 
                     Caption         =   "คำนำหน้า"
                     Height          =   375
                     Index           =   0
                     Left            =   1320
                     TabIndex        =   62
                     Top             =   720
                     Width           =   735
                  End
                  Begin VB.Label Label5 
                     Caption         =   "ที่อยู่"
                     Height          =   300
                     Index           =   1
                     Left            =   1320
                     TabIndex        =   61
                     Top             =   2160
                     Width           =   840
                  End
                  Begin VB.Label Label4 
                     Caption         =   "สาขาวิชา"
                     Height          =   300
                     Index           =   1
                     Left            =   1320
                     TabIndex        =   60
                     Top             =   1800
                     Width           =   600
                  End
                  Begin VB.Label Label3 
                     Caption         =   "นามสกุล"
                     Height          =   300
                     Index           =   0
                     Left            =   1320
                     TabIndex        =   59
                     Top             =   1440
                     Width           =   960
                  End
                  Begin VB.Label Label2 
                     Caption         =   "ชื่อนักศึกษา"
                     Height          =   300
                     Index           =   0
                     Left            =   1200
                     TabIndex        =   58
                     Top             =   1080
                     Width           =   1080
                  End
                  Begin VB.Label Label1 
                     Caption         =   "รหัสนักศึกษา"
                     Height          =   300
                     Index           =   0
                     Left            =   1080
                     TabIndex        =   57
                     Top             =   360
                     Width           =   1080
                  End
               End
            End
         End
         Begin VB.Frame Frame5 
            Caption         =   "For Query"
            ForeColor       =   &H00FFFF80&
            Height          =   5655
            Left            =   -74880
            TabIndex        =   4
            Top             =   480
            Width           =   8055
            Begin TabDlg.SSTab SSTab4 
               Height          =   5295
               Left            =   120
               TabIndex        =   5
               Top             =   240
               Width           =   7815
               _ExtentX        =   13785
               _ExtentY        =   9340
               _Version        =   393216
               Tab             =   1
               TabHeight       =   520
               TabCaption(0)   =   "ดูข้อมูลนักศึกษา"
               TabPicture(0)   =   "input.frx":0228
               Tab(0).ControlEnabled=   0   'False
               Tab(0).Control(0)=   "Frame11"
               Tab(0).ControlCount=   1
               TabCaption(1)   =   "ดูข้อมูลรายวิชา"
               TabPicture(1)   =   "input.frx":0244
               Tab(1).ControlEnabled=   -1  'True
               Tab(1).Control(0)=   "Frame12"
               Tab(1).Control(0).Enabled=   0   'False
               Tab(1).ControlCount=   1
               TabCaption(2)   =   "ดูข้อมูลลงทะเบียน"
               TabPicture(2)   =   "input.frx":0260
               Tab(2).ControlEnabled=   0   'False
               Tab(2).Control(0)=   "Frame13"
               Tab(2).ControlCount=   1
               Begin VB.Frame Frame11 
                  Caption         =   "Frame11"
                  Height          =   4815
                  Left            =   -74880
                  TabIndex        =   27
                  Top             =   360
                  Width           =   7575
                  Begin VB.TextBox Text34 
                     Height          =   285
                     Left            =   2040
                     MaxLength       =   40
                     TabIndex        =   146
                     Top             =   2400
                     Width           =   2655
                  End
                  Begin VB.TextBox Text35 
                     Height          =   285
                     Left            =   2040
                     MaxLength       =   70
                     TabIndex        =   140
                     Top             =   2760
                     Width           =   2655
                  End
                  Begin VB.Frame Frame15 
                     Caption         =   "เลือก"
                     Height          =   735
                     Left            =   1320
                     TabIndex        =   138
                     Top             =   120
                     Width           =   4095
                     Begin VB.ComboBox Combo23 
                        Height          =   315
                        Left            =   1680
                        TabIndex        =   145
                        Top             =   240
                        Width           =   1095
                     End
                     Begin VB.Label Label26 
                        Caption         =   "Student serial"
                        Height          =   255
                        Left            =   480
                        TabIndex        =   139
                        Top             =   240
                        Width           =   975
                     End
                  End
                  Begin VB.CommandButton cmdSearch 
                     Caption         =   "ดูประวัติ"
                     Height          =   255
                     Left            =   3000
                     TabIndex        =   36
                     Top             =   960
                     Width           =   735
                  End
                  Begin VB.CommandButton Command3 
                     Caption         =   "ดูประวัติ"
                     Height          =   255
                     Left            =   4680
                     TabIndex        =   35
                     Top             =   1680
                     Width           =   735
                  End
                  Begin VB.CommandButton Command4 
                     Caption         =   "ดูประวัติ"
                     Height          =   255
                     Left            =   4680
                     TabIndex        =   34
                     Top             =   2040
                     Width           =   735
                  End
                  Begin VB.CommandButton Command5 
                     Caption         =   "ดูประวัติ"
                     Height          =   255
                     Left            =   4680
                     TabIndex        =   33
                     Top             =   2400
                     Width           =   735
                  End
                  Begin VB.CommandButton Command6 
                     Caption         =   "ดูประวัติ"
                     Height          =   255
                     Left            =   4680
                     TabIndex        =   32
                     Top             =   2760
                     Width           =   735
                  End
                  Begin VB.TextBox Text30 
                     Height          =   285
                     Left            =   2040
                     MaxLength       =   8
                     TabIndex        =   31
                     Top             =   960
                     Width           =   975
                  End
                  Begin VB.TextBox Text31 
                     Height          =   285
                     Left            =   2040
                     MaxLength       =   5
                     TabIndex        =   30
                     Top             =   1320
                     Width           =   615
                  End
                  Begin VB.TextBox Text32 
                     Height          =   285
                     Left            =   2040
                     MaxLength       =   40
                     TabIndex        =   29
                     Top             =   1680
                     Width           =   2655
                  End
                  Begin VB.TextBox Text33 
                     Height          =   285
                     Left            =   2040
                     MaxLength       =   40
                     TabIndex        =   28
                     Top             =   2040
                     Width           =   2655
                  End
                  Begin MSComctlLib.ListView ListView1 
                     Height          =   1335
                     Left            =   1080
                     TabIndex        =   37
                     Top             =   3480
                     Width           =   5295
                     _ExtentX        =   9340
                     _ExtentY        =   2355
                     View            =   3
                     Arrange         =   2
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
                        Text            =   "ข้อมูล"
                        Object.Width           =   3881
                     EndProperty
                     BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                        Alignment       =   2
                        SubItemIndex    =   1
                        Text            =   "เวลาเริ่มเป็นจริง"
                        Object.Width           =   2646
                     EndProperty
                     BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                        Alignment       =   2
                        SubItemIndex    =   2
                        Text            =   "เวลาสิ้นสุดเป็นจริง"
                        Object.Width           =   2646
                     EndProperty
                  End
                  Begin VB.Label Label1 
                     Caption         =   "รหัสนักศึกษา"
                     Height          =   300
                     Index           =   1
                     Left            =   1080
                     TabIndex        =   44
                     Top             =   960
                     Width           =   960
                  End
                  Begin VB.Label Label2 
                     Caption         =   "ชื่อนักศึกษา"
                     Height          =   225
                     Index           =   1
                     Left            =   1200
                     TabIndex        =   43
                     Top             =   1680
                     Width           =   840
                  End
                  Begin VB.Label Label3 
                     Caption         =   "นามสกุล"
                     Height          =   180
                     Index           =   1
                     Left            =   1320
                     TabIndex        =   42
                     Top             =   2040
                     Width           =   675
                  End
                  Begin VB.Label Label4 
                     Caption         =   "สาขาวิชา"
                     Height          =   180
                     Index           =   0
                     Left            =   1320
                     TabIndex        =   41
                     Top             =   2400
                     Width           =   600
                  End
                  Begin VB.Label Label5 
                     Caption         =   "ที่อยู่"
                     Height          =   300
                     Index           =   0
                     Left            =   1440
                     TabIndex        =   40
                     Top             =   2760
                     Width           =   600
                  End
                  Begin VB.Label Label18 
                     Caption         =   "คำนำหน้า"
                     Height          =   255
                     Index           =   1
                     Left            =   1320
                     TabIndex        =   39
                     Top             =   1320
                     Width           =   735
                  End
                  Begin VB.Label Label15 
                     Caption         =   "แสดงประวัติ"
                     Height          =   255
                     Left            =   3000
                     TabIndex        =   38
                     Top             =   3240
                     Width           =   975
                  End
               End
               Begin VB.Frame Frame12 
                  Caption         =   "Frame12"
                  Height          =   4815
                  Left            =   120
                  TabIndex        =   7
                  Top             =   360
                  Width           =   7575
                  Begin VB.Frame Frame16 
                     Caption         =   "เลือก"
                     Height          =   735
                     Left            =   1200
                     TabIndex        =   142
                     Top             =   120
                     Width           =   4335
                     Begin VB.ComboBox Combo22 
                        Height          =   315
                        Left            =   1320
                        TabIndex        =   143
                        Top             =   240
                        Width           =   1335
                     End
                     Begin VB.Label Label43 
                        Caption         =   "subject serial"
                        Height          =   255
                        Left            =   240
                        TabIndex        =   144
                        Top             =   240
                        Width           =   975
                     End
                  End
                  Begin VB.TextBox Text41 
                     Height          =   285
                     Left            =   1440
                     Locked          =   -1  'True
                     MaxLength       =   70
                     TabIndex        =   141
                     Top             =   2760
                     Width           =   3135
                  End
                  Begin VB.TextBox Text36 
                     Height          =   285
                     Left            =   1440
                     Locked          =   -1  'True
                     MaxLength       =   8
                     TabIndex        =   19
                     Top             =   960
                     Width           =   1215
                  End
                  Begin VB.TextBox Text37 
                     Height          =   285
                     Left            =   1440
                     Locked          =   -1  'True
                     MaxLength       =   50
                     TabIndex        =   18
                     Top             =   1320
                     Width           =   3015
                  End
                  Begin VB.TextBox Text38 
                     Height          =   285
                     Left            =   1440
                     Locked          =   -1  'True
                     MaxLength       =   5
                     TabIndex        =   17
                     Top             =   1680
                     Width           =   735
                  End
                  Begin VB.TextBox Text39 
                     Height          =   285
                     Left            =   1440
                     Locked          =   -1  'True
                     MaxLength       =   40
                     TabIndex        =   16
                     Top             =   2040
                     Width           =   3135
                  End
                  Begin VB.CommandButton Command7 
                     Caption         =   "ดูประวัติ"
                     Height          =   255
                     Left            =   2640
                     TabIndex        =   15
                     Top             =   960
                     Width           =   855
                  End
                  Begin VB.CommandButton Command8 
                     Caption         =   "ดูประวัติ"
                     Height          =   255
                     Left            =   2160
                     TabIndex        =   14
                     Top             =   1680
                     Width           =   735
                  End
                  Begin VB.CommandButton Command9 
                     Caption         =   "ดูประวัติ"
                     Height          =   255
                     Left            =   4560
                     TabIndex        =   13
                     Top             =   2040
                     Width           =   735
                  End
                  Begin VB.CommandButton Command10 
                     Caption         =   "ดูประวัติ"
                     Height          =   255
                     Left            =   4560
                     TabIndex        =   12
                     Top             =   2400
                     Width           =   735
                  End
                  Begin VB.CommandButton Command11 
                     Caption         =   "ดูประวัติ"
                     Height          =   255
                     Left            =   4560
                     TabIndex        =   11
                     Top             =   2760
                     Width           =   735
                  End
                  Begin VB.TextBox Text40 
                     Height          =   285
                     Left            =   1440
                     MaxLength       =   40
                     TabIndex        =   9
                     Top             =   2400
                     Width           =   3135
                  End
                  Begin VB.CommandButton Command16 
                     Caption         =   "ดูประวัติ"
                     Height          =   255
                     Left            =   4440
                     TabIndex        =   8
                     Top             =   1320
                     Width           =   735
                  End
                  Begin MSComctlLib.ListView ListView3 
                     Height          =   1335
                     Left            =   840
                     TabIndex        =   10
                     Top             =   3480
                     Width           =   5295
                     _ExtentX        =   9340
                     _ExtentY        =   2355
                     View            =   3
                     Arrange         =   2
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
                        Text            =   "ข้อมูล"
                        Object.Width           =   3881
                     EndProperty
                     BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                        SubItemIndex    =   1
                        Text            =   "เวลาเริ่มเป็นจริง"
                        Object.Width           =   2646
                     EndProperty
                     BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                        SubItemIndex    =   2
                        Text            =   "เวลาสิ้นสุดเป็นจริง"
                        Object.Width           =   2646
                     EndProperty
                  End
                  Begin VB.Label LabelSubID 
                     Caption         =   "รหัสวิชา"
                     Height          =   255
                     Index           =   1
                     Left            =   840
                     TabIndex        =   26
                     Top             =   960
                     Width           =   615
                  End
                  Begin VB.Label Label6 
                     Caption         =   "ชื่อวิชา"
                     Height          =   255
                     Index           =   0
                     Left            =   840
                     TabIndex        =   25
                     Top             =   1320
                     Width           =   495
                  End
                  Begin VB.Label Label7 
                     Caption         =   "หน่วยกิต"
                     Height          =   255
                     Index           =   1
                     Left            =   720
                     TabIndex        =   24
                     Top             =   1680
                     Width           =   615
                  End
                  Begin VB.Label Label8 
                     Caption         =   "อาจารย์ผู้สอน"
                     Height          =   255
                     Index           =   1
                     Left            =   480
                     TabIndex        =   23
                     Top             =   2040
                     Width           =   975
                  End
                  Begin VB.Label Label16 
                     Caption         =   "หนังสือที่ใช้"
                     Height          =   255
                     Index           =   1
                     Left            =   600
                     TabIndex        =   22
                     Top             =   2760
                     Width           =   855
                  End
                  Begin VB.Label Label17 
                     Caption         =   "เวลาที่สอน"
                     Height          =   255
                     Index           =   1
                     Left            =   600
                     TabIndex        =   21
                     Top             =   2400
                     Width           =   855
                  End
                  Begin VB.Label Label25 
                     Caption         =   "แสดงประวัติ"
                     Height          =   255
                     Left            =   2880
                     TabIndex        =   20
                     Top             =   3240
                     Width           =   975
                  End
               End
               Begin VB.Frame Frame13 
                  Caption         =   "Frame13"
                  Height          =   4695
                  Left            =   -74760
                  TabIndex        =   6
                  Top             =   480
                  Width           =   7335
                  Begin VB.Frame Frame23 
                     Caption         =   "มีใครลงทะเบียนวิชานี้บ้าง ?"
                     Height          =   1215
                     Left            =   240
                     TabIndex        =   202
                     Top             =   360
                     Width           =   6975
                     Begin VB.ComboBox Combo8 
                        Height          =   315
                        Left            =   240
                        TabIndex        =   206
                        Top             =   600
                        Width           =   1335
                     End
                     Begin VB.TextBox Text49 
                        Height          =   285
                        Left            =   1680
                        Locked          =   -1  'True
                        MaxLength       =   8
                        TabIndex        =   205
                        Top             =   600
                        Width           =   855
                     End
                     Begin VB.TextBox Text50 
                        Height          =   285
                        Left            =   2760
                        Locked          =   -1  'True
                        MaxLength       =   50
                        TabIndex        =   204
                        Top             =   600
                        Width           =   3135
                     End
                     Begin VB.TextBox Text51 
                        Height          =   285
                        Left            =   6120
                        Locked          =   -1  'True
                        MaxLength       =   8
                        TabIndex        =   203
                        Top             =   600
                        Width           =   495
                     End
                     Begin VB.Label Label29 
                        Caption         =   "หน่วยกิจ"
                        Height          =   255
                        Left            =   6000
                        TabIndex        =   210
                        Top             =   240
                        Width           =   735
                     End
                     Begin VB.Label Label28 
                        Caption         =   "Subject serial"
                        Height          =   255
                        Left            =   240
                        TabIndex        =   209
                        Top             =   360
                        Width           =   975
                     End
                     Begin VB.Label Label33 
                        Caption         =   "รหัสรายวิชา"
                        Height          =   255
                        Left            =   1800
                        TabIndex        =   208
                        Top             =   360
                        Width           =   855
                     End
                     Begin VB.Label Label34 
                        Caption         =   "ชื่อวิชา"
                        Height          =   255
                        Left            =   3120
                        TabIndex        =   207
                        Top             =   360
                        Width           =   495
                     End
                  End
                  Begin VB.ComboBox Combo12 
                     Height          =   315
                     ItemData        =   "input.frx":027C
                     Left            =   3120
                     List            =   "input.frx":028C
                     TabIndex        =   126
                     Text            =   "1"
                     Top             =   1920
                     Width           =   735
                  End
                  Begin VB.CommandButton Command18 
                     Caption         =   "ค้นหา"
                     Height          =   375
                     Left            =   1680
                     TabIndex        =   125
                     Top             =   2520
                     Width           =   1815
                  End
                  Begin VB.ComboBox Combo11 
                     Height          =   315
                     ItemData        =   "input.frx":029C
                     Left            =   1800
                     List            =   "input.frx":02A6
                     TabIndex        =   124
                     Text            =   "1"
                     Top             =   1920
                     Width           =   975
                  End
                  Begin MSComctlLib.ListView ListView4 
                     Height          =   1575
                     Left            =   0
                     TabIndex        =   123
                     Top             =   3000
                     Width           =   7335
                     _ExtentX        =   12938
                     _ExtentY        =   2778
                     View            =   3
                     MultiSelect     =   -1  'True
                     LabelWrap       =   -1  'True
                     HideSelection   =   -1  'True
                     GridLines       =   -1  'True
                     _Version        =   393217
                     ForeColor       =   -2147483640
                     BackColor       =   -2147483643
                     BorderStyle     =   1
                     Appearance      =   1
                     NumItems        =   4
                     BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                        Text            =   "รหัสนักศึกษา"
                        Object.Width           =   2117
                     EndProperty
                     BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                        SubItemIndex    =   1
                        Text            =   "คำนำหน้า"
                        Object.Width           =   1764
                     EndProperty
                     BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                        SubItemIndex    =   2
                        Text            =   "ชื่อ"
                        Object.Width           =   3351
                     EndProperty
                     BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                        SubItemIndex    =   3
                        Text            =   "นามสกุล"
                        Object.Width           =   3175
                     EndProperty
                  End
                  Begin VB.Label Label32 
                     Caption         =   "ปี"
                     Height          =   255
                     Left            =   3240
                     TabIndex        =   122
                     Top             =   1680
                     Width           =   135
                  End
                  Begin VB.Label Label31 
                     Caption         =   "เทอมที่"
                     Height          =   255
                     Left            =   1920
                     TabIndex        =   121
                     Top             =   1680
                     Width           =   495
                  End
               End
            End
         End
      End
   End
   Begin Navctl32Lib.NavControl register_student1 
      Height          =   480
      Left            =   -10005
      TabIndex        =   0
      Top             =   0
      Width           =   1500
      _Version        =   65536
      _ExtentX        =   2646
      _ExtentY        =   847
      _StockProps     =   4
      DOF             =   -1  'True
      NavigationButtonsVisible=   -1  'True
      BookmarkButtonsVisible=   -1  'True
      StatusVisible   =   -1  'True
      ModelFile       =   "C:\Program Files\informix\Data Director\yong model\student.MLT"
      DataPath        =   "register.std_serial.student.std_serial"
      Table           =   "student"
      DataGroup       =   "register"
      DefaultButtonSize=   1
      SaveButtonVisible=   -1  'True
      QueryButtonVisible=   -1  'True
      QBEButtonVisible=   -1  'True
      InsertButtonVisible=   -1  'True
      DeleteButtonVisible=   -1  'True
      LayoutMode      =   1
      ControlCount    =   14
      NewStyle        =   -1  'True
      TableDataSource =   -1  'True
      Ctrl0Visible    =   -1  'True
      Ctrl0Style      =   1
      Ctrl0Caption    =   ""
      Ctrl0Width      =   30
      Ctrl0Height     =   20
      Ctrl1ID         =   1
      Ctrl1Visible    =   -1  'True
      Ctrl1Style      =   1
      Ctrl1Caption    =   ""
      Ctrl1Width      =   30
      Ctrl1Height     =   20
      Ctrl2ID         =   2
      Ctrl2Visible    =   -1  'True
      Ctrl2Style      =   1
      Ctrl2Caption    =   ""
      Ctrl2Width      =   30
      Ctrl2Height     =   20
      Ctrl3ID         =   3
      Ctrl3Visible    =   -1  'True
      Ctrl3Style      =   1
      Ctrl3Caption    =   ""
      Ctrl3Width      =   30
      Ctrl3Height     =   20
      Ctrl4ID         =   4
      Ctrl4Visible    =   -1  'True
      Ctrl4Style      =   1
      Ctrl4Caption    =   "New"
      Ctrl4Width      =   30
      Ctrl4Height     =   20
      Ctrl5ID         =   5
      Ctrl5Visible    =   -1  'True
      Ctrl5Style      =   2
      Ctrl5Caption    =   "student - #"
      Ctrl5Width      =   117
      Ctrl5Height     =   20
      Ctrl6ID         =   9
      Ctrl6Visible    =   -1  'True
      Ctrl6Style      =   2
      Ctrl6Caption    =   "Query"
      Ctrl6Width      =   45
      Ctrl6Height     =   20
      Ctrl7ID         =   10
      Ctrl7Visible    =   -1  'True
      Ctrl7Style      =   2
      Ctrl7Caption    =   "Save"
      Ctrl7Width      =   39
      Ctrl7Height     =   20
      Ctrl8ID         =   11
      Ctrl8Visible    =   -1  'True
      Ctrl8Style      =   1
      Ctrl8Caption    =   "Delete"
      Ctrl8Width      =   30
      Ctrl8Height     =   20
      Ctrl9ID         =   12
      Ctrl9Visible    =   -1  'True
      Ctrl9Style      =   1
      Ctrl9Caption    =   "QBE"
      Ctrl9Width      =   30
      Ctrl9Height     =   20
      Ctrl10ID        =   100
      Ctrl10Style     =   2
      Ctrl10Caption   =   "Caption!"
      Ctrl10Width     =   22
      Ctrl10Height    =   18
      Ctrl11ID        =   6
      Ctrl11Visible   =   -1  'True
      Ctrl11Style     =   1
      Ctrl11Caption   =   ""
      Ctrl11Width     =   30
      Ctrl11Height    =   20
      Ctrl12ID        =   7
      Ctrl12Visible   =   -1  'True
      Ctrl12Style     =   1
      Ctrl12Caption   =   ""
      Ctrl12Width     =   30
      Ctrl12Height    =   20
      Ctrl13ID        =   8
      Ctrl13Visible   =   -1  'True
      Ctrl13Style     =   1
      Ctrl13Caption   =   ""
      Ctrl13Width     =   30
      Ctrl13Height    =   20
   End
   Begin VB.Menu mlogin 
      Caption         =   "&เมนู"
      Begin VB.Menu minput 
         Caption         =   "เพิ่มข้อมูล"
      End
      Begin VB.Menu mUpdate 
         Caption         =   "แก้ไขข้อมูล"
      End
      Begin VB.Menu muser 
         Caption         =   "ค้นหา"
      End
      Begin VB.Menu mexit 
         Caption         =   "ออก"
      End
   End
   Begin VB.Menu mhelp 
      Caption         =   "Help"
      Begin VB.Menu mh1 
         Caption         =   "แนะนำ"
      End
   End
End
Attribute VB_Name = "MainScreen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Public oEngine As ddoEngine         ' The Data Director Engine object
Public oProject As ddoProject       ' The Data Director Project object
Public oDataGroupStudent As ddoDataGroup   ' The Data Director DataGroup object

Const PathModel As String = "student.mlt"
'Const PathModel As String = "\sql\student.mlt"
'search
Public oVTableStudent As ddoTable
Dim SQLString As String
Dim countcheck As Byte

Dim oVTableResult As ddoTable
Dim oResult As ddoTable
Dim checkInsert As Boolean
Dim CountRowFirst As ddoTable



Private Sub Check10_Click()
If Text26.Enabled = False Then
    Text26.Enabled = True
    ElseIf Text26.Enabled = True Then
    Text26.Enabled = False
End If
End Sub

Private Sub Check11_Click()
If Text27.Enabled = False Then
    Text27.Enabled = True
    ElseIf Text27.Enabled = True Then
    Text27.Enabled = False
End If

End Sub

Private Sub Check12_Click()
If Text28.Enabled = False Then
    Text28.Enabled = True
    ElseIf Text28.Enabled = True Then
    Text28.Enabled = False
End If

End Sub

Private Sub Check13_Click()
If Text29.Enabled = False Then
    Text29.Enabled = True
    ElseIf Text29.Enabled = True Then
    Text29.Enabled = False
End If

End Sub

Private Sub Check2_Click()
If Text18.Enabled = False Then
    Text18.Enabled = True
    ElseIf Text18.Enabled = True Then
    Text18.Enabled = False
End If
End Sub

Private Sub Check3_Click()
If Text19.Enabled = False Then
    Text19.Enabled = True
    ElseIf Text19.Enabled = True Then
    Text19.Enabled = False
End If

End Sub

Private Sub Check4_Click()
If Text20.Enabled = False Then
    Text20.Enabled = True
    ElseIf Text20.Enabled = True Then
    Text20.Enabled = False
End If

End Sub

Private Sub Check5_Click()
If Text21.Enabled = False Then
    Text21.Enabled = True
    ElseIf Text21.Enabled = True Then
    Text21.Enabled = False
End If

End Sub

Private Sub Check6_Click()
If Text22.Enabled = False Then
    Text22.Enabled = True
    ElseIf Text22.Enabled = True Then
    Text22.Enabled = False
End If

End Sub

Private Sub Check7_Click()
If Text23.Enabled = False Then
    Text23.Enabled = True
    ElseIf Text23.Enabled = True Then
    Text23.Enabled = False
End If

End Sub

Private Sub Check8_Click()
If Text24.Enabled = False Then
    Text24.Enabled = True
    ElseIf Text24.Enabled = True Then
    Text24.Enabled = False
End If

End Sub

Private Sub Check9_Click()
If Text25.Enabled = False Then
    Text25.Enabled = True
    ElseIf Text25.Enabled = True Then
    Text25.Enabled = False
End If

End Sub

Private Sub cmdExit_Click()
'If MsgBox("ออกจากระบบหรือไม่?", 52, "ยืนยัน") = vbY es Then
 MainScreen.oDataGroupStudent.Logoff
End
'End If
End Sub
Private Function PrepareParameter() As String
Dim P_SQL As String
P_SQL = """" + UCase(Text1.Text) + """,""" + UCase(ComboPrename.Text) + """,""" + UCase(Text2.Text) + """,""" + UCase(Text3.Text) + """,""" + UCase(Text4.Text) + """,""" + UCase(Text5.Text) + """"
'P_SQL = """" + Text1.Text + """,""" + UCase(ComboPrename.Text) + """,""" + Text2.Text + """,""" + Text3.Text + """,""" + Text4.Text + """,""" + Text5.Text + """"
'P_SQL = """" + Text1.Text + """,""" + ComboPrename.Text + """,""" + Text2.Text + """,""" + Text3.Text + """,""" + Text4.Text + """,""" + Text5.Text + """"
PrepareParameter = P_SQL
End Function

Private Sub cmdInsert1_Click(Index As Integer)
Dim Parameter As String
Dim CountRow As ddoTable
Dim UserSelect As Integer
Dim DDay1 As String
Dim MMonth1 As String
Dim YYear1 As String

DDay1 = DTPicker1.Day
MMonth1 = DTPicker1.Month
YYear1 = DTPicker1.Year

UserSelect = MsgBox("Are you sure?", vbYesNo, "Insert")
If UserSelect = vbYes Then

'Parameter = PrepareParameter
'Parameter = "{CALL insertStudent(" + Parameter + ")}"

Parameter = "insert into student  values " & _
 "(0, " & _
 """ list{row('" & UCase(Text1.Text) + "','" & MMonth1 + "/" & DDay1 + "/" & YYear1 + "',Null)}"", " & _
 "'" & UCase(ComboPrename) + "', " & _
 """ list{row('" & UCase(Text2.Text) + "','" & MMonth1 + "/" & DDay1 + "/" & YYear1 + "',Null)}"", " & _
 """ list{row('" & UCase(Text3.Text) + "','" & MMonth1 + "/" & DDay1 + "/" & YYear1 + "',Null)}"", " & _
 """ list{row('" & UCase(Text4.Text) + "','" & MMonth1 + "/" & DDay1 + "/" & YYear1 + "',Null)}"", " & _
 """ list{row('" & UCase(Text5.Text) + "','" & MMonth1 + "/" & DDay1 + "/" & YYear1 + "',Null)}"")"

MainScreen.oDataGroupStudent.BeginTransaction
Set CountRow = MainScreen.oDataGroupStudent.ExecuteSQLCommand(Parameter)
MainScreen.oDataGroupStudent.CommitTransaction

MsgBox "Insert ข้อมูลนักศึกษาเรียบร้อย.", , "Insert"

MainScreen.oDataGroupStudent.DeleteVirtualTable ("CountRow")
Call GetStudentSerial 'get serial
Else
End If
End Sub

Private Sub CmdInsert2_Click()  'insert subject

Dim Parameter As String
Dim CountRow As ddoTable
Dim UserSelect As Integer
Dim DDay2 As String
Dim MMonth2 As String
Dim YYear2 As String

DDay2 = DTPicker2.Day
MMonth2 = DTPicker2.Month
YYear2 = DTPicker2.Year

UserSelect = MsgBox("Are you sure?", vbYesNo, "Insert")
If UserSelect = vbYes Then

Parameter = "insert into Subject values " & _
 "(0, " & _
 """ list{row('" & UCase(Text6.Text) + "','" & MMonth2 + "/" & DDay2 + "/" & YYear2 + "',Null)}"", " & _
 """ list{row('" & UCase(Text7.Text) + "','" & MMonth2 + "/" & DDay2 + "/" & YYear2 + "',Null)}"", " & _
 """ list{row('" & UCase(Text8.Text) + "','" & MMonth2 + "/" & DDay2 + "/" & YYear2 + "',Null)}"", " & _
 """ list{row('" & UCase(Text9.Text) + "','" & MMonth2 + "/" & DDay2 + "/" & YYear2 + "',Null)}"", " & _
 """ list{row('" & UCase(Text17.Text) + "','" & MMonth2 + "/" & DDay2 + "/" & YYear2 + "',Null)}"", " & _
 """ list{row('" & UCase(Text16.Text) + "','" & MMonth2 + "/" & DDay2 + "/" & YYear2 + "',Null)}"")"

MainScreen.oDataGroupStudent.BeginTransaction
Set CountRow = MainScreen.oDataGroupStudent.ExecuteSQLCommand(Parameter)
MainScreen.oDataGroupStudent.CommitTransaction

MsgBox "Insert ข้อมูลวิชาเรียบร้อย.", , "Insert"

MainScreen.oDataGroupStudent.DeleteVirtualTable ("CountRow")
Call GetSubSerial 'get sub serial
Else
End If
End Sub

Private Sub CmdInsert3_Click()  'Insert Register
Dim listinfo As ListItem
Dim Parameter As String
Dim CountRow As ddoTable
Dim UserSelect As Integer
Dim DDay3 As String
Dim MMonth3 As String
Dim YYear3 As String
Dim keep As String
DDay3 = DTPicker3.Day
MMonth3 = DTPicker3.Month
YYear3 = DTPicker3.Year

UserSelect = MsgBox("Are you sure?", vbYesNo, "Insert")
If UserSelect = vbYes Then
Parameter = "insert into REGISTER values " & _
 "(0, " & _
  "'" & Combo24.Text + "'," & _
  "'" & Combo26.Text + "'," & _
  "'" & Combo3.Text + "'," & _
  "'" & Combo4.Text + "'," & _
 """ list{row('" & Combo5.Text + "','" & MMonth3 + "/" & DDay3 + "/" & YYear3 + "',Null)}""," & _
 """ list{row('" & Combo6.Text + "','" & MMonth3 + "/" & DDay3 + "/" & YYear3 + "',Null)}"")"
MainScreen.oDataGroupStudent.BeginTransaction
Set CountRow = MainScreen.oDataGroupStudent.ExecuteSQLCommand(Parameter)
MainScreen.oDataGroupStudent.CommitTransaction

MsgBox "Insert ข้อมูลเรียบร้อย", , "Insert"

MainScreen.oDataGroupStudent.DeleteVirtualTable ("CountRow")
keep = Combo26.Text
Call GetSubSerial 'get sub serial
Combo26.Text = keep

Set listinfo = ListView5.ListItems.Add(, , Text46.Text)
With listinfo
    .SubItems(1) = Text47.Text
    .SubItems(2) = Text48.Text
End With

ListView5.Refresh

CmdInsert3.Enabled = False

Else
End If
End Sub

'======================start SEARCH ====================================
Private Sub cmdSearch_Click()   'stdID
'Dim Count, i As Integer
Dim SQL As String
Dim SQLString As String
Dim check As Boolean
check = True
If (Combo23.Text = "") Then
check = False
End If
If (Text30.Text = "") Then
check = False
End If

If check = True Then
ListView1.ListItems.Clear
'EXECUTE FUNCTION GetStdID('100');
SQLString = "EXECUTE  FUNCTION GetStdID(" & Combo23.Text + ")"
'MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
Set oResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand("select * from listResult")
'"Create table ListResult(data varchar(70),Vtime_Start date,Vtime_End date);")
'MainScreen.oDataGroupStudent.CommitTransaction
'Count = oVTableResult.Columns(1).Value
Dim listinfo As ListItem

If Not (oResult Is Nothing) Then
Do While oResult.EOT = False
Set listinfo = ListView1.ListItems.Add(, , oResult.Columns(1).Value)
With listinfo
    .SubItems(1) = oResult.Columns(2).Value
    .SubItems(2) = oResult.Columns(3).Value
End With
oResult.NextRecord
ListView1.Refresh
Loop
End If
MainScreen.oDataGroupStudent.DeleteVirtualTable (oResult.Name)
MainScreen.oDataGroupStudent.DeleteVirtualTable (oVTableResult.Name)
End If
End Sub
'======================end SEARCH ====================================

Private Sub Combo16_Click()  ' Update
Call GetcurrentStudentUpdate
End Sub
Private Sub GetcurrentStudentUpdate()
Dim i, j As Integer
Dim SQL As String
Dim SQLString As String
Dim check As Boolean
check = True
If (Combo16.Text = "") Then
check = False
End If

If check = True Then
SQLString = "EXECUTE  FUNCTION CurrentStudent(" & Combo16.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
If Not (oVTableResult Is Nothing) Then

Text42.Text = oVTableResult.Columns(1).Value
Text43.Text = oVTableResult.Columns(2).Value + oVTableResult.Columns(3).Value
Text44.Text = oVTableResult.Columns(4).Value

End If

MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
End If
End Sub

Private Sub Combo17_Click()
Call GetcurrentSubjectUpdate
End Sub
Private Sub GetcurrentSubjectUpdate()
Dim i, j As Integer
Dim check As Boolean
check = True
If (Combo17.Text = "") Then
check = False
End If

If check = True Then
SQLString = "EXECUTE  FUNCTION CurrentSubject(" & Combo17.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
If Not (oVTableResult Is Nothing) Then

Text11.Text = oVTableResult.Columns(1).Value
Text12.Text = oVTableResult.Columns(2).Value
Text13.Text = oVTableResult.Columns(3).Value

End If

MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
End If

End Sub
Private Sub Combo19_Click()
Call ClearStudent
Call GetcurrentStudent
End Sub
Private Sub GetcurrentStudent()
Dim i, j As Integer
Dim SQL As String
Dim SQLString As String
Dim check As Boolean
check = True
If (Combo19.Text = "") Then
check = False
End If

If check = True Then
SQLString = "EXECUTE  FUNCTION CurrentStudent(" & Combo19.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
If Not (oVTableResult Is Nothing) Then

Text18.Text = oVTableResult.Columns(1).Value
Text19.Text = oVTableResult.Columns(2).Value
Text20.Text = oVTableResult.Columns(3).Value
Text21.Text = oVTableResult.Columns(4).Value
Text22.Text = oVTableResult.Columns(5).Value
Text23.Text = oVTableResult.Columns(6).Value

End If

MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
End If
End Sub
Private Sub GetcurrentStudentQuery()
Dim i, j As Integer
Dim SQLString As String
Dim check As Boolean
check = True
If (Combo23.Text = "") Then
check = False
End If

If check = True Then
SQLString = "EXECUTE  FUNCTION CurrentStudent(" & Combo23.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
If Not (oVTableResult Is Nothing) Then

Text30.Text = oVTableResult.Columns(1).Value
Text31.Text = oVTableResult.Columns(2).Value
Text32.Text = oVTableResult.Columns(3).Value
Text33.Text = oVTableResult.Columns(4).Value
Text34.Text = oVTableResult.Columns(5).Value
Text35.Text = oVTableResult.Columns(6).Value

End If

MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
End If
End Sub
Private Sub GetcurrentSubjectQuery()
Dim i, j As Integer
Dim SQLString As String
Dim check As Boolean
check = True
If (Combo22.Text = "") Then
check = False
End If

If check = True Then
SQLString = "EXECUTE  FUNCTION CurrentSubject(" & Combo22.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
If Not (oVTableResult Is Nothing) Then

Text36.Text = oVTableResult.Columns(1).Value
Text37.Text = oVTableResult.Columns(2).Value
Text38.Text = oVTableResult.Columns(3).Value
Text39.Text = oVTableResult.Columns(4).Value
Text40.Text = oVTableResult.Columns(5).Value
Text41.Text = oVTableResult.Columns(6).Value

End If

MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
End If
End Sub
Private Sub Combo20_Click()
Call ClearSubject
Call GetcurrentSubject
End Sub
Private Sub GetcurrentSubject()
Dim i, j As Integer
Dim check As Boolean
check = True
If (Combo20.Text = "") Then
check = False
End If

If check = True Then
SQLString = "EXECUTE  FUNCTION CurrentSubject(" & Combo20.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
If Not (oVTableResult Is Nothing) Then

Text24.Text = oVTableResult.Columns(1).Value
Text25.Text = oVTableResult.Columns(2).Value
Text26.Text = oVTableResult.Columns(3).Value
Text27.Text = oVTableResult.Columns(4).Value
Text28.Text = oVTableResult.Columns(5).Value
Text29.Text = oVTableResult.Columns(6).Value

End If

MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
End If
End Sub

Private Sub Combo23_Click()
ListView1.ListItems.Clear
Call ClearStudentQuery
Call GetcurrentStudentQuery
End Sub

Private Sub Combo22_Click()
ListView3.ListItems.Clear
Call ClearSubjectQuery
Call GetcurrentSubjectQuery
End Sub
Private Sub combo24_change()
CmdInsert3.Enabled = True
End Sub

Private Sub Combo24_Click()
ListView5.ListItems.Clear
CmdInsert3.Enabled = True
Call GetcurrentStudentInsert

End Sub
Private Sub GetcurrentStudentInsert()
Dim i, j As Integer
Dim SQL As String
Dim SQLString As String
Dim check As Boolean

check = True
If (Combo24.Text = "") Then
check = False
End If

If check = True Then
SQLString = "EXECUTE  FUNCTION CurrentStudent(" & Combo24.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
If Not (oVTableResult Is Nothing) Then

Text10.Text = oVTableResult.Columns(1).Value
Text45.Text = oVTableResult.Columns(2).Value
Text14.Text = oVTableResult.Columns(3).Value
Text15.Text = oVTableResult.Columns(4).Value

End If

MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
End If
End Sub

Private Sub combo26_change()
CmdInsert3.Enabled = True
End Sub
Private Sub Combo26_Click()
CmdInsert3.Enabled = True
Call GetcurrentSubjectInsert
End Sub
Private Sub GetcurrentSubjectInsert()
Dim i, j As Integer
Dim SQL As String
Dim SQLString As String
Dim check As Boolean
check = True
If (Combo26.Text = "") Then
check = False
End If

If check = True Then
SQLString = "EXECUTE  FUNCTION CurrentSubject(" & Combo26.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
If Not (oVTableResult Is Nothing) Then
Text46.Text = oVTableResult.Columns(1).Value
Text47.Text = oVTableResult.Columns(2).Value
Text48.Text = oVTableResult.Columns(3).Value
End If
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
End If
End Sub

Private Sub Combo8_Click()
Call GetcurrentRegisterSubjectQuery
End Sub
Private Sub GetcurrentRegisterSubjectQuery()
Dim i, j As Integer
Dim check As Boolean
check = True
If (Combo8.Text = "") Then
check = False
End If

If check = True Then
SQLString = "EXECUTE  FUNCTION CurrentSubject(" & Combo8.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
If Not (oVTableResult Is Nothing) Then

Text49.Text = oVTableResult.Columns(1).Value
Text50.Text = oVTableResult.Columns(2).Value
Text51.Text = oVTableResult.Columns(3).Value

End If
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
End If
End Sub
Private Sub Command10_Click() 'Query subject Times
Dim SQL As String
Dim SQLString As String
Dim check As Boolean
check = True
If (Combo22.Text = "") Then
check = False
End If
If (Text40.Text = "") Then
check = False
End If

If check = True Then
ListView3.ListItems.Clear
'EXECUTE FUNCTION GetStdID('100');
SQLString = "EXECUTE  FUNCTION GetTimes(" & Combo22.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
Set oResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand("select * from listResult")
MainScreen.oDataGroupStudent.CommitTransaction
Dim listinfo As ListItem

If Not (oResult Is Nothing) Then
Do While oResult.EOT = False
Set listinfo = ListView3.ListItems.Add(, , oResult.Columns(1).Value)
With listinfo
    .SubItems(1) = oResult.Columns(2).Value
    .SubItems(2) = oResult.Columns(3).Value
End With
oResult.NextRecord
ListView1.Refresh
Loop
End If
MainScreen.oDataGroupStudent.DeleteVirtualTable (oResult.Name)
MainScreen.oDataGroupStudent.DeleteVirtualTable (oVTableResult.Name)
End If
End Sub

Private Sub Command11_Click() ' Query subject Books
Dim SQL As String
Dim SQLString As String
Dim check As Boolean
check = True
If (Combo22.Text = "") Then
check = False
End If
If (Text41.Text = "") Then
check = False
End If

If check = True Then
ListView3.ListItems.Clear
'EXECUTE FUNCTION GetStdID('100');
SQLString = "EXECUTE  FUNCTION GetBooks(" & Combo22.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
Set oResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand("select * from listResult")
MainScreen.oDataGroupStudent.CommitTransaction
Dim listinfo As ListItem

If Not (oResult Is Nothing) Then
Do While oResult.EOT = False
Set listinfo = ListView3.ListItems.Add(, , oResult.Columns(1).Value)
With listinfo
    .SubItems(1) = oResult.Columns(2).Value
    .SubItems(2) = oResult.Columns(3).Value
End With
oResult.NextRecord
ListView1.Refresh
Loop
End If
MainScreen.oDataGroupStudent.DeleteVirtualTable (oResult.Name)
MainScreen.oDataGroupStudent.DeleteVirtualTable (oVTableResult.Name)
End If
End Sub

Private Sub Command12_Click()
Check8.Value = 1
Check9.Value = 1
Check10.Value = 1
Check11.Value = 1
Check12.Value = 1
Check13.Value = 1

Text24.Enabled = True
Text25.Enabled = True
Text26.Enabled = True
Text27.Enabled = True
Text28.Enabled = True
Text29.Enabled = True
End Sub

Private Sub Command13_Click()
Check2.Value = 1
'Check3.Value = 1
Check4.Value = 1
Check5.Value = 1
Check6.Value = 1
Check6.Value = 1
Check7.Value = 1
Text18.Enabled = True
'Text19.Enabled = True
Text20.Enabled = True
Text21.Enabled = True
Text22.Enabled = True
Text23.Enabled = True

End Sub

Private Sub Command14_Click() ' Update subject
Dim UserSelect As Integer
Dim checktext As Boolean

If ((Check8.Value = 1 And Text24.Text <> "") Or (Check9.Value = 1 And Text25.Text <> "") Or (Check10.Value = 1 And Text26.Text <> "") Or (Check11.Value = 1 And Text27.Text <> "") Or (Check12.Value = 1 And Text28.Text <> "") Or (Check13.Value = 1 And Text29.Text <> "")) Then
    UserSelect = MsgBox("Are you sure?", vbYesNo, "Change")
If UserSelect = vbYes Then

If Check8.Value = 1 Then
Call UpdateSubID
End If
If Check9.Value = 1 Then
Call UpdateSubname
End If
If Check10.Value = 1 Then
Call UpdateCredit
End If
If Check11.Value = 1 Then
Call UpdateTeacher
End If
If Check12.Value = 1 Then
Call UpdateTimes
End If
If Check13.Value = 1 Then
Call UpdateBooks
End If
MsgBox "Update  เรียบร้อย", , "Update"
Else
End If
End If
End Sub

Private Sub Command15_Click() 'update register
Dim UserSelect As Integer
Dim checktext As Boolean

If ((Check1.Value = 1 And Combo18.Text <> "") Or (Check3.Value = 1 And Combo14.Text <> "")) Then
    UserSelect = MsgBox("Are you sure?", vbYesNo, "Change")
If UserSelect = vbYes Then

If Check1.Value = 1 Then
Call UpdateGrade
End If
If Check3.Value = 1 Then
Call UpdateSection
End If
MsgBox "Update  เรียบร้อย", , "Update"
Else
End If
End If
End Sub
Private Sub UpdateGrade()
Dim i, j As Integer
Dim SQLString As String

Dim DDay6 As String
Dim MMonth6 As String
Dim YYear6 As String

DDay6 = DTPicker6.Day
MMonth6 = DTPicker6.Month
YYear6 = DTPicker6.Year
'execute Procedure UpdateSection('1','05/05/2000',Null,
'100','200'.'1','2');

SQLString = "EXECUTE Procedure UpdateGrade( " & _
 "'" & Combo18.Text + "','" & MMonth6 + "/" & DDay6 + "/" & YYear6 + "',Null, " & _
 "'" & Combo16.Text + "','" & Combo17.Text + "','" & Combo15.Text + "','" & Combo25.Text + "')"

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
End Sub
Private Sub UpdateSection()
Dim i, j As Integer
Dim SQLString As String
Dim DDay6 As String
Dim MMonth6 As String
Dim YYear6 As String

DDay6 = DTPicker6.Day
MMonth6 = DTPicker6.Month
YYear6 = DTPicker6.Year

SQLString = "EXECUTE Procedure UpdateSection( " & _
 "'" & Combo18.Text + "','" & MMonth6 + "/" & DDay6 + "/" & YYear6 + "',Null, " & _
 "'" & Combo16.Text + "','" & Combo17.Text + "','" & Combo15.Text + "','" & Combo25.Text + "')"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
End Sub



Private Sub Command16_Click() 'query subject name
Dim SQL As String
Dim SQLString As String
Dim check As Boolean
check = True
If (Combo22.Text = "") Then
check = False
End If
If (Text37.Text = "") Then
check = False
End If

If check = True Then
ListView3.ListItems.Clear
'EXECUTE FUNCTION GetStdID('100');
SQLString = "EXECUTE  FUNCTION GetSubname(" & Combo22.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
Set oResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand("select * from listResult")
MainScreen.oDataGroupStudent.CommitTransaction
Dim listinfo As ListItem

If Not (oResult Is Nothing) Then
Do While oResult.EOT = False
Set listinfo = ListView3.ListItems.Add(, , oResult.Columns(1).Value)
With listinfo
    .SubItems(1) = oResult.Columns(2).Value
    .SubItems(2) = oResult.Columns(3).Value
End With
oResult.NextRecord
ListView1.Refresh
Loop
End If
MainScreen.oDataGroupStudent.DeleteVirtualTable (oResult.Name)
MainScreen.oDataGroupStudent.DeleteVirtualTable (oVTableResult.Name)
End If
End Sub

Private Sub Command17_Click() 'Update student
Dim UserSelect As Integer
Dim checktext As Boolean

If ((Check2.Value = 1 And Text18.Text <> "") Or (Check4.Value = 1 And Text20.Text <> "") Or (Check5.Value = 1 And Text21.Text <> "") Or (Check6.Value = 1 And Text22.Text <> "") Or (Check7.Value = 1 And Text23.Text <> "")) Then
    UserSelect = MsgBox("Are you sure?", vbYesNo, "Change")
If UserSelect = vbYes Then

If Check2.Value = 1 Then
Call UpdateStdID
End If
If Check4.Value = 1 Then
Call UpdateFirstname
End If
If Check5.Value = 1 Then
Call UpdateLastname
End If
If Check6.Value = 1 Then
Call UpdateMajor
End If
If Check7.Value = 1 Then
Call UpdateAddress
End If
MsgBox "Update  เรียบร้อย", , "Update"
Else
End If

End If
End Sub

Private Sub Command18_Click()
ListView4.ListItems.Clear
Call StudentQuery
End Sub
Private Sub StudentQuery()
Dim SQL As String
Dim listinfo As ListItem
Dim SQLString As String
Dim check As Boolean
Dim oTable As ddoTable
check = True
If (Combo8.Text = "") Then
check = False
End If

If check = True Then
ListView1.ListItems.Clear
SQL = "select distinct std_serial  from  Register where sub_serial =" & Combo8.Text + ""
'SQL = "select distinct std_serial  from  Register where sub_serial =200"
MainScreen.oDataGroupStudent.BeginTransaction
Set oTable = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQL)
MainScreen.oDataGroupStudent.CommitTransaction

If Not (oTable Is Nothing) Then
Do While oTable.EOT = False

SQLString = "EXECUTE  FUNCTION CurrentStudent(" & oTable.Columns(1).Value + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
'Set oResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand("select * from listResult")
MainScreen.oDataGroupStudent.CommitTransaction
If Not (oResult Is Nothing) Then
Do While oResult.EOT = False
Set listinfo = ListView4.ListItems.Add(, , oResult.Columns(1).Value)
With listinfo
    .SubItems(1) = oResult.Columns(2).Value
    .SubItems(2) = oResult.Columns(3).Value
    .SubItems(3) = oResult.Columns(4).Value
End With
oResult.NextRecord
'ListView4.Refresh

Loop
End If
oTable.NextRecord
MainScreen.oDataGroupStudent.DeleteVirtualTable (oResult.Name)
Loop
'MainScreen.oDataGroupStudent.DeleteVirtualTable (oResult.Name)
MainScreen.oDataGroupStudent.DeleteVirtualTable (oVTableResult.Name)
MainScreen.oDataGroupStudent.DeleteVirtualTable (oTable.Name)
End If
End If
End Sub
Private Sub Command19_Click()  'cancle all
Check2.Value = 0
'Check3.Value = 0
Check4.Value = 0
Check5.Value = 0
Check6.Value = 0
Check6.Value = 0
Check7.Value = 0
Text18.Enabled = False
Text19.Enabled = False
Text20.Enabled = False
Text21.Enabled = False
Text22.Enabled = False
Text23.Enabled = False
End Sub

Private Sub Command20_Click()
Check8.Value = 0
Check9.Value = 0
Check10.Value = 0
Check11.Value = 0
Check12.Value = 0
Check13.Value = 0

Text24.Enabled = False
Text25.Enabled = False
Text26.Enabled = False
Text27.Enabled = False
Text28.Enabled = False
Text29.Enabled = False
End Sub

Private Sub Command23_Click() ' Delete student temporal
Dim i, j As Integer
Dim SQLString As String
Dim check As Boolean
Dim UserSelect As Integer

Dim DDay4 As String
Dim MMonth4 As String
Dim YYear4 As String

DDay4 = DTPicker4.Day
MMonth4 = DTPicker4.Month
YYear4 = DTPicker4.Year

Check2.Value = 1
'Check3.Value = 1
Check4.Value = 1
Check5.Value = 1
Check6.Value = 1
Check6.Value = 1
Check7.Value = 1
Text18.Enabled = True
'Text19.Enabled = True
Text20.Enabled = True
Text21.Enabled = True
Text22.Enabled = True
Text23.Enabled = True
'execute Procedure DeleteStudent('100','06/06/2001');
UserSelect = MsgBox("Are you sure?", vbYesNo, "Delete")
If UserSelect = vbYes Then
SQLString = "EXECUTE Procedure DeleteStudent( " & _
 "'" & Combo19.Text + "','" & MMonth4 + "/" & DDay4 + "/" & YYear4 + "')"

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
MsgBox "Delete  เรียบร้อย", , "Delete"
Else
End If
Check2.Value = 0
'Check3.Value = 1
Check4.Value = 0
Check5.Value = 0
Check6.Value = 0
Check6.Value = 0
Check7.Value = 0
Text18.Enabled = False
'Text19.Enabled = True
Text20.Enabled = False
Text21.Enabled = False
Text22.Enabled = False
Text23.Enabled = False
End Sub

Private Sub Command24_Click() 'Delete Temporal subject
Dim i, j As Integer
Dim SQLString As String
Dim check As Boolean
Dim UserSelect As Integer

Dim DDay4 As String
Dim MMonth4 As String
Dim YYear4 As String

DDay5 = DTPicker5.Day
MMonth5 = DTPicker5.Month
YYear5 = DTPicker5.Year
Check8.Value = 1
Check9.Value = 1
Check10.Value = 1
Check11.Value = 1
Check12.Value = 1
Check13.Value = 1

Text24.Enabled = True
Text25.Enabled = True
Text26.Enabled = True
Text27.Enabled = True
Text28.Enabled = True
Text29.Enabled = True
'execute Procedure DeleteStudent('100','06/06/2001');
UserSelect = MsgBox("Are you sure?", vbYesNo, "Delete")
If UserSelect = vbYes Then
SQLString = "EXECUTE Procedure DeleteSubject( " & _
 "'" & Combo20.Text + "','" & MMonth5 + "/" & DDay5 + "/" & YYear5 + "')"

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
MsgBox "Delete  เรียบร้อย", , "Delete"
Else
End If
Check8.Value = 0
Check9.Value = 0
Check10.Value = 0
Check11.Value = 0
Check12.Value = 0
Check13.Value = 0

Text24.Enabled = False
Text25.Enabled = False
Text26.Enabled = False
Text27.Enabled = False
Text28.Enabled = False
Text29.Enabled = False
End Sub

Private Sub Command3_Click()  'Firstname
Dim SQLString As String
Dim check As Boolean
check = True
If (Combo23.Text = "") Then
check = False
End If
If (Text32.Text = "") Then
check = False
End If

If check = True Then
ListView1.ListItems.Clear
SQLString = "EXECUTE  FUNCTION GetFirstname(" & Combo23.Text + ")"

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
Set oResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand("select * from listResult")
MainScreen.oDataGroupStudent.CommitTransaction

Dim listinfo As ListItem
If Not (oResult Is Nothing) Then
Do While oResult.EOT = False
Set listinfo = ListView1.ListItems.Add(, , oResult.Columns(1).Value)
With listinfo
    .SubItems(1) = oResult.Columns(2).Value
    .SubItems(2) = oResult.Columns(3).Value
End With
oResult.NextRecord
ListView1.Refresh
Loop
End If
MainScreen.oDataGroupStudent.DeleteVirtualTable (oResult.Name)
MainScreen.oDataGroupStudent.DeleteVirtualTable (oVTableResult.Name)
End If
End Sub
Private Sub Command4_Click()  'Lastname
Dim SQLString As String
Dim check As Boolean
check = True
If (Combo23.Text = "") Then
check = False
End If
If (Text33.Text = "") Then
check = False
End If

If check = True Then
ListView1.ListItems.Clear
'EXECUTE FUNCTION GetStdID('100');
SQLString = "EXECUTE  FUNCTION GetLastname(" & Combo23.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
Set oResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand("select * from listResult")
'"Create table ListResult(data varchar(70),Vtime_Start date,Vtime_End date);")
MainScreen.oDataGroupStudent.CommitTransaction
'Count = oVTableResult.Columns(1).Value
Dim listinfo As ListItem

If Not (oResult Is Nothing) Then
Do While oResult.EOT = False
Set listinfo = ListView1.ListItems.Add(, , oResult.Columns(1).Value)
With listinfo
    .SubItems(1) = oResult.Columns(2).Value
    .SubItems(2) = oResult.Columns(3).Value
End With
oResult.NextRecord
'ListView1.Refresh
Loop
End If
MainScreen.oDataGroupStudent.DeleteVirtualTable (oResult.Name)
MainScreen.oDataGroupStudent.DeleteVirtualTable (oVTableResult.Name)
End If
End Sub

Private Sub Command5_Click() 'Major
Dim SQLString As String
Dim check As Boolean
check = True
If (Combo23.Text = "") Then
check = False
End If
If (Text34.Text = "") Then
check = False
End If

If check = True Then
ListView1.ListItems.Clear
'EXECUTE FUNCTION GetStdID('100');
SQLString = "EXECUTE  FUNCTION GetMajor(" & Combo23.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
Set oResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand("select * from listResult")
'"Create table ListResult(data varchar(70),Vtime_Start date,Vtime_End date);")
MainScreen.oDataGroupStudent.CommitTransaction
'Count = oVTableResult.Columns(1).Value
Dim listinfo As ListItem

If Not (oResult Is Nothing) Then
Do While oResult.EOT = False
Set listinfo = ListView1.ListItems.Add(, , oResult.Columns(1).Value)
With listinfo
    .SubItems(1) = oResult.Columns(2).Value
    .SubItems(2) = oResult.Columns(3).Value
End With
oResult.NextRecord
'ListView1.Refresh
Loop
End If
MainScreen.oDataGroupStudent.DeleteVirtualTable (oResult.Name)
MainScreen.oDataGroupStudent.DeleteVirtualTable (oVTableResult.Name)
End If
End Sub

Private Sub Command6_Click()  'Address
Dim SQLString As String
Dim check As Boolean
check = True
If (Combo23.Text = "") Then
check = False
End If
If (Text35.Text = "") Then
check = False
End If

If check = True Then
ListView1.ListItems.Clear

SQLString = "EXECUTE  FUNCTION GetAddress(" & Combo23.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
Set oResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand("select * from listResult")
MainScreen.oDataGroupStudent.CommitTransaction

Dim listinfo As ListItem

If Not (oResult Is Nothing) Then
Do While oResult.EOT = False
Set listinfo = ListView1.ListItems.Add(, , oResult.Columns(1).Value)
With listinfo
    .SubItems(1) = oResult.Columns(2).Value
    .SubItems(2) = oResult.Columns(3).Value
End With
oResult.NextRecord
ListView1.Refresh
Loop
End If
MainScreen.oDataGroupStudent.DeleteVirtualTable (oResult.Name)
MainScreen.oDataGroupStudent.DeleteVirtualTable (oVTableResult.Name)
End If
End Sub

Private Sub Command7_Click() 'Query subject
Dim SQL As String
Dim SQLString As String
Dim check As Boolean
check = True
If (Combo22.Text = "") Then
check = False
End If
If (Text36.Text = "") Then
check = False
End If

If check = True Then
ListView3.ListItems.Clear
'EXECUTE FUNCTION GetStdID('100');
SQLString = "EXECUTE  FUNCTION GetSubID(" & Combo22.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
Set oResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand("select * from listResult")
MainScreen.oDataGroupStudent.CommitTransaction
Dim listinfo As ListItem

If Not (oResult Is Nothing) Then
Do While oResult.EOT = False
Set listinfo = ListView3.ListItems.Add(, , oResult.Columns(1).Value)
With listinfo
    .SubItems(1) = oResult.Columns(2).Value
    .SubItems(2) = oResult.Columns(3).Value
End With
oResult.NextRecord
ListView1.Refresh
Loop
End If
MainScreen.oDataGroupStudent.DeleteVirtualTable (oResult.Name)
MainScreen.oDataGroupStudent.DeleteVirtualTable (oVTableResult.Name)
End If
End Sub

Private Sub Command8_Click() 'Query subject credit
Dim SQL As String
Dim SQLString As String
Dim check As Boolean
check = True
If (Combo22.Text = "") Then
check = False
End If
If (Text38.Text = "") Then
check = False
End If

If check = True Then
ListView3.ListItems.Clear
'EXECUTE FUNCTION GetStdID('100');
SQLString = "EXECUTE  FUNCTION GetCredit(" & Combo22.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
Set oResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand("select * from listResult")
MainScreen.oDataGroupStudent.CommitTransaction
Dim listinfo As ListItem

If Not (oResult Is Nothing) Then
Do While oResult.EOT = False
Set listinfo = ListView3.ListItems.Add(, , oResult.Columns(1).Value)
With listinfo
    .SubItems(1) = oResult.Columns(2).Value
    .SubItems(2) = oResult.Columns(3).Value
End With
oResult.NextRecord
ListView1.Refresh
Loop
End If
MainScreen.oDataGroupStudent.DeleteVirtualTable (oResult.Name)
MainScreen.oDataGroupStudent.DeleteVirtualTable (oVTableResult.Name)
End If
End Sub

Private Sub Command9_Click() ' Query subject Teacher
Dim SQL As String
Dim SQLString As String
Dim check As Boolean
check = True
If (Combo22.Text = "") Then
check = False
End If
If (Text39.Text = "") Then
check = False
End If

If check = True Then
ListView3.ListItems.Clear
'EXECUTE FUNCTION GetStdID('100');
SQLString = "EXECUTE  FUNCTION GetTeacher(" & Combo22.Text + ")"
MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
Set oResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand("select * from listResult")
MainScreen.oDataGroupStudent.CommitTransaction
Dim listinfo As ListItem

If Not (oResult Is Nothing) Then
Do While oResult.EOT = False
Set listinfo = ListView3.ListItems.Add(, , oResult.Columns(1).Value)
With listinfo
    .SubItems(1) = oResult.Columns(2).Value
    .SubItems(2) = oResult.Columns(3).Value
End With
oResult.NextRecord
ListView1.Refresh
Loop
End If
MainScreen.oDataGroupStudent.DeleteVirtualTable (oResult.Name)
MainScreen.oDataGroupStudent.DeleteVirtualTable (oVTableResult.Name)
End If
End Sub

Private Sub DTPicker1_CallbackKeyDown(ByVal KeyCode As Integer, ByVal Shift As Integer, ByVal CallbackField As String, CallbackDate As Date)
With Text19
.Refresh
.Text = DTPicker1.Value
End With
End Sub

Private Sub Form_Load()
Initialize
End Sub
Private Sub GetStudentSerial()
'Dim CountRow As Byte
Dim oResult As ddoTable

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand("SELECT std_Serial from Student")
MainScreen.oDataGroupStudent.CommitTransaction
Combo19.Clear  'Student Update
Combo23.Clear 'Student Query
Combo24.Clear  'Regis insert
Combo16.Clear
If Not (oVTableResult Is Nothing) Then
Do While oVTableResult.EOT = False
With Combo19
    .AddItem (oVTableResult.Columns(1).Value)
End With
With Combo23
    .AddItem (oVTableResult.Columns(1).Value)
End With
With Combo24
    .AddItem (oVTableResult.Columns(1).Value)
End With
With Combo16
    .AddItem (oVTableResult.Columns(1).Value)
End With

oVTableResult.NextRecord
Loop
End If
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
End Sub
Private Sub GetSubSerial()
'Dim CountRow As Byte
Dim oResult As ddoTable

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand("SELECT Sub_Serial from Subject")
MainScreen.oDataGroupStudent.CommitTransaction
Combo20.Clear
Combo22.Clear
Combo26.Clear
Combo17.Clear
Combo8.Clear
If Not (oVTableResult Is Nothing) Then
Do While oVTableResult.EOT = False
With Combo20
    .AddItem (oVTableResult.Columns(1).Value)
End With
With Combo22
    .AddItem (oVTableResult.Columns(1).Value)
End With
With Combo26
    .AddItem (oVTableResult.Columns(1).Value)
End With
With Combo17
    .AddItem (oVTableResult.Columns(1).Value)
End With
With Combo8
    .AddItem (oVTableResult.Columns(1).Value)
End With
oVTableResult.NextRecord
Loop
End If
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
End Sub
Private Sub Initialize()

 ' Create the DataDirector Engine object
    Set oEngine = CreateObject("DataDirector.Engine")
    ' Now create a new project in oEngine (the Engine
    ' object instantiated above).
   Set oProject = oEngine.CurrentProject
   Set oDataGroupStudent = oProject.CreateDataGroup("student", DGstudent, PathModel)
   'SSTab1.TabVisible(0) = False
   'SSTab1.TabVisible(1) = False
   'SSTab1.TabVisible(2) = False
   'SSTab1.TabVisible(3) = False
   MainScreen.oDataGroupStudent.Logon "informix", "ids2000"
Call GetStudentSerial 'get serial
Call GetSubSerial  'get serial
'set start for check update student

Text18.Enabled = False
Text19.Enabled = False
Text20.Enabled = False
Text21.Enabled = False
Text22.Enabled = False
Text23.Enabled = False

Text24.Enabled = False
Text25.Enabled = False
Text26.Enabled = False
Text27.Enabled = False
Text28.Enabled = False
Text29.Enabled = False

End Sub
Private Sub ClearStudent()
Text18.Text = " "
Text19.Text = " "
Text20.Text = " "
Text21.Text = " "
Text22.Text = " "
Text23.Text = " "
End Sub
 
 Private Sub ClearStudentQuery()
Text30.Text = " "
Text31.Text = " "
Text32.Text = " "
Text33.Text = " "
Text34.Text = " "
Text35.Text = " "
End Sub
 
 Private Sub ClearSubjectQuery()
Text36.Text = " "
Text37.Text = " "
Text38.Text = " "
Text39.Text = " "
Text40.Text = " "
Text41.Text = " "
End Sub

Private Sub ClearSubject()
Text24.Text = " "
Text25.Text = " "
Text26.Text = " "
Text27.Text = " "
Text28.Text = " "
Text29.Text = " "
End Sub

Private Sub mexit_Click()
 MainScreen.oDataGroupStudent.Logoff
End
End Sub
' Update student table *****************************************
Private Sub UpdateStdID()
Dim i, j As Integer
Dim SQLString As String
'Dim check As Boolean
'Dim UserSelect As Integer
Dim DDay4 As String
Dim MMonth4 As String
Dim YYear4 As String

DDay4 = DTPicker4.Day
MMonth4 = DTPicker4.Month
YYear4 = DTPicker4.Year

'UserSelect = MsgBox("Are you sure?", vbYesNo, "Change")
'If UserSelect = vbYes Then
SQLString = "EXECUTE Procedure UpdateStdID( " & _
 "'" & UCase(Text18.Text) + "','" & MMonth4 + "/" & DDay4 + "/" & YYear4 + "',Null, " & _
 "'" & Combo19.Text + "')"

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
'Else
'End If
End Sub

Private Sub UpdateFirstname()
Dim i, j As Integer
Dim SQLString As String
'Dim check As Boolean
'Dim UserSelect As Integer
Dim DDay4 As String
Dim MMonth4 As String
Dim YYear4 As String

DDay4 = DTPicker4.Day
MMonth4 = DTPicker4.Month
YYear4 = DTPicker4.Year

'UserSelect = MsgBox("Are you sure?", vbYesNo, "Change")
'If UserSelect = vbYes Then
SQLString = "EXECUTE Procedure UpdateFirstname( " & _
 "'" & UCase(Text20.Text) + "','" & MMonth4 + "/" & DDay4 + "/" & YYear4 + "',Null, " & _
 "'" & Combo19.Text + "')"

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
'Else
'End If
End Sub


Private Sub UpdateLastname()
Dim i, j As Integer
Dim SQLString As String
'Dim check As Boolean
'Dim UserSelect As Integer
Dim DDay4 As String
Dim MMonth4 As String
Dim YYear4 As String

DDay4 = DTPicker4.Day
MMonth4 = DTPicker4.Month
YYear4 = DTPicker4.Year

'UserSelect = MsgBox("Are you sure?", vbYesNo, "Change")
'If UserSelect = vbYes Then
SQLString = "EXECUTE Procedure UpdateLastname( " & _
 "'" & UCase(Text21.Text) + "','" & MMonth4 + "/" & DDay4 + "/" & YYear4 + "',Null, " & _
 "'" & Combo19.Text + "')"

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
'Else
'End If
End Sub
Private Sub UpdateMajor()
Dim i, j As Integer
Dim SQLString As String
'Dim check As Boolean
'Dim UserSelect As Integer
Dim DDay4 As String
Dim MMonth4 As String
Dim YYear4 As String

DDay4 = DTPicker4.Day
MMonth4 = DTPicker4.Month
YYear4 = DTPicker4.Year

'UserSelect = MsgBox("Are you sure?", vbYesNo, "Change")
'If UserSelect = vbYes Then
SQLString = "EXECUTE Procedure UpdateMajor( " & _
 "'" & UCase(Text22.Text) + "','" & MMonth4 + "/" & DDay4 + "/" & YYear4 + "',Null, " & _
 "'" & Combo19.Text + "')"

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
'Else
'End If
End Sub
Private Sub UpdateAddress()
Dim i, j As Integer
Dim SQLString As String
'Dim check As Boolean
'Dim UserSelect As Integer
Dim DDay4 As String
Dim MMonth4 As String
Dim YYear4 As String

DDay4 = DTPicker4.Day
MMonth4 = DTPicker4.Month
YYear4 = DTPicker4.Year

'UserSelect = MsgBox("Are you sure?", vbYesNo, "Change")
'If UserSelect = vbYes Then
SQLString = "EXECUTE Procedure UpdateAddress( " & _
 "'" & UCase(Text23.Text) + "','" & MMonth4 + "/" & DDay4 + "/" & YYear4 + "',Null, " & _
 "'" & Combo19.Text + "')"

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
'Else
'End If
End Sub
'################################################# update subject
Private Sub UpdateSubID()
Dim i, j As Integer
Dim SQLString As String
'Dim check As Boolean
'Dim UserSelect As Integer
Dim DDay5 As String
Dim MMonth5 As String
Dim YYear5 As String

DDay5 = DTPicker5.Day
MMonth5 = DTPicker5.Month
YYear5 = DTPicker5.Year

'UserSelect = MsgBox("Are you sure?", vbYesNo, "Change")
'If UserSelect = vbYes Then
SQLString = "EXECUTE Procedure UpdateSubID( " & _
 "'" & UCase(Text24.Text) + "','" & MMonth5 + "/" & DDay5 + "/" & YYear5 + "',Null, " & _
 "'" & Combo20.Text + "')"

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
'Else
'End If
End Sub

Private Sub UpdateSubname()
Dim i, j As Integer
Dim SQLString As String
'Dim check As Boolean
'Dim UserSelect As Integer
Dim DDay5 As String
Dim MMonth5 As String
Dim YYear5 As String

DDay5 = DTPicker5.Day
MMonth5 = DTPicker5.Month
YYear5 = DTPicker5.Year

'UserSelect = MsgBox("Are you sure?", vbYesNo, "Change")
'If UserSelect = vbYes Then
SQLString = "EXECUTE Procedure UpdateSubname( " & _
 "'" & UCase(Text25.Text) + "','" & MMonth5 + "/" & DDay5 + "/" & YYear5 + "',Null, " & _
 "'" & Combo20.Text + "')"

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
'Else
'End If
End Sub

Private Sub UpdateCredit()
Dim i, j As Integer
Dim SQLString As String
'Dim check As Boolean
'Dim UserSelect As Integer
Dim DDay5 As String
Dim MMonth5 As String
Dim YYear5 As String

DDay5 = DTPicker5.Day
MMonth5 = DTPicker5.Month
YYear5 = DTPicker5.Year

'UserSelect = MsgBox("Are you sure?", vbYesNo, "Change")
'If UserSelect = vbYes Then
SQLString = "EXECUTE Procedure UpdateCredit( " & _
 "'" & UCase(Text26.Text) + "','" & MMonth5 + "/" & DDay5 + "/" & YYear5 + "',Null, " & _
 "'" & Combo20.Text + "')"

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
'Else
'End If
End Sub

Private Sub UpdateTeacher()
Dim i, j As Integer
Dim SQLString As String
'Dim check As Boolean
'Dim UserSelect As Integer
Dim DDay5 As String
Dim MMonth5 As String
Dim YYear5 As String

DDay5 = DTPicker5.Day
MMonth5 = DTPicker5.Month
YYear5 = DTPicker5.Year

'UserSelect = MsgBox("Are you sure?", vbYesNo, "Change")
'If UserSelect = vbYes Then
SQLString = "EXECUTE Procedure UpdateTeacher( " & _
 "'" & UCase(Text27.Text) + "','" & MMonth5 + "/" & DDay5 + "/" & YYear5 + "',Null, " & _
 "'" & Combo20.Text + "')"

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
'Else
'End If
End Sub


Private Sub UpdateTimes()
Dim i, j As Integer
Dim SQLString As String
'Dim check As Boolean
'Dim UserSelect As Integer
Dim DDay5 As String
Dim MMonth5 As String
Dim YYear5 As String

DDay5 = DTPicker5.Day
MMonth5 = DTPicker5.Month
YYear5 = DTPicker5.Year

'UserSelect = MsgBox("Are you sure?", vbYesNo, "Change")
'If UserSelect = vbYes Then
SQLString = "EXECUTE Procedure UpdateTimes( " & _
 "'" & UCase(Text28.Text) + "','" & MMonth5 + "/" & DDay5 + "/" & YYear5 + "',Null, " & _
 "'" & Combo20.Text + "')"

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
'Else
'End If
End Sub

Private Sub UpdateBooks()
Dim i, j As Integer
Dim SQLString As String
'Dim check As Boolean
'Dim UserSelect As Integer
Dim DDay5 As String
Dim MMonth5 As String
Dim YYear5 As String

DDay5 = DTPicker5.Day
MMonth5 = DTPicker5.Month
YYear5 = DTPicker5.Year

'UserSelect = MsgBox("Are you sure?", vbYesNo, "Change")
'If UserSelect = vbYes Then
SQLString = "EXECUTE Procedure UpdateBooks( " & _
 "'" & UCase(Text29.Text) + "','" & MMonth5 + "/" & DDay5 + "/" & YYear5 + "',Null, " & _
 "'" & Combo20.Text + "')"

MainScreen.oDataGroupStudent.BeginTransaction
Set oVTableResult = MainScreen.oDataGroupStudent.ExecuteSQLCommand(SQLString)
MainScreen.oDataGroupStudent.CommitTransaction
MainScreen.oDataGroupStudent.DeleteVirtualTable ("oVTableResult")
'Else
'End If
End Sub

'Private Sub DataDirector_Info()
'[DataDirectorInfoStart]
'NumDataLinks=1
'[DataLink]
'GroupName=register
'ControlName=Combo6
'ClassId=2
'Synchronize=0
'GetAllData=1
'StoreSelect=1
'SortOrder=0
'SortFlag=0
'DefaultType=1
'TrimTrailingBlanks=0
'DataSource=register_student1
'DataField=std_serial
'AssociationType=2
'SourceType=1
'[DataLinkButtonInfo]
'[EndDataLinkButtonInfo]
'[DataLinkPath]
'NumElements=2
'[DataLinkPathInfo]
'TableName=register
'NumColumns=1
'ColumnName=std_serial
'[EndDataLinkPathInfo]
'[DataLinkPathInfo]
'TableName=student
'NumColumns=1
'ColumnName=std_serial
'[EndDataLinkPathInfo]
'[EndDataLinkPath]
'[EndDataLink]
'[DataDirectorInfoEnd]
'End Sub
Private Sub SSTab2_DblClick()

End Sub
