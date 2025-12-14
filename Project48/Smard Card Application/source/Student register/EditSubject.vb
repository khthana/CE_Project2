Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Public Class EditSubject
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
    Friend WithEvents SubjID1 As System.Windows.Forms.TextBox
    Friend WithEvents SubjNM1 As System.Windows.Forms.TextBox
    Friend WithEvents SubjSec1 As System.Windows.Forms.TextBox
    Friend WithEvents SubjCret1 As System.Windows.Forms.TextBox
    Friend WithEvents SubjSec2 As System.Windows.Forms.TextBox
    Friend WithEvents SubjNM2 As System.Windows.Forms.TextBox
    Friend WithEvents SubjCret2 As System.Windows.Forms.TextBox
    Friend WithEvents SubjID2 As System.Windows.Forms.TextBox
    Friend WithEvents Bsave As System.Windows.Forms.Button
    Friend WithEvents BCancel As System.Windows.Forms.Button
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.SubjID1 = New System.Windows.Forms.TextBox
        Me.SubjNM1 = New System.Windows.Forms.TextBox
        Me.SubjSec1 = New System.Windows.Forms.TextBox
        Me.SubjCret1 = New System.Windows.Forms.TextBox
        Me.SubjSec2 = New System.Windows.Forms.TextBox
        Me.SubjNM2 = New System.Windows.Forms.TextBox
        Me.SubjCret2 = New System.Windows.Forms.TextBox
        Me.SubjID2 = New System.Windows.Forms.TextBox
        Me.Bsave = New System.Windows.Forms.Button
        Me.BCancel = New System.Windows.Forms.Button
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(24, 32)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(80, 23)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "รหัสวิชาเดิม"
        '
        'Label2
        '
        Me.Label2.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.Label2.Location = New System.Drawing.Point(24, 80)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(80, 23)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "รหัสวิชาใหม่"
        '
        'SubjID1
        '
        Me.SubjID1.Location = New System.Drawing.Point(104, 32)
        Me.SubjID1.Name = "SubjID1"
        Me.SubjID1.Size = New System.Drawing.Size(112, 24)
        Me.SubjID1.TabIndex = 2
        Me.SubjID1.Text = ""
        '
        'SubjNM1
        '
        Me.SubjNM1.Enabled = False
        Me.SubjNM1.Location = New System.Drawing.Point(224, 32)
        Me.SubjNM1.Name = "SubjNM1"
        Me.SubjNM1.Size = New System.Drawing.Size(224, 24)
        Me.SubjNM1.TabIndex = 3
        Me.SubjNM1.Text = ""
        '
        'SubjSec1
        '
        Me.SubjSec1.Location = New System.Drawing.Point(464, 32)
        Me.SubjSec1.Name = "SubjSec1"
        Me.SubjSec1.Size = New System.Drawing.Size(56, 24)
        Me.SubjSec1.TabIndex = 4
        Me.SubjSec1.Text = ""
        '
        'SubjCret1
        '
        Me.SubjCret1.Enabled = False
        Me.SubjCret1.Location = New System.Drawing.Point(528, 32)
        Me.SubjCret1.Name = "SubjCret1"
        Me.SubjCret1.Size = New System.Drawing.Size(56, 24)
        Me.SubjCret1.TabIndex = 5
        Me.SubjCret1.Text = ""
        '
        'SubjSec2
        '
        Me.SubjSec2.Location = New System.Drawing.Point(464, 80)
        Me.SubjSec2.Name = "SubjSec2"
        Me.SubjSec2.Size = New System.Drawing.Size(56, 24)
        Me.SubjSec2.TabIndex = 4
        Me.SubjSec2.Text = ""
        '
        'SubjNM2
        '
        Me.SubjNM2.Enabled = False
        Me.SubjNM2.Location = New System.Drawing.Point(224, 80)
        Me.SubjNM2.Name = "SubjNM2"
        Me.SubjNM2.Size = New System.Drawing.Size(224, 24)
        Me.SubjNM2.TabIndex = 3
        Me.SubjNM2.Text = ""
        '
        'SubjCret2
        '
        Me.SubjCret2.Enabled = False
        Me.SubjCret2.Location = New System.Drawing.Point(528, 80)
        Me.SubjCret2.Name = "SubjCret2"
        Me.SubjCret2.Size = New System.Drawing.Size(56, 24)
        Me.SubjCret2.TabIndex = 5
        Me.SubjCret2.Text = ""
        '
        'SubjID2
        '
        Me.SubjID2.Location = New System.Drawing.Point(104, 80)
        Me.SubjID2.Name = "SubjID2"
        Me.SubjID2.Size = New System.Drawing.Size(112, 24)
        Me.SubjID2.TabIndex = 2
        Me.SubjID2.Text = ""
        '
        'Bsave
        '
        Me.Bsave.BackColor = System.Drawing.SystemColors.Info
        Me.Bsave.Location = New System.Drawing.Point(392, 120)
        Me.Bsave.Name = "Bsave"
        Me.Bsave.Size = New System.Drawing.Size(88, 40)
        Me.Bsave.TabIndex = 6
        Me.Bsave.Text = "บันทึก"
        '
        'BCancel
        '
        Me.BCancel.BackColor = System.Drawing.SystemColors.ControlLightLight
        Me.BCancel.Location = New System.Drawing.Point(496, 120)
        Me.BCancel.Name = "BCancel"
        Me.BCancel.Size = New System.Drawing.Size(88, 40)
        Me.BCancel.TabIndex = 7
        Me.BCancel.Text = "ยกเลิก"
        '
        'Label3
        '
        Me.Label3.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.Label3.Location = New System.Drawing.Point(104, 8)
        Me.Label3.Name = "Label3"
        Me.Label3.TabIndex = 8
        Me.Label3.Text = "รหัสวิชา"
        '
        'Label4
        '
        Me.Label4.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.Label4.Location = New System.Drawing.Point(224, 8)
        Me.Label4.Name = "Label4"
        Me.Label4.TabIndex = 9
        Me.Label4.Text = "ชื่อวิชา"
        '
        'Label5
        '
        Me.Label5.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.Label5.Location = New System.Drawing.Point(464, 8)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(56, 23)
        Me.Label5.TabIndex = 10
        Me.Label5.Text = "Sec"
        '
        'Label6
        '
        Me.Label6.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.Label6.Location = New System.Drawing.Point(528, 8)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(64, 23)
        Me.Label6.TabIndex = 11
        Me.Label6.Text = "หน่วยกิต"
        '
        'EditSubject
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.ClientSize = New System.Drawing.Size(600, 165)
        Me.Controls.Add(Me.Label6)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.BCancel)
        Me.Controls.Add(Me.Bsave)
        Me.Controls.Add(Me.SubjCret1)
        Me.Controls.Add(Me.SubjSec1)
        Me.Controls.Add(Me.SubjNM1)
        Me.Controls.Add(Me.SubjID1)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.SubjSec2)
        Me.Controls.Add(Me.SubjNM2)
        Me.Controls.Add(Me.SubjCret2)
        Me.Controls.Add(Me.SubjID2)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.IsMdiContainer = True
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "EditSubject"
        Me.Text = "เปลี่ยนแปลงรายวิชา"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Dim MaxYear, MaxTerm As Integer

    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Private Sub EditSubject_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Normal
        Cursor.Current = Cursors.WaitCursor

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        AllCreditTerm()
        If LinkSubject <> "" Then
            SubjID1.Text = LinkSubject
            SubjID1.Enabled = False
        End If
        SubjSec1.Enabled = False
    End Sub

    Private Sub BCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BCancel.Click
        Me.Close()
    End Sub
    Private Function CheckItem() As Boolean
        If SubjID1.Text = "" Or SubjID2.Text = "" Then
            MsgBox("กรุณากรอกรหัสวิชาทั้ง ช่องวิชาเดิม และ ช่องวิชาใหม่")
            Return False
        End If
        If SubjSec1.Text = "" Or SubjSec2.Text = "" Then
            MsgBox("กรุณากรอก Sec ทั้ง ช่องวิชาเดิม และ ช่องวิชาใหม่")
            Return False
        End If
        If SubjCret1.Text = "" Or SubjCret2.Text = "" Then
            MsgBox("กรุณากรอกรหัสวิชาให้ถูกต้อง ทั้ง ช่องวิชาเดิม และ ช่องวิชาใหม่")
            Return False
        End If
        Return True
    End Function

    Private Sub Bsave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Bsave.Click
        If CheckItem() Then

            If MessageBox.Show("ต้องการเปลี่ยนแปลงรหัสวิชา  " + SubjID1.Text + " เป็นรหัสวิชา " + SubjID2.Text + " จริงหรือไม่", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
                Dim sql As String = ""
                sql = "Update Registry set Subj_ID = '" + SubjID2.Text + "'"
                sql = sql + " Where Subj_ID = '" + SubjID1.Text + "' and Std_ID = '" + Student_ID + "'"
                sql = sql + " and Reg_YEAR = '" + CStr(MaxYear) + "'"
                sql = sql + " and Reg_TERM = '" + CStr(MaxTerm) + "'"
                da = New SqlDataAdapter(sql, Conn)
                ds.Tables.Clear()
                da.Fill(ds, "Upadte")
                '********** tempSubject ***********************
                If SubjCret1.Text <> SubjCret2.Text Then 'เงินเพิ่ม
                    Dim tempSec1 As Double = SubjCret1.Text
                    Dim tempSec2 As Double = SubjCret2.Text
                    tempSec1 = (tempSec2 - tempSec1)
                    tempSec1 *= 150
                    MoneyChangSubject += tempSec1
                End If

                sql = "insert into tempSubject(SubjectID,SubjectName,SubjectCredit,SubjectSec,State) "
                sql = sql + " values('" + SubjID1.Text + "','" + SubjNM1.Text + "'," + SubjCret1.Text + ",'" + SubjSec1.Text + "','1')"
                da = New SqlDataAdapter(sql, Conn)
                ds.Tables.Clear()
                da.Fill(ds, "insert1")

                sql = "insert into tempSubject(SubjectID,SubjectName,SubjectCredit,SubjectSec,State) "
                sql = sql + " values('" + SubjID2.Text + "','" + SubjNM2.Text + "'," + SubjCret2.Text + ",'" + SubjSec2.Text + "','4')"
                da = New SqlDataAdapter(sql, Conn)
                ds.Tables.Clear()
                da.Fill(ds, "insert2")

                '**********************************************
                Me.Close()
            End If

        End If

    End Sub

    Private Sub SubjID1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SubjID1.TextChanged
        If SubjID1.TextLength = 8 Then
            FindSubject(SubjID1.Text, True)
        Else
            SubjNM1.Clear()
            SubjCret1.Clear()
            SubjSec1.Clear()
        End If

    End Sub
    Private Function AllCreditTerm() As Boolean
        Dim sql As String = ""
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
    Private Function CheckFactSql() As Boolean 'เช็ควิชาในเทอม
        Dim sql As String = ""
        sql = "select * from Registry where Std_ID = '" + Student_ID + "'"
        sql = sql + " and Subj_ID = '" + SubjID2.Text + "'"
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
    Private Function FindSubject(ByVal DataID As String, ByVal index As Boolean) As Boolean
        Dim sql As String = ""
        If CheckFactSql() Then
            Return False
        End If
        If index Then
            sql = "Select * from Registry"
            sql = sql + " where Subj_ID='" + DataID + "' and Std_ID = '"
            sql = sql + Student_ID + "' and Reg_YEAR = '"
            sql = sql + CStr(MaxYear) + "' and Reg_TERM = '" + CStr(MaxTerm) + "'"
            da = New SqlDataAdapter(sql, Conn)
            ds.Tables.Clear()
            da.Fill(ds, "Sel")
            If ds.Tables("Sel").Rows.Count = 0 Then
                SubjNM1.Clear()
                SubjCret1.Clear()
                SubjSec1.Clear()
                Return False
            End If
        End If

        If index Then
            sql = "Select a.Reg_SEC,b.Subj_CRETDIT,b.Subj_ENM"
            sql = sql + " from Registry a,Subject b"
            sql = sql + " Where a.Subj_ID = b.Subj_ID and a.Subj_ID = '" + DataID + "'"
            sql = sql + " and a.Std_ID = '" + Student_ID + "'"
        Else
            sql = "Select Subj_CRETDIT,Subj_ENM"
            sql = sql + " from Subject "
            sql = sql + " Where Subj_Id = '" + DataID + "'"
        End If

        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Sel")
        If ds.Tables("Sel").Rows.Count <> 0 Then
            If index Then
                SubjNM1.Text = CStr(ds.Tables("Sel").Rows(0).Item("Subj_ENM"))
                SubjCret1.Text = CStr(ds.Tables("Sel").Rows(0).Item("Subj_CRETDIT"))
                SubjSec1.Text = CStr(ds.Tables("Sel").Rows(0).Item("Reg_SEC"))
            Else
                SubjNM2.Text = CStr(ds.Tables("Sel").Rows(0).Item("Subj_ENM"))
                SubjCret2.Text = CStr(ds.Tables("Sel").Rows(0).Item("Subj_CRETDIT"))
                SubjSec2.Text = "1"
            End If
            Return True
        Else
            SubjNM2.Clear()
            SubjCret2.Clear()
            SubjSec2.Clear()
            Return False
        End If
    End Function

    Private Sub SubjID2_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SubjID2.TextChanged
        If SubjID2.TextLength = 8 Then
            FindSubject(SubjID2.Text, False)
        Else
            SubjNM2.Clear()
            SubjCret2.Clear()
            SubjSec2.Clear()
        End If

    End Sub

End Class
