VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "msmask32.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form EmployeeDetail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Employee Information"
   ClientHeight    =   7620
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9975
   Icon            =   "EmployeeDetail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7620
   ScaleWidth      =   9975
   ShowInTaskbar   =   0   'False
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   6240
      Top             =   6840
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
      DialogTitle     =   "Import Image File"
      Filter          =   "Image Files (*.jpg; *.gif; *.bmp)| *.jpg;*.gif;*.bmp;"
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   6255
      Left            =   240
      TabIndex        =   106
      Top             =   240
      Width           =   9495
      _ExtentX        =   16748
      _ExtentY        =   11033
      _Version        =   393216
      Tabs            =   10
      TabsPerRow      =   5
      TabHeight       =   520
      TabCaption(0)   =   "&General"
      TabPicture(0)   =   "EmployeeDetail.frx":0442
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Label3(0)"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "Label3(2)"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "Label3(3)"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "Label3(4)"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "Label3(5)"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "Label3(6)"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "Label3(7)"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).Control(7)=   "Frame1"
      Tab(0).Control(7).Enabled=   0   'False
      Tab(0).Control(8)=   "Text1"
      Tab(0).Control(8).Enabled=   0   'False
      Tab(0).Control(9)=   "Frame2"
      Tab(0).Control(9).Enabled=   0   'False
      Tab(0).Control(10)=   "Frame3"
      Tab(0).Control(10).Enabled=   0   'False
      Tab(0).Control(11)=   "Frame4"
      Tab(0).Control(11).Enabled=   0   'False
      Tab(0).Control(12)=   "Frame5(0)"
      Tab(0).Control(12).Enabled=   0   'False
      Tab(0).Control(13)=   "Frame5(1)"
      Tab(0).Control(13).Enabled=   0   'False
      Tab(0).Control(14)=   "Frame5(2)"
      Tab(0).Control(14).Enabled=   0   'False
      Tab(0).Control(15)=   "Frame6"
      Tab(0).Control(15).Enabled=   0   'False
      Tab(0).Control(16)=   "Frame7(0)"
      Tab(0).Control(16).Enabled=   0   'False
      Tab(0).Control(17)=   "Frame7(1)"
      Tab(0).Control(17).Enabled=   0   'False
      Tab(0).Control(18)=   "Frame5(3)"
      Tab(0).Control(18).Enabled=   0   'False
      Tab(0).Control(19)=   "Combo1(0)"
      Tab(0).Control(19).Enabled=   0   'False
      Tab(0).Control(20)=   "Text4(0)"
      Tab(0).Control(20).Enabled=   0   'False
      Tab(0).Control(21)=   "Text4(1)"
      Tab(0).Control(21).Enabled=   0   'False
      Tab(0).Control(22)=   "Frame5(4)"
      Tab(0).Control(22).Enabled=   0   'False
      Tab(0).Control(23)=   "Frame5(5)"
      Tab(0).Control(23).Enabled=   0   'False
      Tab(0).Control(24)=   "Combo1(1)"
      Tab(0).Control(24).Enabled=   0   'False
      Tab(0).Control(25)=   "Text4(2)"
      Tab(0).Control(25).Enabled=   0   'False
      Tab(0).Control(26)=   "Text4(3)"
      Tab(0).Control(26).Enabled=   0   'False
      Tab(0).ControlCount=   27
      TabCaption(1)   =   "&Address"
      TabPicture(1)   =   "EmployeeDetail.frx":045E
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "Frame8"
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "&Employment"
      TabPicture(2)   =   "EmployeeDetail.frx":047A
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "Frame21"
      Tab(2).Control(1)=   "Frame20"
      Tab(2).Control(2)=   "Frame19"
      Tab(2).Control(3)=   "Frame18"
      Tab(2).Control(4)=   "Frame17"
      Tab(2).Control(5)=   "Frame16"
      Tab(2).Control(6)=   "Frame15"
      Tab(2).Control(7)=   "Frame9"
      Tab(2).Control(8)=   "Frame10(0)"
      Tab(2).Control(9)=   "Frame10(1)"
      Tab(2).Control(10)=   "Frame11"
      Tab(2).Control(11)=   "Frame12"
      Tab(2).Control(12)=   "Frame5(6)"
      Tab(2).Control(13)=   "Frame13"
      Tab(2).Control(14)=   "Frame14"
      Tab(2).Control(15)=   "Check3"
      Tab(2).Control(16)=   "Check4"
      Tab(2).Control(17)=   "Check5"
      Tab(2).ControlCount=   18
      TabCaption(3)   =   "&Incomes"
      TabPicture(3)   =   "EmployeeDetail.frx":0496
      Tab(3).ControlEnabled=   0   'False
      Tab(3).Control(0)=   "MSHFlexGrid1"
      Tab(3).Control(1)=   "Command9"
      Tab(3).Control(2)=   "Command10"
      Tab(3).Control(3)=   "Command11"
      Tab(3).ControlCount=   4
      TabCaption(4)   =   "&Deduction"
      TabPicture(4)   =   "EmployeeDetail.frx":04B2
      Tab(4).ControlEnabled=   0   'False
      Tab(4).Control(0)=   "MSHFlexGrid2"
      Tab(4).Control(1)=   "Command12"
      Tab(4).Control(2)=   "Command13"
      Tab(4).Control(3)=   "Command14"
      Tab(4).ControlCount=   4
      TabCaption(5)   =   "&Leave"
      TabPicture(5)   =   "EmployeeDetail.frx":04CE
      Tab(5).ControlEnabled=   0   'False
      Tab(5).Control(0)=   "Frame22(2)"
      Tab(5).Control(0).Enabled=   0   'False
      Tab(5).Control(1)=   "Frame22(1)"
      Tab(5).Control(1).Enabled=   0   'False
      Tab(5).Control(2)=   "Frame22(0)"
      Tab(5).Control(2).Enabled=   0   'False
      Tab(5).ControlCount=   3
      TabCaption(6)   =   "&Work Experiences"
      TabPicture(6)   =   "EmployeeDetail.frx":04EA
      Tab(6).ControlEnabled=   0   'False
      Tab(6).Control(0)=   "Text7(0)"
      Tab(6).ControlCount=   1
      TabCaption(7)   =   "Goal && &Achievement"
      TabPicture(7)   =   "EmployeeDetail.frx":0506
      Tab(7).ControlEnabled=   0   'False
      Tab(7).Control(0)=   "Frame23(0)"
      Tab(7).Control(1)=   "Frame23(1)"
      Tab(7).ControlCount=   2
      TabCaption(8)   =   "Ed&ucation"
      TabPicture(8)   =   "EmployeeDetail.frx":0522
      Tab(8).ControlEnabled=   0   'False
      Tab(8).Control(0)=   "Text7(1)"
      Tab(8).ControlCount=   1
      TabCaption(9)   =   "&Notes"
      TabPicture(9)   =   "EmployeeDetail.frx":053E
      Tab(9).ControlEnabled=   0   'False
      Tab(9).Control(0)=   "Command8"
      Tab(9).Control(1)=   "Text7(2)"
      Tab(9).ControlCount=   2
      Begin VB.CommandButton Command14 
         Caption         =   "&Remove"
         Height          =   375
         Left            =   -66960
         TabIndex        =   80
         Top             =   5640
         Width           =   1095
      End
      Begin VB.CommandButton Command13 
         Caption         =   "&Modify"
         Height          =   375
         Left            =   -68160
         TabIndex        =   79
         Top             =   5640
         Width           =   1095
      End
      Begin VB.CommandButton Command12 
         Caption         =   "&Add"
         Height          =   375
         Left            =   -69360
         TabIndex        =   78
         Top             =   5640
         Width           =   1095
      End
      Begin VB.CommandButton Command11 
         Caption         =   "&Remove"
         Height          =   375
         Left            =   -66960
         TabIndex        =   76
         Top             =   5640
         Width           =   1095
      End
      Begin VB.CommandButton Command10 
         Caption         =   "&Modify"
         Height          =   375
         Left            =   -68160
         TabIndex        =   75
         Top             =   5640
         Width           =   1095
      End
      Begin VB.CommandButton Command9 
         Caption         =   "&Add"
         Height          =   375
         Left            =   -69360
         TabIndex        =   74
         Top             =   5640
         Width           =   1095
      End
      Begin VB.CommandButton Command8 
         Caption         =   "&New Note"
         Height          =   375
         Left            =   -67200
         TabIndex        =   98
         Top             =   840
         Width           =   1215
      End
      Begin VB.TextBox Text7 
         ForeColor       =   &H00C00000&
         Height          =   5175
         Index           =   2
         Left            =   -74760
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   97
         Text            =   "EmployeeDetail.frx":055A
         Top             =   840
         Width           =   7335
      End
      Begin VB.TextBox Text7 
         ForeColor       =   &H00C00000&
         Height          =   5175
         Index           =   1
         Left            =   -74760
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   96
         Text            =   "EmployeeDetail.frx":0560
         Top             =   840
         Width           =   8775
      End
      Begin VB.Frame Frame23 
         Caption         =   "Achievement"
         Height          =   2535
         Index           =   1
         Left            =   -74760
         TabIndex        =   169
         Top             =   3480
         Width           =   8895
         Begin VB.TextBox Text8 
            ForeColor       =   &H00C00000&
            Height          =   2175
            Index           =   1
            Left            =   120
            MultiLine       =   -1  'True
            ScrollBars      =   3  'Both
            TabIndex        =   95
            Text            =   "EmployeeDetail.frx":0566
            Top             =   240
            Width           =   8655
         End
      End
      Begin VB.Frame Frame23 
         Caption         =   "Goal"
         Height          =   2535
         Index           =   0
         Left            =   -74760
         TabIndex        =   168
         Top             =   840
         Width           =   8895
         Begin VB.TextBox Text8 
            ForeColor       =   &H00C00000&
            Height          =   2175
            Index           =   0
            Left            =   120
            MultiLine       =   -1  'True
            ScrollBars      =   3  'Both
            TabIndex        =   94
            Text            =   "EmployeeDetail.frx":056E
            Top             =   240
            Width           =   8655
         End
      End
      Begin VB.TextBox Text7 
         ForeColor       =   &H00C00000&
         Height          =   5175
         Index           =   0
         Left            =   -74760
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   93
         Text            =   "EmployeeDetail.frx":0576
         Top             =   840
         Width           =   8775
      End
      Begin VB.Frame Frame22 
         Caption         =   "Personal"
         Height          =   1215
         Index           =   2
         Left            =   -74760
         TabIndex        =   163
         Top             =   3160
         Width           =   8895
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   18
            Left            =   2160
            MaxLength       =   20
            TabIndex        =   89
            Text            =   "Text3"
            Top             =   300
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   17
            Left            =   6600
            MaxLength       =   20
            TabIndex        =   90
            Text            =   "Text3"
            Top             =   300
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   16
            Left            =   2160
            MaxLength       =   20
            TabIndex        =   91
            Text            =   "Text3"
            Top             =   660
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   15
            Left            =   6600
            MaxLength       =   20
            TabIndex        =   92
            Text            =   "Text3"
            Top             =   660
            Width           =   1815
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Begining Balance :"
            Height          =   255
            Index           =   28
            Left            =   360
            TabIndex        =   167
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Maximum Balance :"
            Height          =   255
            Index           =   27
            Left            =   360
            TabIndex        =   166
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Earn Per Period :"
            Height          =   255
            Index           =   26
            Left            =   4440
            TabIndex        =   165
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Maximum Carryover :"
            Height          =   255
            Index           =   25
            Left            =   4440
            TabIndex        =   164
            Top             =   720
            Width           =   1575
         End
      End
      Begin VB.Frame Frame22 
         Caption         =   "Sick"
         Height          =   1215
         Index           =   1
         Left            =   -74760
         TabIndex        =   158
         Top             =   1940
         Width           =   8895
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   14
            Left            =   2160
            MaxLength       =   20
            TabIndex        =   85
            Text            =   "Text3"
            Top             =   300
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   13
            Left            =   6600
            MaxLength       =   20
            TabIndex        =   86
            Text            =   "Text3"
            Top             =   300
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   12
            Left            =   2160
            MaxLength       =   20
            TabIndex        =   87
            Text            =   "Text3"
            Top             =   660
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   11
            Left            =   6600
            MaxLength       =   20
            TabIndex        =   88
            Text            =   "Text3"
            Top             =   660
            Width           =   1815
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Begining Balance :"
            Height          =   255
            Index           =   24
            Left            =   360
            TabIndex        =   162
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Maximum Balance :"
            Height          =   255
            Index           =   23
            Left            =   360
            TabIndex        =   161
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Earn Per Period :"
            Height          =   255
            Index           =   22
            Left            =   4440
            TabIndex        =   160
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Maximum Carryover :"
            Height          =   255
            Index           =   21
            Left            =   4440
            TabIndex        =   159
            Top             =   720
            Width           =   1575
         End
      End
      Begin VB.Frame Frame22 
         Caption         =   "Vacation"
         Height          =   1215
         Index           =   0
         Left            =   -74760
         TabIndex        =   153
         Top             =   720
         Width           =   8895
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   10
            Left            =   6600
            MaxLength       =   20
            TabIndex        =   84
            Text            =   "Text3"
            Top             =   660
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   9
            Left            =   2160
            MaxLength       =   20
            TabIndex        =   83
            Text            =   "Text3"
            Top             =   660
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   8
            Left            =   6600
            MaxLength       =   20
            TabIndex        =   82
            Text            =   "Text3"
            Top             =   300
            Width           =   1815
         End
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   7
            Left            =   2160
            MaxLength       =   20
            TabIndex        =   81
            Text            =   "Text3"
            Top             =   300
            Width           =   1815
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Maximum Carryover :"
            Height          =   255
            Index           =   20
            Left            =   4440
            TabIndex        =   157
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Earn Per Period :"
            Height          =   255
            Index           =   19
            Left            =   4440
            TabIndex        =   156
            Top             =   360
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Maximum Balance :"
            Height          =   255
            Index           =   18
            Left            =   360
            TabIndex        =   155
            Top             =   720
            Width           =   1575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Begining Balance :"
            Height          =   255
            Index           =   17
            Left            =   360
            TabIndex        =   154
            Top             =   360
            Width           =   1575
         End
      End
      Begin VB.CheckBox Check5 
         Caption         =   "Label Print"
         Height          =   255
         Left            =   -66960
         TabIndex        =   72
         Top             =   5160
         Value           =   1  'Checked
         Width           =   1095
      End
      Begin VB.CheckBox Check4 
         Caption         =   "Participate in Provident Fund"
         Height          =   255
         Left            =   -74760
         TabIndex        =   71
         Top             =   5400
         Width           =   2535
      End
      Begin VB.CheckBox Check3 
         Caption         =   "Participate in Social Welfare"
         Height          =   255
         Left            =   -74760
         TabIndex        =   70
         Top             =   5160
         Value           =   1  'Checked
         Width           =   2535
      End
      Begin VB.Frame Frame14 
         Caption         =   "Payment Frequency"
         Height          =   615
         Left            =   -69480
         TabIndex        =   145
         Top             =   2700
         Width           =   3615
         Begin VB.OptionButton Option17 
            Caption         =   "Monthly"
            Height          =   255
            Index           =   2
            Left            =   2520
            TabIndex        =   57
            Top             =   240
            Width           =   975
         End
         Begin VB.OptionButton Option17 
            Caption         =   "Bi-Weekly"
            Height          =   255
            Index           =   1
            Left            =   1320
            TabIndex        =   56
            Top             =   240
            Width           =   1095
         End
         Begin VB.OptionButton Option17 
            Caption         =   "Weekly"
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   55
            Top             =   240
            Value           =   -1  'True
            Width           =   975
         End
      End
      Begin VB.Frame Frame13 
         Caption         =   "Payment Method"
         Height          =   615
         Left            =   -74760
         TabIndex        =   144
         Top             =   2700
         Width           =   5175
         Begin VB.OptionButton Option16 
            Caption         =   "Payroll"
            Height          =   255
            Index           =   4
            Left            =   4080
            TabIndex        =   173
            Top             =   240
            Value           =   -1  'True
            Width           =   975
         End
         Begin VB.OptionButton Option16 
            Caption         =   "Transfer"
            Height          =   255
            Index           =   3
            Left            =   3000
            TabIndex        =   54
            Top             =   240
            Width           =   975
         End
         Begin VB.OptionButton Option16 
            Caption         =   "Draft"
            Height          =   255
            Index           =   2
            Left            =   2160
            TabIndex        =   53
            Top             =   240
            Width           =   855
         End
         Begin VB.OptionButton Option16 
            Caption         =   "Cheque"
            Height          =   255
            Index           =   1
            Left            =   1200
            TabIndex        =   52
            Top             =   240
            Width           =   855
         End
         Begin VB.OptionButton Option16 
            Caption         =   "Cash"
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   51
            Top             =   240
            Width           =   855
         End
      End
      Begin VB.Frame Frame5 
         Caption         =   "Tax Rate/Amount"
         Height          =   615
         Index           =   6
         Left            =   -67920
         TabIndex        =   143
         Top             =   2080
         Width           =   2055
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   6
            Left            =   120
            MaxLength       =   20
            TabIndex        =   50
            Text            =   "Text3"
            Top             =   180
            Width           =   1815
         End
      End
      Begin VB.Frame Frame12 
         Caption         =   "Tax Method"
         Height          =   615
         Left            =   -74760
         TabIndex        =   142
         Top             =   2080
         Width           =   6735
         Begin VB.OptionButton Option15 
            Caption         =   "Fixed Amount"
            Height          =   255
            Index           =   3
            Left            =   3120
            TabIndex        =   49
            Top             =   240
            Width           =   1335
         End
         Begin VB.OptionButton Option15 
            Caption         =   "Fixed Rate with Mark-up"
            Height          =   255
            Index           =   2
            Left            =   4560
            TabIndex        =   48
            Top             =   240
            Visible         =   0   'False
            Width           =   2055
         End
         Begin VB.OptionButton Option15 
            Caption         =   "Fixed Rate"
            Height          =   255
            Index           =   1
            Left            =   1920
            TabIndex        =   47
            Top             =   240
            Width           =   1215
         End
         Begin VB.OptionButton Option15 
            Caption         =   "Progressive Rate"
            Height          =   255
            Index           =   0
            Left            =   240
            TabIndex        =   46
            Top             =   240
            Value           =   -1  'True
            Width           =   1575
         End
      End
      Begin VB.Frame Frame11 
         Caption         =   "Cause of Termination"
         Height          =   615
         Left            =   -70440
         TabIndex        =   141
         Top             =   1460
         Width           =   4575
         Begin VB.TextBox Text6 
            ForeColor       =   &H00C00000&
            Height          =   315
            Left            =   120
            MaxLength       =   50
            TabIndex        =   45
            Text            =   "Text6"
            Top             =   180
            Width           =   4335
         End
      End
      Begin VB.Frame Frame10 
         Caption         =   "Terminated Date"
         Height          =   615
         Index           =   1
         Left            =   -72600
         TabIndex        =   140
         Top             =   1460
         Width           =   2055
         Begin MSComCtl2.DTPicker DTPicker2 
            Height          =   315
            Index           =   1
            Left            =   120
            TabIndex        =   44
            Top             =   180
            Width           =   1815
            _ExtentX        =   3201
            _ExtentY        =   556
            _Version        =   393216
            Format          =   19726337
            CurrentDate     =   37642
         End
      End
      Begin VB.Frame Frame10 
         Caption         =   "Joined Date"
         Height          =   615
         Index           =   0
         Left            =   -74760
         TabIndex        =   139
         Top             =   1460
         Width           =   2055
         Begin MSComCtl2.DTPicker DTPicker2 
            Height          =   315
            Index           =   0
            Left            =   120
            TabIndex        =   43
            Top             =   180
            Width           =   1815
            _ExtentX        =   3201
            _ExtentY        =   556
            _Version        =   393216
            Format          =   19726337
            CurrentDate     =   37642
         End
      End
      Begin VB.Frame Frame9 
         Caption         =   "Work Status"
         Height          =   615
         Left            =   -74760
         TabIndex        =   138
         Top             =   840
         Width           =   8895
         Begin VB.OptionButton Option14 
            Caption         =   "Dead"
            Height          =   255
            Left            =   7800
            TabIndex        =   42
            Top             =   240
            Width           =   975
         End
         Begin VB.OptionButton Option13 
            Caption         =   "Terminated"
            Height          =   255
            Left            =   6480
            TabIndex        =   41
            Top             =   240
            Width           =   1215
         End
         Begin VB.OptionButton Option12 
            Caption         =   "Hold"
            Height          =   255
            Left            =   5280
            TabIndex        =   40
            Top             =   240
            Width           =   735
         End
         Begin VB.OptionButton Option11 
            Caption         =   "Leave"
            Height          =   255
            Left            =   4080
            TabIndex        =   39
            Top             =   240
            Width           =   855
         End
         Begin VB.OptionButton Option10 
            Caption         =   "Permanent"
            Height          =   255
            Left            =   2760
            TabIndex        =   38
            Top             =   240
            Value           =   -1  'True
            Width           =   1095
         End
         Begin VB.OptionButton Option9 
            Caption         =   "Temporary"
            Height          =   255
            Left            =   1440
            TabIndex        =   37
            Top             =   240
            Width           =   1095
         End
         Begin VB.OptionButton Option8 
            Caption         =   "Internship"
            Height          =   255
            Left            =   240
            TabIndex        =   36
            Top             =   240
            Width           =   1095
         End
      End
      Begin VB.Frame Frame8 
         Height          =   5415
         Left            =   -74880
         TabIndex        =   128
         Top             =   720
         Width           =   9135
         Begin VB.ComboBox Combo4 
            ForeColor       =   &H00C00000&
            Height          =   315
            Left            =   1800
            TabIndex        =   30
            Text            =   "Combo4"
            Top             =   1740
            Width           =   4335
         End
         Begin VB.ComboBox Combo3 
            ForeColor       =   &H00C00000&
            Height          =   315
            Left            =   1800
            TabIndex        =   29
            Text            =   "Combo3"
            Top             =   1380
            Width           =   4335
         End
         Begin VB.ComboBox Combo2 
            ForeColor       =   &H00C00000&
            Height          =   315
            Left            =   1800
            TabIndex        =   28
            Text            =   "Combo2"
            Top             =   1020
            Width           =   4335
         End
         Begin VB.TextBox Text5 
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   6
            Left            =   1800
            MaxLength       =   20
            TabIndex        =   35
            Text            =   "Text5"
            Top             =   3540
            Width           =   2535
         End
         Begin VB.TextBox Text5 
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   5
            Left            =   1800
            MaxLength       =   20
            TabIndex        =   34
            Text            =   "Text5"
            Top             =   3180
            Width           =   2535
         End
         Begin VB.TextBox Text5 
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   4
            Left            =   1800
            MaxLength       =   50
            TabIndex        =   33
            Text            =   "Text5"
            Top             =   2820
            Width           =   4335
         End
         Begin VB.TextBox Text5 
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   3
            Left            =   1800
            MaxLength       =   20
            TabIndex        =   32
            Text            =   "Text5"
            Top             =   2460
            Width           =   2535
         End
         Begin VB.TextBox Text5 
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   2
            Left            =   1800
            MaxLength       =   5
            TabIndex        =   31
            Text            =   "Text5"
            Top             =   2100
            Width           =   1095
         End
         Begin VB.TextBox Text5 
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   1
            Left            =   1800
            MaxLength       =   30
            TabIndex        =   27
            Text            =   "Text5"
            Top             =   660
            Width           =   4335
         End
         Begin VB.TextBox Text5 
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   0
            Left            =   1800
            MaxLength       =   30
            TabIndex        =   26
            Text            =   "Text5"
            Top             =   300
            Width           =   4335
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Contact :"
            Height          =   255
            Index           =   16
            Left            =   240
            TabIndex        =   137
            Top             =   3600
            Width           =   1335
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Emergency :"
            Height          =   255
            Index           =   15
            Left            =   240
            TabIndex        =   136
            Top             =   3240
            Width           =   1335
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Email :"
            Height          =   255
            Index           =   14
            Left            =   240
            TabIndex        =   135
            Top             =   2880
            Width           =   1335
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Telephone :"
            Height          =   255
            Index           =   13
            Left            =   240
            TabIndex        =   134
            Top             =   2520
            Width           =   1335
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Postal Code :"
            Height          =   255
            Index           =   12
            Left            =   240
            TabIndex        =   133
            Top             =   2160
            Width           =   1335
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Province :"
            Height          =   255
            Index           =   11
            Left            =   240
            TabIndex        =   132
            Top             =   1800
            Width           =   1335
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Amphur :"
            Height          =   255
            Index           =   10
            Left            =   240
            TabIndex        =   131
            Top             =   1440
            Width           =   1335
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Tumbon :"
            Height          =   255
            Index           =   9
            Left            =   240
            TabIndex        =   130
            Top             =   1080
            Width           =   1335
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Address :"
            Height          =   255
            Index           =   8
            Left            =   240
            TabIndex        =   129
            Top             =   360
            Width           =   1335
         End
      End
      Begin VB.TextBox Text4 
         ForeColor       =   &H00C00000&
         Height          =   315
         Index           =   3
         Left            =   6240
         MaxLength       =   30
         TabIndex        =   22
         Text            =   "Text4"
         Top             =   5100
         Width           =   2895
      End
      Begin VB.TextBox Text4 
         ForeColor       =   &H00C00000&
         Height          =   315
         Index           =   2
         Left            =   6240
         MaxLength       =   20
         TabIndex        =   21
         Text            =   "Text4"
         Top             =   4740
         Width           =   2895
      End
      Begin VB.ComboBox Combo1 
         ForeColor       =   &H00C00000&
         Height          =   315
         Index           =   1
         ItemData        =   "EmployeeDetail.frx":057C
         Left            =   6240
         List            =   "EmployeeDetail.frx":0589
         TabIndex        =   20
         Text            =   "Combo1"
         Top             =   4380
         Width           =   2895
      End
      Begin VB.Frame Frame5 
         Caption         =   "Brought Social Welfare"
         Height          =   615
         Index           =   5
         Left            =   4560
         TabIndex        =   124
         Top             =   5520
         Width           =   2055
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   5
            Left            =   120
            MaxLength       =   20
            TabIndex        =   25
            Text            =   "Text3"
            Top             =   180
            Width           =   1815
         End
      End
      Begin VB.Frame Frame5 
         Caption         =   "Brought Tax"
         Height          =   615
         Index           =   4
         Left            =   2400
         TabIndex        =   123
         Top             =   5520
         Width           =   2055
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   4
            Left            =   120
            MaxLength       =   20
            TabIndex        =   24
            Text            =   "Text3"
            Top             =   180
            Width           =   1815
         End
      End
      Begin VB.TextBox Text4 
         ForeColor       =   &H00C00000&
         Height          =   315
         Index           =   1
         Left            =   1680
         MaxLength       =   30
         TabIndex        =   19
         Text            =   "Text4"
         Top             =   5100
         Width           =   2895
      End
      Begin VB.TextBox Text4 
         ForeColor       =   &H00C00000&
         Height          =   315
         Index           =   0
         Left            =   1680
         MaxLength       =   20
         TabIndex        =   18
         Text            =   "Text4"
         Top             =   4740
         Width           =   2895
      End
      Begin VB.ComboBox Combo1 
         ForeColor       =   &H00C00000&
         Height          =   315
         Index           =   0
         ItemData        =   "EmployeeDetail.frx":059D
         Left            =   1680
         List            =   "EmployeeDetail.frx":05AA
         TabIndex        =   17
         Text            =   "Combo1"
         Top             =   4380
         Width           =   2895
      End
      Begin VB.Frame Frame5 
         Caption         =   "Brought Incomes"
         Height          =   615
         Index           =   3
         Left            =   240
         TabIndex        =   122
         Top             =   5520
         Width           =   2055
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   3
            Left            =   120
            MaxLength       =   20
            TabIndex        =   23
            Text            =   "Text3"
            Top             =   180
            Width           =   1815
         End
      End
      Begin VB.Frame Frame7 
         Caption         =   "TaxID"
         Height          =   615
         Index           =   1
         Left            =   7080
         TabIndex        =   118
         Top             =   3720
         Width           =   2055
         Begin MSMask.MaskEdBox MaskEdBox1 
            Height          =   315
            Index           =   1
            Left            =   120
            TabIndex        =   16
            Top             =   180
            Width           =   1815
            _ExtentX        =   3201
            _ExtentY        =   556
            _Version        =   393216
            ForeColor       =   12582912
            MaxLength       =   10
            Mask            =   "##########"
            PromptChar      =   "_"
         End
      End
      Begin VB.Frame Frame7 
         Caption         =   "CitizenID"
         Height          =   615
         Index           =   0
         Left            =   4920
         TabIndex        =   117
         Top             =   3720
         Width           =   2055
         Begin MSMask.MaskEdBox MaskEdBox1 
            Height          =   315
            Index           =   0
            Left            =   120
            TabIndex        =   15
            Top             =   180
            Width           =   1815
            _ExtentX        =   3201
            _ExtentY        =   556
            _Version        =   393216
            ForeColor       =   12582912
            MaxLength       =   17
            Mask            =   "#-####-#####-##-#"
            PromptChar      =   "_"
         End
      End
      Begin VB.Frame Frame6 
         Caption         =   "Birth Date"
         Height          =   615
         Left            =   2760
         TabIndex        =   116
         Top             =   3720
         Width           =   2055
         Begin MSComCtl2.DTPicker DTPicker1 
            Height          =   315
            Left            =   120
            TabIndex        =   14
            Top             =   180
            Width           =   1815
            _ExtentX        =   3201
            _ExtentY        =   556
            _Version        =   393216
            Format          =   19726337
            CurrentDate     =   37642
         End
      End
      Begin VB.Frame Frame5 
         Caption         =   "Other Tax Deduction"
         Height          =   615
         Index           =   2
         Left            =   7080
         TabIndex        =   115
         Top             =   3080
         Width           =   2055
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   2
            Left            =   120
            MaxLength       =   20
            TabIndex        =   13
            Text            =   "Text3"
            Top             =   180
            Width           =   1815
         End
      End
      Begin VB.Frame Frame5 
         Caption         =   "Children Study"
         Height          =   615
         Index           =   1
         Left            =   4920
         TabIndex        =   114
         Top             =   3080
         Width           =   2055
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   1
            Left            =   120
            MaxLength       =   20
            TabIndex        =   12
            Text            =   "Text3"
            Top             =   180
            Width           =   1815
         End
      End
      Begin VB.Frame Frame5 
         Caption         =   "Children Not Study"
         Height          =   615
         Index           =   0
         Left            =   2760
         TabIndex        =   113
         Top             =   3080
         Width           =   2055
         Begin VB.TextBox Text3 
            Alignment       =   1  'Right Justify
            ForeColor       =   &H00C00000&
            Height          =   315
            Index           =   0
            Left            =   120
            MaxLength       =   20
            TabIndex        =   11
            Text            =   "Text3"
            Top             =   180
            Width           =   1815
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "Spouse Information"
         Height          =   1095
         Left            =   2760
         TabIndex        =   111
         Top             =   1960
         Width           =   6375
         Begin VB.CheckBox Check2 
            Caption         =   "Has Marriage Certificate"
            Height          =   255
            Left            =   2400
            TabIndex        =   10
            Top             =   720
            Width           =   3015
         End
         Begin VB.CheckBox Check1 
            Caption         =   "Spouse Has Incomes"
            Height          =   255
            Left            =   240
            TabIndex        =   9
            Top             =   720
            Width           =   1935
         End
         Begin VB.TextBox Text2 
            ForeColor       =   &H00C00000&
            Height          =   315
            Left            =   1560
            MaxLength       =   50
            TabIndex        =   8
            Text            =   "Text2"
            Top             =   300
            Width           =   4575
         End
         Begin VB.Label Label3 
            BackStyle       =   0  'Transparent
            Caption         =   "Spouse Name :"
            Height          =   255
            Index           =   1
            Left            =   240
            TabIndex        =   112
            Top             =   360
            Width           =   1335
         End
      End
      Begin VB.Frame Frame3 
         Caption         =   "Marital Status"
         Height          =   600
         Left            =   2760
         TabIndex        =   110
         Top             =   1340
         Width           =   6375
         Begin VB.OptionButton Option7 
            Caption         =   "Separated"
            Height          =   255
            Left            =   5040
            TabIndex        =   7
            Top             =   240
            Width           =   1095
         End
         Begin VB.OptionButton Option6 
            Caption         =   "Widow"
            Height          =   255
            Left            =   3840
            TabIndex        =   6
            Top             =   240
            Width           =   1095
         End
         Begin VB.OptionButton Option5 
            Caption         =   "Divorced"
            Height          =   255
            Left            =   2640
            TabIndex        =   5
            Top             =   240
            Width           =   1095
         End
         Begin VB.OptionButton Option4 
            Caption         =   "Married"
            Height          =   255
            Left            =   1440
            TabIndex        =   4
            Top             =   240
            Width           =   1095
         End
         Begin VB.OptionButton Option3 
            Caption         =   "Single"
            Height          =   255
            Left            =   240
            TabIndex        =   3
            Top             =   240
            Value           =   -1  'True
            Width           =   1095
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Sex"
         Height          =   615
         Left            =   6240
         TabIndex        =   109
         Top             =   720
         Width           =   2895
         Begin VB.OptionButton Option2 
            Caption         =   "Female"
            Height          =   255
            Left            =   1560
            TabIndex        =   2
            Top             =   240
            Width           =   1215
         End
         Begin VB.OptionButton Option1 
            Caption         =   "Male"
            Height          =   255
            Left            =   360
            TabIndex        =   1
            Top             =   240
            Value           =   -1  'True
            Width           =   1095
         End
      End
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   315
         Left            =   4080
         MaxLength       =   10
         TabIndex        =   0
         Text            =   "Text1"
         Top             =   900
         Width           =   1575
      End
      Begin VB.Frame Frame1 
         Caption         =   "Photo"
         Height          =   3615
         Left            =   240
         TabIndex        =   107
         Top             =   720
         Width           =   2415
         Begin VB.CommandButton Command17 
            Caption         =   "&Export"
            Height          =   375
            Left            =   1560
            TabIndex        =   171
            Top             =   3120
            Width           =   735
         End
         Begin VB.CommandButton Command16 
            Caption         =   "&Clear"
            Height          =   375
            Left            =   840
            TabIndex        =   172
            Top             =   3120
            Width           =   735
         End
         Begin VB.CommandButton Command15 
            Caption         =   "&Import"
            Height          =   375
            Left            =   120
            TabIndex        =   170
            Top             =   3120
            Width           =   735
         End
         Begin VB.Image Image1 
            Height          =   2775
            Left            =   120
            Stretch         =   -1  'True
            Top             =   240
            Width           =   2175
         End
      End
      Begin VB.Frame Frame15 
         Caption         =   "Bank Branch"
         Height          =   615
         Left            =   -74760
         TabIndex        =   146
         Top             =   3300
         Width           =   5175
         Begin VB.ComboBox BankBrCb 
            ForeColor       =   &H00C00000&
            Height          =   315
            Left            =   120
            TabIndex        =   58
            Text            =   "Combo1"
            Top             =   180
            Width           =   4575
         End
         Begin VB.CommandButton Command3 
            Height          =   315
            Left            =   4680
            Picture         =   "EmployeeDetail.frx":05C0
            Style           =   1  'Graphical
            TabIndex        =   59
            Top             =   180
            Width           =   375
         End
      End
      Begin VB.Frame Frame16 
         Caption         =   "Bank Account"
         Height          =   615
         Left            =   -69480
         TabIndex        =   147
         Top             =   3300
         Width           =   1575
         Begin MSMask.MaskEdBox MaskEdBox1 
            Height          =   315
            Index           =   2
            Left            =   120
            TabIndex        =   60
            Top             =   180
            Width           =   1335
            _ExtentX        =   2355
            _ExtentY        =   556
            _Version        =   393216
            ForeColor       =   12582912
            MaxLength       =   13
            Mask            =   "###-#-#####-#"
            PromptChar      =   "_"
         End
      End
      Begin VB.Frame Frame17 
         Caption         =   "Department"
         Height          =   615
         Left            =   -74760
         TabIndex        =   148
         Top             =   3900
         Width           =   5175
         Begin VB.CommandButton Command4 
            Height          =   315
            Left            =   4680
            Picture         =   "EmployeeDetail.frx":06C2
            Style           =   1  'Graphical
            TabIndex        =   63
            Top             =   180
            Width           =   375
         End
         Begin VB.ComboBox DeptCb 
            ForeColor       =   &H00C00000&
            Height          =   315
            Left            =   120
            TabIndex        =   62
            Text            =   "Combo1"
            Top             =   180
            Width           =   4575
         End
      End
      Begin VB.Frame Frame18 
         Caption         =   "Position"
         Height          =   615
         Left            =   -74760
         TabIndex        =   149
         Top             =   4500
         Width           =   5175
         Begin VB.ComboBox PosCb 
            ForeColor       =   &H00C00000&
            Height          =   315
            Left            =   120
            TabIndex        =   66
            Text            =   "Combo1"
            Top             =   180
            Width           =   4575
         End
         Begin VB.CommandButton Command5 
            Height          =   315
            Left            =   4680
            Picture         =   "EmployeeDetail.frx":07C4
            Style           =   1  'Graphical
            TabIndex        =   67
            Top             =   180
            Width           =   375
         End
      End
      Begin VB.Frame Frame19 
         Caption         =   "Branch"
         Height          =   615
         Left            =   -67800
         TabIndex        =   150
         Top             =   3300
         Width           =   1935
         Begin VB.ComboBox BrCb 
            ForeColor       =   &H00C00000&
            Height          =   315
            Left            =   120
            TabIndex        =   61
            Text            =   "Combo1"
            Top             =   180
            Width           =   1695
         End
      End
      Begin VB.Frame Frame20 
         Caption         =   "Working Time"
         Height          =   615
         Left            =   -69480
         TabIndex        =   151
         Top             =   3900
         Width           =   3615
         Begin VB.ComboBox WtCb 
            ForeColor       =   &H00C00000&
            Height          =   315
            Left            =   120
            TabIndex        =   64
            Text            =   "Combo1"
            Top             =   180
            Width           =   3015
         End
         Begin VB.CommandButton Command6 
            Height          =   315
            Left            =   3120
            Picture         =   "EmployeeDetail.frx":08C6
            Style           =   1  'Graphical
            TabIndex        =   65
            Top             =   180
            Width           =   375
         End
      End
      Begin VB.Frame Frame21 
         Caption         =   "Default Job Code"
         Height          =   615
         Left            =   -69480
         TabIndex        =   152
         Top             =   4500
         Width           =   3615
         Begin VB.CommandButton Command7 
            Height          =   315
            Left            =   3120
            Picture         =   "EmployeeDetail.frx":09C8
            Style           =   1  'Graphical
            TabIndex        =   69
            Top             =   180
            Width           =   375
         End
         Begin VB.ComboBox JobCb 
            ForeColor       =   &H00C00000&
            Height          =   315
            Left            =   120
            TabIndex        =   68
            Text            =   "Combo1"
            Top             =   180
            Width           =   3015
         End
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid1 
         Height          =   4695
         Left            =   -74760
         TabIndex        =   73
         ToolTipText     =   "Double Click to modify detail..."
         Top             =   840
         Width           =   8895
         _ExtentX        =   15690
         _ExtentY        =   8281
         _Version        =   393216
         FixedCols       =   0
         AllowBigSelection=   0   'False
         SelectionMode   =   1
         AllowUserResizing=   1
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid MSHFlexGrid2 
         Height          =   4695
         Left            =   -74760
         TabIndex        =   77
         ToolTipText     =   "Double Click to modify detail..."
         Top             =   840
         Width           =   8895
         _ExtentX        =   15690
         _ExtentY        =   8281
         _Version        =   393216
         FixedCols       =   0
         AllowBigSelection=   0   'False
         SelectionMode   =   1
         AllowUserResizing=   1
         _NumberOfBands  =   1
         _Band(0).Cols   =   2
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "EN_LastName :"
         Height          =   255
         Index           =   7
         Left            =   4800
         TabIndex        =   127
         Top             =   5160
         Width           =   1335
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "EN_FirstName :"
         Height          =   255
         Index           =   6
         Left            =   4800
         TabIndex        =   126
         Top             =   4800
         Width           =   1335
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "EN_Title :"
         Height          =   255
         Index           =   5
         Left            =   4800
         TabIndex        =   125
         Top             =   4440
         Width           =   1335
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "TH_LastName :"
         Height          =   255
         Index           =   4
         Left            =   240
         TabIndex        =   121
         Top             =   5160
         Width           =   1335
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "TH_FirstName :"
         Height          =   255
         Index           =   3
         Left            =   240
         TabIndex        =   120
         Top             =   4800
         Width           =   1335
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "TH_Title :"
         Height          =   255
         Index           =   2
         Left            =   240
         TabIndex        =   119
         Top             =   4440
         Width           =   1335
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Employee ID :"
         Height          =   255
         Index           =   0
         Left            =   2760
         TabIndex        =   108
         Top             =   960
         Width           =   1335
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   8520
      TabIndex        =   100
      Top             =   6720
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   7200
      TabIndex        =   99
      Top             =   6720
      Width           =   1215
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   101
      Top             =   7305
      Width           =   9975
      _ExtentX        =   17595
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   14993
            MinWidth        =   14993
         EndProperty
      EndProperty
   End
   Begin MSComDlg.CommonDialog CommonDialog2 
      Left            =   6720
      Top             =   6840
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
      DefaultExt      =   "bmp"
      DialogTitle     =   "Export Image File"
      FileName        =   "employee.bmp"
      Filter          =   "Image Files (*.jpg; *.gif; *.bmp)| *.jpg;*.gif;*.bmp;"
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Created by :"
      Height          =   255
      Index           =   5
      Left            =   240
      TabIndex        =   105
      Top             =   6720
      Width           =   1455
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Last Modified by :"
      Height          =   255
      Index           =   6
      Left            =   240
      TabIndex        =   104
      Top             =   6960
      Width           =   1455
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Label2"
      ForeColor       =   &H00C00000&
      Height          =   255
      Index           =   0
      Left            =   1800
      TabIndex        =   103
      Top             =   6720
      Width           =   4935
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Label2"
      ForeColor       =   &H00C00000&
      Height          =   255
      Index           =   1
      Left            =   1800
      TabIndex        =   102
      Top             =   6960
      Width           =   4935
   End
End
Attribute VB_Name = "EmployeeDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private frmStatus As FormState
Private frmCaller As Object
Private OldCode As String
Private incRec As Long
Private dedRec As Long
Private ViewFlag As Boolean

Public Property Get Caller() As Object
   Set Caller = frmCaller
End Property

Public Property Set Caller(NewValue As Object)
   Set frmCaller = NewValue
End Property

Private Sub ClrScr()
Dim i As Long

ViewFlag = False

'Tab General
Text1.Text = ""
Text2.Text = ""
For i = 0 To 5
    Text3(i).Text = ""
Next i
For i = 0 To 3
    Text4(i).Text = ""
Next i
Option1.Value = True
Option3.Value = True
Check1.Value = Unchecked
Check2.Value = Unchecked
DTPicker1.Value = DateFilter(Now)
MaskEdBox1(0).Text = "_-____-_____-__-_"
MaskEdBox1(1).Text = "__________"
Combo1(0).Text = "นาย"
Combo1(1).Text = "Mr."
Image1.Picture = LoadPicture()

'Tab Address
For i = 0 To 6
    Text5(i).Text = ""
Next i
Combo2.Clear
Combo3.Clear
Combo4.Clear

'Tab Employment
Option10.Value = True
Option15(0).Value = True
Option16(4).Value = True
Option17(0).Value = True
DTPicker2(0).Value = DateFilter(Now)
DTPicker2(1).Value = DTPicker2(0).MaxDate
Text6.Text = ""
Text3(6).Text = ""
MaskEdBox1(2).Text = "___-_-_____-_"
LoadBankBrCb
LoadBrCb
LoadDeptCb
LoadWtCb
LoadPosCb
LoadJobCb
Check3.Value = Checked
Check4.Value = Unchecked
Check5.Value = Checked

'Tab Incomes
'LoadMSHFlexGrid1
MSHFlexGrid1Clear

'Tab Deduction
'LoadMSHFlexGrid2
MSHFlexGrid2Clear

'Tab Leave
For i = 7 To 18
    Text3(i).Text = ""
Next i
GetLeaveParameters

For i = 0 To 2
    Text7(i).Text = ""
Next i

For i = 0 To 1
    Text8(i).Text = ""
Next i


Label2(0).Caption = ""
Label2(1).Caption = ""

SSTab1.Tab = 0

End Sub

Private Sub BankBrCb_Change()
    BankBrCb_Click
End Sub

Private Sub BankBrCb_Click()

    MK$ = Mid(BankBrCb.Text, 4, 3)
    MK$ = MK$ + String(3 - Len(MK$), "_") + "-_-_____-_"

    MaskEdBox1(2).Text = MK$

End Sub

Private Sub Check2_Click()

TitleGenerate

End Sub

Private Sub Combo2_DropDown()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(0) As Variant

On Error GoTo ErrHandler

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_employee_address_lookup_tumbon"

tPr(0) = Combo2.Text + "%"

Set tRs = tCmd.Execute(, tPr)

Combo2.Clear
Do While Not tRs.EOF
    Combo2.AddItem tRs("Tumbon")
    tRs.MoveNext
Loop

Set tRs = Nothing
Set tCmd = Nothing

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Combo3_DropDown()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(0) As Variant

On Error GoTo ErrHandler

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_employee_address_lookup_amphur"

tPr(0) = Combo3.Text + "%"

Set tRs = tCmd.Execute(, tPr)

Combo3.Clear
Do While Not tRs.EOF
    Combo3.AddItem tRs("Amphur")
    tRs.MoveNext
Loop

Set tRs = Nothing
Set tCmd = Nothing

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Combo4_DropDown()
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(0) As Variant

On Error GoTo ErrHandler

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_employee_address_lookup_province"

tPr(0) = Combo4.Text + "%"

Set tRs = tCmd.Execute(, tPr)

Combo4.Clear
Do While Not tRs.EOF
    Combo4.AddItem tRs("Province")
    tRs.MoveNext
Loop

Set tRs = Nothing
Set tCmd = Nothing

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Command1_Click()
Dim aCmd As New ADODB.Command
Dim aRs As New ADODB.Recordset
Dim aPr(31) As New ADODB.Parameter
Dim bCmd As New ADODB.Command
Dim bRs As New ADODB.Recordset
Dim bPr(24) As New ADODB.Parameter
Dim cCmd As New ADODB.Command
Dim cRs As New ADODB.Recordset
Dim cPr(18) As New ADODB.Parameter
Dim dCmd As New ADODB.Command
Dim dRs As New ADODB.Recordset
Dim dPr(8) As New ADODB.Parameter
Dim eCmd As New ADODB.Command
Dim eRs As New ADODB.Recordset
Dim ePr(8) As New ADODB.Parameter
Dim rCmd As New ADODB.Command
Dim rRs As New ADODB.Recordset
Dim rPr(31) As New ADODB.Parameter
Dim sCmd As New ADODB.Command
Dim sRs As New ADODB.Recordset
Dim sPr(2) As New ADODB.Parameter
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(2) As New ADODB.Parameter
Dim i As Long
Dim j As Long
Dim s As Long

For i = 0 To BankBrCb.ListCount - 1
    If BankBrCb.Text = BankBrCb.List(i) Then
        GoTo FoundBankBrCb
    End If
Next i

MsgBox "Invalid Bank Branch...", vbCritical + vbOKOnly
Exit Sub
FoundBankBrCb:

For i = 0 To BrCb.ListCount - 1
    If BrCb.Text = BrCb.List(i) Then
        GoTo FoundBrCb
    End If
Next i

MsgBox "Invalid Bank Branch...", vbCritical + vbOKOnly
Exit Sub
FoundBrCb:

For i = 0 To DeptCb.ListCount - 1
    If DeptCb.Text = DeptCb.List(i) Then
        GoTo FoundDeptCb
    End If
Next i

MsgBox "Invalid Bank Branch...", vbCritical + vbOKOnly
Exit Sub
FoundDeptCb:

For i = 0 To WtCb.ListCount - 1
    If WtCb.Text = WtCb.List(i) Then
        GoTo FoundwtCb
    End If
Next i

MsgBox "Invalid Bank Branch...", vbCritical + vbOKOnly
Exit Sub
FoundwtCb:

For i = 0 To PosCb.ListCount - 1
    If PosCb.Text = PosCb.List(i) Then
        GoTo FoundPosCb
    End If
Next i

MsgBox "Invalid Bank Branch...", vbCritical + vbOKOnly
Exit Sub
FoundPosCb:

For i = 0 To JobCb.ListCount - 1
    If JobCb.Text = JobCb.List(i) Then
        GoTo FoundJobCb
    End If
Next i

MsgBox "Invalid Bank Branch...", vbCritical + vbOKOnly
Exit Sub
FoundJobCb:

On Error GoTo ErrHandler

If Text7(0).Text = "" Then Text7(0).Text = " "
If Text7(1).Text = "" Then Text7(1).Text = " "
If Text7(2).Text = "" Then Text7(2).Text = " "
If Text8(0).Text = "" Then Text8(0).Text = " "
If Text8(1).Text = "" Then Text8(1).Text = " "

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn

Select Case frmStatus
    Case Is = FormState.Create

        Set aCmd.ActiveConnection = sConn
        aCmd.CommandType = adCmdStoredProc
        aCmd.CommandText = "hrm_employee_insert"

        Set aPr(0) = aCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set aPr(1) = aCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
        Set aPr(2) = aCmd.CreateParameter("TH_Title", adVarChar, adParamInput, 10)
        Set aPr(3) = aCmd.CreateParameter("TH_FirstName", adVarChar, adParamInput, 20)
        Set aPr(4) = aCmd.CreateParameter("TH_LastName", adVarChar, adParamInput, 30)
        Set aPr(5) = aCmd.CreateParameter("EN_Title", adVarChar, adParamInput, 10)
        Set aPr(6) = aCmd.CreateParameter("EN_FirstName", adVarChar, adParamInput, 20)
        Set aPr(7) = aCmd.CreateParameter("EN_LastName", adVarChar, adParamInput, 30)
        Set aPr(8) = aCmd.CreateParameter("CitizenID", adVarChar, adParamInput, 17)
        Set aPr(9) = aCmd.CreateParameter("TaxID", adVarChar, adParamInput, 10)
        Set aPr(10) = aCmd.CreateParameter("Sex", adChar, adParamInput, 1)
        Set aPr(11) = aCmd.CreateParameter("BirthDate", adDBTimeStamp, adParamInput, 8)
        Set aPr(12) = aCmd.CreateParameter("Address1", adVarChar, adParamInput, 30)
        Set aPr(13) = aCmd.CreateParameter("Address2", adVarChar, adParamInput, 30)
        Set aPr(14) = aCmd.CreateParameter("Tumbon", adVarChar, adParamInput, 20)
        Set aPr(15) = aCmd.CreateParameter("Amphur", adVarChar, adParamInput, 20)
        Set aPr(16) = aCmd.CreateParameter("Province", adVarChar, adParamInput, 20)
        Set aPr(17) = aCmd.CreateParameter("PostalCode", adVarChar, adParamInput, 5)
        Set aPr(18) = aCmd.CreateParameter("Telephone", adVarChar, adParamInput, 20)
        Set aPr(19) = aCmd.CreateParameter("Email", adVarChar, adParamInput, 50)
        Set aPr(20) = aCmd.CreateParameter("Spouse", adVarChar, adParamInput, 50)
        Set aPr(21) = aCmd.CreateParameter("Emergency", adVarChar, adParamInput, 20)
        Set aPr(22) = aCmd.CreateParameter("Contact", adVarChar, adParamInput, 20)
        Set aPr(23) = aCmd.CreateParameter("EducationRecord", adLongVarChar, adParamInput, Len(Text7(1).Text))
        Set aPr(24) = aCmd.CreateParameter("EmploymentRecord", adLongVarChar, adParamInput, Len(Text7(0).Text))
        Set aPr(25) = aCmd.CreateParameter("Goals", adLongVarChar, adParamInput, Len(Text8(0).Text))
        Set aPr(26) = aCmd.CreateParameter("Achievements", adLongVarChar, adParamInput, Len(Text8(1).Text))
        Set aPr(27) = aCmd.CreateParameter("Notes", adLongVarChar, adParamInput, Len(Text7(2).Text))
        Set aPr(28) = aCmd.CreateParameter("LabelPrint", adBoolean, adParamInput, 1)
        Set aPr(29) = aCmd.CreateParameter("DefaultJobCode", adVarChar, adParamInput, 10)
        Set aPr(30) = aCmd.CreateParameter("Photo", adLongVarBinary, adParamInput)
        Set aPr(31) = aCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)

        aPr(0).Value = CurCmp
        aPr(1).Value = Text1.Text
        aPr(2).Value = Left(Combo1(0).Text, 10)
        aPr(3).Value = Text4(0).Text
        aPr(4).Value = Text4(1).Text
        aPr(5).Value = Left(Combo1(1).Text, 10)
        aPr(6).Value = Text4(2).Text
        aPr(7).Value = Text4(3).Text
        aPr(8).Value = MaskEdBox1(0).Text
        aPr(9).Value = MaskEdBox1(1).Text
        
        If Option1.Value = True Then aPr(10).Value = "M"
        If Option2.Value = True Then aPr(10).Value = "F"
        
        aPr(11).Value = DateFilter(DTPicker1.Value)
        aPr(12).Value = Text5(0).Text
        aPr(13).Value = Text5(1).Text
        aPr(14).Value = Left(Combo2.Text, 20)
        aPr(15).Value = Left(Combo3.Text, 20)
        aPr(16).Value = Left(Combo4.Text, 20)
        aPr(17).Value = Text5(2).Text
        aPr(18).Value = Text5(3).Text
        aPr(19).Value = Text5(4).Text
        aPr(20).Value = Text2.Text
        aPr(21).Value = Text5(5).Text
        aPr(22).Value = Text5(6).Text
        
        aPr(23).Value = Text7(1).Text
        aPr(24).Value = Text7(0).Text
        aPr(25).Value = Text8(0).Text
        aPr(26).Value = Text8(1).Text
        aPr(27).Value = Text7(2).Text
        
        If Check5.Value = Checked Then aPr(28).Value = True
        If Check5.Value = Unchecked Then aPr(28).Value = False
        
        aPr(29).Value = Trim(Left(JobCb.Text, 10))
        SavePictureToParam aPr(30), Image1, s
        aPr(30).Size = s
        
        aPr(31).Value = CurUser

        For i = 0 To 31
            aCmd.Parameters.Append aPr(i)
        Next i
        
        Set aRs = aCmd.Execute
        
        Set bCmd.ActiveConnection = sConn
        bCmd.CommandType = adCmdStoredProc
        bCmd.CommandText = "hrm_employee_annual_history_insert"

        Set bPr(0) = bCmd.CreateParameter("dYear", adInteger, adParamInput, 4)
        Set bPr(1) = bCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set bPr(2) = bCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
        Set bPr(3) = bCmd.CreateParameter("MaritalStatus", adChar, adParamInput, 1)
        Set bPr(4) = bCmd.CreateParameter("HaveMarriageCert", adBoolean, adParamInput, 1)
        Set bPr(5) = bCmd.CreateParameter("SpouseHasIncome", adBoolean, adParamInput, 1)
        Set bPr(6) = bCmd.CreateParameter("ChildNotStudy", adTinyInt, adParamInput, 1)
        Set bPr(7) = bCmd.CreateParameter("ChildStudy", adTinyInt, adParamInput, 1)
        Set bPr(8) = bCmd.CreateParameter("OtherDeduction", adCurrency, adParamInput, 8)
        Set bPr(9) = bCmd.CreateParameter("BroughtIncomes", adCurrency, adParamInput, 8)
        Set bPr(10) = bCmd.CreateParameter("BroughtTax", adCurrency, adParamInput, 8)
        Set bPr(11) = bCmd.CreateParameter("BroughtSocWelfare", adCurrency, adParamInput, 8)
        Set bPr(12) = bCmd.CreateParameter("LV1BeginBalance", adCurrency, adParamInput, 8)
        Set bPr(13) = bCmd.CreateParameter("LV1EarnPerPeriod", adCurrency, adParamInput, 8)
        Set bPr(14) = bCmd.CreateParameter("LV1MaxBalance", adCurrency, adParamInput, 8)
        Set bPr(15) = bCmd.CreateParameter("LV1MaxCarryOver", adCurrency, adParamInput, 8)
        Set bPr(16) = bCmd.CreateParameter("LV2BeginBalance", adCurrency, adParamInput, 8)
        Set bPr(17) = bCmd.CreateParameter("LV2EarnPerPeriod", adCurrency, adParamInput, 8)
        Set bPr(18) = bCmd.CreateParameter("LV2MaxBalance", adCurrency, adParamInput, 8)
        Set bPr(19) = bCmd.CreateParameter("LV2MaxCarryOver", adCurrency, adParamInput, 8)
        Set bPr(20) = bCmd.CreateParameter("LV3BeginBalance", adCurrency, adParamInput, 8)
        Set bPr(21) = bCmd.CreateParameter("LV3EarnPerPeriod", adCurrency, adParamInput, 8)
        Set bPr(22) = bCmd.CreateParameter("LV3MaxBalance", adCurrency, adParamInput, 8)
        Set bPr(23) = bCmd.CreateParameter("LV3MaxCarryOver", adCurrency, adParamInput, 8)
        Set bPr(24) = bCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)

        bPr(0).Value = CurDyr
        bPr(1).Value = CurCmp
        bPr(2).Value = Text1.Text
        
        If Option3.Value = True Then bPr(3).Value = "S"
        If Option4.Value = True Then bPr(3).Value = "M"
        If Option5.Value = True Then bPr(3).Value = "D"
        If Option6.Value = True Then bPr(3).Value = "W"
        If Option7.Value = True Then bPr(3).Value = "P"
        
        If Check2.Value = Checked Then bPr(4).Value = True
        If Check2.Value = Unchecked Then bPr(4).Value = False
        
        If Check1.Value = Checked Then bPr(5).Value = True
        If Check1.Value = Unchecked Then bPr(5).Value = False
           
        bPr(6).Value = CFC(Text3(0).Text)
        bPr(7).Value = CFC(Text3(1).Text)
        bPr(8).Value = CFC(Text3(2).Text)
        bPr(9).Value = CFC(Text3(3).Text)
        bPr(10).Value = CFC(Text3(4).Text)
        bPr(11).Value = CFC(Text3(5).Text)
        bPr(12).Value = CFC(Text3(7).Text)
        bPr(13).Value = CFC(Text3(8).Text)
        bPr(14).Value = CFC(Text3(9).Text)
        bPr(15).Value = CFC(Text3(10).Text)
        bPr(16).Value = CFC(Text3(14).Text)
        bPr(17).Value = CFC(Text3(13).Text)
        bPr(18).Value = CFC(Text3(12).Text)
        bPr(19).Value = CFC(Text3(11).Text)
        bPr(20).Value = CFC(Text3(18).Text)
        bPr(21).Value = CFC(Text3(17).Text)
        bPr(22).Value = CFC(Text3(16).Text)
        bPr(23).Value = CFC(Text3(15).Text)
        bPr(24).Value = CurUser

        For i = 0 To 24
            bCmd.Parameters.Append bPr(i)
        Next i
        
        Set bRs = bCmd.Execute
        
        Set cCmd.ActiveConnection = sConn
        cCmd.CommandType = adCmdStoredProc
        cCmd.CommandText = "hrm_employee_work_history_insert"

        Set cPr(0) = cCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set cPr(1) = cCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
        Set cPr(2) = cCmd.CreateParameter("WorkStatus", adChar, adParamInput, 1)
        Set cPr(3) = cCmd.CreateParameter("Reason", adVarChar, adParamInput, 50)
        Set cPr(4) = cCmd.CreateParameter("TaxMethod", adChar, adParamInput, 1)
        Set cPr(5) = bCmd.CreateParameter("TaxRate", adCurrency, adParamInput, 8)
        Set cPr(6) = cCmd.CreateParameter("PaymentType", adChar, adParamInput, 1)
        Set cPr(7) = cCmd.CreateParameter("PayFrequency", adChar, adParamInput, 1)
        Set cPr(8) = cCmd.CreateParameter("BankBrID", adVarChar, adParamInput, 8)
        Set cPr(9) = cCmd.CreateParameter("BankAccount", adVarChar, adParamInput, 15)
        Set cPr(10) = cCmd.CreateParameter("PositionCode", adVarChar, adParamInput, 10)
        Set cPr(11) = cCmd.CreateParameter("DepartmentCode", adVarChar, adParamInput, 6)
        Set cPr(12) = cCmd.CreateParameter("BranchCode", adVarChar, adParamInput, 5)
        Set cPr(13) = cCmd.CreateParameter("SWCalculate", adBoolean, adParamInput, 1)
        Set cPr(14) = cCmd.CreateParameter("PFCalculate", adBoolean, adParamInput, 1)
        Set cPr(15) = cCmd.CreateParameter("wtCode", adVarChar, adParamInput, 3)
        Set cPr(16) = cCmd.CreateParameter("JoinedDate", adDBTimeStamp, adParamInput, 8)
        Set cPr(17) = cCmd.CreateParameter("TerminatedDate", adDBTimeStamp, adParamInput, 8)
        Set cPr(18) = cCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)

        cPr(0).Value = CurCmp
        cPr(1).Value = Text1.Text
        
        If Option8.Value = True Then cPr(2).Value = "I"
        If Option9.Value = True Then cPr(2).Value = "P"
        If Option10.Value = True Then cPr(2).Value = "W"
        If Option11.Value = True Then cPr(2).Value = "L"
        If Option12.Value = True Then cPr(2).Value = "H"
        If Option13.Value = True Then cPr(2).Value = "T"
        If Option14.Value = True Then cPr(2).Value = "D"
        
        cPr(3).Value = Text6.Text
        
        If Option15(0).Value = True Then cPr(4).Value = "P"
        If Option15(1).Value = True Then cPr(4).Value = "F"
        If Option15(2).Value = True Then cPr(4).Value = "M"
        If Option15(3).Value = True Then cPr(4).Value = "A"
        
        cPr(5).Value = CFC(Text3(6).Text)
        
        If Option16(0).Value = True Then cPr(6).Value = "C"
        If Option16(1).Value = True Then cPr(6).Value = "Q"
        If Option16(2).Value = True Then cPr(6).Value = "D"
        If Option16(3).Value = True Then cPr(6).Value = "T"
        If Option16(4).Value = True Then cPr(6).Value = "P"
        
        If Option17(0).Value = True Then cPr(7).Value = "W"
        If Option17(1).Value = True Then cPr(7).Value = "B"
        If Option17(2).Value = True Then cPr(7).Value = "M"
        
        cPr(8).Value = Trim(Left(BankBrCb.Text, 8))
        cPr(9).Value = MaskEdBox1(2).Text
        
        cPr(10).Value = Trim(Left(PosCb.Text, 10))
        cPr(11).Value = Trim(Left(DeptCb.Text, 6))
        cPr(12).Value = Trim(Left(BrCb.Text, 5))
        
        If Check3.Value = Checked Then cPr(13).Value = True
        If Check3.Value = Unchecked Then cPr(13).Value = False
        
        If Check4.Value = Checked Then cPr(14).Value = True
        If Check4.Value = Unchecked Then cPr(14).Value = False
        
        cPr(15).Value = Trim(Left(WtCb.Text, 3))
        cPr(16).Value = DateFilter(DTPicker2(0).Value)
        cPr(17).Value = DateFilter(DTPicker2(1).Value)
        cPr(18).Value = CurUser

        For i = 0 To 18
            cCmd.Parameters.Append cPr(i)
        Next i
        
        Set cRs = cCmd.Execute
        
        For j = 1 To incRec
        
            Set dCmd.ActiveConnection = sConn
            dCmd.CommandType = adCmdStoredProc
            dCmd.CommandText = "hrm_employee_default_incomes_insert"
            
            For i = 0 To dCmd.Parameters.Count - 1
                dCmd.Parameters.Delete 0
            Next i
            
            Set dPr(0) = dCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
            Set dPr(1) = dCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
            Set dPr(2) = dCmd.CreateParameter("IncomesCode", adVarChar, adParamInput, 8)
            Set dPr(3) = dCmd.CreateParameter("CalMethod", adChar, adParamInput, 1)
            Set dPr(4) = dCmd.CreateParameter("Rate", adCurrency, adParamInput, 8)
            Set dPr(5) = dCmd.CreateParameter("dIncomesCode", adVarChar, adParamInput, 8)
            Set dPr(6) = dCmd.CreateParameter("dRatio", adCurrency, adParamInput, 8)
            Set dPr(7) = dCmd.CreateParameter("dPlus", adCurrency, adParamInput, 8)
            Set dPr(8) = dCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)
            
            dPr(0).Value = CurCmp
            dPr(1).Value = Text1.Text
            dPr(2).Value = MSHFlexGrid1.TextMatrix(j, 0)
            dPr(3).Value = Left(MSHFlexGrid1.TextMatrix(j, 2), 1)
            
            If MSHFlexGrid1.TextMatrix(j, 4) = "" Then
                dPr(4).Value = CFC(MSHFlexGrid1.TextMatrix(j, 3))
                dPr(5).Value = Null
                dPr(6).Value = Null
                dPr(7).Value = Null
            Else
                dPr(4).Value = Null
                dPr(5).Value = Trim(Left(MSHFlexGrid1.TextMatrix(j, 4), 8))
                dPr(6).Value = CFC(MSHFlexGrid1.TextMatrix(j, 5))
                dPr(7).Value = CFC(MSHFlexGrid1.TextMatrix(j, 6))
            End If
            
            dPr(8).Value = CurUser
            
            For i = 0 To 8
                dCmd.Parameters.Append dPr(i)
            Next i
            
            Set dRs = dCmd.Execute
        
        Next j
        
        For j = 1 To dedRec
        
            Set eCmd.ActiveConnection = sConn
            eCmd.CommandType = adCmdStoredProc
            eCmd.CommandText = "hrm_employee_default_deduction_insert"
            
            For i = 0 To eCmd.Parameters.Count - 1
                eCmd.Parameters.Delete 0
            Next i
            
            Set ePr(0) = eCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
            Set ePr(1) = eCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
            Set ePr(2) = eCmd.CreateParameter("DeductionCode", adVarChar, adParamInput, 8)
            Set ePr(3) = eCmd.CreateParameter("CalMethod", adChar, adParamInput, 1)
            Set ePr(4) = eCmd.CreateParameter("Rate", adCurrency, adParamInput, 8)
            Set ePr(5) = eCmd.CreateParameter("dDeductionCode", adVarChar, adParamInput, 8)
            Set ePr(6) = eCmd.CreateParameter("dRatio", adCurrency, adParamInput, 8)
            Set ePr(7) = eCmd.CreateParameter("dPlus", adCurrency, adParamInput, 8)
            Set ePr(8) = eCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)
            
            ePr(0).Value = CurCmp
            ePr(1).Value = Text1.Text
            ePr(2).Value = MSHFlexGrid2.TextMatrix(j, 0)
            ePr(3).Value = Left(MSHFlexGrid2.TextMatrix(j, 2), 1)
            
            If MSHFlexGrid2.TextMatrix(j, 4) = "" Then
                ePr(4).Value = CFC(MSHFlexGrid2.TextMatrix(j, 3))
                ePr(5).Value = Null
                ePr(6).Value = Null
                ePr(7).Value = Null
            Else
                ePr(4).Value = Null
                ePr(5).Value = Trim(Left(MSHFlexGrid2.TextMatrix(j, 4), 8))
                ePr(6).Value = CFC(MSHFlexGrid2.TextMatrix(j, 5))
                ePr(7).Value = CFC(MSHFlexGrid2.TextMatrix(j, 6))
            End If
            
            ePr(8).Value = CurUser
            
            For i = 0 To 8
                eCmd.Parameters.Append ePr(i)
            Next i
            
            Set eRs = eCmd.Execute
        
        Next j
        
        Set aRs = Nothing
        Set aCmd = Nothing
        Set bRs = Nothing
        Set bCmd = Nothing
        Set cRs = Nothing
        Set cCmd = Nothing
        Set dRs = Nothing
        Set dCmd = Nothing
        Set eRs = Nothing
        Set eCmd = Nothing
        
    Case Is = FormState.Modify
    
        Set rCmd.ActiveConnection = sConn
        rCmd.CommandType = adCmdStoredProc
        rCmd.CommandText = "hrm_employee_update"

        Set rPr(0) = rCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set rPr(1) = rCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
        Set rPr(2) = rCmd.CreateParameter("TH_Title", adVarChar, adParamInput, 10)
        Set rPr(3) = rCmd.CreateParameter("TH_FirstName", adVarChar, adParamInput, 20)
        Set rPr(4) = rCmd.CreateParameter("TH_LastName", adVarChar, adParamInput, 30)
        Set rPr(5) = rCmd.CreateParameter("EN_Title", adVarChar, adParamInput, 10)
        Set rPr(6) = rCmd.CreateParameter("EN_FirstName", adVarChar, adParamInput, 20)
        Set rPr(7) = rCmd.CreateParameter("EN_LastName", adVarChar, adParamInput, 30)
        Set rPr(8) = rCmd.CreateParameter("CitizenID", adVarChar, adParamInput, 17)
        Set rPr(9) = rCmd.CreateParameter("TaxID", adVarChar, adParamInput, 10)
        Set rPr(10) = rCmd.CreateParameter("Sex", adChar, adParamInput, 1)
        Set rPr(11) = rCmd.CreateParameter("BirthDate", adDBTimeStamp, adParamInput, 8)
        Set rPr(12) = rCmd.CreateParameter("Address1", adVarChar, adParamInput, 30)
        Set rPr(13) = rCmd.CreateParameter("Address2", adVarChar, adParamInput, 30)
        Set rPr(14) = rCmd.CreateParameter("Tumbon", adVarChar, adParamInput, 20)
        Set rPr(15) = rCmd.CreateParameter("Amphur", adVarChar, adParamInput, 20)
        Set rPr(16) = rCmd.CreateParameter("Province", adVarChar, adParamInput, 20)
        Set rPr(17) = rCmd.CreateParameter("PostalCode", adVarChar, adParamInput, 5)
        Set rPr(18) = rCmd.CreateParameter("Telephone", adVarChar, adParamInput, 20)
        Set rPr(19) = rCmd.CreateParameter("Email", adVarChar, adParamInput, 50)
        Set rPr(20) = rCmd.CreateParameter("Spouse", adVarChar, adParamInput, 50)
        Set rPr(21) = rCmd.CreateParameter("Emergency", adVarChar, adParamInput, 20)
        Set rPr(22) = rCmd.CreateParameter("Contact", adVarChar, adParamInput, 20)
        Set rPr(23) = rCmd.CreateParameter("EducationRecord", adLongVarChar, adParamInput, Len(Text7(1).Text))
        Set rPr(24) = rCmd.CreateParameter("EmploymentRecord", adLongVarChar, adParamInput, Len(Text7(0).Text))
        Set rPr(25) = rCmd.CreateParameter("Goals", adLongVarChar, adParamInput, Len(Text8(0).Text))
        Set rPr(26) = rCmd.CreateParameter("Achievements", adLongVarChar, adParamInput, Len(Text8(1).Text))
        Set rPr(27) = rCmd.CreateParameter("Notes", adLongVarChar, adParamInput, Len(Text7(2).Text))
        Set rPr(28) = rCmd.CreateParameter("LabelPrint", adBoolean, adParamInput, 1)
        Set rPr(29) = rCmd.CreateParameter("DefaultJobCode", adVarChar, adParamInput, 10)
        Set rPr(30) = rCmd.CreateParameter("Photo", adLongVarBinary, adParamInput)
        Set rPr(31) = rCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)

        rPr(0).Value = CurCmp
        rPr(1).Value = Text1.Text
        rPr(2).Value = Left(Combo1(0).Text, 10)
        rPr(3).Value = Text4(0).Text
        rPr(4).Value = Text4(1).Text
        rPr(5).Value = Left(Combo1(1).Text, 10)
        rPr(6).Value = Text4(2).Text
        rPr(7).Value = Text4(3).Text
        rPr(8).Value = MaskEdBox1(0).Text
        rPr(9).Value = MaskEdBox1(1).Text
        
        If Option1.Value = True Then rPr(10).Value = "M"
        If Option2.Value = True Then rPr(10).Value = "F"
        
        rPr(11).Value = DateFilter(DTPicker1.Value)
        rPr(12).Value = Text5(0).Text
        rPr(13).Value = Text5(1).Text
        rPr(14).Value = Left(Combo2.Text, 20)
        rPr(15).Value = Left(Combo3.Text, 20)
        rPr(16).Value = Left(Combo4.Text, 20)
        rPr(17).Value = Text5(2).Text
        rPr(18).Value = Text5(3).Text
        rPr(19).Value = Text5(4).Text
        rPr(20).Value = Text2.Text
        rPr(21).Value = Text5(5).Text
        rPr(22).Value = Text5(6).Text
        
        rPr(23).Value = Text7(1).Text
        rPr(24).Value = Text7(0).Text
        rPr(25).Value = Text8(0).Text
        rPr(26).Value = Text8(1).Text
        rPr(27).Value = Text7(2).Text
        
        If Check5.Value = Checked Then rPr(28).Value = True
        If Check5.Value = Unchecked Then rPr(28).Value = False
        
        rPr(29).Value = Trim(Left(JobCb.Text, 10))
        SavePictureToParam rPr(30), Image1, s
        rPr(30).Size = s
        rPr(31).Value = CurUser

        For i = 0 To 31
            rCmd.Parameters.Append rPr(i)
        Next i
        
        Set rRs = rCmd.Execute

        Set bCmd.ActiveConnection = sConn
        bCmd.CommandType = adCmdStoredProc
        bCmd.CommandText = "hrm_employee_annual_history_insert"

        Set bPr(0) = bCmd.CreateParameter("dYear", adInteger, adParamInput, 4)
        Set bPr(1) = bCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set bPr(2) = bCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
        Set bPr(3) = bCmd.CreateParameter("MaritalStatus", adChar, adParamInput, 1)
        Set bPr(4) = bCmd.CreateParameter("HaveMarriageCert", adBoolean, adParamInput, 1)
        Set bPr(5) = bCmd.CreateParameter("SpouseHasIncome", adBoolean, adParamInput, 1)
        Set bPr(6) = bCmd.CreateParameter("ChildNotStudy", adTinyInt, adParamInput, 1)
        Set bPr(7) = bCmd.CreateParameter("ChildStudy", adTinyInt, adParamInput, 1)
        Set bPr(8) = bCmd.CreateParameter("OtherDeduction", adCurrency, adParamInput, 8)
        Set bPr(9) = bCmd.CreateParameter("BroughtIncomes", adCurrency, adParamInput, 8)
        Set bPr(10) = bCmd.CreateParameter("BroughtTax", adCurrency, adParamInput, 8)
        Set bPr(11) = bCmd.CreateParameter("BroughtSocWelfare", adCurrency, adParamInput, 8)
        Set bPr(12) = bCmd.CreateParameter("LV1BeginBalance", adCurrency, adParamInput, 8)
        Set bPr(13) = bCmd.CreateParameter("LV1EarnPerPeriod", adCurrency, adParamInput, 8)
        Set bPr(14) = bCmd.CreateParameter("LV1MaxBalance", adCurrency, adParamInput, 8)
        Set bPr(15) = bCmd.CreateParameter("LV1MaxCarryOver", adCurrency, adParamInput, 8)
        Set bPr(16) = bCmd.CreateParameter("LV2BeginBalance", adCurrency, adParamInput, 8)
        Set bPr(17) = bCmd.CreateParameter("LV2EarnPerPeriod", adCurrency, adParamInput, 8)
        Set bPr(18) = bCmd.CreateParameter("LV2MaxBalance", adCurrency, adParamInput, 8)
        Set bPr(19) = bCmd.CreateParameter("LV2MaxCarryOver", adCurrency, adParamInput, 8)
        Set bPr(20) = bCmd.CreateParameter("LV3BeginBalance", adCurrency, adParamInput, 8)
        Set bPr(21) = bCmd.CreateParameter("LV3EarnPerPeriod", adCurrency, adParamInput, 8)
        Set bPr(22) = bCmd.CreateParameter("LV3MaxBalance", adCurrency, adParamInput, 8)
        Set bPr(23) = bCmd.CreateParameter("LV3MaxCarryOver", adCurrency, adParamInput, 8)
        Set bPr(24) = bCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)

        bPr(0).Value = CurDyr
        bPr(1).Value = CurCmp
        bPr(2).Value = Text1.Text
        
        If Option3.Value = True Then bPr(3).Value = "S"
        If Option4.Value = True Then bPr(3).Value = "M"
        If Option5.Value = True Then bPr(3).Value = "D"
        If Option6.Value = True Then bPr(3).Value = "W"
        If Option7.Value = True Then bPr(3).Value = "P"
        
        If Check2.Value = Checked Then bPr(4).Value = True
        If Check2.Value = Unchecked Then bPr(4).Value = False
        
        If Check1.Value = Checked Then bPr(5).Value = True
        If Check1.Value = Unchecked Then bPr(5).Value = False
           
        bPr(6).Value = CFC(Text3(0).Text)
        bPr(7).Value = CFC(Text3(1).Text)
        bPr(8).Value = CFC(Text3(2).Text)
        bPr(9).Value = CFC(Text3(3).Text)
        bPr(10).Value = CFC(Text3(4).Text)
        bPr(11).Value = CFC(Text3(5).Text)
        bPr(12).Value = CFC(Text3(7).Text)
        bPr(13).Value = CFC(Text3(8).Text)
        bPr(14).Value = CFC(Text3(9).Text)
        bPr(15).Value = CFC(Text3(10).Text)
        bPr(16).Value = CFC(Text3(14).Text)
        bPr(17).Value = CFC(Text3(13).Text)
        bPr(18).Value = CFC(Text3(12).Text)
        bPr(19).Value = CFC(Text3(11).Text)
        bPr(20).Value = CFC(Text3(18).Text)
        bPr(21).Value = CFC(Text3(17).Text)
        bPr(22).Value = CFC(Text3(16).Text)
        bPr(23).Value = CFC(Text3(15).Text)
        bPr(24).Value = CurUser

        For i = 0 To 24
            bCmd.Parameters.Append bPr(i)
        Next i
        
        Set bRs = bCmd.Execute
        
        Set cCmd.ActiveConnection = sConn
        cCmd.CommandType = adCmdStoredProc
        cCmd.CommandText = "hrm_employee_work_history_insert"

        Set cPr(0) = cCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set cPr(1) = cCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
        Set cPr(2) = cCmd.CreateParameter("WorkStatus", adChar, adParamInput, 1)
        Set cPr(3) = cCmd.CreateParameter("Reason", adVarChar, adParamInput, 50)
        Set cPr(4) = cCmd.CreateParameter("TaxMethod", adChar, adParamInput, 1)
        Set cPr(5) = bCmd.CreateParameter("TaxRate", adCurrency, adParamInput, 8)
        Set cPr(6) = cCmd.CreateParameter("PaymentType", adChar, adParamInput, 1)
        Set cPr(7) = cCmd.CreateParameter("PayFrequency", adChar, adParamInput, 1)
        Set cPr(8) = cCmd.CreateParameter("BankBrID", adVarChar, adParamInput, 8)
        Set cPr(9) = cCmd.CreateParameter("BankAccount", adVarChar, adParamInput, 15)
        Set cPr(10) = cCmd.CreateParameter("PositionCode", adVarChar, adParamInput, 10)
        Set cPr(11) = cCmd.CreateParameter("DepartmentCode", adVarChar, adParamInput, 6)
        Set cPr(12) = cCmd.CreateParameter("BranchCode", adVarChar, adParamInput, 5)
        Set cPr(13) = cCmd.CreateParameter("SWCalculate", adBoolean, adParamInput, 1)
        Set cPr(14) = cCmd.CreateParameter("PFCalculate", adBoolean, adParamInput, 1)
        Set cPr(15) = cCmd.CreateParameter("wtCode", adVarChar, adParamInput, 3)
        Set cPr(16) = cCmd.CreateParameter("JoinedDate", adDBTimeStamp, adParamInput, 8)
        Set cPr(17) = cCmd.CreateParameter("TerminatedDate", adDBTimeStamp, adParamInput, 8)
        Set cPr(18) = cCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)

        cPr(0).Value = CurCmp
        cPr(1).Value = Text1.Text
        
        If Option8.Value = True Then cPr(2).Value = "I"
        If Option9.Value = True Then cPr(2).Value = "P"
        If Option10.Value = True Then cPr(2).Value = "W"
        If Option11.Value = True Then cPr(2).Value = "L"
        If Option12.Value = True Then cPr(2).Value = "H"
        If Option13.Value = True Then cPr(2).Value = "T"
        If Option14.Value = True Then cPr(2).Value = "D"
        
        cPr(3).Value = Text6.Text
        
        If Option15(0).Value = True Then cPr(4).Value = "P"
        If Option15(1).Value = True Then cPr(4).Value = "F"
        If Option15(2).Value = True Then cPr(4).Value = "M"
        If Option15(3).Value = True Then cPr(4).Value = "A"
        
        cPr(5).Value = CFC(Text3(6).Text)
        
        If Option16(0).Value = True Then cPr(6).Value = "C"
        If Option16(1).Value = True Then cPr(6).Value = "Q"
        If Option16(2).Value = True Then cPr(6).Value = "D"
        If Option16(3).Value = True Then cPr(6).Value = "T"
        If Option16(4).Value = True Then cPr(6).Value = "P"
        
        If Option17(0).Value = True Then cPr(7).Value = "W"
        If Option17(1).Value = True Then cPr(7).Value = "B"
        If Option17(2).Value = True Then cPr(7).Value = "M"
        
        cPr(8).Value = Trim(Left(BankBrCb.Text, 8))
        cPr(9).Value = MaskEdBox1(2).Text
        
        cPr(10).Value = Trim(Left(PosCb.Text, 10))
        cPr(11).Value = Trim(Left(DeptCb.Text, 6))
        cPr(12).Value = Trim(Left(BrCb.Text, 5))
        
        If Check3.Value = Checked Then cPr(13).Value = True
        If Check3.Value = Unchecked Then cPr(13).Value = False
        
        If Check4.Value = Checked Then cPr(14).Value = True
        If Check4.Value = Unchecked Then cPr(14).Value = False
        
        cPr(15).Value = Trim(Left(WtCb.Text, 3))
        cPr(16).Value = DateFilter(DTPicker2(0).Value)
        cPr(17).Value = DateFilter(DTPicker2(1).Value)
        cPr(18).Value = CurUser

        For i = 0 To 18
            cCmd.Parameters.Append cPr(i)
        Next i
        
        Set cRs = cCmd.Execute

        Set sCmd.ActiveConnection = sConn
        sCmd.CommandType = adCmdStoredProc
        sCmd.CommandText = "hrm_employee_default_incomes_make_expired"

        Set sPr(0) = sCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set sPr(1) = sCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
        Set sPr(2) = sCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10)

        sPr(0).Value = CurCmp
        sPr(1).Value = Text1.Text
        sPr(2).Value = CurUser

        For i = 0 To 2
            sCmd.Parameters.Append sPr(i)
        Next i
        
        Set sRs = sCmd.Execute

        For j = 1 To incRec
        
            Set dCmd.ActiveConnection = sConn
            dCmd.CommandType = adCmdStoredProc
            dCmd.CommandText = "hrm_employee_default_incomes_insert"
            
            For i = 0 To dCmd.Parameters.Count - 1
                dCmd.Parameters.Delete 0
            Next i
            
            Set dPr(0) = dCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
            Set dPr(1) = dCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
            Set dPr(2) = dCmd.CreateParameter("IncomesCode", adVarChar, adParamInput, 8)
            Set dPr(3) = dCmd.CreateParameter("CalMethod", adChar, adParamInput, 1)
            Set dPr(4) = dCmd.CreateParameter("Rate", adCurrency, adParamInput, 8)
            Set dPr(5) = dCmd.CreateParameter("dIncomesCode", adVarChar, adParamInput, 8)
            Set dPr(6) = dCmd.CreateParameter("dRatio", adCurrency, adParamInput, 8)
            Set dPr(7) = dCmd.CreateParameter("dPlus", adCurrency, adParamInput, 8)
            Set dPr(8) = dCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)
            
            dPr(0).Value = CurCmp
            dPr(1).Value = Text1.Text
            dPr(2).Value = MSHFlexGrid1.TextMatrix(j, 0)
            dPr(3).Value = Left(MSHFlexGrid1.TextMatrix(j, 2), 1)
            
            If MSHFlexGrid1.TextMatrix(j, 4) = "" Then
                dPr(4).Value = CFC(MSHFlexGrid1.TextMatrix(j, 3))
                dPr(5).Value = Null
                dPr(6).Value = Null
                dPr(7).Value = Null
            Else
                dPr(4).Value = Null
                dPr(5).Value = Trim(Left(MSHFlexGrid1.TextMatrix(j, 4), 8))
                dPr(6).Value = CFC(MSHFlexGrid1.TextMatrix(j, 5))
                dPr(7).Value = CFC(MSHFlexGrid1.TextMatrix(j, 6))
            End If
            
            dPr(8).Value = CurUser
            
            For i = 0 To 8
                dCmd.Parameters.Append dPr(i)
            Next i
            
            Set dRs = dCmd.Execute
        
        Next j
        
        Set tCmd.ActiveConnection = sConn
        tCmd.CommandType = adCmdStoredProc
        tCmd.CommandText = "hrm_employee_default_deduction_make_expired"

        Set tPr(0) = tCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
        Set tPr(1) = tCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
        Set tPr(2) = tCmd.CreateParameter("LastModifyUserID", adVarChar, adParamInput, 10)

        tPr(0).Value = CurCmp
        tPr(1).Value = Text1.Text
        tPr(2).Value = CurUser

        For i = 0 To 2
            tCmd.Parameters.Append tPr(i)
        Next i
        
        Set tRs = tCmd.Execute
        
        For j = 1 To dedRec
        
            Set eCmd.ActiveConnection = sConn
            eCmd.CommandType = adCmdStoredProc
            eCmd.CommandText = "hrm_employee_default_deduction_insert"
            
            For i = 0 To eCmd.Parameters.Count - 1
                eCmd.Parameters.Delete 0
            Next i
            
            Set ePr(0) = eCmd.CreateParameter("CID", adVarChar, adParamInput, 3)
            Set ePr(1) = eCmd.CreateParameter("EID", adVarChar, adParamInput, 10)
            Set ePr(2) = eCmd.CreateParameter("DeductionCode", adVarChar, adParamInput, 8)
            Set ePr(3) = eCmd.CreateParameter("CalMethod", adChar, adParamInput, 1)
            Set ePr(4) = eCmd.CreateParameter("Rate", adCurrency, adParamInput, 8)
            Set ePr(5) = eCmd.CreateParameter("dDeductionCode", adVarChar, adParamInput, 8)
            Set ePr(6) = eCmd.CreateParameter("dRatio", adCurrency, adParamInput, 8)
            Set ePr(7) = eCmd.CreateParameter("dPlus", adCurrency, adParamInput, 8)
            Set ePr(8) = eCmd.CreateParameter("CreateUserID", adVarChar, adParamInput, 10)
            
            ePr(0).Value = CurCmp
            ePr(1).Value = Text1.Text
            ePr(2).Value = MSHFlexGrid2.TextMatrix(j, 0)
            ePr(3).Value = Left(MSHFlexGrid2.TextMatrix(j, 2), 1)
            
            If MSHFlexGrid2.TextMatrix(j, 4) = "" Then
                ePr(4).Value = CFC(MSHFlexGrid2.TextMatrix(j, 3))
                ePr(5).Value = Null
                ePr(6).Value = Null
                ePr(7).Value = Null
            Else
                ePr(4).Value = Null
                ePr(5).Value = Trim(Left(MSHFlexGrid2.TextMatrix(j, 4), 8))
                ePr(6).Value = CFC(MSHFlexGrid2.TextMatrix(j, 5))
                ePr(7).Value = CFC(MSHFlexGrid2.TextMatrix(j, 6))
            End If
            
            ePr(8).Value = CurUser
            
            For i = 0 To 8
                eCmd.Parameters.Append ePr(i)
            Next i
            
            Set eRs = eCmd.Execute
        
        Next j

    Case Else
        MsgBox "Invalid Form Status...", vbCritical + vbOKOnly
End Select

Unload Me
frmCaller.Command5_Click
MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault

End Sub

Private Sub Command10_Click()

Dim frmCalled As New EmployeeDetailIncomes

If incRec = 0 Or MSHFlexGrid1.Rowsel = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.LoadCombo2
frmCalled.ModifyDetail MSHFlexGrid1.Rowsel

Me.Enabled = False

End Sub

Private Sub Command11_Click()

Co = MsgBox("Do you really want to remove this record?", vbExclamation + vbYesNo)
If Co = vbYes Then
    If RemoveIncomes(MSHFlexGrid1.Rowsel) = False Then
        MsgBox "Please choose record first/This record has dependent records...", vbExclamation + vbOKOnly
        Exit Sub
    End If
End If

End Sub

Private Sub Command12_Click()

Dim frmCalled As New EmployeeDetailDeduction
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.LoadCombo2
frmCalled.CreateDetail

Me.Enabled = False

End Sub

Private Sub Command13_Click()

Dim frmCalled As New EmployeeDetailDeduction

If incRec = 0 Or MSHFlexGrid2.Rowsel = 0 Then
    MsgBox "Please choose record first...", vbExclamation + vbOKOnly
    Exit Sub
End If

Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.LoadCombo2
frmCalled.ModifyDetail MSHFlexGrid2.Rowsel

Me.Enabled = False

End Sub

Private Sub Command14_Click()

Co = MsgBox("Do you really want to remove this record?", vbExclamation + vbYesNo)
If Co = vbYes Then
    If RemoveDeduction(MSHFlexGrid2.Rowsel) = False Then
        MsgBox "Please choose record first/This record has dependent records...", vbExclamation + vbOKOnly
        Exit Sub
    End If
End If

End Sub

Private Sub Command15_Click()

On Error GoTo ErrHandler

CommonDialog1.ShowOpen

Image1.Picture = LoadPicture(CommonDialog1.FileName)

Exit Sub
ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Command16_Click()

Image1.Picture = LoadPicture()

End Sub

Private Sub Command17_Click()

On Error GoTo ErrHandler

CommonDialog2.ShowSave

SavePicture Image1.Picture, CommonDialog2.FileName

Exit Sub
ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Command2_Click()

Unload Me

End Sub

Private Sub Command3_Click()

Dim frmCalled As New BankBranch
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

frmCalled.SelectCalled
Me.Enabled = False

End Sub

Private Sub Command4_Click()

Dim frmCalled As New Department
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

frmCalled.SelectCalled
Me.Enabled = False

End Sub

Private Sub Command5_Click()

Dim frmCalled As New Position
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

frmCalled.SelectCalled
Me.Enabled = False

End Sub

Private Sub Command6_Click()

Dim frmCalled As New WorkingTime
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

frmCalled.SelectCalled
Me.Enabled = False

End Sub

Private Sub Command7_Click()

Dim frmCalled As New Job
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

frmCalled.SelectCalled
Me.Enabled = False

End Sub

Private Sub Command8_Click()
    If Text7(2).Text = "" Then
        Text7(2).Text = "Note " + Format(Now, "dd.mm.yyyy hh:mm:ss") + " :-" + Chr(13) + Chr(10)
    Else
        Text7(2).Text = Text7(2).Text + Chr(13) + Chr(10) + "Note " + Format(Now, "dd.mm.yyyy hh:mm:ss") + " :-" + Chr(13) + Chr(10)
    End If
End Sub

Private Sub Command9_Click()

Dim frmCalled As New EmployeeDetailIncomes
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me
frmCalled.LoadCombo2
frmCalled.CreateDetail

Me.Enabled = False

End Sub

Private Sub Form_Load()

Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2

End Sub

Private Sub Form_Unload(Cancel As Integer)

If Not (frmCaller Is Nothing) Then
    frmCaller.Enabled = True
End If

End Sub

Public Sub CreateDetail()

ClrScr
FormEditable True
LoadManIncomes
LoadManDeduction
StatusBar1.SimpleText = "Create New Record..."
frmStatus = FormState.Create
Label2(0).Caption = "N/A"
Label2(1).Caption = "N/A"

End Sub

Public Sub ViewDetail(ByVal CodeParam As String)

Dim aCmd As New ADODB.Command
Dim aRs As New ADODB.Recordset
Dim aPr(1) As New ADODB.Parameter
Dim bCmd As New ADODB.Command
Dim bRs As New ADODB.Recordset
Dim bPr(2) As New ADODB.Parameter
Dim cCmd As New ADODB.Command
Dim cRs As New ADODB.Recordset
Dim cPr(2) As New ADODB.Parameter
Dim dCmd As New ADODB.Command
Dim dRs As New ADODB.Recordset
Dim dPr(2) As New ADODB.Parameter
Dim eCmd As New ADODB.Command
Dim eRs As New ADODB.Recordset
Dim ePr(2) As New ADODB.Parameter
Dim i As Long
Dim j As Long

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

ClrScr

ViewFlag = True
FormEditable False

StatusBar1.SimpleText = "View Record Detail..."
frmStatus = FormState.View

Frame1.Enabled = False
Command1.Enabled = False

Set aCmd.ActiveConnection = sConn

aCmd.CommandType = adCmdStoredProc
aCmd.CommandText = "hrm_employee_select"

Set aPr(0) = aCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set aPr(1) = aCmd.CreateParameter("EID", adVarChar, adParamInput, 10, CodeParam)

For i = 0 To 1
    aCmd.Parameters.Append aPr(i)
Next i

Set aRs = aCmd.Execute


Text1.Text = aRs("EID")
Combo1(0).Text = aRs("TH_Title")
Text4(0).Text = aRs("TH_FirstName")
Text4(1).Text = aRs("TH_LastName")
Combo1(1).Text = aRs("EN_Title")
Text4(2).Text = aRs("EN_FirstName")
Text4(3).Text = aRs("EN_LastName")
MaskEdBox1(0).Text = aRs("CitizenID")
MaskEdBox1(1).Text = aRs("TaxID")
        
Select Case aRs("Sex")
    Case Is = "M"
        Option1.Value = True
    Case Is = "F"
        Option2.Value = True
End Select

DTPicker1.Value = aRs("BirthDate")
Text5(0).Text = aRs("Address1")
Text5(1).Text = aRs("Address2")
Combo2.Text = aRs("Tumbon")
Combo3.Text = aRs("Amphur")
Combo4.Text = aRs("Province")
Text5(2).Text = aRs("PostalCode")
Text5(3).Text = aRs("Telephone")
Text5(4).Text = aRs("Email")
Text2.Text = aRs("Spouse")
Text5(5).Text = aRs("Emergency")
Text5(6).Text = aRs("Contact")
Text7(1).Text = aRs("EducationRecord")
Text7(0).Text = aRs("EmploymentRecord")
Text8(0).Text = aRs("Goals")
Text8(1).Text = aRs("Achievements")
Text7(2).Text = aRs("Notes")

Select Case aRs("LabelPrint")
    Case Is = True
        Check5.Value = Checked
    Case Is = False
        Check5.Value = Unchecked
End Select

JobCbSelect aRs("DefaultJobCode")
        
LoadPictureFromDB aRs, "Photo", Image1

If IsNull(aRs("CreateUserID")) Or IsNull(aRs("CreateDateTime")) Then
    Label2(0).Caption = "N/A"
Else
    Label2(0).Caption = Trim(aRs("CreateUserID")) + " :: " + Format(aRs("CreateDateTime"), "Long Date") + " " + Format(aRs("CreateDateTime"), "Long Time")
End If
If IsNull(aRs("LastModifyUserID")) Or IsNull(aRs("LastModifyDateTime")) Then
    Label2(1).Caption = "N/A"
Else
    Label2(1).Caption = Trim(aRs("LastModifyUserID")) + " :: " + Format(aRs("LastModifyDateTime"), "Long Date") + " " + Format(aRs("LastModifyDateTime"), "Long Time")
End If

Set bCmd.ActiveConnection = sConn

bCmd.CommandType = adCmdStoredProc
bCmd.CommandText = "hrm_employee_annual_history_select"

Set bPr(0) = bCmd.CreateParameter("dYear", adInteger, adParamInput, 4, CurDyr)
Set bPr(1) = bCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set bPr(2) = bCmd.CreateParameter("EID", adVarChar, adParamInput, 10, CodeParam)

For i = 0 To 2
    bCmd.Parameters.Append bPr(i)
Next i

Set bRs = bCmd.Execute

Select Case bRs("MaritalStatus")
    Case Is = "S"
        Option3.Value = True
    Case Is = "M"
        Option4.Value = True
    Case Is = "D"
        Option5.Value = True
    Case Is = "W"
        Option6.Value = True
    Case Is = "S"
        Option7.Value = True
End Select

Select Case bRs("HaveMarriageCert")
    Case Is = True
        Check2.Value = Checked
    Case Is = False
        Check2.Value = Unchecked
End Select
        
Select Case bRs("SpouseHasIncome")
    Case Is = True
        Check1.Value = Checked
    Case Is = False
        Check1.Value = Unchecked
End Select
        
Text3(0).Text = Format(bRs("ChildNotStudy"), "#,##0")
Text3(1).Text = Format(bRs("ChildStudy"), "#,##0")
Text3(2).Text = Format(bRs("OtherDeduction"), "#,##0.00")
Text3(3).Text = Format(bRs("BroughtIncomes"), "#,##0.00")
Text3(4).Text = Format(bRs("BroughtTax"), "#,##0.00")
Text3(5).Text = Format(bRs("BroughtSocWelfare"), "#,##0.00")
Text3(7).Text = Format(bRs("LV1BeginBalance"), "#,##0.0000")
Text3(8).Text = Format(bRs("LV1EarnPerPeriod"), "#,##0.0000")
Text3(9).Text = Format(bRs("LV1MaxBalance"), "#,##0.0000")
Text3(10).Text = Format(bRs("LV1MaxCarryOver"), "#,##0.0000")
Text3(14).Text = Format(bRs("LV2BeginBalance"), "#,##0.0000")
Text3(13).Text = Format(bRs("LV2EarnPerPeriod"), "#,##0.0000")
Text3(12).Text = Format(bRs("LV2MaxBalance"), "#,##0.0000")
Text3(11).Text = Format(bRs("LV2MaxCarryOver"), "#,##0.0000")
Text3(18).Text = Format(bRs("LV3BeginBalance"), "#,##0.0000")
Text3(17).Text = Format(bRs("LV3EarnPerPeriod"), "#,##0.0000")
Text3(16).Text = Format(bRs("LV3MaxBalance"), "#,##0.0000")
Text3(15).Text = Format(bRs("LV3MaxCarryOver"), "#,##0.0000")

Set cCmd.ActiveConnection = sConn

cCmd.CommandType = adCmdStoredProc
cCmd.CommandText = "hrm_employee_work_history_select"

Set cPr(0) = cCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set cPr(1) = cCmd.CreateParameter("EID", adVarChar, adParamInput, 10, CodeParam)
Set cPr(2) = cCmd.CreateParameter("DataDate", adDBTimeStamp, adParamInput, 8, Now)

For i = 0 To 2
    cCmd.Parameters.Append cPr(i)
Next i

Set cRs = cCmd.Execute

Select Case cRs("WorkStatus")
    Case Is = "I"
        Option8.Value = True
    Case Is = "P"
        Option9.Value = True
    Case Is = "W"
        Option10.Value = True
    Case Is = "L"
        Option11.Value = True
    Case Is = "H"
        Option12.Value = True
    Case Is = "T"
        Option13.Value = True
    Case Is = "D"
        Option14.Value = True
End Select

Text6.Text = cRs("Reason")
        
Select Case cRs("TaxMethod")
    Case Is = "P"
        Option15(0).Value = True
    Case Is = "F"
        Option15(1).Value = True
    Case Is = "M"
        Option15(2).Value = True
    Case Is = "A"
        Option15(3).Value = True
End Select
        
Text3(6).Text = Format(cRs("TaxRate"), "#,##0.00")
        
Select Case cRs("PaymentType")
    Case Is = "C"
        Option16(0).Value = True
    Case Is = "Q"
        Option16(1).Value = True
    Case Is = "D"
        Option16(2).Value = True
    Case Is = "T"
        Option16(3).Value = True
    Case Is = "P"
        Option16(4).Value = True
End Select
        
Select Case cRs("PayFrequency")
    Case Is = "W"
        Option17(0).Value = True
    Case Is = "B"
        Option17(1).Value = True
    Case Is = "M"
        Option17(2).Value = True
End Select
        
BankBrCbSelect cRs("BankBrID")
MaskEdBox1(2).Text = cRs("BankAccount")
        
PosCbSelect cRs("PositionCode")
DeptCbSelect cRs("DepartmentCode")
BrCbSelect cRs("BranchCode")
        
Select Case cRs("SWCalculate")
    Case Is = True
        Check3.Value = Checked
    Case Is = False
        Check3.Value = Unchecked
End Select
        
Select Case cRs("PFCalculate")
    Case Is = True
        Check4.Value = Checked
    Case Is = False
        Check4.Value = Unchecked
End Select
        
WtCbSelect cRs("wtCode")
        
DTPicker2(0).Value = cRs("JoinedDate")
DTPicker2(1).Value = cRs("TerminatedDate")

Set dCmd.ActiveConnection = sConn

dCmd.CommandType = adCmdStoredProc
dCmd.CommandText = "hrm_employee_default_incomes_select_by_EID"

Set dPr(0) = dCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set dPr(1) = dCmd.CreateParameter("EID", adVarChar, adParamInput, 10, CodeParam)
Set dPr(2) = dCmd.CreateParameter("DataDate", adDBTimeStamp, adParamInput, 8, Now)

For i = 0 To 2
    dCmd.Parameters.Append dPr(i)
Next i

Set dRs = dCmd.Execute

MSHFlexGrid1Clear

Do While Not dRs.EOF

    Inc$ = dRs("IncomesCode")
    Tit$ = dRs("EN_Title")
    Cmt$ = CalMethodTxt(dRs("CalMethod"))
    Rte$ = Format(dRs("vRate"), "#,##0.0000")
    
    If IsNull(dRs("dIncomesCode")) = False Then
        Dic$ = dRs("dIncomesCode")
    Else
        Dic$ = ""
    End If

    If IsNull(dRs("dRatio")) = False Then
        Drt$ = Format(dRs("dRatio"), "#,##0.0000")
    Else
        Drt$ = ""
    End If

    If IsNull(dRs("dPlus")) = False Then
        Dps$ = Format(dRs("dPlus"), "#,##0.00")
    Else
        Dps$ = ""
    End If

    AddIncomes Inc$, Tit$, Cmt$, Rte$, Dic$, Drt$, Dps$

    dRs.MoveNext
Loop

Set eCmd.ActiveConnection = sConn

eCmd.CommandType = adCmdStoredProc
eCmd.CommandText = "hrm_employee_default_deduction_select_by_EID"

Set ePr(0) = eCmd.CreateParameter("CID", adVarChar, adParamInput, 3, CurCmp)
Set ePr(1) = eCmd.CreateParameter("EID", adVarChar, adParamInput, 10, CodeParam)
Set ePr(2) = eCmd.CreateParameter("DataDate", adDBTimeStamp, adParamInput, 8, Now)

For i = 0 To 2
    eCmd.Parameters.Append ePr(i)
Next i

Set eRs = eCmd.Execute

MSHFlexGrid2Clear

Do While Not eRs.EOF

    Ded$ = eRs("DeductionCode")
    Tit$ = eRs("EN_Title")
    Cmt$ = CalMethodTxt(eRs("CalMethod"))
    Rte$ = Format(eRs("vRate"), "#,##0.0000")
    
    If IsNull(eRs("dDeductionCode")) = False Then
        Ddc$ = eRs("dDeductionCode")
    Else
        Ddc$ = ""
    End If

    If IsNull(eRs("dRatio")) = False Then
        Drt$ = Format(eRs("dRatio"), "#,##0.0000")
    Else
        Drt$ = ""
    End If

    If IsNull(eRs("dPlus")) = False Then
        Dps$ = Format(eRs("dPlus"), "#,##0.00")
    Else
        Dps$ = ""
    End If

    AddDeduction Ded$, Tit$, Cmt$, Rte$, Ddc$, Drt$, Dps$

    eRs.MoveNext
Loop

Set aRs = Nothing
Set aCmd = Nothing
Set bRs = Nothing
Set bCmd = Nothing
Set cRs = Nothing
Set cCmd = Nothing
Set dRs = Nothing
Set dCmd = Nothing
Set eRs = Nothing
Set eCmd = Nothing

MainMDI.MousePointer = vbDefault
ViewFlag = False

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
MainMDI.MousePointer = vbDefault
ViewFlag = False

End Sub

Public Sub ModifyDetail(ByVal CodeParam As String)

ViewDetail CodeParam
FormEditable True

OldCode = CodeParam

StatusBar1.SimpleText = "Modify Record Detail..."
frmStatus = FormState.Modify

Frame1.Enabled = True
Command1.Enabled = True

End Sub

Public Sub LoadBankBrCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_bankbranch_select_all"

Set tRs = tCmd.Execute

BankBrCb.Clear

Do While Not tRs.EOF

    BankBrCb.AddItem FillSpace(tRs("BankBrID"), 8) + " - " + tRs("EN_BankBrName")

    tRs.MoveNext
Loop

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub BankBrCbSelect(ByVal Param As String)
Dim i As Long

LoadBankBrCb

For i = 0 To BankBrCb.ListCount - 1
    If Trim(Left(BankBrCb.List(i), 8)) = Trim(Param) Then
        BankBrCb.Text = BankBrCb.List(i)
        Exit Sub
    End If
Next i

End Sub

Public Sub LoadPosCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(0) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_position_select_all"
tPr(0) = CurCmp

Set tRs = tCmd.Execute(, tPr)

PosCb.Clear

Do While Not tRs.EOF

    PosCb.AddItem FillSpace(tRs("PositionCode"), 10) + " - " + tRs("EN_PositionName")

    tRs.MoveNext
Loop

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub PosCbSelect(ByVal Param As String)
Dim i As Long

LoadPosCb

For i = 0 To PosCb.ListCount - 1
    If Trim(Left(PosCb.List(i), 10)) = Trim(Param) Then
        PosCb.Text = PosCb.List(i)
        Exit Sub
    End If
Next i

End Sub

Public Sub LoadWtCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(0) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_workingtime_select_all"
tPr(0) = CurCmp

Set tRs = tCmd.Execute(, tPr)

WtCb.Clear

Do While Not tRs.EOF

    WtCb.AddItem FillSpace(tRs("wtCode"), 3) + " - " + tRs("wtName")

    tRs.MoveNext
Loop

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub WtCbSelect(ByVal Param As String)
Dim i As Long

LoadWtCb

For i = 0 To WtCb.ListCount - 1
    If Trim(Left(WtCb.List(i), 3)) = Trim(Param) Then
        WtCb.Text = WtCb.List(i)
        Exit Sub
    End If
Next i

End Sub

Public Sub LoadJobCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(0) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_job_select_all"
tPr(0) = CurCmp

Set tRs = tCmd.Execute(, tPr)

JobCb.Clear

Do While Not tRs.EOF

    JobCb.AddItem FillSpace(tRs("JobCode"), 10) + " - " + tRs("EN_JobName")

    tRs.MoveNext
Loop

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub JobCbSelect(ByVal Param As String)
Dim i As Long

LoadJobCb

For i = 0 To JobCb.ListCount - 1
    If Trim(Left(JobCb.List(i), 10)) = Trim(Param) Then
        JobCb.Text = JobCb.List(i)
        Exit Sub
    End If
Next i

End Sub

Public Sub LoadDeptCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(0) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_department_select_all"
tPr(0) = CurCmp

Set tRs = tCmd.Execute(, tPr)

DeptCb.Clear

Do While Not tRs.EOF

    DeptCb.AddItem FillSpace(tRs("DepartmentCode"), 6) + " - " + tRs("EN_DepartmentName")

    tRs.MoveNext
Loop

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub DeptCbSelect(ByVal Param As String)
Dim i As Long

LoadDeptCb

For i = 0 To DeptCb.ListCount - 1
    If Trim(Left(DeptCb.List(i), 6)) = Trim(Param) Then
        DeptCb.Text = DeptCb.List(i)
        Exit Sub
    End If
Next i

End Sub

Public Sub LoadBrCb()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(0) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_company_branch_select_all"
tPr(0) = CurCmp

Set tRs = tCmd.Execute(, tPr)

BrCb.Clear

Do While Not tRs.EOF

    BrCb.AddItem FillSpace(tRs("BranchCode"), 5) + " - " + tRs("EN_BranchName")

    tRs.MoveNext
Loop

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub BrCbSelect(ByVal Param As String)
Dim i As Long

LoadBrCb

For i = 0 To BrCb.ListCount - 1
    If Trim(Left(BrCb.List(i), 5)) = Trim(Param) Then
        BrCb.Text = BrCb.List(i)
        Exit Sub
    End If
Next i

End Sub

Private Sub TitleGenerate()

If ViewFlag = False Then
    If Option1.Value = True Then
        Combo1(0).Text = "นาย"
        Combo1(1).Text = "Mr."
    End If

    If Option2.Value = True Then
        If Option3.Value = True Then
            Combo1(0).Text = "นางสาว"
            Combo1(1).Text = "Ms."
        Else
            Combo1(0).Text = "นาง"
            Combo1(1).Text = "Mrs."
        End If
    End If
    
    If Option4.Value = False And Check2.Value = Checked Then Check2.Value = Unchecked
    
End If

End Sub
    
Sub MSHFlexGrid1Clear()
Dim j As Long

MSHFlexGrid1.Cols = 7
MSHFlexGrid1.Clear
For j = 1 To MSHFlexGrid1.Rows - 2
 MSHFlexGrid1.RemoveItem 1
Next j

MSHFlexGrid1.TextMatrix(0, 0) = "IncomesCode"
MSHFlexGrid1.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(0) = 1500

MSHFlexGrid1.TextMatrix(0, 1) = "En_Title"
MSHFlexGrid1.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(1) = 3500

MSHFlexGrid1.TextMatrix(0, 2) = "Method"
MSHFlexGrid1.ColAlignment(2) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(2) = 2000

MSHFlexGrid1.TextMatrix(0, 3) = "Rate"
MSHFlexGrid1.ColAlignment(3) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(3) = 1200

MSHFlexGrid1.TextMatrix(0, 4) = "dIncomesCode"
MSHFlexGrid1.ColAlignment(4) = flexAlignLeftCenter
MSHFlexGrid1.ColWidth(4) = 0

MSHFlexGrid1.TextMatrix(0, 5) = "Ratio"
MSHFlexGrid1.ColAlignment(5) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(5) = 0

MSHFlexGrid1.TextMatrix(0, 6) = "Plus"
MSHFlexGrid1.ColAlignment(6) = flexAlignRightCenter
MSHFlexGrid1.ColWidth(6) = 0

incRec = 0

End Sub

Sub MSHFlexGrid2Clear()
Dim j As Long

MSHFlexGrid2.Cols = 7
MSHFlexGrid2.Clear
For j = 1 To MSHFlexGrid2.Rows - 2
 MSHFlexGrid2.RemoveItem 1
Next j

MSHFlexGrid2.TextMatrix(0, 0) = "DeductionCode"
MSHFlexGrid2.ColAlignment(0) = flexAlignLeftCenter
MSHFlexGrid2.ColWidth(0) = 1500

MSHFlexGrid2.TextMatrix(0, 1) = "En_Title"
MSHFlexGrid2.ColAlignment(1) = flexAlignLeftCenter
MSHFlexGrid2.ColWidth(1) = 3500

MSHFlexGrid2.TextMatrix(0, 2) = "Method"
MSHFlexGrid2.ColAlignment(2) = flexAlignLeftCenter
MSHFlexGrid2.ColWidth(2) = 2000

MSHFlexGrid2.TextMatrix(0, 3) = "Rate"
MSHFlexGrid2.ColAlignment(3) = flexAlignRightCenter
MSHFlexGrid2.ColWidth(3) = 1200

MSHFlexGrid2.TextMatrix(0, 4) = "dDeductionCode"
MSHFlexGrid2.ColAlignment(4) = flexAlignLeftCenter
MSHFlexGrid2.ColWidth(4) = 0

MSHFlexGrid2.TextMatrix(0, 5) = "Ratio"
MSHFlexGrid2.ColAlignment(5) = flexAlignRightCenter
MSHFlexGrid2.ColWidth(5) = 0

MSHFlexGrid2.TextMatrix(0, 6) = "Plus"
MSHFlexGrid2.ColAlignment(6) = flexAlignRightCenter
MSHFlexGrid2.ColWidth(6) = 0

dedRec = 0

End Sub

Private Sub MSHFlexGrid1_DblClick()
    If Command10.Enabled = True Then Command10_Click
End Sub

Private Sub MSHFlexGrid2_DblClick()

If Command13.Enabled = True Then Command13_Click

End Sub

Private Sub Option1_Click()

TitleGenerate

End Sub

Private Sub Option2_Click()

TitleGenerate

End Sub

Private Sub Option3_Click()

TitleGenerate

End Sub

Private Sub Option4_Click()

TitleGenerate

End Sub

Private Sub Option5_Click()

TitleGenerate

End Sub

Private Sub Option6_Click()

TitleGenerate

End Sub

Private Sub Option7_Click()

TitleGenerate

End Sub

Public Sub LoadManIncomes()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(0) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_incomes_select_mandatory"
tPr(0) = CurCmp

Set tRs = tCmd.Execute(, tPr)

Do While Not tRs.EOF

    Inc$ = tRs("IncomesCode")
    Tit$ = tRs("EN_Title")
    Cmt$ = CalMethodTxt(tRs("CalMethod"))
    Rte$ = Format(tRs("vRate"), "#,##0.0000")
    
    If IsNull(tRs("dIncomesCode")) = False Then
        Dic$ = tRs("dIncomesCode")
    Else
        Dic$ = ""
    End If

    If IsNull(tRs("dRatio")) = False Then
        Drt$ = Format(tRs("dRatio"), "#,##0.0000")
    Else
        Drt$ = ""
    End If

    If IsNull(tRs("dPlus")) = False Then
        Dps$ = Format(tRs("dPlus"), "#,##0.00")
    Else
        Dps$ = ""
    End If

    AddIncomes Inc$, Tit$, Cmt$, Rte$, Dic$, Drt$, Dps$

    tRs.MoveNext
Loop

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub LoadManDeduction()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(0) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "hrm_deduction_select_mandatory"
tPr(0) = CurCmp

Set tRs = tCmd.Execute(, tPr)

Do While Not tRs.EOF

    Ded$ = tRs("DeductionCode")
    Tit$ = tRs("EN_Title")
    Cmt$ = CalMethodTxt(tRs("CalMethod"))
    Rte$ = Format(tRs("vRate"), "#,##0.0000")
    
    If IsNull(tRs("dDeductionCode")) = False Then
        Ddc$ = tRs("dDeductionCode")
    Else
        Ddc$ = ""
    End If

    If IsNull(tRs("dRatio")) = False Then
        Drt$ = Format(tRs("dRatio"), "#,##0.0000")
    Else
        Drt$ = ""
    End If

    If IsNull(tRs("dPlus")) = False Then
        Dps$ = Format(tRs("dPlus"), "#,##0.00")
    Else
        Dps$ = ""
    End If

    AddDeduction Ded$, Tit$, Cmt$, Rte$, Ddc$, Drt$, Dps$

    tRs.MoveNext
Loop

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub GetLeaveParameters()
Dim tRs As New ADODB.Recordset
Dim tCmd As New ADODB.Command
Dim tPr(0) As Variant

On Error GoTo ErrHandler

MainMDI.MousePointer = vbHourglass

Set tCmd.ActiveConnection = sConn
tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_company_select"
tPr(0) = CurCmp

Set tRs = tCmd.Execute(, tPr)

If Not tRs.EOF Then
    Text3(7).Text = Format(tRs("LV1BB"), "#,##0.0000")
    Text3(8).Text = Format(tRs("LV1EP"), "#,##0.0000")
    Text3(9).Text = Format(tRs("LV1MB"), "#,##0.0000")
    Text3(10).Text = Format(tRs("LV1MC"), "#,##0.0000")
    Text3(14).Text = Format(tRs("LV2BB"), "#,##0.0000")
    Text3(13).Text = Format(tRs("LV2EP"), "#,##0.0000")
    Text3(12).Text = Format(tRs("LV2MB"), "#,##0.0000")
    Text3(11).Text = Format(tRs("LV2MC"), "#,##0.0000")
    Text3(18).Text = Format(tRs("LV3BB"), "#,##0.0000")
    Text3(17).Text = Format(tRs("LV3EP"), "#,##0.0000")
    Text3(16).Text = Format(tRs("LV3MB"), "#,##0.0000")
    Text3(15).Text = Format(tRs("LV3MC"), "#,##0.0000")
End If

Set sCmd = Nothing
Set sRs = Nothing

MainMDI.MousePointer = vbDefault

Exit Sub

ErrHandler:

MainMDI.MousePointer = vbDefault
MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Function IsDupIncomes(ByVal IncCode As String) As Boolean
Dim i As Long

IsDupIncomes = False

For i = 1 To MSHFlexGrid1.Rows - 1
    If MSHFlexGrid1.TextMatrix(i, 0) = IncCode Then
        IsDupIncomes = True
        Exit For
    End If
Next i

End Function

Public Function IsDupDeduction(ByVal DedCode As String) As Boolean
Dim i As Long

IsDupDeduction = False

For i = 1 To MSHFlexGrid2.Rows - 1
    If MSHFlexGrid2.TextMatrix(i, 0) = DedCode Then
        IsDupDeduction = True
        Exit For
    End If
Next i

End Function

Public Function AddIncomes(ByVal Inc As String, ByVal Tit As String, ByVal Cmt As String, ByVal Rte As String, ByVal Dic As String, ByVal Drt As String, ByVal Dps As String) As Boolean

If IsDupIncomes(Inc) = False Then

    MSHFlexGrid1.AddItem Inc + Chr(9) + Tit + Chr(9) + Cmt + Chr(9) + Rte + Chr(9) + Dic + Chr(9) + Drt$ + Chr(9) + Dps
    incRec = incRec + 1
    If incRec = 1 Then MSHFlexGrid1.RemoveItem 1
    
    AddIncomes = True
Else
    AddIncomes = False
End If

End Function

Public Function AddDeduction(ByVal Ded As String, ByVal Tit As String, ByVal Cmt As String, ByVal Rte As String, ByVal Dic As String, ByVal Drt As String, ByVal Dps As String) As Boolean

If IsDupDeduction(Ded) = False Then

    MSHFlexGrid2.AddItem Ded + Chr(9) + Tit + Chr(9) + Cmt + Chr(9) + Rte + Chr(9) + Dic + Chr(9) + Drt$ + Chr(9) + Dps
    dedRec = dedRec + 1
    If dedRec = 1 Then MSHFlexGrid2.RemoveItem 1
    
    AddDeduction = True
Else
    AddDeduction = False
End If

End Function

Public Function IsDepIncomes(ByVal IncCode As String) As Boolean
Dim i As Long

IsDepIncomes = False

For i = 1 To MSHFlexGrid1.Rows - 1
    If MSHFlexGrid1.TextMatrix(i, 4) = IncCode Then
        IsDepIncomes = True
        Exit For
    End If
Next i

End Function

Public Function IsDepDeduction(ByVal DedCode As String) As Boolean
Dim i As Long

IsDepDeduction = False

For i = 1 To MSHFlexGrid2.Rows - 1
    If MSHFlexGrid2.TextMatrix(i, 4) = DedCode Then
        IsDepDeduction = True
        Exit For
    End If
Next i

End Function

Public Function RemoveIncomes(ByVal xInc As Long) As Boolean
Dim Inc As String

If incRec = 0 Or xInc = 0 Then
    RemoveIncomes = False
Else

Inc = MSHFlexGrid1.TextMatrix(xInc, 0)

If IsDepIncomes(Inc) = False Then
    
    incRec = incRec - 1
    If incRec = 0 Then
        MSHFlexGrid1Clear
    Else
        MSHFlexGrid1.RemoveItem xInc
    End If
    
    RemoveIncomes = True
Else
    RemoveIncomes = False
End If

End If

End Function

Public Function RemoveDeduction(ByVal xDed As Long) As Boolean
Dim Ded As String

If dedRec = 0 Or xDed = 0 Then
    RemoveDeduction = False
Else

Ded = MSHFlexGrid2.TextMatrix(xDed, 0)

If IsDepDeduction(Ded) = False Then
    
    dedRec = dedRec - 1
    If dedRec = 0 Then
        MSHFlexGrid2Clear
    Else
        MSHFlexGrid2.RemoveItem xDed
    End If
    
    RemoveDeduction = True
Else
    RemoveDeduction = False
End If

End If

End Function

Public Function UpdateDepIncomes(ByVal Inc As String, ByVal newRate As Currency) As Boolean
Dim i As Long
Dim r As Currency

If incRec > 0 And IsDepIncomes(Inc) = True Then
    
    For i = 1 To MSHFlexGrid1.Rows - 1
        If MSHFlexGrid1.TextMatrix(i, 4) = Inc Then
        
        r = (newRate * CFC(MSHFlexGrid1.TextMatrix(i, 5))) + CFC(MSHFlexGrid1.TextMatrix(i, 6))
        MSHFlexGrid1.TextMatrix(i, 3) = Format(r, "#,###0.0000")
        
        End If
    Next i
    
    UpdateDepIncomes = True
Else
    UpdateDepIncomes = False
End If

End Function

Public Function UpdateDepDeduction(ByVal Ded As String, ByVal newRate As Currency) As Boolean
Dim i As Long
Dim r As Currency

If dedRec > 0 And IsDepDeduction(Ded) = True Then
    
    For i = 1 To MSHFlexGrid2.Rows - 1
        If MSHFlexGrid2.TextMatrix(i, 4) = Ded Then
        
        r = (newRate * CFC(MSHFlexGrid2.TextMatrix(i, 5))) + CFC(MSHFlexGrid2.TextMatrix(i, 6))
        MSHFlexGrid2.TextMatrix(i, 3) = Format(r, "#,###0.0000")
        
        End If
    Next i
    
    UpdateDepDeduction = True
Else
    UpdateDepDeduction = False
End If

End Function

Public Sub FormEditable(ByVal e As Boolean)

Text1.Enabled = e
Text4(0).Enabled = e
Text4(1).Enabled = e
Text4(2).Enabled = e
Text4(3).Enabled = e
Combo1(0).Enabled = e
Combo1(1).Enabled = e
Frame2.Enabled = e
Frame3.Enabled = e
Frame4.Enabled = e
Frame5(0).Enabled = e
Frame5(1).Enabled = e
Frame5(2).Enabled = e
Frame5(3).Enabled = e
Frame5(4).Enabled = e
Frame5(5).Enabled = e
Frame5(6).Enabled = e
Frame6.Enabled = e
Frame7(0).Enabled = e
Frame7(1).Enabled = e
Frame8.Enabled = e
Frame9.Enabled = e
Frame10(0).Enabled = e
Frame10(1).Enabled = e
Frame11.Enabled = e
Frame12.Enabled = e
Frame13.Enabled = e
Frame14.Enabled = e
Frame15.Enabled = e
Frame16.Enabled = e
Frame17.Enabled = e
Frame18.Enabled = e
Frame19.Enabled = e
Frame20.Enabled = e
Frame21.Enabled = e
Frame22(0).Enabled = e
Frame22(1).Enabled = e
Frame22(2).Enabled = e
Check3.Enabled = e
Check4.Enabled = e
Check5.Enabled = e
Command8.Enabled = e
Command9.Enabled = e
Command10.Enabled = e
Command11.Enabled = e
Command12.Enabled = e
Command13.Enabled = e
Command14.Enabled = e
Text7(0).Locked = Not (e)
Text7(1).Locked = Not (e)
Text7(2).Locked = Not (e)
Text8(0).Locked = Not (e)
Text8(1).Locked = Not (e)

End Sub
