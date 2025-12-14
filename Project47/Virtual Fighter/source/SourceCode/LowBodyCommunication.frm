VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form1 
   BackColor       =   &H80000013&
   Caption         =   "Virtual Fighter - Low Body Module"
   ClientHeight    =   2310
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   3720
   Icon            =   "LowBody.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   2310
   ScaleWidth      =   3720
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox socketInStr 
      BackColor       =   &H80000013&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      Height          =   195
      Left            =   960
      TabIndex        =   1
      Text            =   "Recv from Socket"
      Top             =   1440
      Width           =   1335
   End
   Begin VB.CommandButton serialSend 
      BackColor       =   &H80000002&
      Caption         =   "Send"
      Height          =   615
      Left            =   2400
      MaskColor       =   &H00FF8080&
      TabIndex        =   0
      Top             =   360
      Width           =   1095
   End
   Begin MSCommLib.MSComm Serial 
      Left            =   2160
      Top             =   1680
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
      Handshaking     =   1
   End
   Begin MSWinsockLib.Winsock Socket 
      Left            =   3120
      Top             =   1800
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H80000013&
      Caption         =   "Serial Module"
      Height          =   975
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   3495
      Begin VB.TextBox serialOutStr 
         Height          =   285
         Left            =   120
         TabIndex        =   4
         Text            =   "SerialCommand"
         Top             =   480
         Width           =   1935
      End
      Begin VB.TextBox serialInStr 
         BackColor       =   &H80000013&
         BorderStyle     =   0  'None
         Enabled         =   0   'False
         Height          =   285
         Left            =   840
         TabIndex        =   3
         Text            =   "Recv from Serial"
         Top             =   240
         Width           =   1335
      End
      Begin VB.Label Label1 
         BackColor       =   &H80000013&
         Caption         =   "Recieve :"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   855
      End
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H80000013&
      Caption         =   "Socket Module"
      Height          =   975
      Left            =   120
      TabIndex        =   5
      Top             =   1200
      Width           =   3495
      Begin VB.CommandButton socketSend 
         Caption         =   "Send"
         Height          =   615
         Left            =   2280
         TabIndex        =   9
         Top             =   240
         Width           =   1095
      End
      Begin VB.TextBox socketOutStr 
         Height          =   285
         Left            =   120
         TabIndex        =   8
         Text            =   "SocketCommand"
         Top             =   480
         Width           =   1935
      End
      Begin VB.Label Label2 
         BackColor       =   &H80000013&
         Caption         =   "Recieve :"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   240
         Width           =   735
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub serialSend_Click()
    Serial.Output = serialOutStr.Text
End Sub

Private Sub socketSend_Click()
    Socket.SendData ("s" & socketOutStr.Text)
End Sub

Private Sub Form_Load()

    Socket.Protocol = sckUDPProtocol
    Socket.Bind 32076, Socket.LocalIP
    Socket.RemoteHost = Socket.LocalIP
    Socket.RemotePort = 32075

    
    Serial.Settings = "9600,N,8,1"
    Serial.CommPort = 1
    Serial.InputLen = 1
    Serial.PortOpen = True
    Serial.RThreshold = 1
    
End Sub

Private Sub Serial_OnComm()
    serialInStr.Text = Serial.Input
    Socket.SendData ("s" & serialInStr.Text)
End Sub

Private Sub Socket_DataArrival(ByVal bytesTotal As Long)
    Dim recvStr As String
    Socket.GetData recvStr, vbString
    socketInStr.Text = recvStr
    Serial.Output = socketInStr.Text
End Sub
