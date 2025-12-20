Imports System
Imports System.IO
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Collections
Imports System.ComponentModel
Imports System.Data
Imports System.Math

Partial Class OrderStatisticFlitering
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

    Protected Sub MedianFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles MedianFilter.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            Dim ImageData As Bitmap
            Dim ImageTemp As Bitmap
            Dim ImageMedian As Bitmap
            Dim NameAfter As String = ""
            Dim ArrNameAfter(1) As String
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

            ImageTemp = New Bitmap(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), PixelFormat.Format32bppArgb)
            ImageMedian = New Bitmap(ImageData.Width, ImageData.Height, PixelFormat.Format32bppArgb)
            ImageTemp = Padding(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), (Window.SelectedItem.Value - 1), ImageData, ImageTemp)
            ImageMedian = OrderStatisticFilter(ImageData.Width, ImageData.Height, (Window.SelectedItem.Value - 1), ImageTemp, ImageMedian, "Median", 0, 0)

            If status = "Browse" Then
                ImageMedian.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
            ElseIf status = "Default" Then
                ImageMedian.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
            Else
                Warning.Text = "พบปัญหาที่ฟังก์ชัน MedianFilter_Click"
                Exit Sub
            End If

            ImageData.Dispose()
            ImageTemp.Dispose()
            ImageMedian.Dispose()
            
        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Protected Sub MaxFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles MaxFilter.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            Dim ImageData As Bitmap
            Dim ImageTemp As Bitmap
            Dim ImageMax As Bitmap
            Dim NameAfter As String = ""
            Dim ArrNameAfter(1) As String
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

            ImageTemp = New Bitmap(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), PixelFormat.Format32bppArgb)
            ImageMax = New Bitmap(ImageData.Width, ImageData.Height, PixelFormat.Format32bppArgb)
            ImageTemp = Padding(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), (Window.SelectedItem.Value - 1), ImageData, ImageTemp)
            ImageMax = OrderStatisticFilter(ImageData.Width, ImageData.Height, (Window.SelectedItem.Value - 1), ImageTemp, ImageMax, "Max", 0, 0)

            If status = "Browse" Then
                ImageMax.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
            ElseIf status = "Default" Then
                ImageMax.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
            Else
                Warning.Text = "พบปัญหาที่ฟังก์ชัน MaxFilter_Click"
                Exit Sub
            End If

            ImageData.Dispose()
            ImageTemp.Dispose()
            ImageMax.Dispose()

        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Protected Sub MinFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles MinFilter.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            Dim ImageData As Bitmap
            Dim ImageTemp As Bitmap
            Dim ImageMin As Bitmap
            Dim NameAfter As String = ""
            Dim ArrNameAfter(1) As String

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

            ImageTemp = New Bitmap(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), PixelFormat.Format32bppArgb)
            ImageMin = New Bitmap(ImageData.Width, ImageData.Height, PixelFormat.Format32bppArgb)
            ImageTemp = Padding(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), (Window.SelectedItem.Value - 1), ImageData, ImageTemp)
            ImageMin = OrderStatisticFilter(ImageData.Width, ImageData.Height, (Window.SelectedItem.Value - 1), ImageTemp, ImageMin, "Min", 0, 0)

            If status = "Browse" Then
                ImageMin.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
            ElseIf status = "Default" Then
                ImageMin.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
            Else
                Warning.Text = "พบปัญหาที่ฟังก์ชัน MinFilter_Click"
                Exit Sub
            End If
            
            ImageData.Dispose()
            ImageTemp.Dispose()
            ImageMin.Dispose()

        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Protected Sub MidPointFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles MidPointFilter.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            Dim ImageData As Bitmap
            Dim ImageTemp As Bitmap
            Dim ImageMidPoint As Bitmap
            Dim NameAfter As String = ""
            Dim ArrNameAfter(1) As String

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

            ImageTemp = New Bitmap(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), PixelFormat.Format32bppArgb)
            ImageMidPoint = New Bitmap(ImageData.Width, ImageData.Height, PixelFormat.Format32bppArgb)
            ImageTemp = Padding(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), (Window.SelectedItem.Value - 1), ImageData, ImageTemp)
            ImageMidPoint = OrderStatisticFilter(ImageData.Width, ImageData.Height, (Window.SelectedItem.Value - 1), ImageTemp, ImageMidPoint, "MidPoint", 0, 0)

            If status = "Browse" Then
                ImageMidPoint.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
            ElseIf status = "Default" Then
                ImageMidPoint.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
            Else
                Warning.Text = "พบปัญหาที่ฟังก์ชัน MidPointFilter_Click"
                Exit Sub
            End If
            
            ImageData.Dispose()
            ImageTemp.Dispose()
            ImageMidPoint.Dispose()

        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Protected Sub AlphaTrimmedMeanFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AlphaTrimmedMeanFilter.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            If IsNumeric(D.Text) Then
                If Val(D.Text) >= 0 And Val(D.Text) <= ((Window.SelectedItem.Value ^ 2) - 3) Then
                    If (Val(D.Text) Mod 2) = 0 Then
                        Dim MND As Integer = (Window.SelectedItem.Value ^ 2) - Val(D.Text)
                        Dim ImageData As Bitmap
                        Dim ImageTemp As Bitmap
                        Dim ImageAlpha As Bitmap
                        Dim NameAfter As String = ""
                        Dim ArrNameAfter(1) As String
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
                        ImageTemp = New Bitmap(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), PixelFormat.Format32bppArgb)
                        ImageAlpha = New Bitmap(ImageData.Width, ImageData.Height, PixelFormat.Format32bppArgb)
                        ImageTemp = Padding(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), (Window.SelectedItem.Value - 1), ImageData, ImageTemp)
                        ImageAlpha = OrderStatisticFilter(ImageData.Width, ImageData.Height, (Window.SelectedItem.Value - 1), ImageTemp, ImageAlpha, "Alpha", MND, Val(D.Text))
                        If status = "Browse" Then
                            ImageAlpha.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                            ImageAfter.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
                        ElseIf status = "Default" Then
                            ImageAlpha.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                            ImageAfter.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
                        Else
                            Warning.Text = "พบปัญหาที่ฟังก์ชัน AlphaTrimmedMeanFilter_Click"
                            Exit Sub
                        End If
                        ImageData.Dispose()
                        ImageTemp.Dispose()
                        ImageAlpha.Dispose()
                    Else
                        Warning.Text = "กรุณาใส่ค่าเป็นเลขจำนวนเต็มคู่"
                        Exit Sub
                    End If
                Else
                    Warning.Text = "กรุณาใส่ค่าเป็นเลขจำนวนเต็มที่มากกว่าหรือเท่ากับศูนย์ และน้อยกว่าค่าของ Window ลบด้วย 3 เช่น 3x3=9 ก็ต้องใส่ค่าเป็น 0 หรือ 2 หรือ 4 หรือ 6 เป็นต้น"
                    Exit Sub
                End If
            ElseIf D.Text = "" Then
                Warning.Text = "กรุณาใส่ค่าของ Value D :"
                Exit Sub
            Else
                Warning.Text = "กรุณาใส่ค่าเป็นเลขจำนวนเต็มที่มากกว่าหรือเท่ากับศูนย์ และเป็นเลขจำนวนเต็มคู่"
                Exit Sub
            End If
        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Function Padding(ByVal w As Integer, ByVal h As Integer, ByVal p As Integer, ByVal ImgDt As Bitmap, ByVal ImgTmp As Bitmap) As Bitmap
        Try
            Dim Pixel As Color
            Dim x, y As Integer
            For y = 0 To h - 1
                For x = 0 To w - 1
                    If x >= (p / 2) And x < (w - (p / 2)) Then
                        If y >= (p / 2) And y < (h - (p / 2)) Then
                            Pixel = ImgDt.GetPixel(x - (p / 2), y - (p / 2))
                            ImgTmp.SetPixel(x, y, Pixel)
                        Else
                            ImgTmp.SetPixel(x, y, Color.Black)
                        End If
                    Else
                        ImgTmp.SetPixel(x, y, Color.Black)
                    End If
                Next
            Next
            Return ImgTmp
        Catch ex As Exception
            Warning.Text = ex.Message
            Return ImgTmp
        End Try
    End Function

    Function OrderStatisticFilter(ByVal w As Integer, ByVal h As Integer, ByVal p As Integer, ByVal ImgTmp As Bitmap, ByVal ImgOut As Bitmap, ByVal type As String, ByVal mnd As Integer, ByVal d As Integer) As Bitmap
        Try
            Dim i, j, x, y As Integer
            Dim xtemp As Integer = 0
            Dim ytemp As Integer = 0
            Dim TempMedianRed(((p + 1) ^ 2) - 1) As Integer
            Dim TempMedianGreen(((p + 1) ^ 2) - 1) As Integer
            Dim TempMedianBlue(((p + 1) ^ 2) - 1) As Integer
            Dim index As Integer = 0
            Dim Pixel As Color

            For y = 0 To h - 1
                For x = 0 To w - 1
                    xtemp = x
                    ytemp = y
                    index = 0
                    For j = ytemp To ytemp + p
                        For i = xtemp To xtemp + p
                            Pixel = ImgTmp.GetPixel(i, j)
                            TempMedianRed(index) = Pixel.R
                            TempMedianGreen(index) = Pixel.G
                            TempMedianBlue(index) = Pixel.B
                            index = index + 1
                        Next
                    Next
                    Array.Sort(TempMedianRed)
                    Array.Sort(TempMedianGreen)
                    Array.Sort(TempMedianBlue)
                    If type = "Median" Then
                        ImgOut.SetPixel(x, y, Color.FromArgb(TempMedianRed((((p + 1) ^ 2) - 1) \ 2), TempMedianGreen((((p + 1) ^ 2) - 1) \ 2), TempMedianBlue((((p + 1) ^ 2) - 1) \ 2)))
                    ElseIf type = "Max" Then
                        ImgOut.SetPixel(x, y, Color.FromArgb(TempMedianRed(((p + 1) ^ 2) - 1), TempMedianGreen(((p + 1) ^ 2) - 1), TempMedianBlue(((p + 1) ^ 2) - 1)))
                    ElseIf type = "Min" Then
                        ImgOut.SetPixel(x, y, Color.FromArgb(TempMedianRed(0), TempMedianGreen(0), TempMedianBlue(0)))
                    ElseIf type = "MidPoint" Then
                        ImgOut.SetPixel(x, y, Color.FromArgb(CInt((TempMedianRed(((p + 1) ^ 2) - 1) + TempMedianRed(0)) / 2), CInt((TempMedianGreen(((p + 1) ^ 2) - 1) + TempMedianGreen(0)) / 2), CInt((TempMedianBlue(((p + 1) ^ 2) - 1) + TempMedianBlue(0)) / 2)))
                    ElseIf type = "Alpha" Then
                        Dim k As Integer = 0
                        Dim SumRed As Integer = 0
                        Dim SumGreen As Integer = 0
                        Dim SumBlue As Integer = 0
                        For k = d / 2 To ((mnd + d) - 1) - (d / 2)
                            SumRed += TempMedianRed(k)
                            SumGreen += TempMedianGreen(k)
                            SumBlue += TempMedianBlue(k)
                        Next
                        SumRed = SumRed / mnd
                        SumGreen = SumGreen / mnd
                        SumBlue = SumBlue / mnd
                        If SumRed > 255 Then
                            SumRed = 255
                        ElseIf SumRed < 0 Then
                            SumRed = 0
                        End If
                        If SumGreen > 255 Then
                            SumGreen = 255
                        ElseIf SumGreen < 0 Then
                            SumGreen = 0
                        End If
                        If SumBlue > 255 Then
                            SumBlue = 255
                        ElseIf SumBlue < 0 Then
                            SumBlue = 0
                        End If
                        ImgOut.SetPixel(x, y, Color.FromArgb(SumRed, SumGreen, SumBlue))
                    End If
                Next
            Next
            Return ImgOut
        Catch ex As Exception
            Warning.Text = ex.Message
            Return ImgOut
        End Try
    End Function
End Class
