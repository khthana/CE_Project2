VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Begin VB.Form frmBOM 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "BOM Section"
   ClientHeight    =   7215
   ClientLeft      =   210
   ClientTop       =   1665
   ClientWidth     =   11895
   Icon            =   "frmBOM.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   7215
   ScaleWidth      =   11895
   WindowState     =   2  'Maximized
   Begin VB.Frame fraBOM2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      ForeColor       =   &H80000008&
      Height          =   5175
      Left            =   120
      TabIndex        =   21
      Top             =   1920
      Width           =   11655
      Begin VB.TextBox txtItemID_ 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   480
         TabIndex        =   5
         Top             =   4320
         Width           =   1455
      End
      Begin VB.TextBox txtItemName_ 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   2280
         TabIndex        =   6
         Top             =   4320
         Width           =   2535
      End
      Begin VB.TextBox txtUnit_ 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   8520
         TabIndex        =   9
         Top             =   4320
         Width           =   1215
      End
      Begin VB.TextBox txtLeadtime_ 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   10080
         TabIndex        =   10
         Top             =   4320
         Width           =   1095
      End
      Begin VB.CommandButton cmdAddItem 
         Caption         =   "&Add Item"
         Height          =   375
         Left            =   7320
         TabIndex        =   11
         Top             =   4680
         Width           =   1335
      End
      Begin VB.CommandButton cmdDeleteItem 
         Caption         =   "&Delete Item"
         Height          =   375
         Left            =   8880
         TabIndex        =   12
         Top             =   4680
         Width           =   1335
      End
      Begin VB.TextBox txtParentID_ 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   5160
         TabIndex        =   7
         Top             =   4320
         Width           =   1455
      End
      Begin VB.TextBox txtLevel_ 
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         Enabled         =   0   'False
         Height          =   285
         Left            =   6960
         TabIndex        =   8
         Top             =   4320
         Width           =   1215
      End
      Begin VB.CommandButton cmdRecord 
         Caption         =   "บันทึกลงฐานข้อมูล"
         Height          =   375
         Left            =   960
         TabIndex        =   13
         ToolTipText     =   "Update ฐานข้อมูลของแต่ละ Finish Goods"
         Top             =   4680
         Width           =   1815
      End
      Begin VB.CommandButton cmdRelation 
         Caption         =   "ปรับข้อมูลสินค้าทั้งหมด"
         Height          =   375
         Left            =   3960
         TabIndex        =   14
         ToolTipText     =   "ปรับปรุงค่าหลังจากแก้ไข Finish Goods หมดแล้ว ให้ค่าสินค้าที่เกี่ยวข้องกัน ถูกต้อง"
         Top             =   4680
         Width           =   2175
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid mfgBOM2 
         Height          =   3615
         Left            =   960
         TabIndex        =   22
         TabStop         =   0   'False
         Top             =   360
         Width           =   9615
         _ExtentX        =   16960
         _ExtentY        =   6376
         _Version        =   393216
         Cols            =   6
         FixedCols       =   0
         BackColorSel    =   -2147483645
         BackColorBkg    =   12632256
         WordWrap        =   -1  'True
         Appearance      =   0
         _NumberOfBands  =   1
         _Band(0).Cols   =   6
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H000000FF&
         BorderWidth     =   4
         FillColor       =   &H00404040&
         Height          =   375
         Left            =   3960
         Top             =   4680
         Width           =   2175
      End
      Begin VB.Label lblListBom 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         Caption         =   "โครงสร้างของสินค้าสำเร็จรูป"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   30
         Top             =   0
         Width           =   2415
      End
      Begin VB.Label lblItemID_ 
         BackColor       =   &H00C0C0C0&
         Caption         =   "รหัสสินค้า"
         Height          =   255
         Left            =   480
         TabIndex        =   29
         Top             =   4080
         Width           =   735
      End
      Begin VB.Label lblItemName_ 
         BackColor       =   &H00C0C0C0&
         Caption         =   "ชื่อสินค้า"
         Height          =   255
         Left            =   2280
         TabIndex        =   28
         Top             =   4080
         Width           =   735
      End
      Begin VB.Label lblLeadtime_ 
         BackColor       =   &H00C0C0C0&
         Caption         =   "เวลานำ"
         Height          =   255
         Left            =   10080
         TabIndex        =   27
         Top             =   4080
         Width           =   615
      End
      Begin VB.Label lblParentID_ 
         BackColor       =   &H00C0C0C0&
         Caption         =   "รหัสสินค้าเบื้องบน"
         Height          =   255
         Left            =   5160
         TabIndex        =   26
         Top             =   4080
         Width           =   1335
      End
      Begin VB.Label lblUnit 
         BackColor       =   &H00C0C0C0&
         Caption         =   "จำนวนหน่วย"
         Height          =   255
         Left            =   8520
         TabIndex        =   25
         Top             =   4080
         Width           =   975
      End
      Begin VB.Label lblLevel_ 
         BackColor       =   &H00C0C0C0&
         Caption         =   "ระดับ"
         Height          =   255
         Left            =   6960
         TabIndex        =   24
         Top             =   4080
         Width           =   615
      End
      Begin VB.Label lblFGSelected 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   2760
         TabIndex        =   23
         Top             =   0
         Width           =   1215
      End
   End
   Begin VB.Frame fraBOM1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      ForeColor       =   &H80000008&
      Height          =   1815
      Left            =   120
      TabIndex        =   15
      Top             =   0
      Width           =   11655
      Begin VB.CommandButton cmdAddFG 
         Appearance      =   0  'Flat
         Caption         =   "Add &Finish Goods"
         Height          =   375
         Left            =   9240
         TabIndex        =   3
         Top             =   1320
         Width           =   1695
      End
      Begin VB.TextBox txtItemID 
         Appearance      =   0  'Flat
         Height          =   375
         Left            =   6000
         TabIndex        =   0
         Top             =   840
         Width           =   1215
      End
      Begin VB.TextBox txtItemName 
         Appearance      =   0  'Flat
         Height          =   375
         Left            =   7320
         TabIndex        =   1
         Top             =   840
         Width           =   2415
      End
      Begin VB.TextBox txtLeadtime 
         Appearance      =   0  'Flat
         Height          =   375
         Left            =   9840
         TabIndex        =   2
         Top             =   840
         Width           =   1095
      End
      Begin VB.CommandButton cmdDeleteFG 
         Appearance      =   0  'Flat
         Caption         =   "Delete Finish &Goods"
         Height          =   375
         Left            =   6000
         TabIndex        =   4
         Top             =   1320
         Width           =   1695
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid mfgBOM1 
         Height          =   1455
         Left            =   120
         TabIndex        =   16
         TabStop         =   0   'False
         ToolTipText     =   "Double Click สินค้าที่ต้องการเพื่อแสดงโครงสร้าง"
         Top             =   240
         Width           =   5655
         _ExtentX        =   9975
         _ExtentY        =   2566
         _Version        =   393216
         Cols            =   3
         FixedCols       =   0
         BackColorSel    =   -2147483645
         BackColorBkg    =   12632256
         WordWrap        =   -1  'True
         Appearance      =   0
         _NumberOfBands  =   1
         _Band(0).Cols   =   3
      End
      Begin VB.Label lblItemID 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "รหัสสินค้า"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   6000
         TabIndex        =   20
         Top             =   480
         Width           =   735
      End
      Begin VB.Label lblItemName 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "ชื่อสินค้า"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   7320
         TabIndex        =   19
         Top             =   480
         Width           =   735
      End
      Begin VB.Label lblLeadTime 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "เวลานำ"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   9840
         TabIndex        =   18
         Top             =   480
         Width           =   615
      End
      Begin VB.Label lblListFG 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Caption         =   "รายการสินค้าสำเร็จรูป"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   7320
         TabIndex        =   17
         Top             =   120
         Width           =   1935
      End
   End
End
Attribute VB_Name = "frmBOM"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim selectBom As String
Dim oldSelectRow(1 To 2) As Integer ' จัดการเกี่ยวกับการ Hilight
' Form Load
Private Sub Form_Load()
    oldSelectRow(1) = 0
    oldSelectRow(2) = 0
    Call loadFG
End Sub
'โหลดตาราง finish goods จากฐานข้อมูล
Private Sub loadFG()
        If DataEn.Conn.State = adStateOpen Then
            DataEn.Conn.Close
            DataEn.Conn.Open
        End If
        DataEn.getFG
        If DataEn.rsgetFG.RecordCount Then
            Set mfgBOM1.DataSource = DataEn.rsgetFG
        Else
            mfgBOM1.Clear
            'mfgBOM1.Rows = 2
        End If
    Call initGrid
End Sub
'โหลดตารางโครงสร้าง จากฐานข้อมูล
Private Sub loadBOM()
    Dim NewRow As Integer
        If DataEn.Conn.State = adStateOpen Then
            DataEn.Conn.Close
            DataEn.Conn.Open
        End If
        DataEn.getChild selectBom
        If DataEn.rsgetChild.RecordCount Then
            Set mfgBOM2.DataSource = DataEn.rsgetChild
        Else
            mfgBOM2.Clear
            mfgBOM2.Rows = 2
        End If
    Call initGrid
End Sub
'กำหนดชื่อ columns, ขนาด ให้กับตาราง
Private Sub initGrid()
    With mfgBOM1
        .TextMatrix(0, 0) = "รหัสสินค้า"
        .TextMatrix(0, 1) = "ชื่อสินค้า"
        .TextMatrix(0, 2) = "เวลานำ"
        
        .ColWidth(0) = 1000
        .ColWidth(1) = 3000
        .ColWidth(2) = 1000
    End With
    With mfgBOM2
        .TextMatrix(0, 0) = "รหัสสินค้า"
        .TextMatrix(0, 1) = "ชื่อสินค้า"
        .TextMatrix(0, 2) = "รหัสสินค้าเบื้องบน"
        .TextMatrix(0, 3) = "ระดับ"
        .TextMatrix(0, 4) = "จำนวนหน่วย"
        .TextMatrix(0, 5) = "เวลานำ"
        .ColWidth(0) = 1500
        .ColWidth(1) = 3000
        .ColWidth(2) = 1500
        .ColWidth(3) = 1000
        .ColWidth(4) = 1200
        .ColWidth(5) = 1000
    End With
End Sub
'เพิ่ม finish goods
Private Sub cmdAddFG_Click()
    Dim i As Integer
    If txtItemID.Text = "0" Then
        MsgBox "รหัสสินค้าไม่สามารถเป็น 0 ได้", vbOKOnly, "BOM"
        Exit Sub
    End If
    If txtItemID.Text <> "" And txtItemName <> "" And txtLeadtime <> "" Then
        With mfgBOM1
            For i = 1 To .Rows - 1
                If txtItemID.Text = .TextMatrix(i, 0) Then
                    MsgBox "คุณเลือกรายการสินค้าซ้ำ!", vbOKOnly + vbCritical, "BOM"
                    txtItemID.SetFocus
                    Exit Sub
                End If
            Next
        End With
    
        If DataEn.Conn.State = adStateOpen Then
            DataEn.Conn.Close
            DataEn.Conn.Open
        End If
        DataEn.dbo_addFG txtItemID.Text, txtItemName.Text, txtLeadtime.Text
        
        Call loadFG
        
        txtItemID.Text = ""
        txtItemName.Text = ""
        txtLeadtime.Text = ""
        txtItemID.SetFocus
    Else
        MsgBox "คุณกรอกข้อมูลไม่ครบ", vbOKOnly, "คำเตือน"
    End If
    oldSelectRow(1) = 0
End Sub
' ลบ finish goods
Private Sub cmdDeleteFG_Click()
    If oldSelectRow(1) Then ' ยังไม่ได้ทำการเลือกให้ลบไม่ได้
        With mfgBOM1
            If .TextMatrix(.RowSel, 0) <> "" Then
                If MsgBox("คุณต้องการที่จะลบรหัสสินค้า " & .TextMatrix(.RowSel, 0), vbOKCancel, "ยืนยัน (สินค้าสำเร็จรูป)") = vbOK Then
                    If DataEn.Conn.State = adStateOpen Then
                        DataEn.Conn.Close
                        DataEn.Conn.Open
                    End If
                    DataEn.deleteFG .TextMatrix(.RowSel, 0), .TextMatrix(.RowSel, 0)
                    Call loadFG
                End If
            End If
        End With
    End If
    oldSelectRow(1) = 0
End Sub



' เลือก finish goods
Private Sub mfgBOM1_Click()
    Dim j As Integer
    Dim selected As Integer
    With mfgBOM1
        selected = .RowSel
        txtItemID.Text = .TextMatrix(selected, 0)
        txtItemName.Text = .TextMatrix(selected, 1)
        txtLeadtime.Text = .TextMatrix(selected, 2)
        
        If oldSelectRow(1) Then ' ค่าเป็น 0 ไม่ทำ
            .Row = oldSelectRow(1)
            For j = 0 To .Cols - 1
                .Col = j
                .CellBackColor = .BackColor
                .CellForeColor = .ForeColor
            Next
        End If
        .Row = selected
        For j = 0 To .Cols - 1
            .Col = j
            .CellBackColor = .BackColorSel
            .CellForeColor = .ForeColorSel
        Next
    End With
    oldSelectRow(1) = selected
End Sub
' double click เพื่อแสดงโครงสร้าง ของ finish goods
Private Sub mfgBOM1_DblClick()
    If mfgBOM1.TextMatrix(mfgBOM1.RowSel, 0) <> "" Then
        selectBom = mfgBOM1.TextMatrix(mfgBOM1.RowSel, 0)
        lblFGSelected.Caption = "ID : " & selectBom
        Call loadBOM
        oldSelectRow(2) = 0
    End If
End Sub

'ให้แสดงรายละเอียดของ finish goods ที่มีข้อมูลอยู่แล้ว
Private Sub txtItemID_LostFocus()
    If txtItemID.Text <> "" Then
        If DataEn.Conn.State = adStateOpen Then
            DataEn.Conn.Close
            DataEn.Conn.Open
        End If
        DataEn.getItemDes txtItemID.Text
        With DataEn.rsgetItemDes
            If .RecordCount Then
               txtItemName.Text = .Fields("ItemName").Value
               'txtItemName.Enabled = False
               txtLeadtime.Text = .Fields("LeadTime").Value
               'txtLeadtime.Enabled = False
            Else
                txtItemName.Text = ""
                'txtItemName.Enabled = True
                'txtLeadtime.Text = ""
                'txtLeadtime.Enabled = True
            End If
        End With
    End If
End Sub

Private Sub txtItemID__GotFocus()
    txtItemName_.Enabled = True
    txtLeadtime_.Enabled = True
End Sub
'ให้แสดงรายละเอียดของ raw material ที่มีข้อมูลอยู่แล้ว
Private Sub txtItemID__LostFocus()
    If txtItemID_.Text <> "" Then
        If DataEn.Conn.State = adStateOpen Then
            DataEn.Conn.Close
            DataEn.Conn.Open
        End If
        DataEn.getItemDes txtItemID_.Text
        With DataEn.rsgetItemDes
            If .RecordCount Then
                txtItemName_.Enabled = False
                txtItemName_.Text = .Fields("ItemName").Value
                txtLeadtime_.Enabled = False
                txtLeadtime_.Text = .Fields("LeadTime").Value
            Else
                txtItemName_.Enabled = True
                txtLeadtime_.Enabled = True
                txtItemName_.Text = ""
                txtLeadtime_.Text = ""
                txtParentID_.Text = ""
                txtLevel_.Text = ""
                txtUnit_.Text = ""
            End If
        End With
    End If
End Sub
'ต้องการดู report
Private Sub cmdViewReport_Click()
    If selectBom <> "" Then
    Else
        MsgBox "คุณยังไม่ได้เลือก Finish Goods", vbOKOnly, "คำเตือน"
    End If
End Sub
'เพิ่มชิ้นส่วนในโครงสร้าง ให้กับ finish goods ที่เลือก
Private Sub cmdAddItem_Click()
    If selectBom <> "" Then
        Dim i As Integer
        Dim NewRow As Integer
        If txtItemID_.Text = "0" Then
            MsgBox "รหัสสินค้าไม่สามารถเป็น 0 ได้", vbOKOnly, "BOM"
            Exit Sub
        End If
        If txtItemID_.Text <> "" And txtItemName_.Text <> "" And txtParentID_.Text <> "" And txtUnit_.Text <> "" And txtLeadtime_.Text <> "" Then
            With mfgBOM1
                If txtParentID_.Text <> selectBom Then
                    For i = 1 To .Rows - 1
                        If txtParentID_.Text = .TextMatrix(i, 0) Then
                            MsgBox "รหัสเบื้องบนที่กรอกเป็นสินค้าสำเร็จรูป ให้แก้ไขที่สินค้านั้น!", vbOKOnly + vbCritical, "BOM"
                            txtItemID_.SetFocus
                            Exit Sub
                        End If
                    Next
                End If
                If txtItemID_.Text = txtParentID_.Text Then
                    MsgBox "รหัสสินค้ากับรหัสสินค้าเบื้องบนเป็นตัวเดียวกันไม่ได้!!!", vbOKOnly + vbCritical, "ไม่ถูกต้อง"
                    txtParentID_.SetFocus
                    Exit Sub
                End If
            End With
            With mfgBOM2
                For i = 1 To .Rows - 1
                    If txtItemID_.Text = .TextMatrix(i, 0) And txtParentID_.Text = .TextMatrix(i, 2) Then
                        If MsgBox("คุณเลือกรายการสินค้าซ้ำ!" & vbNewLine & "ต้องการแก้ไขข้อมูล ?", vbOKCancel + vbCritical, "BOM") = vbCancel Then
                            txtItemID_.SetFocus
                            Exit Sub
                        Else
                            'แก้ไขข้อมูล
                            Dim selected As Integer
                            selected = .RowSel
                            .TextMatrix(selected, 0) = txtItemID_.Text
                            .TextMatrix(selected, 1) = txtItemName_.Text
                            .TextMatrix(selected, 2) = txtParentID_.Text
                            .TextMatrix(selected, 3) = txtLevel_.Text
                            .TextMatrix(selected, 4) = txtUnit_.Text
                            .TextMatrix(selected, 5) = txtLeadtime_.Text
                            GoTo afterInsert
                        End If
                    End If
                Next
                ' เพิ่ม item ลงตาราง
                If .TextMatrix(.Rows - 1, 0) <> "" Then .Rows = .Rows + 1
                NewRow = .Rows - 1
                .TextMatrix(NewRow, 0) = txtItemID_.Text
                .TextMatrix(NewRow, 1) = txtItemName_.Text
                .TextMatrix(NewRow, 2) = txtParentID_.Text
                .TextMatrix(NewRow, 3) = txtLevel_.Text
                .TextMatrix(NewRow, 4) = txtUnit_.Text
                .TextMatrix(NewRow, 5) = txtLeadtime_.Text
afterInsert:
            End With
            txtItemID_.Text = ""
            txtItemName_.Text = ""
            txtParentID_.Text = ""
            txtLevel_.Text = ""
            txtUnit_.Text = ""
            txtLeadtime_.Text = ""
            txtItemID_.SetFocus
        Else
            MsgBox "คุณกรอกข้อมูลไม่ครบ", vbOKOnly, "คำเตือน"
        End If
    Else
        MsgBox "คุณยังไม่ได้เลือก Finish Goods", vbOKOnly, "คำเตือน"
    End If
    oldSelectRow(2) = 0
End Sub
' ลบ item ออกจากโครงสร้าง
Private Sub cmdDeleteItem_Click()
    If oldSelectRow(2) Then
        With mfgBOM2
            If .TextMatrix(.RowSel, 0) <> "" Then
                'If MsgBox("คุณต้องการที่จะลบรหัสสินค้า " & .TextMatrix(.RowSel, 0) & ", รหัสสินค้าเบื้องบน " & .TextMatrix(.RowSel, 2), vbOKCancel, "ยืนยัน (โครงสร้าง)") = vbOK Then
                    Dim selected As Integer
                    selected = .RowSel
                    If .Rows = 2 Then
                        .Clear
                        .Rows = 2
                        Call initGrid
                    Else
                        .RemoveItem selected
                    End If
                'End If
            End If
        End With
    End If
    oldSelectRow(2) = 0
End Sub
' แสดงข้อมูล Raw material แถวที่เลือก
Private Sub mfgBOM2_Click()
    Dim j As Integer
    Dim selected As Integer
    With mfgBOM2
        selected = .RowSel
        txtItemID_.Text = .TextMatrix(selected, 0)
        txtItemName_.Text = .TextMatrix(selected, 1)
        txtParentID_.Text = .TextMatrix(selected, 2)
        txtLevel_.Text = .TextMatrix(selected, 3)
        txtUnit_.Text = .TextMatrix(selected, 4)
        txtLeadtime_.Text = .TextMatrix(selected, 5)
        
        txtItemName_.Enabled = False
        txtLeadtime_.Enabled = False
        
        If oldSelectRow(2) Then
            .Row = oldSelectRow(2)
            For j = 0 To .Cols - 1
                .Col = j
                .CellBackColor = .BackColor
                .CellForeColor = .ForeColor
            Next
        End If
        .Row = selected
        For j = 0 To .Cols - 1
            .Col = j
            .CellBackColor = .BackColorSel
            .CellForeColor = .ForeColorSel
        Next
        'txtParentID_.SetFocus
    End With
    oldSelectRow(2) = selected
End Sub
'บันทึกโครงสร้างสินค้าลงฐานข้อมูล
Private Sub cmdRecord_Click()
    If selectBom <> "" Then
        Dim i As Integer
        Dim runLevel As Integer
        Dim countItem As Integer
        Dim bomLine As String
        runLevel = 0
        countItem = 1
        
        'อัพเดตตาราง BOM_
        If DataEn.Conn.State = adStateOpen Then
                DataEn.Conn.Close
                DataEn.Conn.Open
        End If
        DataEn.deleteBomItem selectBom, selectBom
        
        '##เช็คโครงสร้าง tree
        bomLine = selectBom
        Call getBOM((runLevel + 1), selectBom, countItem, bomLine)
        If mfgBOM2.Rows <> countItem And mfgBOM2.TextMatrix(1, 0) <> "" Then
            MsgBox "โครงสร้าง BOM ไม่ถูกต้อง" & vbNewLine & "ตัวที่ไม่สัมพันธ์จะไม่ถูกบันทึก ตรวจสอบความถูกต้อง", vbOKOnly + vbCritical, "ตรวจสอบ"
        Else
            MsgBox "บันทึกเรียบร้อยแล้ว", vbOKOnly, "Success"
            Call loadBOM
        End If
        
        '##ไม่มีการเช็คโครงสร้าง tree
        'With mfgBOM2
        '    For i = 1 To .Rows - 1
        '        If .TextMatrix(i, 0) <> "" Then
        '            DataEn.dbo_addItem selectBom, .TextMatrix(i, 0), .TextMatrix(i, 1), .TextMatrix(i, 2), .TextMatrix(i, 3), .TextMatrix(i, 4), .TextMatrix(i, 5)
        '        End If
        '    Next
        'End With
        
        'MsgBox "บันทึกเรียบร้อยแล้ว", vbOKOnly, "Success"
    Else
        MsgBox "คุณยังไม่ได้เลือก Finish Goods", vbOKOnly, "คำเตือน"
    End If
    oldSelectRow(2) = 0
End Sub
' ฟังก์ชันทำการไล่ tree : recursive หาจาก grid
Private Sub getBOM(ByVal level As Integer, ByVal parentID As Integer, ByRef countItem As Integer, ByVal bomLine As String)
    Dim i As Integer
        
    If DataEn.Conn.State = adStateOpen Then
            DataEn.Conn.Close
            DataEn.Conn.Open
    End If
    With mfgBOM2
        For i = 1 To .Rows - 1
            If .TextMatrix(i, 2) = CStr(parentID) Then
                ' ตรวจสอบสายของ tree ว่าซ้ำกับด้านบนรึเปล่า ถ้าซ้ำก็ตัดทิ้ง
                Dim list() As String
                list = Split(bomLine, "#")
                Dim j As Integer
                Dim found As Boolean
                found = False
                For j = LBound(list) To UBound(list)
                    If .TextMatrix(i, 0) = list(j) Then
                        found = True
                        Exit For
                    End If
                Next
    
                If Not found Then
                    bomLine = bomLine & "#" & .TextMatrix(i, 0)
                    countItem = countItem + 1
                    DataEn.dbo_addItem selectBom, .TextMatrix(i, 0), .TextMatrix(i, 1), .TextMatrix(i, 2), level, .TextMatrix(i, 4), .TextMatrix(i, 5)
                    Call getBOM((level + 1), .TextMatrix(i, 0), countItem, bomLine)
                End If
            End If
        Next
    End With
End Sub
'## สร้างตารางสำหรับการคำนวณ ทำการไล่ตาม tree ของ BOM
Private Sub createBOM(ByVal assign As String)
    Dim backupSelect As String
    Dim bomLine As String
    backupSelect = selectBom
    selectBom = assign
    If selectBom <> "" Then
        Dim runItem As Integer
        Dim runLevel As Integer
        Dim criLead As Integer
        Dim Lead As Integer
        Dim i As Integer
        runItem = 1
        runLevel = 0
        criLead = 0
        Lead = 0
        With mfgBOM1
            For i = 1 To .Rows - 1
                If .TextMatrix(i, 0) = selectBom Then
                    criLead = .TextMatrix(i, 2)
                    Lead = criLead
                    Exit For
                End If
            Next
        End With
        ' ลบอันเก่าออกก่อน
        If DataEn.Conn.State = adStateOpen Then
            DataEn.Conn.Close
            DataEn.Conn.Open
        End If
        bomLine = selectBom
        DataEn.deleteBOM selectBom
        DataEn.addToBOM selectBom, runItem, 0, 0, 1, selectBom
        Call getBOM_(runItem, (runLevel + 1), criLead, Lead, selectBom, runItem, selectBom, bomLine)
        
        DataEn.dbo_updateCritical selectBom, criLead
    End If
    selectBom = backupSelect
End Sub
' ฟังก์ชันทำการไล่ tree : recursive หาใน database เพราะเป็น BOM อื่นเอามาต่อ
Private Sub getBOM_(ByRef runItem As Integer, ByVal level As Integer, ByRef criLead As Integer, ByRef Lead As Integer, ByVal parentID As Integer, ByVal runParent As Integer, ByVal bomID As Integer, ByVal bomLine As String)
    Dim i As Integer
    Dim endItem As Boolean
    endItem = True
    Dim myData As New DataEn
    
    If myData.Conn.State = adStateOpen Then
        myData.Conn.Close
        myData.Conn.Open
    End If
    myData.getThisChild bomID, parentID
    
    With myData.rsgetThisChild
        Do While Not .EOF
            ' ตรวจสอบสายของ tree ว่าซ้ำกับด้านบนรึเปล่า ถ้าซ้ำก็ตัดทิ้ง
                Dim list() As String
                list = Split(bomLine, "#")
                Dim j As Integer
                Dim found As Boolean
                found = False
                For j = LBound(list) To UBound(list)
                    If .Fields("ItemID").Value = list(j) Then
                        found = True
                        Exit For
                    End If
                Next
    
                If Not found Then
                    Lead = Lead + .Fields("Leadtime").Value
                    If Lead > criLead Then
                        criLead = Lead
                    End If
                    
                    runItem = runItem + 1
                    DataEn.addToBOM selectBom, runItem, runParent, level, .Fields("Unit").Value, .Fields("ItemID").Value
                    Call getBOM_(runItem, (level + 1), criLead, Lead, .Fields("ItemID").Value, runItem, bomID, bomLine)
                    
                    Lead = Lead - .Fields("Leadtime").Value
                    .MoveNext
                    endItem = False
                End If
        Loop
    End With
    
    ' ถ้า parent ของ ชั้นนี้เป็น BOM จะไม่มีลูกต่อ ทำการค้นจาก BOM  อื่น
    If endItem Then
        For i = 1 To mfgBOM1.Rows - 1
            If parentID = mfgBOM1.TextMatrix(i, 0) And bomID <> mfgBOM1.TextMatrix(i, 0) Then
                Call getBOM_(runItem, level, criLead, Lead, parentID, runParent, parentID, bomLine)
                Exit Sub
            End If
        Next
    End If
End Sub
'ปรับค่าในทุก BOM คิดจากทุก BOM
Private Sub cmdRelation_Click()
    Screen.MousePointer = vbHourglass
    Dim i As Integer
    With mfgBOM1
        For i = 1 To .Rows - 1
            Call createBOM(.TextMatrix(i, 0))
        Next
    End With
    'อัพเดต low level
    DataEn.getLowLevel
    With DataEn.rsgetLowLevel
        Do While Not .EOF
            DataEn.updateLowLevel .Fields("Low").Value, .Fields("ItemID").Value
            .MoveNext
        Loop
    End With
    'DataEn.dbo_tableUpdated "BOM"
    blnDataChange = True
    Screen.MousePointer = vbDefault
    MsgBox "ทำการปรับปรุงเรียบร้อยแล้ว", vbOKOnly, "Update"
End Sub
