Option Explicit On 
Option Strict On
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Public Class STD_STATUS
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
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents ThaiSurname As System.Windows.Forms.TextBox
    Friend WithEvents ThaiName As System.Windows.Forms.TextBox
    Friend WithEvents StdID As System.Windows.Forms.TextBox
    Friend WithEvents BCancel As System.Windows.Forms.Button
    Friend WithEvents Bedit As System.Windows.Forms.Button
    Friend WithEvents Bsave As System.Windows.Forms.Button
    Friend WithEvents TeaName As System.Windows.Forms.TextBox
    Friend WithEvents Level As System.Windows.Forms.TextBox
    Friend WithEvents Factory As System.Windows.Forms.ComboBox
    Friend WithEvents Depart As System.Windows.Forms.ComboBox
    Friend WithEvents SecondType As System.Windows.Forms.TextBox
    Friend WithEvents firstType As System.Windows.Forms.TextBox
    Friend WithEvents mainType As System.Windows.Forms.TextBox
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.ThaiSurname = New System.Windows.Forms.TextBox
        Me.ThaiName = New System.Windows.Forms.TextBox
        Me.StdID = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label1 = New System.Windows.Forms.Label
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.BCancel = New System.Windows.Forms.Button
        Me.Bedit = New System.Windows.Forms.Button
        Me.Bsave = New System.Windows.Forms.Button
        Me.GroupBox4 = New System.Windows.Forms.GroupBox
        Me.TeaName = New System.Windows.Forms.TextBox
        Me.Label9 = New System.Windows.Forms.Label
        Me.GroupBox3 = New System.Windows.Forms.GroupBox
        Me.Level = New System.Windows.Forms.TextBox
        Me.Label8 = New System.Windows.Forms.Label
        Me.Factory = New System.Windows.Forms.ComboBox
        Me.Depart = New System.Windows.Forms.ComboBox
        Me.Label7 = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.SecondType = New System.Windows.Forms.TextBox
        Me.firstType = New System.Windows.Forms.TextBox
        Me.mainType = New System.Windows.Forms.TextBox
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox4.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.SuspendLayout()
        '
        'ThaiSurname
        '
        Me.ThaiSurname.Location = New System.Drawing.Point(248, 40)
        Me.ThaiSurname.Name = "ThaiSurname"
        Me.ThaiSurname.ReadOnly = True
        Me.ThaiSurname.Size = New System.Drawing.Size(152, 24)
        Me.ThaiSurname.TabIndex = 19
        Me.ThaiSurname.Text = ""
        '
        'ThaiName
        '
        Me.ThaiName.Location = New System.Drawing.Point(96, 40)
        Me.ThaiName.Name = "ThaiName"
        Me.ThaiName.ReadOnly = True
        Me.ThaiName.Size = New System.Drawing.Size(144, 24)
        Me.ThaiName.TabIndex = 18
        Me.ThaiName.Text = ""
        '
        'StdID
        '
        Me.StdID.Location = New System.Drawing.Point(96, 8)
        Me.StdID.Name = "StdID"
        Me.StdID.ReadOnly = True
        Me.StdID.Size = New System.Drawing.Size(144, 24)
        Me.StdID.TabIndex = 17
        Me.StdID.Text = ""
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(16, 40)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(88, 23)
        Me.Label2.TabIndex = 16
        Me.Label2.Text = "ชื่อ -นามสกุล"
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(16, 8)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(88, 23)
        Me.Label1.TabIndex = 15
        Me.Label1.Text = "รหัสนักศึกษา"
        '
        'GroupBox1
        '
        Me.GroupBox1.BackColor = System.Drawing.Color.WhiteSmoke
        Me.GroupBox1.Controls.Add(Me.BCancel)
        Me.GroupBox1.Controls.Add(Me.Bedit)
        Me.GroupBox1.Controls.Add(Me.Bsave)
        Me.GroupBox1.Controls.Add(Me.GroupBox4)
        Me.GroupBox1.Controls.Add(Me.GroupBox3)
        Me.GroupBox1.Controls.Add(Me.GroupBox2)
        Me.GroupBox1.Location = New System.Drawing.Point(16, 72)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(608, 328)
        Me.GroupBox1.TabIndex = 20
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "สถานะภาพ"
        '
        'BCancel
        '
        Me.BCancel.BackColor = System.Drawing.Color.Tan
        Me.BCancel.ForeColor = System.Drawing.SystemColors.Highlight
        Me.BCancel.Location = New System.Drawing.Point(488, 280)
        Me.BCancel.Name = "BCancel"
        Me.BCancel.Size = New System.Drawing.Size(112, 32)
        Me.BCancel.TabIndex = 5
        Me.BCancel.Text = "จบการทำงาน"
        '
        'Bedit
        '
        Me.Bedit.BackColor = System.Drawing.Color.RosyBrown
        Me.Bedit.ForeColor = System.Drawing.SystemColors.Window
        Me.Bedit.Location = New System.Drawing.Point(400, 280)
        Me.Bedit.Name = "Bedit"
        Me.Bedit.Size = New System.Drawing.Size(80, 32)
        Me.Bedit.TabIndex = 4
        Me.Bedit.Text = "แก้ไขข้อมูล"
        '
        'Bsave
        '
        Me.Bsave.BackColor = System.Drawing.Color.BurlyWood
        Me.Bsave.ForeColor = System.Drawing.SystemColors.Info
        Me.Bsave.Location = New System.Drawing.Point(296, 280)
        Me.Bsave.Name = "Bsave"
        Me.Bsave.Size = New System.Drawing.Size(96, 32)
        Me.Bsave.TabIndex = 3
        Me.Bsave.Text = "บันทึกข้อมูล"
        '
        'GroupBox4
        '
        Me.GroupBox4.Controls.Add(Me.TeaName)
        Me.GroupBox4.Controls.Add(Me.Label9)
        Me.GroupBox4.Location = New System.Drawing.Point(16, 200)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(584, 64)
        Me.GroupBox4.TabIndex = 2
        Me.GroupBox4.TabStop = False
        Me.GroupBox4.Text = "อาจารย์ที่ปรึกษา"
        '
        'TeaName
        '
        Me.TeaName.Location = New System.Drawing.Point(96, 24)
        Me.TeaName.Name = "TeaName"
        Me.TeaName.Size = New System.Drawing.Size(352, 24)
        Me.TeaName.TabIndex = 1
        Me.TeaName.Text = ""
        '
        'Label9
        '
        Me.Label9.Location = New System.Drawing.Point(8, 24)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(104, 23)
        Me.Label9.TabIndex = 0
        Me.Label9.Text = "ชื่อ - นามสกุล"
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.Level)
        Me.GroupBox3.Controls.Add(Me.Label8)
        Me.GroupBox3.Controls.Add(Me.Factory)
        Me.GroupBox3.Controls.Add(Me.Depart)
        Me.GroupBox3.Controls.Add(Me.Label7)
        Me.GroupBox3.Controls.Add(Me.Label6)
        Me.GroupBox3.Location = New System.Drawing.Point(280, 24)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(320, 168)
        Me.GroupBox3.TabIndex = 1
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "ข้อมูลคณะวิชา"
        '
        'Level
        '
        Me.Level.Location = New System.Drawing.Point(72, 128)
        Me.Level.Name = "Level"
        Me.Level.Size = New System.Drawing.Size(72, 24)
        Me.Level.TabIndex = 5
        Me.Level.Text = ""
        '
        'Label8
        '
        Me.Label8.Location = New System.Drawing.Point(32, 128)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(48, 23)
        Me.Label8.TabIndex = 4
        Me.Label8.Text = "ชั้นปีที่"
        '
        'Factory
        '
        Me.Factory.Location = New System.Drawing.Point(72, 32)
        Me.Factory.Name = "Factory"
        Me.Factory.Size = New System.Drawing.Size(240, 26)
        Me.Factory.TabIndex = 3
        '
        'Depart
        '
        Me.Depart.Location = New System.Drawing.Point(72, 80)
        Me.Depart.Name = "Depart"
        Me.Depart.Size = New System.Drawing.Size(240, 26)
        Me.Depart.TabIndex = 2
        '
        'Label7
        '
        Me.Label7.Location = New System.Drawing.Point(16, 32)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(56, 23)
        Me.Label7.TabIndex = 1
        Me.Label7.Text = "คณะวิชา"
        '
        'Label6
        '
        Me.Label6.Location = New System.Drawing.Point(16, 80)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(64, 23)
        Me.Label6.TabIndex = 0
        Me.Label6.Text = "ภาควิชา"
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.SecondType)
        Me.GroupBox2.Controls.Add(Me.firstType)
        Me.GroupBox2.Controls.Add(Me.mainType)
        Me.GroupBox2.Controls.Add(Me.Label5)
        Me.GroupBox2.Controls.Add(Me.Label4)
        Me.GroupBox2.Controls.Add(Me.Label3)
        Me.GroupBox2.Location = New System.Drawing.Point(16, 24)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(248, 168)
        Me.GroupBox2.TabIndex = 0
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "ข้อมูลหลักสูตร"
        '
        'SecondType
        '
        Me.SecondType.Location = New System.Drawing.Point(96, 128)
        Me.SecondType.Name = "SecondType"
        Me.SecondType.Size = New System.Drawing.Size(136, 24)
        Me.SecondType.TabIndex = 5
        Me.SecondType.Text = ""
        '
        'firstType
        '
        Me.firstType.Location = New System.Drawing.Point(96, 80)
        Me.firstType.Name = "firstType"
        Me.firstType.Size = New System.Drawing.Size(136, 24)
        Me.firstType.TabIndex = 4
        Me.firstType.Text = ""
        '
        'mainType
        '
        Me.mainType.Location = New System.Drawing.Point(96, 32)
        Me.mainType.Name = "mainType"
        Me.mainType.Size = New System.Drawing.Size(136, 24)
        Me.mainType.TabIndex = 3
        Me.mainType.Text = ""
        '
        'Label5
        '
        Me.Label5.Location = New System.Drawing.Point(24, 80)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(80, 23)
        Me.Label5.TabIndex = 2
        Me.Label5.Text = "สาขาวิชาโท"
        '
        'Label4
        '
        Me.Label4.Location = New System.Drawing.Point(16, 128)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(88, 23)
        Me.Label4.TabIndex = 1
        Me.Label4.Text = " สาขาวิชาเอก"
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(40, 32)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(56, 24)
        Me.Label3.TabIndex = 0
        Me.Label3.Text = "หลักสูตร"
        '
        'STD_STATUS
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.Color.Tan
        Me.ClientSize = New System.Drawing.Size(632, 405)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.ThaiSurname)
        Me.Controls.Add(Me.ThaiName)
        Me.Controls.Add(Me.StdID)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "STD_STATUS"
        Me.Text = " ข้อมูลสถานะภาพนักศึกษา"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox4.ResumeLayout(False)
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox2.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable
    Dim FactSel As String = "1001"

    Dim DepartMent As String = ""
    Dim DepartMent1 As String = ""
    Dim StaNum As String = ""

    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Private Sub STD_STATUS_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Normal
        Cursor.Current = Cursors.WaitCursor
        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        StdID.Text = Student_ID
        StdID.Enabled = False
        ThaiName.Text = thaiNM
        ThaiName.Enabled = False
        ThaiSurname.Text = ThaiSurNM
        ThaiSurname.Enabled = False

        Factorys()
        forDepartment()

        IsFoundId()
        If StatusUser = False Then
            mainType.ReadOnly = True
            Factory.Enabled = False
            firstType.ReadOnly = True
            SecondType.ReadOnly = True
            TeaName.ReadOnly = True
            Level.ReadOnly = True
            Depart.Enabled = False
            Bsave.Visible = False
            Bedit.Visible = False
        End If
    End Sub

    Private Function IsFoundId() As Boolean 'ตรวจสอบการมีIDในฐานข้อมูล
        Dim sql As String = ""
        sql = "Select * From Student where Std_ID = '" + Student_ID + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "StaNum")
        If ds.Tables("StaNum").Rows.Count <> 0 Then
            StaNum = CStr(ds.Tables("StaNum").Rows(0).Item("Sta_NUM"))
            sql = "Select * From Status_ST where Sta_NUM = " + StaNum
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Query1")
            If ds.Tables("Query1").Rows.Count <> 0 Then
                ShowData()
                Bedit.Enabled = True
                Bsave.Enabled = False
            Else
                Bedit.Enabled = False
            End If
        End If
    End Function

    Private Function ShowData() As Boolean
        Dim sql As String = ""

        sql = "Select * From Status_ST where Sta_NUM = " + StaNum
        da.SelectCommand.CommandText = sql
        ds.Tables.Clear()
        da.Fill(ds, "Query1")
        If ds.Tables("Query1").Rows.Count <> 0 Then

            mainType.Text = CStr(ds.Tables("Query1").Rows(0).Item("Sta_STUDY"))
            firstType.Text = CStr(ds.Tables("Query1").Rows(0).Item("Sta_FIRST"))
            SecondType.Text = CStr(ds.Tables("Query1").Rows(0).Item("Sta_SECOND"))
            TeaName.Text = CStr(ds.Tables("Query1").Rows(0).Item("Sta_Name"))
            Level.Text = CStr(ds.Tables("Query1").Rows(0).Item("Sta_YEAR"))

            'Factory.Text = CStr(ds.Tables("Query1").Rows(0).Item("Adr_CITY"))
            DepartMent1 = CStr(ds.Tables("Query1").Rows(0).Item("Sta_DIV"))
            FormatDepartment()

        End If

    End Function

    Private Sub Factory_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Factory.SelectedIndexChanged
        Dim sql As String = ""
        sql = "Select * from Factory where NAME = '" + Factory.Text + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Fact")
        If ds.Tables("Fact").Rows.Count <> 0 Then
            FactSel = CStr(ds.Tables("Fact").Rows(0).Item("Sta_FACT"))
        End If

        forDepartment()
    End Sub
    Private Sub forDepartment()
        Dim sql As String = ""
        sql = "Select * from Department where Sta_FACT = " + FactSel
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Depart")
        If ds.Tables("Depart").Rows.Count <> 0 Then
            With Depart
                .DataSource = ds.Tables("Depart")
                .DisplayMember = "NAME"
                .ValueMember = "Sta_DIV"
            End With
        End If
    End Sub

    Private Sub BCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BCancel.Click
        Me.Close()
    End Sub
    Private Sub Factorys()
        Dim sql As String = ""
        sql = "Select * from Factory"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Factory")
        If ds.Tables("Factory").Rows.Count <> 0 Then
            With Factory
                .DataSource = ds.Tables("Factory")
                .DisplayMember = "NAME"
                .ValueMember = "Sta_FACT"
            End With
        End If
    End Sub

    Private Sub Bsave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Bsave.Click
        Dim sql As String = ""
        sql = "Select Sta_NUM From Student Where Std_ID = '" + Student_ID + "'"
        da = New SqlDataAdapter(sql, Conn)
        da.Fill(ds, "StID")
        Sta_NUM = CStr(ds.Tables("StID").Rows(0).Item("Sta_NUM"))
        If MessageBox.Show("ต้องการเพิ่มข้อมูลสถานะ", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
            RegisterSTD = True
            sql = "insert into Status_ST(Sta_NUM,Sta_YEAR,Sta_DIV,Sta_STUDY,Sta_FIRST,Sta_SECOND,Sta_Name)values("
            sql = sql + Sta_NUM + ",'"
            sql = sql + Level.Text + "',"
            GetId()
            sql = sql + DepartMent + ",'"
            sql = sql + mainType.Text + "','"
            sql = sql + firstType.Text + "','"
            sql = sql + SecondType.Text + "','"
            sql = sql + TeaName.Text + "')"

            da = New SqlDataAdapter(sql, Conn)
            ds.Tables.Clear()
            da.Fill(ds, "insert")
            MsgBox("แก้ไขข้อมูลเรียบร้อย", MsgBoxStyle.Information)
            Me.Close()
        End If
    End Sub
    Private Function checkItem() As Boolean
        If Level.Text = "" Then
            MsgBox("กรุณากรอกข้อมูลชั้นปี!")
        End If
    End Function

    Private Function genIdName() As Integer
        Dim sql As String = ""
        sql = "select * from Status_ST"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "gen")
        If ds.Tables("gen").Rows.Count <> 0 Then
            sql = "select max(Sta_NUM) as MAXExp from Status_ST"
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
    Private Sub GetId()
        Dim sql As String = ""
        sql = "Select Sta_DIV from Department where NAME ='" + Depart.Text + "'"
        da.SelectCommand.CommandText = sql
        ds.Tables.Clear()
        da.Fill(ds, "Dep")
        If ds.Tables("Dep").Rows.Count <> 0 Then
            DepartMent = CStr(ds.Tables("Dep").Rows(0).Item("Sta_DIV"))
        End If
    End Sub
    Private Sub FormatDepartment()
        Dim sql As String = ""
        sql = "Select a.Name as name1,b.Name as name2 "
        sql = sql + " From Department a,Factory b "
        sql = sql + " where a.Sta_FACT = b.Sta_FACT and a.Sta_DIV = " + DepartMent1

        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Depart")
        If ds.Tables("Depart").Rows.Count <> 0 Then
            Depart.Text = CStr(ds.Tables("Depart").Rows(0).Item("name1"))
            Factory.Text = CStr(ds.Tables("Depart").Rows(0).Item("name2"))
        End If
    End Sub

    Private Sub Bedit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Bedit.Click
        Dim sql As String = ""
        sql = "Select Sta_NUM From Student Where Std_ID = '" + Student_ID + "'"
        da = New SqlDataAdapter(sql, Conn)
        da.Fill(ds, "StID")
        Sta_NUM = CStr(ds.Tables("StID").Rows(0).Item("Sta_NUM"))
        If MessageBox.Show("ต้องการแก้ไขข้อมูลสภานะ", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then

            sql = "Update Status_ST Set Sta_YEAR ='" + Level.Text + "',"
            sql = sql + "Sta_FIRST = '" + firstType.Text + "',"
            sql = sql + "Sta_SECOND = '" + SecondType.Text + "',"
            sql = sql + "Sta_STUDY = '" + mainType.Text + "',"
            sql = sql + "Sta_Name = '" + TeaName.Text + "',"
            GetId()
            sql = sql + "Sta_DIV = " + DepartMent
            sql = sql + " Where Sta_NUM = " + Sta_NUM

            da = New SqlDataAdapter(sql, Conn)
            ds.Tables.Clear()
            da.Fill(ds, "Edit")
            MsgBox("แก้ไขข้อมูลเรียบร้อย", MsgBoxStyle.Information)
            Me.Close()
        End If
    End Sub

End Class
