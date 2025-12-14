Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Imports System.Text
Public Class LoginUser
    Inherits System.Windows.Forms.Form

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"

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
    Friend WithEvents Username As System.Windows.Forms.TextBox
    Friend WithEvents Password As System.Windows.Forms.TextBox
    Friend WithEvents Login As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Username = New System.Windows.Forms.TextBox
        Me.Password = New System.Windows.Forms.TextBox
        Me.Login = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.Label1.Location = New System.Drawing.Point(56, 32)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(48, 23)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "User : "
        '
        'Label2
        '
        Me.Label2.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.Label2.Location = New System.Drawing.Point(16, 64)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(88, 23)
        Me.Label2.TabIndex = 2
        Me.Label2.Text = "Password :"
        '
        'Username
        '
        Me.Username.BackColor = System.Drawing.SystemColors.Info
        Me.Username.Location = New System.Drawing.Point(104, 24)
        Me.Username.MaxLength = 10
        Me.Username.Name = "Username"
        Me.Username.Size = New System.Drawing.Size(160, 24)
        Me.Username.TabIndex = 3
        Me.Username.Text = ""
        '
        'Password
        '
        Me.Password.BackColor = System.Drawing.SystemColors.Info
        Me.Password.Location = New System.Drawing.Point(104, 56)
        Me.Password.MaxLength = 10
        Me.Password.Name = "Password"
        Me.Password.PasswordChar = Microsoft.VisualBasic.ChrW(42)
        Me.Password.Size = New System.Drawing.Size(160, 24)
        Me.Password.TabIndex = 4
        Me.Password.Text = ""
        '
        'Login
        '
        Me.Login.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.Login.Location = New System.Drawing.Point(176, 96)
        Me.Login.Name = "Login"
        Me.Login.Size = New System.Drawing.Size(88, 40)
        Me.Login.TabIndex = 5
        Me.Login.Text = "เข้าใช้งาน"
        '
        'LoginUser
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.ClientSize = New System.Drawing.Size(288, 141)
        Me.Controls.Add(Me.Login)
        Me.Controls.Add(Me.Password)
        Me.Controls.Add(Me.Username)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.IsMdiContainer = True
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "LoginUser"
        Me.Text = "เข้าสู่ระบบ"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub Login_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Login.Click
        Dim sql As String = ""
        sql = "Select * From UserLogin Where Username = '" + Username.Text + "'"
        sql = sql + " and Password = '" + Password.Text + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Query1")
        If ds.Tables("Query1").Rows.Count <> 0 Then
            StatusUser = True
            Me.Close()
        Else
            StatusUser = False
            If MessageBox.Show("รหัสผิดพลาด ! ต้องการเข้าระบบการใช้งานเป็นนักศึกษา กด Yes  ", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) = DialogResult.Yes Then
                Me.Close()
            End If
        End If

    End Sub

    Private Sub LoginUser_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Normal
        Cursor.Current = Cursors.WaitCursor

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With
    End Sub
End Class
