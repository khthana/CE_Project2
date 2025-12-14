Option Explicit On 
'Option Strict On
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Public Class Add_SUBJECT
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
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents BSearch As System.Windows.Forms.Button
    Friend WithEvents CboSubState As System.Windows.Forms.ComboBox
    Friend WithEvents SubjID As System.Windows.Forms.TextBox
    Friend WithEvents Credit As System.Windows.Forms.TextBox
    Friend WithEvents CboDepart As System.Windows.Forms.ComboBox
    Friend WithEvents GridShow As System.Windows.Forms.DataGrid
    Friend WithEvents BAdd As System.Windows.Forms.Button
    Friend WithEvents BDelete As System.Windows.Forms.Button
    Friend WithEvents BCancel As System.Windows.Forms.Button
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Factory As System.Windows.Forms.ComboBox
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.Factory = New System.Windows.Forms.ComboBox
        Me.Label6 = New System.Windows.Forms.Label
        Me.BSearch = New System.Windows.Forms.Button
        Me.CboSubState = New System.Windows.Forms.ComboBox
        Me.Label4 = New System.Windows.Forms.Label
        Me.SubjID = New System.Windows.Forms.TextBox
        Me.Label3 = New System.Windows.Forms.Label
        Me.Credit = New System.Windows.Forms.TextBox
        Me.CboDepart = New System.Windows.Forms.ComboBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.GridShow = New System.Windows.Forms.DataGrid
        Me.BAdd = New System.Windows.Forms.Button
        Me.BDelete = New System.Windows.Forms.Button
        Me.BCancel = New System.Windows.Forms.Button
        Me.GroupBox1.SuspendLayout()
        CType(Me.GridShow, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.Factory)
        Me.GroupBox1.Controls.Add(Me.Label6)
        Me.GroupBox1.Controls.Add(Me.BSearch)
        Me.GroupBox1.Controls.Add(Me.CboSubState)
        Me.GroupBox1.Controls.Add(Me.Label4)
        Me.GroupBox1.Controls.Add(Me.SubjID)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Controls.Add(Me.Credit)
        Me.GroupBox1.Controls.Add(Me.CboDepart)
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GroupBox1.ForeColor = System.Drawing.SystemColors.Desktop
        Me.GroupBox1.Location = New System.Drawing.Point(16, 8)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(432, 176)
        Me.GroupBox1.TabIndex = 0
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "ค้นข้อมูล"
        '
        'Factory
        '
        Me.Factory.BackColor = System.Drawing.Color.WhiteSmoke
        Me.Factory.Location = New System.Drawing.Point(96, 72)
        Me.Factory.Name = "Factory"
        Me.Factory.Size = New System.Drawing.Size(200, 26)
        Me.Factory.TabIndex = 10
        '
        'Label6
        '
        Me.Label6.Location = New System.Drawing.Point(32, 72)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(64, 23)
        Me.Label6.TabIndex = 9
        Me.Label6.Text = "คณะวิชาฯ"
        '
        'BSearch
        '
        Me.BSearch.BackColor = System.Drawing.Color.PowderBlue
        Me.BSearch.Location = New System.Drawing.Point(320, 104)
        Me.BSearch.Name = "BSearch"
        Me.BSearch.Size = New System.Drawing.Size(96, 56)
        Me.BSearch.TabIndex = 8
        Me.BSearch.Text = "ค้นหา"
        '
        'CboSubState
        '
        Me.CboSubState.BackColor = System.Drawing.Color.WhiteSmoke
        Me.CboSubState.Location = New System.Drawing.Point(96, 136)
        Me.CboSubState.Name = "CboSubState"
        Me.CboSubState.Size = New System.Drawing.Size(200, 26)
        Me.CboSubState.TabIndex = 7
        '
        'Label4
        '
        Me.Label4.Location = New System.Drawing.Point(16, 136)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(80, 23)
        Me.Label4.TabIndex = 6
        Me.Label4.Text = "ประเภทวิชา"
        '
        'SubjID
        '
        Me.SubjID.BackColor = System.Drawing.Color.WhiteSmoke
        Me.SubjID.Location = New System.Drawing.Point(96, 24)
        Me.SubjID.Name = "SubjID"
        Me.SubjID.Size = New System.Drawing.Size(160, 24)
        Me.SubjID.TabIndex = 5
        Me.SubjID.Text = ""
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(40, 24)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(56, 23)
        Me.Label3.TabIndex = 4
        Me.Label3.Text = "รหัสวิชา"
        '
        'Credit
        '
        Me.Credit.BackColor = System.Drawing.Color.WhiteSmoke
        Me.Credit.Location = New System.Drawing.Point(320, 24)
        Me.Credit.Name = "Credit"
        Me.Credit.Size = New System.Drawing.Size(96, 24)
        Me.Credit.TabIndex = 3
        Me.Credit.Text = ""
        '
        'CboDepart
        '
        Me.CboDepart.BackColor = System.Drawing.Color.WhiteSmoke
        Me.CboDepart.Location = New System.Drawing.Point(96, 104)
        Me.CboDepart.Name = "CboDepart"
        Me.CboDepart.Size = New System.Drawing.Size(200, 26)
        Me.CboDepart.TabIndex = 2
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(264, 24)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(56, 23)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "หน่วยกิจ"
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(32, 104)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(64, 23)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "ภาควิชาฯ"
        '
        'Label5
        '
        Me.Label5.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label5.ForeColor = System.Drawing.Color.Blue
        Me.Label5.Location = New System.Drawing.Point(16, 192)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(104, 23)
        Me.Label5.TabIndex = 1
        Me.Label5.Text = "ข้อมูลที่ทำการค้น"
        '
        'GridShow
        '
        Me.GridShow.DataMember = ""
        Me.GridShow.GridLineColor = System.Drawing.SystemColors.Desktop
        Me.GridShow.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.GridShow.Location = New System.Drawing.Point(16, 216)
        Me.GridShow.Name = "GridShow"
        Me.GridShow.Size = New System.Drawing.Size(432, 216)
        Me.GridShow.TabIndex = 2
        '
        'BAdd
        '
        Me.BAdd.BackColor = System.Drawing.Color.MistyRose
        Me.BAdd.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BAdd.Location = New System.Drawing.Point(456, 216)
        Me.BAdd.Name = "BAdd"
        Me.BAdd.Size = New System.Drawing.Size(88, 40)
        Me.BAdd.TabIndex = 3
        Me.BAdd.Text = "เพิ่มรายวิชา"
        '
        'BDelete
        '
        Me.BDelete.BackColor = System.Drawing.Color.DarkGray
        Me.BDelete.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.BDelete.Location = New System.Drawing.Point(456, 264)
        Me.BDelete.Name = "BDelete"
        Me.BDelete.Size = New System.Drawing.Size(88, 40)
        Me.BDelete.TabIndex = 4
        Me.BDelete.Text = "ลบรายวิชา"
        '
        'BCancel
        '
        Me.BCancel.BackColor = System.Drawing.Color.RosyBrown
        Me.BCancel.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.BCancel.Location = New System.Drawing.Point(456, 392)
        Me.BCancel.Name = "BCancel"
        Me.BCancel.Size = New System.Drawing.Size(88, 40)
        Me.BCancel.TabIndex = 5
        Me.BCancel.Text = "ยกเลิก"
        '
        'Add_SUBJECT
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.BackColor = System.Drawing.Color.White
        Me.ClientSize = New System.Drawing.Size(552, 437)
        Me.Controls.Add(Me.BCancel)
        Me.Controls.Add(Me.BDelete)
        Me.Controls.Add(Me.BAdd)
        Me.Controls.Add(Me.GridShow)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.GroupBox1)
        Me.Name = "Add_SUBJECT"
        Me.Text = "ข้อมูลรายวิชา"
        Me.GroupBox1.ResumeLayout(False)
        CType(Me.GridShow, System.ComponentModel.ISupportInitialize).EndInit()
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
    Dim LikeID As String = ""

    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"

    Private Sub Add_SUBJECT_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load


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
        BDelete.Enabled = False
    End Sub

    Private Sub FormatDataGrid()

        Dim sql As String = ""
        If LikeID = "" Then
            sql = "Select * from Subject a,Department b,Type_SUBJ c,Factory d where a.Sta_DIV = b.Sta_DIV And a.subj_TYPE = c.Subj_TYPE And b.Sta_FACT = d.Sta_FACT and b.NAME = '" + CboDepart.Text + "' and c.Type_NM = '" + CboSubState.Text + "'"
        Else
            sql = "Select * from Subject a,Department b,Type_SUBJ c,Factory d where a.Sta_DIV = b.Sta_DIV And a.subj_TYPE = c.Subj_TYPE And b.Sta_FACT = d.Sta_FACT And Subj_ID Like '" + LikeID + "%' and b.NAME = '" + CboDepart.Text + "' and c.Type_NM = '" + CboSubState.Text + "'"
        End If
        'sql = "Select * from Subject a,Department b,Type_SUBJ c where a.Sta_DIV = b.Sta_DIV and a.subj_TYPE = c.Subj_TYPE and Subj_ID = " + Subj_ID.Text

        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "DataSelect")
        If ds.Tables("DataSelect").Rows.Count = 0 Then

            'MsgBox(" ไม่มีข้อมูล  No Record 0 Rows!")
        End If

        With GridShow
            .AllowNavigation = False
            .BackgroundColor = Color.White
            .ReadOnly = True
            .DataSource = ds.Tables("DataSelect")
        End With

        Dim GrdTs As DataGridTableStyle = New DataGridTableStyle
        With GrdTs
            .AlternatingBackColor = Color.LightSteelBlue
            .BackColor = Color.WhiteSmoke
            .MappingName = "DataSelect"
        End With

        Dim cs1 As New DataGridTextBoxColumn
        With cs1
            .HeaderText = "รหัสวิชา"
            .MappingName = "Subj_ID"
            .ReadOnly = True
            .Width = 100
        End With
        GrdTs.GridColumnStyles.Add(cs1)

        Dim cs2 As New DataGridTextBoxColumn
        With cs2
            .HeaderText = "ชื่อวิชา"
            .MappingName = "Subj_NM"
            .ReadOnly = True
            .Width = 120
        End With
        GrdTs.GridColumnStyles.Add(cs2)

        Dim cs3 As New DataGridTextBoxColumn
        With cs3
            .HeaderText = "หน่วยกิต"
            .MappingName = "Subj_CRETDIT"
            .ReadOnly = True
            .Width = 50
        End With
        GrdTs.GridColumnStyles.Add(cs3)

        Dim cs4 As New DataGridTextBoxColumn
        With cs4
            .HeaderText = "ประเภทวิชา"
            .MappingName = "Type_NM"
            .ReadOnly = True
            .Width = 120
        End With
        GrdTs.GridColumnStyles.Add(cs4)

        With GridShow
            .TableStyles.Clear()
            '.CaptionFont = New Font("MS Sans Serif", 10.0, FontStyle.Regular)
            .CaptionText = "ตารางรายวิชา"
            .FlatMode = True
            .TableStyles.Add(GrdTs)
        End With
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

    Private Sub forTypeSubject()
        Dim sql As String = ""
        sql = "Select * from Type_SUBJ"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "TypeSub")
        If ds.Tables("TypeSub").Rows.Count <> 0 Then
            With CboSubState
                .DataSource = ds.Tables("TypeSub")
                .DisplayMember = "Type_NM"
                .ValueMember = "Subj_TYPE"
            End With
        End If
    End Sub

    Private Sub forDepartment()
        Dim sql As String = ""
        sql = "Select * from Department where Sta_FACT = " + FactSel
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Depart")
        If ds.Tables("Depart").Rows.Count <> 0 Then
            With CboDepart
                .DataSource = ds.Tables("Depart")
                .DisplayMember = "NAME"
                .ValueMember = "Sta_DIV"
            End With
        End If
    End Sub

    Private Sub BCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BCancel.Click
        Me.Close()
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

    Private Sub SubjID_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SubjID.TextChanged
        LikeID = SubjID.Text
        If SubjID.Text <> "" Then
            Dim sql As String = ""
            sql = "Select * from Subject a,Department b,Type_SUBJ c,Factory d where a.Sta_DIV = b.Sta_DIV And a.subj_TYPE = c.Subj_TYPE And b.Sta_FACT = d.Sta_FACT And Subj_ID = '" + SubjID.Text + "'"
            'sql = "Select * from Subject a,Department b,Type_SUBJ c where a.Sta_DIV = b.Sta_DIV and a.subj_TYPE = c.Subj_TYPE and Subj_ID = " + Subj_ID.Text
            da = New SqlDataAdapter(sql, Conn)
            ds.Tables.Clear()
            da.Fill(ds, "DataSelect")

            If ds.Tables("DataSelect").Rows.Count <> 0 Then
                Credit.Text = CStr(ds.Tables("DataSelect").Rows(0).Item("Subj_CRETDIT"))

                CboSubState.SelectedIndex = CboSubState.FindString(CStr(ds.Tables("DataSelect").Rows(0).Item("Type_NM")))
                Dim data1 As String = CStr(ds.Tables("DataSelect").Rows(0).Item("Sta_FACT"))
                Dim data2 As String = CStr(ds.Tables("DataSelect").Rows(0).Item("Sta_DIV"))

                SetFact(data1)
                SetDepart(data2)
                BDelete.Enabled = True
                BAdd.Enabled = False
            Else
                Credit.Clear()
                BDelete.Enabled = False
                BAdd.Enabled = True
            End If
        Else
            Credit.Clear()
            BDelete.Enabled = False
            BAdd.Enabled = True
        End If
        FormatDataGrid()
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
            CboDepart.SelectedIndex = CboDepart.FindString(temp)
        End If
    End Sub

    Private Sub BSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BSearch.Click
        FormatDataGrid()
        BDelete.Enabled = False
    End Sub

    Private Sub BAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BAdd.Click
        Dim ShowDialog As New Subject_LINKED
        data_ID = ""
        If ShowDialog.ShowDialog Then
            FormatDataGrid()
        End If
    End Sub

    Private Sub GridShow_DoubleClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridShow.DoubleClick
        Dim index As Integer = 0
        index = GridShow.CurrentRowIndex
        data_ID = CStr(GridShow.Item(index, 0))
        Dim ShowDialog As New Subject_LINKED
        If ShowDialog.ShowDialog Then
            FormatDataGrid()
        End If
        data_ID = ""
    End Sub

    Private Sub BDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BDelete.Click
        Dim index As Integer = 0
        Dim DataDel As String = ""

        Dim sql As String = ""
        index = GridShow.CurrentRowIndex
        DataDel = CStr(GridShow.Item(index, 0))
        sql = "Delete From Subject Where Subj_ID = '" + DataDel + "'"
        If MessageBox.Show("ต้องการลบรหัสวิชา " + DataDel + "ออกจากฐานข้อมูล", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Del")
            BDelete.Enabled = False
            FormatDataGrid()
        End If
    End Sub

    Private Sub GridShow_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridShow.Click
        BDelete.Enabled = True
    End Sub

End Class
