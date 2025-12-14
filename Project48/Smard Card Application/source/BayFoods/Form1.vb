Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Imports System.Text

Public Class Form1
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
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents MainMenu1 As System.Windows.Forms.MainMenu
    Friend WithEvents MenuItem1 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem2 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem3 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem4 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem6 As System.Windows.Forms.MenuItem
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents GroupBox4 As System.Windows.Forms.GroupBox
    Friend WithEvents Button2 As System.Windows.Forms.Button
    Friend WithEvents Button3 As System.Windows.Forms.Button
    Friend WithEvents TmrDate As System.Windows.Forms.Timer
    Friend WithEvents DateCurrent As System.Windows.Forms.Label
    Friend WithEvents MainMenu As System.Windows.Forms.DataGrid
    Friend WithEvents MenuView As System.Windows.Forms.ListView
    Friend WithEvents TotalBay As System.Windows.Forms.Label
    Friend WithEvents ButtonBay As System.Windows.Forms.Button
    Friend WithEvents GroupBox5 As System.Windows.Forms.GroupBox
    Friend WithEvents Order As System.Windows.Forms.ListView
    Friend WithEvents GroupBox6 As System.Windows.Forms.GroupBox
    Friend WithEvents TotalMon As System.Windows.Forms.Label
    Friend WithEvents tmrRead As System.Windows.Forms.Timer
    Friend WithEvents ReadText As System.Windows.Forms.TextBox
    Friend WithEvents MainMoney As System.Windows.Forms.Label
    Friend WithEvents tmrCardOut As System.Windows.Forms.Timer
    Friend WithEvents tmrWrite As System.Windows.Forms.Timer
    Friend WithEvents MenuItem7 As System.Windows.Forms.MenuItem
    Friend WithEvents MenuItem8 As System.Windows.Forms.MenuItem
    Friend WithEvents BntRecive1 As System.Windows.Forms.Button
    Friend WithEvents BntRecive2 As System.Windows.Forms.Button
    Friend WithEvents BntRecive3 As System.Windows.Forms.Button
    Friend WithEvents BntRecive4 As System.Windows.Forms.Button
    Friend WithEvents BntRecive5 As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.MainMenu = New System.Windows.Forms.DataGrid
        Me.GroupBox2 = New System.Windows.Forms.GroupBox
        Me.MenuView = New System.Windows.Forms.ListView
        Me.MainMenu1 = New System.Windows.Forms.MainMenu
        Me.MenuItem1 = New System.Windows.Forms.MenuItem
        Me.MenuItem2 = New System.Windows.Forms.MenuItem
        Me.MenuItem3 = New System.Windows.Forms.MenuItem
        Me.MenuItem4 = New System.Windows.Forms.MenuItem
        Me.MenuItem6 = New System.Windows.Forms.MenuItem
        Me.MenuItem7 = New System.Windows.Forms.MenuItem
        Me.MenuItem8 = New System.Windows.Forms.MenuItem
        Me.GroupBox3 = New System.Windows.Forms.GroupBox
        Me.ButtonBay = New System.Windows.Forms.Button
        Me.MainMoney = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.TotalBay = New System.Windows.Forms.Label
        Me.GroupBox4 = New System.Windows.Forms.GroupBox
        Me.Button2 = New System.Windows.Forms.Button
        Me.Button3 = New System.Windows.Forms.Button
        Me.TmrDate = New System.Windows.Forms.Timer(Me.components)
        Me.DateCurrent = New System.Windows.Forms.Label
        Me.GroupBox5 = New System.Windows.Forms.GroupBox
        Me.Order = New System.Windows.Forms.ListView
        Me.GroupBox6 = New System.Windows.Forms.GroupBox
        Me.TotalMon = New System.Windows.Forms.Label
        Me.tmrRead = New System.Windows.Forms.Timer(Me.components)
        Me.ReadText = New System.Windows.Forms.TextBox
        Me.tmrCardOut = New System.Windows.Forms.Timer(Me.components)
        Me.tmrWrite = New System.Windows.Forms.Timer(Me.components)
        Me.BntRecive1 = New System.Windows.Forms.Button
        Me.BntRecive2 = New System.Windows.Forms.Button
        Me.BntRecive3 = New System.Windows.Forms.Button
        Me.BntRecive4 = New System.Windows.Forms.Button
        Me.BntRecive5 = New System.Windows.Forms.Button
        Me.GroupBox1.SuspendLayout()
        CType(Me.MainMenu, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox2.SuspendLayout()
        Me.GroupBox3.SuspendLayout()
        Me.GroupBox4.SuspendLayout()
        Me.GroupBox5.SuspendLayout()
        Me.GroupBox6.SuspendLayout()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.BackColor = System.Drawing.SystemColors.ControlDarkDark
        Me.GroupBox1.Controls.Add(Me.MainMenu)
        Me.GroupBox1.Location = New System.Drawing.Point(8, 16)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(320, 304)
        Me.GroupBox1.TabIndex = 2
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "รายการ อาหารทั้งร้าน"
        '
        'MainMenu
        '
        Me.MainMenu.CaptionBackColor = System.Drawing.Color.DarkSeaGreen
        Me.MainMenu.DataMember = ""
        Me.MainMenu.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.MainMenu.Location = New System.Drawing.Point(8, 24)
        Me.MainMenu.Name = "MainMenu"
        Me.MainMenu.Size = New System.Drawing.Size(304, 272)
        Me.MainMenu.TabIndex = 0
        '
        'GroupBox2
        '
        Me.GroupBox2.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.GroupBox2.Controls.Add(Me.MenuView)
        Me.GroupBox2.ForeColor = System.Drawing.Color.Yellow
        Me.GroupBox2.Location = New System.Drawing.Point(328, 16)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(312, 304)
        Me.GroupBox2.TabIndex = 3
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "รายการ อาหารที่ท่านเลือก"
        '
        'MenuView
        '
        Me.MenuView.BackColor = System.Drawing.SystemColors.Window
        Me.MenuView.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.MenuView.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable
        Me.MenuView.Location = New System.Drawing.Point(8, 24)
        Me.MenuView.Name = "MenuView"
        Me.MenuView.Size = New System.Drawing.Size(296, 272)
        Me.MenuView.TabIndex = 0
        '
        'MainMenu1
        '
        Me.MainMenu1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem1, Me.MenuItem7})
        '
        'MenuItem1
        '
        Me.MenuItem1.Index = 0
        Me.MenuItem1.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem2, Me.MenuItem3, Me.MenuItem4, Me.MenuItem6})
        Me.MenuItem1.Text = "แฟ้ม"
        '
        'MenuItem2
        '
        Me.MenuItem2.Index = 0
        Me.MenuItem2.Text = "เพิ่มรายการอาหาร"
        '
        'MenuItem3
        '
        Me.MenuItem3.Index = 1
        Me.MenuItem3.Text = "แก้ไขรายการอาหาร"
        '
        'MenuItem4
        '
        Me.MenuItem4.Index = 2
        Me.MenuItem4.Text = "ลบรายการอาหาร"
        '
        'MenuItem6
        '
        Me.MenuItem6.Index = 3
        Me.MenuItem6.Text = "จบการทำงาน"
        '
        'MenuItem7
        '
        Me.MenuItem7.Index = 1
        Me.MenuItem7.MenuItems.AddRange(New System.Windows.Forms.MenuItem() {Me.MenuItem8})
        Me.MenuItem7.Text = "ค้น"
        '
        'MenuItem8
        '
        Me.MenuItem8.Index = 0
        Me.MenuItem8.Text = "ค้นข้อมูลอาหาร"
        '
        'GroupBox3
        '
        Me.GroupBox3.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.GroupBox3.Controls.Add(Me.ButtonBay)
        Me.GroupBox3.Controls.Add(Me.MainMoney)
        Me.GroupBox3.Controls.Add(Me.Label3)
        Me.GroupBox3.Controls.Add(Me.Label2)
        Me.GroupBox3.Controls.Add(Me.TotalBay)
        Me.GroupBox3.Location = New System.Drawing.Point(640, 16)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(176, 304)
        Me.GroupBox3.TabIndex = 4
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "ค่าใช้จ่าย"
        '
        'ButtonBay
        '
        Me.ButtonBay.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.ButtonBay.Font = New System.Drawing.Font("Microsoft Sans Serif", 15.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.ButtonBay.ForeColor = System.Drawing.SystemColors.ControlLightLight
        Me.ButtonBay.Location = New System.Drawing.Point(16, 248)
        Me.ButtonBay.Name = "ButtonBay"
        Me.ButtonBay.Size = New System.Drawing.Size(144, 48)
        Me.ButtonBay.TabIndex = 4
        Me.ButtonBay.Text = "จ่ายเงิน"
        '
        'MainMoney
        '
        Me.MainMoney.BackColor = System.Drawing.Color.SeaGreen
        Me.MainMoney.Font = New System.Drawing.Font("Microsoft Sans Serif", 36.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.MainMoney.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.MainMoney.Location = New System.Drawing.Point(8, 160)
        Me.MainMoney.Name = "MainMoney"
        Me.MainMoney.Size = New System.Drawing.Size(160, 72)
        Me.MainMoney.TabIndex = 3
        Me.MainMoney.Text = "0.00"
        Me.MainMoney.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label3
        '
        Me.Label3.BackColor = System.Drawing.Color.Green
        Me.Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label3.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.Label3.Location = New System.Drawing.Point(8, 136)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(160, 23)
        Me.Label3.TabIndex = 2
        Me.Label3.Text = "ยอดเงินคงเหลือ"
        '
        'Label2
        '
        Me.Label2.BackColor = System.Drawing.SystemColors.InfoText
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 15.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Label2.ForeColor = System.Drawing.Color.Gold
        Me.Label2.Location = New System.Drawing.Point(8, 24)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(160, 23)
        Me.Label2.TabIndex = 1
        Me.Label2.Text = "ค่าอาหารทั้งหมด"
        '
        'TotalBay
        '
        Me.TotalBay.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.TotalBay.BackColor = System.Drawing.Color.FromArgb(CType(0, Byte), CType(64, Byte), CType(64, Byte))
        Me.TotalBay.Font = New System.Drawing.Font("Microsoft Sans Serif", 36.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TotalBay.ForeColor = System.Drawing.Color.Orange
        Me.TotalBay.Location = New System.Drawing.Point(8, 56)
        Me.TotalBay.Name = "TotalBay"
        Me.TotalBay.Size = New System.Drawing.Size(160, 72)
        Me.TotalBay.TabIndex = 0
        Me.TotalBay.Text = "0.00"
        Me.TotalBay.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'GroupBox4
        '
        Me.GroupBox4.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.GroupBox4.Controls.Add(Me.Button2)
        Me.GroupBox4.Location = New System.Drawing.Point(640, 320)
        Me.GroupBox4.Name = "GroupBox4"
        Me.GroupBox4.Size = New System.Drawing.Size(176, 80)
        Me.GroupBox4.TabIndex = 5
        Me.GroupBox4.TabStop = False
        Me.GroupBox4.Text = "ลบราายการที่ท่านเลือก"
        '
        'Button2
        '
        Me.Button2.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.Button2.Font = New System.Drawing.Font("Microsoft Sans Serif", 15.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Button2.ForeColor = System.Drawing.Color.Moccasin
        Me.Button2.Location = New System.Drawing.Point(16, 24)
        Me.Button2.Name = "Button2"
        Me.Button2.Size = New System.Drawing.Size(144, 48)
        Me.Button2.TabIndex = 0
        Me.Button2.Text = "ลบรายการ"
        '
        'Button3
        '
        Me.Button3.BackColor = System.Drawing.SystemColors.ControlLight
        Me.Button3.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.Button3.Location = New System.Drawing.Point(656, 520)
        Me.Button3.Name = "Button3"
        Me.Button3.Size = New System.Drawing.Size(144, 32)
        Me.Button3.TabIndex = 6
        Me.Button3.Text = "จบการทำงาน"
        '
        'TmrDate
        '
        Me.TmrDate.Interval = 500
        '
        'DateCurrent
        '
        Me.DateCurrent.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.DateCurrent.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.DateCurrent.Location = New System.Drawing.Point(656, 472)
        Me.DateCurrent.Name = "DateCurrent"
        Me.DateCurrent.Size = New System.Drawing.Size(144, 48)
        Me.DateCurrent.TabIndex = 7
        '
        'GroupBox5
        '
        Me.GroupBox5.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.GroupBox5.Controls.Add(Me.BntRecive5)
        Me.GroupBox5.Controls.Add(Me.BntRecive4)
        Me.GroupBox5.Controls.Add(Me.BntRecive3)
        Me.GroupBox5.Controls.Add(Me.BntRecive2)
        Me.GroupBox5.Controls.Add(Me.BntRecive1)
        Me.GroupBox5.Controls.Add(Me.Order)
        Me.GroupBox5.Location = New System.Drawing.Point(8, 320)
        Me.GroupBox5.Name = "GroupBox5"
        Me.GroupBox5.Size = New System.Drawing.Size(632, 232)
        Me.GroupBox5.TabIndex = 9
        Me.GroupBox5.TabStop = False
        Me.GroupBox5.Text = "สรุปรายการทั้งหมดที่สั่งอาหาร"
        '
        'Order
        '
        Me.Order.BackColor = System.Drawing.SystemColors.InactiveBorder
        Me.Order.Location = New System.Drawing.Point(8, 24)
        Me.Order.Name = "Order"
        Me.Order.Size = New System.Drawing.Size(616, 168)
        Me.Order.TabIndex = 0
        '
        'GroupBox6
        '
        Me.GroupBox6.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.GroupBox6.Controls.Add(Me.TotalMon)
        Me.GroupBox6.Location = New System.Drawing.Point(640, 400)
        Me.GroupBox6.Name = "GroupBox6"
        Me.GroupBox6.Size = New System.Drawing.Size(176, 64)
        Me.GroupBox6.TabIndex = 10
        Me.GroupBox6.TabStop = False
        Me.GroupBox6.Text = "ยอดรวมทั้งหมด"
        '
        'TotalMon
        '
        Me.TotalMon.BackColor = System.Drawing.SystemColors.Info
        Me.TotalMon.Location = New System.Drawing.Point(16, 24)
        Me.TotalMon.Name = "TotalMon"
        Me.TotalMon.Size = New System.Drawing.Size(144, 32)
        Me.TotalMon.TabIndex = 0
        Me.TotalMon.Text = "0"
        Me.TotalMon.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'tmrRead
        '
        '
        'ReadText
        '
        Me.ReadText.Location = New System.Drawing.Point(8, 560)
        Me.ReadText.Multiline = True
        Me.ReadText.Name = "ReadText"
        Me.ReadText.Size = New System.Drawing.Size(368, 88)
        Me.ReadText.TabIndex = 12
        Me.ReadText.Text = ""
        Me.ReadText.Visible = False
        '
        'tmrCardOut
        '
        '
        'tmrWrite
        '
        Me.tmrWrite.Interval = 80
        '
        'BntRecive1
        '
        Me.BntRecive1.Location = New System.Drawing.Point(216, 192)
        Me.BntRecive1.Name = "BntRecive1"
        Me.BntRecive1.Size = New System.Drawing.Size(80, 32)
        Me.BntRecive1.TabIndex = 1
        Me.BntRecive1.Text = "ช่องรับที่1"
        '
        'BntRecive2
        '
        Me.BntRecive2.Location = New System.Drawing.Point(304, 192)
        Me.BntRecive2.Name = "BntRecive2"
        Me.BntRecive2.Size = New System.Drawing.Size(80, 32)
        Me.BntRecive2.TabIndex = 2
        Me.BntRecive2.Text = "ช่องรับที่2"
        '
        'BntRecive3
        '
        Me.BntRecive3.Location = New System.Drawing.Point(392, 192)
        Me.BntRecive3.Name = "BntRecive3"
        Me.BntRecive3.Size = New System.Drawing.Size(72, 32)
        Me.BntRecive3.TabIndex = 3
        Me.BntRecive3.Text = "ช่องร้บที่3"
        '
        'BntRecive4
        '
        Me.BntRecive4.Location = New System.Drawing.Point(472, 192)
        Me.BntRecive4.Name = "BntRecive4"
        Me.BntRecive4.Size = New System.Drawing.Size(72, 32)
        Me.BntRecive4.TabIndex = 4
        Me.BntRecive4.Text = "ช่องรับที่4"
        '
        'BntRecive5
        '
        Me.BntRecive5.Location = New System.Drawing.Point(552, 192)
        Me.BntRecive5.Name = "BntRecive5"
        Me.BntRecive5.Size = New System.Drawing.Size(72, 32)
        Me.BntRecive5.TabIndex = 5
        Me.BntRecive5.Text = "ช่องรับที่5"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.ClientSize = New System.Drawing.Size(804, 557)
        Me.ControlBox = False
        Me.Controls.Add(Me.ReadText)
        Me.Controls.Add(Me.GroupBox6)
        Me.Controls.Add(Me.GroupBox5)
        Me.Controls.Add(Me.DateCurrent)
        Me.Controls.Add(Me.Button3)
        Me.Controls.Add(Me.GroupBox4)
        Me.Controls.Add(Me.GroupBox3)
        Me.Controls.Add(Me.GroupBox2)
        Me.Controls.Add(Me.GroupBox1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.IsMdiContainer = True
        Me.Menu = Me.MainMenu1
        Me.Name = "Form1"
        Me.Text = "ชวนชิม โภชนา"
        Me.GroupBox1.ResumeLayout(False)
        CType(Me.MainMenu, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox3.ResumeLayout(False)
        Me.GroupBox4.ResumeLayout(False)
        Me.GroupBox5.ResumeLayout(False)
        Me.GroupBox6.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet = New DataSet
    Dim dt As DataTable

    Public oCP As New Rs232
    Public intCommPort, intBaud, intData As Integer
    Public bytStop As Rs232.DataStopBit
    Public bytParity As Rs232.DataParity
    Public mComs(3) As Boolean ' ตรวจสอบ Serial Port

    Dim InfoDate As DateTimeFormatInfo

    Dim CardIn_out As Boolean
    Dim Sendloop As Integer = 0
    Dim TextSend As String = ""
    Dim StatusWrite As Boolean
    ' print document*********************
    Dim UseFont As New Font("MS Sans Serif", 10)
    Dim prDlg As PrintDialog = New PrintDialog
    Private prDoc As PrintDocument = New PrintDocument
    '*/*****************************

    Dim Wait As WaitUpdate
    Dim Stdate As Boolean
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Maximized
        Cursor.Current = Cursors.WaitCursor

        InfoDate = DateTimeFormatInfo.InvariantInfo
        CardIn_out = False
        InsertMoneyStatus = 0.0
        AdminCheck = False
        StCardIn = False
        Sendloop = 0
        TextSend = ""
        StatusWrite = False
        Wait = New WaitUpdate
        Stdate = True

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With
        Money = 0.0
        TotalMoneyBay = 0.0
        TmrDate.Enabled = True
        ButtonBay.Enabled = False
        FormatDataGrid()
        Me.MainMenu.Enabled = False
        FormatView()
        ClearItemOrder()
        CheckOrder()
        Dim i As Integer
        For i = 0 To 3
            mComs(i) = IsPortAvailable(i + 1)
        Next
        InitPort()

        AddHandler prDoc.PrintPage, New PrintPageEventHandler(AddressOf Me.StringToPrint_Print)
        prDoc.DocumentName = "ชื้ออาหาร"
        prDlg.Document = prDoc
        Cursor.Current = Cursors.Default
        tmrCardOut.Enabled = True

    End Sub
    Private Function CheckOrder() As Boolean
        Dim sql As String = ""
        sql = "Select a.*,b.FoodName From BayFoods a,Foods b Where a.FoodID = b.FoodID and a.StatusBay = '1' "
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Query")
        If ds.Tables("Query").Rows.Count <> 0 Then
            Dim i As Integer = 0
            ClearItemOrder()
            Dim temp1 As String = ""
            Dim temp2 As String = ""
            Dim temp3 As String = ""
            Dim temp4 As String = ""
            Dim temp5 As String = ""
            Dim temp6 As String = ""
            Dim TotalMoney As Double = 0
            While i < ds.Tables("Query").Rows.Count
               
                temp1 = CStr(ds.Tables("Query").Rows(i).Item("Std_ID"))
                temp2 = CStr(ds.Tables("Query").Rows(i).Item("Name"))
                temp3 = CStr(ds.Tables("Query").Rows(i).Item("SurName"))
                temp4 = CStr(ds.Tables("Query").Rows(i).Item("FoodID"))
                temp5 = CStr(ds.Tables("Query").Rows(i).Item("FoodName"))
                temp6 = CStr(ds.Tables("Query").Rows(i).Item("Cost"))

                TotalMoney = TotalMoney + temp6

                Dim AnyData() As String
                AnyData = New String() {temp1, temp2, temp3, temp4, temp5, temp6}
                Dim Lview As ListViewItem
                Lview = New ListViewItem(AnyData)
                Order.Items.Add(Lview)

                i = i + 1
            End While

            TotalMon.Text = TotalMoney
        End If
    End Function
    Private Sub StringToPrint_Print(ByVal sender As Object, ByVal e As PrintPageEventArgs)

        AnyString(e.Graphics, "รหัสนักศึกษา  : " + Student_id, 100, 100)
        AnyString(e.Graphics, "ชื่อ  : " + NameStudent + "  " + SurName, 100, 120)
        AnyString(e.Graphics, "วันที่  : " + DateCurrent.Text, 100, 140)
        AnyString(e.Graphics, ".......................................................", 100, 150)

        AnyString(e.Graphics, "-----------------------------------------------------", 100, 160)
        AnyString(e.Graphics, "        รายการอาหาร", 100, 175)
        AnyString(e.Graphics, "ราคา", 295, 175)
        AnyString(e.Graphics, "-----------------------------------------------------", 100, 185)

        Dim i As Integer = 0
        Dim strColumn1 As String = ""
        Dim strColumn2 As String = ""
        Dim CurrentYPosition As Integer = 210
        Dim MainMoneyTol As Double
        For i = 0 To MenuView.Items.Count - 1

            strColumn1 = MenuView.Items(i).SubItems(1).Text
            strColumn2 = MenuView.Items(i).SubItems(2).Text
            AnyString(e.Graphics, "    " + strColumn1, 100, CurrentYPosition)
            AnyString(e.Graphics, strColumn2, 300, CurrentYPosition)

            CurrentYPosition = CurrentYPosition + 15
        Next
        CurrentYPosition = CurrentYPosition + 40
        AnyString(e.Graphics, "----------------------------------------------------", 100, CurrentYPosition)
        CurrentYPosition = CurrentYPosition + 10
        AnyString(e.Graphics, "        รวมเป็นเงินทั้งหมด", 100, CurrentYPosition)
        AnyString(e.Graphics, TotalBay.Text, 300, CurrentYPosition)
        CurrentYPosition = CurrentYPosition + 10
        AnyString(e.Graphics, "----------------------------------------------------", 100, CurrentYPosition)
        CurrentYPosition = CurrentYPosition + 10
        AnyString(e.Graphics, "        ยอดเงินคงเหลือ", 100, CurrentYPosition)
        MainMoneyTol = MainMoney.Text
        MainMoneyTol = MainMoneyTol - TotalBay.Text
        AnyString(e.Graphics, CStr(MainMoneyTol), 300, CurrentYPosition)
        CurrentYPosition = CurrentYPosition + 10
        AnyString(e.Graphics, "----------------------------------------------------", 100, CurrentYPosition)


    End Sub
    Private Sub AnyString(ByVal g As Graphics, ByVal printString As String, ByVal xPos As Integer, ByVal yPos As Integer)
        Dim anyPoint As New PointF(xPos, yPos)
        g.DrawString(printString, UseFont, Brushes.Black, anyPoint)
    End Sub
    Private Function InitPort() As Boolean
        intCommPort = 1
        intBaud = 9600
        intData = 8
        bytParity = Rs232.DataParity.Parity_None
        bytStop = Rs232.DataStopBit.StopBit_1
        oCP.Open(intCommPort, intBaud, intData, bytParity, bytStop, 4096)

        tmrRead.Enabled = True

    End Function
    Private Function IsPortAvailable(ByVal ComPort As Integer) As Boolean
        Try
            oCP.Open(ComPort, 9600, 8, Rs232.DataParity.Parity_None, _
                Rs232.DataStopBit.StopBit_1, 4096)

            oCP.Close()
            Return True
        Catch
            Return False
        End Try
    End Function

    Private Sub MenuItem6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem6.Click
        If CheckAdmin() Then
            Me.Close()
        End If
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        If CheckAdmin() Then
            Me.Close()
        End If
    End Sub

    Private Sub TmrDate_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TmrDate.Tick
        Dim DateCur As Date
        DateCurrent.Text = ""
        DateCurrent.Text = CStr(DateCur.Today.ToLongDateString) + "      "
        DateCurrent.Text = DateCurrent.Text + CStr(DateCur.Today.Now.ToLongTimeString)

    End Sub


    Private Sub FormatDataGrid()

        Dim sql As String = ""
        sql = "select * from Foods"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "foods")
        If ds.Tables("foods").Rows.Count = 0 Then
            Me.MainMenu.Enabled = False
        Else
            Me.MainMenu.Enabled = True
            With MainMenu
                '    .AllowNavigation = False
                '  .BackgroundColor = Color.White
                .ReadOnly = True
                .DataSource = ds.Tables("foods")
            End With

            Dim GrdTs As DataGridTableStyle = New DataGridTableStyle
            With GrdTs
                .AlternatingBackColor = Color.White
                .BackColor = Color.WhiteSmoke
                .MappingName = "foods"
            End With

            Dim cs1 As New DataGridTextBoxColumn
            With cs1
                .HeaderText = "รหัส"
                .MappingName = "FoodID"
                .ReadOnly = True
                .Width = 50
            End With
            GrdTs.GridColumnStyles.Add(cs1)

            Dim cs2 As New DataGridTextBoxColumn
            With cs2
                .HeaderText = "ชื่ออาหาร"
                .MappingName = "FoodName"
                .ReadOnly = True
                .Width = 150
            End With
            GrdTs.GridColumnStyles.Add(cs2)

            Dim cs3 As New DataGridTextBoxColumn
            With cs3
                .HeaderText = "ราคา"
                .MappingName = "FoodCost"
                .ReadOnly = True
                .Width = 45
            End With
            GrdTs.GridColumnStyles.Add(cs3)

            With MainMenu
                .TableStyles.Clear()
                '.CaptionFont = New Font("MS Sans Serif", 10.0, FontStyle.Regular)
                .CaptionText = "รายการอาหารทั้งหมด"
                .FlatMode = True
                .TableStyles.Add(GrdTs)
            End With
        End If

    End Sub
    Private Sub FormatView()
        MenuView.Columns.Add("รหัส", 70, HorizontalAlignment.Left)
        MenuView.Columns.Add("ชื่ออาหาร", 170, HorizontalAlignment.Left)
        MenuView.Columns.Add("ราคา", 55, HorizontalAlignment.Left)

        MenuView.View = View.Details
        MenuView.GridLines = True

    End Sub


    Private Sub MainMenu_DoubleClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles MainMenu.DoubleClick
        Dim index As Integer = 0
        Dim i As Integer = 0
        index = MainMenu.CurrentRowIndex
        Dim Temp As String = MainMenu.Item(index, 0)

        Dim sql As String = ""
        sql = "Select * From Foods where FoodID = " + Temp
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Select")
        If ds.Tables("select").Rows.Count <> 0 Then
            Dim Foodid As String
            Dim FoodName As String
            Dim foodcost As String

            Foodid = ds.Tables("select").Rows(0).Item("FoodID")
            FoodName = ds.Tables("select").Rows(0).Item("FoodName")
            foodcost = ds.Tables("select").Rows(0).Item("FoodCost")

            If CheckOverMoney(foodcost) Then

                Dim AnyData() As String
                AnyData = New String() {Foodid, FoodName, foodcost}
                Dim Lview As ListViewItem
                Lview = New ListViewItem(AnyData)
                MenuView.Items.Add(Lview)
                Conculate(foodcost)

            End If

            If MenuView.Items.Count = 0 Then
                ButtonBay.Enabled = False
            Else
                ButtonBay.Enabled = True
            End If

        End If

    End Sub
    Private Function CheckOverMoney(ByVal data As String) As Boolean
        Dim tempMon1 As Double = TotalBay.Text
        Dim tempMon2 As Double = MainMoney.Text
        Dim tempMonCur As Double = data
        tempMon1 = tempMon1 + data
        If tempMon1 > tempMon2 Then
            MessageBox.Show("เงินของคุณไม่พอจ่าย กรุณาเพิ่มจำนวนเงิน", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            Return False
        Else
            Return True
        End If
    End Function
    Private Function Conculate(ByVal Data As Double) As Boolean
        Dim montemp As Double = Data
        Money = Money + montemp
        TotalBay.Text = CStr(Money)

    End Function

    Private Sub MenuView_DoubleClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles MenuView.DoubleClick
        Dim i As Integer
        For i = 0 To MenuView.SelectedItems.Count - 1
            Dim tav As ListViewItem
            tav = MenuView.SelectedItems(i)
            ConculateSub(tav)
            MenuView.Items.Remove(tav)
        Next

        If MenuView.Items.Count = 0 Then
            ButtonBay.Enabled = False
        Else
            ButtonBay.Enabled = True
        End If
    End Sub
    Private Function ConculateSub(ByVal Data As ListViewItem) As Boolean
        Dim montemp As Double = Data.SubItems(2).Text
        Money = Money - montemp
        TotalBay.Text = CStr(Money)
    End Function

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        ClearItem()
    End Sub
    Private Sub ClearItem()
        MenuView.Clear()
        Money = 0.0
        TotalBay.Text = CStr(Money)
        MenuView.Columns.Add("รหัส", 70, HorizontalAlignment.Left)
        MenuView.Columns.Add("ชื่ออาหาร", 170, HorizontalAlignment.Left)
        MenuView.Columns.Add("ราคา", 55, HorizontalAlignment.Left)

        MenuView.View = View.Details
        MenuView.GridLines = True
        ButtonBay.Enabled = False
    End Sub
    Private Function IsInstallPrinter() As Boolean
        IsInstallPrinter = False
        If prDoc.PrinterSettings.PrinterName = "<no default printer>" Then
            IsInstallPrinter = False
        Else
            IsInstallPrinter = True
        End If
    End Function

    Private Sub ButtonBay_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ButtonBay.Click

        If MessageBox.Show("ต้องการจ่ายค่าอาหารใช่ หรือ ไม่ ", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
            Dim Sql As String = ""
            Dim tempId As String = ""
            Dim tempMon As String = ""
            Dim DateCur As Date
            If IsInstallPrinter() = True Then

                prDoc.Print()
            Else
                MessageBox.Show("กรุณาติดตั้งเครื่อง Printer ก่อนสั่งพิมพ์เอกสาร", "ผลการตรวจสอบ", MessageBoxButtons.OK, MessageBoxIcon.Information)
            End If
            Try
                Dim i As Integer
                For i = 0 To MenuView.Items.Count - 1
                    tempId = MenuView.Items(i).SubItems(0).Text
                    tempMon = MenuView.Items(i).SubItems(2).Text
                    Sql = "insert into BayFoods(Std_ID,Name,SurName,FoodID,Cost,DateCurrent,StatusBay) values ('" + Student_id + "','" + NameStudent + "','" + SurName + "'," + tempId + "," + tempMon + ",'" + DateCur.Today().ToString("d", InfoDate) + "','1')"
                    da.SelectCommand.CommandText = Sql
                    ds.Tables.Clear()
                    da.Fill(ds, "insert")

                Next
                Dim tempMon1 As Double = MainMoney.Text
                Dim tempMon2 As Double = TotalBay.Text
                'MainMoney.Text = CStr(tempMon1 - tempMon2)
                Try
                    InsertMoneyStatus = tempMon1 - tempMon2
                    TextSend = "write" + Chr(13) + Chr(5)
                    StatusWrite = True
                    tmrCardOut.Enabled = False
                    tmrWrite.Enabled = True

                Catch ex As Exception

                End Try
                OrderMenu()
                Money = 0.0
                ClearItem()
            Catch ex As Exception
                MsgBox("ข้อมูลผิดพลาด.")
            End Try

        End If

    End Sub

    Private Sub MenuItem2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem2.Click
        If CheckAdmin() Then
            Dim form As New AddFoods
            If form.ShowDialog() Then
                FormatDataGrid()
            End If
        End If

    End Sub

    Private Sub MenuItem3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem3.Click
        If CheckAdmin() Then
            Dim form As New EditFoods
            If form.ShowDialog() Then
                FormatDataGrid()
            End If
        End If

    End Sub

    Private Sub ClearItemOrder()
        Order.Clear()
        TotalBay.Text = CStr(Money)
        Order.Columns.Add("รหัสนักศึกษา", 80, HorizontalAlignment.Left)
        Order.Columns.Add("ชื่อ", 120, HorizontalAlignment.Left)
        Order.Columns.Add("นามสกุล", 120, HorizontalAlignment.Left)
        Order.Columns.Add("รหัส", 50, HorizontalAlignment.Left)
        Order.Columns.Add("ชื่ออาหาร", 185, HorizontalAlignment.Left)
        Order.Columns.Add("ราคา", 55, HorizontalAlignment.Left)

        Order.View = View.Details
        Order.GridLines = True

    End Sub

    Private Function OrderMenu() As Boolean
        Dim i As Integer
        Dim temp1 As String = ""
        Dim temp2 As String = ""
        Dim temp3 As String = ""
        Dim DateCur As Date
        For i = 0 To MenuView.Items.Count - 1
            temp1 = MenuView.Items(i).SubItems(0).Text
            temp2 = MenuView.Items(i).SubItems(1).Text
            temp3 = MenuView.Items(i).SubItems(2).Text

            TotalMoneyBay = TotalMoneyBay + temp3
            TotalMon.Text = TotalMoneyBay

            Dim AnyData() As String
            AnyData = New String() {Student_id, NameStudent, SurName, temp1, temp2, temp3}
            Dim Lview As ListViewItem
            Lview = New ListViewItem(AnyData)
            Order.Items.Add(Lview)

        Next
    End Function

    Private Sub Order_DoubleClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Order.DoubleClick
        If CheckAdmin() Then
            If Student_id = "" Then ' ไม่มีบัตร
                Dim i As Integer
                For i = 0 To Order.SelectedItems.Count - 1
                    Dim tav As ListViewItem
                    tav = Order.SelectedItems(i)
                    ChangStatusBay(tav)
                    Order.Items.Remove(tav)
                Next
            Else    ' บัตรเสียบ
                Dim i As Integer
                For i = 0 To Order.SelectedItems.Count - 1
                    Dim tav As ListViewItem
                    tav = Order.SelectedItems(i)
                    DeleteMon(tav)
                    Order.Items.Remove(tav)
                Next
            End If
        End If

    End Sub
    Private Function ChangStatusBay(ByVal tav As ListViewItem) As Boolean
        Dim name As String = tav.SubItems(1).Text
        Dim Surname As String = tav.SubItems(2).Text
        Dim Mon As String = tav.SubItems(3).Text 'รหัสอาหาร
        Dim Foodname As String = tav.SubItems(4).Text
        Dim Money As Double = tav.SubItems(5).Text 'ค่าอาหาร
        Dim StdBayID As String = tav.SubItems(0).Text 'รหัสนักศึกษา
        Dim sql As String = ""

        sql = "Insert into BayTemp(Number,Std_ID,Name,Surname,FoodName,Cost) Values("
        sql &= CStr(GenBayID()) + ",'"
        sql &= StdBayID + "','"
        sql &= name + "','"
        sql &= Surname + "','"
        sql &= Foodname + "',"
        sql &= CStr(Money) + ")"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "insert")

        sql = "Update BayFoods set StatusBay ='0' Where Std_ID ='" + StdBayID + "'"
        sql = sql + " and FoodID =" + Mon
        sql = sql + " and StatusBay ='1' "
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Upadte")


    End Function
    Private Function GenBayID() As String
        Dim sql As String = ""
        sql = "Select * From BayTemp "
        da.SelectCommand.CommandText = sql
        ds.Tables.Clear()
        da.Fill(ds, "Max")
        If ds.Tables("Max").Rows.Count <> 0 Then
            sql = "Select Max(Number)as MaxID From BayTemp"
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Max")
            Dim maxID As Double = ds.Tables("Max").Rows(0).Item("MaxID")
            maxID += 1
            Return CStr(maxID)
        Else
            Return CStr(1)
        End If

    End Function
    Private Function DeleteMon(ByVal tav As ListViewItem) As Boolean
        Dim Mon As String = tav.SubItems(3).Text 'รหัสอาหาร
        Dim Money As Double = tav.SubItems(5).Text 'ค่าอาหาร
        Dim StdBayID As String = tav.SubItems(0).Text 'รหัสนักศึกษา
        Dim sql As String = ""
        sql = "Select Count(*) as BayNum From BayFoods Where Std_ID ='" + StdBayID + "'"
        sql = sql + " and FoodID =" + Mon
        sql = sql + " and StatusBay ='1' "
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Qurey")
        Dim NumberBay As Integer = CInt(ds.Tables("Qurey").Rows(0).Item("BayNum"))

        If NumberBay >= 1 Then
            Money *= NumberBay
        Else
            Exit Function
        End If
        sql = "Delete From BayFoods Where Std_ID ='" + StdBayID + "'"
        sql = sql + " and FoodID =" + Mon
        sql = sql + " and StatusBay ='1' "
        da.SelectCommand.CommandText = sql
        ds.Tables.Clear()
        da.Fill(ds, "Del")

        Dim tempMon1 As Double = MainMoney.Text
        InsertMoneyStatus = tempMon1 + Money
        TextSend = "write" + Chr(13) + Chr(5)
        StatusWrite = True
        tmrCardOut.Enabled = False
        MessageBox.Show("คุณได้ยกเลิกรายการอาหารของ รหัส  " & StdBayID & Chr(10) & Chr(13) & "รหัสอาหาร  " & Mon & "  รวมทั้งหมด  " & CStr(NumberBay) & " รายการ " & Chr(10) & Chr(13) + "รวมเป็นเงินทั้งหมด  " + CStr(Money) + " บาท", "แจ้งให้ทราบ", MessageBoxButtons.OK, MessageBoxIcon.Information)
        tmrWrite.Enabled = True
        Wait.Show()
        TotalMon.Text = TotalMon.Text - Money
    End Function
    Private Function ChRegisCard() As Boolean
        Dim strlen As Integer = ReadText.TextLength
        Dim loopstr As Integer = 0
        While (loopstr < strlen)
            If ReadText.Text.Chars(loopstr) = Chr(3) Then
                Return True
            End If
            loopstr = loopstr + 1
        End While
        Return False
    End Function
    Private Function CheckCardIn() As Boolean
        If ChRegisCard() Then

            Dim CardIn As String = ReadText.Text
            SmartHealth = ""
            SmartStudent = ""
            SmartMoney = ""

            CardIn = CardIn + Chr(4)
            Dim LoopIn As Integer = 0
            While CardIn.Chars(LoopIn) <> Chr(4)
                If CardIn.Chars(LoopIn) = Chr(2) Then
                    LoopIn = LoopIn + 1
                    While CardIn.Chars(LoopIn) <> Chr(3)
                        SmartStudent = SmartStudent + CardIn.Chars(LoopIn)
                        LoopIn = LoopIn + 1
                    End While
                    LoopIn = LoopIn + 1
                    While CardIn.Chars(LoopIn) <> Chr(3)
                        SmartHealth = SmartHealth + CardIn.Chars(LoopIn)
                        LoopIn = LoopIn + 1
                    End While
                    LoopIn = LoopIn + 1
                    While CardIn.Chars(LoopIn) <> Chr(3)
                        SmartMoney = SmartMoney + CardIn.Chars(LoopIn)
                        LoopIn = LoopIn + 1
                    End While
                    LoopIn = LoopIn + 1
                End If
                LoopIn = LoopIn + 1
            End While

            CheckPassword()
        Else
            MsgBox("บัตร ยังไม่มีเงิน")
        End If

        Return True
    End Function
    Private Function CheckPassword() As Boolean
        Dim lengthdata As Integer = SmartStudent.Length
        Dim loopdata As Integer = 0

        Dim datapwd As String = ""
        Dim dataIdstd As String = ""
        Dim tempname As String = ""
        Dim tempsurname As String = ""
        'MsgBox(SmartStudent)

        While (loopdata < lengthdata)
            While (SmartStudent.Chars(loopdata) <> Chr(64))
                datapwd = datapwd + SmartStudent.Chars(loopdata)
                loopdata = loopdata + 1
            End While
            loopdata = loopdata + 1

            While (SmartStudent.Chars(loopdata) <> Chr(64))
                dataIdstd = dataIdstd + SmartStudent.Chars(loopdata)
                loopdata = loopdata + 1
            End While
            loopdata = loopdata + 1

            While (SmartStudent.Chars(loopdata) <> Chr(64))
                tempname = tempname + SmartStudent.Chars(loopdata)
                loopdata = loopdata + 1
            End While
            loopdata = loopdata + 1

            While (loopdata < lengthdata)
                tempsurname = tempsurname + SmartStudent.Chars(loopdata)
                loopdata = loopdata + 1
            End While
            loopdata = loopdata + 1
        End While

        Student_id = dataIdstd
        NameStudent = tempname
        SurName = tempsurname
        Dim temp As String = DecodePwd(datapwd)
        CheckPassword(temp)

    End Function

    Private Function DecodePwd(ByVal CodeData As String) As String

        Dim i As Integer = 0
        Dim tenp0 As Integer = Asc(CodeData.Chars(0))
        Dim tenp1 As Integer = Asc(CodeData.Chars(1))
        Dim tenp2 As Integer = Asc(CodeData.Chars(2))
        Dim tenp3 As Integer = Asc(CodeData.Chars(3))
        Dim CodeData1 As String = ""
        i = 4

        CodeData1 = Chr(tenp0 + 10)
        CodeData1 = CodeData1 + Chr(tenp1 + 15)
        CodeData1 = CodeData1 + Chr(tenp2 + 10)
        CodeData1 = CodeData1 + Chr(tenp3 + 17)
        While i < CodeData.Length
            CodeData1 = CodeData1 + CodeData.Chars(i)
            i = i + 1
        End While
        Return CodeData1

    End Function

    Public Function CheckPassword(ByVal Data As String) As Boolean
        DataOfCard = Data
        Dim Forms As New LOGIN
        If Forms.ShowDialog() Then
            If Pwd Then
                If CInt(SmartMoney) < 5 Then
                    StCardIn = True
                    MessageBox.Show("บัตรของคุณมีเงินไม่พอจ่าย กรุณาเติมเงิน", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                    MainMoney.Text = 0
                    tmrCardOut.Enabled = True
                Else
                    Me.MainMenu.Enabled = True
                    tmrCardOut.Enabled = True
                    StCardIn = True
                    MainMoney.Text = SmartMoney
                End If

            End If
        End If
        'MsgBox(DataOfCard)
    End Function

    Private Sub tmrRead_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles tmrRead.Tick
        Try
            While (oCP.Read(1) <> -1)
                Me.tmrRead.Enabled = False
                If (Chr(oCP.InputStream(0)) <> Chr(4)) Then
                    ReadText.Text = ReadText.Text + Chr(oCP.InputStream(0))
                End If
                CardIn_out = True
            End While

        Catch exc As Exception
            If StatusWrite Then
                StatusWrite = False
                TextSend = SmartStudent + Chr(3) + SmartHealth + Chr(3) + CStr(InsertMoneyStatus) + Chr(3) + Chr(4) + Chr(13) + Chr(5)
                Me.tmrWrite.Enabled = True
                Sendloop = 0
            Else
                If CardIn_out And ReadText.Text.Length > 100 Then
                    CheckCardIn()
                    CardIn_out = False
                Else
                    Me.tmrRead.Enabled = True
                End If
            End If

        End Try
    End Sub


    Private Sub tmrCardOut_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles tmrCardOut.Tick

        Dim out As Boolean = False
        Try
            While (oCP.Read(1) <> -1)
                Me.tmrCardOut.Enabled = False
                ReadText.Text = ReadText.Text + Chr(oCP.InputStream(0))
                out = True
            End While

        Catch exc As Exception
            If out Then
                If ReadText.Text.Length > 15 Then
                    If ReadText.Text.Chars(1) = Chr(82) Then
                        SmartStudent = ""
                        SmartHealth = ""
                        SmartMoney = ""
                        Student_id = ""
                        NameStudent = ""
                        SurName = ""
                        out = False
                        CardIn_out = False
                        Me.MainMenu.Enabled = False
                        StCardIn = False
                        MainMoney.Text = 0
                        tmrWrite.Enabled = False
                        Me.tmrCardOut.Enabled = False
                        Me.tmrCardOut.Stop()
                        'MsgBox("Remove Card out")
                        ClearItem()
                        ReadText.Text = ""
                        tmrRead.Enabled = True
                    Else
                        out = False
                        Me.tmrCardOut.Enabled = True
                    End If
                Else
                    out = False
                    Me.tmrCardOut.Enabled = True
                End If

            Else
                Me.tmrCardOut.Enabled = True
                ReadText.Text = Chr(13)
                Try
                    oCP.Write(Encoding.ASCII.GetBytes(Me.ReadText.Text & Chr(13)))
                Catch ex As Exception
                    MessageBox.Show("Unable to write to comm port")
                    'Me.tmrWrite.Enabled = False
                Finally
                    'ReadText.Text = ""
                End Try
            End If
        End Try

    End Sub
    Private Function CheckAdmin() As Boolean
        Dim Form As New Admin
        If Form.ShowDialog Then
            If AdminCheck Then
                Return True
            Else
                Return False
            End If
        End If
    End Function

    Private Sub tmrWrite_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles tmrWrite.Tick
        If TextSend.Chars(Sendloop) <> Chr(5) Then
            ReadText.Text = TextSend.Chars(Sendloop)
            Sendloop = Sendloop + 1

            Try
                oCP.Write(Encoding.ASCII.GetBytes(Me.ReadText.Text))
                'WriteMessage(ReadText.Text, True)
            Catch ex As Exception
                MessageBox.Show("Unable to write to comm port")
                Me.tmrWrite.Enabled = False
            Finally
                ReadText.Text = ""
            End Try
        Else
            Me.tmrWrite.Enabled = False
            Sendloop = 0
            If StatusWrite Then
                Me.tmrRead.Enabled = True
            Else
                'MsgBox("Register Successfull.....")
                Wait.Close()
                Wait = New WaitUpdate
                MainMoney.Text = InsertMoneyStatus
                Me.tmrCardOut.Enabled = True
            End If

        End If
    End Sub

    Private Sub MenuItem4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem4.Click
        If CheckAdmin() Then
            Dim form As New EditFoods
            If form.ShowDialog() Then
                FormatDataGrid()
            End If
        End If
    End Sub

    Private Sub MenuItem8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MenuItem8.Click
        Dim Form As New Search
        Form.Show()
    End Sub

    Private Sub BntRecive1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BntRecive1.Click
        Dim sql As String = ""
        Dim temp As Double = GenDelId(0)
        If temp <> -1 Then
            sql = "delete from BayTemp where Number = " + CStr(temp)
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "delId")
        End If
    End Sub
    Private Function GenDelId(ByVal data As Integer) As Integer
        Dim sql As String = ""
        sql = "Select * from BayTemp"
        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "Query")
        Dim MaxLenth As Integer = CInt(ds.Tables("Query").Rows.Count)
        If MaxLenth <> 0 Then
            Dim temp1 As String = CStr(ds.Tables("Query").Rows(0).Item("Number"))
            If data = 0 Then
                Return temp1
            End If
            If MaxLenth > 1 Then
                temp1 = CStr(ds.Tables("Query").Rows(1).Item("Number"))
                If data = 1 Then
                    Return temp1
                End If
            End If
            If MaxLenth > 2 Then
                temp1 = CStr(ds.Tables("Query").Rows(2).Item("Number"))
                If data = 2 Then
                    Return temp1
                End If
            End If
            If MaxLenth > 3 Then
                temp1 = CStr(ds.Tables("Query").Rows(3).Item("Number"))
                If data = 3 Then
                    Return temp1
                End If
            End If
            If MaxLenth > 4 Then
                temp1 = CStr(ds.Tables("Query").Rows(4).Item("Number"))
                If data = 4 Then
                    Return temp1
                End If
            End If
        End If
        Return -1
    End Function

    Private Sub BntRecive2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BntRecive2.Click
        Dim sql As String = ""
        Dim temp As Integer = GenDelId(1)
        If temp <> -1 Then
            sql = "delete from BayTemp where Number = " + CStr(temp)
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "delId")
        End If
    End Sub

    Private Sub BntRecive3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BntRecive3.Click
        Dim sql As String = ""
        Dim temp As Integer = GenDelId(2)
        If temp <> -1 Then
            sql = "delete from BayTemp where Number = " + CStr(temp)
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "delId")
        End If
    End Sub

    Private Sub BntRecive4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BntRecive4.Click
        Dim sql As String = ""
        Dim temp As Integer = GenDelId(3)
        If temp <> -1 Then
            sql = "delete from BayTemp where Number = " + CStr(temp)
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "delId")
        End If
    End Sub

    Private Sub BntRecive5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BntRecive5.Click
        Dim sql As String = ""
        Dim temp As Integer = GenDelId(4)
        If temp <> -1 Then
            sql = "delete from BayTemp where Number = " + CStr(temp)
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "delId")
        End If
    End Sub
End Class
