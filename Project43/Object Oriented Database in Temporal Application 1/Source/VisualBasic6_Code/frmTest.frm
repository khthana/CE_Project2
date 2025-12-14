VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form Form1 
   BackColor       =   &H80000000&
   Caption         =   "ประวัตินักศึกษา"
   ClientHeight    =   6150
   ClientLeft      =   2700
   ClientTop       =   930
   ClientWidth     =   6210
   LinkTopic       =   "Form1"
   ScaleHeight     =   6150
   ScaleWidth      =   6210
   Begin VB.CommandButton cmdSdIdClear 
      Caption         =   "ล้างหน้าจอ"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   840
      TabIndex        =   2
      Top             =   5280
      Width           =   1935
   End
   Begin VB.CommandButton cmdSdIdClose 
      Caption         =   "ปิดหน้าต่าง"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   3000
      TabIndex        =   1
      Top             =   5280
      Width           =   1935
   End
   Begin TabDlg.SSTab sstabSd 
      Height          =   4815
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5895
      _ExtentX        =   10398
      _ExtentY        =   8493
      _Version        =   393216
      Style           =   1
      Tabs            =   5
      TabHeight       =   520
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TabCaption(0)   =   "ประวัติรหัสนักศึกษา"
      TabPicture(0)   =   "frmTest.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Frame1"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "txtSdId"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).ControlCount=   2
      TabCaption(1)   =   "ประวัติชื่อภาษาไทย"
      TabPicture(1)   =   "frmTest.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "Frame2"
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "ประวัตินามสกุลภาษาไทย"
      TabPicture(2)   =   "frmTest.frx":0038
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "Frame3"
      Tab(2).ControlCount=   1
      TabCaption(3)   =   "ประวัติชื่อภาษาอังกฤษ"
      TabPicture(3)   =   "frmTest.frx":0054
      Tab(3).ControlEnabled=   0   'False
      Tab(3).Control(0)=   "Frame4"
      Tab(3).ControlCount=   1
      TabCaption(4)   =   "ประวัตินามสกุลภาษาอังกฤษ"
      TabPicture(4)   =   "frmTest.frx":0070
      Tab(4).ControlEnabled=   0   'False
      Tab(4).Control(0)=   "Frame5"
      Tab(4).ControlCount=   1
      Begin VB.Frame Frame5 
         Height          =   3615
         Left            =   -74760
         TabIndex        =   47
         Top             =   840
         Width           =   5295
         Begin VB.TextBox txtSdSurNameET 
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3480
            TabIndex        =   53
            Top             =   2400
            Width           =   1335
         End
         Begin VB.TextBox txtSdSurNameEF 
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   2040
            MaxLength       =   10
            TabIndex        =   52
            Top             =   2400
            Width           =   1335
         End
         Begin VB.CommandButton cmdDelSdSurNameE 
            Caption         =   "ลบ"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3480
            TabIndex        =   51
            Top             =   3000
            Width           =   1455
         End
         Begin VB.CommandButton cmdUpdateSdSurNameE 
            Caption         =   "แก้ไข"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1920
            TabIndex        =   50
            Top             =   3000
            Width           =   1455
         End
         Begin VB.CommandButton cmdAddSdSurNameE 
            Caption         =   "เพิ่ม"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   360
            TabIndex        =   49
            Top             =   3000
            Width           =   1335
         End
         Begin VB.TextBox txtSdSurNameE 
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   240
            MaxLength       =   30
            TabIndex        =   48
            Top             =   2400
            Width           =   1575
         End
         Begin MSComctlLib.ListView lvSdSurNameE 
            Height          =   1695
            Left            =   600
            TabIndex        =   54
            Top             =   240
            Width           =   3975
            _ExtentX        =   7011
            _ExtentY        =   2990
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            FullRowSelect   =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   1
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            NumItems        =   0
         End
         Begin VB.Label Label15 
            AutoSize        =   -1  'True
            Caption         =   "นามสกุล"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   600
            TabIndex        =   57
            Top             =   2040
            Width           =   690
         End
         Begin VB.Label Label14 
            AutoSize        =   -1  'True
            Caption         =   "จากวันที่"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   2400
            TabIndex        =   56
            Top             =   2040
            Width           =   675
         End
         Begin VB.Label Label13 
            AutoSize        =   -1  'True
            Caption         =   "ถึงวันที่"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   3840
            TabIndex        =   55
            Top             =   2040
            Width           =   555
         End
      End
      Begin VB.Frame Frame4 
         Height          =   3615
         Left            =   -74760
         TabIndex        =   36
         Top             =   840
         Width           =   5295
         Begin VB.TextBox txtSdNameET 
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3480
            TabIndex        =   42
            Top             =   2400
            Width           =   1335
         End
         Begin VB.TextBox txtSdNameEF 
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   2040
            MaxLength       =   10
            TabIndex        =   41
            Top             =   2400
            Width           =   1335
         End
         Begin VB.CommandButton cmdDelSdNameE 
            Caption         =   "ลบ"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3480
            TabIndex        =   40
            Top             =   3000
            Width           =   1455
         End
         Begin VB.CommandButton cmdUpdateSdNameE 
            Caption         =   "แก้ไข"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1920
            TabIndex        =   39
            Top             =   3000
            Width           =   1455
         End
         Begin VB.CommandButton cmdAddSdNameE 
            Caption         =   "เพิ่ม"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   360
            TabIndex        =   38
            Top             =   3000
            Width           =   1335
         End
         Begin VB.TextBox txtSdNameE 
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   240
            MaxLength       =   30
            TabIndex        =   37
            Top             =   2400
            Width           =   1575
         End
         Begin MSComctlLib.ListView lvSdNameE 
            Height          =   1695
            Left            =   600
            TabIndex        =   43
            Top             =   240
            Width           =   3975
            _ExtentX        =   7011
            _ExtentY        =   2990
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            FullRowSelect   =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   1
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            NumItems        =   0
         End
         Begin VB.Label Label12 
            AutoSize        =   -1  'True
            Caption         =   "ชื่อ"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   840
            TabIndex        =   46
            Top             =   2040
            Width           =   240
         End
         Begin VB.Label Label11 
            AutoSize        =   -1  'True
            Caption         =   "จากวันที่"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   2400
            TabIndex        =   45
            Top             =   2040
            Width           =   675
         End
         Begin VB.Label Label10 
            AutoSize        =   -1  'True
            Caption         =   "ถึงวันที่"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   3840
            TabIndex        =   44
            Top             =   2040
            Width           =   555
         End
      End
      Begin VB.Frame Frame3 
         Height          =   3615
         Left            =   -74760
         TabIndex        =   25
         Top             =   840
         Width           =   5295
         Begin VB.TextBox txtSdSurnameT 
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3480
            TabIndex        =   31
            Top             =   2400
            Width           =   1335
         End
         Begin VB.TextBox txtSdSurnameF 
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   2040
            MaxLength       =   10
            TabIndex        =   30
            Top             =   2400
            Width           =   1335
         End
         Begin VB.CommandButton cmdDelSdSurname 
            Caption         =   "ลบ"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3480
            TabIndex        =   29
            Top             =   3000
            Width           =   1455
         End
         Begin VB.CommandButton cmdUpdateSdSurname 
            Caption         =   "แก้ไข"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1920
            TabIndex        =   28
            Top             =   3000
            Width           =   1455
         End
         Begin VB.CommandButton cmdAddSdSurname 
            Caption         =   "เพิ่ม"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   360
            TabIndex        =   27
            Top             =   3000
            Width           =   1335
         End
         Begin VB.TextBox txtSdSurname 
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   240
            MaxLength       =   30
            TabIndex        =   26
            Top             =   2400
            Width           =   1575
         End
         Begin MSComctlLib.ListView lvSdSurname 
            Height          =   1695
            Left            =   600
            TabIndex        =   32
            Top             =   240
            Width           =   3975
            _ExtentX        =   7011
            _ExtentY        =   2990
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            FullRowSelect   =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   1
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            NumItems        =   0
         End
         Begin VB.Label Label9 
            AutoSize        =   -1  'True
            Caption         =   "นามสกุล"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   600
            TabIndex        =   35
            Top             =   2040
            Width           =   690
         End
         Begin VB.Label Label8 
            AutoSize        =   -1  'True
            Caption         =   "จากวันที่"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   2400
            TabIndex        =   34
            Top             =   2040
            Width           =   675
         End
         Begin VB.Label Label7 
            AutoSize        =   -1  'True
            Caption         =   "ถึงวันที่"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   3840
            TabIndex        =   33
            Top             =   2040
            Width           =   555
         End
      End
      Begin VB.Frame Frame2 
         Height          =   3615
         Left            =   -74760
         TabIndex        =   14
         Top             =   840
         Width           =   5295
         Begin VB.TextBox txtSdName 
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   240
            MaxLength       =   30
            TabIndex        =   20
            Top             =   2400
            Width           =   1575
         End
         Begin VB.CommandButton cmdAddSdName 
            Caption         =   "เพิ่ม"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   360
            TabIndex        =   19
            Top             =   3000
            Width           =   1335
         End
         Begin VB.CommandButton cmdUpdateSdName 
            Caption         =   "แก้ไข"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1920
            TabIndex        =   18
            Top             =   3000
            Width           =   1455
         End
         Begin VB.CommandButton cmdDelSdName 
            Caption         =   "ลบ"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3480
            TabIndex        =   17
            Top             =   3000
            Width           =   1455
         End
         Begin VB.TextBox txtSdNameF 
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   2040
            MaxLength       =   10
            TabIndex        =   16
            Top             =   2400
            Width           =   1335
         End
         Begin VB.TextBox txtSdNameT 
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3480
            TabIndex        =   15
            Top             =   2400
            Width           =   1335
         End
         Begin MSComctlLib.ListView lvSdName 
            Height          =   1695
            Left            =   600
            TabIndex        =   21
            Top             =   240
            Width           =   3975
            _ExtentX        =   7011
            _ExtentY        =   2990
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            FullRowSelect   =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   1
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            NumItems        =   0
         End
         Begin VB.Label Label6 
            AutoSize        =   -1  'True
            Caption         =   "ถึงวันที่"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   3840
            TabIndex        =   24
            Top             =   2040
            Width           =   555
         End
         Begin VB.Label Label5 
            AutoSize        =   -1  'True
            Caption         =   "จากวันที่"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   2400
            TabIndex        =   23
            Top             =   2040
            Width           =   675
         End
         Begin VB.Label Label4 
            AutoSize        =   -1  'True
            Caption         =   "ชื่อ"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   840
            TabIndex        =   22
            Top             =   2040
            Width           =   240
         End
      End
      Begin VB.TextBox txtSdId 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   480
         MaxLength       =   8
         TabIndex        =   11
         Top             =   3240
         Width           =   1575
      End
      Begin VB.Frame Frame1 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3735
         Left            =   240
         TabIndex        =   3
         Top             =   720
         Width           =   5295
         Begin VB.CommandButton cmdSdIdAdd 
            Caption         =   "เพิ่ม"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   360
            TabIndex        =   13
            Top             =   3120
            Width           =   1335
         End
         Begin VB.CommandButton cmdSdIdUpdate 
            Caption         =   "แก้ไข"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   1920
            TabIndex        =   7
            Top             =   3120
            Width           =   1455
         End
         Begin VB.CommandButton cmdSdIdDelete 
            Caption         =   "ลบ"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3480
            TabIndex        =   6
            Top             =   3120
            Width           =   1455
         End
         Begin VB.TextBox txtSdIdFromDate 
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   2040
            MaxLength       =   10
            TabIndex        =   5
            Top             =   2520
            Width           =   1335
         End
         Begin VB.TextBox txtSdIdToDate 
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   375
            Left            =   3480
            TabIndex        =   4
            Top             =   2520
            Width           =   1335
         End
         Begin MSComctlLib.ListView lvSdId 
            Height          =   1695
            Left            =   600
            TabIndex        =   12
            Top             =   360
            Width           =   3975
            _ExtentX        =   7011
            _ExtentY        =   2990
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            FullRowSelect   =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   1
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            NumItems        =   0
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "รหัสนักศึกษา"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   600
            TabIndex        =   10
            Top             =   2160
            Width           =   1050
         End
         Begin VB.Label Label2 
            AutoSize        =   -1  'True
            Caption         =   "จากวันที่"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   2400
            TabIndex        =   9
            Top             =   2160
            Width           =   675
         End
         Begin VB.Label Label3 
            AutoSize        =   -1  'True
            Caption         =   "ถึงวันที่"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9.75
               Charset         =   222
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   3840
            TabIndex        =   8
            Top             =   2160
            Width           =   555
         End
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Add As Boolean
Dim Student As Object
Dim SdIdHistory() As Object
Dim Std As Object
Dim id As Long
Dim Index As Integer
Dim idhistkey As String, idhist As Object
Dim item As ListItem, idcount As Integer


Private Sub cmdSdIdClose_Click()
 Unload Form1
End Sub



Private Sub Form_Load()
     Add = True
     Index = 0
    ClearScreen
    LoadlvSd
    
End Sub

Private Sub LoadlvSd()

   lvSdId.View = lvwReport
   lvSdId.FullRowSelect = True
   lvSdId.ColumnHeaders.Clear
   lvSdId.ColumnHeaders.Add , , "รหัสนักศึกษา", 1300, lvwColumnLeft
   lvSdId.ColumnHeaders.Add , , "จากวันที่", 1300, lvwColumnCenter
   lvSdId.ColumnHeaders.Add , , "ถึงวันที่", 1300, lvwColumnCenter
   lvSdId.ListItems.Clear


   lvSdName.View = lvwReport
   lvSdName.FullRowSelect = True
   lvSdName.ColumnHeaders.Clear
   lvSdName.ColumnHeaders.Add , , "ชื่อ", 1300, lvwColumnLeft
   lvSdName.ColumnHeaders.Add , , "จากวันที่", 1300, lvwColumnCenter
   lvSdName.ColumnHeaders.Add , , "ถึงวันที่", 1300, lvwColumnCenter
   lvSdName.ListItems.Clear


   lvSdNameE.View = lvwReport
   lvSdNameE.FullRowSelect = True
   lvSdNameE.ColumnHeaders.Clear
   lvSdNameE.ColumnHeaders.Add , , "นามสกุล", 1300, lvwColumnLeft
   lvSdNameE.ColumnHeaders.Add , , "จากวันที่", 1300, lvwColumnCenter
   lvSdNameE.ColumnHeaders.Add , , "ถึงวันที่", 1300, lvwColumnCenter
   lvSdNameE.ListItems.Clear

   lvSdSurname.View = lvwReport
   lvSdSurname.FullRowSelect = True
   lvSdSurname.ColumnHeaders.Clear
   lvSdSurname.ColumnHeaders.Add , , "ชื่อ", 1300, lvwColumnLeft
   lvSdSurname.ColumnHeaders.Add , , "จากวันที่", 1300, lvwColumnCenter
   lvSdSurname.ColumnHeaders.Add , , "ถึงวันที่", 1300, lvwColumnCenter
   lvSdSurname.ListItems.Clear

   lvSdSurNameE.View = lvwReport
   lvSdSurNameE.FullRowSelect = True
   lvSdSurNameE.ColumnHeaders.Clear
   lvSdSurNameE.ColumnHeaders.Add , , "นามสกุล", 1300, lvwColumnLeft
   lvSdSurNameE.ColumnHeaders.Add , , "จากวันที่", 1300, lvwColumnCenter
   lvSdSurNameE.ColumnHeaders.Add , , "ถึงวันที่", 1300, lvwColumnCenter
   lvSdSurNameE.ListItems.Clear
End Sub

Private Sub ClearScreen()

    txtSdId.text = ""
    cmdSdIdAdd.Enabled = False
    cmdSdIdDelete.Enabled = False
    cmdSdIdUpdate.Enabled = False
    txtSdIdFromDate.text = ""
    txtSdIdToDate.text = ""
    lvSdId.ListItems.Clear
    lvSdName.ListItems.Clear
    txtSdName.text = ""
    lvSdNameE.ListItems.Clear
    txtSdNameE.text = ""
    lvSdSurname.ListItems.Clear
    txtSdSurname.text = ""
    lvSdSurNameE.ListItems.Clear
    txtSdSurNameE.text = ""
    txtSdNameT.text = ""
    txtSdNameF.text = ""
    txtSdSurnameT.text = ""
    txtSdSurnameF.text = ""
    txtSdNameET.text = ""
    txtSdNameEF.text = ""
    txtSdSurNameET.text = ""
    txtSdSurNameEF.text = ""
    'cmdAddSdName.Enabled
      
End Sub

Private Sub cmdSdIdClear_Click()
    ClearObjects
    ClearScreen
    txtSdId.SetFocus
    Add = True
End Sub

Private Sub ClearObjects()
    If Not Student Is Nothing Then
        Student.sys_close
        Set Student = Nothing
    End If
End Sub






Private Sub txtSdId_LostFocus()
    ' user keys in SdId
    If txtSdId.text = "" Then
        If Not (Student Is Nothing) Then Student.sys_close
        ClearScreen
        Exit Sub
    End If
    
    If Add Then
        LoadStudent (txtSdId.text)
    End If
        
End Sub

Private Sub LoadStudent(SdId As String)
    On Error GoTo objerr
    
    
    ClearObjects
    'Find Oid
    Set Std = cache.Static("Student")
    id = Std.FindOID(SdId)
    'txtTest.Text = id
    If id = 0 Then
      MsgBox "ไม่มีรหัสนักศึกษา " & txtSdId.text & " อยู่ในฐานข้อมูล ณ ปัจจุบัน"
      Exit Sub
    End If
    If id <> 0 Then
        Set Student = cache.OpenId("Student", id)
        ClearScreen
        txtSdId.text = Student.SdId.GetAt(Student.SdId.Count()).val
        
        LoadlvSdId
        
        cmdSdIdAdd.Enabled = True
        cmdSdIdUpdate.Enabled = True
        cmdSdIdDelete.Enabled = True
        
        Add = False
               
        Exit Sub
objerr:
    VBErrorBox "โหลดข้อมูลประวัติล้มเหลว !"
    ClearScreen
    
    End If
End Sub

Private Sub LoadlvSdId()
    'load history and plan of lvSjCode
        lvSdId.ListItems.Clear
        Erase SdIdHistory
        idcount = 0
        idhistkey = ""
        Set idhist = Student.SdId.GetNext(idhistkey)
        Do While Not idhist Is Nothing
             Set item = lvSdId.ListItems.Add
             item.text = idhist.val
             item.SubItems(1) = Format(idhist.FromDate, "mm/dd/yyyy")
             item.SubItems(2) = Format(idhist.ToDate, "mm/dd/yyyy")
             idcount = idcount + 1
             ReDim Preserve SdIdHistory(idcount)
             Set SdIdHistory(idcount) = idhist
             Set idhist = Student.SdId.GetNext(idhistkey)
        Loop
   LoadSdName
   LoadSdSurname
   LoadSdNameE
   LoadSdSurNameE
   
End Sub


Private Sub LoadSdName()
     Set idhist = Nothing
       lvSdName.ListItems.Clear
       ' Erase SdIdHistory
        idcount = 0
        idhistkey = ""
        Set idhist = Student.SdName.GetNext(idhistkey)
        Do While Not idhist Is Nothing
             Set item = lvSdName.ListItems.Add
             item.text = idhist.val
             item.SubItems(1) = Format(idhist.FromDate, "mm/dd/yyyy")
             item.SubItems(2) = Format(idhist.ToDate, "mm/dd/yyyy")
             idcount = idcount + 1
             'ReDim Preserve SdIdHistory(idcount)
             'Set SdIdHistory(idcount) = idhist
             Set idhist = Student.SdName.GetNext(idhistkey)
        Loop
End Sub

Private Sub LoadSdSurname()
       Set idhist = Nothing
       lvSdSurname.ListItems.Clear
       ' Erase SdIdHistory
        idcount = 0
        idhistkey = ""
        Set idhist = Student.Sdsurname.GetNext(idhistkey)
        Do While Not idhist Is Nothing
             Set item = lvSdSurname.ListItems.Add
             item.text = idhist.val
             item.SubItems(1) = Format(idhist.FromDate, "mm/dd/yyyy")
             item.SubItems(2) = Format(idhist.ToDate, "mm/dd/yyyy")
             idcount = idcount + 1
             'ReDim Preserve SdIdHistory(idcount)
             'Set SdIdHistory(idcount) = idhist
             Set idhist = Student.Sdsurname.GetNext(idhistkey)
        Loop
End Sub

Private Sub LoadSdNameE()
      Set idhist = Nothing
       lvSdNameE.ListItems.Clear
       ' Erase SdIdHistory
        idcount = 0
        idhistkey = ""
        Set idhist = Student.SdNameE.GetNext(idhistkey)
        Do While Not idhist Is Nothing
             Set item = lvSdNameE.ListItems.Add
             item.text = idhist.val
             item.SubItems(1) = Format(idhist.FromDate, "mm/dd/yyyy")
             item.SubItems(2) = Format(idhist.ToDate, "mm/dd/yyyy")
             idcount = idcount + 1
             'ReDim Preserve SdIdHistory(idcount)
             'Set SdIdHistory(idcount) = idhist
             Set idhist = Student.SdNameE.GetNext(idhistkey)
        Loop
End Sub

Private Sub LoadSdSurNameE()
       Set idhist = Nothing
       lvSdSurNameE.ListItems.Clear
       ' Erase SdIdHistory
        idcount = 0
        idhistkey = ""
        Set idhist = Student.SdSurNameE.GetNext(idhistkey)
        Do While Not idhist Is Nothing
             Set item = lvSdSurNameE.ListItems.Add
             item.text = idhist.val
             item.SubItems(1) = Format(idhist.FromDate, "mm/dd/yyyy")
             item.SubItems(2) = Format(idhist.ToDate, "mm/dd/yyyy")
             idcount = idcount + 1
       
             Set idhist = Student.SdSurNameE.GetNext(idhistkey)
        Loop
End Sub


Private Sub cmdSdIdAdd_Click()
    Dim message As String
    
  
    Set Std = cache.Static("Student")
    id = Student.sys_Id
    message = Std.InsertSSdId2(id, txtSdId.text, txtSdIdFromDate.text, txtSdIdToDate.text)
    MsgBox message, vbOKOnly
    LoadlvSdId
End Sub




Private Sub cmdSdIdUpdate_Click()
    Dim message As String
    
    Set Std = cache.Static("Student")
    id = Student.sys_Id
   message = Std.UpdateSSdId2(id, txtSdId.text, txtSdIdFromDate.text, txtSdIdToDate.text)
    MsgBox message, vbOKOnly
    LoadlvSdId

End Sub

Private Sub cmdSdIdDelete_Click()
    Dim message As String
    Dim FromDate As String
    Dim ToDate As String
    
    Set Std = cache.Static("Student")
    id = Student.sys_Id
    message = Std.DeleteSSdId2(id, txtSdIdFromDate.text, txtSdIdToDate.text)
    MsgBox message, vbOKOnly
    LoadlvSdId
    
End Sub


Private Sub cmdAddSdName_Click()
    Dim message As String
    
  
    Set Std = cache.Static("Student")
    id = Student.sys_Id
    message = Std.InsertSSdName2(id, txtSdName.text, txtSdNameF.text, txtSdNameT.text)
    MsgBox message, vbOKOnly
    LoadSdName
End Sub

Private Sub cmdUpdateSdName_Click()
    Dim message As String
    
    Set Std = cache.Static("Student")
    id = Student.sys_Id
   message = Std.UpdateSSdName2(id, txtSdName.text, txtSdNameF.text, txtSdNameT.text)
    MsgBox message, vbOKOnly
    LoadSdName

End Sub

Private Sub cmdDelSdName_Click()
    Dim message As String
    
    Set Std = cache.Static("Student")
    id = Student.sys_Id
    message = Std.DeleteSSdName(id, txtSdNameF.text, txtSdNameT.text)
    MsgBox message, vbOKOnly
    LoadSdName
    
End Sub

'=================
Private Sub cmdAddSdSurname_Click()
    Dim message As String
    
  
    Set Std = cache.Static("Student")
    id = Student.sys_Id
    message = Std.InsertSSdSurname2(id, txtSdSurname.text, txtSdSurnameF.text, txtSdSurnameT.text)
    MsgBox message, vbOKOnly
    LoadSdSurname
End Sub

Private Sub cmdUpdateSdSurname_Click()
    Dim message As String
    
    Set Std = cache.Static("Student")
    id = Student.sys_Id
   message = Std.UpdateSSdSurname2(id, txtSdSurname.text, txtSdSurnameF.text, txtSdSurnameT.text)
    MsgBox message, vbOKOnly
    LoadSdSurname

End Sub

Private Sub cmdDelSdsurname_Click()
    Dim message As String
    
    Set Std = cache.Static("Student")
    id = Student.sys_Id
    message = Std.DeleteSSdSurname(id, txtSdSurnameF.text, txtSdSurnameT.text)
    MsgBox message, vbOKOnly
    LoadSdSurname
    
End Sub
'=================SdNameE
Private Sub cmdAddSdNameE_Click()
    Dim message As String
    
  
    Set Std = cache.Static("Student")
    id = Student.sys_Id
    message = Std.InsertSSdNameE2(id, txtSdNameE.text, txtSdNameEF.text, txtSdNameET.text)
    MsgBox message, vbOKOnly
    LoadSdNameE
End Sub

Private Sub cmdUpdateSdNameE_Click()
    Dim message As String
    
    Set Std = cache.Static("Student")
    id = Student.sys_Id
   message = Std.UpdateSSdNameE2(id, txtSdNameE.text, txtSdNameEF.text, txtSdNameET.text)
    MsgBox message, vbOKOnly
    LoadSdNameE

End Sub

Private Sub cmdDelSdNameE_Click()
    Dim message As String
    
    Set Std = cache.Static("Student")
    id = Student.sys_Id
    message = Std.DeleteSSdNameE(id, txtSdNameEF.text, txtSdNameET.text)
    MsgBox message, vbOKOnly
    LoadSdNameE
    
End Sub
'=================SdNameE
Private Sub cmdAddSdSurNameE_Click()
    Dim message As String
    
  
    Set Std = cache.Static("Student")
    id = Student.sys_Id
    message = Std.InsertSSdSurNameE2(id, txtSdSurNameE.text, txtSdSurNameEF.text, txtSdSurNameET.text)
    MsgBox message, vbOKOnly
    LoadSdSurNameE
End Sub

Private Sub cmdUpdateSdSurNameE_Click()
    Dim message As String
    
    Set Std = cache.Static("Student")
    id = Student.sys_Id
   message = Std.UpdateSSdSurNameE2(id, txtSdSurNameE.text, txtSdSurNameEF.text, txtSdSurNameET.text)
    MsgBox message, vbOKOnly
    LoadSdSurNameE

End Sub

Private Sub cmdDelSdSurNameE_Click()
    Dim message As String
    
    Set Std = cache.Static("Student")
    id = Student.sys_Id
    message = Std.DeleteSSdSurNameE(id, txtSdSurNameEF.text, txtSdSurNameET.text)
    MsgBox message, vbOKOnly
    LoadSdSurNameE
    
End Sub
'==================
Private Sub lvSdId_DblClick()
   Dim itemselected  As Integer
   
   itemselected = lvSdId.SelectedItem.Index
   Index = itemselected
   txtSdId.text = lvSdId.ListItems(itemselected).text
   txtSdIdFromDate.text = lvSdId.ListItems(itemselected).SubItems(1)
   txtSdIdToDate.text = lvSdId.ListItems(itemselected).SubItems(2)
   cmdSdIdUpdate.Enabled = True
   cmdSdIdDelete.Enabled = True
   'txtSdId.SetFocus
   
End Sub

Private Sub lvSdName_DblClick()
   Dim itemselected  As Integer
   
   itemselected = lvSdName.SelectedItem.Index
   Index = itemselected
   txtSdName.text = lvSdName.ListItems(itemselected).text
   txtSdNameF.text = lvSdName.ListItems(itemselected).SubItems(1)
   txtSdNameT.text = lvSdName.ListItems(itemselected).SubItems(2)
   cmdUpdateSdName.Enabled = True
   cmdDelSdName.Enabled = True
   'txtSdId.SetFocus
   
End Sub

Private Sub lvSdNameE_DblClick()
   Dim itemselected  As Integer
   
   itemselected = lvSdNameE.SelectedItem.Index
   Index = itemselected
   txtSdNameE.text = lvSdNameE.ListItems(itemselected).text
   txtSdNameEF.text = lvSdNameE.ListItems(itemselected).SubItems(1)
   txtSdNameET.text = lvSdNameE.ListItems(itemselected).SubItems(2)
   cmdUpdateSdNameE.Enabled = True
   cmdDelSdNameE.Enabled = True
   'txtSdId.SetFocus
   
End Sub

Private Sub lvSdsurname_DblClick()
   Dim itemselected  As Integer
   
   itemselected = lvSdSurname.SelectedItem.Index
   Index = itemselected
   txtSdSurname.text = lvSdSurname.ListItems(itemselected).text
   txtSdSurnameF.text = lvSdSurname.ListItems(itemselected).SubItems(1)
   txtSdSurnameT.text = lvSdSurname.ListItems(itemselected).SubItems(2)
   cmdUpdateSdSurname.Enabled = True
   cmdDelSdSurname.Enabled = True
   'txtSdId.SetFocus
   
End Sub

Private Sub lvSdSurNameE_DblClick()
   Dim itemselected  As Integer
   
   itemselected = lvSdSurNameE.SelectedItem.Index
   Index = itemselected
   txtSdSurNameE.text = lvSdSurNameE.ListItems(itemselected).text
   txtSdSurNameEF.text = lvSdSurNameE.ListItems(itemselected).SubItems(1)
   txtSdSurNameET.text = lvSdSurNameE.ListItems(itemselected).SubItems(2)
   cmdUpdateSdSurNameE.Enabled = True
   cmdDelSdSurNameE.Enabled = True
   'txtSdId.SetFocus
   
End Sub


Private Sub lvSdId_Click()
   Dim itemselected  As Integer
   
   itemselected = lvSdId.SelectedItem.Index
   Index = itemselected
   txtSdId.text = lvSdId.ListItems(itemselected).text
   txtSdIdFromDate.text = lvSdId.ListItems(itemselected).SubItems(1)
   txtSdIdToDate.text = lvSdId.ListItems(itemselected).SubItems(2)
   cmdSdIdUpdate.Enabled = True
   cmdSdIdDelete.Enabled = True
   'txtSdId.SetFocus
   
End Sub


