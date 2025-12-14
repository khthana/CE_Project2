Imports System.Data
Imports System.Data.OleDb

Public Class FormCarData
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
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents Timer2 As System.Windows.Forms.Timer
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents DataGridCar As System.Windows.Forms.DataGrid
    Friend WithEvents ComboBox1 As System.Windows.Forms.ComboBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(FormCarData))
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.Timer2 = New System.Windows.Forms.Timer(Me.components)
        Me.DataGridCar = New System.Windows.Forms.DataGrid
        Me.Label2 = New System.Windows.Forms.Label
        Me.ComboBox1 = New System.Windows.Forms.ComboBox
        Me.Label1 = New System.Windows.Forms.Label
        CType(Me.DataGridCar, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Timer1
        '
        Me.Timer1.Enabled = True
        '
        'Timer2
        '
        '
        'DataGridCar
        '
        Me.DataGridCar.DataMember = ""
        Me.DataGridCar.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.DataGridCar.Location = New System.Drawing.Point(8, 48)
        Me.DataGridCar.Name = "DataGridCar"
        Me.DataGridCar.Size = New System.Drawing.Size(680, 272)
        Me.DataGridCar.TabIndex = 0
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label2.Location = New System.Drawing.Point(16, 16)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(183, 18)
        Me.Label2.TabIndex = 4
        Me.Label2.Text = "แสดงข้อมูลรถของลูกค้าที่ใช้บริการ"
        '
        'ComboBox1
        '
        Me.ComboBox1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ComboBox1.Items.AddRange(New Object() {"รถที่ยังจอดอยู่", "รถที่ออกไปแล้ว"})
        Me.ComboBox1.Location = New System.Drawing.Point(560, 16)
        Me.ComboBox1.Name = "ComboBox1"
        Me.ComboBox1.Size = New System.Drawing.Size(121, 24)
        Me.ComboBox1.TabIndex = 5
        Me.ComboBox1.Text = "--เลือกประเภท--"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label1.Location = New System.Drawing.Point(504, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(52, 18)
        Me.Label1.TabIndex = 6
        Me.Label1.Text = "ประเภท :"
        '
        'FormCarData
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(694, 318)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.ComboBox1)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.DataGridCar)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "FormCarData"
        Me.Opacity = 0.5
        Me.ShowInTaskbar = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "รายการข้อมูลรถยนต์"
        CType(Me.DataGridCar, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As OleDbConnection = New OleDbConnection
    Dim da As OleDbDataAdapter
    Dim ds As DataSet = New DataSet

    Dim ToClose As Boolean = False

    '***************************************
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

    Private Sub frmAllBook_Closing(ByVal sender As Object, ByVal e As System.ComponentModel.CancelEventArgs) Handles MyBase.Closing
        If ToClose = False Then
            e.Cancel() = True
            Timer2.Enabled = True
        End If
    End Sub
    '***************************************

    Private Sub FormCarData_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With
        ShowData()
    End Sub

    Private Function ShowData() As Boolean
        Dim sql As String = ""
        Dim isreturn As String = "1"
        If ComboBox1.Text = "รถที่ยังจอดอยู่" Then
            isreturn = "1"
        Else
            isreturn = "0"
        End If

        sql = "Select a.*,b.ReturnTime from Car a,RentDetail b where a.CarNumber = b.CarNumber and b.IsReturn ='" + isreturn + "'"
        da = New OleDbDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Member")
        If ds.Tables("Member").Rows.Count <> 0 Then

            Dim grdTS As DataGridTableStyle = New DataGridTableStyle
            With grdTS
                .AlternatingBackColor = Color.LemonChiffon
                .BackColor = Color.White
                .MappingName = "Member"
            End With

            Dim cs1 As New DataGridTextBoxColumn
            With cs1
                .HeaderText = "ทะเบียนรถ"
                .MappingName = "CarNumber"
                .ReadOnly = True
                .Width = 100
            End With
            grdTS.GridColumnStyles.Add(cs1)

            Dim cs2 As New DataGridTextBoxColumn
            With cs2
                .HeaderText = "จังหวัด"
                .MappingName = "Province"
                .ReadOnly = True
                .Width = 100
            End With
            grdTS.GridColumnStyles.Add(cs2)

            Dim cs3 As New DataGridTextBoxColumn
            With cs3
                .HeaderText = "ยี่ห้อ"
                .MappingName = "CarBrand"
                .ReadOnly = True
                .Width = 80
            End With
            grdTS.GridColumnStyles.Add(cs3)

            Dim cs4 As New DataGridTextBoxColumn
            With cs4
                .HeaderText = "รุ่น"
                .MappingName = "CarVersion"
                .ReadOnly = True
                .Width = 80
            End With
            grdTS.GridColumnStyles.Add(cs4)

            Dim cs5 As New DataGridTextBoxColumn
            With cs5
                .HeaderText = "ประเภท"
                .MappingName = "CarType"
                .ReadOnly = True
                .Width = 60
            End With
            grdTS.GridColumnStyles.Add(cs5)

            Dim cs6 As New DataGridTextBoxColumn
            With cs6
                .HeaderText = "สี"
                .MappingName = "CarColor"
                .ReadOnly = True
                .Width = 50
            End With
            grdTS.GridColumnStyles.Add(cs6)

            Dim cs7 As New DataGridTextBoxColumn
            With cs7
                .HeaderText = "เวลาออก"
                .MappingName = "ReturnTime"
                .ReadOnly = True
                .Width = 100
            End With
            grdTS.GridColumnStyles.Add(cs7)


            With DataGridCar

                .TableStyles.Clear()
                .TableStyles.Add(grdTS)
                .FlatMode = True
            End With

        End If
    End Function

    Private Sub ComboBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ComboBox1.SelectedIndexChanged

        With DataGridCar
            .AllowNavigation = False
            .ReadOnly = True
            .DataSource = ds.Tables("Member")
        End With

        ShowData()
    End Sub
End Class