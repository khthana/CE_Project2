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
    Dim strConn As String = "server =(local);initial catalog=SmartFood;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
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
    Private strData7 As String = ""


    Function getPositionWidth(ByVal p_width As Single, ByVal p_position As Single) As Single
        Return p_width * p_position / 100
    End Function


    Private Sub prnDoc_PrintPage(ByVal sender As System.Object, ByVal e As System.Drawing.Printing.PrintPageEventArgs) Handles prnDoc.PrintPage

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

            If dbSet.Tables("Query").Rows.Count <= 0 Then
                MessageBox.Show("ไม่มี ข้อมูลที่จะส่งออกเครื่องพิมพ์", "คำเตือน", MessageBoxButtons.OK, MessageBoxIcon.Information)
                Exit Sub
            End If

            PageNumber += 1
            LinesInPage = e.MarginBounds.Height / myFont.GetHeight(e.Graphics)

            '----- Decrease line in page by header line count --------

            LinesInPage -= 3
            YPosition = TopMargin

            e.Graphics.DrawString("ผลการตรวจสุขภาพ", myHeadFont, Brushes.Black, 300, YPosition)
            'e.Graphics.DrawString("หน้า " & CStr(PageNumber), myFont, Brushes.Black, LeftMargin, YPosition)
            e.Graphics.DrawString("วันที่  " & CStr(Now.Date), myFont, Brushes.Black, 650, YPosition)

            CountLine += 2

            strData1 = dbSet.Tables("Query").Rows(dbCursor).Item("DAYS")
            strData2 = dbSet.Tables("Query").Rows(dbCursor).Item("AGES")
            strData3 = dbSet.Tables("Query").Rows(dbCursor).Item("BODYS")
            strData4 = dbSet.Tables("Query").Rows(dbCursor).Item("HID")
            strData5 = dbSet.Tables("Query").Rows(dbCursor).Item("TRADE")
            strData6 = dbSet.Tables("Query").Rows(dbCursor).Item("HOSPITAL")
            strData7 = dbSet.Tables("Query").Rows(dbCursor).Item("STATUS")

            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
            e.Graphics.DrawString("รหัสนักศึกษา  : " + Student_ID, myFont, Brushes.Black, LeftMargin, YPosition)

            CountLine += 1
            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
            e.Graphics.DrawString("ชื่อ - นามสกุล  : " + EthaiNM + "   " + EThaiSurNM, myFont, Brushes.Black, LeftMargin, YPosition)

            CountLine += 3
            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
            e.Graphics.DrawString("รหัสผู้ป่วย : " + strData4, myFont, Brushes.Black, LeftMargin, YPosition)
            e.Graphics.DrawString("สถานที่ : " + strData6, myFont, Brushes.Black, LeftMargin + 200, YPosition)

            CountLine += 2

           
            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
            e.Graphics.DrawRectangle(myPen, LeftMargin, YPosition, 600, YPosition + 50)
            e.Graphics.DrawLine(myPen, 200, YPosition, 200, YPosition + 225)
            CountLine += 1
            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
            e.Graphics.DrawString("วันที่มาทำการตรวจ ", myFont, Brushes.Black, 70, YPosition - 12)
            e.Graphics.DrawString("อาการที่ตรวจพบ ", myFont, Brushes.Black, LeftMargin + 340, YPosition - 12)
            e.Graphics.DrawLine(myPen, LeftMargin, YPosition + 5, 650, YPosition + 5)

            CountLine += 1
            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
            e.Graphics.DrawString(strData1, myFont, Brushes.Black, 70, YPosition)
            e.Graphics.DrawString(strData3, myFont, Brushes.Black, LeftMargin + 170, YPosition)

            CountLine += 13
            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
            e.Graphics.DrawString("(...................) ", myFont, Brushes.Black, 580, YPosition)
            CountLine += 1
            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
            e.Graphics.DrawString("นายแพทย์", myFont, Brushes.Black, 590, YPosition)

            PageNumber = 0
            dbCursor = 0
            e.HasMorePages = False

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
