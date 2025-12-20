VERSION 5.00
Begin VB.Form f_a_data 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "เพิ่มข้อมูล"
   ClientHeight    =   5535
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9735
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form2.frx":0000
   ScaleHeight     =   5535
   ScaleWidth      =   9735
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
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
      TabIndex        =   6
      Top             =   3480
      Width           =   5535
   End
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
      TabIndex        =   4
      Top             =   2640
      Width           =   5535
   End
   Begin VB.ComboBox c_status_b 
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
      ItemData        =   "Form2.frx":1332DA
      Left            =   6480
      List            =   "Form2.frx":1332ED
      Style           =   2  'Dropdown List
      TabIndex        =   7
      Top             =   3480
      Width           =   2535
   End
   Begin VB.ComboBox c_type 
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
      ItemData        =   "Form2.frx":13330F
      Left            =   6480
      List            =   "Form2.frx":13331F
      Style           =   2  'Dropdown List
      TabIndex        =   5
      Top             =   2640
      Width           =   2535
   End
   Begin VB.CommandButton add_cancel 
      Caption         =   "ยกเลิก"
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
   Begin VB.Timer add_data 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   0
      Top             =   0
   End
   Begin VB.CommandButton a_RFID 
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
   Begin VB.CommandButton add_ok 
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
      TabIndex        =   2
      Top             =   1800
      Width           =   2295
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
      TabIndex        =   3
      Top             =   1800
      Width           =   5775
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
      TabIndex        =   1
      Top             =   960
      Width           =   5775
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
   Begin VB.Shape OnOff_add 
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
Attribute VB_Name = "f_a_data"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim db_cn As ADODB.Connection
Dim db_rs As ADODB.Recordset

Private Sub add_cancel_Click()
    I_D.Text = Empty
    ISBN.Text = Empty
    N_ame.Text = Empty
    Author.Text = Empty
    Location.Text = Empty
    Detail.Text = Empty
    a_RFID.Enabled = True
    add_ok.Enabled = False
End Sub

Private Sub add_ok_Click()
    If I_D.Text <> Empty And ISBN.Text <> Empty And N_ame.Text <> Empty And Author.Text <> Empty And Detail.Text <> Empty Then
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
           MsgBox "กรุณานำ Tag วางบนเครื่องอ่าน", vbCritical, "ต่อติด Tag ไม่ได้"
        ElseIf MsgBox("ยืนยันการเพิ่มข้อมูลกด OK" + vbCrLf + "     ยกเลิกกด Cancel", vbOKCancel + vbExclamation, "ยืนยันการเพิ่มข้อมูล") = vbOK Then
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
            dout(0) = Asc(Mid(I_D, 1, 1))
            dout(1) = Asc(Mid(I_D, 2, 1))
            dout(2) = Asc(Mid(I_D, 3, 1))
            dout(3) = Asc(Mid(I_D, 4, 1))
            retcode = ACR120_Write(rHandle, SID, BLCK, dout(0))
        
            Set db_rs = New ADODB.Recordset
                If sel2 = 0 Then
                    db_rs.Open "Data_book", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
                ElseIf sel2 = 1 Then
                    db_rs.Open "Data_book1", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
                ElseIf sel2 = 2 Then
                    db_rs.Open "Data_book2", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
                End If
            db_rs.AddNew
            db_rs!ID_RFID = I_D.Text
            db_rs!ISBN = ISBN.Text
            db_rs!Book_Title = N_ame.Text
            db_rs!Author_Book = Author.Text
            db_rs!Type_Book = c_type.ListIndex + 1
            db_rs!Status_Book = c_status_b.ListIndex + 1
            db_rs!Location_Book = Location.Text
            db_rs!Detail_Book = Detail.Text
            db_rs.Update
            db_rs.Close: Set db_rs = Nothing
            Unload Me
            Me.Show
        End If
    Else
        MsgBox "กรุณาใส่ข้อมูลให้ครบทุกช่อง", vbCritical, "Error"
    End If
End Sub

Private Sub back_menu_Click()
    Unload Me
End Sub

Private Sub Form_Load()
On Error GoTo er:
    Dim db As String
    c_type.ListIndex = 0
    c_status_b.ListIndex = 0
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

Private Sub add_data_Timer()
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
    Dim t_add As String
    Dim tmpID As String
    Dim t_ID As Integer

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
    If dstr = "9999" Then
        GoTo add_id
    End If
    
    If Left(dstr, 1) = "0" Then
        t_add = "select * from Data_Book where ID_RFID = '" & dstr & "'"
    ElseIf Left(dstr, 1) = "1" Then
        t_add = "select * from Data_Book1 where ID_RFID = '" & dstr & "'"
    ElseIf Left(dstr, 1) = "2" Then
        t_add = "select * from Data_Book2 where ID_RFID = '" & dstr & "'"
    Else
        GoTo No_read
    End If

    Set db_rs = New ADODB.Recordset
        db_rs.Open t_add, db_cn, adOpenDynamic
    On Error GoTo add_id:
        If (db_rs!ID_RFID) = dstr Then
            MsgBox "Tag ในหนังสือนี้ได้ถูกใช้แล้ว", vbCritical, "Error"
            a_RFID_Click
            GoTo No_read:
        End If
add_id:
    t_ID = 1
    f_select_library.Show (vbModal)

    Set db_rs = New ADODB.Recordset
        If sel2 = 0 Then
            db_rs.Open "Data_book", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
        ElseIf sel2 = 1 Then
            db_rs.Open "Data_book1", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
        ElseIf sel2 = 2 Then
            db_rs.Open "Data_book2", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
        End If
        db_rs.MoveFirst

    tmpID = Empty
    If sel2 = 0 Then
        tmpID = "0"
    ElseIf sel2 = 1 Then
        tmpID = "1"
    ElseIf sel2 = 2 Then
        tmpID = "2"
    End If
    For ctr = 0 To (2 - Len(CStr(t_ID)))
        tmpID = tmpID & "0"
    Next
    tmpID = tmpID & CStr(t_ID)

Do While Not (db_rs.EOF)
    If db_rs!ID_RFID = tmpID Then
        t_ID = t_ID + 1
        tmpID = Empty
        If sel2 = 0 Then
        tmpID = "0"
        ElseIf sel2 = 1 Then
            tmpID = "1"
        ElseIf sel2 = 2 Then
            tmpID = "2"
        End If
        For ctr = 0 To (2 - Len(CStr(t_ID)))
            tmpID = tmpID & "0"
        Next
        tmpID = tmpID & CStr(t_ID)
        db_rs.MoveFirst
    End If
    db_rs.MoveNext
Loop

next_add:
    I_D.Text = tmpID
    a_RFID_Click
    a_RFID.Enabled = False
    add_ok.Enabled = True
    db_rs.Close: Set db_rs = Nothing
No_read:

End Sub

Private Sub a_RFID_Click()
    If add_data.Enabled = False Then
        add_data.Enabled = True
        OnOff_add.BackColor = &HFF00&
    Else
        add_data.Enabled = False
        OnOff_add.BackColor = &HFF&
    End If
End Sub
