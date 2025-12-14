Option Explicit On 
Option Strict On
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Public Class Resume_Fa1
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
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents Label21 As System.Windows.Forms.Label
    Friend WithEvents Label20 As System.Windows.Forms.Label
    Friend WithEvents Label19 As System.Windows.Forms.Label
    Friend WithEvents Label18 As System.Windows.Forms.Label
    Friend WithEvents Label17 As System.Windows.Forms.Label
    Friend WithEvents Label16 As System.Windows.Forms.Label
    Friend WithEvents Label15 As System.Windows.Forms.Label
    Friend WithEvents Label14 As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents Trade As System.Windows.Forms.TextBox
    Friend WithEvents FaSurname As System.Windows.Forms.TextBox
    Friend WithEvents FaName As System.Windows.Forms.TextBox
    Friend WithEvents ThaiSurname As System.Windows.Forms.TextBox
    Friend WithEvents ThaiName As System.Windows.Forms.TextBox
    Friend WithEvents StdID As System.Windows.Forms.TextBox
    Friend WithEvents TelWK As System.Windows.Forms.TextBox
    Friend WithEvents TelHM As System.Windows.Forms.TextBox
    Friend WithEvents Post As System.Windows.Forms.TextBox
    Friend WithEvents City As System.Windows.Forms.TextBox
    Friend WithEvents Amphur As System.Windows.Forms.TextBox
    Friend WithEvents Tumboon As System.Windows.Forms.TextBox
    Friend WithEvents Road As System.Windows.Forms.TextBox
    Friend WithEvents Soi As System.Windows.Forms.TextBox
    Friend WithEvents AdrNM As System.Windows.Forms.TextBox
    Friend WithEvents TelPnt As System.Windows.Forms.TextBox
    Friend WithEvents WorkStation As System.Windows.Forms.TextBox
    Friend WithEvents Bsave As System.Windows.Forms.Button
    Friend WithEvents BEdit As System.Windows.Forms.Button
    Friend WithEvents BCancel As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.ThaiSurname = New System.Windows.Forms.TextBox
        Me.ThaiName = New System.Windows.Forms.TextBox
        Me.StdID = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label1 = New System.Windows.Forms.Label
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.TelWK = New System.Windows.Forms.TextBox
        Me.Label8 = New System.Windows.Forms.Label
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.TelHM = New System.Windows.Forms.TextBox
        Me.Label21 = New System.Windows.Forms.Label
        Me.Post = New System.Windows.Forms.TextBox
        Me.Label20 = New System.Windows.Forms.Label
        Me.City = New System.Windows.Forms.TextBox
        Me.Label19 = New System.Windows.Forms.Label
        Me.Amphur = New System.Windows.Forms.TextBox
        Me.Tumboon = New System.Windows.Forms.TextBox
        Me.Label18 = New System.Windows.Forms.Label
        Me.Label17 = New System.Windows.Forms.Label
        Me.Road = New System.Windows.Forms.TextBox
        Me.Soi = New System.Windows.Forms.TextBox
        Me.AdrNM = New System.Windows.Forms.TextBox
        Me.Label16 = New System.Windows.Forms.Label
        Me.Label15 = New System.Windows.Forms.Label
        Me.Label14 = New System.Windows.Forms.Label
        Me.TelPnt = New System.Windows.Forms.TextBox
        Me.Label7 = New System.Windows.Forms.Label
        Me.WorkStation = New System.Windows.Forms.TextBox
        Me.Label6 = New System.Windows.Forms.Label
        Me.Trade = New System.Windows.Forms.TextBox
        Me.Label4 = New System.Windows.Forms.Label
        Me.FaSurname = New System.Windows.Forms.TextBox
        Me.FaName = New System.Windows.Forms.TextBox
        Me.Label3 = New System.Windows.Forms.Label
        Me.Bsave = New System.Windows.Forms.Button
        Me.BEdit = New System.Windows.Forms.Button
        Me.BCancel = New System.Windows.Forms.Button
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        Me.SuspendLayout()
        '
        'ThaiSurname
        '
        Me.ThaiSurname.Location = New System.Drawing.Point(256, 40)
        Me.ThaiSurname.Name = "ThaiSurname"
        Me.ThaiSurname.ReadOnly = True
        Me.ThaiSurname.Size = New System.Drawing.Size(152, 24)
        Me.ThaiSurname.TabIndex = 9
        Me.ThaiSurname.Text = ""
        '
        'ThaiName
        '
        Me.ThaiName.Location = New System.Drawing.Point(104, 40)
        Me.ThaiName.Name = "ThaiName"
        Me.ThaiName.ReadOnly = True
        Me.ThaiName.Size = New System.Drawing.Size(144, 24)
        Me.ThaiName.TabIndex = 8
        Me.ThaiName.Text = ""
        '
        'StdID
        '
        Me.StdID.Location = New System.Drawing.Point(104, 8)
        Me.StdID.Name = "StdID"
        Me.StdID.ReadOnly = True
        Me.StdID.Size = New System.Drawing.Size(144, 24)
        Me.StdID.TabIndex = 7
        Me.StdID.Text = ""
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(24, 40)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(88, 23)
        Me.Label2.TabIndex = 6
        Me.Label2.Text = "ชื่อ -นามสกุล"
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(24, 8)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(88, 23)
        Me.Label1.TabIndex = 5
        Me.Label1.Text = "รหัสนักศึกษา"
        '
        'GroupBox1
        '
        Me.GroupBox1.BackColor = System.Drawing.Color.RosyBrown
        Me.GroupBox1.Controls.Add(Me.TelWK)
        Me.GroupBox1.Controls.Add(Me.Label8)
        Me.GroupBox1.Controls.Add(Me.GroupBox2)
        Me.GroupBox1.Controls.Add(Me.TelPnt)
        Me.GroupBox1.Controls.Add(Me.Label7)
        Me.GroupBox1.Controls.Add(Me.WorkStation)
        Me.GroupBox1.Controls.Add(Me.Label6)
        Me.GroupBox1.Controls.Add(Me.Trade)
        Me.GroupBox1.Controls.Add(Me.Label4)
        Me.GroupBox1.Controls.Add(Me.FaSurname)
        Me.GroupBox1.Controls.Add(Me.FaName)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Location = New System.Drawing.Point(16, 72)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(640, 256)
        Me.GroupBox1.TabIndex = 10
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "ส่วน ข้อมูลผู้ปกครอง"
        '
        'TelWK
        '
        Me.TelWK.Location = New System.Drawing.Point(112, 184)
        Me.TelWK.Name = "TelWK"
        Me.TelWK.Size = New System.Drawing.Size(136, 24)
        Me.TelWK.TabIndex = 27
        Me.TelWK.Text = ""
        '
        'Label8
        '
        Me.Label8.Location = New System.Drawing.Point(8, 184)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(104, 23)
        Me.Label8.TabIndex = 26
        Me.Label8.Text = "โทรศัพท์ที่ทำงาน"
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.TelHM)
        Me.GroupBox2.Controls.Add(Me.Label21)
        Me.GroupBox2.Controls.Add(Me.Post)
        Me.GroupBox2.Controls.Add(Me.Label20)
        Me.GroupBox2.Controls.Add(Me.City)
        Me.GroupBox2.Controls.Add(Me.Label19)
        Me.GroupBox2.Controls.Add(Me.Amphur)
        Me.GroupBox2.Controls.Add(Me.Tumboon)
        Me.GroupBox2.Controls.Add(Me.Label18)
        Me.GroupBox2.Controls.Add(Me.Label17)
        Me.GroupBox2.Controls.Add(Me.Road)
        Me.GroupBox2.Controls.Add(Me.Soi)
        Me.GroupBox2.Controls.Add(Me.AdrNM)
        Me.GroupBox2.Controls.Add(Me.Label16)
        Me.GroupBox2.Controls.Add(Me.Label15)
        Me.GroupBox2.Controls.Add(Me.Label14)
        Me.GroupBox2.Location = New System.Drawing.Point(256, 88)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(368, 152)
        Me.GroupBox2.TabIndex = 25
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "ที่อยู่ปัจจุบัน"
        '
        'TelHM
        '
        Me.TelHM.Location = New System.Drawing.Point(216, 120)
        Me.TelHM.Name = "TelHM"
        Me.TelHM.Size = New System.Drawing.Size(128, 24)
        Me.TelHM.TabIndex = 40
        Me.TelHM.Text = ""
        '
        'Label21
        '
        Me.Label21.Location = New System.Drawing.Point(160, 120)
        Me.Label21.Name = "Label21"
        Me.Label21.Size = New System.Drawing.Size(64, 23)
        Me.Label21.TabIndex = 39
        Me.Label21.Text = "เบอร์โทร"
        '
        'Post
        '
        Me.Post.Location = New System.Drawing.Point(256, 88)
        Me.Post.Name = "Post"
        Me.Post.Size = New System.Drawing.Size(88, 24)
        Me.Post.TabIndex = 38
        Me.Post.Text = ""
        '
        'Label20
        '
        Me.Label20.Location = New System.Drawing.Point(168, 88)
        Me.Label20.Name = "Label20"
        Me.Label20.Size = New System.Drawing.Size(88, 23)
        Me.Label20.TabIndex = 37
        Me.Label20.Text = "รหัสไปรษณีย์"
        '
        'City
        '
        Me.City.Location = New System.Drawing.Point(216, 56)
        Me.City.Name = "City"
        Me.City.Size = New System.Drawing.Size(128, 24)
        Me.City.TabIndex = 36
        Me.City.Text = ""
        '
        'Label19
        '
        Me.Label19.Location = New System.Drawing.Point(168, 56)
        Me.Label19.Name = "Label19"
        Me.Label19.Size = New System.Drawing.Size(48, 23)
        Me.Label19.TabIndex = 35
        Me.Label19.Text = "จังหวัด"
        '
        'Amphur
        '
        Me.Amphur.Location = New System.Drawing.Point(216, 24)
        Me.Amphur.Name = "Amphur"
        Me.Amphur.Size = New System.Drawing.Size(128, 24)
        Me.Amphur.TabIndex = 34
        Me.Amphur.Text = ""
        '
        'Tumboon
        '
        Me.Tumboon.Location = New System.Drawing.Point(56, 120)
        Me.Tumboon.Name = "Tumboon"
        Me.Tumboon.Size = New System.Drawing.Size(96, 24)
        Me.Tumboon.TabIndex = 33
        Me.Tumboon.Text = ""
        '
        'Label18
        '
        Me.Label18.Location = New System.Drawing.Point(168, 24)
        Me.Label18.Name = "Label18"
        Me.Label18.Size = New System.Drawing.Size(48, 23)
        Me.Label18.TabIndex = 32
        Me.Label18.Text = "อำเภอ"
        '
        'Label17
        '
        Me.Label17.Location = New System.Drawing.Point(16, 120)
        Me.Label17.Name = "Label17"
        Me.Label17.Size = New System.Drawing.Size(40, 23)
        Me.Label17.TabIndex = 31
        Me.Label17.Text = "ตำบล"
        '
        'Road
        '
        Me.Road.Location = New System.Drawing.Point(56, 88)
        Me.Road.Name = "Road"
        Me.Road.Size = New System.Drawing.Size(96, 24)
        Me.Road.TabIndex = 30
        Me.Road.Text = ""
        '
        'Soi
        '
        Me.Soi.Location = New System.Drawing.Point(56, 56)
        Me.Soi.Name = "Soi"
        Me.Soi.Size = New System.Drawing.Size(96, 24)
        Me.Soi.TabIndex = 29
        Me.Soi.Text = ""
        '
        'AdrNM
        '
        Me.AdrNM.Location = New System.Drawing.Point(56, 24)
        Me.AdrNM.Name = "AdrNM"
        Me.AdrNM.Size = New System.Drawing.Size(96, 24)
        Me.AdrNM.TabIndex = 28
        Me.AdrNM.Text = ""
        '
        'Label16
        '
        Me.Label16.Location = New System.Drawing.Point(16, 88)
        Me.Label16.Name = "Label16"
        Me.Label16.Size = New System.Drawing.Size(40, 23)
        Me.Label16.TabIndex = 27
        Me.Label16.Text = "ถนน"
        '
        'Label15
        '
        Me.Label15.Location = New System.Drawing.Point(16, 56)
        Me.Label15.Name = "Label15"
        Me.Label15.Size = New System.Drawing.Size(32, 23)
        Me.Label15.TabIndex = 26
        Me.Label15.Text = "ซอย"
        '
        'Label14
        '
        Me.Label14.Location = New System.Drawing.Point(16, 24)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(40, 23)
        Me.Label14.TabIndex = 25
        Me.Label14.Text = "เลขที่"
        '
        'TelPnt
        '
        Me.TelPnt.Location = New System.Drawing.Point(104, 216)
        Me.TelPnt.Name = "TelPnt"
        Me.TelPnt.Size = New System.Drawing.Size(144, 24)
        Me.TelPnt.TabIndex = 10
        Me.TelPnt.Text = ""
        '
        'Label7
        '
        Me.Label7.Location = New System.Drawing.Point(48, 216)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(56, 23)
        Me.Label7.TabIndex = 9
        Me.Label7.Text = "โทรสาร"
        '
        'WorkStation
        '
        Me.WorkStation.Location = New System.Drawing.Point(104, 88)
        Me.WorkStation.Multiline = True
        Me.WorkStation.Name = "WorkStation"
        Me.WorkStation.Size = New System.Drawing.Size(144, 88)
        Me.WorkStation.TabIndex = 8
        Me.WorkStation.Text = ""
        '
        'Label6
        '
        Me.Label6.Location = New System.Drawing.Point(16, 88)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(88, 23)
        Me.Label6.TabIndex = 7
        Me.Label6.Text = "สถานที่ทำงาน"
        '
        'Trade
        '
        Me.Trade.Location = New System.Drawing.Point(104, 56)
        Me.Trade.Name = "Trade"
        Me.Trade.Size = New System.Drawing.Size(144, 24)
        Me.Trade.TabIndex = 4
        Me.Trade.Text = ""
        '
        'Label4
        '
        Me.Label4.Location = New System.Drawing.Point(56, 56)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(40, 23)
        Me.Label4.TabIndex = 3
        Me.Label4.Text = "อาชีพ"
        '
        'FaSurname
        '
        Me.FaSurname.Location = New System.Drawing.Point(256, 24)
        Me.FaSurname.Name = "FaSurname"
        Me.FaSurname.Size = New System.Drawing.Size(152, 24)
        Me.FaSurname.TabIndex = 2
        Me.FaSurname.Text = ""
        '
        'FaName
        '
        Me.FaName.Location = New System.Drawing.Point(104, 24)
        Me.FaName.Name = "FaName"
        Me.FaName.Size = New System.Drawing.Size(144, 24)
        Me.FaName.TabIndex = 1
        Me.FaName.Text = ""
        '
        'Label3
        '
        Me.Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.Location = New System.Drawing.Point(16, 24)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(88, 23)
        Me.Label3.TabIndex = 0
        Me.Label3.Text = "ชื่อ -นามสกุล"
        '
        'Bsave
        '
        Me.Bsave.BackColor = System.Drawing.SystemColors.Control
        Me.Bsave.Location = New System.Drawing.Point(328, 336)
        Me.Bsave.Name = "Bsave"
        Me.Bsave.Size = New System.Drawing.Size(96, 40)
        Me.Bsave.TabIndex = 11
        Me.Bsave.Text = "บันทึกข้อมูล"
        '
        'BEdit
        '
        Me.BEdit.BackColor = System.Drawing.Color.Linen
        Me.BEdit.Location = New System.Drawing.Point(432, 336)
        Me.BEdit.Name = "BEdit"
        Me.BEdit.Size = New System.Drawing.Size(88, 40)
        Me.BEdit.TabIndex = 12
        Me.BEdit.Text = "แก้ไขข้อมูล"
        '
        'BCancel
        '
        Me.BCancel.BackColor = System.Drawing.Color.RosyBrown
        Me.BCancel.ForeColor = System.Drawing.SystemColors.InfoText
        Me.BCancel.Location = New System.Drawing.Point(528, 336)
        Me.BCancel.Name = "BCancel"
        Me.BCancel.Size = New System.Drawing.Size(96, 40)
        Me.BCancel.TabIndex = 13
        Me.BCancel.Text = "จบการทำงาน"
        '
        'Resume_Fa1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.Color.LightGray
        Me.ClientSize = New System.Drawing.Size(664, 381)
        Me.Controls.Add(Me.BCancel)
        Me.Controls.Add(Me.BEdit)
        Me.Controls.Add(Me.Bsave)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.ThaiSurname)
        Me.Controls.Add(Me.ThaiName)
        Me.Controls.Add(Me.StdID)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "Resume_Fa1"
        Me.Text = "ข้อมูลผู้ปกครองนักศึกษา"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox2.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable
    Dim FaID As Integer

    Dim Id1 As String = ""
    Dim NameId As String = ""

    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Private Sub Resume_Fa1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Normal
        Cursor.Current = Cursors.WaitCursor
        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        ThaiName.Text = thaiNM
        ThaiSurname.Text = ThaiSurNM
        StdID.Text = Student_ID

        IsFoundId()
        If StatusUser = False Then
            Trade.ReadOnly = True
            WorkStation.ReadOnly = True
            TelWK.ReadOnly = True
            TelPnt.ReadOnly = True
            AdrNM.ReadOnly = True
            Amphur.ReadOnly = True
            Soi.ReadOnly = True
            City.ReadOnly = True
            Road.ReadOnly = True
            Post.ReadOnly = True
            Tumboon.ReadOnly = True
            TelHM.ReadOnly = True
            FaName.ReadOnly = True
            FaSurname.ReadOnly = True
            Bsave.Visible = False
            BEdit.Visible = False
        End If

    End Sub

    Private Function IsFoundId() As Boolean 'ตรวจสอบการมีIDในฐานข้อมูล
        Dim sql As String = ""
        sql = "Select * From FatherID where Std_ID = '" + Student_ID + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Count")
        If ds.Tables("Count").Rows.Count = 3 Then
            ShowData()
            BEdit.Enabled = True
            Bsave.Enabled = False
        Else
            BEdit.Enabled = False
        End If
    End Function

    Private Function ShowData() As Boolean
        Dim sql As String = ""

        sql = "Select * From FatherID Where Std_ID = '" + Student_ID + "'"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Query1")
        Id1 = CStr(ds.Tables("Query1").Rows(2).Item("Fa_NUM"))

        sql = "Select * From  Father Where Fa_NUM = " + Id1
        da.SelectCommand.CommandText = sql
        ds.Tables.Clear()
        da.Fill(ds, "Query1")
        If ds.Tables("Query1").Rows.Count <> 0 Then

            Trade.Text = CStr(ds.Tables("Query1").Rows(0).Item("Fa_TRADE"))
            WorkStation.Text = CStr(ds.Tables("Query1").Rows(0).Item("Fa_ADDRWK"))
            TelWK.Text = CStr(ds.Tables("Query1").Rows(0).Item("Fa_TELWK"))
            TelPnt.Text = CStr(ds.Tables("Query1").Rows(0).Item("Fa_TelPnt"))
            AdrNM.Text = CStr(ds.Tables("Query1").Rows(0).Item("Adr_NUM"))
            Amphur.Text = CStr(ds.Tables("Query1").Rows(0).Item("Adr_AMPHUR"))
            Soi.Text = CStr(ds.Tables("Query1").Rows(0).Item("Adr_SOI"))
            City.Text = CStr(ds.Tables("Query1").Rows(0).Item("Adr_CITY"))
            Road.Text = CStr(ds.Tables("Query1").Rows(0).Item("Adr_ROAD"))
            Post.Text = CStr(ds.Tables("Query1").Rows(0).Item("Adr_POST"))
            Tumboon.Text = CStr(ds.Tables("Query1").Rows(0).Item("Adr_TUMBOON"))
            TelHM.Text = CStr(ds.Tables("Query1").Rows(0).Item("Adr_TEL"))
            NameId = CStr(ds.Tables("Query1").Rows(0).Item("Std_NUM"))

            sql = "Select * From NameStudent Where Std_NUM = " + NameId
            da.SelectCommand.CommandText = sql
            da.Fill(ds, "name")

            FaName.Text = CStr(ds.Tables("name").Rows(0).Item("Std_NAME"))
            FaSurname.Text = CStr(ds.Tables("name").Rows(0).Item("Std_SURNAME"))
        End If

    End Function

    Private Sub Bsave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Bsave.Click
        If checkItem() Then
            If MessageBox.Show("ต้องเพิ่มข้อมูลของผู้ปกครองนักศึกษา รหัส  " + Student_ID + "  ลงในฐานข้อมูล", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
                RegisterSTD = True
                InsertNew()
                Me.Close()
            End If
        End If
    End Sub

    Private Sub BCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BCancel.Click
        Me.Close()
    End Sub
    Private Function InsertNew() As Boolean
        FaID = genId()
        Dim NameId As String = CStr(genIdName())
        Dim sql As String = ""
        sql = "Insert into Father(Fa_NUM,Fa_Status,Fa_TRADE,Fa_ADDRWK,Fa_TELWK,Fa_TelPnt,Adr_NUM,Adr_AMPHUR,Adr_TUMBOON,Adr_CITY,"
        sql = sql + "Adr_ROAD,Adr_SOI,Adr_POST,Adr_TEL,Std_NUM)values("
        sql = sql + CStr(FaID) + ",'3','"
        sql = sql + Trade.Text + "','"
        sql = sql + WorkStation.Text + "','"
        sql = sql + TelWK.Text + "','"
        sql = sql + TelPnt.Text + "','"
        sql = sql + AdrNM.Text + "','"
        sql = sql + Amphur.Text + "','"
        sql = sql + Tumboon.Text + "','"
        sql = sql + City.Text + "','"
        sql = sql + Road.Text + "','"
        sql = sql + Soi.Text + "','"
        sql = sql + Post.Text + "','"
        sql = sql + TelHM.Text + "',"
        sql = sql + NameId + ")"
        Try

            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "insert")

            sql = "insert into NameStudent(Std_NUM,Std_NAME,Std_SURNAME,StdE_NAME,StdE_SURNAME)values("
            sql = sql + NameId + ",'"
            sql = sql + FaName.Text + "','"
            sql = sql + FaSurname.Text + "','None','None')"
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "insert")

            sql = "insert into FatherID(Std_ID,Fa_NUM)values('"
            sql = sql + Student_ID + "',"
            sql = sql + CStr(FaID) + ")"
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "insert")

        Catch ex As Exception
            MsgBox("error Insert Data ")
        End Try

        MsgBox("เพิ่มข้อมูลเรียบร้อยแล้ว")
        Return True
    End Function
    Private Function checkItem() As Boolean
        If FaName.Text = "" Or FaSurname.Text = "" Then
            MsgBox("กรุณากรอกชื่อ-นามสกุลให้ครบ!")
            Return False
        End If
        If AdrNM.Text = "" Or Tumboon.Text = "" Or Amphur.Text = "" Or City.Text = "" Or Post.Text = "" Then
            MsgBox("กรุณากรอกข้อมูลที่อยู่ให้ครบ!")
            Return False
        End If
        Return True
    End Function
    Private Function genId() As Integer
        Dim sql As String = ""
        sql = "select * from Father"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "gen")
        If ds.Tables("gen").Rows.Count <> 0 Then
            sql = "select max(Fa_NUM) as MAXExp from Father"
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
    Private Function genIdName() As Integer
        Dim sql As String = ""
        sql = "select * from NameStudent"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "gen")
        If ds.Tables("gen").Rows.Count <> 0 Then
            sql = "select max(Std_NUM) as MAXExp from NameStudent"
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "gen")
            If ds.Tables("gen").Rows.Count <> 0 Then
                Return CInt(ds.Tables("gen").Rows(0).Item("MAXExp")) + 1
            End If
        Else
            Return 1
        End If
    End Function

    Private Sub BEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BEdit.Click
        If checkItem() Then
            If MessageBox.Show("ต้องแก้ไขข้อมูลของผู้ปกครองนักศึกษา รหัส  " + Student_ID + "  ลงในฐานข้อมูล", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
                Dim sql As String = ""
                sql = "Update Father Set Fa_TRADE = '" + Trade.Text + "',"
                sql = sql + "Fa_ADDRWK = '" + WorkStation.Text + "',"
                sql = sql + "Fa_TELWK = '" + TelWK.Text + "',"
                sql = sql + "Fa_TelPnt = '" + TelPnt.Text + "',"
                sql = sql + "Adr_NUM = '" + AdrNM.Text + "',"
                sql = sql + "Adr_AMPHUR = '" + Amphur.Text + "',"
                sql = sql + "Adr_TUMBOON = '" + Tumboon.Text + "',"
                sql = sql + "Adr_CITY = '" + City.Text + "',"
                sql = sql + "Adr_ROAD = '" + Road.Text + "',"
                sql = sql + "Adr_SOI = '" + Soi.Text + "',"
                sql = sql + "Adr_POST = '" + Post.Text + "',"
                sql = sql + "Adr_TEL = '" + TelHM.Text + "'"
                sql = sql + " Where Fa_NUM = " + Id1 + " and Fa_Status ='3' "

                da.SelectCommand.CommandText = sql
                da.Fill(ds, "Edit")

                sql = "Update NameStudent Set Std_NAME = '" + FaName.Text + "',"
                sql = sql + "Std_SURNAME = '" + FaSurname.Text + "'"
                sql = sql + " Where Std_NUM = " + NameId

                da.SelectCommand.CommandText = sql
                ds.Tables.Clear()
                da.Fill(ds, "insert")
                MsgBox("แก้ไขข้อมูลเรียบร้อย", MsgBoxStyle.Information)
                Me.Close()
            End If
        End If
    End Sub
End Class
