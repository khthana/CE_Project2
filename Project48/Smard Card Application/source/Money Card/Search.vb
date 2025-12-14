Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Imports System.Text
Public Class Search
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
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents BnSearch As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents DateEnd As System.Windows.Forms.DateTimePicker
    Friend WithEvents DateStart As System.Windows.Forms.DateTimePicker
    Friend WithEvents CboType As System.Windows.Forms.ComboBox
    Friend WithEvents TxtData As System.Windows.Forms.TextBox
    Friend WithEvents SearchShow As System.Windows.Forms.DataGrid
    Friend WithEvents BnExit As System.Windows.Forms.Button
    Friend WithEvents PrPreView As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.DateEnd = New System.Windows.Forms.DateTimePicker
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label1 = New System.Windows.Forms.Label
        Me.BnSearch = New System.Windows.Forms.Button
        Me.DateStart = New System.Windows.Forms.DateTimePicker
        Me.CboType = New System.Windows.Forms.ComboBox
        Me.TxtData = New System.Windows.Forms.TextBox
        Me.SearchShow = New System.Windows.Forms.DataGrid
        Me.BnExit = New System.Windows.Forms.Button
        Me.PrPreView = New System.Windows.Forms.Button
        Me.GroupBox1.SuspendLayout()
        CType(Me.SearchShow, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.GroupBox1.Controls.Add(Me.DateEnd)
        Me.GroupBox1.Controls.Add(Me.Label4)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Controls.Add(Me.BnSearch)
        Me.GroupBox1.Controls.Add(Me.DateStart)
        Me.GroupBox1.Controls.Add(Me.CboType)
        Me.GroupBox1.Controls.Add(Me.TxtData)
        Me.GroupBox1.FlatStyle = System.Windows.Forms.FlatStyle.System
        Me.GroupBox1.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.GroupBox1.Location = New System.Drawing.Point(8, 8)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(776, 88)
        Me.GroupBox1.TabIndex = 1
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "ข้อมูลที่ท่านต้องการค้น"
        '
        'DateEnd
        '
        Me.DateEnd.Location = New System.Drawing.Point(480, 56)
        Me.DateEnd.Name = "DateEnd"
        Me.DateEnd.TabIndex = 8
        '
        'Label4
        '
        Me.Label4.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Label4.Location = New System.Drawing.Point(432, 56)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(48, 23)
        Me.Label4.TabIndex = 7
        Me.Label4.Text = "ถึงวันที่"
        '
        'Label3
        '
        Me.Label3.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Label3.Location = New System.Drawing.Point(416, 24)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(64, 23)
        Me.Label3.TabIndex = 6
        Me.Label3.Text = "ตั้งแต่วันที่"
        '
        'Label2
        '
        Me.Label2.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Label2.Location = New System.Drawing.Point(248, 32)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(120, 23)
        Me.Label2.TabIndex = 5
        Me.Label2.Text = "เลือกประเภทข้อมูล"
        '
        'Label1
        '
        Me.Label1.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Label1.Location = New System.Drawing.Point(56, 32)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(144, 23)
        Me.Label1.TabIndex = 4
        Me.Label1.Text = "ใส่ข้อมูลที่ต้องการค้น"
        '
        'BnSearch
        '
        Me.BnSearch.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.BnSearch.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.BnSearch.Location = New System.Drawing.Point(688, 24)
        Me.BnSearch.Name = "BnSearch"
        Me.BnSearch.Size = New System.Drawing.Size(80, 56)
        Me.BnSearch.TabIndex = 3
        Me.BnSearch.Text = "ค้นข้อมูล"
        '
        'DateStart
        '
        Me.DateStart.Location = New System.Drawing.Point(480, 24)
        Me.DateStart.Name = "DateStart"
        Me.DateStart.TabIndex = 2
        '
        'CboType
        '
        Me.CboType.Items.AddRange(New Object() {"รหัสนักศึกษา", "ชื่อนักศึกษา", "นามสกุลนักศึกษา", "จำนวนเงิน"})
        Me.CboType.Location = New System.Drawing.Point(224, 56)
        Me.CboType.Name = "CboType"
        Me.CboType.Size = New System.Drawing.Size(176, 26)
        Me.CboType.TabIndex = 1
        '
        'TxtData
        '
        Me.TxtData.Location = New System.Drawing.Point(8, 56)
        Me.TxtData.Name = "TxtData"
        Me.TxtData.Size = New System.Drawing.Size(208, 24)
        Me.TxtData.TabIndex = 0
        Me.TxtData.Text = ""
        '
        'SearchShow
        '
        Me.SearchShow.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.SearchShow.CaptionBackColor = System.Drawing.SystemColors.ControlDark
        Me.SearchShow.DataMember = ""
        Me.SearchShow.ForeColor = System.Drawing.SystemColors.HighlightText
        Me.SearchShow.HeaderBackColor = System.Drawing.SystemColors.AppWorkspace
        Me.SearchShow.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.SearchShow.Location = New System.Drawing.Point(8, 96)
        Me.SearchShow.Name = "SearchShow"
        Me.SearchShow.ParentRowsForeColor = System.Drawing.SystemColors.HighlightText
        Me.SearchShow.Size = New System.Drawing.Size(776, 456)
        Me.SearchShow.TabIndex = 3
        '
        'BnExit
        '
        Me.BnExit.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.BnExit.Location = New System.Drawing.Point(680, 560)
        Me.BnExit.Name = "BnExit"
        Me.BnExit.Size = New System.Drawing.Size(104, 32)
        Me.BnExit.TabIndex = 6
        Me.BnExit.Text = "Exit"
        '
        'PrPreView
        '
        Me.PrPreView.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.PrPreView.Location = New System.Drawing.Point(552, 560)
        Me.PrPreView.Name = "PrPreView"
        Me.PrPreView.Size = New System.Drawing.Size(120, 32)
        Me.PrPreView.TabIndex = 8
        Me.PrPreView.Text = "Print Preview"
        '
        'Search
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.ClientSize = New System.Drawing.Size(792, 598)
        Me.Controls.Add(Me.PrPreView)
        Me.Controls.Add(Me.BnExit)
        Me.Controls.Add(Me.SearchShow)
        Me.Controls.Add(Me.GroupBox1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.IsMdiContainer = True
        Me.Name = "Search"
        Me.Text = "ค้นข้อมูล"
        Me.GroupBox1.ResumeLayout(False)
        CType(Me.SearchShow, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    ' print document*********************
    '*/*****************************

    Dim InfoDate As DateTimeFormatInfo
    Dim IsFind As Boolean
    Private PrSql As String = ""
    Private PrCondition As String = ""
    Dim DateCur As Date


    Private Sub Search_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Maximized
        Cursor.Current = Cursors.WaitCursor

        InfoDate = DateTimeFormatInfo.InvariantInfo
        IsFind = False
        PrSql = ""
        PrCondition = ""
        With CboType
            .SelectedIndex = 0
        End With

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        PrPreView.Enabled = False
    End Sub
    Private Sub FormatDataGrid(ByVal data As String)

        da = New SqlDataAdapter(data, Conn)
        If IsFind Then
            ds.Tables("CardMoney").Clear()
        End If
        da.Fill(ds, "CardMoney")
        If ds.Tables("CardMoney").Rows.Count = 0 Then
            IsFind = False
            PrSql = ""
            PrCondition = ""
            PrPreView.Enabled = False
            MessageBox.Show("ไม่พบรายการที่ท่านเลือก กรุณาเลือกอีกครั้ง ", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
        Else
            Me.SearchShow.Enabled = True
            PrPreView.Enabled = True
            PrSql = data
            IsFind = True
            With SearchShow
                .ReadOnly = True
                .DataSource = ds.Tables("CardMoney")
            End With

            Dim GrdTs As DataGridTableStyle = New DataGridTableStyle
            With GrdTs
                .AlternatingBackColor = Color.White
                .BackColor = Color.WhiteSmoke
                .MappingName = "CardMoney"
            End With

            Dim cs1 As New DataGridTextBoxColumn
            With cs1
                .HeaderText = "รหัสนักศึกษา"
                .MappingName = "Std_ID"
                .ReadOnly = True
                .Width = 100
            End With
            GrdTs.GridColumnStyles.Add(cs1)

            Dim cs2 As New DataGridTextBoxColumn
            With cs2
                .HeaderText = "ชื่อนักศึกษา"
                .MappingName = "Name"
                .ReadOnly = True
                .Width = 150
            End With
            GrdTs.GridColumnStyles.Add(cs2)

            Dim cs3 As New DataGridTextBoxColumn
            With cs3
                .HeaderText = "นามสกุล"
                .MappingName = "SurName"
                .ReadOnly = True
                .Width = 150
            End With
            GrdTs.GridColumnStyles.Add(cs3)

            Dim cs4 As New DataGridTextBoxColumn
            With cs4
                .HeaderText = "จำนวนเงิน"
                .MappingName = "Money"
                .ReadOnly = True
                .Width = 100
            End With
            GrdTs.GridColumnStyles.Add(cs4)

            Dim cs7 As New DataGridTextBoxColumn
            With cs7
                .HeaderText = "วันที่เติม(ว/ด/ป)"
                .MappingName = "DateCurrent"
                .ReadOnly = True
                .Width = 150
            End With
            GrdTs.GridColumnStyles.Add(cs7)

            With SearchShow
                .TableStyles.Clear()
                .CaptionText = "รายการที่เติมเงิน"
                .FlatMode = True
                .TableStyles.Add(GrdTs)
            End With
        End If

    End Sub

    Private Sub BnSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BnSearch.Click
        Dim TextStatus As Boolean
        If TxtData.Text = "" Then
            TextStatus = False
        Else
            TextStatus = True
        End If
        If DateStart.Value > DateEnd.Value Then
            MessageBox.Show("วันที่ ที่คุณเลือกไม่ตรงตามความเป็นจริง กรุณาทำการเลือกอีกครั้ง", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            Exit Sub
        End If
        Dim sql As String = "Select * From CardMoney Where "
        sql = sql & " (DateCurrent BETWEEN '" & DateStart.Value.ToString("d", InfoDate)
        sql = sql & "' and '" & DateEnd.Value.ToString("d", InfoDate) & "')"
        If TextStatus Then
            Select Case CboType.Text
                Case "รหัสนักศึกษา"
                    sql = sql + " and Std_ID LIKE '%" + TxtData.Text + "%'"
                    PrCondition = PrCondition + " and Std_ID LIKE '%" + TxtData.Text + "%'"
                Case "ชื่อนักศึกษา"
                    sql = sql + " and Name LIKE '%" + TxtData.Text + "%'"
                    PrCondition = PrCondition + " and Name LIKE '%" + TxtData.Text + "%'"
                Case "นามสกุลนักศึกษา"
                    sql = sql + " and SurName LIKE '%" + TxtData.Text + "%'"
                    PrCondition = PrCondition + " and SurName LIKE '%" + TxtData.Text + "%'"
                Case "จำนวนเงิน"
                    If IsNumber() Then
                        sql = sql + " and Money =" + TxtData.Text
                        PrCondition = PrCondition + " and Money =" + TxtData.Text
                    Else
                        MessageBox.Show("กรุณาใส่ข้อมูลให้ถูกต้อง", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                        Exit Sub
                    End If
            End Select
        End If

        PrCondition = sql
        FormatDataGrid(sql)

    End Sub
    Private Function IsNumber() As Boolean
        Dim txtLength As Integer = TxtData.TextLength
        Dim i As Integer = 0
        While i < txtLength
            If TxtData.Text.Chars(i).IsLetter(TxtData.Text.Chars(i)) Then
                Return False
            End If
            i = i + 1
        End While
        Return True
    End Function

    Private Sub BnExit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BnExit.Click
        Me.Close()
    End Sub

    Private Sub PrPreView_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PrPreView.Click

        IsFind = False
        Stdate = "ตั้งแต่วันที่   " + DateStart.Text + "  ถึงวันที่  " + DateEnd.Text
        SrData = TxtData.Text
        SrTypeData = CboType.Text

        Dim frmDynamicPrint As New frmPrintDynamicForm
        frmDynamicPrint.SqlSet = PrSql
        frmDynamicPrint.DateString = Now.ToString
        frmDynamicPrint.WrapTextFlag = True
        frmDynamicPrint.InitPrint()
        frmDynamicPrint.PrintPreview()
        frmDynamicPrint.Dispose()

    End Sub
End Class
