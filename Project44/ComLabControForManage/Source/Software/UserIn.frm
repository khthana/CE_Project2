VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form UserIn 
   Caption         =   "ตรวจสอบข้อมูลผู้ใช้"
   ClientHeight    =   8280
   ClientLeft      =   2685
   ClientTop       =   345
   ClientWidth     =   8535
   LinkTopic       =   "Form1"
   ScaleHeight     =   8280
   ScaleWidth      =   8535
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   6600
      TabIndex        =   35
      Top             =   2400
      Width           =   1695
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   5640
      Top             =   360
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.Frame Frame4 
      Height          =   4695
      Left            =   120
      TabIndex        =   33
      Top             =   3480
      Width           =   8295
      Begin MSDataGridLib.DataGrid DataGrid2 
         Bindings        =   "UserIn.frx":0000
         Height          =   4335
         Left            =   120
         TabIndex        =   34
         Top             =   240
         Width           =   8055
         _ExtentX        =   14208
         _ExtentY        =   7646
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
      Begin MSAdodcLib.Adodc Adodc2 
         Height          =   375
         Left            =   240
         Top             =   4080
         Width           =   3495
         _ExtentX        =   6165
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
         RecordSource    =   "SELECT * FROM RoomDB"
         Caption         =   "Adodc2"
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
   Begin VB.Frame Frame3 
      Height          =   4695
      Left            =   120
      TabIndex        =   31
      Top             =   3480
      Width           =   8295
      Begin MSDataGridLib.DataGrid DataGrid1 
         Bindings        =   "UserIn.frx":0015
         Height          =   4335
         Left            =   120
         TabIndex        =   32
         Top             =   240
         Width           =   8055
         _ExtentX        =   14208
         _ExtentY        =   7646
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
         Top             =   4080
         Width           =   4215
         _ExtentX        =   7435
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
         RecordSource    =   "SELECT * FROM RoomDB"
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
   Begin VB.CommandButton CmdCancel 
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
      Left            =   4560
      TabIndex        =   26
      Top             =   3000
      Width           =   1815
   End
   Begin VB.CommandButton CmdOk 
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
      Height          =   390
      Left            =   2520
      TabIndex        =   25
      Top             =   3000
      Width           =   1815
   End
   Begin VB.CommandButton CmdCancelFind 
      Caption         =   "ยกเลิกการค้นหาข้อมูล"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   14.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   6480
      TabIndex        =   24
      Top             =   960
      Width           =   1815
   End
   Begin VB.Frame Frame2 
      Height          =   2775
      Left            =   120
      TabIndex        =   13
      Top             =   120
      Width           =   6255
      Begin VB.TextBox Text14 
         Height          =   375
         Left            =   3960
         TabIndex        =   28
         Top             =   1680
         Width           =   2055
      End
      Begin VB.TextBox Text13 
         Height          =   375
         Left            =   3960
         TabIndex        =   27
         Top             =   2160
         Width           =   2055
      End
      Begin VB.TextBox Text12 
         Height          =   375
         Left            =   960
         TabIndex        =   18
         Top             =   2160
         Width           =   2055
      End
      Begin VB.TextBox Text11 
         Height          =   375
         Left            =   960
         TabIndex        =   17
         Top             =   1680
         Width           =   2055
      End
      Begin VB.TextBox Text10 
         Height          =   375
         Left            =   960
         TabIndex        =   16
         Top             =   1200
         Width           =   975
      End
      Begin VB.TextBox Text9 
         Height          =   375
         Left            =   960
         TabIndex        =   15
         Top             =   720
         Width           =   975
      End
      Begin VB.TextBox Text8 
         Height          =   375
         Left            =   960
         TabIndex        =   14
         Top             =   240
         Width           =   2055
      End
      Begin VB.Label Label12 
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
         Left            =   3480
         TabIndex        =   30
         Top             =   2160
         Width           =   615
      End
      Begin VB.Label Label11 
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
         Left            =   3480
         TabIndex        =   29
         Top             =   1680
         Width           =   495
      End
      Begin VB.Label Label10 
         Caption         =   "วันที่เข้า"
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
         Left            =   240
         TabIndex        =   23
         Top             =   2160
         Width           =   615
      End
      Begin VB.Label Label9 
         Caption         =   "เวลาเข้า"
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
         Left            =   240
         TabIndex        =   22
         Top             =   1680
         Width           =   615
      End
      Begin VB.Label Label8 
         Caption         =   "ชั้นที่"
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
         Left            =   240
         TabIndex        =   21
         Top             =   1200
         Width           =   615
      End
      Begin VB.Label Label7 
         Caption         =   "ประตูที่"
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
         Left            =   240
         TabIndex        =   20
         Top             =   720
         Width           =   615
      End
      Begin VB.Label Label6 
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
         Left            =   240
         TabIndex        =   19
         Top             =   240
         Width           =   615
      End
   End
   Begin VB.Frame Frame1 
      Height          =   2775
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   6255
      Begin VB.TextBox Text6 
         DataField       =   "Date"
         DataSource      =   "Adodc1"
         Height          =   375
         Left            =   960
         TabIndex        =   7
         Top             =   2160
         Width           =   2055
      End
      Begin VB.TextBox Text5 
         DataField       =   "Time"
         DataSource      =   "Adodc1"
         Height          =   375
         Left            =   960
         TabIndex        =   6
         Top             =   1680
         Width           =   2055
      End
      Begin VB.TextBox Text4 
         DataField       =   "Floor"
         DataSource      =   "Adodc1"
         Height          =   375
         Left            =   960
         TabIndex        =   5
         Top             =   1200
         Width           =   975
      End
      Begin VB.TextBox Text3 
         DataField       =   "Door"
         DataSource      =   "Adodc1"
         Height          =   405
         Left            =   960
         TabIndex        =   4
         Top             =   720
         Width           =   975
      End
      Begin VB.TextBox Text2 
         DataField       =   "UserId"
         DataSource      =   "Adodc2"
         Height          =   405
         Left            =   960
         TabIndex        =   3
         Top             =   240
         Width           =   2055
      End
      Begin VB.Label Label5 
         Caption         =   "วันที่เข้า"
         Height          =   375
         Left            =   240
         TabIndex        =   12
         Top             =   2160
         Width           =   615
      End
      Begin VB.Label Label4 
         Caption         =   "เวลาเข้า"
         Height          =   375
         Left            =   240
         TabIndex        =   11
         Top             =   1680
         Width           =   615
      End
      Begin VB.Label Label3 
         Caption         =   "ชั้นที่"
         Height          =   375
         Left            =   240
         TabIndex        =   10
         Top             =   1200
         Width           =   615
      End
      Begin VB.Label Label2 
         Caption         =   "ประตูที่"
         Height          =   375
         Left            =   240
         TabIndex        =   9
         Top             =   720
         Width           =   615
      End
      Begin VB.Label Label1 
         Caption         =   "รหัส"
         Height          =   375
         Left            =   240
         TabIndex        =   8
         Top             =   240
         Width           =   615
      End
   End
   Begin VB.CommandButton CmdEnd 
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
      Height          =   480
      Left            =   6480
      TabIndex        =   1
      Top             =   1680
      Width           =   1815
   End
   Begin VB.CommandButton CmdFind 
      Caption         =   "ค้นหาข้อมูล"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   14.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   6480
      TabIndex        =   0
      Top             =   240
      Width           =   1815
   End
End
Attribute VB_Name = "UserIn"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub CmdCancelFind_Click()
    Frame1.Visible = True
    Frame2.Visible = False
    Frame3.Visible = True
    Frame4.Visible = False
    CmdOk.Visible = False
    CmdCancel.Visible = False
End Sub

Private Sub CmdEnd_Click()
    MainMenuForm.Show
    Unload Me
End Sub

Private Sub CmdFind_Click()
    Frame1.Visible = False
    Frame2.Visible = True
    Frame3.Visible = False
    Frame4.Visible = True
    CmdOk.Visible = True
    CmdCancel.Visible = True
End Sub

Private Sub Form_Load()
    Frame1.Visible = True
    Frame2.Visible = False
    Frame3.Visible = True
    Frame4.Visible = False
    CmdOk.Visible = False
    CmdCancel.Visible = False
    
    MSComm1.Settings = "9600,N,8,1"
    MSComm1.CommPort = 1
    MSComm1.InputLen = 1
    MSComm1.PortOpen = True
    MSComm1.RThreshold = 1
       
    With DataGrid1
         .Columns(0).Width = 1000        ' Number
         .Columns(1).Width = 1500       ' UserId
         .Columns(2).Width = 800        ' Room
         .Columns(3).Width = 800        ' Floor
         .Columns(4).Width = 1800       ' Time
         .Columns(5).Width = 1800       ' Date
    End With
End Sub

Private Sub MSComm1_OnComm()
Dim StrData As Variant
Dim UserId As String
Dim Door As String
Dim Floor As String

        Select Case MSComm1.CommEvent
       Case comEvReceive
            StrData = MSComm1.Input
            Call ShowData(Text1, (StrConv((StrData), vbUnicode)))
       
            If Len(Text1.Text) = 10 Then
                UserId = Left$(Text1.Text, 8)
                Text1.Text = Right$(Text1.Text, 2)
                Door = Left$(Text1.Text, 1)
                Floor = Right$(Text1.Text, 1)
                Text1.Text = ""
                
                Adodc1.RecordSource = "SELECT * FROM User WHERE UserId =" & Chr$(34) & UserId & Chr$(34)
                Adodc1.Refresh
                
                If Adodc1.Recordset.RecordCount >= 1 Then
                    MSComm1.Output = Door & Floor
'                    Call UpdateRoomDB(UserId, Door, Floor)
'                    Call CheckLockin(UserId)
                End If
           End If
        End Select
End Sub

Public Static Sub ShowData(TextShow As Control, Data As String)
    Const SpeedBaud = 16000
    Dim LngSize As Long, X

    LngSize = Len(TextShow.Text)
    If LngSize > SpeedBaud Then
       TextShow.Text = Mid$(TextShow.Text, 4097)
       LngSize = Len(TextShow.Text)
    End If
    TextShow.SelStart = SpeedBaud
    Do
       X = InStr(Data, Chr$(8))
       If X Then
          If X = 1 Then
             TextShow.SelStart = SpeedBaud - 1
             TextShow.SelLength = 1
             Data = Mid$(Data, X + 1)
          Else
             Data = Left$(Data, X - 2) & Mid$(Data, X + 1)
          End If
       End If
    Loop While X
    Do
       X = InStr(Data, Chr$(10))
       If X Then
          Data = Left$(Data, X - 1) & Mid$(Data, X + 1)
       End If
    Loop While X
    X = 1
    Do
      X = InStr(X, Data, Chr$(13))
       If X Then
          Data = Left$(Data, X) & Chr$(10) & Mid$(Data, X + 1)
          X = X + 1
       End If
    Loop While X
    TextShow.SelText = Data
    TextShow.SelStart = Len(TextShow.Text)
End Sub

Public Static Sub UpdateRoomDB(UserId As String, Door As String, Floor As String)
    Adodc2.Recordset.AddNew
    Text2.Text = UserId
    Text3.Text = Door
    Text4.Text = Floor
    Text5.Text = Time$
    Text6.Text = Date$
    Adodc2.Recordset.MoveNext
    If Adodc2.Recordset.EOF Then
        Adodc2.Recordset.MoveLast
    End If
End Sub

Public Static Sub CheckLockin(UserId As String)
Dim test
    Adodc3.RecordSource = "SELECT * FROM LoginDB WHERE LogoutTime = 'none' and UserId =" & Chr$(34) & UserId & Chr$(34)
    Adodc3.Refresh
    If Adodc3.Recordset.RecordCount = 0 Then
            Call EnableAccount(UserId)
            Call UpdateAllowLogin(UserId)
    End If
End Sub

Public Static Sub EnableAccount(UserId As String)
    Dim user
    Dim Data As String
    Data = "WinNT://samart/" & UserId
    Set usr = GetObject(Data)
    usr.accountdisabled = False
    usr.SetInfo
End Sub

Public Static Sub DisableAccount(UserId As String)
    Dim user
    Dim Data As String
    Data = "WinNT://samart/" & UserId
    Set usr = GetObject(Data)
    usr.accountdisabled = True
    usr.SetInfo
End Sub

Public Static Sub UpdateAllowLogin(UserIdData As String)
Dim UserCriteria As String

    UserCriteria = "UserId = '" & Text2.Text & "'"
    Adodc4.Recordset.MoveFirst
    Adodc4.Recordset.Find UserCriteria, 0, adSearchForward, 0
    If Adodc4.Recordset.EOF Then
        Adodc4.Recordset.AddNew
        Text7.Text = Text2.Text
        Adodc4.Recordset.MoveNext
        If Adodc4.Recordset.EOF Then
            Adodc4.Recordset.MoveLast
        End If
    End If
End Sub

