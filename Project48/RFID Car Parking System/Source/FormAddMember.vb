Option Explicit On 
Option Strict On
Imports System.Data
Imports System.Data.OleDb
Imports System.Drawing.Printing

Public Class FormAddMember
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents grbSearch As System.Windows.Forms.GroupBox
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents grbManage As System.Windows.Forms.GroupBox
    Friend WithEvents cmdEdit As System.Windows.Forms.Button
    Friend WithEvents cmdAdd As System.Windows.Forms.Button
    Friend WithEvents cmdMoveLast As System.Windows.Forms.Button
    Friend WithEvents cmdMoveNext As System.Windows.Forms.Button
    Friend WithEvents cmdMovePrevious As System.Windows.Forms.Button
    Friend WithEvents cmdMoveFirst As System.Windows.Forms.Button
    Friend WithEvents cmdCancel As System.Windows.Forms.Button
    Friend WithEvents cmdOK As System.Windows.Forms.Button
    Friend WithEvents TabControl1 As System.Windows.Forms.TabControl
    Friend WithEvents TabPage1 As System.Windows.Forms.TabPage
    Friend WithEvents cmdPrint As System.Windows.Forms.Button
    Friend WithEvents Label12 As System.Windows.Forms.Label
    Friend WithEvents Label13 As System.Windows.Forms.Label
    Friend WithEvents dtpExpireDate As System.Windows.Forms.DateTimePicker
    Friend WithEvents dtpAdmitDate As System.Windows.Forms.DateTimePicker
    Friend WithEvents cmdBrowse As System.Windows.Forms.Button
    Friend WithEvents picMember As System.Windows.Forms.PictureBox
    Friend WithEvents optFemale As System.Windows.Forms.RadioButton
    Friend WithEvents optMale As System.Windows.Forms.RadioButton
    Friend WithEvents Label14 As System.Windows.Forms.Label
    Friend WithEvents Label15 As System.Windows.Forms.Label
    Friend WithEvents Label16 As System.Windows.Forms.Label
    Friend WithEvents Label17 As System.Windows.Forms.Label
    Friend WithEvents Label18 As System.Windows.Forms.Label
    Friend WithEvents Label19 As System.Windows.Forms.Label
    Friend WithEvents Label20 As System.Windows.Forms.Label
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents TextBoxSearch As System.Windows.Forms.TextBox
    Friend WithEvents ComboBoxSearch As System.Windows.Forms.ComboBox
    Friend WithEvents ComboBoxMemberType As System.Windows.Forms.ComboBox
    Friend WithEvents TextBoxPhone As System.Windows.Forms.TextBox
    Friend WithEvents TextBoxAddress As System.Windows.Forms.TextBox
    Friend WithEvents TextBoxIDCard As System.Windows.Forms.TextBox
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents Timer2 As System.Windows.Forms.Timer
    Friend WithEvents TextBoxFullName As System.Windows.Forms.TextBox
    Friend WithEvents TextBoxMemberID As System.Windows.Forms.TextBox
    Friend WithEvents LabelShowPositions As System.Windows.Forms.Label
    Friend WithEvents OpenFileDialog1 As System.Windows.Forms.OpenFileDialog
    Friend WithEvents ComboBoxCarColor As System.Windows.Forms.ComboBox
    Friend WithEvents ComboBoxCarType As System.Windows.Forms.ComboBox
    Friend WithEvents ComboBoxCarVersion As System.Windows.Forms.ComboBox
    Friend WithEvents ComboBoxCarBrand As System.Windows.Forms.ComboBox
    Friend WithEvents ComboBoxProvince As System.Windows.Forms.ComboBox
    Friend WithEvents TextBoxCarNumber As System.Windows.Forms.TextBox
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Button2 As System.Windows.Forms.Button
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents cmdPrint2 As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(FormAddMember))
        Me.grbSearch = New System.Windows.Forms.GroupBox
        Me.TextBoxSearch = New System.Windows.Forms.TextBox
        Me.ComboBoxSearch = New System.Windows.Forms.ComboBox
        Me.Label11 = New System.Windows.Forms.Label
        Me.grbManage = New System.Windows.Forms.GroupBox
        Me.cmdEdit = New System.Windows.Forms.Button
        Me.cmdAdd = New System.Windows.Forms.Button
        Me.LabelShowPositions = New System.Windows.Forms.Label
        Me.cmdMoveLast = New System.Windows.Forms.Button
        Me.cmdMoveNext = New System.Windows.Forms.Button
        Me.cmdMovePrevious = New System.Windows.Forms.Button
        Me.cmdMoveFirst = New System.Windows.Forms.Button
        Me.cmdCancel = New System.Windows.Forms.Button
        Me.cmdOK = New System.Windows.Forms.Button
        Me.TabControl1 = New System.Windows.Forms.TabControl
        Me.TabPage1 = New System.Windows.Forms.TabPage
        Me.TextBoxMemberID = New System.Windows.Forms.TextBox
        Me.cmdPrint = New System.Windows.Forms.Button
        Me.ComboBoxMemberType = New System.Windows.Forms.ComboBox
        Me.Label12 = New System.Windows.Forms.Label
        Me.Label13 = New System.Windows.Forms.Label
        Me.dtpExpireDate = New System.Windows.Forms.DateTimePicker
        Me.dtpAdmitDate = New System.Windows.Forms.DateTimePicker
        Me.cmdBrowse = New System.Windows.Forms.Button
        Me.picMember = New System.Windows.Forms.PictureBox
        Me.optFemale = New System.Windows.Forms.RadioButton
        Me.optMale = New System.Windows.Forms.RadioButton
        Me.Label14 = New System.Windows.Forms.Label
        Me.TextBoxPhone = New System.Windows.Forms.TextBox
        Me.TextBoxAddress = New System.Windows.Forms.TextBox
        Me.Label15 = New System.Windows.Forms.Label
        Me.Label16 = New System.Windows.Forms.Label
        Me.TextBoxIDCard = New System.Windows.Forms.TextBox
        Me.Label17 = New System.Windows.Forms.Label
        Me.TextBoxFullName = New System.Windows.Forms.TextBox
        Me.Label18 = New System.Windows.Forms.Label
        Me.Label19 = New System.Windows.Forms.Label
        Me.Label20 = New System.Windows.Forms.Label
        Me.TabPage2 = New System.Windows.Forms.TabPage
        Me.ComboBoxCarColor = New System.Windows.Forms.ComboBox
        Me.ComboBoxCarType = New System.Windows.Forms.ComboBox
        Me.ComboBoxCarVersion = New System.Windows.Forms.ComboBox
        Me.ComboBoxCarBrand = New System.Windows.Forms.ComboBox
        Me.ComboBoxProvince = New System.Windows.Forms.ComboBox
        Me.TextBoxCarNumber = New System.Windows.Forms.TextBox
        Me.Label8 = New System.Windows.Forms.Label
        Me.Label7 = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.Timer2 = New System.Windows.Forms.Timer(Me.components)
        Me.OpenFileDialog1 = New System.Windows.Forms.OpenFileDialog
        Me.Button2 = New System.Windows.Forms.Button
        Me.PictureBox1 = New System.Windows.Forms.PictureBox
        Me.cmdPrint2 = New System.Windows.Forms.Button
        Me.grbSearch.SuspendLayout()
        Me.grbManage.SuspendLayout()
        Me.TabControl1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        Me.TabPage2.SuspendLayout()
        Me.SuspendLayout()
        '
        'grbSearch
        '
        Me.grbSearch.Controls.Add(Me.TextBoxSearch)
        Me.grbSearch.Controls.Add(Me.ComboBoxSearch)
        Me.grbSearch.Controls.Add(Me.Label11)
        Me.grbSearch.Location = New System.Drawing.Point(512, 24)
        Me.grbSearch.Name = "grbSearch"
        Me.grbSearch.Size = New System.Drawing.Size(216, 88)
        Me.grbSearch.TabIndex = 30
        Me.grbSearch.TabStop = False
        Me.grbSearch.Text = "ค้นหาข้อมูล"
        '
        'TextBoxSearch
        '
        Me.TextBoxSearch.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxSearch.Location = New System.Drawing.Point(8, 56)
        Me.TextBoxSearch.MaxLength = 100
        Me.TextBoxSearch.Name = "TextBoxSearch"
        Me.TextBoxSearch.Size = New System.Drawing.Size(200, 20)
        Me.TextBoxSearch.TabIndex = 0
        Me.TextBoxSearch.Text = ""
        '
        'ComboBoxSearch
        '
        Me.ComboBoxSearch.Cursor = System.Windows.Forms.Cursors.Hand
        Me.ComboBoxSearch.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ComboBoxSearch.Location = New System.Drawing.Point(64, 24)
        Me.ComboBoxSearch.Name = "ComboBoxSearch"
        Me.ComboBoxSearch.Size = New System.Drawing.Size(144, 21)
        Me.ComboBoxSearch.TabIndex = 1
        '
        'Label11
        '
        Me.Label11.Location = New System.Drawing.Point(8, 24)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(56, 20)
        Me.Label11.TabIndex = 1
        Me.Label11.Text = "เงื่อนไข :"
        '
        'grbManage
        '
        Me.grbManage.Controls.Add(Me.cmdEdit)
        Me.grbManage.Controls.Add(Me.cmdAdd)
        Me.grbManage.Controls.Add(Me.LabelShowPositions)
        Me.grbManage.Controls.Add(Me.cmdMoveLast)
        Me.grbManage.Controls.Add(Me.cmdMoveNext)
        Me.grbManage.Controls.Add(Me.cmdMovePrevious)
        Me.grbManage.Controls.Add(Me.cmdMoveFirst)
        Me.grbManage.Location = New System.Drawing.Point(512, 120)
        Me.grbManage.Name = "grbManage"
        Me.grbManage.Size = New System.Drawing.Size(216, 144)
        Me.grbManage.TabIndex = 31
        Me.grbManage.TabStop = False
        Me.grbManage.Text = "จัดการข้อมูล"
        '
        'cmdEdit
        '
        Me.cmdEdit.BackColor = System.Drawing.Color.FromArgb(CType(192, Byte), CType(255, Byte), CType(255, Byte))
        Me.cmdEdit.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdEdit.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdEdit.Image = CType(resources.GetObject("cmdEdit.Image"), System.Drawing.Image)
        Me.cmdEdit.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.cmdEdit.Location = New System.Drawing.Point(112, 24)
        Me.cmdEdit.Name = "cmdEdit"
        Me.cmdEdit.Size = New System.Drawing.Size(96, 56)
        Me.cmdEdit.TabIndex = 1
        Me.cmdEdit.Text = "แก้ไขข้อมูล"
        Me.cmdEdit.TextAlign = System.Drawing.ContentAlignment.BottomCenter
        '
        'cmdAdd
        '
        Me.cmdAdd.BackColor = System.Drawing.Color.FromArgb(CType(192, Byte), CType(255, Byte), CType(192, Byte))
        Me.cmdAdd.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdAdd.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdAdd.Image = CType(resources.GetObject("cmdAdd.Image"), System.Drawing.Image)
        Me.cmdAdd.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.cmdAdd.Location = New System.Drawing.Point(8, 24)
        Me.cmdAdd.Name = "cmdAdd"
        Me.cmdAdd.Size = New System.Drawing.Size(96, 56)
        Me.cmdAdd.TabIndex = 0
        Me.cmdAdd.Text = "เพิ่มข้อมูล"
        Me.cmdAdd.TextAlign = System.Drawing.ContentAlignment.BottomCenter
        '
        'LabelShowPositions
        '
        Me.LabelShowPositions.BackColor = System.Drawing.Color.FromArgb(CType(255, Byte), CType(255, Byte), CType(192, Byte))
        Me.LabelShowPositions.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.LabelShowPositions.Location = New System.Drawing.Point(56, 104)
        Me.LabelShowPositions.Name = "LabelShowPositions"
        Me.LabelShowPositions.Size = New System.Drawing.Size(104, 20)
        Me.LabelShowPositions.TabIndex = 13
        '
        'cmdMoveLast
        '
        Me.cmdMoveLast.BackColor = System.Drawing.Color.MintCream
        Me.cmdMoveLast.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMoveLast.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdMoveLast.Location = New System.Drawing.Point(184, 104)
        Me.cmdMoveLast.Name = "cmdMoveLast"
        Me.cmdMoveLast.Size = New System.Drawing.Size(24, 20)
        Me.cmdMoveLast.TabIndex = 5
        Me.cmdMoveLast.Text = ">|"
        '
        'cmdMoveNext
        '
        Me.cmdMoveNext.BackColor = System.Drawing.Color.MintCream
        Me.cmdMoveNext.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMoveNext.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdMoveNext.Location = New System.Drawing.Point(160, 104)
        Me.cmdMoveNext.Name = "cmdMoveNext"
        Me.cmdMoveNext.Size = New System.Drawing.Size(24, 20)
        Me.cmdMoveNext.TabIndex = 4
        Me.cmdMoveNext.Text = ">"
        '
        'cmdMovePrevious
        '
        Me.cmdMovePrevious.BackColor = System.Drawing.Color.MintCream
        Me.cmdMovePrevious.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMovePrevious.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdMovePrevious.Location = New System.Drawing.Point(32, 104)
        Me.cmdMovePrevious.Name = "cmdMovePrevious"
        Me.cmdMovePrevious.Size = New System.Drawing.Size(24, 20)
        Me.cmdMovePrevious.TabIndex = 3
        Me.cmdMovePrevious.Text = "<"
        '
        'cmdMoveFirst
        '
        Me.cmdMoveFirst.BackColor = System.Drawing.Color.MintCream
        Me.cmdMoveFirst.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdMoveFirst.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdMoveFirst.Location = New System.Drawing.Point(8, 104)
        Me.cmdMoveFirst.Name = "cmdMoveFirst"
        Me.cmdMoveFirst.Size = New System.Drawing.Size(24, 20)
        Me.cmdMoveFirst.TabIndex = 2
        Me.cmdMoveFirst.Text = "|<"
        '
        'cmdCancel
        '
        Me.cmdCancel.BackColor = System.Drawing.Color.FromArgb(CType(255, Byte), CType(192, Byte), CType(192, Byte))
        Me.cmdCancel.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdCancel.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdCancel.Image = CType(resources.GetObject("cmdCancel.Image"), System.Drawing.Image)
        Me.cmdCancel.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.cmdCancel.Location = New System.Drawing.Point(632, 272)
        Me.cmdCancel.Name = "cmdCancel"
        Me.cmdCancel.Size = New System.Drawing.Size(96, 56)
        Me.cmdCancel.TabIndex = 33
        Me.cmdCancel.Text = "ยกเลิก"
        Me.cmdCancel.TextAlign = System.Drawing.ContentAlignment.BottomCenter
        '
        'cmdOK
        '
        Me.cmdOK.BackColor = System.Drawing.Color.LightCyan
        Me.cmdOK.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdOK.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdOK.Image = CType(resources.GetObject("cmdOK.Image"), System.Drawing.Image)
        Me.cmdOK.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.cmdOK.Location = New System.Drawing.Point(512, 272)
        Me.cmdOK.Name = "cmdOK"
        Me.cmdOK.Size = New System.Drawing.Size(96, 56)
        Me.cmdOK.TabIndex = 32
        Me.cmdOK.Text = "บันทึกลงฐานข้อมูล"
        Me.cmdOK.TextAlign = System.Drawing.ContentAlignment.BottomCenter
        '
        'TabControl1
        '
        Me.TabControl1.Controls.Add(Me.TabPage1)
        Me.TabControl1.Controls.Add(Me.TabPage2)
        Me.TabControl1.Location = New System.Drawing.Point(8, 8)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(496, 320)
        Me.TabControl1.TabIndex = 34
        '
        'TabPage1
        '
        Me.TabPage1.Controls.Add(Me.TextBoxMemberID)
        Me.TabPage1.Controls.Add(Me.cmdPrint)
        Me.TabPage1.Controls.Add(Me.ComboBoxMemberType)
        Me.TabPage1.Controls.Add(Me.Label12)
        Me.TabPage1.Controls.Add(Me.Label13)
        Me.TabPage1.Controls.Add(Me.dtpExpireDate)
        Me.TabPage1.Controls.Add(Me.dtpAdmitDate)
        Me.TabPage1.Controls.Add(Me.cmdBrowse)
        Me.TabPage1.Controls.Add(Me.picMember)
        Me.TabPage1.Controls.Add(Me.optFemale)
        Me.TabPage1.Controls.Add(Me.optMale)
        Me.TabPage1.Controls.Add(Me.Label14)
        Me.TabPage1.Controls.Add(Me.TextBoxPhone)
        Me.TabPage1.Controls.Add(Me.TextBoxAddress)
        Me.TabPage1.Controls.Add(Me.Label15)
        Me.TabPage1.Controls.Add(Me.Label16)
        Me.TabPage1.Controls.Add(Me.TextBoxIDCard)
        Me.TabPage1.Controls.Add(Me.Label17)
        Me.TabPage1.Controls.Add(Me.TextBoxFullName)
        Me.TabPage1.Controls.Add(Me.Label18)
        Me.TabPage1.Controls.Add(Me.Label19)
        Me.TabPage1.Controls.Add(Me.Label20)
        Me.TabPage1.Location = New System.Drawing.Point(4, 22)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Size = New System.Drawing.Size(488, 294)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "ข้อมูลสมาชิก"
        '
        'TextBoxMemberID
        '
        Me.TextBoxMemberID.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxMemberID.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxMemberID.Location = New System.Drawing.Point(112, 11)
        Me.TextBoxMemberID.MaxLength = 20
        Me.TextBoxMemberID.Name = "TextBoxMemberID"
        Me.TextBoxMemberID.ReadOnly = True
        Me.TextBoxMemberID.Size = New System.Drawing.Size(150, 22)
        Me.TextBoxMemberID.TabIndex = 56
        Me.TextBoxMemberID.Text = "--กรุณาแสดงบัตร--"
        Me.TextBoxMemberID.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'cmdPrint
        '
        Me.cmdPrint.BackColor = System.Drawing.Color.White
        Me.cmdPrint.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdPrint.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdPrint.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.cmdPrint.Image = CType(resources.GetObject("cmdPrint.Image"), System.Drawing.Image)
        Me.cmdPrint.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.cmdPrint.Location = New System.Drawing.Point(352, 231)
        Me.cmdPrint.Name = "cmdPrint"
        Me.cmdPrint.Size = New System.Drawing.Size(96, 56)
        Me.cmdPrint.TabIndex = 10
        Me.cmdPrint.Text = "พิมพ์ข้อมูล"
        Me.cmdPrint.TextAlign = System.Drawing.ContentAlignment.BottomCenter
        '
        'ComboBoxMemberType
        '
        Me.ComboBoxMemberType.Cursor = System.Windows.Forms.Cursors.Hand
        Me.ComboBoxMemberType.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ComboBoxMemberType.Items.AddRange(New Object() {"ทั่วไป", "สมาชิก"})
        Me.ComboBoxMemberType.Location = New System.Drawing.Point(352, 13)
        Me.ComboBoxMemberType.Name = "ComboBoxMemberType"
        Me.ComboBoxMemberType.Size = New System.Drawing.Size(128, 21)
        Me.ComboBoxMemberType.TabIndex = 8
        Me.ComboBoxMemberType.Text = "--เลือกประเภทลูกค้า--"
        '
        'Label12
        '
        Me.Label12.AutoSize = True
        Me.Label12.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label12.Location = New System.Drawing.Point(16, 264)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(105, 18)
        Me.Label12.TabIndex = 55
        Me.Label12.Text = "วันหมดอายุสมาชิก :"
        Me.Label12.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label13
        '
        Me.Label13.AutoSize = True
        Me.Label13.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label13.Location = New System.Drawing.Point(16, 232)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(91, 18)
        Me.Label13.TabIndex = 54
        Me.Label13.Text = "วันสมัครสมาชิก :"
        Me.Label13.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'dtpExpireDate
        '
        Me.dtpExpireDate.Cursor = System.Windows.Forms.Cursors.Hand
        Me.dtpExpireDate.Location = New System.Drawing.Point(136, 264)
        Me.dtpExpireDate.Name = "dtpExpireDate"
        Me.dtpExpireDate.Size = New System.Drawing.Size(144, 20)
        Me.dtpExpireDate.TabIndex = 7
        '
        'dtpAdmitDate
        '
        Me.dtpAdmitDate.Cursor = System.Windows.Forms.Cursors.Hand
        Me.dtpAdmitDate.Location = New System.Drawing.Point(136, 232)
        Me.dtpAdmitDate.Name = "dtpAdmitDate"
        Me.dtpAdmitDate.Size = New System.Drawing.Size(144, 20)
        Me.dtpAdmitDate.TabIndex = 6
        '
        'cmdBrowse
        '
        Me.cmdBrowse.BackColor = System.Drawing.Color.Azure
        Me.cmdBrowse.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdBrowse.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdBrowse.Location = New System.Drawing.Point(456, 231)
        Me.cmdBrowse.Name = "cmdBrowse"
        Me.cmdBrowse.Size = New System.Drawing.Size(24, 24)
        Me.cmdBrowse.TabIndex = 9
        Me.cmdBrowse.Text = "..."
        '
        'picMember
        '
        Me.picMember.BackColor = System.Drawing.Color.Honeydew
        Me.picMember.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.picMember.Location = New System.Drawing.Point(352, 56)
        Me.picMember.Name = "picMember"
        Me.picMember.Size = New System.Drawing.Size(128, 168)
        Me.picMember.TabIndex = 53
        Me.picMember.TabStop = False
        '
        'optFemale
        '
        Me.optFemale.Cursor = System.Windows.Forms.Cursors.Hand
        Me.optFemale.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.optFemale.Location = New System.Drawing.Point(192, 67)
        Me.optFemale.Name = "optFemale"
        Me.optFemale.Size = New System.Drawing.Size(48, 20)
        Me.optFemale.TabIndex = 2
        Me.optFemale.Text = "หญิง"
        '
        'optMale
        '
        Me.optMale.Checked = True
        Me.optMale.Cursor = System.Windows.Forms.Cursors.Hand
        Me.optMale.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.optMale.Location = New System.Drawing.Point(136, 67)
        Me.optMale.Name = "optMale"
        Me.optMale.Size = New System.Drawing.Size(56, 20)
        Me.optMale.TabIndex = 1
        Me.optMale.TabStop = True
        Me.optMale.Text = "ชาย"
        '
        'Label14
        '
        Me.Label14.AutoSize = True
        Me.Label14.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label14.Location = New System.Drawing.Point(16, 67)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(32, 18)
        Me.Label14.TabIndex = 52
        Me.Label14.Text = "เพศ :"
        Me.Label14.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'TextBoxPhone
        '
        Me.TextBoxPhone.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxPhone.Location = New System.Drawing.Point(136, 200)
        Me.TextBoxPhone.MaxLength = 35
        Me.TextBoxPhone.Name = "TextBoxPhone"
        Me.TextBoxPhone.Size = New System.Drawing.Size(180, 20)
        Me.TextBoxPhone.TabIndex = 5
        Me.TextBoxPhone.Text = ""
        '
        'TextBoxAddress
        '
        Me.TextBoxAddress.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxAddress.Location = New System.Drawing.Point(136, 128)
        Me.TextBoxAddress.MaxLength = 250
        Me.TextBoxAddress.Multiline = True
        Me.TextBoxAddress.Name = "TextBoxAddress"
        Me.TextBoxAddress.Size = New System.Drawing.Size(180, 60)
        Me.TextBoxAddress.TabIndex = 4
        Me.TextBoxAddress.Text = ""
        '
        'Label15
        '
        Me.Label15.AutoSize = True
        Me.Label15.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label15.Location = New System.Drawing.Point(16, 200)
        Me.Label15.Name = "Label15"
        Me.Label15.Size = New System.Drawing.Size(81, 18)
        Me.Label15.TabIndex = 51
        Me.Label15.Text = "เบอร์โทรศัพท์ :"
        Me.Label15.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label16
        '
        Me.Label16.AutoSize = True
        Me.Label16.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label16.Location = New System.Drawing.Point(16, 128)
        Me.Label16.Name = "Label16"
        Me.Label16.Size = New System.Drawing.Size(34, 18)
        Me.Label16.TabIndex = 50
        Me.Label16.Text = "ที่อยู่ :"
        Me.Label16.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'TextBoxIDCard
        '
        Me.TextBoxIDCard.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxIDCard.Location = New System.Drawing.Point(136, 94)
        Me.TextBoxIDCard.MaxLength = 17
        Me.TextBoxIDCard.Name = "TextBoxIDCard"
        Me.TextBoxIDCard.Size = New System.Drawing.Size(180, 20)
        Me.TextBoxIDCard.TabIndex = 3
        Me.TextBoxIDCard.Text = ""
        '
        'Label17
        '
        Me.Label17.AutoSize = True
        Me.Label17.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label17.Location = New System.Drawing.Point(16, 94)
        Me.Label17.Name = "Label17"
        Me.Label17.Size = New System.Drawing.Size(129, 18)
        Me.Label17.TabIndex = 49
        Me.Label17.Text = "หมายเลขบัตรประชาชน :"
        Me.Label17.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'TextBoxFullName
        '
        Me.TextBoxFullName.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxFullName.Location = New System.Drawing.Point(112, 40)
        Me.TextBoxFullName.MaxLength = 85
        Me.TextBoxFullName.Name = "TextBoxFullName"
        Me.TextBoxFullName.Size = New System.Drawing.Size(180, 20)
        Me.TextBoxFullName.TabIndex = 0
        Me.TextBoxFullName.Text = ""
        '
        'Label18
        '
        Me.Label18.AutoSize = True
        Me.Label18.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label18.Location = New System.Drawing.Point(16, 40)
        Me.Label18.Name = "Label18"
        Me.Label18.Size = New System.Drawing.Size(52, 18)
        Me.Label18.TabIndex = 48
        Me.Label18.Text = "ชื่อ-สกุล :"
        Me.Label18.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label19
        '
        Me.Label19.AutoSize = True
        Me.Label19.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label19.Location = New System.Drawing.Point(272, 13)
        Me.Label19.Name = "Label19"
        Me.Label19.Size = New System.Drawing.Size(79, 18)
        Me.Label19.TabIndex = 46
        Me.Label19.Text = "ประเภทลูกค้า :"
        Me.Label19.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label20
        '
        Me.Label20.AutoSize = True
        Me.Label20.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label20.Location = New System.Drawing.Point(16, 13)
        Me.Label20.Name = "Label20"
        Me.Label20.Size = New System.Drawing.Size(69, 18)
        Me.Label20.TabIndex = 45
        Me.Label20.Text = "รหัสสมาชิก :"
        Me.Label20.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'TabPage2
        '
        Me.TabPage2.Controls.Add(Me.cmdPrint2)
        Me.TabPage2.Controls.Add(Me.Button2)
        Me.TabPage2.Controls.Add(Me.PictureBox1)
        Me.TabPage2.Controls.Add(Me.ComboBoxCarColor)
        Me.TabPage2.Controls.Add(Me.ComboBoxCarType)
        Me.TabPage2.Controls.Add(Me.ComboBoxCarVersion)
        Me.TabPage2.Controls.Add(Me.ComboBoxCarBrand)
        Me.TabPage2.Controls.Add(Me.ComboBoxProvince)
        Me.TabPage2.Controls.Add(Me.TextBoxCarNumber)
        Me.TabPage2.Controls.Add(Me.Label8)
        Me.TabPage2.Controls.Add(Me.Label7)
        Me.TabPage2.Controls.Add(Me.Label6)
        Me.TabPage2.Controls.Add(Me.Label5)
        Me.TabPage2.Controls.Add(Me.Label4)
        Me.TabPage2.Controls.Add(Me.Label3)
        Me.TabPage2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TabPage2.Location = New System.Drawing.Point(4, 22)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Size = New System.Drawing.Size(488, 294)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "ข้อมูลรถ"
        Me.TabPage2.Visible = False
        '
        'ComboBoxCarColor
        '
        Me.ComboBoxCarColor.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ComboBoxCarColor.Items.AddRange(New Object() {"ขาว", "เขียว", "ครีม", "แดง", "ดำ", "ทอง", "เทา", "น้ำเงิน", "ม่วง", "ส้ม", "เหลือง"})
        Me.ComboBoxCarColor.Location = New System.Drawing.Point(96, 216)
        Me.ComboBoxCarColor.MaxDropDownItems = 5
        Me.ComboBoxCarColor.Name = "ComboBoxCarColor"
        Me.ComboBoxCarColor.Size = New System.Drawing.Size(120, 24)
        Me.ComboBoxCarColor.TabIndex = 26
        Me.ComboBoxCarColor.Text = "--เลือกสี--"
        '
        'ComboBoxCarType
        '
        Me.ComboBoxCarType.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ComboBoxCarType.Items.AddRange(New Object() {"รถกระบะ", "รถเก๋ง", "รถตู้"})
        Me.ComboBoxCarType.Location = New System.Drawing.Point(96, 176)
        Me.ComboBoxCarType.MaxDropDownItems = 5
        Me.ComboBoxCarType.Name = "ComboBoxCarType"
        Me.ComboBoxCarType.Size = New System.Drawing.Size(120, 24)
        Me.ComboBoxCarType.TabIndex = 25
        Me.ComboBoxCarType.Text = "--เลือกชนิด--"
        '
        'ComboBoxCarVersion
        '
        Me.ComboBoxCarVersion.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ComboBoxCarVersion.Location = New System.Drawing.Point(96, 136)
        Me.ComboBoxCarVersion.MaxDropDownItems = 10
        Me.ComboBoxCarVersion.Name = "ComboBoxCarVersion"
        Me.ComboBoxCarVersion.Size = New System.Drawing.Size(120, 24)
        Me.ComboBoxCarVersion.TabIndex = 24
        Me.ComboBoxCarVersion.Text = "--เลือกรุ่น--"
        '
        'ComboBoxCarBrand
        '
        Me.ComboBoxCarBrand.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ComboBoxCarBrand.Items.AddRange(New Object() {"โตโยต้า", "มิตซูบิชิ", "อิซูซุ"})
        Me.ComboBoxCarBrand.Location = New System.Drawing.Point(96, 96)
        Me.ComboBoxCarBrand.MaxDropDownItems = 10
        Me.ComboBoxCarBrand.Name = "ComboBoxCarBrand"
        Me.ComboBoxCarBrand.Size = New System.Drawing.Size(120, 24)
        Me.ComboBoxCarBrand.Sorted = True
        Me.ComboBoxCarBrand.TabIndex = 23
        Me.ComboBoxCarBrand.Text = "--เลือกยี่ห้อ--"
        '
        'ComboBoxProvince
        '
        Me.ComboBoxProvince.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ComboBoxProvince.Items.AddRange(New Object() {"กรุงเทพมหานคร", "ชลบุรี", "เชียงราย", "เชียงใหม่", "เพชรบุรี", "ราชบุรี"})
        Me.ComboBoxProvince.Location = New System.Drawing.Point(96, 56)
        Me.ComboBoxProvince.MaxDropDownItems = 10
        Me.ComboBoxProvince.Name = "ComboBoxProvince"
        Me.ComboBoxProvince.Size = New System.Drawing.Size(120, 24)
        Me.ComboBoxProvince.Sorted = True
        Me.ComboBoxProvince.TabIndex = 22
        Me.ComboBoxProvince.Text = "--เลือกจังหวัด--"
        '
        'TextBoxCarNumber
        '
        Me.TextBoxCarNumber.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxCarNumber.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxCarNumber.Location = New System.Drawing.Point(96, 16)
        Me.TextBoxCarNumber.MaxLength = 7
        Me.TextBoxCarNumber.Name = "TextBoxCarNumber"
        Me.TextBoxCarNumber.Size = New System.Drawing.Size(64, 22)
        Me.TextBoxCarNumber.TabIndex = 21
        Me.TextBoxCarNumber.Text = ""
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label8.Location = New System.Drawing.Point(16, 216)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(19, 18)
        Me.Label8.TabIndex = 20
        Me.Label8.Text = "สี :"
        Me.Label8.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label7.Location = New System.Drawing.Point(16, 176)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(35, 18)
        Me.Label7.TabIndex = 19
        Me.Label7.Text = "ชนิด :"
        Me.Label7.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label6.Location = New System.Drawing.Point(16, 136)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(27, 18)
        Me.Label6.TabIndex = 18
        Me.Label6.Text = "รุ่น :"
        Me.Label6.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label5.Location = New System.Drawing.Point(16, 96)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(34, 18)
        Me.Label5.TabIndex = 17
        Me.Label5.Text = "ยี่ห้อ :"
        Me.Label5.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label4.Location = New System.Drawing.Point(16, 56)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(46, 18)
        Me.Label4.TabIndex = 16
        Me.Label4.Text = "จังหวัด :"
        Me.Label4.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label3.Location = New System.Drawing.Point(16, 16)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(52, 18)
        Me.Label3.TabIndex = 15
        Me.Label3.Text = "ทะเบียน :"
        Me.Label3.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Timer1
        '
        Me.Timer1.Enabled = True
        '
        'Timer2
        '
        '
        'Button2
        '
        Me.Button2.BackColor = System.Drawing.Color.Azure
        Me.Button2.Cursor = System.Windows.Forms.Cursors.Hand
        Me.Button2.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.Button2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Button2.Location = New System.Drawing.Point(456, 231)
        Me.Button2.Name = "Button2"
        Me.Button2.Size = New System.Drawing.Size(24, 24)
        Me.Button2.TabIndex = 54
        Me.Button2.Text = "..."
        '
        'PictureBox1
        '
        Me.PictureBox1.BackColor = System.Drawing.Color.Honeydew
        Me.PictureBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.PictureBox1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.PictureBox1.Location = New System.Drawing.Point(352, 56)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(128, 168)
        Me.PictureBox1.TabIndex = 56
        Me.PictureBox1.TabStop = False
        '
        'cmdPrint2
        '
        Me.cmdPrint2.BackColor = System.Drawing.Color.White
        Me.cmdPrint2.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdPrint2.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdPrint2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.cmdPrint2.Image = CType(resources.GetObject("cmdPrint2.Image"), System.Drawing.Image)
        Me.cmdPrint2.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.cmdPrint2.Location = New System.Drawing.Point(352, 231)
        Me.cmdPrint2.Name = "cmdPrint2"
        Me.cmdPrint2.Size = New System.Drawing.Size(96, 56)
        Me.cmdPrint2.TabIndex = 55
        Me.cmdPrint2.Text = "พิมพ์ข้อมูล"
        Me.cmdPrint2.TextAlign = System.Drawing.ContentAlignment.BottomCenter
        '
        'FormAddMember
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.AutoScroll = True
        Me.ClientSize = New System.Drawing.Size(736, 334)
        Me.Controls.Add(Me.grbSearch)
        Me.Controls.Add(Me.grbManage)
        Me.Controls.Add(Me.cmdCancel)
        Me.Controls.Add(Me.cmdOK)
        Me.Controls.Add(Me.TabControl1)
        Me.Name = "FormAddMember"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent
        Me.Text = "เพิ่มข้อมูลสมาชิก"
        Me.grbSearch.ResumeLayout(False)
        Me.grbManage.ResumeLayout(False)
        Me.TabControl1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.TabPage2.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As OleDbConnection = New OleDbConnection
    Dim da As OleDbDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Dim Today As Date

    Dim CurrentRecord As Integer = 0
    Dim RecordCount As Integer = 0

    Dim ActionFlag As String = ""
    Dim tmpFileName As String = ""

    Dim UseFont As New Font("MS Sans Serif", 10)
    Dim prDoc As PrintDocument = New PrintDocument
    Dim prDlg As PrintDialog = New PrintDialog

    Dim IsFind As Boolean = False
    Dim IsFindCarNotReturn As Boolean = False
    Dim ToClose As Boolean = False

    Private Sub FormMember_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Cursor.Current = Cursors.WaitCursor

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        Dim sqlMemberType As String = ""
        sqlMemberType = "SELECT MemberType,MemberDesc "
        sqlMemberType &= " FROM MemberType"
        sqlMemberType &= " ORDER BY MemberType"

        da = New OleDbDataAdapter(sqlMemberType, Conn)
        da.Fill(ds, "MemberType")

        If ds.Tables("MemberType").Rows.Count <> 0 Then
            With ComboBoxMemberType
                .DataSource = ds.Tables("MemberType")
                .DisplayMember = "MemberDesc"
                .ValueMember = "MemberType"
            End With
        End If

        With ComboBoxSearch
            .Items.Add("รหัสสมาชิก")
            .Items.Add("ชื่อ-สกุลสมาชิก")
            .Items.Add("หมายเลขบัตรประชาชน")
            .Items.Add("เบอร์โทรศัพท์")
            .SelectedIndex = 0
        End With

        Today = Date.Now
        dtpAdmitDate.Value = Today
        dtpExpireDate.Value = Today.AddMonths(1)

        ControlStatus(False)

        cmdEdit.Enabled = False
        cmdOK.Visible = False
        cmdCancel.Visible = False

        cmdMoveFirst.Enabled = False
        cmdMovePrevious.Enabled = False
        cmdMoveNext.Enabled = False
        cmdMoveLast.Enabled = False

        cmdPrint.Enabled = False

        AddHandler prDoc.PrintPage, New PrintPageEventHandler(AddressOf Me.StringToPrint_Print)
        prDoc.DocumentName = "ข้อมูลสมาชิก"
        prDlg.Document = prDoc

        Cursor.Current = Cursors.Default
    End Sub

    Private Sub TextBoxSearch_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles TextBoxSearch.KeyDown
        If TextBoxSearch.Text <> "" Then
            If (e.KeyCode = Keys.Enter) Then
                Dim sqlMember As String = ""

                sqlMember = "SELECT a.*,c.*,d.MemberDesc FROM Member a,joinCarMember b,Car c,MemberType d Where a.MemberType=d.MemberType and a.MemberID = b.MemberID and b.CarNumber = c.CarNumber "
                If ComboBoxSearch.SelectedIndex = 0 Then
                    sqlMember &= " and (a.MemberID='" & TextBoxSearch.Text & "')"
                ElseIf ComboBoxSearch.SelectedIndex = 1 Then
                    sqlMember &= " and (a.FullName LIKE '%" & TextBoxSearch.Text & "%')"
                ElseIf ComboBoxSearch.SelectedIndex = 2 Then
                    sqlMember &= " and (a.IDCard LIKE '%" & TextBoxSearch.Text & "%')"
                ElseIf ComboBoxSearch.SelectedIndex = 3 Then
                    sqlMember &= " and (a.Phone LIKE '%" & TextBoxSearch.Text & "%')"
                End If

                With Conn
                    If .State = ConnectionState.Open Then .Close()
                    .ConnectionString = strConn
                    .Open()
                End With

                da.SelectCommand.CommandText = sqlMember
                If IsFind Then
                    ds.Tables("Member").Clear()
                End If
                da.Fill(ds, "Member")

                If ds.Tables("Member").Rows.Count <> 0 Then
                    IsFind = True
                    ClearBinding()

                    With ComboBoxMemberType
                        .DataSource = ds.Tables("Member")
                        .DisplayMember = "MemberID"
                        .ValueMember = "MemberID"
                        .DataBindings.Add("SelectedValue", ds, "MemberType")
                    End With

                    TextBoxMemberID.DataBindings.Add("Text", ds, "Member.MemberID")
                    TextBoxFullName.DataBindings.Add("Text", ds, "Member.FullName")
                    TextBoxIDCard.DataBindings.Add("Text", ds, "Member.IDCard")
                    TextBoxAddress.DataBindings.Add("Text", ds, "Member.Address")
                    TextBoxPhone.DataBindings.Add("Text", ds, "Member.Phone")

                    dtpAdmitDate.DataBindings.Add("Text", ds, "Member.AdmitDate")
                    dtpExpireDate.DataBindings.Add("Text", ds, "Member.ExpireDate")

                    TextBoxCarNumber.DataBindings.Add("Text", ds, "Member.CarNumber")
                    ComboBoxProvince.DataBindings.Add("Text", ds, "Member.Province")
                    ComboBoxCarBrand.DataBindings.Add("Text", ds, "Member.CarBrand")
                    ComboBoxCarVersion.DataBindings.Add("Text", ds, "Member.CarVersion")
                    ComboBoxCarType.DataBindings.Add("Text", ds, "Member.CarType")
                    ComboBoxCarColor.DataBindings.Add("Text", ds, "Member.CarColor")
                    ComboBoxMemberType.DataBindings.Add("Text", ds, "Member.MemberDesc")

                    dt = ds.Tables("Member")

                    ShowPosition()

                    cmdAdd.Enabled = False
                    cmdEdit.Enabled = True

                    cmdMoveFirst.Enabled = True
                    cmdMovePrevious.Enabled = True
                    cmdMoveNext.Enabled = True
                    cmdMoveLast.Enabled = True

                    cmdEdit.Focus()

                    FormatDataGridWithData()
                    cmdPrint.Enabled = True
                Else
                    IsFind = False
                    MessageBox.Show("รายชื่อสมาชิกที่คุณระบุ ไม่มี !!!", "ผลการตรวจสอบ", MessageBoxButtons.OK, MessageBoxIcon.Information)

                    picMember.Image = Nothing

                    LabelShowPositions.Text = ""

                    cmdAdd.Enabled = True
                    cmdEdit.Enabled = False

                    cmdMoveFirst.Enabled = False
                    cmdMovePrevious.Enabled = False
                    cmdMoveNext.Enabled = False
                    cmdMoveLast.Enabled = False
                    cmdPrint.Enabled = False

                    TextBoxSearch.Focus()
                    TextBoxSearch.SelectAll()
                    Exit Sub
                End If
            End If
        End If
    End Sub

    Private Sub ClearBinding()
        ComboBoxMemberType.DataBindings.Clear()
        TextBoxMemberID.DataBindings.Clear()
        TextBoxFullName.DataBindings.Clear()
        TextBoxIDCard.DataBindings.Clear()
        TextBoxAddress.DataBindings.Clear()
        TextBoxPhone.DataBindings.Clear()

        dtpAdmitDate.DataBindings.Clear()
        dtpExpireDate.DataBindings.Clear()
    End Sub

    Private Sub ShowPosition()
        Try
            CurrentRecord = Me.BindingContext(ds, "Member").Position + 1
            RecordCount = Me.BindingContext(ds, "Member").Count
            LabelShowPositions.Text = "เร็คคอร์ด : " & CurrentRecord & " / " & RecordCount

            If CurrentRecord > 0 Then
                If Convert.ToString(dt.Rows(CurrentRecord - 1).Item("Sex")) = "M" Then
                    optMale.Checked = True
                ElseIf Convert.ToString(dt.Rows(CurrentRecord - 1).Item("Sex")) = "F" Then
                    optFemale.Checked = True
                End If

                If Convert.ToString(dt.Rows(CurrentRecord - 1).Item("PictureFileName")) <> "" Then
                    picMember.Image = Image.FromFile(Convert.ToString(dt.Rows(CurrentRecord - 1).Item("PictureFileName")))
                Else
                    picMember.Image = Nothing
                End If
            End If
        Catch
            picMember.Image = Nothing
        End Try
    End Sub


    Private Sub FormatDataGridWithData()
        Dim grdTS As DataGridTableStyle = New DataGridTableStyle
        With grdTS
            .AlternatingBackColor = Color.LemonChiffon
            .BackColor = Color.White
            .MappingName = "CarNotReturn"
        End With

        Dim cs1 As New DataGridTextBoxColumn
        With cs1
            .HeaderText = "ลำดับรายการ"
            .MappingName = "TransID"
            .ReadOnly = True
            .Width = 75
        End With
        grdTS.GridColumnStyles.Add(cs1)

        Dim cs2 As New DataGridTextBoxColumn
        With cs2
            .HeaderText = "เวลาเข้าใช้บริการ"
            .MappingName = "RentTime"
            .ReadOnly = True
            .Format = "D"
            .Width = 130
        End With
        grdTS.GridColumnStyles.Add(cs2)

        Dim cs3 As New DataGridTextBoxColumn
        With cs3
            .HeaderText = "เวลาเลิกใช้บริการ"
            .MappingName = "ReturnTime"
            .ReadOnly = True
            .Format = "D"
            .Width = 130
        End With
        grdTS.GridColumnStyles.Add(cs3)

        Dim cs4 As New DataGridTextBoxColumn
        With cs4
            .HeaderText = "ทะเบียนรถ"
            .MappingName = "CarNumber"
            .ReadOnly = True
            .Width = 90
        End With
        grdTS.GridColumnStyles.Add(cs4)

    End Sub

    Private Sub cmdBrowse_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdBrowse.Click
        If (OpenFileDialog1.ShowDialog() = DialogResult.OK) Then
            tmpFileName = OpenFileDialog1.FileName
            picMember.Image = Image.FromFile(tmpFileName)
        End If
    End Sub

    Private Sub cmdAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdAdd.Click
        Dim DateMemberExpire As Date
        DateMemberExpire = Date.Now.AddMonths(1)

        ActionFlag = "Add"

        ControlStatus(True)
        grbSearch.Enabled = False
        grbManage.Enabled = False

        cmdAdd.Enabled = False
        cmdEdit.Enabled = False

        cmdOK.Visible = True
        cmdCancel.Visible = True

        cmdPrint.Enabled = False

        If IsFind = True Then
            ds.Tables("Member").Clear()
        End If

        'AutoGenerateMemberID()
        ReadRFID()
        dtpExpireDate.Value = DateMemberExpire

        TextBoxFullName.Focus()
    End Sub
    Private Function ReadRFID() As Boolean
        Dim HaveTag As Boolean
        Dim tmpArray(10) As Byte
        Dim tmpbyte As Byte
        Dim SN As String
        Dim ctr As Integer

        'Selects a single card and returns the card ID (Serial Number)
        retcode = ACR120_Select(rHandle, SID, False, tmpbyte, tmpArray(0))

        'Check if Retcode is Error
        If retcode < 0 Then
            'Call Function to Define Error Code in string form.
            MessageBox.Show("ไม่สามารถอ่านบัตรได้ ", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Stop)
        Else

            'Convert Serial Number to Hex Format.
            '(You Can Bypass Hex() Conversion if you want to display serial number as decimal)

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

            Dim StrRead As String = CStr(SN)
            TextBoxMemberID.Text = StrRead
            'Display Serial Number
        End If
    End Function

    Private Sub cmdEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdEdit.Click
        ControlStatus(True)

        ActionFlag = "Edit"

        grbSearch.Enabled = False
        grbManage.Enabled = False

        cmdEdit.Enabled = False
        cmdOK.Visible = True
        cmdCancel.Visible = True

        cmdPrint.Enabled = False

        TextBoxFullName.Focus()
    End Sub

    Private Sub cmdOK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdOK.Click
        Dim sqlMember As String = ""
        Dim comMember As OleDbCommand = New OleDbCommand
        Dim tmpMSG As String = ""
        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        If (TextBoxFullName.Text = "") Or (TextBoxIDCard.Text = "") Or (TextBoxAddress.Text = "") Or (TextBoxPhone.Text = "") Then
            MessageBox.Show("กรุณาป้อนข้อมูลสมาชิกให้ครบ !!!", "ผลการตรวจสอบ", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            TextBoxFullName.Focus()
            Exit Sub
        End If

        If ComboBoxMemberType.Text = "" Then
            MessageBox.Show("กรุณาระบุประเภทลูกค้า  !!!", "ผลการตรวจสอบ", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            ComboBoxMemberType.Focus()
            Exit Sub
        End If

        Try
            Select Case ActionFlag
                Case "Add"
                    If MessageBox.Show("ต้องการเพิ่มข้อมูลจริง หรือไม่", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then

                        sqlMember = "INSERT INTO Member (MemberID,FullName,Sex,IDCard,"
                        sqlMember &= " Address, Phone, MemberType,AdmitDate,ExpireDate,"
                        sqlMember &= " PictureFileName,IsExpired)"
                        sqlMember &= " VALUES ('" & TextBoxMemberID.Text & "',"
                        sqlMember &= "'" & TextBoxFullName.Text & "',"

                        If optMale.Checked = True Then
                            sqlMember &= "'M',"
                        ElseIf optFemale.Checked = True Then
                            sqlMember &= "'F',"
                        End If

                        sqlMember &= "'" & TextBoxIDCard.Text & "',"
                        sqlMember &= "'" & TextBoxAddress.Text & "',"
                        sqlMember &= "'" & TextBoxPhone.Text & "',"
                        sqlMember &= "'" & CStr(ComboBoxMemberType.SelectedValue) & "',"
                        sqlMember &= "#" & dtpAdmitDate.Value & "#,"
                        sqlMember &= "#" & dtpExpireDate.Value & "#,"
                        sqlMember &= "'" & tmpFileName & "',"
                        sqlMember &= "'1')"

                        da = New OleDbDataAdapter(sqlMember, Conn)
                        ds.Tables.Clear()
                        da.Fill(ds, "Insert")

                        sqlMember = "Insert into Car(CarNumber,Province,CarBrand,CarVersion,CarType,CarColor) values('"
                        sqlMember &= TextBoxCarNumber.Text + "','"
                        sqlMember &= ComboBoxProvince.Text + "','"
                        sqlMember &= ComboBoxCarBrand.Text + "','"
                        sqlMember &= ComboBoxCarVersion.Text + "','"
                        sqlMember &= ComboBoxCarType.Text + "','"
                        sqlMember &= ComboBoxCarColor.Text + "')"

                        da = New OleDbDataAdapter(sqlMember, Conn)
                        ds.Tables.Clear()
                        da.Fill(ds, "Insert")

                        sqlMember = "Insert into JoinCarMember(MemberID,CarNumber) values('"
                        sqlMember &= TextBoxMemberID.Text + "','"
                        sqlMember &= TextBoxCarNumber.Text + "')"
                      

                        da = New OleDbDataAdapter(sqlMember, Conn)
                        ds.Tables.Clear()
                        da.Fill(ds, "Insert")

                    End If



                Case "Edit"
                    sqlMember = "UPDATE Member "
                    sqlMember &= " SET FullName='" & TextBoxFullName.Text & "',"

                    If optMale.Checked = True Then
                        sqlMember &= " Sex='M',"
                    ElseIf optFemale.Checked = True Then
                        sqlMember &= " Sex='F',"
                    End If

                    sqlMember &= " IDCard='" & TextBoxIDCard.Text & "',"
                    sqlMember &= " Address='" & TextBoxAddress.Text & "',"
                    sqlMember &= " Phone='" & TextBoxPhone.Text & "',"
                    sqlMember &= " AdmitDate='" & dtpAdmitDate.Value & "',"
                    sqlMember &= " ExpireDate='" & dtpExpireDate.Value & "',"
                    sqlMember &= " PictureFileName='" & tmpFileName & "'"

                    sqlMember &= " WHERE (MemberID='" & TextBoxMemberID.Text & "')"

                    da = New OleDbDataAdapter(sqlMember, Conn)
                    ds.Tables.Clear()
                    da.Fill(ds, "Update")


                    sqlMember = "Update Car Set Province = '"
                    sqlMember &= ComboBoxProvince.Text + "',CarBrand = '"
                    sqlMember &= ComboBoxCarBrand.Text + "',CarVersion = '"
                    sqlMember &= ComboBoxCarVersion.Text + "',CarType = '"
                    sqlMember &= ComboBoxCarType.Text + "',CarColor = '"
                    sqlMember &= ComboBoxCarColor.Text + "'"

                    sqlMember &= " WHERE (CarNumber='" & TextBoxCarNumber.Text & "')"

                    da = New OleDbDataAdapter(sqlMember, Conn)
                    ds.Tables.Clear()
                    da.Fill(ds, "Update")

            End Select

        Catch ErrProcess As Exception
            MessageBox.Show("ไม่สามารถเพิ่มสมาชิกใหม่ได้ เนื่องจาก " & ErrProcess.Message, "ข้อผิดพลาด", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            Exit Sub
        End Try

        MessageBox.Show("บันทึกลงฐานข้อมูล เรียบร้อยแล้ว !!!", "ผลการทำงาน", MessageBoxButtons.OK, MessageBoxIcon.Information)

        grbSearch.Enabled = True
        grbManage.Enabled = True

        ControlStatus(False)

        cmdAdd.Enabled = True
        cmdEdit.Enabled = False

        cmdOK.Visible = False
        cmdCancel.Visible = False
        ClearData()

        cmdPrint.Enabled = False

        cmdMoveFirst.Enabled = False
        cmdMovePrevious.Enabled = False
        cmdMoveNext.Enabled = False
        cmdMoveLast.Enabled = False

        LabelShowPositions.Text = ""
        tmpFileName = ""
        TextBoxSearch.Text = ""
        TextBoxSearch.Focus()
    End Sub

    Private Sub cmdCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCancel.Click
        grbSearch.Enabled = True
        grbManage.Enabled = True
        ControlStatus(False)

        cmdAdd.Enabled = True
        cmdEdit.Enabled = False

        cmdOK.Visible = False
        cmdCancel.Visible = False
        ClearData()

        cmdPrint.Enabled = False

        cmdMoveFirst.Enabled = False
        cmdMovePrevious.Enabled = False
        cmdMoveNext.Enabled = False
        cmdMoveLast.Enabled = False

        LabelShowPositions.Text = ""
        tmpFileName = ""
        TextBoxSearch.Focus()
    End Sub

    Private Sub AutoGenerateMemberID()
        Dim sqlTmp As String = ""
        Dim comTmp As OleDbCommand = New OleDbCommand
        Dim drTmp As OleDbDataReader
        Dim tmpMemberID As Integer = 0

        sqlTmp = "SELECT TOP 1 MemberID FROM Member "
        sqlTmp &= " ORDER BY MemberID DESC"

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        Try
            With comTmp
                .CommandType = CommandType.Text
                .CommandText = sqlTmp
                .Connection = Conn
                drTmp = .ExecuteReader()

                drTmp.Read()

                tmpMemberID = CInt(drTmp.Item("MemberID"))
                tmpMemberID = tmpMemberID + 1
                TextBoxMemberID.Text = tmpMemberID.ToString("0000")
            End With
        Catch
            TextBoxMemberID.Text = "1001"
        End Try
        drTmp.Close()
    End Sub

    Private Sub ControlStatus(ByVal CtrlStatus As Boolean)
        ComboBoxMemberType.Enabled = CtrlStatus
        TextBoxFullName.Enabled = CtrlStatus
        optMale.Enabled = CtrlStatus
        optFemale.Enabled = CtrlStatus
        TextBoxIDCard.Enabled = CtrlStatus
        TextBoxAddress.Enabled = CtrlStatus
        TextBoxPhone.Enabled = CtrlStatus
        dtpAdmitDate.Enabled = CtrlStatus
        dtpExpireDate.Enabled = CtrlStatus
        cmdBrowse.Enabled = CtrlStatus

        TextBoxCarNumber.Enabled = CtrlStatus
        ComboBoxProvince.Enabled = CtrlStatus
        ComboBoxCarBrand.Enabled = CtrlStatus
        ComboBoxCarVersion.Enabled = CtrlStatus
        ComboBoxCarType.Enabled = CtrlStatus
        ComboBoxCarColor.Enabled = CtrlStatus

    End Sub

    Private Sub ClearData()
        Dim Today As Date
        Today = Date.Now

        TextBoxMemberID.Text = "--กรุณาแสดงบัตร--"
        TextBoxFullName.Text = ""
        TextBoxIDCard.Text = ""
        TextBoxAddress.Text = ""
        TextBoxPhone.Text = ""
        ComboBoxMemberType.Text = "--เลือกประเภทลูกค้า--"

        dtpAdmitDate.Value = Today
        dtpExpireDate.Value = Today

        picMember.Image = Nothing
    End Sub

    Private Sub cmdMoveFirst_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMoveFirst.Click
        Me.BindingContext(ds, "Member").Position = 0
        ShowPosition()
    End Sub

    Private Sub cmdMovePrevious_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMovePrevious.Click
        Me.BindingContext(ds, "Member").Position -= 1
        ShowPosition()

    End Sub

    Private Sub cmdMoveNext_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMoveNext.Click
        Me.BindingContext(ds, "Member").Position += 1
        ShowPosition()

    End Sub

    Private Sub cmdMoveLast_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdMoveLast.Click
        Me.BindingContext(ds, "Member").Position = ds.Tables("Member").Rows.Count - 1
        ShowPosition()

    End Sub

    Private Sub StringToPrint_Print(ByVal sender As Object, ByVal e As PrintPageEventArgs)

        AnyString(e.Graphics, "ข้อมูลสมาชิก  ", 100, 100)
        AnyString(e.Graphics, "หมายเลขสมาชิก  ", 100, 140)
        AnyString(e.Graphics, TextBoxMemberID.Text, 200, 140)
        AnyString(e.Graphics, "ประเภทลูกค้า  ", 350, 140)
        AnyString(e.Graphics, ComboBoxMemberType.Text, 450, 140)
        AnyString(e.Graphics, "ชื่อ-สกุล  ", 100, 160)
        AnyString(e.Graphics, TextBoxFullName.Text, 200, 160)

        If optMale.Checked = True Then
            AnyString(e.Graphics, "เพศ  ", 350, 160)
            AnyString(e.Graphics, optMale.Text, 400, 160)
        ElseIf optFemale.Checked = True Then
            AnyString(e.Graphics, "เพศ  ", 400, 160)
            AnyString(e.Graphics, optFemale.Text, 500, 160)
        End If
        AnyString(e.Graphics, "เลขบัตรประชาชน  ", 100, 180)
        AnyString(e.Graphics, TextBoxIDCard.Text, 200, 180)
        AnyString(e.Graphics, "ที่อยู่  ", 100, 200)
        AnyString(e.Graphics, TextBoxAddress.Text, 200, 200)

        AnyString(e.Graphics, "เบอร์โทรศัพท์  ", 100, 220)
        AnyString(e.Graphics, TextBoxPhone.Text, 200, 220)
        AnyString(e.Graphics, "วันที่สมัคร  ", 100, 240)
        AnyString(e.Graphics, dtpAdmitDate.Text, 200, 240)
        AnyString(e.Graphics, "วันหมดอายุ  ", 100, 260)
        AnyString(e.Graphics, dtpExpireDate.Text, 200, 260)

        AnyString(e.Graphics, "ทะเบียนรถ", 100, 300)
        AnyString(e.Graphics, TextBoxCarNumber.Text, 200, 300)
        AnyString(e.Graphics, ComboBoxProvince.Text, 250, 300)
        AnyString(e.Graphics, "ยี่ห้อ", 100, 320)
        AnyString(e.Graphics, ComboBoxCarBrand.Text, 200, 320)
        AnyString(e.Graphics, "รุ่น", 300, 320)
        AnyString(e.Graphics, ComboBoxCarVersion.Text, 350, 320)
        AnyString(e.Graphics, "ชนิด", 100, 340)
        AnyString(e.Graphics, ComboBoxCarType.Text, 200, 340)
        AnyString(e.Graphics, "สี", 300, 340)
        AnyString(e.Graphics, ComboBoxCarColor.Text, 350, 340)


        Dim i As Integer = 0
        Dim CurrentYPosition As Integer = 430
        Dim strColumn1 As String = ""
        Dim strColumn2 As Date
        Dim strColumn3 As Date
        Dim strColumn4 As String = ""

        'If ds.Tables("CarNotReturn").Rows.Count <> 0 Then
        'For i = 0 To ds.Tables("CarNotReturn").Rows.Count - 1
        'strColumn1 = CStr(ds.Tables("CarNotReturn").Rows(i).Item("TransID"))
        'strColumn2 = CDate(ds.Tables("CarNotReturn").Rows(i).Item("RentTime"))
        'strColumn3 = CDate(ds.Tables("CarNotReturn").Rows(i).Item("ReturnTime"))
        'strColumn4 = CStr(ds.Tables("CarNotReturn").Rows(i).Item("CarNumber"))

        'AnyString(e.Graphics, strColumn1, 130, CurrentYPosition)
        'AnyString(e.Graphics, strColumn2.ToLongDateString, 220, CurrentYPosition)
        'AnyString(e.Graphics, strColumn3.ToLongDateString, 350, CurrentYPosition)
        'AnyString(e.Graphics, strColumn4, 490, CurrentYPosition)

        'CurrentYPosition = CurrentYPosition + 20
        'Next
        'End If
    End Sub

    Private Sub AnyString(ByVal g As Graphics, ByVal printString As String, ByVal xPos As Integer, ByVal yPos As Integer)
        Dim anyPoint As New PointF(xPos, yPos)
        g.DrawString(printString, UseFont, Brushes.Black, anyPoint)
    End Sub

    Private Sub cmdPrint_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdPrint.Click
        If IsInstallPrinter() = True Then
            If prDlg.ShowDialog = DialogResult.OK Then
                prDoc.Print()
            End If
        Else
            MessageBox.Show("กรุณาติดตั้งเครื่อง Printer ก่อนสั่งพิมพ์เอกสาร", "ผลการตรวจสอบ", MessageBoxButtons.OK, MessageBoxIcon.Information)
        End If
    End Sub

    Private Sub cmdPrint2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdPrint2.Click
        If IsInstallPrinter() = True Then
            If prDlg.ShowDialog = DialogResult.OK Then
                prDoc.Print()
            End If
        Else
            MessageBox.Show("กรุณาติดตั้งเครื่อง Printer ก่อนสั่งพิมพ์เอกสาร", "ผลการตรวจสอบ", MessageBoxButtons.OK, MessageBoxIcon.Information)
        End If
    End Sub

    Private Function IsInstallPrinter() As Boolean
        IsInstallPrinter = False
        If prDoc.PrinterSettings.PrinterName = "<no default printer>" Then
            IsInstallPrinter = False
        Else
            IsInstallPrinter = True
        End If
    End Function

    Private Sub ComboBoxCarBrand_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ComboBoxCarBrand.SelectedIndexChanged
        ComboBoxCarVersion.Items.Clear()
        If ComboBoxCarBrand.SelectedIndex = 0 Then
            ComboBoxCarVersion.Items.Add("วีโก้")
            ComboBoxCarVersion.Items.Add("แคมรี่")
        ElseIf ComboBoxCarBrand.SelectedIndex = 1 Then
            ComboBoxCarVersion.Items.Add("สตราด้า")
            ComboBoxCarVersion.Items.Add("แลนเซอร์")
        Else
            ComboBoxCarVersion.Items.Add("ดีแมกซ์")
        End If
    End Sub

    'FadeInEffect

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        Me.Opacity = Me.Opacity + 0.1
        If (Me.Opacity >= 1) Then
            Timer1.Enabled = False
        End If
    End Sub

    Private Sub Timer2_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2.Tick
        Me.Opacity = Me.Opacity - 0.3
        If Me.Opacity = 0 Then
            ToClose = True
            Me.Close()
        End If
    End Sub

    Private Sub FormMain_Closing(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles MyBase.Closing
        If ToClose = False Then
            e.Cancel() = True
            Timer2.Enabled = True
        End If
    End Sub

End Class
