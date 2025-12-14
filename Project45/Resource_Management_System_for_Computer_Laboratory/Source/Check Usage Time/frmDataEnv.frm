VERSION 5.00
Begin VB.Form frmDataEnv 
   BackColor       =   &H00FFC0C0&
   Caption         =   "Set ค่าเวลาในการเล่นคอมพิวเตอร์"
   ClientHeight    =   2385
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3870
   Icon            =   "frmDataEnv.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   2385
   ScaleWidth      =   3870
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   1560
      TabIndex        =   4
      Top             =   1080
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "set times"
      Height          =   375
      Left            =   360
      MaskColor       =   &H8000000A&
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   1080
      UseMaskColor    =   -1  'True
      Width           =   975
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H00C0C0C0&
      Caption         =   "เริ่มการทำงาน"
      Height          =   375
      Left            =   240
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   1800
      Width           =   3375
   End
   Begin VB.OptionButton Option2 
      BackColor       =   &H00EFF5F5&
      Caption         =   "unlimit hours"
      Height          =   375
      Left            =   2280
      TabIndex        =   1
      Top             =   240
      Width           =   1215
   End
   Begin VB.OptionButton Option1 
      BackColor       =   &H00EFF5F5&
      Caption         =   "limited hours"
      Height          =   375
      Left            =   360
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
   Begin VB.Shape Shape3 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Height          =   2370
      Left            =   15
      Top             =   15
      Width           =   3855
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "min"
      Height          =   255
      Left            =   3000
      TabIndex        =   5
      Top             =   1200
      Width           =   495
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00EFF5F5&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00FE6984&
      BorderWidth     =   3
      Height          =   615
      Left            =   240
      Top             =   135
      Width           =   3375
   End
   Begin VB.Shape Shape2 
      BackColor       =   &H00EFF5F5&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00FE6984&
      BorderWidth     =   3
      Height          =   855
      Left            =   240
      Top             =   825
      Width           =   3375
   End
End
Attribute VB_Name = "frmDataEnv"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' server scripts
Option Explicit
Dim time_check As Long
Private Const logoff = 0
Private Const flogoff = 4

Private Sub Command1_Click()
    On Error GoTo line1
    time_check = Text1.Text
    GoTo line2
line1:
    Text1.Text = "3"
    time_check = Text1.Text
line2:
    Command1.Enabled = False
End Sub

Private Sub Command2_Click()
     Do While Option1.Value
        testcheck_time
        delay (60)
    Loop
End Sub

Private Sub Form_Load()
    Option1.Value = True
    Text1.Text = "3"
     time_check = Text1.Text
     'logoff_user ("")
     'Call Shell(str, 1)
     'Call Shell("net send " & str & "warning", 1)
     'Call Shell("net send jullakarn aaa", 1)
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

Private Sub Option1_Click()
    Text1.Enabled = True
    Text1.Text = "3"
    Text1.BackColor = &H80000005
    Command1.Enabled = True
End Sub

Private Sub Option2_Click()
    Text1.Enabled = False
    Text1.Text = ""
    Text1.BackColor = &H80000000
    Command1.Enabled = False
End Sub

Private Sub Text1_Change()
    Command1.Enabled = True
End Sub

Private Function delay(DelayTime)
Dim LoopTime As Long
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

Private Sub logoff_user(computername)
Dim opsys As Object
Dim opsysset As Object
On Error Resume Next
    Set opsysset = GetObject("winmgmts:{(Debug,RemoteShutdown)}//" & computername & "/root/cimv2").ExecQuery("Select * from Win32_OperatingSystem where Primary=true")
    For Each opsys In opsysset
        opsys.Win32Shutdown (logoff)
        'opsys.Win32Shutdown (flogoff)
    Next
End Sub
Private Sub testcheck_time()
Dim Conn As ADODB.Connection
Dim rs As ADODB.Recordset
Dim rs1 As ADODB.Recordset
Dim sql As String
Dim netstr As String
Dim val2 As String
Dim val1 As String
    Set Conn = New ADODB.Connection
    Set rs = New ADODB.Recordset
    Set rs1 = New ADODB.Recordset
    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
    val2 = (DatePart("yyyy", Now) Mod 100) * 12 ' time and date in second
    val2 = (val2 + DatePart("m", Now)) * 31
    val2 = (val2 + DatePart("d", Now)) * 24
    val2 = (val2 + DatePart("h", Now)) * 60
    val2 = (val2 + DatePart("n", Now)) * 60
    val2 = (val2 + DatePart("s", Now))
    val2 = val2 - (time_check * 60) ' time logoff
    val1 = val2 + 60 ' time warning (before logoff 10 min)
    sql = "select * from check_card where logon_logoff = 1"
    rs.Open sql, Conn, , , adCmdText
    If Not (rs.EOF And rs.BOF) Then
        rs.MoveFirst
        Do While Not (rs.EOF)
            sql = "select max(comp_name),max(times) from comuses where username = '" & rs("username") & "'"
            rs1.Open sql, Conn, , , adCmdText
            If Not (rs1.EOF And rs1.BOF) Then
                If rs1.Fields(1).Value >= val2 And rs1.Fields(1).Value <= val1 Then
                    netstr = "net send " & rs1.Fields(0).Value & " warning"
                    Call Shell(netstr, 1)
                ElseIf rs1.Fields(1).Value <= val2 Then
                    logoff_user (rs1.Fields(0).Value)
                End If
            End If
            rs1.Close
            rs.MoveNext
        Loop
    End If
    rs.Close
    Conn.Close
End Sub



'Private Sub check_time()
'Dim Conn As ADODB.Connection
'Dim rs As ADODB.Recordset
'Dim sql As String
'Dim val2 As String
'Dim val1 As String
'    Set Conn = New ADODB.Connection
'    Set rs = New ADODB.Recordset
'    Conn.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=db_access;Data Source=coolsharks"
'    val2 = (DatePart("yyyy", Now) Mod 100) * 12 ' time and date in second
'    val2 = (val2 + DatePart("m", Now)) * 31
'    val2 = (val2 + DatePart("d", Now)) * 24
'    val2 = (val2 + DatePart("h", Now)) * 60
'    val2 = (val2 + DatePart("n", Now)) * 60
'    val2 = (val2 + DatePart("s", Now))
'    val2 = val2 - (time_check * 60) ' time logoff
'    Debug.Print "now  " & val2
'    val1 = val2 + 600 ' time warning (before logoff 10 min)
'    sql = "select *  from comuses,check_card where times >= '" & val2 & "' and times <= '" & val1 & "' and comuses.logon_logoff = 1 and check_card.logon_logoff = 1 and check_card.username = comuses.username"
'    rs.Open sql, Conn, , , adCmdText
'    If Not (rs.EOF And rs.BOF) Then
'        rs.MoveFirst
'        Do While Not (rs.EOF)
'        Call Shell("net send 161.246.6.49 aaa", 1) 'warning to user 'warning to user
'            rs.MoveNext
'        Loop
'    End If
'    rs.Close
'    sql = "select *  from comuses,check_card where times <= '" & val2 & "' and comuses.logon_logoff = 1 and check_card.logon_logoff = 1 and check_card.username = comuses.username"
'    'sql="select username from comuses where times = (select max(times) from comuses where  comp_name = '" & objnet.ComputerName & "')"
'    rs.Open sql, Conn, , , adCmdText
'    If Not (rs.EOF And rs.BOF) Then
'        rs.MoveFirst
'        Do While Not (rs.EOF)
'            Debug.Print "logon" & rs("times")
'            Debug.Print "warn" & val1
'            Debug.Print "logoff" & val2
'            logoff_user (rs("comp_name"))
'            rs.MoveNext
'        Loop
'    End If
'    rs.Close
'    Conn.Close
'End Sub
