Option Explicit On 
Option Strict On
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Public Class Subject_LINKED
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
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents Subj_ID As System.Windows.Forms.TextBox
    Friend WithEvents Thainame As System.Windows.Forms.TextBox
    Friend WithEvents Engname As System.Windows.Forms.TextBox
    Friend WithEvents TDetail As System.Windows.Forms.TextBox
    Friend WithEvents EDetail As System.Windows.Forms.TextBox
    Friend WithEvents Credit As System.Windows.Forms.TextBox
    Friend WithEvents CboTypeSubj As System.Windows.Forms.ComboBox
    Friend WithEvents Department As System.Windows.Forms.ComboBox
    Friend WithEvents Limited As System.Windows.Forms.TextBox
    Friend WithEvents BEdit As System.Windows.Forms.Button
    Friend WithEvents BCancel As System.Windows.Forms.Button
    Friend WithEvents BSave As System.Windows.Forms.Button
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Friend WithEvents Factory As System.Windows.Forms.ComboBox
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.Label7 = New System.Windows.Forms.Label
        Me.Label8 = New System.Windows.Forms.Label
        Me.Label9 = New System.Windows.Forms.Label
        Me.Subj_ID = New System.Windows.Forms.TextBox
        Me.Thainame = New System.Windows.Forms.TextBox
        Me.Engname = New System.Windows.Forms.TextBox
        Me.TDetail = New System.Windows.Forms.TextBox
        Me.EDetail = New System.Windows.Forms.TextBox
        Me.Credit = New System.Windows.Forms.TextBox
        Me.CboTypeSubj = New System.Windows.Forms.ComboBox
        Me.Department = New System.Windows.Forms.ComboBox
        Me.Limited = New System.Windows.Forms.TextBox
        Me.BEdit = New System.Windows.Forms.Button
        Me.BCancel = New System.Windows.Forms.Button
        Me.BSave = New System.Windows.Forms.Button
        Me.Label10 = New System.Windows.Forms.Label
        Me.Factory = New System.Windows.Forms.ComboBox
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label1.Location = New System.Drawing.Point(104, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(56, 23)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "รหัสวิชา"
        '
        'Label2
        '
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(72, 48)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(88, 23)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "ชื่อวิชา (ไทย)"
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(56, 80)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(104, 23)
        Me.Label3.TabIndex = 2
        Me.Label3.Text = "ชื่อวิชา (อังกฤษ)"
        '
        'Label4
        '
        Me.Label4.Location = New System.Drawing.Point(48, 112)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(112, 23)
        Me.Label4.TabIndex = 3
        Me.Label4.Text = "รายละเอียด (ไทย)"
        '
        'Label5
        '
        Me.Label5.Location = New System.Drawing.Point(32, 168)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(128, 23)
        Me.Label5.TabIndex = 4
        Me.Label5.Text = "รายละเอียด (อังกฤษ)"
        '
        'Label6
        '
        Me.Label6.Location = New System.Drawing.Point(64, 224)
        Me.Label6.Name = "Label6"
        Me.Label6.TabIndex = 5
        Me.Label6.Text = "ประเภทรายวิชา"
        '
        'Label7
        '
        Me.Label7.Location = New System.Drawing.Point(96, 288)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(64, 23)
        Me.Label7.TabIndex = 6
        Me.Label7.Text = "ภาควิชาฯ"
        '
        'Label8
        '
        Me.Label8.Location = New System.Drawing.Point(304, 16)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(64, 23)
        Me.Label8.TabIndex = 7
        Me.Label8.Text = "หน่วยกิต"
        '
        'Label9
        '
        Me.Label9.Location = New System.Drawing.Point(56, 320)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(104, 24)
        Me.Label9.TabIndex = 8
        Me.Label9.Text = "จำนวน นศ. ที่รับ"
        '
        'Subj_ID
        '
        Me.Subj_ID.Location = New System.Drawing.Point(160, 16)
        Me.Subj_ID.Name = "Subj_ID"
        Me.Subj_ID.Size = New System.Drawing.Size(136, 24)
        Me.Subj_ID.TabIndex = 9
        Me.Subj_ID.Text = ""
        '
        'Thainame
        '
        Me.Thainame.Location = New System.Drawing.Point(160, 48)
        Me.Thainame.Name = "Thainame"
        Me.Thainame.Size = New System.Drawing.Size(256, 24)
        Me.Thainame.TabIndex = 10
        Me.Thainame.Text = ""
        '
        'Engname
        '
        Me.Engname.Location = New System.Drawing.Point(160, 80)
        Me.Engname.Name = "Engname"
        Me.Engname.Size = New System.Drawing.Size(256, 24)
        Me.Engname.TabIndex = 11
        Me.Engname.Text = ""
        '
        'TDetail
        '
        Me.TDetail.Location = New System.Drawing.Point(160, 112)
        Me.TDetail.Multiline = True
        Me.TDetail.Name = "TDetail"
        Me.TDetail.Size = New System.Drawing.Size(256, 48)
        Me.TDetail.TabIndex = 12
        Me.TDetail.Text = ""
        '
        'EDetail
        '
        Me.EDetail.Location = New System.Drawing.Point(160, 168)
        Me.EDetail.Multiline = True
        Me.EDetail.Name = "EDetail"
        Me.EDetail.Size = New System.Drawing.Size(256, 48)
        Me.EDetail.TabIndex = 13
        Me.EDetail.Text = ""
        '
        'Credit
        '
        Me.Credit.Location = New System.Drawing.Point(360, 16)
        Me.Credit.Name = "Credit"
        Me.Credit.Size = New System.Drawing.Size(56, 24)
        Me.Credit.TabIndex = 14
        Me.Credit.Text = ""
        '
        'CboTypeSubj
        '
        Me.CboTypeSubj.Location = New System.Drawing.Point(160, 224)
        Me.CboTypeSubj.Name = "CboTypeSubj"
        Me.CboTypeSubj.Size = New System.Drawing.Size(208, 26)
        Me.CboTypeSubj.TabIndex = 15
        '
        'Department
        '
        Me.Department.Location = New System.Drawing.Point(160, 288)
        Me.Department.Name = "Department"
        Me.Department.Size = New System.Drawing.Size(208, 26)
        Me.Department.TabIndex = 16
        '
        'Limited
        '
        Me.Limited.Location = New System.Drawing.Point(160, 320)
        Me.Limited.Name = "Limited"
        Me.Limited.TabIndex = 17
        Me.Limited.Text = ""
        '
        'BEdit
        '
        Me.BEdit.BackColor = System.Drawing.Color.Silver
        Me.BEdit.Location = New System.Drawing.Point(432, 256)
        Me.BEdit.Name = "BEdit"
        Me.BEdit.Size = New System.Drawing.Size(104, 40)
        Me.BEdit.TabIndex = 18
        Me.BEdit.Text = "แก้ไขข้อมูล"
        '
        'BCancel
        '
        Me.BCancel.BackColor = System.Drawing.Color.RosyBrown
        Me.BCancel.Location = New System.Drawing.Point(432, 304)
        Me.BCancel.Name = "BCancel"
        Me.BCancel.Size = New System.Drawing.Size(104, 40)
        Me.BCancel.TabIndex = 19
        Me.BCancel.Text = "จบการทำงาน"
        '
        'BSave
        '
        Me.BSave.BackColor = System.Drawing.Color.LightSlateGray
        Me.BSave.ForeColor = System.Drawing.Color.Yellow
        Me.BSave.Location = New System.Drawing.Point(432, 208)
        Me.BSave.Name = "BSave"
        Me.BSave.Size = New System.Drawing.Size(104, 40)
        Me.BSave.TabIndex = 20
        Me.BSave.Text = "บันทึกข้อมูล"
        '
        'Label10
        '
        Me.Label10.Location = New System.Drawing.Point(104, 256)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(56, 23)
        Me.Label10.TabIndex = 21
        Me.Label10.Text = "คณะวิชา"
        '
        'Factory
        '
        Me.Factory.Location = New System.Drawing.Point(160, 256)
        Me.Factory.Name = "Factory"
        Me.Factory.Size = New System.Drawing.Size(208, 26)
        Me.Factory.TabIndex = 22
        '
        'Subject_LINKED
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.Color.WhiteSmoke
        Me.ClientSize = New System.Drawing.Size(544, 357)
        Me.Controls.Add(Me.Factory)
        Me.Controls.Add(Me.Label10)
        Me.Controls.Add(Me.BSave)
        Me.Controls.Add(Me.BCancel)
        Me.Controls.Add(Me.BEdit)
        Me.Controls.Add(Me.Limited)
        Me.Controls.Add(Me.Department)
        Me.Controls.Add(Me.CboTypeSubj)
        Me.Controls.Add(Me.Credit)
        Me.Controls.Add(Me.EDetail)
        Me.Controls.Add(Me.TDetail)
        Me.Controls.Add(Me.Engname)
        Me.Controls.Add(Me.Thainame)
        Me.Controls.Add(Me.Subj_ID)
        Me.Controls.Add(Me.Label9)
        Me.Controls.Add(Me.Label8)
        Me.Controls.Add(Me.Label7)
        Me.Controls.Add(Me.Label6)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "Subject_LINKED"
        Me.Text = "ข้อมูลรายละเอียด ของแต่ละวิชา"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Dim FactSel As String = "1001"

    Dim SubType As String = ""
    Dim Depart As String = ""
    Dim Fact As String = ""
    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Private Sub Subject_LINKED_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Me.WindowState = FormWindowState.Normal
        Cursor.Current = Cursors.WaitCursor

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With
        Factorys()
        forDepartment()
        forTypeSubject()
        BEdit.Enabled = False
        If data_ID <> "" Then
            Subj_ID.Text = data_ID
            Subj_ID.Enabled = False
        End If
    End Sub

    Private Sub BCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BCancel.Click
        Me.Close()
    End Sub

    Private Sub Subj_ID_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Subj_ID.TextChanged
        If Subj_ID.Text <> "" Then
            Dim sql As String = ""
            sql = "Select * from Subject a,Department b,Type_SUBJ c,Factory d where a.Sta_DIV = b.Sta_DIV And a.subj_TYPE = c.Subj_TYPE And b.Sta_FACT = d.Sta_FACT And Subj_ID = '" + Subj_ID.Text + "'"
            'sql = "Select * from Subject a,Department b,Type_SUBJ c where a.Sta_DIV = b.Sta_DIV and a.subj_TYPE = c.Subj_TYPE and Subj_ID = " + Subj_ID.Text
            da = New SqlDataAdapter(sql, Conn)
            ds.Tables.Clear()
            da.Fill(ds, "DataSelect")

            If ds.Tables("DataSelect").Rows.Count <> 0 Then
                Thainame.Text = CStr(ds.Tables("DataSelect").Rows(0).Item("Subj_NM"))
                Engname.Text = CStr(ds.Tables("DataSelect").Rows(0).Item("Subj_ENM"))
                Credit.Text = CStr(ds.Tables("DataSelect").Rows(0).Item("Subj_CRETDIT"))
                TDetail.Text = CStr(ds.Tables("DataSelect").Rows(0).Item("Subj_Detail"))
                EDetail.Text = CStr(ds.Tables("DataSelect").Rows(0).Item("Subj_Edetail"))
                Limited.Text = CStr(ds.Tables("DataSelect").Rows(0).Item("Subj_LIMIT"))

                CboTypeSubj.SelectedIndex = CboTypeSubj.FindString(CStr(ds.Tables("DataSelect").Rows(0).Item("Type_NM")))
                Dim data1 As String = CStr(ds.Tables("DataSelect").Rows(0).Item("Sta_FACT"))
                Dim data2 As String = CStr(ds.Tables("DataSelect").Rows(0).Item("Sta_DIV"))
                
                SetFact(data1)
                SetDepart(data2)

                BEdit.Enabled = True
                BSave.Enabled = False
            Else
                Thainame.Clear()
                Engname.Clear()
                Credit.Clear()
                TDetail.Clear()
                EDetail.Clear()
                Limited.Clear()
                BEdit.Enabled = False
                BSave.Enabled = True
            End If
        Else
            Thainame.Clear()
            Engname.Clear()
            Credit.Clear()
            TDetail.Clear()
            EDetail.Clear()
            Limited.Clear()
            BEdit.Enabled = False
            BSave.Enabled = True
        End If
    End Sub
    Private Sub SetFact(ByVal data As String)
        Dim sql As String = ""
        sql = "Select * from Factory where Sta_FACT = " + data
        da = New SqlDataAdapter(sql, Conn)
        'ds.Tables.Clear()
        da.Fill(ds, "Facts")
        If ds.Tables("Facts").Rows.Count <> 0 Then
            Dim temp As String = CStr(ds.Tables("Facts").Rows(0).Item("NAME"))
            FactSel = CStr(ds.Tables("Facts").Rows(0).Item("Sta_FACT"))
            Factory.SelectedIndex = Factory.FindString(temp)
        End If
    End Sub
    Private Sub SetDepart(ByVal data As String)
        Dim sql As String = ""
        sql = "Select * from Department where Sta_DIV = " + data
        da.SelectCommand.CommandText = sql
        'ds.Tables.Clear()
        da.Fill(ds, "Dept")
        If ds.Tables("Dept").Rows.Count <> 0 Then
            Dim temp As String = CStr(ds.Tables("Dept").Rows(0).Item("NAME"))
            Department.SelectedIndex = Department.FindString(temp)
        End If
    End Sub
    Private Sub forDepartment()
        Dim sql As String = ""
        sql = "Select * from Department where Sta_FACT = " + FactSel
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Depart")
        If ds.Tables("Depart").Rows.Count <> 0 Then
            With Department
                .DataSource = ds.Tables("Depart")
                .DisplayMember = "NAME"
                .ValueMember = "Sta_DIV"
            End With
        End If
    End Sub

    Private Sub forTypeSubject()
        Dim sql As String = ""
        sql = "Select * from Type_SUBJ"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "TypeSub")
        If ds.Tables("TypeSub").Rows.Count <> 0 Then
            With CboTypeSubj
                .DataSource = ds.Tables("TypeSub")
                .DisplayMember = "Type_NM"
                .ValueMember = "Subj_TYPE"
            End With
        End If
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

    Private Sub BSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BSave.Click
        Dim sql As String = ""
        If MessageBox.Show("ต้องการเพิ่มรายวิชา รหัส  " + Subj_ID.Text + " ลงในฐานข้อมูล", "คำยืนยัน", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) = DialogResult.OK Then
            If Subj_ID.Text <> "" And Credit.Text <> "" And Thainame.Text <> "" And Engname.Text <> "" Then
                sql = "Insert into Subject(Subj_ID,Subj_NM,subj_ENM,Subj_DETAIL,subj_EDETAIL,Subj_TYPE,Subj_CRETDIT,Sta_DIV,Subj_LIMIT)"
                sql = sql + " Values('" + Subj_ID.Text + "','" + Thainame.Text + "','" + Engname.Text + "','" + TDetail.Text + "','"
                sql = sql + EDetail.Text + "','"
                GetId()
                sql = sql + SubType + "'," + Credit.Text + "," + Depart + ","
                If Limited.Text <> "" Then
                    sql = sql + Limited.Text + ")"
                Else
                    sql = sql + "0)"
                End If

                da.SelectCommand.CommandText = sql
                ds.Tables.Clear()
                da.Fill(ds, "insert")
                BEdit.Enabled = False
                BSave.Enabled = True
                Me.Close()
            Else
                MessageBox.Show("กรุณากรอกข้อมูลให้ครบ!", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            End If
        End If

    End Sub
    Private Sub GetId()
        Dim sql As String = ""
        sql = "Select Sta_DIV from Department where NAME ='" + Department.Text + "'"
        da.SelectCommand.CommandText = sql
        ds.Tables.Clear()
        da.Fill(ds, "Dep")
        If ds.Tables("Dep").Rows.Count <> 0 Then
            Depart = CStr(ds.Tables("Dep").Rows(0).Item("Sta_DIV"))
        End If
        sql = "Select Subj_TYPE from Type_SUBJ where Type_NM ='" + CboTypeSubj.Text + "'"
        da.SelectCommand.CommandText = sql
        ds.Tables.Clear()
        da.Fill(ds, "Dep")
        If ds.Tables("Dep").Rows.Count <> 0 Then
            SubType = CStr(ds.Tables("Dep").Rows(0).Item("Subj_TYPE"))
        End If
    End Sub
    Private Sub Clear()
        Subj_ID.Clear()
        Credit.Clear()
        Thainame.Clear()
        Engname.Clear()
        TDetail.Clear()
        EDetail.Clear()
        Limited.Clear()
    End Sub

    Private Sub BEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BEdit.Click
        Dim sql As String = ""
        If MessageBox.Show("ต้องการแก้ไขรายวิชา รหัส  " + Subj_ID.Text + " ในฐานข้อมูล", "คำยืนยัน", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) = DialogResult.OK Then
            If Subj_ID.Text <> "" And Credit.Text <> "" And Thainame.Text <> "" And Engname.Text <> "" Then
                sql = "Update Subject Set Subj_NM = '" + Thainame.Text + "',subj_ENM = '" + Engname.Text + "',"
                sql = sql + "Subj_DETAIL = '" + TDetail.Text + "',subj_EDETAIL = '" + EDetail.Text + " ',"
                GetId()
                sql = sql + "Subj_TYPE = '" + SubType + "' ,Subj_CRETDIT = " + Credit.Text + ",Sta_DIV = " + Depart + ","
                sql = sql + "Subj_LIMIT = " + Limited.Text + " where Subj_ID = '" + Subj_ID.Text + "'"

                da.SelectCommand.CommandText = sql
                ds.Tables.Clear()
                da.Fill(ds, "insert")
                BEdit.Enabled = True
                BSave.Enabled = False
                MsgBox("ได้ทำการเปลี่ยนแปลงแล้ว")
                Me.Close()
            Else
                MessageBox.Show("กรุณากรอกข้อมูลให้ครบ!", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            End If
        End If
    End Sub
End Class
