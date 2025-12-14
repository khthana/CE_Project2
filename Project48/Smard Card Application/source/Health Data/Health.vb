Option Explicit On 
'Option Strict On
Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Imports System.Text
Public Class Health
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
    Friend WithEvents ThaiSurname As System.Windows.Forms.TextBox
    Friend WithEvents ThaiName As System.Windows.Forms.TextBox
    Friend WithEvents StdID As System.Windows.Forms.TextBox
    Friend WithEvents Bsave As System.Windows.Forms.Button
    Friend WithEvents BDelete As System.Windows.Forms.Button
    Friend WithEvents Bcancel As System.Windows.Forms.Button
    Friend WithEvents GridHealth As System.Windows.Forms.DataGrid
    Friend WithEvents TmrRead As System.Windows.Forms.Timer
    Friend WithEvents TmrCardOut As System.Windows.Forms.Timer
    Friend WithEvents ReadText As System.Windows.Forms.TextBox
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.ThaiSurname = New System.Windows.Forms.TextBox
        Me.ThaiName = New System.Windows.Forms.TextBox
        Me.Label2 = New System.Windows.Forms.Label
        Me.StdID = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.GridHealth = New System.Windows.Forms.DataGrid
        Me.Bsave = New System.Windows.Forms.Button
        Me.BDelete = New System.Windows.Forms.Button
        Me.Bcancel = New System.Windows.Forms.Button
        Me.TmrRead = New System.Windows.Forms.Timer(Me.components)
        Me.TmrCardOut = New System.Windows.Forms.Timer(Me.components)
        Me.ReadText = New System.Windows.Forms.TextBox
        Me.GroupBox1.SuspendLayout()
        CType(Me.GridHealth, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'ThaiSurname
        '
        Me.ThaiSurname.ForeColor = System.Drawing.Color.Goldenrod
        Me.ThaiSurname.Location = New System.Drawing.Point(280, 40)
        Me.ThaiSurname.Name = "ThaiSurname"
        Me.ThaiSurname.Size = New System.Drawing.Size(176, 24)
        Me.ThaiSurname.TabIndex = 10
        Me.ThaiSurname.Text = ""
        '
        'ThaiName
        '
        Me.ThaiName.ForeColor = System.Drawing.Color.Goldenrod
        Me.ThaiName.Location = New System.Drawing.Point(104, 40)
        Me.ThaiName.Name = "ThaiName"
        Me.ThaiName.Size = New System.Drawing.Size(168, 24)
        Me.ThaiName.TabIndex = 9
        Me.ThaiName.Text = ""
        '
        'Label2
        '
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(16, 40)
        Me.Label2.Name = "Label2"
        Me.Label2.TabIndex = 8
        Me.Label2.Text = "ชื่อ - นามสกุล"
        '
        'StdID
        '
        Me.StdID.ForeColor = System.Drawing.Color.Green
        Me.StdID.Location = New System.Drawing.Point(104, 8)
        Me.StdID.Name = "StdID"
        Me.StdID.Size = New System.Drawing.Size(168, 24)
        Me.StdID.TabIndex = 7
        Me.StdID.Text = ""
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(16, 8)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(88, 23)
        Me.Label1.TabIndex = 6
        Me.Label1.Text = "รหัสนักศึกษา"
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.GridHealth)
        Me.GroupBox1.Location = New System.Drawing.Point(16, 72)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(440, 208)
        Me.GroupBox1.TabIndex = 11
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "ข้อมูลประวัติ การตรวจสุขภาพ "
        '
        'GridHealth
        '
        Me.GridHealth.DataMember = ""
        Me.GridHealth.HeaderForeColor = System.Drawing.SystemColors.ControlText
        Me.GridHealth.Location = New System.Drawing.Point(8, 24)
        Me.GridHealth.Name = "GridHealth"
        Me.GridHealth.Size = New System.Drawing.Size(424, 176)
        Me.GridHealth.TabIndex = 0
        '
        'Bsave
        '
        Me.Bsave.BackColor = System.Drawing.Color.LightGray
        Me.Bsave.ForeColor = System.Drawing.SystemColors.Highlight
        Me.Bsave.Location = New System.Drawing.Point(464, 80)
        Me.Bsave.Name = "Bsave"
        Me.Bsave.Size = New System.Drawing.Size(88, 40)
        Me.Bsave.TabIndex = 12
        Me.Bsave.Text = "เพิ่มข้อมูล"
        '
        'BDelete
        '
        Me.BDelete.BackColor = System.Drawing.Color.White
        Me.BDelete.ForeColor = System.Drawing.Color.IndianRed
        Me.BDelete.Location = New System.Drawing.Point(464, 128)
        Me.BDelete.Name = "BDelete"
        Me.BDelete.Size = New System.Drawing.Size(88, 40)
        Me.BDelete.TabIndex = 13
        Me.BDelete.Text = "ลบข้อมูล"
        '
        'Bcancel
        '
        Me.Bcancel.BackColor = System.Drawing.Color.DimGray
        Me.Bcancel.ForeColor = System.Drawing.SystemColors.ControlLightLight
        Me.Bcancel.Location = New System.Drawing.Point(464, 232)
        Me.Bcancel.Name = "Bcancel"
        Me.Bcancel.Size = New System.Drawing.Size(88, 40)
        Me.Bcancel.TabIndex = 14
        Me.Bcancel.Text = "Exit"
        '
        'TmrRead
        '
        '
        'TmrCardOut
        '
        '
        'ReadText
        '
        Me.ReadText.Location = New System.Drawing.Point(16, 288)
        Me.ReadText.Name = "ReadText"
        Me.ReadText.Size = New System.Drawing.Size(280, 24)
        Me.ReadText.TabIndex = 15
        Me.ReadText.Text = ""
        Me.ReadText.Visible = False
        '
        'Health
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.BackColor = System.Drawing.Color.DarkGray
        Me.ClientSize = New System.Drawing.Size(560, 318)
        Me.Controls.Add(Me.ReadText)
        Me.Controls.Add(Me.Bcancel)
        Me.Controls.Add(Me.BDelete)
        Me.Controls.Add(Me.Bsave)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.ThaiSurname)
        Me.Controls.Add(Me.ThaiName)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.StdID)
        Me.Controls.Add(Me.Label1)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.Name = "Health"
        Me.Text = "ข้อมูลสุขภาพ"
        Me.GroupBox1.ResumeLayout(False)
        CType(Me.GridHealth, System.ComponentModel.ISupportInitialize).EndInit()
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

    Dim FactSel As String = "1001"

    Dim SubType As String = ""
    Dim Depart As String = ""
    Dim Fact As String = ""


    Dim CardIn_out As Boolean
    Dim Sendloop As Integer = 0
    Dim TextSend As String = ""
    Dim StatusWrite As Boolean

    Dim strConn As String = "server =(local);initial catalog=SmartFood;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Private Sub Health_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Maximized
        Cursor.Current = Cursors.WaitCursor

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With
        StdID.Text = Student_ID
        StdID.ReadOnly = True
        ThaiName.Text = EthaiNM
        ThaiName.ReadOnly = True
        ThaiSurname.Text = EThaiSurNM
        ThaiSurname.ReadOnly = True

        BDelete.Enabled = False
        If StatusUser = False Then
            Bsave.Visible = False
            BDelete.Visible = False
        End If

        Dim i As Integer
        For i = 0 To 3
            mComs(i) = IsPortAvailable(i + 1)
        Next
        InitPort()
        TmrCardOut.Enabled = True
        Bsave.Enabled = False

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
    Private Sub tmrRead_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TmrRead.Tick
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
                'TextSend = SmartStudent + Chr(3) + SmartHealth + Chr(3) + CStr(InsertMoneyStatus) + Chr(3) + Chr(4) + Chr(13) + Chr(5)
                'Me.tmrWrite.Enabled = True
                'Sendloop = 0
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
            MsgBox("บัตร ยังไม่ได้ลงทะเบียน")
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
        EthaiNM = tempname
        EThaiSurNM = tempsurname
        StdID.Text = Student_id
        ThaiName.Text = tempname
        ThaiSurname.Text = tempsurname
        tmrCardOut.Enabled = True

    End Function

    Private Sub tmrCardOut_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TmrCardOut.Tick
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
                        out = False
                        CardIn_out = False

                        StdID.Text = ""
                        ThaiName.Text = ""
                        ThaiSurname.Text = ""
                        Bsave.Enabled = False
                        BDelete.Enabled = False
                        Me.tmrCardOut.Enabled = False
                        Me.tmrCardOut.Stop()
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
                Finally
                End Try
            End If
        End Try
    End Sub

    Private Sub BDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BDelete.Click
        Dim index As Integer = 0
        Dim DataDel As String = ""
        Dim sql As String = ""
        If MessageBox.Show("ต้องการลบข้อมูลสุขภาพที่ รหัส " + DataDel + "ออกจากฐานข้อมูล", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
            index = GridHealth.CurrentRowIndex
            DataDel = CStr(GridHealth.Item(index, 0))
            sql = "Delete From HDate  Where H_DAY = " + DataDel
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Del")

            sql = "Delete From Health  Where H_DAY = " + DataDel
            da.SelectCommand.CommandText = sql
            ds.Tables.Clear()
            da.Fill(ds, "Del")
            BDelete.Enabled = False
            FormatDataGrid()
        End If
    End Sub

    Private Sub Bcancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Bcancel.Click
        Me.Close()
    End Sub
    Private Sub FormatDataGrid()
        Dim sql As String = ""
        sql = "select a.H_DAY,a.DAYs,a.AGES,a.BODYS from HDate a,Health b "
        sql = sql + "where a.H_DAY = b.H_DAY and b.Std_ID = '"
        sql = sql + Student_ID + "'"

        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "DataSelect")
        If ds.Tables("DataSelect").Rows.Count = 0 Then
            'MsgBox(" ไม่มีข้อมูล  No Record 0 Rows!")
        End If

        With GridHealth
            .AllowNavigation = False
            .BackgroundColor = Color.LemonChiffon
            .ReadOnly = True
            .DataSource = ds.Tables("DataSelect")
        End With

        Dim GrdTs As DataGridTableStyle = New DataGridTableStyle
        With GrdTs
            .AlternatingBackColor = Color.Honeydew
            .BackColor = Color.White
            .MappingName = "DataSelect"
        End With

        Dim cs As New DataGridTextBoxColumn
        With cs
            .HeaderText = "รหัส"
            .MappingName = "H_DAY"
            .ReadOnly = True
            .Width = 100
        End With
        GrdTs.GridColumnStyles.Add(cs)

        Dim cs1 As New DataGridTextBoxColumn
        With cs1
            .HeaderText = "วันที่ทำการตรวจ"
            .MappingName = "DAYS"
            .ReadOnly = True
            .Width = 100
        End With
        GrdTs.GridColumnStyles.Add(cs1)

        Dim cs2 As New DataGridTextBoxColumn
        With cs2
            .HeaderText = "อาการที่ตรวจพบ"
            .MappingName = "BODYS"
            .ReadOnly = True
            .Width = 250
        End With
        GrdTs.GridColumnStyles.Add(cs2)

        With GridHealth
            .TableStyles.Clear()
            '.CaptionFont = New Font("MS Sans Serif", 10.0, FontStyle.Regular)
            .CaptionText = "ตารางข้อมูลสุขภาพ"
            .FlatMode = True
            .TableStyles.Add(GrdTs)
        End With
    End Sub

    Private Sub Bsave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Bsave.Click
        H_LINKED = False
        Dim form As New Health_Link
        If form.ShowDialog Then
            FormatDataGrid()
        End If
    End Sub

    Private Sub GridHealth_DoubleClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridHealth.DoubleClick
        H_LINKED = True
        Dim index As Integer = 0
        index = GridHealth.CurrentRowIndex
        H_DAY = CInt(GridHealth.Item(index, 0))
        Dim form As New Health_Link
        If form.ShowDialog Then
            FormatDataGrid()
        End If
    End Sub

    Private Sub GridHealth_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles GridHealth.MouseUp
        BDelete.Enabled = True
    End Sub

    Private Sub StdID_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StdID.TextChanged
        If StdID.Text.Length = 8 Then
            GridHealth.Enabled = True
            Bsave.Enabled = True
            FormatDataGrid()
        Else
            ResetGrid()
            GridHealth.Enabled = False
        End If
    End Sub
    Private Sub ResetGrid()
        Dim sql As String = ""
        sql = "select a.H_DAY,a.DAYs,a.AGES,a.BODYS from HDate a,Health b "
        sql = sql + "where a.H_DAY = b.H_DAY and b.Std_ID = '1'"

        da = New SqlDataAdapter(sql, Conn)
        ds.Tables.Clear()
        da.Fill(ds, "DataSelect")
        If ds.Tables("DataSelect").Rows.Count = 0 Then
            'MsgBox(" ไม่มีข้อมูล  No Record 0 Rows!")
        End If

        With GridHealth
            .AllowNavigation = False
            .BackgroundColor = Color.LemonChiffon
            .ReadOnly = True
            .DataSource = ds.Tables("DataSelect")
        End With

        Dim GrdTs As DataGridTableStyle = New DataGridTableStyle
        With GrdTs
            .AlternatingBackColor = Color.Honeydew
            .BackColor = Color.White
            .MappingName = "DataSelect"
        End With

        Dim cs As New DataGridTextBoxColumn
        With cs
            .HeaderText = "รหัส"
            .MappingName = "H_DAY"
            .ReadOnly = True
            .Width = 100
        End With
        GrdTs.GridColumnStyles.Add(cs)

        Dim cs1 As New DataGridTextBoxColumn
        With cs1
            .HeaderText = "วันที่ทำการตรวจ"
            .MappingName = "DAYS"
            .ReadOnly = True
            .Width = 100
        End With
        GrdTs.GridColumnStyles.Add(cs1)

        Dim cs2 As New DataGridTextBoxColumn
        With cs2
            .HeaderText = "อาการที่ตรวจพบ"
            .MappingName = "BODYS"
            .ReadOnly = True
            .Width = 250
        End With
        GrdTs.GridColumnStyles.Add(cs2)

        With GridHealth
            .TableStyles.Clear()
            '.CaptionFont = New Font("MS Sans Serif", 10.0, FontStyle.Regular)
            .CaptionText = "ตารางข้อมูลสุขภาพ"
            .FlatMode = True
            .TableStyles.Add(GrdTs)
        End With
    End Sub
End Class
