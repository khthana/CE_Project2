VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "TQBE"
   ClientHeight    =   8415
   ClientLeft      =   1215
   ClientTop       =   180
   ClientWidth     =   8040
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8415
   ScaleWidth      =   8040
   ShowInTaskbar   =   0   'False
   Begin TabDlg.SSTab SSTab1 
      Height          =   8415
      Left            =   600
      TabIndex        =   0
      Top             =   0
      Width           =   8055
      _ExtentX        =   14208
      _ExtentY        =   14843
      _Version        =   393216
      Tabs            =   5
      TabsPerRow      =   5
      TabHeight       =   520
      TabCaption(0)   =   "Query"
      TabPicture(0)   =   "TQBE.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Ldata1"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "Ldata2"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "Ldata3"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "Ldata4"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "frmRelationship"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "chkshowtime"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "msfQuery"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).Control(7)=   "cmdOK"
      Tab(0).Control(7).Enabled=   0   'False
      Tab(0).Control(8)=   "cmdCancel"
      Tab(0).Control(8).Enabled=   0   'False
      Tab(0).Control(9)=   "cmdLoad"
      Tab(0).Control(9).Enabled=   0   'False
      Tab(0).Control(10)=   "cmdExit"
      Tab(0).Control(10).Enabled=   0   'False
      Tab(0).Control(11)=   "frmDatabase"
      Tab(0).Control(11).Enabled=   0   'False
      Tab(0).ControlCount=   12
      TabCaption(1)   =   "Condition"
      TabPicture(1)   =   "TQBE.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "cmdcancondi"
      Tab(1).Control(1)=   "frmtimecon"
      Tab(1).Control(2)=   "txtcondition"
      Tab(1).Control(3)=   "Lformat"
      Tab(1).Control(4)=   "LAthemetic"
      Tab(1).Control(5)=   "LOper"
      Tab(1).Control(6)=   "Latt"
      Tab(1).Control(7)=   "Label8"
      Tab(1).Control(8)=   "Label7"
      Tab(1).Control(9)=   "Label6"
      Tab(1).Control(10)=   "Label5"
      Tab(1).ControlCount=   11
      TabCaption(2)   =   "Time Range"
      TabPicture(2)   =   "TQBE.frx":0038
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "Label9"
      Tab(2).Control(1)=   "LTimerange"
      Tab(2).Control(2)=   "txtTimerange"
      Tab(2).Control(3)=   "frmTime"
      Tab(2).Control(4)=   "cmdTimeOK"
      Tab(2).Control(5)=   "cmdTimeCancel"
      Tab(2).ControlCount=   6
      TabCaption(3)   =   "SQL"
      TabPicture(3)   =   "TQBE.frx":0054
      Tab(3).ControlEnabled=   0   'False
      Tab(3).Control(0)=   "txtSQL"
      Tab(3).ControlCount=   1
      TabCaption(4)   =   "Result"
      TabPicture(4)   =   "TQBE.frx":0070
      Tab(4).ControlEnabled=   0   'False
      Tab(4).Control(0)=   "ListResult"
      Tab(4).ControlCount=   1
      Begin VB.Frame frmDatabase 
         Caption         =   "Database Available"
         Height          =   975
         Left            =   480
         TabIndex        =   39
         Top             =   480
         Width           =   6975
         Begin VB.ComboBox cboTables 
            Height          =   315
            ItemData        =   "TQBE.frx":008C
            Left            =   5040
            List            =   "TQBE.frx":008E
            TabIndex        =   41
            Top             =   360
            Width           =   1575
         End
         Begin VB.ComboBox cboDSNList 
            Height          =   315
            Left            =   960
            TabIndex        =   40
            Top             =   360
            Width           =   2415
         End
         Begin VB.Label Label2 
            Caption         =   "DSN :"
            Height          =   255
            Left            =   240
            TabIndex        =   43
            Top             =   360
            Width           =   495
         End
         Begin VB.Label Label1 
            Caption         =   "Class Name :"
            Height          =   255
            Left            =   3840
            TabIndex        =   42
            Top             =   360
            Width           =   975
         End
      End
      Begin MSComctlLib.ListView ListResult 
         Height          =   7335
         Left            =   -74760
         TabIndex        =   36
         Top             =   600
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   12938
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin VB.TextBox txtSQL 
         Height          =   7335
         Left            =   -74760
         MultiLine       =   -1  'True
         TabIndex        =   35
         Top             =   600
         Width           =   7695
      End
      Begin VB.CommandButton cmdTimeCancel 
         Caption         =   "Cancel"
         Height          =   375
         Left            =   -68520
         TabIndex        =   34
         Top             =   7680
         Width           =   1215
      End
      Begin VB.CommandButton cmdTimeOK 
         Caption         =   "OK"
         Height          =   375
         Left            =   -70080
         TabIndex        =   33
         Top             =   7680
         Width           =   1215
      End
      Begin VB.Frame frmTime 
         Caption         =   "Time"
         Height          =   2295
         Left            =   -74520
         TabIndex        =   24
         Top             =   5160
         Width           =   7215
         Begin VB.Frame frmTimestate 
            Caption         =   "Time state"
            Height          =   735
            Left            =   1080
            TabIndex        =   44
            Top             =   1320
            Width           =   1695
            Begin VB.OptionButton optHistory 
               Caption         =   "History"
               Height          =   195
               Left            =   120
               TabIndex        =   46
               Top             =   480
               Width           =   975
            End
            Begin VB.OptionButton Optnow 
               Caption         =   "Current"
               Height          =   255
               Left            =   120
               TabIndex        =   45
               Top             =   240
               Width           =   1095
            End
         End
         Begin VB.Frame frmTimeRange 
            Caption         =   "TimeRange"
            Height          =   975
            Left            =   3000
            TabIndex        =   30
            Top             =   720
            Width           =   3975
            Begin MSComCtl2.DTPicker dtpTo 
               Height          =   375
               Left            =   2400
               TabIndex        =   32
               Top             =   360
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               Format          =   22872065
               CurrentDate     =   37249
            End
            Begin MSComCtl2.DTPicker dtpFrom 
               Height          =   375
               Left            =   600
               TabIndex        =   31
               Top             =   360
               Width           =   1335
               _ExtentX        =   2355
               _ExtentY        =   661
               _Version        =   393216
               Format          =   22872065
               CurrentDate     =   37249
            End
            Begin VB.Label Label4 
               Caption         =   "From"
               Height          =   255
               Left            =   120
               TabIndex        =   38
               Top             =   480
               Width           =   375
            End
            Begin VB.Label Label3 
               Caption         =   "To"
               Height          =   255
               Left            =   2040
               TabIndex        =   37
               Top             =   480
               Width           =   255
            End
         End
         Begin VB.Frame frmTimeUnit 
            Caption         =   "TimeUnit"
            Height          =   975
            Left            =   1080
            TabIndex        =   26
            Top             =   240
            Width           =   1695
            Begin VB.OptionButton Optmonth 
               Caption         =   "Month"
               Height          =   255
               Left            =   120
               TabIndex        =   29
               Top             =   480
               Width           =   855
            End
            Begin VB.OptionButton Optyear 
               Caption         =   "Year"
               Height          =   195
               Left            =   120
               TabIndex        =   28
               Top             =   720
               Width           =   855
            End
            Begin VB.OptionButton Optday 
               Caption         =   "Day"
               Height          =   255
               Left            =   120
               TabIndex        =   27
               Top             =   240
               Width           =   855
            End
         End
         Begin VB.CheckBox chktime 
            Caption         =   "Time"
            Height          =   375
            Left            =   240
            TabIndex        =   25
            Top             =   960
            Width           =   735
         End
      End
      Begin VB.TextBox txtTimerange 
         Height          =   1575
         Left            =   -74520
         MultiLine       =   -1  'True
         TabIndex        =   23
         Top             =   3360
         Width           =   7215
      End
      Begin VB.ListBox LTimerange 
         Height          =   1815
         ItemData        =   "TQBE.frx":0090
         Left            =   -74520
         List            =   "TQBE.frx":0092
         TabIndex        =   22
         Top             =   960
         Width           =   1455
      End
      Begin VB.CommandButton cmdcancondi 
         Caption         =   "Cancel"
         Height          =   375
         Left            =   -68520
         TabIndex        =   21
         Top             =   7560
         Width           =   1095
      End
      Begin VB.Frame frmtimecon 
         Caption         =   "Timecondition"
         Height          =   975
         Left            =   -69960
         TabIndex        =   19
         Top             =   6360
         Width           =   2535
         Begin MSComCtl2.DTPicker dtptimecon 
            Height          =   375
            Left            =   360
            TabIndex        =   20
            Top             =   360
            Width           =   1935
            _ExtentX        =   3413
            _ExtentY        =   661
            _Version        =   393216
            Format          =   22872065
            CurrentDate     =   37249
         End
      End
      Begin VB.TextBox txtcondition 
         Height          =   2775
         Left            =   -74640
         MultiLine       =   -1  'True
         TabIndex        =   18
         Top             =   3480
         Width           =   7215
      End
      Begin VB.ListBox Lformat 
         Height          =   1620
         ItemData        =   "TQBE.frx":0094
         Left            =   -68760
         List            =   "TQBE.frx":0096
         TabIndex        =   17
         Top             =   960
         Width           =   975
      End
      Begin VB.ListBox LAthemetic 
         Height          =   1620
         ItemData        =   "TQBE.frx":0098
         Left            =   -70320
         List            =   "TQBE.frx":009A
         TabIndex        =   16
         Top             =   960
         Width           =   1095
      End
      Begin VB.ListBox LOper 
         Height          =   1620
         ItemData        =   "TQBE.frx":009C
         Left            =   -71880
         List            =   "TQBE.frx":009E
         TabIndex        =   15
         Top             =   960
         Width           =   1095
      End
      Begin VB.ListBox Latt 
         Height          =   1815
         ItemData        =   "TQBE.frx":00A0
         Left            =   -74520
         List            =   "TQBE.frx":00A2
         TabIndex        =   14
         Top             =   960
         Width           =   2055
      End
      Begin VB.CommandButton cmdExit 
         Caption         =   "Exit"
         Height          =   375
         Left            =   5880
         TabIndex        =   13
         Top             =   7680
         Width           =   1095
      End
      Begin VB.CommandButton cmdLoad 
         Caption         =   "Query"
         Height          =   375
         Left            =   4320
         TabIndex        =   12
         Top             =   7680
         Width           =   1215
      End
      Begin VB.CommandButton cmdCancel 
         Caption         =   "Cancel"
         Height          =   375
         Left            =   2760
         TabIndex        =   11
         Top             =   7680
         Width           =   1215
      End
      Begin VB.CommandButton cmdOK 
         Caption         =   "OK"
         Height          =   375
         Left            =   1200
         TabIndex        =   10
         Top             =   7680
         Width           =   1215
      End
      Begin MSFlexGridLib.MSFlexGrid msfQuery 
         Height          =   2295
         Left            =   240
         TabIndex        =   9
         Top             =   5160
         Width           =   7575
         _ExtentX        =   13361
         _ExtentY        =   4048
         _Version        =   393216
      End
      Begin VB.CheckBox chkshowtime 
         Caption         =   "Showtime"
         Height          =   375
         Left            =   2760
         TabIndex        =   8
         Top             =   4440
         Width           =   1215
      End
      Begin VB.Frame frmRelationship 
         Caption         =   "RelationShip"
         Height          =   855
         Left            =   240
         TabIndex        =   5
         Top             =   4080
         Width           =   2295
         Begin VB.OptionButton optunjoin 
            Caption         =   "Unjoin"
            Height          =   195
            Left            =   1320
            TabIndex        =   7
            Top             =   360
            Width           =   855
         End
         Begin VB.OptionButton optjoin 
            Caption         =   "Join"
            Height          =   195
            Left            =   240
            TabIndex        =   6
            Top             =   360
            Width           =   855
         End
      End
      Begin VB.ListBox Ldata4 
         Height          =   1620
         ItemData        =   "TQBE.frx":00A4
         Left            =   5520
         List            =   "TQBE.frx":00A6
         TabIndex        =   4
         Top             =   1920
         Width           =   1215
      End
      Begin VB.ListBox Ldata3 
         Height          =   1620
         ItemData        =   "TQBE.frx":00A8
         Left            =   3960
         List            =   "TQBE.frx":00AA
         TabIndex        =   3
         Top             =   1920
         Width           =   1215
      End
      Begin VB.ListBox Ldata2 
         Height          =   1620
         ItemData        =   "TQBE.frx":00AC
         Left            =   2280
         List            =   "TQBE.frx":00AE
         TabIndex        =   2
         Top             =   1920
         Width           =   1215
      End
      Begin VB.ListBox Ldata1 
         Height          =   1620
         ItemData        =   "TQBE.frx":00B0
         Left            =   600
         List            =   "TQBE.frx":00B2
         TabIndex        =   1
         Top             =   1920
         Width           =   1215
      End
      Begin VB.Label Label9 
         Caption         =   "Timeattribte"
         Height          =   255
         Left            =   -74400
         TabIndex        =   51
         Top             =   600
         Width           =   975
      End
      Begin VB.Label Label8 
         Caption         =   "Punctuation"
         Height          =   255
         Left            =   -68760
         TabIndex        =   50
         Top             =   600
         Width           =   855
      End
      Begin VB.Label Label7 
         Caption         =   "Arithemetic"
         Height          =   255
         Left            =   -70200
         TabIndex        =   49
         Top             =   600
         Width           =   975
      End
      Begin VB.Label Label6 
         Caption         =   "Operator"
         Height          =   255
         Left            =   -71760
         TabIndex        =   48
         Top             =   600
         Width           =   855
      End
      Begin VB.Label Label5 
         Caption         =   "Attribute"
         Height          =   255
         Left            =   -74400
         TabIndex        =   47
         Top             =   600
         Width           =   855
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'//dns load
Private Declare Function sqldatasources Lib "ODBC32.DLL" Alias "SQLDataSources" (ByVal henv&, ByVal fDirection%, ByVal szDSN$, ByVal cbDSNMax%, pcbDSN%, ByVal szDescription$, ByVal cbDescriptionMax%, pcbDescription%) As Integer
Private Declare Function SQLAllocEnv% Lib "ODBC32.DLL" (env&)
Const SQL_SUCCESS As Long = 0
Const SQL_FETCH_NEXT As Long = 1

'Dim Cache As New CacheObject.Factory
Public x11, x22, x33, x44 As Integer
Dim LSelect As Integer
Public tempjoin As String
Dim Save_X As Single
Dim Save_Y As Single


'//load dns
Sub GetDSNs()
    Dim i As Integer
    Dim sDSNItem As String * 1024
    Dim sDRVItem As String * 1024
    Dim sDSN As String
    Dim sDRV As String
    Dim iDSNLen As Integer
    Dim iDRVLen As Integer
    Dim lHenv As Long         'handle to the environment

    On Error Resume Next
    cboDSNList.AddItem "(--none--)"

    'get the DSNs
    If SQLAllocEnv(lHenv) <> -1 Then
        Do Until i <> SQL_SUCCESS
            sDSNItem = Space$(1024)
            'sDRVItem = Space$(1024)
            i = sqldatasources(lHenv, SQL_FETCH_NEXT, sDSNItem, 1024, iDSNLen, sDRVItem, 1024, iDRVLen)
            sDSN = Left$(sDSNItem, iDSNLen)
           ' sDRV = Left$(sDRVItem, iDRVLen)
                   
            If sDSN <> Space(iDSNLen) Then
                cboDSNList.AddItem sDSN
            End If
        Loop
    End If
      cboDSNList.ListIndex = 0
End Sub



' delete 1
'Private Sub cmdclose_Click()
Private Sub Ldata1_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = 46 Then

If LSelect = 1 Then
    Ldata1.Clear
    Ldata1.Visible = False
End If
       With msfQuery
      .Clear
        .col = 0
        .Row = 1
        .Text = "Attribute"
        .Row = 2
        .Text = "ClassName"
        .Row = 7
        .Text = "Total"
        .Row = 3
        .Text = "Sort"
        .Row = 4
        .Text = "Show"
        .Row = 5
        .Text = "Criteria"
        .Row = 6
        .Text = "Or"
    End With
    txtSQL.Text = ""
    SQL = ""
 txtcondition.Text = ""
    txtcondition.Text = ""
    txtTimerange.Text = ""
    Order = ""
    Latt.Clear
    LTimerange.Clear
    chkshowtime.Value = False
    optjoin.Value = False
    optunjoin.Value = False
    chktime.Value = False
    Optyear.Value = False
    Optmonth.Value = False
    Optday.Value = False
    Optnow.Value = False
    optHistory.Value = False
    time = False
    flag = False
    j = 1
End If
End Sub
' delete 2
'Private Sub cmdclose_Click()
Private Sub Ldata2_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = 46 Then

 If LSelect = 2 Then
    Ldata2.Clear
    Ldata2.Visible = False
End If
       With msfQuery
      .Clear
        .col = 0
        .Row = 1
        .Text = "Attribute"
        .Row = 2
        .Text = "ClassName"
        .Row = 7
        .Text = "Total"
        .Row = 3
        .Text = "Sort"
        .Row = 4
        .Text = "Show"
        .Row = 5
        .Text = "Criteria"
        .Row = 6
        .Text = "Or"
    End With
    txtSQL.Text = ""
    SQL = ""
 txtcondition.Text = ""
    txtcondition.Text = ""
    txtTimerange.Text = ""
    Order = ""
    Latt.Clear
    LTimerange.Clear
    chkshowtime.Value = False
    optjoin.Value = False
    optunjoin.Value = False
    chktime.Value = False
    Optyear.Value = False
    Optmonth.Value = False
    Optday.Value = False
    Optnow.Value = False
    optHistory.Value = False
    time = False
    flag = False
    j = 1
End If
End Sub
' delete 3
'Private Sub cmdclose_Click()
Private Sub Ldata3_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = 46 Then

If LSelect = 3 Then
    Ldata3.Clear
    Ldata3.Visible = False
End If
       With msfQuery
        .Clear
        .col = 0
        .Row = 1
        .Text = "Attribute"
        .Row = 2
        .Text = "ClassName"
        .Row = 7
        .Text = "Total"
        .Row = 3
        .Text = "Sort"
        .Row = 4
        .Text = "Show"
        .Row = 5
        .Text = "Criteria"
        .Row = 6
        .Text = "Or"
    End With
    txtSQL.Text = ""
    SQL = ""
    txtcondition.Text = ""
    txtTimerange.Text = ""
    Order = ""
    Latt.Clear
    LTimerange.Clear
    chkshowtime.Value = False
    optjoin.Value = False
    optunjoin.Value = False
    chktime.Value = False
    Optyear.Value = False
    Optmonth.Value = False
    Optday.Value = False
    Optnow.Value = False
    optHistory.Value = False
    time = False
    flag = False
    j = 1
End If
End Sub
' delete 4
'Private Sub cmdclose_Click()
Private Sub Ldata4_KeyDown(KeyCode As Integer, Shift As Integer)

If KeyCode = 46 Then

If LSelect = 4 Then
    Ldata4.Clear
    Ldata4.Visible = False
End If
       With msfQuery
      .Clear
        .col = 0
        .Row = 1
        .Text = "Attribute"
        .Row = 2
        .Text = "ClassName"
        .Row = 7
        .Text = "Total"
        .Row = 3
        .Text = "Sort"
        .Row = 4
        .Text = "Show"
        .Row = 5
        .Text = "Criteria"
        .Row = 6
        .Text = "Or"
    End With
    txtSQL.Text = ""
    SQL = ""
    txtcondition.Text = ""
    txtTimerange.Text = ""
    Order = ""
    Latt.Clear
    LTimerange.Clear
    chkshowtime.Value = False
    optjoin.Value = False
    optunjoin.Value = False
    chktime.Value = False
    Optyear.Value = False
    Optmonth.Value = False
    Optday.Value = False
    Optnow.Value = False
    optHistory.Value = False
    time = False
    flag = False
    j = 1
End If
End Sub

'Private Sub cmddb_Click()

Private Sub cboDSNList_Click()

Dim temtable(50) As String
Dim i As Integer
Dim currenttable As String
Dim nexttable As String
On Error GoTo DBerror



If conn.State = adStateOpen Then conn.Close
Set conn = Nothing
Ldata1.Clear
   'myDSN = txtDB.Text
   If cboDSNList.Text = "(--none--)" Then
        Exit Sub
   End If
    myDSN = cboDSNList.Text
        conn.Open myDSN, "_system", "sys"
    currenttable = ""
    nexttable = ""
    i = 1
    Set Rssc = conn.OpenSchema(adSchemaColumns)
    While Not Rssc.EOF
    currenttable = Rssc!Table_Name
    If (currenttable <> nexttable) Then
        nexttable = Rssc!Table_Name
        temtable(i) = Rssc!Table_Name
        i = i + 1
    End If
        Rssc.MoveNext
    Wend
    cboTables.Clear
    For i = 1 To 50
        If temtable(i) <> "" Then
         Dim B As Integer
         B = InStr(temtable(i), "_")
            If B < 1 Then
                cboTables.AddItem temtable(i)
            End If
        End If
    Next i
    Ldata1.Clear
    Ldata2.Clear
    Ldata3.Clear
    Ldata4.Clear
    Ldata1.Visible = False
    Ldata2.Visible = False
    Ldata3.Visible = False
    Ldata4.Visible = False
       With msfQuery
      .Clear
        .col = 0
        .Row = 1
        .Text = "Attribute"
        .Row = 2
        .Text = "ClassName"
        .Row = 7
        .Text = "Total"
        .Row = 3
        .Text = "Sort"
        .Row = 4
        .Text = "Show"
        .Row = 5
        .Text = "Criteria"
        .Row = 6
        .Text = "Or"
    End With
    txtSQL.Text = ""
    SQL = ""
    txtcondition.Text = ""
    txtTimerange.Text = ""
    Latt.Clear
    LTimerange.Clear
    chkshowtime.Value = False
    optjoin.Value = False
    optunjoin.Value = False
    chktime.Value = False
    time = False
    flag = False
    j = 1
        Exit Sub
DBerror:
    MsgBox "DSN Failed : " & Err.Description
End Sub
'Private Sub cmdTable_Click()
Private Sub cbotables_Click()

Dim Tselect As String
Dim P0, P1 As Integer
Dim MyTable
Dim currenttable As String
Dim nexttable As String
On Error GoTo TableError
   Tselect = cboTables.Text
    currenttable = ""
    nexttable = ""

    Set Rssc = conn.OpenSchema(adSchemaColumns)
If Ldata1.List(0) = "" Then
    Ldata1.Visible = True
    While Not Rssc.EOF
    currenttable = Rssc!Table_Name
    P0 = InStr(currenttable, Tselect)
    If P0 = 1 Then
        If (currenttable <> nexttable) Then
                nexttable = Rssc!Table_Name
                P1 = InStr(Rssc!Table_Name, "_")
                If P1 >= 1 Then
                    MyTable = Split(Rssc!Table_Name, "_")
                    Ldata1.AddItem MyTable(1)
                Else
                    Ldata1.AddItem Rssc!Table_Name
                    Ldata1.AddItem "*"
                End If
        End If
        If currenttable = Tselect Then
                Ldata1.AddItem Rssc!Column_Name
        End If
     End If
        Rssc.MoveNext
    Wend
    ElseIf Ldata2.List(0) = "" Then
    Ldata2.Visible = True
    While Not Rssc.EOF
    currenttable = Rssc!Table_Name
    P0 = InStr(currenttable, Tselect)
    If P0 = 1 Then
        If (currenttable <> nexttable) Then
                nexttable = Rssc!Table_Name
                P1 = InStr(Rssc!Table_Name, "_")
                If P1 >= 1 Then
                    MyTable = Split(Rssc!Table_Name, "_")
                    Ldata2.AddItem MyTable(1)
                Else
                    Ldata2.AddItem Rssc!Table_Name
                    Ldata2.AddItem "*"
                End If
           End If
           If currenttable = Tselect Then
                Ldata2.AddItem Rssc!Column_Name
        End If
     End If
        Rssc.MoveNext
    Wend
    ElseIf Ldata3.List(0) = "" Then
    Ldata3.Visible = True
    While Not Rssc.EOF
    currenttable = Rssc!Table_Name
    P0 = InStr(currenttable, Tselect)
    If P0 = 1 Then
        If (currenttable <> nexttable) Then
                nexttable = Rssc!Table_Name
                P1 = InStr(Rssc!Table_Name, "_")
                If P1 >= 1 Then
                    MyTable = Split(Rssc!Table_Name, "_")
                    Ldata3.AddItem MyTable(1)
                Else
                    Ldata3.AddItem Rssc!Table_Name
                    Ldata3.AddItem "*"
                End If
        End If
        If currenttable = Tselect Then
                Ldata3.AddItem Rssc!Column_Name
        End If
     End If
        Rssc.MoveNext
    Wend
    ElseIf Ldata4.List(0) = "" Then
    Ldata4.Visible = True
    While Not Rssc.EOF
    currenttable = Rssc!Table_Name
    P0 = InStr(currenttable, Tselect)
    If P0 = 1 Then
        If (currenttable <> nexttable) Then
                nexttable = Rssc!Table_Name
                P1 = InStr(Rssc!Table_Name, "_")
                If P1 >= 1 Then
                    MyTable = Split(Rssc!Table_Name, "_")
                    Ldata4.AddItem MyTable(1)
                Else
                    Ldata4.AddItem Rssc!Table_Name
                    Ldata4.AddItem "*"
                End If
        End If
        If currenttable = Tselect Then
                Ldata4.AddItem Rssc!Column_Name
        End If
     End If
        Rssc.MoveNext
    Wend
    End If
    Exit Sub
TableError:
       MsgBox "Classname Failed : " & Err.Description
End Sub


Sub CheckVisible()
    If Ldata1.Visible = True Then x11 = 1
    If Ldata2.Visible = True Then x22 = 1
    If Ldata3.Visible = True Then x33 = 1
    If Ldata4.Visible = True Then x44 = 1
End Sub
Private Sub chkshowtime_Click()
    If chkshowtime.Value Then
        time = True
    Else
        time = False
    End If
End Sub

Private Sub chkTime_Click()
    If chktime.Value Then
        frmTimeUnit.Enabled = True
        frmTimeRange.Enabled = True
        frmTimestate.Enabled = True
        'cmdTimeOK.Enabled = True
        'cmdTimeCancel.Enabled = True
     Else
        frmTimeUnit.Enabled = False
        frmTimeRange.Enabled = False
        frmTimestate.Enabled = False
        'cmdTimeOK.Enabled = False
        'cmdTimeCancel.Enabled = False
    End If
End Sub

Private Sub cmdCancel_Click()
    Dim count As Integer
    With msfQuery
      .Clear
        .col = 0
        .Row = 1
        .Text = "Attribute"
        .Row = 2
        .Text = "ClassName"
        .Row = 7
        .Text = "Total"
        .Row = 3
        .Text = "Sort"
        .Row = 4
        .Text = "Show"
        .Row = 5
        .Text = "Criteria"
        .Row = 6
        .Text = "Or"
    End With
    txtSQL.Text = ""
    SQL = ""
    txtcondition.Text = ""
    txtTimerange.Text = ""
    Latt.Clear
    LTimerange.Clear
    chkshowtime.Value = False
    optjoin.Value = False
    optunjoin.Value = False
    chktime.Value = False
    Optyear.Value = False
    Optmonth.Value = False
    Optday.Value = False
    Optnow.Value = False
    optHistory.Value = False
    time = False
    flag = False
    j = 1
End Sub

Private Sub cmdcancondi_Click()
    txtcondition.Text = ""
End Sub

'Private Sub cmdclose_Click()
'If LSelect = 1 Then
'    Ldata1.Clear
'    Ldata1.Visible = False
'End If
' If LSelect = 2 Then
'    Ldata2.Clear
'    Ldata2.Visible = False
'End If
'If LSelect = 3 Then
'    Ldata3.Clear
'    Ldata3.Visible = False
'End If
'If LSelect = 4 Then
 '   Ldata4.Clear
 '   Ldata4.Visible = False
'End If
 '      With msfQuery
'      .Clear
'        .col = 0
'        .Row = 1
 '       .Text = "Attribute"
 '     .Row = 2
  '      .Text = "ClassName"
 '       '.Row = 3
   '     '.Text = "Total"
    '    .Row = 3
   '     .Text = "Sort"
  '      .Row = 4
  '      .Text = "Show"
  '      .Row = 5
  '      .Text = "Criteria"
 '       .Row = 6
 '       .Text = "Or"
  '  End With
  '  txtSQL.Text = ""
  '  SQL = ""
   ' txtcondition.Text = ""
  '  txtTimerange.Text = ""
  '  Latt.Clear
  '  LTimerange.Clear
  ' chkshowtime.Value = False
  '  optjoin.Value = False
  '  optunjoin.Value = False
  '  chktime.Value = False
  '  time = False
  '  flag = False
  '  j = 1
'End Sub

'Private Sub cmddb_Click()
'Dim temtable(50) As String
'Dim i As Integer
'Dim currenttable As String
'Dim nexttable As String
'On Error GoTo DBerror

'If conn.State = adStateOpen Then conn.Close
'Set conn = Nothing
'Ldata1.Clear
  '  myDSN = txtDB.Text
   ' conn.Open myDSN, "_system", "sys"
   ' currenttable = ""
   ' nexttable = ""
  '  i = 1
   ' Set Rssc = conn.OpenSchema(adSchemaColumns)
   ' While Not Rssc.EOF
   ' currenttable = Rssc!Table_Name
   ' If (currenttable <> nexttable) Then
   '     nexttable = Rssc!Table_Name
   '     temtable(i) = Rssc!Table_Name
   '     i = i + 1
    'End If
    '    Rssc.MoveNext
    'Wend
   ' cbotables.Clear
    'For i = 1 To 50
     '   If temtable(i) <> "" Then
     '    Dim B As Integer
     '    B = InStr(temtable(i), "_")
     '       If B < 1 Then
      '          cbotables.AddItem temtable(i)
      '      End If
      '  End If
   ' Next i
   ' Ldata1.Clear
  ' Ldata2.Clear
  '  Ldata3.Clear
  '  Ldata4.Clear
  '  Ldata1.Visible = False
  '  Ldata2.Visible = False
  '  Ldata3.Visible = False
  '  Ldata4.Visible = False
  '     With msfQuery
  '    .Clear
 '       .col = 0
  '      .Row = 1
  '      .Text = "Attribute"
  '      .Row = 2
  '      .Text = "ClassName"
  '      '.Row = 3
  '      '.Text = "Total"
 '       .Row = 3
 '       .Text = "Sort"
 '       .Row = 4
 '       .Text = "Show"
  '      .Row = 5
 '       .Text = "Criteria"
 '       .Row = 6
 '       .Text = "Or"
 '   End With
 '   txtSQL.Text = ""
 '   SQL = ""
 '   txtcondition.Text = ""
 '   txtTimerange.Text = ""
 '   Latt.Clear
 '   LTimerange.Clear
 '   chkshowtime.Value = False
 '   optjoin.Value = False
 '   optunjoin.Value = False
 '   chktime.Value = False
 '   time = False
 '   flag = False
 '   j = 1
'        Exit Sub
'DBerror:
'    MsgBox "DSN Failed : " & Err.Description
'End Sub

Private Sub cmdexit_Click()
    Main.Show
    Unload Me
End Sub
Private Sub DisplayRS(rs As ADODB.Recordset, ListResult As ListView)
    ' Load RS into ListResult
     ' clear the list
On Error GoTo DisplayError
    ListResult.ColumnHeaders.Clear
    ListResult.ListItems.Clear
    ListResult.Enabled = True
   
    ' Set up columns
    Dim col As Integer
    For col = 1 To rs.Fields.count
       ListResult.ColumnHeaders.Add , , rs.Fields(col - 1).Name
       ListResult.ColumnHeaders.item(col).Width = 1750
    Next col
    
    ' fill list control from ResultSet
    Dim item As ListItem
    Dim v As Variant
    
    While Not (rs.EOF)
       
        Set item = ListResult.ListItems.Add
        item.Text = rs.Fields(0).Value
          
        ' do the other columns
        For col = 1 To rs.Fields.count - 1
            v = rs.Fields(col).Value
            item.SubItems(col) = v & " "
        Next col
        
        rs.MoveNext
    Wend
 Exit Sub
DisplayError:
    MsgBox "Display Failed : " & Err.Description
End Sub


Private Sub cmdLoad_Click()
'Dim temp As String
    On Error GoTo Loaderror
  'temp = UCase(txtDB.Text)
  'If Not Cache.Connect(temp) Then
   '     MsgBox "Cannot connect to Cache"
   '     End
   ' End If
    'CacheList1.Factory = Cache
     '  CacheList1.Clear
    'If CacheList1.DynamicSQL(SQL) Then
     '   Cache.TransactionStart
      '  CacheList1.Run
       ' Cache.TransactionCommit
    'End If
  
    ListResult.View = lvwReport
    Dim objcmd As New ADODB.Command
    objcmd.ActiveConnection = conn
       objcmd.CommandText = txtSQL.Text
      objcmd.CommandType = adCmdText
      Dim rs As New ADODB.Recordset
       Set rs = objcmd.Execute
   DisplayRS rs, ListResult
    rs.Close
    Exit Sub
Loaderror:
    MsgBox "Load failed : " & Err.Description
End Sub


Private Sub cmdok_Click()
Dim mb(15) As String
      On Error GoTo OKError
      Call check
      Call CheckVisible
     If optjoin.Value Then
     Dim i, jj
  '/// state x11
   If x11 = 1 And x22 = 1 Then
        For i = 0 To Ldata1.ListCount - 1
         For jj = 0 To Ldata2.ListCount - 1
           If Ldata1.List(i) = Ldata2.List(jj) Then
              If Ldata1.List(i) = Ldata1.List(0) Then
                 mb(1) = Ldata1.List(0) & "." & "ID" & "=" & Ldata2.List(0) & "." & Ldata2.List(jj)
               ElseIf Ldata2.List(jj) = Ldata2.List(0) Then
                 mb(2) = Ldata2.List(0) & "." & "ID" & "=" & Ldata1.List(0) & "." & Ldata1.List(i)
              End If
            End If
         Next jj
        Next i
 End If
   '// state3
  If x11 = 1 And x33 = 1 Then
        For i = 0 To Ldata1.ListCount - 1
         For jj = 0 To Ldata3.ListCount - 1
           If Ldata1.List(i) = Ldata3.List(jj) Then
              If Ldata1.List(i) = Ldata1.List(0) Then
                 mb(3) = Ldata1.List(0) & "." & "ID" & "=" & Ldata3.List(0) & "." & Ldata3.List(jj)
              ElseIf Ldata3.List(jj) = Ldata3.List(0) Then
                 mb(4) = Ldata3.List(0) & "." & "ID" & "=" & Ldata1.List(0) & "." & Ldata1.List(i)
              End If
            End If
         Next jj
        Next i
  End If
        
    If x11 = 1 And x44 = 1 Then
        For i = 0 To Ldata1.ListCount - 1
         For jj = 0 To Ldata4.ListCount - 1
           If Ldata1.List(i) = Ldata4.List(jj) Then
              If Ldata1.List(i) = Ldata1.List(0) Then
                 mb(5) = Ldata1.List(0) & "." & "ID" & "=" & Ldata4.List(0) & "." & Ldata4.List(jj)
               ElseIf Ldata4.List(jj) = Ldata4.List(0) Then
                 mb(6) = Ldata4.List(0) & "." & "ID" & "=" & Ldata1.List(0) & "." & Ldata1.List(i)
              End If
            End If
         Next jj
        Next i
  End If

  '//end state x11
  
  '/// state x22
    If x22 = 1 And x33 = 1 Then
        For i = 0 To Ldata2.ListCount - 1
         For jj = 0 To Ldata3.ListCount - 1
           If Ldata2.List(i) = Ldata3.List(jj) Then
              If Ldata2.List(i) = Ldata2.List(0) Then
                 mb(7) = Ldata2.List(0) & "." & "ID" & "=" & Ldata3.List(0) & "." & Ldata3.List(jj)
               ElseIf Ldata3.List(jj) = Ldata3.List(0) Then
                 mb(8) = Ldata3.List(0) & "." & "ID" & "=" & Ldata2.List(0) & "." & Ldata2.List(i)
              End If
            End If
         Next jj
        Next i
  End If
  '// state2
  If x22 = 1 And x44 = 1 Then
        For i = 0 To Ldata2.ListCount - 1
         For jj = 0 To Ldata4.ListCount - 1
           If Ldata2.List(i) = Ldata4.List(jj) Then
              If Ldata2.List(i) = Ldata2.List(0) Then
                 mb(9) = Ldata2.List(0) & "." & "ID" & "=" & Ldata4.List(0) & "." & Ldata4.List(jj)
               ElseIf Ldata4.List(jj) = Ldata4.List(0) Then
                 mb(10) = Ldata4.List(0) & "." & "ID" & "=" & Ldata2.List(0) & "." & Ldata2.List(i)
              End If
            End If
         Next jj
        Next i
   End If
  
  '//end state x22
  
  '/// state x33
    If x33 = 1 And x44 = 1 Then
        For i = 0 To Ldata3.ListCount - 1
         For jj = 0 To Ldata4.ListCount - 1
           If Ldata3.List(i) = Ldata4.List(jj) Then
              If Ldata3.List(i) = Ldata3.List(0) Then
                 mb(11) = Ldata3.List(0) & "." & "ID" & "=" & Ldata4.List(0) & "." & Ldata4.List(jj)
               ElseIf Ldata4.List(jj) = Ldata4.List(0) Then
                 mb(12) = Ldata4.List(0) & "." & "ID" & "=" & Ldata3.List(0) & "." & Ldata3.List(i)
              End If
            End If
         Next jj
        Next i
  End If
  '//end state x33
  '// answer Join
  
  tempjoin = ""
  For i = 1 To 15
     If mb(i) <> "" And tempjoin = "" Then
        tempjoin = mb(i)
     ElseIf mb(i) <> "" Then
         tempjoin = tempjoin & " and " & mb(i)
     End If
  Next i

        join = tempjoin
        flag = True
     ElseIf optunjoin.Value Then
       flag = False
     End If
     
        SQL = "Select " & Sel & " From " & Table
         
If flag = True Then
       
       If join <> "" Then
            SQL = SQL & " Where " & join
            If Condition <> "" Then
                    SQL = SQL & " and " & Condition
                     If txtcondition.Text <> "" Then
                             SQL = SQL & " and " & txtcondition.Text
                             If txtTimerange.Text <> "" Then
                                    SQL = SQL & " and " & txtTimerange.Text
                             End If
                    Else
                            If txtTimerange.Text <> "" Then
                                  SQL = SQL & " and " & txtTimerange.Text
                             End If
                   End If
             Else
                   If txtcondition.Text <> "" Then
                             SQL = SQL & " and " & txtcondition.Text
                             If txtTimerange.Text <> "" Then
                                    SQL = SQL & " and " & txtTimerange.Text
                             End If
                    Else
                            If txtTimerange.Text <> "" Then
                                  SQL = SQL & " and " & txtTimerange.Text
                             End If
                   End If
            End If
       Else
             If Condition <> "" Then
                   SQL = SQL & " Where " & Condition
                    If txtcondition.Text <> "" Then
                          SQL = SQL & " and " & txtcondition.Text
                             If txtTimerange.Text <> "" Then
                                    SQL = SQL & " and " & txtTimerange.Text
                             End If
                    Else
                            If txtTimerange.Text <> "" Then
                                  SQL = SQL & " and " & txtTimerange.Text
                             End If
                   End If
             Else
                   If txtcondition.Text <> "" Then
                             SQL = SQL & " Where " & txtcondition.Text
                             If txtTimerange.Text <> "" Then
                                    SQL = SQL & " and " & txtTimerange.Text
                             End If
                    Else
                            If txtTimerange.Text <> "" Then
                                  SQL = SQL & " Where " & txtTimerange.Text
                             End If
                   End If
            End If
       End If

Else
             If Condition <> "" Then
                    SQL = SQL & " Where " & Condition
                     If txtcondition.Text <> "" Then
                             SQL = SQL & " and " & txtcondition.Text
                             If txtTimerange.Text <> "" Then
                                    SQL = SQL & " and " & txtTimerange.Text
                             End If
                    Else
                            If txtTimerange.Text <> "" Then
                                  SQL = SQL & " and " & txtTimerange.Text
                             End If
                   End If
             Else
                   If txtcondition.Text <> "" Then
                             SQL = SQL & " Where " & txtcondition.Text
                             If txtTimerange.Text <> "" Then
                                    SQL = SQL & " and " & txtTimerange.Text
                             End If
                    Else
                            If txtTimerange.Text <> "" Then
                                  SQL = SQL & " Where " & txtTimerange.Text
                             End If
                   End If
            End If
End If
If Groupby <> "" Then
    SQL = SQL & Groupby
End If
If Order <> "" Then
    SQL = SQL & Order
End If
        txtSQL.Text = SQL
        Exit Sub
OKError:
    MsgBox "Create SQL failed : " & Err.Description
End Sub

'Private Sub cmdTable_Click()
'Dim Tselect As String
'Dim P0, P1 As Integer
'Dim MyTable
'Dim currenttable As String
'Dim nexttable As String
  ' Tselect = cbotables.Text
   ' currenttable = ""
    'nexttable = ""

  '  Set Rssc = conn.OpenSchema(adSchemaColumns)
'If Ldata1.List(0) = "" Then
 '   Ldata1.Visible = True
  '  While Not Rssc.EOF
  '  currenttable = Rssc!Table_Name
  '  P0 = InStr(currenttable, Tselect)
   ' If P0 = 1 Then
   '     If (currenttable <> nexttable) Then
     '           nexttable = Rssc!Table_Name
    '            P1 = InStr(Rssc!Table_Name, "_")
     '           If P1 >= 1 Then
     '               MyTable = Split(Rssc!Table_Name, "_")
      '              Ldata1.AddItem MyTable(1)
     '           Else
      '              Ldata1.AddItem Rssc!Table_Name
       '             Ldata1.AddItem "*"
       '         End If
      '  End If
      '  If currenttable = Tselect Then
       '         Ldata1.AddItem Rssc!Column_Name
      '  End If
     'End If
     '   Rssc.MoveNext
   ' Wend
    'ElseIf Ldata2.List(0) = "" Then
    'Ldata2.Visible = True
   ' While Not Rssc.EOF
   'currenttable = Rssc!Table_Name
   ' P0 = InStr(currenttable, Tselect)
   ' If P0 = 1 Then
    '    If (currenttable <> nexttable) Then
        '        nexttable = Rssc!Table_Name
          '      P1 = InStr(Rssc!Table_Name, "_")
         '       If P1 >= 1 Then
          '          MyTable = Split(Rssc!Table_Name, "_")
          '          Ldata2.AddItem MyTable(1)
          '      Else
          '          Ldata2.AddItem Rssc!Table_Name
          '          Ldata2.AddItem "*"
          '      End If
         '  End If
        '   If currenttable = Tselect Then
          '      Ldata2.AddItem Rssc!Column_Name
      '  End If
     'End If
     '   Rssc.MoveNext
   ' Wend
  '  ElseIf Ldata3.List(0) = "" Then
   ' Ldata3.Visible = True
 '   While Not Rssc.EOF
 '   currenttable = Rssc!Table_Name
 '   P0 = InStr(currenttable, Tselect)
 '   If P0 = 1 Then
  '      If (currenttable <> nexttable) Then
   '             nexttable = Rssc!Table_Name
   '             P1 = InStr(Rssc!Table_Name, "_")
    '            If P1 >= 1 Then
     '               MyTable = Split(Rssc!Table_Name, "_")
      '              Ldata3.AddItem MyTable(1)
       '         Else
       '             Ldata3.AddItem Rssc!Table_Name
        '            Ldata3.AddItem "*"
      '          End If
     '   End If
    '    If currenttable = Tselect Then
    '            Ldata3.AddItem Rssc!Column_Name
    '    End If
   '  End If
   '     Rssc.MoveNext
   ' Wend
  '  ElseIf Ldata4.List(0) = "" Then
  '  Ldata4.Visible = True
   ' While Not Rssc.EOF
  '  currenttable = Rssc!Table_Name
   ' P0 = InStr(currenttable, Tselect)
  '  If P0 = 1 Then
    '    If (currenttable <> nexttable) Then
    '            nexttable = Rssc!Table_Name
      '          P1 = InStr(Rssc!Table_Name, "_")
       '         If P1 >= 1 Then
          '          MyTable = Split(Rssc!Table_Name, "_")
         '           Ldata4.AddItem MyTable(1)
          '      Else
         '           Ldata4.AddItem Rssc!Table_Name
        '            Ldata4.AddItem "*"
     '           End If
     '   End If
     '   If currenttable = Tselect Then
    '            Ldata4.AddItem Rssc!Column_Name
    '    End If
  '   End If
  '      Rssc.MoveNext
 '   Wend
  '  End If
'End Sub

Private Sub cmdtimeCancel_Click()
    txtTimerange.Text = ""
    Optyear.Value = False
    Optmonth.Value = False
    Optday.Value = False
    Optnow.Value = False
    optHistory.Value = False
End Sub

Private Sub cmdtimeOK_Click()
    Dim TimeFrom As String
    Dim TimeTo As String
    Dim FromDate, HFromDate As String
    Dim ToDate, CToDate As String
    Dim A, B, c, X, Y, Z, D, E, F As String
    Dim i, k, L As Integer
    TimeFrom = dtpFrom
    TimeTo = dtpTo
    A = Year(TimeFrom)
    B = Month(TimeFrom)
    c = Day(TimeFrom)
    X = Year(TimeTo)
    Y = Month(TimeTo)
    Z = Day(TimeTo)
    
    If Optday.Value Then
        If optHistory.Value Then
            TimeFrom = dtpFrom
            X = Year(TimeFrom)
            Y = Month(TimeFrom)
            Z = Day(TimeFrom)
            FromDate = "'" & X & "-" & Y & "-" & Z & "'"
        ElseIf Optnow.Value Then
            TimeTo = Now
            X = Year(TimeTo)
            Y = Month(TimeTo)
            Z = Day(TimeTo)
            ToDate = "'" & X & "-" & Y & "-" & Z & "'"
        Else
            FromDate = "'" & A & "-" & B & "-" & c & "'"
            ToDate = "'" & X & "-" & Y & "-" & Z & "'"
        End If
    ElseIf Optmonth.Value Then
        If optHistory.Value Then
            TimeFrom = dtpFrom
            X = Year(TimeFrom)
            Y = Month(TimeFrom)
            Z = Day(TimeFrom)
            If Y = 2 Then
                FromDate = "'" & X & "-" & Y & "-28'"
             ElseIf Y = 4 Or Y = 6 Or Y = 9 Or Y = 11 Then
                FromDate = "'" & X & "-" & Y & "-30'"
             Else
                FromDate = "'" & X & "-" & Y & "-31'"
             End If
        ElseIf Optnow.Value Then
            TimeTo = Now
            X = Year(TimeTo)
            Y = Month(TimeTo)
            Z = Day(TimeTo)
            ToDate = "'" & X & "-" & Y & "-01'"
        Else
             FromDate = "'" & A & "-" & B & "-01'"
             If Y = 2 Then
                ToDate = "'" & X & "-" & Y & "-28'"
             ElseIf Y = 4 Or Y = 6 Or Y = 9 Or Y = 11 Then
                ToDate = "'" & X & "-" & Y & "-30'"
             Else
                ToDate = "'" & X & "-" & Y & "-31'"
             End If
        End If
    ElseIf Optyear.Value Then
        If optHistory.Value Then
            TimeFrom = dtpFrom
            X = Year(TimeFrom)
            Y = Month(TimeFrom)
            Z = Day(TimeFrom)
            FromDate = "'" & X & "-12-31'"
        ElseIf Optnow.Value Then
            TimeTo = Now
            X = Year(TimeTo)
            Y = Month(TimeTo)
            Z = Day(TimeTo)
            ToDate = "'" & X & "-01-01'"
        Else
            FromDate = "'" & A & "-01-01'"
            ToDate = "'" & X & "-12-31'"
        End If
    End If

If Optday.Value Or Optmonth.Value Or Optyear.Value Then
         If Optnow.Value Then
         For i = 0 To LTimerange.ListCount - 1
         L = InStr(LTimerange.List(i), "ToDate")
         If L >= 1 Then
               If txtTimerange.Text <> "" Then
                    txtTimerange.Text = txtTimerange.Text & " and " & LTimerange.List(i) & " >= " & ToDate
               Else
                   txtTimerange.Text = txtTimerange.Text & "" & LTimerange.List(i) & " >= " & ToDate
               End If
         End If
         Next i
         ElseIf optHistory.Value Then
         For i = 0 To LTimerange.ListCount - 1
         L = InStr(LTimerange.List(i), "FromDate")
         If L >= 1 Then
               If txtTimerange.Text <> "" Then
                   txtTimerange.Text = txtTimerange.Text & " and " & LTimerange.List(i) & " <= " & FromDate
               Else
                  txtTimerange.Text = txtTimerange.Text & "" & LTimerange.List(i) & " <= " & FromDate
               End If
        End If
        Next i
        Else
        For i = 0 To LTimerange.ListCount - 1
            k = InStr(LTimerange.List(i), "FromDate")
            L = InStr(LTimerange.List(i), "ToDate")
            If k >= 1 Then
                If txtTimerange.Text <> "" Then
                    txtTimerange.Text = txtTimerange.Text & " and " & LTimerange.List(i) & " <= " & ToDate
                Else
                    txtTimerange.Text = txtTimerange.Text & "" & LTimerange.List(i) & " <= " & ToDate
                End If
            End If
            If L >= 1 Then
                If txtTimerange.Text <> "" Then
                    txtTimerange.Text = txtTimerange.Text & " and " & LTimerange.List(i) & " >= " & FromDate
                Else
                    txtTimerange.Text = txtTimerange.Text & "" & LTimerange.List(i) & " >= " & FromDate
                End If
            End If
        Next i
        End If
    End If
End Sub


Private Sub dtptimecon_DblClick()
    Dim Timcon As String
    Dim A As String
    Dim B As String
    Dim c As String
    Timcon = dtptimecon
    A = Year(Timcon)
    B = Month(Timcon)
    c = Day(Timcon)
    txtcondition.Text = txtcondition.Text & " " & "'" & A & "-" & B & "-" & c & "'"
End Sub

Private Sub Form_Load()
 SSTab1.Move 0, 0
Left = (Screen.Width - Width) \ 2
Top = (Screen.Height - Height) \ 2
'txtDB.Text = "Project"
    dtpFrom.Value = Now
    dtpTo.Value = #12/31/9999#
    j = 1
    Ldata1.Visible = False
    Ldata2.Visible = False
    Ldata3.Visible = False
    Ldata4.Visible = False
    If chktime.Value Then
        frmTimeUnit.Enabled = True
        frmTimeRange.Enabled = True
        frmTimestate.Enabled = True
        'cmdTimeOK.Enabled = True
        'cmdTimeCancel.Enabled = True
      Else
        frmTimeUnit.Enabled = False
        frmTimeRange.Enabled = False
        frmTimestate.Enabled = False
        'cmdTimeOK.Enabled = False
        'cmdTimeCancel.Enabled = False
    End If
    
    With msfQuery
        .Cols = 20
        .ColWidth(0) = 900
        .ColWidth(1) = 1440
        .ColWidth(2) = 1440
        .ColWidth(3) = 1440
        .ColWidth(4) = 1440
        .ColWidth(5) = 1440
        .Rows = 8
        .col = 0
        .Row = 1
        .Text = "Attribute"
        .Row = 2
        .Text = "ClassName"
         .Row = 7
        .Text = "Total"
        .Row = 3
        .Text = "Sort"
        .Row = 4
        .Text = "Show"
        .Row = 5
        .Text = "Criteria"
        .Row = 6
        .Text = "Or"
    End With

    LOper.AddItem "AND"
    LOper.AddItem "OR"
    LOper.AddItem "NOT"
    LOper.AddItem "IN"
    LOper.AddItem "Like"
    LAthemetic.AddItem "+"
    LAthemetic.AddItem "-"
    LAthemetic.AddItem "*"
    LAthemetic.AddItem "/"
    LAthemetic.AddItem ">"
    LAthemetic.AddItem "<"
    LAthemetic.AddItem "="
    Lformat.AddItem "'"
    Lformat.AddItem """"
    Lformat.AddItem "%"
    Lformat.AddItem "?"
    Lformat.AddItem ","
    Lformat.AddItem "_"
    Lformat.AddItem "("
    Lformat.AddItem ")"
    
    Call GetDSNs '/call dns
    
End Sub
Sub converse()
Dim count As Integer
Dim i As Integer
Dim c As Integer
Dim temp() As String
Dim tempt, Total As String
Dim selflag As Boolean
ReDim temp(j) As String
Call CheckVisible
    With msfQuery
For count = 1 To j
      .col = count
      .Row = 4
    If .Text <> "" Then
      .Row = 1
      If .Text <> "*" Then
            selflag = False
            c = 0
      Do
            If .Text = cboTables.List(c) Or .Text = "ID" Then
                 selflag = True
                 c = cboTables.ListCount
            Else
                 c = c + 1
            End If
        Loop While c < cboTables.ListCount
        .Row = 7
        Total = .Text
        .Row = 1
        If Total <> "" And Total <> "GROUP BY" Then
        If .Text <> "" And selflag = False Then
       'If .Text <> "" And (.Text <> Ldata1.List(0) And .Text <> Ldata2.List(0) And .Text <> Ldata3.List(0) And .Text <> Ldata4.List(0)) Then
            If time Then
                temp(count) = Total & "(" & .Text & "_" & .Text & ") as " & Total & .Text & "," & Total & "(" & .Text & "_FromDate" & ") as " & Total & .Text & "_Fromdate" & "," & Total & "(" & .Text & "_Todate" & ") as " & Total & .Text & "_Todate"
            Else
                temp(count) = Total & " ( " & .Text & "_" & .Text & " )  as " & Total & .Text
            End If
        ElseIf .Text <> "" And selflag = True Then
            .Row = 2
            temp(count) = .Text
            .Row = 1
            temp(count) = Total & "( " & temp(count) & "." & .Text & " ) as " & Total & temp(count) & .Text
        End If
        Else
        If .Text <> "" And selflag = False Then
       'If .Text <> "" And (.Text <> Ldata1.List(0) And .Text <> Ldata2.List(0) And .Text <> Ldata3.List(0) And .Text <> Ldata4.List(0)) Then
            If time Then
                temp(count) = .Text & "_" & .Text & "," & .Text & "_FromDate" & "," & .Text & "_ToDate"
            Else
                temp(count) = .Text & "_" & .Text
            End If
        ElseIf .Text <> "" And selflag = True Then
            .Row = 2
            temp(count) = .Text
            .Row = 1
            temp(count) = temp(count) & "." & .Text
        End If
        
        End If
    ElseIf .Text = "*" Then
            .Row = 2
            If x11 = 1 And .Text = Ldata1.List(0) Then
                For i = 2 To Ldata1.ListCount - 1
                    selflag = False
                    c = 0
                    Do
                        If Ldata1.List(i) = cboTables.List(c) Or Ldata1.List(i) = "ID" Then
                            selflag = True
                            c = cboTables.ListCount
                        Else
                            c = c + 1
                        End If
                    Loop While c < cboTables.ListCount
                    If selflag = False Then
                        If time Then
                              temp(count) = temp(count) & "," & Ldata1.List(i) & "_" & Ldata1.List(i) & "," & Ldata1.List(i) & "_FromDate" & "," & Ldata1.List(i) & "_ToDate"
                        Else
                             temp(count) = temp(count) & "," & Ldata1.List(i) & "_" & Ldata1.List(i)
                         End If
                    Else
                          If temp(count) = "" Then
                                temp(count) = Ldata1.List(0) & "." & Ldata1.List(i)
                          Else
                                temp(count) = temp(count) & "," & Ldata1.List(0) & "." & Ldata1.List(i)
                          End If
                    End If
               Next i
            End If
            If x22 = 1 And .Text = Ldata2.List(0) Then
                For i = 2 To Ldata2.ListCount - 1
                    selflag = False
                    c = 0
                    Do
                        If Ldata2.List(i) = cboTables.List(c) Or Ldata2.List(i) = "ID" Then
                            selflag = True
                            c = cboTables.ListCount
                        Else
                            c = c + 1
                        End If
                    Loop While c < cboTables.ListCount
                    If selflag = False Then
                    
                            If time Then
                                 temp(count) = temp(count) & "," & Ldata2.List(i) & "_" & Ldata2.List(i) & "," & Ldata2.List(i) & "_FromDate" & "," & Ldata2.List(i) & "_ToDate"
                            Else
                                 temp(count) = temp(count) & "," & Ldata2.List(i) & "_" & Ldata2.List(i)
                            End If
                   Else
                          If temp(count) = "" Then
                                temp(count) = Ldata2.List(0) & "." & Ldata2.List(i)
                          Else
                                temp(count) = temp(count) & "," & Ldata2.List(0) & "." & Ldata2.List(i)
                          End If
                  End If
               Next i
            End If
            If x33 = 1 And .Text = Ldata3.List(0) Then
                For i = 2 To Ldata3.ListCount - 1
                    selflag = False
                    c = 0
                    Do
                        If Ldata3.List(i) = cboTables.List(c) Or Ldata3.List(i) = "ID" Then
                            selflag = True
                            c = cboTables.ListCount
                        Else
                            c = c + 1
                        End If
                    Loop While c < cboTables.ListCount
                    If selflag = False Then
                    
                            If time Then
                                 temp(count) = temp(count) & "," & Ldata3.List(i) & "_" & Ldata3.List(i) & "," & Ldata3.List(i) & "_FromDate" & "," & Ldata3.List(i) & "_ToDate"
                            Else
                                 temp(count) = temp(count) & "," & Ldata3.List(i) & "_" & Ldata3.List(i)
                           End If
                   Else
                          If temp(count) = "" Then
                                temp(count) = Ldata3.List(0) & "." & Ldata3.List(i)
                          Else
                                temp(count) = temp(count) & "," & Ldata3.List(0) & "." & Ldata3.List(i)
                          End If
                  End If
               Next i
            End If
            If x44 = 1 And .Text = Ldata4.List(0) Then
                For i = 2 To Ldata4.ListCount - 1
                    selflag = False
                    c = 0
                    Do
                        If Ldata4.List(i) = cboTables.List(c) Or Ldata4.List(i) = "ID" Then
                            selflag = True
                            c = cboTables.ListCount
                        Else
                            c = c + 1
                        End If
                    Loop While c < cboTables.ListCount
                    If selflag = False Then
                    
                            If time Then
                                  temp(count) = temp(count) & "," & Ldata4.List(i) & "_" & Ldata4.List(i) & "," & Ldata4.List(i) & "_FromDate" & "," & Ldata4.List(i) & "_ToDate"
                            Else
                                  temp(count) = temp(count) & "," & Ldata4.List(i) & "_" & Ldata4.List(i)
                            End If
                   Else
                          If temp(count) = "" Then
                                temp(count) = Ldata2.List(0) & "." & Ldata2.List(i)
                          Else
                                temp(count) = temp(count) & "," & Ldata2.List(0) & "." & Ldata2.List(i)
                          End If
                  End If
                  Next i
            End If
        End If
    End If
    Next count
    End With
        'If temp(1) <> "" Then
            Sel = ""
        'End If
    For count = 1 To j
        If temp(count) <> "" And Sel <> "" Then
            Sel = Sel & "," & temp(count)
        ElseIf temp(count) <> "" And Sel = "" Then
            Sel = temp(count)
        End If
    Next count
End Sub
Sub Condi()
Dim count As Integer
Dim i, P0 As Integer
Dim c As Integer
Dim conflag As Boolean
Dim temp() As String
ReDim temp(j) As String
 With msfQuery
    For count = 1 To j
      .Row = 1
      .col = count
     If .Text <> "*" Then
      .Row = 2
      If .Text <> "" Then
                  temp(count) = .Text
            .Row = 1
       conflag = False
      c = 0
            Do
            If .Text = cboTables.List(c) Or .Text = "ID" Then
                conflag = True
                 c = cboTables.ListCount
           Else
               c = c + 1
            End If
            Loop While c < cboTables.ListCount
            If conflag = False Then
                temp(count) = temp(count) & "_" & .Text
                .Row = 2
                temp(count) = temp(count) & "." & .Text & " = " & .Text & ".id"
            Else
               temp(count) = ""
            End If
     End If
     ElseIf .Text = "*" Then
            .Row = 2
            If x11 = 1 And .Text = Ldata1.List(0) Then
                For i = 2 To Ldata1.ListCount - 1
                    conflag = False
                    c = 0
                    Do
                        If Ldata1.List(i) = cboTables.List(c) Or Ldata1.List(i) = "ID" Then
                            conflag = True
                            c = cboTables.ListCount
                        Else
                            c = c + 1
                        End If
                    Loop While c < cboTables.ListCount
                    If conflag = False Then
                          If temp(count) = "" Then
                                temp(count) = Ldata1.List(0) & "_" & Ldata1.List(i) & "." & Ldata1.List(0) & " = " & Ldata1.List(0) & ".id"
                          Else
                                temp(count) = temp(count) & " and " & Ldata1.List(0) & "_" & Ldata1.List(i) & "." & Ldata1.List(0) & " = " & Ldata1.List(0) & ".id"
                          End If
                    End If
               Next i
            End If
            If x22 = 1 And .Text = Ldata2.List(0) Then
                For i = 2 To Ldata2.ListCount - 1
                    conflag = False
                    c = 0
                    Do
                        If Ldata2.List(i) = cboTables.List(c) Or Ldata2.List(i) = "ID" Then
                            conflag = True
                            c = cboTables.ListCount
                        Else
                            c = c + 1
                        End If
                    Loop While c < cboTables.ListCount
                    If conflag = False Then
                          If temp(count) = "" Then
                                temp(count) = Ldata2.List(0) & "_" & Ldata2.List(i) & "." & Ldata2.List(0) & " = " & Ldata2.List(0) & ".id"
                          Else
                                temp(count) = temp(count) & " and " & Ldata2.List(0) & "_" & Ldata2.List(i) & "." & Ldata2.List(0) & " = " & Ldata2.List(0) & ".id"
                          End If
                    End If
               Next i
            End If
            If x33 = 1 And .Text = Ldata3.List(0) Then
                For i = 2 To Ldata3.ListCount - 1
                    conflag = False
                    c = 0
                    Do
                        If Ldata3.List(i) = cboTables.List(c) Or Ldata3.List(i) = "ID" Then
                            conflag = True
                            c = cboTables.ListCount
                        Else
                            c = c + 1
                        End If
                    Loop While c < cboTables.ListCount
                    If conflag = False Then
                          If temp(count) = "" Then
                                temp(count) = Ldata3.List(0) & "_" & Ldata3.List(i) & "." & Ldata3.List(0) & " = " & Ldata3.List(0) & ".id"
                          Else
                                temp(count) = temp(count) & " and " & Ldata3.List(0) & "_" & Ldata3.List(i) & "." & Ldata3.List(0) & " = " & Ldata3.List(0) & ".id"
                          End If
                    End If
               Next i
            End If
            If x44 = 1 And .Text = Ldata4.List(0) Then
                For i = 2 To Ldata4.ListCount - 1
                    conflag = False
                    c = 0
                    Do
                        If Ldata4.List(i) = cboTables.List(c) Or Ldata4.List(i) = "ID" Then
                            conflag = True
                            c = cboTables.ListCount
                        Else
                            c = c + 1
                        End If
                    Loop While c < cboTables.ListCount
                    If conflag = False Then
                          If temp(count) = "" Then
                                temp(count) = Ldata4.List(0) & "_" & Ldata4.List(i) & "." & Ldata4.List(0) & " = " & Ldata4.List(0) & ".id"
                          Else
                                temp(count) = temp(count) & " and " & Ldata4.List(0) & "_" & Ldata4.List(i) & "." & Ldata4.List(0) & " = " & Ldata4.List(0) & ".id"
                          End If
                    End If
               Next i
            End If
        End If
    
 Next count
    End With
  
         Condition = ""
  
    For count = 1 To j
        P0 = InStr(Condition, temp(count))
        If P0 < 1 Then
            If temp(count) <> "" And Condition <> "" Then
                Condition = Condition & " and " & temp(count)
            ElseIf temp(count) <> "" And Condition = "" Then
                Condition = temp(count)
            End If
        End If
    Next count
End Sub
Sub Listcon()
Dim count As Integer
Dim c As Integer
Dim liscflag As Boolean
Dim i As Integer
Dim temp() As String
Dim tempt As String
ReDim temp(j) As String
    Latt.Clear
    LTimerange.Clear
    Call CheckVisible
    With msfQuery
    For count = 1 To j
      .col = count
      .Row = 1
      If .Text <> "*" And .Text <> "" Then
      liscflag = False
      c = 0
      Do
           If .Text = cboTables.List(c) Or .Text = "ID" Then
                 liscflag = True
                 c = cboTables.ListCount
            Else
                 c = c + 1
            End If
       Loop While c < cboTables.ListCount
       If .Text <> "" And liscflag = False Then
            Latt.AddItem .Text & "_" & .Text
            Latt.AddItem .Text & "_FromDate"
            LTimerange.AddItem .Text & "_FromDate"
            Latt.AddItem .Text & "_ToDate"
            LTimerange.AddItem .Text & "_ToDate"
        ElseIf .Text <> "" Then
          .Row = 2
          temp(count) = .Text
          .Row = 1
          Latt.AddItem temp(count) & "." & .Text
        End If
     ElseIf .Text = "*" And .Text <> "" Then
            .Row = 2
            If x11 = 1 And .Text = Ldata1.List(0) Then
                For i = 2 To Ldata1.ListCount - 1
                    liscflag = False
                    c = 0
                    Do
                        If Ldata1.List(i) = cboTables.List(c) Or Ldata1.List(i) = "ID" Then
                            liscflag = True
                            c = cboTables.ListCount
                        Else
                            c = c + 1
                        End If
                    Loop While c < cboTables.ListCount
                    If liscflag = False Then
                             Latt.AddItem Ldata1.List(i) & "_" & Ldata1.List(i)
                             Latt.AddItem Ldata1.List(i) & "_FromDate"
                             LTimerange.AddItem Ldata1.List(i) & "_FromDate"
                             Latt.AddItem Ldata1.List(i) & "_ToDate"
                             LTimerange.AddItem Ldata1.List(i) & "_ToDate"
                    Else
                            Latt.AddItem Ldata1.List(0) & "." & Ldata1.List(i)
                    End If
               Next i
            End If
            If x22 = 1 And .Text = Ldata2.List(0) Then
                For i = 2 To Ldata2.ListCount - 1
                    liscflag = False
                    c = 0
                    Do
                        If Ldata2.List(i) = cboTables.List(c) Or Ldata2.List(i) = "ID" Then
                            liscflag = True
                            c = cboTables.ListCount
                        Else
                            c = c + 1
                        End If
                    Loop While c < cboTables.ListCount
                    If liscflag = False Then
                             Latt.AddItem Ldata2.List(i) & "_" & Ldata2.List(i)
                             Latt.AddItem Ldata2.List(i) & "_FromDate"
                             LTimerange.AddItem Ldata2.List(i) & "_FromDate"
                             Latt.AddItem Ldata2.List(i) & "_ToDate"
                             LTimerange.AddItem Ldata2.List(i) & "_ToDate"
                    Else
                            Latt.AddItem Ldata2.List(0) & "." & Ldata2.List(i)
                    End If
               Next i
            End If
            If x33 = 1 And .Text = Ldata3.List(0) Then
                For i = 3 To Ldata3.ListCount - 1
                    liscflag = False
                    c = 0
                    Do
                        If Ldata3.List(i) = cboTables.List(c) Or Ldata3.List(i) = "ID" Then
                            liscflag = True
                            c = cboTables.ListCount
                        Else
                            c = c + 1
                        End If
                    Loop While c < cboTables.ListCount
                    If liscflag = False Then
                             Latt.AddItem Ldata3.List(i) & "_" & Ldata3.List(i)
                             Latt.AddItem Ldata3.List(i) & "_FromDate"
                             LTimerange.AddItem Ldata3.List(i) & "_FromDate"
                             Latt.AddItem Ldata3.List(i) & "_ToDate"
                             LTimerange.AddItem Ldata3.List(i) & "_ToDate"
                    Else
                            Latt.AddItem Ldata3.List(0) & "." & Ldata3.List(i)
                    End If
               Next i
            End If
            If x44 = 1 And .Text = Ldata4.List(0) Then
                For i = 2 To Ldata4.ListCount - 1
                    liscflag = False
                    c = 0
                    Do
                        If Ldata4.List(i) = cboTables.List(c) Or Ldata4.List(i) = "ID" Then
                            liscflag = True
                            c = cboTables.ListCount
                        Else
                            c = c + 1
                        End If
                    Loop While c < cboTables.ListCount
                    If liscflag = False Then
                             Latt.AddItem Ldata4.List(i) & "_" & Ldata4.List(i)
                             Latt.AddItem Ldata4.List(i) & "_FromDate"
                             LTimerange.AddItem Ldata4.List(i) & "_FromDate"
                             Latt.AddItem Ldata4.List(i) & "_ToDate"
                             LTimerange.AddItem Ldata4.List(i) & "_ToDate"
                    Else
                            Latt.AddItem Ldata4.List(0) & "." & Ldata4.List(i)
                    End If
               Next i
         End If
     End If
     Next count
    End With
End Sub
Sub check()
Dim count As Integer
Dim i, P0, P1 As Integer
Dim Tatal As String
Dim tabflag As Boolean
Dim c As Integer
Dim temp() As String
ReDim temp(j) As String
On Error GoTo CheckError
    With msfQuery
      For count = 1 To j
      .col = count
      .Row = 2
      If .Text <> "" Then
          temp(count) = .Text
      End If
    Next count
        
          Table = ""
  
    For count = 1 To j
        .Row = 1
        .col = count
    If .Text <> "*" Then
        tabflag = False
      c = 0
      Do
           If .Text = cboTables.List(c) Or .Text = "ID" Then
                 tabflag = True
                c = cboTables.ListCount
            Else
                 c = c + 1
            End If
        Loop While c < cboTables.ListCount
                 P1 = InStr(Table, .Text)
                 P0 = InStr(Table, " " & temp(count))
       If P1 < 1 Then
       If temp(count) <> "" And temp(1) = temp(count) And tabflag = False Then
              If Table = "" Then
                Table = " " & temp(count)
                Table = Table & " , " & temp(count) & "_" & .Text
              Else
                Table = Table & " ,  " & temp(count) & "_" & .Text
              End If
       ElseIf temp(count) <> "" And tabflag = False Then
              temp(1) = temp(count)
              If Table = "" Then
                Table = " " & temp(count)
              Else
                If P0 >= 1 Then
                    Table = Table
                 Else
                    Table = Table & " , " & temp(count)
                End If
              End If
                Table = Table & " , " & temp(count) & "_" & .Text
       ElseIf temp(count) <> "" Then
             If P0 >= 1 Then
                 Table = Table
            Else
                If Table = "" Then
                    Table = " " & temp(count)
                Else
                    Table = Table & " , " & temp(count)
                End If
            End If
        End If
        End If
    
    ElseIf .Text = "*" Then
            .Row = 2
            If x11 = 1 And .Text = Ldata1.List(0) Then
                 If Table = "" Then
                        Table = Ldata1.List(0)
                 Else
                        Table = Table & " , " & Ldata1.List(0)
                 End If
                 For i = 2 To Ldata1.ListCount - 1
                    tabflag = False
                    c = 0
                    Do
                        If Ldata1.List(i) = cboTables.List(c) Or Ldata1.List(i) = "ID" Then
                            tabflag = True
                            c = cboTables.ListCount
                        Else
                            c = c + 1
                        End If
                    Loop While c < cboTables.ListCount
                    If tabflag = False Then
                        Table = Table & " , " & Ldata1.List(0) & "_" & Ldata1.List(i)
                    End If
                Next i
            End If
            If x22 = 1 And .Text = Ldata2.List(0) Then
                If Table = "" Then
                    Table = Ldata2.List(0)
                Else
                    Table = Table & " , " & Ldata2.List(0)
                End If
                For i = 2 To Ldata2.ListCount - 1
                    tabflag = False
                    c = 0
                    Do
                        If Ldata2.List(i) = cboTables.List(c) Or Ldata2.List(i) = "ID" Then
                            tabflag = True
                            c = cboTables.ListCount
                        Else
                            c = c + 1
                        End If
                    Loop While c < cboTables.ListCount
                    If tabflag = False Then
                           Table = Table & " , " & Ldata2.List(0) & "_" & Ldata2.List(i)
                   End If
                Next i
            End If
            If x33 = 1 And .Text = Ldata3.List(0) Then
                If Table = "" Then
                    Table = Ldata3.List(0)
                Else
                    Table = Table & " , " & Ldata3.List(0)
                End If
                For i = 2 To Ldata3.ListCount - 1
                    tabflag = False
                    c = 0
                    Do
                        If Ldata3.List(i) = cboTables.List(c) Or Ldata3.List(i) = "ID" Then
                            tabflag = True
                            c = cboTables.ListCount
                        Else
                            c = c + 1
                        End If
                    Loop While c < cboTables.ListCount
                    If tabflag = False Then
                           Table = Table & " , " & Ldata3.List(0) & "_" & Ldata3.List(i)
                   End If
                Next i
            End If
            If x44 = 1 And .Text = Ldata4.List(0) Then
                 If Table = "" Then
                    Table = Ldata4.List(0)
                Else
                    Table = Table & " , " & Ldata4.List(0)
                End If
                For i = 2 To Ldata4.ListCount - 1
                    tabflag = False
                    c = 0
                    Do
                        If Ldata4.List(i) = cboTables.List(c) Or Ldata4.List(i) = "ID" Then
                            tabflag = True
                            c = cboTables.ListCount
                        Else
                            c = c + 1
                        End If
                    Loop While c < cboTables.ListCount
                    If tabflag = False Then
                           Table = Table & " , " & Ldata4.List(0) & "_" & Ldata4.List(i)
                   End If
                Next i
            End If
        End If
    Next count
    End With
    Call converse
    Call Condi
    Call Groupb
    Call Orderb
    Exit Sub
CheckError:
    MsgBox "SQL  failed : " & Err.Description
End Sub
Sub Groupb()
Dim count As Integer
Dim TempGroup As String
Dim Groupflag As Boolean
Dim c As Integer
Dim temp As String
On Error GoTo GroupError
TempGroup = ""
Groupby = ""
With msfQuery

For count = 1 To j
     .Row = 7
    .col = count
    If .Text = "GROUP BY" Then
    .Row = 1
      Groupflag = False
      c = 0
      Do
           If .Text = cboTables.List(c) Or .Text = "ID" Then
                 Groupflag = True
                c = cboTables.ListCount
            Else
                 c = c + 1
            End If
        Loop While c < cboTables.ListCount
        If Groupflag = True Then
                .Row = 2
                temp = .Text
                .Row = 1
            If TempGroup = "" Then
                TempGroup = " GROUP BY " & temp & "." & .Text
            Else
                TempGroup = TempGroup & " , " & temp & "." & .Text
            End If
        Else
            If TempGroup = "" Then
                TempGroup = " GROUP BY " & .Text & "_" & .Text
            Else
                TempGroup = TempGroup & " , " & .Text & "_" & .Text
            End If
        End If
    End If
  Next count
  End With
    Groupby = TempGroup
    Exit Sub
GroupError:
    MsgBox "Group by  failed : " & Err.Description
End Sub

Sub Orderb()
Dim count As Integer
Dim TempOr As String
Dim orderflag As Boolean
Dim c As Integer
Dim temp As String
On Error GoTo OrderError
TempOr = ""
Order = ""
With msfQuery
For count = 1 To j
     .Row = 1
     .col = count
     If .Text <> "" Then
     .Row = 3
    .col = count
    If .Text = "ASC" Then
    .Row = 1
      orderflag = False
      c = 0
      Do
           If .Text = cboTables.List(c) Or .Text = "ID" Then
                 orderflag = True
                c = cboTables.ListCount
            Else
                 c = c + 1
            End If
        Loop While c < cboTables.ListCount
        If orderflag = True Then
                .Row = 2
                temp = .Text
                .Row = 1
            If TempOr = "" Then
                TempOr = " ORDER BY " & temp & "." & .Text & " ASC "
            Else
                TempOr = TempOr & " , " & temp & "." & .Text & " ASC "
            End If
        Else
            If TempOr = "" Then
                TempOr = " ORDER BY " & .Text & "_" & .Text & " ASC "
            Else
                TempOr = TempOr & " , " & .Text & "_" & .Text & " ASC "
            End If
        End If
    ElseIf .Text = "DESC" Then
    .Row = 1
    orderflag = False
    c = 0
        Do
           If .Text = cboTables.List(c) Or .Text = "ID" Then
                 orderflag = True
                c = cboTables.ListCount
            Else
                 c = c + 1
            End If
        Loop While c < cboTables.ListCount
        If orderflag = True Then
                .Row = 2
                temp = .Text
                .Row = 1
            If TempOr = "" Then
                TempOr = " ORDER BY " & temp & "." & .Text & " DESC "
            Else
                TempOr = TempOr & " , " & temp & "." & .Text & " DESC "
            End If
        Else
            If TempOr = "" Then
                TempOr = " ORDER BY " & .Text & "_" & .Text & " DESC "
            Else
                TempOr = TempOr & " , " & .Text & "_" & .Text & " DESC "
            End If
        End If
    End If
    End If
  Next count
  End With
    Order = TempOr
    Exit Sub
OrderError:
    MsgBox "Order  failed : " & Err.Description
End Sub
Private Sub Ldata1_Click()
        LSelect = 1
End Sub

Private Sub Ldata1_DblClick()
    On Error GoTo LData1Error
    If Ldata1.ListIndex <> 0 Then
    With msfQuery
        .col = j
        .Row = 2
        .Text = Ldata1.List(0)
        .Row = 1
        .Text = Ldata1.List(Ldata1.ListIndex)
        .Row = 4
        .Text = "       x"
    End With
    j = j + 1
    End If
    Call Listcon
    Exit Sub
LData1Error:
    MsgBox "Select  failed : " & Err.Description
End Sub
Private Sub Ldata3_Click()
    LSelect = 3
End Sub
Private Sub Ldata4_Click()
    LSelect = 4
End Sub
Private Sub Ldata2_Click()
    LSelect = 2
End Sub

Private Sub Ldata2_DblClick()
On Error GoTo LData2Error
    If Ldata2.ListIndex <> 0 Then
    With msfQuery
        .col = j
        .Row = 2
        .Text = Ldata2.List(0)
        .Row = 1
        .Text = Ldata2.List(Ldata2.ListIndex)
        .Row = 4
        .Text = "       x"
    End With
    j = j + 1
    End If
    Call Listcon
    Exit Sub
LData2Error:
    MsgBox "Select  failed : " & Err.Description
End Sub


Private Sub LAthemetic_DblClick()
    txtcondition.Text = txtcondition.Text & "" & LAthemetic.List(LAthemetic.ListIndex)
End Sub

Private Sub LAtt_DblClick()
    txtcondition.Text = txtcondition.Text & " " & Latt.List(Latt.ListIndex) & " "
End Sub
Private Sub Ldata3_DblClick()
    On Error GoTo LData3Error
    If Ldata3.ListIndex <> 0 Then
    With msfQuery
        .col = j
        .Row = 2
        .Text = Ldata3.List(0)
        .Row = 1
        .Text = Ldata3.List(Ldata3.ListIndex)
        .Row = 4
        .Text = "       x"
    End With
    j = j + 1
    End If
    Call Listcon
    Exit Sub
LData3Error:
    MsgBox "Select  failed : " & Err.Description
End Sub
Private Sub Ldata4_DblClick()
    On Error GoTo LData4Error
    If Ldata4.ListIndex <> 0 Then
    With msfQuery
        .col = j
        .Row = 2
        .Text = Ldata4.List(0)
        .Row = 1
        .Text = Ldata4.List(Ldata4.ListIndex)
        .Row = 4
        .Text = "       x"
    End With
    j = j + 1
    End If
    Call Listcon
Exit Sub
LData4Error:
    MsgBox "Select  failed : " & Err.Description
End Sub

Private Sub Lformat_DblClick()
    txtcondition.Text = txtcondition.Text & "" & Lformat.List(Lformat.ListIndex)
End Sub

Private Sub LOper_DblClick()
    txtcondition.Text = txtcondition.Text & " " & LOper.List(LOper.ListIndex) & " "
End Sub
Private Sub msfQuery_DblClick()
    Dim X As Integer
    Dim Y As Integer
    On Error GoTo msfQueryError
    X = msfQuery.Row
    Y = msfQuery.col
    With msfQuery
        .col = Y
        If X = 4 Then
            .Row = 4
            If .Text = "       x" Then
                .Text = ""
            ElseIf .Text = "" Then
                .Text = "       x"
            End If
       ElseIf X = 3 Then
            .Row = 3
             If .Text = "ASC" Then
                .Text = "DESC"
            ElseIf .Text = "DESC" Then
                .Text = ""
            ElseIf .Text = "" Then
                .Text = "ASC"
            End If
       ElseIf X = 7 Then
            .Row = 7
            If .Text = "MIN" Then
                .Text = "MAX"
            ElseIf .Text = "MAX" Then
                .Text = "AVG"
            ElseIf .Text = "AVG" Then
                .Text = "COUNT"
            ElseIf .Text = "COUNT" Then
                .Text = "GROUP BY"
            ElseIf .Text = "GROUP BY" Then
                .Text = ""
           ElseIf .Text = "" Then
                .Text = "MIN"
           End If
       End If
    End With
    Exit Sub
msfQueryError:
    MsgBox "Duble Clik  failed : " & Err.Description
End Sub



Sub SSTab1_DragDrop(Source As Control, X As Single, Y As Single)
   ' Move the control to the position of the mouse pointer.
   ' Adjust it by the distance the mouse pointer to the upper
   ' left corner of the control.
   Source.Move X - Save_X, Y - Save_Y
End Sub
'//list1
Sub Ldata1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   Save_X = X       ' save mouse position (relative to this control)
   Save_Y = Y
   Ldata1.Drag 1  ' begin dragging
End Sub
 'Enter the following Sub as one, single line:

Sub Ldata1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
   Ldata1.Drag 2  ' end dragging, do DragDrop event
End Sub

Sub Ldata1_DragDrop(Source As Control, X As Single, Y As Single)
   ' This handles the case when the control is dropped on itself
   ' as would happen if it was only moved a small amount.
   ' This is similar to Form_DragDrop except that the X and Y
   ' parameters are relative to this control, not the form.
   Source.Move Ldata1.Left + X - Save_X, Ldata1.Top + Y - Save_Y
End Sub

'//Ldata2
Sub Ldata2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   Save_X = X       ' save mouse position (relative to this control)
   Save_Y = Y
   Ldata2.Drag 1  ' begin dragging
End Sub

 'Enter the following Sub as one, single line:

Sub Ldata2_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
   Ldata2.Drag 2  ' end dragging, do DragDrop event
End Sub

Sub Ldata2_DragDrop(Source As Control, X As Single, Y As Single)
   ' This handles the case when the control is dropped on itself
   ' as would happen if it was only moved a small amount.
   ' This is similar to Form_DragDrop except that the X and Y
   ' parameters are relative to this control, not the form.
   Source.Move Ldata2.Left + X - Save_X, Ldata2.Top + Y - Save_Y
End Sub
'//Ldata3
Sub Ldata3_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   Save_X = X       ' save mouse position (relative to this control)
   Save_Y = Y
   Ldata3.Drag 1  ' begin dragging
End Sub

 'Enter the following Sub as one, single line:

Sub Ldata3_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
   Ldata3.Drag 2  ' end dragging, do DragDrop event
End Sub

Sub Ldata3_DragDrop(Source As Control, X As Single, Y As Single)
   ' This handles the case when the control is dropped on itself
   ' as would happen if it was only moved a small amount.
   ' This is similar to Form_DragDrop except that the X and Y
   ' parameters are relative to this control, not the form.
   Source.Move Ldata3.Left + X - Save_X, Ldata3.Top + Y - Save_Y
End Sub
'//Ldata4
Sub Ldata4_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   Save_X = X       ' save mouse position (relative to this control)
   Save_Y = Y
   Ldata4.Drag 1  ' begin dragging
End Sub

 'Enter the following Sub as one, single line:

Sub Ldata4_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
   Ldata4.Drag 2  ' end dragging, do DragDrop event
End Sub

Sub Ldata4_DragDrop(Source As Control, X As Single, Y As Single)
   ' This handles the case when the control is dropped on itself
   ' as would happen if it was only moved a small amount.
   ' This is similar to Form_DragDrop except that the X and Y
   ' parameters are relative to this control, not the form.
   Source.Move Ldata4.Left + X - Save_X, Ldata4.Top + Y - Save_Y
End Sub


