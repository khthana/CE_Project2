VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmAdmin 
   BackColor       =   &H00000080&
   Caption         =   "Add Admin"
   ClientHeight    =   4485
   ClientLeft      =   3075
   ClientTop       =   3120
   ClientWidth     =   8295
   Icon            =   "frmAdmin.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4485
   ScaleWidth      =   8295
   Visible         =   0   'False
   Begin VB.CommandButton btnDelete 
      Caption         =   "Delete"
      Height          =   435
      Left            =   6990
      TabIndex        =   10
      Top             =   1575
      Width           =   645
   End
   Begin VB.CommandButton btnCancel 
      Caption         =   "Cancel"
      Enabled         =   0   'False
      Height          =   435
      Left            =   6360
      TabIndex        =   9
      Top             =   1575
      Width           =   645
   End
   Begin VB.CommandButton btnSave 
      Caption         =   "Save"
      Enabled         =   0   'False
      Height          =   435
      Left            =   5730
      TabIndex        =   8
      Top             =   1575
      Width           =   645
   End
   Begin VB.CommandButton btnEdit 
      Caption         =   "Edit"
      Height          =   435
      Left            =   5100
      TabIndex        =   7
      Top             =   1575
      Width           =   645
   End
   Begin VB.CommandButton btnAdd 
      Caption         =   "Add"
      Height          =   435
      Left            =   4470
      TabIndex        =   6
      Top             =   1575
      Width           =   645
   End
   Begin VB.CommandButton btnClose 
      Caption         =   "Close"
      Height          =   435
      Left            =   6840
      TabIndex        =   5
      Top             =   3720
      Width           =   1125
   End
   Begin VB.TextBox txtPassword 
      Height          =   330
      Left            =   5940
      TabIndex        =   2
      Top             =   1050
      Width           =   1695
   End
   Begin VB.TextBox txtUsername 
      Height          =   330
      Left            =   5940
      TabIndex        =   1
      Top             =   630
      Width           =   1695
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid Grid1 
      Height          =   3495
      Left            =   480
      TabIndex        =   0
      Top             =   480
      Width           =   3315
      _ExtentX        =   5847
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
   Begin VB.Shape Shape3 
      BackColor       =   &H00E0E0E0&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00404040&
      BorderWidth     =   2
      Height          =   3735
      Left            =   360
      Top             =   360
      Width           =   3615
   End
   Begin VB.Label Label2 
      BackColor       =   &H00E0E0E0&
      Caption         =   "Password"
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
      Height          =   330
      Left            =   4575
      TabIndex        =   4
      Top             =   1050
      Width           =   1170
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
      Height          =   330
      Left            =   4575
      TabIndex        =   3
      Top             =   630
      Width           =   1170
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00E0E0E0&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00404040&
      BorderWidth     =   2
      Height          =   1935
      Left            =   4200
      Top             =   360
      Width           =   3735
   End
   Begin VB.Shape Shape2 
      BackColor       =   &H00C0FFFF&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00FF0000&
      BorderWidth     =   3
      Height          =   4215
      Left            =   120
      Top             =   120
      Width           =   8055
   End
End
Attribute VB_Name = "frmAdmin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private CurrentUsername As String
Private NewUsername As String
Private Password As String
Private Adding As Boolean
Private Editing As Boolean

Private Sub Set_Lock(ByVal m As Boolean) ' True = View Mode , False = Edit Mode
  Grid1.Enabled = m
  txtUsername.Locked = m
  txtPassword.Locked = m
  btnAdd.Enabled = m
  btnEdit.Enabled = m
  btnSave.Enabled = Not m
  btnCancel.Enabled = Not m
  btnDelete.Enabled = m
  btnClose.Enabled = m
End Sub

Public Sub Clear_All()
  txtUsername.Text = ""
  txtPassword.Text = ""
End Sub

Public Sub Reload()
  sql = "SELECT * FROM Admin ORDER BY 1 "
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
      sql = "DELETE FROM Admin WHERE Username = '" & CurrentUsername & "'"
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

Private Sub btnSave_Click()
  NewUsername = QQ(Trim(txtUsername.Text))
  Password = QQ(txtPassword.Text)
  If NewUsername = "" Then ' Can't be space
    MsgBox "Username must not be empty", vbCritical
    txtUsername.SetFocus
    Exit Sub
  End If
  
  If Password = "" Then ' Can't be space
    MsgBox "Password must not be empty", vbCritical
    txtPassword.SetFocus
    Exit Sub
  End If
  
  sql = "SELECT Username FROM Admin WHERE Username = '" & NewUsername & "' "
  OpenRst sql
  If (Rst.RecordCount <> 0) And (Adding Or (Editing And (CurrentUsername <> NewUsername))) Then ' Duplicate
    MsgBox "Username duplicated", vbCritical
    txtUsername.SetFocus
    Exit Sub
  End If

  If Editing Then ' delete the old one
    sql = "DELETE FROM Admin WHERE Username = '" & CurrentUsername & "'"
    Debug.Print sql
    Cnn.Execute sql
  End If
  
  ' and then add the new one
  sql = "INSERT INTO Admin (Username, Password) " & _
    "VALUES ( " & _
    "'" & NewUsername & "', " & _
    "'" & Password & "') "
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
      txtPassword.Text = .TextMatrix(.Row, 1)
    Else
      Clear_All
    End If
    If .Enabled And .Visible Then .SetFocus
  End With
End Sub
