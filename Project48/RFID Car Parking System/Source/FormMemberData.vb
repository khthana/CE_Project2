Imports System.Data
Imports System.Data.OleDb

Public Class FormMemberData
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
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents Timer2 As System.Windows.Forms.Timer
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents ComboBoxMemberType As System.Windows.Forms.ComboBox
    Friend WithEvents DataGridMember As System.Windows.Forms.DataGrid
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(FormMemberData))
        Me.ComboBoxMemberType = New System.Windows.Forms.ComboBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.Timer2 = New System.Windows.Forms.Timer(Me.components)
        Me.DataGridMember = New System.Windows.Forms.DataGrid
        Me.Label2 = New System.Windows.Forms.Label
        CType(Me.DataGridMember, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'ComboBoxMemberType
        '
        Me.ComboBoxMemberType.Cursor = System.Windows.Forms.Cursors.Hand
        Me.ComboBoxMemberType.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ComboBoxMemberType.Items.AddRange(New Object() {"ทั่วไป", "สมาชิก"})
        Me.ComboBoxMemberType.Location = New System.Drawing.Point(528, 13)
        Me.ComboBoxMemberType.Name = "ComboBoxMemberType"
        Me.ComboBoxMemberType.Size = New System.Drawing.Size(152, 24)
        Me.ComboBoxMemberType.TabIndex = 0
        Me.ComboBoxMemberType.Text = "--เลือกประเภทลูกค้า--"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label1.Location = New System.Drawing.Point(448, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(79, 18)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "ประเภทลูกค้า :"
        '
        'Timer1
        '
        Me.Timer1.Enabled = True
        '
        'Timer2
        '
        '
        'DataGridMember
        '
        Me.DataGridMember.DataMember = ""
        Me.DataGridMember.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.DataGridMember.Location = New System.Drawing.Point(8, 48)
        Me.DataGridMember.Name = "DataGridMember"
        Me.DataGridMember.Size = New System.Drawing.Size(680, 272)
        Me.DataGridMember.TabIndex = 2
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label2.Location = New System.Drawing.Point(16, 16)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(148, 18)
        Me.Label2.TabIndex = 3
        Me.Label2.Text = "แสดงข้อมูลลูกค้าที่ใช้บริการ"
        '
        'FormMemberData
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(694, 318)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.DataGridMember)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.ComboBoxMemberType)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "FormMemberData"
        Me.Opacity = 0.5
        Me.ShowInTaskbar = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "รายชื่อสมาชิกทั้งหมด"
        CType(Me.DataGridMember, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As OleDbConnection = New OleDbConnection
    Dim da As OleDbDataAdapter
    Dim ds As DataSet = New DataSet

    Dim IsFind As Boolean = False
    Dim ToClose As Boolean = False

    '********************************
    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        Me.Opacity = Me.Opacity + 0.1
        If (Me.Opacity >= 1) Then
            Timer1.Enabled = False
        End If
    End Sub

    Private Sub Timer2_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2.Tick
        Me.Opacity = Me.Opacity - 0.3
        If Me.Opacity = 0 Then
            ToClose = True
            Me.Close()
        End If
    End Sub

    Private Sub FormMemberData_Closing(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles MyBase.Closing
        If ToClose = False Then
            e.Cancel() = True
            Timer2.Enabled = True
        End If
    End Sub
    '*********************************

    Private Sub FormMemberData_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With
    End Sub

    Private Function ShowData() As Boolean

        Dim MemType As String

        If ComboBoxMemberType.Text = "สมาชิก" Then
            MemType = "1"
        Else
            MemType = "0"
        End If
        Dim sqlMember As String = ""

        sqlMember = "SELECT * from Member where MemberType = '" + MemType + "'"
        da = New OleDbDataAdapter(sqlMember, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Member")

        Dim grdTS As DataGridTableStyle = New DataGridTableStyle
        With grdTS
            .AlternatingBackColor = Color.LemonChiffon
            .BackColor = Color.White
            .MappingName = "Member"
        End With

        If ds.Tables("Member").Rows.Count <> 0 Then
            With DataGridMember
                .AllowNavigation = False
                .ReadOnly = True
                .DataSource = ds.Tables("Member")
            End With

            Dim cs1 As New DataGridTextBoxColumn
            With cs1
                .HeaderText = "รหัสสมาชิก"
                .MappingName = "MemberID"
                .ReadOnly = True
                .Width = 70
            End With
            grdTS.GridColumnStyles.Add(cs1)

            Dim cs2 As New DataGridTextBoxColumn
            With cs2
                .HeaderText = "ชื่อ-สกุล"
                .MappingName = "FullName"
                .ReadOnly = True
                .Width = 120
            End With
            grdTS.GridColumnStyles.Add(cs2)

            Dim cs3 As New DataGridTextBoxColumn
            With cs3
                .HeaderText = "เพศ"
                .MappingName = "Sex"
                .ReadOnly = True
                .Width = 30
            End With
            grdTS.GridColumnStyles.Add(cs3)

            Dim cs4 As New DataGridTextBoxColumn
            With cs4
                .HeaderText = "หมายเลขบัตรประชาชน"
                .MappingName = "IDCard"
                .ReadOnly = True
                .Width = 120
            End With
            grdTS.GridColumnStyles.Add(cs4)

            Dim cs5 As New DataGridTextBoxColumn
            With cs5
                .HeaderText = "ที่อยู่"
                .MappingName = "Address"
                .ReadOnly = True
                .Width = 200
            End With
            grdTS.GridColumnStyles.Add(cs5)

            Dim cs6 As New DataGridTextBoxColumn
            With cs6
                .HeaderText = "เบอร์โทรศัพท์"
                .MappingName = "Phone"
                .ReadOnly = True
                .Width = 100
            End With
            grdTS.GridColumnStyles.Add(cs6)

            Dim cs7 As New DataGridTextBoxColumn
            With cs7
                .HeaderText = "ประเภทลูกค้า"
                .MappingName = "MemberType"
                .Width = 0
            End With
            grdTS.GridColumnStyles.Add(cs7)

            Dim cs8 As New DataGridTextBoxColumn
            With cs8
                .HeaderText = "วันหมดอายุสมาชิก"
                .MappingName = "ExpireDate"
                .Width = 0
            End With
            grdTS.GridColumnStyles.Add(cs8)

            Dim cs9 As New DataGridTextBoxColumn
            With cs9
                .HeaderText = "สถานะหมดอายุ"
                .MappingName = "IsExpired"
                .Width = 0
            End With
            grdTS.GridColumnStyles.Add(cs9)


            With DataGridMember
                .TableStyles.Clear()
                .CaptionText = "รายชื่อ : " & ComboBoxMemberType.Text & " จำนวน : " & ds.Tables("Member").Rows.Count.ToString() & " คน"
                .TableStyles.Add(grdTS)
                .FlatMode = True
            End With
        End If
    End Function

    Private Sub ComboBoxMemberType_SelectedValueChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ComboBoxMemberType.SelectedValueChanged
       
        With DataGridMember
            .AllowNavigation = False
            .ReadOnly = True
            .DataSource = ds.Tables("Member")
        End With

        ShowData()
    End Sub


End Class




















