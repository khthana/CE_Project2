Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Public Class SaveSubject
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
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents SubjCret As System.Windows.Forms.TextBox
    Friend WithEvents SubjSec As System.Windows.Forms.TextBox
    Friend WithEvents SubjNM As System.Windows.Forms.TextBox
    Friend WithEvents SubjID As System.Windows.Forms.TextBox
    Friend WithEvents BSave As System.Windows.Forms.Button
    Friend WithEvents BCancel As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Label6 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.SubjCret = New System.Windows.Forms.TextBox
        Me.SubjSec = New System.Windows.Forms.TextBox
        Me.SubjNM = New System.Windows.Forms.TextBox
        Me.SubjID = New System.Windows.Forms.TextBox
        Me.BSave = New System.Windows.Forms.Button
        Me.BCancel = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'Label6
        '
        Me.Label6.Location = New System.Drawing.Point(448, 16)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(64, 23)
        Me.Label6.TabIndex = 19
        Me.Label6.Text = "หน่วยกิต"
        '
        'Label5
        '
        Me.Label5.Location = New System.Drawing.Point(384, 16)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(56, 23)
        Me.Label5.TabIndex = 18
        Me.Label5.Text = "Sec"
        '
        'Label4
        '
        Me.Label4.Location = New System.Drawing.Point(144, 16)
        Me.Label4.Name = "Label4"
        Me.Label4.TabIndex = 17
        Me.Label4.Text = "ชื่อวิชา"
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(24, 16)
        Me.Label3.Name = "Label3"
        Me.Label3.TabIndex = 16
        Me.Label3.Text = "รหัสวิชา"
        '
        'SubjCret
        '
        Me.SubjCret.Enabled = False
        Me.SubjCret.Location = New System.Drawing.Point(448, 40)
        Me.SubjCret.Name = "SubjCret"
        Me.SubjCret.Size = New System.Drawing.Size(56, 24)
        Me.SubjCret.TabIndex = 15
        Me.SubjCret.Text = ""
        '
        'SubjSec
        '
        Me.SubjSec.Location = New System.Drawing.Point(384, 40)
        Me.SubjSec.Name = "SubjSec"
        Me.SubjSec.Size = New System.Drawing.Size(56, 24)
        Me.SubjSec.TabIndex = 14
        Me.SubjSec.Text = ""
        '
        'SubjNM
        '
        Me.SubjNM.Enabled = False
        Me.SubjNM.Location = New System.Drawing.Point(144, 40)
        Me.SubjNM.Name = "SubjNM"
        Me.SubjNM.Size = New System.Drawing.Size(224, 24)
        Me.SubjNM.TabIndex = 13
        Me.SubjNM.Text = ""
        '
        'SubjID
        '
        Me.SubjID.Location = New System.Drawing.Point(24, 40)
        Me.SubjID.Name = "SubjID"
        Me.SubjID.Size = New System.Drawing.Size(112, 24)
        Me.SubjID.TabIndex = 12
        Me.SubjID.Text = ""
        '
        'BSave
        '
        Me.BSave.BackColor = System.Drawing.SystemColors.ControlLight
        Me.BSave.Location = New System.Drawing.Point(312, 72)
        Me.BSave.Name = "BSave"
        Me.BSave.Size = New System.Drawing.Size(96, 40)
        Me.BSave.TabIndex = 20
        Me.BSave.Text = "บันทึก"
        '
        'BCancel
        '
        Me.BCancel.BackColor = System.Drawing.Color.White
        Me.BCancel.Location = New System.Drawing.Point(416, 72)
        Me.BCancel.Name = "BCancel"
        Me.BCancel.Size = New System.Drawing.Size(88, 40)
        Me.BCancel.TabIndex = 21
        Me.BCancel.Text = "ยกเลิก"
        '
        'SaveSubject
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.SystemColors.ControlDark
        Me.ClientSize = New System.Drawing.Size(520, 117)
        Me.Controls.Add(Me.BCancel)
        Me.Controls.Add(Me.BSave)
        Me.Controls.Add(Me.Label6)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.SubjCret)
        Me.Controls.Add(Me.SubjSec)
        Me.Controls.Add(Me.SubjNM)
        Me.Controls.Add(Me.SubjID)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "SaveSubject"
        Me.Text = "เพิ่มรายวิชา"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Dim MaxYear, MaxTerm As Integer

    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Private Sub SaveSubject_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Me.WindowState = FormWindowState.Normal
        Cursor.Current = Cursors.WaitCursor

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        AllCreditTerm()
    End Sub
    Private Function AllCreditTerm() As Boolean
        Dim sql As String = ""
        sql = "Select MAX(Reg_YEAR)as MaxYear from Registry "
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "MAX")
        If ds.Tables("MAX").Rows.Count <> 0 Then
            MaxYear = CInt(ds.Tables("MAX").Rows(0).Item("MaxYear"))
            sql = "Select MAX(Reg_TERM)as MaxTerm from Registry where  Reg_YEAR = '" + CStr(MaxYear) + "'"
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

    Private Sub BCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BCancel.Click
        Me.Close()
    End Sub

    Private Sub BSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BSave.Click
        If SubjID.Text <> "" And SubjNM.Text <> "" Then
            If SubjSec.Text <> "" Then
                If MessageBox.Show("ต้องการเพิ่มข้อมูล รหัสวิชา " + SubjID.Text, "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
                    Dim sql As String = ""
                    sql = "Insert into Registry(Std_ID,Reg_YEAR,Reg_TERM,Subj_ID,Reg_GRADE,Reg_SEC)values('"
                    sql = sql + Student_ID + "','" + CStr(MaxYear) + "','" + CStr(MaxTerm) + "','"
                    sql = sql + SubjID.Text + "','None','" + SubjSec.Text + "')"
                    da = New SqlDataAdapter(sql, Conn)
                    ds.Tables.Clear()
                    da.Fill(ds, "Insert")
                    '******************
                    Dim MoneyTemp As Double = SubjCret.Text
                    MoneyChangSubject += MoneyTemp * 150
                    sql = "insert into tempSubject(SubjectID,SubjectName,SubjectCredit,SubjectSec,State) "
                    sql = sql + " values('" + SubjID.Text + "','" + SubjNM.Text + "'," + SubjCret.Text + ",'" + SubjSec.Text + "','2')"
                    da = New SqlDataAdapter(sql, Conn)
                    ds.Tables.Clear()
                    da.Fill(ds, "insert1")

                    '******************
                    Me.Close()
                End If
            Else
                MsgBox("กรุณากรอก Sec วิชาให้ถูกต้อง")
            End If
        Else
            MsgBox("กรุณากรอก รหัสวิชาให้ถูกต้อง")
        End If
    End Sub

    Private Sub SubjID_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SubjID.TextChanged
        If SubjID.Text.Length = 8 Then
            FindSubject(SubjID.Text)
        End If
    End Sub
    Private Function FindSubject(ByVal DataID As String) As Boolean
        Dim sql As String = ""
        If CheckFactSql() Then
            Return False
        End If

        sql = "Select Subj_CRETDIT,Subj_ENM"
        sql = sql + " from Subject "
        sql = sql + " Where Subj_Id = '" + DataID + "'"

        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Sel")
        If ds.Tables("Sel").Rows.Count <> 0 Then
            SubjNM.Text = CStr(ds.Tables("Sel").Rows(0).Item("Subj_ENM"))
            SubjCret.Text = CStr(ds.Tables("Sel").Rows(0).Item("Subj_CRETDIT"))
            SubjSec.Text = "1"
            Return True
        Else
            SubjNM.Clear()
            SubjCret.Clear()
            SubjSec.Clear()
            Return False
        End If
    End Function
    Private Function CheckFactSql() As Boolean 'เช็ควิชาในเทอม
        Dim sql As String = ""
        sql = "select * from Registry where Std_ID = '" + Student_ID + "'"
        sql = sql + " and Subj_ID = '" + SubjID.Text + "'"
        sql = sql + " and Reg_GRADE <> 'F'"

        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Check")
        If ds.Tables("Check").Rows.Count <> 0 Then
            MessageBox.Show("รหัสวิชานี้มีการลงทะเบียนไปแล้ว", "คำเตือน", MessageBoxButtons.OK)
            Return True
        End If
        Return False
    End Function
End Class
