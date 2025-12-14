VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form AddCredit 
   Caption         =   "Add Credit"
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
   Icon            =   "AddCredit.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6300
   ScaleWidth      =   9030
   StartUpPosition =   3  'Windows Default
   Begin MSWinsockLib.Winsock wData 
      Left            =   4200
      Top             =   5760
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.TextBox txtUsername 
      BackColor       =   &H8000000A&
      Height          =   375
      Left            =   4080
      Locked          =   -1  'True
      TabIndex        =   17
      Top             =   2160
      Width           =   2535
   End
   Begin VB.TextBox txtCredit 
      BackColor       =   &H8000000A&
      Height          =   375
      Left            =   4080
      Locked          =   -1  'True
      TabIndex        =   15
      Top             =   3600
      Width           =   2535
   End
   Begin VB.TextBox txtCard3 
      Height          =   375
      Left            =   6000
      MaxLength       =   4
      TabIndex        =   9
      Top             =   2640
      Width           =   615
   End
   Begin VB.TextBox txtCard2 
      Height          =   375
      Left            =   5040
      MaxLength       =   4
      TabIndex        =   8
      Top             =   2640
      Width           =   615
   End
   Begin VB.TextBox txtCard1 
      Height          =   375
      Left            =   4080
      MaxLength       =   4
      TabIndex        =   7
      Top             =   2640
      Width           =   615
   End
   Begin VB.PictureBox Picture3 
      BackColor       =   &H8000000E&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "CordiaUPC"
         Size            =   24
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   240
      Picture         =   "AddCredit.frx":0442
      ScaleHeight     =   855
      ScaleWidth      =   8535
      TabIndex        =   4
      Top             =   120
      Width           =   8535
   End
   Begin VB.CommandButton cmdBack 
      Caption         =   "< &Back"
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
      Left            =   5040
      TabIndex        =   3
      Top             =   5760
      Width           =   1095
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
      TabIndex        =   2
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
      TabIndex        =   1
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
      TabIndex        =   0
      Top             =   5520
      Width           =   8535
   End
   Begin VB.Label Label12 
      Caption         =   "Please fill the form to Add Credit to our system."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2280
      TabIndex        =   16
      Top             =   1200
      Width           =   5055
   End
   Begin VB.Label Label11 
      Caption         =   "Credit"
      Height          =   255
      Left            =   2640
      TabIndex        =   14
      Top             =   3720
      Width           =   1095
   End
   Begin VB.Label Label9 
      Caption         =   "** is the field that required to be filled."
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   3360
      TabIndex        =   13
      Top             =   4560
      Width           =   3375
   End
   Begin VB.Label Label8 
      Caption         =   "**"
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   6720
      TabIndex        =   12
      Top             =   2760
      Width           =   255
   End
   Begin VB.Label Label5 
      Caption         =   "  -"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5640
      TabIndex        =   11
      Top             =   2640
      Width           =   255
   End
   Begin VB.Label Label4 
      Caption         =   "  -"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4680
      TabIndex        =   10
      Top             =   2640
      Width           =   255
   End
   Begin VB.Label Label3 
      Caption         =   "Card Number"
      Height          =   255
      Left            =   2640
      TabIndex        =   6
      Top             =   2760
      Width           =   1455
   End
   Begin VB.Label Label1 
      Caption         =   "Username"
      Height          =   255
      Left            =   2640
      TabIndex        =   5
      Top             =   2280
      Width           =   1095
   End
End
Attribute VB_Name = "AddCredit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBack_Click()
    wData.Close
    Me.Hide
    AddList.Show
End Sub

Private Sub cmdCancel_Click()
    wData.Close
    End
End Sub

Private Sub cmdNext_Click()
    If txtUsername.Text <> "" And txtCard1.Text <> "" And txtCard2.Text <> "" And txtCard3.Text <> "" Then
        On Error Resume Next
        'Close the current connection for new connection:
        wData.Close
        'Connect to the remote computer
        wData.Connect serverip, serverport
        'If there was an error, inform the user:
        If Err Then
            MsgBox Err.Description, 0, "Winsock Error"
            wData.Close
            Exit Sub
        End If
    Else
        MsgBox "Complete the field.", 0, "Error"
    End If
End Sub

Private Sub wData_Close()
    'Close the current connection for new connection:
    wData.Close
End Sub

Private Sub wData_Connect()
    Dim SendStr As String
    On Error Resume Next
    'Put what we are about so send into a variable:
    SendStr = "Addc " & txtUsername.Text & " " & txtCard1.Text & txtCard2.Text & txtCard3.Text
    'Send the message:
    wData.SendData SendStr
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
    If cmd = "cred" Then
        credit = Mid$(nData, 6, Len(nData))
        AddList.txtCredit = credit
        txtCredit.Text = credit
    End If
    If cmd = "errr" Then
        Dim desc As String
        desc = Mid$(nData, 6, Len(nData))
        wData.Close
        MsgBox desc, 0, "Error"
        Exit Sub
    End If
    If cmd = "pass" Then
        s_time = Mid$(nData, 6, Len(nData))
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
        If Err Then
            MsgBox "Protocal Error", 0, "Error"
            End
        End If
        wData.Close
        Me.Hide
        Thanks.Show
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
        Exit Sub
    End If
End Sub

