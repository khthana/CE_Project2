VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmSetting 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Setting Configuration"
   ClientHeight    =   3975
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7005
   Icon            =   "frmSetting.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   3975
   ScaleWidth      =   7005
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   495
      Left            =   3960
      TabIndex        =   5
      Top             =   3240
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   5520
      TabIndex        =   4
      Top             =   3240
      Width           =   1335
   End
   Begin VB.Frame Frame2 
      Caption         =   "Marketplace"
      Height          =   3015
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6975
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
         TabIndex        =   3
         Top             =   2040
         Width           =   1695
      End
      Begin VB.Label lblLocalIP 
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Left            =   2760
         TabIndex        =   8
         Top             =   1320
         Width           =   2535
      End
      Begin VB.Label lblHostname 
         BorderStyle     =   1  'Fixed Single
         Height          =   375
         Left            =   2760
         TabIndex        =   7
         Top             =   600
         Width           =   2535
      End
      Begin VB.Label Label5 
         Caption         =   "Local Host Name"
         Height          =   255
         Left            =   480
         TabIndex        =   6
         Top             =   600
         Width           =   1335
      End
      Begin VB.Label Label4 
         Caption         =   "Local Port"
         Height          =   255
         Left            =   480
         TabIndex        =   2
         Top             =   2040
         Width           =   975
      End
      Begin VB.Label Label3 
         Caption         =   "Local IP Address"
         Height          =   375
         Left            =   480
         TabIndex        =   1
         Top             =   1320
         Width           =   1935
      End
   End
End
Attribute VB_Name = "frmSetting"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCancel_Click()
        Unload Me
End Sub


Private Sub cmdOK_Click()
       If txtHostPort.Text = "" Then
                MsgBox "Please Insert Local Port  Before Click OK", vbExclamation + vbOKOnly, "Warning"
        Else
                LocalPort = txtHostPort.Text
                LocalName = lblHostname.Caption
                LocalIP = lblLocalIP.Caption
                Unload Me
        End If
End Sub


Private Sub Form_Load()
        txtHostPort.Text = LocalPort
        lblHostname.Caption = Winsock1.LocalHostName
        lblLocalIP.Caption = Winsock1.LocalIP
End Sub


Private Sub Form_Unload(Cancel As Integer)
        Winsock1.Close
End Sub

