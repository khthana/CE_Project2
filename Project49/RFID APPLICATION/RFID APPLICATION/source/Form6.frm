VERSION 5.00
Begin VB.Form f_read 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "แสดงที่อยู่"
   ClientHeight    =   2655
   ClientLeft      =   2790
   ClientTop       =   930
   ClientWidth     =   4710
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   9.75
      Charset         =   222
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form6.frx":0000
   ScaleHeight     =   2655
   ScaleWidth      =   4710
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
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
      Left            =   840
      TabIndex        =   1
      Top             =   1680
      Width           =   1455
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
      Left            =   2520
      TabIndex        =   2
      Top             =   1680
      Width           =   1455
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
      Left            =   480
      Locked          =   -1  'True
      TabIndex        =   0
      Top             =   720
      Width           =   3735
   End
   Begin VB.Timer Read_data 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   0
      Top             =   0
   End
   Begin VB.Shape OnOff_read 
      BackColor       =   &H000000FF&
      BackStyle       =   1  'Opaque
      FillColor       =   &H000000FF&
      Height          =   135
      Left            =   600
      Shape           =   3  'Circle
      Top             =   1845
      Width           =   135
   End
End
Attribute VB_Name = "f_read"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim db_cn As ADODB.Connection
Dim db_rs As ADODB.Recordset
Dim t_SN As String

Private Sub back_menu_Click()
    Unload Me
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
    If Left(db_rs!ID_RFID, 1) = "0" Then
        Location.Text = "หอสมุดกลาง"
    ElseIf Left(db_rs!ID_RFID, 1) = "1" Then
        Location.Text = "คณะวิศวกรรมศาสตร์"
    ElseIf Left(db_rs!ID_RFID, 1) = "2" Then
        Location.Text = "คณะวิทยาศาสตร์"
    End If
    Location.Text = Location.Text & "  " & db_rs!Location_Book
    db_rs.Close: Set db_rs = Nothing
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
    End If
No_read:

End Sub

