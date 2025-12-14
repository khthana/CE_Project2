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
    Friend WithEvents DateCur As System.Windows.Forms.Label
    Friend WithEvents ReadText As System.Windows.Forms.TextBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents MainMoney As System.Windows.Forms.TextBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents StdName As System.Windows.Forms.Label
    Friend WithEvents StdID As System.Windows.Forms.Label
    Friend WithEvents TextMoney As System.Windows.Forms.TextBox
    Friend WithEvents BnExit As System.Windows.Forms.Button
    Friend WithEvents BnSave As System.Windows.Forms.Button
    Friend WithEvents Login As System.Windows.Forms.Button
    Friend WithEvents tmrRead As System.Windows.Forms.Timer
    Friend WithEvents tmrWrite As System.Windows.Forms.Timer
    Friend WithEvents tmrDate As System.Windows.Forms.Timer
    Friend WithEvents tmrCardOut As System.Windows.Forms.Timer
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents StateLogin As System.Windows.Forms.Label
    Friend WithEvents BnSearch As System.Windows.Forms.Button
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.DateCur = New System.Windows.Forms.Label
        Me.ReadText = New System.Windows.Forms.TextBox
        Me.Label4 = New System.Windows.Forms.Label
        Me.MainMoney = New System.Windows.Forms.TextBox
        Me.Label3 = New System.Windows.Forms.Label
        Me.StdName = New System.Windows.Forms.Label
        Me.StdID = New System.Windows.Forms.Label
        Me.TextMoney = New System.Windows.Forms.TextBox
        Me.BnExit = New System.Windows.Forms.Button
        Me.BnSave = New System.Windows.Forms.Button
        Me.Login = New System.Windows.Forms.Button
        Me.tmrRead = New System.Windows.Forms.Timer(Me.components)
        Me.tmrWrite = New System.Windows.Forms.Timer(Me.components)
        Me.tmrDate = New System.Windows.Forms.Timer(Me.components)
        Me.tmrCardOut = New System.Windows.Forms.Timer(Me.components)
        Me.Label1 = New System.Windows.Forms.Label
        Me.StateLogin = New System.Windows.Forms.Label
        Me.BnSearch = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'DateCur
        '
        Me.DateCur.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.DateCur.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.DateCur.ForeColor = System.Drawing.SystemColors.ControlLight
        Me.DateCur.Location = New System.Drawing.Point(408, 168)
        Me.DateCur.Name = "DateCur"
        Me.DateCur.Size = New System.Drawing.Size(144, 40)
        Me.DateCur.TabIndex = 23
        '
        'ReadText
        '
        Me.ReadText.Location = New System.Drawing.Point(8, 288)
        Me.ReadText.Name = "ReadText"
        Me.ReadText.Size = New System.Drawing.Size(120, 24)
        Me.ReadText.TabIndex = 22
        Me.ReadText.Text = "TextBox3"
        Me.ReadText.Visible = False
        '
        'Label4
        '
        Me.Label4.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.Label4.ForeColor = System.Drawing.SystemColors.ControlLight
        Me.Label4.Location = New System.Drawing.Point(24, 27)
        Me.Label4.Name = "Label4"
        Me.Label4.TabIndex = 21
        Me.Label4.Text = "สถานะของบัตร"
        '
        'MainMoney
        '
        Me.MainMoney.BackColor = System.Drawing.SystemColors.InfoText
        Me.MainMoney.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.MainMoney.ForeColor = System.Drawing.Color.DarkOrange
        Me.MainMoney.Location = New System.Drawing.Point(408, 83)
        Me.MainMoney.Name = "MainMoney"
        Me.MainMoney.ReadOnly = True
        Me.MainMoney.Size = New System.Drawing.Size(120, 24)
        Me.MainMoney.TabIndex = 20
        Me.MainMoney.Text = "0.00"
        '
        'Label3
        '
        Me.Label3.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.Label3.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.Label3.Location = New System.Drawing.Point(408, 51)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(120, 23)
        Me.Label3.TabIndex = 19
        Me.Label3.Text = "เงินในบัตร"
        '
        'StdName
        '
        Me.StdName.Location = New System.Drawing.Point(24, 83)
        Me.StdName.Name = "StdName"
        Me.StdName.Size = New System.Drawing.Size(376, 23)
        Me.StdName.TabIndex = 18
        '
        'StdID
        '
        Me.StdID.Location = New System.Drawing.Point(24, 51)
        Me.StdID.Name = "StdID"
        Me.StdID.Size = New System.Drawing.Size(376, 23)
        Me.StdID.TabIndex = 17
        '
        'TextMoney
        '
        Me.TextMoney.BackColor = System.Drawing.SystemColors.Info
        Me.TextMoney.Font = New System.Drawing.Font("Microsoft Sans Serif", 72.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.TextMoney.ForeColor = System.Drawing.Color.Red
        Me.TextMoney.Location = New System.Drawing.Point(24, 139)
        Me.TextMoney.MaxLength = 7
        Me.TextMoney.Name = "TextMoney"
        Me.TextMoney.Size = New System.Drawing.Size(376, 116)
        Me.TextMoney.TabIndex = 16
        Me.TextMoney.Text = "0.00"
        Me.TextMoney.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
        '
        'BnExit
        '
        Me.BnExit.BackColor = System.Drawing.SystemColors.ControlLight
        Me.BnExit.Location = New System.Drawing.Point(408, 275)
        Me.BnExit.Name = "BnExit"
        Me.BnExit.Size = New System.Drawing.Size(120, 40)
        Me.BnExit.TabIndex = 15
        Me.BnExit.Text = "Exit"
        '
        'BnSave
        '
        Me.BnSave.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.BnSave.ForeColor = System.Drawing.Color.Gold
        Me.BnSave.Location = New System.Drawing.Point(408, 219)
        Me.BnSave.Name = "BnSave"
        Me.BnSave.Size = New System.Drawing.Size(120, 40)
        Me.BnSave.TabIndex = 14
        Me.BnSave.Text = "เพิ่มจำนวนเงิน"
        '
        'Login
        '
        Me.Login.BackColor = System.Drawing.SystemColors.GrayText
        Me.Login.Location = New System.Drawing.Point(280, 275)
        Me.Login.Name = "Login"
        Me.Login.Size = New System.Drawing.Size(120, 40)
        Me.Login.TabIndex = 13
        Me.Login.Text = "Login"
        '
        'tmrRead
        '
        '
        'tmrWrite
        '
        '
        'tmrDate
        '
        '
        'tmrCardOut
        '
        '
        'Label1
        '
        Me.Label1.BackColor = System.Drawing.SystemColors.AppWorkspace
        Me.Label1.ForeColor = System.Drawing.Color.Gold
        Me.Label1.Location = New System.Drawing.Point(24, 112)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(120, 23)
        Me.Label1.TabIndex = 25
        Me.Label1.Text = "สถานะการใช้ระบบ"
        '
        'StateLogin
        '
        Me.StateLogin.BackColor = System.Drawing.SystemColors.ControlText
        Me.StateLogin.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.StateLogin.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.StateLogin.ForeColor = System.Drawing.Color.LawnGreen
        Me.StateLogin.Location = New System.Drawing.Point(144, 112)
        Me.StateLogin.Name = "StateLogin"
        Me.StateLogin.Size = New System.Drawing.Size(112, 24)
        Me.StateLogin.TabIndex = 26
        Me.StateLogin.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'BnSearch
        '
        Me.BnSearch.BackColor = System.Drawing.SystemColors.ControlDark
        Me.BnSearch.Location = New System.Drawing.Point(152, 275)
        Me.BnSearch.Name = "BnSearch"
        Me.BnSearch.Size = New System.Drawing.Size(120, 40)
        Me.BnSearch.TabIndex = 27
        Me.BnSearch.Text = "ตรวจสอบรายได้"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(7, 17)
        Me.ClientSize = New System.Drawing.Size(560, 342)
        Me.Controls.Add(Me.BnSearch)
        Me.Controls.Add(Me.StateLogin)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.DateCur)
        Me.Controls.Add(Me.ReadText)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.MainMoney)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.StdName)
        Me.Controls.Add(Me.StdID)
        Me.Controls.Add(Me.TextMoney)
        Me.Controls.Add(Me.BnExit)
        Me.Controls.Add(Me.BnSave)
        Me.Controls.Add(Me.Login)
        Me.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(222, Byte))
        Me.IsMdiContainer = True
        Me.Name = "Form1"
        Me.Text = "บัตรเติมเงิน"
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

    Dim CardIn_out As Boolean
    Dim Sendloop As Integer = 0
    Dim TextSend As String = ""
    Dim StatusWrite As Boolean
    Dim Wait As WaitUpdate

    Dim InfoDate As DateTimeFormatInfo

    ' print document*********************
    Dim UseFont As New Font("MS Sans Serif", 10)
    Dim prDlg As PrintDialog = New PrintDialog
    Private prDoc As PrintDocument = New PrintDocument

    '*/*****************************

    Private Sub BnExit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BnExit.Click
        Me.Close()
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.WindowState = FormWindowState.Maximized
        Cursor.Current = Cursors.WaitCursor
        tmrDate.Enabled = True
        Wait = New WaitUpdate
        TextMoney.Enabled = False
        BnSearch.Enabled = False
        BnSave.Enabled = False
        InfoDate = DateTimeFormatInfo.InvariantInfo

        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With

        Dim i As Integer
        For i = 0 To 3
            mComs(i) = IsPortAvailable(i + 1)
        Next
        InitPort()

        AddHandler prDoc.PrintPage, New PrintPageEventHandler(AddressOf Me.StringToPrint_Print)
        prDoc.DocumentName = "เติมเงิน"
        prDlg.Document = prDoc
        Cursor.Current = Cursors.Default
        tmrCardOut.Enabled = True
        StateLogin.Text = "ทั่วไป"
        StatusUser = False

    End Sub
    Private Sub StringToPrint_Print(ByVal sender As Object, ByVal e As PrintPageEventArgs)

        AnyString(e.Graphics, "รหัสนักศึกษา  : " + Student_id, 100, 100)
        AnyString(e.Graphics, "ชื่อ  : " + NameStudent + "  " + SurName, 100, 120)
        AnyString(e.Graphics, "วันที่  : " + DateCur.Text, 100, 140)
        AnyString(e.Graphics, ".......................................................", 100, 150)

        AnyString(e.Graphics, "-----------------------------------------------------", 100, 160)
        AnyString(e.Graphics, "        รายการ", 100, 175)
        AnyString(e.Graphics, "จำนวนเงิน", 295, 175)
        AnyString(e.Graphics, "-----------------------------------------------------", 100, 185)

        AnyString(e.Graphics, "เพิ่มจำนวนเงิน", 100, 210)
        AnyString(e.Graphics, TextMoney.Text, 295, 210)

        Dim CurrentYPosition As Integer = 230
        Dim MainMoneyTol As Double
        Dim temp As Double = MainMoney.Text
        temp += TextMoney.Text

        CurrentYPosition = CurrentYPosition + 40
        AnyString(e.Graphics, "----------------------------------------------------", 100, CurrentYPosition)
        CurrentYPosition = CurrentYPosition + 10
        AnyString(e.Graphics, "        จำนวนเงินคงเดิม", 100, CurrentYPosition)
        AnyString(e.Graphics, MainMoney.Text, 300, CurrentYPosition)
        CurrentYPosition = CurrentYPosition + 10
        AnyString(e.Graphics, "----------------------------------------------------", 100, CurrentYPosition)
        CurrentYPosition = CurrentYPosition + 10
        AnyString(e.Graphics, "        จำนวนเงินคงเหลือ", 100, CurrentYPosition)
        AnyString(e.Graphics, CStr(temp.ToString("##0.00")), 300, CurrentYPosition)
        CurrentYPosition = CurrentYPosition + 10
        AnyString(e.Graphics, "----------------------------------------------------", 100, CurrentYPosition)


    End Sub
    Private Sub AnyString(ByVal g As Graphics, ByVal printString As String, ByVal xPos As Integer, ByVal yPos As Integer)
        Dim anyPoint As New PointF(xPos, yPos)
        g.DrawString(printString, UseFont, Brushes.Black, anyPoint)
    End Sub
    Private Function IsInstallPrinter() As Boolean
        IsInstallPrinter = False
        If prDoc.PrinterSettings.PrinterName = "<no default printer>" Then
            IsInstallPrinter = False
        Else
            IsInstallPrinter = True
        End If
    End Function
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

    Private Sub tmrDate_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles tmrDate.Tick
        Dim DateCur1 As Date
        DateCur.Text = ""
        DateCur.Text = CStr(DateCur1.Today.ToLongDateString) + "      "
        DateCur.Text = DateCur.Text + CStr(DateCur1.Today.Now.ToLongTimeString)
    End Sub

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
        StdID.Text = Student_id
        StdName.Text = NameStudent + "  " + SurName
        MainMoney.Text = CInt(SmartMoney).ToString("##0.00")
        TextMoney.Enabled = True
        tmrCardOut.Enabled = True

    End Function

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
                        out = False
                        CardIn_out = False

                        StdID.Text = ""
                        StdName.Text = ""
                        TextMoney.Text = "0.00"
                        MainMoney.Text = "0.00"
                        BnSave.Enabled = False
                        TextMoney.Enabled = False
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

    Private Sub tmrWrite_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles tmrWrite.Tick
        If TextSend.Chars(Sendloop) <> Chr(5) Then
            ReadText.Text = TextSend.Chars(Sendloop)
            Sendloop = Sendloop + 1

            Try
                oCP.Write(Encoding.ASCII.GetBytes(Me.ReadText.Text))
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
                Wait.Close()
                Wait = New WaitUpdate
                MainMoney.Text = InsertMoneyStatus.ToString("#00.00")
                TextMoney.Text = "0.00"
                Me.tmrCardOut.Enabled = True
            End If

        End If
    End Sub

    Private Sub BnSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BnSave.Click

            If MessageBox.Show("ต้องการเพิ่มจำนวนเงินในบัตร ใช่ หรือ ไม่ ", "คำยืนยัน", MessageBoxButtons.YesNo, MessageBoxIcon.Question) = DialogResult.Yes Then
                Dim Sql As String = ""

                Dim DateCur As Date
                If IsInstallPrinter() = True Then
                prDoc.Print()
                Else
                    MessageBox.Show("กรุณาติดตั้งเครื่อง Printer ก่อนสั่งพิมพ์เอกสาร", "ผลการตรวจสอบ", MessageBoxButtons.OK, MessageBoxIcon.Information)
                End If
                Try
                    Dim tempMon1 As Double = MainMoney.Text
                    Dim tempMon2 As Double = TextMoney.Text
                    InsertMoneyStatus = tempMon1 + tempMon2

                    ' ลงฐานข้อมูล
                    Sql = "insert into CardMoney(Std_ID,Name,SurName,Money,DateCurrent) values('"
                    Sql = Sql & Student_id & "','" & NameStudent & "','" & SurName & "'," & tempMon2 & ",'" & DateCur.Today().ToString("d", InfoDate) & "')"

                    da = New SqlDataAdapter(Sql, Conn)
                    ds.Tables.Clear()
                    da.Fill(ds, "Insert")

                    ' *****************
                    Try

                        TextSend = "write" + Chr(13) + Chr(5)
                        StatusWrite = True
                        Wait.Show()
                        tmrCardOut.Enabled = False
                        tmrWrite.Enabled = True

                    Catch ex As Exception

                    End Try

                Catch ex As Exception
                    MsgBox("ข้อมูลผิดพลาด.")
                End Try
            End If
      
    End Sub

    Private Sub TextMoney_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TextMoney.TextChanged
        If TextMoney.Text <> "" Then
            Dim TextLen As Integer = TextMoney.Text.Length
            If TextMoney.Text.Chars(TextLen - 1) >= "0" And TextMoney.Text.Chars(TextLen - 1) <= "9" Or TextMoney.Text.Chars(TextLen - 1) = "." Or TextMoney.Text.Chars(TextLen - 1) = "-" Then
                If TextLen > 1 And TextMoney.Text.Chars(TextLen - 1) = "-" Then
                    MessageBox.Show("กรุณาใส่ ข้อมูล ให้ถูกต้อง", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                    TextMoney.Text = ""
                    BnSave.Enabled = False
                    Exit Sub
                End If
            Else
                MessageBox.Show("กรุณาใส่ ข้อมูล ให้ถูกต้อง", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                TextMoney.Text = ""
                BnSave.Enabled = False
                Exit Sub
            End If
            If StatusUser Then
                If TextMoney.Text <> "" Then
                    If TextMoney.Text.Chars(TextLen - 1) >= "0" And TextMoney.Text.Chars(TextLen - 1) <= "9" Or TextMoney.Text.Chars(TextLen - 1) = "." Or TextMoney.Text.Chars(TextLen - 1) = "-" Then
                        BnSave.Enabled = True
                    End If
                Else
                    BnSave.Enabled = False
                End If
            End If
        End If

    End Sub

    Private Sub Login_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Login.Click

        If Login.Text = "Login" Then
            Dim form As New LOGIN
            If form.ShowDialog Then
                If StatusUser Then
                    StateLogin.Text = "เจ้าหน้าที่"
                    BnSearch.Enabled = True
                    Login.Text = "Logout"
                    If TextMoney.Text <> 0 Then
                        BnSave.Enabled = True
                    End If
                End If
            End If
        Else
            Login.Text = "Login"
            StateLogin.Text = "ทั่วไป"
            StatusUser = False
            BnSearch.Enabled = False
            BnSave.Enabled = False
        End If

    End Sub

    Private Sub BnSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BnSearch.Click
        Dim Form As New Search
        If Form.ShowDialog Then

        End If
    End Sub
End Class
