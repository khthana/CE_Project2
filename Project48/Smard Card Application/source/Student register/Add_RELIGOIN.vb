Option Explicit On 
Option Strict On
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Public Class Add_RELIGOIN
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
    Friend WithEvents CBOSelected As System.Windows.Forms.ComboBox
    Friend WithEvents addID As System.Windows.Forms.TextBox
    Friend WithEvents addName As System.Windows.Forms.TextBox
    Friend WithEvents DisplayMember As System.Windows.Forms.DataGrid
    Friend WithEvents BSave As System.Windows.Forms.Button
    Friend WithEvents BEdit As System.Windows.Forms.Button
    Friend WithEvents BDelete As System.Windows.Forms.Button
    Friend WithEvents BCancel As System.Windows.Forms.Button
    Friend WithEvents DataGridTableStyle1 As System.Windows.Forms.DataGridTableStyle
    Friend WithEvents DataGridTableStyle2 As System.Windows.Forms.DataGridTableStyle
    Friend WithEvents DataGridTableStyle3 As System.Windows.Forms.DataGridTableStyle
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label
        Me.CBOSelected = New System.Windows.Forms.ComboBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.addID = New System.Windows.Forms.TextBox
        Me.addName = New System.Windows.Forms.TextBox
        Me.DisplayMember = New System.Windows.Forms.DataGrid
        Me.DataGridTableStyle1 = New System.Windows.Forms.DataGridTableStyle
        Me.DataGridTableStyle2 = New System.Windows.Forms.DataGridTableStyle
        Me.DataGridTableStyle3 = New System.Windows.Forms.DataGridTableStyle
        Me.BSave = New System.Windows.Forms.Button
        Me.BEdit = New System.Windows.Forms.Button
        Me.BDelete = New System.Windows.Forms.Button
        Me.BCancel = New System.Windows.Forms.Button
        CType(Me.DisplayMember, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(16, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(120, 23)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "เลือกประเภทข้อมูล"
        '
        'CBOSelected
        '
        Me.CBOSelected.Location = New System.Drawing.Point(128, 16)
        Me.CBOSelected.Name = "CBOSelected"
        Me.CBOSelected.Size = New System.Drawing.Size(168, 26)
        Me.CBOSelected.TabIndex = 1
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(16, 56)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(32, 23)
        Me.Label2.TabIndex = 2
        Me.Label2.Text = "รหัส"
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(128, 56)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(24, 23)
        Me.Label3.TabIndex = 3
        Me.Label3.Text = "ชื่อ"
        '
        'addID
        '
        Me.addID.Location = New System.Drawing.Point(16, 80)
        Me.addID.Name = "addID"
        Me.addID.Size = New System.Drawing.Size(104, 24)
        Me.addID.TabIndex = 4
        Me.addID.Text = ""
        '
        'addName
        '
        Me.addName.Location = New System.Drawing.Point(128, 80)
        Me.addName.Name = "addName"
        Me.addName.Size = New System.Drawing.Size(240, 24)
        Me.addName.TabIndex = 5
        Me.addName.Text = ""
        '
        'DisplayMember
        '
        Me.DisplayMember.BackColor = System.Drawing.SystemColors.GrayText
        Me.DisplayMember.BackgroundColor = System.Drawing.Color.LightGray
        Me.DisplayMember.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.DisplayMember.CaptionBackColor = System.Drawing.SystemColors.GrayText
        Me.DisplayMember.DataMember = ""
        Me.DisplayMember.FlatMode = True
        Me.DisplayMember.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.DisplayMember.Location = New System.Drawing.Point(16, 112)
        Me.DisplayMember.Name = "DisplayMember"
        Me.DisplayMember.Size = New System.Drawing.Size(352, 192)
        Me.DisplayMember.TabIndex = 6
        Me.DisplayMember.TableStyles.AddRange(New System.Windows.Forms.DataGridTableStyle() {Me.DataGridTableStyle1, Me.DataGridTableStyle2, Me.DataGridTableStyle3})
        '
        'DataGridTableStyle1
        '
        Me.DataGridTableStyle1.DataGrid = Me.DisplayMember
        Me.DataGridTableStyle1.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.DataGridTableStyle1.MappingName = ""
        '
        'DataGridTableStyle2
        '
        Me.DataGridTableStyle2.DataGrid = Me.DisplayMember
        Me.DataGridTableStyle2.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.DataGridTableStyle2.MappingName = ""
        '
        'DataGridTableStyle3
        '
        Me.DataGridTableStyle3.DataGrid = Me.DisplayMember
        Me.DataGridTableStyle3.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.DataGridTableStyle3.MappingName = ""
        '
        'BSave
        '
        Me.BSave.BackColor = System.Drawing.Color.PowderBlue
        Me.BSave.Location = New System.Drawing.Point(384, 80)
        Me.BSave.Name = "BSave"
        Me.BSave.Size = New System.Drawing.Size(112, 48)
        Me.BSave.TabIndex = 7
        Me.BSave.Text = "เพิ่มข้อมูล"
        '
        'BEdit
        '
        Me.BEdit.BackColor = System.Drawing.Color.LightYellow
        Me.BEdit.Location = New System.Drawing.Point(384, 136)
        Me.BEdit.Name = "BEdit"
        Me.BEdit.Size = New System.Drawing.Size(112, 48)
        Me.BEdit.TabIndex = 8
        Me.BEdit.Text = "แก้ไขข้อมูล"
        '
        'BDelete
        '
        Me.BDelete.BackColor = System.Drawing.Color.DarkKhaki
        Me.BDelete.Location = New System.Drawing.Point(384, 192)
        Me.BDelete.Name = "BDelete"
        Me.BDelete.Size = New System.Drawing.Size(112, 48)
        Me.BDelete.TabIndex = 9
        Me.BDelete.Text = "ลบข้อมูล"
        '
        'BCancel
        '
        Me.BCancel.BackColor = System.Drawing.Color.Gray
        Me.BCancel.ForeColor = System.Drawing.SystemColors.ControlText
        Me.BCancel.Location = New System.Drawing.Point(384, 256)
        Me.BCancel.Name = "BCancel"
        Me.BCancel.Size = New System.Drawing.Size(112, 48)
        Me.BCancel.TabIndex = 10
        Me.BCancel.Text = "จบการทำงาน"
        '
        'Add_RELIGOIN
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.Color.LightSteelBlue
        Me.ClientSize = New System.Drawing.Size(504, 317)
        Me.Controls.Add(Me.BCancel)
        Me.Controls.Add(Me.BDelete)
        Me.Controls.Add(Me.BEdit)
        Me.Controls.Add(Me.BSave)
        Me.Controls.Add(Me.DisplayMember)
        Me.Controls.Add(Me.addName)
        Me.Controls.Add(Me.addID)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.CBOSelected)
        Me.Controls.Add(Me.Label1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "Add_RELIGOIN"
        Me.Text = "ข้อมูล สัญชาติ เชื้อชาติ ศาสนา"
        CType(Me.DisplayMember, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Dim Data_Combo As String = ""

    Private Sub Add_RELIGOIN_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Normal
        Cursor.Current = Cursors.WaitCursor

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        With CBOSelected
            .Items.Add("ศาสนา")
            .Items.Add("เชื้อชาติ")
            .Items.Add("สัญชาติ")
            .SelectedIndex = 0
        End With

        BSave.Enabled = True
        BEdit.Enabled = False
        BDelete.Enabled = False
    End Sub

    Private Sub FormatDataGrid(ByVal sql As String, ByVal DataFill As String, ByVal Code As String)

        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "DataSelect")
        If ds.Tables("DataSelect").Rows.Count = 0 Then
            MsgBox("No Record 0 Rows!")
        End If

        With DisplayMember
            .AllowNavigation = False
            .BackgroundColor = Color.White
            .ReadOnly = True
            .DataSource = ds.Tables("DataSelect")
        End With

        Dim GrdTs As DataGridTableStyle = New DataGridTableStyle
        With GrdTs
            .AlternatingBackColor = Color.LightBlue
            .BackColor = Color.White
            .MappingName = "DataSelect"
        End With

        Dim cs1 As New DataGridTextBoxColumn
        With cs1
            .HeaderText = "รหัส"
            .MappingName = Code
            .ReadOnly = True
            .Width = 100
        End With
        GrdTs.GridColumnStyles.Add(cs1)

        Dim cs2 As New DataGridTextBoxColumn
        With cs2
            .HeaderText = "ชื่อ"
            .MappingName = DataFill
            .ReadOnly = True
            .Width = 210
        End With
        GrdTs.GridColumnStyles.Add(cs2)

        With DisplayMember
            .TableStyles.Clear()
            .CaptionFont = New Font("MS Sans Serif", 10.0, FontStyle.Regular)
            .CaptionText = "รายการทั้งหมด"
            .FlatMode = True
            .TableStyles.Add(GrdTs)
        End With

    End Sub

    Private Sub CBOSelected_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CBOSelected.SelectedIndexChanged
        addID.Clear()
        addName.Clear()
        BSave.Enabled = True
        BEdit.Enabled = False
        BDelete.Enabled = False
        showGrids()
    End Sub
    Private Sub showGrids()
        Dim sql As String = ""
        Dim Table As String = ""
        Dim Code As String = ""

        Data_Combo = CBOSelected.Text
        If Data_Combo = "ศาสนา" Then
            sql = "Select * from Religion"
            Table = "REL_NM"
            Code = "Std_RELIGION"
        ElseIf Data_Combo = "เชื้อชาติ" Then
            sql = "Select * from Original"
            Table = "OR_NM"
            Code = "Std_ORIGIN"
        ElseIf Data_Combo = "สัญชาติ" Then
            sql = "Select * from Nationality"
            Table = "NAT_NM"
            Code = "Std_NATIONALITY"
        End If
        DisplayMember.TableStyles.Clear()
        FormatDataGrid(sql, Table, Code)
    End Sub

    Private Sub addID_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles addID.TextChanged


        Dim sql As String = ""
        Dim Temp As String = ""
        Dim Temp1 As String = ""

        Data_Combo = CBOSelected.Text

        If addID.Text <> "" Then

            If Data_Combo = "ศาสนา" Then
                sql = "Select * from Religion where Std_RELIGION = " & addID.Text
                Temp = "DataSelect.REL_NM"
                Temp1 = "REL_NM"
            ElseIf Data_Combo = "เชื้อชาติ" Then
                sql = "Select * from Original where Std_ORIGIN = " & addID.Text
                Temp = "DataSelect.OR_NM"
                Temp1 = "OR_NM"
            ElseIf Data_Combo = "สัญชาติ" Then
                sql = "Select * from Nationality where Std_NATIONALITY = " & addID.Text
                Temp = "DataSelect.NAT_NM"
                Temp1 = "NAT_NM"
            End If

            da = New SqlDataAdapter(sql, Conn)
            ds.Tables.Clear()
            da.Fill(ds, "DataSelect")

            If ds.Tables("DataSelect").Rows.Count <> 0 Then
                addName.Text = CStr(ds.Tables("DataSelect").Rows(0).Item(Temp1))
                BEdit.Enabled = True
                BDelete.Enabled = True
                BSave.Enabled = False
            Else
                addName.Clear()
                BEdit.Enabled = False
                BDelete.Enabled = False
                BSave.Enabled = True
            End If
        End If

    End Sub

    Private Sub BSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BSave.Click
        Dim Data_Combo As String = ""
        Dim sql As String = ""

        If addID.Text <> "" And addName.Text <> "" Then

            Data_Combo = CBOSelected.Text
            If Data_Combo = "ศาสนา" Then
                sql = "Insert into Religion(Std_RELIGION,REL_NM)values(" + addID.Text + ",'" + addName.Text + "')"
            ElseIf Data_Combo = "เชื้อชาติ" Then
                sql = "Insert into Original(Std_ORIGIN,RO_NM)values(" + addID.Text + ",'" + addName.Text + "')"
            ElseIf Data_Combo = "สัญชาติ" Then
                sql = "Insert into Nationality(Std_NATIONALITY,NAT_NM)values(" + addID.Text + ",'" + addName.Text + "')"
            End If

            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "insert")
            showGrids()
        Else
            MsgBox("กรุณาใส่ข้อมูลให้ครบดัวยครับ ")
        End If

    End Sub

    Private Sub BEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BEdit.Click
        Dim sql As String = ""
        If addID.Text <> "" And addName.Text <> "" Then

            Data_Combo = CBOSelected.Text
            If Data_Combo = "ศาสนา" Then
                sql = "Update Religion set REL_NM = '" + addName.Text + "' where Std_RELIGION = " + addID.Text
            ElseIf Data_Combo = "เชื้อชาติ" Then
                sql = "Update Original set OR_NM = '" + addName.Text + "' where Std_ORIGIN = " + addID.Text
            ElseIf Data_Combo = "สัญชาติ" Then
                sql = "Update Nationality set NAT_NM = '" + addName.Text + "' where Std_NATIONALITY = " + addID.Text
            End If

            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Edit")
            showGrids()
        Else
            MsgBox("กรุณาใส่ข้อมูลให้ครบดัวยครับ ")
        End If
    End Sub

    Private Sub BDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BDelete.Click
        Dim sql As String = ""
        If addID.Text <> "" And addName.Text <> "" Then

            Data_Combo = CBOSelected.Text
            If Data_Combo = "ศาสนา" Then
                sql = "Delete from Religion where Std_RELIGION = " + addID.Text
            ElseIf Data_Combo = "เชื้อชาติ" Then
                sql = "Delete from Original where Std_ORIGIN = " + addID.Text
            ElseIf Data_Combo = "สัญชาติ" Then
                sql = "Delete from Nationality where Std_NATIONALITY = " + addID.Text
            End If

            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Delete")
            showGrids()
            addID.Clear()
            addName.Clear()
        Else
            MsgBox("กรุณาใส่ข้อมูลให้ครบดัวยครับ ")
        End If
    End Sub

    Private Sub BCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BCancel.Click
        Me.Close()
    End Sub

End Class
