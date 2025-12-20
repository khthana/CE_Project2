Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class Teacher_TeacherLearningFile
    Inherits System.Web.UI.Page

    Protected Sub subjectDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles subjectDDL.SelectedIndexChanged
        createfile2.Visible = False
        createfile3.Visible = False
        tablecreate.Visible = False
        updatefile2.Visible = False
        updatefile3.Visible = False
        tableupdate.Visible = False
        uploadtypeDDL.SelectedIndex = 0
        warning.Text = ""
    End Sub

    Protected Sub createupload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles createupload.Click
        If subjectDDL.Items.Count = 0 Then
            warning.Text = "ไม่พบข้อมูลของรายวิชาต่างๆ"
            Exit Sub
        End If
        If uploadtypeDDL.SelectedIndex = 0 Then
            warning.Text = "กรุณาเลือกประเภทไฟล์สื่อการสอน"
            Exit Sub
        ElseIf uploadtypeDDL.SelectedIndex = 1 Then
            tablecreate.Visible = True
            createfile2.Visible = True
            createfile3.Visible = True
        ElseIf uploadtypeDDL.SelectedIndex = 2 Then
            tablecreate.Visible = True
            createfile2.Visible = False
            createfile3.Visible = False
        ElseIf uploadtypeDDL.SelectedIndex = 3 Then
            tablecreate.Visible = True
            createfile2.Visible = False
            createfile3.Visible = False
        End If
        'tablecreate.Visible = True
        updatefile2.Visible = False
        updatefile3.Visible = False
        tableupdate.Visible = False
        warning.Text = ""
    End Sub

    Protected Sub updateupload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updateupload.Click
        If subjectDDL.Items.Count = 0 Then
            warning.Text = "ไม่พบข้อมูลของรายวิชาต่างๆ"
            Exit Sub
        End If
        fileholder.Controls.Clear()
        If uploadtypeDDL.SelectedIndex = 0 Then
            warning.Text = "กรุณาเลือกประเภทของสื่อการสอน"
            Exit Sub
        ElseIf uploadtypeDDL.SelectedIndex = 1 Then
            tableupdate.Visible = True
            QueryStr = "select lrnc_topic,lrnc_id from LearningContent where sub_id = '" & _
                subjectDDL.SelectedItem.Value & "' and lrnc_year = (select max(lrnc_year) from LearningContent)" & _
                " and lrnc_term = (select max(lrnc_term) from LearningContent where lrnc_year = (select max(lrnc_year) from LearningContent))"
            TableStr = "getidLearningContent"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    fileDDL.DataTextField = "lrnc_topic"
                    fileDDL.DataValueField = "lrnc_id"
                    fileDDL.DataSource = sqlDS.Tables(TableStr)
                    fileDDL.DataBind()
                    QueryStr = "select * from LearningContent where sub_id = '" & subjectDDL.SelectedItem.Value & _
                    "' and lrnc_id = '" & fileDDL.SelectedItem.Value & "'"
                    TableStr = "getdetaillearningcontent"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                yearupdate.Text = row("lrnc_year")
                                termupdate.Text = row("lrnc_term")
                                topicupdate.Text = row("lrnc_topic")
                                descupdate.Text = row("lrnc_description")
                                writerupdate.Text = row("lrnc_writer")
                                Dim mydate As String = row("lrnc_dateshow")
                                Dim getmydate(2) As String
                                getmydate = mydate.Split("/")
                                '----------
                                getmydate(2) = getmydate(2) - 543
                                txt2.Value = getmydate(0) & "/" & getmydate(1) & "/" & getmydate(2)
                                '----------
                            Next
                            QueryStr = "select lrnf_name,lrnf_path from LearningFile where lrnc_id = '" & fileDDL.SelectedItem.Value & "'"
                            TableStr = "getfileLearningFile"
                            If FillCommQ(QueryStr, TableStr) = True Then
                                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                                    CreateFile(sqlDS, 1)
                                ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                                    fileholder.Controls.Clear()
                                    upupdate1.Style.Clear()
                                    upupdate2.Style.Clear()
                                    upupdate3.Style.Clear()
                                Else
                                    Response.Redirect("../DBFailed.aspx")
                                End If
                            Else
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    warning.Text = "ไม่พบข้อมูล"
                    fileDDL.Items.Clear()
                    updatefile2.Visible = False
                    updatefile3.Visible = False
                    tableupdate.Visible = False
                    Exit Sub
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
            updatefile2.Visible = True
            updatefile3.Visible = True
        ElseIf uploadtypeDDL.SelectedIndex = 2 Then
            tableupdate.Visible = True
            QueryStr = "select lowppt_topic,lowppt_id from LearningOnWebPPT where sub_id = '" & _
                subjectDDL.SelectedItem.Value & "' and lowppt_year = (select max(lowppt_year) from LearningOnWebPPT)" & _
                " and lowppt_term = (select max(lowppt_term) from LearningOnWebPPT where lowppt_year = (select max(lowppt_year) from LearningOnWebPPT))"
            TableStr = "getidLearningOnWebPPT"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    fileDDL.DataTextField = "lowppt_topic"
                    fileDDL.DataValueField = "lowppt_id"
                    fileDDL.DataSource = sqlDS.Tables(TableStr)
                    fileDDL.DataBind()
                    QueryStr = "select * from LearningOnWebPPT where sub_id = '" & subjectDDL.SelectedItem.Value & _
                           "' and lowppt_id = '" & fileDDL.SelectedItem.Value & "'"
                    TableStr = "getdetaillearningppt"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                yearupdate.Text = row("lowppt_year")
                                termupdate.Text = row("lowppt_term")
                                topicupdate.Text = row("lowppt_topic")
                                descupdate.Text = row("lowppt_description")
                                writerupdate.Text = row("lowppt_writer")
                                Dim mydate As String = row("lowppt_dateshow")
                                Dim getmydate(2) As String
                                getmydate = mydate.Split("/")
                                '----------
                                getmydate(2) = getmydate(2) - 543
                                txt2.Value = getmydate(0) & "/" & getmydate(1) & "/" & getmydate(2)
                                '----------

                                If row("lowppt_path") Is DBNull.Value Then
                                    fileholder.Controls.Clear()
                                    upupdate1.Style.Clear()
                                Else
                                    CreateFile(sqlDS, 2)
                                End If
                            Next
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    warning.Text = "ไม่พบข้อมูล"
                    fileDDL.Items.Clear()
                    tableupdate.Visible = False
                    Exit Sub
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
            updatefile2.Visible = False
            updatefile3.Visible = False
        ElseIf uploadtypeDDL.SelectedIndex = 3 Then
            tableupdate.Visible = True
            QueryStr = "select lowvdo_topic,lowvdo_id from LearningOnWebVDO where sub_id = '" & _
                subjectDDL.SelectedItem.Value & "' and lowvdo_year = (select max(lowvdo_year) from LearningOnWebVDO)" & _
                " and lowvdo_term = (select max(lowvdo_term) from LearningOnWebVDO where lowvdo_year = (select max(lowvdo_year) from LearningOnWebVDO))"
            TableStr = "getidLearningOnWebVDO"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    fileDDL.DataTextField = "lowvdo_topic"
                    fileDDL.DataValueField = "lowvdo_id"
                    fileDDL.DataSource = sqlDS.Tables(TableStr)
                    fileDDL.DataBind()
                    QueryStr = "select * from LearningOnWebVDO where sub_id = '" & subjectDDL.SelectedItem.Value & _
                           "' and lowvdo_id = '" & fileDDL.SelectedItem.Value & "'"
                    TableStr = "getdetaillearningvdo"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                yearupdate.Text = row("lowvdo_year")
                                termupdate.Text = row("lowvdo_term")
                                topicupdate.Text = row("lowvdo_topic")
                                descupdate.Text = row("lowvdo_description")
                                writerupdate.Text = row("lowvdo_writer")
                                Dim mydate As String = row("lowvdo_dateshow")
                                Dim getmydate(2) As String
                                getmydate = mydate.Split("/")
                                '----------
                                getmydate(2) = getmydate(2) - 543
                                txt2.Value = getmydate(0) & "/" & getmydate(1) & "/" & getmydate(2)
                                '----------

                                If row("lowvdo_path") Is DBNull.Value Then
                                    fileholder.Controls.Clear()
                                    upupdate1.Style.Clear()
                                Else
                                    CreateFile(sqlDS, 3)
                                End If
                            Next
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    warning.Text = "ไม่พบข้อมูล"
                    fileDDL.Items.Clear()
                    tableupdate.Visible = False
                    Exit Sub
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
            updatefile2.Visible = False
            updatefile3.Visible = False
        End If
        'tableupdate.Visible = True
        createfile2.Visible = False
        createfile3.Visible = False
        tablecreate.Visible = False
        warning.Text = ""
    End Sub

    Protected Sub uploadtypeDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles uploadtypeDDL.SelectedIndexChanged
        warning.Text = ""
        tablecreate.Visible = False
        tableupdate.Visible = False
        If uploadtypeDDL.SelectedIndex = 0 Then
            Exit Sub
        ElseIf uploadtypeDDL.SelectedIndex = 1 Then
            If tablecreate.Visible = True Then
                createfile2.Visible = True
                createfile3.Visible = True
            End If
            If tableupdate.Visible = True Then
                QueryStr = "select lrnc_topic,lrnc_id from LearningContent where sub_id = '" & _
                    subjectDDL.SelectedItem.Value & "' and lrnc_year = (select max(lrnc_year) from LearningContent)" & _
                    " and lrnc_term = (select max(lrnc_term) from LearningContent where lrnc_year = (select max(lrnc_year) from LearningContent))"
                TableStr = "getidLearningContent"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                        fileDDL.DataTextField = "lrnc_topic"
                        fileDDL.DataValueField = "lrnc_id"
                        fileDDL.DataSource = sqlDS.Tables(TableStr)
                        fileDDL.DataBind()
                    Else
                        warning.Text = "ไม่พบข้อมูล"
                        fileDDL.Items.Clear()
                        updatefile2.Visible = False
                        updatefile3.Visible = False
                        tableupdate.Visible = False
                        Exit Sub
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
                updatefile2.Visible = True
                updatefile3.Visible = True
            End If
        ElseIf uploadtypeDDL.SelectedIndex = 2 Then
            If tablecreate.Visible = True Then
                createfile2.Visible = False
                createfile3.Visible = False
            End If
            If tableupdate.Visible = True Then
                QueryStr = "select lowppt_topic,lowppt_id from LearningOnWebPPT where sub_id = '" & _
                    subjectDDL.SelectedItem.Value & "' and lowppt_year = (select max(lowppt_year) from LearningOnWebPPT)" & _
                    " and lowppt_term = (select max(lowppt_term) from LearningOnWebPPT where lowppt_year = (select max(lowppt_year) from LearningOnWebPPT))"
                TableStr = "getidLearningOnWebPPT"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                        fileDDL.DataTextField = "lowppt_topic"
                        fileDDL.DataValueField = "lowppt_id"
                        fileDDL.DataSource = sqlDS.Tables(TableStr)
                        fileDDL.DataBind()
                    Else
                        warning.Text = "ไม่พบข้อมูล"
                        fileDDL.Items.Clear()
                        tableupdate.Visible = False
                        Exit Sub
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
                updatefile2.Visible = False
                updatefile3.Visible = False
            End If
        ElseIf uploadtypeDDL.SelectedIndex = 3 Then
            If tablecreate.Visible = True Then
                createfile2.Visible = False
                createfile3.Visible = False
            End If
            If tableupdate.Visible = True Then
                QueryStr = "select lowvdo_topic,lowvdo_id from LearningOnWebVDO where sub_id = '" & _
                    subjectDDL.SelectedItem.Value & "' and lowvdo_year = (select max(lowvdo_year) from LearningOnWebVDO)" & _
                    " and lowvdo_term = (select max(lowvdo_term) from LearningOnWebVDO where lowvdo_year = (select max(lowvdo_year) from LearningOnWebVDO))"
                TableStr = "getidLearningOnWebVDO"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                        fileDDL.DataTextField = "lowvdo_topic"
                        fileDDL.DataValueField = "lowvdo_id"
                        fileDDL.DataSource = sqlDS.Tables(TableStr)
                        fileDDL.DataBind()
                    Else
                        warning.Text = "ไม่พบข้อมูล"
                        fileDDL.Items.Clear()
                        tableupdate.Visible = False
                        Exit Sub
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
                updatefile2.Visible = False
                updatefile3.Visible = False
            End If
        End If
    End Sub

    Protected Sub clear1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear1.Click
        yearcreate.Text = ""
        termcreate.Text = ""
        topiccreate.Text = ""
        desccreate.Text = ""
        writercreate.Text = ""
        'dateshowcreate.Text = ""
        '-------
        txt1.Value = ""
        '-------
        upcreate1.Style.Clear()
        upcreate2.Style.Clear()
        upcreate3.Style.Clear()
        warning.Text = ""
    End Sub

    Protected Sub upload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles upload.Click
        Dim status1 As Boolean = False
        Dim status2 As Boolean = False
        Dim status3 As Boolean = False
        'Dim mydate As String = Today
        Dim mydate As Date = System.DateTime.Now.ToLongDateString
        Dim currentID As String = ""
        If uploadtypeDDL.SelectedIndex = 0 Then
            warning.Text = "กรุณาเลือกประเภทของสื่อการสอน"
            Exit Sub
        ElseIf uploadtypeDDL.SelectedIndex = 1 Then
            Dim objfile As New FileInfo(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upcreate1.PostedFile.FileName.Trim()))
            If (upcreate1.PostedFile.FileName <> "" And upcreate1.PostedFile.FileName.Trim().Length > 0 And upcreate1.PostedFile.ContentLength > 0 And upcreate1.PostedFile.ContentLength <= 400000000) Then
                If objfile.Exists Then
                    warning.Text = "กรุณาเปลี่ยนชื่อไฟล์ที่ 1"
                    Exit Sub
                Else
                    status1 = True
                End If
            Else
                status1 = False
            End If
            objfile = New FileInfo(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upcreate2.PostedFile.FileName.Trim()))
            If (upcreate2.PostedFile.FileName <> "" And upcreate2.PostedFile.FileName.Trim().Length > 0 And upcreate2.PostedFile.ContentLength > 0 And upcreate2.PostedFile.ContentLength <= 400000000) Then
                If objfile.Exists Then
                    warning.Text = "กรุณาเปลี่ยนชื่อไฟล์ที่ 2"
                    Exit Sub
                Else
                    status2 = True
                End If
            Else
                status2 = False
            End If
            objfile = New FileInfo(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upcreate3.PostedFile.FileName.Trim()))
            If (upcreate3.PostedFile.FileName <> "" And upcreate3.PostedFile.FileName.Trim().Length > 0 And upcreate3.PostedFile.ContentLength > 0 And upcreate3.PostedFile.ContentLength <= 400000000) Then
                If objfile.Exists Then
                    warning.Text = "กรุณาเปลี่ยนชื่อไฟล์ที่ 3"
                    Exit Sub
                Else
                    status3 = True
                End If
            Else
                status3 = False
            End If

            If status1 = False And status2 = False And status3 = False Then
                warning.Text = "คุณยังไม่ได้เลือกไฟล์เอกสารสำหรับดาวน์โหลด"
                Exit Sub
            End If

            '----------------
            Dim arraydateshow(2) As String
            arraydateshow = txt1.Value.Split("/")
            arraydateshow(2) = Val(arraydateshow(2)) + 543
            Dim setdateshow As String = arraydateshow(0) & "/" & arraydateshow(1) & "/" & arraydateshow(2)
            '----------------

            QueryStr = "insert into LearningContent(sub_id,lrnc_topic,lrnc_description,lrnc_writer,lrnc_date,lrnc_year,lrnc_term,lrnc_dateshow) values('" & _
                subjectDDL.SelectedItem.Value & "','" & topiccreate.Text & "','" & desccreate.Text & "','" & writercreate.Text & "','" & mydate & "','" & _
                yearcreate.Text & "','" & termcreate.Text & "','" & setdateshow & "')"

            OpenConn()

            sqlComm = New SqlCommand(QueryStr, sqlConn)
            sqlComm.CommandType = CommandType.Text
            sqlComm.ExecuteNonQuery()

            QueryStr = "select @@identity as currentID"
            TableStr = "getcurrentID"
            If FillCommQ(QueryStr, TableStr) = True Then
                If IsNothing(sqlDS) Then
                    warning.Text = "Dataset has not found . There is no currentID." & "<br />" & "ไม่สามารถอัพโหลดไฟล์ได้"
                    Exit Sub
                Else
                    If sqlDS.Tables(TableStr).Columns.Count > 0 Then
                        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                currentID = row("currentID")
                                Exit For
                            Next
                        Else
                            warning.Text = "Dataset has no row. There is no currentID." & "<br />" & "ไม่สามารถอัพโหลดไฟล์ได้"
                            Exit Sub
                        End If
                    Else
                        warning.Text = "Dataset has no column. There is no currentID." & "<br />" & "ไม่สามารถอัพโหลดไฟล์ได้"
                        Exit Sub
                    End If
                End If
            Else
                Response.Write("../DBFailed.aspx")
            End If

            If status1 = True Then
                upcreate1.PostedFile.SaveAs(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upcreate1.PostedFile.FileName.Trim()))
                QueryStr = "insert into LearningFile(lrnc_id,lrnf_name,lrnf_type,lrnf_path) values('" & currentID & "','" & _
                            Path.GetFileName(upcreate1.PostedFile.FileName.Trim()) & "','" & upcreate1.PostedFile.ContentType & _
                            "','" & "Learning/ForDownload/" & Path.GetFileName(upcreate1.PostedFile.FileName.Trim()) & "')"
                sqlComm = New SqlCommand(QueryStr, sqlConn)
                sqlComm.CommandType = CommandType.Text
                sqlComm.ExecuteNonQuery()
            End If
            If status2 = True Then
                upcreate2.PostedFile.SaveAs(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upcreate2.PostedFile.FileName.Trim()))
                QueryStr = "insert into LearningFile(lrnc_id,lrnf_name,lrnf_type,lrnf_path) values('" & currentID & "','" & _
                            Path.GetFileName(upcreate2.PostedFile.FileName.Trim()) & "','" & upcreate2.PostedFile.ContentType & _
                            "','" & "Learning/ForDownload/" & Path.GetFileName(upcreate2.PostedFile.FileName.Trim()) & "')"
                sqlComm = New SqlCommand(QueryStr, sqlConn)
                sqlComm.CommandType = CommandType.Text
                sqlComm.ExecuteNonQuery()
            End If
            If status3 = True Then
                upcreate3.PostedFile.SaveAs(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upcreate3.PostedFile.FileName.Trim()))
                QueryStr = "insert into LearningFile(lrnc_id,lrnf_name,lrnf_type,lrnf_path) values('" & currentID & "','" & _
                            Path.GetFileName(upcreate3.PostedFile.FileName.Trim()) & "','" & upcreate3.PostedFile.ContentType & _
                            "','" & "Learning/ForDownload/" & Path.GetFileName(upcreate3.PostedFile.FileName.Trim()) & "')"
                sqlComm = New SqlCommand(QueryStr, sqlConn)
                sqlComm.CommandType = CommandType.Text
                sqlComm.ExecuteNonQuery()
            End If
            CloseConn()
            Response.Redirect("../Result.aspx?msg=การอัพโหลดไฟล์เอกสารสำหรับการดาวน์โหลดเสร็จเรียบร้อยแล้ว&user=Teacher")
        ElseIf uploadtypeDDL.SelectedIndex = 2 Then
            Dim objfile As New FileInfo(Server.MapPath("~") & "\Learning\OnWeb\PPT\" & Path.GetFileName(upcreate1.PostedFile.FileName.Trim()))
            If (upcreate1.PostedFile.FileName <> "" And upcreate1.PostedFile.FileName.Trim().Length > 0 And upcreate1.PostedFile.ContentLength > 0 And upcreate1.PostedFile.ContentLength <= 400000000) Then
                If objfile.Exists Then
                    warning.Text = "กรุณาเปลี่ยนชื่อไฟล์สื่อการสอน Power Point"
                    Exit Sub
                Else
                    status1 = True
                End If
            Else
                status1 = False
                warning.Text = "คุณยังไม่ได้เลือกไฟล์สื่อการสอน Power Point"
                Exit Sub
            End If

            '----------------
            Dim arraydateshow(2) As String
            arraydateshow = txt1.Value.Split("/")
            arraydateshow(2) = Val(arraydateshow(2)) + 543
            Dim setdateshow As String = arraydateshow(0) & "/" & arraydateshow(1) & "/" & arraydateshow(2)
            '----------------

            If status1 = True Then
                upcreate1.PostedFile.SaveAs(Server.MapPath("~") & "\Learning\OnWeb\PPT\" & Path.GetFileName(upcreate1.PostedFile.FileName.Trim()))
                QueryStr = "insert into LearningOnWebPPT(sub_id,lowppt_topic,lowppt_description,lowppt_writer,lowppt_date,lowppt_year,lowppt_term,lowppt_name,lowppt_type,lowppt_path,lowppt_dateshow) values('" & _
                    subjectDDL.SelectedItem.Value & "','" & topiccreate.Text & "','" & desccreate.Text & "','" & writercreate.Text & "','" & mydate & "','" & _
                    yearcreate.Text & "','" & termcreate.Text & "','" & Path.GetFileName(upcreate1.PostedFile.FileName.Trim()) & "','" & upcreate1.PostedFile.ContentType & _
                    "','" & "Learning/OnWeb/PPT/" & Path.GetFileName(upcreate1.PostedFile.FileName.Trim()) & "','" & setdateshow & "')"
            Else
                QueryStr = "insert into LearningOnWebPPT(sub_id,lowppt_topic,lowppt_description,lowppt_writer,lowppt_date,lowppt_year,lowppt_term,lowppt_dateshow) values('" & _
                    subjectDDL.SelectedItem.Value & "','" & topiccreate.Text & "','" & desccreate.Text & "','" & writercreate.Text & "','" & mydate & "','" & _
                    yearcreate.Text & "','" & termcreate.Text & "','" & setdateshow & "')"
            End If
            If ExecuteComm(QueryStr) = True Then
                Response.Redirect("../Result.aspx?msg=การอัพโหลดไฟล์สื่อการสอน Power Point เสร็จเรียบร้อยแล้ว&user=Teacher")
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        ElseIf uploadtypeDDL.SelectedIndex = 3 Then
            Dim objfile As New FileInfo(Server.MapPath("~") & "\Learning\OnWeb\VDO\" & Path.GetFileName(upcreate1.PostedFile.FileName.Trim()))
            If (upcreate1.PostedFile.FileName <> "" And upcreate1.PostedFile.FileName.Trim().Length > 0 And upcreate1.PostedFile.ContentLength > 0 And upcreate1.PostedFile.ContentLength <= 400000000) Then
                If objfile.Exists Then
                    warning.Text = "กรุณาเปลี่ยนชื่อไฟล์สื่อการสอน Clip VDO"
                    Exit Sub
                Else
                    status1 = True
                End If
            Else
                status1 = False
                warning.Text = "คุณยังไม่ได้เลือกไฟล์สื่อการสอน Clip VDO"
                Exit Sub
            End If

            '----------------
            Dim arraydateshow(2) As String
            arraydateshow = txt1.Value.Split("/")
            arraydateshow(2) = Val(arraydateshow(2)) + 543
            Dim setdateshow As String = arraydateshow(0) & "/" & arraydateshow(1) & "/" & arraydateshow(2)
            '----------------

            If status1 = True Then
                upcreate1.PostedFile.SaveAs(Server.MapPath("~") & "\Learning\OnWeb\VDO\" & Path.GetFileName(upcreate1.PostedFile.FileName.Trim()))
                QueryStr = "insert into LearningOnWebVDO(sub_id,lowvdo_topic,lowvdo_description,lowvdo_writer,lowvdo_date,lowvdo_year,lowvdo_term,lowvdo_name,lowvdo_type,lowvdo_path,lowvdo_dateshow) values('" & _
                    subjectDDL.SelectedItem.Value & "','" & topiccreate.Text & "','" & desccreate.Text & "','" & writercreate.Text & "','" & mydate & "','" & _
                    yearcreate.Text & "','" & termcreate.Text & "','" & Path.GetFileName(upcreate1.PostedFile.FileName.Trim()) & "','" & upcreate1.PostedFile.ContentType & _
                    "','" & Server.MapPath("~") & "/Learning/OnWeb/VDO/" & Path.GetFileName(upcreate1.PostedFile.FileName.Trim()) & "','" & setdateshow & "')"
            Else
                QueryStr = "insert into LearningOnWebVDO(sub_id,lowvdo_topic,lowvdo_description,lowvdo_writer,lowvdo_date,lowvdo_year,lowvdo_term,lowvdo_dateshow) values('" & _
                    subjectDDL.SelectedItem.Value & "','" & topiccreate.Text & "','" & desccreate.Text & "','" & writercreate.Text & "','" & mydate & "','" & _
                    yearcreate.Text & "','" & termcreate.Text & "','" & setdateshow & "')"
            End If
            If ExecuteComm(QueryStr) = True Then
                Response.Redirect("../Result.aspx?msg=การอัพโหลดไฟล์สื่อการสอน Clip VDO เสร็จเรียบร้อยแล้ว&user=Teacher")
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        End If
    End Sub

    Protected Sub clear2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear2.Click
        yearupdate.Text = ""
        termupdate.Text = ""
        topicupdate.Text = ""
        descupdate.Text = ""
        writerupdate.Text = ""
        'dateshowupdate.Text = ""
        '-------
        txt2.Value = ""
        '-------
        fileholder.Controls.Clear()
        upupdate1.Style.Clear()
        upupdate2.Style.Clear()
        upupdate3.Style.Clear()
        warning.Text = ""
    End Sub

    Protected Sub fileDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles fileDDL.SelectedIndexChanged
        fileholder.Controls.Clear()
        If fileDDL.Items.Count = 0 Then
            warning.Text = "ไม่พบข้อมูล"
            Exit Sub
        Else
            If uploadtypeDDL.SelectedIndex = 0 Then
                warning.Text = "กรุณาเลือกประเภทของสื่อการสอน"
                Exit Sub
            ElseIf uploadtypeDDL.SelectedIndex = 1 Then
                QueryStr = "select * from LearningContent where sub_id = '" & subjectDDL.SelectedItem.Value & _
                    "' and lrnc_id = '" & fileDDL.SelectedItem.Value & "'"
                TableStr = "getdetaillearningcontent"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            yearupdate.Text = row("lrnc_year")
                            termupdate.Text = row("lrnc_term")
                            topicupdate.Text = row("lrnc_topic")
                            descupdate.Text = row("lrnc_description")
                            writerupdate.Text = row("lrnc_writer")
                            'dateshowupdate.Text = row("lrnc_dateshow")
                            Dim mydate As String = row("lrnc_dateshow")
                            Dim getmydate(2) As String
                            getmydate = mydate.Split("/")
                            '----------
                            getmydate(2) = getmydate(2) - 543
                            txt2.Value = getmydate(0) & "/" & getmydate(1) & "/" & getmydate(2)
                            '----------
                        Next
                        QueryStr = "select lrnf_name,lrnf_path from LearningFile where lrnc_id = '" & fileDDL.SelectedItem.Value & "'"
                        TableStr = "getfileLearningFile"
                        If FillCommQ(QueryStr, TableStr) = True Then
                            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                                CreateFile(sqlDS, 1)
                            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                                fileholder.Controls.Clear()
                                upupdate1.Style.Clear()
                                upupdate2.Style.Clear()
                                upupdate3.Style.Clear()
                            Else
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            ElseIf uploadtypeDDL.SelectedIndex = 2 Then
                QueryStr = "select * from LearningOnWebPPT where sub_id = '" & subjectDDL.SelectedItem.Value & _
                           "' and lowppt_id = '" & fileDDL.SelectedItem.Value & "'"
                TableStr = "getdetaillearningppt"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            yearupdate.Text = row("lowppt_year")
                            termupdate.Text = row("lowppt_term")
                            topicupdate.Text = row("lowppt_topic")
                            descupdate.Text = row("lowppt_description")
                            writerupdate.Text = row("lowppt_writer")
                            'dateshowupdate.Text = row("lowppt_dateshow")
                            Dim mydate As String = row("lowppt_dateshow")
                            Dim getmydate(2) As String
                            getmydate = mydate.Split("/")
                            '----------
                            getmydate(2) = getmydate(2) - 543
                            txt2.Value = getmydate(0) & "/" & getmydate(1) & "/" & getmydate(2)
                            '----------
                            If row("lowppt_path") Is DBNull.Value Then
                                fileholder.Controls.Clear()
                                upupdate1.Style.Clear()
                            Else
                                CreateFile(sqlDS, 2)
                            End If
                        Next
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            ElseIf uploadtypeDDL.SelectedIndex = 3 Then
                QueryStr = "select * from LearningOnWebVDO where sub_id = '" & subjectDDL.SelectedItem.Value & _
                           "' and lowvdo_id = '" & fileDDL.SelectedItem.Value & "'"
                TableStr = "getdetaillearningvdo"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            yearupdate.Text = row("lowvdo_year")
                            termupdate.Text = row("lowvdo_term")
                            topicupdate.Text = row("lowvdo_topic")
                            descupdate.Text = row("lowvdo_description")
                            writerupdate.Text = row("lowvdo_writer")
                            'dateshowupdate.Text = row("lowvdo_dateshow")
                            Dim mydate As String = row("lowvdo_dateshow")
                            Dim getmydate(2) As String
                            getmydate = mydate.Split("/")
                            '----------
                            getmydate(2) = getmydate(2) - 543
                            txt2.Value = getmydate(0) & "/" & getmydate(1) & "/" & getmydate(2)
                            '----------
                            If row("lowvdo_path") Is DBNull.Value Then
                                fileholder.Controls.Clear()
                                upupdate1.Style.Clear()
                            Else
                                CreateFile(sqlDS, 3)
                            End If
                        Next
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            End If
        End If
    End Sub

    Function GetLiteral(ByVal text As String)
        Try
            Dim rv As Literal
            rv = New Literal
            rv.Text = text
            GetLiteral = rv
        Catch ex As Exception
            GetLiteral = "<br />"
        End Try
    End Function

    Sub CreateFile(ByVal ds As DataSet, ByVal str As Integer)
        Try
            Dim tmp As String = ""
            Dim i As Integer = 1
            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                Dim SetFilelabel As New Label
                Dim SetCheckBox As New CheckBox
                If str = 1 Then
                    tmp = "lrnf"
                ElseIf str = 2 Then
                    tmp = "lowppt"
                ElseIf str = 3 Then
                    tmp = "lowvdo"
                End If
                'SetFileLink.ID = "Flink" & i
                'SetFileLink.Text = row(tmp & "_name")
                'SetFileLink.OnClientClick = "location.href='" & Server.MapPath("~") & row(tmp & "_path") & "'"

                SetFilelabel.ID = "Flabel" & i
                SetFilelabel.Text = row(tmp & "_name")

                SetCheckBox.ID = "CH" & i
                SetCheckBox.Checked = False

                fileholder.Controls.Add(GetLiteral(" Delete : "))
                fileholder.Controls.Add(SetCheckBox)
                fileholder.Controls.Add(GetLiteral(" ไฟล์ดาวน์โหลด " & i & ". "))
                fileholder.Controls.Add(SetFilelabel)
                fileholder.Controls.Add(GetLiteral("<br />"))
                i = i + 1
            Next
        Catch ex As Exception
            warning.Text = "พบปัญหาที่ฟังก์ชัน CreateFile" & "<br />" & ex.Message
            Exit Sub
        End Try
    End Sub

    Function GetFileDelete(ByVal size As Integer, ByVal ArrFileDelete As Array) As Array
        Dim i As Integer
        For i = 1 To size
            Dim ch As String = "CH" & i
            Dim GetCheckBox As CheckBox = CType(Me.FindControl(ch), CheckBox)
            If GetCheckBox.Checked Then
                ArrFileDelete(i - 1) = "1"
            Else
                ArrFileDelete(i - 1) = "0"
            End If
        Next
        Return ArrFileDelete
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Try
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Teacher" Then
            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้สอน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If

        If Not Page.IsPostBack Then
        Else
            delete.Attributes.Add("onclick", "return confirm('Are you sure you want to delete this learning content and file ?');")
            If tableupdate.Visible = True Then
                If uploadtypeDDL.SelectedIndex = 0 Then
                    Exit Sub
                Else
                    If fileDDL.Items.Count = 0 Then
                        Exit Sub
                    Else
                        If uploadtypeDDL.SelectedIndex = 1 Then
                            QueryStr = "select lrnf_name,lrnf_path from LearningFile where lrnc_id = '" & fileDDL.SelectedItem.Value & "'"
                            TableStr = "getfileLearningFile"
                            If FillCommQ(QueryStr, TableStr) = True Then
                                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                                    CreateFile(sqlDS, 1)
                                ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                                    fileholder.Controls.Clear()
                                    upupdate1.Style.Clear()
                                    upupdate2.Style.Clear()
                                    upupdate3.Style.Clear()
                                Else
                                    Response.Redirect("../DBFailed.aspx")
                                End If
                            Else
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        ElseIf uploadtypeDDL.SelectedIndex = 2 Then
                            QueryStr = "select * from LearningOnWebPPT where sub_id = '" & subjectDDL.SelectedItem.Value & _
                                       "' and lowppt_id = '" & fileDDL.SelectedItem.Value & "'"
                            TableStr = "getdetaillearningppt"
                            If FillCommQ(QueryStr, TableStr) = True Then
                                If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                        If row("lowppt_path") Is DBNull.Value Then
                                            fileholder.Controls.Clear()
                                            upupdate1.Style.Clear()
                                        Else
                                            CreateFile(sqlDS, 2)
                                        End If
                                    Next
                                ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                                    Exit Sub
                                Else
                                    Response.Redirect("../DBFailed.aspx")
                                End If
                            Else
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        ElseIf uploadtypeDDL.SelectedIndex = 3 Then
                            QueryStr = "select * from LearningOnWebVDO where sub_id = '" & subjectDDL.SelectedItem.Value & _
                                        "' and lowvdo_id = '" & fileDDL.SelectedItem.Value & "'"
                            TableStr = "getdetaillearningvdo"
                            If FillCommQ(QueryStr, TableStr) = True Then
                                If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                        If row("lowvdo_path") Is DBNull.Value Then
                                            fileholder.Controls.Clear()
                                            upupdate1.Style.Clear()
                                        Else
                                            CreateFile(sqlDS, 3)
                                        End If
                                    Next
                                ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                                    Exit Sub
                                Else
                                    Response.Redirect("../DBFailed.aspx")
                                End If
                            Else
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        End If
                    End If
                End If
            End If
        End If
        'Catch ex As Exception
        '    warning.Text = ex.Message
        '    Exit Sub
        'End Try
    End Sub

    Protected Sub update_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles update.Click
        Dim status1 As Boolean = False
        Dim status2 As Boolean = False
        Dim status3 As Boolean = False
        'Dim mydate As String = Today
        Dim mydate As Date = System.DateTime.Now.ToLongDateString
        Dim currentID As String = ""
        If uploadtypeDDL.SelectedIndex = 0 Then
            warning.Text = "กรุณาเลือกประเภทไฟล์สื่อการสอน"
            Exit Sub
        Else
            If fileDDL.Items.Count = 0 Then
                warning.Text = "ไม่พบข้อมูล"
                Exit Sub
            Else
                If uploadtypeDDL.SelectedIndex = 1 Then
                    QueryStr = "select * from LearningFile where lrnc_id = '" & fileDDL.SelectedItem.Value & "'"
                    TableStr = "getfileLearningFile"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                            Dim size As Integer = sqlDS.Tables(TableStr).Rows.Count
                            Dim arrID(size - 1) As String
                            Dim arrPath(size - 1) As String
                            Dim j As Integer = 0
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                arrID(j) = row("lrnf_id")
                                arrPath(j) = row("lrnf_path")
                                j = j + 1
                            Next
                            Dim ArrFileDelete(size - 1) As String

                            ArrFileDelete = GetFileDelete(size, ArrFileDelete)

                            Dim objfile As New FileInfo(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upupdate1.PostedFile.FileName.Trim()))
                            If (upupdate1.PostedFile.FileName <> "" And upupdate1.PostedFile.FileName.Trim().Length > 0 And upupdate1.PostedFile.ContentLength > 0 And upupdate1.PostedFile.ContentLength <= 400000000) Then
                                If objfile.Exists Then
                                    warning.Text = "กรุณาเปลี่ยนชื่อไฟล์ที่ 1"
                                    Exit Sub
                                Else
                                    status1 = True
                                End If
                            Else
                                status1 = False
                            End If
                            objfile = New FileInfo(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upupdate2.PostedFile.FileName.Trim()))
                            If (upupdate2.PostedFile.FileName <> "" And upupdate2.PostedFile.FileName.Trim().Length > 0 And upupdate2.PostedFile.ContentLength > 0 And upupdate2.PostedFile.ContentLength <= 400000000) Then
                                If objfile.Exists Then
                                    warning.Text = "กรุณาเปลี่ยนชื่อไฟล์ที่ 2"
                                    Exit Sub
                                Else
                                    status2 = True
                                End If
                            Else
                                status2 = False
                            End If
                            objfile = New FileInfo(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upupdate3.PostedFile.FileName.Trim()))
                            If (upupdate3.PostedFile.FileName <> "" And upupdate3.PostedFile.FileName.Trim().Length > 0 And upupdate3.PostedFile.ContentLength > 0 And upupdate3.PostedFile.ContentLength <= 400000000) Then
                                If objfile.Exists Then
                                    warning.Text = "กรุณาเปลี่ยนชื่อไฟล์ที่ 3"
                                    Exit Sub
                                Else
                                    status3 = True
                                End If
                            Else
                                status3 = False
                            End If

                            '----------------
                            Dim arraydateshow(2) As String
                            arraydateshow = txt2.Value.Split("/")
                            arraydateshow(2) = Val(arraydateshow(2)) + 543
                            Dim setdateshow As String = arraydateshow(0) & "/" & arraydateshow(1) & "/" & arraydateshow(2)
                            '----------------

                            QueryStr = "update LearningContent set sub_id = '" & subjectDDL.SelectedItem.Value & _
                                "',lrnc_topic = '" & topicupdate.Text & "',lrnc_description = '" & descupdate.Text & _
                                "',lrnc_writer = '" & writerupdate.Text & "',lrnc_date = '" & mydate & "',lrnc_year = '" & _
                                yearupdate.Text & "',lrnc_term = '" & termupdate.Text & "',lrnc_dateshow = '" & setdateshow & "'" & _
                                " where lrnc_id = '" & fileDDL.SelectedItem.Value & "'"
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFailed.aspx")
                            End If

                            Dim i As Integer
                            Dim objpath As New FileInfo(Server.MapPath("~") & "/" & arrPath(0))
                            For i = 1 To size
                                If ArrFileDelete(i - 1) = "1" Then
                                    QueryStr = "delete from LearningFile where lrnf_id = '" & arrID(i - 1) & "'"
                                    If ExecuteComm(QueryStr) = False Then
                                        Response.Redirect("../DBFailed.aspx")
                                    End If
                                    objpath = New FileInfo(Server.MapPath("~") & "/" & arrPath(i - 1))
                                    objpath.Delete()
                                End If
                            Next
                            If status1 = True Then
                                upupdate1.PostedFile.SaveAs(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upupdate1.PostedFile.FileName.Trim()))
                                QueryStr = "insert into LearningFile(lrnc_id,lrnf_name,lrnf_type,lrnf_path) values('" & fileDDL.SelectedItem.Value & "','" & _
                                            Path.GetFileName(upupdate1.PostedFile.FileName.Trim()) & "','" & upupdate1.PostedFile.ContentType & _
                                            "','" & "Learning/ForDownload/" & Path.GetFileName(upupdate1.PostedFile.FileName.Trim()) & "')"
                                If ExecuteComm(QueryStr) = False Then
                                    Response.Redirect("../DBFailed.aspx")
                                End If
                            End If
                            If status2 = True Then
                                upupdate2.PostedFile.SaveAs(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upupdate2.PostedFile.FileName.Trim()))
                                QueryStr = "insert into LearningFile(lrnc_id,lrnf_name,lrnf_type,lrnf_path) values('" & fileDDL.SelectedItem.Value & "','" & _
                                            Path.GetFileName(upupdate2.PostedFile.FileName.Trim()) & "','" & upupdate2.PostedFile.ContentType & _
                                            "','" & "Learning/ForDownload/" & Path.GetFileName(upupdate2.PostedFile.FileName.Trim()) & "')"
                                If ExecuteComm(QueryStr) = False Then
                                    Response.Redirect("../DBFailed.aspx")
                                End If
                            End If
                            If status3 = True Then
                                upupdate3.PostedFile.SaveAs(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upupdate3.PostedFile.FileName.Trim()))
                                QueryStr = "insert into LearningFile(lrnc_id,lrnf_name,lrnf_type,lrnf_path) values('" & fileDDL.SelectedItem.Value & "','" & _
                                            Path.GetFileName(upupdate3.PostedFile.FileName.Trim()) & "','" & upupdate3.PostedFile.ContentType & _
                                            "','" & "Learning/ForDownload/" & Path.GetFileName(upupdate3.PostedFile.FileName.Trim()) & "')"
                                If ExecuteComm(QueryStr) = False Then
                                    Response.Redirect("../DBFailed.aspx")
                                End If
                            End If
                            Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงไฟล์เอกสารสำหรับการดาวน์โหลดเสร็จเรียบร้อยแล้ว&user=Teacher")
                        ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                            fileholder.Controls.Clear()
                            upupdate1.Style.Clear()
                            upupdate2.Style.Clear()
                            upupdate3.Style.Clear()
                            Dim objfile As New FileInfo(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upupdate1.PostedFile.FileName.Trim()))
                            If (upupdate1.PostedFile.FileName <> "" And upupdate1.PostedFile.FileName.Trim().Length > 0 And upupdate1.PostedFile.ContentLength > 0 And upupdate1.PostedFile.ContentLength <= 400000000) Then
                                If objfile.Exists Then
                                    warning.Text = "กรุณาเปลี่ยนชื่อไฟล์ที่ 1"
                                    Exit Sub
                                Else
                                    status1 = True
                                End If
                            Else
                                status1 = False
                            End If
                            objfile = New FileInfo(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upupdate2.PostedFile.FileName.Trim()))
                            If (upupdate2.PostedFile.FileName <> "" And upupdate2.PostedFile.FileName.Trim().Length > 0 And upupdate2.PostedFile.ContentLength > 0 And upupdate2.PostedFile.ContentLength <= 400000000) Then
                                If objfile.Exists Then
                                    warning.Text = "กรุณาเปลี่ยนชื่อไฟล์ที่ 2"
                                    Exit Sub
                                Else
                                    status2 = True
                                End If
                            Else
                                status2 = False
                            End If
                            objfile = New FileInfo(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upupdate3.PostedFile.FileName.Trim()))
                            If (upupdate3.PostedFile.FileName <> "" And upupdate3.PostedFile.FileName.Trim().Length > 0 And upupdate3.PostedFile.ContentLength > 0 And upupdate3.PostedFile.ContentLength <= 400000000) Then
                                If objfile.Exists Then
                                    warning.Text = "กรุณาเปลี่ยนชื่อไฟล์ที่ 3"
                                    Exit Sub
                                Else
                                    status3 = True
                                End If
                            Else
                                status3 = False
                            End If

                            '----------------
                            Dim arraydateshow(2) As String
                            arraydateshow = txt2.Value.Split("/")
                            arraydateshow(2) = Val(arraydateshow(2)) + 543
                            Dim setdateshow As String = arraydateshow(0) & "/" & arraydateshow(1) & "/" & arraydateshow(2)
                            '----------------

                            QueryStr = "update LearningContent set sub_id = '" & subjectDDL.SelectedItem.Value & _
                                "',lrnc_topic = '" & topicupdate.Text & "',lrnc_description = '" & descupdate.Text & _
                                "',lrnc_writer = '" & writerupdate.Text & "',lrnc_date = '" & mydate & "',lrnc_year = '" & _
                                yearupdate.Text & "',lrnc_term = '" & termupdate.Text & "',lrnc_dateshow = '" & setdateshow & "'" & _
                                " where lrnc_id = '" & fileDDL.SelectedItem.Value & "'"
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFailed.aspx")
                            End If
                            If status1 = True Then
                                upupdate1.PostedFile.SaveAs(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upupdate1.PostedFile.FileName.Trim()))
                                QueryStr = "insert into LearningFile(lrnc_id,lrnf_name,lrnf_type,lrnf_path) values('" & fileDDL.SelectedItem.Value & "','" & _
                                            Path.GetFileName(upupdate1.PostedFile.FileName.Trim()) & "','" & upupdate1.PostedFile.ContentType & _
                                            "','" & "Learning/ForDownload/" & Path.GetFileName(upupdate1.PostedFile.FileName.Trim()) & "')"
                                If ExecuteComm(QueryStr) = False Then
                                    Response.Redirect("../DBFailed.aspx")
                                End If
                            End If
                            If status2 = True Then
                                upupdate2.PostedFile.SaveAs(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upupdate2.PostedFile.FileName.Trim()))
                                QueryStr = "insert into LearningFile(lrnc_id,lrnf_name,lrnf_type,lrnf_path) values('" & fileDDL.SelectedItem.Value & "','" & _
                                            Path.GetFileName(upupdate2.PostedFile.FileName.Trim()) & "','" & upupdate2.PostedFile.ContentType & _
                                            "','" & "Learning/ForDownload/" & Path.GetFileName(upupdate2.PostedFile.FileName.Trim()) & "')"
                                If ExecuteComm(QueryStr) = False Then
                                    Response.Redirect("../DBFailed.aspx")
                                End If
                            End If
                            If status3 = True Then
                                upupdate3.PostedFile.SaveAs(Server.MapPath("~") & "\Learning\ForDownload\" & Path.GetFileName(upupdate3.PostedFile.FileName.Trim()))
                                QueryStr = "insert into LearningFile(lrnc_id,lrnf_name,lrnf_type,lrnf_path) values('" & fileDDL.SelectedItem.Value & "','" & _
                                            Path.GetFileName(upupdate3.PostedFile.FileName.Trim()) & "','" & upupdate3.PostedFile.ContentType & _
                                            "','" & "Learning/ForDownload/" & Path.GetFileName(upupdate3.PostedFile.FileName.Trim()) & "')"
                                If ExecuteComm(QueryStr) = False Then
                                    Response.Redirect("../DBFailed.aspx")
                                End If
                            End If
                            Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงไฟล์เอกสารสำหรับการดาวน์โหลดเสร็จเรียบร้อยแล้ว&user=Teacher")
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                ElseIf uploadtypeDDL.SelectedIndex = 2 Then
                    Dim ArrFileDelete(0) As String
                    ArrFileDelete = GetFileDelete(1, ArrFileDelete)
                    Dim objfile As New FileInfo(Server.MapPath("~") & "\Learning\OnWeb\PPT\" & Path.GetFileName(upupdate1.PostedFile.FileName.Trim()))
                    If (upupdate1.PostedFile.FileName <> "" And upupdate1.PostedFile.FileName.Trim().Length > 0 And upupdate1.PostedFile.ContentLength > 0 And upupdate1.PostedFile.ContentLength <= 400000000) Then
                        If ArrFileDelete(0) = "0" Then
                            warning.Text = "ถ้าคุณต้องการอัพโหลดไฟล์ใหม่ กรุณา Click ที่ Checkbox เพื่อเป็นการลบไฟล์เก่าด้วย"
                            Exit Sub
                        Else
                            If objfile.Exists Then
                                warning.Text = "กรุณาเปลี่ยนชื่อไฟล์"
                                Exit Sub
                            Else
                                status1 = True
                            End If
                        End If
                    Else
                        If ArrFileDelete(0) = "1" Then
                            warning.Text = "กรุณาเลือกไฟล์สื่อการสอน Power Point"
                            Exit Sub
                        Else
                            status1 = False
                        End If
                    End If

                    '----------------
                    Dim arraydateshow(2) As String
                    arraydateshow = txt2.Value.Split("/")
                    arraydateshow(2) = Val(arraydateshow(2)) + 543
                    Dim setdateshow As String = arraydateshow(0) & "/" & arraydateshow(1) & "/" & arraydateshow(2)
                    '----------------

                    If status1 = True Then
                        Dim mypath As String = ""
                        QueryStr = "select lowppt_path from LearningOnWebPPT where lowppt_id = '" & fileDDL.SelectedItem.Value & "'"
                        TableStr = "getfileid"
                        If FillCommQ(QueryStr, TableStr) = True Then
                            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                    mypath = row("lowppt_path")
                                Next
                            Else
                                warning.Text = "ไม่พบข้อมูล"
                                Exit Sub
                            End If
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If

                        upupdate1.PostedFile.SaveAs(Server.MapPath("~") & "\Learning\OnWeb\PPT\" & Path.GetFileName(upupdate1.PostedFile.FileName.Trim()))
                        QueryStr = "update LearningOnWebPPT set sub_id = '" & subjectDDL.SelectedItem.Value & _
                            "',lowppt_topic = '" & topicupdate.Text & "',lowppt_description = '" & descupdate.Text & _
                            "',lowppt_writer = '" & writerupdate.Text & "',lowppt_date = '" & mydate & "',lowppt_year = '" & _
                            yearupdate.Text & "',lowppt_term = '" & termupdate.Text & "',lowppt_name = '" & _
                            Path.GetFileName(upupdate1.PostedFile.FileName.Trim()) & "',lowppt_type = '" & _
                            upupdate1.PostedFile.ContentType & "',lowppt_path = '" & "Learning/OnWeb/PPT/" & _
                            Path.GetFileName(upupdate1.PostedFile.FileName.Trim()) & "',lowppt_dateshow = '" & setdateshow & "'" & _
                            " where lowppt_id = '" & fileDDL.SelectedItem.Value & "'"
                        CloseConn()
                        If ExecuteComm(QueryStr) = False Then
                            Response.Redirect("../DBFailed.aspx")
                        End If
                        Dim objoldfile As New FileInfo(Server.MapPath("~") & "/" & mypath)
                        objoldfile.Delete()
                        Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงไฟล์สื่อการสอน Power Point เสร็จเรียบร้อยแล้ว&user=Teacher")
                    Else
                        QueryStr = "update LearningOnWebPPT set sub_id = '" & subjectDDL.SelectedItem.Value & _
                            "',lowppt_topic = '" & topicupdate.Text & "',lowppt_description = '" & descupdate.Text & _
                            "',lowppt_writer = '" & writerupdate.Text & "',lowppt_date = '" & mydate & "',lowppt_year = '" & _
                            yearupdate.Text & "',lowppt_term = '" & termupdate.Text & "',lowppt_dateshow = '" & setdateshow & "'" & _
                            " where lowppt_id = '" & fileDDL.SelectedItem.Value & "'"
                        If ExecuteComm(QueryStr) = False Then
                            Response.Redirect("../DBFailed.aspx")
                        End If
                        Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงไฟล์สื่อการสอน Power Point เสร็จเรียบร้อยแล้ว&user=Teacher")
                    End If
                ElseIf uploadtypeDDL.SelectedIndex = 3 Then
                    Dim ArrFileDelete(0) As String
                    ArrFileDelete = GetFileDelete(1, ArrFileDelete)
                    Dim objfile As New FileInfo(Server.MapPath("~") & "\Learning\OnWeb\VDO\" & Path.GetFileName(upupdate1.PostedFile.FileName.Trim()))
                    If (upupdate1.PostedFile.FileName <> "" And upupdate1.PostedFile.FileName.Trim().Length > 0 And upupdate1.PostedFile.ContentLength > 0 And upupdate1.PostedFile.ContentLength <= 400000000) Then
                        If ArrFileDelete(0) = "0" Then
                            warning.Text = "ถ้าคุณต้องการอัพโหลดไฟล์ใหม่ กรุณา Click ที่ Checkbox เพื่อเป็นการลบไฟล์เก่าด้วย"
                            Exit Sub
                        Else
                            If objfile.Exists Then
                                warning.Text = "กรุณาเปลี่ยนชื่อไฟล์"
                                Exit Sub
                            Else
                                status1 = True
                            End If
                        End If
                    Else
                        If ArrFileDelete(0) = "1" Then
                            warning.Text = "กรุณาเลือกไฟล์สื่อการสอน Clip VDO"
                            Exit Sub
                        Else
                            status1 = False
                        End If
                    End If

                    '----------------
                    Dim arraydateshow(2) As String
                    arraydateshow = txt2.Value.Split("/")
                    arraydateshow(2) = Val(arraydateshow(2)) + 543
                    Dim setdateshow As String = arraydateshow(0) & "/" & arraydateshow(1) & "/" & arraydateshow(2)
                    '----------------

                    If status1 = True Then
                        Dim mypath As String = ""
                        QueryStr = "select lowvdo_path from LearningOnWebVDO where lowvdo_id = '" & fileDDL.SelectedItem.Value & "'"
                        TableStr = "getfileid"
                        If FillCommQ(QueryStr, TableStr) = True Then
                            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                    mypath = row("lowvdo_path")
                                Next
                            Else
                                warning.Text = "ไม่พบข้อมูล"
                                Exit Sub
                            End If
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If

                        upupdate1.PostedFile.SaveAs(Server.MapPath("~") & "\Learning\OnWeb\VDO\" & Path.GetFileName(upupdate1.PostedFile.FileName.Trim()))
                        QueryStr = "update LearningOnWebVDO set sub_id = '" & subjectDDL.SelectedItem.Value & _
                            "',lowvdo_topic = '" & topicupdate.Text & "',lowvdo_description = '" & descupdate.Text & _
                            "',lowvdo_writer = '" & writerupdate.Text & "',lowvdo_date = '" & mydate & "',lowvdo_year = '" & _
                            yearupdate.Text & "',lowvdo_term = '" & termupdate.Text & "',lowvdo_name = '" & _
                            Path.GetFileName(upupdate1.PostedFile.FileName.Trim()) & "',lowvdo_type = '" & _
                            upupdate1.PostedFile.ContentType & "',lowvdo_path = '" & Server.MapPath("~") & "/Learning/OnWeb/VDO/" & _
                            Path.GetFileName(upupdate1.PostedFile.FileName.Trim()) & "',lowvdo_dateshow = '" & setdateshow & "'" & _
                            " where lowvdo_id = '" & fileDDL.SelectedItem.Value & "'"
                        CloseConn()
                        If ExecuteComm(QueryStr) = False Then
                            Response.Redirect("../DBFailed.aspx")
                        End If
                        'Dim objoldfile As New FileInfo(Server.MapPath("~") & "/" & mypath)
                        Dim objoldfile As New FileInfo(mypath)
                        objoldfile.Delete()
                        Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงไฟล์สื่อการสอน Clip VDO เสร็จเรียบร้อยแล้ว&user=Teacher")
                    Else
                        QueryStr = "update LearningOnWebVDO set sub_id = '" & subjectDDL.SelectedItem.Value & _
                            "',lowvdo_topic = '" & topicupdate.Text & "',lowvdo_description = '" & descupdate.Text & _
                            "',lowvdo_writer = '" & writerupdate.Text & "',lowvdo_date = '" & mydate & "',lowvdo_year = '" & _
                            yearupdate.Text & "',lowvdo_term = '" & termupdate.Text & "',lowvdo_dateshow = '" & setdateshow & "'" & _
                            " where lowvdo_id = '" & fileDDL.SelectedItem.Value & "'"
                        If ExecuteComm(QueryStr) = False Then
                            Response.Redirect("../DBFailed.aspx")
                        End If
                        Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงไฟล์สื่อการสอน Clip VDO เสร็จเรียบร้อยแล้ว&user=Teacher")
                    End If
                End If
            End If
        End If
    End Sub

    Protected Sub delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles delete.Click
        Dim mypath As String = ""
        Dim prefix As String = ""
        Dim tablename As String = ""
        If uploadtypeDDL.SelectedIndex = 0 Then
            warning.Text = "กรุณาเลือกประเภทของไฟล์สื่อการสอน"
            Exit Sub
        Else
            If fileDDL.Items.Count = 0 Then
                warning.Text = "ไม่พบข้อมูล"
                Exit Sub
            Else
                If uploadtypeDDL.SelectedIndex = 1 Then
                    prefix = "lrnc"
                    tablename = "LearningContent"
                ElseIf uploadtypeDDL.SelectedIndex = 2 Then
                    prefix = "lowppt"
                    tablename = "LearningOnWebPPT"
                ElseIf uploadtypeDDL.SelectedIndex = 3 Then
                    prefix = "lowvdo"
                    tablename = "LearningOnWebVDO"
                End If
            End If
        End If
        If tablename = "LearningContent" Then
            QueryStr = "select lrnf_path from LearningFile where lrnc_id = '" & fileDDL.SelectedItem.Value & "'"
            TableStr = "getmypath"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    Dim tmp As Integer = sqlDS.Tables(TableStr).Rows.Count
                    Dim arrpath(tmp - 1) As String
                    Dim i As Integer = 0
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        arrpath(i) = row("lrnf_path")
                        i = i + 1
                    Next
                    Dim objoldpath As New FileInfo(Server.MapPath("~") & "/" & arrpath(0))
                    For i = 1 To tmp
                        QueryStr = "delete from LearningFile where lrnc_id = '" & fileDDL.SelectedItem.Value & "' and lrnf_path = '" & arrpath(i - 1) & "'"
                        If ExecuteComm(QueryStr) = False Then
                            Response.Redirect("../DBFailed.aspx")
                        End If
                        objoldpath = New FileInfo(Server.MapPath("~") & "/" & arrpath(i - 1))
                        objoldpath.Delete()
                    Next
                    QueryStr = "delete from LearningContent where lrnc_id = '" & fileDDL.SelectedItem.Value & "'"
                    If ExecuteComm(QueryStr) = False Then
                        Response.Redirect("../DBFailed.aspx")
                    Else
                        Response.Redirect("../Result.aspx?msg=ระบบได้ลบสื่อการสอนของหัวข้อนี้เรียบร้อยแล้ว&user=Teacher")
                    End If
                Else
                    warning.Text = "ไม่พบข้อมูล"
                    Exit Sub
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            QueryStr = "select " & prefix & "_path from " & tablename & " where " & prefix & "_id = '" & fileDDL.SelectedItem.Value & "'"
            TableStr = "getfileid"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        mypath = row(prefix & "_path")
                    Next
                Else
                    warning.Text = "ไม่พบข้อมูล"
                    Exit Sub
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
            Dim objoldfile As New FileInfo(Server.MapPath("~") & "/" & mypath)
            QueryStr = "delete from " & tablename & " where " & prefix & "_id = '" & fileDDL.SelectedItem.Value & "'"
            If ExecuteComm(QueryStr) = True Then
                objoldfile.Delete()
                Response.Redirect("../Result.aspx?msg=ระบบได้ลบสื่อการสอนของหัวข้อนี้เรียบร้อยแล้ว&user=Teacher")
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        End If
    End Sub
End Class
