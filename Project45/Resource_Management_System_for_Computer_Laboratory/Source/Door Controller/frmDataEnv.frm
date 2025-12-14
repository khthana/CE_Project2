VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form frmDataEnv 
   Caption         =   "โปรแกรมคงบคุมการเข้าใช้ห้อง"
   ClientHeight    =   3030
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3990
   Icon            =   "frmDataEnv.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   3990
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   3285
      Top             =   510
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   3000
      Top             =   1095
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.CommandButton Command4 
      BackColor       =   &H00C0C0FF&
      Caption         =   "ปิดการใช้งาน เครื่องอ่านบัตร"
      Height          =   495
      Left            =   600
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   2160
      Width           =   2655
   End
   Begin VB.CommandButton Command3 
      BackColor       =   &H00C0FFC0&
      Caption         =   "เปิดการใช้งาน เครื่องอ่านบัตร"
      Height          =   495
      Left            =   600
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   1680
      Width           =   2655
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H00C0C0FF&
      Caption         =   "ปิดประตู"
      Height          =   495
      Left            =   600
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   840
      Width           =   2655
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00C0FFC0&
      Caption         =   "เปิดประตู"
      Height          =   495
      Left            =   600
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   360
      Width           =   2655
   End
   Begin VB.Shape Shape2 
      BackColor       =   &H00FEEBEC&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00FF0000&
      Height          =   1215
      Left            =   480
      Top             =   1560
      Width           =   2895
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00FEEBEC&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00FF0000&
      Height          =   1215
      Left            =   480
      Top             =   240
      Width           =   2895
   End
   Begin VB.Shape Shape3 
      BackColor       =   &H00E8FEFF&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00FF0000&
      BorderWidth     =   2
      Height          =   3015
      Left            =   15
      Top             =   15
      Width           =   3975
   End
End
Attribute VB_Name = "frmDataEnv"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' access card
Option Explicit
Private Declare Sub Out Lib "inpout32.dll" Alias "Out32" (ByVal PortAddress As Integer, ByVal Value As Integer)

Dim counter As Long
Dim user_buffer As String
Dim read As Boolean
Private Const read_every As Double = 1

Private Sub Command1_Click()
    Command1.Enabled = False
    Command2.Enabled = True
    Out &H378, &H0
End Sub

Private Sub Command2_Click()
    Command2.Enabled = False
    Command1.Enabled = True
    Out &H378, &HFF
End Sub

Private Sub Command3_Click()
    Command3.Enabled = False
    Command4.Enabled = True
    If Not read Then
        readloop
    End If

End Sub

Private Sub Command4_Click()
    read = False
    Command3.Enabled = True
    Command4.Enabled = False
End Sub

Private Sub Form_Load() 'รูดบัตร
    config_comport
    Out &H378, &HFF ' close the door
    counter = 0
    user_buffer = ""
  '  check_user ("March")
    read = False
'    read = True
    'check_user ("nut") 'for test
   ' check_user ("march") 'for test
    'update_lock 'for test
End Sub

Private Sub config_comport()
    'On Error Resume Next
    MSComm1.Settings = "19200,N,8,1"
    MSComm1.CommPort = 1
    MSComm1.InputLen = 1
    MSComm1.PortOpen = True
    MSComm1.RThreshold = 1
End Sub

Private Sub readloop()
    read = True
   Do While read
        delay (read_every)
        MSComm1.Output = ":221" & Chr$(13)
        'read = False
    Loop
End Sub

Private Sub Form_Unload(Cancel As Integer)
    MSComm1.PortOpen = False
    End
End Sub

Private Sub MSComm1_OnComm()
Dim data_input As Variant
    data_input = MSComm1.Input
    If (data_input <> "E" And data_input <> "R") Then
        user_buffer = user_buffer & data_input
        counter = counter + 1
    End If
    If counter >= 8 Then
        If user_buffer = "99999999" Then
            Out &H378, &H0 'opendoor เปิดประตู
            delay (read_every)
            MSComm1.Output = ":221" & Chr$(13)
            delay (read_every)
            MSComm1.Output = ":221" & Chr$(13)
            delay (read_every)
            MSComm1.Output = ":221" & Chr$(13)
            delay (read_every)
            MSComm1.Output = ":221" & Chr$(13)
            delay (read_every)
            MSComm1.Output = ":221" & Chr$(13)
            Out &H378, &HFF 'closedoor ปิดประตู
        Else
            check_user (user_buffer)
        End If
        
        user_buffer = ""
        counter = 0
    End If
End Sub

Private Sub check_user(user_card As String)
Dim Conn As ADODB.Connection
Dim rs As ADODB.Recordset
Dim sql As String
Dim check As Boolean
Dim val1, val2, val3 As String
Dim int1 As Long
Dim scard As String
    Set Conn = New ADODB.Connection
    Set rs = New ADODB.Recordset
    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    sql = "select username,timecard  from check_card where username = '" & user_card & "' and canaccess = 1"
    rs.Open sql, Conn, , , adCmdText
    If user_card = "42010004" Then
        Debug.Print "access"
    End If
    If Not rs.EOF Then
        val1 = rs("username")
        val2 = (DatePart("yyyy", Now) Mod 100) * 12 ' time and date in second
        val2 = (val2 + DatePart("m", Now)) * 31
        val2 = (val2 + DatePart("d", Now)) * 24
        val2 = (val2 + DatePart("h", Now)) * 60
        val2 = (val2 + DatePart("n", Now)) * 60
        val2 = (val2 + DatePart("s", Now))
        'st2 = st2 + JobsDesc(que).Submitted.wMilliseconds 'st2 = time
        sql = "INSERT INTO log_user (username,timeactivity,activity) VALUES ('" & val1 & "','" & val2 & "','" & "insert card" & "')"
        Conn.Execute sql
        sql = "update  check_card set timecard = '" & val2 & "' where username = '" & user_card & "'"
        Conn.Execute sql
        Out &H378, &H0 'opendoor เปิดประตู
        delay (read_every)
        MSComm1.Output = ":221" & Chr$(13)
        delay (read_every)
        MSComm1.Output = ":221" & Chr$(13)
        delay (read_every)
        MSComm1.Output = ":221" & Chr$(13)
        delay (read_every)
        MSComm1.Output = ":221" & Chr$(13)
        delay (read_every)
        MSComm1.Output = ":221" & Chr$(13)
        Out &H378, &HFF 'closedoor ปิดประตู
    End If
    rs.Close
    Conn.Close
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

'**********for run in server****************
'Private Sub update_lock()
'Dim Conn As ADODB.Connection
'Dim rs As ADODB.Recordset
'Dim sql As String
'Dim st1 As String
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
'    st1 = (DatePart("yyyy", Now) Mod 100) * 12 ' time and date in second
'    st1 = (st1 + DatePart("m", Now)) * 31
'    st1 = (st1 + DatePart("d", Now)) * 24
'    st1 = (st1 + DatePart("h", Now)) * 60
'    st1 = (st1 + DatePart("n", Now)) * 60
'    st1 = (st1 + DatePart("s", Now))
'    sql = "select username from check_card where timecard <  " & st1
'    rs.Open sql, Conn, , , adCmdText
'    rs.MoveFirst
'    Do While Not rs.EOF
'        rs.MoveNext
'    Loop
'    rs.Close
'    Conn.Close
'End Sub

