VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Login 
   Caption         =   "Login"
   ClientHeight    =   6300
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9030
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   9.75
      Charset         =   222
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Login.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6300
   ScaleWidth      =   9030
   StartUpPosition =   3  'Windows Default
   Begin MSWinsockLib.Winsock wData 
      Left            =   5520
      Top             =   5760
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.TextBox txtPassword 
      Height          =   375
      IMEMode         =   3  'DISABLE
      Left            =   3600
      PasswordChar    =   "*"
      TabIndex        =   9
      Top             =   3480
      Width           =   2535
   End
   Begin VB.TextBox txtUsername 
      Height          =   375
      Left            =   3600
      TabIndex        =   8
      Top             =   2760
      Width           =   2535
   End
   Begin VB.OptionButton optNew 
      Caption         =   "New User"
      Height          =   255
      Left            =   3120
      TabIndex        =   7
      Top             =   4200
      Width           =   1935
   End
   Begin VB.OptionButton optExist 
      Caption         =   "Existing User"
      Height          =   255
      Left            =   3120
      TabIndex        =   4
      Top             =   2160
      Value           =   -1  'True
      Width           =   1815
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   7680
      TabIndex        =   3
      Top             =   5760
      Width           =   1095
   End
   Begin VB.CommandButton cmdNext 
      Caption         =   "&Next >"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   6240
      TabIndex        =   2
      Top             =   5760
      Width           =   1095
   End
   Begin VB.PictureBox Picture2 
      BeginProperty Font 
         Name            =   "CordiaUPC"
         Size            =   24
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   60
      Left            =   240
      ScaleHeight     =   0
      ScaleWidth      =   8475
      TabIndex        =   1
      Top             =   5520
      Width           =   8535
   End
   Begin VB.PictureBox Picture1 
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   5175
      Left            =   240
      Picture         =   "Login.frx":0442
      ScaleHeight     =   5175
      ScaleWidth      =   2055
      TabIndex        =   0
      Top             =   240
      Width           =   2055
   End
   Begin VB.Label Label8 
      Caption         =   "http://161.246.5.219"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   4800
      TabIndex        =   15
      Top             =   4920
      Width           =   2055
   End
   Begin VB.Label Label7 
      Caption         =   "Visit our website at "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2760
      TabIndex        =   14
      Top             =   4920
      Width           =   2055
   End
   Begin VB.Label Label6 
      Caption         =   "Click Cancel to exit."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2760
      TabIndex        =   13
      Top             =   1560
      Width           =   1695
   End
   Begin VB.Label Label5 
      Caption         =   "Click Next to continue."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2760
      TabIndex        =   12
      Top             =   1320
      Width           =   1695
   End
   Begin VB.Label Label4 
      Caption         =   "This Wizard helps you to make a voice messaging to the telephone."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2760
      TabIndex        =   11
      Top             =   840
      Width           =   5895
   End
   Begin VB.Label Label3 
      Caption         =   "Welcome to Automatic Voice Sending System"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   14.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2760
      TabIndex        =   10
      Top             =   240
      Width           =   5775
   End
   Begin VB.Label Label2 
      Caption         =   "Password"
      Height          =   255
      Left            =   3600
      TabIndex        =   6
      Top             =   3240
      Width           =   1695
   End
   Begin VB.Label Label1 
      Caption         =   "Username"
      Height          =   255
      Left            =   3600
      TabIndex        =   5
      Top             =   2520
      Width           =   1695
   End
End
Attribute VB_Name = "Login"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCancel_Click()
    wData.Close
    End
End Sub

Private Sub cmdNext_Click()
    If optExist = True Then
        If txtUsername.Text <> "" And txtPassword.Text <> "" Then
            On Error Resume Next
            'Close the current connection for new connection:
            wData.Close
            'Connect to the remote computer
            wData.Connect serverip, serverport
            'Tell the user we are connecting:
            'lblStatus.Caption = "Connecting... "
            'If there was an error, inform the user:
            If Err Then
                MsgBox Err.Description, 0, "Winsock Error"
                wData.Close
                Exit Sub
            End If
        Else
            MsgBox "Invalid Username and Password", 0, "Error"
        End If
    Else
        Me.Hide
        NewUser.Show
    End If
End Sub

Private Sub Label8_Click()
    Dim ret&
    ret& = ShellExecute(Me.hwnd, "Open", "http://161.246.5.219/", "", App.Path, 1)
End Sub

Private Sub wData_Close()
    'Close the current connection for new connection:
    wData.Close
    'Inform the user that we have closed the connection:
    'lblStatus.Caption = "Connection Closed"
End Sub

Private Sub wData_Connect()
    Dim SendStr As String
    On Error Resume Next
    'Put what we are about so send into a variable:
    SendStr = "Lgin " & txtUsername.Text & " " & txtPassword.Text
    'Send the message:
    wData.SendData SendStr
    'Set the text to the message we sent:
    'lblStatus.Caption = "Connecting to " & PhoneText.Text
    'If there was an error, inform the user:
    If Err Then
        MsgBox Err.Description, 0, "Winsock Error"
        wData.Close
        Exit Sub
    End If
End Sub

Private Sub wData_DataArrival(ByVal bytesTotal As Long)
    Dim nData As String
    On Error Resume Next
    'Get the data being sent to us:
    wData.GetData nData
    'Set the text to the message we received:
    Dim cmd As String
    cmd = Left$(nData, 4)
    If cmd = "pass" Then
        s_time = Mid$(nData, 6, Len(nData))
        'MsgBox s_time, 0, "Server Time"
        wData.Close
        username = txtUsername
        Me.Hide
        'init s_time
        AddList.txtServerTime.Text = s_time
        AddList.txtCredit.Text = credit
        If AddList.lstCall.ListCount > 0 Then
            AddList.cmdRemove.Enabled = True
            AddList.cmdNext.Enabled = True
        Else
            AddList.cmdRemove.Enabled = False
            AddList.cmdNext.Enabled = False
        End If
        On Error Resume Next
        pos1 = InStr(s_time, "/")
        pos2 = InStr(pos1 + 1, s_time, "/")
        pos3 = InStr(pos2 + 1, s_time, " ")
        pos4 = InStr(pos3 + 1, s_time, ":")
        pos5 = InStr(pos4 + 1, s_time, ":")
        sday = Left$(s_time, pos1 - 1)
        AddList.cmbDay.Text = sday
        smon = Mid$(s_time, pos1 + 1, pos2 - pos1 - 1)
        AddList.cmbMon.Text = smon
        syear = Mid$(s_time, pos2 + 1, pos3 - pos2 - 1)
        AddList.cmbYear.Text = syear
        shour = Mid$(s_time, pos3 + 1, pos4 - pos3 - 1)
        AddList.cmbHour.Text = shour
        smin = Mid$(s_time, pos4 + 1, pos5 - pos4 - 1)
        AddList.cmbMin.Text = smin
        AddList.cmbYear.additem (syear)
        AddList.cmbYear.additem (syear + 1)
        AddList.cmbYear.additem (syear + 2)
        AddList.cmbAreaCode.Text = "INT"
        If Err Then
            MsgBox "Protocal Error", 0, "Error"
            End
        End If
        AddList.txtUsername = username
        AddList.Show
    End If
    If cmd = "cred" Then
        credit = Mid$(nData, 6, Len(nData))
    End If
    If cmd = "errr" Then
        Dim desc As String
        desc = Mid$(nData, 6, Len(nData))
        'MsgBox s_time, 0, "Server Time"
        wData.Close
        MsgBox desc, 0, "Error"
    End If
    'If there was an error, inform the user:
    If Err Then
        MsgBox Err.Description, 0, "Winsock Error"
        wData.Close
        Exit Sub
    End If
End Sub

Private Sub wData_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    'Inform the user of an error:
    If Description <> "" Then
        MsgBox Description, 0, "Winsock Error"
        wData.Close
    End If
End Sub
