VERSION 5.00
Begin VB.Form frmBrand 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Brand Management"
   ClientHeight    =   3870
   ClientLeft      =   6810
   ClientTop       =   6900
   ClientWidth     =   7845
   Icon            =   "frmBrand.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3870
   ScaleWidth      =   7845
   Begin VB.CommandButton cmdEndBrand 
      Height          =   492
      Left            =   1560
      Picture         =   "frmBrand.frx":08CA
      Style           =   1  'Graphical
      TabIndex        =   10
      ToolTipText     =   "End"
      Top             =   2280
      Width           =   492
   End
   Begin VB.CommandButton cmdNextBrand 
      Height          =   492
      Left            =   1080
      Picture         =   "frmBrand.frx":0C9F
      Style           =   1  'Graphical
      TabIndex        =   9
      ToolTipText     =   "Next"
      Top             =   2280
      Width           =   492
   End
   Begin VB.CommandButton cmdPreviousBrand 
      Height          =   492
      Left            =   600
      Picture         =   "frmBrand.frx":105D
      Style           =   1  'Graphical
      TabIndex        =   8
      ToolTipText     =   "Previous"
      Top             =   2280
      Width           =   492
   End
   Begin VB.CommandButton cmdFirstBrand 
      Height          =   492
      Left            =   120
      Picture         =   "frmBrand.frx":13FA
      Style           =   1  'Graphical
      TabIndex        =   7
      ToolTipText     =   "First"
      Top             =   2280
      Width           =   492
   End
   Begin VB.CommandButton cmdCancelBrand 
      Caption         =   "ยกเลิก"
      Height          =   855
      Left            =   3960
      MouseIcon       =   "frmBrand.frx":17D3
      MousePointer    =   99  'Custom
      Picture         =   "frmBrand.frx":1ADD
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   2880
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.CommandButton cmdEditBrand 
      Caption         =   "แก้ไข"
      Height          =   855
      Left            =   5880
      MouseIcon       =   "frmBrand.frx":1DE7
      MousePointer    =   99  'Custom
      Picture         =   "frmBrand.frx":20F1
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   2880
      Width           =   1812
   End
   Begin VB.CommandButton cmdDeleteBrand 
      Caption         =   "ลบ"
      Height          =   855
      Left            =   5880
      MouseIcon       =   "frmBrand.frx":23FB
      MousePointer    =   99  'Custom
      Picture         =   "frmBrand.frx":2705
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   2040
      Width           =   1815
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      Height          =   315
      Left            =   3360
      MaxLength       =   3
      TabIndex        =   0
      Top             =   240
      Width           =   2412
   End
   Begin VB.CommandButton cmdSearch 
      Caption         =   "Search BrandID"
      Height          =   375
      Left            =   6000
      MaskColor       =   &H8000000F&
      TabIndex        =   1
      Top             =   240
      Width           =   1575
   End
   Begin VB.CommandButton cmdOKBrand 
      Caption         =   "บันทึก"
      Height          =   855
      Left            =   2160
      MouseIcon       =   "frmBrand.frx":2B47
      MousePointer    =   99  'Custom
      Picture         =   "frmBrand.frx":2E51
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   2880
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.CommandButton cmdAddBrand 
      Caption         =   "เพิ่ม"
      Height          =   855
      Left            =   5880
      MouseIcon       =   "frmBrand.frx":315B
      MousePointer    =   99  'Custom
      Picture         =   "frmBrand.frx":3465
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   1200
      Width           =   1815
   End
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Brand"
      ForeColor       =   &H80000008&
      Height          =   1335
      Left            =   120
      TabIndex        =   2
      Top             =   840
      Width           =   5690
      Begin VB.TextBox txtBrandName 
         Appearance      =   0  'Flat
         DataField       =   "BrandName"
         DataMember      =   "SelectTableBrand"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   1920
         TabIndex        =   6
         Top             =   720
         Width           =   3375
      End
      Begin VB.TextBox txtBrandID 
         Appearance      =   0  'Flat
         BackColor       =   &H80000013&
         DataField       =   "BrandID"
         DataMember      =   "SelectTableBrand"
         DataSource      =   "DataEnInventories"
         Height          =   285
         Left            =   1920
         TabIndex        =   4
         Top             =   330
         Width           =   3375
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "BrandName:"
         Height          =   255
         Index           =   1
         Left            =   30
         TabIndex        =   5
         Top             =   750
         Width           =   1815
      End
      Begin VB.Label lblFieldLabel 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         BackColor       =   &H80000013&
         Caption         =   "BrandID:"
         ForeColor       =   &H80000001&
         Height          =   255
         Index           =   0
         Left            =   30
         TabIndex        =   3
         Top             =   375
         Width           =   1815
      End
   End
   Begin VB.Label Label5 
      BackColor       =   &H80000013&
      Height          =   615
      Left            =   120
      TabIndex        =   17
      Top             =   120
      Width           =   7575
   End
   Begin VB.Label Label2Brand 
      BackColor       =   &H00C0C0C0&
      Height          =   375
      Left            =   2160
      TabIndex        =   11
      Top             =   2400
      Width           =   1815
   End
End
Attribute VB_Name = "frmBrand"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdAddBrand_Click()
Call UnLockCtrl

cmdAddBrand.Enabled = False
cmdEditBrand.Enabled = False
cmdDeleteBrand.Enabled = False

cmdFirstBrand.Enabled = False
cmdPreviousBrand.Enabled = False
cmdNextBrand.Enabled = False
cmdEndBrand.Enabled = False

cmdOKBrand.Visible = True
cmdCancelBrand.Visible = True

DataEnInventories.rsSelectTableBrand.AddNew

txtBrandName.SetFocus
txtBrandID.BackColor = &H80000013

Dim tmpB As String

With DataEnInventories.rsSelectTableBrand

If .RecordCount = 0 Then
            .AddNew
            .Fields("BrandID").Value = "01"
            .Update
            tmpB = "01"
Else
            tmpB = Format(.RecordCount, "00")
        End If
        txtBrandID.Text = tmpB
        
        Label2Brand.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
        
End With

End Sub

Private Sub cmdCancelBrand_Click()
With DataEnInventories.rsSelectTableBrand
    .CancelUpdate
    .MoveFirst
    Label2Brand.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
End With

    cmdAddBrand.Enabled = True
    cmdEditBrand.Enabled = True
    cmdDeleteBrand.Enabled = True
    
    cmdOKBrand.Visible = False
    cmdCancelBrand.Visible = False

    cmdFirstBrand.Enabled = True
    cmdPreviousBrand.Enabled = True
    cmdNextBrand.Enabled = True
    cmdEndBrand.Enabled = True
    
    Call LockCtrl

End Sub

Private Sub cmdDeleteBrand_Click()

If MsgBox("คุณต้องการลบเร็คคอร์ดนี้หรื่อไม่", vbYesNo, "Brand Management") = vbYes Then
    With DataEnInventories.rsSelectTableBrand
        .Delete
        .MoveNext
            If .EOF Then
                .MoveLast
            End If
        
    End With
End If

End Sub

Private Sub cmdEditBrand_Click()
Call UnLockCtrl
    
    cmdAddBrand.Enabled = False
    cmdEditBrand.Enabled = False
    cmdDeleteBrand.Enabled = False
        
    cmdOKBrand.Visible = True
    cmdCancelBrand.Visible = True
    
    'txtBrandID.BackColor = &H80000013
    'txtBrandName.BackColor = &H80000013
    
End Sub

Private Sub cmdEndBrand_Click()
With DataEnInventories.rsSelectTableBrand
.MoveLast
Label2Brand.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount

End With
End Sub

Private Sub cmdFirstBrand_Click()
With DataEnInventories.rsSelectTableBrand
.MoveFirst
Label2Brand.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
End With
End Sub

Private Sub cmdNextBrand_Click()
With DataEnInventories.rsSelectTableBrand
.MoveNext
        If .EOF Then
            .MoveFirst
        End If
        
        Label2Brand.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
End With
End Sub

Private Sub cmdOKBrand_Click()

Dim tmp_Brand As String

    If (txtBrandID.Text = "") Then
        MsgBox "กรุณาใส่รหัสยี่ห้อด้วย !", vbOKOnly + vbCritical, "Brand Management"
        txtBrandID.SetFocus
        cmdAddBrand.Enabled = False
        cmdEditBrand.Enabled = False
        Exit Sub
    End If
    
    If (txtBrandName.Text = "") Then
        MsgBox "กรุณาใส่ชื่อยี่ห้อด้วย !", vbOKOnly + vbCritical, "Brand Management"
        txtBrandName.SetFocus
        cmdAddBrand.Enabled = False
        cmdEditBrand.Enabled = False
        Exit Sub
    End If

With DataEnInventories.rsSelectTableBrand
.Update

End With

    Call LockCtrl
    
    cmdAddBrand.Enabled = True
    cmdEditBrand.Enabled = True
    cmdDeleteBrand.Enabled = True
    
    cmdOKBrand.Visible = False
    cmdCancelBrand.Visible = False

    cmdFirstBrand.Enabled = True
    cmdPreviousBrand.Enabled = True
    cmdNextBrand.Enabled = True
    cmdEndBrand.Enabled = True

End Sub

Private Sub cmdPreviousBrand_Click()
With DataEnInventories.rsSelectTableBrand
.MovePrevious
    If .BOF Then
        .MoveLast
    End If
Label2Brand.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
End With
End Sub

Private Sub cmdSearch_Click()
Dim userCriteria As String

userCriteria = "BrandID like '" & Text1.Text & "'"

If Text1.Text = "" Then
    MsgBox "กรุณาใส่ BrandID", vbOKOnly, "Brand Management"
ElseIf IsNumeric(Text1.Text) Then
    With DataEnInventories.rsSelectTableBrand
        .MoveFirst
        .Find userCriteria, , adSearchForward
        Label2Brand.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
           
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
    If DataEnInventories.rsSelectTableBrand.EOF Then
        MsgBox "ไม่พบข้อมูล", vbOKOnly, "Brand Management"
    Label2Brand.Caption = "Record: "
                'imgProduct.Picture = LoadPicture("")
    End If


End Sub

Private Sub Form_Load()
cmdOKBrand.Visible = False
cmdCancelBrand.Visible = False

With DataEnInventories.rsSelectTableBrand
Label2Brand.Caption = "Record: " & .AbsolutePosition & "/" & .RecordCount
End With

Call LockCtrl


End Sub

Private Sub LockCtrl()
txtBrandID.Locked = True
txtBrandName.Locked = True

txtBrandID.BackColor = &H80000013
txtBrandName.BackColor = &H8000000F

cmdSearch.Enabled = True
Text1.Enabled = True

End Sub

Private Sub UnLockCtrl()
txtBrandID.Locked = False
txtBrandName.Locked = False

txtBrandID.BackColor = &H80000013
txtBrandName.BackColor = &H80000009

cmdSearch.Enabled = False
Text1.Enabled = False

End Sub

Private Sub text1_keypress(KeyAscii As Integer)
    If KeyAscii = 13 Then
        Call cmdSearch_Click
    End If
End Sub

