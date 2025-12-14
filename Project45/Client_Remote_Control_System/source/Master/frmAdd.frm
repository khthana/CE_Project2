VERSION 5.00
Begin VB.Form frmAdd 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Add Slave"
   ClientHeight    =   2130
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   3675
   Icon            =   "frmAdd.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2130
   ScaleWidth      =   3675
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   495
      Left            =   1800
      TabIndex        =   5
      Top             =   1320
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   495
      Left            =   120
      TabIndex        =   4
      Top             =   1320
      Width           =   1575
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   960
      TabIndex        =   3
      Top             =   840
      Width           =   2415
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   960
      TabIndex        =   2
      Top             =   480
      Width           =   2415
   End
   Begin VB.Label Label2 
      Caption         =   "IP :"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   840
      Width           =   735
   End
   Begin VB.Label Label1 
      Caption         =   "Name :"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   480
      Width           =   735
   End
End
Attribute VB_Name = "frmAdd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Command1_Click()
    Dim nodeX As New myNode

    If Text1.Text <> "" And Text2.Text <> "" Then
        nodeX.Name = Text1.Text
        nodeX.IP = Text2.Text
        nodeX.Status = 2
        frmNet.TreeView1.Nodes.Add , , nodeX.Name, nodeX.Name, nodeX.Status
        slave.Add nodeX, nodeX.Name
        frmNet.mProperties.Enabled = True
        Unload Me
    End If

End Sub


Private Sub Command2_Click()

    Unload Me

End Sub
