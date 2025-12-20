Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.IO
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.ComponentModel
Imports System.Math
Imports WebChart

Partial Class ColorBalance
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
            RedColorBalanceChart.Visible = False
            GreenColorBalanceChart.Visible = False
            BlueColorBalanceChart.Visible = False
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

    Protected Sub Linear_ContrastBrightness_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Linear_ContrastBrightness.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            Dim ImageData As Bitmap
            Dim ImageTemp As Bitmap
            Dim NameAfter As String = ""
            Dim ArrNameAfter(1) As String
            Dim Pixel As Color
            Dim PixelTemp As Double = 0.0
            Dim LUTR(255) As Byte
            Dim LUTG(255) As Byte
            Dim LUTB(255) As Byte
            Dim GraphRValue(255) As Double
            Dim GraphGValue(255) As Double
            Dim GraphBValue(255) As Double
            Dim i, x, y As Integer
            Dim RValue As Double = Val(txtValue1.Text) * 0.1
            Dim GValue As Double = Val(txtValue2.Text) * 0.1
            Dim BValue As Double = Val(txtValue3.Text) * 0.1

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

            ImageTemp = New Bitmap(ImageData.Width, ImageData.Height, PixelFormat.Format32bppArgb)

            For i = 0 To 255
                PixelTemp = (i ^ RValue)
                If PixelTemp > 255 Then
                    PixelTemp = 255
                Else
                    If PixelTemp < 0 Then
                        PixelTemp = 0
                    End If
                End If
                GraphRValue(i) = PixelTemp
                LUTR(i) = CType((PixelTemp), Byte)
            Next

            CreateGraph(GraphRValue, "R")
            RedColorBalanceChart.Visible = True

            For i = 0 To 255
                PixelTemp = (i ^ GValue)
                If PixelTemp > 255 Then
                    PixelTemp = 255
                Else
                    If PixelTemp < 0 Then
                        PixelTemp = 0
                    End If
                End If
                GraphGValue(i) = PixelTemp
                LUTG(i) = CType((PixelTemp), Byte)
            Next

            CreateGraph(GraphGValue, "G")
            GreenColorBalanceChart.Visible = True

            For i = 0 To 255
                PixelTemp = (i ^ BValue)
                If PixelTemp > 255 Then
                    PixelTemp = 255
                Else
                    If PixelTemp < 0 Then
                        PixelTemp = 0
                    End If
                End If
                GraphBValue(i) = PixelTemp
                LUTB(i) = CType((PixelTemp), Byte)
            Next

            CreateGraph(GraphBValue, "B")
            BlueColorBalanceChart.Visible = True

            For y = 0 To ImageData.Height - 1
                For x = 0 To ImageData.Width - 1
                    Pixel = ImageData.GetPixel(x, y)
                    ImageTemp.SetPixel(x, y, Color.FromArgb(CInt(LUTR(Pixel.R)), CInt(LUTG(Pixel.G)), CInt(LUTB(Pixel.B))))
                Next
            Next

            If status = "Browse" Then
                ImageTemp.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
            ElseIf status = "Default" Then
                ImageTemp.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
            Else
                Warning.Text = "พบปัญหาที่ฟังก์ชัน Linear_ContrastBrightness_Click"
                Exit Sub
            End If

            ImageTemp.Dispose()
            ImageData.Dispose()

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
                    RedColorBalanceChart.Charts.Add(chart)
                    ConfigureColors(str)
                    RedColorBalanceChart.RedrawChart()
                ElseIf str = "G" Then
                    GreenColorBalanceChart.Charts.Add(chart)
                    ConfigureColors(str)
                    GreenColorBalanceChart.RedrawChart()
                ElseIf str = "B" Then
                    BlueColorBalanceChart.Charts.Add(chart)
                    ConfigureColors(str)
                    BlueColorBalanceChart.RedrawChart()
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
                RedColorBalanceChart.Background.Color = Color.Red
                RedColorBalanceChart.ChartTitle.Text = "Color Balance of Red"
                RedColorBalanceChart.ChartTitle.ForeColor = Color.White
                RedColorBalanceChart.Border.Color = Color.Brown
                RedColorBalanceChart.BorderStyle = BorderStyle.Solid
            ElseIf str = "G" Then
                GreenColorBalanceChart.Background.Color = Color.Green
                GreenColorBalanceChart.ChartTitle.Text = "Color Balace of Green"
                GreenColorBalanceChart.ChartTitle.ForeColor = Color.White
                GreenColorBalanceChart.Border.Color = Color.Brown
                GreenColorBalanceChart.BorderStyle = BorderStyle.Solid
            ElseIf str = "B" Then
                BlueColorBalanceChart.Background.Color = Color.Blue
                BlueColorBalanceChart.ChartTitle.Text = "Color Balance of Blue"
                BlueColorBalanceChart.ChartTitle.ForeColor = Color.White
                BlueColorBalanceChart.Border.Color = Color.Brown
                BlueColorBalanceChart.BorderStyle = BorderStyle.Solid
            End If
        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub
End Class
