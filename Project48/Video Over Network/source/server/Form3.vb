Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlCommand

Public Class Form3
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
    Friend WithEvents LinkLabel1 As System.Windows.Forms.LinkLabel
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents txtStream As System.Windows.Forms.TextBox
    Friend WithEvents ListBox1 As System.Windows.Forms.ListBox
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents Button2 As System.Windows.Forms.Button
    Friend WithEvents Button3 As System.Windows.Forms.Button
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox2 As System.Windows.Forms.TextBox
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents ComboBox1 As System.Windows.Forms.ComboBox
    Friend WithEvents LinkLabel8 As System.Windows.Forms.LinkLabel
    Friend WithEvents TextBox3 As System.Windows.Forms.TextBox
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents ComboBox2 As System.Windows.Forms.ComboBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Label2 = New System.Windows.Forms.Label
        Me.LinkLabel1 = New System.Windows.Forms.LinkLabel
        Me.txtStream = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.TextBox2 = New System.Windows.Forms.TextBox
        Me.TextBox1 = New System.Windows.Forms.TextBox
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.Button3 = New System.Windows.Forms.Button
        Me.Button2 = New System.Windows.Forms.Button
        Me.Button1 = New System.Windows.Forms.Button
        Me.ListBox1 = New System.Windows.Forms.ListBox
        Me.Label8 = New System.Windows.Forms.Label
        Me.ComboBox1 = New System.Windows.Forms.ComboBox
        Me.LinkLabel8 = New System.Windows.Forms.LinkLabel
        Me.TextBox3 = New System.Windows.Forms.TextBox
        Me.Label11 = New System.Windows.Forms.Label
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.Label3 = New System.Windows.Forms.Label
        Me.ComboBox2 = New System.Windows.Forms.ComboBox
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.SuspendLayout()
        '
        'Label2
        '
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label2.Location = New System.Drawing.Point(208, 24)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(104, 16)
        Me.Label2.TabIndex = 3
        Me.Label2.Text = "Recorded Video"
        '
        'LinkLabel1
        '
        Me.LinkLabel1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, CType((System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Italic), System.Drawing.FontStyle), System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.LinkLabel1.LinkColor = System.Drawing.Color.FromArgb(CType(64, Byte), CType(64, Byte), CType(64, Byte))
        Me.LinkLabel1.Location = New System.Drawing.Point(168, 88)
        Me.LinkLabel1.Name = "LinkLabel1"
        Me.LinkLabel1.Size = New System.Drawing.Size(32, 16)
        Me.LinkLabel1.TabIndex = 2
        Me.LinkLabel1.TabStop = True
        Me.LinkLabel1.Text = "Edit"
        '
        'txtStream
        '
        Me.txtStream.Location = New System.Drawing.Point(112, 80)
        Me.txtStream.Name = "txtStream"
        Me.txtStream.ReadOnly = True
        Me.txtStream.Size = New System.Drawing.Size(48, 20)
        Me.txtStream.TabIndex = 1
        Me.txtStream.Text = "8080"
        Me.txtStream.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label1.Location = New System.Drawing.Point(16, 24)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(104, 16)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Streaming Content"
        '
        'Label6
        '
        Me.Label6.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label6.ForeColor = System.Drawing.Color.Red
        Me.Label6.Location = New System.Drawing.Point(88, 24)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(320, 16)
        Me.Label6.TabIndex = 24
        '
        'TextBox2
        '
        Me.TextBox2.Location = New System.Drawing.Point(264, 96)
        Me.TextBox2.Name = "TextBox2"
        Me.TextBox2.PasswordChar = Microsoft.VisualBasic.ChrW(42)
        Me.TextBox2.ReadOnly = True
        Me.TextBox2.Size = New System.Drawing.Size(144, 20)
        Me.TextBox2.TabIndex = 23
        Me.TextBox2.Text = ""
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(264, 72)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.ReadOnly = True
        Me.TextBox1.Size = New System.Drawing.Size(144, 20)
        Me.TextBox1.TabIndex = 22
        Me.TextBox1.Text = ""
        '
        'Label5
        '
        Me.Label5.Location = New System.Drawing.Point(200, 104)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(64, 16)
        Me.Label5.TabIndex = 21
        Me.Label5.Text = "Password"
        '
        'Label4
        '
        Me.Label4.Location = New System.Drawing.Point(200, 80)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(64, 16)
        Me.Label4.TabIndex = 20
        Me.Label4.Text = "Username"
        '
        'Button3
        '
        Me.Button3.Location = New System.Drawing.Point(352, 136)
        Me.Button3.Name = "Button3"
        Me.Button3.Size = New System.Drawing.Size(56, 22)
        Me.Button3.TabIndex = 19
        Me.Button3.Text = "Edit"
        '
        'Button2
        '
        Me.Button2.Location = New System.Drawing.Point(280, 136)
        Me.Button2.Name = "Button2"
        Me.Button2.Size = New System.Drawing.Size(56, 22)
        Me.Button2.TabIndex = 18
        Me.Button2.Text = "Remove"
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(208, 136)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(56, 22)
        Me.Button1.TabIndex = 17
        Me.Button1.Text = "Add"
        '
        'ListBox1
        '
        Me.ListBox1.Location = New System.Drawing.Point(24, 48)
        Me.ListBox1.Name = "ListBox1"
        Me.ListBox1.Size = New System.Drawing.Size(160, 134)
        Me.ListBox1.TabIndex = 0
        '
        'Label8
        '
        Me.Label8.Location = New System.Drawing.Point(24, 24)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(64, 16)
        Me.Label8.TabIndex = 26
        Me.Label8.Text = "Username"
        '
        'ComboBox1
        '
        Me.ComboBox1.Items.AddRange(New Object() {"8081", "8082", "8083", "8084", "8085"})
        Me.ComboBox1.Location = New System.Drawing.Point(304, 48)
        Me.ComboBox1.Name = "ComboBox1"
        Me.ComboBox1.Size = New System.Drawing.Size(48, 21)
        Me.ComboBox1.TabIndex = 27
        Me.ComboBox1.Text = "8081"
        '
        'LinkLabel8
        '
        Me.LinkLabel8.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, CType((System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Italic), System.Drawing.FontStyle), System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.LinkLabel8.LinkColor = System.Drawing.Color.FromArgb(CType(64, Byte), CType(64, Byte), CType(64, Byte))
        Me.LinkLabel8.Location = New System.Drawing.Point(360, 88)
        Me.LinkLabel8.Name = "LinkLabel8"
        Me.LinkLabel8.Size = New System.Drawing.Size(32, 16)
        Me.LinkLabel8.TabIndex = 28
        Me.LinkLabel8.TabStop = True
        Me.LinkLabel8.Text = "Edit"
        '
        'TextBox3
        '
        Me.TextBox3.Location = New System.Drawing.Point(304, 80)
        Me.TextBox3.Name = "TextBox3"
        Me.TextBox3.ReadOnly = True
        Me.TextBox3.Size = New System.Drawing.Size(48, 20)
        Me.TextBox3.TabIndex = 31
        Me.TextBox3.Text = "8081"
        '
        'Label11
        '
        Me.Label11.Location = New System.Drawing.Point(208, 56)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(96, 16)
        Me.Label11.TabIndex = 32
        Me.Label11.Text = "Port Number List"
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.Button2)
        Me.GroupBox1.Controls.Add(Me.Button3)
        Me.GroupBox1.Controls.Add(Me.Label4)
        Me.GroupBox1.Controls.Add(Me.Label5)
        Me.GroupBox1.Controls.Add(Me.TextBox1)
        Me.GroupBox1.Controls.Add(Me.TextBox2)
        Me.GroupBox1.Controls.Add(Me.Label8)
        Me.GroupBox1.Controls.Add(Me.ListBox1)
        Me.GroupBox1.Controls.Add(Me.Button1)
        Me.GroupBox1.Controls.Add(Me.Label6)
        Me.GroupBox1.Location = New System.Drawing.Point(16, 8)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(424, 200)
        Me.GroupBox1.TabIndex = 33
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "User account list"
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.Label3)
        Me.GroupBox2.Controls.Add(Me.ComboBox2)
        Me.GroupBox2.Controls.Add(Me.txtStream)
        Me.GroupBox2.Controls.Add(Me.Label2)
        Me.GroupBox2.Controls.Add(Me.TextBox3)
        Me.GroupBox2.Controls.Add(Me.Label1)
        Me.GroupBox2.Controls.Add(Me.ComboBox1)
        Me.GroupBox2.Controls.Add(Me.LinkLabel1)
        Me.GroupBox2.Controls.Add(Me.Label11)
        Me.GroupBox2.Controls.Add(Me.LinkLabel8)
        Me.GroupBox2.Location = New System.Drawing.Point(16, 216)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(424, 120)
        Me.GroupBox2.TabIndex = 34
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Broadcast port"
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(16, 56)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(96, 16)
        Me.Label3.TabIndex = 34
        Me.Label3.Text = "Port Number List"
        '
        'ComboBox2
        '
        Me.ComboBox2.Items.AddRange(New Object() {"8080", "1000", "2000", "3000"})
        Me.ComboBox2.Location = New System.Drawing.Point(112, 50)
        Me.ComboBox2.Name = "ComboBox2"
        Me.ComboBox2.Size = New System.Drawing.Size(48, 21)
        Me.ComboBox2.TabIndex = 33
        Me.ComboBox2.Text = "8080"
        '
        'Form3
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(456, 352)
        Me.Controls.Add(Me.GroupBox2)
        Me.Controls.Add(Me.GroupBox1)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.SizableToolWindow
        Me.Name = "Form3"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent
        Me.Text = "User Account"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox2.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region
    Dim Broadcast As Integer
    Dim p1 As Integer, p2 As Integer, p3 As Integer, p4 As Integer, p0 As Integer
    Dim objectConn As SqlConnection
    Dim cmd As SqlCommand
    Dim reader As SqlDataReader
    Dim index As Integer, index1 As Integer

    Private Sub Form3_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        createConnection()
        showCommand()
        updateDisplay()
        index = 0
        index1 = 0
    End Sub

    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        If LinkLabel1.Text = "Edit" Then
            txtStream.ReadOnly = False
            LinkLabel1.Text = "OK"
        ElseIf LinkLabel1.Text = "OK" Then
            txtStream.ReadOnly = True
            LinkLabel1.Text = "Edit"
            ComboBox2.Items(index1) = Convert.ToInt32(txtStream.Text)
        End If
    End Sub

    Public Sub createConnection()
        Dim strConn As String = "Data Source= DBServer; Initial Catalog= CCTV; User ID= sa; Password= 123456"
        objectConn = New SqlConnection("Data Source=localhost; Initial Catalog=CCTV;" & _
        "User ID=sa; Password=123456;")
        objectConn.Open()
    End Sub

    Public Sub showCommand()
        Dim sqlCmd As String = "select Username, Password from Account"
        cmd = New SqlCommand(sqlCmd, objectConn)
        reader = cmd.ExecuteReader()
    End Sub

    Public Sub updateDisplay()
        ListBox1.Items.Clear()
        Dim str As String
        While reader.Read()
            str = reader.Item("Username")
            ListBox1.Items.Add(str)
            str = ""
        End While
        objectConn.Close()
    End Sub

    'Edit Button
    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim oldName As String, oldPass As String
        Dim strUname As String = ListBox1.GetItemText(ListBox1.SelectedItem)
        Dim sqlCmd As String = "select Username, Password from Account where (Username = '" & strUname & "')"
        If Button3.Text = "Edit" Then
            createConnection()
            cmd = New SqlCommand(sqlCmd, objectConn)
            reader = cmd.ExecuteReader()
            While reader.Read()
                TextBox1.Text = reader.Item("Username")
                TextBox2.Text = reader.Item("Password")
            End While
            oldName = TextBox1.Text
            oldPass = TextBox2.Text
            TextBox1.ReadOnly = False
            TextBox2.ReadOnly = False
            Button3.Text = "OK"
            Button1.Enabled = False
            Button2.Enabled = False
            objectConn.Close()
        ElseIf Button3.Text = "OK" Then
            Dim name As String = TextBox1.Text
            Dim pass As String = TextBox2.Text
            sqlCmd = "update Account set Username = '" & name & "', Password = '" & pass & "' where ((Username = '" & oldName & "') and (Password = '" & oldPass & "'))"
            createConnection()
            cmd = New SqlCommand(sqlCmd, objectConn)
            cmd.ExecuteNonQuery()
            TextBox1.ReadOnly = True
            TextBox2.ReadOnly = True
            Button3.Text = "Edit"
            Button1.Enabled = True
            Button2.Enabled = True
            TextBox1.Text = ""
            TextBox2.Text = ""
            showCommand()
            updateDisplay()
        End If
    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Button1.Text = "Add" Then
            TextBox1.ReadOnly = False
            TextBox2.ReadOnly = False
            Button3.Enabled = False
            Button2.Enabled = False
            Button1.Text = "OK"
        ElseIf Button1.Text = "OK" Then
            Dim name As String = TextBox1.Text
            Dim pass As String = TextBox2.Text
            Dim sqlCmd As String = "insert into Account (Username, Password) values ('" & name & "', '" & pass & "')"
            createConnection()
            cmd = New SqlCommand(sqlCmd, objectConn)
            cmd.ExecuteNonQuery()
            TextBox1.ReadOnly = True
            TextBox2.ReadOnly = True
            Button3.Enabled = True
            Button2.Enabled = True
            Button1.Text = "Add"
            TextBox1.Text = ""
            TextBox2.Text = ""
            showCommand()
            updateDisplay()
        End If
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim strUname As String = ListBox1.GetItemText(ListBox1.SelectedItem)
        Dim sqlCmd As String = "delete from Account where (Username = '" & strUname & "')"
        createConnection()
        cmd = New SqlCommand(sqlCmd, objectConn)
        cmd.ExecuteNonQuery()
        showCommand()
        updateDisplay()
    End Sub

    Private Sub ComboBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ComboBox1.SelectedIndexChanged
        TextBox3.Text = ComboBox1.Text
        index = ComboBox1.SelectedIndex
    End Sub

    Private Sub LinkLabel8_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel8.LinkClicked
        If LinkLabel8.Text = "Edit" Then
            TextBox3.ReadOnly = False
            LinkLabel8.Text = "OK"
        ElseIf LinkLabel8.Text = "OK" Then
            TextBox3.ReadOnly = True
            LinkLabel8.Text = "Edit"
            ComboBox1.Items(index) = Convert.ToInt32(TextBox3.Text)
        End If
    End Sub

    Private Sub ComboBox2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ComboBox2.SelectedIndexChanged
        txtStream.Text = ComboBox2.Text
        index1 = ComboBox2.SelectedIndex
    End Sub
End Class
