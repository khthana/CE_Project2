
Public Class RegisCard
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
    Friend WithEvents Std_ID As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Pwd As System.Windows.Forms.TextBox
    Friend WithEvents RePwd As System.Windows.Forms.TextBox
    Friend WithEvents BSave As System.Windows.Forms.Button
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents TxtName As System.Windows.Forms.Label
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label
        Me.Std_ID = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Pwd = New System.Windows.Forms.TextBox
        Me.RePwd = New System.Windows.Forms.TextBox
        Me.BSave = New System.Windows.Forms.Button
        Me.Label4 = New System.Windows.Forms.Label
        Me.TxtName = New System.Windows.Forms.Label
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.BackColor = System.Drawing.SystemColors.ControlDark
        Me.Label1.Location = New System.Drawing.Point(40, 40)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(88, 23)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "รหัสนักศึกษา"
        '
        'Std_ID
        '
        Me.Std_ID.BackColor = System.Drawing.SystemColors.ControlLight
        Me.Std_ID.Enabled = False
        Me.Std_ID.Location = New System.Drawing.Point(136, 40)
        Me.Std_ID.Name = "Std_ID"
        Me.Std_ID.Size = New System.Drawing.Size(216, 24)
        Me.Std_ID.TabIndex = 2
        Me.Std_ID.Text = ""
        '
        'Label2
        '
        Me.Label2.BackColor = System.Drawing.SystemColors.ControlDark
        Me.Label2.Location = New System.Drawing.Point(72, 96)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(56, 23)
        Me.Label2.TabIndex = 3
        Me.Label2.Text = "รหัสผ่าน"
        '
        'Label3
        '
        Me.Label3.BackColor = System.Drawing.SystemColors.ControlDark
        Me.Label3.Location = New System.Drawing.Point(32, 128)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(96, 23)
        Me.Label3.TabIndex = 4
        Me.Label3.Text = "ยืนยันรหัสผ่าน"
        '
        'Pwd
        '
        Me.Pwd.BackColor = System.Drawing.SystemColors.ControlLightLight
        Me.Pwd.Location = New System.Drawing.Point(136, 96)
        Me.Pwd.MaxLength = 8
        Me.Pwd.Name = "Pwd"
        Me.Pwd.PasswordChar = Microsoft.VisualBasic.ChrW(42)
        Me.Pwd.Size = New System.Drawing.Size(136, 24)
        Me.Pwd.TabIndex = 5
        Me.Pwd.Text = ""
        '
        'RePwd
        '
        Me.RePwd.BackColor = System.Drawing.SystemColors.InactiveCaptionText
        Me.RePwd.Location = New System.Drawing.Point(136, 128)
        Me.RePwd.MaxLength = 8
        Me.RePwd.Name = "RePwd"
        Me.RePwd.PasswordChar = Microsoft.VisualBasic.ChrW(42)
        Me.RePwd.Size = New System.Drawing.Size(136, 24)
        Me.RePwd.TabIndex = 6
        Me.RePwd.Text = ""
        '
        'BSave
        '
        Me.BSave.Location = New System.Drawing.Point(272, 168)
        Me.BSave.Name = "BSave"
        Me.BSave.Size = New System.Drawing.Size(112, 48)
        Me.BSave.TabIndex = 7
        Me.BSave.Text = "ตกลง"
        '
        'Label4
        '
        Me.Label4.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.Label4.ForeColor = System.Drawing.Color.GreenYellow
        Me.Label4.Location = New System.Drawing.Point(136, 72)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(160, 23)
        Me.Label4.TabIndex = 9
        Me.Label4.Text = "รหัสผ่าน 4 ตัวอักษรขึ้นไป"
        '
        'TxtName
        '
        Me.TxtName.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.TxtName.Location = New System.Drawing.Point(40, 8)
        Me.TxtName.Name = "TxtName"
        Me.TxtName.Size = New System.Drawing.Size(312, 24)
        Me.TxtName.TabIndex = 10
        '
        'RegisCard
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.SystemColors.Control
        Me.ClientSize = New System.Drawing.Size(392, 229)
        Me.Controls.Add(Me.TxtName)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.BSave)
        Me.Controls.Add(Me.RePwd)
        Me.Controls.Add(Me.Pwd)
        Me.Controls.Add(Me.Std_ID)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.IsMdiContainer = True
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "RegisCard"
        Me.Text = "ลงทะเบียนบัตรนักศึกษา"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub RegisCard_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Std_ID.Text = Student_ID
        TxtName.Text = EthaiNM + "  " + EThaiSurNM

    End Sub

    Private Sub BSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BSave.Click
        If Pwd.Text <> RePwd.Text Or Pwd.Text = "" Or Pwd.Text.Length < 4 Then
            MessageBox.Show("Password ของ คุณไม่ถูกต้อง ", "ข้อผิดพลาด", MessageBoxButtons.OK, MessageBoxIcon.Error)
            Pwd.Clear()
            RePwd.Clear()
        Else
            PwdToCard = Pwd.Text
            Me.Close()
        End If
    End Sub
End Class
