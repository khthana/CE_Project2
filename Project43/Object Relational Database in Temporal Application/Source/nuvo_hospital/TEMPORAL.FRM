VERSION 5.00
Object = "{BF448208-70DE-11CF-947B-0020AF75C4BA}#1.0#0"; "navctl32.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form temporal 
   Caption         =   "EXAMPLES OF TEMPORAL QUESTION"
   ClientHeight    =   9600
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9885
   Icon            =   "temporal.frx":0000
   LinkTopic       =   "Form2"
   Picture         =   "temporal.frx":030A
   ScaleHeight     =   9600
   ScaleWidth      =   9885
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox tx_datetime 
      BackColor       =   &H8000000B&
      Height          =   285
      Left            =   8160
      TabIndex        =   16
      Top             =   120
      Width           =   1455
   End
   Begin VB.Timer Timer1 
      Interval        =   5
      Left            =   6720
      Top             =   0
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   8055
      Left            =   0
      TabIndex        =   6
      Top             =   600
      Width           =   9855
      _ExtentX        =   17383
      _ExtentY        =   14208
      _Version        =   393216
      Tab             =   2
      TabsPerRow      =   5
      TabHeight       =   882
      TabCaption(0)   =   "MIS 1"
      TabPicture(0)   =   "temporal.frx":17667C
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "Frame1"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).ControlCount=   1
      TabCaption(1)   =   "MIS 2"
      TabPicture(1)   =   "temporal.frx":176996
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "Frame2"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).ControlCount=   1
      TabCaption(2)   =   "MIS 3"
      TabPicture(2)   =   "temporal.frx":176CB0
      Tab(2).ControlEnabled=   -1  'True
      Tab(2).Control(0)=   "Frame3"
      Tab(2).Control(0).Enabled=   0   'False
      Tab(2).ControlCount=   1
      Begin VB.Frame Frame3 
         Caption         =   "ตัวอย่างคำถามที่ 3"
         Height          =   7215
         Left            =   120
         TabIndex        =   13
         Top             =   720
         Width           =   9615
         Begin VB.ComboBox cb_name 
            Height          =   315
            Left            =   4320
            TabIndex        =   2
            Top             =   480
            Width           =   2175
         End
         Begin MSComctlLib.ListView ls4 
            Height          =   3300
            Left            =   120
            TabIndex        =   14
            Top             =   3480
            Width           =   9375
            _ExtentX        =   16536
            _ExtentY        =   5821
            View            =   3
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            GridLines       =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   1
            NumItems        =   11
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "ROOM"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Text            =   "HN1"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Text            =   "NAME1"
               Object.Width           =   2293
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Text            =   "SURNAME1"
               Object.Width           =   2293
            EndProperty
            BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   4
               Text            =   "AN1"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   5
               Text            =   "HN2"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   6
               Text            =   "NAME2"
               Object.Width           =   2293
            EndProperty
            BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   7
               Text            =   "SURNAME2"
               Object.Width           =   2293
            EndProperty
            BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   8
               Text            =   "AN2"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   9
               Text            =   "FROM"
               Object.Width           =   2117
            EndProperty
            BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   10
               Text            =   "TO"
               Object.Width           =   2117
            EndProperty
         End
         Begin MSComctlLib.ListView ls3 
            Height          =   1695
            Left            =   120
            TabIndex        =   3
            Top             =   1200
            Width           =   9375
            _ExtentX        =   16536
            _ExtentY        =   2990
            View            =   3
            LabelEdit       =   1
            LabelWrap       =   -1  'True
            HideSelection   =   0   'False
            FullRowSelect   =   -1  'True
            GridLines       =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   1
            NumItems        =   13
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "HN"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Text            =   "NAME"
               Object.Width           =   1764
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Text            =   "SURNAME"
               Object.Width           =   1764
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Text            =   "BIRTHDATE"
               Object.Width           =   1764
            EndProperty
            BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   4
               Text            =   "SEX"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   5
               Text            =   "IDNUMBER"
               Object.Width           =   1764
            EndProperty
            BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   6
               Text            =   "BG"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   7
               Text            =   "ADDRESS"
               Object.Width           =   5292
            EndProperty
            BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   8
               Text            =   "TEL_NUMBER"
               Object.Width           =   2646
            EndProperty
            BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   9
               Text            =   "DISEASE"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   10
               Text            =   "ALERGY_MEDICINE"
               Object.Width           =   4410
            EndProperty
            BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   11
               Text            =   "D.N."
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(13) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   12
               Text            =   "A.N."
               Object.Width           =   882
            EndProperty
         End
         Begin VB.Label Label3 
            Caption         =   "ใครเคยอยู่ห้องเดียวกับคุณ                                                   บ้าง"
            Height          =   255
            Left            =   2400
            TabIndex        =   15
            Top             =   480
            Width           =   4455
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "ตัวอย่างคำถามที่ 2"
         Height          =   7575
         Left            =   -74880
         TabIndex        =   10
         Top             =   720
         Width           =   9615
         Begin VB.ComboBox cb_room2 
            Height          =   315
            Left            =   4800
            TabIndex        =   1
            Top             =   480
            Width           =   1095
         End
         Begin MSComctlLib.ListView ls2 
            Height          =   4500
            Left            =   120
            TabIndex        =   11
            Top             =   1320
            Width           =   9375
            _ExtentX        =   16536
            _ExtentY        =   7938
            View            =   3
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            GridLines       =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   1
            NumItems        =   10
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "HN1"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Text            =   "NAME1"
               Object.Width           =   2293
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Text            =   "SURNAME1"
               Object.Width           =   2293
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Text            =   "AN1"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   4
               Text            =   "HN2"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   5
               Text            =   "NAME2"
               Object.Width           =   2293
            EndProperty
            BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   6
               Text            =   "SURNAME2"
               Object.Width           =   2293
            EndProperty
            BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   7
               Text            =   "AN2"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   8
               Text            =   "FROM"
               Object.Width           =   2117
            EndProperty
            BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   9
               Text            =   "TO"
               Object.Width           =   2117
            EndProperty
         End
         Begin VB.Label Label2 
            Caption         =   "ใครเคยอยู่ห้องหมายเลข                              ณ เวลาเดียวกันบ้าง"
            Height          =   255
            Left            =   3000
            TabIndex        =   12
            Top             =   480
            Width           =   4455
         End
      End
      Begin VB.Frame Frame1 
         Caption         =   "ตัวอย่างคำถามที่ 1"
         Height          =   7335
         Left            =   -74640
         TabIndex        =   7
         Top             =   720
         Width           =   9135
         Begin VB.ComboBox cb_room1 
            Height          =   315
            Left            =   4440
            TabIndex        =   0
            Top             =   480
            Width           =   1095
         End
         Begin MSComctlLib.ListView ls1 
            Height          =   4500
            Left            =   1200
            TabIndex        =   8
            Top             =   1320
            Width           =   6855
            _ExtentX        =   12091
            _ExtentY        =   7938
            View            =   3
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            GridLines       =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   1
            NumItems        =   6
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "HN"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Text            =   "NAME"
               Object.Width           =   2646
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Text            =   "SURNAME"
               Object.Width           =   2646
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Text            =   "AN"
               Object.Width           =   882
            EndProperty
            BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   4
               Text            =   "FROM"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   5
               Text            =   "TO"
               Object.Width           =   2540
            EndProperty
         End
         Begin VB.Label Label1 
            Caption         =   "ใครเคยอยู่ห้องหมายเลข                             บ้าง"
            Height          =   255
            Left            =   2640
            TabIndex        =   9
            Top             =   480
            Width           =   3375
         End
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "EXIT"
      Height          =   735
      Left            =   8400
      Picture         =   "temporal.frx":176FCA
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   8760
      Width           =   1335
   End
   Begin Navctl32Lib.NavControl patience_nav 
      Height          =   600
      Left            =   120
      TabIndex        =   5
      Top             =   8880
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
      Ctrl1Width      =   30
      Ctrl1Height     =   20
      Ctrl2ID         =   2
      Ctrl2Style      =   1
      Ctrl2Caption    =   ""
      Ctrl2Width      =   30
      Ctrl2Height     =   20
      Ctrl3ID         =   3
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
      Ctrl5Style      =   2
      Ctrl5Caption    =   "patience - #"
      Ctrl5Left       =   240
      Ctrl5Width      =   297
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
      Ctrl11Left      =   572
      Ctrl11Width     =   30
      Ctrl11Height    =   20
      Ctrl12ID        =   7
      Ctrl12Style     =   1
      Ctrl12Caption   =   ""
      Ctrl12Left      =   602
      Ctrl12Width     =   30
      Ctrl12Height    =   20
      Ctrl13ID        =   8
      Ctrl13Style     =   1
      Ctrl13Caption   =   ""
      Ctrl13Left      =   632
      Ctrl13Width     =   30
      Ctrl13Height    =   20
   End
   Begin VB.Label Label31 
      Caption         =   "DateTime ::"
      Height          =   255
      Left            =   7200
      TabIndex        =   17
      Top             =   120
      Width           =   855
   End
End
Attribute VB_Name = "temporal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public rowid_room
Public rowid_patience
Public ptime

Sub namearray()
Dim oVtable1 As ddoTable
Dim oVtable2 As ddoTable
On Error GoTo error1
    sql = "execute function CAPN()"
    Set oVtable1 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    nrecord = oVtable1.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable1.Name)
    ReDim name_char(nrecord - 1)
    ReDim name_id(nrecord - 1)
    i = 0
    sql = "select rowid from patience"
    Set oVtable1 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    While Not oVtable1.EOT
    rowid_patience = oVtable1.Columns(1).Value
    sql = "execute procedure allname(" & rowid_patience & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result"
    Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    While Not oVtable2.EOT
        name_char(i) = Trim(oVtable2.Columns(1).Value)
        name_id(i) = rowid_patience
        i = i + 1
        oVtable2.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
    oVtable1.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable1.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cb_name_Click()
On Error GoTo error1
    If cb_name.Text <> "" Then
    ls3.ListItems.clear
    ls4.ListItems.clear
    temporal.MousePointer = 11
    sql = "execute procedure nameNSEQ('" & cb_name.Text & "');"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)

    sql = "execute procedure checksingle_int();"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from single_int"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
If oVtable.Columns(1).Value <> "nothing" Then
    i = oVtable.TotalRecordCount - 1
    ReDim id_col(i) As Integer
    j = 0
    While Not oVtable.EOT
        id_col(j) = oVtable.Columns(1).Value
        j = j + 1
        oVtable.NextRecord
    Wend
    ptime = forever
    Call queryname
    Else: MsgBox "No data match", OK = vbOKOnly, "Not Found"
    End If
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    temporal.MousePointer = 0
If UBound(id_col) > 0 Then MsgBox "เนื่องจากมีคุณ " & cb_name.Text & " มากกว่า 1 คน   กรุณาเลือกคนที่ต้องการ", vbSystemModal, "System Message"
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub
Sub queryname()
Dim index As ListItem
On Error GoTo error1
    For i = 0 To UBound(id_col)
        rowid_patience = id_col(i)
        Set index = ls3.ListItems.Add
        
        sql = "select hn from patience where rowid =" & rowid_patience
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        index.Text = oVtable.Columns(1).Value
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        
        sql = "execute procedure atname(" & rowid_patience & ",'" & ptime & "')"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "execute procedure checkresult();"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result;"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
If oVtable.Columns(1).Value <> "nothing" Then
    index.SubItems(1) = Trim(oVtable.Columns(1).Value)
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        
        sql = "execute procedure atsurname(" & rowid_patience & ",'" & ptime & "')"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    index.SubItems(2) = Trim(oVtable.Columns(1).Value)
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
        sql = "select birthday,sex,id_num,blood_group from patience where rowid = " & rowid_patience
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    index.SubItems(3) = oVtable.Columns(1).Value
    index.SubItems(4) = oVtable.Columns(2).Value
    index.SubItems(5) = oVtable.Columns(3).Value
    index.SubItems(6) = oVtable.Columns(4).Value
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
     
        sql = "execute procedure ataddress(" & rowid_patience & ",'" & ptime & "')"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    address = Trim(oVtable.Columns(1).Value) & ",  " & _
                                Trim(oVtable.Columns(2).Value) & ",  " & _
                                Trim(oVtable.Columns(3).Value) & ",  " & _
                                Trim(oVtable.Columns(4).Value) & ",  " & _
                                Trim(oVtable.Columns(5).Value) & ",  " & _
                                Trim(oVtable.Columns(6).Value)
    index.SubItems(7) = address
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        
        sql = "execute procedure attel(" & rowid_patience & ",'" & ptime & "')"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "execute procedure checkresult();"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result;"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        If oVtable.Columns(1).Value <> "nothing" Then
        While Not oVtable.EOT
                tel = Trim(oVtable.Columns(1).Value)
            If tel <> "" Then
                tel2 = tel2 & tel & ",  "
            End If
                oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        index.SubItems(8) = tel2
        Else: patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        End If
        
        sql = "execute procedure atdiagnosis(" & rowid_patience & ",'" & ptime & "')"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "execute procedure checkresult();"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        If oVtable.Columns(1).Value <> "nothing" Then
        rowid = oVtable.Columns(1).Value
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
            If rowid <> "" Then
            sql = "select dia_code from diagnosis where rowid = " & rowid
            Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        index.SubItems(11) = oVtable2.Columns(1).Value
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
            End If
        Else: patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        End If
        
        sql = "execute procedure atadmission(" & rowid_patience & ",'" & ptime & "')"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "execute procedure checkresult();"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        If oVtable.Columns(1).Value <> "nothing" Then
        rowid = oVtable.Columns(1).Value
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        If rowid <> "" Then
        sql = "select ad_code from admission where rowid = " & rowid
        Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    index.SubItems(12) = oVtable2.Columns(1).Value
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
        End If
        Else: patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        End If
        
        sql = "execute procedure atmed(" & rowid_patience & ",'" & ptime & "')"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "execute procedure checkresult();"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        If oVtable.Columns(1).Value <> "nothing" Then
        While Not oVtable.EOT
        rowid = oVtable.Columns(1).Value
        If rowid <> "" Then
        sql = "select sci_name from medicine where rowid = " & rowid
        Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    med = med & Trim(oVtable2.Columns(1).Value) & ",  "
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
        End If
        oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    index.SubItems(10) = med
        Else: patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        End If
  
        sql = "execute procedure atdis(" & rowid_patience & ",'" & ptime & "')"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "execute procedure checkresult();"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        sql = "select * from result"
        Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
        If oVtable.Columns(1).Value <> "nothing" Then
        While Not oVtable.EOT
        rowid = oVtable.Columns(1).Value
        If rowid <> "" Then
        sql = "select sci_name from disease where rowid = " & rowid
        Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    dis = dis & Trim(oVtable2.Columns(1).Value) & ",  "
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
        End If
        oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    index.SubItems(9) = dis
        Else: patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        End If
Else:  patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
End If
    
    Next i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cb_room1_Click()
Dim oVtable As ddoTable
Dim index As ListItem
On Error GoTo error1
    If cb_room1.Text <> "" Then
    ls1.ListItems.clear
    sql = "select rowid from room where room_id = " & cb_room1.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_room = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure HisRoom(" & rowid_room & ");"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from hisroom"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
        While Not oVtable.EOT
        Set index = ls1.ListItems.Add
        index.Text = oVtable.Columns(1).Value
        index.SubItems(1) = Trim(oVtable.Columns(2).Value)
        index.SubItems(2) = Trim(oVtable.Columns(3).Value)
        index.SubItems(3) = oVtable.Columns(4).Value
        index.SubItems(4) = Replace(oVtable.Columns(5).Value, ":00.00000", "")
        index.SubItems(5) = Replace(oVtable.Columns(6).Value, ":00.00000", "")
        oVtable.NextRecord
        Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cb_room2_Click()
Dim oVtable As ddoTable
Dim index As ListItem
On Error GoTo error1
    If cb_room2.Text <> "" Then
    ls2.ListItems.clear
    sql = "select rowid from room where room_id = " & cb_room2.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_room = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "execute procedure MatchRoom(" & rowid_room & ");"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from matchRoom"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
        While Not oVtable.EOT
        Set index = ls2.ListItems.Add
        index.Text = oVtable.Columns(1).Value
        index.SubItems(1) = Trim(oVtable.Columns(2).Value)
        index.SubItems(2) = Trim(oVtable.Columns(3).Value)
        index.SubItems(3) = oVtable.Columns(4).Value
        index.SubItems(4) = oVtable.Columns(5).Value
        index.SubItems(5) = Trim(oVtable.Columns(6).Value)
        index.SubItems(6) = Trim(oVtable.Columns(7).Value)
        index.SubItems(7) = oVtable.Columns(8).Value
        index.SubItems(8) = Replace(oVtable.Columns(9).Value, ":00.00000", "")
        index.SubItems(9) = Replace(oVtable.Columns(10).Value, ":00.00000", "")
        oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub Command1_Click()
    Unload Me
    startform.Show
End Sub

Private Sub Form_activate()
On Error GoTo error1
Dim oVtable As ddoTable
    datetime = CalDate
    sql = "select room_id from room"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
        While Not oVtable.EOT
            cb_room1.AddItem (oVtable.Columns(1).Value)
            cb_room2.AddItem (oVtable.Columns(1).Value)
            oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
    Call namearray
    cb_name.clear
    For i = 0 To UBound(name_id)
    For j = 0 To cb_name.ListCount
    If cb_name.List(j) <> name_char(i) Then
        found = False
    Else: found = True
            Exit For
    End If
    Next j
    If Not found Then cb_name.AddItem (name_char(i))
Next i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub


Private Sub ls3_Click()
Dim index As ListItem
On Error GoTo error1
    ls4.ListItems.clear
    i = ls3.SelectedItem.index
    i = i - 1
    rowid_patience = id_col(i)
    sql = "execute procedure UsedtoSleepwith(" & rowid_patience & ");"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "execute procedure checkusedtos"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from usedtosleep;"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable.Columns(1).Value <> "nothing" Then
        While Not oVtable.EOT
        Set index = ls4.ListItems.Add
        index.Text = oVtable.Columns(1).Value
        index.SubItems(1) = oVtable.Columns(2).Value
        index.SubItems(2) = Trim(oVtable.Columns(3).Value)
        index.SubItems(3) = Trim(oVtable.Columns(4).Value)
        index.SubItems(4) = oVtable.Columns(5).Value
        index.SubItems(5) = oVtable.Columns(6).Value
        index.SubItems(6) = Trim(oVtable.Columns(7).Value)
        index.SubItems(7) = Trim(oVtable.Columns(8).Value)
        index.SubItems(8) = oVtable.Columns(9).Value
        index.SubItems(9) = Replace(oVtable.Columns(10).Value, ":00.00000", "")
        index.SubItems(10) = Replace(oVtable.Columns(11).Value, ":00.00000", "")
            oVtable.NextRecord
        Wend
    End If
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
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
