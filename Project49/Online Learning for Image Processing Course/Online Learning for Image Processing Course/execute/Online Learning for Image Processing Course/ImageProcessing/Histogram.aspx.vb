Imports System
Imports System.IO
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Collections
Imports System.ComponentModel
Imports System.Data
Imports System.Math
Imports WebChart

Partial Class Histogram
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Student" Then
                If Request.QueryString("sub_id") = "" Then
                    Response.Redirect("../Result.aspx?msg=กรุณาเข้าชมเว็บเพจนี้จากเมนูหน้าหลักของระบบสมาชิกผู้เรียน&user=Student")
                End If
                '************************* Register Check
                QueryStr = "select sub_id from result where reg_id = (select reg_id from register " & _
                    "where reg_year = (select max(reg_year) from register) and reg_term = " & _
                    "(select max(reg_term) from register where reg_year = (select max(reg_year) " & _
                    "from register)) and std_id = '" & Session("user") & "') order by sub_id"
                TableStr = "checking"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                        Dim tmp As Boolean = False
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            If row("sub_id") = Request.QueryString("sub_id") Then
                                tmp = True
                                Exit For
                            Else
                                tmp = False
                            End If
                        Next
                        If tmp = False Then
                            Response.Redirect("../Result.aspx?msg=คุณไม่ได้ลงทะเบียนในวิชานี้&action=close")
                        End If
                    Else
                        Response.Redirect("../Result.aspx?msg=คุณไม่ได้ลงทะเบียนในวิชานี้&action=close")
                    End If
                Else
                    Response.Redirect("DBFailed.aspx")
                End If
                '*************************
            ElseIf Session("usertype") = "Staff" Then

            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้เรียน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If

        If Not Page.IsPostBack Then
            If Session("ImageUrl") <> "" Then
                ImageBefore.ImageUrl = "~/ImageProcessing/ImageBefore/" & Session("ImageUrl")
            Else
                ImageBefore.ImageUrl = "~/ImageProcessing/ImageDefaultBefore/Lena_withNoise.bmp"
            End If
        End If
    End Sub

    Protected Sub OK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles OK.Click
        Try
            Warning.Text = ""
            RedHistogramChart.Visible = False
            GreenHistogramChart.Visible = False
            BlueHistogramChart.Visible = False
            Dim ObjImg As New FileInfo(Server.MapPath(".") & "\ImageBefore\" & Path.GetFileName(ImageFile.PostedFile.FileName.Trim()))
            Dim ImgType As String = ImageFile.PostedFile.ContentType
            ImgType = ImgType.Substring(0, 5)
            If ImageFile.PostedFile.FileName <> "" Then
                If ObjImg.Exists Then
                    Warning.Text = "ชื่อไฟล์ซ้ำ กรุณาเปลี่ยนฃื่อไฟล์"
                    Exit Sub
                Else
                    If ImgType = "image" Then
                        If (ImageFile.PostedFile.FileName <> "" And ImageFile.PostedFile.FileName.Trim().Length > 0 And ImageFile.PostedFile.ContentLength > 0 And ImageFile.PostedFile.ContentLength <= 400000000) Then
                            ImageFile.PostedFile.SaveAs(Server.MapPath(".") & "\ImageBefore\" & Path.GetFileName(ImageFile.PostedFile.FileName.Trim()))
                            Session("ImageUrl") = Path.GetFileName(ImageFile.PostedFile.FileName.Trim())
                            ImageBefore.ImageUrl = "~\ImageProcessing\ImageBefore\" & Session("ImageUrl")
                            'ImageAfter.ImageUrl = "~\ImageProcessing\ImageBefore\" & Session("ImageUrl")
                        Else
                            Warning.Text = "พบปัญหาเกี่ยวกับไฟล์"
                            Exit Sub
                        End If
                    Else
                        Warning.Text = "ไฟล์นี้ไม่ใช่ไฟล์รูปภาพ กรุณาเลือกไฟล์ใหม่"
                        Exit Sub
                    End If
                End If
            Else
                Warning.Text = "คุณยังไม่ได้เลือกไฟล์ กรุณาเลือกไฟล์"
                Exit Sub
            End If
        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Protected Sub GetHistogram_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles GetHistogram.Click
        Try
            Warning.Text = ""
            Dim ImageData As Bitmap
            Dim Pixel As Color
            Dim x, y As Integer
            Dim ArrRed(255) As Double
            Dim ArrGreen(255) As Double
            Dim ArrBlue(255) As Double

            If Session("ImageUrl") <> "" Then
                Dim tmp As String = Server.MapPath(".") & "\ImageBefore\" & Session("ImageUrl")
                ImageData = New Bitmap(tmp)
            Else
                Dim tmp As String = Server.MapPath(".") & "\ImageDefaultBefore\Lena_withNoise.bmp"
                ImageData = New Bitmap(tmp)
            End If

            For y = 0 To ImageData.Height - 1
                For x = 0 To ImageData.Width - 1
                    Pixel = ImageData.GetPixel(x, y)
                    ArrRed(Pixel.R) = ArrRed(Pixel.R) + 1
                    ArrGreen(Pixel.G) = ArrGreen(Pixel.G) + 1
                    ArrBlue(Pixel.B) = ArrBlue(Pixel.B) + 1
                Next
            Next
            CreateGraph(ArrRed, "R")
            RedHistogramChart.Visible = True
            CreateGraph(ArrGreen, "G")
            GreenHistogramChart.Visible = True
            CreateGraph(ArrBlue, "B")
            BlueHistogramChart.Visible = True
            ImageData.Dispose()

        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Protected Sub HistogramEqualization_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles HistogramEqualization.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            Dim ImageData As Bitmap
            Dim ImageEqualization As Bitmap
            Dim NameAfter As String = ""
            Dim ArrNameAfter(1) As String
            Dim Pixel As Color
            Dim x, y As Integer
            Dim ArrRed(255) As Double
            Dim ArrGreen(255) As Double
            Dim ArrBlue(255) As Double
            Dim CR(255) As Double
            Dim CG(255) As Double
            Dim CB(255) As Double

            If Session("ImageUrl") <> "" Then
                Dim tmp As String = Server.MapPath(".") & "\ImageBefore\" & Session("ImageUrl")
                ImageData = New Bitmap(tmp)
                NameAfter = Session("ImageUrl")
                ArrNameAfter = NameAfter.Split(".")
                NameAfter = ArrNameAfter(0) & "1." & ArrNameAfter(1)
                status = "Browse"
            Else
                Dim tmp As String = Server.MapPath(".") & "\ImageDefaultBefore\Lena_withNoise.bmp"
                ImageData = New Bitmap(tmp)
                NameAfter = "Lena_withNoise.bmp"
                ArrNameAfter = NameAfter.Split(".")
                NameAfter = ArrNameAfter(0) & "1." & ArrNameAfter(1)
                status = "Default"
            End If

            ImageEqualization = New Bitmap(ImageData.Width, ImageData.Height, PixelFormat.Format32bppArgb)

            For y = 0 To ImageData.Height - 1
                For x = 0 To ImageData.Width - 1
                    Pixel = ImageData.GetPixel(x, y)
                    ArrRed(Pixel.R) = ArrRed(Pixel.R) + 1
                    ArrGreen(Pixel.G) = ArrGreen(Pixel.G) + 1
                    ArrBlue(Pixel.B) = ArrBlue(Pixel.B) + 1
                Next
            Next

            For x = 0 To 255
                ArrRed(x) = (ArrRed(x) * 255) / (ImageData.Width * ImageData.Height)
                ArrGreen(x) = (ArrGreen(x) * 255) / (ImageData.Width * ImageData.Height)
                ArrBlue(x) = (ArrBlue(x) * 255) / (ImageData.Width * ImageData.Height)
            Next

            CR(0) = ArrRed(0)
            CG(0) = ArrGreen(0)
            CB(0) = ArrBlue(0)

            For x = 1 To 255
                CR(x) = CR(x - 1) + ArrRed(x)
                CG(x) = CG(x - 1) + ArrGreen(x)
                CB(x) = CB(x - 1) + ArrBlue(x)
            Next

            For y = 0 To ImageData.Height - 1
                For x = 0 To ImageData.Width - 1
                    Pixel = ImageData.GetPixel(x, y)
                    ImageEqualization.SetPixel(x, y, Color.FromArgb(CR(Pixel.R), CG(Pixel.G), CB(Pixel.B)))
                Next
            Next

            For y = 0 To ImageData.Height - 1
                For x = 0 To ImageData.Width - 1
                    Pixel = ImageEqualization.GetPixel(x, y)
                    ArrRed(Pixel.R) = ArrRed(Pixel.R) + 1
                    ArrGreen(Pixel.G) = ArrGreen(Pixel.G) + 1
                    ArrBlue(Pixel.B) = ArrBlue(Pixel.B) + 1
                Next
            Next

            CreateGraph(ArrRed, "R")
            CreateGraph(ArrGreen, "G")
            CreateGraph(ArrBlue, "B")

            If status = "Browse" Then
                ImageEqualization.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
            ElseIf status = "Default" Then
                ImageEqualization.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
            Else
                Warning.Text = "พบปัญหาที่ฟังก์ชัน HistogramEqualization_Click"
                Exit Sub
            End If

            ImageData.Dispose()
            ImageEqualization.Dispose()

        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Private Sub CreateGraph(ByVal value() As Double, ByVal str As String)
        Try
            Dim ds As DataSet = GetDataSet(value)
            If IsNothing(ds) Then
                Warning.Text = "พบปัญหาที่ฟังก์ชัน GetDataSet"
                Exit Sub
            Else
                Dim view As DataView = ds.Tables(0).DefaultView
                Dim chart As New LineChart()
                chart.Line.Color = Color.SteelBlue
                chart.Line.Width = 1
                chart.DataSource = view
                chart.DataXValueField = "X"
                chart.DataYValueField = "Y"
                chart.DataBind()
                If str = "R" Then
                    RedHistogramChart.Charts.Add(chart)
                    ConfigureColors(str)
                    RedHistogramChart.RedrawChart()
                ElseIf str = "G" Then
                    GreenHistogramChart.Charts.Add(chart)
                    ConfigureColors(str)
                    GreenHistogramChart.RedrawChart()
                ElseIf str = "B" Then
                    BlueHistogramChart.Charts.Add(chart)
                    ConfigureColors(str)
                    BlueHistogramChart.RedrawChart()
                End If
            End If
        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Private Function GetDataSet(ByVal value() As Double) As DataSet
        Try
            Dim ds As New DataSet()
            Dim table As DataTable = ds.Tables.Add("Data")
            table.Columns.Add("X")
            table.Columns.Add("Y", GetType(Double))
            Dim i As Integer
            For i = 0 To 255
                Dim row As DataRow = table.NewRow()
                row("X") = i.ToString()
                row("Y") = value(i)
                table.Rows.Add(row)
            Next
            Return ds
        Catch ex As Exception
            Dim ds As New DataSet()
            Return ds
            Exit Function
        End Try
    End Function

    ' Configure some colors for the Chart, this could be done declaratively also
    Private Sub ConfigureColors(ByVal str As String)
        Try
            If str = "R" Then
                RedHistogramChart.Background.Color = Color.Red
                RedHistogramChart.ChartTitle.Text = "Histogram of Red"
                RedHistogramChart.ChartTitle.ForeColor = Color.White
                RedHistogramChart.Border.Color = Color.Brown
                RedHistogramChart.BorderStyle = BorderStyle.Solid
            ElseIf str = "G" Then
                GreenHistogramChart.Background.Color = Color.Green
                GreenHistogramChart.ChartTitle.Text = "Histogram of Green"
                GreenHistogramChart.ChartTitle.ForeColor = Color.White
                GreenHistogramChart.Border.Color = Color.Brown
                GreenHistogramChart.BorderStyle = BorderStyle.Solid
            ElseIf str = "B" Then
                BlueHistogramChart.Background.Color = Color.Blue
                BlueHistogramChart.ChartTitle.Text = "Histogram of Blue"
                BlueHistogramChart.ChartTitle.ForeColor = Color.White
                BlueHistogramChart.Border.Color = Color.Brown
                BlueHistogramChart.BorderStyle = BorderStyle.Solid
            End If
        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub
End Class
