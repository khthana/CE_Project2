VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form frmDatabase 
   BackColor       =   &H00FAE6BA&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ฐานข้อมูล"
   ClientHeight    =   6045
   ClientLeft      =   2745
   ClientTop       =   1650
   ClientWidth     =   4860
   Icon            =   "frmDatabase.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6045
   ScaleWidth      =   4860
   StartUpPosition =   2  'CenterScreen
   Begin MSDataGridLib.DataGrid DataGrid1 
      Height          =   4215
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   4740
      _ExtentX        =   8361
      _ExtentY        =   7435
      _Version        =   393216
      AllowUpdate     =   -1  'True
      BorderStyle     =   0
      HeadLines       =   1
      RowHeight       =   15
      AllowAddNew     =   -1  'True
      AllowDelete     =   -1  'True
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
      Height          =   330
      Left            =   210
      Top             =   5670
      Visible         =   0   'False
      Width           =   1200
      _ExtentX        =   2117
      _ExtentY        =   582
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   2
      LockType        =   3
      CommandType     =   8
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
      Connect         =   ""
      OLEDBString     =   ""
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "SELECT [Word] AS [คำ], [Filename] AS [ชื่อไฟล์] FROM [Wave] ORDER BY 1"
      Caption         =   "ฐานข้อมูล"
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
   Begin Comm4Deaf.zCommand btnClose 
      Height          =   300
      Left            =   1785
      Top             =   5670
      Width           =   1290
      _ExtentX        =   2275
      _ExtentY        =   529
      cDownFore       =   6917386
      cDisabledFore   =   0
      Style           =   0
      Caption         =   "ปิด"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmDatabase.frx":0E42
      PictureDown     =   "frmDatabase.frx":15C1
   End
   Begin VB.Label Label2 
      BackColor       =   &H00EAFECF&
      BackStyle       =   0  'Transparent
      Caption         =   "2. ""ชื่อไฟล์"" จะต้องตรงกับไฟล์ที่อยู่ในซับโฟลเดอร์ \wave"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   315
      TabIndex        =   3
      Top             =   5145
      Width           =   4320
   End
   Begin VB.Label Label1 
      BackColor       =   &H00EAFECF&
      BackStyle       =   0  'Transparent
      Caption         =   "1. ""คำ"" และ ""ชื่อไฟล์"" สามารถแก้ได้ในตาราง"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   315
      TabIndex        =   2
      Top             =   4830
      Width           =   4110
   End
   Begin VB.Label StatusBar 
      BackColor       =   &H00EAFECF&
      BackStyle       =   0  'Transparent
      Caption         =   "วิธีในการแก้ไขฐานข้อมูล"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   210
      TabIndex        =   1
      Top             =   4515
      Width           =   3795
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00EFF5F5&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00F14800&
      BorderWidth     =   2
      Height          =   1215
      Left            =   45
      Top             =   4380
      Width           =   4785
   End
   Begin VB.Shape shp_Grid1 
      BackColor       =   &H00EFF5F5&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00F14800&
      BorderWidth     =   2
      Height          =   4260
      Left            =   45
      Top             =   45
      Width           =   4785
   End
End
Attribute VB_Name = "frmDatabase"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub btnClose_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  Adodc1.ConnectionString = Cnn.ConnectionString
  Set DataGrid1.DataSource = Adodc1
End Sub

