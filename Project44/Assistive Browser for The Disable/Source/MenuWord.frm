VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form MenuWord 
   Caption         =   "เพิ่ม/ลบ คำ"
   ClientHeight    =   4425
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4335
   Icon            =   "MenuWord.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4425
   ScaleWidth      =   4335
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   3720
      Top             =   0
   End
   Begin VB.CommandButton B_exit 
      Caption         =   "ออก"
      Height          =   495
      Left            =   120
      TabIndex        =   12
      Top             =   3840
      Width           =   4095
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   3615
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4095
      _ExtentX        =   7223
      _ExtentY        =   6376
      _Version        =   393216
      Tabs            =   2
      TabHeight       =   520
      TabCaption(0)   =   "คำศัพท์"
      TabPicture(0)   =   "MenuWord.frx":1272
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Label1"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "Label3"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "Image1"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "Text_findword"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "B_add"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "B_update"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "B_delete"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).Control(7)=   "B_find"
      Tab(0).Control(7).Enabled=   0   'False
      Tab(0).Control(8)=   "Text_word"
      Tab(0).Control(8).Enabled=   0   'False
      Tab(0).Control(9)=   "AdodcWord"
      Tab(0).Control(9).Enabled=   0   'False
      Tab(0).Control(10)=   "cmdOK"
      Tab(0).Control(10).Enabled=   0   'False
      Tab(0).Control(11)=   "cmdCancle"
      Tab(0).Control(11).Enabled=   0   'False
      Tab(0).ControlCount=   12
      TabCaption(1)   =   "History"
      TabPicture(1)   =   "MenuWord.frx":128E
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "AdodcHis"
      Tab(1).Control(1)=   "B_2add"
      Tab(1).Control(2)=   "B_2Update"
      Tab(1).Control(3)=   "B_2delete"
      Tab(1).Control(4)=   "CmdOK2"
      Tab(1).Control(5)=   "cmdCancel2"
      Tab(1).Control(6)=   "ListHis"
      Tab(1).Control(7)=   "Text_His"
      Tab(1).ControlCount=   8
      Begin VB.TextBox Text_His 
         DataField       =   "History"
         DataSource      =   "AdodcHis"
         Enabled         =   0   'False
         Height          =   375
         Left            =   -74760
         TabIndex        =   18
         Top             =   1080
         Width           =   3615
      End
      Begin VB.ListBox ListHis 
         BackColor       =   &H80000004&
         Height          =   1035
         Left            =   -74760
         TabIndex        =   17
         Top             =   1920
         Width           =   3615
      End
      Begin VB.CommandButton cmdCancel2 
         Caption         =   "ยกเลิก"
         Enabled         =   0   'False
         Height          =   495
         Left            =   -72960
         TabIndex        =   16
         Top             =   1440
         Width           =   1815
      End
      Begin VB.CommandButton CmdOK2 
         Caption         =   "ตกลง"
         Enabled         =   0   'False
         Height          =   495
         Left            =   -74760
         TabIndex        =   15
         Top             =   1440
         Width           =   1815
      End
      Begin VB.CommandButton cmdCancle 
         Caption         =   "ยกเลิก"
         Enabled         =   0   'False
         Height          =   615
         Left            =   2400
         TabIndex        =   14
         Top             =   1560
         Width           =   1335
      End
      Begin VB.CommandButton cmdOK 
         Caption         =   "ตกลง"
         Enabled         =   0   'False
         Height          =   615
         Left            =   960
         TabIndex        =   13
         Top             =   1560
         Width           =   1455
      End
      Begin MSAdodcLib.Adodc AdodcWord 
         Height          =   330
         Left            =   240
         Top             =   2280
         Width           =   3615
         _ExtentX        =   6376
         _ExtentY        =   582
         ConnectMode     =   3
         CursorLocation  =   3
         IsolationLevel  =   -1
         ConnectionTimeout=   15
         CommandTimeout  =   30
         CursorType      =   3
         LockType        =   3
         CommandType     =   2
         CursorOptions   =   0
         CacheSize       =   50
         MaxRecords      =   0
         BOFAction       =   0
         EOFAction       =   0
         ConnectStringType=   1
         Appearance      =   1
         BackColor       =   -2147483624
         ForeColor       =   -2147483640
         Orientation     =   0
         Enabled         =   -1
         Connect         =   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Words.mdb;Persist Security Info=False"
         OLEDBString     =   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Words.mdb;Persist Security Info=False"
         OLEDBFile       =   ""
         DataSourceName  =   ""
         OtherAttributes =   ""
         UserName        =   ""
         Password        =   ""
         RecordSource    =   "Table_Word"
         Caption         =   "Database Words"
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
      Begin VB.CommandButton B_2delete 
         BackColor       =   &H00C0C0FF&
         Caption         =   "ลบ"
         Height          =   495
         Left            =   -72720
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   480
         Width           =   855
      End
      Begin VB.CommandButton B_2Update 
         BackColor       =   &H00C0E0FF&
         Caption         =   "ปรับเปลี่ยน"
         Height          =   495
         Left            =   -73800
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   480
         Width           =   975
      End
      Begin VB.CommandButton B_2add 
         BackColor       =   &H00C0FFC0&
         Caption         =   "เพิ่ม"
         Height          =   495
         Left            =   -74760
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   480
         Width           =   855
      End
      Begin MSAdodcLib.Adodc AdodcHis 
         Height          =   375
         Left            =   -74760
         Top             =   3000
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
         CommandType     =   2
         CursorOptions   =   0
         CacheSize       =   50
         MaxRecords      =   0
         BOFAction       =   0
         EOFAction       =   0
         ConnectStringType=   1
         Appearance      =   1
         BackColor       =   -2147483624
         ForeColor       =   -2147483640
         Orientation     =   0
         Enabled         =   -1
         Connect         =   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Words.mdb;Persist Security Info=False"
         OLEDBString     =   "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Words.mdb;Persist Security Info=False"
         OLEDBFile       =   ""
         DataSourceName  =   ""
         OtherAttributes =   ""
         UserName        =   ""
         Password        =   ""
         RecordSource    =   "Table_History"
         Caption         =   "Database History"
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
      Begin VB.TextBox Text_word 
         DataField       =   "Word"
         DataSource      =   "AdodcWord"
         Enabled         =   0   'False
         ForeColor       =   &H80000007&
         Height          =   375
         Left            =   960
         TabIndex        =   8
         Top             =   1200
         Width           =   2775
      End
      Begin VB.CommandButton B_find 
         BackColor       =   &H00FFFFC0&
         Caption         =   "ค้นหา"
         Height          =   495
         Left            =   3120
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   2760
         Width           =   855
      End
      Begin VB.CommandButton B_delete 
         BackColor       =   &H00C0C0FF&
         Caption         =   "ลบ"
         Height          =   495
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   600
         Width           =   975
      End
      Begin VB.CommandButton B_update 
         BackColor       =   &H00C0E0FF&
         Caption         =   "ปรับเปลี่ยน"
         Height          =   495
         Left            =   1920
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   600
         Width           =   975
      End
      Begin VB.CommandButton B_add 
         BackColor       =   &H00C0FFC0&
         Caption         =   "เพิ่ม"
         Height          =   495
         Left            =   840
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   600
         Width           =   975
      End
      Begin VB.TextBox Text_findword 
         Height          =   375
         Left            =   1200
         TabIndex        =   1
         Top             =   2760
         Width           =   1815
      End
      Begin VB.Image Image1 
         Height          =   495
         Left            =   240
         Picture         =   "MenuWord.frx":12AA
         Stretch         =   -1  'True
         Top             =   600
         Width           =   495
      End
      Begin VB.Label Label3 
         Caption         =   "คำศัพท์"
         Height          =   375
         Left            =   240
         TabIndex        =   7
         Top             =   1200
         Width           =   735
      End
      Begin VB.Label Label1 
         Caption         =   "ค้นหาคำศัพท์"
         Height          =   375
         Left            =   240
         TabIndex        =   2
         Top             =   2880
         Width           =   975
      End
   End
End
Attribute VB_Name = "MenuWord"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim t As Long


Private Sub AdodcHis_WillMove(ByVal adReason As ADODB.EventReasonEnum, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
    AdodcHis.Caption = AdodcHis.Recordset.RecordCount
End Sub

Private Sub AdodcWord_WillMove(ByVal adReason As ADODB.EventReasonEnum, adStatus As ADODB.EventStatusEnum, ByVal pRecordset As ADODB.Recordset)
    AdodcWord.Caption = AdodcWord.Recordset.RecordCount
End Sub

Private Sub B_add_Click()
    If Text_word.text <> "" Then
        Text_word.Enabled = True
        AdodcWord.Recordset.AddNew
        B_add.Enabled = False
        B_update.Enabled = False
        B_delete.Enabled = False
        B_find.Enabled = False
        cmdOK.Enabled = True
        cmdCancle.Enabled = True
    End If
End Sub

Private Sub B_exit_Click()
    Unload Me
End Sub

Private Sub B_update_Click()
    If Text_word.text <> "" Then
        Text_word.Enabled = True
        B_add.Enabled = False
        B_update.Enabled = False
        B_delete.Enabled = False
        B_find.Enabled = False
        cmdOK.Enabled = True
        cmdCancle.Enabled = True
    Else
        Timer1.Enabled = True
    End If
End Sub

Private Sub B_delete_Click()
    If Text_word.text <> "" Then
        With AdodcWord.Recordset
            .Delete
            .MoveLast
        End With
    End If
End Sub

Private Sub B_find_Click()
    AdodcWord.Recordset.MoveFirst
    AdodcWord.Recordset.Find "Word = '" & Text_findword & "'"
End Sub

Private Sub cmdCancle_Click()
    AdodcWord.Recordset.CancelUpdate
    B_add.Enabled = True
    B_update.Enabled = True
    B_delete.Enabled = True
    B_find.Enabled = True
    cmdCancle.Enabled = False
    Text_word.Enabled = False
End Sub

Private Sub cmdOK_Click()
    If Text_word.text <> "" Then
        B_add.Enabled = True
        B_update.Enabled = True
        B_delete.Enabled = True
        B_find.Enabled = True
        cmdCancle.Enabled = False
        cmdOK.Enabled = False
        Text_word.Enabled = False
        AdodcWord.Recordset.Update
    Else
        Timer1.Enabled = True
    End If
End Sub

Private Sub Form_Load()
    Dim all_word As Long
    Dim item_t As String
    Dim i As Long
    '* load history ทั้งหมดจาก database
    Call UpdateListHis
    Call StayOnTop(Me.hwnd, True)
End Sub


Private Sub B_2add_Click()
    If Text_His.text <> "" Then
        Text_His.Enabled = True
        AdodcHis.Recordset.AddNew
        B_2add.Enabled = False
        B_2Update.Enabled = False
        B_2delete.Enabled = False
        CmdOK2.Enabled = True
        cmdCancel2.Enabled = True
    End If
End Sub

Private Sub B_2update_Click()
    If Text_His.text <> "" Then
        Text_His.Enabled = True
        B_2add.Enabled = False
        B_2Update.Enabled = False
        B_2delete.Enabled = False
        CmdOK2.Enabled = True
        cmdCancel2.Enabled = True
    Else
        Timer1.Enabled = True
    End If
End Sub

Private Sub B_2delete_Click()
    If Text_His.text <> "" Then
        With AdodcHis.Recordset
            .Delete
            .MoveLast
        End With
        Call UpdateListHis
        Change_History = True
    End If
End Sub

Private Sub cmdCancel2_Click()
    AdodcHis.Recordset.CancelUpdate
    B_2add.Enabled = True
    B_2Update.Enabled = True
    B_2delete.Enabled = True
    cmdCancel2.Enabled = False
    Text_His.Enabled = False
End Sub

Private Sub cmdOK2_Click()
    If Text_His.text <> "" Then
        B_2add.Enabled = True
        B_2Update.Enabled = True
        B_2delete.Enabled = True
        cmdCancel2.Enabled = False
        CmdOK2.Enabled = False
        Text_His.Enabled = False
        AdodcHis.Recordset.Update
        Call UpdateListHis
        Change_History = True
    Else
        Timer1.Enabled = True
    End If
End Sub

Private Sub ListHis_Click()
    Dim tx As String
    tx = ListHis.List(ListHis.ListIndex)
    AdodcHis.Recordset.MoveFirst
    AdodcHis.Recordset.Find "History = '" & tx & "'"
End Sub

Sub UpdateListHis()
    Dim all_word As Long
        ListHis.Clear
        all_word = AdodcHis.Recordset.RecordCount
        AdodcHis.Recordset.MoveFirst
        For i = 1 To all_word
            ListHis.AddItem (AdodcHis.Recordset.Fields.Item(1).Value)
            AdodcHis.Recordset.MoveNext
        Next i
        AdodcHis.Recordset.MoveFirst
End Sub

Private Sub Timer1_Timer()
    If t = 0 Then
        Text_word.ForeColor = vbRed
        Text_word.text = "กรุณาใส่คำก่อน"
        Text_His.ForeColor = vbRed
        Text_His.text = "กรุณาใส่คำก่อน"
    End If
    t = t + Timer1.Interval
    If t > 500 Then
        t = 0
        Timer1.Enabled = False
        Text_word.ForeColor = vbBlack
        Text_word.text = ""
        Text_His.ForeColor = vbBlack
        Text_His.text = ""
    End If
End Sub
