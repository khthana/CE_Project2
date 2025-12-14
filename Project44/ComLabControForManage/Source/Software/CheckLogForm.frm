VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form CheckLogForm 
   Caption         =   "ตรวจสอบการ Login Logout ของผู้ใช้"
   ClientHeight    =   9330
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10095
   LinkTopic       =   "Form1"
   ScaleHeight     =   9330
   ScaleWidth      =   10095
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      Caption         =   "เมนูหลัก"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   14.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   8160
      TabIndex        =   15
      Top             =   240
      Width           =   1815
   End
   Begin VB.CommandButton Command2 
      Caption         =   "ยกเลิก"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   14.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5520
      TabIndex        =   14
      Top             =   3240
      Width           =   1935
   End
   Begin VB.CommandButton Command1 
      Caption         =   "ตกลง"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   14.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3240
      TabIndex        =   13
      Top             =   3240
      Width           =   2055
   End
   Begin VB.Frame Frame2 
      Height          =   5535
      Left            =   120
      TabIndex        =   1
      Top             =   3720
      Width           =   9855
      Begin MSDataGridLib.DataGrid DataGrid1 
         Bindings        =   "CheckLogForm.frx":0000
         Height          =   5175
         Left            =   120
         TabIndex        =   21
         Top             =   240
         Width           =   9615
         _ExtentX        =   16960
         _ExtentY        =   9128
         _Version        =   393216
         HeadLines       =   1
         RowHeight       =   15
         BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ColumnCount     =   2
         BeginProperty Column00 
            DataField       =   ""
            Caption         =   ""
            BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
               Type            =   0
               Format          =   ""
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1054
               SubFormatType   =   0
            EndProperty
         EndProperty
         BeginProperty Column01 
            DataField       =   ""
            Caption         =   ""
            BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
               Type            =   0
               Format          =   ""
               HaveTrueFalseNull=   0
               FirstDayOfWeek  =   0
               FirstWeekOfYear =   0
               LCID            =   1054
               SubFormatType   =   0
            EndProperty
         EndProperty
         SplitCount      =   1
         BeginProperty Split0 
            BeginProperty Column00 
            EndProperty
            BeginProperty Column01 
            EndProperty
         EndProperty
      End
      Begin MSAdodcLib.Adodc Adodc1 
         Height          =   375
         Left            =   240
         Top             =   4800
         Width           =   4095
         _ExtentX        =   7223
         _ExtentY        =   661
         ConnectMode     =   0
         CursorLocation  =   3
         IsolationLevel  =   -1
         ConnectionTimeout=   15
         CommandTimeout  =   30
         CursorType      =   3
         LockType        =   3
         CommandType     =   1
         CursorOptions   =   0
         CacheSize       =   50
         MaxRecords      =   0
         BOFAction       =   0
         EOFAction       =   0
         ConnectStringType=   1
         Appearance      =   1
         BackColor       =   -2147483643
         ForeColor       =   -2147483640
         Orientation     =   0
         Enabled         =   -1
         Connect         =   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\last_project\UserTest\db1.mdb;Persist Security Info=False"
         OLEDBString     =   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\last_project\UserTest\db1.mdb;Persist Security Info=False"
         OLEDBFile       =   ""
         DataSourceName  =   ""
         OtherAttributes =   ""
         UserName        =   ""
         Password        =   ""
         RecordSource    =   "SELECT * FROM LoginDB"
         Caption         =   "Adodc1"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         _Version        =   393216
      End
   End
   Begin VB.Frame Frame1 
      Height          =   2895
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   7335
      Begin VB.TextBox Text1 
         Height          =   375
         Left            =   1320
         TabIndex        =   20
         Top             =   240
         Width           =   1935
      End
      Begin VB.TextBox Text8 
         Height          =   375
         Left            =   4080
         TabIndex        =   17
         Top             =   2160
         Width           =   1935
      End
      Begin VB.TextBox Text7 
         Height          =   375
         Left            =   1320
         TabIndex        =   16
         Top             =   2160
         Width           =   1935
      End
      Begin VB.TextBox Text6 
         Height          =   375
         Left            =   4080
         TabIndex        =   6
         Top             =   1680
         Width           =   1935
      End
      Begin VB.TextBox Text5 
         Height          =   375
         Left            =   1320
         TabIndex        =   5
         Top             =   1680
         Width           =   1935
      End
      Begin VB.TextBox Text4 
         Height          =   375
         Left            =   4080
         TabIndex        =   4
         Top             =   1200
         Width           =   1935
      End
      Begin VB.TextBox Text3 
         Height          =   375
         Left            =   1320
         TabIndex        =   3
         Top             =   1200
         Width           =   1935
      End
      Begin VB.TextBox Text2 
         Height          =   375
         Left            =   1320
         TabIndex        =   2
         Top             =   720
         Width           =   1935
      End
      Begin VB.Label Label8 
         Caption         =   "วันที่"
         BeginProperty Font 
            Name            =   "Angsana New"
            Size            =   14.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   19
         Top             =   2160
         Width           =   495
      End
      Begin VB.Label Label7 
         Caption         =   "ถึง"
         BeginProperty Font 
            Name            =   "Angsana New"
            Size            =   14.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   3600
         TabIndex        =   18
         Top             =   2160
         Width           =   375
      End
      Begin VB.Label Label6 
         Caption         =   "ถึง"
         BeginProperty Font 
            Name            =   "Angsana New"
            Size            =   14.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   3600
         TabIndex        =   12
         Top             =   1680
         Width           =   375
      End
      Begin VB.Label Label5 
         Caption         =   "ถึง"
         BeginProperty Font 
            Name            =   "Angsana New"
            Size            =   14.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   3600
         TabIndex        =   11
         Top             =   1200
         Width           =   375
      End
      Begin VB.Label Label4 
         Caption         =   "เวลาล็อกเอาท์"
         BeginProperty Font 
            Name            =   "Angsana New"
            Size            =   14.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   10
         Top             =   1680
         Width           =   1095
      End
      Begin VB.Label Label3 
         Caption         =   "เวลาล็อกอิน"
         BeginProperty Font 
            Name            =   "Angsana New"
            Size            =   14.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   9
         Top             =   1200
         Width           =   855
      End
      Begin VB.Label Label2 
         Caption         =   "เครื่องที่"
         BeginProperty Font 
            Name            =   "Angsana New"
            Size            =   14.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   8
         Top             =   720
         Width           =   615
      End
      Begin VB.Label Label1 
         Caption         =   "รหัส"
         BeginProperty Font 
            Name            =   "Angsana New"
            Size            =   14.25
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   7
         Top             =   240
         Width           =   615
      End
   End
End
Attribute VB_Name = "CheckLogForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command3_Click()
    MainMenuForm.Show
    Unload Me
End Sub
