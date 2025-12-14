VERSION 5.00
Begin VB.Form UserPassword 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Change User Password"
   ClientHeight    =   2550
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4200
   Icon            =   "UserPassword.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   2550
   ScaleWidth      =   4200
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "&OK"
      Height          =   375
      Left            =   1680
      TabIndex        =   3
      Top             =   1920
      Width           =   1095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   2880
      TabIndex        =   4
      Top             =   1920
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      Height          =   1575
      Left            =   240
      TabIndex        =   5
      Top             =   240
      Width           =   3735
      Begin VB.TextBox Text3 
         ForeColor       =   &H00C00000&
         Height          =   315
         IMEMode         =   3  'DISABLE
         Left            =   1800
         MaxLength       =   10
         PasswordChar    =   "o"
         TabIndex        =   2
         Text            =   "Text2"
         Top             =   1020
         Width           =   1575
      End
      Begin VB.TextBox Text1 
         ForeColor       =   &H00C00000&
         Height          =   315
         IMEMode         =   3  'DISABLE
         Left            =   1800
         MaxLength       =   10
         PasswordChar    =   "o"
         TabIndex        =   0
         Text            =   "Text2"
         Top             =   300
         Width           =   1575
      End
      Begin VB.TextBox Text2 
         ForeColor       =   &H00C00000&
         Height          =   315
         IMEMode         =   3  'DISABLE
         Left            =   1800
         MaxLength       =   10
         PasswordChar    =   "o"
         TabIndex        =   1
         Text            =   "Text2"
         Top             =   660
         Width           =   1575
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Verify Password :"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   2
         Left            =   240
         TabIndex        =   8
         Top             =   1080
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "New Password :"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   7
         Top             =   720
         Width           =   1455
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Old Password :"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   6
         Top             =   360
         Width           =   1455
      End
   End
End
Attribute VB_Name = "UserPassword"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

Dim oldpwd As String
Dim newpwd As String
Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(1) As ADODB.Parameter
Dim i As Long

If Text2.Text <> Text3.Text Then
    MsgBox "New password and Verify password are not identical...", vbCritical + vbOKOnly
    Exit Sub
End If

On Error GoTo ErrHandler

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "sp_password"

Set tPr(0) = tCmd.CreateParameter("old", adVarChar, adParamInput, 10, Text1.Text)
Set tPr(1) = tCmd.CreateParameter("new", adVarChar, adParamInput, 10, Text2.Text)

For i = 0 To 1
    tCmd.Parameters.Append tPr(i)
Next i

Set tRs = tCmd.Execute

Set tCmd = Nothing
Set tRs = Nothing

MsgBox "Password has been changed...", vbInformation + vbOKOnly

Unload UserPassword

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Private Sub Command2_Click()

Unload UserPassword

End Sub

Private Sub Form_Load()
    Text1.Text = ""
    Text2.Text = ""
    Text3.Text = ""
    
    Me.Top = (MainMDI.ScaleHeight - Me.Height) / 2
    Me.Left = (MainMDI.ScaleWidth - Me.Width) / 2
End Sub

Private Sub Text1_KeyPress(KeyAscii As Integer)

If KeyAscii = 13 Then Text2.SetFocus
 
End Sub

Private Sub Text2_KeyPress(KeyAscii As Integer)

If KeyAscii = 13 Then Text3.SetFocus

End Sub

Private Sub Text3_KeyPress(KeyAscii As Integer)

If KeyAscii = 13 Then Command1_Click

End Sub
