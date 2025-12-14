VERSION 5.00
Begin VB.Form dlgRemote 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Connect Remote Host"
   ClientHeight    =   2805
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   4305
   ControlBox      =   0   'False
   Icon            =   "dlgRemote.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2805
   ScaleWidth      =   4305
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   2280
      TabIndex        =   6
      Top             =   2160
      Width           =   1575
   End
   Begin VB.CommandButton cmdConnect 
      Caption         =   "OK"
      Height          =   495
      Left            =   480
      TabIndex        =   5
      Top             =   2160
      Width           =   1575
   End
   Begin VB.Frame Frame1 
      Height          =   1935
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4215
      Begin VB.TextBox txtPort 
         Height          =   375
         Left            =   1560
         TabIndex        =   4
         Top             =   1080
         Width           =   2175
      End
      Begin VB.TextBox txtIP 
         Height          =   375
         Left            =   1560
         TabIndex        =   3
         Top             =   480
         Width           =   2175
      End
      Begin VB.Label Label2 
         Caption         =   "Port Number"
         Height          =   255
         Left            =   360
         TabIndex        =   2
         Top             =   1080
         Width           =   975
      End
      Begin VB.Label Label1 
         Caption         =   "IP Address"
         Height          =   255
         Left            =   360
         TabIndex        =   1
         Top             =   480
         Width           =   855
      End
   End
End
Attribute VB_Name = "dlgRemote"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub cmdCancel_Click()
        remoteIP = ""
        remotePort = ""
        Unload Me
End Sub

Private Sub cmdConnect_Click()
        If txtIP.Text = "" Then
                MsgBox "Enter IP Address Before Connect", vbExclamation + vbOKOnly, "Remote Connect"
        ElseIf txtPort.Text = "" Then
                MsgBox "Enter Port Number Before Connect", vbExclamation + vbOKOnly, "Remote Connect"
        Else
                remoteIP = txtIP.Text
                remotePort = txtPort.Text
                Unload Me
        End If
End Sub
