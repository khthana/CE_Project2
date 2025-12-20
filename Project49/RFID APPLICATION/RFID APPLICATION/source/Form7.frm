VERSION 5.00
Object = "{6BF52A50-394A-11D3-B153-00C04F79FAA6}#1.0#0"; "wmp.dll"
Begin VB.Form f_read_all 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "ตรวจสอบ/ค้นหา"
   ClientHeight    =   8775
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9735
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form7.frx":0000
   ScaleHeight     =   8775
   ScaleWidth      =   9735
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton back_menu 
      Caption         =   "ไปหน้าแรก"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   7440
      TabIndex        =   7
      Top             =   4800
      Width           =   1815
   End
   Begin VB.CommandButton data_year 
      Caption         =   "สรุปยอด"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   7440
      TabIndex        =   3
      Top             =   2160
      Width           =   1815
   End
   Begin VB.CommandButton add_s 
      Caption         =   "เพิ่มชื่อ"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   1800
      TabIndex        =   11
      Top             =   7845
      Width           =   975
   End
   Begin VB.ListBox list_s 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1860
      Left            =   3240
      TabIndex        =   12
      Top             =   6360
      Width           =   5895
   End
   Begin VB.ComboBox type_s 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      ItemData        =   "Form7.frx":12241A
      Left            =   480
      List            =   "Form7.frx":122427
      Style           =   2  'Dropdown List
      TabIndex        =   9
      Top             =   7215
      Width           =   2415
   End
   Begin VB.CommandButton S_earch 
      Caption         =   "ค้นหา"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   600
      TabIndex        =   10
      Top             =   7845
      Width           =   975
   End
   Begin VB.TextBox key_s 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   480
      TabIndex        =   8
      Top             =   6375
      Width           =   2415
   End
   Begin VB.Timer timer_sound 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   0
      Top             =   1200
   End
   Begin VB.Timer find_data 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   0
      Top             =   600
   End
   Begin VB.CommandButton find 
      Caption         =   "ค้นหาหนังสือ"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   7440
      TabIndex        =   5
      Top             =   3360
      Width           =   1815
   End
   Begin VB.CommandButton unadd 
      Caption         =   "ยกเลิกชื่อหนังสือ"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   7440
      TabIndex        =   6
      Top             =   4080
      Width           =   1815
   End
   Begin VB.ListBox l_tmp_s 
      Height          =   255
      Left            =   7440
      TabIndex        =   14
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CommandButton add_name 
      Caption         =   "เพิ่มชื่อหนังสือ"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   7440
      TabIndex        =   2
      Top             =   1440
      Width           =   1815
   End
   Begin VB.ListBox l_name_s 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2160
      Left            =   480
      TabIndex        =   4
      Top             =   3240
      Width           =   6495
   End
   Begin VB.ListBox l_tmp 
      Height          =   255
      Left            =   6960
      TabIndex        =   13
      Top             =   0
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.ListBox l_name 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2160
      Left            =   480
      TabIndex        =   0
      Top             =   600
      Width           =   6495
   End
   Begin VB.Timer Read_data 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   0
      Top             =   0
   End
   Begin VB.CommandButton R_RFID 
      Caption         =   "เริ่มการทำงาน"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Left            =   7440
      TabIndex        =   1
      Top             =   720
      Width           =   1815
   End
   Begin VB.Shape OnOff_read 
      BackColor       =   &H000000FF&
      BackStyle       =   1  'Opaque
      FillColor       =   &H000000FF&
      Height          =   135
      Left            =   7200
      Shape           =   3  'Circle
      Top             =   885
      Width           =   135
   End
   Begin VB.Shape OnOff_find 
      BackColor       =   &H000000FF&
      BackStyle       =   1  'Opaque
      FillColor       =   &H000000FF&
      Height          =   135
      Left            =   7200
      Shape           =   3  'Circle
      Top             =   3525
      Width           =   135
   End
   Begin WMPLibCtl.WindowsMediaPlayer WindowsMediaPlayer1 
      Height          =   480
      Left            =   0
      TabIndex        =   15
      Top             =   1800
      Width           =   480
      URL             =   ""
      rate            =   1
      balance         =   0
      currentPosition =   0
      defaultFrame    =   ""
      playCount       =   1
      autoStart       =   -1  'True
      currentMarker   =   0
      invokeURLs      =   -1  'True
      baseURL         =   ""
      volume          =   50
      mute            =   0   'False
      uiMode          =   "invisible"
      stretchToFit    =   0   'False
      windowlessVideo =   0   'False
      enabled         =   -1  'True
      enableContextMenu=   -1  'True
      fullScreen      =   0   'False
      SAMIStyle       =   ""
      SAMILang        =   ""
      SAMIFilename    =   ""
      captioningID    =   ""
      enableErrorDialogs=   0   'False
      _cx             =   847
      _cy             =   847
   End
End
Attribute VB_Name = "f_read_all"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim db_cn As ADODB.Connection
Dim db_rs As ADODB.Recordset
Dim t_SN As String
Dim t_s(3) As Integer

Private Sub add_name_Click()
    Dim ctr As Integer
    Dim tmp As Boolean

If l_name.ListIndex <> -1 Then
    tmp = False
    For ctr = 0 To (l_name_s.ListCount - 1)
        l_tmp_s.ListIndex = ctr
        If l_tmp_s.Text = l_tmp.Text Then
            tmp = True
        End If
    Next
    If tmp = False Then
        l_name_s.AddItem (l_name.Text)
        l_tmp_s.AddItem (l_tmp.Text)
    End If
End If
If l_name_s.ListCount <> 0 Then find.Enabled = True

End Sub

Private Sub add_s_Click()
    Dim ctr As Integer
    Dim tmp As Boolean

    tmp = False
    For ctr = 0 To (l_name_s.ListCount - 1)
        l_tmp_s.ListIndex = ctr
        If l_tmp_s.Text = db_rs!ID_RFID Then
            tmp = True
        End If
    Next
    If tmp = False Then
        If list_s.ListIndex <> -1 Then
            l_tmp_s.AddItem (db_rs!ID_RFID)
            l_name_s.AddItem (db_rs!ID_RFID & "   " & db_rs!Book_Title)
            db_rs.Close: Set db_rs = Nothing
            find.Enabled = True
            list_s.ListIndex = -1
        End If
    End If
End Sub

Private Sub back_menu_Click()
    Unload Me
End Sub

Private Sub data_year_Click()
    f_l_data_year.Show (vbModal)
End Sub

Private Sub find_Click()
    If find_data.Enabled = False Then
        t_SN = Empty
        data_year.Enabled = False
        find_data.Enabled = True
        OnOff_find.BackColor = &HFF00&
        S_earch.Enabled = False
        add_s.Enabled = False
        add_name.Enabled = False
        unadd.Enabled = False
        R_RFID.Enabled = False
    Else
        data_year.Enabled = True
        find_data.Enabled = False
        OnOff_find.BackColor = &HFF&
        S_earch.Enabled = True
        add_s.Enabled = True
        add_name.Enabled = True
        unadd.Enabled = True
        R_RFID.Enabled = True
    End If
End Sub

Private Sub find_data_Timer()
    Dim SerialNum(0 To 3) As Byte
    Dim Tag As Byte
    Dim RSn(0 To 3) As Byte
    Dim HaveTag As Boolean
    Dim tmpArray(0 To 9) As Byte
    Dim tmpbyte As Byte
    Dim SN As String
    Dim ctr As Integer
    Dim LogType As Byte
    Dim dataRead(0 To 15) As Byte
    Dim dstr As String
    Dim BLCK As Byte
    Dim Sec As Byte
    Dim t_search As String

    If tmp_time = 0 Then
        tmp_time = 1
        SerialNum(0) = 196
        SerialNum(1) = 11
        SerialNum(2) = 37
        SerialNum(3) = 137
    ElseIf tmp_time = 1 Then
        tmp_time = 3
        SerialNum(0) = 148
        SerialNum(1) = 109
        SerialNum(2) = 14
        SerialNum(3) = 137
    ElseIf tmp_time = 2 Then
        tmp_time = 4
        SerialNum(0) = 148
        SerialNum(1) = 68
        SerialNum(2) = 16
        SerialNum(3) = 137
    ElseIf tmp_time = 3 Then
        tmp_time = 2
        SerialNum(0) = 100
        SerialNum(1) = 158
        SerialNum(2) = 139
        SerialNum(3) = 135
    ElseIf tmp_time = 4 Then
        tmp_time = 0
        SerialNum(0) = 164
        SerialNum(1) = 134
        SerialNum(2) = 36
        SerialNum(3) = 137
    End If

    retcode = ACR120_MultiTagSelect(rHandle, SID, SerialNum(0), True, Tag, RSn(0))

    If retcode < 0 Then
        GoTo No_read:
    End If

    LogType = ACR120_LOGIN_KEYTYPE_AA
    pKey(0) = 255
    pKey(1) = 255
    pKey(2) = 255
    pKey(3) = 255
    pKey(4) = 255
    pKey(5) = 255

    Sec = 5
    retcode = ACR120_Login(rHandle, SID, Sec, LogType, 30, pKey(0))
    BLCK = 20

    retcode = ACR120_Read(rHandle, SID, BLCK, dataRead(0))
    
    dstr = Empty
    For ctr = 0 To 3
        dstr = dstr + Chr(dataRead(ctr))
    Next
    
    If l_tmp_s.ListCount <> 0 Then
        For ctr = 0 To (l_tmp_s.ListCount - 1)
            l_tmp_s.ListIndex = ctr
            If l_tmp_s.Text = dstr Then
                timer_sound.Enabled = True
                find_data.Enabled = False
            End If
        Next
    End If

No_read:
End Sub

Private Sub Form_Load()
On Error GoTo er:
    Dim db As String
    t_SN = Empty
    SID = 1
    rHandle = ACR120_Open(0, ACR120_COM_BAUDRATE_9600)

    db = "Provider=Microsoft.JET.OLEDB.4.0;Data Source= " & App.Path & "\db_book.mdb"
    Set db_cn = New ADODB.Connection
        db_cn.ConnectionString = db
        db_cn.CursorLocation = adUseClient
        db_cn.Open
    Set db_rs = New ADODB.Recordset
        db_rs.Open "Data_book", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
Exit Sub
er:
 MsgBox Err.Description, vbOKOnly, "Error"
End Sub

Private Sub Form_Unload(Cancel As Integer)
    retcode = ACR120_Close(rHandle)
End Sub

Private Sub l_name_Click()
    If Read_data.Enabled = False Then
        l_tmp.ListIndex = l_name.ListIndex
    Else
        l_name.ListIndex = -1
    End If
End Sub

Private Sub l_name_DblClick()
    If Read_data.Enabled = False And find_data.Enabled = False Then
        add_name_Click
    End If
End Sub

Private Sub l_name_s_DblClick()
    If Read_data.Enabled = False And find_data.Enabled = False Then
        unadd_Click
    End If
End Sub

Private Sub list_s_Click()
    Dim i As Integer
    Dim tmp_for As Integer
    Dim tmp_find As Integer
    Set db_rs = New ADODB.Recordset

    If list_s.ListIndex <= t_s(0) - 1 Then
        i = list_s.ListIndex
        db_rs.Open "Data_Book", db_cn, adOpenDynamic
    ElseIf list_s.ListIndex <= (t_s(1) + t_s(0)) - 1 Then
        i = (list_s.ListIndex - 1) - (t_s(0) - 1)
        db_rs.Open "Data_Book1", db_cn, adOpenDynamic
    Else
        i = (list_s.ListIndex - 1) - ((t_s(0) + t_s(1)) - 1)
        db_rs.Open "Data_Book2", db_cn, adOpenDynamic
    End If

    db_rs.MoveFirst

Do While (i <> -1)
    tmp_find = 0
    If type_s.ListIndex = 0 Then
        For tmp_for = 0 To Len(db_rs!ID_RFID)
            If Mid(key_s.Text, 1 + tmp_find, 1) = Mid(db_rs!ID_RFID, 1 + tmp_for, 1) Then
                If key_s = Mid(db_rs!ID_RFID, tmp_for + 1, Len(key_s)) Then
                    i = i - 1
                    tmp_for = Len(db_rs!ID_RFID)
                End If
            End If
        Next
    ElseIf type_s.ListIndex = 1 Then
        For tmp_for = 0 To Len(db_rs!Book_Title)
            If Mid(key_s.Text, 1 + tmp_find, 1) = Mid(db_rs!Book_Title, 1 + tmp_for, 1) Then
                If key_s = Mid(db_rs!Book_Title, tmp_for + 1, Len(key_s)) Then
                    i = i - 1
                    tmp_for = Len(db_rs!Book_Title)
                End If
            End If
        Next
    ElseIf type_s.ListIndex = 2 Then
        For tmp_for = 0 To Len(db_rs!Author_Book)
            If Mid(key_s.Text, 1 + tmp_find, 1) = Mid(db_rs!Author_Book, 1 + tmp_for, 1) Then
                If key_s = Mid(db_rs!Author_Book, tmp_for + 1, Len(key_s)) Then
                    i = i - 1
                    tmp_for = Len(db_rs!Author_Book)
                End If
            End If
        Next
    End If
    If (i <> -1) Then db_rs.MoveNext
Loop
End Sub

Private Sub list_s_DblClick()
    If Read_data.Enabled = False And find_data.Enabled = False Then
        add_s_Click
    End If
End Sub

Private Sub Read_data_Timer()
    Dim SerialNum(0 To 3) As Byte
    Dim Tag As Byte
    Dim RSn(0 To 3) As Byte
    Dim HaveTag As Boolean
    Dim tmpArray(0 To 9) As Byte
    Dim tmpbyte As Byte
    Dim SN As String
    Dim ctr As Integer
    Dim LogType As Byte
    Dim dataRead(0 To 15) As Byte
    Dim dstr As String
    Dim BLCK As Byte
    Dim Sec As Byte
    Dim t_search As String

    If tmp_time = 0 Then
        tmp_time = 1
        SerialNum(0) = 196
        SerialNum(1) = 11
        SerialNum(2) = 37
        SerialNum(3) = 137
    ElseIf tmp_time = 1 Then
        tmp_time = 3
        SerialNum(0) = 148
        SerialNum(1) = 109
        SerialNum(2) = 14
        SerialNum(3) = 137
    ElseIf tmp_time = 2 Then
        tmp_time = 4
        SerialNum(0) = 148
        SerialNum(1) = 68
        SerialNum(2) = 16
        SerialNum(3) = 137
    ElseIf tmp_time = 3 Then
        tmp_time = 2
        SerialNum(0) = 100
        SerialNum(1) = 158
        SerialNum(2) = 139
        SerialNum(3) = 135
    ElseIf tmp_time = 4 Then
        tmp_time = 0
        SerialNum(0) = 164
        SerialNum(1) = 134
        SerialNum(2) = 36
        SerialNum(3) = 137
    End If

    retcode = ACR120_MultiTagSelect(rHandle, SID, SerialNum(0), True, Tag, RSn(0))

    If retcode < 0 Then
        GoTo No_read:
    End If

    LogType = ACR120_LOGIN_KEYTYPE_AA
    pKey(0) = 255
    pKey(1) = 255
    pKey(2) = 255
    pKey(3) = 255
    pKey(4) = 255
    pKey(5) = 255

    Sec = 5
    retcode = ACR120_Login(rHandle, SID, Sec, LogType, 30, pKey(0))
    BLCK = 20

    retcode = ACR120_Read(rHandle, SID, BLCK, dataRead(0))

    dstr = Empty
    For ctr = 0 To 3
        dstr = dstr + Chr(dataRead(ctr))
    Next
    
    If l_tmp.ListCount <> 0 Then
        For ctr = 0 To (l_tmp.ListCount - 1)
            l_tmp.ListIndex = ctr
            If l_tmp.Text = dstr Then GoTo No_read:
        Next
    End If

    If Left(dstr, 1) = "0" Then
        t_search = "select * from Data_Book where ID_RFID = '" & dstr & "'"
    ElseIf Left(dstr, 1) = "1" Then
        t_search = "select * from Data_Book1 where ID_RFID = '" & dstr & "'"
    ElseIf Left(dstr, 1) = "2" Then
        t_search = "select * from Data_Book2 where ID_RFID = '" & dstr & "'"
    Else
        GoTo No_read
    End If

    Set db_rs = New ADODB.Recordset
        db_rs.Open t_search, db_cn, adOpenDynamic, adLockOptimistic
    On Error GoTo No_read:
    If db_rs!ID_RFID = dstr Then
        display
    End If
No_read:

End Sub

Private Sub display()
    Dim t_dis As String
    Dim tmp As Boolean
    Dim db_rs2 As ADODB.Recordset

    If db_rs!Status_Book = 1 Or db_rs!Status_Book = 3 Or db_rs!Status_Book = 5 Then
        db_rs!Status_Book = 4
        db_rs.Update
    End If
    l_name.AddItem (db_rs!ID_RFID & "   " & db_rs!Book_Title)
    l_tmp.AddItem (db_rs!ID_RFID)

    If sel = False Then
        Set db_rs2 = New ADODB.Recordset
            db_rs2.Open "Data_Year", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
            If db_rs2.BOF Then
                db_rs2.AddNew
                db_rs2!ID_RFID_Year = db_rs!ID_RFID
                db_rs2!Book_Title_Year = db_rs!Book_Title
                db_rs2.Update
            Else
                db_rs2.MoveFirst
                tmp = False
                Do While Not (db_rs2.EOF)
                    If db_rs2!ID_RFID_Year = db_rs!ID_RFID Then
                        tmp = True
                        db_rs2.MoveLast
                    End If
                    db_rs2.MoveNext
                Loop
                If tmp = False Then
                    db_rs2.AddNew
                    db_rs2!ID_RFID_Year = db_rs!ID_RFID
                    db_rs2!Book_Title_Year = db_rs!Book_Title
                    db_rs2.Update
                End If
            End If
        db_rs2.Close: Set db_rs2 = Nothing
    End If
    db_rs.Close: Set db_rs = Nothing
    l_name.ListIndex = -1

End Sub

Private Sub R_RFID_Click()
    If Read_data.Enabled = False Then
        sel = False
        f_select.Show (vbModal)
        data_year.Enabled = False
        S_earch.Enabled = False
        add_s.Enabled = False
        Read_data.Enabled = True
        OnOff_read.BackColor = &HFF00&
        add_name.Enabled = False
        unadd.Enabled = False
        R_RFID.Caption = "หยุดการทำงาน"
        find.Enabled = False
        t_SN = Empty
        l_tmp.Clear
        l_tmp_s.Clear
        l_name.Clear
        l_name_s.Clear
    Else
        data_year.Enabled = True
        S_earch.Enabled = True
        add_s.Enabled = True
        Read_data.Enabled = False
        OnOff_read.BackColor = &HFF&
        add_name.Enabled = True
        unadd.Enabled = True
        R_RFID.Caption = "เริ่มการทำงาน"
    End If
End Sub

Private Sub S_earch_Click()
    list_s.Clear
    Dim tmp_for As Integer
    Dim tmp_find As Integer
    Dim c As Integer
On Error GoTo er_s:
t_s(0) = 0
t_s(1) = 0
t_s(2) = 0
For c = 0 To 2
    Set db_rs = New ADODB.Recordset
    If c = 0 Then
        db_rs.Open "Data_Book", db_cn, adOpenDynamic
    ElseIf c = 1 Then
        db_rs.Open "Data_Book1", db_cn, adOpenDynamic
    ElseIf c = 2 Then
        db_rs.Open "Data_Book2", db_cn, adOpenDynamic
    End If
    db_rs.MoveFirst
    If key_s <> Empty Then
        Do While Not (db_rs.EOF)
            If type_s.ListIndex = 0 Then
                For tmp_for = 0 To Len(db_rs!ID_RFID)
                    If Mid(key_s.Text, 1 + tmp_find, 1) = Mid(db_rs!ID_RFID, 1 + tmp_for, 1) Then
                        If key_s = Mid(db_rs!ID_RFID, tmp_for + 1, Len(key_s)) Then
                            list_s.AddItem (db_rs!ID_RFID)
                            t_s(c) = t_s(c) + 1
                            GoTo next_end:
                        End If
                    End If
                Next
            ElseIf type_s.ListIndex = 1 Then
                For tmp_for = 0 To Len(db_rs!Book_Title)
                    If Mid(key_s.Text, 1 + tmp_find, 1) = Mid(db_rs!Book_Title, 1 + tmp_for, 1) Then
                        If key_s = Mid(db_rs!Book_Title, tmp_for + 1, Len(key_s)) Then
                            list_s.AddItem (db_rs!Book_Title)
                            t_s(c) = t_s(c) + 1
                            GoTo next_end:
                        End If
                    End If
                Next
            ElseIf type_s.ListIndex = 2 Then
                For tmp_for = 0 To Len(db_rs!Author_Book)
                    If Mid(key_s.Text, 1 + tmp_find, 1) = Mid(db_rs!Author_Book, 1 + tmp_for, 1) Then
                        If key_s = Mid(db_rs!Author_Book, tmp_for + 1, Len(key_s)) Then
                            list_s.AddItem (db_rs!Author_Book)
                            t_s(c) = t_s(c) + 1
                            GoTo next_end:
                        End If
                    End If
                Next
            End If
next_end:
            db_rs.MoveNext
        Loop
    End If
Next
er_s:
    db_rs.Close: Set db_rs = Nothing
End Sub

Private Sub timer_sound_Timer()
    WindowsMediaPlayer1.URL = App.Path & "\nudge.wma"
    MsgBox "เจอหนังสือในรายการค้นหา", vbInformation, "ค้นหา"
    timer_sound.Enabled = False
    find_data.Enabled = True
    t_SN = Empty
End Sub

Private Sub unadd_Click()

If l_name_s.ListIndex <> -1 Then
    l_tmp_s.RemoveItem (l_name_s.ListIndex)
    l_name_s.RemoveItem (l_name_s.ListIndex)
End If
If l_name_s.ListCount = 0 Then find.Enabled = False

End Sub

