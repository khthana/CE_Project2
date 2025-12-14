VERSION 5.00
Begin VB.Form UserLogin 
   BorderStyle     =   0  'None
   Caption         =   "Login"
   ClientHeight    =   4500
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7485
   ControlBox      =   0   'False
   Icon            =   "UserLogin.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   Picture         =   "UserLogin.frx":0442
   ScaleHeight     =   4500
   ScaleWidth      =   7485
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   315
      Left            =   4440
      TabIndex        =   3
      Top             =   2580
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   315
      Left            =   4440
      TabIndex        =   2
      Top             =   2220
      Width           =   1095
   End
   Begin VB.TextBox Text2 
      ForeColor       =   &H00C00000&
      Height          =   315
      IMEMode         =   3  'DISABLE
      Left            =   2280
      MaxLength       =   10
      PasswordChar    =   "o"
      TabIndex        =   1
      Text            =   "Text2"
      Top             =   2580
      Width           =   1935
   End
   Begin VB.TextBox Text1 
      ForeColor       =   &H00C00000&
      Height          =   315
      Left            =   2280
      MaxLength       =   10
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   2220
      Width           =   1935
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Label1"
      ForeColor       =   &H00808080&
      Height          =   255
      Index           =   2
      Left            =   330
      TabIndex        =   6
      Top             =   1600
      Width           =   4575
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Password :"
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   1
      Left            =   1080
      TabIndex        =   5
      Top             =   2640
      Width           =   1095
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "User Name :"
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   0
      Left            =   1080
      TabIndex        =   4
      Top             =   2280
      Width           =   1095
   End
End
Attribute VB_Name = "UserLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim xCmd As New ADODB.Command
Dim xRs As New ADODB.Recordset
Dim xPr(0) As Variant
Dim zCmd As New ADODB.Command
Dim zRs As New ADODB.Recordset
Dim zPr(1) As Variant

GblConnStr = "DSN=" + gblDSN + ";user id=" + Trim(Text1.Text) + ";pwd=" + Trim(Text2.Text)
CurUser = ""
CurSes = ""
CurWst = ""
gblUser = ""
gblPassword = ""

On Error GoTo ErrHandler

sConn.Open GblConnStr

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_get_server_info"

Set tRs = tCmd.Execute

If tRs.EOF = False Then
    MainMDI.StatusBar2.Panels(5).Text = "Connecting to " + Trim(tRs("ServerName")) + " v " + Format(tRs("AppVersionMajor"), "0") + "." + Format(tRs("AppVersionMinor"), "0") + "." + Format(tRs("AppVersionRevision"), "0")
    CurDyr = CFC(tRs("CurDataYear"))
    MainMDI.StatusBar2.Panels(3).Text = tRs("CurDataYear")
Else
    MsgBox "Server Info not found...", vbCritical + vbOKOnly
    Exit Sub
End If

Set xCmd.ActiveConnection = sConn

xCmd.CommandType = adCmdStoredProc
xCmd.CommandText = "app_get_user_info"
xPr(0) = Trim(Text1.Text)

Set xRs = xCmd.Execute(, xPr)

If xRs.EOF = False Then

    'Effective & Expire Date Check
    If xRs("EffectiveDate") > Now Or xRs("ExpireDate") < Now Then
        MsgBox "Your account is not effective or expired...", vbCritical + vbOKOnly
        FailLogin
        Exit Sub
    End If

    'Enable Check
    If xRs("Enabled") = False Then
        MsgBox "Your account is disabled...", vbCritical + vbOKOnly
        FailLogin
        Exit Sub
    End If

    'Refresh User Name on MDI Form
    MainMDI.StatusBar2.Panels(4).Text = Trim(xRs("UserName"))
    CurUser = xRs("UserID")

Else
    MsgBox "User Info not found...", vbCritical + vbOKOnly
    sConn.Close
    FailLogin
    Exit Sub
End If

Open App.Path + "\ProPIS.cfg" For Input As #1
Input #1, CurWst
Close #1

Set zCmd.ActiveConnection = sConn

zCmd.CommandType = adCmdStoredProc
zCmd.CommandText = "app_user_session_register"

zPr(0) = Text1.Text
zPr(1) = CurWst

Set zRs = zCmd.Execute(, zPr)

If zRs.EOF = False Then
    CurSes = zRs("sesID")
Else
    CurSes = ""
End If

Set tCmd = Nothing
Set tRs = Nothing
Set xCmd = Nothing
Set xRs = Nothing

MainMDI.mSysSetup.Enabled = True
MainMDI.mChangeCompany.Enabled = True
MainMDI.mUserInfo.Enabled = True

MainMDI.RefreshMenuAccess

MainMDI.Timer1.Enabled = True

gblUser = Text1.Text
gblPassword = Text2.Text

Unload UserLogin
Load UserInfo
UserInfo.Show

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly
Text1.Text = ""
Text2.Text = ""
Text1.SetFocus
MainMDI.Timer1.Enabled = False

If sConn.State = adStateOpen Then
    sConn.Close
    Set sConn = Nothing
End If

End Sub

Sub FailLogin()

GblConnStr = ""
MainMDI.StatusBar2.Panels(5).Text = ""
MainMDI.StatusBar2.Panels(4).Text = ""
MainMDI.Timer1.Enabled = False
DefYear = ""
CurUser = ""
CurSes = ""
CurWst = ""
gblUser = ""
gblPassword = ""

MainMDI.RefreshMenuAccess

If sConn.State = adStateOpen Then sConn.Close

End Sub

Private Sub Form_Load()

Label1(2).Caption = "Version " + Format(App.Major, "0") + "." + Format(App.Minor, "00") + " build " + Format(App.Revision, "0")
   
Text1.Text = ""
Text2.Text = ""
   
MainMDI.mSysSetup.Enabled = False
MainMDI.mChangeCompany.Enabled = False
MainMDI.mChangeYear.Enabled = False
MainMDI.mUserInfo.Enabled = False
MainMDI.mHRM.Enabled = False
MainMDI.mPR.Enabled = False
MainMDI.mTA.Enabled = False
MainMDI.mRpt.Enabled = False
    
Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2
    
End Sub

Private Sub Text1_KeyPress(KeyAscii As Integer)

If KeyAscii = 13 Then Text2.SetFocus
 
End Sub

Private Sub Text2_KeyPress(KeyAscii As Integer)

If KeyAscii = 13 Then Command1_Click

End Sub
