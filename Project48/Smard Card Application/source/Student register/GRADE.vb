'Option Explicit On 
'Option Strict On
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Public Class GRADE
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
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents ThaiName As System.Windows.Forms.TextBox
    Friend WithEvents stdID As System.Windows.Forms.TextBox
    Friend WithEvents Gradeterm As System.Windows.Forms.TextBox
    Friend WithEvents GPA As System.Windows.Forms.TextBox
    Friend WithEvents TotalCredit As System.Windows.Forms.TextBox
    Friend WithEvents GridShow As System.Windows.Forms.DataGrid
    Friend WithEvents BCancel As System.Windows.Forms.Button
    Friend WithEvents Depart As System.Windows.Forms.Label
    Friend WithEvents Factory As System.Windows.Forms.Label
    Friend WithEvents ThSurname As System.Windows.Forms.TextBox
    Friend WithEvents ThName As System.Windows.Forms.TextBox
    Friend WithEvents StatusChang As System.Windows.Forms.Label
    Friend WithEvents PrintPreView As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.ThSurname = New System.Windows.Forms.TextBox
        Me.ThName = New System.Windows.Forms.TextBox
        Me.stdID = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label1 = New System.Windows.Forms.Label
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.Gradeterm = New System.Windows.Forms.TextBox
        Me.Label7 = New System.Windows.Forms.Label
        Me.GPA = New System.Windows.Forms.TextBox
        Me.Label6 = New System.Windows.Forms.Label
        Me.TotalCredit = New System.Windows.Forms.TextBox
        Me.Label5 = New System.Windows.Forms.Label
        Me.GridShow = New System.Windows.Forms.DataGrid
        Me.BCancel = New System.Windows.Forms.Button
        Me.Depart = New System.Windows.Forms.Label
        Me.Factory = New System.Windows.Forms.Label
        Me.StatusChang = New System.Windows.Forms.Label
        Me.PrintPreView = New System.Windows.Forms.Button
        Me.GroupBox1.SuspendLayout()
        CType(Me.GridShow, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'ThSurname
        '
        Me.ThSurname.Location = New System.Drawing.Point(272, 48)
        Me.ThSurname.Name = "ThSurname"
        Me.ThSurname.Size = New System.Drawing.Size(168, 24)
        Me.ThSurname.TabIndex = 13
        Me.ThSurname.Text = ""
        '
        'ThName
        '
        Me.ThName.Location = New System.Drawing.Point(104, 48)
        Me.ThName.Name = "ThName"
        Me.ThName.Size = New System.Drawing.Size(160, 24)
        Me.ThName.TabIndex = 18
        Me.ThName.Text = ""
        '
        'stdID
        '
        Me.stdID.Location = New System.Drawing.Point(104, 16)
        Me.stdID.Name = "stdID"
        Me.stdID.Size = New System.Drawing.Size(160, 24)
        Me.stdID.TabIndex = 11
        Me.stdID.Text = ""
        '
        'Label2
        '
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(24, 16)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(88, 23)
        Me.Label2.TabIndex = 8
        Me.Label2.Text = "รหัสนักศึกษา"
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label1.Location = New System.Drawing.Point(16, 48)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(88, 23)
        Me.Label1.TabIndex = 7
        Me.Label1.Text = "ชื่อ - นามสกุล"
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.Gradeterm)
        Me.GroupBox1.Controls.Add(Me.Label7)
        Me.GroupBox1.Controls.Add(Me.GPA)
        Me.GroupBox1.Controls.Add(Me.Label6)
        Me.GroupBox1.Controls.Add(Me.TotalCredit)
        Me.GroupBox1.Controls.Add(Me.Label5)
        Me.GroupBox1.Controls.Add(Me.GridShow)
        Me.GroupBox1.Location = New System.Drawing.Point(16, 104)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(680, 296)
        Me.GroupBox1.TabIndex = 14
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "ข้อมูลเกรดทะเบียน"
        '
        'Gradeterm
        '
        Me.Gradeterm.Location = New System.Drawing.Point(416, 264)
        Me.Gradeterm.Name = "Gradeterm"
        Me.Gradeterm.Size = New System.Drawing.Size(80, 24)
        Me.Gradeterm.TabIndex = 6
        Me.Gradeterm.Text = ""
        '
        'Label7
        '
        Me.Label7.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label7.Location = New System.Drawing.Point(352, 264)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(64, 23)
        Me.Label7.TabIndex = 5
        Me.Label7.Text = "เกรดเฉลี่ย"
        '
        'GPA
        '
        Me.GPA.Location = New System.Drawing.Point(264, 264)
        Me.GPA.Name = "GPA"
        Me.GPA.Size = New System.Drawing.Size(72, 24)
        Me.GPA.TabIndex = 4
        Me.GPA.Text = ""
        '
        'Label6
        '
        Me.Label6.Location = New System.Drawing.Point(224, 264)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(40, 23)
        Me.Label6.TabIndex = 3
        Me.Label6.Text = "GPA"
        '
        'TotalCredit
        '
        Me.TotalCredit.Location = New System.Drawing.Point(600, 264)
        Me.TotalCredit.Name = "TotalCredit"
        Me.TotalCredit.Size = New System.Drawing.Size(72, 24)
        Me.TotalCredit.TabIndex = 2
        Me.TotalCredit.Text = ""
        '
        'Label5
        '
        Me.Label5.Location = New System.Drawing.Point(504, 264)
        Me.Label5.Name = "Label5"
        Me.Label5.TabIndex = 1
        Me.Label5.Text = "หน่วยกิตสะสม"
        '
        'GridShow
        '
        Me.GridShow.DataMember = ""
        Me.GridShow.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.GridShow.Location = New System.Drawing.Point(8, 24)
        Me.GridShow.Name = "GridShow"
        Me.GridShow.Size = New System.Drawing.Size(664, 232)
        Me.GridShow.TabIndex = 0
        '
        'BCancel
        '
        Me.BCancel.BackColor = System.Drawing.Color.DarkSalmon
        Me.BCancel.Location = New System.Drawing.Point(600, 400)
        Me.BCancel.Name = "BCancel"
        Me.BCancel.Size = New System.Drawing.Size(96, 40)
        Me.BCancel.TabIndex = 15
        Me.BCancel.Text = "จบการทำงาน"
        '
        'Depart
        '
        Me.Depart.BackColor = System.Drawing.Color.White
        Me.Depart.Location = New System.Drawing.Point(24, 80)
        Me.Depart.Name = "Depart"
        Me.Depart.Size = New System.Drawing.Size(208, 24)
        Me.Depart.TabIndex = 16
        '
        'Factory
        '
        Me.Factory.BackColor = System.Drawing.Color.White
        Me.Factory.Location = New System.Drawing.Point(232, 80)
        Me.Factory.Name = "Factory"
        Me.Factory.Size = New System.Drawing.Size(208, 24)
        Me.Factory.TabIndex = 17
        '
        'StatusChang
        '
        Me.StatusChang.BackColor = System.Drawing.Color.White
        Me.StatusChang.Location = New System.Drawing.Point(440, 80)
        Me.StatusChang.Name = "StatusChang"
        Me.StatusChang.Size = New System.Drawing.Size(248, 23)
        Me.StatusChang.TabIndex = 7
        '
        'PrintPreView
        '
        Me.PrintPreView.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.PrintPreView.Location = New System.Drawing.Point(480, 400)
        Me.PrintPreView.Name = "PrintPreView"
        Me.PrintPreView.Size = New System.Drawing.Size(112, 40)
        Me.PrintPreView.TabIndex = 19
        Me.PrintPreView.Text = "Print Preview"
        '
        'GRADE
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.Color.Linen
        Me.ClientSize = New System.Drawing.Size(704, 445)
        Me.Controls.Add(Me.PrintPreView)
        Me.Controls.Add(Me.Factory)
        Me.Controls.Add(Me.Depart)
        Me.Controls.Add(Me.BCancel)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.ThSurname)
        Me.Controls.Add(Me.ThName)
        Me.Controls.Add(Me.stdID)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.StatusChang)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "GRADE"
        Me.Text = "ตรวจสอบผลการเรียน นักศึกษา"
        Me.GroupBox1.ResumeLayout(False)
        CType(Me.GridShow, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Dim MaxYear, MaxTerm As Integer

    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Private Sub GRADE_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Normal
        Cursor.Current = Cursors.WaitCursor

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With
        Depart.Text = GlDepart
        Factory.Text = GlFactory
        stdID.Text = Student_ID
        stdID.Enabled = False
        ThName.Text = thaiNM
        ThName.Enabled = False
        ThSurname.Text = ThaiSurNM
        ThSurname.Enabled = False

        AllCreditTerm()
        FormatDataGrid()
        CalculateAllGrade()
        CalculateTermGrade()
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

    Private Sub BCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BCancel.Click
        Me.Close()

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

        sql = "SELECT sum(b.Subj_CRETDIT) as AllSum "
        sql = sql + "FROM Registry a,Subject b "
        sql = sql + "where 	a.Subj_ID = b.Subj_ID and a.Std_ID = '"
        sql = sql + Student_ID + "'"
        da.SelectCommand.CommandText = sql
        ds.Tables.Clear()
        da.Fill(ds, "Sum")
        If ds.Tables("Sum").Rows.Count <> 0 Then
            TotalCredit.Text = CStr(ds.Tables("Sum").Rows(0).Item("AllSum"))
            TotalCredit.Enabled = False

        Else
            MsgBox("No Record Field")
        End If
        '###############
        sql = "SELECT a.Reg_YEAR,a.Reg_TERM,a.Subj_ID, a.Reg_SEC,a.Reg_GRADE, b.subj_ENM, b.Subj_CRETDIT "
        sql = sql + "From Registry a,Subject b "
        sql = sql + " where a.Subj_ID = b.Subj_ID and a.Std_ID = '"
        sql = sql + Student_ID + "'"

        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "DataSelect")
        If ds.Tables("DataSelect").Rows.Count = 0 Then

            MsgBox(" ไม่มีข้อมูล  No Record 0 Rows!")
        Else
            With GridShow
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

            Dim Year As New DataGridTextBoxColumn
            With Year
                .HeaderText = "ปีการศึกษา"
                .MappingName = "Reg_YEAR"
                .ReadOnly = True
                .Width = 70
            End With
            GrdTs.GridColumnStyles.Add(Year)

            Dim term As New DataGridTextBoxColumn
            With term
                .HeaderText = "ภาคการศึกษา"
                .MappingName = "Reg_TERM"
                .ReadOnly = True
                .Width = 90
            End With
            GrdTs.GridColumnStyles.Add(term)

            Dim cs As New DataGridTextBoxColumn
            With cs
                .HeaderText = "รหัสวิชา"
                .MappingName = "Subj_ID"
                .ReadOnly = True
                .Width = 80
            End With
            GrdTs.GridColumnStyles.Add(cs)

            Dim cs1 As New DataGridTextBoxColumn
            With cs1
                .HeaderText = "ชื่อวิชา"
                .MappingName = "subj_ENM"
                .ReadOnly = True
                .Width = 265
            End With
            GrdTs.GridColumnStyles.Add(cs1)

            Dim cs3 As New DataGridTextBoxColumn
            With cs3
                .HeaderText = "หน่วยกิต"
                .MappingName = "Subj_CRETDIT"
                .ReadOnly = True
                .Width = 60
            End With
            GrdTs.GridColumnStyles.Add(cs3)

            Dim cs2 As New DataGridTextBoxColumn
            With cs2
                .HeaderText = "เกรด"
                .MappingName = "Reg_GRADE"
                .ReadOnly = True
                .Width = 60
            End With
            GrdTs.GridColumnStyles.Add(cs2)

            With GridShow
                .TableStyles.Clear()
                .CaptionText = "ตารางรายวิชาที่ ลงทะเบียน"
                .FlatMode = True
                .TableStyles.Add(GrdTs)
            End With
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
        Select Case ChGrade.ToUpper
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
    Private Function CalculateTermGrade() As Integer
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
        sql = sql + " and Reg_YEAR = '" + CStr(MaxYear) + "'"
        sql = sql + " and Reg_TERM = '" + CStr(MaxTerm) + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Count")
        If ds.Tables("Count").Rows.Count <> 0 Then
            MaxRows = CInt(ds.Tables("Count").Rows(0).Item("MaxRow"))

            sql = "Select a.Reg_GRADE,b.Subj_CRETDIT,b.Subj_ID "
            sql = sql + " from Registry a,Subject b "
            sql = sql + " where a.Subj_ID = b.Subj_ID and a.Reg_GRADE <> 'None' and a.Std_ID = '" + Student_ID + "'"
            sql = sql + " and Reg_YEAR = '" + CStr(MaxYear) + "'"
            sql = sql + " and Reg_TERM = '" + CStr(MaxTerm) + "'"
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
                Gradeterm.Text = totalMul.ToString("#,##0.00")
                Gradeterm.Enabled = False
            End If
        Else
            MsgBox("No record !")
            Return 0
        End If

    End Function

    Private Sub GridShow_DoubleClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridShow.DoubleClick

        Dim index As Integer = 0
        index = GridShow.CurrentRowIndex
        If index = -1 Then
            Exit Sub
        End If
        Dim temp1 As String = CStr(GridShow.Item(index, 0))
        Dim temp2 As String = CStr(GridShow.Item(index, 1))
        Dim temp3 As String = CStr(GridShow.Item(index, 2))
        Dim temp4 As String = CStr(GridShow.Item(index, 3))
        Dim temp5 As String = CStr(GridShow.Item(index, 4))
        Dim temp6 As String = CStr(GridShow.Item(index, 5))

        LinkGrade1 = temp1 'ปี
        LinkGrade2 = temp2 'เทอม
        LinkGrade3 = temp3 'รหัสวิชา
        LinkGrade5 = temp4 'ชื่อ วิชา
        LinkGrade4 = temp6 'เกรด
        Dim Form As New EditGrade
        If StatusUser Then
            If temp6 = "None" Then
                If Form.ShowDialog() Then
                    FormatDataGrid()
                End If
            Else
                If MessageBox.Show("คุณต้องการที่จะแก้ไข เกรด รหัสวิชา " + temp3 + " ภาคการศึกษาที่ " + temp2 + " ปี " + temp1 + " จากเกรดเดิม    " + temp6, "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
                    If Form.ShowDialog() Then
                        FormatDataGrid()
                    End If
                End If
            End If
        End If
        CalculateAllGrade()
        CalculateTermGrade()
    End Sub

    Private Sub PrintPreView_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PrintPreView.Click
        Dim sql As String = ""
        sql = "SELECT a.Reg_YEAR,a.Reg_TERM,a.Subj_ID, a.Reg_SEC,a.Reg_GRADE, b.subj_ENM, b.Subj_CRETDIT "
        sql = sql + "From Registry a,Subject b "
        sql = sql + " where a.Subj_ID = b.Subj_ID and a.Std_ID = '"
        sql = sql + Student_ID + "'"

        Dim frmDynamicPrint As New frmPrintDynamicForm

        frmDynamicPrint.SqlSet = sql
        frmDynamicPrint.Stateprinting = True
        frmDynamicPrint.DateString = Now.ToString
        frmDynamicPrint.InitPrint()
        frmDynamicPrint.PrintPreview()
        frmDynamicPrint.Dispose()

    End Sub
End Class
