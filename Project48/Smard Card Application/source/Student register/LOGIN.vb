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
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Password As System.Windows.Forms.TextBox
    Friend WithEvents CheckLogin As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Password = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.CheckLogin = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'Password
        '
        Me.Password.BackColor = System.Drawing.SystemColors.InactiveBorder
        Me.Password.Location = New System.Drawing.Point(16, 40)
        Me.Password.Name = "Password"
        Me.Password.PasswordChar = Microsoft.VisualBasic.ChrW(42)
        Me.Password.Size = New System.Drawing.Size(160, 24)
        Me.Password.TabIndex = 0
        Me.Password.Text = ""
        '
        'Label1
        '
        Me.Label1.BackColor = System.Drawing.Color.SlateGray
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(16, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(176, 16)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "กรุณากรอกรหัสผ่านของบัตร"
        '
        'CheckLogin
        '
        Me.CheckLogin.BackColor = System.Drawing.Color.CadetBlue
        Me.CheckLogin.Location = New System.Drawing.Point(192, 24)
        Me.CheckLogin.Name = "CheckLogin"
        Me.CheckLogin.Size = New System.Drawing.Size(80, 40)
        Me.CheckLogin.TabIndex = 2
        Me.CheckLogin.Text = "Login"
        '
        'LOGIN
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.Color.SlateGray
        Me.ClientSize = New System.Drawing.Size(280, 77)
        Me.Controls.Add(Me.CheckLogin)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.Password)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "LOGIN"
        Me.Text = "ตรวจสอบรหัสผ่าน"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim tempPWD As String = ""
    Dim Nub As Integer
    Private Sub CheckLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckLogin.Click
        If Nub <> 2 Then
            If Password.Text <> tempPWD Then
                Nub = Nub + 1
                MsgBox("รหัสผิดพลาดกรุณากรอกข้อมูลใหม่")
                Password.Clear()
            Else
                Pwd = True
                Me.Close()
            End If
        Else
            If Password.Text = tempPWD Then
                Pwd = True
            Else
                MsgBox("รหัสนี้ได้กรอกข้อมูลไปแล้ว 3 ครั้งไม่สามารถทำการกรอกได้อีก")
                Student_ID = ""
            End If

            Me.Close()
        End If

    End Sub

    Private Sub LOGIN_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        tempPWD = DataOfCard
        Nub = 0
    End Sub
End Class
