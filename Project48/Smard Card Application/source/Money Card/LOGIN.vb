Imports System.Data
Imports System.Data.SqlClient
Public Class LOGIN
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
    Friend WithEvents CheckLogin As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Password As System.Windows.Forms.TextBox
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.CheckLogin = New System.Windows.Forms.Button
        Me.Label1 = New System.Windows.Forms.Label
        Me.Password = New System.Windows.Forms.TextBox
        Me.SuspendLayout()
        '
        'CheckLogin
        '
        Me.CheckLogin.BackColor = System.Drawing.Color.CadetBlue
        Me.CheckLogin.Location = New System.Drawing.Point(192, 16)
        Me.CheckLogin.Name = "CheckLogin"
        Me.CheckLogin.Size = New System.Drawing.Size(80, 40)
        Me.CheckLogin.TabIndex = 5
        Me.CheckLogin.Text = "Login"
        '
        'Label1
        '
        Me.Label1.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(16, 8)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(176, 16)
        Me.Label1.TabIndex = 4
        Me.Label1.Text = "รหัสผ่านของผู้ใช้ระบบ"
        '
        'Password
        '
        Me.Password.BackColor = System.Drawing.SystemColors.InactiveBorder
        Me.Password.Location = New System.Drawing.Point(16, 32)
        Me.Password.Name = "Password"
        Me.Password.PasswordChar = Microsoft.VisualBasic.ChrW(42)
        Me.Password.Size = New System.Drawing.Size(160, 24)
        Me.Password.TabIndex = 3
        Me.Password.Text = ""
        '
        'LOGIN
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.ClientSize = New System.Drawing.Size(280, 62)
        Me.Controls.Add(Me.CheckLogin)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.Password)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "LOGIN"
        Me.Text = "ตรวจสอบรหัสผ่านบัตร"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Private Sub CheckLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckLogin.Click

        If CheckAdmin() Then
            StatusUser = True
        Else
            StatusUser = False
        End If
        Me.Close()
    End Sub

    Private Sub LOGIN_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        StatusUser = False
        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With
    End Sub
    Private Function CheckAdmin() As Boolean
        Dim sql As String = ""
        sql = "Select * From Admin where password='" + Password.Text + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Query")
        If ds.Tables("Query").Rows.Count <> 0 Then
            Return True
        End If
        Return False
    End Function
End Class
