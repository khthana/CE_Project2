VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form AddList 
   Caption         =   "Add List"
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
   Icon            =   "AddList.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6300
   ScaleWidth      =   9030
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtUsername 
      BackColor       =   &H8000000B&
      Height          =   375
      Left            =   2880
      Locked          =   -1  'True
      TabIndex        =   31
      Top             =   1440
      Width           =   1815
   End
   Begin MSWinsockLib.Winsock wData 
      Left            =   5400
      Top             =   5760
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Frame Frame1 
      Caption         =   "Call List Panel"
      Height          =   3135
      Left            =   360
      TabIndex        =   10
      Top             =   2160
      Width           =   8415
      Begin VB.ComboBox cmbMin 
         Height          =   360
         ItemData        =   "AddList.frx":0442
         Left            =   1200
         List            =   "AddList.frx":04FA
         TabIndex        =   29
         Top             =   2400
         Width           =   615
      End
      Begin VB.ComboBox cmbHour 
         Height          =   360
         ItemData        =   "AddList.frx":05E4
         Left            =   360
         List            =   "AddList.frx":0630
         TabIndex        =   28
         Top             =   2400
         Width           =   615
      End
      Begin VB.ComboBox cmbYear 
         Height          =   360
         Left            =   2040
         TabIndex        =   25
         Top             =   1560
         Width           =   855
      End
      Begin VB.ComboBox cmbMon 
         Height          =   360
         ItemData        =   "AddList.frx":068A
         Left            =   1200
         List            =   "AddList.frx":06B2
         TabIndex        =   24
         Top             =   1560
         Width           =   615
      End
      Begin VB.ComboBox cmbDay 
         Height          =   360
         ItemData        =   "AddList.frx":06DD
         Left            =   360
         List            =   "AddList.frx":073E
         TabIndex        =   23
         Top             =   1560
         Width           =   615
      End
      Begin VB.ComboBox cmbAreaCode 
         Height          =   360
         ItemData        =   "AddList.frx":07B5
         Left            =   360
         List            =   "AddList.frx":07C5
         TabIndex        =   22
         Top             =   720
         Width           =   735
      End
      Begin VB.CommandButton cmdRemove 
         Caption         =   "<< &Remove"
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
         Left            =   3360
         TabIndex        =   18
         Top             =   1800
         Width           =   1095
      End
      Begin VB.CommandButton cmdAdd 
         Caption         =   "&Add >>"
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
         Left            =   3360
         TabIndex        =   17
         Top             =   1080
         Width           =   1095
      End
      Begin VB.ListBox lstCall 
         Height          =   1980
         Left            =   4680
         TabIndex        =   15
         Top             =   720
         Width           =   3375
      End
      Begin VB.TextBox txtTelNo 
         Height          =   375
         Left            =   1200
         MaxLength       =   7
         TabIndex        =   14
         Text            =   "110"
         Top             =   720
         Width           =   1575
      End
      Begin VB.Label Label12 
         Caption         =   ":"
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
         Left            =   1080
         TabIndex        =   30
         Top             =   2400
         Width           =   135
      End
      Begin VB.Label Label11 
         Caption         =   "/"
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
         Left            =   1920
         TabIndex        =   27
         Top             =   1560
         Width           =   135
      End
      Begin VB.Label Label10 
         Caption         =   "/"
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
         Left            =   1080
         TabIndex        =   26
         Top             =   1560
         Width           =   135
      End
      Begin VB.Label Label8 
         Caption         =   "**"
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   1680
         TabIndex        =   21
         Top             =   2160
         Width           =   255
      End
      Begin VB.Label Label7 
         Caption         =   "**"
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   2160
         TabIndex        =   20
         Top             =   1320
         Width           =   255
      End
      Begin VB.Label Label6 
         Caption         =   "**"
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   3960
         TabIndex        =   19
         Top             =   480
         Width           =   255
      End
      Begin VB.Label Label9 
         Caption         =   "Call List"
         Height          =   255
         Left            =   4680
         TabIndex        =   16
         Top             =   480
         Width           =   2055
      End
      Begin VB.Label Label5 
         Caption         =   "Time (hh:mm)"
         Height          =   255
         Left            =   360
         TabIndex        =   13
         Top             =   2160
         Width           =   2055
      End
      Begin VB.Label Label4 
         Caption         =   "Date (dd/mm/yyyy)"
         Height          =   255
         Left            =   360
         TabIndex        =   12
         Top             =   1320
         Width           =   2055
      End
      Begin VB.Label Label3 
         Caption         =   "Telephone Number (Area Code + Local)"
         Height          =   255
         Left            =   360
         TabIndex        =   11
         Top             =   480
         Width           =   3615
      End
   End
   Begin VB.CommandButton cmdView 
      Caption         =   "&View Existing List"
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
      Left            =   6720
      TabIndex        =   9
      Top             =   1680
      Width           =   2055
   End
   Begin VB.CommandButton cmdCredit 
      Caption         =   "Add &Credit"
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
      Left            =   6720
      TabIndex        =   8
      Top             =   1200
      Width           =   2055
   End
   Begin VB.TextBox txtCredit 
      BackColor       =   &H8000000B&
      Height          =   375
      Left            =   4920
      Locked          =   -1  'True
      TabIndex        =   7
      Top             =   1440
      Width           =   1695
   End
   Begin VB.TextBox txtServerTime 
      BackColor       =   &H8000000B&
      Height          =   375
      Left            =   240
      Locked          =   -1  'True
      TabIndex        =   6
      Top             =   1440
      Width           =   2415
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
      Picture         =   "AddList.frx":07DB
      ScaleHeight     =   855
      ScaleWidth      =   8535
      TabIndex        =   3
      Top             =   120
      Width           =   8535
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
   Begin VB.Label Label13 
      Caption         =   "Username"
      Height          =   255
      Left            =   2880
      TabIndex        =   32
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Credit Left"
      Height          =   255
      Left            =   4920
      TabIndex        =   5
      Top             =   1200
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Logged on Server Time"
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   1200
      Width           =   2295
   End
End
Attribute VB_Name = "AddList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
    Dim pos1, pos2, pos3, pos4, pos5, pos6 As Integer
    Dim sday As String
    Dim smon As String
    Dim syear As String
    Dim shour As String
    Dim smin As String
    
Private Sub cmdAdd_Click()
    On Error Resume Next
    Dim calldate As String
    Dim calltime As String
    calldate = cmbDay.Text & "/" & cmbMon.Text & "/" & cmbYear.Text
    calltime = cmbHour.Text & ":" & cmbMin.Text
    CVDate (calldate)
    TimeValue (calltime)
    If Err Then
        MsgBox "Invalid Date and Time", 0, "Error"
        GoTo exit1
    End If
    If cmbYear.Text > syear Then GoTo exit2
    If cmbYear.Text < syear Then
        MsgBox "Past time.", 0, "Error"
        GoTo exit1
    End If
    If cmbYear.Text = syear Then
        If cmbMon.Text < smon Then
            MsgBox "Past time.", 0, "Error"
            GoTo exit1
        End If
        If cmbMon.Text > smon Then GoTo exit2
        If cmbMon.Text = smon Then
            If cmbDay.Text < sday Then
                MsgBox "Past time.", 0, "Error"
                GoTo exit1
                End If
            If cmbDay.Text > sday Then GoTo exit2
            If cmbDay.Text = sday Then
                If cmbHour.Text < shour Then
                    MsgBox "Past time.", 0, "Error"
                    GoTo exit1
                End If
                If cmbHour.Text > shour Then GoTo exit2
                If cmbHour.Text = shour Then
                    If cmbMin.Text >= smin Then GoTo exit2
                    If cmbMin.Text < smin Then
                        MsgBox "Past time.", 0, "Error"
                        GoTo exit1
                        End If
                End If
            End If
        End If
    End If
exit2:
    Dim additem As String
    additem = txtTelNo & " " & calldate & " " & calltime
    For counter = 0 To lstCall.ListCount
        If (lstCall.List(counter) = additem) Then
            MsgBox "Already in the List", 0, "Error"
            GoTo exit1
        End If
    Next counter
    If cmbAreaCode.Text = "02" Or cmbAreaCode.Text = "INT" Then
        lstCall.additem (txtTelNo.Text & " " & calldate & " " & calltime)
    Else
        lstCall.additem (cmbAreaCode.Text & txtTelNo.Text & " " & calldate & " " & calltime)
    End If
exit1:
    If lstCall.ListCount > 0 Then
        cmdRemove.Enabled = True
        cmdNext.Enabled = True
    Else
        cmdRemove.Enabled = False
        cmdNext.Enabled = False
    End If
End Sub

Private Sub cmdCancel_Click()
    End
End Sub

Private Sub cmdCredit_Click()
    AddCredit.txtUsername = username
    AddCredit.txtCard1 = ""
    AddCredit.txtCard2 = ""
    AddCredit.txtCard3 = ""
    AddCredit.txtCredit = credit
    Me.Hide
    AddCredit.Show
End Sub

Private Sub cmdNext_Click()
    If txtCredit.Text > 0 Then
        Rec.lstCall.Clear
        For icount = 0 To lstCall.ListCount - 1
            Rec.lstCall.additem (lstCall.List(icount))
        Next icount
        Me.Hide
        Rec.Show
    Else
        MsgBox "No Credit!", 0, "Error"
    End If
End Sub

Private Sub cmdRemove_Click()
    Dim ind As Integer
    ind = lstCall.ListIndex
    lstCall.RemoveItem (ind)
    If lstCall.ListCount > 0 Then
        cmdRemove.Enabled = True
        cmdNext.Enabled = True
    Else
        cmdRemove.Enabled = False
        cmdNext.Enabled = False
    End If
End Sub

Private Sub cmdView_Click()
    ViewList.lstView.Clear
    ViewList.txtUsername.Text = username
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
    SendStr = "View " & username
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
    'clear Existinglist
    ViewList.lstView.Clear
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
        's_time = Mid$(nData, 6, Len(nData))
        'MsgBox s_time, 0, "Server Time"
        wData.Close
        'username = txtUsername
        ViewList.Show
    End If
    If cmd = "list" Then
        exists_l = Mid$(nData, 6, Len(nData))
        'ViewList.lstView.additem (exists_l)
        'make nice ui
        Dim arr(6)
        On Error Resume Next
        pos1 = InStr(exists_l, " ")
        pos2 = InStr(pos1 + 1, exists_l, " ")
        pos3 = InStr(pos2 + 1, exists_l, " ")
        pos4 = InStr(pos3 + 1, exists_l, " ")
        'pos5 = InStr(pos4 + 1, exists_l, " ")
        'pos6 = InStr(pos5 + 1, exists_l, " ")
        arr(1) = Left$(exists_l, pos1 - 1)
        arr(2) = Mid$(exists_l, pos1 + 1, pos2 - pos1 - 1)
        arr(3) = Mid$(exists_l, pos2 + 1, pos3 - pos2 - 1)
        arr(4) = Mid$(exists_l, pos3 + 1, pos4 - pos3 - 1)
        'arr(5) = Mid$(exists_l, pos4 + 1, pos5 - pos4 - 1)
        'arr(6) = Right$(exists_l, Len(exists_l) - pos5)
        arr(5) = Right$(exists_l, Len(exists_l) - pos4)
        If Err Then
            MsgBox "Protocal Error", 0, "Error"
            End
        End If
        Dim blk, vlist As String
        blk = Space$(2 * (10 - Len(arr(1))))
        vlist = arr(1) & blk
        blk = Space$(2 * (15 - Len(arr(2))))
        vlist = vlist & arr(2) & blk
        blk = Space$(2 * (20 - Len(arr(3))))
        vlist = vlist & arr(3) & blk
        blk = Space$(3 * (10 - Len(arr(4))))
        vlist = vlist & arr(4) & blk & arr(5) '& " at " & arr(6)
        'ViewList.RTB.Text = vlist
        ViewList.lstView.additem (vlist)
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
        End
    End If
End Sub

