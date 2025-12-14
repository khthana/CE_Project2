Public Class Resume_Old_STD
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
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents id As System.Windows.Forms.TextBox
    Friend WithEvents ThaiName As System.Windows.Forms.TextBox
    Friend WithEvents ThaiSurname As System.Windows.Forms.TextBox
    Friend WithEvents OldGPA As System.Windows.Forms.TextBox
    Friend WithEvents OldCity As System.Windows.Forms.TextBox
    Friend WithEvents OldSchool As System.Windows.Forms.TextBox
    Friend WithEvents OldWut As System.Windows.Forms.TextBox
    Friend WithEvents CBOStudyState As System.Windows.Forms.ComboBox
    Friend WithEvents StartContinues As System.Windows.Forms.TextBox
    Friend WithEvents ContinuesEnd As System.Windows.Forms.TextBox
    Friend WithEvents BSave As System.Windows.Forms.Button
    Friend WithEvents BEdit As System.Windows.Forms.Button
    Friend WithEvents BCancel As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.id = New System.Windows.Forms.TextBox
        Me.ThaiName = New System.Windows.Forms.TextBox
        Me.ThaiSurname = New System.Windows.Forms.TextBox
        Me.Label3 = New System.Windows.Forms.Label
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.OldGPA = New System.Windows.Forms.TextBox
        Me.Label6 = New System.Windows.Forms.Label
        Me.OldCity = New System.Windows.Forms.TextBox
        Me.Label5 = New System.Windows.Forms.Label
        Me.OldSchool = New System.Windows.Forms.TextBox
        Me.Label4 = New System.Windows.Forms.Label
        Me.OldWut = New System.Windows.Forms.TextBox
        Me.Label7 = New System.Windows.Forms.Label
        Me.Label8 = New System.Windows.Forms.Label
        Me.Label9 = New System.Windows.Forms.Label
        Me.CBOStudyState = New System.Windows.Forms.ComboBox
        Me.StartContinues = New System.Windows.Forms.TextBox
        Me.ContinuesEnd = New System.Windows.Forms.TextBox
        Me.BSave = New System.Windows.Forms.Button
        Me.BEdit = New System.Windows.Forms.Button
        Me.BCancel = New System.Windows.Forms.Button
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(32, 8)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(88, 23)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "รหัสนักศึกษา"
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(32, 40)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(88, 23)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "ชื่อ -นามสกุล"
        '
        'id
        '
        Me.id.Enabled = False
        Me.id.Location = New System.Drawing.Point(112, 8)
        Me.id.Name = "id"
        Me.id.Size = New System.Drawing.Size(144, 24)
        Me.id.TabIndex = 2
        Me.id.Text = ""
        '
        'ThaiName
        '
        Me.ThaiName.Enabled = False
        Me.ThaiName.Location = New System.Drawing.Point(112, 40)
        Me.ThaiName.Name = "ThaiName"
        Me.ThaiName.Size = New System.Drawing.Size(144, 24)
        Me.ThaiName.TabIndex = 3
        Me.ThaiName.Text = ""
        '
        'ThaiSurname
        '
        Me.ThaiSurname.Enabled = False
        Me.ThaiSurname.Location = New System.Drawing.Point(264, 40)
        Me.ThaiSurname.Name = "ThaiSurname"
        Me.ThaiSurname.Size = New System.Drawing.Size(152, 24)
        Me.ThaiSurname.TabIndex = 4
        Me.ThaiSurname.Text = ""
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(16, 24)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(104, 23)
        Me.Label3.TabIndex = 5
        Me.Label3.Text = "วุฒิการศึกษาเดิม"
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.OldGPA)
        Me.GroupBox1.Controls.Add(Me.Label6)
        Me.GroupBox1.Controls.Add(Me.OldCity)
        Me.GroupBox1.Controls.Add(Me.Label5)
        Me.GroupBox1.Controls.Add(Me.OldSchool)
        Me.GroupBox1.Controls.Add(Me.Label4)
        Me.GroupBox1.Controls.Add(Me.OldWut)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Location = New System.Drawing.Point(32, 72)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(392, 160)
        Me.GroupBox1.TabIndex = 6
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "ประวัติการศึกษา"
        '
        'OldGPA
        '
        Me.OldGPA.Location = New System.Drawing.Point(120, 88)
        Me.OldGPA.Name = "OldGPA"
        Me.OldGPA.Size = New System.Drawing.Size(144, 24)
        Me.OldGPA.TabIndex = 12
        Me.OldGPA.Text = ""
        '
        'Label6
        '
        Me.Label6.Location = New System.Drawing.Point(56, 88)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(64, 23)
        Me.Label6.TabIndex = 11
        Me.Label6.Text = "เกรดเฉลี่ย"
        '
        'OldCity
        '
        Me.OldCity.Location = New System.Drawing.Point(120, 120)
        Me.OldCity.Name = "OldCity"
        Me.OldCity.Size = New System.Drawing.Size(144, 24)
        Me.OldCity.TabIndex = 10
        Me.OldCity.Text = ""
        '
        'Label5
        '
        Me.Label5.Location = New System.Drawing.Point(72, 120)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(48, 23)
        Me.Label5.TabIndex = 9
        Me.Label5.Text = "จังหวัด"
        '
        'OldSchool
        '
        Me.OldSchool.Location = New System.Drawing.Point(120, 56)
        Me.OldSchool.Name = "OldSchool"
        Me.OldSchool.Size = New System.Drawing.Size(240, 24)
        Me.OldSchool.TabIndex = 8
        Me.OldSchool.Text = ""
        '
        'Label4
        '
        Me.Label4.Location = New System.Drawing.Point(40, 56)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(80, 23)
        Me.Label4.TabIndex = 7
        Me.Label4.Text = "จากโรงเรียน"
        '
        'OldWut
        '
        Me.OldWut.Location = New System.Drawing.Point(120, 24)
        Me.OldWut.Name = "OldWut"
        Me.OldWut.Size = New System.Drawing.Size(240, 24)
        Me.OldWut.TabIndex = 6
        Me.OldWut.Text = ""
        '
        'Label7
        '
        Me.Label7.Location = New System.Drawing.Point(104, 272)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(96, 23)
        Me.Label7.TabIndex = 7
        Me.Label7.Text = "ปีที่เข้าศึกษาต่อ"
        '
        'Label8
        '
        Me.Label8.Location = New System.Drawing.Point(88, 304)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(120, 23)
        Me.Label8.TabIndex = 8
        Me.Label8.Text = "ปีที่สำเร็จการศึกษา"
        '
        'Label9
        '
        Me.Label9.Location = New System.Drawing.Point(32, 240)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(168, 23)
        Me.Label9.TabIndex = 9
        Me.Label9.Text = "ประเภทของการเข้าศึกษาต่อ"
        '
        'CBOStudyState
        '
        Me.CBOStudyState.Location = New System.Drawing.Point(200, 240)
        Me.CBOStudyState.Name = "CBOStudyState"
        Me.CBOStudyState.Size = New System.Drawing.Size(224, 26)
        Me.CBOStudyState.TabIndex = 10
        '
        'StartContinues
        '
        Me.StartContinues.Location = New System.Drawing.Point(200, 272)
        Me.StartContinues.Name = "StartContinues"
        Me.StartContinues.TabIndex = 11
        Me.StartContinues.Text = ""
        '
        'ContinuesEnd
        '
        Me.ContinuesEnd.Location = New System.Drawing.Point(200, 304)
        Me.ContinuesEnd.Name = "ContinuesEnd"
        Me.ContinuesEnd.TabIndex = 12
        Me.ContinuesEnd.Text = ""
        '
        'BSave
        '
        Me.BSave.Location = New System.Drawing.Point(200, 344)
        Me.BSave.Name = "BSave"
        Me.BSave.Size = New System.Drawing.Size(88, 40)
        Me.BSave.TabIndex = 13
        Me.BSave.Text = "บันทึกข้อมูล"
        '
        'BEdit
        '
        Me.BEdit.Location = New System.Drawing.Point(296, 344)
        Me.BEdit.Name = "BEdit"
        Me.BEdit.Size = New System.Drawing.Size(80, 40)
        Me.BEdit.TabIndex = 14
        Me.BEdit.Text = "แก้ไขข้อมูล"
        '
        'BCancel
        '
        Me.BCancel.Location = New System.Drawing.Point(384, 344)
        Me.BCancel.Name = "BCancel"
        Me.BCancel.Size = New System.Drawing.Size(80, 40)
        Me.BCancel.TabIndex = 15
        Me.BCancel.Text = "ยกเลิก"
        '
        'Resume_Old_STD
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.ClientSize = New System.Drawing.Size(472, 389)
        Me.Controls.Add(Me.BCancel)
        Me.Controls.Add(Me.BEdit)
        Me.Controls.Add(Me.BSave)
        Me.Controls.Add(Me.ContinuesEnd)
        Me.Controls.Add(Me.StartContinues)
        Me.Controls.Add(Me.CBOStudyState)
        Me.Controls.Add(Me.Label9)
        Me.Controls.Add(Me.Label8)
        Me.Controls.Add(Me.Label7)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.ThaiSurname)
        Me.Controls.Add(Me.ThaiName)
        Me.Controls.Add(Me.id)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "Resume_Old_STD"
        Me.Text = "ประวัติส่วนการศึกษา"
        Me.GroupBox1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region


End Class
