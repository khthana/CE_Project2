Option Explicit On 
Option Strict On
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Public Class Health_Link
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
    Friend WithEvents Button2 As System.Windows.Forms.Button
    Friend WithEvents H_ID As System.Windows.Forms.TextBox
    Friend WithEvents DateCur As System.Windows.Forms.DateTimePicker
    Friend WithEvents AgeCur As System.Windows.Forms.TextBox
    Friend WithEvents TradeCur As System.Windows.Forms.TextBox
    Friend WithEvents HospitalCur As System.Windows.Forms.TextBox
    Friend WithEvents BodyCur As System.Windows.Forms.TextBox
    Friend WithEvents BEdit As System.Windows.Forms.Button
    Friend WithEvents BSave As System.Windows.Forms.Button
    Friend WithEvents CboStateCur As System.Windows.Forms.ComboBox
    Friend WithEvents BtnPrint As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.Label6 = New System.Windows.Forms.Label
        Me.Label7 = New System.Windows.Forms.Label
        Me.H_ID = New System.Windows.Forms.TextBox
        Me.DateCur = New System.Windows.Forms.DateTimePicker
        Me.AgeCur = New System.Windows.Forms.TextBox
        Me.TradeCur = New System.Windows.Forms.TextBox
        Me.HospitalCur = New System.Windows.Forms.TextBox
        Me.BodyCur = New System.Windows.Forms.TextBox
        Me.BEdit = New System.Windows.Forms.Button
        Me.Button2 = New System.Windows.Forms.Button
        Me.BSave = New System.Windows.Forms.Button
        Me.CboStateCur = New System.Windows.Forms.ComboBox
        Me.BtnPrint = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(24, 200)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(112, 23)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = " อาการที่ตรวจพบ"
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(48, 40)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(88, 23)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = " วันที่มาตรวจ"
        '
        'Label3
        '
        Me.Label3.Location = New System.Drawing.Point(40, 72)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(96, 23)
        Me.Label3.TabIndex = 2
        Me.Label3.Text = " อายุที่มาตรวจ"
        '
        'Label4
        '
        Me.Label4.Location = New System.Drawing.Point(8, 136)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(128, 23)
        Me.Label4.TabIndex = 3
        Me.Label4.Text = "สถานะทางครอบครัว"
        '
        'Label5
        '
        Me.Label5.Location = New System.Drawing.Point(16, 168)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(120, 23)
        Me.Label5.TabIndex = 4
        Me.Label5.Text = "สถานที่ทำการตรวจ"
        '
        'Label6
        '
        Me.Label6.Location = New System.Drawing.Point(88, 104)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(40, 23)
        Me.Label6.TabIndex = 5
        Me.Label6.Text = "อาชีพ"
        '
        'Label7
        '
        Me.Label7.Location = New System.Drawing.Point(64, 8)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(64, 24)
        Me.Label7.TabIndex = 6
        Me.Label7.Text = "รหัสผู้ป่วย"
        '
        'H_ID
        '
        Me.H_ID.Location = New System.Drawing.Point(136, 8)
        Me.H_ID.Name = "H_ID"
        Me.H_ID.Size = New System.Drawing.Size(200, 24)
        Me.H_ID.TabIndex = 7
        Me.H_ID.Text = ""
        '
        'DateCur
        '
        Me.DateCur.Location = New System.Drawing.Point(136, 40)
        Me.DateCur.Name = "DateCur"
        Me.DateCur.TabIndex = 8
        '
        'AgeCur
        '
        Me.AgeCur.Location = New System.Drawing.Point(136, 72)
        Me.AgeCur.Name = "AgeCur"
        Me.AgeCur.Size = New System.Drawing.Size(104, 24)
        Me.AgeCur.TabIndex = 9
        Me.AgeCur.Text = ""
        '
        'TradeCur
        '
        Me.TradeCur.Location = New System.Drawing.Point(136, 104)
        Me.TradeCur.Name = "TradeCur"
        Me.TradeCur.Size = New System.Drawing.Size(200, 24)
        Me.TradeCur.TabIndex = 10
        Me.TradeCur.Text = ""
        '
        'HospitalCur
        '
        Me.HospitalCur.Location = New System.Drawing.Point(136, 168)
        Me.HospitalCur.Name = "HospitalCur"
        Me.HospitalCur.Size = New System.Drawing.Size(200, 24)
        Me.HospitalCur.TabIndex = 12
        Me.HospitalCur.Text = ""
        '
        'BodyCur
        '
        Me.BodyCur.Location = New System.Drawing.Point(136, 200)
        Me.BodyCur.Multiline = True
        Me.BodyCur.Name = "BodyCur"
        Me.BodyCur.Size = New System.Drawing.Size(200, 88)
        Me.BodyCur.TabIndex = 13
        Me.BodyCur.Text = ""
        '
        'BEdit
        '
        Me.BEdit.BackColor = System.Drawing.Color.RosyBrown
        Me.BEdit.Location = New System.Drawing.Point(240, 304)
        Me.BEdit.Name = "BEdit"
        Me.BEdit.Size = New System.Drawing.Size(88, 40)
        Me.BEdit.TabIndex = 14
        Me.BEdit.Text = "แก้ไขข้อมูล"
        '
        'Button2
        '
        Me.Button2.BackColor = System.Drawing.Color.DimGray
        Me.Button2.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.Button2.Location = New System.Drawing.Point(344, 304)
        Me.Button2.Name = "Button2"
        Me.Button2.Size = New System.Drawing.Size(88, 40)
        Me.Button2.TabIndex = 15
        Me.Button2.Text = "Exit"
        '
        'BSave
        '
        Me.BSave.BackColor = System.Drawing.Color.WhiteSmoke
        Me.BSave.Location = New System.Drawing.Point(144, 304)
        Me.BSave.Name = "BSave"
        Me.BSave.Size = New System.Drawing.Size(88, 40)
        Me.BSave.TabIndex = 16
        Me.BSave.Text = "บันทึก"
        '
        'CboStateCur
        '
        Me.CboStateCur.Location = New System.Drawing.Point(136, 136)
        Me.CboStateCur.Name = "CboStateCur"
        Me.CboStateCur.Size = New System.Drawing.Size(104, 26)
        Me.CboStateCur.TabIndex = 17
        '
        'BtnPrint
        '
        Me.BtnPrint.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.BtnPrint.Location = New System.Drawing.Point(32, 304)
        Me.BtnPrint.Name = "BtnPrint"
        Me.BtnPrint.Size = New System.Drawing.Size(104, 40)
        Me.BtnPrint.TabIndex = 18
        Me.BtnPrint.Text = "PrintPreview"
        '
        'Health_Link
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.Color.DarkGray
        Me.ClientSize = New System.Drawing.Size(440, 349)
        Me.Controls.Add(Me.BtnPrint)
        Me.Controls.Add(Me.CboStateCur)
        Me.Controls.Add(Me.BSave)
        Me.Controls.Add(Me.Button2)
        Me.Controls.Add(Me.BEdit)
        Me.Controls.Add(Me.BodyCur)
        Me.Controls.Add(Me.HospitalCur)
        Me.Controls.Add(Me.TradeCur)
        Me.Controls.Add(Me.AgeCur)
        Me.Controls.Add(Me.DateCur)
        Me.Controls.Add(Me.H_ID)
        Me.Controls.Add(Me.Label7)
        Me.Controls.Add(Me.Label6)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "Health_Link"
        Me.Text = "ข้อมูลประวัติ"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable
    Dim dtfinfo As DateTimeFormatInfo

    Dim strConn As String = "server =(local);initial catalog=SmartFood;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Private Sub Health_Link_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Me.WindowState = FormWindowState.Normal
        Cursor.Current = Cursors.WaitCursor
        dtfinfo = DateTimeFormatInfo.InvariantInfo

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With
        With CboStateCur
            .Items.Add("โสด")
            .Items.Add("แต่งงาน")
            .SelectedIndex = 0
        End With
        If H_LINKED Then
            DateCur.Value = Date.Now
            BSave.Enabled = False
            EditClik()
        Else
            BEdit.Enabled = False
        End If
        DateCur.Enabled = False
        If StatusUser = False Then
            H_ID.ReadOnly = True
            AgeCur.ReadOnly = True
            TradeCur.ReadOnly = True
            CboStateCur.Enabled = False
            HospitalCur.ReadOnly = True
            BodyCur.ReadOnly = True
            BSave.Visible = False
            BEdit.Visible = False
        End If
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Me.Close()
    End Sub
    Private Function EditClik() As Boolean
        Dim sql As String = ""
        sql = "SELECT a.HID, a.TRADE, a.STATUS, a.DAYS, a.AGES, a.BODYS, a.HOSPITAL from HDate a ,Health b "
        sql = sql + "where a.H_DAY = b.H_DAY and b.H_DAY = " + CStr(H_DAY)
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Select")

        H_ID.Text = CStr(ds.Tables("select").Rows(0).Item("HID"))
        DateCur.Text = CStr(ds.Tables("select").Rows(0).Item("DAYS"))
        AgeCur.Text = CStr(ds.Tables("select").Rows(0).Item("AGES"))
        TradeCur.Text = CStr(ds.Tables("select").Rows(0).Item("TRADE"))
        CboStateCur.Text = CStr(ds.Tables("select").Rows(0).Item("STATUS"))
        HospitalCur.Text = CStr(ds.Tables("select").Rows(0).Item("HOSPITAL"))
        BodyCur.Text = CStr(ds.Tables("select").Rows(0).Item("BODYS"))

        Return True
    End Function

    Private Sub BSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BSave.Click
        Dim sql As String = ""
        Dim ID As String = CStr(genId())
        If MessageBox.Show("ต้องการเพิ่มข้อมูลสุขภาพลงในฐานข้อมูล", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
            If checkitem() Then
                sql = "insert into HDate(H_DAY,DAYS,AGES,BODYS,HID,TRADE,HOSPITAL,STATUS)values("
                sql = sql + ID + ",'"
                sql = sql + DateCur.Value.ToString("d", dtfinfo) + "',"
                sql = sql + AgeCur.Text + ",'"
                sql = sql + BodyCur.Text + "','"
                sql = sql + H_ID.Text + "','"
                sql = sql + TradeCur.Text + "','"
                sql = sql + HospitalCur.Text + "','"
                sql = sql + CboStateCur.Text + "')"
                da = New SqlDataAdapter(sql, Conn)
                ds.Tables.Clear()
                da.Fill(ds, "insert")

                sql = "insert into Health(Std_ID,H_DAY)values('"
                sql = sql + Student_ID + "',"
                sql = sql + ID + ")"
                da = New SqlDataAdapter(sql, Conn)
                ds.Tables.Clear()
                da.Fill(ds, "insert")

                MsgBox("ทำการเพิ่มข้อมูลเรียบร้อย", MsgBoxStyle.Information)
                Me.Close()
            End If
        End If
    End Sub
    Private Function ClearItem() As Boolean
        H_ID.Clear()
        AgeCur.Clear()
        TradeCur.Clear()
        CboStateCur.SelectedIndex = 0
        HospitalCur.Clear()
        BodyCur.Clear()
    End Function
    Private Function genId() As Integer
        Dim sql As String = ""
        sql = "select * from HDate"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "gen")
        If ds.Tables("gen").Rows.Count <> 0 Then
            sql = "select max(H_DAY) as MAXExp from HDate"
            da = New SqlDataAdapter(sql, Conn)
            ds.Tables.Clear()
            da.Fill(ds, "gen")
            If ds.Tables("gen").Rows.Count <> 0 Then
                Return CInt(ds.Tables("gen").Rows(0).Item("MAXExp")) + 1
            End If
        Else
            Return 1
        End If
    End Function
    Private Function checkitem() As Boolean
        If HospitalCur.Text = "" Then
            MsgBox("กรุณาใส่ชื่อโรงพยาบาลที่ทำการตรวจ")
            Return False
        End If
        If BodyCur.Text = "" Then
            MsgBox("กรุณากรอกข้อมูลอาการที่ตรวจพบ")
            Return False
        End If
        Return True
    End Function

    Private Sub BEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BEdit.Click
        Dim sql As String = ""
        If MessageBox.Show("ต้องการแก้ไบข้อมูลใหม่", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
            If checkitem() Then
                sql = "Update HDate set AGES = " + AgeCur.Text + ","
                sql = sql + "BODYS = '" + BodyCur.Text + "',"
                sql = sql + "HOSPITAL = '" + HospitalCur.Text + "',"
                sql = sql + "STATUS = '" + CboStateCur.Text + "',"
                sql = sql + "HID = '" + H_ID.Text + "',"
                sql = sql + "TRADE = '" + TradeCur.Text + "' "
                sql = sql + "where H_DAY = " + CStr(H_DAY)
                da = New SqlDataAdapter(sql, Conn)
                ds.Tables.Clear()
                da.Fill(ds, "Update")

                MsgBox("ทำการแก้ไขข้อมูลเรียบร้อย", MsgBoxStyle.Information)
                Me.Close()
            End If
        End If
    End Sub

    Private Sub BtnPrint_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnPrint.Click

        Dim PrSql As String = ""
        PrSql = "Select * From HDate Where H_DAY = " + CStr(H_DAY)

        Dim frmDynamicPrint As New frmPrintDynamicForm
        frmDynamicPrint.SqlSet = PrSql
        frmDynamicPrint.DateString = Now.ToString
        frmDynamicPrint.InitPrint()
        frmDynamicPrint.PrintPreview()
        frmDynamicPrint.Dispose()
    End Sub
End Class
