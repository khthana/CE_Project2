VERSION 5.00
Begin VB.Form frmIntegrator 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Virtual Room"
   ClientHeight    =   6210
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9585
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   9.75
      Charset         =   222
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   HelpContextID   =   1
   Icon            =   "frmIntegrator.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6210
   ScaleWidth      =   9585
   StartUpPosition =   2  'CenterScreen
   Begin VB.Label lblLink 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "Event Log"
      DragIcon        =   "frmIntegrator.frx":362A
      Height          =   240
      Index           =   5
      Left            =   4080
      TabIndex        =   14
      Top             =   3240
      Width           =   1050
   End
   Begin VB.Image imgEventLog 
      Height          =   480
      Left            =   3360
      MouseIcon       =   "frmIntegrator.frx":3934
      MousePointer    =   99  'Custom
      Picture         =   "frmIntegrator.frx":3C3E
      ToolTipText     =   "Event Log"
      Top             =   3120
      Width           =   480
   End
   Begin VB.Label lblCaption 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "HELP"
      ForeColor       =   &H80000001&
      Height          =   240
      Index           =   4
      Left            =   300
      TabIndex        =   13
      Top             =   5640
      Width           =   600
   End
   Begin VB.Label lblLink 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "Help"
      DragIcon        =   "frmIntegrator.frx":4080
      Height          =   240
      Index           =   9
      Left            =   4080
      TabIndex        =   12
      Top             =   5640
      Width           =   510
   End
   Begin VB.Image imgHelp 
      Height          =   480
      Left            =   3360
      MouseIcon       =   "frmIntegrator.frx":438A
      MousePointer    =   99  'Custom
      Picture         =   "frmIntegrator.frx":4694
      ToolTipText     =   "Help"
      Top             =   5520
      Width           =   480
   End
   Begin VB.Image imgGenRpt 
      Height          =   480
      Left            =   3360
      MouseIcon       =   "frmIntegrator.frx":4AD6
      MousePointer    =   99  'Custom
      Picture         =   "frmIntegrator.frx":4DE0
      ToolTipText     =   "Report Generator"
      Top             =   3720
      Width           =   480
   End
   Begin VB.Image imgWeb 
      Height          =   480
      Left            =   3360
      MouseIcon       =   "frmIntegrator.frx":5222
      MousePointer    =   99  'Custom
      Picture         =   "frmIntegrator.frx":552C
      ToolTipText     =   "On The Web"
      Top             =   4920
      Width           =   480
   End
   Begin VB.Image imgViewRpt 
      Height          =   480
      Left            =   3360
      MouseIcon       =   "frmIntegrator.frx":596E
      MousePointer    =   99  'Custom
      Picture         =   "frmIntegrator.frx":5C78
      ToolTipText     =   "View Report"
      Top             =   4320
      Width           =   480
   End
   Begin VB.Label lblLink 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "On The Web"
      DragIcon        =   "frmIntegrator.frx":60BA
      Height          =   240
      Index           =   8
      Left            =   4080
      TabIndex        =   11
      Top             =   5040
      Width           =   1305
   End
   Begin VB.Label lblLink 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "View Report"
      DragIcon        =   "frmIntegrator.frx":63C4
      Height          =   240
      Index           =   7
      Left            =   4080
      TabIndex        =   10
      Top             =   4440
      Width           =   1275
   End
   Begin VB.Label lblLink 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "Report Generator"
      DragIcon        =   "frmIntegrator.frx":66CE
      Height          =   240
      Index           =   6
      Left            =   4080
      TabIndex        =   9
      Top             =   3840
      Width           =   1815
   End
   Begin VB.Label lblLink 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "Printer Spool Monitor"
      DragIcon        =   "frmIntegrator.frx":69D8
      Height          =   240
      Index           =   4
      Left            =   4080
      TabIndex        =   8
      Top             =   2640
      Width           =   2190
   End
   Begin VB.Image imgPrinter 
      Height          =   480
      Left            =   3360
      MouseIcon       =   "frmIntegrator.frx":6CE2
      MousePointer    =   99  'Custom
      Picture         =   "frmIntegrator.frx":6FEC
      ToolTipText     =   "Printer Spool Monitor"
      Top             =   2520
      Width           =   480
   End
   Begin VB.Label lblLink 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "Server Agent"
      DragIcon        =   "frmIntegrator.frx":978E
      Height          =   240
      Index           =   3
      Left            =   4080
      TabIndex        =   7
      Top             =   2040
      Width           =   1365
   End
   Begin VB.Image imgAgent 
      Height          =   480
      Left            =   3360
      MouseIcon       =   "frmIntegrator.frx":9A98
      MousePointer    =   99  'Custom
      Picture         =   "frmIntegrator.frx":9DA2
      ToolTipText     =   "Server Agent"
      Top             =   1920
      Width           =   480
   End
   Begin VB.Label lblLink 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "Ping Monitor"
      DragIcon        =   "frmIntegrator.frx":A1E4
      Height          =   240
      Index           =   2
      Left            =   4080
      TabIndex        =   6
      Top             =   1440
      Width           =   1305
   End
   Begin VB.Image imgPing 
      Height          =   480
      Left            =   3360
      MouseIcon       =   "frmIntegrator.frx":A4EE
      MousePointer    =   99  'Custom
      Picture         =   "frmIntegrator.frx":A7F8
      ToolTipText     =   "Ping Computers"
      Top             =   1320
      Width           =   480
   End
   Begin VB.Label lblLink 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "Broadcast Message"
      DragIcon        =   "frmIntegrator.frx":AC3A
      Height          =   240
      Index           =   1
      Left            =   4080
      TabIndex        =   5
      Top             =   840
      Width           =   2100
   End
   Begin VB.Image imgMessage 
      Height          =   480
      Left            =   3360
      MouseIcon       =   "frmIntegrator.frx":AF44
      MousePointer    =   99  'Custom
      Picture         =   "frmIntegrator.frx":B24E
      ToolTipText     =   "Broadcase Messages"
      Top             =   720
      Width           =   480
   End
   Begin VB.Label lblLink 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "Virtual Room Editor"
      DragIcon        =   "frmIntegrator.frx":B690
      Height          =   240
      Index           =   0
      Left            =   4080
      TabIndex        =   4
      Top             =   240
      Width           =   2025
   End
   Begin VB.Image imgEditor 
      Height          =   480
      Left            =   3360
      MouseIcon       =   "frmIntegrator.frx":B99A
      MousePointer    =   99  'Custom
      Picture         =   "frmIntegrator.frx":BCA4
      ToolTipText     =   "Virtual Room Editor"
      Top             =   120
      Width           =   480
   End
   Begin VB.Image imgVRoom 
      Height          =   900
      Left            =   5280
      Picture         =   "frmIntegrator.frx":C75E
      Top             =   5280
      Width           =   4290
   End
   Begin VB.Label lblCaption 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "WEB"
      ForeColor       =   &H80000001&
      Height          =   240
      Index           =   3
      Left            =   300
      TabIndex        =   3
      Top             =   5040
      Width           =   525
   End
   Begin VB.Label lblCaption 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "REPORT"
      ForeColor       =   &H80000001&
      Height          =   240
      Index           =   2
      Left            =   300
      TabIndex        =   2
      Top             =   3840
      Width           =   960
   End
   Begin VB.Label lblCaption 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "MAINTENANCE"
      ForeColor       =   &H80000001&
      Height          =   240
      Index           =   1
      Left            =   300
      TabIndex        =   1
      Top             =   840
      Width           =   1650
   End
   Begin VB.Label lblCaption 
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "CREATE"
      ForeColor       =   &H80000001&
      Height          =   240
      Index           =   0
      Left            =   300
      TabIndex        =   0
      Top             =   240
      Width           =   930
   End
End
Attribute VB_Name = "frmIntegrator"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function WinHelp Lib "user32" Alias "WinHelpA" (ByVal hwnd As Long, ByVal lpHelpFile As String, ByVal wCommand As Long, ByVal dwData As Long) As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function GetModuleUsage Lib "kernel32" (ByVal hModule As Integer) As Integer

Private Const SW_HIDE = 0 '// Normal Window
Private Const SW_NORMAL = 1 '// Maximized Window
Private Const SW_MAXIMIZE = 3 '// Minimized Window
Private Const SW_MINIMIZE = 6 '// Hidden Window

Private lngInst As Long

Const VREditorPrg = "\VREditor\VREditor.exe"
Const BroadcastPrg = "\Broadcast\Broadcast.exe"
Const PingPrg = "\Ping\Ping.exe"
Const ServerAgentPrg = "\Agent\Server\Server_Agent.exe"
Const SpoolPrg = "\Spool\prjPrintSpoolTest.exe"
Const EventLogPrg = "\EventLog\EventLog.exe"
Const GenReportPrg = "\GenReport\GenRpt.exe"
Const ViewReportPrg = "\Report\Report.exe"
Const VRoomURL = "http://161.246.6.65/index.asp"
Const HelpFile = "\VirtualRoom.hlp"
Private HelpFilePath As String

Private Sub Form_Load()
If App.PrevInstance = True Then
End
End If
HelpFilePath = App.Path & HelpFile
App.HelpFile = HelpFilePath
End Sub

Private Sub imgEditor_Click()
Dim VREditorPath As String
On Error GoTo EditorErr
Screen.MousePointer = vbHourglass
VREditorPath = App.Path & VREditorPrg
lngInst = Shell(VREditorPath, SW_NORMAL)
Screen.MousePointer = vbNormal
Exit Sub
EditorErr:
    Screen.MousePointer = vbNormal
    MsgBox Error(Err.Number), vbCritical + vbOKOnly
End Sub

Private Sub imgEventLog_Click()
Dim EventLogPath As String
On Error GoTo EventLogErr
Screen.MousePointer = vbHourglass
EventLogPath = App.Path & EventLogPrg
lngInst = Shell(EventLogPath, SW_NORMAL)
Screen.MousePointer = vbNormal
Exit Sub
EventLogErr:
    Screen.MousePointer = vbNormal
    MsgBox Error(Err.Number), vbCritical + vbOKOnly
End Sub

Private Sub imgHelp_Click()
On Error GoTo HelpErr
Screen.MousePointer = vbHourglass
lngInst = WinHelp(frmIntegrator.hwnd, HelpFilePath, &H1, CLng(frmIntegrator.HelpContextID))
Screen.MousePointer = vbNormal
Exit Sub
HelpErr:
    Screen.MousePointer = vbNormal
    MsgBox Error(Err.Number), vbCritical + vbOKOnly
End Sub

Private Sub imgMessage_Click()
Dim BroadcastPath As String
On Error GoTo MessageErr
Screen.MousePointer = vbHourglass
BroadcastPath = App.Path & BroadcastPrg
lngInst = Shell(BroadcastPath, SW_NORMAL)
Screen.MousePointer = vbNormal
Exit Sub
MessageErr:
    Screen.MousePointer = vbNormal
    MsgBox Error(Err.Number), vbCritical + vbOKOnly
End Sub

Private Sub imgPing_Click()
Dim PingPath As String
On Error GoTo PingErr
Screen.MousePointer = vbHourglass
PingPath = App.Path & PingPrg
lngInst = Shell(PingPath, SW_NORMAL)
Screen.MousePointer = vbNormal
Exit Sub
PingErr:
    Screen.MousePointer = vbNormal
    MsgBox Error(Err.Number), vbCritical + vbOKOnly
End Sub

Private Sub imgAgent_Click()
Dim ServerAgentPath As String
On Error GoTo AgentErr
Screen.MousePointer = vbHourglass
ServerAgentPath = App.Path & ServerAgentPrg
lngInst = Shell(ServerAgentPath, SW_NORMAL)
Screen.MousePointer = vbNormal
Exit Sub
AgentErr:
    Screen.MousePointer = vbNormal
    MsgBox Error(Err.Number), vbCritical + vbOKOnly
End Sub

Private Sub imgPrinter_Click()
Dim SpoolPath As String
On Error GoTo PrinterErr
Screen.MousePointer = vbHourglass
SpoolPath = App.Path & SpoolPrg
lngInst = Shell(SpoolPath, SW_NORMAL)
Screen.MousePointer = vbNormal
Exit Sub
PrinterErr:
    Screen.MousePointer = vbNormal
    MsgBox Error(Err.Number), vbCritical + vbOKOnly
End Sub

Private Sub imgGenRpt_Click()
Dim GenReportPath As String
On Error GoTo GenRptErr
Screen.MousePointer = vbHourglass
GenReportPath = App.Path & GenReportPrg
lngInst = Shell(GenReportPath, SW_NORMAL)
Screen.MousePointer = vbNormal
Exit Sub
GenRptErr:
    Screen.MousePointer = vbNormal
    MsgBox Error(Err.Number), vbCritical + vbOKOnly
End Sub

Private Sub imgViewRpt_Click()
Dim ViewReportPath As String
On Error GoTo ViewReportErr
Screen.MousePointer = vbHourglass
ViewReportPath = App.Path & ViewReportPrg
lngInst = Shell(ViewReportPath, SW_NORMAL)
Screen.MousePointer = vbNormal
Exit Sub
ViewReportErr:
    Screen.MousePointer = vbNormal
    MsgBox Error(Err.Number), vbCritical + vbOKOnly
End Sub

Private Sub imgWeb_Click()
On Error GoTo WebErr
Screen.MousePointer = vbHourglass
Call ShellExecute(0&, vbNullString, VRoomURL, vbNullString, vbNullString, vbNormalFocus)
Screen.MousePointer = vbNormal
Exit Sub
WebErr:
    Screen.MousePointer = vbNormal
    MsgBox Error(Err.Number), vbCritical + vbOKOnly
End Sub

Private Sub lblLink_DragDrop(Index As Integer, Source As Control, X As Single, Y As Single)
On Error GoTo LinkErr
If Source Is lblLink(Index) Then
        With lblLink(Index)
            .Font.Underline = False
            .ForeColor = vbBlack
            Screen.MousePointer = vbHourglass
            Select Case Index
            Case 0
                Call imgEditor_Click
            Case 1
                Call imgMessage_Click
            Case 2
                Call imgPing_Click
            Case 3
                Call imgAgent_Click
            Case 4
                Call imgPrinter_Click
            Case 5
                Call imgEventLog_Click
            Case 6
                Call imgGenRpt_Click
            Case 7
                Call imgViewRpt_Click
            Case 8
                Call imgWeb_Click
            Case 9
                Call imgHelp_Click
            End Select
            Screen.MousePointer = vbNormal
        End With
    End If
    Exit Sub
LinkErr:
    Screen.MousePointer = vbNormal
    MsgBox Error(Err.Number), vbCritical + vbOKOnly
End Sub

Private Sub lblLink_DragOver(Index As Integer, Source As Control, X As Single, Y As Single, State As Integer)
 If State = vbLeave Then
        With lblLink(Index)
            .Drag vbEndDrag
            .Font.Underline = False
            .ForeColor = vbBlack
        End With
    End If
End Sub

Private Sub lblLink_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
With lblLink(Index)
        .ForeColor = vbBlue
        .Font.Underline = True
        .Drag vbBeginDrag
    End With
End Sub
