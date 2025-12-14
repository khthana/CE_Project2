VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmMain 
   Caption         =   "System Control"
   ClientHeight    =   5910
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6885
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   5910
   ScaleWidth      =   6885
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdStop 
      Caption         =   "Stop"
      Height          =   615
      Left            =   4080
      TabIndex        =   3
      Top             =   480
      Width           =   975
   End
   Begin VB.CommandButton cmdListen 
      Caption         =   "Listen"
      Height          =   615
      Left            =   2640
      TabIndex        =   2
      Top             =   480
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "close winsock"
      Height          =   975
      Left            =   5040
      TabIndex        =   1
      Top             =   2280
      Width           =   975
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   2400
      Top             =   2280
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdSendData 
      Caption         =   "Send Data"
      Height          =   495
      Left            =   3600
      TabIndex        =   0
      Top             =   4080
      Width           =   1455
   End
   Begin MSWinsockLib.Winsock winsockSend 
      Left            =   600
      Top             =   1080
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock winsockMain 
      Left            =   120
      Top             =   1080
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdListen_Click()
        winsockMain.LocalPort = LocalPort
        winsockMain.Listen
        cmdListen.Enabled = False
        cmdStop.Enabled = True
End Sub

Private Sub cmdSendData_Click()
        If winsockSend.State <> sckClosed Then winsockSend.Close
        winsockSend.Connect RemoteIP, RemotePort
End Sub

Private Sub Command1_Click()
        winsockSend.Close
End Sub

Private Sub Form_Load()
        cmdListen.Enabled = True
        cmdStop.Enabled = False
End Sub

Private Sub winsockSend_Connect()
       ' winsocksend.SendData "Test Data"
       CommonDialog1.FileName = ""
       CommonDialog1.ShowOpen
       If CommonDialog1.FileName <> "" Then
                SendFile CommonDialog1.FileName, CommonDialog1.FileTitle, ftPO
       End If
End Sub

Private Sub winsockSend_DataArrival(ByVal bytesTotal As Long)
        Dim strNew As String
        winsockSend.GetData strNew, vbString
        MsgBox strNew
End Sub

Private Sub winsocksend_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
        MsgBox Description, vbCritical + vbOKOnly, "Winsock Error"
End Sub

Private Sub winsockSend_SendComplete()
        winsockSend.Close
End Sub

Private Sub SendFile(ByVal SourceFile As String, ByVal DestFile As String, ByVal ft As String)
        Dim fso As FileSystemObject
        Dim txt As TextStream
        Dim x As String
        
        Set fso = New FileSystemObject
        If fso.FileExists(SourceFile) Then
                winsockSend.SendData DestBegin & DestFile & vbCrLf
                winsockSend.SendData FileType & ft & vbCrLf
                 
                Dim arrByteArray() As Byte
                Dim intNextFreeFile As Integer
                'Open the source file and read the content
                'into a arrByteArray to pass onto encryption
                intNextFreeFile = FreeFile
                Open SourceFile For Binary As #intNextFreeFile
                ReDim arrByteArray(0 To LOF(intNextFreeFile) - 1)
                Get #intNextFreeFile, , arrByteArray()
                Close #intNextFreeFile
                 
                winsockSend.SendData arrByteArray()
                 

                winsockSend.SendData EofFile
                Set txt = Nothing
        Else
                MsgBox "File " & SourceFile & " Not Found", vbExclamation + vbOKOnly, "Open File"
        End If
        Set fso = Nothing
End Sub
