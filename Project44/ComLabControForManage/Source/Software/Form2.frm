VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form UserManagementForm 
   Caption         =   "ตรวจสอบแก้ไขข้อมูลผู้ใช้"
   ClientHeight    =   9225
   ClientLeft      =   1185
   ClientTop       =   1110
   ClientWidth     =   13320
   LinkTopic       =   "Form2"
   ScaleHeight     =   9225
   ScaleWidth      =   13320
   Begin VB.CommandButton CmdSearch 
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
      Height          =   495
      Left            =   10080
      TabIndex        =   23
      Top             =   2280
      Width           =   2175
   End
   Begin VB.TextBox Text6 
      DataField       =   "Account Disable Description"
      DataSource      =   "Adodc1"
      Height          =   855
      Left            =   1680
      TabIndex        =   22
      Top             =   4080
      Width           =   7455
   End
   Begin VB.TextBox Text5 
      DataField       =   "Room Disable Description"
      DataSource      =   "Adodc1"
      Height          =   855
      Left            =   1680
      TabIndex        =   20
      Top             =   2640
      Width           =   7455
   End
   Begin VB.CheckBox Check2 
      DataField       =   "Account Disable"
      DataSource      =   "Adodc1"
      Height          =   255
      Left            =   2280
      TabIndex        =   17
      Top             =   3720
      Width           =   255
   End
   Begin MSDataGridLib.DataGrid DataGrid1 
      Bindings        =   "Form2.frx":0000
      Height          =   3375
      Left            =   120
      TabIndex        =   16
      Top             =   5760
      Width           =   13095
      _ExtentX        =   23098
      _ExtentY        =   5953
      _Version        =   393216
      AllowUpdate     =   0   'False
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
   Begin VB.CheckBox Check1 
      DataField       =   "Room Disable"
      DataSource      =   "Adodc1"
      Height          =   255
      Left            =   2280
      TabIndex        =   14
      Top             =   2160
      Width           =   255
   End
   Begin VB.TextBox Text4 
      DataField       =   "Group"
      DataSource      =   "Adodc1"
      Height          =   375
      Left            =   1680
      TabIndex        =   13
      Top             =   1680
      Width           =   1215
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
      Left            =   7440
      TabIndex        =   12
      Top             =   5160
      Width           =   1695
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
      Height          =   375
      Left            =   5400
      TabIndex        =   11
      Top             =   5160
      Width           =   1695
   End
   Begin VB.TextBox Text3 
      DataField       =   "Last name"
      DataSource      =   "Adodc1"
      Height          =   375
      Left            =   1680
      TabIndex        =   8
      Top             =   1200
      Width           =   5055
   End
   Begin VB.TextBox Text2 
      DataField       =   "First name"
      DataSource      =   "Adodc1"
      Height          =   375
      Left            =   1680
      TabIndex        =   6
      Top             =   720
      Width           =   5055
   End
   Begin VB.TextBox Text1 
      DataField       =   "UserId"
      DataSource      =   "Adodc1"
      Height          =   375
      Left            =   1680
      TabIndex        =   4
      Top             =   240
      Width           =   1935
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
      Height          =   495
      Left            =   10080
      TabIndex        =   3
      Top             =   2880
      Width           =   2175
   End
   Begin VB.CommandButton CmdDelete 
      Caption         =   "ลบข้อมูล"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   14.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   10080
      TabIndex        =   2
      Top             =   1680
      Width           =   2175
   End
   Begin VB.CommandButton CmdUpdate 
      Caption         =   "แก้ใขข้อมูล"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   14.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   10080
      TabIndex        =   1
      Top             =   1080
      Width           =   2175
   End
   Begin VB.CommandButton CmdAdd 
      Caption         =   "เพิ่มข้อมูล"
      BeginProperty Font 
         Name            =   "Angsana New"
         Size            =   14.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   10080
      TabIndex        =   0
      Top             =   480
      Width           =   2175
   End
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   375
      Left            =   120
      Top             =   8640
      Width           =   3615
      _ExtentX        =   6376
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
      RecordSource    =   "SELECT * FROM Allowuser"
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
   Begin VB.Label Label9 
      Caption         =   "รายละเอียด"
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
      Left            =   360
      TabIndex        =   21
      Top             =   4080
      Width           =   975
   End
   Begin VB.Label Label7 
      Caption         =   "รายระเอียด"
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
      Left            =   360
      TabIndex        =   19
      Top             =   2640
      Width           =   1095
   End
   Begin VB.Label Label6 
      Caption         =   "ระงับสิทธิ์การล็อกอิน"
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
      Left            =   360
      TabIndex        =   18
      Top             =   3720
      Width           =   1575
   End
   Begin VB.Label Label5 
      Caption         =   "ระงับสิทธิ์การเข้าใช้ห้อง"
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
      Left            =   360
      TabIndex        =   15
      Top             =   2160
      Width           =   1815
   End
   Begin VB.Label Label4 
      Caption         =   "ห้อง"
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
      Left            =   360
      TabIndex        =   10
      Top             =   1680
      Width           =   495
   End
   Begin VB.Label Label3 
      Caption         =   "สกุล"
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
      Left            =   360
      TabIndex        =   9
      Top             =   1200
      Width           =   855
   End
   Begin VB.Label Label2 
      Caption         =   "ชื่อ"
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
      Left            =   360
      TabIndex        =   7
      Top             =   720
      Width           =   855
   End
   Begin VB.Label Label1 
      Caption         =   "รหัสนักศึกษา"
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
      Left            =   360
      TabIndex        =   5
      Top             =   240
      Width           =   975
   End
End
Attribute VB_Name = "UserManagementForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CmdAdd_Click()
    Adodc1.Recordset.AddNew
    Adodc1.Enabled = False
    Call Inputlock(False, False, False, False, False, False, False, False)
    Call HideCommandBottom(True, True, True, True, True, True, True)
    Call EnableCommandBottom(False, False, False, False, False, True, True)
End Sub

Private Sub CmdCancel_Click()
    If Text1.Text = "" Then
        Text1.Text = "."
        Adodc1.Recordset.delete
    Else
        Adodc1.Recordset.delete
    End If
    Call Inputlock(True, True, True, True, True, True, True, True)
    Call HideCommandBottom(True, True, True, True, True, False, False)
    Call EnableCommandBottom(True, True, True, True, True, False, False)
    Adodc1.Enabled = True
End Sub

Private Sub CmdDelete_Click()
    If MsgBox("คุณต้องการลบข้อมูล ?", vbYesNo, "ยืนยันการลบ") = vbYes Then
        With Adodc1.Recordset
            .delete
            .MoveNext
            If Adodc1.Recordset.EOF Then
                    Adodc1.Recordset.MoveLast
            End If
        End With
    End If
End Sub

Private Sub CmdEnd_Click()
    MainMenuForm.Show
    Unload UserManagementForm
End Sub

Private Sub CmdOk_Click()
    If (Text1.Text = "") Or (Text2.Text = "") Or (Text3.Text = "") Or (Text4.Text = "") Then
        MsgBox "กรุณากรอกข้อมูลให้ครบ", vbOKOnly, "ข้อมูลผิดพลาด"
    Else
        Adodc1.Enabled = True
        Adodc1.Recordset.MoveNext
        If Adodc1.Recordset.EOF Then
            Adodc1.Recordset.MoveLast
        End If
    End If
    Call Inputlock(True, True, True, True, True, True, True, True)
    Call HideCommandBottom(True, True, True, True, True, False, False)
    Call EnableCommandBottom(True, True, True, True, True, False, False)
End Sub

Private Sub Form_Load()
   With DataGrid1
      .Columns(0).Width = 1200      ' UserId
      .Columns(1).Width = 1500      ' First Name
      .Columns(2).Width = 1500      ' Last Name
      .Columns(3).Width = 800       ' Group
      .Columns(4).Width = 1200      ' Room Disable
      .Columns(5).Width = 1300      ' Account Disable
      .Columns(6).Width = 1100      ' allow login
      .Columns(7).Width = 2000      ' Room Disable Description
      .Columns(8).Width = 2100      ' Account Disable Description
   End With
   Call Inputlock(True, True, True, True, True, True, True, True)
   Call HideCommandBottom(True, True, True, True, True, False, False)
End Sub

Private Sub Inputlock(t1 As Boolean, t2 As Boolean, t3 As Boolean, t4 As Boolean, t5 As Boolean, t6 As Boolean, C1 As Boolean, C2 As Boolean)
   Text1.Locked = t1
   Text2.Locked = t2
   Text3.Locked = t3
   Text4.Locked = t4
   Text5.Locked = t5
   Text6.Locked = t6
   Check1.Enabled = C1
   Check2.Enabled = C2
End Sub
Private Sub HideCommandBottom(add As Boolean, update As Boolean, delete As Boolean, search As Boolean, Cend As Boolean, ok As Boolean, cancel As Boolean)
   CmdAdd.Visible = add
   CmdUpdate.Visible = update
   CmdDelete.Visible = delete
   CmdSearch.Visible = search
   CmdEnd.Visible = Cend
   CmdOk.Visible = ok
   CmdCancel.Visible = cancel
End Sub

Private Sub EnableCommandBottom(add As Boolean, update As Boolean, delete As Boolean, search As Boolean, Cend As Boolean, ok As Boolean, cancel As Boolean)
   CmdAdd.Enabled = add
   CmdUpdate.Enabled = update
   CmdDelete.Enabled = delete
   CmdSearch.Enabled = search
   CmdEnd.Enabled = Cend
   CmdOk.Enabled = ok
   CmdCancel.Enabled = cancel
End Sub


Private Sub adodc1_movecomplete(ByVal adreason As ADODB.EventReasonEnum, ByVal perror As ADODB.Error, adstatus As ADODB.EventStatusEnum, ByVal precordset As ADODB.Recordset)
    With DataGrid1
    End With
End Sub

