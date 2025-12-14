VERSION 5.00
Object = "{BF448208-70DE-11CF-947B-0020AF75C4BA}#1.0#0"; "navctl32.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form dialy_diag 
   Caption         =   "DIALY DIAGNOSIS"
   ClientHeight    =   10365
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9885
   Icon            =   "dialy_diag.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   10365
   ScaleWidth      =   9885
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox tx_datetime 
      BackColor       =   &H8000000B&
      Height          =   285
      Left            =   1560
      TabIndex        =   10
      Top             =   9840
      Width           =   1455
   End
   Begin VB.Timer Timer1 
      Interval        =   5
      Left            =   120
      Top             =   9720
   End
   Begin VB.CommandButton cmd_exit 
      Caption         =   "EXIT"
      Height          =   735
      Left            =   3960
      Picture         =   "dialy_diag.frx":030A
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   9600
      Width           =   1695
   End
   Begin VB.Frame frambp 
      Caption         =   "Blood Pressure"
      Height          =   4695
      Left            =   4920
      TabIndex        =   4
      Top             =   0
      Width           =   4935
      Begin MSComctlLib.ListView ls_bp 
         Height          =   3855
         Left            =   480
         TabIndex        =   9
         Top             =   480
         Width           =   4095
         _ExtentX        =   7223
         _ExtentY        =   6800
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
            Text            =   "BP LOW"
            Object.Width           =   1058
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "ฺBP HIGH"
            Object.Width           =   1058
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "FROM"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "TO"
            Object.Width           =   2540
         EndProperty
      End
   End
   Begin VB.Frame framet 
      Caption         =   "Temperature"
      Height          =   4695
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   4815
      Begin MSComctlLib.ListView ls_t 
         Height          =   3855
         Left            =   360
         TabIndex        =   5
         Top             =   480
         Width           =   4095
         _ExtentX        =   7223
         _ExtentY        =   6800
         View            =   3
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
            Text            =   "อุณหภูมิ ( ํC)"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "FROM"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "TO"
            Object.Width           =   2540
         EndProperty
      End
   End
   Begin VB.Frame framep 
      Caption         =   "Pulse"
      Height          =   4695
      Left            =   4920
      TabIndex        =   2
      Top             =   4800
      Width           =   4935
      Begin MSComctlLib.ListView ls_p 
         Height          =   3855
         Left            =   480
         TabIndex        =   8
         Top             =   480
         Width           =   4095
         _ExtentX        =   7223
         _ExtentY        =   6800
         View            =   3
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
            Text            =   "อัตราการเต้นหัวใจ"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "FROM"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "TO"
            Object.Width           =   2540
         EndProperty
      End
   End
   Begin VB.Frame framer 
      Caption         =   "Repository"
      Height          =   4695
      Left            =   0
      TabIndex        =   1
      Top             =   4800
      Width           =   4815
      Begin MSComctlLib.ListView ls_r 
         Height          =   3855
         Left            =   360
         TabIndex        =   7
         Top             =   480
         Width           =   4095
         _ExtentX        =   7223
         _ExtentY        =   6800
         View            =   3
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
            Text            =   "อัตราการหายใจ"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "FROM"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "TO"
            Object.Width           =   2540
         EndProperty
      End
   End
   Begin Navctl32Lib.NavControl patience_nav 
      Height          =   600
      Left            =   8520
      TabIndex        =   6
      Top             =   9720
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
      ModelFile       =   "D:\hospital_install\nuvohospital_vb\nuvo_hospital.MLT"
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
      Ctrl1Left       =   26
      Ctrl1Width      =   31
      Ctrl1Height     =   20
      Ctrl2ID         =   2
      Ctrl2Style      =   1
      Ctrl2Caption    =   ""
      Ctrl2Left       =   57
      Ctrl2Width      =   31
      Ctrl2Height     =   20
      Ctrl3ID         =   3
      Ctrl3Style      =   1
      Ctrl3Caption    =   ""
      Ctrl3Left       =   88
      Ctrl3Width      =   31
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
      Ctrl5Top        =   20
      Ctrl5Width      =   150
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
      Ctrl11Top       =   40
      Ctrl11Width     =   50
      Ctrl11Height    =   20
      Ctrl12ID        =   7
      Ctrl12Style     =   1
      Ctrl12Caption   =   ""
      Ctrl12Left      =   1
      Ctrl12Top       =   40
      Ctrl12Width     =   99
      Ctrl12Height    =   20
      Ctrl13ID        =   8
      Ctrl13Style     =   1
      Ctrl13Caption   =   ""
      Ctrl13Left      =   100
      Ctrl13Top       =   40
      Ctrl13Width     =   50
      Ctrl13Height    =   20
   End
   Begin VB.Label Label31 
      Caption         =   "DateTime ::"
      Height          =   255
      Left            =   600
      TabIndex        =   11
      Top             =   9840
      Width           =   855
   End
End
Attribute VB_Name = "dialy_diag"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmd_exit_Click()
    Unload Me
End Sub

Private Sub Form_Load()
Dim oVtable As ddoTable
Dim index As ListItem
On Error GoTo error1
' ALL TEMPERATURE
    sql = "execute procedure alltemp(" & rowtemp & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select result,t_st,t_sp from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
        While Not oVtable.EOT
        result = oVtable.Columns(1).Value
        If result <> "" Then
            Set index = ls_t.ListItems.Add
            index.Text = result
            index.SubItems(1) = Replace(oVtable.Columns(2).Value, ":00.00000", "")
            index.SubItems(2) = Replace(oVtable.Columns(3).Value, ":00.00000", "")
        End If
        oVtable.NextRecord
    Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
'ALL REPISITORY
    sql = "execute procedure allrep(" & rowtemp & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select result,t_st,t_sp from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
        While Not oVtable.EOT
        result = oVtable.Columns(1).Value
        If result <> "" Then
            Set index = ls_r.ListItems.Add
            index.Text = result
            index.SubItems(1) = Replace(oVtable.Columns(2).Value, ":00.00000", "")
            index.SubItems(2) = Replace(oVtable.Columns(3).Value, ":00.00000", "")
        End If
        oVtable.NextRecord
    Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If

'ALL PULSE
    sql = "execute procedure allpulse(" & rowtemp & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select result,t_st,t_sp from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
        While Not oVtable.EOT
        result = oVtable.Columns(1).Value
        If result <> "" Then
            Set index = ls_p.ListItems.Add
            index.Text = result
            index.SubItems(1) = Replace(oVtable.Columns(2).Value, ":00.00000", "")
            index.SubItems(2) = Replace(oVtable.Columns(3).Value, ":00.00000", "")
        End If
        oVtable.NextRecord
    Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If

'ALL BLOOD PRESSURE
    sql = "execute procedure allbp(" & rowtemp & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select result1,result2,t_st,t_sp from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
        While Not oVtable.EOT
        result = oVtable.Columns(1).Value
        If result <> "" Then
            Set index = ls_bp.ListItems.Add
            index.Text = result
            index.SubItems(1) = oVtable.Columns(2).Value
            index.SubItems(2) = Replace(oVtable.Columns(3).Value, ":00.00000", "")
            index.SubItems(3) = Replace(oVtable.Columns(4).Value, ":00.00000", "")
        End If
        oVtable.NextRecord
    Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If

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
