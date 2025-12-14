'Option Explicit On 
'Option Strict On
Imports System.Data
Imports System.Globalization
Imports System.Data.OleDb
Imports System.Drawing.Printing

Public Class FormRent
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
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents cmdCancel As System.Windows.Forms.Button
    Friend WithEvents cmdOK As System.Windows.Forms.Button
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents DateTimePicker2 As System.Windows.Forms.DateTimePicker
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents ComboBoxProvince As System.Windows.Forms.ComboBox
    Friend WithEvents Timer2 As System.Windows.Forms.Timer
    Friend WithEvents Timer3 As System.Windows.Forms.Timer
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents Label12 As System.Windows.Forms.Label
    Friend WithEvents Label13 As System.Windows.Forms.Label
    Friend WithEvents Label14 As System.Windows.Forms.Label
    Friend WithEvents optFemale As System.Windows.Forms.RadioButton
    Friend WithEvents optMale As System.Windows.Forms.RadioButton
    Friend WithEvents Label15 As System.Windows.Forms.Label
    Friend WithEvents Label16 As System.Windows.Forms.Label
    Friend WithEvents Label17 As System.Windows.Forms.Label
    Friend WithEvents TextBoxFullName As System.Windows.Forms.TextBox
    Friend WithEvents TextBoxCarNumber As System.Windows.Forms.TextBox
    Friend WithEvents ComboBoxCarBrand As System.Windows.Forms.ComboBox
    Friend WithEvents ComboBoxCarVersion As System.Windows.Forms.ComboBox
    Friend WithEvents ComboBoxCarType As System.Windows.Forms.ComboBox
    Friend WithEvents ComboBoxCarColor As System.Windows.Forms.ComboBox
    Friend WithEvents TextBoxPhone As System.Windows.Forms.TextBox
    Friend WithEvents TextBoxAddress As System.Windows.Forms.TextBox
    Friend WithEvents TextBoxIDCard As System.Windows.Forms.TextBox
    Friend WithEvents ComboBoxMemberType As System.Windows.Forms.ComboBox
    Friend WithEvents TextBoxMemberID As System.Windows.Forms.TextBox
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents TextBoxPointInPark As System.Windows.Forms.TextBox
    Friend WithEvents LabelRentTime As System.Windows.Forms.Label
    Friend WithEvents Timer4 As System.Windows.Forms.Timer
    Friend WithEvents Timer5 As System.Windows.Forms.Timer
    Friend WithEvents Timer6 As System.Windows.Forms.Timer
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents TextBoxAllPark As System.Windows.Forms.TextBox
    Friend WithEvents TmrLoop As System.Windows.Forms.Timer
    Friend WithEvents OleDbSelectCommand1 As System.Data.OleDb.OleDbCommand
    Friend WithEvents OleDbInsertCommand1 As System.Data.OleDb.OleDbCommand
    Friend WithEvents OleDbUpdateCommand1 As System.Data.OleDb.OleDbCommand
    Friend WithEvents OleDbDeleteCommand1 As System.Data.OleDb.OleDbCommand
    Friend WithEvents OleDbDataAdapter1 As System.Data.OleDb.OleDbDataAdapter
    Friend WithEvents OleDbDataAdapter2 As System.Data.OleDb.OleDbDataAdapter
    Friend WithEvents OleDbSelectCommand2 As System.Data.OleDb.OleDbCommand
    Friend WithEvents OleDbConnection1 As System.Data.OleDb.OleDbConnection
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(FormRent))
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.Label7 = New System.Windows.Forms.Label
        Me.Label8 = New System.Windows.Forms.Label
        Me.TextBoxCarNumber = New System.Windows.Forms.TextBox
        Me.ComboBoxProvince = New System.Windows.Forms.ComboBox
        Me.ComboBoxCarBrand = New System.Windows.Forms.ComboBox
        Me.ComboBoxCarVersion = New System.Windows.Forms.ComboBox
        Me.ComboBoxCarType = New System.Windows.Forms.ComboBox
        Me.cmdCancel = New System.Windows.Forms.Button
        Me.cmdOK = New System.Windows.Forms.Button
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.ComboBoxCarColor = New System.Windows.Forms.ComboBox
        Me.GroupBox3 = New System.Windows.Forms.GroupBox
        Me.LabelRentTime = New System.Windows.Forms.Label
        Me.Label10 = New System.Windows.Forms.Label
        Me.Label11 = New System.Windows.Forms.Label
        Me.DateTimePicker2 = New System.Windows.Forms.DateTimePicker
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.Timer2 = New System.Windows.Forms.Timer(Me.components)
        Me.Timer3 = New System.Windows.Forms.Timer(Me.components)
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.TextBoxMemberID = New System.Windows.Forms.TextBox
        Me.ComboBoxMemberType = New System.Windows.Forms.ComboBox
        Me.Label9 = New System.Windows.Forms.Label
        Me.TextBoxFullName = New System.Windows.Forms.TextBox
        Me.TextBoxPhone = New System.Windows.Forms.TextBox
        Me.Label12 = New System.Windows.Forms.Label
        Me.Label13 = New System.Windows.Forms.Label
        Me.Label14 = New System.Windows.Forms.Label
        Me.optFemale = New System.Windows.Forms.RadioButton
        Me.optMale = New System.Windows.Forms.RadioButton
        Me.TextBoxAddress = New System.Windows.Forms.TextBox
        Me.TextBoxIDCard = New System.Windows.Forms.TextBox
        Me.Label15 = New System.Windows.Forms.Label
        Me.Label16 = New System.Windows.Forms.Label
        Me.Label17 = New System.Windows.Forms.Label
        Me.GroupBox4 = New System.Windows.Forms.GroupBox
        Me.TextBoxAllPark = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.TextBoxPointInPark = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.Timer4 = New System.Windows.Forms.Timer(Me.components)
        Me.Timer5 = New System.Windows.Forms.Timer(Me.components)
        Me.Timer6 = New System.Windows.Forms.Timer(Me.components)
        Me.TmrLoop = New System.Windows.Forms.Timer(Me.components)
        Me.OleDbSelectCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbInsertCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbUpdateCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDeleteCommand1 = New System.Data.OleDb.OleDbCommand
        Me.OleDbDataAdapter1 = New System.Data.OleDb.OleDbDataAdapter
        Me.OleDbDataAdapter2 = New System.Data.OleDb.OleDbDataAdapter
        Me.OleDbSelectCommand2 = New System.Data.OleDb.OleDbCommand
        Me.OleDbConnection1 = New System.Data.OleDb.OleDbConnection
        Me.GroupBox2.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox4.SuspendLayout()
        Me.SuspendLayout()
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label3.Location = New System.Drawing.Point(16, 32)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(52, 18)
        Me.Label3.TabIndex = 2
        Me.Label3.Text = "ทะเบียน :"
        Me.Label3.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label4.Location = New System.Drawing.Point(16, 72)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(46, 18)
        Me.Label4.TabIndex = 3
        Me.Label4.Text = "จังหวัด :"
        Me.Label4.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label5.Location = New System.Drawing.Point(16, 112)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(34, 18)
        Me.Label5.TabIndex = 4
        Me.Label5.Text = "ยี่ห้อ :"
        Me.Label5.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label6.Location = New System.Drawing.Point(16, 152)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(27, 18)
        Me.Label6.TabIndex = 5
        Me.Label6.Text = "รุ่น :"
        Me.Label6.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label7.Location = New System.Drawing.Point(16, 192)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(35, 18)
        Me.Label7.TabIndex = 6
        Me.Label7.Text = "ชนิด :"
        Me.Label7.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label8.Location = New System.Drawing.Point(16, 232)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(19, 18)
        Me.Label8.TabIndex = 7
        Me.Label8.Text = "สี :"
        Me.Label8.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'TextBoxCarNumber
        '
        Me.TextBoxCarNumber.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxCarNumber.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxCarNumber.Location = New System.Drawing.Point(96, 32)
        Me.TextBoxCarNumber.MaxLength = 7
        Me.TextBoxCarNumber.Name = "TextBoxCarNumber"
        Me.TextBoxCarNumber.Size = New System.Drawing.Size(64, 22)
        Me.TextBoxCarNumber.TabIndex = 9
        Me.TextBoxCarNumber.Text = ""
        '
        'ComboBoxProvince
        '
        Me.ComboBoxProvince.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ComboBoxProvince.Items.AddRange(New Object() {"กรุงเทพมหานคร", "ชลบุรี", "เชียงราย", "เชียงใหม่", "เพชรบุรี", "ราชบุรี"})
        Me.ComboBoxProvince.Location = New System.Drawing.Point(96, 72)
        Me.ComboBoxProvince.MaxDropDownItems = 10
        Me.ComboBoxProvince.Name = "ComboBoxProvince"
        Me.ComboBoxProvince.Size = New System.Drawing.Size(120, 24)
        Me.ComboBoxProvince.Sorted = True
        Me.ComboBoxProvince.TabIndex = 10
        Me.ComboBoxProvince.Text = "--เลือกจังหวัด--"
        '
        'ComboBoxCarBrand
        '
        Me.ComboBoxCarBrand.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ComboBoxCarBrand.Items.AddRange(New Object() {"โตโยต้า", "มิตซูบิชิ", "อิซูซุ"})
        Me.ComboBoxCarBrand.Location = New System.Drawing.Point(96, 112)
        Me.ComboBoxCarBrand.MaxDropDownItems = 10
        Me.ComboBoxCarBrand.Name = "ComboBoxCarBrand"
        Me.ComboBoxCarBrand.Size = New System.Drawing.Size(120, 24)
        Me.ComboBoxCarBrand.Sorted = True
        Me.ComboBoxCarBrand.TabIndex = 11
        Me.ComboBoxCarBrand.Text = "--เลือกยี่ห้อ--"
        '
        'ComboBoxCarVersion
        '
        Me.ComboBoxCarVersion.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ComboBoxCarVersion.Location = New System.Drawing.Point(96, 152)
        Me.ComboBoxCarVersion.MaxDropDownItems = 10
        Me.ComboBoxCarVersion.Name = "ComboBoxCarVersion"
        Me.ComboBoxCarVersion.Size = New System.Drawing.Size(120, 24)
        Me.ComboBoxCarVersion.TabIndex = 12
        Me.ComboBoxCarVersion.Text = "--เลือกรุ่น--"
        '
        'ComboBoxCarType
        '
        Me.ComboBoxCarType.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ComboBoxCarType.Items.AddRange(New Object() {"รถกระบะ", "รถเก๋ง", "รถตู้"})
        Me.ComboBoxCarType.Location = New System.Drawing.Point(96, 192)
        Me.ComboBoxCarType.MaxDropDownItems = 5
        Me.ComboBoxCarType.Name = "ComboBoxCarType"
        Me.ComboBoxCarType.Size = New System.Drawing.Size(120, 24)
        Me.ComboBoxCarType.TabIndex = 13
        Me.ComboBoxCarType.Text = "--เลือกชนิด--"
        '
        'cmdCancel
        '
        Me.cmdCancel.BackColor = System.Drawing.Color.FromArgb(CType(255, Byte), CType(192, Byte), CType(192, Byte))
        Me.cmdCancel.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdCancel.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdCancel.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.cmdCancel.Image = CType(resources.GetObject("cmdCancel.Image"), System.Drawing.Image)
        Me.cmdCancel.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.cmdCancel.Location = New System.Drawing.Point(472, 400)
        Me.cmdCancel.Name = "cmdCancel"
        Me.cmdCancel.Size = New System.Drawing.Size(100, 60)
        Me.cmdCancel.TabIndex = 18
        Me.cmdCancel.Text = "ยกเลิก"
        Me.cmdCancel.TextAlign = System.Drawing.ContentAlignment.BottomCenter
        '
        'cmdOK
        '
        Me.cmdOK.BackColor = System.Drawing.Color.LightCyan
        Me.cmdOK.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdOK.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdOK.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.cmdOK.Image = CType(resources.GetObject("cmdOK.Image"), System.Drawing.Image)
        Me.cmdOK.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.cmdOK.Location = New System.Drawing.Point(344, 400)
        Me.cmdOK.Name = "cmdOK"
        Me.cmdOK.Size = New System.Drawing.Size(100, 60)
        Me.cmdOK.TabIndex = 17
        Me.cmdOK.Text = "บันทึกลงฐานข้อมูล"
        Me.cmdOK.TextAlign = System.Drawing.ContentAlignment.BottomCenter
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.ComboBoxCarColor)
        Me.GroupBox2.Controls.Add(Me.ComboBoxCarType)
        Me.GroupBox2.Controls.Add(Me.ComboBoxCarVersion)
        Me.GroupBox2.Controls.Add(Me.ComboBoxCarBrand)
        Me.GroupBox2.Controls.Add(Me.ComboBoxProvince)
        Me.GroupBox2.Controls.Add(Me.TextBoxCarNumber)
        Me.GroupBox2.Controls.Add(Me.Label8)
        Me.GroupBox2.Controls.Add(Me.Label7)
        Me.GroupBox2.Controls.Add(Me.Label6)
        Me.GroupBox2.Controls.Add(Me.Label5)
        Me.GroupBox2.Controls.Add(Me.Label4)
        Me.GroupBox2.Controls.Add(Me.Label3)
        Me.GroupBox2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.GroupBox2.Location = New System.Drawing.Point(8, 176)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(312, 288)
        Me.GroupBox2.TabIndex = 36
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "ข้อมูลรถเข้า"
        '
        'ComboBoxCarColor
        '
        Me.ComboBoxCarColor.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ComboBoxCarColor.Items.AddRange(New Object() {"ขาว", "เขียว", "ครีม", "แดง", "ดำ", "ทอง", "เทา", "น้ำเงิน", "ม่วง", "ส้ม", "เหลือง"})
        Me.ComboBoxCarColor.Location = New System.Drawing.Point(96, 232)
        Me.ComboBoxCarColor.MaxDropDownItems = 5
        Me.ComboBoxCarColor.Name = "ComboBoxCarColor"
        Me.ComboBoxCarColor.Size = New System.Drawing.Size(120, 24)
        Me.ComboBoxCarColor.TabIndex = 14
        Me.ComboBoxCarColor.Text = "--เลือกสี--"
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.LabelRentTime)
        Me.GroupBox3.Controls.Add(Me.Label10)
        Me.GroupBox3.Controls.Add(Me.Label11)
        Me.GroupBox3.Controls.Add(Me.DateTimePicker2)
        Me.GroupBox3.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.GroupBox3.Location = New System.Drawing.Point(336, 280)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(240, 104)
        Me.GroupBox3.TabIndex = 51
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "เวลาใช้บริการ"
        '
        'LabelRentTime
        '
        Me.LabelRentTime.AutoSize = True
        Me.LabelRentTime.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.LabelRentTime.ForeColor = System.Drawing.Color.DodgerBlue
        Me.LabelRentTime.Location = New System.Drawing.Point(96, 64)
        Me.LabelRentTime.Name = "LabelRentTime"
        Me.LabelRentTime.Size = New System.Drawing.Size(86, 25)
        Me.LabelRentTime.TabIndex = 16
        Me.LabelRentTime.Text = "00:00:00"
        Me.LabelRentTime.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label10
        '
        Me.Label10.AutoSize = True
        Me.Label10.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label10.Location = New System.Drawing.Point(16, 64)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(51, 18)
        Me.Label10.TabIndex = 44
        Me.Label10.Text = "เวลาเข้า :"
        Me.Label10.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label11
        '
        Me.Label11.AutoSize = True
        Me.Label11.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label11.Location = New System.Drawing.Point(16, 32)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(35, 18)
        Me.Label11.TabIndex = 16
        Me.Label11.Text = "วันที่ :"
        Me.Label11.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'DateTimePicker2
        '
        Me.DateTimePicker2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.DateTimePicker2.Location = New System.Drawing.Point(88, 32)
        Me.DateTimePicker2.Name = "DateTimePicker2"
        Me.DateTimePicker2.Size = New System.Drawing.Size(140, 22)
        Me.DateTimePicker2.TabIndex = 15
        Me.DateTimePicker2.TabStop = False
        '
        'Timer1
        '
        Me.Timer1.Enabled = True
        '
        'Timer2
        '
        '
        'Timer3
        '
        Me.Timer3.Enabled = True
        Me.Timer3.Interval = 1000
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.TextBoxMemberID)
        Me.GroupBox1.Controls.Add(Me.ComboBoxMemberType)
        Me.GroupBox1.Controls.Add(Me.Label9)
        Me.GroupBox1.Controls.Add(Me.TextBoxFullName)
        Me.GroupBox1.Controls.Add(Me.TextBoxPhone)
        Me.GroupBox1.Controls.Add(Me.Label12)
        Me.GroupBox1.Controls.Add(Me.Label13)
        Me.GroupBox1.Controls.Add(Me.Label14)
        Me.GroupBox1.Controls.Add(Me.optFemale)
        Me.GroupBox1.Controls.Add(Me.optMale)
        Me.GroupBox1.Controls.Add(Me.TextBoxAddress)
        Me.GroupBox1.Controls.Add(Me.TextBoxIDCard)
        Me.GroupBox1.Controls.Add(Me.Label15)
        Me.GroupBox1.Controls.Add(Me.Label16)
        Me.GroupBox1.Controls.Add(Me.Label17)
        Me.GroupBox1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.GroupBox1.Location = New System.Drawing.Point(8, 8)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(568, 160)
        Me.GroupBox1.TabIndex = 52
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "ข้อมูลลูกค้า"
        '
        'TextBoxMemberID
        '
        Me.TextBoxMemberID.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxMemberID.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxMemberID.Location = New System.Drawing.Point(96, 32)
        Me.TextBoxMemberID.MaxLength = 20
        Me.TextBoxMemberID.Name = "TextBoxMemberID"
        Me.TextBoxMemberID.ReadOnly = True
        Me.TextBoxMemberID.Size = New System.Drawing.Size(150, 22)
        Me.TextBoxMemberID.TabIndex = 0
        Me.TextBoxMemberID.Text = "--กรุณาแสดงบัตร--"
        Me.TextBoxMemberID.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'ComboBoxMemberType
        '
        Me.ComboBoxMemberType.Cursor = System.Windows.Forms.Cursors.Hand
        Me.ComboBoxMemberType.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ComboBoxMemberType.Location = New System.Drawing.Point(96, 96)
        Me.ComboBoxMemberType.Name = "ComboBoxMemberType"
        Me.ComboBoxMemberType.Size = New System.Drawing.Size(184, 24)
        Me.ComboBoxMemberType.TabIndex = 3
        Me.ComboBoxMemberType.Text = "--เลือกประเภทลูกค้า--"
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label9.Location = New System.Drawing.Point(16, 96)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(79, 18)
        Me.Label9.TabIndex = 56
        Me.Label9.Text = "ประเภทลูกค้า :"
        Me.Label9.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'TextBoxFullName
        '
        Me.TextBoxFullName.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxFullName.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxFullName.Location = New System.Drawing.Point(96, 64)
        Me.TextBoxFullName.MaxLength = 85
        Me.TextBoxFullName.Name = "TextBoxFullName"
        Me.TextBoxFullName.Size = New System.Drawing.Size(184, 22)
        Me.TextBoxFullName.TabIndex = 2
        Me.TextBoxFullName.Text = ""
        '
        'TextBoxPhone
        '
        Me.TextBoxPhone.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxPhone.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxPhone.Location = New System.Drawing.Point(376, 64)
        Me.TextBoxPhone.MaxLength = 35
        Me.TextBoxPhone.Name = "TextBoxPhone"
        Me.TextBoxPhone.Size = New System.Drawing.Size(180, 22)
        Me.TextBoxPhone.TabIndex = 7
        Me.TextBoxPhone.Text = ""
        '
        'Label12
        '
        Me.Label12.AutoSize = True
        Me.Label12.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label12.Location = New System.Drawing.Point(296, 64)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(56, 18)
        Me.Label12.TabIndex = 55
        Me.Label12.Text = "โทรศัพท์ :"
        Me.Label12.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label13
        '
        Me.Label13.AutoSize = True
        Me.Label13.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label13.Location = New System.Drawing.Point(16, 128)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(32, 18)
        Me.Label13.TabIndex = 54
        Me.Label13.Text = "เพศ :"
        Me.Label13.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label14
        '
        Me.Label14.AutoSize = True
        Me.Label14.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label14.Location = New System.Drawing.Point(296, 32)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(129, 18)
        Me.Label14.TabIndex = 53
        Me.Label14.Text = "หมายเลขบัตรประชาชน :"
        Me.Label14.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'optFemale
        '
        Me.optFemale.Cursor = System.Windows.Forms.Cursors.Hand
        Me.optFemale.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.optFemale.Location = New System.Drawing.Point(160, 128)
        Me.optFemale.Name = "optFemale"
        Me.optFemale.Size = New System.Drawing.Size(48, 20)
        Me.optFemale.TabIndex = 5
        Me.optFemale.Text = "หญิง"
        '
        'optMale
        '
        Me.optMale.Checked = True
        Me.optMale.Cursor = System.Windows.Forms.Cursors.Hand
        Me.optMale.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.optMale.Location = New System.Drawing.Point(96, 128)
        Me.optMale.Name = "optMale"
        Me.optMale.Size = New System.Drawing.Size(48, 20)
        Me.optMale.TabIndex = 4
        Me.optMale.TabStop = True
        Me.optMale.Text = "ชาย"
        '
        'TextBoxAddress
        '
        Me.TextBoxAddress.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxAddress.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxAddress.Location = New System.Drawing.Point(376, 96)
        Me.TextBoxAddress.MaxLength = 250
        Me.TextBoxAddress.Multiline = True
        Me.TextBoxAddress.Name = "TextBoxAddress"
        Me.TextBoxAddress.Size = New System.Drawing.Size(180, 56)
        Me.TextBoxAddress.TabIndex = 8
        Me.TextBoxAddress.Text = ""
        '
        'TextBoxIDCard
        '
        Me.TextBoxIDCard.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxIDCard.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxIDCard.Location = New System.Drawing.Point(428, 32)
        Me.TextBoxIDCard.MaxLength = 17
        Me.TextBoxIDCard.Name = "TextBoxIDCard"
        Me.TextBoxIDCard.Size = New System.Drawing.Size(128, 22)
        Me.TextBoxIDCard.TabIndex = 6
        Me.TextBoxIDCard.Text = ""
        '
        'Label15
        '
        Me.Label15.AutoSize = True
        Me.Label15.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label15.Location = New System.Drawing.Point(296, 96)
        Me.Label15.Name = "Label15"
        Me.Label15.Size = New System.Drawing.Size(34, 18)
        Me.Label15.TabIndex = 6
        Me.Label15.Text = "ที่อยู่ :"
        Me.Label15.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label16
        '
        Me.Label16.AutoSize = True
        Me.Label16.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label16.Location = New System.Drawing.Point(16, 64)
        Me.Label16.Name = "Label16"
        Me.Label16.Size = New System.Drawing.Size(52, 18)
        Me.Label16.TabIndex = 5
        Me.Label16.Text = "ชื่อ-สกุล :"
        Me.Label16.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label17
        '
        Me.Label17.AutoSize = True
        Me.Label17.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label17.Location = New System.Drawing.Point(16, 32)
        Me.Label17.Name = "Label17"
        Me.Label17.Size = New System.Drawing.Size(61, 18)
        Me.Label17.TabIndex = 0
        Me.Label17.Text = "รหัสลูกค้า :"
        Me.Label17.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'GroupBox4
        '
        Me.GroupBox4.Controls.Add(Me.TextBoxAllPark)
        Me.GroupBox4.Controls.Add(Me.Label1)
        Me.GroupBox4.Controls.Add(Me.TextBoxPointInPark)
        Me.GroupBox4.Controls.Add(Me.Label2)
        Me.GroupBox4.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.GroupBox4.Location = New System.Drawing.Point(336, 176)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(240, 96)
        Me.GroupBox4.TabIndex = 53
        Me.GroupBox4.TabStop = False
        Me.GroupBox4.Text = "ข้อมูลที่จอดรถ"
        '
        'TextBoxAllPark
        '
        Me.TextBoxAllPark.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxAllPark.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxAllPark.Location = New System.Drawing.Point(152, 32)
        Me.TextBoxAllPark.MaxLength = 4
        Me.TextBoxAllPark.Name = "TextBoxAllPark"
        Me.TextBoxAllPark.Size = New System.Drawing.Size(40, 22)
        Me.TextBoxAllPark.TabIndex = 58
        Me.TextBoxAllPark.Text = "3"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label1.Location = New System.Drawing.Point(16, 64)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(123, 18)
        Me.Label1.TabIndex = 57
        Me.Label1.Text = "จำนวนที่จอดรถที่เหลือ :"
        '
        'TextBoxPointInPark
        '
        Me.TextBoxPointInPark.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxPointInPark.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxPointInPark.Location = New System.Drawing.Point(152, 64)
        Me.TextBoxPointInPark.MaxLength = 4
        Me.TextBoxPointInPark.Name = "TextBoxPointInPark"
        Me.TextBoxPointInPark.ReadOnly = True
        Me.TextBoxPointInPark.Size = New System.Drawing.Size(40, 22)
        Me.TextBoxPointInPark.TabIndex = 56
        Me.TextBoxPointInPark.Text = ""
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label2.Location = New System.Drawing.Point(16, 32)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(127, 18)
        Me.Label2.TabIndex = 55
        Me.Label2.Text = "จำนวนที่จอดรถทั้งหมด :"
        '
        'Timer4
        '
        '
        'Timer5
        '
        '
        'Timer6
        '
        '
        'TmrLoop
        '
        '
        'OleDbDataAdapter1
        '
        Me.OleDbDataAdapter1.DeleteCommand = Me.OleDbDeleteCommand1
        Me.OleDbDataAdapter1.InsertCommand = Me.OleDbInsertCommand1
        Me.OleDbDataAdapter1.SelectCommand = Me.OleDbSelectCommand1
        Me.OleDbDataAdapter1.UpdateCommand = Me.OleDbUpdateCommand1
        '
        'OleDbDataAdapter2
        '
        Me.OleDbDataAdapter2.SelectCommand = Me.OleDbSelectCommand2
        Me.OleDbDataAdapter2.TableMappings.AddRange(New System.Data.Common.DataTableMapping() {New System.Data.Common.DataTableMapping("Table", "Member", New System.Data.Common.DataColumnMapping() {New System.Data.Common.DataColumnMapping("CarNumber", "CarNumber"), New System.Data.Common.DataColumnMapping("MemberID", "MemberID"), New System.Data.Common.DataColumnMapping("TransID", "TransID"), New System.Data.Common.DataColumnMapping("Address", "Address"), New System.Data.Common.DataColumnMapping("FullName", "FullName"), New System.Data.Common.DataColumnMapping("IDCard", "IDCard"), New System.Data.Common.DataColumnMapping("Expr1", "Expr1"), New System.Data.Common.DataColumnMapping("Phone", "Phone"), New System.Data.Common.DataColumnMapping("Sex", "Sex"), New System.Data.Common.DataColumnMapping("CarBrand", "CarBrand"), New System.Data.Common.DataColumnMapping("CarColor", "CarColor"), New System.Data.Common.DataColumnMapping("Expr2", "Expr2"), New System.Data.Common.DataColumnMapping("CarType", "CarType"), New System.Data.Common.DataColumnMapping("CarVersion", "CarVersion"), New System.Data.Common.DataColumnMapping("Province", "Province")})})
        '
        'OleDbSelectCommand2
        '
        Me.OleDbSelectCommand2.CommandText = "SELECT RentDetail.CarNumber, RentDetail.MemberID, RentDetail.TransID, Member.Addr" & _
        "ess, Member.FullName, Member.IDCard, Member.MemberID AS Expr1, Member.Phone, Mem" & _
        "ber.Sex, Car.CarBrand, Car.CarColor, Car.CarNumber AS Expr2, Car.CarType, Car.Ca" & _
        "rVersion, Car.Province FROM (Member INNER JOIN RentDetail ON Member.MemberID = R" & _
        "entDetail.MemberID), Car"
        Me.OleDbSelectCommand2.Connection = Me.OleDbConnection1
        '
        'OleDbConnection1
        '
        Me.OleDbConnection1.ConnectionString = "Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Registry Path=;Jet OLEDB:Database L" & _
        "ocking Mode=1;Data Source=""C:\RFID.mdb"";Jet OLEDB:Engine Type=5;Provider=""Micros" & _
        "oft.Jet.OLEDB.4.0"";Jet OLEDB:System database=;Jet OLEDB:SFP=False;persist securi" & _
        "ty info=False;Extended Properties=;Mode=Share Deny None;Jet OLEDB:Encrypt Databa" & _
        "se=False;Jet OLEDB:Create System Database=False;Jet OLEDB:Don't Copy Locale on C" & _
        "ompact=False;Jet OLEDB:Compact Without Replica Repair=False;User ID=Admin;Jet OL" & _
        "EDB:Global Bulk Transactions=1"
        '
        'FormRent
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.AutoScroll = True
        Me.ClientSize = New System.Drawing.Size(584, 470)
        Me.Controls.Add(Me.GroupBox4)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.GroupBox3)
        Me.Controls.Add(Me.GroupBox2)
        Me.Controls.Add(Me.cmdCancel)
        Me.Controls.Add(Me.cmdOK)
        Me.Name = "FormRent"
        Me.Text = "เข้าใช้บริการลานจอดรถ"
        Me.WindowState = System.Windows.Forms.FormWindowState.Maximized
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox4.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As OleDbConnection = New OleDbConnection
    Dim da As OleDbDataAdapter
    Dim ds As DataSet = New DataSet

    Dim UseFont As New Font("MS Sans Serif", 10)
    Dim prDoc As PrintDocument = New PrintDocument
    Private prDlg As PrintDialog = New PrintDialog

    Dim IsFindMember As Boolean = False
    Dim IsFindPark As Boolean = False
    Dim LastTransID As String = ""
    Dim FagBoolean As Boolean = True

    Dim dateCurent As DateTimeFormatInfo
    Dim ToClose As Boolean = False
    Dim Insert As Boolean = False

    Public Declare Function Inp Lib "inpout32.dll" Alias "Inp32" (ByVal PortAddress As Integer) As Integer
    Public Declare Sub Out Lib "inpout32.dll" Alias "Out32" (ByVal PortAddress As Integer, ByVal Value As Integer)
    Public N As Integer

    Public Timer5num As Integer


    Private Sub frmRent_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Maximized
        dateCurent = DateTimeFormatInfo.InvariantInfo
        Cursor.Current = Cursors.WaitCursor
        SID = 1
        rHandle = ACR120_Open(ACR120.PORTS.ACR120_COM1, ACR120.BAUDRATES.ACR120_COM_BAUDRATE_9600)

        'Check if Handle is Valid
        If rHandle < 0 Then
            MessageBox.Show("ไม่สามารถติดต่อ เครื่องอ่านได้ ", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Stop)
        End If

        Insert = False
        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        Dim sqlMemberType As String = ""
        sqlMemberType = "SELECT MemberType,MemberDesc FROM MemberType"
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
        Out(&H378, &H0)

        Timer4.Enabled = True
        FagBoolean = False
        TmrLoop.Enabled = True

    End Sub

    Private Sub TextBoxMemberID_KeyDown(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyEventArgs) Handles TextBoxMemberID.KeyDown
        If TextBoxMemberID.Text <> "" Then
            If (e.KeyCode = Keys.Enter) Then
                Dim sqlMember As String = ""

                sqlMember = "SELECT Member.MemberID,Member.FullName, "
                sqlMember &= " Member.Address,Member.Sex,Member.IDCard,Member.Phone, "
                sqlMember &= " Member.MemberType, "
                sqlMember &= " MemberType.RentRateDiscount,Member.IsExpired"
                sqlMember &= " FROM Member, MemberType"
                sqlMember &= " WHERE (Member.MemberType = MemberType.MemberType)"
                sqlMember &= " AND (Member.MemberID='" & TextBoxMemberID.Text & "')"

                With Conn
                    If .State = ConnectionState.Open Then .Close()
                    .ConnectionString = strConn
                    .Open()
                End With

                If IsFindMember = True Then
                    ds.Tables("Member").Clear()
                End If

                da.SelectCommand.CommandText = sqlMember
                da.Fill(ds, "Member")

                If ds.Tables("Member").Rows.Count <> 0 Then
                    IsFindMember = True

                    With ComboBoxMemberType
                        .DataSource = ds.Tables("MemberType")
                        .DisplayMember = "MemberTypeDesc"
                        .ValueMember = "MemberType"
                        .DataBindings.Clear()
                        .DataBindings.Add("SelectedValue", ds, "Member.MemberType")
                    End With

                    TextBoxMemberID.Text = CStr(ds.Tables("Member").Rows(0).Item("MemberID"))
                    TextBoxFullName.Text = CStr(ds.Tables("Member").Rows(0).Item("FullName"))
                    TextBoxIDCard.Text = CStr(ds.Tables("Member").Rows(0).Item("IDCard"))
                    TextBoxAddress.Text = CStr(ds.Tables("Member").Rows(0).Item("Address"))
                    TextBoxPhone.Text = CStr(ds.Tables("Member").Rows(0).Item("Phone"))

                    rRentRateDiscount = CSng(ds.Tables("Member").Rows(0).Item("RentRateDiscount"))
                    rMemberType = CStr(ds.Tables("Member").Rows(0).Item("MemberType"))
                    rIsExpired = CStr(ds.Tables("Member").Rows(0).Item("IsExpired"))

                    ClearAllData()

                Else
                    IsFindMember = False
                    MessageBox.Show("รายชื่อสมาชิกที่คุณระบุ ไม่มี !!!", "ผลการตรวจสอบ", MessageBoxButtons.OK, MessageBoxIcon.Information)

                    rMemberID = ""
                    rFullName = ""
                    rAddress = ""
                    rSex = ""
                    rIDCard = ""
                    rPhone = ""
                    rMemberType = "0"
                    rNumDateRentAdd = 0
                    rRentRateDiscount = 0
                    rIsExpired = "1"

                    TextBoxMemberID.Focus()
                    TextBoxMemberID.SelectAll()

                End If
            End If
        End If
    End Sub


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

    Private Sub Timer3_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer3.Tick
        LabelRentTime.Text = DateTime.Now.ToString("T")
    End Sub

    Private Sub ClearAllData()
        Dim Today As Date
        Today = Date.Now

        TextBoxMemberID.Text = "--กรุณาแสดงบัตร--"
        TextBoxFullName.Text = ""
        TextBoxIDCard.Text = ""
        TextBoxAddress.Text = ""
        TextBoxPhone.Text = ""
        ComboBoxMemberType.Text = "--เลือกประเภทลูกค้า--"
        TextBoxCarNumber.Text = ""
        ComboBoxProvince.Text = "--เลือกจังหวัด--"
        ComboBoxCarBrand.Text = "--เลือกยี่ห้อ--"
        ComboBoxCarVersion.Text = "--เลือกรุ่น--"
        ComboBoxCarType.Text = "--เลือกชนิด--"
        ComboBoxCarColor.Text = "--เลือกสี--"
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
            If StrRead <> "" Then
                If ShowData(StrRead) Then
                    CheckCar()
                    Return True
                End If
            Else
                Return False
            End If

            'Display Serial Number
        End If
    End Function
    Private Function CheckCar() As Boolean
        Dim sql As String = ""
        Dim Park As Integer = CInt(TextBoxAllPark.Text)
        TextBoxPointInPark.Text = Park
        sql = "Select Count(IsReturn) as RowReturn from RentDetail where IsReturn = '0'"
        da.SelectCommand.CommandText = sql
        ds.Tables.Clear()
        da.Fill(ds, "Row")
        Dim tempRow As Integer = CInt(ds.Tables("Row").Rows(0).Item("RowReturn"))

        TextBoxPointInPark.Text -= (tempRow + 1)
        If TextBoxPointInPark.Text = 0 Then
            Out(&H378, &H8)
        End If

    End Function
    Private Function ShowData(ByVal Data As String) As Boolean
        Dim sql As String = ""

        sql = "Select a.MemberID,a.FullName,a.Sex,a.IDCard,a.Address,a.Phone,a.MemberType,a.AdmitDate,a.ExpireDate,a.PictureFileName,a.IsExpired "
        sql = sql + " ,b.CarNumber,b.Province,b.CarBrand,b.CarVersion,b.CarType,b.CarColor,d.MemberDesc from Member a,Car b,joinCarMember c,MemberType d "
        sql = sql + " where a.MemberType = d.MemberType and a.MemberID = c.MemberID and b.CarNumber = c.CarNumber and a.MemberID ='" + Data + "' and a.MemberType = '1'"

        da = New OleDbDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Query")
        If ds.Tables("Query").Rows.Count <> 0 Then
            TextBoxMemberID.Text = CStr(ds.Tables("Query").Rows(0).Item("MemberID"))
            TextBoxIDCard.Text = CStr(ds.Tables("Query").Rows(0).Item("IDCard"))
            TextBoxPhone.Text = CStr(ds.Tables("Query").Rows(0).Item("Phone"))
            TextBoxAddress.Text = CStr(ds.Tables("Query").Rows(0).Item("Address"))
            TextBoxFullName.Text = CStr(ds.Tables("Query").Rows(0).Item("FullName"))

            ComboBoxMemberType.Text = CStr(ds.Tables("Query").Rows(0).Item("MemberDesc"))

            Dim StrSex As String = CStr(ds.Tables("Query").Rows(0).Item("Sex"))
            If StrSex = "M" Then
                optMale.Checked = True
                optFemale.Checked = False
            Else
                optMale.Checked = False
                optFemale.Checked = True
            End If

            TextBoxCarNumber.Text = CStr(ds.Tables("Query").Rows(0).Item("CarNumber"))
            ComboBoxProvince.Text = CStr(ds.Tables("Query").Rows(0).Item("Province"))
            ComboBoxCarBrand.Text = CStr(ds.Tables("Query").Rows(0).Item("CarBrand"))
            ComboBoxCarVersion.Text = CStr(ds.Tables("Query").Rows(0).Item("CarVersion"))
            ComboBoxCarType.Text = CStr(ds.Tables("Query").Rows(0).Item("CarType"))
            ComboBoxCarColor.Text = CStr(ds.Tables("Query").Rows(0).Item("CarColor"))
            Return True
        Else
            MessageBox.Show("คุณไม่ใช่สมาชิก", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            Dim Form As New FormAddMember
            Form.ShowDialog()
            Return False
        End If
    End Function

    Private Sub cmdOK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdOK.Click
        If MessageBox.Show("ต้องการบันทึกลงฐานข้อมูล ใช่ หรือ ไม่ ", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
            Dim TransID As String = GenTransID()
            Dim sql As String = ""
            sql = "insert into RentDetail(TransID,MemberID,CarNumber,RentTime,ReturnTime,RentDate,ReturnDate,NetRecieved,IsReturn)values("
            sql = sql + TransID + ",'"
            sql = sql + TextBoxMemberID.Text + "','"
            sql = sql + TextBoxCarNumber.Text + "',#"
            sql = sql + LabelRentTime.Text + "#,"
            sql = sql + "#00:00:00#,#"
            Dim StrDate As Date
            StrDate = Date.Today
            sql = sql + StrDate.ToString("d", dateCurent) + "#,#"
            sql = sql + StrDate.ToString("d", dateCurent) + "#,0,'0')"

            Try
                da = New OleDbDataAdapter(sql, Conn)
                ds.Tables.Clear()
                da.Fill(ds, "Insert")
                MessageBox.Show("เพิ่มข้อมูลเรียบร้อย", "แสดงผล", MessageBoxButtons.OK, MessageBoxIcon.Information)
                If TextBoxPointInPark.Text >= 0 Then
                    Insert = True
                End If
            Catch ex As Exception
                MessageBox.Show("ไม่สามารถเพิ่มข้อมูลได้", "ข้อผิดพลาด", MessageBoxButtons.OK, MessageBoxIcon.Information)
            End Try

        End If
        ClearAllData()
    End Sub
    Private Function GenTransID() As String
        Dim sql As String = ""
        sql = "Select * from RentDetail "
        da = New OleDbDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Query1")
        If ds.Tables("Query1").Rows.Count <> 0 Then
            sql = "Select Max(TransID) as MaxId from RentDetail "
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "MaxId")
            Dim MaxID As Integer = CInt(ds.Tables("MaxId").Rows(0).Item("MaxId"))
            MaxID += 1
            Return CStr(MaxID)
        Else
            Return "1"
        End If
    End Function

    Private Sub cmdCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCancel.Click
        ClearAllData()
        Timer4.Enabled = True
    End Sub

    Private Sub Timer4_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer4.Tick
        N = Inp(&H379)
1:      If N = 119 Then
            Timer4.Enabled = False
            If ReadRFID() Then
                Timer6.Enabled = True
            Else
                Timer4.Enabled = True
            End If
        ElseIf N = 95 Then
            Timer4.Enabled = False
            Dim Form As New FormReturn
            IsSave = False
            If Form.ShowDialog() Then
                If IsSave Then
                    IsSave = False
                    IncCarPark()
                End If
                Timer4.Enabled = True
            End If
        End If
    End Sub
    Private Sub IncCarPark()
        If TextBoxPointInPark.Text <> "" Then
            Dim sql As String = ""
            sql = "Select Count(IsReturn) as ReturnMax From RentDetail where IsReturn ='1' "
            da = New OleDbDataAdapter(sql, Conn)
            ds.Tables.Clear()
            da.Fill(ds, "MaxR")
            Dim IsReturnmax As Integer = CInt(ds.Tables("MaxR").Rows(0).Item("ReturnMax"))
            Dim TxtMax As Integer = TextBoxPointInPark.Text
            TextBoxPointInPark.Text = CStr(IsReturnmax + TxtMax)

        End If

    End Sub
    Private Function CheckInput() As Boolean
        If N = 127 Then
            If Insert Then
                Out(&H378, &H1)
            Else
                Out(&H378, &H0)
            End If
        ElseIf N = 119 Then
            If Insert Then
                Out(&H378, &H9)
            Else
                Out(&H378, &H8)
            End If

        ElseIf N = 111 Then
            If Insert Then
                Out(&H378, &H11)
            Else
                Out(&H378, &H10)
            End If

        ElseIf N = 103 Then
            If Insert Then
                Out(&H378, 25)
            Else
                Out(&H378, 24)
            End If
        End If

    End Function

    Private Sub Timer5_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer5.Tick
        Timer5num = Timer5num + 1

        If Timer5num >= 50 Then
            IsEmpty()
            Insert = False
            Timer5.Enabled = False
            Timer5num = 0
            Timer4.Enabled = True
        End If
    End Sub
    Private Function IsEmpty() As Boolean
        If TextBoxPointInPark.Text <> "" Then
            If TextBoxPointInPark.Text <= 0 Then
                Timer1.Enabled = False
                Timer2.Enabled = False
                Timer3.Enabled = False
                Timer4.Enabled = False
                Timer5.Enabled = False
                Timer6.Enabled = False
                TmrLoop.Enabled = False
                Out(&H378, 4)
                MessageBox.Show("ขณะนี้ที่จอดรถเต็ม", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Stop)
            End If
        End If
    End Function

    Private Sub Timer6_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer6.Tick
        N = Inp(&H379)
        If N = 111 Or N = 103 Then
            Timer6.Enabled = False
            Timer5num = 0
            Timer5.Enabled = True
        End If
    End Sub

    Private Sub TmrLoop_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TmrLoop.Tick
        N = Inp(&H379)
        CheckInput()
    End Sub
End Class












