Option Explicit On 
Option Strict On
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Public Class Add_DEPART
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
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents BCancel As System.Windows.Forms.Button
    Friend WithEvents BDelete As System.Windows.Forms.Button
    Friend WithEvents BEdit As System.Windows.Forms.Button
    Friend WithEvents BSave As System.Windows.Forms.Button
    Friend WithEvents Engname As System.Windows.Forms.TextBox
    Friend WithEvents Thainame As System.Windows.Forms.TextBox
    Friend WithEvents AddID As System.Windows.Forms.TextBox
    Friend WithEvents GridShow As System.Windows.Forms.DataGrid
    Friend WithEvents Facthai As System.Windows.Forms.ComboBox
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.BCancel = New System.Windows.Forms.Button
        Me.BDelete = New System.Windows.Forms.Button
        Me.BEdit = New System.Windows.Forms.Button
        Me.BSave = New System.Windows.Forms.Button
        Me.Engname = New System.Windows.Forms.TextBox
        Me.Thainame = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.AddID = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.GridShow = New System.Windows.Forms.DataGrid
        Me.Label3 = New System.Windows.Forms.Label
        Me.Facthai = New System.Windows.Forms.ComboBox
        CType(Me.GridShow, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'BCancel
        '
        Me.BCancel.BackColor = System.Drawing.Color.Gainsboro
        Me.BCancel.Location = New System.Drawing.Point(504, 200)
        Me.BCancel.Name = "BCancel"
        Me.BCancel.Size = New System.Drawing.Size(88, 40)
        Me.BCancel.TabIndex = 29
        Me.BCancel.Text = "ยกเลิก"
        '
        'BDelete
        '
        Me.BDelete.BackColor = System.Drawing.Color.Khaki
        Me.BDelete.Location = New System.Drawing.Point(504, 144)
        Me.BDelete.Name = "BDelete"
        Me.BDelete.Size = New System.Drawing.Size(88, 40)
        Me.BDelete.TabIndex = 28
        Me.BDelete.Text = "ลบข้อมูล"
        '
        'BEdit
        '
        Me.BEdit.BackColor = System.Drawing.Color.Bisque
        Me.BEdit.Location = New System.Drawing.Point(504, 96)
        Me.BEdit.Name = "BEdit"
        Me.BEdit.Size = New System.Drawing.Size(88, 40)
        Me.BEdit.TabIndex = 27
        Me.BEdit.Text = "แก้ไขข้อมูล"
        '
        'BSave
        '
        Me.BSave.BackColor = System.Drawing.Color.SandyBrown
        Me.BSave.Location = New System.Drawing.Point(504, 48)
        Me.BSave.Name = "BSave"
        Me.BSave.Size = New System.Drawing.Size(88, 40)
        Me.BSave.TabIndex = 26
        Me.BSave.Text = "เพิ่มข้อมูล"
        '
        'Engname
        '
        Me.Engname.Location = New System.Drawing.Point(312, 48)
        Me.Engname.Name = "Engname"
        Me.Engname.Size = New System.Drawing.Size(184, 24)
        Me.Engname.TabIndex = 25
        Me.Engname.Text = ""
        '
        'Thainame
        '
        Me.Thainame.Location = New System.Drawing.Point(104, 48)
        Me.Thainame.Name = "Thainame"
        Me.Thainame.Size = New System.Drawing.Size(200, 24)
        Me.Thainame.TabIndex = 24
        Me.Thainame.Text = ""
        '
        'Label2
        '
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(8, 48)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(104, 23)
        Me.Label2.TabIndex = 23
        Me.Label2.Text = "ชื่อไทย - อังกฤษ"
        '
        'AddID
        '
        Me.AddID.Location = New System.Drawing.Point(104, 8)
        Me.AddID.Name = "AddID"
        Me.AddID.TabIndex = 22
        Me.AddID.Text = ""
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(16, 8)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(88, 23)
        Me.Label1.TabIndex = 21
        Me.Label1.Text = "รหัสภาควิชาฯ"
        '
        'GridShow
        '
        Me.GridShow.DataMember = ""
        Me.GridShow.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.GridShow.Location = New System.Drawing.Point(8, 80)
        Me.GridShow.Name = "GridShow"
        Me.GridShow.Size = New System.Drawing.Size(488, 160)
        Me.GridShow.TabIndex = 20
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(256, 8)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(64, 23)
        Me.Label3.TabIndex = 30
        Me.Label3.Text = "คณะวิชาฯ"
        '
        'Facthai
        '
        Me.Facthai.Location = New System.Drawing.Point(328, 8)
        Me.Facthai.Name = "Facthai"
        Me.Facthai.Size = New System.Drawing.Size(264, 26)
        Me.Facthai.TabIndex = 31
        '
        'Add_DEPART
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.Color.Linen
        Me.ClientSize = New System.Drawing.Size(600, 253)
        Me.Controls.Add(Me.Facthai)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.BCancel)
        Me.Controls.Add(Me.BDelete)
        Me.Controls.Add(Me.BEdit)
        Me.Controls.Add(Me.BSave)
        Me.Controls.Add(Me.Engname)
        Me.Controls.Add(Me.Thainame)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.AddID)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.GridShow)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "Add_DEPART"
        Me.Text = "ข้อมูลภาควิชาฯ"
        CType(Me.GridShow, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Dim Combo_Num As String = "1001"
    Dim Fag_Cbo As Boolean = False


    Private Sub Add_DEPART_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Normal
        Cursor.Current = Cursors.WaitCursor

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        Combo()
        FormatDataGrid()
    End Sub
    Private Sub Combo()
        Dim sql As String = ""
        sql = "Select Sta_FACT,NAME from Factory "
        da = New SqlDataAdapter(sql, strConn)
        ds.Tables.Clear()
        da.Fill(ds, "data")
        If ds.Tables("Data").Rows.Count <> 0 Then

            With Facthai
                .DataSource = ds.Tables("Data")
                .DisplayMember = "NAME"
                .ValueMember = "Sta_FACT"
            End With

        End If
    End Sub

    Private Sub Facthai_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Facthai.SelectedIndexChanged
        Dim sql As String = ""
        sql = "Select Sta_FACT from Factory where NAME = '" + Facthai.Text + "'"
        da.SelectCommand.CommandText = sql
        ds.Tables.Clear()
        da.Fill(ds, "Selected")
        If ds.Tables("Selected").Rows.Count <> 0 Then
            Combo_Num = CStr(ds.Tables("Selected").Rows(0).Item("Sta_FACT"))
        End If
        FormatDataGrid()
        If Fag_Cbo = False Then
            AddID.Clear()
        End If

        Thainame.Clear()
        Engname.Clear()

        BSave.Enabled = True
        BEdit.Enabled = False
        BDelete.Enabled = False
    End Sub
    Private Sub FormatDataGrid()

        Dim sql As String = ""
        sql = "Select * from Department Where Sta_FACT = " + Combo_Num
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "DataSelect")
        If ds.Tables("DataSelect").Rows.Count = 0 Then
            MsgBox("No Record 0 Rows!")
        End If

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

        Dim cs1 As New DataGridTextBoxColumn
        With cs1
            .HeaderText = "รหัส"
            .MappingName = "Sta_DIV"
            .ReadOnly = True
            .Width = 50
        End With
        GrdTs.GridColumnStyles.Add(cs1)

        Dim cs2 As New DataGridTextBoxColumn
        With cs2
            .HeaderText = "ชื่อภาษาไทย"
            .MappingName = "NAME"
            .ReadOnly = True
            .Width = 200
        End With
        GrdTs.GridColumnStyles.Add(cs2)

        Dim cs3 As New DataGridTextBoxColumn
        With cs3
            .HeaderText = "ชื่อภาษาอังกฤษ"
            .MappingName = "ENAME"
            .ReadOnly = True
            .Width = 197
        End With
        GrdTs.GridColumnStyles.Add(cs3)

        With GridShow
            .TableStyles.Clear()
            .CaptionFont = New Font("MS Sans Serif", 10.0, FontStyle.Regular)
            .CaptionText = "ภาควิชาทั้งหมดใน " + Facthai.Text
            .FlatMode = True
            .TableStyles.Add(GrdTs)
        End With
    End Sub

    Private Sub AddID_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AddID.TextChanged
        If AddID.Text <> "" Then
            Dim sql As String = ""
            sql = "Select * from Department where Sta_DIV = " + AddID.Text
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "DataSelect")

            If ds.Tables("DataSelect").Rows.Count <> 0 Then
                Dim data0 As String = CStr(ds.Tables("DataSelect").Rows(0).Item("Sta_FACT"))
                Dim data1 As String = CStr(ds.Tables("DataSelect").Rows(0).Item("NAME"))
                Dim data2 As String = CStr(ds.Tables("DataSelect").Rows(0).Item("ENAME"))

                Fag_Cbo = True
                select_combo(data0)
                Thainame.Text = data1
                Engname.Text = data2

                BEdit.Enabled = True
                BDelete.Enabled = True
                BSave.Enabled = False
                Fag_Cbo = False
            Else
                Thainame.Clear()
                Engname.Clear()
                BEdit.Enabled = False
                BDelete.Enabled = False
                BSave.Enabled = True
            End If
        End If
    End Sub
    Private Sub select_combo(ByVal data As String)
        Dim sql As String = ""
        sql = "Select NAME from Factory Where Sta_FACT = " + data
        da.SelectCommand.CommandText = sql
        'ds.Tables("ComboSel").Clear()
        da.Fill(ds, "ComboSel")
        If ds.Tables("ComboSel").Rows.Count <> 0 Then
            Dim temp As String = ""
            temp = CStr(ds.Tables("ComboSel").Rows(0).Item("NAME"))
            Facthai.SelectedIndex = Facthai.FindString(temp)
        Else
            MsgBox("รหัสคณะผิดพลาด!")
        End If
    End Sub

    Private Sub BCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BCancel.Click
        Me.Close()
    End Sub

    Private Sub BSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BSave.Click
        Dim sql As String = ""
        Dim sqltemp As String = ""
        If AddID.Text <> "" And Thainame.Text <> "" And Engname.Text <> "" Then
            sql = "Insert into Department(Sta_DIV,NAME,ENAME,Sta_FACT) values (" + AddID.Text + ",'" + Thainame.Text + "','" + Engname.Text + "',"
            sqltemp = "Select Sta_FACT from Factory where NAME = '" + Facthai.Text + "'"
            da.SelectCommand.CommandText = sqltemp
            ds.Tables.Clear()
            da.Fill(ds, "Sel")
            If ds.Tables("Sel").Rows.Count <> 0 Then
                Dim temp As String = ""
                temp = CStr(ds.Tables("Sel").Rows(0).Item("Sta_FACT"))
                sql = sql + temp + ")"
                da.SelectCommand.CommandText = sql
                da.Fill(ds, "Insert")
                FormatDataGrid()
                AddID.Clear()
                Thainame.Clear()
                Engname.Clear()
            Else
                MsgBox("รหัสคณะ ผิดพลาด กรุณาตรวจสอบ !")
            End If
        Else
            MsgBox("กรุณากรอกข้อมูลให้ครบ!")
        End If
    End Sub

    Private Sub BEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BEdit.Click
        Dim sql As String = ""
        If AddID.Text <> "" And Thainame.Text <> "" And Engname.Text <> "" Then
            sql = "Update Department set NAME = '" + Thainame.Text + "',ENAME = '" + Engname.Text + "' where Sta_DIV = " + AddID.Text
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Edit")
            FormatDataGrid()
        Else
        MsgBox("กรุณากรอกข้อมูลให้ครบ!")
        End If
    End Sub

    Private Sub BDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BDelete.Click
        Dim sql As String = ""
        If AddID.Text <> "" Then
            sql = "Delete from Department where Sta_DIV = " + AddID.Text
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Delete")
            FormatDataGrid()

            AddID.Clear()
            Thainame.Clear()
            Engname.Clear()
            BEdit.Enabled = False
            BDelete.Enabled = False
            BSave.Enabled = True
        Else
            MsgBox("กรุณากรอกรหัสภาควิชาด้วย!")
        End If
    End Sub
End Class
