Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Imports System.Text
Public Class Admin
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
    Friend WithEvents TxtAdmin As System.Windows.Forms.TextBox
    Friend WithEvents Button1 As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.TxtAdmin = New System.Windows.Forms.TextBox
        Me.Button1 = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'TxtAdmin
        '
        Me.TxtAdmin.Location = New System.Drawing.Point(8, 16)
        Me.TxtAdmin.Name = "TxtAdmin"
        Me.TxtAdmin.PasswordChar = Microsoft.VisualBasic.ChrW(48)
        Me.TxtAdmin.Size = New System.Drawing.Size(168, 24)
        Me.TxtAdmin.TabIndex = 0
        Me.TxtAdmin.Text = ""
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(184, 8)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(96, 40)
        Me.Button1.TabIndex = 1
        Me.Button1.Text = "Check"
        '
        'Admin
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.ClientSize = New System.Drawing.Size(292, 54)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.TxtAdmin)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Admin"
        Me.Text = "Admin"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable


    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click

        Dim sql As String = ""
        If TxtAdmin.Text <> "" Then

            sql = "select * from Admin where password = '" + TxtAdmin.Text + "'"
            'MsgBox(sql)
            da = New SqlDataAdapter(sql, Conn)
            ds.Tables.Clear()
            da.Fill(ds, "Query")
            If ds.Tables("Query").Rows.Count <> 0 Then
                AdminCheck = True
            Else
                AdminCheck = False
            End If
        End If
            Me.Close()
    End Sub

    Private Sub Admin_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        AdminCheck = False
        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With
    End Sub
End Class
