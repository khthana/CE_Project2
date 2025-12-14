VERSION 5.00
Object = "{BF448208-70DE-11CF-947B-0020AF75C4BA}#1.0#0"; "navctl32.ocx"
Begin VB.Form nursing_plan 
   Caption         =   "NURSING PLANS"
   ClientHeight    =   9600
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9885
   Icon            =   "nursing_plan.frx":0000
   LinkTopic       =   "Form2"
   Picture         =   "nursing_plan.frx":030A
   ScaleHeight     =   9600
   ScaleWidth      =   9885
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox tx_datetime 
      BackColor       =   &H8000000B&
      Height          =   285
      Left            =   1560
      TabIndex        =   7
      Top             =   9000
      Width           =   1455
   End
   Begin VB.Timer Timer1 
      Interval        =   5
      Left            =   120
      Top             =   8880
   End
   Begin VB.Frame Frame1 
      Caption         =   "Nursing Plan"
      Height          =   8535
      Left            =   0
      TabIndex        =   4
      Top             =   0
      Width           =   9855
      Begin VB.TextBox tx_from 
         Height          =   285
         Left            =   4080
         TabIndex        =   5
         Top             =   7920
         Width           =   2415
      End
      Begin VB.CommandButton cmd_next 
         Caption         =   "NEXT >>"
         Height          =   615
         Left            =   7680
         Picture         =   "nursing_plan.frx":17667C
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   7680
         Width           =   1335
      End
      Begin VB.CommandButton cmd_back 
         Caption         =   "<< BACK"
         Height          =   615
         Left            =   720
         Picture         =   "nursing_plan.frx":176A51
         Style           =   1  'Graphical
         TabIndex        =   0
         Top             =   7680
         Width           =   1455
      End
      Begin VB.Label Label1 
         Caption         =   "วันเวลา"
         Height          =   255
         Left            =   3480
         TabIndex        =   6
         Top             =   7920
         Width           =   615
      End
      Begin VB.Image imgn 
         Height          =   7095
         Left            =   480
         Stretch         =   -1  'True
         Top             =   480
         Width           =   8895
      End
   End
   Begin VB.CommandButton cmd_exit 
      Caption         =   "EXIT"
      Height          =   735
      Left            =   3960
      Picture         =   "nursing_plan.frx":176E22
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   8760
      Width           =   1695
   End
   Begin Navctl32Lib.NavControl patience_nav 
      Height          =   600
      Left            =   8400
      TabIndex        =   3
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
      TabIndex        =   8
      Top             =   9000
      Width           =   855
   End
End
Attribute VB_Name = "nursing_plan"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Function findposarray(str As String) As Integer
On Error GoTo error1
    i = 0
    Do While (setofnurse_from(i) <> str)
        i = i + 1
    Loop
    findposarray = i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function

Private Sub cmd_back_Click()
On Error GoTo error1
        i = findposarray(tx_from.Text)
        i = i - 1
        rowid_pic = setofnurse_id(i)
        sql = "select lotofile(pic,'" & App.Path & "\nurse.jpg!','client') from photo where rowid = " & rowid_pic
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        Set imgn.Picture = LoadPicture(App.Path & "\nurse.jpg")
        tx_from = setofnurse_from(i)
        If i = LBound(setofnurse_id) Then
            cmd_back.Enabled = False
        Else: cmd_back.Enabled = True
        End If
        If i = UBound(setofnurse_id) Then
            cmd_next.Enabled = False
        Else: cmd_next.Enabled = True
        End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cmd_exit_Click()
    Unload Me
End Sub

Private Sub cmd_next_Click()
On Error GoTo error1
        i = findposarray(tx_from.Text)
        i = i + 1
        rowid_pic = setofnurse_id(i)
        sql = "select lotofile(pic,'" & App.Path & "\nurse.jpg!','client') from photo where rowid = " & rowid_pic
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        Set imgn.Picture = LoadPicture(App.Path & "\nurse.jpg")
        tx_from = setofnurse_from(i)
        If i = LBound(setofnurse_id) Then
            cmd_back.Enabled = False
        Else: cmd_back.Enabled = True
        End If
        If i = UBound(setofnurse_id) Then
            cmd_next.Enabled = False
        Else: cmd_next.Enabled = True
        End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub Form_Load()
Dim oVtable As ddoTable
On Error GoTo error1
    sql = "execute procedure allnurse(" & rowtemp & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select result,t_st,t_sp from result"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
    nrecord = 0
    While Not oVtable.EOT
        nrecord = nrecord + 1
        oVtable.NextRecord
    Wend
    nrecord = nrecord - 2       ' first row is null
    oVtable.FirstRecord
        ReDim setofnurse_id(nrecord) As Integer
        ReDim setofnurse_from(nrecord) As String
        ReDim setofnurse_to(nrecord) As String
        i = 0
        While Not oVtable.EOT
        result = oVtable.Columns(1).Value
        If result <> "" Then
            setofnurse_id(i) = oVtable.Columns(1).Value
            setofnurse_from(i) = Replace(oVtable.Columns(2).Value, ":00.00000", "")
            setofnurse_to(i) = Replace(oVtable.Columns(3).Value, ":00.00000", "")
            i = i + 1
        End If
        oVtable.NextRecord
        Wend
        patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
        
        i = UBound(setofnurse_id)
        rowid_pic = setofnurse_id(i)
        If rowid_pic <> 0 Then
        sql = "select lotofile(pic,'" & App.Path & "\nurse.jpg!','client') from photo where rowid = " & rowid_pic
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        Set imgn.Picture = LoadPicture(App.Path & "\nurse.jpg")
        tx_from = setofnurse_from(i)
        If i = LBound(setofnurse_id) Then cmd_back.Enabled = False
        If i = UBound(setofnurse_id) Then cmd_next.Enabled = False
        End If
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
