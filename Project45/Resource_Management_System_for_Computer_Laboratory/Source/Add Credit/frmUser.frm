VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "Richtx32.ocx"
Begin VB.Form frmUser 
   BackColor       =   &H000B0091&
   Caption         =   "Add Credits"
   ClientHeight    =   4485
   ClientLeft      =   3075
   ClientTop       =   3120
   ClientWidth     =   8295
   Icon            =   "frmUser.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   4485
   ScaleWidth      =   8295
   Begin VB.CommandButton btnPrint 
      Caption         =   "Print"
      Height          =   435
      Left            =   5880
      TabIndex        =   11
      Top             =   3720
      Width           =   1065
   End
   Begin VB.CommandButton btnDelete 
      Caption         =   "Delete"
      Height          =   375
      Left            =   6960
      TabIndex        =   0
      Top             =   1560
      Width           =   735
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "Cancel"
      Enabled         =   0   'False
      Height          =   375
      Left            =   6360
      TabIndex        =   1
      Top             =   1560
      Width           =   615
   End
   Begin VB.CommandButton btnSave 
      Caption         =   "Save"
      Enabled         =   0   'False
      Height          =   375
      Left            =   5760
      TabIndex        =   2
      Top             =   1560
      Width           =   615
   End
   Begin VB.CommandButton btnEdit 
      Caption         =   "Edit"
      Height          =   375
      Left            =   5160
      TabIndex        =   3
      Top             =   1560
      Width           =   615
   End
   Begin VB.TextBox txtUsername 
      Height          =   375
      Left            =   6000
      TabIndex        =   7
      Top             =   600
      Width           =   1695
   End
   Begin VB.TextBox txtCredit 
      Height          =   375
      Left            =   6000
      TabIndex        =   6
      Top             =   1080
      Width           =   1695
   End
   Begin VB.CommandButton btnClose 
      Caption         =   "Close"
      Height          =   435
      Left            =   6960
      TabIndex        =   5
      Top             =   3720
      Width           =   1035
   End
   Begin VB.CommandButton btnAdd 
      Caption         =   "Add"
      Height          =   375
      Left            =   4560
      TabIndex        =   4
      Top             =   1560
      Width           =   615
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid Grid1 
      Height          =   3495
      Left            =   480
      TabIndex        =   8
      Top             =   480
      Width           =   3375
      _ExtentX        =   5953
      _ExtentY        =   6165
      _Version        =   393216
      FixedCols       =   0
      FocusRect       =   0
      FillStyle       =   1
      SelectionMode   =   1
      AllowUserResizing=   1
      _NumberOfBands  =   1
      _Band(0).Cols   =   2
   End
   Begin MSComDlg.CommonDialog PrintDlg 
      Left            =   4800
      Top             =   3960
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
   End
   Begin RichTextLib.RichTextBox rtf 
      Height          =   2655
      Left            =   4800
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   3960
      Visible         =   0   'False
      Width           =   3255
      _ExtentX        =   5741
      _ExtentY        =   4683
      _Version        =   393217
      BackColor       =   16777215
      ScrollBars      =   3
      Appearance      =   0
      RightMargin     =   7000
      TextRTF         =   $"frmUser.frx":030A
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Shape Shape4 
      BackColor       =   &H00E0E0E0&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00404040&
      BorderWidth     =   2
      Height          =   3735
      Left            =   360
      Top             =   360
      Width           =   3615
   End
   Begin VB.Label Label1 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Username"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   375
      Left            =   4560
      TabIndex        =   10
      Top             =   600
      Width           =   1215
   End
   Begin VB.Label Label2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Credit"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000D&
      Height          =   375
      Left            =   4560
      TabIndex        =   9
      Top             =   1080
      Width           =   1215
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00E0E0E0&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00404040&
      BorderWidth     =   2
      Height          =   1935
      Left            =   4320
      Top             =   360
      Width           =   3735
   End
   Begin VB.Shape Shape3 
      BackColor       =   &H00C0FFFF&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00FF0000&
      BorderWidth     =   2
      Height          =   4215
      Left            =   120
      Top             =   120
      Width           =   8055
   End
End
Attribute VB_Name = "frmUser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private CurrentUsername As String
Private NewUsername As String
Private Credit As Integer
Private Adding As Boolean
Private Editing As Boolean

Private Sub Set_Lock(ByVal m As Boolean) ' True = View Mode , False = Edit Mode
  Grid1.Enabled = m
  txtUsername.Locked = m
  txtCredit.Locked = m
  btnAdd.Enabled = m
  btnEdit.Enabled = m
  btnSave.Enabled = Not m
  btnCancel.Enabled = Not m
  btnDelete.Enabled = m
  btnClose.Enabled = m
End Sub

Public Sub Clear_All()
  txtUsername.Text = ""
  txtCredit.Text = "0"
End Sub

Public Sub Reload()
  sql = "SELECT * FROM print_credit ORDER BY 1 "
  OpenRst sql
  Set Grid1.DataSource = Rst
  Grid1_RowColChange
End Sub

Private Sub btnAdd_Click()
  Adding = True
  Set_Lock False
  Clear_All
  Debug.Print txtUsername.Enabled
  txtUsername.SetFocus
End Sub

Private Sub btnCancel_Click()
  Adding = False
  Editing = False
  Set_Lock True
  Grid1_RowColChange
End Sub

Private Sub btnClose_Click()
  Unload Me
End Sub

Private Sub btnDelete_Click()
  If Grid1.Rows = 1 Then
    MsgBox "No Username to be deleted", vbCritical
  Else
    If MsgBox("Really delete?", vbYesNo) = vbYes Then
      sql = "DELETE FROM print_credit WHERE ID = '" & CurrentUsername & "'"
      Cnn.Execute sql
      Reload
    End If
  End If
End Sub

Private Sub btnEdit_Click()
  If Grid1.Rows = 1 Then
    MsgBox "No Username to be edited", vbCritical
  Else
    Editing = True
    Set_Lock False
    txtUsername.SetFocus
  End If
End Sub

Private Sub btnPrint_Click()
  On Error GoTo ErrH
  rtf.Text = ""
  sql = "SELECT * FROM print_credit ORDER BY 1"
  OpenRst sql
  Rst.MoveFirst
  rtf.Text = rtf.Text & "Name" & vbTab & "Credit" & vbCrLf
  Dim i As Integer
  For i = 1 To Rst.RecordCount
    rtf.Text = rtf.Text & Rst.Fields.Item(0).Value & vbTab & Rst.Fields.Item(1).Value & vbCrLf
    Rst.MoveNext
  Next i
  
  PrintDlg.ShowPrinter
  PrintRTF rtf, 2.5 * 567, 2.5 * 567, 2.5 * 567, 2.5 * 567 ' margin left, top, right, bottom
ErrH:
End Sub

Private Sub btnSave_Click()
  NewUsername = QQ(Trim(txtUsername.Text))
  
  If NewUsername = "" Then ' Can't be space
    MsgBox "Username must not be empty", vbCritical
    txtUsername.SetFocus
    Exit Sub
  End If
  
  If Not (IsNumber(txtCredit.Text)) Then ' invalid number
    MsgBox "Invalid Number", vbCritical
    txtCredit.SetFocus
    Exit Sub
  End If
  Credit = txtCredit.Text
  
  sql = "SELECT ID FROM print_credit WHERE ID = '" & NewUsername & "' "
  OpenRst sql
  If (Rst.RecordCount <> 0) And (Adding Or (Editing And (CurrentUsername <> NewUsername))) Then ' Duplicate
    MsgBox "Username duplicated", vbCritical
    txtUsername.SetFocus
    Exit Sub
  End If

  If Editing Then ' delete the old one
    sql = "DELETE FROM print_credit WHERE ID = '" & CurrentUsername & "'"
    Debug.Print sql
    Cnn.Execute sql
  End If
  
  ' and then add the new one
  sql = "INSERT INTO print_credit (ID, credit) " & _
    "VALUES ( " & _
    "'" & NewUsername & "', " & Credit & ") "
  Cnn.Execute sql
  Set_Lock True
  Adding = False
  Editing = False
  Set_Lock True
  Reload
End Sub

Private Sub Form_Load()
  Grid1.ColWidth(0) = 2000
  Reload
  Set_Lock True
End Sub

Private Sub Form_Unload(Cancel As Integer)
  frmMain.Show
End Sub

Private Sub Grid1_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  ' select the last item, in case select many items
  With Grid1
    Dim r As Integer
    r = .RowSel
    .Row = r
    .Col = 0
    .RowSel = r
    .ColSel = 1
    Grid1_RowColChange
  End With
End Sub

Private Sub Grid1_RowColChange()
  ' load data
  Dim i As Integer
  With Grid1
    If .Row > 0 Then
      CurrentUsername = QQ(.TextMatrix(.Row, 0))
      txtUsername.Text = .TextMatrix(.Row, 0)
      txtCredit.Text = .TextMatrix(.Row, 1)
    Else
      Clear_All
    End If
    If .Enabled And .Visible Then .SetFocus
  End With
End Sub
