Option Explicit On 
Option Strict On
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Public Class Resume_STD
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
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents Label12 As System.Windows.Forms.Label
    Friend WithEvents Label13 As System.Windows.Forms.Label
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents Label14 As System.Windows.Forms.Label
    Friend WithEvents Label15 As System.Windows.Forms.Label
    Friend WithEvents Label16 As System.Windows.Forms.Label
    Friend WithEvents Label17 As System.Windows.Forms.Label
    Friend WithEvents Label18 As System.Windows.Forms.Label
    Friend WithEvents Label19 As System.Windows.Forms.Label
    Friend WithEvents Label20 As System.Windows.Forms.Label
    Friend WithEvents Label21 As System.Windows.Forms.Label
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents Label22 As System.Windows.Forms.Label
    Friend WithEvents Label23 As System.Windows.Forms.Label
    Friend WithEvents Label24 As System.Windows.Forms.Label
    Friend WithEvents Label25 As System.Windows.Forms.Label
    Friend WithEvents Label26 As System.Windows.Forms.Label
    Friend WithEvents Label27 As System.Windows.Forms.Label
    Friend WithEvents Label28 As System.Windows.Forms.Label
    Friend WithEvents Label29 As System.Windows.Forms.Label
    Friend WithEvents ThaiName As System.Windows.Forms.TextBox
    Friend WithEvents ThaiSurname As System.Windows.Forms.TextBox
    Friend WithEvents EngSurname As System.Windows.Forms.TextBox
    Friend WithEvents EngName As System.Windows.Forms.TextBox
    Friend WithEvents Female As System.Windows.Forms.RadioButton
    Friend WithEvents Male As System.Windows.Forms.RadioButton
    Friend WithEvents CBONational As System.Windows.Forms.ComboBox
    Friend WithEvents CBOOriginal As System.Windows.Forms.ComboBox
    Friend WithEvents CBOReligion As System.Windows.Forms.ComboBox
    Friend WithEvents CBOBlood As System.Windows.Forms.ComboBox
    Friend WithEvents Tall As System.Windows.Forms.TextBox
    Friend WithEvents Weight As System.Windows.Forms.TextBox
    Friend WithEvents BrithDay_Date As System.Windows.Forms.DateTimePicker
    Friend WithEvents id As System.Windows.Forms.TextBox
    Friend WithEvents Tel1 As System.Windows.Forms.TextBox
    Friend WithEvents Post1 As System.Windows.Forms.TextBox
    Friend WithEvents City1 As System.Windows.Forms.TextBox
    Friend WithEvents Amphur1 As System.Windows.Forms.TextBox
    Friend WithEvents Tumboon1 As System.Windows.Forms.TextBox
    Friend WithEvents Road1 As System.Windows.Forms.TextBox
    Friend WithEvents Soi1 As System.Windows.Forms.TextBox
    Friend WithEvents AddrNumber1 As System.Windows.Forms.TextBox
    Friend WithEvents Tel2 As System.Windows.Forms.TextBox
    Friend WithEvents Post2 As System.Windows.Forms.TextBox
    Friend WithEvents City2 As System.Windows.Forms.TextBox
    Friend WithEvents Amphur2 As System.Windows.Forms.TextBox
    Friend WithEvents Tumboon2 As System.Windows.Forms.TextBox
    Friend WithEvents Road2 As System.Windows.Forms.TextBox
    Friend WithEvents Soi2 As System.Windows.Forms.TextBox
    Friend WithEvents AddrNumber2 As System.Windows.Forms.TextBox
    Friend WithEvents BSave As System.Windows.Forms.Button
    Friend WithEvents BEdit As System.Windows.Forms.Button
    Friend WithEvents BCancel As System.Windows.Forms.Button
    Friend WithEvents labe As System.Windows.Forms.Label
    Friend WithEvents AgeStd As System.Windows.Forms.TextBox
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.ThaiName = New System.Windows.Forms.TextBox
        Me.Label3 = New System.Windows.Forms.Label
        Me.ThaiSurname = New System.Windows.Forms.TextBox
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.EngSurname = New System.Windows.Forms.TextBox
        Me.EngName = New System.Windows.Forms.TextBox
        Me.Label6 = New System.Windows.Forms.Label
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.Female = New System.Windows.Forms.RadioButton
        Me.Male = New System.Windows.Forms.RadioButton
        Me.Label7 = New System.Windows.Forms.Label
        Me.Label8 = New System.Windows.Forms.Label
        Me.Label9 = New System.Windows.Forms.Label
        Me.CBONational = New System.Windows.Forms.ComboBox
        Me.CBOOriginal = New System.Windows.Forms.ComboBox
        Me.CBOReligion = New System.Windows.Forms.ComboBox
        Me.Label10 = New System.Windows.Forms.Label
        Me.Label11 = New System.Windows.Forms.Label
        Me.Label12 = New System.Windows.Forms.Label
        Me.CBOBlood = New System.Windows.Forms.ComboBox
        Me.Tall = New System.Windows.Forms.TextBox
        Me.Weight = New System.Windows.Forms.TextBox
        Me.Label13 = New System.Windows.Forms.Label
        Me.BrithDay_Date = New System.Windows.Forms.DateTimePicker
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.Tel1 = New System.Windows.Forms.TextBox
        Me.Label21 = New System.Windows.Forms.Label
        Me.Post1 = New System.Windows.Forms.TextBox
        Me.Label20 = New System.Windows.Forms.Label
        Me.City1 = New System.Windows.Forms.TextBox
        Me.Label19 = New System.Windows.Forms.Label
        Me.Amphur1 = New System.Windows.Forms.TextBox
        Me.Tumboon1 = New System.Windows.Forms.TextBox
        Me.Label18 = New System.Windows.Forms.Label
        Me.Label17 = New System.Windows.Forms.Label
        Me.Road1 = New System.Windows.Forms.TextBox
        Me.Soi1 = New System.Windows.Forms.TextBox
        Me.AddrNumber1 = New System.Windows.Forms.TextBox
        Me.Label16 = New System.Windows.Forms.Label
        Me.Label15 = New System.Windows.Forms.Label
        Me.Label14 = New System.Windows.Forms.Label
        Me.GroupBox3 = New System.Windows.Forms.GroupBox
        Me.Tel2 = New System.Windows.Forms.TextBox
        Me.Label22 = New System.Windows.Forms.Label
        Me.Post2 = New System.Windows.Forms.TextBox
        Me.Label23 = New System.Windows.Forms.Label
        Me.City2 = New System.Windows.Forms.TextBox
        Me.Label24 = New System.Windows.Forms.Label
        Me.Amphur2 = New System.Windows.Forms.TextBox
        Me.Tumboon2 = New System.Windows.Forms.TextBox
        Me.Label25 = New System.Windows.Forms.Label
        Me.Label26 = New System.Windows.Forms.Label
        Me.Road2 = New System.Windows.Forms.TextBox
        Me.Soi2 = New System.Windows.Forms.TextBox
        Me.AddrNumber2 = New System.Windows.Forms.TextBox
        Me.Label27 = New System.Windows.Forms.Label
        Me.Label28 = New System.Windows.Forms.Label
        Me.Label29 = New System.Windows.Forms.Label
        Me.id = New System.Windows.Forms.TextBox
        Me.BSave = New System.Windows.Forms.Button
        Me.BEdit = New System.Windows.Forms.Button
        Me.BCancel = New System.Windows.Forms.Button
        Me.labe = New System.Windows.Forms.Label
        Me.AgeStd = New System.Windows.Forms.TextBox
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label1.Location = New System.Drawing.Point(0, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(120, 23)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "รหัสประจำตัวนศ."
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(16, 48)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(88, 23)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "ชื่อ - นามสกุล"
        '
        'ThaiName
        '
        Me.ThaiName.Location = New System.Drawing.Point(104, 48)
        Me.ThaiName.Name = "ThaiName"
        Me.ThaiName.Size = New System.Drawing.Size(184, 24)
        Me.ThaiName.TabIndex = 2
        Me.ThaiName.Text = ""
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(296, 48)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(8, 24)
        Me.Label3.TabIndex = 3
        Me.Label3.Text = "-"
        '
        'ThaiSurname
        '
        Me.ThaiSurname.Location = New System.Drawing.Point(312, 48)
        Me.ThaiSurname.Name = "ThaiSurname"
        Me.ThaiSurname.Size = New System.Drawing.Size(176, 24)
        Me.ThaiSurname.TabIndex = 4
        Me.ThaiSurname.Text = ""
        '
        'Label4
        '
        Me.Label4.Location = New System.Drawing.Point(496, 48)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(80, 23)
        Me.Label4.TabIndex = 5
        Me.Label4.Text = "(ภาษาไทย)"
        '
        'Label5
        '
        Me.Label5.Location = New System.Drawing.Point(496, 80)
        Me.Label5.Name = "Label5"
        Me.Label5.TabIndex = 6
        Me.Label5.Text = "(ภาษาอังกฤษ)"
        '
        'EngSurname
        '
        Me.EngSurname.Location = New System.Drawing.Point(312, 80)
        Me.EngSurname.Name = "EngSurname"
        Me.EngSurname.Size = New System.Drawing.Size(176, 24)
        Me.EngSurname.TabIndex = 7
        Me.EngSurname.Text = ""
        '
        'EngName
        '
        Me.EngName.Location = New System.Drawing.Point(104, 80)
        Me.EngName.Name = "EngName"
        Me.EngName.Size = New System.Drawing.Size(184, 24)
        Me.EngName.TabIndex = 7
        Me.EngName.Text = ""
        '
        'Label6
        '
        Me.Label6.Location = New System.Drawing.Point(296, 80)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(8, 24)
        Me.Label6.TabIndex = 3
        Me.Label6.Text = "-"
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.Female)
        Me.GroupBox1.Controls.Add(Me.Male)
        Me.GroupBox1.Location = New System.Drawing.Point(104, 112)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(152, 56)
        Me.GroupBox1.TabIndex = 8
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "เพศ"
        '
        'Female
        '
        Me.Female.Location = New System.Drawing.Point(80, 24)
        Me.Female.Name = "Female"
        Me.Female.Size = New System.Drawing.Size(56, 24)
        Me.Female.TabIndex = 1
        Me.Female.Text = "หญิง"
        '
        'Male
        '
        Me.Male.Checked = True
        Me.Male.Location = New System.Drawing.Point(16, 24)
        Me.Male.Name = "Male"
        Me.Male.Size = New System.Drawing.Size(48, 24)
        Me.Male.TabIndex = 0
        Me.Male.TabStop = True
        Me.Male.Text = "ชาย"
        '
        'Label7
        '
        Me.Label7.Location = New System.Drawing.Point(48, 176)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(56, 24)
        Me.Label7.TabIndex = 9
        Me.Label7.Text = "สัญชาติ"
        '
        'Label8
        '
        Me.Label8.Location = New System.Drawing.Point(48, 208)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(56, 23)
        Me.Label8.TabIndex = 10
        Me.Label8.Text = "เชื้อชาติ"
        '
        'Label9
        '
        Me.Label9.Location = New System.Drawing.Point(56, 240)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(56, 23)
        Me.Label9.TabIndex = 11
        Me.Label9.Text = "ศาสนา"
        '
        'CBONational
        '
        Me.CBONational.Location = New System.Drawing.Point(104, 176)
        Me.CBONational.Name = "CBONational"
        Me.CBONational.Size = New System.Drawing.Size(152, 26)
        Me.CBONational.TabIndex = 12
        '
        'CBOOriginal
        '
        Me.CBOOriginal.Location = New System.Drawing.Point(104, 208)
        Me.CBOOriginal.Name = "CBOOriginal"
        Me.CBOOriginal.Size = New System.Drawing.Size(152, 26)
        Me.CBOOriginal.TabIndex = 13
        '
        'CBOReligion
        '
        Me.CBOReligion.Location = New System.Drawing.Point(104, 240)
        Me.CBOReligion.Name = "CBOReligion"
        Me.CBOReligion.Size = New System.Drawing.Size(152, 26)
        Me.CBOReligion.TabIndex = 14
        '
        'Label10
        '
        Me.Label10.Location = New System.Drawing.Point(40, 272)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(64, 23)
        Me.Label10.TabIndex = 15
        Me.Label10.Text = "กลุ่มเลือด"
        '
        'Label11
        '
        Me.Label11.Location = New System.Drawing.Point(56, 304)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(48, 23)
        Me.Label11.TabIndex = 16
        Me.Label11.Text = "ส่วนสูง"
        '
        'Label12
        '
        Me.Label12.Location = New System.Drawing.Point(56, 336)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(56, 23)
        Me.Label12.TabIndex = 17
        Me.Label12.Text = "น้ำหนัก"
        '
        'CBOBlood
        '
        Me.CBOBlood.Location = New System.Drawing.Point(104, 272)
        Me.CBOBlood.Name = "CBOBlood"
        Me.CBOBlood.Size = New System.Drawing.Size(96, 26)
        Me.CBOBlood.TabIndex = 18
        '
        'Tall
        '
        Me.Tall.Location = New System.Drawing.Point(104, 304)
        Me.Tall.Name = "Tall"
        Me.Tall.Size = New System.Drawing.Size(96, 24)
        Me.Tall.TabIndex = 19
        Me.Tall.Text = ""
        '
        'Weight
        '
        Me.Weight.Location = New System.Drawing.Point(104, 336)
        Me.Weight.Name = "Weight"
        Me.Weight.Size = New System.Drawing.Size(96, 24)
        Me.Weight.TabIndex = 20
        Me.Weight.Text = ""
        '
        'Label13
        '
        Me.Label13.Location = New System.Drawing.Point(8, 368)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(104, 23)
        Me.Label13.TabIndex = 22
        Me.Label13.Text = "วัน/เดือน/ปี เกิด"
        '
        'BrithDay_Date
        '
        Me.BrithDay_Date.Location = New System.Drawing.Point(104, 368)
        Me.BrithDay_Date.Name = "BrithDay_Date"
        Me.BrithDay_Date.Size = New System.Drawing.Size(152, 24)
        Me.BrithDay_Date.TabIndex = 23
        Me.BrithDay_Date.Value = New Date(1986, 1, 1, 14, 22, 0, 0)
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.Tel1)
        Me.GroupBox2.Controls.Add(Me.Label21)
        Me.GroupBox2.Controls.Add(Me.Post1)
        Me.GroupBox2.Controls.Add(Me.Label20)
        Me.GroupBox2.Controls.Add(Me.City1)
        Me.GroupBox2.Controls.Add(Me.Label19)
        Me.GroupBox2.Controls.Add(Me.Amphur1)
        Me.GroupBox2.Controls.Add(Me.Tumboon1)
        Me.GroupBox2.Controls.Add(Me.Label18)
        Me.GroupBox2.Controls.Add(Me.Label17)
        Me.GroupBox2.Controls.Add(Me.Road1)
        Me.GroupBox2.Controls.Add(Me.Soi1)
        Me.GroupBox2.Controls.Add(Me.AddrNumber1)
        Me.GroupBox2.Controls.Add(Me.Label16)
        Me.GroupBox2.Controls.Add(Me.Label15)
        Me.GroupBox2.Controls.Add(Me.Label14)
        Me.GroupBox2.Location = New System.Drawing.Point(312, 112)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(368, 152)
        Me.GroupBox2.TabIndex = 24
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "ที่อยู่ปัจจุบัน"
        '
        'Tel1
        '
        Me.Tel1.Location = New System.Drawing.Point(216, 120)
        Me.Tel1.Name = "Tel1"
        Me.Tel1.Size = New System.Drawing.Size(128, 24)
        Me.Tel1.TabIndex = 40
        Me.Tel1.Text = ""
        '
        'Label21
        '
        Me.Label21.Location = New System.Drawing.Point(160, 120)
        Me.Label21.Name = "Label21"
        Me.Label21.Size = New System.Drawing.Size(64, 23)
        Me.Label21.TabIndex = 39
        Me.Label21.Text = "เบอร์โทร"
        '
        'Post1
        '
        Me.Post1.Location = New System.Drawing.Point(256, 88)
        Me.Post1.Name = "Post1"
        Me.Post1.Size = New System.Drawing.Size(88, 24)
        Me.Post1.TabIndex = 38
        Me.Post1.Text = ""
        '
        'Label20
        '
        Me.Label20.Location = New System.Drawing.Point(168, 88)
        Me.Label20.Name = "Label20"
        Me.Label20.Size = New System.Drawing.Size(88, 23)
        Me.Label20.TabIndex = 37
        Me.Label20.Text = "รหัสไปรษณีย์"
        '
        'City1
        '
        Me.City1.Location = New System.Drawing.Point(216, 56)
        Me.City1.Name = "City1"
        Me.City1.Size = New System.Drawing.Size(128, 24)
        Me.City1.TabIndex = 36
        Me.City1.Text = ""
        '
        'Label19
        '
        Me.Label19.Location = New System.Drawing.Point(168, 56)
        Me.Label19.Name = "Label19"
        Me.Label19.Size = New System.Drawing.Size(48, 23)
        Me.Label19.TabIndex = 35
        Me.Label19.Text = "จังหวัด"
        '
        'Amphur1
        '
        Me.Amphur1.Location = New System.Drawing.Point(216, 24)
        Me.Amphur1.Name = "Amphur1"
        Me.Amphur1.Size = New System.Drawing.Size(128, 24)
        Me.Amphur1.TabIndex = 34
        Me.Amphur1.Text = ""
        '
        'Tumboon1
        '
        Me.Tumboon1.Location = New System.Drawing.Point(56, 120)
        Me.Tumboon1.Name = "Tumboon1"
        Me.Tumboon1.Size = New System.Drawing.Size(96, 24)
        Me.Tumboon1.TabIndex = 33
        Me.Tumboon1.Text = ""
        '
        'Label18
        '
        Me.Label18.Location = New System.Drawing.Point(168, 24)
        Me.Label18.Name = "Label18"
        Me.Label18.Size = New System.Drawing.Size(48, 23)
        Me.Label18.TabIndex = 32
        Me.Label18.Text = "อำเภอ"
        '
        'Label17
        '
        Me.Label17.Location = New System.Drawing.Point(16, 120)
        Me.Label17.Name = "Label17"
        Me.Label17.Size = New System.Drawing.Size(40, 23)
        Me.Label17.TabIndex = 31
        Me.Label17.Text = "ตำบล"
        '
        'Road1
        '
        Me.Road1.Location = New System.Drawing.Point(56, 88)
        Me.Road1.Name = "Road1"
        Me.Road1.Size = New System.Drawing.Size(96, 24)
        Me.Road1.TabIndex = 30
        Me.Road1.Text = ""
        '
        'Soi1
        '
        Me.Soi1.Location = New System.Drawing.Point(56, 56)
        Me.Soi1.Name = "Soi1"
        Me.Soi1.Size = New System.Drawing.Size(96, 24)
        Me.Soi1.TabIndex = 29
        Me.Soi1.Text = ""
        '
        'AddrNumber1
        '
        Me.AddrNumber1.Location = New System.Drawing.Point(56, 24)
        Me.AddrNumber1.Name = "AddrNumber1"
        Me.AddrNumber1.Size = New System.Drawing.Size(96, 24)
        Me.AddrNumber1.TabIndex = 28
        Me.AddrNumber1.Text = ""
        '
        'Label16
        '
        Me.Label16.Location = New System.Drawing.Point(16, 88)
        Me.Label16.Name = "Label16"
        Me.Label16.Size = New System.Drawing.Size(40, 23)
        Me.Label16.TabIndex = 27
        Me.Label16.Text = "ถนน"
        '
        'Label15
        '
        Me.Label15.Location = New System.Drawing.Point(16, 56)
        Me.Label15.Name = "Label15"
        Me.Label15.Size = New System.Drawing.Size(32, 23)
        Me.Label15.TabIndex = 26
        Me.Label15.Text = "ซอย"
        '
        'Label14
        '
        Me.Label14.Location = New System.Drawing.Point(16, 24)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(40, 23)
        Me.Label14.TabIndex = 25
        Me.Label14.Text = "เลขที่"
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.Tel2)
        Me.GroupBox3.Controls.Add(Me.Label22)
        Me.GroupBox3.Controls.Add(Me.Post2)
        Me.GroupBox3.Controls.Add(Me.Label23)
        Me.GroupBox3.Controls.Add(Me.City2)
        Me.GroupBox3.Controls.Add(Me.Label24)
        Me.GroupBox3.Controls.Add(Me.Amphur2)
        Me.GroupBox3.Controls.Add(Me.Tumboon2)
        Me.GroupBox3.Controls.Add(Me.Label25)
        Me.GroupBox3.Controls.Add(Me.Label26)
        Me.GroupBox3.Controls.Add(Me.Road2)
        Me.GroupBox3.Controls.Add(Me.Soi2)
        Me.GroupBox3.Controls.Add(Me.AddrNumber2)
        Me.GroupBox3.Controls.Add(Me.Label27)
        Me.GroupBox3.Controls.Add(Me.Label28)
        Me.GroupBox3.Controls.Add(Me.Label29)
        Me.GroupBox3.Location = New System.Drawing.Point(312, 272)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(368, 152)
        Me.GroupBox3.TabIndex = 25
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "ที่อยู่ปัจจุบัน ตามทะเบียนบ้าน"
        '
        'Tel2
        '
        Me.Tel2.Location = New System.Drawing.Point(216, 120)
        Me.Tel2.Name = "Tel2"
        Me.Tel2.Size = New System.Drawing.Size(128, 24)
        Me.Tel2.TabIndex = 40
        Me.Tel2.Text = ""
        '
        'Label22
        '
        Me.Label22.Location = New System.Drawing.Point(160, 120)
        Me.Label22.Name = "Label22"
        Me.Label22.Size = New System.Drawing.Size(64, 23)
        Me.Label22.TabIndex = 39
        Me.Label22.Text = "เบอร์โทร"
        '
        'Post2
        '
        Me.Post2.Location = New System.Drawing.Point(256, 88)
        Me.Post2.Name = "Post2"
        Me.Post2.Size = New System.Drawing.Size(88, 24)
        Me.Post2.TabIndex = 38
        Me.Post2.Text = ""
        '
        'Label23
        '
        Me.Label23.Location = New System.Drawing.Point(168, 88)
        Me.Label23.Name = "Label23"
        Me.Label23.Size = New System.Drawing.Size(88, 23)
        Me.Label23.TabIndex = 37
        Me.Label23.Text = "รหัสไปรษณีย์"
        '
        'City2
        '
        Me.City2.Location = New System.Drawing.Point(216, 56)
        Me.City2.Name = "City2"
        Me.City2.Size = New System.Drawing.Size(128, 24)
        Me.City2.TabIndex = 36
        Me.City2.Text = ""
        '
        'Label24
        '
        Me.Label24.Location = New System.Drawing.Point(168, 56)
        Me.Label24.Name = "Label24"
        Me.Label24.Size = New System.Drawing.Size(48, 23)
        Me.Label24.TabIndex = 35
        Me.Label24.Text = "จังหวัด"
        '
        'Amphur2
        '
        Me.Amphur2.Location = New System.Drawing.Point(216, 24)
        Me.Amphur2.Name = "Amphur2"
        Me.Amphur2.Size = New System.Drawing.Size(128, 24)
        Me.Amphur2.TabIndex = 34
        Me.Amphur2.Text = ""
        '
        'Tumboon2
        '
        Me.Tumboon2.Location = New System.Drawing.Point(56, 120)
        Me.Tumboon2.Name = "Tumboon2"
        Me.Tumboon2.Size = New System.Drawing.Size(96, 24)
        Me.Tumboon2.TabIndex = 33
        Me.Tumboon2.Text = ""
        '
        'Label25
        '
        Me.Label25.Location = New System.Drawing.Point(168, 24)
        Me.Label25.Name = "Label25"
        Me.Label25.Size = New System.Drawing.Size(48, 23)
        Me.Label25.TabIndex = 32
        Me.Label25.Text = "อำเภอ"
        '
        'Label26
        '
        Me.Label26.Location = New System.Drawing.Point(16, 120)
        Me.Label26.Name = "Label26"
        Me.Label26.Size = New System.Drawing.Size(40, 23)
        Me.Label26.TabIndex = 31
        Me.Label26.Text = "ตำบล"
        '
        'Road2
        '
        Me.Road2.Location = New System.Drawing.Point(56, 88)
        Me.Road2.Name = "Road2"
        Me.Road2.Size = New System.Drawing.Size(96, 24)
        Me.Road2.TabIndex = 30
        Me.Road2.Text = ""
        '
        'Soi2
        '
        Me.Soi2.Location = New System.Drawing.Point(56, 56)
        Me.Soi2.Name = "Soi2"
        Me.Soi2.Size = New System.Drawing.Size(96, 24)
        Me.Soi2.TabIndex = 29
        Me.Soi2.Text = ""
        '
        'AddrNumber2
        '
        Me.AddrNumber2.Location = New System.Drawing.Point(56, 24)
        Me.AddrNumber2.Name = "AddrNumber2"
        Me.AddrNumber2.Size = New System.Drawing.Size(96, 24)
        Me.AddrNumber2.TabIndex = 28
        Me.AddrNumber2.Text = ""
        '
        'Label27
        '
        Me.Label27.Location = New System.Drawing.Point(16, 88)
        Me.Label27.Name = "Label27"
        Me.Label27.Size = New System.Drawing.Size(40, 23)
        Me.Label27.TabIndex = 27
        Me.Label27.Text = "ถนน"
        '
        'Label28
        '
        Me.Label28.Location = New System.Drawing.Point(16, 56)
        Me.Label28.Name = "Label28"
        Me.Label28.Size = New System.Drawing.Size(32, 23)
        Me.Label28.TabIndex = 26
        Me.Label28.Text = "ซอย"
        '
        'Label29
        '
        Me.Label29.Location = New System.Drawing.Point(16, 24)
        Me.Label29.Name = "Label29"
        Me.Label29.Size = New System.Drawing.Size(40, 23)
        Me.Label29.TabIndex = 25
        Me.Label29.Text = "เลขที่"
        '
        'id
        '
        Me.id.ForeColor = System.Drawing.Color.Black
        Me.id.Location = New System.Drawing.Point(104, 16)
        Me.id.Name = "id"
        Me.id.ReadOnly = True
        Me.id.Size = New System.Drawing.Size(184, 24)
        Me.id.TabIndex = 28
        Me.id.Text = ""
        '
        'BSave
        '
        Me.BSave.BackColor = System.Drawing.Color.LightSteelBlue
        Me.BSave.Location = New System.Drawing.Point(312, 456)
        Me.BSave.Name = "BSave"
        Me.BSave.Size = New System.Drawing.Size(104, 40)
        Me.BSave.TabIndex = 29
        Me.BSave.Text = "บันทึกข้อมูล"
        '
        'BEdit
        '
        Me.BEdit.BackColor = System.Drawing.Color.PowderBlue
        Me.BEdit.Location = New System.Drawing.Point(424, 456)
        Me.BEdit.Name = "BEdit"
        Me.BEdit.Size = New System.Drawing.Size(96, 40)
        Me.BEdit.TabIndex = 30
        Me.BEdit.Text = "แก้ใขข้อมูล"
        '
        'BCancel
        '
        Me.BCancel.BackColor = System.Drawing.Color.Silver
        Me.BCancel.Location = New System.Drawing.Point(528, 456)
        Me.BCancel.Name = "BCancel"
        Me.BCancel.Size = New System.Drawing.Size(88, 40)
        Me.BCancel.TabIndex = 31
        Me.BCancel.Text = "ยกเลิก"
        '
        'labe
        '
        Me.labe.Location = New System.Drawing.Point(72, 400)
        Me.labe.Name = "labe"
        Me.labe.Size = New System.Drawing.Size(32, 23)
        Me.labe.TabIndex = 32
        Me.labe.Text = "อายุ"
        '
        'AgeStd
        '
        Me.AgeStd.Location = New System.Drawing.Point(104, 400)
        Me.AgeStd.Name = "AgeStd"
        Me.AgeStd.ReadOnly = True
        Me.AgeStd.Size = New System.Drawing.Size(80, 24)
        Me.AgeStd.TabIndex = 33
        Me.AgeStd.Text = ""
        '
        'Resume_STD
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.AutoScroll = True
        Me.BackColor = System.Drawing.Color.GhostWhite
        Me.ClientSize = New System.Drawing.Size(546, 367)
        Me.Controls.Add(Me.AgeStd)
        Me.Controls.Add(Me.id)
        Me.Controls.Add(Me.Weight)
        Me.Controls.Add(Me.Tall)
        Me.Controls.Add(Me.EngSurname)
        Me.Controls.Add(Me.ThaiSurname)
        Me.Controls.Add(Me.ThaiName)
        Me.Controls.Add(Me.EngName)
        Me.Controls.Add(Me.labe)
        Me.Controls.Add(Me.BCancel)
        Me.Controls.Add(Me.BEdit)
        Me.Controls.Add(Me.BSave)
        Me.Controls.Add(Me.GroupBox3)
        Me.Controls.Add(Me.GroupBox2)
        Me.Controls.Add(Me.BrithDay_Date)
        Me.Controls.Add(Me.Label13)
        Me.Controls.Add(Me.CBOBlood)
        Me.Controls.Add(Me.Label12)
        Me.Controls.Add(Me.Label11)
        Me.Controls.Add(Me.Label10)
        Me.Controls.Add(Me.CBOReligion)
        Me.Controls.Add(Me.CBOOriginal)
        Me.Controls.Add(Me.CBONational)
        Me.Controls.Add(Me.Label9)
        Me.Controls.Add(Me.Label8)
        Me.Controls.Add(Me.Label7)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.Label6)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "Resume_STD"
        Me.Text = "ข้อมูลประวัติ สำหรับนักศึกษา"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox3.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Dim dtfinfo As DateTimeFormatInfo
    Dim addrID As String = ""
    Dim MaxNameID As String = ""

    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Private Sub STDResume_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Me.WindowState = FormWindowState.Maximized
        Cursor.Current = Cursors.WaitCursor
        dtfinfo = DateTimeFormatInfo.InvariantInfo
        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With
        Dim sql As String = ""
        sql = "Select * from Religion"
        da = New SqlDataAdapter(sql, Conn)
        da.Fill(ds, "Religion")

        If ds.Tables("Religion").Rows.Count <> 0 Then
            With CBOReligion
                .DataSource = ds.Tables("Religion")
                .DisplayMember = "REL_NM"
                .ValueMember = "Std_RELIGION"
            End With
        End If

        sql = "Select * from Original"
        da = New SqlDataAdapter(sql, Conn)
        da.Fill(ds, "Original")

        If ds.Tables("Original").Rows.Count <> 0 Then
            With CBOOriginal
                .DataSource = ds.Tables("Original")
                .DisplayMember = "OR_NM"
                .ValueMember = "Std_ORIGIN"
            End With
        End If

        sql = "Select * from Nationality"
        da = New SqlDataAdapter(sql, Conn)
        da.Fill(ds, "Nationality")

        If ds.Tables("Nationality").Rows.Count <> 0 Then
            With CBONational
                .DataSource = ds.Tables("Nationality")
                .DisplayMember = "NAT_NM"
                .ValueMember = "Std_NATIONALITY"
            End With
        End If

        With CBOBlood
            .Items.Add("A")
            .Items.Add("B")
            .Items.Add("AB")
            .Items.Add("O")
            .SelectedIndex = 0
        End With
        BEdit.Enabled = False
        id.Text = Student_ID
        id.ReadOnly = True
        IsFoundId()
        If StatusUser = False Then
            ThaiName.ReadOnly = True
            ThaiSurname.ReadOnly = True
            EngName.ReadOnly = True
            EngSurname.ReadOnly = True
            'CBOBlood. = False

            Tall.ReadOnly = True
            Weight.ReadOnly = True
            AgeStd.ReadOnly = True
            'BrithDay_Date.Enabled = False
            'CBOOriginal.Enabled = False
            'CBOReligion.Enabled = False
            'CBONational.Enabled = False
            AddrNumber1.ReadOnly = True
            Amphur1.ReadOnly = True
            Tumboon1.ReadOnly = True
            City1.ReadOnly = True
            Road1.ReadOnly = True
            Soi1.ReadOnly = True
            Post1.ReadOnly = True
            Tel1.ReadOnly = True

            AddrNumber2.ReadOnly = True
            Amphur2.ReadOnly = True
            Tumboon2.ReadOnly = True
            City2.ReadOnly = True
            Road2.ReadOnly = True
            Soi2.ReadOnly = True
            Post2.ReadOnly = True
            Tel2.ReadOnly = True
            BEdit.Visible = False
            BSave.Visible = False
        End If
        If NewID Then
            id.ReadOnly = False
        End If
    End Sub

    Private Function IsFoundId() As Boolean 'ตรวจสอบการมีIDในฐานข้อมูล
        Dim sql As String = ""
        sql = "Select * From Student where Std_ID = '" + Student_ID + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Count")
        If ds.Tables("Count").Rows.Count <> 0 Then
            ShowData()
            BEdit.Enabled = True
        End If
    End Function
    Private Function ShowData() As Boolean
        Dim sql As String = ""
        Dim Origin As String = ""
        Dim Religion As String = ""
        Dim National As String = ""
        sql = "Select a.Std_SEX,a.Std_BLOOD,a.Std_ORIGIN,a.Std_NATIONALITY,a.Std_RELIGION,a.Std_TALL,a.Std_WEIGHT,a.Std_BRITHDAY,a.Std_AGE,c.Std_NAME,c.Std_SURNAME,c.StdE_NAME,c.StdE_SURNAME "
        sql = sql + " from Student a,NameStudent c "
        sql = sql + " Where  a.Std_NUM = c.Std_NUM "
        sql = sql + " and a.Std_ID = '" + Student_ID + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Query1")
        If ds.Tables("Query1").Rows.Count <> 0 Then
            ThaiName.Text = CStr(ds.Tables("Query1").Rows(0).Item("Std_NAME"))
            ThaiSurname.Text = CStr(ds.Tables("Query1").Rows(0).Item("Std_SURNAME"))
            EngName.Text = CStr(ds.Tables("Query1").Rows(0).Item("StdE_NAME"))
            EngSurname.Text = CStr(ds.Tables("Query1").Rows(0).Item("StdE_SURNAME"))
            Dim temp As String = CStr(ds.Tables("Query1").Rows(0).Item("Std_SEX"))
            If temp = "M" Then
                Male.Checked = True
                Female.Checked = False
            Else
                Male.Checked = False
                Female.Checked = True
            End If
            Male.Enabled = False
            Female.Enabled = False

            CBOBlood.Text = CStr(ds.Tables("Query1").Rows(0).Item("Std_BLOOD"))
            Tall.Text = CStr(ds.Tables("Query1").Rows(0).Item("Std_TALL"))
            Weight.Text = CStr(ds.Tables("Query1").Rows(0).Item("Std_WEIGHT"))
            AgeStd.Text = CStr(ds.Tables("Query1").Rows(0).Item("Std_AGE"))
            BrithDay_Date.Text = CStr(ds.Tables("Query1").Rows(0).Item("Std_BRITHDAY"))
            Origin = CStr(ds.Tables("Query1").Rows(0).Item("Std_ORIGIN"))
            Religion = CStr(ds.Tables("Query1").Rows(0).Item("Std_RELIGION"))
            National = CStr(ds.Tables("Query1").Rows(0).Item("Std_NATIONALITY"))

            ShowAddr()
        Else
            Return False
        End If
        CBOOriginal.Text = FindRegion(Origin, 1)
        CBOReligion.Text = FindRegion(Religion, 3)
        CBONational.Text = FindRegion(National, 2)
        BSave.Enabled = False
    End Function
    Private Function ShowAddr() As Boolean
        Dim sql As String = ""
        sql = "Select c.Adr_NUM,c.Adr_AMPHUR,c.Adr_TUMBOON,c.Adr_CITY,c.Adr_ROAD,c.Adr_SOI,c.Adr_POST,c.Adr_TEL "
        sql = sql + " From Student a,AddrStudent c "
        sql = sql + " where a.Adr_NUMStd = c.Adr_NUMStd "
        sql = sql + " and a.Std_ID = '" + Student_ID + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Addr")
        If ds.Tables("Addr").Rows.Count <> 0 Then
            AddrNumber1.Text = CStr(ds.Tables("Addr").Rows(0).Item("Adr_NUM"))
            Amphur1.Text = CStr(ds.Tables("Addr").Rows(0).Item("Adr_AMPHUR"))
            Tumboon1.Text = CStr(ds.Tables("Addr").Rows(0).Item("Adr_TUMBOON"))
            City1.Text = CStr(ds.Tables("Addr").Rows(0).Item("Adr_CITY"))
            Road1.Text = CStr(ds.Tables("Addr").Rows(0).Item("Adr_ROAD"))
            Soi1.Text = CStr(ds.Tables("Addr").Rows(0).Item("Adr_SOI"))
            Post1.Text = CStr(ds.Tables("Addr").Rows(0).Item("Adr_POST"))
            Tel1.Text = CStr(ds.Tables("Addr").Rows(0).Item("Adr_TEL"))

            AddrNumber2.Text = CStr(ds.Tables("Addr").Rows(1).Item("Adr_NUM"))
            Amphur2.Text = CStr(ds.Tables("Addr").Rows(1).Item("Adr_AMPHUR"))
            Tumboon2.Text = CStr(ds.Tables("Addr").Rows(1).Item("Adr_TUMBOON"))
            City2.Text = CStr(ds.Tables("Addr").Rows(1).Item("Adr_CITY"))
            Road2.Text = CStr(ds.Tables("Addr").Rows(1).Item("Adr_ROAD"))
            Soi2.Text = CStr(ds.Tables("Addr").Rows(1).Item("Adr_SOI"))
            Post2.Text = CStr(ds.Tables("Addr").Rows(1).Item("Adr_POST"))
            Tel2.Text = CStr(ds.Tables("Addr").Rows(1).Item("Adr_TEL"))

        End If
    End Function
    Private Function FindRegion(ByVal data As String, ByVal Index As Integer) As String
        Dim sql As String = ""
        If Index = 1 Then
            sql = "Select * From Original Where Std_ORIGIN = " + data
        ElseIf Index = 2 Then
            sql = "Select * From Nationality Where Std_NATIONALITY = " + data
        ElseIf Index = 3 Then
            sql = "Select * From Religion Where Std_RELIGION = " + data
        End If
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "temp1")
        If ds.Tables("temp1").Rows.Count <> 0 Then
            If Index = 1 Then
                Return CStr(ds.Tables("temp1").Rows(0).Item("OR_NM"))
            ElseIf Index = 2 Then
                Return CStr(ds.Tables("temp1").Rows(0).Item("NAT_NM"))
            ElseIf Index = 3 Then
                Return CStr(ds.Tables("temp1").Rows(0).Item("REL_NM"))
            End If
        End If

    End Function

    Private Sub BCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BCancel.Click
        Me.Close()
    End Sub
    Private Function CheckItem() As Boolean
        If id.Text = "" Then
            MsgBox("กรุณาใส่รหัสนักศึกษา")
            id.Focus()
            Return False
        End If
        If ThaiName.Text = "" Or ThaiSurname.Text = "" Or EngName.Text = "" Or EngSurname.Text = "" Then
            MsgBox("กรุณากรอกชื่อนักศึกษาให้ครบ")
            ThaiName.Focus()
            Return False
        End If
        If Tall.Text = "" Then
            MsgBox("กรุณาใส่ความสูง ของนักศึกษา")
            Tall.Focus()
            Return False
        End If
        If Weight.Text = "" Then
            MsgBox("กรุณาใส่น้ำหนัก ของนักศึกษา")
            Weight.Focus()
            Return False
        End If
        If AddrNumber1.Text = "" Or Tumboon1.Text = "" Or Amphur1.Text = "" Or City1.Text = "" Or Post1.Text = "" Then
            MsgBox("กรุณากรอกที่ตามทะเบียนบ้านให้ครบ! ของนักศึกษา")
            AddrNumber1.Focus()
            Return False
        End If
        If AddrNumber2.Text = "" Or Tumboon2.Text = "" Or Amphur2.Text = "" Or City2.Text = "" Or Post2.Text = "" Then
            MsgBox("กรุณากรอกที่ตามปัจจุบันให้ครบ! ของนักศึกษา")
            AddrNumber2.Focus()
            Return False
        End If
        Return True
    End Function

    Private Sub BSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BSave.Click
        Dim sql As String = ""
        If MessageBox.Show("ต้องการเพิ่มข้อมูลประวัตินักศึกษา รหัส " + Student_ID + "   ", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
            RegisterSTD = True
            If CheckItem() Then
                Student_ID = id.Text
                If GenerateCode() Then

                    sql = "insert into student(Std_ID,Std_SEX,Std_ORIGIN,Std_RELIGION,"
                    sql = sql + "Std_BLOOD,Std_BRITHDAY,Std_TALL,Std_WEIGHT,Std_NATIONALITY,"
                    sql = sql + "Sta_NUM,Std_AGE,Std_NUM,Adr_NUMStd)values('"
                    sql = sql + Student_ID + "',"
                    If Male.Checked = True Then
                        sql = sql + "'M',"
                    Else
                        sql = sql + "'F',"
                    End If
                    sql = sql + FindOriginal(CBOOriginal.Text) + ","
                    sql = sql + FindReligion(CBOReligion.Text) + ",'"
                    sql = sql + CBOBlood.Text + "','"
                    sql = sql + BrithDay_Date.Value.ToString("d", dtfinfo) + "',"
                    sql = sql + Tall.Text + ","
                    sql = sql + Weight.Text + ","
                    sql = sql + FindNational(CBONational.Text) + ","
                    sql = sql + Sta_NUM + ","
                    sql = sql + AgeStd.Text + ","
                    MaxNameID = MaxIdName()
                    sql = sql + MaxNameID + ","
                    addrID = CStr(genIdAddr())
                    sql = sql + addrID + ")"
                    MsgBox(sql)
                    da.SelectCommand.CommandText = sql
                    da.Fill(ds, "insert")

                    If insertStdAddr() Then
                        MsgBox("ทำการบันทึกข้อมูลเรียบร้อย.", MsgBoxStyle.Information)
                        Me.Close()
                    End If
                End If
            End If
        End If
    End Sub
    Private Function insertStdAddr() As Boolean
        Dim sql As String = ""
        sql = "Insert into AddrStudent(Adr_NUMStd,Adr_STATUS,Adr_NUM,Adr_AMPHUR,Adr_TUMBOON,Adr_CITY,Adr_ROAD,Adr_SOI,Adr_POST,Adr_TEL)values("
        sql = sql + addrID + ",'N','"
        sql = sql + AddrNumber1.Text + "','"
        sql = sql + Amphur1.Text + "','"
        sql = sql + Tumboon1.Text + "','"
        sql = sql + City1.Text + "','"
        sql = sql + Road1.Text + "','"
        sql = sql + Soi1.Text + "','"
        sql = sql + Post1.Text + "','"
        sql = sql + Tel1.Text + "')"
        da.SelectCommand.CommandText = sql
        ds.Tables.Clear()
        da.Fill(ds, "Insert")

        sql = "Insert into AddrStudent(Adr_NUMStd,Adr_STATUS,Adr_NUM,Adr_AMPHUR,Adr_TUMBOON,Adr_CITY,Adr_ROAD,Adr_SOI,Adr_POST,Adr_TEL)values("
        sql = sql + addrID + ",'O','"
        sql = sql + AddrNumber2.Text + "','"
        sql = sql + Amphur2.Text + "','"
        sql = sql + Tumboon2.Text + "','"
        sql = sql + City2.Text + "','"
        sql = sql + Road2.Text + "','"
        sql = sql + Soi2.Text + "','"
        sql = sql + Post2.Text + "','"
        sql = sql + Tel2.Text + "')"
        da.SelectCommand.CommandText = sql
        ds.Tables.Clear()
        da.Fill(ds, "Insert")

        sql = "insert into NameStudent(Std_NUM,Std_NAME,Std_SURNAME,StdE_NAME,StdE_SURNAME)values("
        MaxNameID = MaxIdName()
        sql = sql + MaxNameID + ",'"
        sql = sql + ThaiName.Text + "','"
        sql = sql + ThaiSurname.Text + "','"
        sql = sql + EngName.Text + "','"
        sql = sql + EngSurname.Text + "')"
        da.SelectCommand.CommandText = sql
        ds.Tables.Clear()
        da.Fill(ds, "Insert")

        thaiNM = ThaiName.Text
        ThaiSurNM = ThaiSurname.Text

        Return True
    End Function
    Private Function MaxIdName() As String
        Dim sql As String = ""
        sql = "SELECT MAX(Std_NUM) AS MaxExp from NameStudent"
        da = New SqlDataAdapter(sql, Conn)
        da.Fill(ds, "code")
        If ds.Tables("code").Rows.Count <> 0 Then
            Dim temp As Integer
            temp = CInt(ds.Tables("code").Rows(0).Item("MaxExp"))
            Return  CStr(temp + 1) 'ค่ามากสุดของ ตาราง  NameStudent +1
        Else
            MsgBox("Error Generate code ")
        End If

    End Function

    Private Function genIdAddr() As Integer
        Dim sql As String = ""
        sql = "select * from AddrStudent"
        da.SelectCommand.CommandText = sql
        ds.Tables.Clear()
        da.Fill(ds, "gen")
        If ds.Tables("gen").Rows.Count <> 0 Then
            sql = "select max(Adr_NUMStd) as MAXExp from AddrStudent"
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "gen")
            If ds.Tables("gen").Rows.Count <> 0 Then
                Return CInt(ds.Tables("gen").Rows(0).Item("MAXExp")) + 1
            End If
        Else
            Return 1
        End If
    End Function

    Private Function Age(ByVal DateSel As Date) As String
        Dim DateCur As Date
        Dim Ages As Integer
        DateCur = Date.Now()
        If DateCur.Year > DateSel.Year Then
            Ages = CInt(DateCur.Year) - CInt(DateSel.Year)

            If DateCur.Month > DateSel.Month Then
                Return CStr(Ages)
            ElseIf DateCur.Month < DateSel.Month Then
                Return CStr(Ages - 1)
            Else
                If DateCur.Day >= DateSel.Day Then
                    Return CStr(Ages)
                Else
                    Return CStr(Ages - 1)
                End If
            End If
        Else
            MsgBox("กรุณาเลือก วัน/เดือน/ปี เกิด ให้ถูกต้อง!")
        End If
        Return "Error Age"
    End Function
    Private Function FindOriginal(ByVal Ori As String) As String
        Dim sql As String = ""
        sql = "Select * from Original where OR_NM = '" + Ori + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Ori")
        If ds.Tables("Ori").Rows.Count <> 0 Then
            Return CStr(ds.Tables("Ori").Rows(0).Item("Std_ORIGIN"))
        End If
    End Function
    Private Function FindReligion(ByVal Rel As String) As String
        Dim sql As String = ""
        sql = "Select * from Religion where REL_NM = '" + Rel + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Rel")
        If ds.Tables("Rel").Rows.Count <> 0 Then
            Return CStr(ds.Tables("Rel").Rows(0).Item("Std_RELIGION"))
        End If
    End Function
    Private Function FindNational(ByVal Nat As String) As String
        Dim sql As String = ""
        sql = "Select * from Nationality where NAT_NM = '" + Nat + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Nat")
        If ds.Tables("Nat").Rows.Count <> 0 Then
            Return CStr(ds.Tables("Nat").Rows(0).Item("Std_NATIONALITY"))
        End If
    End Function
    Private Function GenerateCode() As Boolean
        Dim sql As String = ""
        sql = "select * from student"
        da.SelectCommand.CommandText = sql
        da.Fill(ds, "Void")
        If ds.Tables("Void").Rows.Count <> 0 Then

            sql = "SELECT MAX(Sta_NUM) AS MaxExp from Student"
            da = New SqlDataAdapter(sql, Conn)
            da.Fill(ds, "code")

            If ds.Tables("code").Rows.Count <> 0 Then
                Dim temp As Integer
                temp = CInt(ds.Tables("code").Rows(0).Item("MaxExp"))
                Sta_NUM = CStr(temp + 1) 'รหัสสถานะภาพ
            Else
                MsgBox("Error Generate code ")
            End If
        Else
            Sta_NUM = "1" 'รหัสสถานะภาพ
        End If
        Return True
    End Function

    Private Sub BrithDay_Date_ValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BrithDay_Date.ValueChanged
        If BrithDay_Date.Value < Date.Now Then
            AgeStd.Text = Age(BrithDay_Date.Value)
            'MsgBox(BrithDay_Date.Text)
        End If
    End Sub

    Private Sub BEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BEdit.Click
        Dim sql As String = ""
        If MessageBox.Show("ต้องการแก้ไขข้อมูลประวัตินักศึกษา รหัส " + Student_ID + "   ", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
            If CheckItem() Then
                Student_ID = id.Text

                sql = "Update student set Std_ORIGIN = " + FindOriginal(CBOOriginal.Text) + ","
                sql = sql + "Std_RELIGION = " + FindReligion(CBOReligion.Text) + ","
                sql = sql + "Std_BLOOD = '" + CBOBlood.Text + "',"
                sql = sql + "Std_BRITHDAY = '" + BrithDay_Date.Value.ToString("d", dtfinfo) + "',"
                sql = sql + "Std_TALL = " + Tall.Text + ","
                sql = sql + "Std_WEIGHT = " + Weight.Text + ","
                sql = sql + "Std_NATIONALITY = " + FindNational(CBONational.Text) + ","
                sql = sql + "Std_SEX = "
                If Male.Checked = True Then
                    sql = sql + "'M'"
                Else
                    sql = sql + "'F'"
                End If
                sql = sql + " Where Std_ID = '" + Student_ID + "'"
                'MsgBox(sql)
                da.SelectCommand.CommandText = sql
                da.Fill(ds, "insert")

                sql = "Update AddrStudent Set Adr_NUM = '" + AddrNumber1.Text + "',"
                sql = sql + "Adr_AMPHUR = '" + Amphur1.Text + "',"
                sql = sql + "Adr_TUMBOON = '" + Tumboon1.Text + "',"
                sql = sql + "Adr_CITY = '" + City1.Text + "',"
                sql = sql + "Adr_ROAD = '" + Road1.Text + "',"
                sql = sql + "Adr_SOI = '" + Soi1.Text + "',"
                sql = sql + "Adr_POST = '" + Post1.Text + "',"
                sql = sql + "Adr_TEL = '" + Tel1.Text + "'"
                sql = sql + " where Adr_STATUS = 'N' and Adr_NUMStd = "
                sql = sql + "(Select Adr_NUMStd From student Where Std_ID = '" + Student_ID + "')"

                da.SelectCommand.CommandText = sql
                da.Fill(ds, "Insert")

                sql = "Update AddrStudent Set Adr_NUM = '" + AddrNumber2.Text + "',"
                sql = sql + "Adr_AMPHUR = '" + Amphur2.Text + "',"
                sql = sql + "Adr_TUMBOON = '" + Tumboon2.Text + "',"
                sql = sql + "Adr_CITY = '" + City2.Text + "',"
                sql = sql + "Adr_ROAD = '" + Road2.Text + "',"
                sql = sql + "Adr_SOI = '" + Soi2.Text + "',"
                sql = sql + "Adr_POST = '" + Post2.Text + "',"
                sql = sql + "Adr_TEL = '" + Tel2.Text + "'"
                sql = sql + " where Adr_STATUS = 'O' and Adr_NUMStd = "
                sql = sql + "(Select Adr_NUMStd From student Where Std_ID = '" + Student_ID + "')"

                da.SelectCommand.CommandText = sql
                da.Fill(ds, "Insert")

                sql = "Update NameStudent set Std_NAME = '" + ThaiName.Text + "',"
                sql = sql + "Std_SURNAME = '" + ThaiSurname.Text + "',"
                sql = sql + "StdE_NAME = '" + EngName.Text + "',"
                sql = sql + "StdE_SURNAME = '" + EngSurname.Text + "'"
                sql = sql + " where Std_NUM = "
                sql = sql + "(Select Std_NUM From student Where Std_ID = '" + Student_ID + "')"

                da.SelectCommand.CommandText = sql
                da.Fill(ds, "Insert")

                MsgBox("ทำการแก้ไขข้อมูลประวัติ รหัสนักศึกษา " + Student_ID + "เรียบร้อย.  ", MsgBoxStyle.Information)
                Me.Close()
            End If
        End If
    End Sub

    Private Sub CBONational_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CBONational.SelectedIndexChanged

        If StatusUser = False Then
            Dim iFoundIndex As Integer
            iFoundIndex = CBONational.FindStringExact(CBONational.Text)
            CBONational.SelectedIndex = iFoundIndex

        End If
    End Sub
End Class
