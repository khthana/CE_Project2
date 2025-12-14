VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmSetting 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Setting Configuration"
   ClientHeight    =   6075
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7005
   Icon            =   "frmSetting.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6075
   ScaleWidth      =   7005
   Begin VB.CommandButton cmdTestConnect 
      Caption         =   "Test Connection"
      Height          =   495
      Left            =   2160
      TabIndex        =   14
      Top             =   5400
      Width           =   1455
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   495
      Left            =   3960
      TabIndex        =   10
      Top             =   5400
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   5520
      TabIndex        =   9
      Top             =   5400
      Width           =   1335
   End
   Begin VB.Frame Frame2 
      Caption         =   "Buyer"
      Height          =   3015
      Left            =   0
      TabIndex        =   5
      Top             =   2040
      Width           =   6975
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   1000
         Left            =   6360
         Top             =   1800
      End
      Begin MSWinsockLib.Winsock Winsock1 
         Left            =   6360
         Top             =   2520
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin VB.TextBox txtHostPort 
         Height          =   375
         Left            =   2760
         TabIndex        =   8
         Top             =   2040
         Width           =   1695
      End
      Begin VB.Label lblLocalIP 
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Left            =   2760
         TabIndex        =   13
         Top             =   1320
         Width           =   2535
      End
      Begin VB.Label lblHostname 
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Left            =   2760
         TabIndex        =   12
         Top             =   600
         Width           =   2535
      End
      Begin VB.Label Label5 
         Caption         =   "Local Host Name"
         Height          =   255
         Left            =   480
         TabIndex        =   11
         Top             =   600
         Width           =   1455
      End
      Begin VB.Label Label4 
         Caption         =   "Local Host Port"
         Height          =   255
         Left            =   480
         TabIndex        =   7
         Top             =   2040
         Width           =   1215
      End
      Begin VB.Label Label3 
         Caption         =   "Local IP Address"
         Height          =   375
         Left            =   480
         TabIndex        =   6
         Top             =   1320
         Width           =   1935
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Marketplace"
      Height          =   1935
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6975
      Begin VB.TextBox txtServerPort 
         Height          =   375
         Left            =   2760
         TabIndex        =   4
         Top             =   1200
         Width           =   1455
      End
      Begin VB.TextBox txtServerIP 
         Height          =   375
         Left            =   2760
         TabIndex        =   2
         Top             =   480
         Width           =   2775
      End
      Begin VB.Label Label2 
         Caption         =   "Server Port"
         Height          =   375
         Left            =   480
         TabIndex        =   3
         Top             =   1200
         Width           =   2055
      End
      Begin VB.Label Label1 
         Caption         =   "Server Name / IP Address"
         Height          =   255
         Left            =   480
         TabIndex        =   1
         Top             =   480
         Width           =   2055
      End
   End
End
Attribute VB_Name = "frmSetting"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim timeCount As Integer

Private Sub cmdCancel_Click()
        Unload Me
End Sub

Private Sub cmdOK_Click()
        If txtServerIP.Text = "" Then
                MsgBox "Please Insert Server Name Or Server IP Address Before Click OK", vbExclamation + vbOKOnly, "Warning"
        ElseIf txtServerPort.Text = "" Then
                MsgBox "Please Insert Server Port  Before Click OK", vbExclamation + vbOKOnly, "Warning"
        ElseIf txtHostPort.Text = "" Then
                MsgBox "Please Insert Local Port  Before Click OK", vbExclamation + vbOKOnly, "Warning"
        Else
                RemoteIP = txtServerIP.Text
                RemotePort = txtServerPort.Text
                LocalPort = txtHostPort.Text
                LocalName = lblHostname.Caption
                LocalIP = lblLocalIP.Caption
                Unload Me
        End If
End Sub

Private Sub cmdTestConnect_Click()
        If txtServerIP.Text = "" Then
                MsgBox "Please Insert Server Name Or Server IP Address Before Test Connection", vbExclamation + vbOKOnly, "Warning"
        ElseIf txtServerPort.Text = "" Then
                MsgBox "Please Insert Port  Before Test Connection", vbExclamation + vbOKOnly, "Warning"
        ElseIf txtHostPort.Text = "" Then
                MsgBox "Please Insert Local Port  Before Test Connection", vbExclamation + vbOKOnly, "Warning"
        Else
                cmdTestConnect.Enabled = False
                On Error GoTo msgerr
                If Winsock1.State <> sckClosed Then Winsock1.Close
                Winsock1.Connect txtServerIP.Text, txtServerPort.Text
                timeCount = 0
                Timer1.Enabled = True
                'MsgBox "Test Connection Success"
                cmdTestConnect.Enabled = True
        End If
Exit Sub
msgerr:
        MsgBox Error$ & vbCrLf & "Test Connection Not Success", vbCritical + vbOKOnly, "Error !!!"
        cmdTestConnect.Enabled = True
End Sub


Private Sub Form_Load()
        txtServerIP.Text = RemoteIP
        txtServerPort.Text = RemotePort
        txtHostPort.Text = LocalPort
        lblHostname.Caption = Winsock1.LocalHostName
        lblLocalIP.Caption = Winsock1.LocalIP
        txtServerIP.SelStart = 0
        txtServerIP.SelLength = Len(txtServerIP.Text)
End Sub

Private Sub Form_Unload(Cancel As Integer)
                Winsock1.Close
End Sub

Private Sub Timer1_Timer()
        If timeCount < 5 Then
                timeCount = timeCount + 1
        Else
                Timer1.Enabled = False
                Winsock1.Close
                MsgBox "Test Connection Not Success", vbExclamation + vbOKOnly
        End If
End Sub

Private Sub Winsock1_Connect()
                Winsock1.SendData strTestCon
End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
       Dim strNew As String
        Winsock1.GetData strNew, vbString
        If strNew = strTestCon Then
                MsgBox "Test Connection Successful"
                Timer1.Enabled = False
                Winsock1.Close
        End If
End Sub

Private Sub Winsock1_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
        MsgBox Description, vbCritical + vbOKOnly, "Winsock Error"
End Sub

Private Sub Winsock1_SendComplete()
       ' Winsock1.Close
End Sub
