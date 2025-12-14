VERSION 5.00
Begin VB.Form frmInfo 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Slave Information"
   ClientHeight    =   3630
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4680
   Icon            =   "frmInfo.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3630
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   495
      Left            =   3120
      TabIndex        =   1
      Top             =   3000
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      Height          =   2655
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   120
      Width           =   4335
   End
End
Attribute VB_Name = "frmInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Command1_Click()

    Unload Me

End Sub


Private Sub Form_Load()

    Text1.Text = "Name : " & slave.Item(frmNet.TreeView1.SelectedItem.Index).Name & vbCrLf & "IP : " & slave.Item(frmNet.TreeView1.SelectedItem.Index).IP & vbCrLf & "Status : " & frmNet.lstLAN.ListImages.Item(slave.Item(frmNet.TreeView1.SelectedItem.Index).Status).Key
        
End Sub
