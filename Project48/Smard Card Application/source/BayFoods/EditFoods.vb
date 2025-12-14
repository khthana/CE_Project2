Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Imports System.Text
Public Class EditFoods
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
    Friend WithEvents ClrAll As System.Windows.Forms.Button
    Friend WithEvents BnExit As System.Windows.Forms.Button
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents BAdd As System.Windows.Forms.Button
    Friend WithEvents TxtCost As System.Windows.Forms.TextBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents TxtFoodName As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents TxtCode As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents GridShow As System.Windows.Forms.DataGrid
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.ClrAll = New System.Windows.Forms.Button
        Me.BnExit = New System.Windows.Forms.Button
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.GridShow = New System.Windows.Forms.DataGrid
        Me.BAdd = New System.Windows.Forms.Button
        Me.TxtCost = New System.Windows.Forms.TextBox
        Me.Label3 = New System.Windows.Forms.Label
        Me.TxtFoodName = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.TxtCode = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.GroupBox1.SuspendLayout()
        CType(Me.GridShow, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'ClrAll
        '
        Me.ClrAll.Location = New System.Drawing.Point(360, 395)
        Me.ClrAll.Name = "ClrAll"
        Me.ClrAll.Size = New System.Drawing.Size(104, 40)
        Me.ClrAll.TabIndex = 6
        Me.ClrAll.Text = "ClearAll"
        '
        'BnExit
        '
        Me.BnExit.Location = New System.Drawing.Point(472, 395)
        Me.BnExit.Name = "BnExit"
        Me.BnExit.Size = New System.Drawing.Size(104, 40)
        Me.BnExit.TabIndex = 5
        Me.BnExit.Text = "Exit"
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.GridShow)
        Me.GroupBox1.Controls.Add(Me.BAdd)
        Me.GroupBox1.Controls.Add(Me.TxtCost)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Controls.Add(Me.TxtFoodName)
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Controls.Add(Me.TxtCode)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Location = New System.Drawing.Point(8, 3)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(568, 384)
        Me.GroupBox1.TabIndex = 4
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "ลบ และ แก้ไข เมนู อาหาร"
        '
        'GridShow
        '
        Me.GridShow.CaptionBackColor = System.Drawing.Color.DarkSeaGreen
        Me.GridShow.DataMember = ""
        Me.GridShow.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.GridShow.Location = New System.Drawing.Point(8, 88)
        Me.GridShow.Name = "GridShow"
        Me.GridShow.Size = New System.Drawing.Size(552, 288)
        Me.GridShow.TabIndex = 8
        '
        'BAdd
        '
        Me.BAdd.Location = New System.Drawing.Point(480, 56)
        Me.BAdd.Name = "BAdd"
        Me.BAdd.Size = New System.Drawing.Size(80, 24)
        Me.BAdd.TabIndex = 7
        Me.BAdd.Text = "Edit"
        '
        'TxtCost
        '
        Me.TxtCost.Location = New System.Drawing.Point(376, 56)
        Me.TxtCost.Name = "TxtCost"
        Me.TxtCost.TabIndex = 6
        Me.TxtCost.Text = ""
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(376, 32)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(40, 23)
        Me.Label3.TabIndex = 5
        Me.Label3.Text = "ราคา"
        '
        'TxtFoodName
        '
        Me.TxtFoodName.Location = New System.Drawing.Point(120, 56)
        Me.TxtFoodName.Name = "TxtFoodName"
        Me.TxtFoodName.Size = New System.Drawing.Size(248, 24)
        Me.TxtFoodName.TabIndex = 4
        Me.TxtFoodName.Text = ""
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(120, 32)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(64, 23)
        Me.Label2.TabIndex = 3
        Me.Label2.Text = "ชื่ออาหาร"
        '
        'TxtCode
        '
        Me.TxtCode.Location = New System.Drawing.Point(8, 56)
        Me.TxtCode.Name = "TxtCode"
        Me.TxtCode.TabIndex = 2
        Me.TxtCode.Text = ""
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(8, 32)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(72, 23)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "รหัสอาหาร"
        '
        'EditFoods
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.ClientSize = New System.Drawing.Size(584, 446)
        Me.Controls.Add(Me.ClrAll)
        Me.Controls.Add(Me.BnExit)
        Me.Controls.Add(Me.GroupBox1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "EditFoods"
        Me.Text = "ลบ และ แก้ไข เมนูอาหาร"
        Me.GroupBox1.ResumeLayout(False)
        CType(Me.GridShow, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable


    Private Sub EditFoods_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        FormatDataGrid()

    End Sub

    Private Sub BnExit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BnExit.Click
        Me.Close()
    End Sub

    Private Sub FormatDataGrid()

        Dim sql As String = ""
        sql = "select * from Foods"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "foods")
        If ds.Tables("foods").Rows.Count = 0 Then
            With GridShow
                .ResetText()
            End With
            MessageBox.Show("ไม่มีข้อมูลในฐานข้อมูล กรุณาเพิ่มข้อมูล!", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Information)
            Me.Close()
        Else
            With GridShow
                '    .AllowNavigation = False
                '  .BackgroundColor = Color.White
                .ReadOnly = True
                .DataSource = ds.Tables("foods")
            End With

            Dim GrdTs As DataGridTableStyle = New DataGridTableStyle
            With GrdTs
                .AlternatingBackColor = Color.White
                .BackColor = Color.WhiteSmoke
                .MappingName = "foods"
            End With

            Dim cs1 As New DataGridTextBoxColumn
            With cs1
                .HeaderText = "รหัสอาหาร"
                .MappingName = "FoodID"
                .ReadOnly = True
                .Width = 100
            End With
            GrdTs.GridColumnStyles.Add(cs1)

            Dim cs2 As New DataGridTextBoxColumn
            With cs2
                .HeaderText = "ชื่ออาหาร"
                .MappingName = "FoodName"
                .ReadOnly = True
                .Width = 300
            End With
            GrdTs.GridColumnStyles.Add(cs2)

            Dim cs3 As New DataGridTextBoxColumn
            With cs3
                .HeaderText = "ราคา"
                .MappingName = "FoodCost"
                .ReadOnly = True
                .Width = 90
            End With
            GrdTs.GridColumnStyles.Add(cs3)

            With GridShow
                .TableStyles.Clear()
                '.CaptionFont = New Font("MS Sans Serif", 10.0, FontStyle.Regular)
                .CaptionText = "รายการอาหารทั้งหมด"
                .FlatMode = True
                .TableStyles.Add(GrdTs)
            End With
        End If

    End Sub

    Private Sub GridShow_DoubleClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridShow.DoubleClick
        Dim index As Integer = 0
        Dim i As Integer = 0
        index = GridShow.CurrentRowIndex
        Dim Temp As String = GridShow.Item(index, 0)
        If MessageBox.Show("ต้องการลบเมนูรหัส   " + Temp + "  ใช่ หรือ ไม่ ", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
            Try
                Dim sql As String = ""
                sql = "Delete From Foods Where FoodID = " + Temp
                da.SelectCommand.CommandText = sql
                da.Fill(ds, "del")
                FormatDataGrid()
            Catch ex As Exception
                MsgBox("มีข้อผิดพลาดในการลบข้อมูล.")
            End Try
        End If

    End Sub

    Private Sub GridShow_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles GridShow.MouseUp
        Dim index As Integer = 0
        Dim i As Integer = 0
        index = GridShow.CurrentRowIndex
        Dim Temp As String = GridShow.Item(index, 0)
        TxtCode.Text = Temp
    End Sub

    Private Sub TxtCode_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TxtCode.TextChanged
        Dim sql As String = ""
        sql = "Select * from Foods where FoodID= " + TxtCode.Text
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Query")
        If ds.Tables("Query").Rows.Count <> 0 Then
            TxtFoodName.Text = ds.Tables("Query").Rows(0).Item("FoodName")
            TxtCost.Text = ds.Tables("Query").Rows(0).Item("FoodCost")
        Else
            TxtFoodName.Text = ""
            TxtCost.Text = ""
        End If
    End Sub

    Private Sub BAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BAdd.Click
        If TxtFoodName.Text <> "" And TxtCost.Text <> "" Then
            If MessageBox.Show("ต้องการแก้ไขเมนูรหัส   " + TxtCode.Text + "  ใช่ หรือ ไม่ ", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
                Dim sql As String = ""
                sql = "Update Foods set FoodName = '" + TxtFoodName.Text + "',FoodCost =" + TxtCost.Text
                sql = sql + " Where FoodID = " + TxtCode.Text
                da = New SqlDataAdapter(sql, Conn)
                da.Fill(ds, "Update")
                FormatDataGrid()
            End If
        End If

    End Sub

    Private Sub ClrAll_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ClrAll.Click
        If MessageBox.Show("ต้องการลบเมนูทั้งหมด  ใช่ หรือ ไม่ ", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
            Try
                Dim sql As String = ""
                sql = "Delete From Foods"
                da.SelectCommand.CommandText = sql
                da.Fill(ds, "del")
                FormatDataGrid()
            Catch ex As Exception
                MsgBox("มีข้อผิดพลาดในการลบข้อมูล.")
            End Try
        End If
    End Sub
End Class
