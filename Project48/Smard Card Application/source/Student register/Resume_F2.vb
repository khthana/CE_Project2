Option Explicit On 
'Option Strict On
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Public Class Resume_F2
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
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents Button2 As System.Windows.Forms.Button
    Friend WithEvents ThaiSurname As System.Windows.Forms.TextBox
    Friend WithEvents ThaiName As System.Windows.Forms.TextBox
    Friend WithEvents StdID As System.Windows.Forms.TextBox
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.ThaiSurname = New System.Windows.Forms.TextBox
        Me.ThaiName = New System.Windows.Forms.TextBox
        Me.StdID = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label1 = New System.Windows.Forms.Label
        Me.Button1 = New System.Windows.Forms.Button
        Me.Button2 = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'ThaiSurname
        '
        Me.ThaiSurname.Location = New System.Drawing.Point(264, 40)
        Me.ThaiSurname.Name = "ThaiSurname"
        Me.ThaiSurname.ReadOnly = True
        Me.ThaiSurname.Size = New System.Drawing.Size(152, 24)
        Me.ThaiSurname.TabIndex = 14
        Me.ThaiSurname.Text = ""
        '
        'ThaiName
        '
        Me.ThaiName.Location = New System.Drawing.Point(112, 40)
        Me.ThaiName.Name = "ThaiName"
        Me.ThaiName.ReadOnly = True
        Me.ThaiName.Size = New System.Drawing.Size(144, 24)
        Me.ThaiName.TabIndex = 13
        Me.ThaiName.Text = ""
        '
        'StdID
        '
        Me.StdID.Location = New System.Drawing.Point(112, 8)
        Me.StdID.Name = "StdID"
        Me.StdID.ReadOnly = True
        Me.StdID.Size = New System.Drawing.Size(144, 24)
        Me.StdID.TabIndex = 12
        Me.StdID.Text = ""
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(32, 40)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(88, 23)
        Me.Label2.TabIndex = 11
        Me.Label2.Text = "ชื่อ -นามสกุล"
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(32, 8)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(88, 23)
        Me.Label1.TabIndex = 10
        Me.Label1.Text = "รหัสนักศึกษา"
        '
        'Button1
        '
        Me.Button1.BackColor = System.Drawing.SystemColors.ControlLightLight
        Me.Button1.Location = New System.Drawing.Point(112, 72)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(144, 32)
        Me.Button1.TabIndex = 17
        Me.Button1.Text = "ข้อมูลบิดา"
        '
        'Button2
        '
        Me.Button2.BackColor = System.Drawing.SystemColors.ControlLightLight
        Me.Button2.Location = New System.Drawing.Point(264, 72)
        Me.Button2.Name = "Button2"
        Me.Button2.Size = New System.Drawing.Size(152, 32)
        Me.Button2.TabIndex = 18
        Me.Button2.Text = "ข้อมูลมารดา"
        '
        'Resume_F2
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.Color.Silver
        Me.ClientSize = New System.Drawing.Size(448, 133)
        Me.Controls.Add(Me.Button2)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.ThaiSurname)
        Me.Controls.Add(Me.ThaiName)
        Me.Controls.Add(Me.StdID)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "Resume_F2"
        Me.Text = "ส่วนข้อมูล บิดา/มารดา"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Dim dtfinfo As DateTimeFormatInfo
    Dim addrID As String = ""

    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim Fa As New Resume_Fa
        Fa.ShowDialog()
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim Fa As New Resume_Ma
        Fa.ShowDialog()
    End Sub

    Private Sub Resume_F2_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Normal
        Cursor.Current = Cursors.WaitCursor

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With
        StdID.Text = Student_ID
        ThaiName.Text = thaiNM
        ThaiSurname.Text = ThaiSurNM

    End Sub
End Class
