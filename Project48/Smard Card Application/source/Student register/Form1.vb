Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Imports System.Text

Public Class Form1
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
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents MenuItem As System.Windows.Forms.MainMenu
    Friend WithEvents MenuItem1 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem2 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem3 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem4 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem5 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem6 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem9 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem10 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem11 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem12 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem13 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem15 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem16 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem17 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem18 As System.Windows.Forms.MenuItem
    Friend WithEvents tmrRead As System.Windows.Forms.Timer
    Friend WithEvents ReadText As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents StdID As System.Windows.Forms.TextBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents ThaiName As System.Windows.Forms.TextBox
    Friend WithEvents ThaiSurname As System.Windows.Forms.TextBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Factory As System.Windows.Forms.TextBox
    Friend WithEvents Depart As System.Windows.Forms.TextBox
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Blood As System.Windows.Forms.TextBox
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents DataStd As System.Windows.Forms.Button
    Friend WithEvents DataSubject As System.Windows.Forms.Button
    Friend WithEvents DataHealth As System.Windows.Forms.Button
    Friend WithEvents EditSubject As System.Windows.Forms.Button
    Friend WithEvents CheckGrade As System.Windows.Forms.Button
    Friend WithEvents Bexit As System.Windows.Forms.Button
    Friend WithEvents MenuItem19 As System.Windows.Forms.MenuItem
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents UserState As System.Windows.Forms.Label
    Friend WithEvents MenuItem20 As System.Windows.Forms.MenuItem
    Friend WithEvents Bfather As System.Windows.Forms.Button
    Friend WithEvents BfaTher2 As System.Windows.Forms.Button
    Friend WithEvents BStdState As System.Windows.Forms.Button
    Friend WithEvents Regis As System.Windows.Forms.Button
    Friend WithEvents tmrWrite As System.Windows.Forms.Timer
    Friend WithEvents tmrCardout As System.Windows.Forms.Timer
    Friend WithEvents MenuItem7 As System.Windows.Forms.MenuItem
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.Button1 = New System.Windows.Forms.Button
        Me.MenuItem = New System.Windows.Forms.MainMenu
        Me.MenuItem1 = New System.Windows.Forms.MenuItem
        Me.MenuItem2 = New System.Windows.Forms.MenuItem
        Me.MenuItem3 = New System.Windows.Forms.MenuItem
        Me.MenuItem4 = New System.Windows.Forms.MenuItem
        Me.MenuItem5 = New System.Windows.Forms.MenuItem
        Me.MenuItem6 = New System.Windows.Forms.MenuItem
        Me.MenuItem9 = New System.Windows.Forms.MenuItem
        Me.MenuItem10 = New System.Windows.Forms.MenuItem
        Me.MenuItem11 = New System.Windows.Forms.MenuItem
        Me.MenuItem12 = New System.Windows.Forms.MenuItem
        Me.MenuItem13 = New System.Windows.Forms.MenuItem
        Me.MenuItem20 = New System.Windows.Forms.MenuItem
        Me.MenuItem15 = New System.Windows.Forms.MenuItem
        Me.MenuItem16 = New System.Windows.Forms.MenuItem
        Me.MenuItem17 = New System.Windows.Forms.MenuItem
        Me.MenuItem18 = New System.Windows.Forms.MenuItem
        Me.MenuItem19 = New System.Windows.Forms.MenuItem
        Me.MenuItem7 = New System.Windows.Forms.MenuItem
        Me.tmrRead = New System.Windows.Forms.Timer(Me.components)
        Me.ReadText = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.StdID = New System.Windows.Forms.TextBox
        Me.Label3 = New System.Windows.Forms.Label
        Me.ThaiName = New System.Windows.Forms.TextBox
        Me.ThaiSurname = New System.Windows.Forms.TextBox
        Me.Label4 = New System.Windows.Forms.Label
        Me.Factory = New System.Windows.Forms.TextBox
        Me.Depart = New System.Windows.Forms.TextBox
        Me.Label5 = New System.Windows.Forms.Label
        Me.Blood = New System.Windows.Forms.TextBox
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.BStdState = New System.Windows.Forms.Button
        Me.BfaTher2 = New System.Windows.Forms.Button
        Me.Bfather = New System.Windows.Forms.Button
        Me.CheckGrade = New System.Windows.Forms.Button
        Me.EditSubject = New System.Windows.Forms.Button
        Me.DataHealth = New System.Windows.Forms.Button
        Me.DataSubject = New System.Windows.Forms.Button
        Me.DataStd = New System.Windows.Forms.Button
        Me.Bexit = New System.Windows.Forms.Button
        Me.Label1 = New System.Windows.Forms.Label
        Me.UserState = New System.Windows.Forms.Label
        Me.Regis = New System.Windows.Forms.Button
        Me.tmrWrite = New System.Windows.Forms.Timer(Me.components)
        Me.tmrCardout = New System.Windows.Forms.Timer(Me.components)
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(88, 352)
        Me.Button1.Name = "Button1"
        Me.Button1.TabIndex = 1
        Me.Button1.Text = "Send..."
        Me.Button1.Visible = False
        '
        'MenuItem
        '
        Me.MenuItem.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem1, Me.MenuItem3, Me.MenuItem10, Me.MenuItem15})
        '
        'MenuItem1
        '
        Me.MenuItem1.Index = 0
        Me.MenuItem1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem2})
        Me.MenuItem1.Text = "ไฟล์"
        '
        'MenuItem2
        '
        Me.MenuItem2.Index = 0
        Me.MenuItem2.Text = "จบการทำงาน"
        '
        'MenuItem3
        '
        Me.MenuItem3.Index = 1
        Me.MenuItem3.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem4, Me.MenuItem5, Me.MenuItem6, Me.MenuItem9})
        Me.MenuItem3.Text = "ข้อมูล"
        '
        'MenuItem4
        '
        Me.MenuItem4.Index = 0
        Me.MenuItem4.Text = "ข้อมูลนักศึกษา"
        '
        'MenuItem5
        '
        Me.MenuItem5.Index = 1
        Me.MenuItem5.Text = "ข้อมูลผู้ปกครอง"
        '
        'MenuItem6
        '
        Me.MenuItem6.Index = 2
        Me.MenuItem6.Text = "ข้อมูลบิดา-มารดา"
        '
        'MenuItem9
        '
        Me.MenuItem9.Index = 3
        Me.MenuItem9.Text = "ข้อมูลสถานะภาพ"
        '
        'MenuItem10
        '
        Me.MenuItem10.Index = 2
        Me.MenuItem10.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem11, Me.MenuItem12, Me.MenuItem13, Me.MenuItem20})
        Me.MenuItem10.Text = "วิชาการ"
        '
        'MenuItem11
        '
        Me.MenuItem11.Index = 0
        Me.MenuItem11.Text = "เพิ่ม-เปลี่ยน-ลด รายวิชา"
        '
        'MenuItem12
        '
        Me.MenuItem12.Index = 1
        Me.MenuItem12.Text = "ดูเกรดเฉลี่ย"
        '
        'MenuItem13
        '
        Me.MenuItem13.Index = 2
        Me.MenuItem13.Text = "ข้อมูลรหัสวิชา"
        '
        'MenuItem20
        '
        Me.MenuItem20.Index = 3
        Me.MenuItem20.Text = "ข้อมูลประเภทรายวิชา"
        '
        'MenuItem15
        '
        Me.MenuItem15.Index = 3
        Me.MenuItem15.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem16, Me.MenuItem17, Me.MenuItem18, Me.MenuItem19, Me.MenuItem7})
        Me.MenuItem15.Text = "เพิ่มข้อมูล"
        '
        'MenuItem16
        '
        Me.MenuItem16.Index = 0
        Me.MenuItem16.Text = "สัญชาติ-เชื้อชาติ-ศาสนา"
        '
        'MenuItem17
        '
        Me.MenuItem17.Index = 1
        Me.MenuItem17.Text = "คณะวิชาฯ"
        '
        'MenuItem18
        '
        Me.MenuItem18.Index = 2
        Me.MenuItem18.Text = "ภาควิชาฯ"
        '
        'MenuItem19
        '
        Me.MenuItem19.Index = 3
        Me.MenuItem19.Text = "ลงทะเบียนบัตร"
        '
        'MenuItem7
        '
        Me.MenuItem7.Index = 4
        Me.MenuItem7.Text = "ลบข้อมูลบัตร"
        '
        'tmrRead
        '
        Me.tmrRead.Interval = 200
        '
        'ReadText
        '
        Me.ReadText.Location = New System.Drawing.Point(176, 312)
        Me.ReadText.Multiline = True
        Me.ReadText.Name = "ReadText"
        Me.ReadText.Size = New System.Drawing.Size(312, 88)
        Me.ReadText.TabIndex = 3
        Me.ReadText.Text = ""
        Me.ReadText.Visible = False
        '
        'Label2
        '
        Me.Label2.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.Label2.Location = New System.Drawing.Point(48, 96)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(88, 23)
        Me.Label2.TabIndex = 5
        Me.Label2.Text = "รหัสนักศึกษา"
        '
        'StdID
        '
        Me.StdID.BackColor = System.Drawing.SystemColors.ScrollBar
        Me.StdID.Location = New System.Drawing.Point(136, 96)
        Me.StdID.Name = "StdID"
        Me.StdID.Size = New System.Drawing.Size(248, 24)
        Me.StdID.TabIndex = 6
        Me.StdID.Text = ""
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(48, 136)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(88, 23)
        Me.Label3.TabIndex = 7
        Me.Label3.Text = "ชื่อ - นามสกุล "
        '
        'ThaiName
        '
        Me.ThaiName.BackColor = System.Drawing.SystemColors.ScrollBar
        Me.ThaiName.Location = New System.Drawing.Point(136, 136)
        Me.ThaiName.Name = "ThaiName"
        Me.ThaiName.ReadOnly = True
        Me.ThaiName.Size = New System.Drawing.Size(168, 24)
        Me.ThaiName.TabIndex = 8
        Me.ThaiName.Text = ""
        '
        'ThaiSurname
        '
        Me.ThaiSurname.BackColor = System.Drawing.SystemColors.ScrollBar
        Me.ThaiSurname.Location = New System.Drawing.Point(304, 136)
        Me.ThaiSurname.Name = "ThaiSurname"
        Me.ThaiSurname.ReadOnly = True
        Me.ThaiSurname.Size = New System.Drawing.Size(168, 24)
        Me.ThaiSurname.TabIndex = 9
        Me.ThaiSurname.Text = ""
        '
        'Label4
        '
        Me.Label4.Location = New System.Drawing.Point(80, 184)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(56, 23)
        Me.Label4.TabIndex = 10
        Me.Label4.Text = "คณะวิชา"
        '
        'Factory
        '
        Me.Factory.BackColor = System.Drawing.SystemColors.Menu
        Me.Factory.Location = New System.Drawing.Point(136, 184)
        Me.Factory.Name = "Factory"
        Me.Factory.ReadOnly = True
        Me.Factory.Size = New System.Drawing.Size(248, 24)
        Me.Factory.TabIndex = 11
        Me.Factory.Text = ""
        '
        'Depart
        '
        Me.Depart.BackColor = System.Drawing.SystemColors.Menu
        Me.Depart.Location = New System.Drawing.Point(136, 224)
        Me.Depart.Name = "Depart"
        Me.Depart.ReadOnly = True
        Me.Depart.Size = New System.Drawing.Size(248, 24)
        Me.Depart.TabIndex = 12
        Me.Depart.Text = ""
        '
        'Label5
        '
        Me.Label5.Location = New System.Drawing.Point(80, 224)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(56, 23)
        Me.Label5.TabIndex = 13
        Me.Label5.Text = "ภาควิชา"
        '
        'Blood
        '
        Me.Blood.BackColor = System.Drawing.SystemColors.Menu
        Me.Blood.Location = New System.Drawing.Point(136, 272)
        Me.Blood.Name = "Blood"
        Me.Blood.ReadOnly = True
        Me.Blood.TabIndex = 15
        Me.Blood.Text = ""
        Me.Blood.Visible = False
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.BStdState)
        Me.GroupBox1.Controls.Add(Me.BfaTher2)
        Me.GroupBox1.Controls.Add(Me.Bfather)
        Me.GroupBox1.Controls.Add(Me.CheckGrade)
        Me.GroupBox1.Controls.Add(Me.EditSubject)
        Me.GroupBox1.Controls.Add(Me.DataHealth)
        Me.GroupBox1.Controls.Add(Me.DataSubject)
        Me.GroupBox1.Controls.Add(Me.DataStd)
        Me.GroupBox1.Location = New System.Drawing.Point(504, 40)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(240, 360)
        Me.GroupBox1.TabIndex = 18
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "เลือกการทำงาน"
        '
        'BStdState
        '
        Me.BStdState.Location = New System.Drawing.Point(48, 72)
        Me.BStdState.Name = "BStdState"
        Me.BStdState.Size = New System.Drawing.Size(152, 32)
        Me.BStdState.TabIndex = 7
        Me.BStdState.Text = "ข้อมูลสถานะภาพ"
        '
        'BfaTher2
        '
        Me.BfaTher2.Location = New System.Drawing.Point(48, 152)
        Me.BfaTher2.Name = "BfaTher2"
        Me.BfaTher2.Size = New System.Drawing.Size(152, 32)
        Me.BfaTher2.TabIndex = 6
        Me.BfaTher2.Text = "ข้อมูลผู้ปกครอง"
        '
        'Bfather
        '
        Me.Bfather.Location = New System.Drawing.Point(48, 112)
        Me.Bfather.Name = "Bfather"
        Me.Bfather.Size = New System.Drawing.Size(152, 32)
        Me.Bfather.TabIndex = 5
        Me.Bfather.Text = "ข้อมูลบิดา-มารดา"
        '
        'CheckGrade
        '
        Me.CheckGrade.Location = New System.Drawing.Point(48, 312)
        Me.CheckGrade.Name = "CheckGrade"
        Me.CheckGrade.Size = New System.Drawing.Size(152, 32)
        Me.CheckGrade.TabIndex = 4
        Me.CheckGrade.Text = "ตรวจสอบผลการเรียน"
        '
        'EditSubject
        '
        Me.EditSubject.Location = New System.Drawing.Point(48, 272)
        Me.EditSubject.Name = "EditSubject"
        Me.EditSubject.Size = New System.Drawing.Size(152, 32)
        Me.EditSubject.TabIndex = 3
        Me.EditSubject.Text = "แก้ไขรายวิชา"
        '
        'DataHealth
        '
        Me.DataHealth.Location = New System.Drawing.Point(48, 232)
        Me.DataHealth.Name = "DataHealth"
        Me.DataHealth.Size = New System.Drawing.Size(152, 32)
        Me.DataHealth.TabIndex = 2
        Me.DataHealth.Text = "ข้อมูลสุขภาพ"
        Me.DataHealth.Visible = False
        '
        'DataSubject
        '
        Me.DataSubject.Location = New System.Drawing.Point(48, 192)
        Me.DataSubject.Name = "DataSubject"
        Me.DataSubject.Size = New System.Drawing.Size(152, 32)
        Me.DataSubject.TabIndex = 1
        Me.DataSubject.Text = "ข้อมูลวิชาการ"
        '
        'DataStd
        '
        Me.DataStd.Location = New System.Drawing.Point(48, 32)
        Me.DataStd.Name = "DataStd"
        Me.DataStd.Size = New System.Drawing.Size(152, 32)
        Me.DataStd.TabIndex = 0
        Me.DataStd.Text = "ข้อมูลนักศึกษา"
        '
        'Bexit
        '
        Me.Bexit.Location = New System.Drawing.Point(504, 408)
        Me.Bexit.Name = "Bexit"
        Me.Bexit.Size = New System.Drawing.Size(96, 48)
        Me.Bexit.TabIndex = 19
        Me.Bexit.Text = "จบการทำงาน"
        '
        'Label1
        '
        Me.Label1.BackColor = System.Drawing.Color.White
        Me.Label1.ForeColor = System.Drawing.SystemColors.InfoText
        Me.Label1.Location = New System.Drawing.Point(32, 48)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(104, 23)
        Me.Label1.TabIndex = 21
        Me.Label1.Text = "สถานะของระบบ"
        '
        'UserState
        '
        Me.UserState.BackColor = System.Drawing.Color.FromArgb(CType(255, Byte), CType(224, Byte), CType(192, Byte))
        Me.UserState.ForeColor = System.Drawing.Color.Red
        Me.UserState.Location = New System.Drawing.Point(136, 48)
        Me.UserState.Name = "UserState"
        Me.UserState.Size = New System.Drawing.Size(128, 23)
        Me.UserState.TabIndex = 22
        '
        'Regis
        '
        Me.Regis.Location = New System.Drawing.Point(368, 408)
        Me.Regis.Name = "Regis"
        Me.Regis.Size = New System.Drawing.Size(128, 48)
        Me.Regis.TabIndex = 24
        Me.Regis.Text = "เพิ่มข้อมูลนักศึกษา"
        Me.Regis.Visible = False
        '
        'tmrWrite
        '
        Me.tmrWrite.Interval = 80
        '
        'tmrCardout
        '
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.ClientSize = New System.Drawing.Size(776, 481)
        Me.Controls.Add(Me.Regis)
        Me.Controls.Add(Me.UserState)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.Bexit)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.Blood)
        Me.Controls.Add(Me.Depart)
        Me.Controls.Add(Me.Factory)
        Me.Controls.Add(Me.ThaiSurname)
        Me.Controls.Add(Me.ThaiName)
        Me.Controls.Add(Me.StdID)
        Me.Controls.Add(Me.ReadText)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Button1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ForeColor = System.Drawing.Color.Black
        Me.IsMdiContainer = True
        Me.Menu = Me.MenuItem
        Me.Name = "Form1"
        Me.Text = "ข้อมูลนักศึกษา"
        Me.GroupBox1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region


    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"

    Public oCP As New Rs232

    Public intCommPort, intBaud, intData As Integer
    Public bytStop As Rs232.DataStopBit
    Public bytParity As Rs232.DataParity

    Private SendData As String = ""
    Private Sendloop As Integer = 0
    Private TextSend As String = ""

    Private CardIn_out As Boolean = False
    Private writewd As String = "write" + Chr(13) + Chr(5)
    Private loopw As Integer = 0
    Private StatusWrite As Boolean = False

    Private Wait As WaitUpdate


    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Me.WindowState = FormWindowState.Maximized
        Cursor.Current = Cursors.WaitCursor

        StatusWrite = False
        Wait = New WaitUpdate

        Me.tmrWrite.Enabled = False
        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        Dim i As Integer
        For i = 0 To 3
            mComs(i) = IsPortAvailable(i + 1)
        Next
        InitPort()
        Dim Login As New LoginUser
        If Login.ShowDialog Then
            If StatusUser Then
                StdID.ReadOnly = False
                UserState.Text = "    เจ้าหน้าที่"
                DataSubject.Enabled = True
            Else
                StdID.ReadOnly = True
                UserState.Text = "    นักศึกษา"
                DataSubject.Enabled = False
            End If
        End If
        If Student_ID = "" Then
            ResetButtom()
        End If
        If StatusUser Then
            Regis.Visible = True
        End If
        tmrCardout.Enabled = True

    End Sub
    Private Function InitPort() As Boolean
        intCommPort = 1
        intBaud = 9600
        intData = 8
        bytParity = Rs232.DataParity.Parity_None
        bytStop = Rs232.DataStopBit.StopBit_1
        oCP.Open(intCommPort, intBaud, intData, bytParity, bytStop, 4096)

        tmrRead.Enabled = True

    End Function
    Private Function IsPortAvailable(ByVal ComPort As Integer) As Boolean
        Try
            oCP.Open(ComPort, 9600, 8, Rs232.DataParity.Parity_None, _
                Rs232.DataStopBit.StopBit_1, 4096)

            oCP.Close()
            Return True
        Catch
            Return False
        End Try
    End Function

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Send()
    End Sub
    Private Function Send() As Boolean
        SendData = ReadText.Text
        Try
            ' เขียน string ออก port
            oCP.Write(Encoding.ASCII.GetBytes(Me.ReadText.Text & Chr(13)))
            WriteMessage(CStr(SendData), True)
        Catch ex As Exception
            MessageBox.Show("Unable to write to comm port")
        Finally
            ReadText.Text = ""
            ReadText.Focus()
        End Try
    End Function

    Private Sub MenuItem2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem2.Click
        Me.Close()
    End Sub

    Private Sub MenuItem4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem4.Click
        Dim Form As New Resume_STD
        Form.Show()
    End Sub

    Private Sub MenuItem5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem5.Click
        Dim Form As New Resume_Fa1
        Form.Show()
    End Sub

    Private Sub MenuItem6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem6.Click
        Dim Form As New Resume_F2
        Form.Show()
    End Sub

    Private Sub MenuItem9_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem9.Click
        Dim Form As New STD_STATUS
        Form.Show()
    End Sub

    Private Sub MenuItem11_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem11.Click
        Dim Form As New Change_SUB
        Form.Show()
    End Sub

    Private Sub MenuItem12_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem12.Click
        Dim Form As New GRADE
        Form.Show()
    End Sub

    Private Sub MenuItem13_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem13.Click
        If StatusUser Then
            Dim Form As New Add_SUBJECT
            Form.Show()
        Else
            MessageBox.Show("คุณไม่ใช่เจ้านาที่", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
        End If
    End Sub

    Private Sub MenuItem14_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        If StatusUser Then
            Dim Form As New Add_Teacher
            Form.Show()
        Else
            MessageBox.Show("คุณไม่ใช่เจ้านาที่", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
        End If
    End Sub

    Private Sub MenuItem16_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem16.Click
        If StatusUser Then
            Dim Form As New Add_RELIGOIN
            Form.Show()
        Else
            MessageBox.Show("คุณไม่ใช่เจ้านาที่", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
        End If
    End Sub

    Private Sub MenuItem17_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem17.Click
        If StatusUser Then
            Dim Form As New Add_FACURITY
            Form.Show()
        Else
            MessageBox.Show("คุณไม่ใช่เจ้านาที่", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
        End If
    End Sub

    Private Sub MenuItem18_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem18.Click
        If StatusUser Then
            Dim Form As New Add_DEPART
            Form.Show()
        Else
            MessageBox.Show("คุณไม่ใช่เจ้านาที่", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
        End If
    End Sub

    Private Sub tmrRead_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles tmrRead.Tick
        Try
            While (oCP.Read(1) <> -1)
                Me.tmrRead.Enabled = False
                If (Chr(oCP.InputStream(0)) <> Chr(4)) Then
                    WriteMessage(Chr(oCP.InputStream(0)), False)
                Else
                    CardIn_out = True
                End If
                CardIn_out = True
            End While

        Catch exc As Exception
            If StatusWrite Then
                StatusWrite = False
                TextSend = TxtSendData
                Me.tmrWrite.Enabled = True
                Sendloop = 0

            Else
                If CardIn_out And ReadText.Text.Length > 100 Then
                    CheckCardIn()
                    CardIn_out = False
                Else
                    Me.tmrRead.Enabled = True
                End If
            End If

        End Try

    End Sub
    Private Function ChRegisCard() As Boolean
        Dim strlen As Integer = ReadText.TextLength
        Dim loopstr As Integer = 0
        While (loopstr < strlen)
            If ReadText.Text.Chars(loopstr) = Chr(3) Then
                Return True
            End If
            loopstr = loopstr + 1
        End While
        Return False
    End Function
    Private Function CardIDin() As Boolean
        Dim temp As String = ReadText.Text
        Dim i As Integer = 0
        While i < temp.Length
            If temp.Chars(i) <> Chr(2) Then
                UniqeCardID += temp.Chars(i)
            Else
                Exit Function
            End If
            i += 1
        End While
    End Function
    Private Function CheckCardIn() As Boolean
        'CardIDin()
        If ChRegisCard() Then

            Dim CardIn As String = ReadText.Text
            SmartHealth = ""
            SmartStudent = ""
            SmartMoney = ""

            CardIn = CardIn + Chr(4)
            Dim LoopIn As Integer = 0
            While CardIn.Chars(LoopIn) <> Chr(4)
                If CardIn.Chars(LoopIn) = Chr(2) Then
                    LoopIn = LoopIn + 1
                    While CardIn.Chars(LoopIn) <> Chr(3)
                        SmartStudent = SmartStudent + CardIn.Chars(LoopIn)
                        LoopIn = LoopIn + 1
                    End While
                    LoopIn = LoopIn + 1
                    While CardIn.Chars(LoopIn) <> Chr(3)
                        SmartHealth = SmartHealth + CardIn.Chars(LoopIn)
                        LoopIn = LoopIn + 1
                    End While
                    LoopIn = LoopIn + 1
                    While CardIn.Chars(LoopIn) <> Chr(3)
                        SmartMoney = SmartMoney + CardIn.Chars(LoopIn)
                        LoopIn = LoopIn + 1
                    End While
                    LoopIn = LoopIn + 1
                End If
                LoopIn = LoopIn + 1
            End While

            CheckPassword()
            Me.tmrCardout.Enabled = True
        Else
            MsgBox("บัตร ยังไม่ได้ลงทะเบียน")
            Me.tmrCardout.Enabled = True
        End If

        Return True
    End Function
    Private Function CheckPassword() As Boolean

        Dim loopdata As Integer = 0

        Dim datapwd As String = ""
        Dim dataIdstd As String = ""
        Dim tempname As String = ""
        Dim tempsurname As String = ""

        '******************************* ถอดรหัส
        'Dim tempStr As String = SmartStudent
        'Dim tempStr1 As String = ""
        'Dim tempStr2 As String = ""
        'Dim i As Integer = 0
        'Dim idBolean As Boolean = True
        'While i < tempStr.Length
        'If tempStr.Chars(i) <> Chr(64) And idBolean Then
        ' tempStr1 += tempStr.Chars(i)
        ' idBolean = False
        ' Else
        '    tempStr2 += tempStr.Chars(i)
        'End If
        'i += 1
        'End While
        'i = 0
        'Dim i1 As Integer = tempStr1.Length
        'Dim lenghtPwd As String = tempStr1.Chars(i1 - 1)
        'Dim lenghtID As Integer = (i1 - lenghtPwd - 1)
        'Dim tempID As String = ""
        'Dim tempPwd As String = ""
        'While i < lenghtID
        'tempID += tempStr1.Chars(i)
        'i += 1
        'End While
        'While i < (i1 - 1)
        'tempPwd += tempStr1.Chars(i)
        'i += 1
        'End While

        'If tempID = UniqeCardID Then
        'Else
        '    MessageBox.Show("ไม่สามารถใช้งานบัตรของคุณได้", "ข้อผิดพลาด", MessageBoxButtons.OK, MessageBoxIcon.Stop)
        '    Return False
        'End If
        'SmartStudent = tempPwd + tempStr2

        Dim lengthdata As Integer = SmartStudent.Length
        '*******************************

        While (loopdata < lengthdata)
            While (SmartStudent.Chars(loopdata) <> Chr(64))
                datapwd = datapwd + SmartStudent.Chars(loopdata)
                loopdata = loopdata + 1
            End While
            loopdata = loopdata + 1

            While (SmartStudent.Chars(loopdata) <> Chr(64))
                dataIdstd = dataIdstd + SmartStudent.Chars(loopdata)
                loopdata = loopdata + 1
            End While
            loopdata = loopdata + 1

            While (SmartStudent.Chars(loopdata) <> Chr(64))
                tempname = tempname + SmartStudent.Chars(loopdata)
                loopdata = loopdata + 1
            End While
            loopdata = loopdata + 1

            While (loopdata < lengthdata)
                tempsurname = tempsurname + SmartStudent.Chars(loopdata)
                loopdata = loopdata + 1
            End While
            loopdata = loopdata + 1
        End While

        Student_ID = dataIdstd
        thaiNM = tempname
        ThaiSurNM = tempsurname
        Dim temp As String = DecodePwd(datapwd)
        CheckPassword(temp)

    End Function

    Private Function SubString(ByVal data As String) As String
        Dim i As Integer = 0

        Dim Strtemp As String = ""
        While data.Chars(i) <> Chr(2)
            Strtemp = Strtemp + data.Chars(i)
            i = i + 1
        End While
        i = i + 1
        Student_ID = ""
        While data.Chars(i) <> Chr(3)
            Student_ID = Student_ID + data.Chars(i)
            i = i + 1
        End While
        Return Strtemp
    End Function
    Public Function CheckPassword(ByVal Data As String) As Boolean
        DataOfCard = Data
        Dim Forms As New LOGIN
        If Forms.ShowDialog() Then
            If Pwd Then
                ShowStatus()
            End If
        End If
    End Function
    Private Function ShowStatus() As Boolean
        Dim sql As String = ""
        sql = "SELECT a.Std_ID, a.Std_BLOOD, b.NAME as Name1, c.NAME as Name2 "
        sql = sql + " FROM Student a,Department b,Factory c,Status_ST d"
        sql = sql + " where a.Sta_NUM = d.Sta_NUM and d.Sta_DIV = b.Sta_DIV and b.Sta_Fact = c.Sta_Fact "
        sql = sql + " and a.Std_ID = '" + Student_ID + "'"

        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Query1")
        If ds.Tables("Query1").Rows.Count <> 0 Then
            StdID.Text = CStr(ds.Tables("Query1").Rows(0).Item("Std_ID"))
            Factory.Text = CStr(ds.Tables("Query1").Rows(0).Item("Name2"))
            Depart.Text = CStr(ds.Tables("Query1").Rows(0).Item("Name1"))
            Blood.Text = CStr(ds.Tables("Query1").Rows(0).Item("Std_BLOOD"))
            GlDepart = Depart.Text
            GlFactory = Factory.Text

            sql = "Select c.Std_NAME,c.Std_SURNAME,c.StdE_NAME,c.StdE_SURNAME"
            sql = sql + " From Student a,NameStudent c "
            sql = sql + " Where a.Std_NUM = c.Std_NUM "
            sql = sql + " and a.Std_ID = '" + Student_ID + "'"

            da.SelectCommand.CommandText = sql
            da.Fill(ds, "Query2")
            If ds.Tables("Query2").Rows.Count <> 0 Then
                ThaiName.Text = CStr(ds.Tables("Query2").Rows(0).Item("Std_NAME"))
                ThaiSurname.Text = CStr(ds.Tables("Query2").Rows(0).Item("Std_SURNAME"))
                thaiNM = ThaiName.Text
                ThaiSurNM = ThaiSurname.Text
                EThaiSurNM = CStr(ds.Tables("Query2").Rows(0).Item("StdE_SURNAME"))
                EthaiNM = CStr(ds.Tables("Query2").Rows(0).Item("StdE_NAME"))
                ShowButtom()
            End If
        Else
            MessageBox.Show("No Record !", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End If
    End Function
    Private Sub WriteMessage(ByVal message As String, ByVal write As Boolean)
        If write Then
        Else
            ReadText.Text += message  ' String ทั้งหมดที่อ่านเข้ามา อยู่ในตัวแปร inputString
        End If
    End Sub

    Private Sub Bexit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Bexit.Click
        Me.Close()
    End Sub

    Private Sub MenuItem19_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem19.Click
        Dim Card As New RegisCard
        If StatusUser Then
            If Student_ID <> "" Then
                If Card.ShowDialog Then
                    If PwdToCard <> "" Then
                        EncodePwd()
                    End If
                End If
            Else
                Dim Student As New Resume_STD
                Student.Show()
            End If
        Else
            MessageBox.Show("คุณไม่ใช่เจ้านาที่", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
        End If
    End Sub
    Private Function EncodePwd() As Boolean
        If SmartHealth = "" Then
            SmartHealth = "none"  'ว่าง
        End If
        If SmartMoney = "" Then
            SmartMoney = "0"   'ว่าง
        End If
        Dim temp As String = EncoderPwd(PwdToCard)
        'temp += UniqeCardID
        'temp += CStr(temp.Length)
        Wait.Show()
        TxtSendData = temp + Chr(64) + Student_ID + Chr(64) + EthaiNM + Chr(64) + EThaiSurNM + Chr(3) + SmartHealth + Chr(3) + SmartMoney + Chr(3) + Chr(4) + Chr(13) + Chr(5)
        TextSend = "write" + Chr(13) + Chr(5)
        StatusWrite = True
        tmrCardout.Enabled = False
        Me.tmrWrite.Enabled = True
        Sendloop = 0

    End Function
    Private Function EncoderPwd(ByVal data As String) As String

        Dim i As Integer = 4
        Dim temp0 As Integer = Asc(data.Chars(0))
        Dim temp1 As Integer = Asc(data.Chars(1))
        Dim temp2 As Integer = Asc(data.Chars(2))
        Dim temp3 As Integer = Asc(data.Chars(3))
        Dim CodeData As String = ""
        CodeData = Chr(temp0 - 10)
        CodeData = CodeData + Chr(temp1 - 15)
        CodeData = CodeData + Chr(temp2 - 10)
        CodeData = CodeData + Chr(temp3 - 17)
        While i < data.Length
            CodeData = CodeData + data.Chars(i)
            i = i + 1
        End While
        Return CodeData

    End Function
    Private Function DecodePwd(ByVal CodeData As String) As String

        Dim i As Integer = 0
        Dim tenp0 As Integer = Asc(CodeData.Chars(0))
        Dim tenp1 As Integer = Asc(CodeData.Chars(1))
        Dim tenp2 As Integer = Asc(CodeData.Chars(2))
        Dim tenp3 As Integer = Asc(CodeData.Chars(3))
        Dim CodeData1 As String = ""
        i = 4

        CodeData1 = Chr(tenp0 + 10)
        CodeData1 = CodeData1 + Chr(tenp1 + 15)
        CodeData1 = CodeData1 + Chr(tenp2 + 10)
        CodeData1 = CodeData1 + Chr(tenp3 + 17)
        While i < CodeData.Length
            CodeData1 = CodeData1 + CodeData.Chars(i)
            i = i + 1
        End While
        Return CodeData1

    End Function

    Private Sub StdID_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StdID.TextChanged
        If StdID.TextLength = 8 Then
            Student_ID = StdID.Text
            Dim sql As String = ""
            sql = "Select * from Student Where Std_ID = '" + Student_ID + "'"
            da = New SqlDataAdapter(sql, Conn)
            ds.Tables.Clear()
            da.Fill(ds, "Query1")
            If ds.Tables("Query1").Rows.Count <> 0 Then
                ShowStatus()
            Else
                ClearText()
                If MessageBox.Show("รหัสนักศึกษานี้ไม่มีในฐานข้อมูล! คุณต้องการที่จะทำการเพิ่มข้อมูลรหัสนักศึกษาใหม่หรือไม่", "คำถาม", MessageBoxButtons.YesNo, MessageBoxIcon.Stop) = DialogResult.Yes Then

                    AddNewStudent()

                End If
            End If
        Else
            ClearText()
            Student_ID = ""
        End If
    End Sub
    Private Function AddNewStudent() As Boolean
        RegisterSTD = False
        Dim Std As New Resume_STD
        If Std.ShowDialog() Then

            If RegisterSTD Then
                RegisterSTD = False
                Dim fa As New Resume_Fa
                If fa.ShowDialog() Then

                    If RegisterSTD Then
                        RegisterSTD = False
                        Dim Ma As New Resume_Ma
                        If Ma.ShowDialog() Then

                            If RegisterSTD Then
                                RegisterSTD = False
                                Dim Fa2 As New Resume_Fa1
                                If Fa2.ShowDialog() Then

                                    If RegisterSTD Then
                                        RegisterSTD = False
                                        Dim StdState As New STD_STATUS
                                        If StdState.ShowDialog() Then

                                            If RegisterSTD Then
                                                RegisterSTD = False
                                                ShowStatus()
                                                Return True
                                            End If
                                        End If
                                    End If
                                End If
                            End If
                        End If
                    End If
                End If
            End If
        End If

        DelCancel()
        Return False

    End Function
    Private Function DelCancel() As Boolean
        Dim sql As String = ""
        Dim Stanum As String = ""
        Dim RstdNum As String = ""
        Dim StdNum As String = ""

        sql = "Select Std_ID,Sta_NUM,Adr_NUMStd,Std_NUM from Student Where Std_ID = '" + StdID.Text + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Query1")
        If ds.Tables("Query1").Rows.Count <> 0 Then
            Stanum = ds.Tables("Query1").Rows(0).Item("Sta_NUM")
            RstdNum = ds.Tables("Query1").Rows(0).Item("Adr_NUMStd")
            StdNum = ds.Tables("Query1").Rows(0).Item("Std_NUM")

            sql = "Delete From Student where Std_ID = '" + StdID.Text + "'"
            da.SelectCommand.CommandText = sql
            da.Fill(ds, "delete")

            sql = "Delete From NameStudent where Std_NUM = " + StdNum
            da.SelectCommand.CommandText = sql
            da.Fill(ds, "delete")

            sql = "Delete From AddrStudent where Adr_NUMStd = " + RstdNum
            da.SelectCommand.CommandText = sql
            da.Fill(ds, "delete")

        End If

        sql = "SELECT a.Std_ID,a.Fa_NUM,b.Std_NUM FROM FatherID a INNER JOIN "
        sql = sql + " Father b ON a.Fa_NUM = b.Fa_NUM WHERE (a.Std_ID = '" + StdID.Text + "') "
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Query1")
        If ds.Tables("Query1").Rows.Count = 3 Then

            Dim temp As String = ds.Tables("Query1").Rows(0).Item("Std_NUM")
            sql = "Delete From NameStudent where Std_NUM = " + temp
            da.SelectCommand.CommandText = sql
            da.Fill(ds, "delete")

            temp = ds.Tables("Query1").Rows(1).Item("Std_NUM")
            sql = "Delete From NameStudent where Std_NUM = " + temp
            da.SelectCommand.CommandText = sql
            da.Fill(ds, "delete")

            temp = ds.Tables("Query1").Rows(2).Item("Std_NUM")
            sql = "Delete From NameStudent where Std_NUM = " + temp
            da.SelectCommand.CommandText = sql
            da.Fill(ds, "delete")

            temp = ds.Tables("Query1").Rows(0).Item("Fa_NUM")
            sql = "Delete From father where fa_NUM = " + temp
            da.SelectCommand.CommandText = sql
            da.Fill(ds, "delete")

            temp = ds.Tables("Query1").Rows(1).Item("Fa_NUM")
            sql = "Delete From father where fa_NUM = " + temp
            da.SelectCommand.CommandText = sql
            da.Fill(ds, "delete")

            temp = ds.Tables("Query1").Rows(2).Item("Fa_NUM")
            sql = "Delete From father where fa_NUM = " + temp
            da.SelectCommand.CommandText = sql
            da.Fill(ds, "delete")

            sql = "Delete From fatherID where Std_ID = '" + StdID.Text + "'"
            da.SelectCommand.CommandText = sql
            da.Fill(ds, "delete")

        End If

        If Stanum <> "" Then
            sql = "Select * from Status_ST Where Sta_NUM = " + Stanum
            da = New SqlDataAdapter(sql, Conn)
            ds.Tables.Clear()
            da.Fill(ds, "Query1")
            If ds.Tables("Query1").Rows.Count <> 0 Then

                sql = "Delete From Status_ST where Sta_NUM = " + Stanum
                da.SelectCommand.CommandText = sql
                da.Fill(ds, "delete")

            End If
        End If
        StdID.Text = ""
    End Function
    Private Function ClearText() As Boolean
        ThaiName.Clear()
        ThaiSurname.Clear()
        Factory.Clear()
        Depart.Clear()
        Blood.Clear()
        ResetButtom()
        Return True
    End Function
    Private Function ResetButtom() As Boolean
        DataStd.Enabled = False
        'DataSubject.Enabled = False
        DataHealth.Enabled = False
        EditSubject.Enabled = False
        CheckGrade.Enabled = False
        Bfather.Enabled = False
        BfaTher2.Enabled = False
        BStdState.Enabled = False
    End Function
    Private Function ShowButtom() As Boolean
        DataStd.Enabled = True
        'DataSubject.Enabled = True
        DataHealth.Enabled = True
        EditSubject.Enabled = True
        CheckGrade.Enabled = True
        Bfather.Enabled = True
        BfaTher2.Enabled = True
        BStdState.Enabled = True
    End Function

    Private Sub CheckGrade_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckGrade.Click
        Dim grade As New GRADE
        grade.Show()
    End Sub

    Private Sub EditSubject_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles EditSubject.Click
        Dim EditRegis As New Change_SUB
        EditRegis.Show()
    End Sub


    Private Sub DataStd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DataStd.Click
        Dim Std As New Resume_STD
        Std.Show()
    End Sub

    Private Sub DataSubject_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DataSubject.Click
        Dim Subject As New Add_SUBJECT
        Subject.Show()
    End Sub

    Private Sub MenuItem20_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem20.Click
        Dim Subject As New Add_Status_SUB
        Subject.Show()
    End Sub

    Private Sub Bfather_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Bfather.Click
        Dim far As New Resume_F2
        If far.ShowDialog Then

        End If
    End Sub

    Private Sub BfaTher2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BfaTher2.Click
        Dim far As New Resume_Fa1
        far.ShowDialog()

    End Sub

    Private Sub BStdState_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BStdState.Click
        Dim Sta As New STD_STATUS
        Sta.ShowDialog()

    End Sub

    Private Sub Regis_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Regis.Click
        StdID.Clear()
        NewID = True
        AddNewStudent()
        NewID = False
    End Sub

    Private Sub tmrWrite_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles tmrWrite.Tick

        If TextSend.Chars(Sendloop) <> Chr(5) Then
            ReadText.Text = TextSend.Chars(Sendloop)
            Sendloop = Sendloop + 1

            Try
                oCP.Write(Encoding.ASCII.GetBytes(Me.ReadText.Text))
                WriteMessage(ReadText.Text, True)
            Catch ex As Exception
                MessageBox.Show("Unable to write to comm port")
                Me.tmrWrite.Enabled = False
            Finally
                ReadText.Text = ""

            End Try
        Else
            Me.tmrWrite.Enabled = False
            Sendloop = 0
            If StatusWrite Then
                Me.tmrRead.Enabled = True
            Else
                'MsgBox("Register Successfull.....")
                Wait.Close()
                Wait = New WaitUpdate
                Me.tmrCardout.Enabled = True
            End If
        End If

    End Sub

    Private Sub tmrCardout_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles tmrCardout.Tick
        Dim out As Boolean = False
        Try
            While (oCP.Read(1) <> -1)
                Me.tmrCardout.Enabled = False
                WriteMessage(Chr(oCP.InputStream(0)), False)
                out = True
            End While

        Catch exc As Exception
            If out Then
                If ReadText.Text.Length > 15 Then
                    If ReadText.Text.Chars(1) = Chr(82) Then
                        out = False
                        CardIn_out = False
                        tmrWrite.Enabled = False
                        Me.tmrCardout.Enabled = False
                        Me.tmrCardout.Stop()
                        'MsgBox("Remove Card out")
                        StdID.Text = ""
                        ReadText.Text = ""
                        ResetButtom()
                        tmrRead.Enabled = True
                    Else
                        out = False
                        Me.tmrCardout.Enabled = True
                    End If
                Else
                    out = False
                    Me.tmrCardout.Enabled = True
                End If

            Else
                Me.tmrCardout.Enabled = True
                ReadText.Text = Chr(13)
                Try
                    oCP.Write(Encoding.ASCII.GetBytes(Me.ReadText.Text & Chr(13)))
                    WriteMessage(ReadText.Text, True)
                Catch ex As Exception
                    MessageBox.Show("Unable to write to comm port")
                    Me.tmrWrite.Enabled = False
                Finally
                    'ReadText.Text = ""
                End Try
            End If
        End Try

    End Sub

    Private Sub MenuItem7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem7.Click
        If StatusUser Then
            Wait.Show()
            TxtSendData = "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" + Chr(13) + Chr(5)
            TextSend = "write" + Chr(13) + Chr(5)
            StatusWrite = True
            tmrCardout.Enabled = False
            Me.tmrWrite.Enabled = True
            Sendloop = 0
        Else
            MessageBox.Show("คุณไม่ใช่เจ้านาที่", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
        End If
    End Sub
End Class
