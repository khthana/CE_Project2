VERSION 5.00
Begin VB.Form frmSupplier 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Supplier"
   ClientHeight    =   5910
   ClientLeft      =   4755
   ClientTop       =   4470
   ClientWidth     =   9975
   Icon            =   "frmSupplier.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5910
   ScaleWidth      =   9975
   Begin VB.Frame Frame3 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "รายละเอียดสินค้า"
      ForeColor       =   &H80000008&
      Height          =   735
      Left            =   6000
      TabIndex        =   21
      Top             =   960
      Width           =   3855
      Begin VB.TextBox txtItemDescription 
         Appearance      =   0  'Flat
         DataField       =   "ItemDescription"
         DataMember      =   "Supplier"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   240
         TabIndex        =   22
         Top             =   240
         Width           =   3495
      End
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "ยกเลิก"
      Height          =   855
      Left            =   8040
      MouseIcon       =   "frmSupplier.frx":0E42
      MousePointer    =   99  'Custom
      Picture         =   "frmSupplier.frx":114C
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   2640
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.CommandButton cmdEdit 
      Caption         =   "แก้ไข"
      Height          =   855
      Left            =   6120
      MouseIcon       =   "frmSupplier.frx":1456
      MousePointer    =   99  'Custom
      Picture         =   "frmSupplier.frx":1760
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   3480
      Width           =   1812
   End
   Begin VB.CommandButton cmdEnd 
      Height          =   492
      Left            =   1680
      Picture         =   "frmSupplier.frx":1A6A
      Style           =   1  'Graphical
      TabIndex        =   8
      ToolTipText     =   "End"
      Top             =   5280
      Width           =   492
   End
   Begin VB.CommandButton cmdNext 
      Height          =   492
      Left            =   1200
      Picture         =   "frmSupplier.frx":1E3F
      Style           =   1  'Graphical
      TabIndex        =   7
      ToolTipText     =   "Next"
      Top             =   5280
      Width           =   492
   End
   Begin VB.CommandButton cmdPrevious 
      Height          =   492
      Left            =   720
      Picture         =   "frmSupplier.frx":21FD
      Style           =   1  'Graphical
      TabIndex        =   6
      ToolTipText     =   "Previous"
      Top             =   5280
      Width           =   492
   End
   Begin VB.CommandButton cmdFirst 
      Height          =   492
      Left            =   240
      Picture         =   "frmSupplier.frx":259A
      Style           =   1  'Graphical
      TabIndex        =   5
      ToolTipText     =   "First"
      Top             =   5280
      Width           =   492
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      Height          =   372
      Left            =   1440
      TabIndex        =   1
      Top             =   480
      Width           =   2412
   End
   Begin VB.CommandButton cmdSearch 
      Caption         =   "Search SupplierID"
      Height          =   372
      Left            =   3960
      MaskColor       =   &H8000000F&
      TabIndex        =   3
      Top             =   480
      Width           =   1812
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "การติดต่อ"
      ForeColor       =   &H80000008&
      Height          =   2652
      Left            =   240
      TabIndex        =   2
      Top             =   2520
      Width           =   5652
      Begin VB.TextBox txtFax 
         Appearance      =   0  'Flat
         DataField       =   "Fax"
         DataMember      =   "Supplier"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   2040
         TabIndex        =   34
         Top             =   2160
         Width           =   3375
      End
      Begin VB.TextBox txtHomepage 
         Appearance      =   0  'Flat
         DataField       =   "Homepage"
         DataMember      =   "Supplier"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   2040
         TabIndex        =   32
         Top             =   1785
         Width           =   3375
      End
      Begin VB.TextBox txtEmail 
         Appearance      =   0  'Flat
         DataField       =   "Email"
         DataMember      =   "Supplier"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   2040
         TabIndex        =   30
         Top             =   1440
         Width           =   3375
      End
      Begin VB.TextBox txtTelephone 
         Appearance      =   0  'Flat
         DataField       =   "Telephone"
         DataMember      =   "Supplier"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   2040
         TabIndex        =   28
         Top             =   1080
         Width           =   3375
      End
      Begin VB.TextBox txtContactName 
         Appearance      =   0  'Flat
         DataField       =   "ContactName"
         DataMember      =   "Supplier"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   2040
         TabIndex        =   26
         Top             =   720
         Width           =   3375
      End
      Begin VB.TextBox txtAddress 
         Appearance      =   0  'Flat
         DataField       =   "Address"
         DataMember      =   "Supplier"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   2040
         TabIndex        =   24
         Top             =   360
         Width           =   3375
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Fax:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   8
         Left            =   120
         TabIndex        =   33
         Top             =   2175
         Width           =   1815
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Homepage:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   7
         Left            =   120
         TabIndex        =   31
         Top             =   1830
         Width           =   1815
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Email:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   29
         Top             =   1455
         Width           =   1815
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Telephone:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   27
         Top             =   1080
         Width           =   1815
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "ContactName:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   4
         Left            =   135
         TabIndex        =   25
         Top             =   720
         Width           =   1815
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Address:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   23
         Top             =   360
         Width           =   1815
      End
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "ข้อมูลทั่วไป"
      ForeColor       =   &H80000008&
      Height          =   1572
      Left            =   240
      TabIndex        =   0
      Top             =   960
      Width           =   5652
      Begin VB.TextBox txtSupplierNameEnglish 
         Appearance      =   0  'Flat
         DataField       =   "SupplierNameEnglish"
         DataMember      =   "Supplier"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   2040
         TabIndex        =   20
         Top             =   1050
         Width           =   3375
      End
      Begin VB.TextBox txtSupplierNameThai 
         Appearance      =   0  'Flat
         DataField       =   "SupplierNameThai"
         DataMember      =   "Supplier"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   2040
         TabIndex        =   18
         Top             =   675
         Width           =   3375
      End
      Begin VB.TextBox txtSupplierID 
         Appearance      =   0  'Flat
         DataField       =   "SupplierID"
         DataMember      =   "Supplier"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   2040
         TabIndex        =   16
         Top             =   255
         Width           =   3375
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "SupplierNameEnglish:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   19
         Top             =   1080
         Width           =   1815
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "SupplierNameThai:"
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   17
         Top             =   720
         Width           =   1815
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H80000013&
         Caption         =   "SupplierID:"
         ForeColor       =   &H80000001&
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   15
         Top             =   300
         Width           =   1815
      End
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "ลบ"
      Height          =   855
      Left            =   6120
      MouseIcon       =   "frmSupplier.frx":2973
      MousePointer    =   99  'Custom
      Picture         =   "frmSupplier.frx":2C7D
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   2640
      Width           =   1815
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "บันทึก"
      Height          =   855
      Left            =   8040
      MouseIcon       =   "frmSupplier.frx":30BF
      MousePointer    =   99  'Custom
      Picture         =   "frmSupplier.frx":33C9
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   1800
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "เพิ่ม"
      Height          =   855
      Left            =   6120
      MouseIcon       =   "frmSupplier.frx":36D3
      MousePointer    =   99  'Custom
      Picture         =   "frmSupplier.frx":39DD
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   1800
      Width           =   1815
   End
   Begin VB.Label Label2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      ForeColor       =   &H80000008&
      Height          =   372
      Left            =   2280
      TabIndex        =   14
      Top             =   5400
      Width           =   1812
   End
   Begin VB.Label Label5 
      BackColor       =   &H80000013&
      Height          =   612
      Left            =   240
      TabIndex        =   4
      Top             =   360
      Width           =   5652
   End
End
Attribute VB_Name = "frmSupplier"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdAdd_Click()
Call UnLockCtrl

cmdAdd.Enabled = False
cmdEdit.Enabled = False
cmdDelete.Enabled = False

cmdFirst.Enabled = False
cmdPrevious.Enabled = False
cmdNext.Enabled = False
cmdEnd.Enabled = False

cmdOK.Visible = True
cmdCancel.Visible = True

DataEnInventories.rsSupplier.AddNew

txtSupplierNameThai.SetFocus
txtSupplierID.BackColor = &H80000013

Dim tmpS As String

With DataEnInventories.rsSupplier

If .RecordCount = 0 Then
            .AddNew
            .Fields("SupplierID").Value = "01"
            .Update
            tmpS = "01"
Else
            tmpS = Format(.RecordCount, "00")
        End If
        txtSupplierID.Text = tmpS
        
        Label2.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
        
End With

End Sub

Private Sub cmdCancel_Click()
With DataEnInventories.rsSupplier
    .CancelUpdate
    .MoveFirst
    Label2.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
End With

    cmdAdd.Enabled = True
    cmdEdit.Enabled = True
    cmdDelete.Enabled = True
    
    cmdOK.Visible = False
    cmdCancel.Visible = False

    cmdFirst.Enabled = True
    cmdPrevious.Enabled = True
    cmdNext.Enabled = True
    cmdEnd.Enabled = True
    
    Call LockCtrl

End Sub

Private Sub cmdDelete_Click()

If MsgBox("คุณต้องการลบเร็คคอร์ดนี้หรื่อไม่", vbYesNo, "Supplier") = vbYes Then
    With DataEnInventories.rsSupplier
        .Delete
        .MoveNext
            If .EOF Then
                .MoveLast
            End If
        
    End With
End If

End Sub

Private Sub cmdEdit_Click()
Call UnLockCtrl
    
    cmdAdd.Enabled = False
    cmdEdit.Enabled = False
    cmdDelete.Enabled = False
        
    cmdOK.Visible = True
    cmdCancel.Visible = True
    
    'txtBrandID.BackColor = &H80000013
    'txtBrandName.BackColor = &H80000013
    
End Sub

Private Sub cmdEnd_Click()
With DataEnInventories.rsSupplier
.MoveLast
Label2.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount

End With
End Sub

Private Sub cmdFirst_Click()
With DataEnInventories.rsSupplier
.MoveFirst
Label2.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
End With
End Sub

Private Sub cmdNext_Click()
With DataEnInventories.rsSupplier
.MoveNext
        If .EOF Then
            .MoveFirst
        End If
        
        Label2.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
End With
End Sub

Private Sub cmdOK_Click()

Dim tmp_Supplier As String

    If (txtSupplierID.Text = "") Then
        MsgBox "กรุณาใส่รหัสตัวแทนจำหน่ายด้วย !", vbOKOnly + vbCritical, "Supplier"
        txtSupplierID.SetFocus
        cmdAdd.Enabled = False
        cmdEdit.Enabled = False
        Exit Sub
    End If
    
    If (txtSupplierNameThai.Text = "") Then
        MsgBox "กรุณาใส่ชื่อตัวแทนจำหน่ายด้วย !", vbOKOnly + vbCritical, "Supplier"
        txtSupplierNameThai.SetFocus
        cmdAdd.Enabled = False
        cmdEdit.Enabled = False
        Exit Sub
    End If

If (txtSupplierNameEnglish.Text = "") Then
        MsgBox "กรุณาใส่ชื่อตัวแทนจำหน่ายด้วย !", vbOKOnly + vbCritical, "Supplier"
        txtSupplierNameEnglish.SetFocus
        cmdAdd.Enabled = False
        cmdEdit.Enabled = False
        Exit Sub
    End If
    
    
With DataEnInventories.rsSupplier
.Update

End With

    Call LockCtrl
    
    cmdAdd.Enabled = True
    cmdEdit.Enabled = True
    cmdDelete.Enabled = True
    
    cmdOK.Visible = False
    cmdCancel.Visible = False

    cmdFirst.Enabled = True
    cmdPrevious.Enabled = True
    cmdNext.Enabled = True
    cmdEnd.Enabled = True

End Sub

Private Sub cmdPrevious_Click()
With DataEnInventories.rsSupplier
.MovePrevious
    If .BOF Then
        .MoveLast
    End If
Label2.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
End With
End Sub

Private Sub cmdSearch_Click()
Dim userCriteria As String

userCriteria = "SupplierID like '" & Text1.Text & "'"

If Text1.Text = "" Then
    MsgBox "กรุณาใส่ SupplierID", vbOKOnly, "Supplier"
ElseIf IsNumeric(Text1.Text) Then
    With DataEnInventories.rsSupplier
        .MoveFirst
        .Find userCriteria, , adSearchForward
        Label2.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
           
            On Error GoTo Err1
            'If .Fields("ItemPictureFileName").Value <> "" Then
            'ItemPictureFileName = .Fields("ItemPictureFileName").Value
            'Else
            'ItemPictureFileName = ""
            'End If
            'imgProduct.Picture = LoadPicture(ItemPictureFileName)

    End With
       
End If

Err1:
    If DataEnInventories.rsSupplier.EOF Then
        MsgBox "ไม่พบข้อมูล", vbOKOnly, "Supplier"
    Label2.Caption = "Record: "
                'imgProduct.Picture = LoadPicture("")
    End If


End Sub

Private Sub Form_Load()
cmdOK.Visible = False
cmdCancel.Visible = False

With DataEnInventories.rsSupplier
Label2.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
End With

Call LockCtrl


End Sub

Private Sub LockCtrl()
txtSupplierID.Locked = True
txtSupplierNameThai.Locked = True
txtSupplierNameEnglish.Locked = True
txtItemDescription.Locked = True
txtAddress.Locked = True
txtContactName.Locked = True
txtTelephone.Locked = True
txtEmail.Locked = True
txtHomepage.Locked = True
txtFax.Locked = True


txtSupplierID.BackColor = &H80000013
'txtBrandName.BackColor = &H8000000F
txtSupplierNameThai.BackColor = &H8000000F
txtSupplierNameEnglish.BackColor = &H8000000F
txtItemDescription.BackColor = &H8000000F
txtAddress.BackColor = &H8000000F
txtContactName.BackColor = &H8000000F
txtTelephone.BackColor = &H8000000F
txtEmail.BackColor = &H8000000F
txtHomepage.BackColor = &H8000000F
txtFax.BackColor = &H8000000F

cmdSearch.Enabled = True
Text1.Enabled = True

End Sub

Private Sub UnLockCtrl()
'txtBrandID.Locked = False
'txtBrandName.Locked = False

'txtBrandID.BackColor = &H80000013
'txtBrandName.BackColor = &H80000009
txtSupplierID.Locked = False
txtSupplierNameThai.Locked = False
txtSupplierNameEnglish.Locked = False
txtItemDescription.Locked = False
txtAddress.Locked = False
txtContactName.Locked = False
txtTelephone.Locked = False
txtEmail.Locked = False
txtHomepage.Locked = False
txtFax.Locked = False


txtSupplierID.BackColor = &H80000013
'txtBrandName.BackColor = &H8000000F
txtSupplierNameThai.BackColor = &H80000009
txtSupplierNameEnglish.BackColor = &H80000009
txtItemDescription.BackColor = &H80000009
txtAddress.BackColor = &H80000009
txtContactName.BackColor = &H80000009
txtTelephone.BackColor = &H80000009
txtEmail.BackColor = &H80000009
txtHomepage.BackColor = &H80000009
txtFax.BackColor = &H80000009

cmdSearch.Enabled = False
Text1.Enabled = False

End Sub

Private Sub text1_keypress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Call cmdSearch_Click
    End If
End Sub


