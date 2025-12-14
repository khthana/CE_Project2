VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmChat 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Chat"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6195
   Icon            =   "frmChat.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   6195
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "&Send"
      Default         =   -1  'True
      Height          =   495
      Left            =   4560
      TabIndex        =   2
      Top             =   2640
      Width           =   1455
   End
   Begin VB.TextBox Text2 
      Height          =   405
      Left            =   120
      TabIndex        =   1
      Top             =   2640
      Width           =   4215
   End
   Begin VB.TextBox Text1 
      Height          =   2415
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   120
      Width           =   5895
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   5760
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "frmChat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    If Text2.Text <> "" Then
        Text1.Text = Text1.Text & vbCrLf & "Admin : " & Text2.Text
        Winsock1.SendData Text2.Text
        Text2.Text = ""
    End If
End Sub

Private Sub Form_Activate()
    Text2.SetFocus
End Sub

Private Sub Form_Load()
    Winsock1.Connect tmpIP, 43371
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If Winsock1.State = sckConnected Then
        Winsock1.SendData "Unchat"
        Winsock1.Close
    End If
End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
    Dim Str As String
    Winsock1.GetData Str
    Text1.Text = Text1.Text & vbCrLf & frmChat.Caption & " : " & Str
End Sub
