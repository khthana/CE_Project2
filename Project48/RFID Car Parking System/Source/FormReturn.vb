Option Explicit On 
Option Strict On
Imports System.Data
Imports System.Globalization
Imports System.Data.OleDb
Imports System.Drawing.Printing

Public Class FormReturn
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
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents DateTimePicker1 As System.Windows.Forms.DateTimePicker
    Friend WithEvents cmdCancel As System.Windows.Forms.Button
    Friend WithEvents cmdOK As System.Windows.Forms.Button
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Friend WithEvents LabelInTime As System.Windows.Forms.Label
    Friend WithEvents Label12 As System.Windows.Forms.Label
    Friend WithEvents LabelOutTime As System.Windows.Forms.Label
    Friend WithEvents Label14 As System.Windows.Forms.Label
    Friend WithEvents LabelUseTime As System.Windows.Forms.Label
    Friend WithEvents TextBoxProvince As System.Windows.Forms.TextBox
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents lblSumBeforeDiscount As System.Windows.Forms.Label
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents Timer2 As System.Windows.Forms.Timer
    Friend WithEvents Timer3 As System.Windows.Forms.Timer
    Friend WithEvents Label13 As System.Windows.Forms.Label
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label16 As System.Windows.Forms.Label
    Friend WithEvents TextBoxFullName As System.Windows.Forms.TextBox
    Friend WithEvents TextBoxCarNumber As System.Windows.Forms.TextBox
    Friend WithEvents TextBoxCarBrand As System.Windows.Forms.TextBox
    Friend WithEvents TextBoxCarVersion As System.Windows.Forms.TextBox
    Friend WithEvents TextBoxCarType As System.Windows.Forms.TextBox
    Friend WithEvents TextBoxCarColor As System.Windows.Forms.TextBox
    Friend WithEvents TextBoxMemberID As System.Windows.Forms.TextBox
    Friend WithEvents TextBoxMemberType As System.Windows.Forms.TextBox
    Friend WithEvents Label15 As System.Windows.Forms.Label
    Friend WithEvents optFemale As System.Windows.Forms.RadioButton
    Friend WithEvents optMale As System.Windows.Forms.RadioButton
    Friend WithEvents Timer4 As System.Windows.Forms.Timer
    Friend WithEvents Timer5 As System.Windows.Forms.Timer
    Friend WithEvents Timer6 As System.Windows.Forms.Timer
    Friend WithEvents TmrLoop As System.Windows.Forms.Timer
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(FormReturn))
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.Label7 = New System.Windows.Forms.Label
        Me.Label8 = New System.Windows.Forms.Label
        Me.TextBoxProvince = New System.Windows.Forms.TextBox
        Me.Label9 = New System.Windows.Forms.Label
        Me.DateTimePicker1 = New System.Windows.Forms.DateTimePicker
        Me.cmdCancel = New System.Windows.Forms.Button
        Me.cmdOK = New System.Windows.Forms.Button
        Me.TextBoxCarBrand = New System.Windows.Forms.TextBox
        Me.TextBoxCarVersion = New System.Windows.Forms.TextBox
        Me.TextBoxCarType = New System.Windows.Forms.TextBox
        Me.TextBoxCarColor = New System.Windows.Forms.TextBox
        Me.TextBoxCarNumber = New System.Windows.Forms.TextBox
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.Label10 = New System.Windows.Forms.Label
        Me.LabelInTime = New System.Windows.Forms.Label
        Me.Label12 = New System.Windows.Forms.Label
        Me.LabelOutTime = New System.Windows.Forms.Label
        Me.Label14 = New System.Windows.Forms.Label
        Me.LabelUseTime = New System.Windows.Forms.Label
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.GroupBox3 = New System.Windows.Forms.GroupBox
        Me.Label13 = New System.Windows.Forms.Label
        Me.lblSumBeforeDiscount = New System.Windows.Forms.Label
        Me.Label11 = New System.Windows.Forms.Label
        Me.Timer2 = New System.Windows.Forms.Timer(Me.components)
        Me.Timer3 = New System.Windows.Forms.Timer(Me.components)
        Me.GroupBox4 = New System.Windows.Forms.GroupBox
        Me.Label15 = New System.Windows.Forms.Label
        Me.optFemale = New System.Windows.Forms.RadioButton
        Me.optMale = New System.Windows.Forms.RadioButton
        Me.TextBoxMemberType = New System.Windows.Forms.TextBox
        Me.Label16 = New System.Windows.Forms.Label
        Me.Label1 = New System.Windows.Forms.Label
        Me.TextBoxFullName = New System.Windows.Forms.TextBox
        Me.TextBoxMemberID = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.Timer4 = New System.Windows.Forms.Timer(Me.components)
        Me.Timer5 = New System.Windows.Forms.Timer(Me.components)
        Me.Timer6 = New System.Windows.Forms.Timer(Me.components)
        Me.TmrLoop = New System.Windows.Forms.Timer(Me.components)
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
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
        Me.Label4.Location = New System.Drawing.Point(16, 64)
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
        Me.Label5.Location = New System.Drawing.Point(16, 96)
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
        Me.Label6.Location = New System.Drawing.Point(16, 128)
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
        Me.Label7.Location = New System.Drawing.Point(16, 160)
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
        Me.Label8.Location = New System.Drawing.Point(16, 192)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(19, 18)
        Me.Label8.TabIndex = 7
        Me.Label8.Text = "สี :"
        Me.Label8.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'TextBoxProvince
        '
        Me.TextBoxProvince.BackColor = System.Drawing.SystemColors.HighlightText
        Me.TextBoxProvince.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxProvince.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxProvince.Location = New System.Drawing.Point(96, 64)
        Me.TextBoxProvince.MaxLength = 20
        Me.TextBoxProvince.Name = "TextBoxProvince"
        Me.TextBoxProvince.ReadOnly = True
        Me.TextBoxProvince.Size = New System.Drawing.Size(120, 22)
        Me.TextBoxProvince.TabIndex = 4
        Me.TextBoxProvince.Text = ""
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label9.Location = New System.Drawing.Point(16, 24)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(35, 18)
        Me.Label9.TabIndex = 16
        Me.Label9.Text = "วันที่ :"
        Me.Label9.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'DateTimePicker1
        '
        Me.DateTimePicker1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.DateTimePicker1.Location = New System.Drawing.Point(88, 24)
        Me.DateTimePicker1.Name = "DateTimePicker1"
        Me.DateTimePicker1.Size = New System.Drawing.Size(140, 22)
        Me.DateTimePicker1.TabIndex = 9
        '
        'cmdCancel
        '
        Me.cmdCancel.BackColor = System.Drawing.Color.FromArgb(CType(255, Byte), CType(192, Byte), CType(192, Byte))
        Me.cmdCancel.Cursor = System.Windows.Forms.Cursors.Hand
        Me.cmdCancel.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.cmdCancel.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.cmdCancel.Image = CType(resources.GetObject("cmdCancel.Image"), System.Drawing.Image)
        Me.cmdCancel.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.cmdCancel.Location = New System.Drawing.Point(472, 360)
        Me.cmdCancel.Name = "cmdCancel"
        Me.cmdCancel.Size = New System.Drawing.Size(100, 60)
        Me.cmdCancel.TabIndex = 15
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
        Me.cmdOK.Location = New System.Drawing.Point(344, 360)
        Me.cmdOK.Name = "cmdOK"
        Me.cmdOK.Size = New System.Drawing.Size(100, 60)
        Me.cmdOK.TabIndex = 14
        Me.cmdOK.Text = "บันทึกลงฐานข้อมูล"
        Me.cmdOK.TextAlign = System.Drawing.ContentAlignment.BottomCenter
        '
        'TextBoxCarBrand
        '
        Me.TextBoxCarBrand.BackColor = System.Drawing.SystemColors.HighlightText
        Me.TextBoxCarBrand.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxCarBrand.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxCarBrand.Location = New System.Drawing.Point(96, 96)
        Me.TextBoxCarBrand.MaxLength = 20
        Me.TextBoxCarBrand.Name = "TextBoxCarBrand"
        Me.TextBoxCarBrand.ReadOnly = True
        Me.TextBoxCarBrand.Size = New System.Drawing.Size(120, 22)
        Me.TextBoxCarBrand.TabIndex = 5
        Me.TextBoxCarBrand.Text = ""
        '
        'TextBoxCarVersion
        '
        Me.TextBoxCarVersion.BackColor = System.Drawing.SystemColors.HighlightText
        Me.TextBoxCarVersion.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxCarVersion.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxCarVersion.Location = New System.Drawing.Point(96, 128)
        Me.TextBoxCarVersion.MaxLength = 20
        Me.TextBoxCarVersion.Name = "TextBoxCarVersion"
        Me.TextBoxCarVersion.ReadOnly = True
        Me.TextBoxCarVersion.Size = New System.Drawing.Size(120, 22)
        Me.TextBoxCarVersion.TabIndex = 6
        Me.TextBoxCarVersion.Text = ""
        '
        'TextBoxCarType
        '
        Me.TextBoxCarType.BackColor = System.Drawing.SystemColors.HighlightText
        Me.TextBoxCarType.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxCarType.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxCarType.Location = New System.Drawing.Point(96, 160)
        Me.TextBoxCarType.MaxLength = 20
        Me.TextBoxCarType.Name = "TextBoxCarType"
        Me.TextBoxCarType.ReadOnly = True
        Me.TextBoxCarType.Size = New System.Drawing.Size(120, 22)
        Me.TextBoxCarType.TabIndex = 7
        Me.TextBoxCarType.Text = ""
        '
        'TextBoxCarColor
        '
        Me.TextBoxCarColor.BackColor = System.Drawing.SystemColors.HighlightText
        Me.TextBoxCarColor.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxCarColor.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxCarColor.Location = New System.Drawing.Point(96, 192)
        Me.TextBoxCarColor.MaxLength = 20
        Me.TextBoxCarColor.Name = "TextBoxCarColor"
        Me.TextBoxCarColor.ReadOnly = True
        Me.TextBoxCarColor.Size = New System.Drawing.Size(120, 22)
        Me.TextBoxCarColor.TabIndex = 8
        Me.TextBoxCarColor.Text = ""
        '
        'TextBoxCarNumber
        '
        Me.TextBoxCarNumber.BackColor = System.Drawing.SystemColors.HighlightText
        Me.TextBoxCarNumber.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxCarNumber.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxCarNumber.Location = New System.Drawing.Point(96, 32)
        Me.TextBoxCarNumber.MaxLength = 7
        Me.TextBoxCarNumber.Name = "TextBoxCarNumber"
        Me.TextBoxCarNumber.ReadOnly = True
        Me.TextBoxCarNumber.Size = New System.Drawing.Size(64, 22)
        Me.TextBoxCarNumber.TabIndex = 3
        Me.TextBoxCarNumber.Text = ""
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.TextBoxCarVersion)
        Me.GroupBox1.Controls.Add(Me.Label6)
        Me.GroupBox1.Controls.Add(Me.TextBoxCarColor)
        Me.GroupBox1.Controls.Add(Me.Label8)
        Me.GroupBox1.Controls.Add(Me.Label7)
        Me.GroupBox1.Controls.Add(Me.TextBoxCarBrand)
        Me.GroupBox1.Controls.Add(Me.TextBoxCarType)
        Me.GroupBox1.Controls.Add(Me.TextBoxCarNumber)
        Me.GroupBox1.Controls.Add(Me.TextBoxProvince)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Controls.Add(Me.Label4)
        Me.GroupBox1.Controls.Add(Me.Label5)
        Me.GroupBox1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.GroupBox1.Location = New System.Drawing.Point(8, 200)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(312, 224)
        Me.GroupBox1.TabIndex = 43
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "ข้อมูลรถออก"
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
        'LabelInTime
        '
        Me.LabelInTime.AutoSize = True
        Me.LabelInTime.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.LabelInTime.ForeColor = System.Drawing.Color.DodgerBlue
        Me.LabelInTime.Location = New System.Drawing.Point(104, 64)
        Me.LabelInTime.Name = "LabelInTime"
        Me.LabelInTime.Size = New System.Drawing.Size(86, 25)
        Me.LabelInTime.TabIndex = 10
        Me.LabelInTime.Text = "00:00:00"
        Me.LabelInTime.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label12
        '
        Me.Label12.AutoSize = True
        Me.Label12.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label12.Location = New System.Drawing.Point(16, 104)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(56, 18)
        Me.Label12.TabIndex = 46
        Me.Label12.Text = "เวลาออก :"
        Me.Label12.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'LabelOutTime
        '
        Me.LabelOutTime.AutoSize = True
        Me.LabelOutTime.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.LabelOutTime.ForeColor = System.Drawing.Color.RoyalBlue
        Me.LabelOutTime.Location = New System.Drawing.Point(104, 104)
        Me.LabelOutTime.Name = "LabelOutTime"
        Me.LabelOutTime.Size = New System.Drawing.Size(86, 25)
        Me.LabelOutTime.TabIndex = 11
        Me.LabelOutTime.Text = "00:00:00"
        Me.LabelOutTime.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label14
        '
        Me.Label14.AutoSize = True
        Me.Label14.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label14.Location = New System.Drawing.Point(16, 144)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(89, 18)
        Me.Label14.TabIndex = 48
        Me.Label14.Text = "เวลาที่ใช้บริการ :"
        Me.Label14.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'LabelUseTime
        '
        Me.LabelUseTime.AutoSize = True
        Me.LabelUseTime.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.LabelUseTime.ForeColor = System.Drawing.Color.MediumBlue
        Me.LabelUseTime.Location = New System.Drawing.Point(104, 144)
        Me.LabelUseTime.Name = "LabelUseTime"
        Me.LabelUseTime.Size = New System.Drawing.Size(86, 25)
        Me.LabelUseTime.TabIndex = 12
        Me.LabelUseTime.Text = "00:00:00"
        Me.LabelUseTime.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Timer1
        '
        Me.Timer1.Enabled = True
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.Label14)
        Me.GroupBox2.Controls.Add(Me.Label10)
        Me.GroupBox2.Controls.Add(Me.LabelInTime)
        Me.GroupBox2.Controls.Add(Me.Label12)
        Me.GroupBox2.Controls.Add(Me.LabelOutTime)
        Me.GroupBox2.Controls.Add(Me.Label9)
        Me.GroupBox2.Controls.Add(Me.LabelUseTime)
        Me.GroupBox2.Controls.Add(Me.DateTimePicker1)
        Me.GroupBox2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.GroupBox2.Location = New System.Drawing.Point(336, 8)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(240, 184)
        Me.GroupBox2.TabIndex = 50
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "เวลาใช้บริการ"
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.Label13)
        Me.GroupBox3.Controls.Add(Me.lblSumBeforeDiscount)
        Me.GroupBox3.Controls.Add(Me.Label11)
        Me.GroupBox3.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.GroupBox3.Location = New System.Drawing.Point(336, 200)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(240, 80)
        Me.GroupBox3.TabIndex = 51
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "ค่าบริการ"
        '
        'Label13
        '
        Me.Label13.AutoSize = True
        Me.Label13.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label13.Location = New System.Drawing.Point(200, 40)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(26, 18)
        Me.Label13.TabIndex = 2
        Me.Label13.Text = "บาท"
        '
        'lblSumBeforeDiscount
        '
        Me.lblSumBeforeDiscount.BackColor = System.Drawing.Color.Silver
        Me.lblSumBeforeDiscount.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.lblSumBeforeDiscount.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.lblSumBeforeDiscount.ForeColor = System.Drawing.Color.Aqua
        Me.lblSumBeforeDiscount.Location = New System.Drawing.Point(88, 32)
        Me.lblSumBeforeDiscount.Name = "lblSumBeforeDiscount"
        Me.lblSumBeforeDiscount.Size = New System.Drawing.Size(100, 30)
        Me.lblSumBeforeDiscount.TabIndex = 13
        Me.lblSumBeforeDiscount.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'Label11
        '
        Me.Label11.AutoSize = True
        Me.Label11.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label11.Location = New System.Drawing.Point(16, 40)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(71, 18)
        Me.Label11.TabIndex = 0
        Me.Label11.Text = "รวมเป็นเงิน :"
        '
        'Timer2
        '
        '
        'Timer3
        '
        Me.Timer3.Enabled = True
        Me.Timer3.Interval = 1000
        '
        'GroupBox4
        '
        Me.GroupBox4.Controls.Add(Me.Label15)
        Me.GroupBox4.Controls.Add(Me.optFemale)
        Me.GroupBox4.Controls.Add(Me.optMale)
        Me.GroupBox4.Controls.Add(Me.TextBoxMemberType)
        Me.GroupBox4.Controls.Add(Me.Label16)
        Me.GroupBox4.Controls.Add(Me.Label1)
        Me.GroupBox4.Controls.Add(Me.TextBoxFullName)
        Me.GroupBox4.Controls.Add(Me.TextBoxMemberID)
        Me.GroupBox4.Controls.Add(Me.Label2)
        Me.GroupBox4.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.GroupBox4.Location = New System.Drawing.Point(8, 8)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(312, 184)
        Me.GroupBox4.TabIndex = 52
        Me.GroupBox4.TabStop = False
        Me.GroupBox4.Text = "ข้อมูลลูกค้า"
        '
        'Label15
        '
        Me.Label15.AutoSize = True
        Me.Label15.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label15.Location = New System.Drawing.Point(16, 152)
        Me.Label15.Name = "Label15"
        Me.Label15.Size = New System.Drawing.Size(32, 18)
        Me.Label15.TabIndex = 62
        Me.Label15.Text = "เพศ :"
        Me.Label15.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'optFemale
        '
        Me.optFemale.Cursor = System.Windows.Forms.Cursors.Hand
        Me.optFemale.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.optFemale.Location = New System.Drawing.Point(160, 152)
        Me.optFemale.Name = "optFemale"
        Me.optFemale.Size = New System.Drawing.Size(48, 20)
        Me.optFemale.TabIndex = 61
        Me.optFemale.Text = "หญิง"
        '
        'optMale
        '
        Me.optMale.Checked = True
        Me.optMale.Cursor = System.Windows.Forms.Cursors.Hand
        Me.optMale.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.optMale.Location = New System.Drawing.Point(96, 152)
        Me.optMale.Name = "optMale"
        Me.optMale.Size = New System.Drawing.Size(48, 20)
        Me.optMale.TabIndex = 60
        Me.optMale.TabStop = True
        Me.optMale.Text = "ชาย"
        '
        'TextBoxMemberType
        '
        Me.TextBoxMemberType.BackColor = System.Drawing.SystemColors.HighlightText
        Me.TextBoxMemberType.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxMemberType.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxMemberType.Location = New System.Drawing.Point(96, 112)
        Me.TextBoxMemberType.MaxLength = 10
        Me.TextBoxMemberType.Name = "TextBoxMemberType"
        Me.TextBoxMemberType.ReadOnly = True
        Me.TextBoxMemberType.Size = New System.Drawing.Size(128, 22)
        Me.TextBoxMemberType.TabIndex = 2
        Me.TextBoxMemberType.Text = ""
        '
        'Label16
        '
        Me.Label16.AutoSize = True
        Me.Label16.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label16.Location = New System.Drawing.Point(16, 112)
        Me.Label16.Name = "Label16"
        Me.Label16.Size = New System.Drawing.Size(79, 18)
        Me.Label16.TabIndex = 59
        Me.Label16.Text = "ประเภทลูกค้า :"
        Me.Label16.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label1.Location = New System.Drawing.Point(16, 32)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(61, 18)
        Me.Label1.TabIndex = 10
        Me.Label1.Text = "รหัสลูกค้า :"
        Me.Label1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
        '
        'TextBoxFullName
        '
        Me.TextBoxFullName.BackColor = System.Drawing.SystemColors.HighlightText
        Me.TextBoxFullName.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.TextBoxFullName.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextBoxFullName.Location = New System.Drawing.Point(96, 72)
        Me.TextBoxFullName.MaxLength = 30
        Me.TextBoxFullName.Name = "TextBoxFullName"
        Me.TextBoxFullName.ReadOnly = True
        Me.TextBoxFullName.Size = New System.Drawing.Size(200, 22)
        Me.TextBoxFullName.TabIndex = 1
        Me.TextBoxFullName.Text = ""
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
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label2.Location = New System.Drawing.Point(16, 72)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(52, 18)
        Me.Label2.TabIndex = 11
        Me.Label2.Text = "ชื่อ-สกุล :"
        Me.Label2.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
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
        'FormReturn
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.AutoScroll = True
        Me.ClientSize = New System.Drawing.Size(584, 430)
        Me.Controls.Add(Me.GroupBox4)
        Me.Controls.Add(Me.GroupBox3)
        Me.Controls.Add(Me.GroupBox2)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.cmdCancel)
        Me.Controls.Add(Me.cmdOK)
        Me.Name = "FormReturn"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "เลิกใช้บริการลานจอดรถ"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox4.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As OleDbConnection = New OleDbConnection
    Dim da As OleDbDataAdapter
    Dim ds As DataSet = New DataSet

    Dim dateCurent As DateTimeFormatInfo

    Dim UseFont As New Font("MS Sans Serif", 10)
    Dim prDoc As PrintDocument = New PrintDocument
    Dim prDlg As PrintDialog = New PrintDialog
    Dim Insert As Boolean = False

    Public Declare Function Inp Lib "inpout32.dll" Alias "Inp32" (ByVal PortAddress As Integer) As Integer
    Public Declare Sub Out Lib "inpout32.dll" Alias "Out32" (ByVal PortAddress As Integer, ByVal Value As Integer)
    Public N As Integer

    Dim ToClose As Boolean = False
    Public Timer5num As Integer

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

    Private Sub Timer3_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer3.Tick
        LabelOutTime.Text = DateTime.Now.ToString("T")
    End Sub

    Private Sub ClearAllData()
        Timer3.Enabled = True
        LabelInTime.Text = "00:00:00"
        LabelUseTime.Text = "00:00:00"
        TextBoxMemberID.Text = "--กรุณาแสดงบัตร--"
        TextBoxFullName.Text = ""
        TextBoxCarNumber.Text = ""
        TextBoxProvince.Text = ""
        TextBoxCarBrand.Text = ""
        TextBoxCarVersion.Text = ""
        TextBoxCarType.Text = ""
        TextBoxCarColor.Text = ""
    End Sub

    Private Sub cmdCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdCancel.Click
        ClearAllData()
    End Sub

    Private Sub FormCarOut_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        SID = 1
        dateCurent = DateTimeFormatInfo.InvariantInfo
        rHandle = ACR120_Open(ACR120.PORTS.ACR120_COM1, ACR120.BAUDRATES.ACR120_COM_BAUDRATE_9600)

        'Check if Handle is Valid
        If rHandle < 0 Then
            MessageBox.Show("ไม่สามารถติดต่อ เครื่องอ่านได้ ", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Stop)
        End If
        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With
        dateCurent = DateTimeFormatInfo.InvariantInfo

        AddHandler prDoc.PrintPage, New PrintPageEventHandler(AddressOf Me.StringToPrint_Print)
        prDoc.DocumentName = "ใบบันทึกรายการ"
        prDlg.Document = prDoc
        ShowRFID()
        Out(&H378, &H0)
        Insert = False
        TmrLoop.Enabled = True
        Timer3.Enabled = True
        Timer5.Enabled = False
        Timer4.Enabled = True

        Dim temp As Date
        temp = Date.Now()
        Dim H As String = temp.Hour.ToString("#00")
        Dim M As String = temp.Minute.ToString("#00")
        Dim s As String = temp.Second.ToString("#00")
        LabelOutTime.Text = H + ":" + M + ":" + s

    End Sub

    Private Function ShowRFID() As Boolean
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
                    Return True
                End If
            Else
                Return False
            End If
            'Display Serial Number
        End If
    End Function
    Private Function ShowData(ByVal Data As String) As Boolean

        Dim sql As String = ""
        sql = "Select a.MemberID,a.FullName,a.Sex,a.IDCard,a.Address,a.Phone,a.MemberType,a.AdmitDate,a.ExpireDate,a.PictureFileName,a.IsExpired "
        sql = sql + " ,b.CarNumber,b.Province,b.CarBrand,b.CarVersion,b.CarType,b.CarColor,d.MemberDesc from Member a,Car b,joinCarMember c,MemberType d "
        sql = sql + " where a.MemberType = d.MemberType and a.MemberID = c.MemberID and b.CarNumber = c.CarNumber and a.MemberID ='" + Data + "' "
        da = New OleDbDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Query")
        If ds.Tables("Query").Rows.Count <> 0 Then
            TextBoxMemberID.Text = CStr(ds.Tables("Query").Rows(0).Item("MemberID"))
            TextBoxFullName.Text = CStr(ds.Tables("Query").Rows(0).Item("FullName"))

            TextBoxMemberType.Text = CStr(ds.Tables("Query").Rows(0).Item("MemberDesc"))

            Dim StrSex As String = CStr(ds.Tables("Query").Rows(0).Item("Sex"))
            If StrSex = "M" Then
                optMale.Checked = True
                optFemale.Checked = False
            Else
                optMale.Checked = False
                optFemale.Checked = True
            End If

            TextBoxCarNumber.Text = CStr(ds.Tables("Query").Rows(0).Item("CarNumber"))
            TextBoxProvince.Text = CStr(ds.Tables("Query").Rows(0).Item("Province"))
            TextBoxCarBrand.Text = CStr(ds.Tables("Query").Rows(0).Item("CarBrand"))
            TextBoxCarVersion.Text = CStr(ds.Tables("Query").Rows(0).Item("CarVersion"))
            TextBoxCarType.Text = CStr(ds.Tables("Query").Rows(0).Item("CarType"))
            TextBoxCarColor.Text = CStr(ds.Tables("Query").Rows(0).Item("CarColor"))
            Conculatetime()
        Else
            MessageBox.Show("คุณไม่ใช่สมาชิก", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)

        End If

    End Function

    Private Sub cmdOK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdOK.Click
        Dim sql As String = ""
        sql = "select * from RentDetail where MemberID = '" + TextBoxMemberID.Text + "'"
        sql = sql + " and IsReturn = '0'"
        da.SelectCommand.CommandText = sql
        ds.Tables.Clear()
        da.Fill(ds, "Select")
        If ds.Tables("select").Rows.Count <> 0 Then
            If MessageBox.Show("ต้องการบันทึกลงฐานข้อมูล ใช่ หรือ ไม่ ", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
                Dim StrDate As Date
                StrDate = Date.Today
                sql = "Update RentDetail set ReturnTime = #" + LabelOutTime.Text + "#,IsReturn = '1',ReturnDate = #" + StrDate.ToString("d", dateCurent) + "#,NetRecieved = " + lblSumBeforeDiscount.Text
                sql = sql + " where MemberID = '" + TextBoxMemberID.Text + "'"
                sql = sql + " and IsReturn = '0'"

                Try
                    da.SelectCommand.CommandText = sql
                    ds.Tables.Clear()
                    da.Fill(ds, "Insert")
                    MessageBox.Show("จัดการข้อมูลเรียบร้อย", "แสดงผล", MessageBoxButtons.OK, MessageBoxIcon.Information)
                    '*****print ********************
                    IsSave = True
                    If IsInstallPrinter() = True Then
                        If prDlg.ShowDialog = DialogResult.OK Then
                            prDoc.Print()
                            Timer3.Enabled = True
                        Else
                            Timer3.Enabled = True
                        End If
                    Else
                        MessageBox.Show("กรุณาติดตั้งเครื่อง Printer ก่อนสั่งพิมพ์เอกสาร", "ผลการตรวจสอบ", MessageBoxButtons.OK, MessageBoxIcon.Information)
                    End If
                    lblSumBeforeDiscount.Text = ""
                    Timer3.Enabled = True
                    Insert = True                     '*************************
                Catch ex As Exception
                    MessageBox.Show("ไม่สามารถเพิ่มข้อมูลได้", "ข้อผิดพลาด", MessageBoxButtons.OK, MessageBoxIcon.Information)
                End Try
            End If
            ClearAllData()
        End If
    End Sub

    Private Sub StringToPrint_Print(ByVal sender As Object, ByVal e As PrintPageEventArgs)
        AnyString(e.Graphics, "ใบบันทึกรายการ", 80, 80)
        AnyString(e.Graphics, "วันที่ ", 30, 120)
        AnyString(e.Graphics, DateTimePicker1.Text, 80, 120)
        AnyString(e.Graphics, "เวลาเข้า ", 30, 140)
        AnyString(e.Graphics, LabelInTime.Text, 80, 140)
        AnyString(e.Graphics, "เวลาออก ", 30, 160)
        AnyString(e.Graphics, LabelOutTime.Text, 80, 160)

        AnyString(e.Graphics, "ทะเบียนรถ ", 30, 200)
        AnyString(e.Graphics, TextBoxCarNumber.Text, 120, 200)

        AnyString(e.Graphics, "จำนวนเงิน ", 30, 220)
        AnyString(e.Graphics, lblSumBeforeDiscount.Text + "   บาท ", 120, 220)

        AnyString(e.Graphics, "****************************** ", 30, 260)

    End Sub

    Private Sub AnyString(ByVal g As Graphics, ByVal printString As String, ByVal xPos As Integer, ByVal yPos As Integer)
        Dim anyPoint As New PointF(xPos, yPos)
        g.DrawString(printString, UseFont, Brushes.Black, anyPoint)
    End Sub
    Private Function IsInstallPrinter() As Boolean
        IsInstallPrinter = False
        If prDoc.PrinterSettings.PrinterName = "<no default printer>" Then
            IsInstallPrinter = False
        Else
            IsInstallPrinter = True
        End If
    End Function
    Private Function Conculatetime() As String
        ' เวลาออก *************************
        Timer3.Enabled = False
        Dim d1 As Date = Date.Now
        Dim h1 As Integer = CInt(d1.Hour.ToString())
        Dim m1 As Integer = CInt(d1.Minute.ToString())
        Dim s1 As Integer = CInt(d1.Second.ToString())
        Dim sh1 As String = ""
        Dim sm1 As String = ""
        Dim ss1 As String = ""

        ' เวลาออก *************************
        ' เวลาเข้า **************************
        Dim sql As String = ""
        sql = "Select * from rentDetail where MemberID ='" + TextBoxMemberID.Text + "'"
        sql = sql + " and IsReturn ='0'"
        da.SelectCommand.CommandText = sql
        ds.Tables.Clear()
        da.Fill(ds, "Query")
        If ds.Tables("Query").Rows.Count <> 0 Then

            Dim d2 As Date = CDate(ds.Tables("Query").Rows(0).Item("RentDate"))
            Dim t2 As Date = CDate(ds.Tables("Query").Rows(0).Item("RentTime"))

            Dim h2 As Integer = CInt(t2.Hour.ToString())
            Dim m2 As Integer = CInt(t2.Minute.ToString())
            Dim s2 As Integer = CInt(t2.Second.ToString())

            Dim sh2 As String = ""
            Dim sm2 As String = ""
            Dim ss2 As String = ""
            LabelInTime.Text = CStr(h2.ToString("#00")) + ":" + CStr(m2.ToString("#00")) + ":" + CStr(s2.ToString("#00"))

            Dim Outtime As Integer = CInt(d1.Day - d2.Day)
            Outtime *= 24
            Outtime += h1
            Outtime *= 60
            Outtime += m1
            Outtime *= 60
            Outtime += s1

            Dim intime As Integer = h2
            intime *= 60
            intime += m2
            intime *= 60
            intime += s2

            Dim Usetime As Integer = Outtime - intime
            Dim usesec As Integer = Usetime Mod 60
            Usetime = CInt(Usetime / 60)
            Dim usemut As Integer = Usetime Mod 60
            Usetime = CInt(Usetime / 60)

            Dim timeRemain As String = CStr(Usetime.ToString("#00")) + ":" + CStr(usemut.ToString("#00")) + ":" + CStr(usesec.ToString("#00"))
            LabelUseTime.Text = timeRemain
            Dim Money As Integer = 0

            sql = "Select MemberType from Member where MemberID ='" + TextBoxMemberID.Text + "'"
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Query")
            Dim MoneyPay As Integer = 20
            If ds.Tables("Query").Rows.Count <> 0 Then
                MoneyPay = CInt(ds.Tables("Query").Rows(0).Item("MemberType"))
                If MoneyPay = 1 Then
                    MoneyPay = 10
                End If
            End If
            If Usetime >= 1 Then
                Money = Usetime * MoneyPay
                If usemut >= 30 Then
                    Money += MoneyPay
                End If
            Else
                If usemut >= 30 Then
                    Money += MoneyPay
                End If
            End If

            lblSumBeforeDiscount.Text = CStr(Money.ToString("##0.00"))
            cmdOK.Enabled = True
        Else
            cmdOK.Enabled = False
        End If
        ' เวลาเข้า **************************

    End Function

    Private Sub Timer4_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer4.Tick
        N = Inp(&H379)
        If N = 63 Or N = 31 Then
            Timer4.Enabled = False
            Timer5num = 0
            Timer6.Enabled = True
        End If
    End Sub

    Private Sub Timer5_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer5.Tick
        N = Inp(&H379)
        If N = 95 Then
            Timer5.Enabled = False
            ShowRFID()
            Timer4.Enabled = True
        End If
    End Sub

    Private Sub Timer6_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer6.Tick
        Timer5num = Timer5num + 1
        If Timer5num >= 50 Then
            Insert = False
            Timer3.Enabled = True
            Timer6.Enabled = False
            Timer5num = 0
            Timer5.Enabled = True
        End If
    End Sub

    Private Sub TmrLoop_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TmrLoop.Tick
        N = Inp(&H379)
        CheckInput()
    End Sub
    Private Function CheckInput() As Boolean
        If N = 127 Then
            If Insert Then
                Out(&H378, &H2)
            Else
                Out(&H378, &H0)
            End If
        ElseIf N = 95 Then
            If Insert Then
                Out(&H378, 34)
            Else
                Out(&H378, 32)
            End If
       
            Timer3.Enabled = False
        ElseIf N = 63 Then
            If Insert Then
                Out(&H378, 66)
            Else
                Out(&H378, 64)
            End If

        ElseIf N = 31 Then
            If Insert Then
                Out(&H378, 98)
            Else
                Out(&H378, 96)
            End If
        End If

    End Function
End Class
