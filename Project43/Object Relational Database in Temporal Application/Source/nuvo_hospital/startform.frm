VERSION 5.00
Object = "{BF448208-70DE-11CF-947B-0020AF75C4BA}#1.0#0"; "navctl32.ocx"
Begin VB.Form startform 
   Caption         =   "ระบบฐานข้อมูลเชิงเวลาโรงพยาบาล"
   ClientHeight    =   7590
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9885
   DrawMode        =   8  'Xor Pen
   Icon            =   "startform.frx":0000
   LinkTopic       =   "Form2"
   Palette         =   "startform.frx":030A
   ScaleHeight     =   7590
   ScaleWidth      =   9885
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Height          =   7575
      Left            =   3840
      TabIndex        =   7
      Top             =   0
      Width           =   6015
      Begin VB.CommandButton Command7 
         BackColor       =   &H8000000A&
         Caption         =   "ตัวอย่างคำถามเชิงเวลา"
         Height          =   855
         Left            =   1200
         Picture         =   "startform.frx":1300B
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   6480
         Width           =   3015
      End
      Begin VB.CommandButton Command1 
         Caption         =   "EXIT"
         Height          =   855
         Left            =   4680
         Picture         =   "startform.frx":13315
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   6480
         Width           =   1095
      End
      Begin VB.CommandButton Command2 
         BackColor       =   &H8000000A&
         Caption         =   "ทะเบียนผู้ป่วย"
         Height          =   855
         Left            =   1200
         Picture         =   "startform.frx":137A4
         Style           =   1  'Graphical
         TabIndex        =   0
         Top             =   360
         Width           =   3015
      End
      Begin VB.CommandButton Command3 
         BackColor       =   &H8000000A&
         Caption         =   "ผลการวินิจฉัย"
         Height          =   855
         Left            =   1200
         Picture         =   "startform.frx":13E67
         Style           =   1  'Graphical
         TabIndex        =   1
         Top             =   1560
         Width           =   3015
      End
      Begin VB.CommandButton Command4 
         BackColor       =   &H8000000A&
         Caption         =   "ผลการตรวจทางห้องปฏิบัติการ"
         Height          =   855
         Left            =   1200
         Picture         =   "startform.frx":1400F
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   2760
         Width           =   3015
      End
      Begin VB.CommandButton Command5 
         BackColor       =   &H8000000A&
         Caption         =   "ประวัติผู้ป่วยใน"
         Height          =   855
         Left            =   1200
         Picture         =   "startform.frx":14424
         Style           =   1  'Graphical
         TabIndex        =   3
         Top             =   4080
         Width           =   3015
      End
      Begin VB.CommandButton Command6 
         BackColor       =   &H8000000A&
         Caption         =   "คำนวณค่าใช้จ่าย"
         Height          =   855
         Left            =   1200
         Picture         =   "startform.frx":14C20
         Style           =   1  'Graphical
         TabIndex        =   4
         Top             =   5280
         Width           =   3015
      End
   End
   Begin Navctl32Lib.NavControl patience_nav 
      Height          =   540
      Left            =   3840
      TabIndex        =   8
      Top             =   6960
      Width           =   990
      _Version        =   65536
      _ExtentX        =   1746
      _ExtentY        =   953
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
      SaveButtonVisible=   -1  'True
      QueryButtonVisible=   -1  'True
      QBEButtonVisible=   -1  'True
      InsertButtonVisible=   -1  'True
      DeleteButtonVisible=   -1  'True
      LayoutMode      =   1
      ControlCount    =   14
      Mode01LastWidth =   66
      Mode01LastHeight=   36
      Ctrl0Style      =   1
      Ctrl0Caption    =   ""
      Ctrl0Width      =   23
      Ctrl0Height     =   18
      Ctrl1ID         =   1
      Ctrl1Style      =   1
      Ctrl1Caption    =   ""
      Ctrl1Width      =   23
      Ctrl1Height     =   18
      Ctrl2ID         =   2
      Ctrl2Style      =   1
      Ctrl2Caption    =   ""
      Ctrl2Top        =   18
      Ctrl2Width      =   95
      Ctrl2Height     =   18
      Ctrl3ID         =   3
      Ctrl3Style      =   1
      Ctrl3Caption    =   ""
      Ctrl3Top        =   18
      Ctrl3Width      =   95
      Ctrl3Height     =   18
      Ctrl4ID         =   4
      Ctrl4Visible    =   -1  'True
      Ctrl4Style      =   1
      Ctrl4Caption    =   "New"
      Ctrl4Width      =   22
      Ctrl4Height     =   18
      Ctrl5ID         =   5
      Ctrl5Style      =   2
      Ctrl5Caption    =   "patience - #"
      Ctrl5Top        =   36
      Ctrl5Width      =   95
      Ctrl5Height     =   20
      Ctrl6ID         =   9
      Ctrl6Visible    =   -1  'True
      Ctrl6Style      =   2
      Ctrl6Caption    =   "Query"
      Ctrl6Top        =   18
      Ctrl6Width      =   33
      Ctrl6Height     =   18
      Ctrl7ID         =   10
      Ctrl7Visible    =   -1  'True
      Ctrl7Style      =   2
      Ctrl7Caption    =   "Save"
      Ctrl7Left       =   33
      Ctrl7Top        =   18
      Ctrl7Width      =   33
      Ctrl7Height     =   18
      Ctrl8ID         =   11
      Ctrl8Visible    =   -1  'True
      Ctrl8Style      =   1
      Ctrl8Caption    =   "Delete"
      Ctrl8Left       =   22
      Ctrl8Width      =   22
      Ctrl8Height     =   18
      Ctrl9ID         =   12
      Ctrl9Visible    =   -1  'True
      Ctrl9Style      =   1
      Ctrl9Caption    =   "QBE"
      Ctrl9Left       =   44
      Ctrl9Width      =   22
      Ctrl9Height     =   18
      Ctrl10ID        =   100
      Ctrl10Style     =   2
      Ctrl10Caption   =   "Caption!"
      Ctrl10Width     =   22
      Ctrl10Height    =   18
      Ctrl11ID        =   6
      Ctrl11Style     =   1
      Ctrl11Caption   =   ""
      Ctrl11Top       =   56
      Ctrl11Width     =   33
      Ctrl11Height    =   18
      Ctrl12ID        =   7
      Ctrl12Style     =   1
      Ctrl12Caption   =   ""
      Ctrl12Left      =   1
      Ctrl12Top       =   56
      Ctrl12Width     =   47
      Ctrl12Height    =   18
      Ctrl13ID        =   8
      Ctrl13Style     =   1
      Ctrl13Caption   =   ""
      Ctrl13Left      =   64
      Ctrl13Top       =   56
      Ctrl13Width     =   31
      Ctrl13Height    =   18
   End
   Begin VB.Image Image2 
      Height          =   7560
      Left            =   3840
      Picture         =   "startform.frx":14F32
      Stretch         =   -1  'True
      Top             =   0
      Width           =   6000
   End
   Begin VB.Image Image1 
      Height          =   7530
      Left            =   0
      Picture         =   "startform.frx":1546A
      Stretch         =   -1  'True
      Top             =   0
      Width           =   3810
   End
End
Attribute VB_Name = "startform"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Unload Me
End Sub

Private Sub Command2_Click()
    register.Show
    startform.Hide
End Sub

Private Sub Command3_Click()
    diagnosis.Show
    startform.Hide
End Sub

Private Sub Command4_Click()
    lab.Show
    startform.Hide
End Sub

Private Sub Command5_Click()
    admission.Show
    startform.Hide
End Sub

Private Sub Command6_Click()
    bill.Show
    startform.Hide
End Sub

Private Sub Command7_Click()
    temporal.Show
    startform.Hide
End Sub

Private Sub Form_activate()
    sql = "select hn from patience"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable Is Nothing Then
        MsgBox "ไม่มีผู้ป่วยในโรงพยาบาลเลย กรุณา INSERT ก่อน", vbOKOnly, "System Message"
    End If
End Sub
