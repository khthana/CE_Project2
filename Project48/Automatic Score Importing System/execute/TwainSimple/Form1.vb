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
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents Button2 As System.Windows.Forms.Button
    Friend WithEvents PictureBox1 As System.Windows.Forms.PictureBox
    Friend WithEvents VSTwain1 As VintaSoft.Twain.VSTwain
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox2 As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Button3 As System.Windows.Forms.Button
    Friend WithEvents ListBox2 As System.Windows.Forms.ListBox
    Friend WithEvents ListBox3 As System.Windows.Forms.ListBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents ProgressBar1 As System.Windows.Forms.ProgressBar
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Button4 As System.Windows.Forms.Button
    Friend WithEvents CheckBox1 As System.Windows.Forms.CheckBox
    Friend WithEvents OpenFileDialog1 As System.Windows.Forms.OpenFileDialog
    Friend WithEvents Label7 As System.Windows.Forms.Label
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.Button1 = New System.Windows.Forms.Button
        Me.Button2 = New System.Windows.Forms.Button
        Me.PictureBox1 = New System.Windows.Forms.PictureBox
        Me.VSTwain1 = New VintaSoft.Twain.VSTwain
        Me.TextBox1 = New System.Windows.Forms.TextBox
        Me.TextBox2 = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Button3 = New System.Windows.Forms.Button
        Me.ListBox2 = New System.Windows.Forms.ListBox
        Me.ListBox3 = New System.Windows.Forms.ListBox
        Me.Label4 = New System.Windows.Forms.Label
        Me.Label5 = New System.Windows.Forms.Label
        Me.ProgressBar1 = New System.Windows.Forms.ProgressBar
        Me.Label6 = New System.Windows.Forms.Label
        Me.Button4 = New System.Windows.Forms.Button
        Me.CheckBox1 = New System.Windows.Forms.CheckBox
        Me.OpenFileDialog1 = New System.Windows.Forms.OpenFileDialog
        Me.Label7 = New System.Windows.Forms.Label
        Me.SuspendLayout()
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(8, 8)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(184, 32)
        Me.Button1.TabIndex = 1
        Me.Button1.Text = "Get an Image with Device Dialog"
        '
        'Button2
        '
        Me.Button2.Location = New System.Drawing.Point(200, 8)
        Me.Button2.Name = "Button2"
        Me.Button2.Size = New System.Drawing.Size(200, 32)
        Me.Button2.TabIndex = 3
        Me.Button2.Text = "Get an Image without Device Dialog"
        '
        'PictureBox1
        '
        Me.PictureBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.PictureBox1.Location = New System.Drawing.Point(8, 48)
        Me.PictureBox1.Name = "PictureBox1"
        Me.PictureBox1.Size = New System.Drawing.Size(392, 296)
        Me.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage
        Me.PictureBox1.TabIndex = 4
        Me.PictureBox1.TabStop = False
        '
        'VSTwain1
        '
        Me.VSTwain1.appProductName = "VintaSoftTwain"
        Me.VSTwain1.autoBright = False
        Me.VSTwain1.autoCleanBuffer = True
        Me.VSTwain1.autoFeed = False
        Me.VSTwain1.brightness = 0.0!
        Me.VSTwain1.cancelTransfer = False
        Me.VSTwain1.capability = -1
        Me.VSTwain1.capItems = Nothing
        Me.VSTwain1.capMaxValue = 0.0!
        Me.VSTwain1.capMinValue = 0.0!
        Me.VSTwain1.capNumItems = 0
        Me.VSTwain1.capStringValue = ""
        Me.VSTwain1.capType = VintaSoft.Twain.CapType.OneValue
        Me.VSTwain1.capValue = 0.0!
        Me.VSTwain1.contrast = 0.0!
        Me.VSTwain1.disableAfterAcquire = False
        Me.VSTwain1.disableScanAfterBlackImage = True
        Me.VSTwain1.duplexEnabled = False
        Me.VSTwain1.feederEnabled = False
        Me.VSTwain1.ftpCancel = False
        Me.VSTwain1.httpCancel = False
        Me.VSTwain1.jpegQuality = 90
        Me.VSTwain1.maxImages = 1
        Me.VSTwain1.modalUI = False
        Me.VSTwain1.noiseLevelInBlankImage = 0.01!
        Me.VSTwain1.pageSize = VintaSoft.Twain.PageSize.None
        Me.VSTwain1.parent = Me
        Me.VSTwain1.pixelFlavor = -1
        Me.VSTwain1.pixelType = VintaSoft.Twain.PixelType.BW
        Me.VSTwain1.resolution = 0
        Me.VSTwain1.rotation = 0
        Me.VSTwain1.showUI = True
        Me.VSTwain1.sourceIndex = -1
        Me.VSTwain1.tiffCompression = VintaSoft.Twain.TiffCompression.Auto
        Me.VSTwain1.tiffMultiPage = True
        Me.VSTwain1.transferMode = VintaSoft.Twain.TransferMode.Memory
        Me.VSTwain1.unitOfMeasure = VintaSoft.Twain.UnitOfMeasure.Inches
        Me.VSTwain1.xferCount = 0
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(504, 80)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(32, 20)
        Me.TextBox1.TabIndex = 5
        Me.TextBox1.Text = ""
        '
        'TextBox2
        '
        Me.TextBox2.Location = New System.Drawing.Point(504, 48)
        Me.TextBox2.Name = "TextBox2"
        Me.TextBox2.Size = New System.Drawing.Size(96, 20)
        Me.TextBox2.TabIndex = 6
        Me.TextBox2.Text = ""
        '
        'Label1
        '
        Me.Label1.Location = New System.Drawing.Point(424, 48)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(64, 16)
        Me.Label1.TabIndex = 8
        Me.Label1.Text = "SubjectID"
        '
        'Label2
        '
        Me.Label2.Location = New System.Drawing.Point(424, 80)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(56, 16)
        Me.Label2.TabIndex = 9
        Me.Label2.Text = "Year"
        '
        'Button3
        '
        Me.Button3.Location = New System.Drawing.Point(536, 120)
        Me.Button3.Name = "Button3"
        Me.Button3.Size = New System.Drawing.Size(64, 24)
        Me.Button3.TabIndex = 11
        Me.Button3.Text = "Reset"
        '
        'ListBox2
        '
        Me.ListBox2.Location = New System.Drawing.Point(408, 176)
        Me.ListBox2.Name = "ListBox2"
        Me.ListBox2.Size = New System.Drawing.Size(120, 186)
        Me.ListBox2.TabIndex = 13
        '
        'ListBox3
        '
        Me.ListBox3.Location = New System.Drawing.Point(528, 176)
        Me.ListBox3.Name = "ListBox3"
        Me.ListBox3.Size = New System.Drawing.Size(88, 186)
        Me.ListBox3.TabIndex = 14
        '
        'Label4
        '
        Me.Label4.Location = New System.Drawing.Point(408, 152)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(56, 16)
        Me.Label4.TabIndex = 15
        Me.Label4.Text = "Wrong ID"
        '
        'Label5
        '
        Me.Label5.Location = New System.Drawing.Point(536, 152)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(72, 16)
        Me.Label5.TabIndex = 16
        Me.Label5.Text = "Wrong Grade"
        '
        'ProgressBar1
        '
        Me.ProgressBar1.Location = New System.Drawing.Point(120, 352)
        Me.ProgressBar1.Name = "ProgressBar1"
        Me.ProgressBar1.Size = New System.Drawing.Size(280, 16)
        Me.ProgressBar1.TabIndex = 30
        '
        'Label6
        '
        Me.Label6.Location = New System.Drawing.Point(8, 344)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(96, 32)
        Me.Label6.TabIndex = 31
        '
        'Button4
        '
        Me.Button4.Location = New System.Drawing.Point(528, 16)
        Me.Button4.Name = "Button4"
        Me.Button4.TabIndex = 32
        Me.Button4.Text = "Browse"
        '
        'CheckBox1
        '
        Me.CheckBox1.Location = New System.Drawing.Point(416, 16)
        Me.CheckBox1.Name = "CheckBox1"
        Me.CheckBox1.TabIndex = 33
        Me.CheckBox1.Text = "Subject"
        '
        'Label7
        '
        Me.Label7.Location = New System.Drawing.Point(416, 120)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(48, 23)
        Me.Label7.TabIndex = 34
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(624, 374)
        Me.Controls.Add(Me.Label7)
        Me.Controls.Add(Me.CheckBox1)
        Me.Controls.Add(Me.Button4)
        Me.Controls.Add(Me.Label6)
        Me.Controls.Add(Me.ProgressBar1)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.ListBox3)
        Me.Controls.Add(Me.ListBox2)
        Me.Controls.Add(Me.Button3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.TextBox2)
        Me.Controls.Add(Me.TextBox1)
        Me.Controls.Add(Me.PictureBox1)
        Me.Controls.Add(Me.Button2)
        Me.Controls.Add(Me.Button1)
        Me.Name = "Form1"
        Me.Text = "โปรแกรมนำเข้าข้อมูลคะแนนอัตโนมัติ"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim textsize, textsize2 As Boolean
        If TextBox1.Text = "" Then
            MessageBox.Show("Please insert year")
        End If
        If TextBox2.Text = "" Then
            MessageBox.Show("Please insert subjectID")
        End If
        If CheckBox1.Checked = True Then
            MessageBox.Show("You selected subject")
        End If
        If TextBox2.TextLength <> 8 And TextBox2.TextLength <> 0 Then
            MessageBox.Show("please fill SubjectID in 8 characters")
            textsize = False
        Else : textsize = True
        End If
        If TextBox1.TextLength <> 2 And TextBox1.TextLength <> 0 Then
            MessageBox.Show("please fill Year in 2 characters")
            textsize2 = False
        Else : textsize2 = True
        End If
        If TextBox1.TextLength = 2 And TextBox2.TextLength = 8 And textsize = True And textsize2 = True And CheckBox1.Checked = False Then
            If VSTwain1.StartDevice() Then
                If VSTwain1.SelectSource() Then
                    VSTwain1.showUI = True
                    VSTwain1.Acquire()
                End If
            End If
        End If
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim textsize, textsize2 As Boolean
        If TextBox1.Text = "" Then
            MessageBox.Show("Please insert year")
        End If
        If TextBox2.Text = "" Then
            MessageBox.Show("Please insert subjectID")
        End If
        If CheckBox1.Checked = True Then
            MessageBox.Show("You selected subject")
        End If
        If TextBox2.TextLength <> 8 And TextBox2.TextLength <> 0 Then
            MessageBox.Show("please fill SubjectID in 8 characters")
            textsize = False
        Else : textsize = True
        End If
        If TextBox1.TextLength <> 2 And TextBox1.TextLength <> 0 Then
            MessageBox.Show("please fill Year in 2 characters")
            textsize2 = False
        Else : textsize2 = True
        End If
        If TextBox1.TextLength = 2 And TextBox2.TextLength = 8 And textsize = True And textsize2 = True And CheckBox1.Checked = False Then
            If VSTwain1.StartDevice() Then
                If VSTwain1.SelectSource() Then
                    VSTwain1.showUI = False
                    VSTwain1.disableAfterAcquire = True
                    VSTwain1.OpenDataSource()
                    VSTwain1.unitOfMeasure = VintaSoft.Twain.UnitOfMeasure.Inches
                    VSTwain1.pixelType = VintaSoft.Twain.PixelType.BW
                    VSTwain1.resolution = 300           ' 200 dpi
                    VSTwain1.brightness = VSTwain1.brightnessMaxValue
                    VSTwain1.contrast = 0
                    'VSTwain1.SetImageLayout(1, 1, 5, 5) ' image size in inches
                    VSTwain1.Acquire()
                End If
            End If
        End If
    End Sub

    Private Sub Form1_Disposed(ByVal sender As Object, ByVal e As System.EventArgs) Handles MyBase.Disposed
        VSTwain1.StopDevice()
    End Sub

    Private Sub VSTwain1_PostScan(ByVal sender As System.Object, ByVal e As VintaSoft.Twain.PostScanEventArgs) Handles VSTwain1.PostScan
        If Not e.flag Then
            If VSTwain1.errorCode <> 0 Then
                MsgBox(VSTwain1.errorString)
            End If
        Else
            If Not (PictureBox1.Image Is Nothing) Then
                PictureBox1.Image.Dispose()
                PictureBox1.Image = Nothing
            End If
            PictureBox1.Image = VSTwain1.GetCurrentImage
            PictureBox1.Image.Save("c:\simple.bmp", System.Drawing.Imaging.ImageFormat.Bmp)
        End If
        VSTwain1.StopDevice()
        CropIM()
    End Sub

    Private Function CropIM()
        Dim ax3, by3, blackRim, ylast, yadd, yinit, black, clr, ybreak, xmainpoint As Integer
        Dim axplus, yST, wrongGradesum, wrongIDsum, xmax, xtop, blackline, blackline2 As Integer
        Dim whatnumSt, maintopN, ymax, ysub, pointr, pointbot, mainwidth, mainheight As Integer
        Dim casepa, picwidth, picheight, whatpage, x, xdm, numwidth, newnumwidth, numheight As Integer
        Dim pointheight, gradeheight, y, ydm, ystepgrade, xleftgrade, xrightgrade, ybottomgrade As Integer
        Dim num1, num2, NummainP, NummainP2, pointtopleft, pointtopr, xmean, kindofpa, xNewim As Integer
        Dim Order, linefor, begin, whatpageRe, yNewim, yNewim1, yNewim2, yscale As Integer
        Dim wrongSum, wrongID, wrongGrade, xST, xST2, yST2, xPlace, xsub, subwidth, countmatch As Integer
        Dim blackpointmain, pointleft, by, by1, by2, ax1, ax2, xPlace1, xstart, xstart2 As Integer
        Dim pointtop, blackdm, blackdm2, countid, countgrade, ytopgrade, ystep, yPlace, ytop As Integer
        Dim countheight, gradewidth, gradewidth2, count, countn, countcrop, ymainpoint As Integer
        Dim blacklist, blacklist2, bmnumMH, numberend, num3, pageinit, rim, newPointx, Pointx As Integer
        Dim pagesingle, pagemain, pageplus, pointtopleft2, pointtopr2, pointtopxleft, pointtopxr, ax, plus As Integer
        Dim number3time, pagenumber2, pagenumber, WhereBegin, endcount, number, page, xnext, ynext, p1, p2, p3, p4, p5, p6, p7, p8 As Integer
        Dim idend, midend, cP, subject, poal1, poal2, grade, IDnumber, gradeCompare, IDcompare As String
        Dim axST, ytopMM, xt, blackline3, yST3, BP, BP2, ff, progressV, axstep2, axstep, IDcomEnd, mainNM, numBottom, numright, numM, topM, numbot, numbot2, numberbotM, numberbot1 As Integer
        Dim Textsize, Textsize2 As Boolean

        If CheckBox1.Checked = True Then
            pageinit = 1
        Else : pageinit = 40
        End If
        For page = pageinit To 50
            Dim MyImage As Image
            ' Get the bitmap and its dimensions.
            If (CheckBox1.Checked = True And page = 1) Or page = 40 Then
                If page <> 40 Then
                    Try
                        OpenFileDialog1.ShowDialog()
                        MyImage = Image.FromFile(OpenFileDialog1.FileName)
                    Catch er As Exception
                        MessageBox.Show(er.message())
                        Exit Function
                    End Try
                    Label7.Text = "page1"
                    Label7.Refresh()
                End If
                If page = 40 Then
                    MyImage = Image.FromFile("c:\simple.bmp")
                End If
                TextBox1.Enabled = False
                TextBox2.Enabled = False
                Button1.Enabled = False
                Button1.Enabled = False
                Button2.Enabled = False
                Button3.Enabled = False
                Button4.Enabled = False
                CheckBox1.Enabled = False
            Else
                Try
                    MyImage = Image.FromFile("c:\" & subject & "-" & TextBox1.Text & "\" & subject & "-" & TextBox1.Text & "-" & page & ".tif")
                Catch er As Exception
                    MessageBox.Show(er.Message())
                    TextBox1.Enabled = True
                    TextBox2.Enabled = True
                    Button1.Enabled = True
                    Button2.Enabled = True
                    Button3.Enabled = True
                    Button4.Enabled = True
                    CheckBox1.Enabled = True
                    Exit Function
                End Try

            End If
            'Dim Im = Image.FromFile("c:\white.bmp")
            Dim bm As Bitmap = MyImage
            Dim cm As New Bitmap(500, 5000)
            Dim c As New Color
            If page <> 40 Then
                PictureBox1.Image = bm
                PictureBox1.SizeMode = PictureBoxSizeMode.StretchImage
            End If

            xmax = bm.Width - 1
            ymax = bm.Height - 1

            '-------------------clear rim of image-------------------------
            xST = 0
            xST2 = bm.Width - 1
            rim = 0
            yST = 0
            yST2 = bm.Height - 1
            For y = 10 To bm.Height - 10
                c = bm.GetPixel(0, y)
                If c.R <= 5 Then
                    rim = rim + 1
                End If
            Next
            If rim > 1 Then
                rim = 0
                For y = 10 To bm.Height - 10
                    c = bm.GetPixel(50, y)
                    If c.R <= 5 Then
                        rim = rim + 1
                    End If
                Next
                If rim < 5 Then
                    xST = 50
                End If
            End If
            rim = 0
            For y = 10 To bm.Height - 10
                c = bm.GetPixel(bm.Width - 1, y)
                If c.R <= 5 Then
                    rim = rim + 1
                End If
            Next
            If rim > 1 Then
                rim = 0
                For y = 10 To bm.Height - 10
                    c = bm.GetPixel(bm.Width - 50, y)
                    If c.R <= 5 Then
                        rim = rim + 1
                    End If
                Next
                If rim < 5 Then
                    xST2 = bm.Width - 50
                End If
            End If
            rim = 0
            For x = xST To xST2
                c = bm.GetPixel(x, bm.Height - 1)
                If c.R <= 5 Then
                    rim = rim + 1
                End If
            Next
            If rim > 1 Then
                rim = 0
                For x = xST To xST2
                    c = bm.GetPixel(x, bm.Height - 120)
                    If c.R <= 5 Then
                        rim = rim + 1
                    End If
                Next
                If rim <= 5 Then
                    yST2 = bm.Height - 120
                End If
            End If
            rim = 0
            For x = xST To xST2
                c = bm.GetPixel(x, 0)
                If c.R <= 5 Then
                    rim = rim + 1
                End If
            Next
            If rim > 1 Then
                rim = 0
                For x = xST To xST2
                    c = bm.GetPixel(x, 120)
                    If c.R <= 5 Then
                        rim = rim + 1
                    End If
                Next
                If rim <= 5 Then
                    yST = 120
                End If
            End If
            For by = yST To yST2
                c = bm.GetPixel(1000, by)
                If c.R <= 5 Then
                    count = count + 1
                    If count = 1 Then
                        For ax = 1000 To 1040
                            c = bm.GetPixel(ax, by + 2)
                            If c.R <= 5 Then
                                BP = BP + 1
                            End If
                        Next
                        If BP >= 32 Then
                            If by > 500 Then
                                yST = by - 50
                                Exit For
                            Else
                                Exit For
                            End If
                        Else
                            count = 0
                        End If
                    End If
                End If
            Next
            'For x = 0 To xmax
            'c = bm.GetPixel(x, bm.Height - 100)
            'If c.R <= 5 Then
            'blackpointmain = blackpointmain + 1
            'End If
            'Next

            '---------------------- Crop image-----------------------------
            ' find coordinate x
            countcrop = 0
            mainwidth = 0
            mainheight = 0
            pointr = 0
            pointbot = 0
            If bm.Height Mod 2 = 0 Then
                by1 = yST
                If by1 > 500 Then
                    by2 = yST2
                End If
                If by1 < 500 Then
                    by2 = bm.Height / 2
                End If
            End If
            If bm.Height Mod 2 = 1 Then
                by1 = yST
                If by1 > 500 Then
                    by2 = yST2
                End If
                If by1 < 500 Then
                    by2 = (bm.Height / 2) + 0.5
                End If
            End If

            For ax = xST To xST2
                For by = by1 To by2
                    c = bm.GetPixel(ax, by)
                    If c.R <= 5 Then
                        countcrop = countcrop + 1
                        If countcrop = 1 Then
                            blacklist = 0
                            blacklist2 = 0
                            If ax + 40 < xST2 Then
                                axplus = ax + 40
                            Else : axplus = xST2
                            End If
                            For ax3 = ax To axplus
                                c = bm.GetPixel(ax3, by + 2)
                                If c.R <= 5 Then
                                    blacklist = blacklist + 1
                                End If
                            Next
                            For by3 = by To by + 40
                                c = bm.GetPixel(ax + 2, by3)
                                If c.R <= 5 Then
                                    blacklist2 = blacklist2 + 1
                                End If
                            Next
                            If blacklist >= 32 Or blacklist2 >= 32 Then
                                pointleft = ax
                            Else
                                countcrop = 0
                            End If
                        End If
                        If pointr <= ax Then
                            If pointr <> ax Then
                                mainwidth = mainwidth + 1
                            End If
                            pointr = ax
                        End If
                    End If
                Next
            Next
            'MessageBox.Show(pointleft)
            'MessageBox.Show(pointr)
            count = 0
            If bm.Width Mod 2 = 0 Then
                ax2 = bm.Width / 2
            End If
            If bm.Width Mod 2 = 1 Then
                ax2 = bm.Width / 2 + 0.5
            End If
            If yST + 500 > bm.Height - 1 Then
                yST3 = bm.Height - 1
            Else
                yST3 = yST + 500
            End If
            For by = yST To yST3
                For ax = xST To ax2
                    c = bm.GetPixel(ax, by)
                    If c.R <= 5 Then
                        count = count + 1
                        If count = 1 Then
                            blacklist = 0
                            blacklist2 = 0
                            For ax3 = ax To ax + 40
                                c = bm.GetPixel(ax3, by + 2)
                                If c.R <= 5 Then
                                    blacklist = blacklist + 1
                                End If
                            Next
                            For by3 = by To by + 40
                                c = bm.GetPixel(ax + 2, by3)
                                If c.R <= 5 Then
                                    blacklist2 = blacklist2 + 1
                                End If
                            Next
                            If blacklist >= 32 Or blacklist2 >= 32 Then
                                pointtopleft = by
                                pointtopxleft = ax
                                Exit For
                            Else
                                count = 0
                            End If
                        End If
                    End If
                Next
            Next
            'MessageBox.Show(blacklist & blacklist2)
            count = 0

            For by = yST To yST3
                For ax = xST2 To ax2 Step -1
                    c = bm.GetPixel(ax, by)
                    If c.R <= 5 Then
                        count = count + 1
                        If count = 1 Then
                            blacklist = 0
                            blacklist2 = 0
                            For ax3 = ax To ax - 40 Step -1
                                c = bm.GetPixel(ax3, by + 2)
                                If c.R <= 5 Then
                                    blacklist = blacklist + 1
                                End If
                            Next
                            For by3 = by To by + 40
                                c = bm.GetPixel(ax - 2, by3)
                                If c.R <= 5 Then
                                    blacklist2 = blacklist2 + 1
                                End If
                            Next
                            If blacklist >= 32 Or blacklist2 >= 32 Then
                                pointtopr = by
                                pointtopxr = ax
                                Exit For
                            Else
                                count = 0
                            End If
                        End If
                    End If
                Next
            Next
            'MessageBox.Show(pointtopleft)
            'MessageBox.Show(pointtopr)

            If pointtopleft >= pointtopr Then
                kindofpa = 1
                If bm.Width Mod 2 = 1 Then
                    ax1 = (bm.Width / 2) + 0.5
                    ax2 = xST2
                End If
                If bm.Width Mod 2 = 0 Then
                    ax1 = bm.Width / 2
                    ax2 = xST2
                End If
            End If
            If pointtopleft < pointtopr Then
                kindofpa = 2
                If bm.Width Mod 2 = 1 Then
                    ax1 = xST
                    ax2 = (bm.Width / 2) + 0.5
                End If
                If bm.Width Mod 2 = 0 Then
                    ax1 = xST
                    ax2 = bm.Width / 2
                End If
            End If
            'find coordinate y
            countcrop = 0
            For by = yST To yST2
                For ax = ax1 To ax2
                    c = bm.GetPixel(ax, by)
                    If c.R <= 5 Then
                        countcrop = countcrop + 1
                        If countcrop = 1 Then
                            blacklist = 0
                            blacklist2 = 0
                            For ax3 = ax To ax + 40
                                c = bm.GetPixel(ax3, by + 2)
                                If c.R <= 5 Then
                                    blacklist = blacklist + 1
                                End If
                            Next
                            For by3 = by To by + 40
                                c = bm.GetPixel(ax + 2, by3)
                                If c.R <= 5 Then
                                    blacklist2 = blacklist2 + 1
                                End If
                            Next
                            If blacklist >= 32 Or blacklist2 >= 32 Then
                                pointtop = by
                            Else
                                countcrop = 0
                            End If
                        End If
                    End If
                Next
            Next
            If kindofpa = 1 Then
                If bm.Width Mod 2 = 1 Then
                    ax2 = (bm.Width / 2) + 0.5
                    ax1 = xST
                End If
                If bm.Width Mod 2 = 0 Then
                    ax2 = bm.Width / 2
                    ax1 = xST
                End If
                axstep = 1
                axstep2 = +2
            End If
            If kindofpa = 2 Then
                If bm.Width Mod 2 = 1 Then
                    ax2 = xST2
                    ax1 = (bm.Width / 2) + 0.5
                End If
                If bm.Width Mod 2 = 0 Then
                    ax2 = xST2
                    ax1 = bm.Width / 2
                End If
                axstep = -1
                axstep2 = -2
            End If
            countcrop = 0
            For by = yST2 To yST Step -1
                For ax = ax1 To ax2
                    c = bm.GetPixel(ax, by)
                    If c.R <= 5 Then
                        countcrop = countcrop + 1
                        If countcrop = 1 Then
                            blacklist = 0
                            blacklist2 = 0
                            If kindofpa = 1 Then
                                axplus = ax + 40
                            Else
                                axplus = ax - 40
                            End If
                            For ax3 = ax To axplus Step axstep
                                c = bm.GetPixel(ax3, by - 2)
                                If c.R <= 5 Then
                                    blacklist = blacklist + 1
                                End If
                            Next
                            For by3 = by To by - 40 Step -1
                                c = bm.GetPixel(ax + axstep2, by3)
                                If c.R <= 5 Then
                                    blacklist2 = blacklist2 + 1
                                End If
                            Next
                            If blacklist >= 32 Or blacklist2 >= 32 Then
                                pointbot = by
                            Else
                                countcrop = 0
                            End If
                        End If

                    End If
                Next
            Next
            mainheight = pointbot - Math.Min(pointtopleft, pointtopr) + 1
            'MessageBox.Show(kindofpa)
            Dim fr_bm0 As New Bitmap(bm)
            Dim to_bm0 As New Bitmap(mainwidth, mainheight)
            Dim gr0 As Graphics = Graphics.FromImage(to_bm0)

            Dim fr_rect0 As New Rectangle(pointleft, pointtop, mainwidth, mainheight)
            Dim to_rect0 As New Rectangle(0, 0, mainwidth, mainheight)
            gr0.DrawImage(fr_bm0, to_rect0, fr_rect0, GraphicsUnit.Pixel)
            to_bm0.Save("C:\cropim" & page & ".bmp", System.Drawing.Imaging.ImageFormat.Bmp)
            to_bm0.Save("C:\cropimRe" & page & ".bmp", System.Drawing.Imaging.ImageFormat.Bmp)
            'MessageBox.Show(whatpage)
            Dim newpic = Image.FromFile("c:\cropim" & page & ".bmp")
            Dim newim As Bitmap = newpic
            'MessageBox.Show(pointtopxleft)
            'MessageBox.Show(pointtopxr)
            If newim.Width Mod 2 = 0 Then ax = newim.Width / 2 Else ax = newim.Width / 2 + 0.5
            If pointtopxr >= ax And pointtopxr < newim.Width - 100 Then
                count = 0
                For by = 0 To 200
                    c = newim.GetPixel(newim.Width - 1, by)
                    If c.R <= 5 Then
                        count = count + 1
                        If count = 1 Then
                            pointtopr2 = by
                            Exit For
                        End If
                    End If
                Next
                pointtopr = pointtopr + pointtopr2
            End If
            If pointtopxleft <= ax And pointtopxleft > 200 Then
                count = 0
                For by = 0 To 200
                    c = newim.GetPixel(0, by)
                    If c.R <= 5 Then
                        count = count + 1
                        If count = 1 Then
                            pointtopleft2 = by
                            Exit For
                        End If
                    End If
                Next
                pointtopleft = pointtopleft + pointtopleft2
            End If

            '-----------------------Display--------------------------'

            'MyImage = bm
            'PictureBox1.Image = MyImage
            'PictureBox1.SizeMode = PictureBoxSizeMode.Normal
            Dim fr_bmN As New Bitmap(newim)
            'Dim to_bm As New Bitmap(cm)
            whatpage = 0
            For ax = 0 To newim.Width - 1
                c = newim.GetPixel(ax, 60)
                If c.R <= 5 Then
                    whatpage = whatpage + 1
                End If
            Next
            If whatpage > 30 Then
                If mainheight > 1550 Then
                    whatpage = 0
                    For ax = 185 To 485
                        For by = 1450 To 1550
                            c = newim.GetPixel(ax, by)
                            If c.R <= 5 Then
                                whatpage = whatpage + 1
                            End If
                        Next
                    Next
                    If whatpage < 10 Then
                        whatpage = 20
                    Else
                        whatpage = 60
                    End If
                End If
            End If
            count = 0
            blackline = 0
            blackline2 = 0
            whatpageRe = 0
            If whatpage > 30 Then
                For ax = 0 To newim.Width - 1
                    c = newim.GetPixel(ax, newim.Height - 60)
                    If c.R <= 5 Then
                        whatpageRe = whatpageRe + 1
                    End If
                Next
                If whatpageRe < 30 Then
                    newim.RotateFlip(RotateFlipType.Rotate180FlipY)
                    newim.RotateFlip(RotateFlipType.Rotate180FlipX)
                    newim.Save("c:\cropimRe" & page & ".bmp", System.Drawing.Imaging.ImageFormat.Bmp)
                    whatpage = 20
                Else
                    For by = 0 To newim.Height - 1
                        c = newim.GetPixel(newim.Width - 556, by)
                        If c.R <= 5 Then
                            blackline = blackline + 1
                        End If
                        c = newim.GetPixel(556, by)
                        If c.R <= 5 Then
                            blackline2 = blackline2 + 1
                        End If
                    Next
                    If blackline > blackline2 Then
                        newim.RotateFlip(RotateFlipType.Rotate180FlipY)
                        newim.RotateFlip(RotateFlipType.Rotate180FlipX)
                        newim.Save("c:\cropimRe" & page & ".bmp", System.Drawing.Imaging.ImageFormat.Bmp)
                    End If
                End If
            End If

            Dim imRO = Image.FromFile("c:\cropimRe" & page & ".bmp")
            Dim bmRO As Bitmap = imRO
            Dim fr_bmNRO As New Bitmap(bmRO)
            Dim newimMain As Bitmap
            Dim fr_imMain As Bitmap
            If whatpage > 30 Then
                If blackline > blackline2 Then
                    fr_imMain = fr_bmNRO
                    newimMain = bmRO
                End If
                If blackline < blackline2 Then
                    fr_imMain = fr_bmN
                    newimMain = newim
                End If
            End If
            If whatpage < 30 Then
                If whatpageRe < 30 And whatpageRe <> 0 Then
                    fr_imMain = fr_bmNRO
                    newimMain = bmRO
                Else
                    fr_imMain = fr_bmN
                    newimMain = newim
                End If
            End If
            If whatpage > 30 Then
                by2 = 0
                by3 = 0
            End If
            count = 0
            For by = 0 To 100
                For ax = 0 To 100
                    c = newimMain.GetPixel(ax, by)
                    If c.R <= 5 Then
                        count = count + 1
                        If count = 1 Then
                            by2 = by
                            Exit For
                        End If
                    End If
                Next
                If count = 1 Then
                    Exit For
                End If
            Next
            count = 0
            For by = 0 To 100
                For ax = mainwidth - 1 To mainwidth - 100
                    c = newimMain.GetPixel(ax, by)
                    If c.R <= 5 Then
                        count = count + 1
                        If count = 1 Then
                            by3 = by
                            Exit For
                        End If
                    End If
                Next
                If count = 1 Then
                    Exit For
                End If
            Next
            If by2 + 8 >= by3 Then
                kindofpa = 1
            End If
            If by2 < by3 Then
                kindofpa = 2
            End If
            'MessageBox.Show(kindofpa)

            '-------------------------------------------------------'
            '-----------------------subject-------------------------'
            '-------------------------------------------------------'

            If whatpage < 30 Then
                '---------------------- find last number---------------------'
                count = 0
                For by = mainheight - 1 To mainheight - 100 Step -1
                    c = newimMain.GetPixel(80, by)
                    If c.R <= 5 Then
                        count = count + 1
                        If count = 1 Then
                            numBottom = by
                            Exit For
                        End If
                    End If
                    If count = 1 Then
                        Exit For
                    End If
                Next
                count = 0
                If kindofpa = 1 Then
                    For ax = 0 To 200
                        c = newimMain.GetPixel(ax, numBottom - 20)
                        If c.R <= 5 Then
                            count = count + 1
                            If count = 1 Then
                                numright = ax
                                Exit For
                            End If
                        End If
                        If count = 1 Then
                            Exit For
                        End If
                    Next
                End If
                count = 0
                If kindofpa = 2 Then
                    numright = 5
                    c = newimMain.GetPixel(numright, numBottom - 20)
                    If c.R <= 5 Then
                        For ax = numright To numright + 10
                            c = newimMain.GetPixel(ax, numBottom - 20)
                            If c.R >= 250 Then
                                count = count + 1
                                If count = 1 Then
                                    numright = ax
                                    Exit For
                                End If
                            End If
                        Next
                    End If
                End If
                'MessageBox.Show(kindofpa)
                'MessageBox.Show(numBottom, numright)

                count = 0
                If kindofpa = 1 Then
                    cP = 90
                Else
                    cP = 80
                End If
                For by = numBottom - 10 To numBottom - 30 Step -1
                    For ax = numright + 10 To numright + cP
                        c = newimMain.GetPixel(ax, by)
                        If c.R <= 5 Then
                            count = count + 1
                            If count = 1 Then
                                numM = ax
                                Exit For
                            End If
                        End If
                    Next
                Next
                'MessageBox.Show(numM)
                If numM = 0 Then

                End If
                count = 0
                For ax = numM To numM + 10
                    c = newimMain.GetPixel(ax, numBottom - 30)
                    If c.R >= 250 Then
                        count = count + 1
                        If count = 1 Then
                            mainNM = ax
                            Exit For
                        End If
                    End If
                Next
                'MessageBox.Show(mainNM)
                count = 0
                For by = numBottom - 10 To numBottom - 150 Step -1
                    c = newimMain.GetPixel(numM - 10, by)
                    If c.R <= 5 Then
                        count = count + 1
                        If count = 1 Then
                            topM = by
                            Exit For
                        End If
                    End If
                Next
                topM = topM + 10
                'MessageBox.Show(topM)

                Dim bmbot2 As New Bitmap(22, 42)
                Dim fr_rectb2 As New Rectangle(mainNM + 5, topM, 22, 42)
                Dim to_rectb2 As New Rectangle(0, 0, 22, 42)
                Dim grb2 As Graphics = Graphics.FromImage(bmbot2)
                grb2.DrawImage(fr_imMain, to_rectb2, fr_rectb2, GraphicsUnit.Pixel)
                numbot2 = numberrecog(bmbot2, count)

                bmbot2.Save("c:\cc.bmp", System.Drawing.Imaging.ImageFormat.Bmp)
                numberbotM = 1 & numbot2
                'MessageBox.Show(numberbotM)

                '--------------------------------------------------------------------'
                'MessageBox.Show(kindofpa)
                'MessageBox.Show(pagemain)
                count = 0
                For yNewim = 1675 To 1750
                    For xNewim = 130 To 150
                        c = newimMain.GetPixel(xNewim, yNewim)
                        If c.R <= 5 Then
                            count = count + 1
                            If count = 1 Then
                                ysub = yNewim
                                Exit For
                            End If
                        End If
                    Next
                Next
                'MessageBox.Show(ysub)
                count = 0
                For yNewim = ysub + 20 To ysub + 60
                    For xNewim = 130 To 170
                        c = newimMain.GetPixel(xNewim, yNewim)
                        If c.R <= 5 Then
                            count = count + 1
                            If count = 1 Then
                                ysub = yNewim
                                Exit For
                            End If
                        End If
                    Next
                Next
                'MessageBox.Show(ysub)
                count = 0
                For xNewim = 130 To 170
                    For yNewim = ysub + 14 To ysub + 32
                        c = newimMain.GetPixel(xNewim, yNewim)
                        If c.R <= 5 Then
                            count = count + 1
                            If count = 1 Then
                                newPointx = xNewim
                            End If
                        End If
                    Next
                Next
                'MessageBox.Show(newPointx)

                xPlace = 0
                newPointx = newPointx - 2
                count = 0
                For xNewim = newPointx To newPointx + 175 Step 22
                    count = count + 1
                    If count = 1 Then
                        xNewim = xNewim + 1
                    End If
                    If count > 2 And count <= 4 Then
                        xNewim = xNewim - 2
                    End If
                    If count > 4 And count <= 5 Then
                        xNewim = xNewim
                    End If
                    If count = 6 Then
                        xNewim = xNewim - 1
                    End If
                    If count = 7 Then
                        xNewim = xNewim - 1
                    End If

                    ' Get source and destination rectangles.
                    Dim bmsub As New Bitmap(22, 48)
                    Dim fr_rect As New Rectangle(xNewim, ysub - 10, 22, 48)
                    Dim to_rectsub As New Rectangle(0, 0, 22, 48)
                    Dim to_rect As New Rectangle(xNewim - newPointx + 10 + xPlace, 10, 22, 48)
                    'Draw from the source to the destination.
                    Dim grsub As Graphics = Graphics.FromImage(bmsub)
                    Dim gr As Graphics = Graphics.FromImage(cm)
                    gr.DrawImage(fr_imMain, to_rect, fr_rect, GraphicsUnit.Pixel)
                    grsub.DrawImage(fr_imMain, to_rectsub, fr_rect, GraphicsUnit.Pixel)
                    xPlace = xPlace + 20
                    If count = 1 Then
                        p1 = numberrecog(bmsub, count)

                    End If
                    If count = 2 Then
                        p2 = numberrecog(bmsub, count)

                    End If
                    If count = 3 Then
                        p3 = numberrecog(bmsub, count)

                    End If
                    If count = 4 Then
                        p4 = numberrecog(bmsub, count)

                    End If
                    If count = 5 Then
                        p5 = numberrecog(bmsub, count)

                    End If
                    If count = 6 Then
                        p6 = numberrecog(bmsub, count)

                    End If
                    If count = 7 Then
                        p7 = numberrecog(bmsub, count)

                    End If
                    If count = 8 Then
                        p8 = numberrecog(bmsub, count)

                    End If
                Next xNewim
                subject = p1 & p2 & p3 & p4 & p5 & p6 & p7 & p8
                'MessageBox.Show(subject)
            End If
            If whatpage < 30 Then
                subject = p1 & p2 & p3 & p4 & p5 & p6 & p7 & p8
            End If
            If whatpage > 30 Then
                subject = TextBox2.Text
            End If
            Try
                begin = StartExcelAt(subject)
            Catch er As Exception
                MessageBox.Show(er.Message())
                TextBox1.Enabled = True
                TextBox2.Enabled = True
                Button1.Enabled = True
                Button2.Enabled = True
                Button3.Enabled = True
                Button4.Enabled = True
                CheckBox1.Enabled = True
                Exit Function
            End Try

            '-----------------------------------------------------'
            '-------------------------ID--------------------------'
            '-----------------------------------------------------'
            count = 0
            If kindofpa = 1 And whatpage >= 30 And blackline > blackline2 Then
                blackline3 = 0
                For by = 0 To 50
                    For ax = 0 To 50
                        c = newimMain.GetPixel(ax, by)
                        If c.R <= 5 Then
                            count = count + 1
                            If count = 1 Then
                                ytopMM = by
                                Exit For
                            End If
                        End If
                    Next
                Next
                For ax = 0 To 10
                    For by = ytopMM To ytopMM + 40
                        c = newimMain.GetPixel(ax, by)
                        If c.R <= 5 Then
                            blackline3 = blackline3 + 1
                        End If
                    Next
                    If blackline3 >= 32 Then
                        Exit For
                    Else : blackline3 = 0
                    End If
                Next
                If blackline3 <> 0 Then
                    blackline = 10
                    blackline2 = 20
                End If
            End If
            yinit = 0
            countmatch = 1
            If whatpage < 30 Then
                If kindofpa = 1 Then
                    If numberbotM = 17 Then
                        yinit = 1865
                    Else
                        yinit = 1835
                    End If
                End If
                If kindofpa = 2 Then
                    yinit = 1850
                End If
                progressV = numberbotM - 1
            End If
            count = 0
            blackline3 = 0
            If whatpage >= 30 Then
                For ax = 135 To 145
                    For by = 0 To 50
                        c = newimMain.GetPixel(ax, by)
                        If c.R <= 5 Then
                            blackline3 = blackline3 + 1
                        End If
                    Next
                    If blackline3 >= 32 Then
                        xt = ax + 15
                        Exit For
                    Else
                        blackline3 = 0
                    End If
                Next
                If xt = 0 Then
                    xt = 135
                End If
                'MessageBox.Show(xt)
                For by = 0 To 50
                    c = newimMain.GetPixel(xt, by)
                    If c.R <= 5 Then
                        count = count + 1
                        If count = 1 Then
                            yinit = by
                        End If
                        Exit For
                    End If
                Next
                'MessageBox.Show(yinit)
                If yinit - 5 > 0 Then
                    For ax = xt To 0 Step -1
                        c = newimMain.GetPixel(ax, yinit - 5)
                        If c.R <= 5 Then
                            yinit = 0
                            Exit For
                        End If
                    Next
                End If
                If yinit <> 0 Then
                    yinit = yinit + 10
                End If
                If yinit = 0 Then
                    c = newimMain.GetPixel(xt, 0)
                    If c.R <= 5 Then
                        yinit = yinit + 10
                    Else
                        yinit = 0
                    End If
                End If
                progressV = 44
                'MessageBox.Show(yinit)
            End If
            BP2 = 0
            'MessageBox.Show(yinit)
            'MessageBox.Show(yinit)
            For countheight = 0 To progressV
                ProgressBar1.Value = (countheight * 100) / progressV
                Label6.Text = "ID Recognition"
                Label6.Refresh()
                If whatpage < 30 Then
                    yNewim1 = yinit
                    If yNewim1 + 50 >= mainheight Then
                        yNewim2 = mainheight - 1
                    Else
                        yNewim2 = yNewim1 + 50
                    End If
                    yscale = 1865
                    If kindofpa = 1 Then
                        xstart = 125
                        xstart2 = 160
                    End If
                    If kindofpa = 2 Then
                        xstart = 135
                        xstart2 = 170
                    End If
                End If
                If whatpage >= 30 Then
                    yNewim1 = yinit
                    If yNewim1 + 50 >= mainheight Then
                        yNewim2 = mainheight - 1
                    Else
                        yNewim2 = yNewim1 + 50
                    End If
                    yscale = 15
                    'MessageBox.Show(kindofpa)
                    If kindofpa = 1 Then
                        If blackline < blackline2 Then
                            xstart = 125
                            xstart2 = 160
                        End If
                        If blackline > blackline2 Then
                            xstart = 115
                            xstart2 = 150
                        End If
                    End If
                    'MessageBox.Show(xstart & xstart2)
                    If kindofpa = 2 Then
                        If blackline < blackline2 Then
                            xstart = 135
                            xstart2 = 170
                        End If
                        If blackline > blackline2 Then
                            xstart = 155
                            xstart2 = 190
                        End If
                    End If
                End If
                If yNewim2 > newimMain.Height Then
                    Exit For
                End If
                countid = 0
                'blackline = 0
                If countmatch = 1 Then
                    blackline3 = 0
                    For yNewim = yNewim1 To yNewim2
                        For xNewim = xstart To xstart2
                            c = newimMain.GetPixel(xNewim, yNewim)
                            If c.R <= 5 Then
                                If xNewim = xstart Then
                                    ytop = yNewim
                                    If ytop + 40 >= mainheight - 1 Then
                                        ylast = mainheight - 1
                                    Else : ylast = ytop + 40
                                    End If
                                    For ax = xNewim - 2 To xNewim + 2
                                        For by = ytop To ylast
                                            c = newimMain.GetPixel(ax, by)
                                            If c.R <= 5 Then
                                                blackline3 = blackline3 + 1
                                            End If
                                        Next
                                        If blackline3 >= 32 Then
                                            Exit For
                                        Else
                                            blackline3 = 0
                                        End If
                                    Next
                                    'MessageBox.Show(blackline)
                                    If blackline3 >= 32 Then
                                        countmatch = 2
                                        'MessageBox.Show(countheight)
                                        Exit For
                                    Else
                                        countmatch = 4
                                        Exit For
                                    End If
                                Else
                                    blackline3 = 0
                                    countid = countid + 1
                                    If countid = 1 Then
                                        ytop = yNewim
                                        xtop = xNewim
                                        countmatch = 1
                                        If ytop + 40 >= mainheight - 1 Then
                                            ylast = mainheight - 1
                                        Else : ylast = ytop + 40
                                        End If
                                        For ax = xtop To xtop + 3
                                            For by = ytop To ylast
                                                c = newimMain.GetPixel(ax, by)
                                                If c.R <= 5 Then
                                                    blackline3 = blackline3 + 1
                                                End If
                                            Next
                                            If blackline3 >= 32 Then
                                                Exit For
                                            Else : blackline3 = 0
                                            End If
                                        Next
                                        If blackline3 >= 32 Then
                                            countmatch = 2
                                            Exit For
                                        Else : Exit For
                                        End If
                                    End If
                                End If
                            End If
                        Next
                        If countmatch <> 1 Then
                            Exit For
                        End If
                    Next
                End If
                'MessageBox.Show(countmatch)
                If countmatch = 2 Then
                    countid = 0
                    For yNewim = yNewim1 To yNewim2
                        If kindofpa = 1 Then
                            If whatpage > 30 Then
                                If blackline < blackline2 Then
                                    xstart = 135
                                    xstart2 = 170
                                End If
                                If blackline > blackline2 Then
                                    xstart = 125
                                    xstart2 = 160
                                End If
                            End If
                            If whatpage <= 30 Then
                                xstart = 135
                                xstart2 = 170
                            End If
                        End If
                        If kindofpa = 2 Then
                            If whatpage <= 30 Then
                                xstart = 145
                                xstart2 = 180
                            End If
                            If whatpage > 30 Then
                                If blackline < blackline2 Then
                                    xstart = 145
                                    xstart2 = 180
                                End If
                                If blackline > blackline2 Then
                                    xstart = 165
                                    xstart2 = 200
                                End If
                            End If
                        End If
                        blackline3 = 0
                        For xNewim = xstart To xstart2
                            c = newimMain.GetPixel(xNewim, yNewim)
                            If c.R <= 5 Then
                                countid = countid + 1
                                If xNewim = xstart Then
                                    If kindofpa = 2 Then
                                        For ax = xNewim To xNewim + 2
                                            For by = yNewim To yNewim + 40
                                                c = newimMain.GetPixel(ax, by)
                                                If c.R <= 5 Then
                                                    blackline3 = blackline3 + 1
                                                End If
                                            Next
                                            If blackline3 >= 32 Then
                                                Exit For
                                            Else
                                                blackline3 = 0
                                            End If
                                        Next
                                        If blackline3 >= 32 Then
                                            blackline = 50
                                            blackline2 = 20
                                            countmatch = 3
                                            Exit For
                                        Else : countmatch = 3
                                            Exit For
                                        End If
                                    End If
                                    If kindofpa = 1 Then
                                        countmatch = 3
                                        Exit For
                                    End If
                                    'MessageBox.Show("3")
                                Else
                                    If countid = 1 Then
                                        ytop = yNewim
                                        countmatch = 2
                                        'MessageBox.Show("2")
                                    End If
                                End If
                            End If
                        Next
                        If countmatch <> 2 Then
                            Exit For
                        End If
                    Next
                    'MessageBox.Show(ytop)
                End If
                If countmatch = 3 Then
                    countid = 0
                    For yNewim = yNewim1 To yNewim2
                        If kindofpa = 1 Then
                            If whatpage > 30 Then
                                If blackline < blackline2 Then
                                    xstart = 145
                                    xstart2 = 180
                                End If
                                If blackline > blackline2 Then
                                    xstart = 135
                                    xstart2 = 170
                                End If
                            End If
                            If whatpage < 30 Then
                                xstart = 145
                                xstart2 = 180
                            End If
                        End If
                        If kindofpa = 2 Then
                            If whatpage <= 30 Then
                                xstart = 135
                                xstart2 = 170
                            End If
                            If whatpage > 30 Then
                                If blackline < blackline2 Then
                                    xstart = 135
                                    xstart2 = 170
                                End If
                                If blackline > blackline2 Then
                                    xstart = 155
                                    xstart2 = 190
                                End If
                            End If
                        End If
                        For xNewim = xstart To xstart2
                            c = newimMain.GetPixel(xNewim, yNewim)
                            If c.R <= 5 Then
                                countid = countid + 1
                                If xNewim = xstart Then
                                    countmatch = 4
                                    'MessageBox.Show("4")
                                    Exit For
                                Else
                                    If countid = 1 Then
                                        ytop = yNewim
                                        countmatch = 3
                                    End If
                                End If
                            End If
                        Next
                        If countmatch <> 3 Then
                            Exit For
                        End If
                    Next
                End If
                If countmatch = 4 Then
                    countid = 0
                    For yNewim = yNewim1 To yNewim2
                        If kindofpa = 1 Then
                            If kindofpa = 1 Then
                                If blackline < blackline2 Then
                                    xstart = 155
                                    xstart2 = 190
                                End If
                                If blackline > blackline2 Then
                                    xstart = 145
                                    xstart2 = 180
                                End If
                            End If
                        End If
                        If kindofpa = 2 Then
                            If whatpage < 30 Then
                                xstart = 125
                                xstart2 = 160
                            End If
                            If whatpage > 30 Then
                                If blackline < blackline2 Then
                                    xstart = 125
                                    xstart2 = 160
                                End If
                                If blackline > blackline2 Then
                                    xstart = 145
                                    xstart2 = 180
                                End If
                            End If
                        End If
                        For xNewim = xstart To xstart2
                            c = newimMain.GetPixel(xNewim, yNewim)
                            If c.R <= 5 Then
                                countid = countid + 1
                                If xNewim = xstart Then
                                    countmatch = 5
                                    Exit For
                                Else
                                    If countid = 1 Then
                                        ytop = yNewim
                                        countmatch = 4
                                        'Exit For
                                    End If
                                End If
                            End If
                        Next
                        If countmatch <> 4 Then
                            Exit For
                        End If
                    Next
                End If
                'MessageBox.Show(kindofpa)
                If countmatch = 5 Then
                    countid = 0
                    For yNewim = yNewim1 To yNewim2
                        If kindofpa = 1 Then
                            If kindofpa = 1 Then
                                If whatpage > 30 Then
                                    If blackline < blackline2 Then
                                        xstart = 165
                                        xstart2 = 200
                                    End If
                                    If blackline > blackline2 Then
                                        xstart = 155
                                        xstart2 = 190
                                    End If
                                End If
                                If whatpage < 30 Then
                                    xstart = 165
                                    xstart2 = 200
                                End If
                            End If
                        End If
                        If kindofpa = 2 Then
                            If whatpage < 30 Then
                                xstart = 115
                                xstart2 = 150
                            End If
                            If whatpage > 30 Then
                                If blackline < blackline2 Then
                                    xstart = 115
                                    xstart2 = 150
                                End If
                                If blackline > blackline2 Then
                                    xstart = 135
                                    xstart2 = 170
                                End If
                            End If
                        End If
                        For xNewim = xstart To xstart2
                            c = newimMain.GetPixel(xNewim, yNewim)
                            If c.R <= 5 Then
                                countid = countid + 1
                                If countid = 1 Then
                                    ytop = yNewim
                                    countmatch = 5
                                End If
                            End If
                        Next
                    Next
                End If
                'MessageBox.Show(countmatch)
                countn = 0
                If countmatch = 1 Then
                    If whatpage > 30 Then
                        If kindofpa = 1 Then
                            If blackline < blackline2 Then
                                xstart = 125
                                xstart2 = 160
                            End If
                            If blackline > blackline2 Then
                                xstart = 115
                                xstart2 = 150
                            End If
                        End If
                        If kindofpa = 2 Then
                            If blackline < blackline2 Then
                                xstart = 135
                                xstart2 = 170
                            End If
                            If blackline > blackline2 Then
                                xstart = 155
                                xstart2 = 190
                            End If
                        End If
                    End If
                    If whatpage <= 30 Then
                        If kindofpa = 1 Then
                            xstart = 125
                            xstart2 = 160
                        End If
                        If kindofpa = 2 Then
                            xstart = 135
                            xstart2 = 170
                        End If
                    End If
                End If
                'MessageBox.Show(countmatch)
                blackline3 = 0
                If countmatch = 1 Then
                    For xNewim = xstart To xstart2
                        For yNewim = ytop To ytop + 28
                            If ytop + 28 < mainheight - 1 Then
                                c = newimMain.GetPixel(xNewim, yNewim)
                                If c.R <= 5 Then
                                    If xNewim = xstart Then
                                        If yNewim + 40 > newimMain.Height Then
                                            by2 = newimMain.Height - 1
                                        Else
                                            by2 = yNewim + 40
                                        End If
                                        For ax = xNewim - 2 To xNewim + 2
                                            For by = yNewim To by2
                                                c = newimMain.GetPixel(ax, by)
                                                If c.R <= 5 Then
                                                    blackline3 = blackline3 + 1
                                                End If
                                            Next
                                            If blackline3 >= 32 Then
                                                Exit For
                                            Else : blackline3 = 0
                                            End If
                                        Next
                                        If blackline3 >= 32 Then
                                            countmatch = 2
                                            Exit For
                                        Else
                                            countmatch = 4
                                            Exit For
                                        End If
                                    Else
                                        countn = countn + 1
                                        If countn = 1 Then
                                            ymainpoint = yNewim
                                            xmainpoint = xNewim
                                        End If
                                    End If
                                End If
                            End If
                        Next
                        If countmatch <> 1 Then
                            Exit For
                        End If
                    Next
                End If
                countn = 0
                If countmatch = 2 Then
                    If kindofpa = 1 Then
                        If whatpage > 30 Then
                            If blackline < blackline2 Then
                                xstart = 135
                                xstart2 = 170
                            End If
                            If blackline > blackline2 Then
                                xstart = 125
                                xstart2 = 160
                            End If
                        End If
                        If whatpage < 30 Then
                            xstart = 135
                            xstart2 = 170
                        End If
                    End If
                    If kindofpa = 2 Then
                        If whatpage < 30 Then
                            xstart = 145
                            xstart2 = 170
                        End If
                        If whatpage > 30 Then
                            If blackline < blackline2 Then
                                xstart = 145
                                xstart2 = 170
                            End If
                            If blackline > blackline2 Then
                                xstart = 165
                                xstart2 = 190
                            End If
                        End If
                    End If
                End If
                If countmatch = 2 Then
                    For xNewim = xstart To xstart2
                        For yNewim = ytop To ytop + 28
                            If ytop + 28 < mainheight - 1 Then
                                c = newimMain.GetPixel(xNewim, yNewim)
                                If c.R <= 5 Then
                                    If xNewim = xstart Then
                                        countmatch = 3
                                        Exit For
                                    Else
                                        countn = countn + 1
                                        If countn = 1 Then
                                            ymainpoint = yNewim
                                            xmainpoint = xNewim
                                            'MessageBox.Show("22")
                                        End If
                                    End If
                                End If
                            End If
                        Next
                        If countmatch <> 2 Then
                            Exit For
                        End If
                    Next
                End If
                countn = 0
                If countmatch = 3 Then
                    If kindofpa = 1 Then
                        If whatpage > 30 Then
                            If blackline < blackline2 Then
                                xstart = 145
                                xstart2 = 180
                            End If
                            If blackline > blackline2 Then
                                xstart = 135
                                xstart2 = 170
                            End If
                        End If
                        If whatpage < 30 Then
                            xstart = 145
                            xstart2 = 180
                        End If
                    End If
                    If kindofpa = 2 Then
                        If whatpage < 30 Then
                            xstart = 135
                            xstart2 = 160
                        End If
                        If whatpage > 30 Then
                            If blackline < blackline2 Then
                                xstart = 135
                                xstart2 = 160
                            End If
                            If blackline > blackline2 Then
                                xstart = 155
                                xstart2 = 180
                            End If
                        End If
                    End If
                End If
                If countmatch = 3 Then
                    For xNewim = xstart To xstart2
                        For yNewim = ytop To ytop + 28
                            If ytop + 28 < mainheight - 1 Then
                                c = newimMain.GetPixel(xNewim, yNewim)
                                If c.R <= 5 Then
                                    If xNewim = xstart Then
                                        countmatch = 4
                                        Exit For
                                    Else
                                        countn = countn + 1
                                        If countn = 1 Then
                                            ymainpoint = yNewim
                                            xmainpoint = xNewim
                                        End If
                                    End If
                                End If
                            End If
                        Next
                        If countmatch <> 3 Then
                            Exit For
                        End If
                    Next
                End If
                If countmatch = 4 Then
                    If kindofpa = 1 Then
                        If whatpage > 30 Then
                            If blackline < blackline2 Then
                                xstart = 155
                                xstart2 = 190
                            End If
                            If blackline > blackline2 Then
                                xstart = 145
                                xstart2 = 180
                            End If
                        End If
                        If whatpage < 30 Then
                            xstart = 155
                            xstart2 = 190
                        End If
                    End If
                    If kindofpa = 2 Then
                        If whatpage < 30 Then
                            xstart = 125
                            xstart2 = 150
                        End If
                        If whatpage > 30 Then
                            If blackline < blackline2 Then
                                xstart = 125
                                xstart2 = 150
                            End If
                            If blackline > blackline2 Then
                                xstart = 145
                                xstart2 = 170
                            End If
                        End If
                    End If
                End If
                If countmatch = 4 Then
                    For xNewim = xstart To xstart2
                        For yNewim = ytop To ytop + 28
                            If ytop + 28 < mainheight - 1 Then
                                c = newimMain.GetPixel(xNewim, yNewim)
                                If c.R <= 5 Then
                                    If xNewim = xstart Then
                                        countmatch = 5
                                        Exit For
                                    Else
                                        countn = countn + 1
                                        If countn = 1 Then
                                            ymainpoint = yNewim
                                            xmainpoint = xNewim
                                        End If
                                    End If
                                End If
                            End If
                        Next
                        If countmatch <> 4 Then
                            Exit For
                        End If
                    Next
                End If
                If countmatch = 5 Then
                    If kindofpa = 1 Then
                        If whatpage > 30 Then
                            If blackline < blackline2 Then
                                xstart = 165
                                xstart2 = 200
                            End If
                            If blackline > blackline2 Then
                                xstart = 155
                                xstart2 = 190
                            End If
                        End If
                        If whatpage < 30 Then
                            xstart = 165
                            xstart2 = 200
                        End If
                    End If
                    If kindofpa = 2 Then
                        If whatpage > 30 Then
                            If blackline < blackline2 Then
                                xstart = 115
                                xstart2 = 140
                            End If
                            If blackline > blackline2 Then
                                xstart = 135
                                xstart2 = 160
                            End If
                        End If
                        If whatpage < 30 Then
                            xstart = 115
                            xstart2 = 140
                        End If
                    End If
                End If
                If countmatch = 5 Then
                    For xNewim = xstart To xstart2
                        For yNewim = ytop To ytop + 28
                            If ytop + 28 < mainheight - 1 Then
                                c = newimMain.GetPixel(xNewim, yNewim)
                                If c.R <= 5 Then
                                    countn = countn + 1
                                    If countn = 1 Then
                                        ymainpoint = yNewim
                                        xmainpoint = xNewim
                                    End If
                                End If
                            End If
                        Next
                    Next
                End If

                count = 0
                For xNewim = xstart To xstart2
                    For yNewim = ymainpoint - 2 To ymainpoint + 5
                        c = newimMain.GetPixel(xNewim, yNewim)
                        If c.R <= 5 Then
                            count = count + 1
                            c = newimMain.GetPixel(xNewim + 2, yNewim)
                            If c.R <= 5 Then
                                If count = 1 Then
                                    Pointx = xNewim
                                    Exit For
                                End If
                            Else
                                count = 0
                            End If
                        End If
                    Next
                    If count = 1 Then
                        Exit For
                    End If
                Next

                Dim pointArgx As Integer = Pointx

                xPlace = 0
                If pointArgx = 0 Or pointArgx < xmainpoint Then
                    pointArgx = xmainpoint
                End If

                newPointx = pointArgx - 2

                '------------------------------------------------------------
                '--------------------Find First Number in Pic----------------
                '------------------------------------------------------------

                count = 0
                If whatpage > 30 Then
                    If countheight = 0 Then
                        For ax = newPointx To newPointx - 50 Step -1
                            c = newimMain.GetPixel(ax, ymainpoint)
                            If c.R <= 5 Then
                                count = count + 1
                                If count = 1 Then
                                    linefor = ax
                                    count = 0
                                    For ax2 = linefor To linefor - 50 Step -1
                                        c = newimMain.GetPixel(ax2, ymainpoint)
                                        If c.R >= 250 Then
                                            count = count + 1
                                            If count = 1 Then
                                                NummainP = ax2
                                                Exit For
                                            End If
                                        End If
                                    Next
                                End If
                            End If
                            'MessageBox.Show(NummainP)
                            If count = 1 Then
                                Exit For
                            End If
                        Next
                        blackline3 = 0
                        count = 0
                        whatnumSt = yinit - 10
                        For ax = 0 To 200
                            c = newimMain.GetPixel(ax, ymainpoint)
                            If c.R <= 5 Then
                                If ax - 2 >= 0 Then
                                    axST = ax - 2
                                Else
                                    axST = 0
                                End If
                                For ax2 = axST To ax + 2
                                    For by2 = ymainpoint To ymainpoint + 40
                                        c = newimMain.GetPixel(ax2, by2)
                                        If c.R <= 5 Then
                                            blackline3 = blackline3 + 1
                                        End If
                                    Next
                                    If blackline3 >= 32 Then
                                        Exit For
                                    Else
                                        blackline3 = 0
                                    End If
                                Next
                                If blackline3 >= 32 Then
                                    count = count + 1
                                    If count = 1 Then
                                        NummainP2 = ax
                                        Exit For
                                    End If
                                Else
                                    NummainP2 = 0
                                    Exit For
                                End If
                            End If
                        Next
                        count = 0
                        For by = whatnumSt + 15 To whatnumSt + 50
                            For ax = NummainP2 + 40 To NummainP - 10
                                c = newimMain.GetPixel(ax, by)
                                If c.R <= 5 Then
                                    count = count + 1
                                    If count = 1 Then
                                        maintopN = by
                                    End If
                                End If
                            Next
                        Next
                        If maintopN - 10 > 0 Then
                            maintopN = maintopN - 10
                            bmnumMH = 48
                        End If
                        If maintopN - 10 < 0 Then
                            maintopN = 0
                            bmnumMH = 40
                        End If
                        Dim bmnumMain As New Bitmap(22, bmnumMH)
                        Dim fr_rectS As New Rectangle(NummainP - 23, maintopN, 22, bmnumMH)
                        Dim to_rectS As New Rectangle(0, 0, 22, bmnumMH)
                        Dim grS As Graphics = Graphics.FromImage(bmnumMain)
                        grS.DrawImage(fr_imMain, to_rectS, fr_rectS, GraphicsUnit.Pixel)
                        bmnumMain.Save("c:\num1.bmp", System.Drawing.Imaging.ImageFormat.Bmp)
                        num1 = numberrecog(bmnumMain, count)

                        'MessageBox.Show(num1)

                        Dim fr_rectS2 As New Rectangle(NummainP - 46, maintopN, 22, bmnumMH)
                        Dim to_rectS2 As New Rectangle(0, 0, 22, bmnumMH)
                        Dim grS2 As Graphics = Graphics.FromImage(bmnumMain)
                        grS2.DrawImage(fr_imMain, to_rectS2, fr_rectS2, GraphicsUnit.Pixel)
                        bmnumMain.Save("c:\num2.bmp", System.Drawing.Imaging.ImageFormat.Bmp)
                        num2 = numberrecog(bmnumMain, count)

                        'MessageBox.Show(num2)
                        Order = num2 & num1
                        number3time = 0
                        For ax = NummainP - 48 To NummainP - 55 Step -1
                            c = newimMain.GetPixel(ax, maintopN + 10)
                            If c.R <= 5 Then
                                number3time = 1
                                Exit For
                            End If
                        Next
                        If number3time = 1 Then
                            Dim fr_rectS3 As New Rectangle(NummainP - 69, maintopN, 22, bmnumMH)
                            Dim to_rectS3 As New Rectangle(0, 0, 22, bmnumMH)
                            Dim grS3 As Graphics = Graphics.FromImage(bmnumMain)
                            grS3.DrawImage(fr_imMain, to_rectS3, fr_rectS3, GraphicsUnit.Pixel)
                            bmnumMain.Save("c:\num3.bmp", System.Drawing.Imaging.ImageFormat.Bmp)
                            num3 = numberrecog(bmnumMain, count)
                            If num3 = 15 Then
                                num3 = numberrecogRE(bmnumMain, count)
                            End If
                            Order = num3 & num2 & num1

                            Dim xlsApppage As New Excel.Application
                            Try
                                xlsApppage.Workbooks.Open("c:\" & subject & "-" & Me.TextBox1.Text & ".xls")
                            Catch er As Exception
                                MessageBox.Show(er.Message())
                                TextBox1.Enabled = True
                                TextBox2.Enabled = True
                                Button1.Enabled = True
                                Button2.Enabled = True
                                Button3.Enabled = True
                                Button4.Enabled = True
                                CheckBox1.Enabled = True
                                Exit Function
                            End Try
                            Dim xlsSheet As Excel.Worksheet = xlsApppage.ActiveWorkbook.Sheets(1)
                            For WhereBegin = 50 To 1200
                                number = xlsSheet.Cells(WhereBegin, 2).value
                                If number = 0 Then
                                    endcount = WhereBegin - 1
                                    numberend = xlsSheet.Cells(endcount, 2).value
                                    idend = xlsSheet.Cells(endcount, 3).value
                                    Exit For
                                End If
                            Next
                            xlsApppage.ActiveWorkbook.Close(False)
                            xlsApppage.Quit()
                        End If
                    End If
                End If
                'MessageBox.Show(Order)

                '----------------------------------------------------------------
                '----------------------------------------------------------------
                '----------------------------------------------------------------

                count = 1
                For xNewim = newPointx To newPointx + 175 Step 22
                    'count = count + 1
                    If count = 2 Then
                        xNewim = xNewim + 1
                    End If
                    If count > 3 And count <= 5 Then
                        xNewim = xNewim - 1
                    End If
                    If count > 5 And count <= 6 Then
                        xNewim = xNewim
                    End If
                    If count = 7 Then
                        xNewim = xNewim - 1
                    End If
                    If count = 8 Then
                        xNewim = xNewim - 1
                    End If
                    If count = 6 Or count = 7 Then
                        numwidth = 21
                    Else
                        numwidth = 22
                    End If

                    If ytop - 10 > 0 Then
                        pointheight = ytop - 10
                    End If
                    If ytop - 10 < 0 Then
                        pointheight = 0
                    End If

                    Dim bmnum As New Bitmap(numwidth, 48)
                    Dim fr_rect1 As New Rectangle(xNewim, pointheight, numwidth, 48)
                    Dim to_rect1 As New Rectangle(xNewim - newPointx + 10 + xPlace, ytop - yscale + 80 + yPlace, numwidth, 48)
                    Dim to_rect11 As New Rectangle(0, 0, numwidth, 48)
                    Dim gr1 As Graphics = Graphics.FromImage(cm)
                    Dim gr11 As Graphics = Graphics.FromImage(bmnum)
                    gr1.DrawImage(fr_imMain, to_rect1, fr_rect1, GraphicsUnit.Pixel)
                    gr11.DrawImage(fr_imMain, to_rect11, fr_rect1, GraphicsUnit.Pixel)
                    xPlace = xPlace + 10
                    'xNewim = xNewim - 1
                    'idnum.Save("C:\zero.bmp", System.Drawing.Imaging.ImageFormat.Bmp)
                    If count = 1 Then
                        p1 = numberrecog(bmnum, count)

                    End If
                    If count = 2 Then
                        p2 = numberrecog(bmnum, count)

                    End If
                    If count = 3 Then
                        p3 = numberrecog(bmnum, count)

                    End If
                    If count = 4 Then
                        p4 = numberrecog(bmnum, count)

                    End If
                    If count = 5 Then
                        p5 = numberrecog(bmnum, count)

                    End If
                    If count = 6 Then
                        p6 = numberrecog(bmnum, count)

                    End If
                    If count = 7 Then
                        p7 = numberrecog(bmnum, count)

                    End If
                    If count = 8 Then
                        p8 = numberrecog(bmnum, count)

                    End If
                    If count = 2 Then
                        xNewim = xNewim - 1
                    End If
                    count = count + 1
                Next xNewim
                yPlace = yPlace + 25
                xPlace = 0
                yinit = ytop + 60
                'ListBox1.Items.Add(p1 & p2 & p3 & p4 & p5 & p6 & p7 & p8)
                IDnumber = p1 & p2 & p3 & p4 & p5 & p6 & p7 & p8
                Try
                    wrongID = IDcompareTOexcel(Order, begin, whatpage, IDnumber, countheight, subject)
                Catch er As Exception
                    MessageBox.Show(er.Message())
                    TextBox1.Enabled = True
                    TextBox2.Enabled = True
                    Button1.Enabled = True
                    Button2.Enabled = True
                    Button3.Enabled = True
                    Button4.Enabled = True
                    CheckBox1.Enabled = True
                    Exit Function
                End Try
                wrongIDsum = wrongIDsum + wrongID
                If whatpage < 30 Then
                    If countheight = numberbotM - 1 Then
                        Exit For
                    End If
                End If
                If countheight >= 44 Then
                    If yinit + 40 > mainheight Then
                        Exit For
                    End If
                End If

                IDcomEnd = IDnumber.CompareTo(idend)
                If IDcomEnd = 0 Then
                    Exit For
                End If
            Next

            '--------------------------------------------------------'
            '-------------------------Grade--------------------------'
            '--------------------------------------------------------'
            ProgressBar1.Value = 0
            count = 0
            If whatpage < 30 Then
                If kindofpa = 1 Then
                    If numberbotM = 17 Then
                        yinit = 1865
                    Else
                        yinit = 1835
                    End If
                End If
                If kindofpa = 2 Then
                    yinit = 1865
                End If
            End If
            If whatpage >= 30 Then
                If kindofpa = 1 Then
                    yinit = 15
                End If
                If kindofpa = 2 Then
                    For by = 0 To 80
                        c = newimMain.GetPixel(2080, by)
                        If c.R <= 5 Then
                            count = count + 1
                            If count = 1 Then
                                yinit = by
                                Exit For
                            End If
                        End If
                    Next
                    'MessageBox.Show(yinit)
                    If yinit <> 0 Then
                        yinit = yinit + 10
                    End If
                    If yinit = 0 Then
                        c = newimMain.GetPixel(2080, 0)
                        If c.R <= 5 Then
                            yinit = yinit + 10
                        Else
                            yinit = 0
                        End If
                    End If
                End If
            End If
            'MessageBox.Show(yinit)
            countmatch = 1
            For countheight = 0 To progressV
                ProgressBar1.Value = (countheight * 100) / progressV
                Label6.Text = "Grade Recognition"
                Label6.Refresh()
                If whatpage < 30 Then
                    yNewim1 = yinit
                    yNewim2 = yNewim1 + 50
                    yscale = 1865
                End If
                If whatpage >= 30 Then
                    yNewim1 = yinit
                    yNewim2 = yNewim1 + 50
                    yscale = 15
                End If
                If yNewim2 > newimMain.Height Then
                    Exit For
                End If

                If countmatch = 1 Then
                    If kindofpa = 1 Or (kindofpa = 2 And whatpage > 30 And blackline < blackline2) Or ((kindofpa = 2 Or kindofpa = 1) And whatpage < 30) Then
                        xstart = mainwidth - 115
                        xstart2 = mainwidth - 40
                    End If
                    If kindofpa = 2 And blackline > blackline2 And whatpage > 30 Then
                        xstart = mainwidth - 85
                        xstart2 = mainwidth - 20
                    End If
                End If
                'MessageBox.Show(xstart & xstart2)
                blackline3 = 0
                If countmatch = 1 Then
                    countgrade = 0
                    For yNewim = yNewim1 To yNewim2
                        For xNewim = xstart To xstart2
                            c = newimMain.GetPixel(xNewim, yNewim)
                            If c.R <= 5 Then
                                If xNewim = xstart Or xNewim = xstart2 Then
                                    If xNewim = xstart2 Then
                                        countmatch = 2
                                        Exit For
                                    End If
                                Else
                                    If yNewim + 40 >= mainheight - 1 Then
                                        by2 = newimMain.Height - 1
                                    Else
                                        by2 = yNewim + 40
                                    End If
                                    For ax = xNewim - 2 To xNewim + 2
                                        For by = yNewim To by2
                                            c = newimMain.GetPixel(ax, by)
                                            If c.R <= 5 Then
                                                blackline3 = blackline3 + 1
                                            End If
                                        Next
                                        If blackline3 >= 32 Then
                                            countmatch = 2
                                            Exit For
                                        Else
                                            blackline3 = 0
                                        End If
                                    Next
                                    If countmatch <> 1 Then
                                        Exit For
                                    End If
                                    countgrade = countgrade + 1
                                    If countgrade = 1 Then
                                        ytopgrade = yNewim
                                        countmatch = 1
                                    End If
                                End If
                            End If
                        Next
                        If countmatch <> 1 Then
                            Exit For
                        End If
                    Next
                End If
                If countmatch = 2 Then
                    countgrade = 0
                    If kindofpa = 1 Then
                        If whatpage > 30 Then
                            If blackline < blackline2 Then
                                xstart = mainwidth - 105
                                xstart2 = mainwidth - 30
                            End If
                            If blackline > blackline2 Then
                                xstart = mainwidth - 125
                                xstart2 = mainwidth - 50
                            End If
                        End If
                        If whatpage < 30 Then
                            xstart = mainwidth - 105
                            xstart2 = mainwidth - 30
                        End If
                    End If
                    If kindofpa = 2 Then
                        If whatpage > 30 Then
                            If blackline < blackline2 Then
                                xstart = mainwidth - 120
                                xstart2 = mainwidth - 50
                            End If
                            If blackline > blackline2 Then
                                xstart = mainwidth - 95
                                xstart2 = mainwidth - 30
                            End If
                        End If
                        If whatpage < 30 Then
                            xstart = mainwidth - 120
                            xstart2 = mainwidth - 50
                        End If
                    End If
                    For yNewim = yNewim1 To yNewim2
                        For xNewim = xstart To xstart2
                            c = newimMain.GetPixel(xNewim, yNewim)
                            If c.R <= 5 Then
                                If xNewim = xstart Or xNewim = xstart2 Then
                                    countmatch = 3
                                    Exit For
                                Else
                                    countgrade = countgrade + 1
                                    If countgrade = 1 Then
                                        ytopgrade = yNewim
                                        countmatch = 2
                                    End If
                                End If
                            End If
                        Next
                        If countmatch <> 2 Then
                            Exit For
                        End If
                    Next
                End If
                If countmatch = 3 Then
                    countgrade = 0
                    If kindofpa = 1 Then
                        xstart = mainwidth - 95
                        xstart2 = mainwidth - 20
                    End If
                    If kindofpa = 2 Then
                        If whatpage < 30 Then
                            xstart = mainwidth - 130
                            xstart2 = mainwidth - 60
                        End If
                        If whatpage > 30 Then
                            If blackline < blackline2 Then
                                xstart = mainwidth - 130
                                xstart2 = mainwidth - 60
                            End If
                            If blackline > blackline2 Then
                                xstart = mainwidth - 105
                                xstart2 = mainwidth - 40
                            End If
                        End If
                    End If
                    For yNewim = yNewim1 To yNewim2
                        For xNewim = xstart To xstart2
                            c = newimMain.GetPixel(xNewim, yNewim)
                            If c.R <= 5 Then
                                If xNewim = xstart Or xNewim = xstart2 Then
                                    countmatch = 4
                                    Exit For
                                Else
                                    countgrade = countgrade + 1
                                    If countgrade = 1 Then
                                        ytopgrade = yNewim
                                        countmatch = 3
                                    End If
                                End If
                            End If
                        Next
                        If countmatch <> 3 Then
                            Exit For
                        End If
                    Next
                End If
                If countmatch = 4 Then
                    countgrade = 0
                    If kindofpa = 1 Then
                        xstart = mainwidth - 85
                        xstart2 = mainwidth - 10
                    End If
                    If kindofpa = 2 Then
                        If whatpage < 30 Then
                            xstart = mainwidth - 130
                            xstart2 = mainwidth - 70
                        End If
                        If whatpage > 30 Then
                            If blackline < blackline2 Then
                                xstart = mainwidth - 130
                                xstart2 = mainwidth - 70
                            End If
                            If blackline > blackline2 Then
                                xstart = mainwidth - 115
                                xstart2 = mainwidth - 50
                            End If
                        End If
                    End If
                    For yNewim = yNewim1 To yNewim2
                        For xNewim = xstart To xstart2
                            c = newimMain.GetPixel(xNewim, yNewim)
                            If c.R <= 5 Then
                                countgrade = countgrade + 1
                                If countgrade = 1 Then
                                    ytopgrade = yNewim
                                    countmatch = 4
                                End If
                            End If
                        Next
                        If countgrade = 1 Then
                            Exit For
                        End If
                    Next
                End If

                yPlace = 0
                countgrade = 0
                xrightgrade = 0
                xleftgrade = 0
                'MessageBox.Show(countmatch)
                If countmatch = 1 Then
                    If kindofpa = 1 Or (kindofpa = 2 And whatpage > 30 And blackline < blackline2) Or ((kindofpa = 2 Or kindofpa = 1) And whatpage < 30) Then
                        xstart = mainwidth - 115
                        xstart2 = mainwidth - 40
                    End If
                    If kindofpa = 2 And blackline > blackline2 And whatpage > 30 Then
                        xstart = mainwidth - 85
                        xstart2 = mainwidth - 20
                    End If
                End If
                If countmatch = 1 Then
                    For xNewim = xstart To xstart2
                        For ystep = ytopgrade To ytopgrade + 30
                            If ytopgrade + 30 <= mainheight + 10 Then
                                c = newimMain.GetPixel(xNewim, ystep)
                                If c.R <= 5 Then
                                    If xNewim = xstart Or xNewim = xstart2 Then
                                        If xNewim = xstart2 Then
                                            For by = ytopgrade To ytopgrade + 40
                                                c = newimMain.GetPixel(xstart2 + 2, by)
                                                If c.R <= 5 Then
                                                    blackRim = blackRim + 1
                                                    If blackRim > 32 Then
                                                        countmatch = 2
                                                        Exit For
                                                    End If
                                                End If
                                            Next
                                        End If
                                        If xNewim = xstart Then
                                            countmatch = 2
                                            Exit For
                                        End If
                                    Else
                                        countgrade = countgrade + 1
                                        If countgrade = 1 Then
                                            c = newimMain.GetPixel(xNewim + 2, ystep)
                                            If c.R >= 250 Then
                                                countgrade = 0
                                            End If
                                        End If
                                        If countgrade = 1 Then
                                            xleftgrade = xNewim
                                        End If
                                        If xrightgrade <= xNewim Then
                                            xrightgrade = xNewim
                                        End If
                                    End If
                                End If
                            End If
                        Next
                        If countmatch <> 1 Then
                            Exit For
                        End If
                    Next
                End If

                'MessageBox.Show(xleftgrade & xrightgrade)
                If countmatch = 2 Then
                    If kindofpa = 1 Then
                        If whatpage > 30 Then
                            If blackline < blackline2 Then
                                xstart = mainwidth - 105
                                xstart2 = mainwidth - 30
                            End If
                            If blackline > blackline2 Then
                                xstart = mainwidth - 125
                                xstart2 = mainwidth - 50
                            End If
                        End If
                        If whatpage < 30 Then
                            xstart = mainwidth - 105
                            xstart2 = mainwidth - 30
                        End If
                    End If
                    If kindofpa = 2 Then
                        If whatpage > 30 Then
                            If blackline < blackline2 Then
                                xstart = mainwidth - 120
                                xstart2 = mainwidth - 50
                            End If
                            If blackline > blackline2 Then
                                xstart = mainwidth - 95
                                xstart2 = mainwidth - 30
                            End If
                        End If
                        If whatpage < 30 Then
                            xstart = mainwidth - 120
                            xstart2 = mainwidth - 50
                        End If
                    End If
                    countgrade = 0
                End If
                If countmatch = 2 Then
                    For xNewim = xstart To xstart2
                        For ystep = ytopgrade To ytopgrade + 30
                            If ytopgrade + 30 <= mainheight + 10 Then
                                c = newimMain.GetPixel(xNewim, ystep)
                                If c.R <= 5 Then
                                    If xNewim = xstart Or xNewim = xstart2 Then
                                        If xNewim = xstart2 Then
                                            For by = ytopgrade To ytopgrade + 40
                                                c = newimMain.GetPixel(xstart2 + 2, by)
                                                If c.R <= 5 Then
                                                    blackRim = blackRim + 1
                                                    If blackRim > 32 Then
                                                        countmatch = 3
                                                        Exit For
                                                    End If
                                                End If
                                            Next
                                        End If
                                        If xNewim = xstart Then
                                            countmatch = 3
                                            Exit For
                                        End If
                                    Else
                                        countgrade = countgrade + 1
                                        If countgrade = 1 Then
                                            c = newimMain.GetPixel(xNewim + 2, ystep)
                                            If c.R >= 250 Then
                                                countgrade = 0
                                            End If
                                        End If
                                        If countgrade = 1 Then
                                            xleftgrade = xNewim
                                        End If
                                        If xrightgrade <= xNewim Then
                                            xrightgrade = xNewim
                                        End If
                                    End If
                                End If
                            End If
                        Next
                        If countmatch <> 2 Then
                            Exit For
                        End If
                    Next
                End If
                If countmatch = 3 Then
                    If kindofpa = 1 Then
                        xstart = mainwidth - 95
                        xstart2 = mainwidth - 20
                    End If
                    If kindofpa = 2 Then
                        If whatpage < 30 Then
                            xstart = mainwidth - 130
                            xstart2 = mainwidth - 60
                        End If
                        If whatpage > 30 Then
                            If blackline < blackline2 Then
                                xstart = mainwidth - 130
                                xstart2 = mainwidth - 60
                            End If
                            If blackline > blackline2 Then
                                xstart = mainwidth - 105
                                xstart2 = mainwidth - 40
                            End If
                        End If
                    End If
                    countgrade = 0
                End If
                If countmatch = 3 Then
                    For xNewim = xstart To xstart2
                        For ystep = ytopgrade To ytopgrade + 30
                            If ytopgrade + 30 <= mainheight - 1 Then
                                c = newimMain.GetPixel(xNewim, ystep)
                                If c.R <= 5 Then
                                    If xNewim = xstart Or xNewim = xstart2 Then
                                        If xNewim = xstart2 Then
                                            For by = ytopgrade To ytopgrade + 40
                                                c = newimMain.GetPixel(xstart2 + 2, by)
                                                If c.R <= 5 Then
                                                    blackRim = blackRim + 1
                                                    If blackRim > 32 Then
                                                        countmatch = 4
                                                        Exit For
                                                    End If
                                                End If
                                            Next
                                        End If
                                        If xNewim = xstart Then
                                            countmatch = 4
                                            Exit For
                                        End If
                                    Else
                                        countgrade = countgrade + 1
                                        If countgrade = 1 Then
                                            c = newimMain.GetPixel(xNewim + 2, ystep)
                                            If c.R >= 250 Then
                                                countgrade = 0
                                            End If
                                        End If
                                        If countgrade = 1 Then
                                            xleftgrade = xNewim
                                        End If
                                        If xrightgrade <= xNewim Then
                                            xrightgrade = xNewim
                                        End If
                                    End If
                                End If
                            End If
                        Next
                        If countmatch <> 3 Then
                            Exit For
                        End If
                    Next
                End If
                If countmatch = 4 Then
                    If kindofpa = 1 Then
                        xstart = mainwidth - 85
                        xstart2 = mainwidth - 10
                    End If
                    If kindofpa = 2 Then
                        If whatpage < 30 Then
                            xstart = mainwidth - 130
                            xstart2 = mainwidth - 70
                        End If
                        If whatpage > 30 Then
                            If blackline < blackline2 Then
                                xstart = mainwidth - 130
                                xstart2 = mainwidth - 70
                            End If
                            If blackline > blackline2 Then
                                xstart = mainwidth - 115
                                xstart2 = mainwidth - 50
                            End If
                        End If
                    End If
                    countgrade = 0
                End If
                If countmatch = 4 Then
                    For xNewim = xstart To xstart2
                        For ystep = ytopgrade To ytopgrade + 30
                            If ytopgrade + 30 <= mainheight - 1 Then
                                c = newimMain.GetPixel(xNewim, ystep)
                                If c.R <= 5 Then
                                    countgrade = countgrade + 1
                                    If countgrade = 1 Then
                                        c = newimMain.GetPixel(xNewim + 2, ystep)
                                        If c.R >= 250 Then
                                            countgrade = 0
                                        End If
                                    End If
                                    If countgrade = 1 Then
                                        xleftgrade = xNewim
                                    End If
                                    If xrightgrade <= xNewim Then
                                        xrightgrade = xNewim
                                    End If
                                End If
                            End If
                        Next
                    Next
                End If

                gradeheight = 0
                'MessageBox.Show(xrightgrade - xleftgrade)
                If xrightgrade - xleftgrade <= 35 Then
                    gradewidth = 50
                Else
                    For ystep = ytopgrade To ytopgrade + 30
                        If ytopgrade + 30 <= mainheight - 1 Then
                            For xNewim = xrightgrade - 18 To xrightgrade
                                c = newimMain.GetPixel(xNewim, ystep)
                                If c.R <= 5 Then
                                    If ybottomgrade <= ystep Then
                                        If ybottomgrade <> ystep Then
                                            gradeheight = gradeheight + 1
                                        End If
                                        ybottomgrade = ystep
                                    End If
                                End If
                            Next
                        End If
                    Next
                    If gradeheight < 21 Then
                        gradewidth2 = 20
                        gradewidth = (xrightgrade - xleftgrade) - 18 + 10
                    Else
                        gradewidth2 = (xrightgrade - xleftgrade) - 18
                        gradewidth = (xrightgrade - xleftgrade) - gradewidth2 + 10
                    End If
                End If

                pointheight = ytopgrade - 10

                Dim bmal As New Bitmap(gradewidth, 48)
                Dim fr_rect2 As New Rectangle(xleftgrade - 10, pointheight, gradewidth, 48)
                Dim to_rect2 As New Rectangle(300, ytopgrade - yscale + 80 + yPlace, gradewidth, 48)
                Dim to_rect22 As New Rectangle(0, 0, gradewidth, 48)
                Dim gr2 As Graphics = Graphics.FromImage(cm)
                Dim gr22 As Graphics = Graphics.FromImage(bmal)
                gr2.DrawImage(fr_imMain, to_rect2, fr_rect2, GraphicsUnit.Pixel)
                gr22.DrawImage(fr_imMain, to_rect22, fr_rect2, GraphicsUnit.Pixel)
                poal1 = alpharecog1(bmal)

                If xrightgrade - xleftgrade > 35 Then
                    Dim bmal2 As New Bitmap(gradewidth2 + 5, 48)
                    Dim fr_rect21 As New Rectangle(xrightgrade - gradewidth2, pointheight, gradewidth2 + 5, 48)
                    Dim to_rect21 As New Rectangle(350, ytopgrade - yscale + 80 + yPlace, gradewidth2 + 5, 48)
                    Dim to_rectpo2 As New Rectangle(0, 0, gradewidth + 5, 48)
                    Dim gr21 As Graphics = Graphics.FromImage(cm)
                    Dim grpo2 As Graphics = Graphics.FromImage(bmal2)
                    gr21.DrawImage(fr_imMain, to_rect21, fr_rect21, GraphicsUnit.Pixel)
                    grpo2.DrawImage(fr_imMain, to_rectpo2, fr_rect21, GraphicsUnit.Pixel)
                    poal2 = alpharecog2(bmal2)
                End If
                If xrightgrade - xleftgrade > 35 Then
                    'ListBox1.Items.Add(poal1 & poal2)
                    grade = poal1 & poal2
                Else
                    'ListBox1.Items.Add(poal1)
                    grade = poal1
                End If
                Try
                    wrongGrade = GradeCompareTOexcel(Order, begin, subject, whatpage, grade, countheight)
                Catch er As Exception
                    MessageBox.Show(er.Message())
                    TextBox1.Enabled = True
                    TextBox2.Enabled = True
                    Button1.Enabled = True
                    Button2.Enabled = True
                    Button3.Enabled = True
                    Button4.Enabled = True
                    CheckBox1.Enabled = True
                    Exit Function
                End Try
                wrongGradesum = wrongGradesum + wrongGrade
                yPlace = yPlace + 20
                'yNewim = yNewim + 3
                yinit = ytopgrade + 60
                If whatpage < 30 Then
                    If countheight = numberbotM - 1 Then
                        Exit For
                    End If
                End If
                If countheight >= 44 Then
                    If yinit + 40 > mainheight Then
                        Exit For
                    End If
                End If
            Next

            cm.Save("C:\white.bmp", System.Drawing.Imaging.ImageFormat.Bmp)
            '--------------------Display the results.--------------------
            'MyImage = to_bm

            If page = 40 Then
                wrongSum = wrongIDsum + wrongGradesum
                If wrongSum <> 0 Then
                    MessageBox.Show("Not Match")
                End If
                If wrongSum = 0 Then
                    MessageBox.Show("Match")
                End If
                TextBox1.Enabled = True
                TextBox2.Enabled = True
                Button1.Enabled = True
                Button2.Enabled = True
                Button3.Enabled = True
                Button4.Enabled = True
                CheckBox1.Enabled = True
            End If
            If page <> 40 Then
                wrongSum = wrongIDsum + wrongGradesum
                IDcomEnd = IDnumber.CompareTo(idend)
                If IDcomEnd = 0 Then
                    If wrongSum <> 0 Then
                        MessageBox.Show("Not Match")
                    End If
                    If wrongSum = 0 Then
                        MessageBox.Show("Match")
                    End If
                    TextBox1.Enabled = True
                    TextBox2.Enabled = True
                    Button1.Enabled = True
                    Button1.Enabled = True
                    Button2.Enabled = True
                    Button3.Enabled = True
                    Button4.Enabled = True
                    CheckBox1.Enabled = True
                    ProgressBar1.Value = 0
                    Label6.Text = ""
                    Label6.Refresh()
                    Exit For
                End If
            End If
            'System.IO.File.Move("c:\cropim1.bmp", "g:\cropim1.bmp")

            ProgressBar1.Value = 0
            Label6.Text = ""
            If page <> 40 Then
                Label7.Text = "page" & page + 1
                Label7.Refresh()
                Label6.Text = ""
                Label6.Refresh()
            End If
            If page = 1 Or page = 40 Then
                TextBox2.Text = subject
            End If
            If page = 40 Then
                Exit For
            End If
        Next
    End Function

    Private Function numberrecog(ByVal bmnum As Bitmap, ByRef count As Integer) As Integer
        'Dim numim = Image.FromFile("C:\zero.bmp")
        'Dim bmnum As Bitmap = numim
        Dim numbase As New Bitmap(18, 28)
        Dim po, range, range2, numberheight, numberwidth, xnew, ynew, x, y, x0, y0, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8, x9, y9, xmaxnum, ymaxnum, pointright, pointbottom, blackpoint, blackpoint2 As Integer
        Dim blackfirst3, blackfirst4, xinit, blackfirst, blackfirst2, blackcut0, blackcut00, blackcut000, blackcut3, blackcut5, blackcut55, blackcut6, blackcut66, blackcut8, blackcut88, blackcut888, blackcut9, blackpoint3, blackpoint4 As Integer
        Dim countv, counttext, countal, blacknumber0, blacknumber2, blacknumber22, blacknumber3, blacknumber4, blacknumber5, blacknumber6, blacknumber7, blacknumber8, blacknumber9 As Integer
        Dim c As New Color
        Dim eq_color As Color = Color.White
        Dim ne_color As Color = Color.Black
        xmaxnum = bmnum.Width - 1
        ymaxnum = bmnum.Height - 1
        xinit = 0

        For y = 0 To bmnum.Height - 1 - 10
            c = bmnum.GetPixel(bmnum.Width - 1, y)
            If c.R <= 5 Then
                blackfirst = blackfirst + 1
            End If
            c = bmnum.GetPixel(0, y)
            If c.R <= 5 Then
                blackfirst3 = blackfirst3 + 1
            End If
        Next
        If blackfirst <> 0 Then
            For y = 0 To bmnum.Height - 1 - 10
                c = bmnum.GetPixel(bmnum.Width - 1 - 1, y)
                If c.R <= 5 Then
                    blackfirst2 = blackfirst2 + 1
                End If
            Next
            If blackfirst2 = 0 Then
                xmaxnum = xmaxnum - 1
            End If
            If blackfirst2 <> 0 Then
                For y = 0 To bmnum.Height - 1 - 10
                    c = bmnum.GetPixel(bmnum.Width - 1 - 1 - 1, y)
                    If c.R <= 5 Then
                        blackfirst4 = blackfirst4 + 1
                    End If
                Next
                If blackfirst4 = 0 Then
                    xmaxnum = xmaxnum - 2
                End If
            End If
        End If
        blackfirst2 = 0
        If blackfirst3 <> 0 Then
            For y = 0 To bmnum.Height - 1 - 10
                c = bmnum.GetPixel(1, y)
                If c.R <= 5 Then
                    blackfirst2 = blackfirst2 + 1
                End If
            Next
            If blackfirst2 = 0 Then
                xinit = 1
            End If
        End If

        blackfirst = 0
        blackfirst2 = 0
        For x = 0 To bmnum.Width - 1
            c = bmnum.GetPixel(x, bmnum.Height - 1)
            If c.R <= 5 Then
                blackfirst = blackfirst + 1
            End If
        Next
        If blackfirst <> 0 Then
            For x = 0 To bmnum.Width - 1
                c = bmnum.GetPixel(x, bmnum.Height - 1 - 1)
                If c.R <= 5 Then
                    blackfirst2 = blackfirst2 + 1
                End If
            Next
            If blackfirst2 = 0 Then
                ymaxnum = ymaxnum - 1
            End If
        End If
        countv = 0
        For x = xinit To xmaxnum
            For y = 0 To ymaxnum
                c = bmnum.GetPixel(x, y)
                If c.R <= 5 Then
                    If pointright <= x Then
                        countv = countv + 1
                        If pointright <> x Or (pointright = 0 And countv = 1) Then
                            numberwidth = numberwidth + 1
                        End If
                        pointright = x
                    End If
                End If
            Next
        Next
        For y1 = 0 To ymaxnum
            For x1 = xinit To xmaxnum
                c = bmnum.GetPixel(x1, y1)
                If c.R <= 5 Then
                    If pointbottom <= y1 Then
                        If pointbottom <> y1 Then
                            numberheight = numberheight + 1
                        End If
                        pointbottom = y1
                    End If
                End If
            Next
        Next
        If numberheight > 30 Then

        End If

        Dim fr_bmnum As New Bitmap(bmnum)
        Dim fr_rectnum As New Rectangle(pointright - numberwidth + 1, pointbottom - numberheight + 1, numberwidth, numberheight)
        Dim to_rectnum As New Rectangle(0, 0, numberwidth, numberheight)
        Dim grnum As Graphics = Graphics.FromImage(numbase)
        grnum.DrawImage(fr_bmnum, to_rectnum, fr_rectnum, GraphicsUnit.Pixel)
        'numbase.Save("C:\number.bmp", System.Drawing.Imaging.ImageFormat.Bmp)

        If numberwidth < 14 Then
            po = 1
            countal = countal + 1
        Else
            '------------------------0----------------------
            If countal = 0 Then
                Dim figure0 = Image.FromFile("c:\number0.tif")
                Dim bm0 As Bitmap = figure0
                Dim wid0 As Integer = Math.Min(numbase.Width, bm0.Width)
                Dim hgt0 As Integer = Math.Min(numbase.Height, bm0.Height)
                Dim bmdiff0 As New Bitmap(wid0, hgt0)
                Dim c0 As New Color
                For x0 = 0 To wid0 - 1
                    For y0 = 0 To hgt0 - 1
                        c0 = bm0.GetPixel(x0, y0)
                        c = numbase.GetPixel(x0, y0)
                        If c0.R >= c.R Then
                            If c0.R - c.R <= 5 Then
                                bmdiff0.SetPixel(x0, y0, eq_color)
                            Else
                                bmdiff0.SetPixel(x0, y0, ne_color)
                            End If
                        Else
                            If c.R - c0.R <= 5 Then
                                bmdiff0.SetPixel(x0, y0, eq_color)
                            Else
                                bmdiff0.SetPixel(x0, y0, ne_color)
                            End If
                        End If
                    Next y0
                Next x0
                For x0 = 0 To wid0 - 1
                    For y0 = 0 To hgt0 - 1
                        c = bmdiff0.GetPixel(x0, y0)
                        If c.R = 0 And c.G = 0 And c.B = 0 Then
                            blacknumber0 = blacknumber0 + 1
                        End If
                    Next
                Next
                If blacknumber0 < 115 Then
                    For x0 = 0 To wid0 - 1
                        For y0 = 0 To 14
                            c = bmdiff0.GetPixel(x0, y0)
                            If c.R = 0 And c.G = 0 And c.B = 0 Then
                                blackcut0 = blackcut0 + 1
                            End If
                        Next
                    Next
                    If blackcut0 < 60 Then
                        For x0 = 0 To wid0 - 1
                            For y0 = hgt0 - 14 To hgt0 - 1
                                c = bmdiff0.GetPixel(x0, y0)
                                If c.R = 0 And c.G = 0 And c.B = 0 Then
                                    blackcut00 = blackcut00 + 1
                                End If
                            Next
                        Next
                        If blackcut00 < 65 Then
                            For x0 = 0 To wid0 - 1
                                For y0 = 12 To 18
                                    c = bmdiff0.GetPixel(x0, y0)
                                    If c.R <= 5 Then
                                        blackcut000 = blackcut000 + 1
                                    End If
                                Next
                            Next
                            If blackcut000 < 50 Then
                                po = 0
                                countal = countal + 1
                            End If
                        End If
                    End If
                End If
            End If
            '-------------------------2----------------------
            If countal = 0 Then
                Dim figure2 = Image.FromFile("c:\number2.tif")
                Dim bm2 As Bitmap = figure2
                Dim wid2 As Integer = Math.Min(numbase.Width, bm2.Width)
                Dim hgt2 As Integer = Math.Min(numbase.Height, bm2.Height)
                Dim bmdiff2 As New Bitmap(wid2, hgt2)
                Dim c2 As New Color
                For x2 = 0 To wid2 - 1
                    For y2 = 0 To hgt2 - 1
                        c2 = bm2.GetPixel(x2, y2)
                        c = numbase.GetPixel(x2, y2)
                        If c2.R >= c.R Then
                            If c2.R - c.R <= 5 Then
                                bmdiff2.SetPixel(x2, y2, eq_color)
                            Else
                                bmdiff2.SetPixel(x2, y2, ne_color)
                            End If
                        Else
                            If c.R - c2.R <= 5 Then
                                bmdiff2.SetPixel(x2, y2, eq_color)
                            Else
                                bmdiff2.SetPixel(x2, y2, ne_color)
                            End If
                        End If
                    Next y2
                Next x2
                For x2 = 0 To wid2 - 1
                    For y2 = 0 To hgt2 - 1
                        c = bmdiff2.GetPixel(x2, y2)
                        If c.R = 0 And c.G = 0 And c.B = 0 Then
                            blacknumber2 = blacknumber2 + 1
                        End If
                    Next
                Next
                If blacknumber2 < 145 Then
                    For x2 = 14 To 17
                        For y2 = 15 To 23
                            c = bmdiff2.GetPixel(x2, y2)
                            If c.R = 0 Then
                                blacknumber22 = blacknumber22 + 1
                            End If
                        Next
                    Next
                    If blacknumber22 < 20 Then
                        po = 2
                        countal = countal + 1
                    End If
                End If
            End If
            '--------------------------3--------------------------
            If countal = 0 Then
                Dim figure3 = Image.FromFile("c:\number3.tif")
                Dim bm3 As Bitmap = figure3
                Dim wid3 As Integer = Math.Min(numbase.Width, bm3.Width)
                Dim hgt3 As Integer = Math.Min(numbase.Height, bm3.Height)
                Dim bmdiff3 As New Bitmap(wid3, hgt3)
                Dim c3 As New Color
                For x3 = 0 To wid3 - 1
                    For y3 = 0 To hgt3 - 1
                        c3 = bm3.GetPixel(x3, y3)
                        c = numbase.GetPixel(x3, y3)
                        If c3.R >= c.R Then
                            If c3.R - c.R <= 5 Then
                                bmdiff3.SetPixel(x3, y3, eq_color)
                            Else
                                bmdiff3.SetPixel(x3, y3, ne_color)
                            End If
                        Else
                            If c.R - c3.R <= 5 Then
                                bmdiff3.SetPixel(x3, y3, eq_color)
                            Else
                                bmdiff3.SetPixel(x3, y3, ne_color)
                            End If
                        End If
                    Next y3
                Next x3
                For x3 = 0 To wid3 - 1
                    For y3 = 0 To hgt3 - 1
                        c = bmdiff3.GetPixel(x3, y3)
                        If c.R = 0 And c.G = 0 And c.B = 0 Then
                            blacknumber3 = blacknumber3 + 1
                        End If
                    Next
                Next
                If blacknumber3 < 110 Then
                    For x3 = 0 To 4
                        For y3 = 0 To hgt3 - 1
                            c = bmdiff3.GetPixel(x3, y3)
                            If c.R = 0 And c.G = 0 And c.B = 0 Then
                                blackcut3 = blackcut3 + 1
                            End If
                        Next
                    Next
                    If blackcut3 < 40 Then
                        po = 3
                        countal = countal + 1
                    End If
                End If
            End If
            '-------------------------4--------------------------
            If countal = 0 Then
                Dim figure4 = Image.FromFile("c:\number4.tif")
                Dim bm4 As Bitmap = figure4
                Dim wid4 As Integer = Math.Min(numbase.Width, bm4.Width)
                Dim hgt4 As Integer = Math.Min(numbase.Height, bm4.Height)
                Dim bmdiff4 As New Bitmap(wid4, hgt4)
                Dim c4 As New Color
                For x4 = 0 To wid4 - 1
                    For y4 = 0 To hgt4 - 1
                        c4 = bm4.GetPixel(x4, y4)
                        c = numbase.GetPixel(x4, y4)
                        If c4.R >= c.R Then
                            If c4.R - c.R <= 5 Then
                                bmdiff4.SetPixel(x4, y4, eq_color)
                            Else
                                bmdiff4.SetPixel(x4, y4, ne_color)
                            End If
                        Else
                            If c.R - c4.R <= 5 Then
                                bmdiff4.SetPixel(x4, y4, eq_color)
                            Else
                                bmdiff4.SetPixel(x4, y4, ne_color)
                            End If
                        End If
                    Next y4
                Next x4
                For x4 = 0 To wid4 - 1
                    For y4 = 0 To hgt4 - 1
                        c = bmdiff4.GetPixel(x4, y4)
                        If c.R = 0 And c.G = 0 And c.B = 0 Then
                            blacknumber4 = blacknumber4 + 1
                        End If
                    Next
                Next
                If blacknumber4 < 110 Then
                    po = 4
                    countal = countal + 1
                End If
            End If
            '---------------------------5--------------------------
            If countal = 0 Then
                Dim figure5 = Image.FromFile("c:\number5.tif")
                Dim bm5 As Bitmap = figure5
                Dim wid5 As Integer = Math.Min(numbase.Width, bm5.Width)
                Dim hgt5 As Integer = Math.Min(numbase.Height, bm5.Height)
                Dim bmdiff5 As New Bitmap(wid5, hgt5)
                Dim c5 As New Color
                For x5 = 0 To wid5 - 1
                    For y5 = 0 To hgt5 - 1
                        c5 = bm5.GetPixel(x5, y5)
                        c = numbase.GetPixel(x5, y5)
                        If c5.R >= c.R Then
                            If c5.R - c.R <= 5 Then
                                bmdiff5.SetPixel(x5, y5, eq_color)
                            Else
                                bmdiff5.SetPixel(x5, y5, ne_color)
                            End If
                        Else
                            If c.R - c5.R <= 5 Then
                                bmdiff5.SetPixel(x5, y5, eq_color)
                            Else
                                bmdiff5.SetPixel(x5, y5, ne_color)
                            End If
                        End If
                    Next y5
                Next x5
                For x5 = 0 To wid5 - 1
                    For y5 = 0 To hgt5 - 1
                        c = bmdiff5.GetPixel(x5, y5)
                        If c.R = 0 And c.G = 0 And c.B = 0 Then
                            blacknumber5 = blacknumber5 + 1
                        End If
                    Next
                Next
                If blacknumber5 < 110 Then
                    For x5 = 0 To 5
                        For y5 = 0 To hgt5 - 1
                            c = bmdiff5.GetPixel(x5, y5)
                            If c.R = 0 And c.G = 0 And c.B = 0 Then
                                blackcut5 = blackcut5 + 1
                            End If
                        Next
                    Next
                    If blackcut5 < 45 Then
                        For x5 = 0 To 5
                            For y5 = 15 To 19
                                c = bmdiff5.GetPixel(x5, y5)
                                If c.R = 0 Then
                                    blackcut55 = blackcut55 + 1
                                End If
                            Next
                        Next
                        If blackcut55 < 12 Then
                            po = 5
                            countal = countal + 1
                        End If
                    End If
                End If
            End If
            '--------------------------6----------------------------
            If countal = 0 Then
                Dim figure6 = Image.FromFile("c:\number6.tif")
                Dim bm6 As Bitmap = figure6
                Dim wid6 As Integer = Math.Min(numbase.Width, bm6.Width)
                Dim hgt6 As Integer = Math.Min(numbase.Height, bm6.Height)
                Dim bmdiff6 As New Bitmap(wid6, hgt6)
                Dim c6 As New Color
                For x6 = 0 To wid6 - 1
                    For y6 = 0 To hgt6 - 1
                        c6 = bm6.GetPixel(x6, y6)
                        c = numbase.GetPixel(x6, y6)
                        If c6.R >= c.R Then
                            If c6.R - c.R <= 5 Then
                                bmdiff6.SetPixel(x6, y6, eq_color)
                            Else
                                bmdiff6.SetPixel(x6, y6, ne_color)
                            End If
                        Else
                            If c.R - c6.R <= 5 Then
                                bmdiff6.SetPixel(x6, y6, eq_color)
                            Else
                                bmdiff6.SetPixel(x6, y6, ne_color)
                            End If
                        End If
                    Next y6
                Next x6
                For x6 = 0 To wid6 - 1
                    For y6 = 0 To hgt6 - 1
                        c = bmdiff6.GetPixel(x6, y6)
                        If c.R = 0 And c.G = 0 And c.B = 0 Then
                            blacknumber6 = blacknumber6 + 1
                        End If
                    Next
                Next
                If blacknumber6 < 110 Then
                    For x6 = 0 To 5
                        For y6 = 0 To hgt6 - 1
                            c = bmdiff6.GetPixel(x6, y6)
                            If c.R = 0 And c.G = 0 And c.B = 0 Then
                                blackcut6 = blackcut6 + 1
                            End If
                        Next
                    Next
                    If blackcut6 < 40 Then
                        For x6 = 0 To wid6 - 1
                            For y6 = 0 To 14
                                c = bmdiff6.GetPixel(x6, y6)
                                If c.R = 0 And c.G = 0 And c.B = 0 Then
                                    blackcut66 = blackcut66 + 1
                                End If
                            Next
                        Next
                        If blackcut66 < 60 Then
                            po = 6
                            countal = countal + 1
                        End If
                    End If
                End If
            End If
            '----------------------------7-------------------------
            If countal = 0 Then
                Dim figure7 = Image.FromFile("c:\number7.tif")
                Dim bm7 As Bitmap = figure7
                Dim wid7 As Integer = Math.Min(numbase.Width, bm7.Width)
                Dim hgt7 As Integer = Math.Min(numbase.Height, bm7.Height)
                Dim bmdiff7 As New Bitmap(wid7, hgt7)
                Dim c7 As New Color
                For x7 = 0 To wid7 - 1
                    For y7 = 0 To hgt7 - 1
                        c7 = bm7.GetPixel(x7, y7)
                        c = numbase.GetPixel(x7, y7)
                        If c7.R >= c.R Then
                            If c7.R - c.R <= 5 Then
                                bmdiff7.SetPixel(x7, y7, eq_color)
                            Else
                                bmdiff7.SetPixel(x7, y7, ne_color)
                            End If
                        Else
                            If c.R - c7.R <= 5 Then
                                bmdiff7.SetPixel(x7, y7, eq_color)
                            Else
                                bmdiff7.SetPixel(x7, y7, ne_color)
                            End If
                        End If
                    Next y7
                Next x7
                For x7 = 0 To wid7 - 1
                    For y7 = 0 To hgt7 - 1
                        c = bmdiff7.GetPixel(x7, y7)
                        If c.R = 0 And c.G = 0 And c.B = 0 Then
                            blacknumber7 = blacknumber7 + 1
                        End If
                    Next
                Next
                If blacknumber7 < 110 Then
                    po = 7
                    countal = countal + 1
                End If
            End If
            '----------------------8----------------------------
            If countal = 0 Then
                Dim figure8 = Image.FromFile("c:\number8.tif")
                Dim bm8 As Bitmap = figure8
                Dim wid8 As Integer = Math.Min(numbase.Width, bm8.Width)
                Dim hgt8 As Integer = Math.Min(numbase.Height, bm8.Height)
                Dim bmdiff8 As New Bitmap(wid8, hgt8)
                Dim c8 As New Color
                For x8 = 0 To wid8 - 1
                    For y8 = 0 To hgt8 - 1
                        c8 = bm8.GetPixel(x8, y8)
                        c = numbase.GetPixel(x8, y8)
                        If c8.R >= c.R Then
                            If c8.R - c.R <= 5 Then
                                bmdiff8.SetPixel(x8, y8, eq_color)
                            Else
                                bmdiff8.SetPixel(x8, y8, ne_color)
                            End If
                        Else
                            If c.R - c8.R <= 5 Then
                                bmdiff8.SetPixel(x8, y8, eq_color)
                            Else
                                bmdiff8.SetPixel(x8, y8, ne_color)
                            End If
                        End If
                    Next y8
                Next x8
                For x8 = 0 To wid8 - 1
                    For y8 = 0 To hgt8 - 1
                        c = bmdiff8.GetPixel(x8, y8)
                        If c.R = 0 And c.G = 0 And c.B = 0 Then
                            blacknumber8 = blacknumber8 + 1
                        End If
                    Next
                Next
                If blacknumber8 < 125 Then
                    For x8 = 0 To 4
                        For y8 = 0 To hgt8 - 1
                            c = bmdiff8.GetPixel(x8, y8)
                            If c.R = 0 And c.G = 0 And c.B = 0 Then
                                blackcut8 = blackcut8 + 1
                            End If
                        Next
                    Next
                    For x8 = 0 To 4
                        For y8 = 10 To 15
                            c = bmdiff8.GetPixel(x8, y8)
                            If c.R = 0 And c.G = 0 And c.B = 0 Then
                                blackcut88 = blackcut88 + 1
                            End If
                        Next
                    Next
                    If blackcut8 < 24 Or blackcut88 < 12 Then
                        For x8 = 13 To wid8 - 1
                            For y8 = 7 To 10
                                c = bmdiff8.GetPixel(x8, y8)
                                If c.R = 0 Then
                                    blackcut888 = blackcut888 + 1
                                End If
                            Next
                        Next
                        If blackcut888 < 8 Then
                            po = 8
                            countal = countal + 1
                        End If
                    End If
                End If
            End If
            '------------------------9------------------------
            If countal = 0 Then
                Dim figure9 = Image.FromFile("c:\number9.tif")
                Dim bm9 As Bitmap = figure9
                Dim wid9 As Integer = Math.Min(numbase.Width, bm9.Width)
                Dim hgt9 As Integer = Math.Min(numbase.Height, bm9.Height)
                Dim bmdiff9 As New Bitmap(wid9, hgt9)
                Dim c9 As New Color
                For x9 = 0 To wid9 - 1
                    For y9 = 0 To hgt9 - 1
                        c9 = bm9.GetPixel(x9, y9)
                        c = numbase.GetPixel(x9, y9)
                        If c9.R >= c.R Then
                            If c9.R - c.R <= 5 Then
                                bmdiff9.SetPixel(x9, y9, eq_color)
                            Else
                                bmdiff9.SetPixel(x9, y9, ne_color)
                            End If
                        Else
                            If c.R - c9.R <= 5 Then
                                bmdiff9.SetPixel(x9, y9, eq_color)
                            Else
                                bmdiff9.SetPixel(x9, y9, ne_color)
                            End If
                        End If
                    Next y9
                Next x9
                For x9 = 0 To wid9 - 1
                    For y9 = 0 To hgt9 - 1
                        c = bmdiff9.GetPixel(x9, y9)
                        If c.R <= 5 Then
                            blacknumber9 = blacknumber9 + 1
                        End If
                    Next
                Next
                If blacknumber9 < 135 Then
                    For x9 = 0 To wid9 - 1
                        For y9 = 12 To 18
                            c = bmdiff9.GetPixel(x9, y9)
                            If c.R <= 5 Then
                                blackcut9 = blackcut9 + 1
                            End If
                        Next
                    Next
                    If blackcut9 < 50 Then
                        po = 9
                        countal = countal + 1
                    End If
                End If
            End If
        End If
        '-----------------------if doesnt't match any pattern-----------------
        blackcut0 = 0
        blackcut00 = 0
        blackcut000 = 0
        blackcut3 = 0
        blackcut5 = 0
        blackcut55 = 0
        blackcut6 = 0
        blackcut66 = 0
        blackcut8 = 0
        blackcut88 = 0
        blackcut888 = 0
        blackcut9 = 0
        blacknumber0 = 0
        blacknumber2 = 0
        blacknumber3 = 0
        blacknumber4 = 0
        blacknumber5 = 0
        blacknumber6 = 0
        blacknumber7 = 0
        blacknumber8 = 0
        blacknumber9 = 0
        If countal = 0 Then
            'MessageBox.Show("case2")
            If numberheight > 28 Then
                For xnew = pointright - numberwidth + 1 To pointright
                    c = bmnum.GetPixel(xnew, pointbottom - numberheight + 1)
                    If c.R <= 5 Then
                        blackpoint = blackpoint + 1
                    End If
                    c = bmnum.GetPixel(xnew, pointbottom)
                    If c.R <= 5 Then
                        blackpoint2 = blackpoint2 + 1
                    End If
                Next
                If blackpoint >= blackpoint2 Then
                    numberheight = numberheight - 1
                    pointbottom = pointbottom - 1
                Else
                    numberheight = numberheight - 1
                End If
            End If

            If numberwidth > 18 Then
                For ynew = pointbottom - numberheight + 1 To pointbottom
                    c = bmnum.GetPixel(pointright, ynew)
                    If c.R <= 5 Then
                        blackpoint3 = blackpoint3 + 1
                    End If
                    c = bmnum.GetPixel(numberwidth - 1, ynew)
                    If c.R <= 5 Then
                        blackpoint4 = blackpoint4 + 1
                    End If
                Next
                If blackpoint3 >= blackpoint4 Then
                    numberwidth = numberwidth - 1
                    pointright = pointright + 1
                Else
                    numberwidth = numberwidth - 1
                End If
            End If

            Dim fr_bm2 As New Bitmap(bmnum)
            Dim fr_rect3 As New Rectangle(pointright - numberwidth + 1, pointbottom - numberheight + 1, numberwidth, numberheight)
            Dim to_rect3 As New Rectangle(0, 0, 18, 28)
            Dim gr2 As Graphics = Graphics.FromImage(numbase)
            gr2.DrawImage(fr_bm2, to_rect3, fr_rect3, GraphicsUnit.Pixel)
            numbase.Save("C:\number.bmp", System.Drawing.Imaging.ImageFormat.Bmp)

            '------------------------0----------------------
            If countal = 0 Then
                Dim figure0 = Image.FromFile("c:\number0.tif")
                Dim bm0 As Bitmap = figure0
                Dim wid0 As Integer = Math.Min(numbase.Width, bm0.Width)
                Dim hgt0 As Integer = Math.Min(numbase.Height, bm0.Height)
                Dim bmdiff0 As New Bitmap(wid0, hgt0)
                Dim c0 As New Color
                For x0 = 0 To wid0 - 1
                    For y0 = 0 To hgt0 - 1
                        c0 = bm0.GetPixel(x0, y0)
                        c = numbase.GetPixel(x0, y0)
                        If c0.R >= c.R Then
                            If c0.R - c.R <= 5 Then
                                bmdiff0.SetPixel(x0, y0, eq_color)
                            Else
                                bmdiff0.SetPixel(x0, y0, ne_color)
                            End If
                        Else
                            If c.R - c0.R <= 5 Then
                                bmdiff0.SetPixel(x0, y0, eq_color)
                            Else
                                bmdiff0.SetPixel(x0, y0, ne_color)
                            End If
                        End If
                    Next y0
                Next x0
                For x0 = 0 To wid0 - 1
                    For y0 = 0 To hgt0 - 1
                        c = bmdiff0.GetPixel(x0, y0)
                        If c.R = 0 And c.G = 0 And c.B = 0 Then
                            blacknumber0 = blacknumber0 + 1
                        End If
                    Next
                Next
                If blacknumber0 < 115 Then
                    For x0 = 0 To wid0 - 1
                        For y0 = 0 To 14
                            c = bmdiff0.GetPixel(x0, y0)
                            If c.R = 0 And c.G = 0 And c.B = 0 Then
                                blackcut0 = blackcut0 + 1
                            End If
                        Next
                    Next
                    If blackcut0 < 60 Then
                        For x0 = 0 To wid0 - 1
                            For y0 = hgt0 - 14 To hgt0 - 1
                                c = bmdiff0.GetPixel(x0, y0)
                                If c.R = 0 And c.G = 0 And c.B = 0 Then
                                    blackcut00 = blackcut00 + 1
                                End If
                            Next
                        Next
                        If blackcut00 < 65 Then
                            For x0 = 0 To wid0 - 1
                                For y0 = 12 To 18
                                    c = bmdiff0.GetPixel(x0, y0)
                                    If c.R <= 5 Then
                                        blackcut000 = blackcut000 + 1
                                    End If
                                Next
                            Next
                            If blackcut000 < 50 Then
                                po = 0
                                countal = countal + 1
                            End If
                        End If
                    End If
                End If
            End If
            '-------------------------2----------------------
            If countal = 0 Then
                Dim figure2 = Image.FromFile("c:\number2.tif")
                Dim bm2 As Bitmap = figure2
                Dim wid2 As Integer = Math.Min(numbase.Width, bm2.Width)
                Dim hgt2 As Integer = Math.Min(numbase.Height, bm2.Height)
                Dim bmdiff2 As New Bitmap(wid2, hgt2)
                Dim c2 As New Color
                For x2 = 0 To wid2 - 1
                    For y2 = 0 To hgt2 - 1
                        c2 = bm2.GetPixel(x2, y2)
                        c = numbase.GetPixel(x2, y2)
                        If c2.R >= c.R Then
                            If c2.R - c.R <= 5 Then
                                bmdiff2.SetPixel(x2, y2, eq_color)
                            Else
                                bmdiff2.SetPixel(x2, y2, ne_color)
                            End If
                        Else
                            If c.R - c2.R <= 5 Then
                                bmdiff2.SetPixel(x2, y2, eq_color)
                            Else
                                bmdiff2.SetPixel(x2, y2, ne_color)
                            End If
                        End If
                    Next y2
                Next x2
                For x2 = 0 To wid2 - 1
                    For y2 = 0 To hgt2 - 1
                        c = bmdiff2.GetPixel(x2, y2)
                        If c.R = 0 And c.G = 0 And c.B = 0 Then
                            blacknumber2 = blacknumber2 + 1
                        End If
                    Next
                Next
                If blacknumber2 < 145 Then
                    po = 2
                    countal = countal + 1
                End If
            End If
            '--------------------------3--------------------------
            If countal = 0 Then
                Dim figure3 = Image.FromFile("c:\number3.tif")
                Dim bm3 As Bitmap = figure3
                Dim wid3 As Integer = Math.Min(numbase.Width, bm3.Width)
                Dim hgt3 As Integer = Math.Min(numbase.Height, bm3.Height)
                Dim bmdiff3 As New Bitmap(wid3, hgt3)
                Dim c3 As New Color
                For x3 = 0 To wid3 - 1
                    For y3 = 0 To hgt3 - 1
                        c3 = bm3.GetPixel(x3, y3)
                        c = numbase.GetPixel(x3, y3)
                        If c3.R >= c.R Then
                            If c3.R - c.R <= 5 Then
                                bmdiff3.SetPixel(x3, y3, eq_color)
                            Else
                                bmdiff3.SetPixel(x3, y3, ne_color)
                            End If
                        Else
                            If c.R - c3.R <= 5 Then
                                bmdiff3.SetPixel(x3, y3, eq_color)
                            Else
                                bmdiff3.SetPixel(x3, y3, ne_color)
                            End If
                        End If
                    Next y3
                Next x3
                For x3 = 0 To wid3 - 1
                    For y3 = 0 To hgt3 - 1
                        c = bmdiff3.GetPixel(x3, y3)
                        If c.R = 0 And c.G = 0 And c.B = 0 Then
                            blacknumber3 = blacknumber3 + 1
                        End If
                    Next
                Next
                If blacknumber3 < 110 Then
                    For x3 = 0 To 4
                        For y3 = 0 To hgt3 - 1
                            c = bmdiff3.GetPixel(x3, y3)
                            If c.R = 0 And c.G = 0 And c.B = 0 Then
                                blackcut3 = blackcut3 + 1
                            End If
                        Next
                    Next
                    If blackcut3 < 40 Then
                        po = 3
                        countal = countal + 1
                    End If
                End If
            End If
            '-------------------------4--------------------------
            If countal = 0 Then
                Dim figure4 = Image.FromFile("c:\number4.tif")
                Dim bm4 As Bitmap = figure4
                Dim wid4 As Integer = Math.Min(numbase.Width, bm4.Width)
                Dim hgt4 As Integer = Math.Min(numbase.Height, bm4.Height)
                Dim bmdiff4 As New Bitmap(wid4, hgt4)
                Dim c4 As New Color
                For x4 = 0 To wid4 - 1
                    For y4 = 0 To hgt4 - 1
                        c4 = bm4.GetPixel(x4, y4)
                        c = numbase.GetPixel(x4, y4)
                        If c4.R >= c.R Then
                            If c4.R - c.R <= 5 Then
                                bmdiff4.SetPixel(x4, y4, eq_color)
                            Else
                                bmdiff4.SetPixel(x4, y4, ne_color)
                            End If
                        Else
                            If c.R - c4.R <= 5 Then
                                bmdiff4.SetPixel(x4, y4, eq_color)
                            Else
                                bmdiff4.SetPixel(x4, y4, ne_color)
                            End If
                        End If
                    Next y4
                Next x4
                For x4 = 0 To wid4 - 1
                    For y4 = 0 To hgt4 - 1
                        c = bmdiff4.GetPixel(x4, y4)
                        If c.R = 0 And c.G = 0 And c.B = 0 Then
                            blacknumber4 = blacknumber4 + 1
                        End If
                    Next
                Next
                If blacknumber4 < 120 Then
                    po = 4
                    countal = countal + 1
                End If
            End If
            '---------------------------5--------------------------
            If countal = 0 Then
                Dim figure5 = Image.FromFile("c:\number5.tif")
                Dim bm5 As Bitmap = figure5
                Dim wid5 As Integer = Math.Min(numbase.Width, bm5.Width)
                Dim hgt5 As Integer = Math.Min(numbase.Height, bm5.Height)
                Dim bmdiff5 As New Bitmap(wid5, hgt5)
                Dim c5 As New Color
                For x5 = 0 To wid5 - 1
                    For y5 = 0 To hgt5 - 1
                        c5 = bm5.GetPixel(x5, y5)
                        c = numbase.GetPixel(x5, y5)
                        If c5.R >= c.R Then
                            If c5.R - c.R <= 5 Then
                                bmdiff5.SetPixel(x5, y5, eq_color)
                            Else
                                bmdiff5.SetPixel(x5, y5, ne_color)
                            End If
                        Else
                            If c.R - c5.R <= 5 Then
                                bmdiff5.SetPixel(x5, y5, eq_color)
                            Else
                                bmdiff5.SetPixel(x5, y5, ne_color)
                            End If
                        End If
                    Next y5
                Next x5
                For x5 = 0 To wid5 - 1
                    For y5 = 0 To hgt5 - 1
                        c = bmdiff5.GetPixel(x5, y5)
                        If c.R = 0 And c.G = 0 And c.B = 0 Then
                            blacknumber5 = blacknumber5 + 1
                        End If
                    Next
                Next
                If blacknumber5 < 110 Then
                    For x5 = 0 To 5
                        For y5 = 15 To 19
                            c = bmdiff5.GetPixel(x5, y5)
                            If c.R = 0 Then
                                blackcut55 = blackcut55 + 1
                            End If
                        Next
                    Next
                    If blackcut55 < 12 Then
                        po = 5
                        countal = countal + 1
                    End If
                End If
            End If
            '--------------------------6----------------------------
            If countal = 0 Then
                Dim figure6 = Image.FromFile("c:\number6.tif")
                Dim bm6 As Bitmap = figure6
                Dim wid6 As Integer = Math.Min(numbase.Width, bm6.Width)
                Dim hgt6 As Integer = Math.Min(numbase.Height, bm6.Height)
                Dim bmdiff6 As New Bitmap(wid6, hgt6)
                Dim c6 As New Color
                For x6 = 0 To wid6 - 1
                    For y6 = 0 To hgt6 - 1
                        c6 = bm6.GetPixel(x6, y6)
                        c = numbase.GetPixel(x6, y6)
                        If c6.R >= c.R Then
                            If c6.R - c.R <= 5 Then
                                bmdiff6.SetPixel(x6, y6, eq_color)
                            Else
                                bmdiff6.SetPixel(x6, y6, ne_color)
                            End If
                        Else
                            If c.R - c6.R <= 5 Then
                                bmdiff6.SetPixel(x6, y6, eq_color)
                            Else
                                bmdiff6.SetPixel(x6, y6, ne_color)
                            End If
                        End If
                    Next y6
                Next x6
                For x6 = 0 To wid6 - 1
                    For y6 = 0 To hgt6 - 1
                        c = bmdiff6.GetPixel(x6, y6)
                        If c.R = 0 And c.G = 0 And c.B = 0 Then
                            blacknumber6 = blacknumber6 + 1
                        End If
                    Next
                Next
                If blacknumber6 > 110 Then
                    range = 130
                Else
                    range = 110
                End If
                If blacknumber6 < range Then
                    For x6 = 0 To 5
                        For y6 = 12 To 22
                            c = bmdiff6.GetPixel(x6, y6)
                            If c.R = 0 And c.G = 0 And c.B = 0 Then
                                blackcut6 = blackcut6 + 1
                            End If
                        Next
                    Next
                    If blackcut6 < 20 Then
                        po = 6
                        countal = countal + 1
                    End If
                End If
            End If
            '----------------------------7-------------------------
            If countal = 0 Then
                Dim figure7 = Image.FromFile("c:\number7.tif")
                Dim bm7 As Bitmap = figure7
                Dim wid7 As Integer = Math.Min(numbase.Width, bm7.Width)
                Dim hgt7 As Integer = Math.Min(numbase.Height, bm7.Height)
                Dim bmdiff7 As New Bitmap(wid7, hgt7)
                Dim c7 As New Color
                For x7 = 0 To wid7 - 1
                    For y7 = 0 To hgt7 - 1
                        c7 = bm7.GetPixel(x7, y7)
                        c = numbase.GetPixel(x7, y7)
                        If c7.R >= c.R Then
                            If c7.R - c.R <= 5 Then
                                bmdiff7.SetPixel(x7, y7, eq_color)
                            Else
                                bmdiff7.SetPixel(x7, y7, ne_color)
                            End If
                        Else
                            If c.R - c7.R <= 5 Then
                                bmdiff7.SetPixel(x7, y7, eq_color)
                            Else
                                bmdiff7.SetPixel(x7, y7, ne_color)
                            End If
                        End If
                    Next y7
                Next x7
                For x7 = 0 To wid7 - 1
                    For y7 = 0 To hgt7 - 1
                        c = bmdiff7.GetPixel(x7, y7)
                        If c.R = 0 And c.G = 0 And c.B = 0 Then
                            blacknumber7 = blacknumber7 + 1
                        End If
                    Next
                Next
                If blacknumber7 < 110 Then
                    po = 7
                    countal = countal + 1
                End If
            End If
            '----------------------8----------------------------
            If countal = 0 Then
                Dim figure8 = Image.FromFile("c:\number8.tif")
                Dim bm8 As Bitmap = figure8
                Dim wid8 As Integer = Math.Min(numbase.Width, bm8.Width)
                Dim hgt8 As Integer = Math.Min(numbase.Height, bm8.Height)
                Dim bmdiff8 As New Bitmap(wid8, hgt8)
                Dim c8 As New Color
                For x8 = 0 To wid8 - 1
                    For y8 = 0 To hgt8 - 1
                        c8 = bm8.GetPixel(x8, y8)
                        c = numbase.GetPixel(x8, y8)
                        If c8.R >= c.R Then
                            If c8.R - c.R <= 5 Then
                                bmdiff8.SetPixel(x8, y8, eq_color)
                            Else
                                bmdiff8.SetPixel(x8, y8, ne_color)
                            End If
                        Else
                            If c.R - c8.R <= 5 Then
                                bmdiff8.SetPixel(x8, y8, eq_color)
                            Else
                                bmdiff8.SetPixel(x8, y8, ne_color)
                            End If
                        End If
                    Next y8
                Next x8
                For x8 = 0 To wid8 - 1
                    For y8 = 0 To hgt8 - 1
                        c = bmdiff8.GetPixel(x8, y8)
                        If c.R = 0 And c.G = 0 And c.B = 0 Then
                            blacknumber8 = blacknumber8 + 1
                        End If
                    Next
                Next
                If blacknumber8 < 125 Then
                    For x8 = 0 To 4
                        For y8 = 0 To hgt8 - 1
                            c = bmdiff8.GetPixel(x8, y8)
                            If c.R = 0 And c.G = 0 And c.B = 0 Then
                                blackcut8 = blackcut8 + 1
                            End If
                        Next
                    Next
                    For x8 = 0 To 4
                        For y8 = 10 To 15
                            c = bmdiff8.GetPixel(x8, y8)
                            If c.R = 0 And c.G = 0 And c.B = 0 Then
                                blackcut88 = blackcut88 + 1
                            End If
                        Next
                    Next
                    If blackcut8 < 24 Or blackcut88 < 12 Then
                        For x8 = 13 To wid8 - 1
                            For y8 = 7 To 10
                                c = bmdiff8.GetPixel(x8, y8)
                                If c.R = 0 Then
                                    blackcut888 = blackcut888 + 1
                                End If
                            Next
                        Next
                        If blackcut888 < 9 Then
                            po = 8
                            countal = countal + 1
                        End If
                    End If
                End If
            End If
            '------------------------9------------------------
            If countal = 0 Then
                Dim figure9 = Image.FromFile("c:\number9.tif")
                Dim bm9 As Bitmap = figure9
                Dim wid9 As Integer = Math.Min(numbase.Width, bm9.Width)
                Dim hgt9 As Integer = Math.Min(numbase.Height, bm9.Height)
                Dim bmdiff9 As New Bitmap(wid9, hgt9)
                Dim c9 As New Color
                For x9 = 0 To wid9 - 1
                    For y9 = 0 To hgt9 - 1
                        c9 = bm9.GetPixel(x9, y9)
                        c = numbase.GetPixel(x9, y9)
                        If c9.R >= c.R Then
                            If c9.R - c.R <= 5 Then
                                bmdiff9.SetPixel(x9, y9, eq_color)
                            Else
                                bmdiff9.SetPixel(x9, y9, ne_color)
                            End If
                        Else
                            If c.R - c9.R <= 5 Then
                                bmdiff9.SetPixel(x9, y9, eq_color)
                            Else
                                bmdiff9.SetPixel(x9, y9, ne_color)
                            End If
                        End If
                    Next y9
                Next x9
                For x9 = 0 To wid9 - 1
                    For y9 = 0 To hgt9 - 1
                        c = bmdiff9.GetPixel(x9, y9)
                        If c.R <= 5 Then
                            blacknumber9 = blacknumber9 + 1
                        End If
                    Next
                Next
                If blacknumber9 < 135 Then
                    For x9 = 0 To wid9 - 1
                        For y9 = 12 To 18
                            c = bmdiff9.GetPixel(x9, y9)
                            If c.R <= 5 Then
                                blackcut9 = blackcut9 + 1
                            End If
                        Next
                    Next
                    If blackcut9 < 50 Then
                        po = 9
                        countal = countal + 1
                    End If
                End If
            End If
        End If
        If countal = 0 Then
            po = 15
        End If
        Return po
        'ListBox1.Items.Add(po1 & po2 & po3 & po4 & po5 & po6 & po7 & po8)
        'End If
    End Function

    Private Function numberrecogRE(ByVal bmnum As Bitmap, ByRef count As Integer)
        ' OpenFileDialog1.ShowDialog()
        ' Dim NumberImage = Image.FromFile(OpenFileDialog1.FileName)
        'Dim bmnum As Bitmap = NumberImage
        Dim x1, y1, y55, xmaxnum, ymaxnum, x, y, xnew, ynew, blackpointm, blackpoint, blackpoint2, blackpoint3, blackpoint4, blackpoint5, blackpoint6, ylefttop69, yrighttop69, point As Integer
        Dim yleft69T, blackfirst, blackfirst2, blackfirst3, blackfirst4, xinit, pointright, pointleft, pointtop, pointbottom, numberwidth, numberheight, pointwhiteleft, pointwhiteright, blackpoint7, blackpoint8, yleftbottom69, yrightbottom69 As Integer
        Dim countN, plus, blackpoint55, pointrighttop69, pointlefttop69, pointrightbottom69, pointleftbottom69, yright69, yleft69, whiteright, whiteleft, white3, pointleftbottom, yleftbottom As Integer
        Dim c As New Color
        Dim po As String
        xmaxnum = bmnum.Width - 1
        ymaxnum = bmnum.Height - 1
        xinit = 0
        countN = 0

        For y = 0 To bmnum.Height - 1 - 10
            c = bmnum.GetPixel(bmnum.Width - 1, y)
            If c.R <= 5 Then
                blackfirst = blackfirst + 1
            End If
            c = bmnum.GetPixel(0, y)
            If c.R <= 5 Then
                blackfirst3 = blackfirst3 + 1
            End If
        Next
        If blackfirst <> 0 Then
            For y = 0 To bmnum.Height - 1 - 10
                c = bmnum.GetPixel(bmnum.Width - 1 - 1, y)
                If c.R <= 5 Then
                    blackfirst2 = blackfirst2 + 1
                End If
            Next
            If blackfirst2 = 0 Then
                xmaxnum = xmaxnum - 1
            End If
            If blackfirst2 <> 0 Then
                For y = 0 To bmnum.Height - 1 - 10
                    c = bmnum.GetPixel(bmnum.Width - 1 - 1 - 1, y)
                    If c.R <= 5 Then
                        blackfirst4 = blackfirst4 + 1
                    End If
                Next
                If blackfirst4 = 0 Then
                    xmaxnum = xmaxnum - 2
                End If
            End If
        End If
        blackfirst2 = 0
        If blackfirst3 <> 0 Then
            For y = 0 To bmnum.Height - 1 - 10
                c = bmnum.GetPixel(1, y)
                If c.R <= 5 Then
                    blackfirst2 = blackfirst2 + 1
                End If
            Next
            If blackfirst2 = 0 Then
                xinit = 1
            End If
        End If

        blackfirst = 0
        blackfirst2 = 0
        For x = 0 To bmnum.Width - 1
            c = bmnum.GetPixel(x, bmnum.Height - 1)
            If c.R <= 5 Then
                blackfirst = blackfirst + 1
            End If
        Next
        If blackfirst <> 0 Then
            For x = 0 To bmnum.Width - 1
                c = bmnum.GetPixel(x, bmnum.Height - 1 - 1)
                If c.R <= 5 Then
                    blackfirst2 = blackfirst2 + 1
                End If
            Next
            If blackfirst2 = 0 Then
                ymaxnum = ymaxnum - 1
            End If
        End If

        For x = 0 To xmaxnum
            For y = 0 To ymaxnum
                c = bmnum.GetPixel(x, y)
                If c.R < 5 Then
                    If pointright <= x Then
                        If pointright <> x Then
                            numberwidth = numberwidth + 1
                        End If
                        pointright = x
                    End If
                End If
            Next
        Next

        For y1 = 0 To ymaxnum
            For x1 = 0 To xmaxnum
                c = bmnum.GetPixel(x1, y1)
                If c.R < 5 Then
                    If pointbottom <= y1 Then
                        If pointbottom <> y1 Then
                            numberheight = numberheight + 1
                        End If
                        pointbottom = y1
                    End If
                End If
            Next
        Next

        If numberwidth < 12 Then
            po = 1
        Else
            '------------------pointtop---------------------
            For xnew = pointright - numberwidth + 1 To pointright
                c = bmnum.GetPixel(xnew, pointbottom - numberheight + 1)
                If c.R < 5 Then
                    blackpoint = blackpoint + 1
                End If
            Next
            '-------------------pointtop-1------------------
            For xnew = pointright - numberwidth + 1 To pointright
                c = bmnum.GetPixel(xnew, pointbottom - numberheight + 1 + 1)
                If c.R < 5 Then
                    blackpoint2 = blackpoint2 + 1
                End If
            Next
            '------------------pointleft-----------------------
            For ynew = pointbottom - numberheight + 1 To pointbottom
                c = bmnum.GetPixel(pointright - numberwidth + 1, ynew)
                If c.R < 5 Then
                    blackpoint5 = blackpoint5 + 1
                End If
            Next
            '-------------------pointright----------------------
            For ynew = pointbottom - numberheight + 1 To pointbottom
                c = bmnum.GetPixel(pointright, ynew)
                If c.R < 5 Then
                    blackpoint6 = blackpoint6 + 1
                End If
            Next
            '--------------------pointleft+1----------------------
            For ynew = pointbottom - numberheight + 1 To pointbottom
                c = bmnum.GetPixel(pointright - numberwidth + 1 + 1, ynew)
                If c.R < 5 Then
                    blackpoint7 = blackpoint7 + 1
                End If
            Next
            '--------------------pointright-1----------------------
            For ynew = pointbottom - numberheight + 1 To pointbottom
                c = bmnum.GetPixel(pointright - 1, ynew)
                If c.R < 5 Then
                    blackpoint8 = blackpoint8 + 1
                End If
            Next
            '--------------------pointleft+plus,top-----------------------
            countN = 0
            For ynew = pointbottom - numberheight + 1 To pointbottom
                c = bmnum.GetPixel(pointright - numberwidth + 1, ynew)
                If c.R <= 5 Then
                    countN = countN + 1
                    If countN = 1 Then
                        y55 = ynew
                        Exit For
                    End If
                End If
            Next
            If y55 > 15 Then
                plus = 3
            Else
                plus = 2
            End If
            For ynew = pointbottom - numberheight + 1 To 14
                c = bmnum.GetPixel(pointright - numberwidth + 1 + plus, ynew)
                If c.R <= 5 Then
                    blackpoint55 = blackpoint55 + 1
                End If
            Next
            '---------------find difference between 6 and 9--------------
            For yleftbottom69 = 0 To ymaxnum
                c = bmnum.GetPixel(pointright - numberwidth + 1 + 1, yleftbottom69)
                If c.R < 5 Then
                    If pointleftbottom69 <= yleftbottom69 Then
                        pointleftbottom69 = yleftbottom69
                    End If
                End If
            Next
            For yleftbottom = 0 To ymaxnum
                c = bmnum.GetPixel(pointright - numberwidth + 1, yleftbottom)
                If c.R < 5 Then
                    If pointleftbottom <= yleftbottom Then
                        pointleftbottom = yleftbottom
                    End If
                End If
            Next
            'For ylefttop69 = ymax To 0 Step -1
            'c = bm.GetPixel(pointright - numberwidth + 1 + 1, ylefttop69)
            'If c.R = 0 And c.G = 0 And c.B = 0 Then
            'If pointlefttop69 >= ylefttop69 Then
            'pointlefttop69 = ylefttop69
            'End If
            'End If
            'Next
            'For yrighttop69 = 0 To ymax
            'c = bm.GetPixel(pointright - 1, yrighttop69)
            'If c.R = 0 And c.G = 0 And c.B = 0 Then
            'pointrighttop69 = yrighttop69
            'Exit For
            'End If
            'Next
            For yrightbottom69 = 0 To ymaxnum
                c = bmnum.GetPixel(pointright - 1, yrightbottom69)
                If c.R < 5 Then
                    If pointrightbottom69 <= yrightbottom69 Then
                        pointrightbottom69 = yrightbottom69
                    End If
                End If
            Next
            '------------------find white point to find difference between 6,9 and 8-------
            For yright69 = pointrightbottom69 - 14 To pointrightbottom69
                c = bmnum.GetPixel(pointright - 1, yright69)
                If c.R > 250 Then
                    whiteright = whiteright + 1
                End If
            Next

            For yleft69 = pointleftbottom69 - 14 To pointleftbottom69
                c = bmnum.GetPixel(pointright - numberwidth + 1 + 1, yleft69)
                If c.R > 250 Then
                    whiteleft = whiteleft + 1
                End If
            Next
            If numberwidth Mod 2 = 0 Then
                For ynew = pointbottom - numberheight + 1 To pointbottom
                    c = bmnum.GetPixel(numberwidth / 2, ynew)
                    If c.R < 5 Then
                        blackpointm = blackpointm + 1
                    End If
                Next
            End If
            If numberwidth Mod 2 <> 0 Then
                For ynew = pointbottom - numberheight + 1 To pointbottom
                    c = bmnum.GetPixel(numberwidth - 8, ynew)
                    If c.R < 5 Then
                        blackpointm = blackpointm + 1
                    End If
                Next
            End If
            For xnew = pointright - numberwidth + 1 To pointright
                c = bmnum.GetPixel(xnew, pointbottom)
                If c.R < 5 Then
                    blackpoint3 = blackpoint3 + 1
                End If
            Next
            For xnew = pointright - numberwidth + 1 To pointright
                c = bmnum.GetPixel(xnew, pointbottom - 1)
                If c.R < 5 Then
                    blackpoint4 = blackpoint4 + 1
                End If
            Next

            countN = 0
            If blackpoint <= 7 Then
                If blackpoint2 <= 5 Then
                    po = 4
                    countN = countN + 1
                End If
                If blackpoint2 >= numberwidth - 5 Then
                    If blackpoint2 >= numberwidth - 2 Then
                        po = 7
                        countN = countN + 1
                    Else
                        If blackpoint55 > 8 Then
                            po = 5
                            countN = countN + 1
                        Else
                            po = 3
                            countN = countN + 1
                        End If
                    End If
                End If
            End If
            If (blackpoint >= numberwidth - 5 Or blackpoint2 >= numberwidth - 5) And blackpoint > 7 Then
                If blackpoint2 >= blackpoint Then
                    If blackpoint2 >= numberwidth - 2 Then
                        po = 7
                        countN = countN + 1
                    Else
                        If blackpoint5 <= 10 Then
                            If blackpoint4 <= numberwidth - 4 Then
                                If blackpoint55 > 8 Then
                                    po = 5
                                    countN = countN + 1
                                Else
                                    po = 3
                                    countN = countN + 1
                                End If
                            End If
                        End If
                    End If
                End If
            End If

            If blackpoint3 <= 7 Then
                If blackpoint4 >= numberwidth - 4 Then
                    po = 2
                    countN = countN + 1
                End If
            End If
            If (blackpoint3 >= numberwidth - 4 Or blackpoint4 >= numberwidth - 4) And blackpoint3 > 7 Then
                po = 2
                countN = countN + 1
            Else
                If whiteleft >= 9 Then
                    If blackpoint2 < 12 And blackpoint2 > 5 Then
                        If blackpoint4 < 15 Then
                            If blackpointm >= 8 Then
                                po = 3
                                countN = countN + 1
                            End If
                        End If
                    End If
                End If
            End If

            pointleftbottom69 = 0
            blackpoint8 = 0
            whiteleft = 0

            If blackpoint5 <= 2 Then
                For yleftbottom69 = 0 To ymaxnum
                    c = bmnum.GetPixel(pointright - numberwidth + 1 + 1 + 1, yleftbottom69)
                    If c.R < 5 Then
                        If pointleftbottom69 <= yleftbottom69 Then
                            pointleftbottom69 = yleftbottom69
                        End If
                    End If
                Next
            Else
                For yleftbottom69 = 0 To ymaxnum
                    c = bmnum.GetPixel(pointright - numberwidth + 1 + 1, yleftbottom69)
                    If c.R < 5 Then
                        If pointleftbottom69 <= yleftbottom69 Then
                            pointleftbottom69 = yleftbottom69
                        End If
                    End If
                Next
            End If

            If blackpoint6 <= 2 Then
                For ynew = pointbottom - numberheight + 1 To pointbottom
                    c = bmnum.GetPixel(pointright - 1 - 1, ynew)
                    If c.R < 5 Then
                        blackpoint8 = blackpoint8 + 1
                    End If
                Next
            Else
                For ynew = pointbottom - numberheight + 1 To pointbottom
                    c = bmnum.GetPixel(pointright - 1, ynew)
                    If c.R < 5 Then
                        blackpoint8 = blackpoint8 + 1
                    End If
                Next
            End If

            If blackpoint5 <= 2 Then
                If pointleftbottom69 - 14 >= numberheight Then
                    yleft69T = numberheight
                Else
                    yleft69T = pointleftbottom69 - 14
                End If
                For yleft69 = yleft69T To pointleftbottom69
                    c = bmnum.GetPixel(pointright - numberwidth + 1 + 1 + 1, yleft69)
                    If c.R > 250 Then
                        whiteleft = whiteleft + 1
                    End If
                Next
            Else
                If pointleftbottom69 - 14 >= numberheight Then
                    yleft69T = numberheight
                Else
                    yleft69T = pointleftbottom69 - 14
                End If
                For yleft69 = yleft69T To pointleftbottom69
                    c = bmnum.GetPixel(pointright - numberwidth + 1 + 1, yleft69)
                    If c.R > 250 Then
                        whiteleft = whiteleft + 1
                    End If
                Next
            End If

            If countN = 0 Then
                If blackpoint5 <= 9 Or blackpoint6 <= 9 Then
                    If numberheight Mod 2 = 0 Then
                        For ynew = pointbottom - numberheight + 1 To pointbottom - numberheight + 1 + 14
                            c = bmnum.GetPixel(pointright - numberwidth + 1, ynew)
                            If c.R > 250 Then
                                pointwhiteleft = pointwhiteleft + 1
                            End If
                            c = bmnum.GetPixel(pointright, ynew)
                            If c.R > 250 Then
                                pointwhiteright = pointwhiteright + 1
                            End If
                        Next
                    End If
                    If numberheight Mod 2 <> 0 Then
                        For ynew = pointbottom - numberheight + 1 To pointbottom - numberheight + 1 + 14
                            c = bmnum.GetPixel(pointright - numberwidth + 1, ynew)
                            If c.R > 250 Then
                                pointwhiteleft = pointwhiteleft + 1
                            End If
                            c = bmnum.GetPixel(pointright, ynew)
                            If c.R > 250 Then
                                pointwhiteright = pointwhiteright + 1
                            End If
                        Next
                    End If
                    If pointwhiteright >= 12 And pointwhiteleft >= 12 And blackpointm > 8 Then
                        If blackpoint < 10 And blackpoint > 2 Then
                            If blackpoint2 > 7 And blackpoint2 <= numberwidth - 6 And blackpoint4 > 7 And blackpoint7 > 10 And blackpoint8 > 10 Then
                                If pointleftbottom > 20 Then
                                    po = 8
                                    countN = countN + 1
                                Else
                                    'MessageBox.Show("888")
                                    If blackpointm <= 8 Then
                                        po = 0
                                        countN = countN + 1
                                    Else
                                        If whiteleft > 1 And whiteright = 0 Then
                                            po = 9
                                            countN = countN + 1
                                        End If
                                        If whiteleft = 0 And whiteright > 1 Then
                                            po = 6
                                            countN = countN + 1
                                        End If
                                    End If
                                End If
                            Else
                                If blackpoint2 > 7 And blackpoint4 > 7 And blackpoint2 < numberwidth - 4 And blackpoint5 <= 2 And blackpoint7 <= 10 Then
                                    'MessageBox.Show("555:")
                                    po = 8
                                    countN = countN + 1
                                Else
                                    If whiteleft > 1 And whiteright = 0 Then
                                        po = 9
                                        countN = countN + 1
                                    End If
                                    If whiteleft = 0 And whiteright > 1 Then
                                        po = 6
                                        countN = countN + 1
                                    End If
                                End If
                            End If
                        Else
                            If blackpoint7 >= 12 And blackpoint8 >= 12 Then
                                If blackpointm <= 8 Then
                                    po = 0
                                    countN = countN + 1
                                Else
                                    'MessageBox.Show("111")
                                    If whiteleft > 2 And whiteright = 0 Then
                                        po = 9
                                        countN = countN + 1
                                    End If
                                    If whiteleft = 0 And whiteright > 2 Then
                                        po = 6
                                        countN = countN + 1
                                    End If
                                    If whiteleft > 2 And whiteright > 2 Then
                                        If blackpoint2 <= numberwidth - 6 Then
                                            po = 8
                                            countN = countN + 1
                                        End If
                                    End If
                                End If
                            End If
                        End If
                    Else
                        If blackpoint7 >= 12 Or blackpoint8 >= 12 Then
                            If blackpointm <= 8 Then
                                po = 0
                                countN = countN + 1
                            Else
                                'MessageBox.Show("222")
                                If whiteleft > 1 And whiteright = 0 Then
                                    po = 9
                                    countN = countN + 1
                                End If
                                If whiteleft = 0 And whiteright > 1 Then
                                    po = 6
                                    countN = countN + 1
                                End If
                                If whiteleft > 1 And whiteright > 1 And whiteleft < 7 And whiteright < 7 Then
                                    If blackpoint2 < 12 Then
                                        po = 8
                                        countN = countN + 1
                                    End If
                                End If
                            End If
                        End If
                    End If
                End If
            End If
            If countN = 0 Then
                If blackpoint5 >= 10 And blackpoint6 >= 10 Then
                    If blackpointm <= 8 Then
                        po = 0
                        countN = countN + 1
                    End If
                    If blackpoint7 >= 12 Or blackpoint8 >= 12 Then
                        'MessageBox.Show("333")
                        If whiteleft > 1 And whiteright = 0 Then
                            po = 9
                            countN = countN + 1
                        End If
                        If whiteleft = 0 And whiteright > 1 Then
                            po = 6
                            countN = countN + 1
                        End If
                        If whiteleft > 1 And whiteright > 1 And whiteleft < 7 And whiteright < 7 Then
                            If blackpoint2 < 12 Then
                                po = 8
                                countN = countN + 1
                            End If
                        End If
                    End If
                End If
            End If
        End If
        If countN = 0 Then
            po = 15
        End If
        Return po
    End Function

    Private Function alpharecog1(ByVal bmal As Bitmap) As String
        Dim c As New Color
        Dim blackpointleftal2, blackpointF, blackpointF2, pointMal As Integer
        Dim pointleftal, pointtopal, countmn, blackfirst, blackfirst2, count, xmaxal, ymaxal, xnewal, ynewal, xal, yal, xal1, yal1, pointrightal, alphabetwidth, pointbottomal, alphabetheight As Integer
        Dim blackpointBD, blackpointleftal, blackpointtopal, blackpointalm, blackpointalm2 As Integer
        Dim poal As String
        xmaxal = bmal.Width - 1
        ymaxal = bmal.Height - 1

        countmn = 1

        For yal = 0 To bmal.Height - 1 - 10
            c = bmal.GetPixel(bmal.Width - 1, yal)
            If c.R <= 5 Then
                blackfirst = blackfirst + 1
            End If
        Next
        If blackfirst <> 0 Then
            For yal = 0 To bmal.Height - 1 - 10
                c = bmal.GetPixel(bmal.Width - 1 - 1, yal)
                If c.R <= 5 Then
                    blackfirst2 = blackfirst2 + 1
                End If
            Next
            If blackfirst2 = 0 Then
                xmaxal = xmaxal - 1
            End If
        End If

        blackfirst = 0
        blackfirst2 = 0
        For xal = 0 To bmal.Width - 1
            c = bmal.GetPixel(xal, bmal.Height - 1)
            If c.R <= 5 Then
                blackfirst = blackfirst + 1
            End If
        Next
        If blackfirst <> 0 Then
            For xal = 0 To bmal.Width - 1
                c = bmal.GetPixel(xal, bmal.Height - 1 - 1)
                If c.R <= 5 Then
                    blackfirst2 = blackfirst2 + 1
                End If
            Next
            If blackfirst2 = 0 Then
                ymaxal = ymaxal - 1
            End If
        End If
        count = 0
        For xal = 0 To xmaxal
            For yal = 0 To ymaxal
                c = bmal.GetPixel(xal, yal)
                If c.R <= 5 Then
                    count = count + 1
                    If pointrightal <= xal Then
                        If pointrightal <> xal Then
                            alphabetwidth = alphabetwidth + 1
                        End If
                        pointrightal = xal
                    End If
                    If count = 1 Then
                        pointleftal = xal
                    End If
                End If
            Next
        Next
        count = 0
        For yal1 = 0 To ymaxal
            For xal1 = 0 To xmaxal
                c = bmal.GetPixel(xal1, yal1)
                If c.R <= 5 Then
                    count = count + 1
                    If pointbottomal <= yal1 Then
                        If pointbottomal <> yal1 Then
                            alphabetheight = alphabetheight + 1
                        End If
                        pointbottomal = yal1
                    End If
                    If count = 1 Then
                        pointtopal = yal1
                    End If
                End If
            Next
        Next
        'MessageBox.Show(pointbottomal)
        For ynewal = pointtopal To pointbottomal
            c = bmal.GetPixel(pointleftal + 2, ynewal)
            If c.R <= 5 Then
                blackpointleftal = blackpointleftal + 1
            End If
        Next
        For ynewal = pointtopal To pointbottomal
            c = bmal.GetPixel(pointleftal, ynewal)
            If c.R <= 5 Then
                blackpointleftal2 = blackpointleftal2 + 1
            End If
        Next
        'MessageBox.Show(blackpointleftal)
        For xnewal = pointleftal To pointrightal
            c = bmal.GetPixel(xnewal, pointtopal + 1)
            If c.R <= 5 Then
                blackpointtopal = blackpointtopal + 1
            End If
        Next

        If alphabetwidth Mod 2 = 0 Then
            For ynewal = pointtopal To pointbottomal
                c = bmal.GetPixel(pointleftal + alphabetwidth / 2, ynewal)
                If c.R <= 5 Then
                    blackpointalm = blackpointalm + 1
                End If
            Next
            For ynewal = pointtopal + 7 To pointbottomal - 7
                c = bmal.GetPixel(pointleftal + alphabetwidth / 2, ynewal)
                If c.R <= 5 Then
                    blackpointBD = blackpointBD + 1
                End If
            Next
        End If
        If alphabetwidth Mod 2 <> 0 Then
            For ynewal = pointtopal To pointbottomal
                c = bmal.GetPixel(pointleftal + alphabetwidth / 2 + 0.5 + 1, ynewal)
                If c.R <= 5 Then
                    blackpointalm = blackpointalm + 1
                End If
            Next
            For ynewal = pointtopal + 7 To pointbottomal - 7
                c = bmal.GetPixel(pointleftal + alphabetwidth / 2 + 0.5 + 1, ynewal)
                If c.R <= 5 Then
                    blackpointBD = blackpointBD + 1
                End If
            Next
        End If
        If alphabetheight Mod 2 = 0 Then
            For xnewal = pointleftal To pointrightal
                c = bmal.GetPixel(xnewal, pointtopal + alphabetheight / 2)
                If c.R <= 5 Then
                    blackpointalm2 = blackpointalm2 + 1
                End If
            Next
        End If
        If alphabetheight Mod 2 <> 0 Then
            For xnewal = pointleftal To pointrightal
                c = bmal.GetPixel(xnewal, pointtopal + alphabetheight / 2 + 0.5)
                If c.R <= 5 Then
                    blackpointalm2 = blackpointalm2 + 1
                End If
            Next
        End If
        For xnewal = pointleftal + 1 To pointleftal + 6
            c = bmal.GetPixel(xnewal, pointbottomal - 1)
            If c.R <= 5 Then
                blackpointF = blackpointF + 1
            End If
        Next
        If alphabetwidth Mod 2 = 0 Then
            pointMal = pointleftal + alphabetwidth / 2
        Else
            pointMal = pointleftal + (alphabetwidth / 2) + 0.5
        End If
        For xnewal = pointMal To pointrightal
            c = bmal.GetPixel(xnewal, pointbottomal - 1)
            If c.R <= 5 Then
                blackpointF2 = blackpointF2 + 1
            End If
        Next
        'MessageBox.Show(alphabetwidth)

        '------------------------position1----------------------
        count = 0
        If alphabetwidth < 15 Then
            poal = "I"
            count = count + 1
        End If
        If alphabetwidth > 30 Then
            poal = "W"
            count = count + 1
        End If
        If alphabetwidth <= 19 And alphabetwidth > 15 Then
            poal = "F"
            count = count + 1
        End If
        'MessageBox.Show(blackpointalm)
        'MessageBox.Show(blackpointBD)
        'MessageBox.Show(blackpointleftal)
        'MessageBox.Show(blackpointF2)
        If count = 0 Then
            If alphabetwidth >= 20 And alphabetwidth <= 23 Then
                'MessageBox.Show("1")
                If blackpointleftal > alphabetheight - 4 Or blackpointleftal2 > alphabetheight - 4 Then
                    If blackpointalm > 5 Then
                        If blackpointBD <> 0 Then
                            If blackpointF2 > 2 Then
                                poal = "B"
                                count = count + 1
                            Else
                                If blackpointF2 = 0 Then
                                    If blackpointF >= 3 Then
                                        poal = "F"
                                        count = count + 1
                                    End If
                                End If
                            End If
                        Else
                            poal = "D"
                            count = count + 1
                        End If
                    Else
                        If blackpointalm <= 5 Then
                            poal = "U"
                            count = count + 1
                        End If
                    End If
                Else
                    If blackpointalm <= 5 Then
                        poal = "U"
                        count = count + 1
                    Else
                        If blackpointalm >= 9 Then
                            If blackpointBD <> 0 Then
                                poal = "S"
                                count = count + 1
                            End If
                        End If
                    End If
                End If
            End If
        End If
        If count = 0 Then
            If alphabetwidth >= 23 And alphabetwidth < 28 Or blackpointleftal2 > alphabetheight - 4 Then
                'MessageBox.Show("2")
                If blackpointleftal > alphabetheight - 4 Then
                    If blackpointBD = 0 Then
                        poal = "D"
                        count = count + 1
                    End If
                Else
                    If blackpointalm2 <= 5 Then
                        If blackpointBD = 0 Then
                            poal = "C"
                            count = count + 1
                        Else
                            If blackpointBD <> 0 Then
                                poal = "A"
                                count = count + 1
                            End If
                        End If
                    Else
                        If alphabetwidth >= 24 Then
                            poal = "A"
                            count = count + 1
                        End If
                    End If
                End If
            End If
        End If
        If count = 0 Then
            poal = "Q"
        End If
        Return poal
    End Function

    Private Function alpharecog2(ByVal bmal2 As Bitmap) As String
        Dim c As New Color
        Dim poal2 As String
        Dim countmn, blackfirst, blackfirst2, count, xmaxal, ymaxal, xnewal, ynewal, xal, yal, xal1, yal1, pointrightal, alphabetwidth, pointbottomal, alphabetheight As Integer
        xmaxal = bmal2.Width - 1
        ymaxal = bmal2.Height - 1

        For yal = 0 To bmal2.Height - 1 - 10
            c = bmal2.GetPixel(bmal2.Width - 1, yal)
            If c.R <= 5 Then
                blackfirst = blackfirst + 1
            End If
        Next
        If blackfirst <> 0 Then
            For yal = 0 To bmal2.Height - 1 - 10
                c = bmal2.GetPixel(bmal2.Width - 1 - 1, yal)
                If c.R <= 5 Then
                    blackfirst2 = blackfirst2 + 1
                End If
            Next
            If blackfirst2 = 0 Then
                xmaxal = xmaxal - 1
            End If
        End If

        blackfirst = 0
        blackfirst2 = 0
        For xal = 0 To bmal2.Width - 1
            c = bmal2.GetPixel(xal, bmal2.Height - 1)
            If c.R <= 5 Then
                blackfirst = blackfirst + 1
            End If
        Next
        If blackfirst <> 0 Then
            For xal = 0 To bmal2.Width - 1
                c = bmal2.GetPixel(xal, bmal2.Height - 1 - 1)
                If c.R <= 5 Then
                    blackfirst2 = blackfirst2 + 1
                End If
            Next
            If blackfirst2 = 0 Then
                ymaxal = ymaxal - 1
            End If
        End If

        For xal = 0 To xmaxal
            For yal = 0 To ymaxal
                c = bmal2.GetPixel(xal, yal)
                If c.R <= 5 Then
                    If pointrightal <= xal Then
                        If pointrightal <> xal Then
                            alphabetwidth = alphabetwidth + 1
                        End If
                        pointrightal = xal
                    End If
                End If
            Next
        Next
        For yal1 = 0 To ymaxal
            For xal1 = 0 To xmaxal
                c = bmal2.GetPixel(xal1, yal1)
                If c.R <= 5 Then
                    If pointbottomal <= yal1 Then
                        If pointbottomal <> yal1 Then
                            alphabetheight = alphabetheight + 1
                        End If
                        pointbottomal = yal1
                    End If
                End If
            Next
        Next

        '---------------------position2---------------------
        If count = 0 Then
            If alphabetwidth >= 20 And alphabetwidth < 23 Then
                poal2 = "E"
            End If
            If alphabetwidth >= 24 Then
                poal2 = "A"
            End If
            If alphabetheight < 22 Then
                poal2 = "+"
            End If
        End If
        Return poal2
    End Function

    Private Function IDcompareTOexcel(ByVal Order As Integer, ByVal BeginCount As Integer, ByVal whatpage As Integer, ByVal IDnumber As String, ByVal countheight As Integer, ByVal subject As String) As Integer
        Dim xlsApp As New Excel.Application
        xlsApp.Workbooks.Open("c:\" & subject & "-" & Me.TextBox1.Text & ".xls")
        Dim xlsSheet As Excel.Worksheet = xlsApp.ActiveWorkbook.Sheets(1)
        Dim IDExcel As String
        Dim numofP2, IDComPare, countIDmatch, CountCompare As Integer
        If Order = 17 Then
            numofP2 = 45
        End If
        If Order = 18 Then
            numofP2 = 46
        End If
        If whatpage > 30 Then
            CountCompare = BeginCount + Order + countheight - 1
        End If
        If whatpage <= 30 Then
            CountCompare = BeginCount + countheight
        End If
        'MessageBox.Show(CountCompare)
        IDExcel = xlsSheet.Cells(CountCompare, 3).value

        IDComPare = IDExcel.CompareTo(IDnumber)
        'MessageBox.Show(IDComPare)
        If IDComPare <> 0 Then
            countIDmatch = countIDmatch + 1
            If whatpage < 30 Then
                ListBox2.Items.Add("คนที่" & countheight + 1 & "-" & IDExcel)
            End If
            If whatpage > 30 Then
                ListBox2.Items.Add("คนที่" & countheight + Order & "-" & IDExcel)
            End If
        End If

        xlsApp.ActiveWorkbook.Close(False)
        xlsApp.Quit()
        Return countIDmatch
    End Function

    Private Function StartExcelAt(ByVal subject As String) As Integer
        Dim xlsApp2 As New Excel.Application
        xlsApp2.Workbooks.Open("c:\" & subject & "-" & Me.TextBox1.Text & ".xls")
        Dim xlsSheet As Excel.Worksheet = xlsApp2.ActiveWorkbook.Sheets(1)
        Dim BeginCount, number, WhereBegin As Integer
        For WhereBegin = 27 To 50
            number = CDbl(xlsSheet.Cells(WhereBegin, 2).value)
            If number = 1 Then
                BeginCount = WhereBegin
                Exit For
            End If
            If number = 2 Then
                BeginCount = WhereBegin - 1
                Exit For
            End If
        Next
        Return BeginCount
    End Function

    Private Function GradeCompareTOexcel(ByVal Order As Integer, ByVal Begincount As Integer, ByVal subject As String, ByVal whatpage As Integer, ByVal grade As String, ByVal countheight As Integer) As Integer
        Dim xlsAppGrade As New Excel.Application
        xlsAppGrade.Workbooks.Open("c:\" & subject & "-" & Me.TextBox1.Text & ".xls")
        Dim xlsSheet As Excel.Worksheet = xlsAppGrade.ActiveWorkbook.Sheets(1)
        Dim GradeExcel As String
        Dim numofP2, GradeComPare, countGradematch, CountCompare As Integer

        If Order = 17 Then
            numofP2 = 45
        End If
        If Order = 18 Then
            numofP2 = 46
        End If
        If whatpage > 30 Then
            CountCompare = Begincount + Order + countheight - 1
        End If
        If whatpage <= 30 Then
            CountCompare = Begincount + countheight
        End If
        'MessageBox.Show(CountCompare)
        GradeExcel = xlsSheet.Cells(CountCompare, 18).text

        GradeComPare = GradeExcel.CompareTo(grade)
        'MessageBox.Show(IDComPare)
        If GradeComPare <> 0 Then
            countGradematch = countGradematch + 1
            If whatpage < 30 Then
                ListBox3.Items.Add("คนที่" & countheight + 1 & "-" & GradeExcel)
            End If
            If whatpage > 30 Then
                ListBox3.Items.Add("คนที่" & countheight + Order & "-" & GradeExcel)
            End If
        End If

        xlsAppGrade.ActiveWorkbook.Close(False)
        xlsAppGrade.Quit()
        Return countGradematch
    End Function

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button3.Click
        ListBox2.Items.Clear()
        ListBox3.Items.Clear()
    End Sub

    Private Sub Button4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button4.Click
        If CheckBox1.Checked = False Then
            MessageBox.Show("Please check subject")
        End If
        If TextBox2.TextLength <> 8 And TextBox2.TextLength <> 0 Then
            MessageBox.Show("Please fill subjectID in 8 characters")
        End If
        If TextBox1.TextLength <> 2 And TextBox1.TextLength <> 0 Then
            MessageBox.Show("Please fill year in 2 characters")
        End If
        If TextBox2.TextLength = 0 Then
            MessageBox.Show("Please insert subjectID")
        End If
        If TextBox1.TextLength = 0 Then
            MessageBox.Show("Please insert year")
        End If
        If CheckBox1.Checked = True And TextBox1.TextLength = 2 And TextBox2.TextLength = 8 Then
            CropIM()
        End If
    End Sub
End Class
