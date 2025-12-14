Public Class WaitUpdate
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
    Friend WithEvents Textsdt As System.Windows.Forms.Label
    Friend WithEvents State As System.Windows.Forms.Label
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.Textsdt = New System.Windows.Forms.Label
        Me.State = New System.Windows.Forms.Label
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.SuspendLayout()
        '
        'Textsdt
        '
        Me.Textsdt.Location = New System.Drawing.Point(88, 8)
        Me.Textsdt.Name = "Textsdt"
        Me.Textsdt.Size = New System.Drawing.Size(120, 23)
        Me.Textsdt.TabIndex = 0
        Me.Textsdt.Text = "กำลังบันทึกลงบัตร"
        '
        'State
        '
        Me.State.Location = New System.Drawing.Point(8, 32)
        Me.State.Name = "State"
        Me.State.Size = New System.Drawing.Size(280, 56)
        Me.State.TabIndex = 1
        '
        'Timer1
        '
        Me.Timer1.Interval = 150
        '
        'WaitUpdate
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.ClientSize = New System.Drawing.Size(292, 94)
        Me.ControlBox = False
        Me.Controls.Add(Me.State)
        Me.Controls.Add(Me.Textsdt)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.MaximizeBox = False
        Me.Name = "WaitUpdate"
        Me.ShowInTaskbar = False
        Me.Text = "กำลังบันทึก"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub WaitUpdate_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        State.Text = ""
        Timer1.Enabled = True
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        State.Text = State.Text + "0"
    End Sub
End Class
