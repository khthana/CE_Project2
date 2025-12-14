VERSION 5.00
Object = "{BF448208-70DE-11CF-947B-0020AF75C4BA}#1.0#0"; "navctl32.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form bill 
   Caption         =   "Bill Report"
   ClientHeight    =   9600
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9885
   Icon            =   "bill.frx":0000
   LinkTopic       =   "Form2"
   Picture         =   "bill.frx":0312
   ScaleHeight     =   9600
   ScaleWidth      =   9885
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin Navctl32Lib.NavControl patience_nav 
      Height          =   600
      Left            =   120
      TabIndex        =   18
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
      Ctrl0Width      =   33
      Ctrl0Height     =   20
      Ctrl1ID         =   1
      Ctrl1Style      =   1
      Ctrl1Caption    =   ""
      Ctrl1Width      =   33
      Ctrl1Height     =   20
      Ctrl2ID         =   2
      Ctrl2Style      =   1
      Ctrl2Caption    =   ""
      Ctrl2Width      =   33
      Ctrl2Height     =   20
      Ctrl3ID         =   3
      Ctrl3Style      =   1
      Ctrl3Caption    =   ""
      Ctrl3Top        =   20
      Ctrl3Width      =   50
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
      Ctrl5Top        =   40
      Ctrl5Width      =   100
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
      Ctrl11Top       =   60
      Ctrl11Width     =   34
      Ctrl11Height    =   20
      Ctrl12ID        =   7
      Ctrl12Style     =   1
      Ctrl12Caption   =   ""
      Ctrl12Left      =   1
      Ctrl12Top       =   60
      Ctrl12Width     =   66
      Ctrl12Height    =   20
      Ctrl13ID        =   8
      Ctrl13Style     =   1
      Ctrl13Caption   =   ""
      Ctrl13Left      =   67
      Ctrl13Top       =   60
      Ctrl13Width     =   33
      Ctrl13Height    =   20
   End
   Begin VB.Frame Frame2 
      Caption         =   "Condition"
      Height          =   975
      Left            =   0
      TabIndex        =   7
      Top             =   0
      Width           =   9855
      Begin VB.ComboBox cb_an 
         Height          =   315
         Left            =   4440
         Sorted          =   -1  'True
         TabIndex        =   2
         Top             =   360
         Width           =   1815
      End
      Begin VB.TextBox tx_datetime 
         BackColor       =   &H8000000B&
         Height          =   285
         Left            =   8280
         TabIndex        =   22
         Top             =   360
         Width           =   1455
      End
      Begin VB.Timer Timer1 
         Interval        =   5
         Left            =   6840
         Top             =   240
      End
      Begin VB.OptionButton op_an 
         Caption         =   "A.N."
         Height          =   255
         Left            =   3720
         TabIndex        =   1
         Top             =   360
         Value           =   -1  'True
         Width           =   735
      End
      Begin VB.ComboBox cb_dn 
         Height          =   315
         Left            =   1320
         TabIndex        =   0
         Text            =   "diagnosis.dia_code"
         Top             =   360
         Width           =   1935
      End
      Begin VB.OptionButton op_dn 
         Caption         =   "D.N."
         Height          =   255
         Left            =   600
         TabIndex        =   8
         Top             =   360
         Width           =   735
      End
      Begin VB.Label Label31 
         Caption         =   "DateTime ::"
         Height          =   255
         Left            =   7320
         TabIndex        =   23
         Top             =   360
         Width           =   855
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "EXIT"
      Height          =   735
      Left            =   8520
      Picture         =   "bill.frx":176684
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   8760
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Bill Report"
      Height          =   7695
      Left            =   0
      TabIndex        =   6
      Top             =   960
      Width           =   9855
      Begin VB.TextBox t2_admit 
         BackColor       =   &H8000000B&
         Enabled         =   0   'False
         Height          =   285
         Left            =   2640
         TabIndex        =   20
         Top             =   6600
         Visible         =   0   'False
         Width           =   495
      End
      Begin VB.TextBox tx_total 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00FFFFC0&
         ForeColor       =   &H000000FF&
         Height          =   285
         Left            =   7440
         TabIndex        =   3
         Top             =   6720
         Width           =   1455
      End
      Begin MSComctlLib.ListView lsv 
         Height          =   5055
         Left            =   960
         TabIndex        =   5
         Top             =   1200
         Width           =   8055
         _ExtentX        =   14208
         _ExtentY        =   8916
         View            =   3
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483647
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   4
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "รายการ"
            Object.Width           =   6174
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            SubItemIndex    =   1
            Text            =   "ราคา/หน่วย"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            SubItemIndex    =   2
            Text            =   "จำนวน (หน่วย)"
            Object.Width           =   2646
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            SubItemIndex    =   3
            Text            =   "ราคารวม"
            Object.Width           =   2646
         EndProperty
      End
      Begin VB.TextBox tx_sur 
         BackColor       =   &H8000000B&
         Height          =   285
         Left            =   5640
         TabIndex        =   13
         Top             =   360
         Width           =   2055
      End
      Begin VB.TextBox tx_name 
         BackColor       =   &H8000000B&
         Height          =   285
         Left            =   2760
         TabIndex        =   11
         Top             =   360
         Width           =   2055
      End
      Begin VB.TextBox tx_hn 
         BackColor       =   &H8000000B&
         Height          =   285
         Left            =   960
         TabIndex        =   9
         Top             =   360
         Width           =   1215
      End
      Begin VB.Label t1_admit 
         Caption         =   "ระยะเวลาการ ADMIT              วัน"
         Height          =   255
         Left            =   1080
         TabIndex        =   21
         Top             =   6600
         Visible         =   0   'False
         Width           =   2415
      End
      Begin VB.Label Label5 
         Caption         =   "Total"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   6840
         TabIndex        =   19
         Top             =   6720
         Width           =   495
      End
      Begin VB.Label Label3 
         Caption         =   "นามสกุล"
         Height          =   255
         Left            =   5040
         TabIndex        =   14
         Top             =   360
         Width           =   615
      End
      Begin VB.Label Label2 
         Caption         =   "ชื่อ"
         Height          =   255
         Left            =   2520
         TabIndex        =   12
         Top             =   360
         Width           =   375
      End
      Begin VB.Label Label1 
         Caption         =   "H.N."
         Height          =   255
         Left            =   600
         TabIndex        =   10
         Top             =   360
         Width           =   375
      End
   End
   Begin Navctl32Lib.NavControl diagnosis_diagnosis1 
      Height          =   480
      Left            =   -10005
      TabIndex        =   16
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _Version        =   65536
      _ExtentX        =   2646
      _ExtentY        =   847
      _StockProps     =   4
      DOF             =   -1  'True
      NavigationButtonsVisible=   -1  'True
      BookmarkButtonsVisible=   -1  'True
      StatusVisible   =   -1  'True
      ModelFile       =   "g:\informix\Data Director\nuvo_hospital.MLX"
      DataPath        =   ""
      Table           =   "diagnosis"
      DataGroup       =   "diagnosis"
      DefaultButtonSize=   1
      SaveButtonVisible=   -1  'True
      QueryButtonVisible=   -1  'True
      QBEButtonVisible=   -1  'True
      InsertButtonVisible=   -1  'True
      DeleteButtonVisible=   -1  'True
      LayoutMode      =   1
      ControlCount    =   14
      DisableChoreoEvents=   -1  'True
      NewStyle        =   -1  'True
      TableDataSource =   -1  'True
      Ctrl0Visible    =   -1  'True
      Ctrl0Style      =   1
      Ctrl0Caption    =   ""
      Ctrl0Width      =   30
      Ctrl0Height     =   20
      Ctrl1ID         =   1
      Ctrl1Visible    =   -1  'True
      Ctrl1Style      =   1
      Ctrl1Caption    =   ""
      Ctrl1Width      =   30
      Ctrl1Height     =   20
      Ctrl2ID         =   2
      Ctrl2Visible    =   -1  'True
      Ctrl2Style      =   1
      Ctrl2Caption    =   ""
      Ctrl2Width      =   30
      Ctrl2Height     =   20
      Ctrl3ID         =   3
      Ctrl3Visible    =   -1  'True
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
      Ctrl5Visible    =   -1  'True
      Ctrl5Style      =   2
      Ctrl5Caption    =   "diagnosis - #"
      Ctrl5Width      =   133
      Ctrl5Height     =   20
      Ctrl6ID         =   9
      Ctrl6Visible    =   -1  'True
      Ctrl6Style      =   2
      Ctrl6Caption    =   "Query"
      Ctrl6Width      =   45
      Ctrl6Height     =   20
      Ctrl7ID         =   10
      Ctrl7Visible    =   -1  'True
      Ctrl7Style      =   2
      Ctrl7Caption    =   "Save"
      Ctrl7Width      =   39
      Ctrl7Height     =   20
      Ctrl8ID         =   11
      Ctrl8Visible    =   -1  'True
      Ctrl8Style      =   1
      Ctrl8Caption    =   "Delete"
      Ctrl8Width      =   30
      Ctrl8Height     =   20
      Ctrl9ID         =   12
      Ctrl9Visible    =   -1  'True
      Ctrl9Style      =   1
      Ctrl9Caption    =   "QBE"
      Ctrl9Width      =   30
      Ctrl9Height     =   20
      Ctrl10ID        =   100
      Ctrl10Style     =   2
      Ctrl10Caption   =   "Caption!"
      Ctrl10Width     =   22
      Ctrl10Height    =   18
      Ctrl11ID        =   6
      Ctrl11Visible   =   -1  'True
      Ctrl11Style     =   1
      Ctrl11Caption   =   ""
      Ctrl11Width     =   30
      Ctrl11Height    =   20
      Ctrl12ID        =   7
      Ctrl12Visible   =   -1  'True
      Ctrl12Style     =   1
      Ctrl12Caption   =   ""
      Ctrl12Width     =   30
      Ctrl12Height    =   20
      Ctrl13ID        =   8
      Ctrl13Visible   =   -1  'True
      Ctrl13Style     =   1
      Ctrl13Caption   =   ""
      Ctrl13Width     =   30
      Ctrl13Height    =   20
   End
   Begin Navctl32Lib.NavControl admission_admission1 
      Height          =   480
      Left            =   -10005
      TabIndex        =   17
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _Version        =   65536
      _ExtentX        =   2646
      _ExtentY        =   847
      _StockProps     =   4
      DOF             =   -1  'True
      NavigationButtonsVisible=   -1  'True
      BookmarkButtonsVisible=   -1  'True
      StatusVisible   =   -1  'True
      ModelFile       =   "g:\informix\Data Director\nuvo_hospital.MLX"
      DataPath        =   ""
      Table           =   "admission"
      DataGroup       =   "admission"
      DefaultButtonSize=   1
      SaveButtonVisible=   -1  'True
      QueryButtonVisible=   -1  'True
      QBEButtonVisible=   -1  'True
      InsertButtonVisible=   -1  'True
      DeleteButtonVisible=   -1  'True
      LayoutMode      =   1
      ControlCount    =   14
      DisableChoreoEvents=   -1  'True
      NewStyle        =   -1  'True
      TableDataSource =   -1  'True
      Ctrl0Visible    =   -1  'True
      Ctrl0Style      =   1
      Ctrl0Caption    =   ""
      Ctrl0Width      =   30
      Ctrl0Height     =   20
      Ctrl1ID         =   1
      Ctrl1Visible    =   -1  'True
      Ctrl1Style      =   1
      Ctrl1Caption    =   ""
      Ctrl1Width      =   30
      Ctrl1Height     =   20
      Ctrl2ID         =   2
      Ctrl2Visible    =   -1  'True
      Ctrl2Style      =   1
      Ctrl2Caption    =   ""
      Ctrl2Width      =   30
      Ctrl2Height     =   20
      Ctrl3ID         =   3
      Ctrl3Visible    =   -1  'True
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
      Ctrl5Visible    =   -1  'True
      Ctrl5Style      =   2
      Ctrl5Caption    =   "admission - #"
      Ctrl5Width      =   137
      Ctrl5Height     =   20
      Ctrl6ID         =   9
      Ctrl6Visible    =   -1  'True
      Ctrl6Style      =   2
      Ctrl6Caption    =   "Query"
      Ctrl6Width      =   45
      Ctrl6Height     =   20
      Ctrl7ID         =   10
      Ctrl7Visible    =   -1  'True
      Ctrl7Style      =   2
      Ctrl7Caption    =   "Save"
      Ctrl7Width      =   39
      Ctrl7Height     =   20
      Ctrl8ID         =   11
      Ctrl8Visible    =   -1  'True
      Ctrl8Style      =   1
      Ctrl8Caption    =   "Delete"
      Ctrl8Width      =   30
      Ctrl8Height     =   20
      Ctrl9ID         =   12
      Ctrl9Visible    =   -1  'True
      Ctrl9Style      =   1
      Ctrl9Caption    =   "QBE"
      Ctrl9Width      =   30
      Ctrl9Height     =   20
      Ctrl10ID        =   100
      Ctrl10Style     =   2
      Ctrl10Caption   =   "Caption!"
      Ctrl10Width     =   22
      Ctrl10Height    =   18
      Ctrl11ID        =   6
      Ctrl11Visible   =   -1  'True
      Ctrl11Style     =   1
      Ctrl11Caption   =   ""
      Ctrl11Width     =   30
      Ctrl11Height    =   20
      Ctrl12ID        =   7
      Ctrl12Visible   =   -1  'True
      Ctrl12Style     =   1
      Ctrl12Caption   =   ""
      Ctrl12Width     =   30
      Ctrl12Height    =   20
      Ctrl13ID        =   8
      Ctrl13Visible   =   -1  'True
      Ctrl13Style     =   1
      Ctrl13Caption   =   ""
      Ctrl13Width     =   30
      Ctrl13Height    =   20
   End
   Begin VB.Label Label4 
      Caption         =   "dia_code"
      Height          =   300
      Left            =   540
      TabIndex        =   15
      Top             =   500
      Width           =   960
   End
End
Attribute VB_Name = "bill"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public rowid_diag As Integer
Public rowid_admit As Integer
Public temptype As String
Public detail As String

Private Sub cb_an_Click()
Dim oVtable As ddoTable
Dim index As ListItem
On Error GoTo error1
    If cb_an.Text <> "" Then
    lsv.ListItems.clear
    t1_admit.Visible = True
    t2_admit.Visible = True
    sql = "select rowid from admission where ad_code = " & cb_an.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_admit = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (sql)
    
    sql = "execute procedure bill_admission(" & rowid_admit & ");"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from pat_name"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    tx_hn = oVtable.Columns(1).Value
    tx_name = oVtable.Columns(2).Value
    tx_sur = oVtable.Columns(3).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "select * from bill"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    While Not oVtable.EOT
        Set index = lsv.ListItems.Add
        detail = Trim(oVtable.Columns(1).Value)
        bool = newline(detail)
        If bool Then
        If detail = "doctor" Then
                index.Text = "Doctor CHARGE"
        ElseIf detail = "lab" Then
                index.Text = "LABORATORY PRICE"
        ElseIf detail = "medicine" Then
                index.Text = "MEDICINE PRICE"
        ElseIf detail = "package" Then
                index.Text = "PACKAGE PRICE"
        ElseIf detail = "room" Then
                index.Text = "ROOM PRICE"
        End If
        Set index = lsv.ListItems.Add
        End If
        If detail = "doctor" Then
            index.Text = "    DR. " & Trim(oVtable.Columns(3).Value)
        Else: index.Text = "    " & Trim(oVtable.Columns(3).Value)
        End If
        index.SubItems(1) = oVtable.Columns(5).Value
        If (detail = "package" Or detail = "doctor" Or detail = "room") Then
                index.SubItems(2) = ""
                If (oVtable.Columns(4).Value = 0 Or oVtable.Columns(4).Value = "") Then
                    sql = "execute function NumofDay(" & rowid_admit & ",'" & datetime & "')"
                    Set oVtable2 = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
                    t2_admit = oVtable2.Columns(1).Value
                    If t2_admit <= 0 Then t2_admit = 1
                    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable2.Name)
                Else: t2_admit = oVtable.Columns(4).Value
                End If
        Else: index.SubItems(2) = oVtable.Columns(4).Value
        End If
        oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    i = 1
    total = 0
    While i <= lsv.ListItems.Count
        If lsv.ListItems(i).SubItems(1) <> "" Then
            If lsv.ListItems(i).SubItems(2) = "" Then
                temp = CCur(lsv.ListItems(i).SubItems(1)) * CCur(t2_admit)
                lsv.ListItems(i).SubItems(3) = temp
            Else
            lsv.ListItems(i).SubItems(3) = CCur(lsv.ListItems(i).SubItems(1)) * CCur(lsv.ListItems(i).SubItems(2))
            End If
            total = total + CCur(lsv.ListItems(i).SubItems(3))
        End If
        i = i + 1
    Wend
    tx_total = total
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cb_dn_Click()
Dim oVtable As ddoTable
Dim index As ListItem
On Error GoTo error1
    If cb_dn.Text <> "" Then
    lsv.ListItems.clear
    t1_admit.Visible = False
    t2_admit.Visible = False
    sql = "select rowid from diagnosis where dia_code = " & cb_dn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_diag = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (sql)
    
    sql = "execute procedure bill_diagnosis(" & rowid_diag & ");"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from pat_name"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    tx_hn = oVtable.Columns(1).Value
    tx_name = oVtable.Columns(2).Value
    tx_sur = oVtable.Columns(3).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    sql = "select * from bill"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    While Not oVtable.EOT
        Set index = lsv.ListItems.Add
        detail = Trim(oVtable.Columns(1).Value)
        bool = newline(detail)
        If bool Then
        If detail = "doctor" Then
                index.Text = "Doctor CHARGE"
        ElseIf detail = "lab" Then
                index.Text = "LABORATORY PRICE"
        ElseIf detail = "medicine" Then
                index.Text = "MEDICINE PRICE"
        End If
        Set index = lsv.ListItems.Add
        End If
        If detail = "doctor" Then
            index.Text = "    DR. " & Trim(oVtable.Columns(3).Value)
        Else: index.Text = "    " & Trim(oVtable.Columns(3).Value)
        End If
        index.SubItems(1) = oVtable.Columns(5).Value
        index.SubItems(2) = oVtable.Columns(4).Value
        oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    
    i = 1
    total = 0
    While i <= lsv.ListItems.Count
        If lsv.ListItems(i).SubItems(2) <> "" Then
            temp = CCur(lsv.ListItems(i).SubItems(1)) * CCur(lsv.ListItems(i).SubItems(2))
            lsv.ListItems(i).SubItems(3) = temp
            total = total + CCur(lsv.ListItems(i).SubItems(3))
        End If
        i = i + 1
    Wend
    tx_total = total
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Function newline(X As String) As Boolean
On Error GoTo error1
    If temptype <> X Then
        temptype = X
        newline = True
    Else: newline = False
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function

Private Sub Command1_Click()
    Unload Me
    startform.Show
End Sub

Private Sub Form_activate()
    datetime = CalDate
    cb_an.clear
    sql = "select ad_code from admission"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
    While Not oVtable.EOT
        cb_an.AddItem (oVtable.Columns(1).Value)
        oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
    cb_dn.clear
    sql = "select dia_code from diagnosis"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
    While Not oVtable.EOT
        cb_dn.AddItem (oVtable.Columns(1).Value)
        oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
End Sub

Private Sub op_an_click()
    If op_an.Value = True Then
        cb_an.Enabled = True
        cb_dn.Enabled = False
    End If
End Sub
Private Sub op_dn_click()
    If op_dn.Value = True Then
        cb_dn.Enabled = True
        cb_an.Enabled = False
    End If
End Sub


Private Sub Timer1_Timer()
    If Timer1.Interval > 1000 Then Interval = 0
    If Timer1.Interval = 1000 Then
        datetime = CalDate
        tx_datetime = datetime
    End If
End Sub
'Private Sub DataDirector_Info()
'[DataDirectorInfoStart]
'NumDataLinks=1
'[DataLink]
'GroupName=diagnosis
'ControlName=cb_dn
'ClassId=2
'Synchronize=0
'GetAllData=1
'StoreSelect=1
'SortOrder=0
'SortFlag=0
'DefaultType=1
'TrimTrailingBlanks=0
'DataSource=diagnosis_nav
'DataField=dia_code
'AssociationType=2
'SourceType=1
'[DataLinkButtonInfo]
'[EndDataLinkButtonInfo]
'[DataLinkPath]
'NumElements=1
'[DataLinkPathInfo]
'TableName=diagnosis
'NumColumns=1
'ColumnName=dia_code
'[EndDataLinkPathInfo]
'[EndDataLinkPath]
'[EndDataLink]
'[DataDirectorInfoEnd]
'End Sub
