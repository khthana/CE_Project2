VERSION 5.00
Begin VB.Form f_d_data 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "ลบข้อมูล"
   ClientHeight    =   9390
   ClientLeft      =   2790
   ClientTop       =   930
   ClientWidth     =   9705
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form4.frx":0000
   ScaleHeight     =   9390
   ScaleWidth      =   9705
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Location 
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
      Locked          =   -1  'True
      TabIndex        =   4
      Top             =   2640
      Width           =   5535
   End
   Begin VB.TextBox Detail 
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
      Locked          =   -1  'True
      TabIndex        =   6
      Top             =   3480
      Width           =   5535
   End
   Begin VB.TextBox S_tatus 
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
      Left            =   6480
      Locked          =   -1  'True
      TabIndex        =   7
      Top             =   3480
      Width           =   2535
   End
   Begin VB.TextBox T_ype 
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
      Left            =   6480
      Locked          =   -1  'True
      TabIndex        =   5
      Top             =   2640
      Width           =   2535
   End
   Begin VB.Timer Read_data 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   0
      Top             =   0
   End
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
      Left            =   6720
      TabIndex        =   11
      Top             =   4320
      Width           =   1335
   End
   Begin VB.TextBox I_D 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   600
      Locked          =   -1  'True
      TabIndex        =   0
      Top             =   960
      Width           =   2295
   End
   Begin VB.TextBox N_ame 
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
      Left            =   3240
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   960
      Width           =   5775
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
      TabIndex        =   12
      Top             =   6240
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
      Left            =   960
      TabIndex        =   14
      Top             =   8040
      Width           =   1455
   End
   Begin VB.TextBox Author 
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
      Left            =   3240
      Locked          =   -1  'True
      TabIndex        =   3
      Top             =   1800
      Width           =   5775
   End
   Begin VB.TextBox ISBN 
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
      Locked          =   -1  'True
      TabIndex        =   2
      Top             =   1800
      Width           =   2295
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
      ItemData        =   "Form4.frx":1332DA
      Left            =   480
      List            =   "Form4.frx":1332E7
      Style           =   2  'Dropdown List
      TabIndex        =   13
      Top             =   7200
      Width           =   2415
   End
   Begin VB.CommandButton R_RFID 
      Caption         =   "อ่าน RFID"
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
      Left            =   1680
      TabIndex        =   8
      Top             =   4320
      Width           =   1335
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
      Height          =   2460
      Left            =   3240
      TabIndex        =   15
      Top             =   6240
      Width           =   5895
   End
   Begin VB.CommandButton edit_cancel 
      Caption         =   "ยกเลิก"
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
      Left            =   5040
      TabIndex        =   10
      Top             =   4320
      Width           =   1335
   End
   Begin VB.CommandButton edit_ok 
      Caption         =   "ยืนยัน"
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
      Left            =   3360
      TabIndex        =   9
      Top             =   4320
      Width           =   1335
   End
   Begin VB.Shape OnOff_read 
      BackColor       =   &H000000FF&
      BackStyle       =   1  'Opaque
      FillColor       =   &H000000FF&
      Height          =   135
      Left            =   1440
      Shape           =   3  'Circle
      Top             =   4500
      Width           =   135
   End
End
Attribute VB_Name = "f_d_data"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim db_cn As ADODB.Connection
Dim db_rs As ADODB.Recordset
Dim t_s(3) As Integer

Private Sub back_menu_Click()
    Unload Me
End Sub

Private Sub edit_cancel_Click()
    I_D.Text = Empty
    ISBN.Text = Empty
    N_ame.Text = Empty
    Author.Text = Empty
    Location.Text = Empty
    Detail.Text = Empty
    T_ype.Text = Empty
    S_tatus.Text = Empty
    edit_ok.Enabled = False
    edit_cancel.Enabled = False
End Sub

Private Sub edit_ok_Click()
    Dim t_edit As String
    Dim HaveTag As Boolean
    Dim tmpArray(0 To 9) As Byte
    Dim tmpbyte As Byte
    Dim SN As String
    Dim ctr As Integer
    Dim LogType As Byte
    Dim BLCK As Byte
    Dim dout(0 To 15) As Byte
    
    retcode = ACR120_Select(rHandle, SID, False, tmpbyte, tmpArray(0))

    If retcode < 0 Then
       If MsgBox("ต้องการลบแบบไม่ติดต่อ Tag กด OK" + vbCrLf + "           ยกเลิกกด Cancel", vbOKCancel + vbCritical, "ต่อติด Tag ไม่ได้") = vbOK Then GoTo no_tag:
    ElseIf MsgBox("ต้องการลบข้อมูลกด OK" + vbCrLf + "   ยกเลิกกด Cancel", vbOKCancel + vbExclamation, "ยืนยันการลบข้อมูล") = vbOK Then
        If HaveTag = True Then
            If tmpbyte = 4 Or tmpbyte = 5 Then
                SN = ""
                For ctr = 0 To 6
                    SN = SN + Hex(tmpArray(ctr)) + " "
                Next
            Else
                SN = ""
                For ctr = 0 To 3
                    SN = SN + Hex(tmpArray(ctr)) + " "
                Next
            End If
        Else
            SN = ""
            For ctr = 0 To tmpbyte - 1
                SN = SN + Hex(tmpArray(ctr)) + " "
            Next
        End If

        LogType = ACR120_LOGIN_KEYTYPE_AA
        pKey(0) = 255
        pKey(1) = 255
        pKey(2) = 255
        pKey(3) = 255
        pKey(4) = 255
        pKey(5) = 255
        Sec = 5
        retcode = ACR120_Login(rHandle, SID, Sec, LogType, 0, pKey(0))
        BLCK = 20
        dout(0) = 57
        dout(1) = 57
        dout(2) = 57
        dout(3) = 57
        retcode = ACR120_Write(rHandle, SID, BLCK, dout(0))
no_tag:
        If Left(I_D, 1) = "0" Then
            t_edit = "select * from Data_Book where ID_RFID = '" & I_D & "'"
        ElseIf Left(I_D, 1) = "1" Then
            t_edit = "select * from Data_Book1 where ID_RFID = '" & I_D & "'"
        ElseIf Left(I_D, 1) = "2" Then
            t_edit = "select * from Data_Book2 where ID_RFID = '" & I_D & "'"
        End If

        Set db_rs = New ADODB.Recordset
            db_rs.Open t_edit, db_cn, adOpenDynamic, adLockOptimistic
        db_rs.Delete
        db_rs.Close: Set db_rs = Nothing
        Unload Me
        Me.Show
    End If
End Sub

Private Sub Form_Load()
On Error GoTo er:
    Dim db As String
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

Private Sub display()
    Dim t_dis As String

    I_D.Text = db_rs!ID_RFID
    ISBN.Text = db_rs!ISBN
    N_ame.Text = db_rs!Book_Title
    Author.Text = db_rs!Author_Book
    T_ype.Text = db_rs!Type_Book
    S_tatus.Text = db_rs!Status_Book
    If Left(db_rs!ID_RFID, 1) = "0" Then
        Location.Text = "หอสมุดกลาง"
    ElseIf Left(db_rs!ID_RFID, 1) = "1" Then
        Location.Text = "คณะวิศวกรรมศาสตร์"
    ElseIf Left(db_rs!ID_RFID, 1) = "2" Then
        Location.Text = "คณะวิทยาศาสตร์"
    End If
    Location.Text = Location.Text & "  " & db_rs!Location_Book
    Detail.Text = db_rs!Detail_Book
    db_rs.Close: Set db_rs = Nothing
    
    t_dis = "select * from Type_B where TypeBook = " & T_ype.Text
    Set db_rs = New ADODB.Recordset
        db_rs.Open t_dis, db_cn, adOpenDynamic
    T_ype.Text = db_rs!TypeName
    db_rs.Close: Set db_rs = Nothing
    
    t_dis = "select * from Status_B where StatusBook = " & S_tatus.Text
    Set db_rs = New ADODB.Recordset
        db_rs.Open t_dis, db_cn, adOpenDynamic
    S_tatus.Text = db_rs!StatusName
    db_rs.Close: Set db_rs = Nothing

    edit_ok.Enabled = True
    edit_cancel.Enabled = True
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
    display
End Sub
Private Sub R_RFID_Click()
    If Read_data.Enabled = False Then
        Read_data.Enabled = True
        OnOff_read.BackColor = &HFF00&
    Else
        Read_data.Enabled = False
        OnOff_read.BackColor = &HFF&
    End If
End Sub

Private Sub Read_data_Timer()
    Dim HaveTag As Boolean
    Dim tmpArray(0 To 9) As Byte
    Dim tmpbyte As Byte
    Dim SN As String
    Dim t_SN As String
    Dim ctr As Integer
    Dim LogType As Byte
    Dim dataRead(0 To 15) As Byte
    Dim dstr As String
    Dim BLCK As Byte
    Dim Sec As Byte
    Dim t_search As String

    retcode = ACR120_Select(rHandle, SID, False, tmpbyte, tmpArray(0))

    If retcode < 0 Then
        GoTo No_read:
    Else
        If HaveTag = True Then
            If tmpbyte = 4 Or tmpbyte = 5 Then
                SN = ""
                For ctr = 0 To 6
                    SN = SN + Hex(tmpArray(ctr)) + " "
                Next
            Else
                SN = ""
                For ctr = 0 To 3
                    SN = SN + Hex(tmpArray(ctr)) + " "
                Next
            End If
        Else
            SN = ""
            For ctr = 0 To tmpbyte - 1
                SN = SN + Hex(tmpArray(ctr)) + " "
            Next
        End If
    End If

    If t_SN = SN Then GoTo No_read

    t_SN = SN
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
    
    For ctr = 0 To 3
        dstr = dstr + Chr(dataRead(ctr))
    Next

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
        db_rs.Open t_search, db_cn, adOpenDynamic
    On Error GoTo No_read:
    If db_rs!ID_RFID = dstr Then
        display
        R_RFID_Click
    End If
No_read:

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


