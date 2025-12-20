VERSION 5.00
Begin VB.Form f_l_data_year 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "สรุปยอด"
   ClientHeight    =   7215
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8655
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form9.frx":0000
   ScaleHeight     =   7215
   ScaleWidth      =   8655
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton s_ave 
      Caption         =   "บันทึก"
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
      Left            =   2280
      TabIndex        =   4
      Top             =   6000
      Width           =   1695
   End
   Begin VB.ComboBox c_select 
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
      ItemData        =   "Form9.frx":D7902
      Left            =   720
      List            =   "Form9.frx":D790F
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   960
      Width           =   2775
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
      Left            =   4680
      TabIndex        =   5
      Top             =   6000
      Width           =   1815
   End
   Begin VB.ListBox l_book 
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
      Left            =   720
      TabIndex        =   3
      Top             =   3840
      Width           =   7215
   End
   Begin VB.ListBox l_data_year 
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
      Left            =   4200
      TabIndex        =   2
      Top             =   840
      Width           =   3735
   End
   Begin VB.CommandButton ok_start 
      Caption         =   "เริ่มตรวจ"
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
      Left            =   1200
      TabIndex        =   1
      Top             =   1800
      Width           =   1815
   End
End
Attribute VB_Name = "f_l_data_year"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim db_cn As ADODB.Connection
Dim db_rs As ADODB.Recordset

Private Sub back_menu_Click()
    Unload Me
End Sub

Private Sub c_select_Click()
    l_data_year.Clear
    l_book.Clear
End Sub

Private Sub Form_Load()
On Error GoTo er:
    Dim db As String
    c_select.ListIndex = 0
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

Private Sub l_data_year_Click()
    Dim tmp_find As Boolean
    Dim db_rs2 As ADODB.Recordset
    Set db_rs = New ADODB.Recordset
        If c_select.ListIndex = 0 Then
            db_rs.Open "Data_Book", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
        ElseIf c_select.ListIndex = 1 Then
            db_rs.Open "Data_Book1", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
        ElseIf c_select.ListIndex = 2 Then
            db_rs.Open "Data_Book2", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
        End If
        db_rs.MoveFirst
    Set db_rs2 = New ADODB.Recordset
        db_rs2.Open "Data_Year", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
    
    l_book.Clear
    s_ave.Enabled = False
    If l_data_year.ListIndex = 0 Then
        l_book.AddItem ("รายชื่อหนังสือหาย  " + c_select.Text)
        s_ave.Enabled = True
        Do While Not (db_rs.EOF)
            If db_rs!Status_Book = 3 Then
                l_book.AddItem (db_rs!ID_RFID & "   " & db_rs!Book_Title)
            ElseIf db_rs!Status_Book = 2 Or db_rs!Status_Book = 4 Then
                db_rs2.MoveFirst
                tmp_find = False
                Do While Not (db_rs2.EOF)
                    If db_rs!ID_RFID = db_rs2!ID_RFID_Year Then
                        db_rs2.MoveLast
                        tmp_find = True
                    End If
                    db_rs2.MoveNext
                Loop
                If tmp_find = False Then
                    l_book.AddItem (db_rs!ID_RFID & "   " & db_rs!Book_Title)
                End If
            End If
            db_rs.MoveNext
        Loop
    ElseIf l_data_year.ListIndex = 1 Then
        l_book.AddItem ("รายชื่อหนังสือถูกยืม  " + c_select.Text)
        s_ave.Enabled = True
        Do While Not (db_rs.EOF)
            If db_rs!Status_Book = 1 Then
                l_book.AddItem (db_rs!ID_RFID & "   " & db_rs!Book_Title)
            End If
            db_rs.MoveNext
        Loop
    ElseIf l_data_year.ListIndex = 2 Then
        l_book.AddItem ("รายชื่อหนังสือส่งซ่อม  " + c_select.Text)
        s_ave.Enabled = True
        Do While Not (db_rs.EOF)
            If db_rs!Status_Book = 5 Then
                l_book.AddItem (db_rs!ID_RFID & "   " & db_rs!Book_Title)
            End If
            db_rs.MoveNext
        Loop
    End If
End Sub

Private Sub ok_start_Click()
    Dim db_rs2 As ADODB.Recordset
    Dim status1 As Integer
    Dim status2 As Integer
    Dim status3 As Integer
    Dim all_Book As Integer
    Dim tmp_find As Boolean
    status1 = 0
    status2 = 0
    status3 = 0
    all_Book = 0

On Error GoTo er:
    l_data_year.Clear
    Set db_rs = New ADODB.Recordset
        If c_select.ListIndex = 0 Then
            db_rs.Open "Data_Book", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
        ElseIf c_select.ListIndex = 1 Then
            db_rs.Open "Data_Book1", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
        ElseIf c_select.ListIndex = 2 Then
            db_rs.Open "Data_Book2", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
        End If
        db_rs.MoveFirst
    Set db_rs2 = New ADODB.Recordset
        db_rs2.Open "Data_Year", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable

    
    Do While Not (db_rs.EOF)
        db_rs2.MoveFirst
        tmp_find = False
        Do While Not (db_rs2.EOF)
            If db_rs!ID_RFID = db_rs2!ID_RFID_Year Then
                tmp_find = True
                db_rs2.MoveLast
            End If
            db_rs2.MoveNext
        Loop
        If tmp_find = False Then
            If db_rs!Status_Book = 1 Then
                status1 = status1 + 1
            ElseIf db_rs!Status_Book = 2 Or db_rs!Status_Book = 3 Or db_rs!Status_Book = 4 Then
                status2 = status2 + 1
            ElseIf db_rs!Status_Book = 5 Then
                status3 = status3 + 1
            End If
        End If
        db_rs.MoveNext
        all_Book = all_Book + 1
    Loop

    l_data_year.AddItem ("หนังสือหาย            " & status2)
    l_data_year.AddItem ("หนังสือถูกยืม         " & status1)
    l_data_year.AddItem ("หนังสือส่งซ่อม        " & status3)
    l_data_year.AddItem ("หนังสือคงอยู่          " & all_Book - (status1 + status2 + status3))
    l_data_year.AddItem ("- - - - - - - - - - - - - - - - - - - - - - - - - - -")
    l_data_year.AddItem ("รวมทั้งหมด           " & all_Book)
er:
    db_rs.Close: Set db_rs = Nothing
    db_rs2.Close: Set db_rs = Nothing

End Sub

Private Sub s_ave_Click()
    f_save.Show (vbModal)
End Sub
