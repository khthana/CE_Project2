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
        Me.btnDocSet = New System.Windows.Forms.Button
        Me.btnPrint = New System.Windows.Forms.Button
        Me.btnClose = New System.Windows.Forms.Button
        Me.btnPrnDlg = New System.Windows.Forms.Button
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
        Me.printdlg.Location = New System.Drawing.Point(22, 22)
        Me.printdlg.MinimumSize = New System.Drawing.Size(375, 250)
        Me.printdlg.Name = "printdlg"
        Me.printdlg.TransparencyKey = System.Drawing.Color.Empty
        Me.printdlg.Visible = False
        '
        'Panel1
        '
        Me.Panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Panel1.Controls.Add(Me.btnDocSet)
        Me.Panel1.Controls.Add(Me.btnPrint)
        Me.Panel1.Controls.Add(Me.btnClose)
        Me.Panel1.Controls.Add(Me.btnPrnDlg)
        Me.Panel1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.Panel1.Location = New System.Drawing.Point(0, 137)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(504, 40)
        Me.Panel1.TabIndex = 14
        '
        'btnDocSet
        '
        Me.btnDocSet.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.btnDocSet.Image = CType(resources.GetObject("btnDocSet.Image"), System.Drawing.Image)
        Me.btnDocSet.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnDocSet.Location = New System.Drawing.Point(136, 8)
        Me.btnDocSet.Name = "btnDocSet"
        Me.btnDocSet.Size = New System.Drawing.Size(116, 24)
        Me.btnDocSet.TabIndex = 12
        Me.btnDocSet.Text = "Page Setup"
        Me.btnDocSet.TextAlign = System.Drawing.ContentAlignment.MiddleRight
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
        'btnPrnDlg
        '
        Me.btnPrnDlg.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.btnPrnDlg.Image = CType(resources.GetObject("btnPrnDlg.Image"), System.Drawing.Image)
        Me.btnPrnDlg.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft
        Me.btnPrnDlg.Location = New System.Drawing.Point(8, 8)
        Me.btnPrnDlg.Name = "btnPrnDlg"
        Me.btnPrnDlg.Size = New System.Drawing.Size(116, 24)
        Me.btnPrnDlg.TabIndex = 11
        Me.btnPrnDlg.Text = "Printer Setup"
        Me.btnPrnDlg.TextAlign = System.Drawing.ContentAlignment.MiddleRight
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
    Public WrapTextFlag As Boolean = False
    '------------------ Have Summary?
    Dim Conn As SqlConnection = New SqlConnection
    Dim da As SqlDataAdapter
    Public SqlSet As String = ""
    Private dbSet As DataSet = New DataSet
    Dim dt As DataTable

    '------ Internal Use Counter and Flag 
    Private PageNumber As Integer = 0
    Private dbCursor As Long = 0L
    Private SumList As Double

    Dim strData1 As String = ""
    Dim strData2 As String = ""
    Dim strData3 As String = ""
    Dim strData4 As String = ""
    Dim strData5 As String = ""



    Function getPositionWidth(ByVal p_width As Single, ByVal p_position As Single) As Single
        Return p_width * p_position / 100
    End Function


    Private Sub prnDoc_PrintPage(ByVal sender As System.Object, ByVal e As System.Drawing.Printing.PrintPageEventArgs) Handles prnDoc.PrintPage

        Dim LeftMargin As Integer = 50
        Dim TopMargin As Integer = 50
        Dim LinesInPage As Integer = 0

        Dim YPosition As Integer = 0
        Dim CountLine As Integer = 0
        Dim CurrentLine As String

        Dim sizeR As New System.Drawing.SizeF
        Dim ColumnWidthWrap As Single = 0
        Dim RowSizeWrap As New System.Drawing.SizeF
        Dim RowHeightWrap As Single = 0
        Dim MaxRowHeightWrap As Single = 0

        Dim myFont As New Font(FontName, 10, FontStyle.Regular, GraphicsUnit.Point)
        Dim myHeadFont As New Font(FontName, 14, FontStyle.Regular, GraphicsUnit.Point)

        Dim myPen As New Pen(Color.Black)

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

            e.Graphics.DrawString("การค้นข้อมูล รายการบัตรเติมเงิน", myHeadFont, Brushes.Black, 300, YPosition)
            e.Graphics.DrawString("หน้า " & CStr(PageNumber), myFont, Brushes.Black, LeftMargin, YPosition)
            e.Graphics.DrawString("วันที่  " & CStr(Now.Date), myFont, Brushes.Black, 650, YPosition)


            CountLine += 2

            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
            e.Graphics.DrawString("ข้อมูลที่ต้องการค้น  : " + SrData, myFont, Brushes.Black, LeftMargin, YPosition)

            CountLine += 1
            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
            If SrData = "" Then
                e.Graphics.DrawString("ประเภทข้อมูลที่ทำการค้น  : ", myFont, Brushes.Black, LeftMargin, YPosition)
            Else
                e.Graphics.DrawString("ประเภทข้อมูลที่ทำการค้น  : " + SrTypeData, myFont, Brushes.Black, LeftMargin, YPosition)
            End If

            CountLine += 1
            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
            e.Graphics.DrawString(Stdate, myFont, Brushes.Black, LeftMargin, YPosition)

            CountLine += 1
            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
            e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)

            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
            Dim yp As Integer = YPosition + 10
            e.Graphics.DrawString("รหัสนักศึกษา", myFont, Brushes.Black, LeftMargin, yp)
            e.Graphics.DrawString("ชื่อนักศึกษา", myFont, Brushes.Black, LeftMargin + 150, yp)
            e.Graphics.DrawString("นามสกุล", myFont, Brushes.Black, LeftMargin + 300, yp)
            e.Graphics.DrawString("จำนวนเงิน", myFont, Brushes.Black, LeftMargin + 500, yp)
            e.Graphics.DrawString("วันที่เติม (ว/ด/ป)", myFont, Brushes.Black, LeftMargin + 600, yp)

            CountLine += 2
            YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
            e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)

            '----------- Column Header -------------

            '---------- Report Detail --------------

            While (CountLine < LinesInPage) And (dbCursor < dbSet.Tables("Query").Rows.Count)

                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))

                strData1 = dbSet.Tables("Query").Rows(dbCursor).Item("Std_ID")
                strData2 = dbSet.Tables("Query").Rows(dbCursor).Item("Name")
                strData3 = dbSet.Tables("Query").Rows(dbCursor).Item("SurName")
                strData4 = dbSet.Tables("Query").Rows(dbCursor).Item("Money")
                strData5 = dbSet.Tables("Query").Rows(dbCursor).Item("DateCurrent")

                SumList = SumList + strData4

                e.Graphics.DrawString(strData1, myFont, Brushes.Black, LeftMargin, YPosition)
                e.Graphics.DrawString(strData2, myFont, Brushes.Black, LeftMargin + 150, YPosition)
                e.Graphics.DrawString(strData3, myFont, Brushes.Black, LeftMargin + 300, YPosition)
                e.Graphics.DrawString(strData4, myFont, Brushes.Black, LeftMargin + 500, YPosition)
                e.Graphics.DrawString(strData5, myFont, Brushes.Black, LeftMargin + 600, YPosition)

                CountLine += LineHeight + SkipLinePerRecord + MaxRowHeightWrap
                dbCursor += 1

            End While
            CountLine -= 1

            If dbCursor = dbSet.Tables("Query").Rows.Count Then '----------End of Data and Has Sum
                CountLine += 1

                CountLine += 1
                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)

                e.Graphics.DrawString("รวมเป็นเงินทั้งสิ้น ", myFont, Brushes.Black, LeftMargin + 300, YPosition + 5)
                e.Graphics.DrawString(CStr(SumList), myFont, Brushes.Black, LeftMargin + 500, YPosition + 5)

                CountLine += 1
                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))

                CountLine += 1
                YPosition = TopMargin + (CountLine * myFont.GetHeight(e.Graphics))
                e.Graphics.DrawLine(myPen, LeftMargin, YPosition, 770, YPosition)
                e.Graphics.DrawLine(myPen, LeftMargin, 5 + YPosition, 770, 5 + YPosition)

                PageNumber = 0
                dbCursor = 0
                SumList = 0.0
                e.HasMorePages = False
            Else
                e.HasMorePages = True
            End If

        Catch ex As Exception
            MessageBox.Show("มีปัญหาในการ พิมพ์ : " & Err.Description)
        End Try
    End Sub

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
