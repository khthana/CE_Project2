VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmNet 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "CRCS"
   ClientHeight    =   7290
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   2880
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   FontTransparent =   0   'False
   Icon            =   "frmNet.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   486
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   192
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ImageList lstLAN 
      Left            =   1920
      Top             =   6240
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   4
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmNet.frx":492A
            Key             =   "Online"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmNet.frx":19A9C
            Key             =   "Offline"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmNet.frx":1E906
            Key             =   "Blocked"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmNet.frx":23240
            Key             =   "Message"
         EndProperty
      EndProperty
   End
   Begin VB.PictureBox Picture1 
      Height          =   1455
      Left            =   0
      Picture         =   "frmNet.frx":27B7A
      ScaleHeight     =   1395
      ScaleWidth      =   2715
      TabIndex        =   1
      Top             =   0
      Width           =   2775
   End
   Begin VB.Frame Frame1 
      Caption         =   "Slave"
      Height          =   5595
      Left            =   120
      TabIndex        =   0
      Top             =   1530
      Width           =   2625
      Begin crcs.ctlWinsockArray ctlWinsockArray1 
         Height          =   510
         Left            =   1200
         TabIndex        =   3
         Top             =   4680
         Visible         =   0   'False
         Width           =   510
         _ExtentX        =   900
         _ExtentY        =   900
      End
      Begin MSComctlLib.TreeView TreeView1 
         Height          =   5175
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   9128
         _Version        =   393217
         HideSelection   =   0   'False
         LabelEdit       =   1
         Sorted          =   -1  'True
         Style           =   7
         ImageList       =   "lstLAN"
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
   Begin VB.Menu mEdit 
      Caption         =   "&Slave"
      Begin VB.Menu mAdd 
         Caption         =   "&Add"
      End
      Begin VB.Menu mProperties 
         Caption         =   "&Properties"
      End
      Begin VB.Menu mSep 
         Caption         =   "-"
      End
      Begin VB.Menu mExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mControl 
      Caption         =   "&Control"
      Begin VB.Menu mChat 
         Caption         =   "C&hat"
      End
      Begin VB.Menu mView 
         Caption         =   "&View"
      End
      Begin VB.Menu mGraphic 
         Caption         =   "&Graphic"
      End
      Begin VB.Menu mCommand 
         Caption         =   "Co&mmand"
      End
      Begin VB.Menu mFileTransfer 
         Caption         =   "&File transfer"
      End
   End
   Begin VB.Menu mHelp 
      Caption         =   "&Help"
      Begin VB.Menu mmHelp 
         Caption         =   "He&lp"
         Enabled         =   0   'False
         Shortcut        =   {F1}
      End
      Begin VB.Menu mAbout 
         Caption         =   "&About"
         Enabled         =   0   'False
      End
   End
End
Attribute VB_Name = "frmNet"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "main module that makes everything work"
'43370 main
'43371 chat
'43372 cmd
'43373 file transfer

Const fileName = "\slave.lst"

Dim fso As New FileSystemObject
Dim objFile As File
Dim objts As TextStream

Private Sub ctlWinsockArray1_IncomingData(ByVal Index As Integer, ByVal Data As String)

    If Data = "ChatReady" Then
        Dim ChatForm As New frmChat
        ChatForm.Caption = slave(getIPbySocketArrayIndex(Index)).Name
        ChatForm.Show
        'MsgBox getIPbyName(ChatForm.Caption)
    ElseIf Data = "cmdControlReady" Then
        Shell "cmdctrl.exe " & tmpIP & " 43372", vbNormalFocus
    End If

End Sub

Private Sub ctlWinsockArray1_LostConnection(ByVal Index As Integer)
    
    Dim RemoteIP As String
    RemoteIP = getIPbySocketArrayIndex(Index)
    
    TreeView1.Nodes(RemoteIP).Image = 2
    slave(RemoteIP).Status = 2
    slave(RemoteIP).SocketIndex = -1

End Sub

Private Sub ctlWinsockArray1_NewConnection(ByVal Index As Integer, ByVal RemoteIP As String)

    TreeView1.Nodes(RemoteIP).Image = 1
    slave(RemoteIP).Status = 1
    slave(RemoteIP).SocketIndex = Index

End Sub

Private Sub Form_Load()

    If fso.FileExists(App.Path & fileName) Then
        fso.OpenTextFile (App.Path & fileName)
        Set objFile = fso.GetFile(App.Path & fileName)
        Set objts = objFile.OpenAsTextStream(ForReading)
        While Not objts.AtEndOfStream
            nodeX.Name = objts.ReadLine
            nodeX.IP = objts.ReadLine
            nodeX.Status = 2
            nodeX.SocketIndex = -1
            TreeView1.Nodes.Add , , nodeX.IP, nodeX.Name, nodeX.Status
            slave.Add nodeX, nodeX.IP
            Set nodeX = Nothing
        Wend
        mProperties.Enabled = True
    End If
    
    frmNet.ctlWinsockArray1.LocalPort = 43370
    frmNet.ctlWinsockArray1.Listen

End Sub


Private Sub Form_Unload(Cancel As Integer)
        
    Dim i As Integer
    
    fso.CreateTextFile (App.Path & fileName)
    Set objFile = fso.GetFile(App.Path & fileName)
    Set objts = objFile.OpenAsTextStream(ForWriting)
    For i = 1 To slave.Count
         objts.WriteLine slave.Item(i).Name
         objts.WriteLine slave.Item(i).IP
    Next i
    objts.Close

End Sub

Private Sub mAdd_Click()
    
    frmAdd.Show

End Sub

Private Sub mChat_Click()
    
    Dim i As Integer
    i = TreeView1.SelectedItem.Index
    tmpIP = slave(i).IP
    frmChat.Show
    frmChat.Caption = slave(i).Name
    frmNet.ctlWinsockArray1.SendData getSocketArrayIndexByIP(tmpIP), "Chat"
    
End Sub

Private Sub mCommand_Click()
    
    Dim i As Integer
    i = TreeView1.SelectedItem.Index
    tmpIP = slave(i).IP
    frmNet.ctlWinsockArray1.SendData getSocketArrayIndexByIP(tmpIP), "cmdControl"
    
End Sub

Private Sub mExit_Click()

    Unload frmAdd
    Unload frmInfo
    Unload Me
    
End Sub

Private Sub mFileTransfer_Click()
    
    Dim i As Integer
    i = TreeView1.SelectedItem.Index
    tmpIP = slave(i).IP
    frmNet.ctlWinsockArray1.SendData getSocketArrayIndexByIP(tmpIP), "FileTransfer"
    frmFTP.Show
    'Call frmFTP.cmdBrowse_Click 'frmft.cmdBrowse_Click
    'Call frmFTP.cmdSend_Click

    
End Sub

Private Sub mGraphic_Click()

    Shell "master " & slave.Item(TreeView1.SelectedItem.Index).IP, vbNormalFocus

End Sub

Private Sub mProperties_Click()

    frmInfo.Show

End Sub

Private Sub mView_Click()
    
    Shell "master " & slave.Item(TreeView1.SelectedItem.Index).IP & " -viewonly -scale 1/2", vbNormalFocus

End Sub
