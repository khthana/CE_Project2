Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class Teacher_TeacherPostNews
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Teacher" Then
            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้สอน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If
    End Sub

    Protected Sub clear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear.Click
        topic.Text = ""
        description.Text = ""
        writer.Text = ""
        pic.Style.Clear()
        doc1.Style.Clear()
        doc2.Style.Clear()
        doc3.Style.Clear()
        warning.Text = ""
    End Sub

    Protected Sub post_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles post.Click
        warning.Text = ""
        Dim statuspic As Boolean = False
        Dim statusdoc1 As Boolean = False
        Dim statusdoc2 As Boolean = False
        Dim statusdoc3 As Boolean = False
        Dim checktype As String = ""
        Dim objpic As New FileInfo(Server.MapPath("~") & "\News\Picture\" & Path.GetFileName(pic.PostedFile.FileName.Trim()))
        'Dim mydate As String = Today
        Dim mydate As Date = System.DateTime.Now.ToLongDateString
        Dim currentID As String = ""

        'check doc1
        Dim objdoc As New FileInfo(Server.MapPath("~") & "\News\OtherFile\" & Path.GetFileName(doc1.PostedFile.FileName.Trim()))
        If (doc1.PostedFile.FileName <> "" And doc1.PostedFile.FileName.Trim().Length > 0 And doc1.PostedFile.ContentLength > 0 And doc1.PostedFile.ContentLength <= 400000000) Then
            If objdoc.Exists Then
                warning.Text = "กรุณาเปลี่ยนชื่อไฟล์เอกสารประกอบ"
                Exit Sub
            Else
                statusdoc1 = True
            End If
        Else
            statusdoc1 = False
        End If

        'check doc2
        objdoc = New FileInfo(Server.MapPath("~") & "\News\OtherFile\" & Path.GetFileName(doc2.PostedFile.FileName.Trim()))
        If (doc2.PostedFile.FileName <> "" And doc2.PostedFile.FileName.Trim().Length > 0 And doc2.PostedFile.ContentLength > 0 And doc2.PostedFile.ContentLength <= 400000000) Then
            If objdoc.Exists Then
                warning.Text = "กรุณาเปลี่ยนชื่อไฟล์เอกสารประกอบ"
                Exit Sub
            Else
                statusdoc2 = True
            End If
        Else
            statusdoc2 = False
        End If

        'check doc3
        objdoc = New FileInfo(Server.MapPath("~") & "\News\OtherFile\" & Path.GetFileName(doc3.PostedFile.FileName.Trim()))
        If (doc3.PostedFile.FileName <> "" And doc3.PostedFile.FileName.Trim().Length > 0 And doc3.PostedFile.ContentLength > 0 And doc3.PostedFile.ContentLength <= 400000000) Then
            If objdoc.Exists Then
                warning.Text = "กรุณาเปลี่ยนชื่อไฟล์เอกสารประกอบ"
                Exit Sub
            Else
                statusdoc3 = True
            End If
        Else
            statusdoc3 = False
        End If

        'check picture
        checktype = pic.PostedFile.ContentType
        checktype = checktype.Substring(0, 5)

        If (pic.PostedFile.FileName <> "" And pic.PostedFile.FileName.Trim().Length > 0 And pic.PostedFile.ContentLength > 0 And pic.PostedFile.ContentLength <= 400000000) Then
            If checktype = "image" Then
                If objpic.Exists Then
                    warning.Text = "กรุณาเปลี่ยนชื่อไฟล์รูปภาพประกอบ"
                    Exit Sub
                Else
                    statuspic = True
                End If
            Else
                warning.Text = "ไฟล์ที่คุณเลือกสำหรับเป็นรูปภาพประกอบไม่ใช่ไฟล์ประเภทรูปภาพ" & "<br />" & "กรุณาเลือกไฟล์รูปภาพประกอบใหม่"
                Exit Sub
            End If
        Else
            statuspic = False
        End If

        If statuspic = True Then
            pic.PostedFile.SaveAs(Server.MapPath("~") & "\News\Picture\" & Path.GetFileName(pic.PostedFile.FileName.Trim()))
            QueryStr = "insert into News(new_topic,new_description,new_writer,new_date,new_picfile,new_picpath) values('" & _
                        topic.Text & "','" & description.Text & "','" & writer.Text & "','" & mydate & "','" & _
                        Path.GetFileName(pic.PostedFile.FileName.Trim()) & "','" & "News/Picture/" & _
                        Path.GetFileName(pic.PostedFile.FileName.Trim()) & "')"
        Else
            QueryStr = "insert into News(new_topic,new_description,new_writer,new_date,new_picfile,new_picpath) values('" & _
                        topic.Text & "','" & description.Text & "','" & writer.Text & "','" & mydate & _
                        "','NoPicture.jpg','News/Picture/NoPicture.jpg')"
        End If

        OpenConn()

        'insert detail and picture
        sqlComm = New SqlCommand(QueryStr, sqlConn)
        sqlComm.CommandType = CommandType.Text
        sqlComm.ExecuteNonQuery()

        QueryStr = "select @@identity as currentID"
        TableStr = "getcurrentID"
        If FillCommQ(QueryStr, TableStr) = True Then
            If IsNothing(sqlDS) Then
                warning.Text = "Dataset has not found . There is no currentID." & "<br />" & "ไม่สามารถอัพโหลดไฟล์เอกสารได้"
                Exit Sub
            Else
                If sqlDS.Tables(TableStr).Columns.Count > 0 Then
                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            currentID = row("currentID")
                            Exit For
                        Next
                    Else
                        warning.Text = "Dataset has no row. There is no currentID." & "<br />" & "ไม่สามารถอัพโหลดไฟล์เอกสารได้"
                        Exit Sub
                    End If
                Else
                    warning.Text = "Dataset has no column. There is no currentID." & "<br />" & "ไม่สามารถอัพโหลดไฟล์เอกสารได้"
                    Exit Sub
                End If
            End If
        Else
            Response.Write("../DBFailed.aspx")
        End If

        'insert doc1
        If statusdoc1 = True Then
            doc1.PostedFile.SaveAs(Server.MapPath("~") & "\News\OtherFile\" & Path.GetFileName(doc1.PostedFile.FileName.Trim()))
            QueryStr = "insert into NewsFile(new_id,newf_name,newf_path) values('" & currentID & "','" & _
                        Path.GetFileName(doc1.PostedFile.FileName.Trim()) & "','" & "News/OtherFile/" & _
                        Path.GetFileName(doc1.PostedFile.FileName.Trim()) & "')"
            sqlComm = New SqlCommand(QueryStr, sqlConn)
            sqlComm.CommandType = CommandType.Text
            sqlComm.ExecuteNonQuery()
        End If

        'insert doc2
        objdoc = New FileInfo(Server.MapPath("~") & "\News\OtherFile\" & Path.GetFileName(doc2.PostedFile.FileName.Trim()))
        If statusdoc2 = True Then
            doc2.PostedFile.SaveAs(Server.MapPath("~") & "\News\OtherFile\" & Path.GetFileName(doc2.PostedFile.FileName.Trim()))
            QueryStr = "insert into NewsFile(new_id,newf_name,newf_path) values('" & currentID & "','" & _
                        Path.GetFileName(doc2.PostedFile.FileName.Trim()) & "','" & "News/OtherFile/" & _
                        Path.GetFileName(doc2.PostedFile.FileName.Trim()) & "')"
            sqlComm = New SqlCommand(QueryStr, sqlConn)
            sqlComm.CommandType = CommandType.Text
            sqlComm.ExecuteNonQuery()
        End If

        'insert doc3
        objdoc = New FileInfo(Server.MapPath("~") & "\News\OtherFile\" & Path.GetFileName(doc3.PostedFile.FileName.Trim()))
        If statusdoc3 = True Then
            doc3.PostedFile.SaveAs(Server.MapPath("~") & "\News\OtherFile\" & Path.GetFileName(doc3.PostedFile.FileName.Trim()))
            QueryStr = "insert into NewsFile(new_id,newf_name,newf_path) values('" & currentID & "','" & _
            Path.GetFileName(doc3.PostedFile.FileName.Trim()) & "','" & "News/OtherFile/" & _
            Path.GetFileName(doc3.PostedFile.FileName.Trim()) & "')"
            sqlComm = New SqlCommand(QueryStr, sqlConn)
            sqlComm.CommandType = CommandType.Text
            sqlComm.ExecuteNonQuery()
        End If

        CloseConn()

        Response.Redirect("TeacherViewNews.aspx?new_id=" & currentID)
    End Sub
End Class
