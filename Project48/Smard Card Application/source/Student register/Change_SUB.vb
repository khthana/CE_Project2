'Option Explicit On 
'Option Strict On
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Imports System.Text
Public Class Change_SUB
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
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents StdID As System.Windows.Forms.TextBox
    Friend WithEvents ThaiName As System.Windows.Forms.TextBox
    Friend WithEvents ThaiSurname As System.Windows.Forms.TextBox
    Friend WithEvents GPA As System.Windows.Forms.TextBox
    Friend WithEvents CreditAll As System.Windows.Forms.TextBox
    Friend WithEvents GridReg As System.Windows.Forms.DataGrid
    Friend WithEvents BSave As System.Windows.Forms.Button
    Friend WithEvents BDelete As System.Windows.Forms.Button
    Friend WithEvents BEdit As System.Windows.Forms.Button
    Friend WithEvents BCancel As System.Windows.Forms.Button
    Friend WithEvents Depart As System.Windows.Forms.Label
    Friend WithEvents Factory As System.Windows.Forms.Label
    Friend WithEvents StatusChang As System.Windows.Forms.Label
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.StdID = New System.Windows.Forms.TextBox
        Me.ThaiName = New System.Windows.Forms.TextBox
        Me.ThaiSurname = New System.Windows.Forms.TextBox
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.GPA = New System.Windows.Forms.TextBox
        Me.Label6 = New System.Windows.Forms.Label
        Me.CreditAll = New System.Windows.Forms.TextBox
        Me.Label5 = New System.Windows.Forms.Label
        Me.GridReg = New System.Windows.Forms.DataGrid
        Me.BSave = New System.Windows.Forms.Button
        Me.BDelete = New System.Windows.Forms.Button
        Me.BEdit = New System.Windows.Forms.Button
        Me.BCancel = New System.Windows.Forms.Button
        Me.Depart = New System.Windows.Forms.Label
        Me.Factory = New System.Windows.Forms.Label
        Me.StatusChang = New System.Windows.Forms.Label
        Me.GroupBox1.SuspendLayout()
        CType(Me.GridReg, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label1.Location = New System.Drawing.Point(16, 40)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(88, 23)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "ชื่อ - นามสกุล"
        '
        'Label2
        '
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(24, 8)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(88, 23)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "รหัสนักศึกษา"
        '
        'StdID
        '
        Me.StdID.Location = New System.Drawing.Point(104, 8)
        Me.StdID.Name = "StdID"
        Me.StdID.ReadOnly = True
        Me.StdID.Size = New System.Drawing.Size(160, 24)
        Me.StdID.TabIndex = 4
        Me.StdID.Text = ""
        '
        'ThaiName
        '
        Me.ThaiName.Location = New System.Drawing.Point(104, 40)
        Me.ThaiName.Name = "ThaiName"
        Me.ThaiName.Size = New System.Drawing.Size(160, 24)
        Me.ThaiName.TabIndex = 5
        Me.ThaiName.Text = ""
        '
        'ThaiSurname
        '
        Me.ThaiSurname.Location = New System.Drawing.Point(272, 40)
        Me.ThaiSurname.Name = "ThaiSurname"
        Me.ThaiSurname.Size = New System.Drawing.Size(168, 24)
        Me.ThaiSurname.TabIndex = 6
        Me.ThaiSurname.Text = ""
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.StatusChang)
        Me.GroupBox1.Controls.Add(Me.GPA)
        Me.GroupBox1.Controls.Add(Me.Label6)
        Me.GroupBox1.Controls.Add(Me.CreditAll)
        Me.GroupBox1.Controls.Add(Me.Label5)
        Me.GroupBox1.Controls.Add(Me.GridReg)
        Me.GroupBox1.Location = New System.Drawing.Point(16, 96)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(568, 256)
        Me.GroupBox1.TabIndex = 7
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "ข้อมูลที่ลงทะเบียน"
        '
        'GPA
        '
        Me.GPA.Location = New System.Drawing.Point(312, 224)
        Me.GPA.Name = "GPA"
        Me.GPA.Size = New System.Drawing.Size(72, 24)
        Me.GPA.TabIndex = 4
        Me.GPA.Text = ""
        '
        'Label6
        '
        Me.Label6.Location = New System.Drawing.Point(272, 224)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(40, 23)
        Me.Label6.TabIndex = 3
        Me.Label6.Text = "GPA"
        '
        'CreditAll
        '
        Me.CreditAll.Location = New System.Drawing.Point(488, 224)
        Me.CreditAll.Name = "CreditAll"
        Me.CreditAll.Size = New System.Drawing.Size(72, 24)
        Me.CreditAll.TabIndex = 2
        Me.CreditAll.Text = ""
        '
        'Label5
        '
        Me.Label5.Location = New System.Drawing.Point(392, 224)
        Me.Label5.Name = "Label5"
        Me.Label5.TabIndex = 1
        Me.Label5.Text = "หน่วยกิตทั้งหมด"
        '
        'GridReg
        '
        Me.GridReg.DataMember = ""
        Me.GridReg.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.GridReg.Location = New System.Drawing.Point(8, 24)
        Me.GridReg.Name = "GridReg"
        Me.GridReg.Size = New System.Drawing.Size(552, 192)
        Me.GridReg.TabIndex = 0
        '
        'BSave
        '
        Me.BSave.BackColor = System.Drawing.Color.FromArgb(CType(255, Byte), CType(224, Byte), CType(192, Byte))
        Me.BSave.Location = New System.Drawing.Point(592, 104)
        Me.BSave.Name = "BSave"
        Me.BSave.Size = New System.Drawing.Size(112, 48)
        Me.BSave.TabIndex = 8
        Me.BSave.Text = "เพิ่มรายวิชา"
        '
        'BDelete
        '
        Me.BDelete.BackColor = System.Drawing.Color.FromArgb(CType(255, Byte), CType(255, Byte), CType(192, Byte))
        Me.BDelete.Location = New System.Drawing.Point(592, 160)
        Me.BDelete.Name = "BDelete"
        Me.BDelete.Size = New System.Drawing.Size(112, 48)
        Me.BDelete.TabIndex = 9
        Me.BDelete.Text = "ถอนรายวิชา"
        '
        'BEdit
        '
        Me.BEdit.BackColor = System.Drawing.Color.FromArgb(CType(255, Byte), CType(192, Byte), CType(128, Byte))
        Me.BEdit.Location = New System.Drawing.Point(592, 216)
        Me.BEdit.Name = "BEdit"
        Me.BEdit.Size = New System.Drawing.Size(112, 48)
        Me.BEdit.TabIndex = 10
        Me.BEdit.Text = "เปลี่ยนรายวิชา"
        '
        'BCancel
        '
        Me.BCancel.BackColor = System.Drawing.Color.FromArgb(CType(192, Byte), CType(255, Byte), CType(192, Byte))
        Me.BCancel.Location = New System.Drawing.Point(592, 304)
        Me.BCancel.Name = "BCancel"
        Me.BCancel.Size = New System.Drawing.Size(112, 48)
        Me.BCancel.TabIndex = 11
        Me.BCancel.Text = "จบการทำงาน"
        '
        'Depart
        '
        Me.Depart.Location = New System.Drawing.Point(24, 72)
        Me.Depart.Name = "Depart"
        Me.Depart.Size = New System.Drawing.Size(240, 23)
        Me.Depart.TabIndex = 12
        '
        'Factory
        '
        Me.Factory.Location = New System.Drawing.Point(264, 72)
        Me.Factory.Name = "Factory"
        Me.Factory.Size = New System.Drawing.Size(280, 23)
        Me.Factory.TabIndex = 13
        '
        'StatusChang
        '
        Me.StatusChang.Location = New System.Drawing.Point(8, 224)
        Me.StatusChang.Name = "StatusChang"
        Me.StatusChang.Size = New System.Drawing.Size(256, 23)
        Me.StatusChang.TabIndex = 5
        '
        'Change_SUB
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.Color.AntiqueWhite
        Me.ClientSize = New System.Drawing.Size(712, 365)
        Me.Controls.Add(Me.Factory)
        Me.Controls.Add(Me.Depart)
        Me.Controls.Add(Me.BCancel)
        Me.Controls.Add(Me.BEdit)
        Me.Controls.Add(Me.BDelete)
        Me.Controls.Add(Me.BSave)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.ThaiSurname)
        Me.Controls.Add(Me.ThaiName)
        Me.Controls.Add(Me.StdID)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "Change_SUB"
        Me.Text = "ข้อมูลลงทะเบียน"
        Me.GroupBox1.ResumeLayout(False)
        CType(Me.GridReg, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Dim MaxYear, MaxTerm As Integer

    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Private Sub BCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BCancel.Click
        '////////////////////////////////
        Dim sql As String = "Select * from tempSubject"
        Dim frmDynamicPrint As New frmPrintDynamicForm

        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Query")
        If ds.Tables("Query").Rows.Count <> 0 Then

            frmDynamicPrint.SqlSet = sql
            frmDynamicPrint.Stateprinting = False
            frmDynamicPrint.DateString = Now.ToString
            frmDynamicPrint.InitPrint()
            frmDynamicPrint.PrintPreview()
            frmDynamicPrint.Dispose()

            '////////////////////////////////
            sql = "Delete from tempSubject"
            da = New SqlDataAdapter(sql, Conn)
            ds.Tables.Clear()
            da.Fill(ds, "deleteAll")

        End If

        MoneyChangSubject = 0.0
        Me.Close()
    End Sub

    Private Sub Change_SUB_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Normal
        Cursor.Current = Cursors.WaitCursor

        MoneyChangSubject = 0.0

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        Depart.Text = GlDepart
        Factory.Text = GlFactory
        StdID.Text = Student_ID
        StdID.Enabled = False
        ThaiName.Text = thaiNM
        ThaiName.Enabled = False
        ThaiSurname.Text = ThaiSurNM
        ThaiSurname.Enabled = False
        CreditAll.Enabled = False
        BDelete.Enabled = False
        FormatDataGrid()
        CalculateAllGrade() 'คำนวนเกรดทั้งหมด GPA
        AllCreditTerm()
        ShowStatusTerm()
    End Sub
    Private Sub ShowStatusTerm()
        Dim sql As String = "SELECT MAX(Reg_YEAR) AS Myear FROM Registry"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Query")
        If ds.Tables("Query").Rows.Count <> 0 Then
            Dim Myear As String
            Myear = CStr(ds.Tables("Query").Rows(0).Item("Myear"))
            sql = "SELECT MAX(Reg_TERM) AS Mterm FROM Registry where Reg_YEAR = " + Myear
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Query")
            Dim Mterm As String
            Mterm = CStr(ds.Tables("Query").Rows(0).Item("Mterm"))
            StatusChang.Text = "ภาคการศึกษาที่ " + Mterm + " ปีการศึกษา " + Myear
        End If
    End Sub
    Private Sub FormatDataGrid()
        '###############
        Dim sql As String = ""

        sql = "Select * from Registry where Std_ID = '" + Student_ID + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Count")
        If ds.Tables("Count").Rows.Count = 0 Then
            MessageBox.Show("รหัส   " + Student_ID + "  ยังไม่มีข้อมูลลงทะเบียน ", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            Exit Sub
        End If

        Dim MaxYear, MaxTerm As Integer
        sql = "Select MAX(Reg_YEAR)as MaxYear from Registry where Std_ID = '" + Student_ID + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "MAX")
        If ds.Tables("MAX").Rows.Count <> 0 Then
            MaxYear = CInt(ds.Tables("MAX").Rows(0).Item("MaxYear"))
            sql = "Select MAX(Reg_TERM)as MaxTerm from Registry where Std_ID = '" + Student_ID + "' and Reg_YEAR = '" + CStr(MaxYear) + "'"
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "MAX")
            If ds.Tables("MAX").Rows.Count <> 0 Then
                MaxTerm = CInt(ds.Tables("MAX").Rows(0).Item("MaxTerm"))

                sql = "SELECT sum(b.Subj_CRETDIT) as AllSum "
                sql = sql + "FROM Registry a,Subject b "
                sql = sql + "where 	a.Subj_ID = b.Subj_ID and a.Std_ID = '"
                sql = sql + Student_ID + "' and a.Reg_YEAR = '"
                sql = sql + CStr(MaxYear) + "' and a.Reg_TERM = '"
                sql = sql + CStr(MaxTerm) + "' "
                da.SelectCommand.CommandText = sql
                ds.Tables.Clear()
                da.Fill(ds, "Sum")
                If ds.Tables("Sum").Rows.Count <> 0 Then
                    CreditAll.Text = CStr(ds.Tables("Sum").Rows(0).Item("AllSum"))
                    CreditAll.Enabled = False
                End If
            End If
        Else
            MsgBox("No Record Field")
        End If
        '###############
        sql = "SELECT     a.Subj_ID, a.Reg_SEC, b.subj_ENM, b.Subj_CRETDIT "
        sql = sql + "From Registry a,Subject b "
        sql = sql + " where a.Subj_ID = b.Subj_ID and a.Std_ID = '"
        sql = sql + Student_ID + "' and a.Reg_YEAR = '" + CStr(MaxYear) + "' and a.Reg_TERM = '"
        sql = sql + CStr(MaxTerm) + "'"

        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "DataSelect")
        If ds.Tables("DataSelect").Rows.Count = 0 Then
            'MsgBox(" ไม่มีข้อมูล  No Record 0 Rows!")
        End If

        With GridReg
            .AllowNavigation = False
            .BackgroundColor = Color.White
            .ReadOnly = True
            .DataSource = ds.Tables("DataSelect")
        End With

        Dim GrdTs As DataGridTableStyle = New DataGridTableStyle
        With GrdTs
            .AlternatingBackColor = Color.LemonChiffon
            .BackColor = Color.White
            .MappingName = "DataSelect"
        End With

        Dim cs As New DataGridTextBoxColumn
        With cs
            .HeaderText = "รหัสวิชา"
            .MappingName = "Subj_ID"
            .ReadOnly = True
            .Width = 100
        End With
        GrdTs.GridColumnStyles.Add(cs)

        Dim cs1 As New DataGridTextBoxColumn
        With cs1
            .HeaderText = "ชื่อวิชา"
            .MappingName = "subj_ENM"
            .ReadOnly = True
            .Width = 300
        End With
        GrdTs.GridColumnStyles.Add(cs1)

        Dim cs2 As New DataGridTextBoxColumn
        With cs2
            .HeaderText = "Sec"
            .MappingName = "Reg_SEC"
            .ReadOnly = True
            .Width = 50
        End With
        GrdTs.GridColumnStyles.Add(cs2)

        Dim cs3 As New DataGridTextBoxColumn
        With cs3
            .HeaderText = "หน่วยกิต"
            .MappingName = "Subj_CRETDIT"
            .ReadOnly = True
            .Width = 60
        End With
        GrdTs.GridColumnStyles.Add(cs3)

        With GridReg
            .TableStyles.Clear()
            '.CaptionFont = New Font("MS Sans Serif", 10.0, FontStyle.Regular)
            .CaptionText = "ตารางรายวิชาที่ ลงทะเบียน"
            .FlatMode = True
            .TableStyles.Add(GrdTs)
        End With

    End Sub

    Private Function CalculateAllGrade() As Integer
        Dim sql As String = ""
        Dim MaxRows As Integer = 0
        Dim IndexLp As Integer
        Dim temp As String = ""
        Dim data1 As Integer 'หน่วยกิต,
        Dim data2 As Double  'เกรด
        Dim totalMul As Double = 0
        Dim totalCret As Integer = 0

        sql = "Select * from Registry where Std_ID = '" + Student_ID + "' and Reg_GRADE <> 'None'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Count")
        If ds.Tables("Count").Rows.Count = 0 Then
            Exit Function
        End If

        sql = "Select Count(Std_ID)as MaxRow from Registry Where Reg_GRADE <> 'None' and Std_ID = '" + Student_ID + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Count")
        If ds.Tables("Count").Rows.Count <> 0 Then
            MaxRows = CInt(ds.Tables("Count").Rows(0).Item("MaxRow"))

            sql = "Select a.Reg_GRADE,b.Subj_CRETDIT,b.Subj_ID "
            sql = sql + " from Registry a,Subject b "
            sql = sql + " where a.Subj_ID = b.Subj_ID and a.Reg_GRADE <> 'None' and a.Std_ID = '" + Student_ID + "'"
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Grade")

            If ds.Tables("Grade").Rows.Count <> 0 Then
                For IndexLp = 0 To (MaxRows - 1)
                    data1 = CInt(ds.Tables("Grade").Rows(IndexLp).Item("Subj_CRETDIT"))
                    temp = CStr(ds.Tables("Grade").Rows(IndexLp).Item("Reg_GRADE"))
                    data2 = GradeNumber(temp)
                    totalMul = totalMul + (data1 * data2)
                    totalCret = totalCret + data1
                Next
                totalMul = totalMul / totalCret
                GPA.Text = totalMul.ToString("#,##0.00")
                GPA.Enabled = False
            Else
                MsgBox("No Record!")
            End If
        Else
            MsgBox("No record !")
            Return 0
        End If

    End Function
    Private Function GradeNumber(ByVal ChGrade As String) As Double
        Select Case ChGrade
            Case "F"
                Return 0
            Case "D"
                Return 1
            Case "D+"
                Return 1.5
            Case "C"
                Return 2
            Case "C+"
                Return 2.5
            Case "B"
                Return 3
            Case "B+"
                Return 3.5
            Case "A"
                Return 4
        End Select
    End Function

    Private Sub GridReg_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles GridReg.MouseUp
        Dim index As Integer = 0
        index = GridReg.CurrentRowIndex
        If index <> -1 Then
            LinkSubject = CStr(GridReg.Item(index, 0))
            BDelete.Enabled = True
        End If

    End Sub

    Private Sub BDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BDelete.Click
        Dim index As Integer = 0
        index = GridReg.CurrentRowIndex
        data_ID = CStr(GridReg.Item(index, 0))

        If MessageBox.Show("คุณต้องการลบข้อมูล รหัสวิชา : " + data_ID, "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
            Dim sql As String = ""

            '************ ถอนเงิน***********
            sql = "select a.Subj_ID,a.Reg_SEC,b.Subj_ENM,b.Subj_CRETDIT from Registry a,Subject b "
            sql = sql + "  where a.Subj_ID = b.Subj_ID and a.Subj_ID = '" + data_ID + "'"
            sql = sql + " and Reg_YEAR = '" + CStr(MaxYear) + "'"
            sql = sql + " and Reg_TERM = '" + CStr(MaxTerm) + "'"
            da = New SqlDataAdapter(sql, Conn)
            ds.Tables.Clear()
            da.Fill(ds, "Query")
            If ds.Tables("Query").Rows.Count <> 0 Then

                Dim MoneyTemp As Double = ds.Tables("Query").Rows(0).Item("Subj_CRETDIT")
                Dim tempSub1 As String = ds.Tables("Query").Rows(0).Item("Subj_ID")
                Dim tempSub2 As String = ds.Tables("Query").Rows(0).Item("Subj_ENM")
                Dim tempSub3 As String = ds.Tables("Query").Rows(0).Item("Reg_SEC")
                MoneyChangSubject += (MoneyTemp * (-150))

                sql = "insert into tempSubject(SubjectID,SubjectName,SubjectCredit,SubjectSec,State) "
                sql = sql + " values('" + tempSub1 + "','" + tempSub2 + "'," + CStr(MoneyTemp) + ",'" + tempSub3 + "','3')"
                da = New SqlDataAdapter(sql, Conn)
                ds.Tables.Clear()
                da.Fill(ds, "insert1")
            Else
                Exit Sub
            End If

            '*****************************

            sql = "Delete From Registry where Subj_ID = '" + data_ID + "'"
            sql = sql + " and Reg_YEAR = '" + CStr(MaxYear) + "'"
            sql = sql + " and Reg_TERM = '" + CStr(MaxTerm) + "'"

            da = New SqlDataAdapter(sql, Conn)
            ds.Tables.Clear()
            da.Fill(ds, "Del")
            FormatDataGrid()
        End If
    End Sub
    Private Function AllCreditTerm() As Boolean
        Dim sql As String = ""


        sql = "Select * from Registry where Std_ID = '" + Student_ID + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Count")
        If ds.Tables("Count").Rows.Count = 0 Then
            Exit Function
        End If

        sql = "Select MAX(Reg_YEAR)as MaxYear from Registry where Std_ID = '" + Student_ID + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "MAX")
        If ds.Tables("MAX").Rows.Count <> 0 Then
            MaxYear = CInt(ds.Tables("MAX").Rows(0).Item("MaxYear"))
            sql = "Select MAX(Reg_TERM)as MaxTerm from Registry where Std_ID = '" + Student_ID + "' and Reg_YEAR = '" + CStr(MaxYear) + "'"
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "MAX")
            If ds.Tables("MAX").Rows.Count <> 0 Then
                MaxTerm = CInt(ds.Tables("MAX").Rows(0).Item("MaxTerm"))

            End If
        Else
            MsgBox("No Record Field")
            Return False
        End If
        Return True
    End Function

    Private Sub BEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BEdit.Click

        Dim sql As String = "Select * from Registry where Std_ID = '" + Student_ID + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Count")
        If ds.Tables("Count").Rows.Count = 0 Then
            MessageBox.Show("รหัส   " + Student_ID + "  ยังไม่มีข้อมูลลงทะเบียน ", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            Exit Sub
        End If

        Dim form As New EditSubject
        If form.ShowDialog() Then
            FormatDataGrid()
        End If


    End Sub

    Private Sub BSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BSave.Click
        LinkSubject = ""
        Dim form As New SaveSubject
        If form.ShowDialog Then
            FormatDataGrid()
        End If
    End Sub
End Class
