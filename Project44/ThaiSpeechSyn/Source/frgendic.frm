VERSION 5.00
Begin VB.Form frgendic 
   AutoRedraw      =   -1  'True
   BackColor       =   &H0080C0FF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Dictionary Generator"
   ClientHeight    =   2805
   ClientLeft      =   4095
   ClientTop       =   3825
   ClientWidth     =   6750
   Icon            =   "frgendic.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2805
   ScaleWidth      =   6750
   Visible         =   0   'False
   Begin VB.TextBox txtgsym 
      Enabled         =   0   'False
      Height          =   315
      Left            =   2280
      TabIndex        =   3
      Top             =   960
      Width           =   3735
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H0080C0FF&
      Height          =   855
      Left            =   120
      TabIndex        =   2
      Top             =   1800
      Width           =   6495
      Begin VB.CommandButton cmdclear 
         Caption         =   "Clear"
         Height          =   495
         Left            =   4080
         TabIndex        =   9
         Top             =   240
         Width           =   1095
      End
      Begin VB.CommandButton cmdexit 
         Caption         =   "Exit"
         Height          =   495
         Left            =   5280
         TabIndex        =   8
         Top             =   240
         Width           =   1095
      End
      Begin VB.CommandButton cmdadddb 
         Caption         =   "Add to DB"
         Enabled         =   0   'False
         Height          =   495
         Left            =   2520
         TabIndex        =   7
         Top             =   240
         Width           =   1095
      End
      Begin VB.CommandButton cmdedit 
         Caption         =   "Edit Symbol"
         Enabled         =   0   'False
         Height          =   495
         Left            =   1320
         TabIndex        =   6
         Top             =   240
         Width           =   1095
      End
      Begin VB.CommandButton cmdgen 
         Caption         =   "Generate"
         Height          =   495
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.TextBox txtgwd 
      Height          =   315
      Left            =   2280
      TabIndex        =   0
      Top             =   300
      Width           =   3735
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackColor       =   &H0080C0FF&
      Caption         =   "สัญลักษณ์แทนเสียง : "
      Height          =   210
      Left            =   720
      TabIndex        =   4
      Top             =   1080
      Width           =   1380
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H0080C0FF&
      Caption         =   "คำที่ต้องการเพิ่ม : "
      Height          =   210
      Left            =   960
      TabIndex        =   1
      Top             =   360
      Width           =   1260
   End
End
Attribute VB_Name = "frgendic"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdadddb_Click()
Dim Result As VbMsgBoxResult
Dim RS As Recordset
Dim SqlCmd As String
Dim Word As String
Dim Symbol As String
    
    Word = txtgwd.Text
    Symbol = txtgsym.Text
    Result = MsgBox("คุณต้องการเพิ่มคำนี้ลงใน Database ใช่หรือไม่", vbYesNo, "เพิ่มคำศัพท์")
    If Result = vbYes Then
        Set RS = New Recordset
        Set RS = Nothing
        SqlCmd = "SELECT WORD From tblDict WHERE WORD = '" & Word & "';"
        Set RS = Con.Execute(SqlCmd)
        
        If RS.BOF = False Then
            Result = MsgBox("คำนี้มีอยู่ใน Database แล้วคุณต้องการแก้ไขใช่หรือไม่", vbYesNo, "เพิ่มคำศัพท์")
            If Result = vbYes Then
                SqlCmd = "UPDATE tblDict SET SYMBOL = '" & Symbol & "' WHERE WORD = '" & Word & "';"
                Con.Execute (SqlCmd)
            End If
        ElseIf RS.BOF = True Then
            SqlCmd = "INSERT INTO tblDict (WORD, SYMBOL) VALUES ('" & Word & "', '" & Symbol & "');"
            Con.Execute (SqlCmd)
        End If
    End If
End Sub

Private Sub cmdclear_Click()
    txtgwd.Text = ""
    txtgsym.Text = ""
    txtgsym.Enabled = False
    cmdadddb.Enabled = False
    cmdedit.Caption = "Edit Symbol"
    cmdedit.Enabled = False
    txtgwd.SetFocus
End Sub

Private Sub cmdedit_Click()
    If cmdedit.Caption = "Edit Symbol" Then
        txtgsym.Enabled = True
        txtgsym.SetFocus
        cmdedit.Caption = "Update Symbol"
        cmdadddb.Enabled = False
    Else
        txtgsym.Enabled = False
        cmdedit.Caption = "Edit Symbol"
        cmdadddb.Enabled = True
    End If
End Sub

Private Sub cmdexit_Click()
    Unload Me
End Sub

Private Sub cmdgen_Click()
Dim Symbol As String, Word As String
Dim i As Integer
    
    If txtgwd.Text = "" Then
        MsgBox "โปรดใส่ข้อความที่ต้องการเพิ่ม", vbOKOnly, "มีข้อผิดพลาด!"
        txtgwd.SetFocus
        Exit Sub
    Else
        gendic txtgwd.Text, Word, Symbol
    End If
    i = Len(Symbol) - 1
    Symbol = Left(Symbol, i)
    txtgsym.Text = Symbol
    cmdedit.Enabled = True
    cmdadddb.Enabled = True
End Sub
