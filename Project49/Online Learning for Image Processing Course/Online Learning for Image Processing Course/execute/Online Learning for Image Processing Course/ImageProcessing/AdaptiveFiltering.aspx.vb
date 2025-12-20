Imports System
Imports System.IO
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Collections
Imports System.ComponentModel
Imports System.Data
Imports System.Math

Partial Class AdaptiveFiltering
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
            AdtMed.Text = ""
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

    Protected Sub AdaptiveMMSEFiltering_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AdaptiveMMSEFiltering.Click
        Try
            AdtMed.Text = ""
            Warning.Text = ""
            If IsNumeric(DN.Text) Then
                Dim status As String = ""
                Dim ImageData As Bitmap
                Dim ImageTemp As Bitmap
                Dim ImageMMSE As Bitmap
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
                ImageMMSE = New Bitmap(ImageData.Width, ImageData.Height, PixelFormat.Format32bppArgb)
                ImageTemp = Padding(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), (Window.SelectedItem.Value - 1), ImageData, ImageTemp)
                ImageMMSE = MMSEFilter(ImageData.Width, ImageData.Height, (Window.SelectedItem.Value - 1), ImageData, ImageTemp, ImageMMSE, Val(DN.Text))

                If status = "Browse" Then
                    ImageMMSE.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                    ImageAfter.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
                ElseIf status = "Default" Then
                    ImageMMSE.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                    ImageAfter.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
                Else
                    Warning.Text = "พบปัญหาที่ฟังก์ชัน AdaptiveMMSEFiltering_Click"
                    Exit Sub
                End If

                ImageData.Dispose()
                ImageTemp.Dispose()
                ImageMMSE.Dispose()

            ElseIf DN.Text = "" Then
                Warning.Text = "กรุณาใส่ค่าของ Value Deviation of Noise :"
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

    Protected Sub AdaptiveMedianFiltering_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AdaptiveMedianFiltering.Click
        Try
            AdtMed.Text = ""
            Warning.Text = ""
            Dim status As String = ""
            Dim ImageData As Bitmap
            Dim ImageTemp As Bitmap
            Dim ImageAdtMed As Bitmap
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
            ImageAdtMed = New Bitmap(ImageData.Width, ImageData.Height, PixelFormat.Format32bppArgb)
            ImageTemp = Padding(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), (Window.SelectedItem.Value - 1), ImageData, ImageTemp)
            ImageAdtMed = AdtMedianFilter(ImageData.Width, ImageData.Height, (Window.SelectedItem.Value - 1), ImageData, ImageTemp, ImageAdtMed)

            If status = "Browse" Then
                ImageAdtMed.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
            ElseIf status = "Default" Then
                ImageAdtMed.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
            Else
                Warning.Text = "พบปัญหาที่ฟังก์ชัน AdaptiveMedianFiltering_Click"
                Exit Sub
            End If

            ImageData.Dispose()
            ImageTemp.Dispose()
            ImageAdtMed.Dispose()

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

    Function MMSEFilter(ByVal w As Integer, ByVal h As Integer, ByVal p As Integer, ByVal ImgDt As Bitmap, ByVal ImgTmp As Bitmap, ByVal ImgOut As Bitmap, ByVal DN As Double) As Bitmap
        Try
            Dim i, j, x, y As Integer
            Dim xtemp As Integer = 0
            Dim ytemp As Integer = 0
            Dim index As Integer = 0
            Dim Pixel As Color
            Dim GetRed(((p + 1) ^ 2) - 1) As Integer
            Dim GetGreen(((p + 1) ^ 2) - 1) As Integer
            Dim GetBlue(((p + 1) ^ 2) - 1) As Integer
            Dim SumR As Integer = 0
            Dim SumG As Integer = 0
            Dim SumB As Integer = 0
            Dim MLR As Integer = 0
            Dim MLG As Integer = 0
            Dim MLB As Integer = 0
            Dim DLR As Integer = 0
            Dim DLG As Integer = 0
            Dim DLB As Integer = 0

            For y = 0 To h - 1
                For x = 0 To w - 1
                    xtemp = x
                    ytemp = y
                    index = 0
                    For j = ytemp To ytemp + p
                        For i = xtemp To xtemp + p
                            Pixel = ImgTmp.GetPixel(i, j)
                            GetRed(index) = Pixel.R
                            SumR += Pixel.R
                            GetGreen(index) = Pixel.G
                            SumG += Pixel.G
                            GetBlue(index) = Pixel.B
                            SumB += Pixel.B
                            index = index + 1
                        Next
                    Next

                    MLR = SumR / ((p + 1) ^ 2)
                    MLG = SumG / ((p + 1) ^ 2)
                    MLB = SumB / ((p + 1) ^ 2)

                    DLR = 0
                    DLG = 0
                    DLB = 0

                    For i = 0 To ((p + 1) ^ 2) - 1
                        DLR += (GetRed(i) - MLR) ^ 2
                        DLG += (GetGreen(i) - MLG) ^ 2
                        DLB += (GetBlue(i) - MLB) ^ 2
                    Next

                    Pixel = ImgDt.GetPixel(x, y)

                    If DLR = 0 Then
                        SumR = Pixel.R
                    Else
                        SumR = Pixel.R - (((DN ^ 2) / DLR) * (Pixel.R - MLR))
                    End If
                    If DLG = 0 Then
                        SumG = Pixel.G
                    Else
                        SumG = Pixel.G - (((DN ^ 2) / DLG) * (Pixel.G - MLG))
                    End If
                    If DLB = 0 Then
                        SumB = Pixel.B
                    Else
                        SumB = Pixel.B - (((DN ^ 2) / DLB) * (Pixel.B - MLB))
                    End If

                    If SumR > 255 Then
                        SumR = 255
                    ElseIf SumR < 0 Then
                        SumR = 0
                    End If
                    If SumG > 255 Then
                        SumG = 255
                    ElseIf SumG < 0 Then
                        SumG = 0
                    End If
                    If SumB > 255 Then
                        SumB = 255
                    ElseIf SumB < 0 Then
                        SumB = 0
                    End If

                    ImgOut.SetPixel(x, y, Color.FromArgb(SumR, SumG, SumB))
                Next
            Next
            Return ImgOut
        Catch ex As Exception
            Warning.Text = ex.Message
            Return ImgOut
        End Try
    End Function

    Function AdtMedianFilter(ByVal w As Integer, ByVal h As Integer, ByVal p As Integer, ByVal ImgDt As Bitmap, ByVal ImgTmp As Bitmap, ByVal ImgOut As Bitmap) As Bitmap
        Try
            Dim k As Integer = p + 1
            Dim i, j, x, y As Integer
            Dim xtemp As Integer = 0
            Dim ytemp As Integer = 0
            Dim index As Integer = 0
            Dim Pixel As Color
            Dim SumR As Integer = 0
            Dim SumG As Integer = 0
            Dim SumB As Integer = 0
            Dim tmp As Integer = 0

            While k <= 9
                tmp = 0
                For y = 0 To h - 1
                    If tmp = 100 Then
                        Exit For
                    End If
                    For x = 0 To w - 1
                        Dim TempMedianRed((k ^ 2) - 1) As Integer
                        Dim TempMedianGreen((k ^ 2) - 1) As Integer
                        Dim TempMedianBlue((k ^ 2) - 1) As Integer
                        xtemp = x
                        ytemp = y
                        index = 0
                        For j = ytemp To ytemp + (k - 1)
                            For i = xtemp To xtemp + (k - 1)
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

                        index = ((k ^ 2) - 1) \ 2
                        Pixel = ImgDt.GetPixel(x, y)

                        If (TempMedianRed(0) <= TempMedianRed(index)) And (TempMedianRed(index) < TempMedianRed((k ^ 2) - 1)) Then
                            If (TempMedianRed(0) < Pixel.R) And (Pixel.R < TempMedianRed((k ^ 2) - 1)) Then
                                SumR = Pixel.R
                            Else
                                SumR = TempMedianRed(index)
                            End If
                        Else
                            k = k + 2
                            ImgTmp = New Bitmap(w + (k - 1), h + (k - 1), PixelFormat.Format32bppArgb)
                            ImgTmp = Padding(w + (k - 1), h + (k - 1), (k - 1), ImgDt, ImgTmp)
                            tmp = 100
                            Exit For
                        End If
                        If (TempMedianGreen(0) <= TempMedianGreen(index)) And (TempMedianGreen(index) < TempMedianGreen((k ^ 2) - 1)) Then
                            If (TempMedianGreen(0) < Pixel.G) And (Pixel.G < TempMedianGreen((k ^ 2) - 1)) Then
                                SumG = Pixel.G
                            Else
                                SumG = TempMedianGreen(index)
                            End If
                        Else
                            k = k + 2
                            ImgTmp = New Bitmap(w + (k - 1), h + (k - 1), PixelFormat.Format32bppArgb)
                            ImgTmp = Padding(w + (k - 1), h + (k - 1), (k - 1), ImgDt, ImgTmp)
                            tmp = 100
                            Exit For
                        End If
                        If (TempMedianBlue(0) <= TempMedianBlue(index)) And (TempMedianBlue(index) < TempMedianBlue((k ^ 2) - 1)) Then
                            If (TempMedianBlue(0) < Pixel.B) And (Pixel.B < TempMedianBlue((k ^ 2) - 1)) Then
                                SumB = Pixel.B
                            Else
                                SumB = TempMedianBlue(index)
                            End If
                        Else
                            k = k + 2
                            ImgTmp = New Bitmap(w + (k - 1), h + (k - 1), PixelFormat.Format32bppArgb)
                            ImgTmp = Padding(w + (k - 1), h + (k - 1), (k - 1), ImgDt, ImgTmp)
                            tmp = 100
                            Exit For
                        End If

                        If SumR > 255 Then
                            SumR = 255
                        ElseIf SumR < 0 Then
                            SumR = 0
                        End If
                        If SumG > 255 Then
                            SumG = 255
                        ElseIf SumG < 0 Then
                            SumG = 0
                        End If
                        If SumB > 255 Then
                            SumB = 255
                        ElseIf SumB < 0 Then
                            SumB = 0
                        End If

                        ImgOut.SetPixel(x, y, Color.FromArgb(SumR, SumG, SumB))
                    Next
                Next
                If y > h - 1 And x > w - 1 Then
                    AdtMed.Text = "Adaptive Median Filtering use Window Size = " & k & "x" & k
                    Exit While
                End If
            End While
            If k > 9 Then
                Warning.Text = "ต้องใช้ Window Size ที่มีค่ามากกว่า 9x9"
                Return ImgDt
            End If
            Return ImgOut
        Catch ex As Exception
            Warning.Text = ex.Message
            Return ImgOut
        End Try
    End Function
End Class
