VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmStatusRep 
   BackColor       =   &H00D3E7FC&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Status Report"
   ClientHeight    =   7275
   ClientLeft      =   1995
   ClientTop       =   1725
   ClientWidth     =   11175
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7275
   ScaleWidth      =   11175
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   300
      Left            =   960
      Top             =   3360
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   2520
      Top             =   2310
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
      RThreshold      =   1
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   1890
      Top             =   2310
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   16711935
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   9
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStatusRep.frx":0000
            Key             =   "Root"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStatusRep.frx":0354
            Key             =   "SlvOn"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStatusRep.frx":06A8
            Key             =   "SlvOff"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStatusRep.frx":09FC
            Key             =   "SlvError"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStatusRep.frx":0D50
            Key             =   "SlvTimeout"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStatusRep.frx":10A4
            Key             =   "HmOn"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStatusRep.frx":13F8
            Key             =   "HmOff"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStatusRep.frx":174C
            Key             =   "HmError"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStatusRep.frx":1AA0
            Key             =   "HmTimeout"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TreeView TreeView1 
      Height          =   5685
      Left            =   210
      TabIndex        =   33
      Top             =   840
      Width           =   3060
      _ExtentX        =   5398
      _ExtentY        =   10028
      _Version        =   393217
      Indentation     =   459
      LineStyle       =   1
      Style           =   7
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.ListBox List1 
      Appearance      =   0  'Flat
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1470
      Left            =   3465
      TabIndex        =   32
      Top             =   4830
      Width           =   6960
   End
   Begin VB.CommandButton Sen 
      Caption         =   "Sensor0"
      Height          =   400
      Index           =   0
      Left            =   3630
      Style           =   1  'Graphical
      TabIndex        =   31
      Top             =   1410
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Sen 
      Caption         =   "Sensor1"
      Height          =   400
      Index           =   1
      Left            =   4470
      Style           =   1  'Graphical
      TabIndex        =   30
      Top             =   1410
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Sen 
      Caption         =   "Sensor2"
      Height          =   400
      Index           =   2
      Left            =   5310
      Style           =   1  'Graphical
      TabIndex        =   29
      Top             =   1410
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Sen 
      Caption         =   "Sensor3"
      Height          =   400
      Index           =   3
      Left            =   6150
      Style           =   1  'Graphical
      TabIndex        =   28
      Top             =   1410
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Sen 
      Caption         =   "Sensor4"
      Height          =   400
      Index           =   4
      Left            =   6990
      Style           =   1  'Graphical
      TabIndex        =   27
      Top             =   1410
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Sen 
      Caption         =   "Sensor5"
      Height          =   400
      Index           =   5
      Left            =   7830
      Style           =   1  'Graphical
      TabIndex        =   26
      Top             =   1410
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Sen 
      Caption         =   "Sensor6"
      Height          =   400
      Index           =   6
      Left            =   8670
      Style           =   1  'Graphical
      TabIndex        =   25
      Top             =   1410
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Sen 
      Caption         =   "Sensor7"
      Height          =   400
      Index           =   7
      Left            =   9510
      Style           =   1  'Graphical
      TabIndex        =   24
      Top             =   1410
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Sen 
      Caption         =   "Sensor8"
      Height          =   405
      Index           =   8
      Left            =   3630
      Style           =   1  'Graphical
      TabIndex        =   23
      Top             =   1890
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Sen 
      Caption         =   "Sensor9"
      Height          =   400
      Index           =   9
      Left            =   4470
      Style           =   1  'Graphical
      TabIndex        =   22
      Top             =   1890
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Sen 
      Caption         =   "Sensor10"
      Height          =   400
      Index           =   10
      Left            =   5310
      Style           =   1  'Graphical
      TabIndex        =   21
      Top             =   1890
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Sen 
      Caption         =   "Sensor11"
      Height          =   400
      Index           =   11
      Left            =   6150
      Style           =   1  'Graphical
      TabIndex        =   20
      Top             =   1890
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Sen 
      Caption         =   "Sensor12"
      Height          =   400
      Index           =   12
      Left            =   6990
      Style           =   1  'Graphical
      TabIndex        =   19
      Top             =   1890
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Sen 
      Caption         =   "Sensor13"
      Height          =   400
      Index           =   13
      Left            =   7830
      Style           =   1  'Graphical
      TabIndex        =   18
      Top             =   1890
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Sen 
      Caption         =   "Sensor14"
      Height          =   400
      Index           =   14
      Left            =   8670
      Style           =   1  'Graphical
      TabIndex        =   17
      Top             =   1890
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Sen 
      Caption         =   "Sensor15"
      Height          =   400
      Index           =   15
      Left            =   9510
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   1890
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Dev 
      Caption         =   "Device15"
      Height          =   400
      Index           =   15
      Left            =   9510
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   3450
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Dev 
      Caption         =   "Device14"
      Height          =   400
      Index           =   14
      Left            =   8670
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   3450
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Dev 
      Caption         =   "Device13"
      Height          =   400
      Index           =   13
      Left            =   7830
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   3450
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Dev 
      Caption         =   "Device12"
      Height          =   400
      Index           =   12
      Left            =   6990
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   3450
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Dev 
      Caption         =   "Device11"
      Height          =   400
      Index           =   11
      Left            =   6150
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   3450
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Dev 
      Caption         =   "Device10"
      Height          =   400
      Index           =   10
      Left            =   5310
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   3450
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Dev 
      Caption         =   "Device9"
      Height          =   400
      Index           =   9
      Left            =   4470
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   3450
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Dev 
      Caption         =   "Device8"
      Height          =   405
      Index           =   8
      Left            =   3630
      Style           =   1  'Graphical
      TabIndex        =   8
      Top             =   3450
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Dev 
      Caption         =   "Device7"
      Height          =   400
      Index           =   7
      Left            =   9510
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   2970
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Dev 
      Caption         =   "Device6"
      Height          =   400
      Index           =   6
      Left            =   8670
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   2970
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Dev 
      Caption         =   "Device5"
      Height          =   400
      Index           =   5
      Left            =   7830
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   2970
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Dev 
      Caption         =   "Device4"
      Height          =   400
      Index           =   4
      Left            =   6990
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   2970
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Dev 
      Caption         =   "Device3"
      Height          =   400
      Index           =   3
      Left            =   6150
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   2970
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Dev 
      Caption         =   "Device2"
      Height          =   400
      Index           =   2
      Left            =   5310
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   2970
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Dev 
      Caption         =   "Device1"
      Height          =   400
      Index           =   1
      Left            =   4470
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   2970
      Visible         =   0   'False
      Width           =   800
   End
   Begin VB.CommandButton Dev 
      Caption         =   "Device0"
      Height          =   400
      Index           =   0
      Left            =   3630
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   3000
      Visible         =   0   'False
      Width           =   800
   End
   Begin Project1.zCommand btnExit 
      Height          =   330
      Left            =   4725
      Top             =   6825
      Width           =   1380
      _ExtentX        =   2434
      _ExtentY        =   582
      cDownFore       =   8388736
      Style           =   0
      Caption         =   "Main Menu"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PictureUp       =   "frmStatusRep.frx":1DF4
      PictureDown     =   "frmStatusRep.frx":2651
   End
   Begin VB.Shape Shape4 
      BackColor       =   &H00E1FEFF&
      BorderColor     =   &H001C6E94&
      BorderWidth     =   2
      FillColor       =   &H00E1FEFF&
      FillStyle       =   0  'Solid
      Height          =   1200
      Left            =   3480
      Top             =   2880
      Width           =   6960
   End
   Begin VB.Shape Shape3 
      BorderColor     =   &H00B0CE22&
      BorderWidth     =   2
      FillColor       =   &H00E9FAD1&
      FillStyle       =   0  'Solid
      Height          =   1140
      Left            =   3480
      Top             =   1320
      Width           =   6975
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H00C0C0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "Log"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   3465
      TabIndex        =   35
      Top             =   4515
      Width           =   405
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      BackColor       =   &H00C0C0FF&
      BackStyle       =   0  'Transparent
      Caption         =   "Status Report"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   840
      TabIndex        =   34
      Top             =   315
      Width           =   1425
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   315
      Picture         =   "frmStatusRep.frx":2AA8
      Top             =   210
      Width           =   480
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00FA8E3F&
      BorderWidth     =   2
      FillColor       =   &H00ECF5F7&
      FillStyle       =   0  'Solid
      Height          =   5730
      Left            =   195
      Top             =   825
      Width           =   3105
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H0080B4FB&
      BorderWidth     =   2
      FillColor       =   &H00ECF5F7&
      FillStyle       =   0  'Solid
      Height          =   6540
      Left            =   105
      Top             =   105
      Width           =   10530
   End
End
Attribute VB_Name = "frmStatusRep"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private frametmp, frame As String
Private sadd As Integer
Private hadd As Integer
Private dev1(0 To 30) As String
Private dev2(0 To 30) As String
Private dev1tmp(0 To 30) As Integer
Private dev2tmp(0 To 30) As Integer
Private sen1tmp(0 To 30) As String
Private sen2tmp(0 To 30) As String
Private sen1(0 To 30) As String
Private sen2(0 To 30) As String
Private mode, slavecount, homecount As Integer
Private bc, bctmp, turn, cmd As Integer
Private t, status(0 To 30), close_int As Integer
Private state(0 To 30, 0 To 30), statetmp(0 To 30, 0 To 30) As String
Private lasthaddchk, s_state(0 To 30), h_state(0 To 30), s_time(0 To 30), h_time(0 To 30) As Integer

Private Sub InitTree()
    Dim i As Integer
    
    Set TreeView1.ImageList = ImageList1
    TreeView1.Nodes.Add , , "Master", "Master", "Root"
    
    sql = "SELECT * FROM [Slave]"
    OpenRst sql
    For i = 1 To slavecount
        TreeView1.Nodes.Add "Master", tvwChild, "Slave " & Rst.Fields(0).Value, "Slave " & Rst.Fields(0).Value, "SlvOff"
        Rst.MoveNext
    Next
    
    sql = "SELECT * FROM [Home]"
    OpenRst sql
    For i = 1 To homecount
        TreeView1.Nodes.Add "Slave " & Rst.Fields(3).Value, tvwChild, "Home " & Rst.Fields(0).Value, "Home " & Rst.Fields(0).Value, "HmOff"
        Rst.MoveNext
    Next

    TreeView1.Nodes.Add , , "zRoot", "ZRoot", "Root"
    TreeView1.Nodes.Add "zRoot", tvwChild, "zSlv1", "zSlave 1", "SlvOn"
    TreeView1.Nodes.Add "zRoot", tvwChild, "zSlv2", "zSlave 1", "SlvOff"
    TreeView1.Nodes.Add "zRoot", tvwChild, "zSlv3", "zSlave 1", "SlvError"
    TreeView1.Nodes.Add "zRoot", tvwChild, "zSlv4", "zSlave 1", "SlvTimeout"
    TreeView1.Nodes.Add "zSlv1", tvwChild, "zHm1", "zHome 1", "SlvOn"
    TreeView1.Nodes.Add "zSlv1", tvwChild, "zHm2", "zHome 2", "SlvOff"
    TreeView1.Nodes.Add "zSlv1", tvwChild, "zHm3", "zHome 3", "SlvError"
    TreeView1.Nodes.Add "zSlv1", tvwChild, "zHm4", "zHome 4", "SlvTimeout"
    'Dim nd As Node
    'TreeView1.Nodes("Slave 1").Image = "SlvOn"
    'TreeView1.Nodes("Home 1").Image = "HmOn"
    'TreeView1.Nodes("Home 3").Image = "HmOn"
    'TreeView1.Nodes("Slave 5").Image = "SlvOn"
    'TreeView1.Nodes("Home 12").Image = "HmOn"
End Sub

Private Sub btnExit_Click()
    close_int = 1
    Unload Me
End Sub

Private Sub Dev_Click(index As Integer)
    Dim indextmp, Slave, indextmp2 As Integer
    Dim i As Integer
    
        close_int = 1
        delay (0.1)
        indextmp = dev1tmp(lasthaddchk)
        indextmp2 = dev2tmp(lasthaddchk)
        If Dev(index).BackColor = &H80000011 Then
        Select Case index
        Case 0
            indextmp = indextmp - 1
        Case 1
            indextmp = indextmp - 2
        Case 2
            indextmp = indextmp - 4
        Case 3
            indextmp = indextmp - 8
        Case 4
            indextmp = indextmp - 16
        Case 5
            indextmp = indextmp - 32
        Case 6
            indextmp = indextmp - 64
        Case 7
            indextmp = indextmp - 128
        Case 8
            indextmp2 = indextmp2 - 1
        Case 9
            indextmp2 = indextmp2 - 2
        Case 10
            indextmp2 = indextmp2 - 4
        Case 11
            indextmp2 = indextmp2 - 8
        Case 12
            indextmp2 = indextmp2 - 16
        Case 13
            indextmp2 = indextmp2 - 32
        Case 14
            indextmp2 = indextmp2 - 64
        Case 15
            indextmp2 = indextmp2 - 128
        End Select
            Dev(index).BackColor = &HC0FFC0
            
        Else
        Select Case index
        Case 0
            indextmp = indextmp + 1
        Case 1
            indextmp = indextmp + 2
        Case 2
            indextmp = indextmp + 4
        Case 3
            indextmp = indextmp + 8
        Case 4
            indextmp = indextmp + 16
        Case 5
            indextmp = indextmp + 32
        Case 6
            indextmp = indextmp + 64
        Case 7
            indextmp = indextmp + 128
        Case 8
            indextmp2 = indextmp2 + 1
        Case 9
            indextmp2 = indextmp2 + 2
        Case 10
            indextmp2 = indextmp2 + 4
        Case 11
            indextmp2 = indextmp2 + 8
        Case 12
            indextmp2 = indextmp2 + 16
        Case 13
            indextmp2 = indextmp2 + 32
        Case 14
            indextmp2 = indextmp2 + 64
        Case 15
            indextmp2 = indextmp2 + 128
        End Select
            Dev(index).BackColor = &H80000011
        End If
        dev1tmp(lasthaddchk) = indextmp
        dev2tmp(lasthaddchk) = indextmp2
           
    sql = "SELECT * FROM Home where [Home_Id]='" & lasthaddchk & "'"
    If Rst.state = 1 Then Rst.Close
        Rst.Open sql, Cnn, adOpenKeyset, adLockOptimistic
        Slave = Rst.Fields.Item(3).Value
   
    MSComm1.Output = ":" & Chr(7) & Chr(Slave) & Chr(lasthaddchk) & Chr(3) & Chr(indextmp) & Chr(indextmp2)
    delay (0.2)
    close_int = 0
    polling
End Sub

Private Sub Form_Load()
    Dim i As Integer
    
    For i = 0 To 30
        sen1(i) = "00000000"
        sen2(i) = "00000000"
        sen1tmp(i) = "00000000"
        sen1tmp(i) = "00000000"
        h_state(i) = 0
        s_state(i) = 0
        s_time(i) = 0
        h_time(i) = 0
    Next
        
    MSComm1.Settings = "9600,N,8,1"
    MSComm1.CommPort = 1
    MSComm1.InputLen = 1
    MSComm1.RThreshold = 1
    MSComm1.PortOpen = True
    
    sql = "SELECT Count(*) FROM [Slave]"
    OpenRst sql
    slavecount = Rst.Fields.Item(0).Value
        
    sql = "SELECT Count(*) FROM [Home]"
    OpenRst sql
    homecount = Rst.Fields.Item(0).Value

    InitTree
    Timer1.Enabled = True
    'Master_Click
End Sub

Private Sub Master_Click()
    Dim i As Integer
    t = 0
    'For i = 0 To 29
    '    Home(i).Visible = True
    '    Home(i).Enabled = False
    'Next
        
    'For i = 0 To slavecount - 1
    '    Slave(i).Visible = True
    '    Slave(i).Enabled = False
    'Next
        
    For i = 0 To 15
        Sen(i).Visible = False
    Next
        
    close_int = 0
    polling
End Sub


Private Sub Home_Click(index As Integer)
    Dim i, Sensorcount As Integer
        
    For i = 0 To 15
         Sen(i).Enabled = False
         Sen(i).Visible = False
    Next
        
    sql = "SELECT * FROM Home WHERE [Home_Id]= '" & index & "'"
    OpenRst sql
    Sensorcount = Rst.Fields(2).Value

    sen_refresh (index)
    For i = 0 To Sensorcount - 1
        Sen(i).Caption = "Sensor" & i
        Sen(i).Visible = True
    Next
        
    lasthaddchk = index
        
  ' ----------------Device ----------------------------
    Dim devtmp1, devtmp2 As String
    Dim devicecount As Integer
        
    For i = 0 To 15
        Dev(i).Visible = False
    Next
        
    sql = "SELECT * FROM Home WHERE [Home_Id]= '" & index & "'"
    OpenRst sql
    devicecount = Rst.Fields(1).Value
        
    For i = 1 To 8
        If Mid(dev1(index), i, 1) = "0" Then
            Dev(i - 1).BackColor = &HC0FFC0
        Else: Dev(i - 1).BackColor = &H80000011
            If Mid(dev2(index), i, 1) = "0" Then
                Dev(i + 7).BackColor = &HC0FFC0
            Else: Dev(i + 7).BackColor = &H80000011
            End If
        End If
    Next
        
    For i = 0 To devicecount - 1
        Dev(i).Caption = "Device" & i
        Dev(i).Visible = True
    Next
End Sub


Private Sub MSComm1_OnComm()
    Dim data As String
    Dim asci As Integer
    Dim entry As String
   
    Select Case MSComm1.CommEvent
        Case comEvReceive
            data = MSComm1.Input
            asci = Int(Asc(data))
            Debug.Print Asc(data)
    End Select
    If data = ":" And turn = 0 Then
      frame = ":"
      turn = 1
      Else
        If frame = ":" And turn = 1 Then
        bc = Asc(data)
        frame = frame & Chr(bc)
        turn = 2
        Else
          If turn = 2 And Len(frame) <> bc Then
            frame = frame & data
            If Len(frame) = bc Then
                List1.ListIndex = List1.ListCount - 1
                frametmp = frame
                bctmp = bc
                bc = 0
                turn = 0
            End If
          End If
        End If
    End If
End Sub

Private Function delay(DelayTime)
Dim LoopTime As Double
Const SecInDay = 86400
LoopTime = Timer + DelayTime
     If LoopTime > SecInDay Then
         LoopTime = LoopTime - SecInDay
         Do While Timer > LoopTime
                  DoEvents
         Loop
     End If
         Do While Timer < LoopTime
                  DoEvents
         Loop
End Function

Private Function dec_bin(i As Integer) As String 'Interger to 8 bit Binary in String
 Dim j As Integer
 Dim str, tmp As String
    While ((i) > 0)
       j = i Mod 2
       str = str & j
       i = i \ 2
    Wend
    tmp = ""
    'For j = 0 To Len(str) - 1
    '    tmp = tmp & Mid(str, Len(str) - j, 1)
    'Next
    While (Len(str) < 8)
    str = "0" & str
    Wend
    dec_bin = str
End Function


Private Function dec_bin2(ByVal i As Integer) As String 'Interger to 8 bit Binary inverse
 Dim k, j As Integer
 Dim str, str_rev, tmp As String
    k = i
    While ((i) > 0)
       j = i Mod 2
       str = str & j
         i = i \ 2
    Wend
    tmp = str
    For i = 1 To Len(str)
    str_rev = str_rev & Right(tmp, 1)
    tmp = Left(str, Len(str) - i)
    Next
    While (Len(str_rev) < 8)
    str_rev = "0" & str_rev
    Wend
    
   
    Dim st As String
    st = ""
    tmp = str_rev
    For j = 1 To Len(tmp)
        If Mid(tmp, j, 1) = "0" Then st = st & "1" Else st = st & "0"
    Next
    Debug.Print st;
    dec_bin2 = st
End Function

Private Sub Form_Unload(Cancel As Integer)
    frmMenu.Show
End Sub

Private Sub polling()
  Dim slave_st, slave_ct, i As Integer
  Dim sql As String
  
        While (close_int = 0)

'------------------------- Slave 1 Home 1 -------------------------
             If t = 0 Then
                MSComm1.Output = ":" & Chr(5) & Chr(1) & Chr(1) & Chr(1)
                delay (0.3)
                'Shape1(0).FillColor = &HC0FFC0
 ' -------------------- Slave Request time out -----------------------
                If Len(frametmp) = 3 And Asc(Mid(frametmp, 3, 1)) = 6 Then
                  'Slave(1).BackColor = &HC0FFFF
                  'Slave(1).Enabled = False
                  TreeView1.Nodes("Slave 1").Image = "SlvTimeout"
                  t = 1
                  s_state(1) = 1
                  
                  sql = "SELECT * FROM Slave Where [Slave_Id]= 1"
                  If Rst.state = 1 Then Rst.Close
                  Rst.Open sql, Cnn, adOpenKeyset, adLockOptimistic
                  slave_ct = Rst.Fields(1).Value
                  slave_st = Rst.Fields(2).Value
                  
                  For i = slave_st To slave_ct + slave_st
                    'Home(i).Enabled = False
                    'Home(i).BackColor = &H8000000F
                    TreeView1.Nodes("Home " & i).Image = "HmOff"
                  Next
                   For i = 0 To 15
                      Sen(i).Visible = False
                      Dev(i).Visible = False
                    Next
                '------------Slave report ------------
                If s_state(1) = 1 And s_time(1) = 0 Then
                List1.AddItem Date & " " & Time & " Slave# 1" & " Status : Request time out!!!"
                s_time(1) = 1
                
                End If

'--------------------- Home Request time out ---------------------------
                  Else
                  If Len(frametmp) = 3 And Asc(Mid(frametmp, 3, 1)) = 5 Then
                    'Home(1).BackColor = &HC0FFFF
                    'Home(1).Enabled = False
                    TreeView1.Nodes("Home 1").Image = "HmTimeout"
                    t = 1
                    s_state(1) = 0
                    s_time(1) = 0
                    h_state(1) = 1
                    If h_state(1) = 1 And h_time(1) = 0 Then
                    List1.AddItem Date & " " & Time & " Home# 1" & " Status : Request time out!!!"
                    h_time(1) = 1
                    End If
                    
  
                  
'-------------------------- Working CMD=1-----------------------------
                   Else
                   If Len(frametmp) = bctmp And frametmp <> "" And Len(frametmp) > 9 Then
                    If Asc(Mid(frametmp, 4, 1)) = 1 Then
                        sadd = Asc(Mid(frametmp, 3, 1))
                        hadd = Asc(Mid(frametmp, 4, 1))
                        sen1(hadd) = dec_bin2(Asc(Mid(frametmp, 6, 1)))
                        sen2(hadd) = dec_bin2(Asc(Mid(frametmp, 7, 1)))
                        dev1(hadd) = dec_bin(Asc(Mid(frametmp, 8, 1)))
                        dev2(hadd) = dec_bin(Asc(Mid(frametmp, 9, 1)))
                        dev1tmp(hadd) = Asc(Mid(frametmp, 8, 1))
                        dev2tmp(hadd) = Asc(Mid(frametmp, 9, 1))

                        'Home(hadd).Enabled = True
                        'Slave(sadd).Enabled = True
                        TreeView1.Nodes("Home " & hadd).Image = "HmOn"
                        TreeView1.Nodes("Slave " & sadd).Image = "SlvOn"
                      '------------Slave  &  Home OK------------
                        If s_state(1) = 1 And s_time(1) = 1 Then
                        List1.AddItem Date & " " & Time & " Slave# 1" & " Status : Ok"
                        s_state(1) = 0
                        s_time(1) = 0
                        End If
                        
                        If h_state(1) = 1 And h_time(1) = 1 Then
                        List1.AddItem Date & " " & Time & " Home# 1" & " Status : Ok"
                        h_time(1) = 0
                        h_state(1) = 0
                        End If
            
                        If sen1(hadd) <> sen1tmp(hadd) Or sen2(hadd) <> sen2tmp(hadd) Then sen_refresh (hadd)
                        color_refresh
                        t = 1
                        End If
                      End If
                  End If
            End If
            End If
            
            
'------------------------- Slave 1 Home 3 -------------------------
       If t = 1 Then
                   
           MSComm1.Output = ":" & Chr(5) & Chr(1) & Chr(3) & Chr(1)
            delay (0.25)
            'Shape1(0).FillColor = &HC0FFFF
            
'------------------------ Slave Request time out ---------------------------
        If Len(frametmp) = bctmp And Asc(Mid(frametmp, 3, 1)) = 6 Then
                  'Slave(1).BackColor = &HC0FFFF
                  'Slave(1).Enabled = False
                  TreeView1.Nodes("Slave 1").Image = "SlvTimeout"
                  t = 2

         sql = "SELECT * FROM Slave Where [Slave_Id]= 1"
                  If Rst.state = 1 Then Rst.Close
                  Rst.Open sql, Cnn, adOpenKeyset, adLockOptimistic
                  slave_ct = Rst.Fields.Item(1).Value
                  slave_st = Rst.Fields.Item(2).Value
                  
               For i = 0 To 15
                    Sen(i).Visible = False
                    Dev(i).Visible = False
               Next
                  For i = slave_st To slave_ct + slave_st
                    'Home(i).Enabled = False
                    'Home(i).BackColor = &H8000000F
                    TreeView1.Nodes("Home " & i).Image = "HmOff"
                  Next
                  s_state(1) = 1
                  If s_state(1) = 1 And s_time(1) = 0 Then
                  List1.AddItem Date & " " & Time & " Slave# 1" & " Status : Request time out!!!"
                  s_time(1) = 1
                  End If
'--------------------- Home Request time out ---------------------------
                  Else
                  If Len(frametmp) = 3 And Asc(Mid(frametmp, 3, 1)) = 5 Then
                    'Home(3).BackColor = &HC0FFFF
                    'Home(3).Enabled = False
                    TreeView1.Nodes("Home 3").Image = "HmTimeout"
                    t = 2
                    If s_state(1) = 1 And s_time(1) = 1 Then
                    List1.AddItem Date & " " & Time & " Slave# 1" & " Status : Ok"
                    s_state(1) = 0
                    s_time(1) = 0
                    End If
                    
                    h_state(3) = 1
                    If h_state(3) = 1 And h_time(3) = 0 Then
                    List1.AddItem Date & " " & Time & " Home# 3" & " Status : Request time out!!!"
                    h_time(3) = 1
                    End If
                  
'-------------------------- Working CMD=1-----------------------------
               Else
                 If Len(frametmp) = bctmp And frame <> "" And Len(frametmp) > 9 Then
                  If Asc(Mid(frametmp, 4, 1)) = 3 Then
                    sadd = Asc(Mid(frametmp, 3, 1))
                    hadd = Asc(Mid(frametmp, 4, 1))
                    sen1(hadd) = dec_bin2(Asc(Mid(frametmp, 6, 1)))
                    sen2(hadd) = dec_bin2(Asc(Mid(frametmp, 7, 1)))
                    dev1(hadd) = dec_bin(Asc(Mid(frametmp, 8, 1)))
                    dev2(hadd) = dec_bin(Asc(Mid(frametmp, 9, 1)))
                    dev1tmp(hadd) = Asc(Mid(frametmp, 8, 1))
                    dev2tmp(hadd) = Asc(Mid(frametmp, 9, 1))
                    
                    'Home(hadd).Enabled = True
                    'Slave(sadd).Enabled = True
                    TreeView1.Nodes("Home " & hadd).Image = "HmOn"
                    TreeView1.Nodes("Slave " & sadd).Image = "SlvOn"
                    
                    If h_state(3) = 1 And h_time(3) = 1 Then
                    List1.AddItem Date & " " & Time & " Home# 3" & " Status : Ok"
                    h_time(3) = 0
                    h_state(3) = 0
                    End If
                
            If sen1(hadd) <> sen1tmp(hadd) Or sen2(hadd) <> sen2tmp(hadd) Then sen_refresh (hadd)
            
            color_refresh
            t = 2
          End If
        End If
       End If
      End If
       
    End If
            
'------------------------- Slave 5 Home 12 -------------------------
       If t = 2 Then
                   
           MSComm1.Output = ":" & Chr(5) & Chr(5) & Chr(12) & Chr(1)
            delay (0.3)
            'Shape1(0).FillColor = &HC0FFFF
            
'------------------------ Slave Request time out ---------------------------
        If Len(frametmp) = bctmp And Asc(Mid(frametmp, 3, 1)) = 6 Then
                  'Slave(5).BackColor = &HC0FFFF
                  'Slave(5).Enabled = False
                  TreeView1.Nodes("Slave 5").Image = "SlvTimeout"
                  t = 0

         sql = "SELECT * FROM Slave Where [Slave_Id]= 5"
                  If Rst.state = 1 Then Rst.Close
                  Rst.Open sql, Cnn, adOpenKeyset, adLockOptimistic
                  slave_ct = Rst.Fields.Item(1).Value
                  slave_st = Rst.Fields.Item(2).Value
                  
               For i = 0 To 15
                    Sen(i).Visible = False
                    Dev(i).Visible = False
               Next
                  For i = slave_st To slave_ct + slave_st
                    'Home(i).Enabled = False
                    'Home(i).BackColor = &H8000000F
                    TreeView1.Nodes("Home " & i).Image = "HmOff"
                  Next
                  s_state(5) = 1
                '  s_time(5) = 0
                  If s_state(5) = 1 And s_time(5) = 0 Then
                  List1.AddItem Date & " " & Time & " Slave# 5" & " Status : Request time out!!!"
                  s_time(5) = 1
                  End If
'--------------------- Home Request time out ---------------------------
                  Else
                  If Len(frametmp) = 3 And Asc(Mid(frametmp, 3, 1)) = 5 Then
                    'Home(12).BackColor = &HC0FFFF
                    'Home(12).Enabled = False
                    TreeView1.Nodes("Home 12").Image = "HmTimeout"
                    t = 0
                    If s_state(5) = 1 And s_time(5) = 1 Then
                    TreeView1.Nodes("Slave 5").Image = "SlvOn"
                    List1.AddItem Date & " " & Time & " Slave# 5" & " Status : Ok"
                    s_state(5) = 0
                    s_time(5) = 0
                    
                    End If
                    
                    h_state(12) = 1
                    If h_state(12) = 1 And h_time(12) = 0 Then
                    List1.AddItem Date & " " & Time & " Home# 12" & " Status : Request time out!!!"
                    h_time(12) = 1
                    End If
                  
'-------------------------- Working CMD=1-----------------------------
               Else
                 If Len(frametmp) = bctmp And frametmp <> "" And Len(frametmp) > 9 Then
                  If Asc(Mid(frametmp, 4, 1)) = 12 Then
                    sadd = Asc(Mid(frametmp, 3, 1))
                    hadd = Asc(Mid(frametmp, 4, 1))
                    sen1(hadd) = dec_bin2(Asc(Mid(frametmp, 6, 1)))
                    sen2(hadd) = dec_bin2(Asc(Mid(frametmp, 7, 1)))
                    dev1(hadd) = dec_bin(Asc(Mid(frametmp, 8, 1)))
                    dev2(hadd) = dec_bin(Asc(Mid(frametmp, 9, 1)))
                    dev1tmp(hadd) = Asc(Mid(frametmp, 8, 1))
                    dev2tmp(hadd) = Asc(Mid(frametmp, 9, 1))
                    
                    
                    If s_state(5) = 1 And s_time(5) = 1 Then
                    TreeView1.Nodes("Slave 5").Image = "SlvOn"
                    List1.AddItem Date & " " & Time & " Slave# 5" & " Status : Ok"
                    s_state(5) = 0
                    s_time(5) = 0
                    
                    
                    End If
                    'Home(hadd).Enabled = True
                    'Slave(sadd).Enabled = True
                    TreeView1.Nodes("Home " & hadd).Image = "HmOn"
                    TreeView1.Nodes("Slave " & sadd).Image = "SlvOn"
                    
                    If h_state(12) = 1 And h_time(12) = 1 Then
                    List1.AddItem Date & " " & Time & " Home# 12" & " Status : Ok"
                    h_time(12) = 0
                    h_state(12) = 0
                    End If
                
            If sen1(hadd) <> sen1tmp(hadd) Or sen2(hadd) <> sen2tmp(hadd) Then sen_refresh (hadd)
            
            color_refresh
            t = 0
          End If
        End If
       End If
      End If
        
    End If

    Wend
        
End Sub
Private Sub color_refresh()
Dim i As Integer
'Dim state As Integer

            If sen1(hadd) = "00000000" And sen2(hadd) = "00000000" Then
               'Home(hadd).BackColor = &HC0FFC0
               'Slave(sadd).BackColor = &HC0FFC0
               TreeView1.Nodes("Home " & hadd).Image = "HmOn"
               TreeView1.Nodes("Slave " & sadd).Image = "SlvOn"
            Else
                'Home(hadd).BackColor = &HFF&
                'Slave(sadd).BackColor = &HFF&
                TreeView1.Nodes("Home " & hadd).Image = "HmError"
                TreeView1.Nodes("Slave " & sadd).Image = "SlvError"
            End If

            If sen1(hadd) <> "00000000" Or sen2(hadd) <> "00000000" Then
                state(sadd, hadd) = "Sensor Detected!!!"
            Else
                state(sadd, hadd) = "Ok"
            End If

            
            If state(sadd, hadd) <> statetmp(sadd, hadd) Then
                List1.AddItem Date & " " & Time & " Slave#" & sadd & " Home#" & hadd & "Status :" & state(sadd, hadd)
                statetmp(sadd, hadd) = state(sadd, hadd)
            End If
            
                If hadd = 12 Then
                
                End If
            For i = 0 To 30
                If state(sadd, i) = "Sensor Detected!!!" Then
                   status(sadd) = 1
                   i = 31
                Else
                If state(sadd, i) = "Ok" Then
                    status(sadd) = 0
                    
                End If
                End If
            Next
            
                If status(sadd) = 1 Then
                    'Slave(sadd).BackColor = &HFF&
                    TreeView1.Nodes("Slave " & sadd).Image = "SlvError"
                Else
                    'Slave(sadd).BackColor = &HC0FFC0
                    TreeView1.Nodes("Slave " & sadd).Image = "SlvOn"
                End If
                
End Sub

Private Sub sen_refresh(index As Integer)
    Dim sql As String
    Dim i As Integer
    Dim Sensorcount As Integer
        
        For i = 0 To 15
         Sen(i).Enabled = False
         Sen(i).Visible = False
        Next

        sql = "SELECT * FROM Home WHERE [Home_Id]= '" & index & "'"
        If Rst.state = 1 Then Rst.Close
        Rst.Open sql, Cnn, adOpenKeyset, adLockOptimistic
        Sensorcount = Rst.Fields(2).Value
               
        For i = 1 To 8
        
            If Mid(sen1(index), i, 1) = "1" Then
                Sen(i - 1).BackColor = &HFF&
            Else: Sen(i - 1).BackColor = &HC0FFC0
            If Mid(sen2(index), i, 1) = "1" Then
                Sen(i + 7).BackColor = &HFF&
            Else: Sen(i + 7).BackColor = &HC0FFC0
            End If
            End If
        Next
        
        sen1tmp(index) = sen1(index)
        sen2tmp(index) = sen2(index)
        
        For i = 0 To Sensorcount - 1
        Sen(i).Caption = "Sensor" & i
        Sen(i).Visible = True
       Next
        
End Sub

Private Sub Timer1_Timer()
  Master_Click
  Timer1.Enabled = False
End Sub

Private Sub TreeView1_Click()
    Dim nd As Node
    Dim index As Integer
    Set nd = TreeView1.SelectedItem
    If (Left(nd.key, 5) = "Home ") Then
        index = Right(nd.key, (Len(nd.key)) - 5)
        Home_Click index
    Else
      Dim i As InputModeConstants
      For i = 0 To 15
        Dev(i).Visible = False
        Sen(i).Visible = False
      Next
    End If
End Sub

'-------------------------DES Function --------------------------------------

Private Sub Full_Encrypt_Decrypt(key As String, inst As String, outst As String)
    Dim lngRet As Long
    Dim soutput() As Byte
    Dim sOutputtemp As String
    Dim sOutputtemp1 As String
    Dim sInput As String
    Dim sKey As String
    Dim sCorrect As String
    Dim lngDataLen As Long
    Dim lngKeyLen As Long
    Dim i As Integer

    lngDataLen = Len(inst)
    lngKeyLen = Len(key)
    
    If lngDataLen <> 0 Then
        While (lngDataLen Mod 8) <> 0
            inst = inst + " "
            lngDataLen = Len(inst)
        Wend
        
        While (lngKeyLen Mod 8) <> 0
            key = key + " "
            lngKeyLen = Len(key)
        Wend
        
        ReDim soutput(lngDataLen)
          sInput = inst
  '        sKey = bu_Bytes2HexStr(key, lngKeyLen)
          sOutputtemp = String(lngDataLen * 2, " ")
        
        ' Encrypt in one-off process
        lngRet = DES_Hex(sOutputtemp, sInput, sKey, False)
        Call bu_HexStr2Bytes(sOutputtemp, soutput)
        outst = ""
        For i = 0 To lngDataLen
            outst = outst & Chr(soutput(i))
        Next
        
    End If
End Sub
    
Public Function bu_Bytes2HexStr(aBytes() As Byte, nBytes As Long) As String
    bu_Bytes2HexStr = bu_Str2Hex(bu_Bytes2String(aBytes, nBytes))
End Function


Public Function bu_HexStr2Bytes(sHex As String, aBytes() As Byte) As Integer
' Converts string <sHex> with hex values into array of bytes
' Returns # of bytes converted
' Assumes array is large enough
' E.g. "fedcba98" will be converted into {&HFE, &HDC, &HBA, &H98}
    Dim i As Integer
    Dim nBytes As Integer

    If Not bu_IsValidHex(sHex) Then    ' Validation added Aug 2001
        Exit Function
    End If

    nBytes = Len(sHex) \ 2
    For i = 0 To nBytes - 1
        aBytes(i) = CByte("&H" & Mid(sHex, i * 2 + 1, 2))
    Next

    bu_HexStr2Bytes = nBytes

End Function

Public Function bu_HexStr2Words(sHex As String, aWords() As Long) As Integer
' Converts string <sHex> with hex values into array of words (long ints)
' Returns # of words converted
' Assumes array is large enough
' E.g. "fedcba9876543210" will be converted into {&HFEDCBA98, &H76543210}
    Const ncLEN As Integer = 8
    Dim i As Integer
    Dim nWords As Integer

    If Not bu_IsValidHex(sHex) Then    ' Validation added Aug 2001
        Exit Function
    End If

    nWords = Len(sHex) \ ncLEN
    For i = 0 To nWords - 1
        aWords(i) = CLng("&H" & Mid(sHex, i * ncLEN + 1, ncLEN))
    Next

    bu_HexStr2Words = nWords

End Function

' New function added in Version 3, 11 May 2001.
Public Function bu_Words2HexStr(aWords() As Long, nWords As Long) As String
' Converts array of words (long ints), nWords long, into a string
' E.g. {&HFEDCBA98, &H76543210} will be converted to "FEDCBA9876543210"
    Const ncLEN As Integer = 8
    Dim i As Integer
    Dim sHex As String

    bu_Words2HexStr = ""
    For i = 0 To nWords - 1
        sHex = Hex(aWords(i))
        sHex = String(ncLEN - Len(sHex), "0") & sHex
        bu_Words2HexStr = bu_Words2HexStr & sHex
    Next

End Function

Public Function bu_String2Bytes(str As String, aBytes() As Byte) As Integer
' Converts string <str> directly into array of bytes
' String may contain any characters between &H00 and &HFF
' Returns # of bytes converted
' Assumes array is large enough
' E.g. "abc" will be converted to (&H61, &H62, &H63) i.e. (97, 98, 99)
    Dim i As Integer
    Dim nBytes As Integer

    nBytes = Len(str)
    For i = 0 To nBytes - 1
        aBytes(i) = Asc(Mid(str, i + 1, 1))
    Next

    bu_String2Bytes = nBytes

End Function

Public Function bu_Bytes2String(aBytes() As Byte, nBytes As Long) As String
' Converts array of bytes, nBytes long, into a string
' E.g. (&H61, &H62, &H63) will be converted to "abc"
    Dim i As Integer
    Dim str As String

    For i = 0 To nBytes - 1
        str = str & Chr(aBytes(i * 2))
    Next

    bu_Bytes2String = str

End Function

Public Function bu_String2Words(str As String, aWords() As Long) As Long
' Converts string of ascii chars into an array of 32-bit words
' E.g. "abcdefgh" will be converted to {&H61626364, &H65666768}
    Dim sTemp As String
    sTemp = bu_Str2Hex(str)
    bu_String2Words = bu_HexStr2Words(sTemp, aWords)
End Function

Public Function bu_Str2Hex(str As String) As String
' Converts string <str> of ascii chars to string in hex byte format
' E.g. "abc" will be converted to "616263"
    Dim byt As Byte
    Dim i As Integer
    Dim n As Integer
    Dim sHex As String
    sHex = ""

    n = Len(str)
    For i = 1 To n
        byt = CByte(Asc(Mid(str, i, 1)))
        If Len(Hex(byt)) = 1 Then
            sHex = sHex & "0" & Hex(byt)
        Else
            sHex = sHex & Hex(byt)
        End If
    Next
    bu_Str2Hex = sHex

End Function

Public Function bu_Hex2Str(sHex As String) As String
' Version 3.1: New function added August 2001
' Converts string <sHex> in hex format to string of ascii chars
' E.g. "6162632E" will be converted to "abc."
    Dim i As Integer
    Dim nBytes As Integer

    bu_Hex2Str = ""
    If Not bu_IsValidHex(sHex) Then
        Exit Function
    End If
    nBytes = Len(sHex) \ 2
    For i = 0 To nBytes - 1
        bu_Hex2Str = bu_Hex2Str & Chr(CByte("&H" & Mid(sHex, i * 2 + 1, 2)))
    Next

End Function

Public Function bu_IsValidHex(strToCheck As String)
' Vesrion 3.1: New function added August 2001
' Returns True if strToCheck only contains valid hexadecimal digits
    Const scHEXDIGITS As String = "0123456789ABCDEFabcdef"
    ' NB Include both uc and lc just in case Binary Compare mode
    Dim i As Integer
    Dim nLen As Long

    bu_IsValidHex = True
    nLen = Len(strToCheck)
    For i = 1 To nLen
        If InStr(scHEXDIGITS, Mid(strToCheck, i, 1)) = 0 Then
            bu_IsValidHex = False
            Exit For
        End If
    Next
End Function

Public Function bu_XorBytes(aByt1() As Byte, aByt2() As Byte, nBytes As Long)
' XOR's bytes in array aByt1 with array aByt2
' Returns results in aByt1
' i.e. aByt1 = aByt1 XOR aByt2
    Dim i As Long
    For i = 0 To nBytes - 1
        aByt1(i) = aByt1(i) Xor aByt2(i)
    Next
End Function

Public Function bu_CopyBytes(aDest() As Byte, aSrc() As Byte, nBytes As Long)
' Copies nBytes from array aSrc() into aDest()
' Assumes aDest is large enough.
    Dim i As Long
    For i = 0 To nBytes - 1
        aDest(i) = aSrc(i)
    Next
End Function

Public Function bu_LoadByteArray(aBytes() As Byte, ParamArray List() As Variant) As Integer
' Copies a list of values <List> into array of bytes <aBytes>.
' Returns number of bytes read.
' Checks length of array first.
' E.g. bu_LoadByteArray(aBytes, &HFE, &HDC, &HBA, &H98) will return 4 and set
' aBytes(0) = &HFE, aBytes(1) = &HDC, aBytes(2) = &HBA, aBytes(3) = &H98
    Dim nLen As Integer, i As Integer

    nLen = UBound(List())      ' NB Zero-base, so one less than real length
    If UBound(aBytes()) < nLen Then
        nLen = UBound(aBytes())
    End If

    For i = 0 To nLen
        aBytes(i) = CByte(List(i))
    Next

    bu_LoadByteArray = nLen + 1

End Function

' Version 3: ShiftLeft and ShiftRight functions improved.
' Thanks to Doug J Ward for these.
' Identical functions are also used as private functions in basRadix64
Public Function bu_ShiftLeft(ByVal bytValue As Byte, intShift As Integer) As Byte
    If intShift > 0 And intShift < 8 Then
        bu_ShiftLeft = bytValue * (2 ^ intShift) Mod 256
    ElseIf intShift = 0 Then
        bu_ShiftLeft = bytValue
    Else
        bu_ShiftLeft = 0
    End If
End Function

Public Function bu_ShiftRight(ByVal bytValue As Byte, intShift As Integer) As Byte
    If intShift > 0 And intShift < 8 Then
        bu_ShiftRight = bytValue \ (2 ^ intShift)
    ElseIf intShift = 0 Then
        bu_ShiftRight = bytValue
    Else
        bu_ShiftRight = 0
    End If
End Function

Public Function bu_PadHexString(strData As String, nblocklen As Long) As String
' Pad hex data string to next multiple of nBlockLen bytes as per RFC 2630
    Dim nLen As Long
    Dim sPad As String
    Dim nPad As Integer
    Dim sHex As String
    Dim i As Integer
    nLen = Len(strData) \ 2
    nPad = ((nLen \ nblocklen) + 1) * nblocklen - nLen
    nPad = nPad And &HFF
    sHex = IIf(nPad < 16, "0" & Hex(nPad), Hex(nPad))
    sPad = ""
    ' Pad with # of pads (1-n)
    For i = 1 To nPad
        sPad = sPad & sHex
    Next
    bu_PadHexString = strData & sPad

End Function

Public Function bu_UnpadHexString(strData As String, nblocklen As Long) As String
' Strip RFC 2630-style padding from hex string
    Dim nLen As Long
    Dim nPad As Long
    nLen = Len(strData)
    ' Get # of padding bytes from last char hex pair
    nPad = Int("&H" & (Right(strData, 2)))
    If nPad > nblocklen Then nPad = 0    ' In case invalid
    bu_UnpadHexString = Left(strData, nLen - nPad * 2)
End Function

Private Sub Decrypt(key As String, inst As String, outst As String)
    Dim lngRet As Long
    Dim soutput() As Byte
    Dim sOutputtemp As String
    Dim sOutputtemp1 As String
    Dim sInput As String
    Dim sKey As String
    Dim sCorrect As String
    Dim lngDataLen As Long
    Dim lngKeyLen As Long
    Dim i As Integer

    lngDataLen = Len(inst)
    lngKeyLen = Len(key)
    
    If lngDataLen <> 0 Then
        ReDim soutput(lngDataLen)
  '        sInput = bu_Bytes2HexStr(inst, lngDataLen)
  '        sKey = bu_Bytes2HexStr(key, lngKeyLen)

        sOutputtemp = String(lngDataLen, " ")
        ' Encrypt in one-off process
        lngRet = DES_Hex(sOutputtemp, sInput, sKey, False)
        Call bu_HexStr2Bytes(sOutputtemp, soutput)
        outst = ""
        For i = 0 To lngDataLen
            outst = outst & Chr(soutput(i))
        Next
   
    End If
End Sub


Private Sub Encrypt(key As String, inst As String, outst As String)
    Dim lngRet As Long
    Dim soutput() As Byte
    Dim sOutputtemp As String
    Dim sOutputtemp1 As String
    Dim sInput As String
    Dim sKey As String
    Dim sCorrect As String
    Dim lngDataLen As Long
    Dim lngKeyLen As Long
    Dim i As Integer

    lngDataLen = Len(inst)
    lngKeyLen = Len(outst)
    
    If lngDataLen <> 0 Then
        While (lngDataLen Mod 8) <> 0
            inst = inst + " "
            lngDataLen = Len(inst)
        Wend
        
        While (lngKeyLen Mod 8) <> 0
            key = key + " "
            lngKeyLen = Len(key)
        Wend
        
        ReDim soutput(lngDataLen)
   '       sInput = bu_Bytes2HexStr(inst, lngDataLen)
   '       sKey = bu_Bytes2HexStr(key, lngKeyLen)
        
        ' Set sOutput to be same length as sInput
        sOutputtemp = String(lngDataLen * 2, " ")
        
        ' Encrypt in one-off process
        lngRet = DES_Hex(sOutputtemp, sInput, sKey, True)
        
        Call bu_HexStr2Bytes(sOutputtemp, soutput)
        
        outst = ""
        For i = 0 To lngDataLen
            outst = outst & Chr(soutput(i))
        Next
    End If
End Sub



