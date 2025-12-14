Option Explicit On 
Option Strict On
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Public Class Add_FACURITY
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
    Friend WithEvents BCancel As System.Windows.Forms.Button
    Friend WithEvents BDelete As System.Windows.Forms.Button
    Friend WithEvents BEdit As System.Windows.Forms.Button
    Friend WithEvents Bsave As System.Windows.Forms.Button
    Friend WithEvents EngName As System.Windows.Forms.TextBox
    Friend WithEvents ThaiName As System.Windows.Forms.TextBox
    Friend WithEvents AddID As System.Windows.Forms.TextBox
    Friend WithEvents GridShow As System.Windows.Forms.DataGrid
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.BCancel = New System.Windows.Forms.Button
        Me.BDelete = New System.Windows.Forms.Button
        Me.BEdit = New System.Windows.Forms.Button
        Me.Bsave = New System.Windows.Forms.Button
        Me.EngName = New System.Windows.Forms.TextBox
        Me.ThaiName = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.AddID = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.GridShow = New System.Windows.Forms.DataGrid
        CType(Me.GridShow, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'BCancel
        '
        Me.BCancel.BackColor = System.Drawing.Color.LightGray
        Me.BCancel.Location = New System.Drawing.Point(472, 192)
        Me.BCancel.Name = "BCancel"
        Me.BCancel.Size = New System.Drawing.Size(88, 40)
        Me.BCancel.TabIndex = 19
        Me.BCancel.Text = "ยกเลิก"
        '
        'BDelete
        '
        Me.BDelete.BackColor = System.Drawing.Color.Wheat
        Me.BDelete.Location = New System.Drawing.Point(472, 136)
        Me.BDelete.Name = "BDelete"
        Me.BDelete.Size = New System.Drawing.Size(88, 40)
        Me.BDelete.TabIndex = 18
        Me.BDelete.Text = "ลบข้อมูล"
        '
        'BEdit
        '
        Me.BEdit.BackColor = System.Drawing.Color.Bisque
        Me.BEdit.Location = New System.Drawing.Point(472, 88)
        Me.BEdit.Name = "BEdit"
        Me.BEdit.Size = New System.Drawing.Size(88, 40)
        Me.BEdit.TabIndex = 17
        Me.BEdit.Text = "แก้ไขข้อมูล"
        '
        'Bsave
        '
        Me.Bsave.BackColor = System.Drawing.Color.Tan
        Me.Bsave.Location = New System.Drawing.Point(472, 40)
        Me.Bsave.Name = "Bsave"
        Me.Bsave.Size = New System.Drawing.Size(88, 40)
        Me.Bsave.TabIndex = 16
        Me.Bsave.Text = "เพิ่มข้อมูล"
        '
        'EngName
        '
        Me.EngName.Location = New System.Drawing.Point(256, 40)
        Me.EngName.Name = "EngName"
        Me.EngName.Size = New System.Drawing.Size(152, 24)
        Me.EngName.TabIndex = 15
        Me.EngName.Text = ""
        '
        'ThaiName
        '
        Me.ThaiName.Location = New System.Drawing.Point(104, 40)
        Me.ThaiName.Name = "ThaiName"
        Me.ThaiName.Size = New System.Drawing.Size(144, 24)
        Me.ThaiName.TabIndex = 14
        Me.ThaiName.Text = ""
        '
        'Label2
        '
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(8, 40)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(104, 23)
        Me.Label2.TabIndex = 13
        Me.Label2.Text = "ชื่อไทย - อังกฤษ"
        '
        'AddID
        '
        Me.AddID.Location = New System.Drawing.Point(104, 8)
        Me.AddID.Name = "AddID"
        Me.AddID.TabIndex = 12
        Me.AddID.Text = ""
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(16, 8)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(88, 23)
        Me.Label1.TabIndex = 11
        Me.Label1.Text = "รหัสคณะวิชาฯ"
        '
        'GridShow
        '
        Me.GridShow.DataMember = ""
        Me.GridShow.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.GridShow.Location = New System.Drawing.Point(8, 72)
        Me.GridShow.Name = "GridShow"
        Me.GridShow.Size = New System.Drawing.Size(456, 160)
        Me.GridShow.TabIndex = 10
        '
        'Add_FACURITY
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.Color.Linen
        Me.ClientSize = New System.Drawing.Size(568, 245)
        Me.Controls.Add(Me.BCancel)
        Me.Controls.Add(Me.BDelete)
        Me.Controls.Add(Me.BEdit)
        Me.Controls.Add(Me.Bsave)
        Me.Controls.Add(Me.EngName)
        Me.Controls.Add(Me.ThaiName)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.AddID)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.GridShow)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "Add_FACURITY"
        Me.Text = "ข้อมูลคณะวิชาฯ"
        CType(Me.GridShow, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region


    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"


    Private Sub BCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BCancel.Click
        Me.Close()
    End Sub

    Private Sub Add_FACURITY_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
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
        sql = "Select * from Factory"

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
            .MappingName = "Sta_FACT"
            .ReadOnly = True
            .Width = 50
        End With
        GrdTs.GridColumnStyles.Add(cs1)

        Dim cs2 As New DataGridTextBoxColumn
        With cs2
            .HeaderText = "ชื่อภาษาไทย"
            .MappingName = "NAME"
            .ReadOnly = True
            .Width = 180
        End With
        GrdTs.GridColumnStyles.Add(cs2)

        Dim cs3 As New DataGridTextBoxColumn
        With cs3
            .HeaderText = "ชื่อภาษาอังกฤษ"
            .MappingName = "ENAME"
            .ReadOnly = True
            .Width = 180
        End With
        GrdTs.GridColumnStyles.Add(cs3)

        With GridShow
            .TableStyles.Clear()
            .CaptionFont = New Font("MS Sans Serif", 10.0, FontStyle.Regular)
            .CaptionText = "คณะทั้งหมด"
            .FlatMode = True
            .TableStyles.Add(GrdTs)
        End With
    End Sub

    Private Sub AddID_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AddID.TextChanged
        If AddID.Text <> "" Then
            Dim sql As String = ""
            sql = "Select * from Factory where Sta_FACT = " + AddID.Text
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "DataSelect")

            If ds.Tables("DataSelect").Rows.Count <> 0 Then
                ThaiName.Text = CStr(ds.Tables("DataSelect").Rows(0).Item("NAME"))
                EngName.Text = CStr(ds.Tables("DataSelect").Rows(0).Item("ENAME"))
                BEdit.Enabled = True
                BDelete.Enabled = True
                Bsave.Enabled = False
            Else
                ThaiName.Clear()
                EngName.Clear()
                BEdit.Enabled = False
                BDelete.Enabled = False
                Bsave.Enabled = True
            End If
        End If
    End Sub

    Private Sub Bsave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Bsave.Click
        Dim sql As String = ""
        If AddID.Text <> "" And ThaiName.Text <> "" And EngName.Text <> "" Then
            sql = "Insert into FACTORY(Sta_FACT,NAME,ENAME) values (" + AddID.Text + ",'" + ThaiName.Text + "','" + EngName.Text + "')"
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "insert")
            AddID.Clear()
            ThaiName.Clear()
            EngName.Clear()
            FormatDataGrid()
        Else
            MsgBox("กรุณากรอกข้อมูลให้ครบ!")
        End If
    End Sub

    Private Sub BEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BEdit.Click
        Dim sql As String = ""
        If AddID.Text <> "" And ThaiName.Text <> "" And EngName.Text <> "" Then
            sql = "Update FACTORY set NAME = '" + ThaiName.Text + "', ENAME = '" + EngName.Text + "' where Sta_FACT = " + AddID.Text
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Edit")
            AddID.Clear()
            ThaiName.Clear()
            EngName.Clear()
            FormatDataGrid()
            BEdit.Enabled = False
            BDelete.Enabled = False
            Bsave.Enabled = True
        Else
            MsgBox("กรุณากรอกข้อมูลให้ครบ!")
        End If
    End Sub

    Private Sub BDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BDelete.Click
        Dim sql As String = ""
        If AddID.Text <> "" Then
            sql = "Delete From FACTORY where Sta_FACT = " + AddID.Text
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Delete")
            AddID.Clear()
            ThaiName.Clear()
            EngName.Clear()
            FormatDataGrid()
            BEdit.Enabled = False
            BDelete.Enabled = False
            Bsave.Enabled = True
        Else
            MsgBox("กรุณากรอกข้อมูลให้ครบ!")
        End If
    End Sub
End Class
