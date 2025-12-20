VERSION 5.00
Begin VB.Form f_l_data 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "ตรวจสถานะ"
   ClientHeight    =   5130
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9735
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form5.frx":0000
   ScaleHeight     =   5130
   ScaleWidth      =   9735
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
      Left            =   480
      TabIndex        =   6
      Top             =   3600
      Width           =   1575
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
      ItemData        =   "Form5.frx":B644A
      Left            =   240
      List            =   "Form5.frx":B6457
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   2280
      Width           =   2055
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
      Left            =   480
      TabIndex        =   4
      Top             =   4320
      Width           =   1575
   End
   Begin VB.ListBox list_l 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4260
      Left            =   2760
      TabIndex        =   5
      Top             =   600
      Width           =   6735
   End
   Begin VB.CommandButton ok_l 
      Caption         =   "แสดงรายการ"
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
      Left            =   480
      TabIndex        =   3
      Top             =   2880
      Width           =   1575
   End
   Begin VB.ComboBox type_l 
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
      ItemData        =   "Form5.frx":B648A
      Left            =   240
      List            =   "Form5.frx":B649D
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   1440
      Width           =   2055
   End
   Begin VB.ComboBox status_l 
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
      ItemData        =   "Form5.frx":B64CB
      Left            =   240
      List            =   "Form5.frx":B64DE
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   600
      Width           =   2055
   End
End
Attribute VB_Name = "f_l_data"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim db_cn As ADODB.Connection
Dim db_rs As ADODB.Recordset

Private Sub back_menu_Click()
    Unload Me
End Sub

Private Sub Form_Load()
    Dim db As String

    db = "Provider=Microsoft.JET.OLEDB.4.0;Data Source= " & App.Path & "\db_book.mdb"
    Set db_cn = New ADODB.Connection
        db_cn.ConnectionString = db
        db_cn.CursorLocation = adUseClient
        db_cn.Open
    Set db_rs = New ADODB.Recordset
        db_rs.Open "Data_book", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable

    status_l.ListIndex = 0
    type_l.ListIndex = 0
    c_select.ListIndex = 0
End Sub

Private Sub ok_l_Click()
    db_rs.MoveFirst
    list_l.Clear
    Set db_rs = New ADODB.Recordset
    If c_select.ListIndex = 0 Then
        db_rs.Open "Data_book", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
    ElseIf c_select.ListIndex = 1 Then
        db_rs.Open "Data_book1", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
    ElseIf c_select.ListIndex = 2 Then
        db_rs.Open "Data_book2", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
    End If

    list_l.AddItem ("รายชื่อ" + type_l.Text + status_l.Text + "ของ" + c_select)
    Do While Not (db_rs.EOF)
        If db_rs!Status_Book = status_l.ListIndex + 1 Then
            If db_rs!Type_Book = type_l.ListIndex + 1 Or type_l.ListIndex = 4 Then
                list_l.AddItem (db_rs!ID_RFID & "  " & db_rs!Book_Title)
            End If
        End If
        db_rs.MoveNext
    Loop
    s_ave.Enabled = True
End Sub

Private Sub s_ave_Click()
    f_save2.Show (vbModal)
End Sub
