Public Class Form2
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
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents Title As System.Windows.Forms.TextBox
    Friend WithEvents Author As System.Windows.Forms.TextBox
    Friend WithEvents Copyright As System.Windows.Forms.TextBox
    Friend WithEvents Rating As System.Windows.Forms.TextBox
    Friend WithEvents Description As System.Windows.Forms.TextBox
    Friend WithEvents OK As System.Windows.Forms.Button
    Friend WithEvents Cancel As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.Label7 = New System.Windows.Forms.Label
        Me.Title = New System.Windows.Forms.TextBox
        Me.Author = New System.Windows.Forms.TextBox
        Me.Copyright = New System.Windows.Forms.TextBox
        Me.Rating = New System.Windows.Forms.TextBox
        Me.Description = New System.Windows.Forms.TextBox
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.Label8 = New System.Windows.Forms.Label
        Me.OK = New System.Windows.Forms.Button
        Me.Cancel = New System.Windows.Forms.Button
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label1.Location = New System.Drawing.Point(16, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(136, 16)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Display Information"
        '
        'Label2
        '
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label2.Location = New System.Drawing.Point(32, 40)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(408, 40)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "Specify information about your content (optional).  The information is displayed " & _
        "during  playback of the encode content."
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(24, 96)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(48, 16)
        Me.Label3.TabIndex = 2
        Me.Label3.Text = "Title"
        '
        'Label4
        '
        Me.Label4.Location = New System.Drawing.Point(24, 128)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(48, 16)
        Me.Label4.TabIndex = 3
        Me.Label4.Text = "Author"
        '
        'Label5
        '
        Me.Label5.Location = New System.Drawing.Point(24, 160)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(56, 16)
        Me.Label5.TabIndex = 4
        Me.Label5.Text = "Copyright"
        '
        'Label6
        '
        Me.Label6.Location = New System.Drawing.Point(24, 192)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(40, 16)
        Me.Label6.TabIndex = 5
        Me.Label6.Text = "Rating"
        '
        'Label7
        '
        Me.Label7.Location = New System.Drawing.Point(24, 224)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(68, 16)
        Me.Label7.TabIndex = 6
        Me.Label7.Text = "Description"
        '
        'Title
        '
        Me.Title.Location = New System.Drawing.Point(104, 96)
        Me.Title.Name = "Title"
        Me.Title.Size = New System.Drawing.Size(248, 20)
        Me.Title.TabIndex = 7
        Me.Title.Text = ""
        '
        'Author
        '
        Me.Author.Location = New System.Drawing.Point(104, 128)
        Me.Author.Name = "Author"
        Me.Author.Size = New System.Drawing.Size(248, 20)
        Me.Author.TabIndex = 8
        Me.Author.Text = ""
        '
        'Copyright
        '
        Me.Copyright.Location = New System.Drawing.Point(104, 156)
        Me.Copyright.Name = "Copyright"
        Me.Copyright.Size = New System.Drawing.Size(248, 20)
        Me.Copyright.TabIndex = 9
        Me.Copyright.Text = ""
        '
        'Rating
        '
        Me.Rating.Location = New System.Drawing.Point(104, 184)
        Me.Rating.Name = "Rating"
        Me.Rating.Size = New System.Drawing.Size(248, 20)
        Me.Rating.TabIndex = 10
        Me.Rating.Text = ""
        '
        'Description
        '
        Me.Description.Location = New System.Drawing.Point(104, 216)
        Me.Description.Multiline = True
        Me.Description.Name = "Description"
        Me.Description.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
        Me.Description.Size = New System.Drawing.Size(248, 64)
        Me.Description.TabIndex = 11
        Me.Description.Text = ""
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.Label8)
        Me.GroupBox1.ForeColor = System.Drawing.Color.DarkGoldenrod
        Me.GroupBox1.Location = New System.Drawing.Point(40, 296)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(376, 64)
        Me.GroupBox1.TabIndex = 12
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Tip !"
        '
        'Label8
        '
        Me.Label8.ForeColor = System.Drawing.Color.Black
        Me.Label8.Location = New System.Drawing.Point(56, 24)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(304, 32)
        Me.Label8.TabIndex = 13
        Me.Label8.Text = "You must enable  caption in window media player, to see this information"
        '
        'OK
        '
        Me.OK.DialogResult = System.Windows.Forms.DialogResult.OK
        Me.OK.Location = New System.Drawing.Point(152, 376)
        Me.OK.Name = "OK"
        Me.OK.Size = New System.Drawing.Size(64, 24)
        Me.OK.TabIndex = 13
        Me.OK.Text = "OK"
        '
        'Cancel
        '
        Me.Cancel.DialogResult = System.Windows.Forms.DialogResult.Cancel
        Me.Cancel.Location = New System.Drawing.Point(240, 376)
        Me.Cancel.Name = "Cancel"
        Me.Cancel.Size = New System.Drawing.Size(64, 24)
        Me.Cancel.TabIndex = 14
        Me.Cancel.Text = "Cancel"
        '
        'Form2
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(456, 413)
        Me.Controls.Add(Me.Cancel)
        Me.Controls.Add(Me.OK)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.Description)
        Me.Controls.Add(Me.Rating)
        Me.Controls.Add(Me.Copyright)
        Me.Controls.Add(Me.Author)
        Me.Controls.Add(Me.Title)
        Me.Controls.Add(Me.Label7)
        Me.Controls.Add(Me.Label6)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.SizableToolWindow
        Me.Name = "Form2"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent
        Me.Text = "Information Setting"
        Me.GroupBox1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub Form2_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub
End Class
