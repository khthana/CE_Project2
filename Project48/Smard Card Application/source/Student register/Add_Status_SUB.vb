Option Explicit On 
Option Strict On
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Public Class Add_Status_SUB
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
    Friend WithEvents AddID As System.Windows.Forms.TextBox
    Friend WithEvents Thainame As System.Windows.Forms.TextBox
    Friend WithEvents Engname As System.Windows.Forms.TextBox
    Friend WithEvents GridShow As System.Windows.Forms.DataGrid
    Friend WithEvents BSave As System.Windows.Forms.Button
    Friend WithEvents BEdit As System.Windows.Forms.Button
    Friend WithEvents BDelete As System.Windows.Forms.Button
    Friend WithEvents BCancel As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.AddID = New System.Windows.Forms.TextBox
        Me.Thainame = New System.Windows.Forms.TextBox
        Me.Engname = New System.Windows.Forms.TextBox
        Me.GridShow = New System.Windows.Forms.DataGrid
        Me.BSave = New System.Windows.Forms.Button
        Me.BEdit = New System.Windows.Forms.Button
        Me.BDelete = New System.Windows.Forms.Button
        Me.BCancel = New System.Windows.Forms.Button
        CType(Me.GridShow, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(56, 8)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(80, 23)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "รหัสประเภท"
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(32, 40)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(104, 23)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "ชื่อประเภท(ไทย)"
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(16, 72)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(120, 23)
        Me.Label3.TabIndex = 2
        Me.Label3.Text = "ชื่อประเภท(อังกฤษ)"
        '
        'AddID
        '
        Me.AddID.Location = New System.Drawing.Point(136, 8)
        Me.AddID.Name = "AddID"
        Me.AddID.Size = New System.Drawing.Size(128, 24)
        Me.AddID.TabIndex = 3
        Me.AddID.Text = ""
        '
        'Thainame
        '
        Me.Thainame.Location = New System.Drawing.Point(136, 40)
        Me.Thainame.Name = "Thainame"
        Me.Thainame.Size = New System.Drawing.Size(272, 24)
        Me.Thainame.TabIndex = 4
        Me.Thainame.Text = ""
        '
        'Engname
        '
        Me.Engname.Location = New System.Drawing.Point(136, 72)
        Me.Engname.Name = "Engname"
        Me.Engname.Size = New System.Drawing.Size(272, 24)
        Me.Engname.TabIndex = 5
        Me.Engname.Text = ""
        '
        'GridShow
        '
        Me.GridShow.DataMember = ""
        Me.GridShow.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.GridShow.Location = New System.Drawing.Point(16, 104)
        Me.GridShow.Name = "GridShow"
        Me.GridShow.Size = New System.Drawing.Size(392, 160)
        Me.GridShow.TabIndex = 6
        '
        'BSave
        '
        Me.BSave.BackColor = System.Drawing.Color.DarkKhaki
        Me.BSave.Location = New System.Drawing.Point(416, 72)
        Me.BSave.Name = "BSave"
        Me.BSave.Size = New System.Drawing.Size(80, 40)
        Me.BSave.TabIndex = 7
        Me.BSave.Text = "เพิ่มข้อมูล"
        '
        'BEdit
        '
        Me.BEdit.BackColor = System.Drawing.Color.Khaki
        Me.BEdit.Location = New System.Drawing.Point(416, 120)
        Me.BEdit.Name = "BEdit"
        Me.BEdit.Size = New System.Drawing.Size(80, 40)
        Me.BEdit.TabIndex = 8
        Me.BEdit.Text = "แก้ไขข้อมูล"
        '
        'BDelete
        '
        Me.BDelete.BackColor = System.Drawing.Color.Yellow
        Me.BDelete.Location = New System.Drawing.Point(416, 168)
        Me.BDelete.Name = "BDelete"
        Me.BDelete.Size = New System.Drawing.Size(80, 40)
        Me.BDelete.TabIndex = 9
        Me.BDelete.Text = "ลบข้อมูล"
        '
        'BCancel
        '
        Me.BCancel.BackColor = System.Drawing.Color.Silver
        Me.BCancel.Location = New System.Drawing.Point(416, 224)
        Me.BCancel.Name = "BCancel"
        Me.BCancel.Size = New System.Drawing.Size(80, 40)
        Me.BCancel.TabIndex = 10
        Me.BCancel.Text = "ยกเลิก"
        '
        'Add_Status_SUB
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.Color.LightYellow
        Me.ClientSize = New System.Drawing.Size(504, 273)
        Me.Controls.Add(Me.BCancel)
        Me.Controls.Add(Me.BDelete)
        Me.Controls.Add(Me.BEdit)
        Me.Controls.Add(Me.BSave)
        Me.Controls.Add(Me.GridShow)
        Me.Controls.Add(Me.Engname)
        Me.Controls.Add(Me.Thainame)
        Me.Controls.Add(Me.AddID)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "Add_Status_SUB"
        Me.Text = "ข้อมูลประเภทรายวิชา"
        CType(Me.GridShow, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Private Sub Add_Status_SUB_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
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
        sql = "Select * from Type_SUBJ"

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
            .MappingName = "Subj_TYPE"
            .ReadOnly = True
            .Width = 50
        End With
        GrdTs.GridColumnStyles.Add(cs1)

        Dim cs2 As New DataGridTextBoxColumn
        With cs2
            .HeaderText = "ชื่อภาษาไทย"
            .MappingName = "Type_NM"
            .ReadOnly = True
            .Width = 150
        End With
        GrdTs.GridColumnStyles.Add(cs2)

        Dim cs3 As New DataGridTextBoxColumn
        With cs3
            .HeaderText = "ชื่อภาษาอังกฤษ"
            .MappingName = "Type_ENM"
            .ReadOnly = True
            .Width = 150
        End With
        GrdTs.GridColumnStyles.Add(cs3)

        With GridShow
            .TableStyles.Clear()
            .CaptionFont = New Font("MS Sans Serif", 10.0, FontStyle.Regular)
            .CaptionText = "ประเภทวิชาทั้งหมด"
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
            sql = "Select * from Type_SUBJ where Subj_TYPE = '" + AddID.Text + "'"
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "DataSelect")

            If ds.Tables("DataSelect").Rows.Count <> 0 Then
                Thainame.Text = CStr(ds.Tables("DataSelect").Rows(0).Item("Type_NM"))
                Engname.Text = CStr(ds.Tables("DataSelect").Rows(0).Item("Type_ENM"))
                BEdit.Enabled = True
                BDelete.Enabled = True
                BSave.Enabled = False
            Else
                Thainame.Clear()
                Engname.Clear()
                BEdit.Enabled = False
                BDelete.Enabled = False
                BSave.Enabled = True
            End If
        Else
            Thainame.Clear()
            Engname.Clear()
            BEdit.Enabled = False
            BDelete.Enabled = False
            BSave.Enabled = True
        End If
    End Sub

    Private Sub BSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BSave.Click
        Dim sql As String = ""
        If AddID.Text <> "" And Thainame.Text <> "" And Engname.Text <> "" Then
            sql = "Insert into Type_SUBJ(Subj_TYPE,Type_NM,Type_ENM) values ('" + AddID.Text + "','" + Thainame.Text + "','" + Engname.Text + "')"
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "insert")
            AddID.Clear()
            Thainame.Clear()
            Engname.Clear()
            FormatDataGrid()
        Else
            MsgBox("กรุณากรอกข้อมูลให้ครบ!")
        End If
    End Sub

    Private Sub BEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BEdit.Click
        Dim sql As String = ""
        If AddID.Text <> "" Then
            sql = "Update Type_SUBJ Set Type_NM = '" + Thainame.Text + "',Type_ENM = '" + Engname.Text + "' Where Subj_TYPE = '" + AddID.Text + "'"
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
            sql = "Delete from Type_SUBJ Where Subj_TYPE = '" + AddID.Text + "'"
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Edit")
            FormatDataGrid()
            AddID.Clear()
            Thainame.Clear()
            Engname.Clear()
            FormatDataGrid()
            BSave.Enabled = True
            BEdit.Enabled = False
            BDelete.Enabled = False
        Else
            MsgBox("กรุณากรอกข้อมูลให้ถูกต้อง!")
        End If
    End Sub
End Class
