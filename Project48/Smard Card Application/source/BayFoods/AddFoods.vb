Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Imports System.Text
Public Class AddFoods
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
    Friend WithEvents ListViewMenu As System.Windows.Forms.ListView
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents BnExit As System.Windows.Forms.Button
    Friend WithEvents TxtCode As System.Windows.Forms.TextBox
    Friend WithEvents TxtFoodName As System.Windows.Forms.TextBox
    Friend WithEvents TxtCost As System.Windows.Forms.TextBox
    Friend WithEvents BAdd As System.Windows.Forms.Button
    Friend WithEvents ClrAll As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.BAdd = New System.Windows.Forms.Button
        Me.TxtCost = New System.Windows.Forms.TextBox
        Me.Label3 = New System.Windows.Forms.Label
        Me.TxtFoodName = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.TxtCode = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.ListViewMenu = New System.Windows.Forms.ListView
        Me.BnExit = New System.Windows.Forms.Button
        Me.ClrAll = New System.Windows.Forms.Button
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.BAdd)
        Me.GroupBox1.Controls.Add(Me.TxtCost)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Controls.Add(Me.TxtFoodName)
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Controls.Add(Me.TxtCode)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Controls.Add(Me.ListViewMenu)
        Me.GroupBox1.Location = New System.Drawing.Point(16, 16)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(568, 384)
        Me.GroupBox1.TabIndex = 0
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "เพิ่มเมนู อาหาร"
        '
        'BAdd
        '
        Me.BAdd.Location = New System.Drawing.Point(480, 56)
        Me.BAdd.Name = "BAdd"
        Me.BAdd.Size = New System.Drawing.Size(80, 24)
        Me.BAdd.TabIndex = 7
        Me.BAdd.Text = "Add"
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
        Me.TxtCode.Enabled = False
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
        'ListViewMenu
        '
        Me.ListViewMenu.LabelEdit = True
        Me.ListViewMenu.Location = New System.Drawing.Point(8, 80)
        Me.ListViewMenu.Name = "ListViewMenu"
        Me.ListViewMenu.Size = New System.Drawing.Size(552, 296)
        Me.ListViewMenu.TabIndex = 0
        '
        'BnExit
        '
        Me.BnExit.Location = New System.Drawing.Point(480, 408)
        Me.BnExit.Name = "BnExit"
        Me.BnExit.Size = New System.Drawing.Size(104, 40)
        Me.BnExit.TabIndex = 2
        Me.BnExit.Text = "Exit"
        '
        'ClrAll
        '
        Me.ClrAll.Location = New System.Drawing.Point(368, 408)
        Me.ClrAll.Name = "ClrAll"
        Me.ClrAll.Size = New System.Drawing.Size(104, 40)
        Me.ClrAll.TabIndex = 3
        Me.ClrAll.Text = "ClearAll"
        '
        'AddFoods
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.ClientSize = New System.Drawing.Size(616, 462)
        Me.Controls.Add(Me.ClrAll)
        Me.Controls.Add(Me.BnExit)
        Me.Controls.Add(Me.GroupBox1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "AddFoods"
        Me.Text = "เพิ่มเมนูอาหาร"
        Me.GroupBox1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Private Sub AddFoods_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        GenCode()

        ClearItem()
    End Sub
    Private Sub ClearItem()
        ListViewMenu.Clear()
        ListViewMenu.Text = CStr(Money)
        ListViewMenu.Columns.Add("รหัสอาหาร", 100, HorizontalAlignment.Left)
        ListViewMenu.Columns.Add("ชื่ออาหาร", 350, HorizontalAlignment.Left)
        ListViewMenu.Columns.Add("ราคา", 100, HorizontalAlignment.Left)

        ListViewMenu.View = View.Details
        ListViewMenu.GridLines = True
    End Sub

    Private Sub BnExit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BnExit.Click
        Me.Close()
    End Sub
    Private Sub GenCode()
        Dim sql As String = ""
        sql = "Select * from Foods"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "QUERY")
        If ds.Tables("query").Rows.Count <> 0 Then
            sql = "Select Max(FoodID)as MaxFood From Foods"
            da = New SqlDataAdapter(sql, Conn)
            ds.Tables.Clear()
            da.Fill(ds, "MaxF")
            If ds.Tables("MaxF").Rows(0).Item("MaxFood") <> 0 Then
                Dim temp As Integer
                temp = ds.Tables("MaxF").Rows(0).Item("MaxFood")
                temp = temp + 1
                TxtCode.Text = CStr(temp)
            End If
        Else
            TxtCode.Text = "1000"
        End If

    End Sub

    Private Sub BAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BAdd.Click
        If TxtFoodName.Text <> "" And TxtCost.Text <> "" Then
            Try
                Dim sql As String = ""
                sql = "Insert into Foods(FoodID,FoodName,FoodCost) values(" + TxtCode.Text + ",'" + TxtFoodName.Text + "'," + TxtCost.Text + ")"
                da = New SqlDataAdapter(sql, Conn)
                ds.Tables.Clear()
                da.Fill(ds, "Insert")

                Dim AnyData() As String
                AnyData = New String() {TxtCode.Text, TxtFoodName.Text, TxtCost.Text}
                Dim Lview As ListViewItem
                Lview = New ListViewItem(AnyData)
                ListViewMenu.Items.Add(Lview)

                GenCode()
                TxtFoodName.Text = ""
                TxtCost.Text = ""
            Catch ex As Exception
                MsgBox("มีข้อผิดพลาดในการเพิ่มข้อมูล.")
            End Try

        Else
            MessageBox.Show("กรุณากรอกข้อมูลให้ครบ !", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
        End If
    End Sub

    Private Sub ListViewMenu_DoubleClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles ListViewMenu.DoubleClick
        Dim i As Integer
        For i = 0 To ListViewMenu.SelectedItems.Count - 1
            Dim tav As ListViewItem
            tav = ListViewMenu.SelectedItems(i)
            DeleteSub(tav)
            ListViewMenu.Items.Remove(tav)
        Next
    End Sub

    Private Function DeleteSub(ByVal Data As ListViewItem) As Boolean
        Dim montemp As String = Data.SubItems(0).Text
        Dim sql As String = ""
        Try
            sql = "Delete From Foods Where FoodID = " + montemp
            da.SelectCommand.CommandText = sql
            da.Fill(ds, "del")
        Catch ex As Exception
            MsgBox("มีข้อผิดพลาดในการลบข้อมูล.")
        End Try

    End Function

    Private Sub ClrAll_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ClrAll.Click

        If MessageBox.Show("ต้องการลบรายการทั้งหมดใน List ใช่ หรือ ไม่ ", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
            Dim Sql As String = ""
            Dim tempId As String = ""

            Dim i As Integer
            For i = 0 To ListViewMenu.Items.Count - 1
                tempId = ListViewMenu.Items(i).SubItems(0).Text
                Sql = "Delete From Foods Where FoodID = " + tempId
                da.SelectCommand.CommandText = Sql
                da.Fill(ds, "del")
            Next
            ClearItem()
            GenCode()
        End If
    End Sub
End Class
