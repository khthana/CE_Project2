Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Imports System.Text
Public Class EditGrade
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
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents StdId As System.Windows.Forms.Label
    Friend WithEvents StdName As System.Windows.Forms.Label
    Friend WithEvents Std_term As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents OldGrade As System.Windows.Forms.Label
    Friend WithEvents OldGrade1 As System.Windows.Forms.Label
    Friend WithEvents NewGrade As System.Windows.Forms.Label
    Friend WithEvents NewGrade1 As System.Windows.Forms.TextBox
    Friend WithEvents BnExit As System.Windows.Forms.Button
    Friend WithEvents BnEdit As System.Windows.Forms.Button
    Friend WithEvents CheckNone As System.Windows.Forms.CheckBox
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.BnExit = New System.Windows.Forms.Button
        Me.BnEdit = New System.Windows.Forms.Button
        Me.GroupBox3 = New System.Windows.Forms.GroupBox
        Me.NewGrade1 = New System.Windows.Forms.TextBox
        Me.NewGrade = New System.Windows.Forms.Label
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.OldGrade1 = New System.Windows.Forms.Label
        Me.OldGrade = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label1 = New System.Windows.Forms.Label
        Me.Std_term = New System.Windows.Forms.Label
        Me.StdName = New System.Windows.Forms.Label
        Me.StdId = New System.Windows.Forms.Label
        Me.CheckNone = New System.Windows.Forms.CheckBox
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.GroupBox1.Controls.Add(Me.BnExit)
        Me.GroupBox1.Controls.Add(Me.BnEdit)
        Me.GroupBox1.Controls.Add(Me.GroupBox3)
        Me.GroupBox1.Controls.Add(Me.GroupBox2)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Controls.Add(Me.Std_term)
        Me.GroupBox1.Controls.Add(Me.StdName)
        Me.GroupBox1.Controls.Add(Me.StdId)
        Me.GroupBox1.FlatStyle = System.Windows.Forms.FlatStyle.System
        Me.GroupBox1.Location = New System.Drawing.Point(8, 8)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(472, 344)
        Me.GroupBox1.TabIndex = 0
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "สำหรับเปลี่ยนแปลงแก้ไข เกรด"
        '
        'BnExit
        '
        Me.BnExit.Location = New System.Drawing.Point(368, 280)
        Me.BnExit.Name = "BnExit"
        Me.BnExit.Size = New System.Drawing.Size(96, 48)
        Me.BnExit.TabIndex = 9
        Me.BnExit.Text = "Exit"
        '
        'BnEdit
        '
        Me.BnEdit.Location = New System.Drawing.Point(264, 280)
        Me.BnEdit.Name = "BnEdit"
        Me.BnEdit.Size = New System.Drawing.Size(96, 48)
        Me.BnEdit.TabIndex = 8
        Me.BnEdit.Text = "แก้ไขเกรด"
        '
        'GroupBox3
        '
        Me.GroupBox3.Controls.Add(Me.CheckNone)
        Me.GroupBox3.Controls.Add(Me.NewGrade1)
        Me.GroupBox3.Controls.Add(Me.NewGrade)
        Me.GroupBox3.Location = New System.Drawing.Point(8, 200)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(456, 72)
        Me.GroupBox3.TabIndex = 7
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "เกรด ที่จะทำการแก้ไข"
        '
        'NewGrade1
        '
        Me.NewGrade1.Location = New System.Drawing.Point(392, 32)
        Me.NewGrade1.Name = "NewGrade1"
        Me.NewGrade1.Size = New System.Drawing.Size(56, 24)
        Me.NewGrade1.TabIndex = 2
        Me.NewGrade1.Text = ""
        '
        'NewGrade
        '
        Me.NewGrade.Location = New System.Drawing.Point(8, 32)
        Me.NewGrade.Name = "NewGrade"
        Me.NewGrade.Size = New System.Drawing.Size(312, 24)
        Me.NewGrade.TabIndex = 1
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.OldGrade1)
        Me.GroupBox2.Controls.Add(Me.OldGrade)
        Me.GroupBox2.Location = New System.Drawing.Point(8, 120)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(456, 72)
        Me.GroupBox2.TabIndex = 6
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "เกรด วิชาเดิม"
        '
        'OldGrade1
        '
        Me.OldGrade1.ForeColor = System.Drawing.Color.DarkOrange
        Me.OldGrade1.Location = New System.Drawing.Point(392, 32)
        Me.OldGrade1.Name = "OldGrade1"
        Me.OldGrade1.Size = New System.Drawing.Size(56, 23)
        Me.OldGrade1.TabIndex = 1
        '
        'OldGrade
        '
        Me.OldGrade.Location = New System.Drawing.Point(8, 32)
        Me.OldGrade.Name = "OldGrade"
        Me.OldGrade.Size = New System.Drawing.Size(384, 24)
        Me.OldGrade.TabIndex = 0
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(16, 104)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(448, 23)
        Me.Label3.TabIndex = 5
        Me.Label3.Text = "-----------------------------------------------------------------------"
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(16, 56)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(96, 23)
        Me.Label2.TabIndex = 4
        Me.Label2.Text = "ชื่อ - นามสกุล :"
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(16, 32)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(96, 23)
        Me.Label1.TabIndex = 3
        Me.Label1.Text = "รหัสนักศึกษา :"
        '
        'Std_term
        '
        Me.Std_term.Location = New System.Drawing.Point(16, 80)
        Me.Std_term.Name = "Std_term"
        Me.Std_term.Size = New System.Drawing.Size(448, 23)
        Me.Std_term.TabIndex = 2
        '
        'StdName
        '
        Me.StdName.Location = New System.Drawing.Point(112, 56)
        Me.StdName.Name = "StdName"
        Me.StdName.Size = New System.Drawing.Size(304, 23)
        Me.StdName.TabIndex = 1
        '
        'StdId
        '
        Me.StdId.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.StdId.Location = New System.Drawing.Point(112, 32)
        Me.StdId.Name = "StdId"
        Me.StdId.Size = New System.Drawing.Size(272, 23)
        Me.StdId.TabIndex = 0
        '
        'CheckNone
        '
        Me.CheckNone.Location = New System.Drawing.Point(320, 32)
        Me.CheckNone.Name = "CheckNone"
        Me.CheckNone.Size = New System.Drawing.Size(64, 24)
        Me.CheckNone.TabIndex = 3
        Me.CheckNone.Text = "None"
        '
        'EditGrade
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.ClientSize = New System.Drawing.Size(488, 390)
        Me.Controls.Add(Me.GroupBox1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.IsMdiContainer = True
        Me.Name = "EditGrade"
        Me.Text = "เพิ่มและ แก้ไข เกรด"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox2.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable
    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"


    Private Sub EditGrade_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With
        StdId.Text = Student_ID
        StdName.Text = thaiNM + "  " + ThaiSurNM
        Std_term.Text = "ภาคการศึกษาที่    " + LinkGrade2 + "   ปีการศึกษา  " + LinkGrade1
        OldGrade.Text = LinkGrade3 + "   " + LinkGrade5
        OldGrade1.Text = LinkGrade4
        NewGrade.Text = OldGrade.Text
        BnEdit.Enabled = False

    End Sub

    Private Sub BnExit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BnExit.Click
        Me.Close()
    End Sub

    Private Sub BnEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BnEdit.Click
        Dim sql As String = ""
        If MessageBox.Show("ต้องการแก้ไขข้อมูลเกรด จาก เกรด        " + LinkGrade4 + "     เป็นเกรด        " + NewGrade1.Text, "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
            If CheckNone.Checked Then
                sql = "Update Registry set Reg_Grade = '" + CheckNone.Text + "'"
            Else
                sql = "Update Registry set Reg_Grade = '" + NewGrade1.Text.ToUpper + "'"
            End If

            sql = sql + " where Std_ID ='" + Student_ID + "'"
            sql = sql + " and Reg_TERM = '" + LinkGrade2 + "'"
            sql = sql + " and Reg_YEAR = '" + LinkGrade1 + "'"
            sql = sql + " and Subj_ID = '" + LinkGrade3 + "'"
            da = New SqlDataAdapter(sql, Conn)
            ds.Tables.Clear()
            da.Fill(ds, "Update")
            Me.Close()
        End If
    End Sub

    Private Sub NewGrade1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NewGrade1.TextChanged
        If NewGrade1.Text <> "" Then
            BnEdit.Enabled = True
        Else
            BnEdit.Enabled = False
        End If
        Dim newStr As String = NewGrade1.Text.ToUpper
        If newStr <> "" Then
            If CheckInput(newStr) Then
            Else
                MessageBox.Show("กรุณาใส่ ข้อมูล ให้ถูกต้อง", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                NewGrade1.Text = ""
            End If
        End If
    End Sub
    Private Function CheckInput(ByVal data As String) As Boolean
        Select Case data
            Case "F"
                Return True
            Case "D"
                Return True
            Case "D+"
                Return True
            Case "C"
                Return True
            Case "C+"
                Return True
            Case "B"
                Return True
            Case "B+"
                Return True
            Case "A"
                Return True
        End Select
        Return False
    End Function

    Private Sub CheckNone_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckNone.CheckedChanged
        If CheckNone.Checked Then
            NewGrade1.Enabled = False
            NewGrade1.Text = ""
            BnEdit.Enabled = True
        Else
            NewGrade1.Enabled = True
            BnEdit.Enabled = False
            NewGrade1.Focus()
        End If
    End Sub
End Class
