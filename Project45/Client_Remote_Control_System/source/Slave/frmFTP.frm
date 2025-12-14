VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmFTP 
   Caption         =   "Server"
   ClientHeight    =   2955
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   2415
   LinkTopic       =   "Form1"
   ScaleHeight     =   2955
   ScaleWidth      =   2415
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.Frame Frame1 
      Caption         =   "Save files to"
      Height          =   2415
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   2415
      Begin VB.DirListBox Dir1 
         Height          =   1665
         Left            =   120
         TabIndex        =   3
         Top             =   600
         Width           =   2175
      End
      Begin VB.DriveListBox Drive1 
         Height          =   315
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   2175
      End
   End
   Begin VB.CommandButton cmdRun 
      Caption         =   "Run"
      Default         =   -1  'True
      Height          =   375
      Left            =   720
      TabIndex        =   0
      Top             =   2520
      Width           =   975
   End
   Begin MSWinsockLib.Winsock wsTCP 
      Index           =   0
      Left            =   240
      Top             =   2520
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "frmFTP"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'==============================================
'Written by Igor Ostrovsky (igor@ostrosoft.com)
'Visual Basic 911 (http://www.ostrosoft.com/vb)
'==============================================
Option Explicit

Dim lPos As Long
Dim bOK As Boolean
Dim fname As String

Public Sub cmdRun_Click()
    Dir1.Path = App.Path & "\Files\"
    If cmdRun.Caption = "Run" Then
        cmdRun.Caption = "Stop"
        wsTCP(0).LocalPort = 1111
        wsTCP(0).Listen
    Else
        wsTCP(0).Close
        cmdRun.Caption = "Run"
    End If
End Sub

Public Sub Drive1_Change()
    Dir1.Path = Drive1.Drive & "\"
End Sub

Public Sub Form_Activate()
    frmFTP.Visible = False
    'Dir1.Path = App.Path & "\Files\"
    'fname = App.Path & "\Files\"
    'MsgBox fname
    cmdRun.Caption = "Stop"
    Call cmdRun_Click
    cmdRun.Caption = "Run"
    Call cmdRun_Click
End Sub

Public Sub Form_Load()
    'frmFTP.Visible = False
    'fname = App.Path & "\Files"
    'Call cmdRun_Click
End Sub

Public Sub wsTCP_Close(Index As Integer)
  Close #1
  Unload wsTCP(1)
  bOK = False
End Sub

Public Sub wsTCP_ConnectionRequest(Index As Integer, ByVal requestID As Long)
  Load wsTCP(1)
  wsTCP(1).Accept requestID
End Sub

Public Sub wsTCP_DataArrival(Index As Integer, ByVal bytesTotal As Long)
  If Not bOK Then
    wsTCP(1).GetData fname
    If InStr(fname, vbCrLf) <> 0 Then fname = Left(fname, InStr(fname, vbCrLf) - 1)
    bOK = True
    If Dir(Dir1.Path & "\" & fname) <> "" Then Kill Dir1.Path & "\" & fname
    Open Dir1.Path & "\" & fname For Binary As 1
    lPos = 1
    wsTCP(1).SendData "OK" & vbCrLf
  Else
    Dim buffer() As Byte
    wsTCP(1).GetData buffer
    Put #1, lPos, buffer
    lPos = lPos + UBound(buffer) + 1
  End If
End Sub
