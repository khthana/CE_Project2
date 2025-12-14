Imports System.Data
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Drawing.Printing
Imports System.Text
Imports System.Drawing
Imports System.Windows.Forms

Public Class frmPrintDynamicForm
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
    Public WithEvents prnDoc As System.Drawing.Printing.PrintDocument
    Public WithEvents printdlg As System.Windows.Forms.PrintPreviewDialog
    Public WithEvents Panel1 As System.Windows.Forms.Panel
    Public WithEvents btnPrint As System.Windows.Forms.Button
    Public WithEvents btnClose As System.Windows.Forms.Button
    Public WithEvents btnPrnDlg As System.Windows.Forms.Button
    Public WithEvents btnDocSet As System.Windows.Forms.Button
    Public WithEvents prnSetDlg As System.Windows.Forms.PrintDialog
    Public WithEvents PageSetDlg As System.Windows.Forms.PageSetupDialog
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(frmPrintDynamicForm))
        Me.prnDoc = New System.Drawing.Printing.PrintDocument
        Me.printdlg = New System.Windows.Forms.PrintPreviewDialog
        Me.Panel1 = New System.Windows.Forms.Panel
        Me.btnPrnDlg = New System.Windows.Forms.Button
        Me.btnPrint = New System.Windows.Forms.Button
        Me.btnClose = New System.Windows.Forms.Button
        Me.btnDocSet = New System.Windows.Forms.Button
        Me.PageSetDlg = New System.Windows.Forms.PageSetupDialog
        Me.prnSetDlg = New System.Windows.Forms.PrintDialog
        Me.Panel1.SuspendLayout()
        Me.SuspendLayout()
        '
        'prnDoc
        '
        '
        'printdlg
        '
        Me.printdlg.AutoScrollMargin = New System.Drawing.Size(0, 0)
        Me.printdlg.AutoScrollMinSize = New System.Drawing.Size(0, 0)
        Me.printdlg.ClientSize = New System.Drawing.Size(400, 300)
        Me.printdlg.Document = Me.prnDoc
        Me.printdlg.Enabled = True
        Me.printdlg.Icon = CType(resources.GetObject("printdlg.Icon"), System.Drawing.Icon)
        Me.printdlg.Location = New System.Drawing.Point(25, 14)
        Me.printdlg.MinimumSize = New System.Drawing.Size(375, 250)
        Me.printdlg.Name = "printdlg"
        Me.printdlg.TransparencyKey = System.Drawing.Color.Empty
        Me.printdlg.Visible = False
        '
        'Panel1
        '
        Me.Panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Panel1.Controls.Add(Me.btnPrnDlg)
        Me.Panel1.Controls.Add(Me.btnPrint)
        Me.Panel1.Controls.Add(Me.btnClose)
        Me.Panel1.Controls.Add(Me.btnDocSet)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.Panel1.Location = New System.Drawing.Point(0, 137)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(504, 40)
        Me.Panel1.TabIndex = 14
        '
        'btnPrnDlg
        '
        Me.btnPrnDlg.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.btnPrnDlg.Image = CType(resources.GetObject("btnPrnDlg.Image"), System.Drawing.Image)
        Me.btnPrnDlg.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnPrnDlg.Location = New System.Drawing.Point(12, 8)
        Me.btnPrnDlg.Name = "btnPrnDlg"
        Me.btnPrnDlg.Size = New System.Drawing.Size(116, 24)
        Me.btnPrnDlg.TabIndex = 11
        Me.btnPrnDlg.Text = "Printer Setup"
        Me.btnPrnDlg.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'btnPrint
        '
        Me.btnPrint.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.btnPrint.Image = CType(resources.GetObject("btnPrint.Image"), System.Drawing.Image)
        Me.btnPrint.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnPrint.Location = New System.Drawing.Point(340, 8)
        Me.btnPrint.Name = "btnPrint"
        Me.btnPrint.Size = New System.Drawing.Size(72, 24)
        Me.btnPrint.TabIndex = 10
        Me.btnPrint.Text = "Print"
        Me.btnPrint.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'btnClose
        '
        Me.btnClose.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.btnClose.Image = CType(resources.GetObject("btnClose.Image"), System.Drawing.Image)
        Me.btnClose.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnClose.Location = New System.Drawing.Point(420, 8)
        Me.btnClose.Name = "btnClose"
        Me.btnClose.Size = New System.Drawing.Size(72, 24)
        Me.btnClose.TabIndex = 9
        Me.btnClose.Text = "Close"
        Me.btnClose.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'btnDocSet
        '
        Me.btnDocSet.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.btnDocSet.Image = CType(resources.GetObject("btnDocSet.Image"), System.Drawing.Image)
        Me.btnDocSet.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnDocSet.Location = New System.Drawing.Point(164, 12)
        Me.btnDocSet.Name = "btnDocSet"
        Me.btnDocSet.Size = New System.Drawing.Size(116, 24)
        Me.btnDocSet.TabIndex = 12
        Me.btnDocSet.Text = "Page Setup"
        Me.btnDocSet.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        '
        'PageSetDlg
        '
        Me.PageSetDlg.Document = Me.prnDoc
        '
        'prnSetDlg
        '
        Me.prnSetDlg.Document = Me.prnDoc
        '
        'frmPrintDynamicForm
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(504, 177)
        Me.Controls.Add(Me.Panel1)
        Me.Name = "frmPrintDynamicForm"
        Me.Panel1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region


    '----------------- Set Report Default Value
    Public DateString As String
    Public FontName As String = "MS Sans Serif"
    Public LineHeight As Single = 1
    Public SkipLinePerRecord As Byte = 0

    '------ Internal Use Counter and Flag 
    Dim strConn As String = "server =(local);initial catalog=project;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Public SqlSet As String = ""
    Private dbSet As DataSet = New DataSet
    Dim dt As DataTable

    Private PageNumber As Integer = 0
    Private dbCursor As Long = 0L
    Private SumList As Double
    Private SumList1 As Double
    Private SumList2 As Double
    Public Stateprinting As Boolean

    Private strData1 As String = ""
    Private strData2 As String = ""
    Private strData3 As String = ""
    Private strData4 As String = ""
    Private strData5 As String = ""
    Private strData6 As String = ""

    Private CreditAll As Double = 0.0
    Private GrageAll As Double = 0.0
    Private GPA As Double = 0.0
    Private CreditGPA As Double = 0.0



    Function getPositionWidth(ByVal p_width As Single, ByVal p_position As Single) As Single
        Return p_width * p_position / 100
    End Function


    Private Sub prnDoc_PrintPage(ByVal sender As System.Object, ByVal e As System.Drawing.Printing.PrintPageEventArgs) Handles prnDoc.PrintPage

        Dim TempMoney As Double = MoneyChangSubject
        Dim LeftMargin As Integer = 50
        Dim TopMargin As Integer = 50
        Dim MoneyThaif As Double = 0.0

        Dim LinesInPage As Integer = 0
        Dim YPosition As Integer = 0
        Dim CountLine As Integer = 0
        Dim CurrentLine As String

        Dim TermCur As Integer = 0
        Dim YearCur As Integer = 0

        Dim myFont As New Font(FontName, 10, FontStyle.Regular, GraphicsUnit.Point)
        Dim myHeadFont As New Font(FontName, 14, FontStyle.Regular, GraphicsUnit.Point)
        Dim myHeadFont1 As New Font(FontName, 10, FontStyle.Bold, GraphicsUnit.Point)

        Dim myPen As New Pen(Color.Black)

        Dim MaxRowHeightWrap As Single = 0
        Try
            If Stateprinting Then

                If dbSet.Tables("Query").Rows.Count <= 0 Then
                    MessageBox.Show("ไม่มี ข้อมูลที่จะส่งออกเครื่องพิมพ์", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Information)
                    Exit Sub
                End If

                PageNumber += 1
                LinesInPage = e.MarginBounds.Height / myFont.GetHeight(e.Graphics)

                '----- Decrease line in page by header line count --------

                LinesInPage -= 3
                YPosition = TopMargin

                e.Graphics.DrawString("ตรวจสอบผลการศึกษา", myHeadFont, Brushes.Black, 300, YPosition)
                e.Graphics.DrawString("หน้า " & CStr(PageNumber), myFont, Brushes.Black, LeftMargin, YPosition)
                e.Graphics.DrawString("วันที่  " & CStr(Now.Date), myFont, Brushes.Black, 650, YPosition)

                CountLine += 2

                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                e.Graphics.DrawString("รหัสนักศึกษา  : " + Student_ID, myFont, Brushes.Black, LeftMargin, YPosition)

                CountLine += 1
                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                e.Graphics.DrawString("ชื่อ - นามสกุล  : " + thaiNM + "   " + ThaiSurNM, myFont, Brushes.Black, LeftMargin, YPosition)


                CountLine += 1
                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                e.Graphics.DrawString("หมายเหตุ : โปรดตรวจสอบผลการศึกษากับสำนักทะเบียนอีกครั้ง ", myFont, Brushes.Black, LeftMargin, YPosition)

                CountLine += 1
                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)

                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                Dim yp As Integer = YPosition + 10
                e.Graphics.DrawString("Subject", myFont, Brushes.Black, LeftMargin + 270, yp)
                e.Graphics.DrawString("Credit", myFont, Brushes.Black, LeftMargin + 570, yp)
                e.Graphics.DrawString("Grade", myFont, Brushes.Black, LeftMargin + 650, yp)

                CountLine += 2
                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)

                '----------- Column Header --------------

                '---------- Report Detail --------------

                While (CountLine < LinesInPage) And (dbCursor < dbSet.Tables("Query").Rows.Count)

                    strData1 = dbSet.Tables("Query").Rows(dbCursor).Item("Reg_YEAR")
                    strData2 = dbSet.Tables("Query").Rows(dbCursor).Item("Reg_TERM")
                    strData3 = dbSet.Tables("Query").Rows(dbCursor).Item("Subj_ID")
                    strData4 = dbSet.Tables("Query").Rows(dbCursor).Item("Reg_GRADE")
                    strData5 = dbSet.Tables("Query").Rows(dbCursor).Item("Subj_ENM")
                    strData6 = dbSet.Tables("Query").Rows(dbCursor).Item("Subj_CRETDIT")

                    SumList = SumList + strData6
                    If strData4 <> "None" Then
                        CreditAll += strData6
                        GrageAll += (strData6 * GradeNumber(strData4))
                        GPA += (strData6 * GradeNumber(strData4))
                        CreditGPA += strData6
                    End If

                    '**************************************************************
                    If TermCur <> strData2 Then

                        If TermCur <> 0 Then

                            Dim Gradetm As Double = (strData6 * GradeNumber(strData4))
                            Dim Credittm As Double = strData6
                            GrageAll -= Gradetm
                            CreditAll -= Credittm
                            GrageAll /= CreditAll

                            CountLine += 1
                            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))

                            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                            e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)
                            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                            e.Graphics.DrawString("GPS " + CStr(GrageAll.ToString("##0.00")) + "   " + CStr(CreditAll) + "  Credits  ", myFont, Brushes.Black, LeftMargin + 580, YPosition + 10)
                            CountLine += 2
                            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                            e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)

                            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                            e.Graphics.DrawString(CStr(strData2) + "st Semester  " + CStr(strData1), myFont, Brushes.Black, LeftMargin, YPosition + 10)
                            CountLine += 2
                            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                            e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)

                            CreditAll = Credittm
                            GrageAll = Gradetm

                        Else
                            e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)

                            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                            e.Graphics.DrawString(CStr(strData2) + "st Semester  " + CStr(strData1), myFont, Brushes.Black, LeftMargin, YPosition + 10)

                            CountLine += 2
                            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                            e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)
                        End If

                        TermCur = CInt(strData2)
                    End If
                    '**************************************************************
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))

                    e.Graphics.DrawString(strData3, myFont, Brushes.Black, LeftMargin, YPosition)
                    e.Graphics.DrawString(strData5, myFont, Brushes.Black, LeftMargin + 120, YPosition)
                    e.Graphics.DrawString(strData6, myFont, Brushes.Black, LeftMargin + 580, YPosition)
                    e.Graphics.DrawString(strData4, myFont, Brushes.Black, LeftMargin + 660, YPosition)


                    CountLine += LineHeight + SkipLinePerRecord + MaxRowHeightWrap
                    dbCursor += 1

                End While
                CountLine -= 1

                If dbCursor = dbSet.Tables("Query").Rows.Count Then '----------End of Data and Has Sum

                    CountLine += 2
                    GrageAll /= CreditAll
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawString("GPS " + CStr(GrageAll.ToString("##0.00")) + "   " + CStr(CreditAll) + "  Credits  ", myFont, Brushes.Black, LeftMargin + 580, YPosition + 10)

                    CountLine += 2
                    GPA /= CreditGPA
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)
                    e.Graphics.DrawString("GPA  " + CStr(GPA.ToString("##0.00")) + "   total Attended Credit  " + CStr(SumList) + "  Credits", myFont, Brushes.Black, LeftMargin + 433, YPosition + 5)

                    CountLine += 1
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))

                    CountLine += 1
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)
                    e.Graphics.DrawLine(myPen, LeftMargin, 5 + YPosition, 770, 5 + YPosition)

                    PageNumber = 0
                    dbCursor = 0
                    GrageAll = 0.0
                    CreditAll = 0.0
                    GPA = 0.0
                    CreditGPA = 0.0
                    e.HasMorePages = False
                Else
                    e.HasMorePages = True
                End If
            Else
                If TempMoney < 0 Then
                    MoneyThaif = TempMoney * (-1)
                Else
                    MoneyThaif = TempMoney
                End If
                If dbSet.Tables("Query").Rows.Count <= 0 Then
                    MessageBox.Show("ไม่มี ข้อมูลที่จะส่งออกเครื่องพิมพ์", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Information)
                    Exit Sub
                End If

                PageNumber += 1
                LinesInPage = e.MarginBounds.Height / myFont.GetHeight(e.Graphics)

                '----- Decrease line in page by header line count --------

                LinesInPage -= 3
                YPosition = TopMargin

                e.Graphics.DrawString("สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง", myHeadFont, Brushes.Black, 200, YPosition)
                e.Graphics.DrawString("วันที่  " & CStr(Now.Date), myFont, Brushes.Black, 670, YPosition)
                CountLine += 2
                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                e.Graphics.DrawString("ใบแจ้งชำระเงินค่าลงทะเบียนเรียนนักศึกษาระดับปริญญาตรี", myFont, Brushes.Black, 50, YPosition)
                CountLine += 1
                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                e.Graphics.DrawString("ธนาคารไทยพาณิชย์ จำกัด (มหาชน)", myHeadFont1, Brushes.Black, 50, YPosition)

                CountLine += 3
                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                e.Graphics.DrawString("ชื่อบัญชี  สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง                            สาขา   ย่อยเทคโนโลยีฯเจ้าคุณทหาร", myFont, Brushes.Black, 50, YPosition)
                CountLine += 1
                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                e.Graphics.DrawString("บัญชีเลขที่   0 8 8 - 3 - 0 0 3 0 0 - 7  (TR CODE 3650)                   วันที่ ....../...../......", myFont, Brushes.Black, 50, YPosition)
                CountLine += 1
                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                e.Graphics.DrawString("ชื่อ-สกุล(ภาษาไทย)  " + thaiNM + "   " + ThaiSurNM + "                                           รหัสนักศึกษา     " + Student_ID, myFont, Brushes.Black, 50, YPosition)
                CountLine += 1
                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                e.Graphics.DrawString("ชื่อ-สกุล(ภาษาอังกฤษ)  " + EthaiNM + "   " + EThaiSurNM, myFont, Brushes.Black, 50, YPosition)

                CountLine += 2
                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)

                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                Dim yp As Integer = YPosition + 10
                e.Graphics.DrawString("วิชา", myFont, Brushes.Black, LeftMargin + 250, yp)
                e.Graphics.DrawString("sec", myFont, Brushes.Black, LeftMargin + 500, yp)
                e.Graphics.DrawString("หน่วยกิต", myFont, Brushes.Black, LeftMargin + 570, yp)
                e.Graphics.DrawString("สถานะ", myFont, Brushes.Black, LeftMargin + 650, yp)

                CountLine += 2
                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)

                '----------- Column Header --------------

                '---------- Report Detail --------------

                While (CountLine < LinesInPage) And (dbCursor < dbSet.Tables("Query").Rows.Count)

                    strData1 = dbSet.Tables("Query").Rows(dbCursor).Item("SubjectID")
                    strData2 = dbSet.Tables("Query").Rows(dbCursor).Item("SubjectName")
                    strData3 = dbSet.Tables("Query").Rows(dbCursor).Item("subjectCredit")
                    strData4 = dbSet.Tables("Query").Rows(dbCursor).Item("subjectSec")
                    strData5 = dbSet.Tables("Query").Rows(dbCursor).Item("State")

                    '**************************************************************
                    Dim Status As String
                    Select Case strData5
                        Case "1"
                            Status = "วิชาเดิม"
                        Case "2"
                            Status = "เพิ่ม"
                        Case "3"
                            Status = "ถอน"
                        Case "4"
                            Status = "วิชาเปลี่ยน"
                    End Select
                    '**************************************************************

                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawString(strData1, myFont, Brushes.Black, LeftMargin, YPosition)
                    e.Graphics.DrawString(strData2, myFont, Brushes.Black, LeftMargin + 80, YPosition)
                    e.Graphics.DrawString(strData4, myFont, Brushes.Black, LeftMargin + 500, YPosition)
                    e.Graphics.DrawString(strData3, myFont, Brushes.Black, LeftMargin + 570, YPosition)
                    e.Graphics.DrawString(Status, myFont, Brushes.Black, LeftMargin + 650, YPosition)


                    CountLine += LineHeight + SkipLinePerRecord + MaxRowHeightWrap
                    dbCursor += 1

                End While
                CountLine -= 1

                If dbCursor = dbSet.Tables("Query").Rows.Count Then '----------End of Data and Has Sum

                    CountLine += 2

                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)
                    CountLine += 3
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    If TempMoney < 0 Then
                        TempMoney *= -1
                        e.Graphics.DrawString("ยอดเงินค่าลงทะเบียนที่ต้องได้คืน    " + CStr(TempMoney.ToString("##0.00")) + "  บาท", myFont, Brushes.Black, LeftMargin + 400, YPosition)
                        TempMoney *= -1
                    Else
                        e.Graphics.DrawString("ยอดเงินค่าลงทะเบียนที่ต้องชำระ    " + CStr(TempMoney.ToString("##0.00")) + "  บาท", myFont, Brushes.Black, LeftMargin + 400, YPosition)
                    End If

                    CountLine += 2
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawString("ยอดเงินค่าลงทะเบียนที่ชำระเป็นตัวอักษร   " + MoneyThai(MoneyThaif), myFont, Brushes.Black, LeftMargin + 200, YPosition)

                    CountLine += 2
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawString("ผู้นำฝาก.....................................โทร.........................", myFont, Brushes.Black, LeftMargin + 100, YPosition)
                    e.Graphics.DrawString("ผู้รับเงิน.........................(เจ้าหน้าที่ธนาคาร)", myFont, Brushes.Black, LeftMargin + 460, YPosition)

                    CountLine += 2
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawString("[  ส่วนของธนาคาร   ]", myHeadFont1, Brushes.Black, LeftMargin + 600, YPosition)

                    PageNumber = 0
                    dbCursor = 0

                    CountLine += 2
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)

                    '***************************************************************************************** แผ่น 2
                    CountLine += 2
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawString("สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง", myHeadFont, Brushes.Black, 200, YPosition)
                    e.Graphics.DrawString("วันที่  " & CStr(Now.Date), myFont, Brushes.Black, 670, YPosition)
                    CountLine += 2
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawString("ใบแจ้งชำระเงินค่าลงทะเบียนเรียนนักศึกษาระดับปริญญาตรี", myFont, Brushes.Black, 50, YPosition)
                    CountLine += 1
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawString("ธนาคารไทยพาณิชย์ จำกัด (มหาชน)", myHeadFont1, Brushes.Black, 50, YPosition)

                    CountLine += 3
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawString("ชื่อบัญชี  สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง                            สาขา   ย่อยเทคโนโลยีฯเจ้าคุณทหาร", myFont, Brushes.Black, 50, YPosition)
                    CountLine += 1
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawString("บัญชีเลขที่   0 8 8 - 3 - 0 0 3 0 0 - 7  (TR CODE 3650)                   วันที่ ....../...../......", myFont, Brushes.Black, 50, YPosition)
                    CountLine += 1
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawString("ชื่อ-สกุล(ภาษาไทย)  " + thaiNM + "   " + ThaiSurNM + "                                           รหัสนักศึกษา     " + Student_ID, myFont, Brushes.Black, 50, YPosition)
                    CountLine += 1
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawString("ชื่อ-สกุล(ภาษาอังกฤษ)  " + EthaiNM + "   " + EThaiSurNM, myFont, Brushes.Black, 50, YPosition)

                    CountLine += 2
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)

                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    yp = YPosition + 10
                    e.Graphics.DrawString("วิชา", myFont, Brushes.Black, LeftMargin + 250, yp)
                    e.Graphics.DrawString("sec", myFont, Brushes.Black, LeftMargin + 500, yp)
                    e.Graphics.DrawString("หน่วยกิต", myFont, Brushes.Black, LeftMargin + 570, yp)
                    e.Graphics.DrawString("สถานะ", myFont, Brushes.Black, LeftMargin + 650, yp)

                    CountLine += 2
                    YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                    e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)

                    '----------- Column Header --------------

                    '---------- Report Detail --------------

                    While (CountLine < LinesInPage) And (dbCursor < dbSet.Tables("Query").Rows.Count)

                        strData1 = dbSet.Tables("Query").Rows(dbCursor).Item("SubjectID")
                        strData2 = dbSet.Tables("Query").Rows(dbCursor).Item("SubjectName")
                        strData3 = dbSet.Tables("Query").Rows(dbCursor).Item("subjectCredit")
                        strData4 = dbSet.Tables("Query").Rows(dbCursor).Item("subjectSec")
                        strData5 = dbSet.Tables("Query").Rows(dbCursor).Item("State")

                        '**************************************************************
                        Dim Status As String
                        Select Case strData5
                            Case "1"
                                Status = "วิชาเดิม"
                            Case "2"
                                Status = "เพิ่ม"
                            Case "3"
                                Status = "ถอน"
                            Case "4"
                                Status = "วิชาเปลี่ยน"
                        End Select
                        '**************************************************************

                        YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                        e.Graphics.DrawString(strData1, myFont, Brushes.Black, LeftMargin, YPosition)
                        e.Graphics.DrawString(strData2, myFont, Brushes.Black, LeftMargin + 80, YPosition)
                        e.Graphics.DrawString(strData4, myFont, Brushes.Black, LeftMargin + 500, YPosition)
                        e.Graphics.DrawString(strData3, myFont, Brushes.Black, LeftMargin + 570, YPosition)
                        e.Graphics.DrawString(Status, myFont, Brushes.Black, LeftMargin + 650, YPosition)


                        CountLine += LineHeight + SkipLinePerRecord + MaxRowHeightWrap
                        dbCursor += 1

                    End While
                    CountLine -= 1

                    If dbCursor = dbSet.Tables("Query").Rows.Count Then '----------End of Data and Has Sum

                        CountLine += 2

                        YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                        e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)
                        CountLine += 3
                        YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                        If TempMoney < 0 Then
                            TempMoney *= -1
                            e.Graphics.DrawString("ยอดเงินค่าลงทะเบียนที่ต้องได้คืน    " + CStr(TempMoney.ToString("##0.00")) + "  บาท", myFont, Brushes.Black, LeftMargin + 400, YPosition)
                        Else
                            e.Graphics.DrawString("ยอดเงินค่าลงทะเบียนที่ต้องชำระ    " + CStr(TempMoney.ToString("##0.00")) + "  บาท", myFont, Brushes.Black, LeftMargin + 400, YPosition)
                        End If

                        CountLine += 2
                        YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                        e.Graphics.DrawString("ยอดเงินค่าลงทะเบียนที่ชำระเป็นตัวอักษร   " + MoneyThai(MoneyThaif), myFont, Brushes.Black, LeftMargin + 200, YPosition)

                        CountLine += 2
                        YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                        e.Graphics.DrawString("ผู้นำฝาก.....................................โทร.........................", myFont, Brushes.Black, LeftMargin + 100, YPosition)
                        e.Graphics.DrawString("ผู้รับเงิน.........................(เจ้าหน้าที่ธนาคาร)", myFont, Brushes.Black, LeftMargin + 460, YPosition)

                        CountLine += 2
                        YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                        e.Graphics.DrawString("[  ส่วนของนักศึกษา   ]", myHeadFont1, Brushes.Black, LeftMargin + 600, YPosition)

                        PageNumber = 0
                        dbCursor = 0
                        'MoneyChangSubject = 0.0
                    End If
                    '*****************************************************************************************

                    e.HasMorePages = False
                Else
                    e.HasMorePages = True
                End If
            End If

        Catch ex As Exception
            MessageBox.Show("มีปัญหาในการ พิมพ์ : " & Err.Description)
        End Try
    End Sub
    Private Function MoneyThai(ByVal data As String) As String
        Dim tempm As String = ""
        Dim ThaiLen As String = data.Length
        Dim mthai As String = ""
        Dim i As Integer = 0
        Dim statem As Integer
        If ThaiLen = 1 Then
            If data.Chars(0) = "0" Then
                Return "ศูนย์บาทถ้วน"
            End If
            mthai = NumThai(data.Chars(0), True)
            mthai += "บาทถ้วน"
            Return mthai
        End If
        While i < (ThaiLen - 1)
            statem = (ThaiLen - i - 1)
            If data.Chars(i) <> "0" Then
                If statem = 1 And data.Chars(i) = "2" Then
                    mthai += NumThai("2", False)
                    mthai += StatusNum(statem)
                    Return mthai + "บาทถ้วน"
                End If
                mthai += NumThai(data.Chars(i), True)
                mthai += StatusNum(statem)
            End If
            i += 1
        End While
        Return mthai + "บาทถ้วน"
    End Function
    Private Function NumThai(ByVal data As String, ByVal State As Boolean) As String
        Select Case data
            Case 1
                Return "หนึ่ง"
            Case 2
                If State Then
                    Return "สอง"
                Else
                    Return "ยี่"
                End If
            Case 3
                Return "สาม"
            Case 4
                Return "สี่"
            Case 5
                Return "ห้า"
            Case 6
                Return "หก"
            Case 7
                Return "เจ็ด"
            Case 8
                Return "แปด"
            Case 9
                Return "เก้า"
        End Select
    End Function
    Private Function StatusNum(ByVal data As Integer) As String
        Select Case data
            Case 1
                Return "สิบ"
            Case 2
                Return "ร้อย"
            Case 3
                Return "พัน"
            Case 4
                Return "หมื่น"
            Case 5
                Return "แสน"
            Case 6
                Return "ล้าน"
        End Select
    End Function
    Private Function GradeNumber(ByVal ChGrade As String) As Double

        Select Case ChGrade.ToUpper
            Case "F"
                Return 0
            Case "D"
                Return 1
            Case "D+"
                Return 1.5
            Case "C"
                Return 2
            Case "C+"
                Return 2.5
            Case "B"
                Return 3
            Case "B+"
                Return 3.5
            Case "A"
                Return 4
        End Select
    End Function

    Public Overridable Sub InitPrint()
        ClearPage()
        prnDoc.DefaultPageSettings.Margins.Left = 50
        prnDoc.DefaultPageSettings.Margins.Top = 50
        prnDoc.DefaultPageSettings.Margins.Right = 50
        prnDoc.DefaultPageSettings.Margins.Bottom = 50
    End Sub

    Public Overridable Sub PrintPreview()
        printdlg.WindowState = Windows.Forms.FormWindowState.Maximized
        With Conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = strConn
            .Open()
        End With
        If SqlSet = "" Then
            MessageBox.Show("ไม่มีข้อมูลที่ต้องการค้น ", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Stop)
            Me.Close()
        Else
            da = New SqlDataAdapter(SqlSet, Conn)
            dbSet.Tables.Clear()
            da.Fill(dbSet, "Query")
            If dbSet.Tables("Query").Rows.Count = 0 Then
                MessageBox.Show("ไม่มีข้อมูลที่ต้องการค้น ", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Stop)
                Me.Close()
            End If
        End If
        printdlg.ShowDialog()
    End Sub

    Public Overridable Sub btnClose_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClose.Click
        Close()
    End Sub

    Public Overridable Sub btnPrnDlg_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPrnDlg.Click
        prnSetDlg.ShowDialog()
    End Sub

    Public Overridable Sub btnDocSet_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnDocSet.Click
        PageSetDlg.ShowDialog()
    End Sub

    Public Sub ClearPage()
        PageNumber = 0
        dbCursor = 0L
        SumList = 0
    End Sub

    Private Sub frmPrintDynamicForm_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub
End Class
