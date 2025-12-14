Option Explicit On 
Option Strict On
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Public Class Add_Teacher
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
    Friend WithEvents GridShow As System.Windows.Forms.DataGrid
    Friend WithEvents AddID As System.Windows.Forms.TextBox
    Friend WithEvents AddName As System.Windows.Forms.TextBox
    Friend WithEvents AddSurname As System.Windows.Forms.TextBox
    Friend WithEvents BSave As System.Windows.Forms.Button
    Friend WithEvents BEdit As System.Windows.Forms.Button
    Friend WithEvents BDelete As System.Windows.Forms.Button
    Friend WithEvents BCancel As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.GridShow = New System.Windows.Forms.DataGrid
        Me.Label1 = New System.Windows.Forms.Label
        Me.AddID = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.AddName = New System.Windows.Forms.TextBox
        Me.AddSurname = New System.Windows.Forms.TextBox
        Me.BSave = New System.Windows.Forms.Button
        Me.BEdit = New System.Windows.Forms.Button
        Me.BDelete = New System.Windows.Forms.Button
        Me.BCancel = New System.Windows.Forms.Button
        CType(Me.GridShow, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'GridShow
        '
        Me.GridShow.DataMember = ""
        Me.GridShow.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.GridShow.Location = New System.Drawing.Point(16, 80)
        Me.GridShow.Name = "GridShow"
        Me.GridShow.Size = New System.Drawing.Size(392, 160)
        Me.GridShow.TabIndex = 0
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(16, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(80, 23)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "รหัสอาจารย์"
        '
        'AddID
        '
        Me.AddID.Location = New System.Drawing.Point(104, 16)
        Me.AddID.Name = "AddID"
        Me.AddID.TabIndex = 2
        Me.AddID.Text = ""
        '
        'Label2
        '
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(16, 48)
        Me.Label2.Name = "Label2"
        Me.Label2.TabIndex = 3
        Me.Label2.Text = "ชื่อ - นามสกุล"
        '
        'AddName
        '
        Me.AddName.Location = New System.Drawing.Point(104, 48)
        Me.AddName.Name = "AddName"
        Me.AddName.Size = New System.Drawing.Size(144, 24)
        Me.AddName.TabIndex = 4
        Me.AddName.Text = ""
        '
        'AddSurname
        '
        Me.AddSurname.Location = New System.Drawing.Point(256, 48)
        Me.AddSurname.Name = "AddSurname"
        Me.AddSurname.Size = New System.Drawing.Size(152, 24)
        Me.AddSurname.TabIndex = 5
        Me.AddSurname.Text = ""
        '
        'BSave
        '
        Me.BSave.Location = New System.Drawing.Point(416, 48)
        Me.BSave.Name = "BSave"
        Me.BSave.Size = New System.Drawing.Size(88, 40)
        Me.BSave.TabIndex = 6
        Me.BSave.Text = "เพิ่มข้อมูล"
        '
        'BEdit
        '
        Me.BEdit.Location = New System.Drawing.Point(416, 96)
        Me.BEdit.Name = "BEdit"
        Me.BEdit.Size = New System.Drawing.Size(88, 40)
        Me.BEdit.TabIndex = 7
        Me.BEdit.Text = "แก้ไขข้อมูล"
        '
        'BDelete
        '
        Me.BDelete.Location = New System.Drawing.Point(416, 144)
        Me.BDelete.Name = "BDelete"
        Me.BDelete.Size = New System.Drawing.Size(88, 40)
        Me.BDelete.TabIndex = 8
        Me.BDelete.Text = "ลบข้อมูล"
        '
        'BCancel
        '
        Me.BCancel.Location = New System.Drawing.Point(416, 200)
        Me.BCancel.Name = "BCancel"
        Me.BCancel.Size = New System.Drawing.Size(88, 40)
        Me.BCancel.TabIndex = 9
        Me.BCancel.Text = "ยกเลิก"
        '
        'Add_Teacher
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.ClientSize = New System.Drawing.Size(512, 253)
        Me.Controls.Add(Me.BCancel)
        Me.Controls.Add(Me.BDelete)
        Me.Controls.Add(Me.BEdit)
        Me.Controls.Add(Me.BSave)
        Me.Controls.Add(Me.AddSurname)
        Me.Controls.Add(Me.AddName)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.AddID)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.GridShow)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "Add_Teacher"
        Me.Text = "ข้อมูลอาจารย์ที่ปรึกษา"
        CType(Me.GridShow, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Private Sub Add_Teacher_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Normal
        Cursor.Current = Cursors.WaitCursor

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        FormatDataGrid()
        BEdit.Enabled = False
        BDelete.Enabled = False
    End Sub

    Private Sub FormatDataGrid()

        Dim sql As String = ""
        sql = "Select * from Teacher"

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
            .MappingName = "Sta_TEACHER"
            .ReadOnly = True
            .Width = 100
        End With
        GrdTs.GridColumnStyles.Add(cs1)

        Dim cs2 As New DataGridTextBoxColumn
        With cs2
            .HeaderText = "ชื่อ"
            .MappingName = "NAME"
            .ReadOnly = True
            .Width = 120
        End With
        GrdTs.GridColumnStyles.Add(cs2)

        Dim cs3 As New DataGridTextBoxColumn
        With cs3
            .HeaderText = "นามสกุล"
            .MappingName = "SURNAME"
            .ReadOnly = True
            .Width = 120
        End With
        GrdTs.GridColumnStyles.Add(cs3)

        With GridShow
            .TableStyles.Clear()
            .CaptionFont = New Font("MS Sans Serif", 10.0, FontStyle.Regular)
            .CaptionText = "รายชื่ออาจาร์ที่ปรึกษา"
            .FlatMode = True
            .TableStyles.Add(GrdTs)
        End With
    End Sub

    Private Sub BCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BCancel.Click
        Me.Close()
    End Sub

    Private Sub AddID_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AddID.TextChanged
        If AddID.Text <> "" Then
            Dim sql As String = ""
            sql = "Select * from Teacher where Sta_TEACHER = " + AddID.Text
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "DataSelect")

            If ds.Tables("DataSelect").Rows.Count <> 0 Then
                AddName.Text = CStr(ds.Tables("DataSelect").Rows(0).Item("NAME"))
                AddSurname.Text = CStr(ds.Tables("DataSelect").Rows(0).Item("SURNAME"))
                BEdit.Enabled = True
                BDelete.Enabled = True
                BSave.Enabled = False
            Else
                AddName.Clear()
                AddSurname.Clear()
                BEdit.Enabled = False
                BDelete.Enabled = False
                BSave.Enabled = True
            End If
        End If
    End Sub

    Private Sub BEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BEdit.Click
        If AddID.Text <> "" Then
            Dim sql As String = ""
            sql = "Update Teacher set NAME = '" + AddName.Text + "', SURNAME = '" + AddSurname.Text + "' where Sta_TEACHER = " + AddID.Text
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Insert")
            FormatDataGrid()
            BSave.Enabled = False
            BEdit.Enabled = True
            BDelete.Enabled = True

        Else
            MsgBox("กรุณากรอกข้อมูลให้ครบ!")
        End If
    End Sub

    Private Sub BSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BSave.Click
        If AddID.Text <> "" And AddName.Text <> "" And AddSurname.Text <> "" Then
            Dim sql As String = ""
            sql = "insert into Teacher(Sta_TEACHER,NAME,SURNAME) values (" + AddID.Text + ",'" + AddName.Text + "','" + AddSurname.Text + "')"
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Insert")
            FormatDataGrid()
            AddID.Clear()
            AddName.Clear()
            AddSurname.Clear()

            BSave.Enabled = True
            BEdit.Enabled = False
            BDelete.Enabled = False

        Else
            MsgBox("กรุณากรอกข้อมูลให้ครบ!")
        End If
    End Sub

    Private Sub BDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BDelete.Click
        If AddID.Text <> "" Then
            Dim sql As String = ""
            sql = "Delete from Teacher where Sta_TEACHER = " + AddID.Text
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Insert")
            FormatDataGrid()
            BSave.Enabled = True
            BEdit.Enabled = False
            BDelete.Enabled = False

        Else
            MsgBox("กรุณาใส่รหัสอาจารย์ที่ปรึกษา!")
        End If
    End Sub
End Class
