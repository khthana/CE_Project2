Imports System.Data
Imports System.Data.SqlClient
Public Class MonitorQueue
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
    Friend WithEvents TmRead As System.Windows.Forms.Timer
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.TmRead = New System.Windows.Forms.Timer(Me.components)
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("FreesiaUPC", 48.0!, System.Drawing.FontStyle.Underline, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label1.Location = New System.Drawing.Point(48, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(496, 64)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "รายชื่อที่ต้องมารับอาหาร"
        Me.Label1.TextAlign = System.Drawing.ContentAlignment.TopCenter
        '
        'Label2
        '
        Me.Label2.BackColor = System.Drawing.SystemColors.Desktop
        Me.Label2.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.Label2.Font = New System.Drawing.Font("FreesiaUPC", 26.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label2.ForeColor = System.Drawing.Color.Orange
        Me.Label2.Location = New System.Drawing.Point(48, 104)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(496, 48)
        Me.Label2.TabIndex = 2
        Me.Label2.TextAlign = System.Drawing.ContentAlignment.BottomLeft
        '
        'Label3
        '
        Me.Label3.BackColor = System.Drawing.SystemColors.Desktop
        Me.Label3.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.Label3.Font = New System.Drawing.Font("FreesiaUPC", 26.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label3.ForeColor = System.Drawing.Color.Orange
        Me.Label3.Location = New System.Drawing.Point(48, 160)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(496, 48)
        Me.Label3.TabIndex = 3
        Me.Label3.TextAlign = System.Drawing.ContentAlignment.BottomLeft
        '
        'Label4
        '
        Me.Label4.BackColor = System.Drawing.SystemColors.Desktop
        Me.Label4.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.Label4.Font = New System.Drawing.Font("FreesiaUPC", 26.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label4.ForeColor = System.Drawing.Color.Orange
        Me.Label4.Location = New System.Drawing.Point(48, 216)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(496, 56)
        Me.Label4.TabIndex = 4
        Me.Label4.TextAlign = System.Drawing.ContentAlignment.BottomLeft
        '
        'Label5
        '
        Me.Label5.BackColor = System.Drawing.SystemColors.Desktop
        Me.Label5.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.Label5.Font = New System.Drawing.Font("FreesiaUPC", 26.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label5.ForeColor = System.Drawing.Color.Orange
        Me.Label5.Location = New System.Drawing.Point(48, 280)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(496, 56)
        Me.Label5.TabIndex = 5
        Me.Label5.TextAlign = System.Drawing.ContentAlignment.BottomLeft
        '
        'Label6
        '
        Me.Label6.BackColor = System.Drawing.SystemColors.Desktop
        Me.Label6.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.Label6.Font = New System.Drawing.Font("FreesiaUPC", 26.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label6.ForeColor = System.Drawing.Color.Orange
        Me.Label6.Location = New System.Drawing.Point(48, 344)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(496, 56)
        Me.Label6.TabIndex = 6
        Me.Label6.TextAlign = System.Drawing.ContentAlignment.BottomLeft
        '
        'TmRead
        '
        '
        'MonitorQueue
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(20, 77)
        Me.ClientSize = New System.Drawing.Size(568, 406)
        Me.Controls.Add(Me.Label6)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Font = New System.Drawing.Font("FreesiaUPC", 48.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.IsMdiContainer = True
        Me.Name = "MonitorQueue"
        Me.Text = "รายการรับอาหาร"
        Me.ResumeLayout(False)

    End Sub

#End Region


    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable
    Public strConn As String = "server =(local);initial catalog=SmartFood;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"


    Private Sub MonitorQueue_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Normal
        TmRead.Enabled = True
    End Sub

    Private Sub TmRead_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TmRead.Tick
        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        ReadDatabase()

    End Sub
    Private Sub ReadDatabase()
        Dim sql As String = ""
        sql = "Select * from BayTemp"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Query")
        Dim MaxLenth As Integer = CInt(ds.Tables("Query").Rows.Count)
        If MaxLenth <> 0 Then
            Dim temp1 As String = CStr(ds.Tables("Query").Rows(0).Item("Name"))
            Dim temp2 As String = CStr(ds.Tables("Query").Rows(0).Item("SurName"))
            Dim temp3 As String = CStr(ds.Tables("Query").Rows(0).Item("FoodName"))
            Dim temp4 As String = CStr(ds.Tables("Query").Rows(0).Item("Cost"))
            Label2.Text = temp1 + "  " + temp2 + "      " + temp3 + "   " + temp4
            If MaxLenth > 1 Then
                temp1 = CStr(ds.Tables("Query").Rows(1).Item("Name"))
                temp2 = CStr(ds.Tables("Query").Rows(1).Item("SurName"))
                temp3 = CStr(ds.Tables("Query").Rows(1).Item("FoodName"))
                temp4 = CStr(ds.Tables("Query").Rows(1).Item("Cost"))
                Label3.Text = temp1 + "  " + temp2 + "      " + temp3 + "   " + temp4
            End If
            If MaxLenth > 2 Then
                temp1 = CStr(ds.Tables("Query").Rows(2).Item("Name"))
                temp2 = CStr(ds.Tables("Query").Rows(2).Item("SurName"))
                temp3 = CStr(ds.Tables("Query").Rows(2).Item("FoodName"))
                temp4 = CStr(ds.Tables("Query").Rows(2).Item("Cost"))
                Label4.Text = temp1 + "  " + temp2 + "      " + temp3 + "   " + temp4
            End If
            If MaxLenth > 3 Then
                temp1 = CStr(ds.Tables("Query").Rows(3).Item("Name"))
                temp2 = CStr(ds.Tables("Query").Rows(3).Item("SurName"))
                temp3 = CStr(ds.Tables("Query").Rows(3).Item("FoodName"))
                temp4 = CStr(ds.Tables("Query").Rows(3).Item("Cost"))
                Label5.Text = temp1 + "  " + temp2 + "      " + temp3 + "   " + temp4
            End If
            If MaxLenth > 4 Then
                temp1 = CStr(ds.Tables("Query").Rows(4).Item("Name"))
                temp2 = CStr(ds.Tables("Query").Rows(4).Item("SurName"))
                temp3 = CStr(ds.Tables("Query").Rows(4).Item("FoodName"))
                temp4 = CStr(ds.Tables("Query").Rows(4).Item("Cost"))
                Label6.Text = temp1 + "  " + temp2 + "      " + temp3 + "   " + temp4
            End If

        End If
    End Sub
End Class
