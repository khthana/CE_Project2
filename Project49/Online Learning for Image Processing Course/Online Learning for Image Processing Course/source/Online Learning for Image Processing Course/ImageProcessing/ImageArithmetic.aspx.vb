Imports System
Imports System.IO
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Collections
Imports System.ComponentModel
Imports System.Data
Imports System.Math

Partial Class ImageArithmetic
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
    End Sub

    Protected Sub OK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles OK.Click
        Try
            Warning.Text = ""
            Dim ObjImg1 As New FileInfo(Server.MapPath(".") & "\ImageBefore\" & Path.GetFileName(ImageFile1.PostedFile.FileName.Trim()))
            Dim ObjImg2 As New FileInfo(Server.MapPath(".") & "\ImageBefore\" & Path.GetFileName(ImageFile2.PostedFile.FileName.Trim()))
            Dim ImgType1 As String = ImageFile1.PostedFile.ContentType
            Dim ImgType2 As String = ImageFile2.PostedFile.ContentType

            ImgType1 = ImgType1.Substring(0, 5)
            ImgType2 = ImgType2.Substring(0, 5)

            If ImageFile1.PostedFile.FileName <> "" Then
                If ObjImg1.Exists Then
                    Warning.Text = "ชื่อไฟล์ที่ 1 ซ้ำ กรุณาเปลี่ยนฃื่อไฟล์ที่ 1"
                    Exit Sub
                Else
                    If ImgType1 = "image" Then
                        If (ImageFile1.PostedFile.FileName <> "" And ImageFile1.PostedFile.FileName.Trim().Length > 0 And ImageFile1.PostedFile.ContentLength > 0 And ImageFile1.PostedFile.ContentLength <= 400000000) Then
                            ImageFile1.PostedFile.SaveAs(Server.MapPath(".") & "\ImageBefore\" & Path.GetFileName(ImageFile1.PostedFile.FileName.Trim()))
                            Session("ImageUrl1") = Path.GetFileName(ImageFile1.PostedFile.FileName.Trim())
                            Image1.ImageUrl = "~\ImageProcessing\ImageBefore\" & Session("ImageUrl1")
                        Else
                            Warning.Text = "พบปัญหาเกี่ยวกับไฟล์ที่ 1"
                            Exit Sub
                        End If
                    Else
                        Warning.Text = "ไฟล์ที่ 1 ไม่ใช่ไฟล์รูปภาพ กรุณาเลือกไฟล์ใหม่"
                        Exit Sub
                    End If
                End If
            Else
                Warning.Text = "คุณยังไม่ได้เลือกไฟล์ที่ 1 กรุณาเลือกไฟล์ที่ 1"
                Exit Sub
            End If

            If ImageFile2.PostedFile.FileName <> "" Then
                If ObjImg2.Exists Then
                    Warning.Text = "ชื่อไฟล์ที่ 2 ซ้ำ กรุณาเปลี่ยนฃื่อไฟล์ที่ 2"
                    Exit Sub
                Else
                    If ImgType2 = "image" Then
                        If (ImageFile2.PostedFile.FileName <> "" And ImageFile2.PostedFile.FileName.Trim().Length > 0 And ImageFile2.PostedFile.ContentLength > 0 And ImageFile2.PostedFile.ContentLength <= 400000000) Then
                            ImageFile2.PostedFile.SaveAs(Server.MapPath(".") & "\ImageBefore\" & Path.GetFileName(ImageFile2.PostedFile.FileName.Trim()))
                            Session("ImageUrl2") = Path.GetFileName(ImageFile2.PostedFile.FileName.Trim())
                            Image2.ImageUrl = "~\ImageProcessing\ImageBefore\" & Session("ImageUrl2")
                        Else
                            Warning.Text = "พบปัญหาเกี่ยวกับไฟล์ที่ 2"
                            Exit Sub
                        End If
                    Else
                        Warning.Text = "ไฟล์ที่ 2 ไม่ใช่ไฟล์รูปภาพ กรุณาเลือกไฟล์ใหม่"
                        Exit Sub
                    End If
                End If
            Else
                Warning.Text = "คุณยังไม่ได้เลือกไฟล์ที่ 2 กรุณาเลือกไฟล์ที่ 2"
                Exit Sub
            End If

        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Protected Sub ImageAddition_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageAddition.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            Dim ImageData1 As Bitmap
            Dim ImageData2 As Bitmap
            Dim ImageAddition As Bitmap
            Dim x, y As Integer
            Dim Pixel1 As Color
            Dim Pixel2 As Color
            Dim SumR As Integer = 0
            Dim SumG As Integer = 0
            Dim SumB As Integer = 0
            Dim NameAfter As String = ""
            Dim ArrNameAfter1(1) As String
            Dim ArrNameAfter2(1) As String

            If (Session("ImageUrl1") <> "") And (Session("ImageUrl2") <> "") Then
                Dim tmp As String = Server.MapPath(".") & "\ImageBefore\" & Session("ImageUrl1")
                ImageData1 = New Bitmap(tmp)
                tmp = Server.MapPath(".") & "\ImageBefore\" & Session("ImageUrl2")
                ImageData2 = New Bitmap(tmp)
                ArrNameAfter1 = Session("ImageUrl1").Split(".")
                ArrNameAfter2 = Session("ImageUrl2").Split(".")
                NameAfter = ArrNameAfter1(0) & ArrNameAfter2(0) & "." & ArrNameAfter1(1)
                status = "Browse"
            Else
                Dim tmp As String = Server.MapPath(".") & "\ImageDefaultBefore\" & DDLImage1.SelectedItem.Value
                ImageData1 = New Bitmap(tmp)
                tmp = Server.MapPath(".") & "\ImageDefaultBefore\" & DDLImage2.SelectedItem.Value
                ImageData2 = New Bitmap(tmp)
                NameAfter = DDLImage1.SelectedItem.Value
                ArrNameAfter1 = NameAfter.Split(".")
                NameAfter = DDLImage2.SelectedItem.Value
                ArrNameAfter2 = NameAfter.Split(".")
                NameAfter = ArrNameAfter1(0) & ArrNameAfter2(0) & "." & ArrNameAfter1(1)
                status = "Default"
            End If

            ImageAddition = New Bitmap(ImageData1.Width, ImageData1.Height, PixelFormat.Format32bppArgb)

            If (ImageData1.Width = ImageData2.Width) And (ImageData1.Height = ImageData2.Height) Then
                For y = 0 To ImageData1.Height - 1
                    For x = 0 To ImageData1.Width - 1
                        Pixel1 = ImageData1.GetPixel(x, y)
                        Pixel2 = ImageData2.GetPixel(x, y)
                        SumR = (CInt(Pixel1.R) + CInt(Pixel2.R)) / 2
                        SumG = (CInt(Pixel1.G) + CInt(Pixel2.G)) / 2
                        SumB = (CInt(Pixel1.B) + CInt(Pixel2.B)) / 2
                        ImageAddition.SetPixel(x, y, Color.FromArgb(SumR, SumG, SumB))
                    Next
                Next

                If status = "Browse" Then
                    ImageAddition.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                    ImageResult.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
                ElseIf status = "Default" Then
                    ImageAddition.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                    ImageResult.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
                Else
                    Warning.Text = "พบปัญหาที่ฟังก์ชัน ImageAddition_Click"
                    Exit Sub
                End If

                ImageData1.Dispose()
                ImageData2.Dispose()
                ImageAddition.Dispose()
            Else
                Warning.Text = "กรุณาเลือกไฟล์ที่มีความกว้างและความยาวของภาพที่เท่ากันทั้ง 2 ไฟล์"
                Exit Sub
            End If

        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Protected Sub ImageSubtraction_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageSubtraction.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            Dim ImageData1 As Bitmap
            Dim ImageData2 As Bitmap
            Dim ImageSubtraction As Bitmap
            Dim x, y As Integer
            Dim Pixel1 As Color
            Dim Pixel2 As Color
            Dim SumR As Integer = 0
            Dim SumG As Integer = 0
            Dim SumB As Integer = 0
            Dim NameAfter As String = ""
            Dim ArrNameAfter1(1) As String
            Dim ArrNameAfter2(1) As String

            If (Session("ImageUrl1") <> "") And (Session("ImageUrl2") <> "") Then
                Dim tmp As String = Server.MapPath(".") & "\ImageBefore\" & Session("ImageUrl1")
                ImageData1 = New Bitmap(tmp)
                tmp = Server.MapPath(".") & "\ImageBefore\" & Session("ImageUrl2")
                ImageData2 = New Bitmap(tmp)
                ArrNameAfter1 = Session("ImageUrl1").Split(".")
                ArrNameAfter2 = Session("ImageUrl2").Split(".")
                NameAfter = ArrNameAfter1(0) & ArrNameAfter2(0) & "." & ArrNameAfter1(1)
                status = "Browse"
            Else
                Dim tmp As String = Server.MapPath(".") & "\ImageDefaultBefore\" & DDLImage1.SelectedItem.Value
                ImageData1 = New Bitmap(tmp)
                tmp = Server.MapPath(".") & "\ImageDefaultBefore\" & DDLImage2.SelectedItem.Value
                ImageData2 = New Bitmap(tmp)
                NameAfter = DDLImage1.SelectedItem.Value
                ArrNameAfter1 = NameAfter.Split(".")
                NameAfter = DDLImage2.SelectedItem.Value
                ArrNameAfter2 = NameAfter.Split(".")
                NameAfter = ArrNameAfter1(0) & ArrNameAfter2(0) & "." & ArrNameAfter1(1)
                status = "Default"
            End If

            ImageSubtraction = New Bitmap(ImageData1.Width, ImageData1.Height, PixelFormat.Format32bppArgb)

            If (ImageData1.Width = ImageData2.Width) And (ImageData1.Height = ImageData2.Height) Then
                For y = 0 To ImageData1.Height - 1
                    For x = 0 To ImageData1.Width - 1
                        Pixel1 = ImageData1.GetPixel(x, y)
                        Pixel2 = ImageData2.GetPixel(x, y)
                        SumR = Math.Abs(CInt(Pixel1.R) - CInt(Pixel2.R))
                        SumG = Math.Abs(CInt(Pixel1.G) - CInt(Pixel2.G))
                        SumB = Math.Abs(CInt(Pixel1.B) - CInt(Pixel2.B))
                        ImageSubtraction.SetPixel(x, y, Color.FromArgb(SumR, SumG, SumB))
                    Next
                Next

                If status = "Browse" Then
                    ImageSubtraction.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                    ImageResult.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
                ElseIf status = "Default" Then
                    ImageSubtraction.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                    ImageResult.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
                Else
                    Warning.Text = "พบปัญหาที่ฟังก์ชัน ImageSubtraction_Click"
                    Exit Sub
                End If

                ImageData1.Dispose()
                ImageData2.Dispose()
                ImageSubtraction.Dispose()
            Else
                Warning.Text = "กรุณาเลือกไฟล์ที่มีความกว้างและความยาวของภาพที่เท่ากันทั้ง 2 ไฟล์"
                Exit Sub
            End If

        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Protected Sub ImageMultiplication_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ImageMultiplication.Click
        Try
            Warning.Text = ""
            Dim status As String = ""
            Dim ImageData1 As Bitmap
            Dim ImageData2 As Bitmap
            Dim ImageMultiple As Bitmap
            Dim x, y As Integer
            Dim Pixel1 As Color
            Dim Pixel2 As Color
            Dim SumR As Integer = 0
            Dim SumG As Integer = 0
            Dim SumB As Integer = 0
            Dim NameAfter As String = ""
            Dim ArrNameAfter1(1) As String
            Dim ArrNameAfter2(1) As String

            If (Session("ImageUrl1") <> "") And (Session("ImageUrl2") <> "") Then
                Dim tmp As String = Server.MapPath(".") & "\ImageBefore\" & Session("ImageUrl1")
                ImageData1 = New Bitmap(tmp)
                tmp = Server.MapPath(".") & "\ImageBefore\" & Session("ImageUrl2")
                ImageData2 = New Bitmap(tmp)
                ArrNameAfter1 = Session("ImageUrl1").Split(".")
                ArrNameAfter2 = Session("ImageUrl2").Split(".")
                NameAfter = ArrNameAfter1(0) & ArrNameAfter2(0) & "." & ArrNameAfter1(1)
                status = "Browse"
            Else
                Dim tmp As String = Server.MapPath(".") & "\ImageDefaultBefore\" & DDLImage1.SelectedItem.Value
                ImageData1 = New Bitmap(tmp)
                tmp = Server.MapPath(".") & "\ImageDefaultBefore\" & DDLImage2.SelectedItem.Value
                ImageData2 = New Bitmap(tmp)
                NameAfter = DDLImage1.SelectedItem.Value
                ArrNameAfter1 = NameAfter.Split(".")
                NameAfter = DDLImage2.SelectedItem.Value
                ArrNameAfter2 = NameAfter.Split(".")
                NameAfter = ArrNameAfter1(0) & ArrNameAfter2(0) & "." & ArrNameAfter1(1)
                status = "Default"
            End If

            ImageMultiple = New Bitmap(ImageData1.Width, ImageData1.Height, PixelFormat.Format32bppArgb)

            If (ImageData1.Width = ImageData2.Width) And (ImageData1.Height = ImageData2.Height) Then
                For y = 0 To ImageData1.Height - 1
                    For x = 0 To ImageData1.Width - 1
                        Pixel1 = ImageData1.GetPixel(x, y)
                        Pixel2 = ImageData2.GetPixel(x, y)
                        SumR = (CInt(Pixel1.R) * CInt(Pixel2.R))
                        SumG = (CInt(Pixel1.G) * CInt(Pixel2.G))
                        SumB = (CInt(Pixel1.B) * CInt(Pixel2.B))
                        If SumR > 255 Then
                            SumR = SumR / 255
                        End If
                        If SumG > 255 Then
                            SumG = SumG / 255
                        End If
                        If SumB > 255 Then
                            SumB = SumB / 255
                        End If
                        ImageMultiple.SetPixel(x, y, Color.FromArgb(SumR, SumG, SumB))
                    Next
                Next

                If status = "Browse" Then
                    ImageMultiple.Save(Server.MapPath(".") & "\ImageAfter\" & NameAfter, ImageFormat.Bmp)
                    ImageResult.ImageUrl = "~\ImageProcessing\ImageAfter\" & NameAfter
                ElseIf status = "Default" Then
                    ImageMultiple.Save(Server.MapPath(".") & "\ImageDefaultAfter\" & NameAfter, ImageFormat.Bmp)
                    ImageResult.ImageUrl = "~\ImageProcessing\ImageDefaultAfter\" & NameAfter
                Else
                    Warning.Text = "พบปัญหาที่ฟังก์ชัน ImageMultiplication_Click"
                    Exit Sub
                End If

                ImageData1.Dispose()
                ImageData2.Dispose()
                ImageMultiple.Dispose()
            Else
                Warning.Text = "กรุณาเลือกไฟล์ที่มีความกว้างและความยาวของภาพที่เท่ากันทั้ง 2 ไฟล์"
                Exit Sub
            End If

        Catch ex As Exception
            Warning.Text = ex.Message
            Exit Sub
        End Try
    End Sub

    Protected Sub DDLImage1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLImage1.SelectedIndexChanged
        If DDLImage1.SelectedItem.Text = "Building" Then
            Image1.ImageUrl = "~\ImageProcessing\ImageDefaultBefore\" & DDLImage1.SelectedItem.Value
        ElseIf DDLImage1.SelectedItem.Text = "Things and Bottle" Then
            Image1.ImageUrl = "~\ImageProcessing\ImageDefaultBefore\" & DDLImage1.SelectedItem.Value
        ElseIf DDLImage1.SelectedItem.Text = "Tree At Noon" Then
            Image1.ImageUrl = "~\ImageProcessing\ImageDefaultBefore\" & DDLImage1.SelectedItem.Value
        End If
    End Sub

    Protected Sub DDLImage2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLImage2.SelectedIndexChanged
        If DDLImage2.SelectedItem.Text = "Freedom" Then
            Image2.ImageUrl = "~\ImageProcessing\ImageDefaultBefore\" & DDLImage2.SelectedItem.Value
        ElseIf DDLImage2.SelectedItem.Text = "Things and No Bottle" Then
            Image2.ImageUrl = "~\ImageProcessing\ImageDefaultBefore\" & DDLImage2.SelectedItem.Value
        ElseIf DDLImage2.SelectedItem.Text = "Tree At Night" Then
            Image2.ImageUrl = "~\ImageProcessing\ImageDefaultBefore\" & DDLImage2.SelectedItem.Value
        End If
    End Sub
End Class
