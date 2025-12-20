VERSION 5.00
Begin VB.Form f_select 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "รูปแบบการบันทึก"
   ClientHeight    =   2190
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5775
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form10.frx":0000
   ScaleHeight     =   2190
   ScaleWidth      =   5775
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton no_w 
      Caption         =   "ไม่บันทึก"
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
      Left            =   3960
      TabIndex        =   2
      Top             =   1080
      Width           =   1455
   End
   Begin VB.CommandButton con 
      Caption         =   "ต่อเนื่อง"
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
      Left            =   2160
      TabIndex        =   1
      Top             =   1080
      Width           =   1455
   End
   Begin VB.CommandButton new_start 
      Caption         =   "เริ่มต้นใหม่"
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
      Left            =   360
      TabIndex        =   0
      Top             =   1080
      Width           =   1455
   End
End
Attribute VB_Name = "f_select"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim db_cn As ADODB.Connection
Dim db_rs As ADODB.Recordset

Private Sub con_Click()
    Unload Me
End Sub


Private Sub Form_Load()

End Sub

Private Sub new_start_Click()
    Dim db As String
    db = "Provider=Microsoft.JET.OLEDB.4.0;Data Source= " & App.Path & "\db_book.mdb"
    Set db_cn = New ADODB.Connection
        db_cn.ConnectionString = db
        db_cn.CursorLocation = adUseClient
        db_cn.Open
    Set db_rs = New ADODB.Recordset
        db_rs.Open "Data_Year", db_cn, adOpenDynamic, adLockOptimistic, adCmdTable
    Do While Not (db_rs.EOF)
        db_rs.MoveFirst
        db_rs.Delete
        db_rs.MoveNext
    Loop
        db_rs.Close: Set db_rs = Nothing
    Unload Me
End Sub

Private Sub no_w_Click()
    sel = True
    Unload Me
End Sub
