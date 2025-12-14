VERSION 5.00
Begin VB.Form DialogConnect 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Connect"
   ClientHeight    =   1665
   ClientLeft      =   5055
   ClientTop       =   4245
   ClientWidth     =   5715
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1665
   ScaleWidth      =   5715
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   1440
      TabIndex        =   7
      Text            =   "Text1"
      Top             =   1560
      Visible         =   0   'False
      Width           =   2535
   End
   Begin VB.TextBox txtInitialDB 
      Height          =   285
      Left            =   1440
      TabIndex        =   5
      Text            =   "foodmart 2000"
      Top             =   1080
      Width           =   2175
   End
   Begin VB.TextBox txtServer 
      Height          =   285
      Left            =   1440
      TabIndex        =   2
      Text            =   "jate"
      Top             =   600
      Width           =   2175
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4080
      TabIndex        =   1
      Top             =   1030
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   375
      Left            =   4080
      TabIndex        =   0
      Top             =   550
      Width           =   1215
   End
   Begin VB.Label Label3 
      Caption         =   "Database :"
      Height          =   255
      Left            =   480
      TabIndex        =   6
      Top             =   1080
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Server :"
      Height          =   255
      Left            =   720
      TabIndex        =   4
      Top             =   600
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Enter OLAP Server name"
      Height          =   255
      Left            =   240
      TabIndex        =   3
      Top             =   240
      Width           =   2175
   End
End
Attribute VB_Name = "DialogConnect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim OKButtonSt As String

Private Sub CancelButton_Click()
    If FormMainClient.Toolbar1.Buttons(1).Value = tbrPressed Then
        FormMainClient.Toolbar1.Buttons(1).Value = tbrUnpressed
        FormMainClient.Toolbar1.Buttons(1).Key = "disconnect"
        FormMainClient.StatusBarSt ("disconnet")
    End If
    txtServer.Text = ""
    txtInitialDB.Text = ""
    Me.Hide
    FormMainClient.StatusBarSt ("disconnst")
    FormMainClient.mnuDisconnect = False
    FormMainClient.mnuConnect = True
    
End Sub

Private Sub Form_Load()
    FormMainClient.Toolbar1.Buttons("disconnect").Value = tbrPressed
    FormMainClient.Toolbar1.Buttons("disconnect").Key = "connect"
End Sub

Private Sub OKButton_Click()
Dim i As Integer
    If txtServer & txtInitialDB = "" Then
        MsgBox "Please enter OLAP Server,Database name"
    ElseIf txtServer.Text = "" Then
        MsgBox "Please enter OLAP Server name"
    ElseIf txtInitialDB.Text = "" Then
        MsgBox "Please enter Database name"
    Else
        Me.Hide
        FormMainClient.mnuConnect = False
        FormMainClient.mnuDisconnect = True
        OKButtonSt = "true"
        Text1.Text = OKButtonSt
        FormMainClient.GetConnect
        
    End If
End Sub

Private Sub txtInitialDB_KeyPress(KeyAscii As Integer)
Dim char As String
    If KeyAscii = 13 Then
        OKButton_Click
        OKButtonSt = "true"
        Text1.Text = OKButtonSt
    End If
End Sub

Private Sub txtServer_KeyPress(KeyAscii As Integer)
Dim char As String
    If KeyAscii = 13 Then
        OKButton_Click
        OKButtonSt = "true"
        Text1.Text = OKButtonSt
    End If
End Sub
