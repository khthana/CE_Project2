Imports System
Imports System.IO
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Collections
Imports System.ComponentModel
Imports System.Data
Imports System.Math

Partial Class ArithmeticMeanFiltering
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
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
                CreateTextBox(3)
            Else
                If Window.SelectedItem.Value = 3 Then
                    CreateTextBox(3)
                ElseIf Window.SelectedItem.Value = 5 Then
                    CreateTextBox(5)
                ElseIf Window.SelectedItem.Value = 7 Then
                    CreateTextBox(7)
                ElseIf Window.SelectedItem.Value = 9 Then
                    CreateTextBox(9)
                End If
            End If
        Catch ex As Exception
            Warning.Text = "พบปัญหาที่ฟังก์ชัน Page_Load" & "<br />" & ex.Message
            Exit Sub
        End Try
    End Sub

    Function GetLiteral(ByVal text As String)
        Try
            Dim rv As Literal
            rv = New Literal
            rv.Text = text
            GetLiteral = rv
        Catch ex As Exception
            Warning.Text = "พบปัญหาที่ฟังก์ชัน GetLiteral" & "<br />" & ex.Message
            GetLiteral = "<br />"
        End Try
    End Function

    Sub CreateTextBox(ByVal size As Integer)
        Try
            Dim i, j As Integer
            For j = 0 To size - 1
                For i = 0 To size - 1
                    Dim ltxtText As New TextBox
                    ltxtText.ID = "box" & j & i
                    ltxtText.Width = "30"
                    ltxtText.Text = 1
                    TextBoxesHere.Controls.Add(ltxtText)
                Next
                TextBoxesHere.Controls.Add(GetLiteral("<br />"))
            Next
        Catch ex As Exception
            Warning.Text = "พบปัญหาที่ฟังก์ชัน CreateTextBox" & "<br />" & ex.Message
            Exit Sub
        End Try
    End Sub

    Function CheckIsNumeric(ByVal size As Integer, ByVal window As Array) As Array
        Dim i, j, k As Integer
        'Dim window(size - 1, size - 1) As Double
        Dim Temp(0) As String
        k = 0
        For j = 0 To size - 1
            If k = 100 Then
                Exit For
            End If
            For i = 0 To size - 1
                Dim tmp As String = "box" & j & i
                Dim GetTB As TextBox = CType(Me.FindControl(tmp), TextBox)
                If IsNumeric(GetTB.Text) Then
                    window(j, i) = Val(GetTB.Text)
                ElseIf GetTB.Text = "" Then
                    Warning.Text = "box" & j & i & " : ไม่ได้ใส่ค่า"
                    k = 100
                    Temp(0) = "-"
                    Exit For
                Else
                    Warning.Text = "box" & j & i & " : ไม่ใช่ตัวเลข"
                    k = 100
                    Temp(0) = "-"
                    Exit For
                End If
            Next
        Next
        If k = 100 Then
            Return Temp
        Else
            Return window
        End If
    End Function

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

    Protected Sub ArithmeticConvolution_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ArithmeticConvolution.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            Dim windows(Window.SelectedItem.Value - 1, Window.SelectedItem.Value - 1) As Double
            If Window.SelectedItem.Value = 3 Then
                If CheckIsNumeric(3, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(3, windows)
                End If
            ElseIf Window.SelectedItem.Value = 5 Then
                If CheckIsNumeric(5, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(5, windows)
                End If
            ElseIf Window.SelectedItem.Value = 7 Then
                If CheckIsNumeric(7, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(7, windows)
                End If
            ElseIf Window.SelectedItem.Value = 9 Then
                If CheckIsNumeric(9, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(9, windows)
                End If
            End If

            Dim i, j As Integer
            Dim WindowSum As Double = 0
            For j = 0 To Window.SelectedItem.Value - 1
                For i = 0 To Window.SelectedItem.Value - 1
                    WindowSum += windows(j, i)
                Next
            Next

            If WindowSum = 0 Then
                Warning.Text = "ผลบวกของ Window นั้นต้องไม่เป็นศูนย์"
                Exit Sub
            End If

            Dim ImageData As Bitmap
            Dim ImageTemp As Bitmap
            Dim ImageArithConv As Bitmap
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
            ImageArithConv = New Bitmap(ImageData.Width, ImageData.Height, PixelFormat.Format32bppArgb)
            ImageTemp = Padding(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), (Window.SelectedItem.Value - 1), ImageData, ImageTemp)
            ImageArithConv = ArithmeticMeanFilter(ImageData.Width, ImageData.Height, (Window.SelectedItem.Value - 1), ImageTemp, ImageArithConv, windows, WindowSum, "Convolution")

            If status = "Browse" Then
                ImageArithConv.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
            ElseIf status = "Default" Then
                ImageArithConv.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
            Else
                Warning.Text = "พบปัญหาที่ฟังก์ชัน ArithmeticConvolution_Click"
                Exit Sub
            End If

            ImageData.Dispose()
            ImageTemp.Dispose()
            ImageArithConv.Dispose()

        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Protected Sub ArithmeticCorelation_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ArithmeticCorelation.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            Dim windows(Window.SelectedItem.Value - 1, Window.SelectedItem.Value - 1) As Double
            If Window.SelectedItem.Value = 3 Then
                If CheckIsNumeric(3, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(3, windows)
                End If
            ElseIf Window.SelectedItem.Value = 5 Then
                If CheckIsNumeric(5, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(5, windows)
                End If
            ElseIf Window.SelectedItem.Value = 7 Then
                If CheckIsNumeric(7, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(7, windows)
                End If
            ElseIf Window.SelectedItem.Value = 9 Then
                If CheckIsNumeric(9, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(9, windows)
                End If
            End If

            Dim i, j As Integer
            Dim WindowSum As Double = 0
            For j = 0 To Window.SelectedItem.Value - 1
                For i = 0 To Window.SelectedItem.Value - 1
                    WindowSum += windows(j, i)
                Next
            Next

            If WindowSum = 0 Then
                Warning.Text = "ผลบวกของ Window นั้นต้องไม่เป็นศูนย์"
                Exit Sub
            End If

            Dim ImageData As Bitmap
            Dim ImageTemp As Bitmap
            Dim ImageArithCore As Bitmap
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
            ImageArithCore = New Bitmap(ImageData.Width, ImageData.Height, PixelFormat.Format32bppArgb)
            ImageTemp = Padding(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), (Window.SelectedItem.Value - 1), ImageData, ImageTemp)
            ImageArithCore = ArithmeticMeanFilter(ImageData.Width, ImageData.Height, (Window.SelectedItem.Value - 1), ImageTemp, ImageArithCore, windows, WindowSum, "Corelation")

            If status = "Browse" Then
                ImageArithCore.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
            ElseIf status = "Default" Then
                ImageArithCore.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
            Else
                Warning.Text = "พบปัญหาที่ฟังก์ชัน ArithmeticCorelation_Click"
                Exit Sub
            End If

            ImageData.Dispose()
            ImageTemp.Dispose()
            ImageArithCore.Dispose()
 
        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Function ArithmeticMeanFilter(ByVal w As Integer, ByVal h As Integer, ByVal p As Integer, ByVal ImgTmp As Bitmap, ByVal ImgOut As Bitmap, ByVal window As Array, ByVal windowsum As Double, ByVal type As String) As Bitmap
        Try
            Dim i, j, s, t, x, y As Integer
            Dim xtemp As Integer = 0
            Dim ytemp As Integer = 0
            Dim SumR As Double = 0
            Dim SumG As Double = 0
            Dim SumB As Double = 0
            Dim Pixel As Color

            For y = 0 To h - 1
                For x = 0 To w - 1
                    If type = "Convolution" Then
                        i = p
                        j = p
                    ElseIf type = "Corelation" Then
                        i = 0
                        j = 0
                    End If

                    SumR = 0
                    SumG = 0
                    SumB = 0

                    xtemp = x
                    ytemp = y
                    For t = ytemp To ytemp + p
                        For s = xtemp To xtemp + p
                            Pixel = ImgTmp.GetPixel(s, t)
                            SumR += (window(i, j) * Pixel.R)
                            SumG += (window(i, j) * Pixel.G)
                            SumB += (window(i, j) * Pixel.B)
                            If type = "Convolution" Then
                                j = j - 1
                            ElseIf type = "Corelation" Then
                                j = j + 1
                            End If
                        Next
                        If type = "Convolution" Then
                            j = p
                            i = i - 1
                        ElseIf type = "Corelation" Then
                            j = 0
                            i = i + 1
                        End If
                    Next

                    SumR = SumR / windowsum
                    SumG = SumG / windowsum
                    SumB = SumB / windowsum

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

                    ImgOut.SetPixel(x, y, Color.FromArgb(CInt(SumR), CInt(SumG), CInt(SumB)))
                Next
            Next
            Return ImgOut
        Catch ex As Exception
            Warning.Text = ex.Message
            Return ImgOut
        End Try
    End Function

    Protected Sub GeometricConvolution_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles GeometricConvolution.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            Dim windows(Window.SelectedItem.Value - 1, Window.SelectedItem.Value - 1) As Double
            If Window.SelectedItem.Value = 3 Then
                If CheckIsNumeric(3, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(3, windows)
                End If
            ElseIf Window.SelectedItem.Value = 5 Then
                If CheckIsNumeric(5, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(5, windows)
                End If
            ElseIf Window.SelectedItem.Value = 7 Then
                If CheckIsNumeric(7, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(7, windows)
                End If
            ElseIf Window.SelectedItem.Value = 9 Then
                If CheckIsNumeric(9, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(9, windows)
                End If
            End If

            Dim ImageData As Bitmap
            Dim ImageTemp As Bitmap
            Dim ImageGeoConv As Bitmap
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
            ImageGeoConv = New Bitmap(ImageData.Width, ImageData.Height, PixelFormat.Format32bppArgb)
            ImageTemp = Padding(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), (Window.SelectedItem.Value - 1), ImageData, ImageTemp)
            ImageGeoConv = GeometricMeanFilter(ImageData.Width, ImageData.Height, (Window.SelectedItem.Value - 1), ImageTemp, ImageGeoConv, windows, "Convolution")

            If status = "Browse" Then
                ImageGeoConv.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
            ElseIf status = "Default" Then
                ImageGeoConv.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
            Else
                Warning.Text = "พบปัญหาที่ฟังก์ชัน GeometricConvolution_Click"
                Exit Sub
            End If

            ImageData.Dispose()
            ImageTemp.Dispose()
            ImageGeoConv.Dispose()

        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Protected Sub GeometricCorelation_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles GeometricCorelation.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            Dim windows(Window.SelectedItem.Value - 1, Window.SelectedItem.Value - 1) As Double
            If Window.SelectedItem.Value = 3 Then
                If CheckIsNumeric(3, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(3, windows)
                End If
            ElseIf Window.SelectedItem.Value = 5 Then
                If CheckIsNumeric(5, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(5, windows)
                End If
            ElseIf Window.SelectedItem.Value = 7 Then
                If CheckIsNumeric(7, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(7, windows)
                End If
            ElseIf Window.SelectedItem.Value = 9 Then
                If CheckIsNumeric(9, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(9, windows)
                End If
            End If

            Dim ImageData As Bitmap
            Dim ImageTemp As Bitmap
            Dim ImageGeoCore As Bitmap
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
            ImageGeoCore = New Bitmap(ImageData.Width, ImageData.Height, PixelFormat.Format32bppArgb)
            ImageTemp = Padding(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), (Window.SelectedItem.Value - 1), ImageData, ImageTemp)
            ImageGeoCore = GeometricMeanFilter(ImageData.Width, ImageData.Height, (Window.SelectedItem.Value - 1), ImageTemp, ImageGeoCore, windows, "Corelation")

            If status = "Browse" Then
                ImageGeoCore.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
            ElseIf status = "Default" Then
                ImageGeoCore.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
            Else
                Warning.Text = "พบปัญหาที่ฟังก์ชัน GeometricCorelation_Click"
                Exit Sub
            End If

            ImageData.Dispose()
            ImageTemp.Dispose()
            ImageGeoCore.Dispose()

        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Function GeometricMeanFilter(ByVal w As Integer, ByVal h As Integer, ByVal p As Integer, ByVal ImgTmp As Bitmap, ByVal ImgOut As Bitmap, ByVal window As Array, ByVal type As String) As Bitmap
        Try
            Dim i, j, s, t, x, y As Integer
            Dim xtemp As Integer = 0
            Dim ytemp As Integer = 0
            Dim SumR As Double = 0
            Dim SumG As Double = 0
            Dim SumB As Double = 0
            Dim Pixel As Color

            For y = 0 To h - 1
                For x = 0 To w - 1
                    If type = "Convolution" Then
                        i = p
                        j = p
                    ElseIf type = "Corelation" Then
                        i = 0
                        j = 0
                    End If

                    SumR = 1
                    SumG = 1
                    SumB = 1

                    xtemp = x
                    ytemp = y
                    For t = ytemp To ytemp + p
                        For s = xtemp To xtemp + p
                            Pixel = ImgTmp.GetPixel(s, t)
                            SumR *= (window(i, j) * Pixel.R) / 255
                            SumG *= (window(i, j) * Pixel.G) / 255
                            SumB *= (window(i, j) * Pixel.B) / 255
                            If type = "Convolution" Then
                                j = j - 1
                            ElseIf type = "Corelation" Then
                                j = j + 1
                            End If
                        Next
                        If type = "Convolution" Then
                            j = p
                            i = i - 1
                        ElseIf type = "Corelation" Then
                            j = 0
                            i = i + 1
                        End If
                    Next

                    If SumR <= 1 Then
                        SumR = SumR * 255
                    End If
                    If SumG <= 1 Then
                        SumG = SumG * 255
                    End If
                    If SumB <= 1 Then
                        SumB = SumB * 255
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

                    ImgOut.SetPixel(x, y, Color.FromArgb(CInt(SumR), CInt(SumG), CInt(SumB)))
                Next
            Next
            Return ImgOut
        Catch ex As Exception
            Warning.Text = ex.Message
            Return ImgOut
        End Try
    End Function

    Protected Sub HarmonicConvolution_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles HarmonicConvolution.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            Dim windows(Window.SelectedItem.Value - 1, Window.SelectedItem.Value - 1) As Double
            If Window.SelectedItem.Value = 3 Then
                If CheckIsNumeric(3, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(3, windows)
                End If
            ElseIf Window.SelectedItem.Value = 5 Then
                If CheckIsNumeric(5, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(5, windows)
                End If
            ElseIf Window.SelectedItem.Value = 7 Then
                If CheckIsNumeric(7, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(7, windows)
                End If
            ElseIf Window.SelectedItem.Value = 9 Then
                If CheckIsNumeric(9, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(9, windows)
                End If
            End If

            Dim i, j As Integer
            Dim WindowSum As Double = 0
            For j = 0 To Window.SelectedItem.Value - 1
                For i = 0 To Window.SelectedItem.Value - 1
                    WindowSum += windows(j, i)
                Next
            Next

            Dim ImageData As Bitmap
            Dim ImageTemp As Bitmap
            Dim ImageHarConv As Bitmap
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
            ImageHarConv = New Bitmap(ImageData.Width, ImageData.Height, PixelFormat.Format32bppArgb)
            ImageTemp = Padding(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), (Window.SelectedItem.Value - 1), ImageData, ImageTemp)
            ImageHarConv = HarmonicMeanFilter(ImageData.Width, ImageData.Height, (Window.SelectedItem.Value - 1), ImageTemp, ImageHarConv, windows, WindowSum, "Convolution")

            If status = "Browse" Then
                ImageHarConv.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
            ElseIf status = "Default" Then
                ImageHarConv.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
            Else
                Warning.Text = "พบปัญหาที่ฟังก์ชัน HarmonicConvolution_Click"
                Exit Sub
            End If
          
            ImageData.Dispose()
            ImageTemp.Dispose()
            ImageHarConv.Dispose()
 
        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Protected Sub HarmonicCorelation_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles HarmonicCorelation.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            Dim windows(Window.SelectedItem.Value - 1, Window.SelectedItem.Value - 1) As Double
            If Window.SelectedItem.Value = 3 Then
                If CheckIsNumeric(3, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(3, windows)
                End If
            ElseIf Window.SelectedItem.Value = 5 Then
                If CheckIsNumeric(5, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(5, windows)
                End If
            ElseIf Window.SelectedItem.Value = 7 Then
                If CheckIsNumeric(7, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(7, windows)
                End If
            ElseIf Window.SelectedItem.Value = 9 Then
                If CheckIsNumeric(9, windows).Length = 1 Then
                    Exit Sub
                Else
                    windows = CheckIsNumeric(9, windows)
                End If
            End If

            Dim i, j As Integer
            Dim WindowSum As Double = 0
            For j = 0 To Window.SelectedItem.Value - 1
                For i = 0 To Window.SelectedItem.Value - 1
                    WindowSum += windows(j, i)
                Next
            Next

            Dim ImageData As Bitmap
            Dim ImageTemp As Bitmap
            Dim ImageHarCore As Bitmap
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
            ImageHarCore = New Bitmap(ImageData.Width, ImageData.Height, PixelFormat.Format32bppArgb)
            ImageTemp = Padding(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), (Window.SelectedItem.Value - 1), ImageData, ImageTemp)
            ImageHarCore = HarmonicMeanFilter(ImageData.Width, ImageData.Height, (Window.SelectedItem.Value - 1), ImageTemp, ImageHarCore, windows, WindowSum, "Corelation")

            If status = "Browse" Then
                ImageHarCore.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
            ElseIf status = "Default" Then
                ImageHarCore.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                ImageAfter.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
            Else
                Warning.Text = "พบปัญหาที่ฟังก์ชัน HarmonicCorelation_Click"
                Exit Sub
            End If
       
            ImageData.Dispose()
            ImageTemp.Dispose()
            ImageHarCore.Dispose()

        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Function HarmonicMeanFilter(ByVal w As Integer, ByVal h As Integer, ByVal p As Integer, ByVal ImgTmp As Bitmap, ByVal ImgOut As Bitmap, ByVal window As Array, ByVal windowsum As Integer, ByVal type As String) As Bitmap
        Try
            Dim i, j, s, t, x, y As Integer
            Dim xtemp As Integer = 0
            Dim ytemp As Integer = 0
            Dim SumR As Double = 0
            Dim SumG As Double = 0
            Dim SumB As Double = 0
            Dim TempArrayRed(w - 1, h - 1) As Double
            Dim TempArrayGreen(w - 1, h - 1) As Double
            Dim TempArrayBlue(w - 1, h - 1) As Double
            Dim red((w * h) - 1) As Double
            Dim green((w * h) - 1) As Double
            Dim blue((w * h) - 1) As Double
            Dim index As Integer = 0
            Dim Pixel As Color

            For y = 0 To h - 1
                For x = 0 To w - 1
                    If type = "Convolution" Then
                        i = p
                        j = p
                    ElseIf type = "Corelation" Then
                        i = 0
                        j = 0
                    End If

                    SumR = 0
                    SumG = 0
                    SumB = 0

                    xtemp = x
                    ytemp = y
                    For t = ytemp To ytemp + p
                        For s = xtemp To xtemp + p
                            Pixel = ImgTmp.GetPixel(s, t)
                            If (window(i, j) * Pixel.R) = 0 Then
                                SumR += 1
                            Else
                                SumR += 1 / (window(i, j) * Pixel.R)
                            End If
                            If (window(i, j) * Pixel.G) = 0 Then
                                SumG += 1
                            Else
                                SumG += 1 / (window(i, j) * Pixel.G)
                            End If
                            If (window(i, j) * Pixel.B) = 0 Then
                                SumB += 1
                            Else
                                SumB += 1 / (window(i, j) * Pixel.B)
                            End If
                            If type = "Convolution" Then
                                j = j - 1
                            ElseIf type = "Corelation" Then
                                j = j + 1
                            End If
                        Next
                        If type = "Convolution" Then
                            j = p
                            i = i - 1
                        ElseIf type = "Corelation" Then
                            j = 0
                            i = i + 1
                        End If
                    Next

                    SumR = windowsum / SumR
                    SumG = windowsum / SumG
                    SumB = windowsum / SumB
                    TempArrayRed(x, y) = SumR
                    red(index) = SumR
                    TempArrayGreen(x, y) = SumG
                    green(index) = SumG
                    TempArrayBlue(x, y) = SumB
                    blue(index) = SumB
                    index = index + 1

                Next
            Next

            Array.Sort(red)
            Array.Sort(green)
            Array.Sort(blue)

            Dim LUTR(255) As Integer
            Dim LUTG(255) As Integer
            Dim LUTB(255) As Integer
            For i = 0 To 255
                LUTR(i) = red(0) + (((red((w * h) - 1) - red(0)) / 255) * i)
                LUTG(i) = green(0) + (((green((w * h) - 1) - green(0)) / 255) * i)
                LUTB(i) = blue(0) + (((blue((w * h) - 1) - blue(0)) / 255) * i)
            Next

            For y = 0 To h - 1
                For x = 0 To w - 1
                    SumR = TempArrayRed(x, y)
                    SumG = TempArrayGreen(x, y)
                    SumB = TempArrayBlue(x, y)
                    For i = 0 To 255
                        If i <> 255 Then
                            If (LUTR(i) <= SumR) And (SumR < LUTR(i + 1)) Then
                                SumR = i
                            End If
                            If (LUTG(i) <= SumG) And (SumG < LUTG(i + 1)) Then
                                SumG = i
                            End If
                            If (LUTB(i) <= SumB) And (SumB < LUTB(i + 1)) Then
                                SumB = i
                            End If
                        Else
                            If (LUTR(i) <= SumR) Then
                                SumR = i
                            End If
                            If (LUTG(i) <= SumG) Then
                                SumG = i
                            End If
                            If (LUTB(i) <= SumB) Then
                                SumB = i
                            End If
                        End If
                    Next
                    ImgOut.SetPixel(x, y, Color.FromArgb(CInt(SumR), CInt(SumG), CInt(SumB)))
                Next
            Next
            Return ImgOut
        Catch ex As Exception
            Warning.Text = ex.Message
            Return ImgOut
        End Try
    End Function

    Protected Sub ContraHarmonic_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ContraHarmonic.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            If IsNumeric(Q.Text) Then
                Dim ImageData As Bitmap
                Dim ImageTemp As Bitmap
                Dim ImageContraHar As Bitmap
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
                ImageContraHar = New Bitmap(ImageData.Width, ImageData.Height, PixelFormat.Format32bppArgb)
                ImageTemp = Padding(ImageData.Width + (Window.SelectedItem.Value - 1), ImageData.Height + (Window.SelectedItem.Value - 1), (Window.SelectedItem.Value - 1), ImageData, ImageTemp)
                ImageContraHar = ContraHarmonicMeanFilter(ImageData.Width, ImageData.Height, (Window.SelectedItem.Value - 1), ImageTemp, ImageContraHar)

                If status = "Browse" Then
                    ImageContraHar.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                    ImageAfter.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
                ElseIf status = "Default" Then
                    ImageContraHar.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                    ImageAfter.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
                Else
                    Warning.Text = "พบปัญหาที่ฟังก์ชัน ContraHarmonic_Click"
                    Exit Sub
                End If

                ImageData.Dispose()
                ImageTemp.Dispose()
                ImageContraHar.Dispose()

            ElseIf Q.Text = "" Then
                Warning.Text = "กรุณาใส่ค่า Value Q :"
                Exit Sub
            Else
                Warning.Text = "กรุณาใส่ค่าที่เป็นตัวเลข"
                Exit Sub
            End If
        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Function ContraHarmonicMeanFilter(ByVal w As Integer, ByVal h As Integer, ByVal p As Integer, ByVal ImgTmp As Bitmap, ByVal ImgOut As Bitmap) As Bitmap
        Try
            Dim s, t, x, y As Integer
            Dim xtemp As Integer = 0
            Dim ytemp As Integer = 0
            Dim SumR1 As Double = 0
            Dim SumG1 As Double = 0
            Dim SumB1 As Double = 0
            Dim SumR2 As Double = 0
            Dim SumG2 As Double = 0
            Dim SumB2 As Double = 0
            Dim Pixel As Color

            For y = 0 To h - 1
                For x = 0 To w - 1

                    SumR1 = 0
                    SumR2 = 0
                    SumG1 = 0
                    SumG2 = 0
                    SumB1 = 0
                    SumB2 = 0

                    xtemp = x
                    ytemp = y
                    For t = ytemp To ytemp + p
                        For s = xtemp To xtemp + p
                            Pixel = ImgTmp.GetPixel(s, t)
                            If (Pixel.R) = 0 And (Val(Q.Text) + 1) < 0 Then
                                SumR1 += 1
                            Else
                                SumR1 += (Pixel.R) ^ (Val(Q.Text) + 1)
                            End If
                            If (Pixel.R) = 0 And Val(Q.Text) < 0 Then
                                SumR2 += 1
                            Else
                                SumR2 += (Pixel.R) ^ Val(Q.Text)
                            End If

                            If (Pixel.G) = 0 And (Val(Q.Text) + 1) < 0 Then
                                SumG1 += 1
                            Else
                                SumG1 += (Pixel.G) ^ (Val(Q.Text) + 1)
                            End If
                            If (Pixel.G) = 0 And Val(Q.Text) < 0 Then
                                SumG2 += 1
                            Else
                                SumG2 += (Pixel.G) ^ Val(Q.Text)
                            End If

                            If (Pixel.B) = 0 And (Val(Q.Text) + 1) < 0 Then
                                SumB1 += 1
                            Else
                                SumB1 += (Pixel.B) ^ (Val(Q.Text) + 1)
                            End If
                            If (Pixel.B) = 0 And Val(Q.Text) < 0 Then
                                SumB2 += 1
                            Else
                                SumB2 += (Pixel.B) ^ Val(Q.Text)
                            End If
                        Next
                    Next
                    If SumR2 <> 0 Then
                        SumR1 = SumR1 / SumR2
                    End If
                    If SumG2 <> 0 Then
                        SumG1 = SumG1 / SumG2
                    End If
                    If SumB2 <> 0 Then
                        SumB1 = SumB1 / SumB2
                    End If

                    If SumR1 > 255 Then
                        SumR1 = 255
                    ElseIf SumR1 < 0 Then
                        SumR1 = 0
                    End If
                    If SumG1 > 255 Then
                        SumG1 = 255
                    ElseIf SumG1 < 0 Then
                        SumG1 = 0
                    End If
                    If SumB1 > 255 Then
                        SumB1 = 255
                    ElseIf SumB1 < 0 Then
                        SumB1 = 0
                    End If

                    ImgOut.SetPixel(x, y, Color.FromArgb(CInt(SumR1), CInt(SumG1), CInt(SumB1)))
                Next
            Next
            Return ImgOut
        Catch ex As Exception
            Warning.Text = ex.Message
            Return ImgOut
        End Try
    End Function
End Class
