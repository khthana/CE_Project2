Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class Administrator_AdministratorThesis
    Inherits System.Web.UI.Page

    Protected Sub createthesis_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles createthesis.Click
        tablecreate.Visible = True
        tableupdate.Visible = False
        tableshow.Visible = False
        warning.Text = ""
    End Sub

    Protected Sub updatethesis_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updatethesis.Click
        degreeDDL.SelectedIndex = 0
        yearDDL.Items.Clear()
        eprojectDDL.Items.Clear()
        tablecreate.Visible = False
        tableupdate.Visible = True
        tableshow.Visible = False
        warning.Text = ""
    End Sub

    Protected Sub clear1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear1.Click
        degree1.SelectedIndex = 0
        year1.Text = ""
        tname1.Text = ""
        ename1.Text = ""
        tabstract1.Text = ""
        eabstract1.Text = ""
        advisor11.Text = ""
        advisor12.Text = ""
        student11.Text = ""
        id11.Text = ""
        student12.Text = ""
        id12.Text = ""
        student13.Text = ""
        id13.Text = ""
        report1.Style.Clear()
        code1.Style.Clear()
        warning.Text = ""
    End Sub

    Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        warning.Text = ""
        Dim getmypathreport As String = ""
        Dim getmypathcode As String = ""
        Dim currentID As String = ""
        Dim statusreport As Boolean = False
        Dim statuscode As Boolean = False
        Dim mypathreport As String = ""
        Dim mypathcode As String = ""
        Dim objreport As New FileInfo(Server.MapPath("~") & "\Thesis\Bachelor\Document\" & Path.GetFileName(report1.PostedFile.FileName.Trim()))
        Dim objcode As New FileInfo(Server.MapPath("~") & "\Thesis\Bachelor\Code\" & Path.GetFileName(code1.PostedFile.FileName.Trim()))
        If degree1.SelectedIndex = 0 Then
            warning.Text = "กรุณาเลือกระดับปริญญา"
            Exit Sub
        ElseIf degree1.SelectedIndex = 1 Then
            getmypathreport = "Thesis/Bachelor/Document/"
            getmypathcode = "Thesis/Bachelor/Code/"
            mypathreport = "\Thesis\Bachelor\Document\"
            mypathcode = "\Thesis\Bachelor\Code\"
            objreport = New FileInfo(Server.MapPath("~") & mypathreport & Path.GetFileName(report1.PostedFile.FileName.Trim()))
            objcode = New FileInfo(Server.MapPath("~") & mypathcode & Path.GetFileName(code1.PostedFile.FileName.Trim()))
        ElseIf degree1.SelectedIndex = 2 Then
            getmypathreport = "Thesis/Master/Document/"
            getmypathcode = "Thesis/Master/Code/"
            mypathreport = "\Thesis\Master\Document\"
            mypathcode = "\Thesis\Master\Code\"
            objreport = New FileInfo(Server.MapPath("~") & mypathreport & Path.GetFileName(report1.PostedFile.FileName.Trim()))
            objcode = New FileInfo(Server.MapPath("~") & mypathcode & Path.GetFileName(code1.PostedFile.FileName.Trim()))
        ElseIf degree1.SelectedIndex = 3 Then
            getmypathreport = "Thesis/Doctor/Document/"
            getmypathcode = "Thesis/Doctor/Code/"
            mypathreport = "\Thesis\Doctor\Document\"
            mypathcode = "\Thesis\Doctor\Code\"
            objreport = New FileInfo(Server.MapPath("~") & mypathreport & Path.GetFileName(report1.PostedFile.FileName.Trim()))
            objcode = New FileInfo(Server.MapPath("~") & mypathcode & Path.GetFileName(code1.PostedFile.FileName.Trim()))
        End If
        If (report1.PostedFile.FileName <> "" And report1.PostedFile.FileName.Trim().Length > 0 And report1.PostedFile.ContentLength > 0 And report1.PostedFile.ContentLength <= 400000000) Then
            If objreport.Exists Then
                warning.Text = "กรุณาเปลี่ยนชื่อไฟล์รายงาน"
                Exit Sub
            Else
                statusreport = True
            End If
        Else
            statusreport = False
            warning.Text = "กรุณาเลือกไฟล์รายงาน"
            Exit Sub
        End If
        If (code1.PostedFile.FileName <> "" And code1.PostedFile.FileName.Trim().Length > 0 And code1.PostedFile.ContentLength > 0 And code1.PostedFile.ContentLength <= 400000000) Then
            If objcode.Exists Then
                warning.Text = "กรุณาเปลี่ยนชื่อไฟล์ Source Code"
                Exit Sub
            Else
                statuscode = True
            End If
        Else
            statuscode = False
            warning.Text = "กรุณาเลือกไฟล์ Source Code"
            Exit Sub
        End If
        If statusreport = True And statuscode = True Then
            report1.PostedFile.SaveAs(Server.MapPath("~") & mypathreport & Path.GetFileName(report1.PostedFile.FileName.Trim()))
            code1.PostedFile.SaveAs(Server.MapPath("~") & mypathcode & Path.GetFileName(code1.PostedFile.FileName.Trim()))
            QueryStr = "insert into Thesis(tsis_year,tsis_degree,tsis_tname,tsis_ename,tsis_tabstract,tsis_eabstract,tsis_repfile,tsis_reppath,tsis_codefile,tsis_codepath) values('" & _
                year1.Text & "','" & degree1.SelectedItem.Value & "','" & tname1.Text & "','" & ename1.Text & "','" & tabstract1.Text & "','" & _
                eabstract1.Text & "','" & Path.GetFileName(report1.PostedFile.FileName.Trim()) & "','" & getmypathreport & Path.GetFileName(report1.PostedFile.FileName.Trim()) & "','" & _
                Path.GetFileName(code1.PostedFile.FileName.Trim()) & "','" & getmypathcode & Path.GetFileName(code1.PostedFile.FileName.Trim()) & "')"
        End If

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

        If advisor11.Text <> "" Then
            QueryStr = "insert into AdvisorThesis(tsis_id,adv_name) values('" & _
                currentID & "','" & advisor11.Text & "')"
            sqlComm = New SqlCommand(QueryStr, sqlConn)
            sqlComm.CommandType = CommandType.Text
            sqlComm.ExecuteNonQuery()
        End If
        If advisor12.Text <> "" Then
            QueryStr = "insert into AdvisorThesis(tsis_id,adv_name) values('" & _
                currentID & "','" & advisor12.Text & "')"
            sqlComm = New SqlCommand(QueryStr, sqlConn)
            sqlComm.CommandType = CommandType.Text
            sqlComm.ExecuteNonQuery()
        End If
        If student11.Text <> "" Then
            If id11.Text <> "" Then
                QueryStr = "insert into DeveloperThesis(tsis_id,dev_name,dev_code) values('" & _
                    currentID & "','" & student11.Text & "','" & id11.Text & "')"
                sqlComm = New SqlCommand(QueryStr, sqlConn)
                sqlComm.CommandType = CommandType.Text
                sqlComm.ExecuteNonQuery()
            End If
        End If
        If student12.Text <> "" Then
            If id12.Text <> "" Then
                QueryStr = "insert into DeveloperThesis(tsis_id,dev_name,dev_code) values('" & _
                    currentID & "','" & student12.Text & "','" & id12.Text & "')"
                sqlComm = New SqlCommand(QueryStr, sqlConn)
                sqlComm.CommandType = CommandType.Text
                sqlComm.ExecuteNonQuery()
            End If
        End If
        If student13.Text <> "" Then
            If id13.Text <> "" Then
                QueryStr = "insert into DeveloperThesis(tsis_id,dev_name,dev_code) values('" & _
                    currentID & "','" & student13.Text & "','" & id13.Text & "')"
                sqlComm = New SqlCommand(QueryStr, sqlConn)
                sqlComm.CommandType = CommandType.Text
                sqlComm.ExecuteNonQuery()
            End If
        End If
        CloseConn()
        Response.Redirect("../Result.aspx?msg=การกำหนดวิทยานิพนธ์เสร็จเรียบร้อยแล้ว&user=Administrator")
    End Sub

    Protected Sub degreeDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles degreeDDL.SelectedIndexChanged
        warning.Text = ""
        tableshow.Visible = False
        If degreeDDL.SelectedIndex = 0 Then
            warning.Text = "กรุณาเลือกประเภทของระดับปริญญา"
            Exit Sub
        End If
        QueryStr = "select tsis_year from Thesis where tsis_degree = '" & degreeDDL.SelectedItem.Value & "' order by tsis_id"
        TableStr = "getyearthesis"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                yearDDL.DataTextField = "tsis_year"
                yearDDL.DataValueField = "tsis_year"
                yearDDL.DataSource = sqlDS.Tables(TableStr)
                yearDDL.DataBind()
                QueryStr = "select tsis_ename,tsis_id from Thesis where tsis_degree = '" & _
                    degreeDDL.SelectedItem.Value & "' and tsis_year = '" & yearDDL.SelectedItem.Value & "'" & _
                    " order by tsis_id"
                TableStr = "getyearthesis"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                        eprojectDDL.DataTextField = "tsis_ename"
                        eprojectDDL.DataValueField = "tsis_id"
                        eprojectDDL.DataSource = sqlDS.Tables(TableStr)
                        eprojectDDL.DataBind()
                    ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                        warning.Text = "ไม่พบข้อมูล"
                        Exit Sub
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "ไม่พบข้อมูล"
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub yearDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles yearDDL.SelectedIndexChanged
        warning.Text = ""
        tableshow.Visible = False
        If degreeDDL.SelectedIndex = 0 Then
            warning.Text = "กรุณาเลือกประเภทของระดับปริญญา"
            Exit Sub
        End If
        If yearDDL.Items.Count = 0 Then
            warning.Text = "ไม่มีข้อมูลของปีการศึกษา"
            Exit Sub
        End If
        QueryStr = "select tsis_ename,tsis_id from Thesis where tsis_degree = '" & _
            degreeDDL.SelectedItem.Value & "' and tsis_year = '" & yearDDL.SelectedItem.Value & "'" & _
            " order by tsis_id"
        TableStr = "getyearthesis"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                eprojectDDL.DataTextField = "tsis_ename"
                eprojectDDL.DataValueField = "tsis_id"
                eprojectDDL.DataSource = sqlDS.Tables(TableStr)
                eprojectDDL.DataBind()
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "ไม่พบข้อมูล"
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub eprojectDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles eprojectDDL.SelectedIndexChanged
        warning.Text = ""
        tableshow.Visible = False
        If degreeDDL.SelectedIndex = 0 Then
            warning.Text = "กรุณาเลือกประเภทของระดับปริญญา"
            Exit Sub
        End If
        If yearDDL.Items.Count = 0 Then
            warning.Text = "ไม่มีข้อมูลของปีการศึกษา"
            Exit Sub
        End If
    End Sub

    Protected Sub ok_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ok.Click
        tname2.Text = ""
        ename2.Text = ""
        tabstract2.Text = ""
        eabstract2.Text = ""
        advisor21.Text = ""
        advisor22.Text = ""
        student21.Text = ""
        id21.Text = ""
        student22.Text = ""
        id22.Text = ""
        student23.Text = ""
        id23.Text = ""
        warning.Text = ""
        If degreeDDL.SelectedIndex = 0 Then
            warning.Text = "กรุณาเลือกประเภทของระดับปริญญา"
            Exit Sub
        End If
        If yearDDL.Items.Count = 0 Then
            warning.Text = "ไม่มีข้อมูลของปีการศึกษา"
            Exit Sub
        End If
        If eprojectDDL.Items.Count = 0 Then
            warning.Text = "ไม่มีข้อมูลของชื่อโครงงาน"
            Exit Sub
        End If
        QueryStr = "select * from Thesis where tsis_id = '" & eprojectDDL.SelectedItem.Value & "'"
        TableStr = "getdetailthesis"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    tname2.Text = row("tsis_tname")
                    ename2.Text = row("tsis_ename")
                    tabstract2.Text = row("tsis_tabstract")
                    eabstract2.Text = row("tsis_eabstract")
                    report2.Text = row("tsis_repfile")
                    code2.Text = row("tsis_codefile")

                    QueryStr = "select * from AdvisorThesis where tsis_id = '" & eprojectDDL.SelectedItem.Value & "'"
                    TableStr = "getdetailadvisor"
                    Dim i As Integer = 1
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                            For Each row1 As DataRow In sqlDS.Tables(TableStr).Rows
                                If i = 1 Then
                                    advisor21.Text = row1("adv_name")
                                ElseIf i = 2 Then
                                    advisor22.Text = row1("adv_name")
                                End If
                                i = i + 1
                            Next
                        ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                            warning.Text = "ไม่พบข้อมูล"
                            Exit Sub
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    i = 1
                    QueryStr = "select * from DeveloperThesis where tsis_id = '" & eprojectDDL.SelectedItem.Value & "'"
                    TableStr = "getdetaildeveloper"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                            For Each row2 As DataRow In sqlDS.Tables(TableStr).Rows
                                If i = 1 Then
                                    student21.Text = row2("dev_name")
                                    id21.Text = row2("dev_code")
                                ElseIf i = 2 Then
                                    student22.Text = row2("dev_name")
                                    id22.Text = row2("dev_code")
                                ElseIf i = 3 Then
                                    student23.Text = row2("dev_name")
                                    id23.Text = row2("dev_code")
                                End If
                                i = i + 1
                            Next
                        ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                            warning.Text = "ไม่พบข้อมูล"
                            Exit Sub
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Next
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
        tableshow.Visible = True
    End Sub

    Protected Sub clear2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear2.Click
        tname2.Text = ""
        ename2.Text = ""
        tabstract2.Text = ""
        eabstract2.Text = ""
        advisor21.Text = ""
        advisor22.Text = ""
        student21.Text = ""
        id21.Text = ""
        student22.Text = ""
        id22.Text = ""
        student23.Text = ""
        id23.Text = ""
        warning.Text = ""
    End Sub

    Protected Sub update_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles update.Click
        If degreeDDL.SelectedIndex = 0 Then
            warning.Text = "กรุณาเลือกประเภทของระดับปริญญา"
            Exit Sub
        End If
        If yearDDL.Items.Count = 0 Then
            warning.Text = "ไม่มีข้อมูลของปีการศึกษา"
            Exit Sub
        End If
        If eprojectDDL.Items.Count = 0 Then
            warning.Text = "ไม่มีข้อมูลของชื่อโครงงาน"
            Exit Sub
        End If
        warning.Text = ""
        Dim getadvisorid1 As String = ""
        Dim getadvisorid2 As String = ""
        Dim getdevid1 As String = ""
        Dim getdevid2 As String = ""
        Dim getdevid3 As String = ""
        QueryStr = "select adv_id from AdvisorThesis where tsis_id = '" & eprojectDDL.SelectedItem.Value & "'"
        TableStr = "getadvisorid"
        Dim i As Integer = 1
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count >= 0 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    If i = 1 Then
                        getadvisorid1 = row("adv_id")
                    ElseIf i = 2 Then
                        getadvisorid2 = row("adv_id")
                    End If
                    i = i + 1
                Next
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
        QueryStr = "select dev_id from DeveloperThesis where tsis_id = '" & eprojectDDL.SelectedItem.Value & "'"
        TableStr = "getdevid"
        i = 1
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count >= 0 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    If i = 1 Then
                        getdevid1 = row("dev_id")
                    ElseIf i = 2 Then
                        getdevid2 = row("dev_id")
                    ElseIf i = 3 Then
                        getdevid3 = row("dev_id")
                    End If
                    i = i + 1
                Next
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
        QueryStr = "update Thesis set tsis_tname = '" & tname2.Text & "',tsis_ename = '" & ename2.Text & _
            "',tsis_tabstract = '" & tabstract2.Text & "',tsis_eabstract = '" & eabstract2.Text & _
            "' where tsis_id = '" & eprojectDDL.SelectedItem.Value & "'"
        CloseConn()
        If ExecuteComm(QueryStr) = True Then
            If getadvisorid1 <> "" Then
                QueryStr = "update AdvisorThesis set adv_name = '" & advisor21.Text & "' where adv_id = '" & getadvisorid1 & "'"
                If ExecuteComm(QueryStr) = False Then
                    Response.Redirect("../DBFailed.aspx")
                End If
            End If
            If getadvisorid2 <> "" Then
                QueryStr = "update AdvisorThesis set adv_name = '" & advisor22.Text & "' where adv_id = '" & getadvisorid2 & "'"
                If ExecuteComm(QueryStr) = False Then
                    Response.Redirect("../DBFailed.aspx")
                End If
            End If
            If getdevid1 <> "" Then
                QueryStr = "update DeveloperThesis set dev_name = '" & student21.Text & _
                    "',dev_code = '" & id21.Text & "' where dev_id = '" & getdevid1 & "'"
                If ExecuteComm(QueryStr) = False Then
                    Response.Redirect("../DBFailed.aspx")
                End If
            End If
            If getdevid2 <> "" Then
                QueryStr = "update DeveloperThesis set dev_name = '" & student22.Text & _
                    "',dev_code = '" & id22.Text & "' where dev_id = '" & getdevid2 & "'"
                If ExecuteComm(QueryStr) = False Then
                    Response.Redirect("../DBFailed.aspx")
                End If
            End If
            If getdevid3 <> "" Then
                QueryStr = "update DeveloperThesis set dev_name = '" & student23.Text & _
                    "',dev_code = '" & id23.Text & "' where dev_id = '" & getdevid3 & "'"
                If ExecuteComm(QueryStr) = False Then
                    Response.Redirect("../DBFailed.aspx")
                End If
            End If
            Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงวิทยานิพนธ์เสร็จเรียบร้อยแล้ว&user=Administrator")
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles delete.Click
        If degreeDDL.SelectedIndex = 0 Then
            warning.Text = "กรุณาเลือกประเภทของระดับปริญญา"
            Exit Sub
        End If
        If yearDDL.Items.Count = 0 Then
            warning.Text = "ไม่มีข้อมูลของปีการศึกษา"
            Exit Sub
        End If
        If eprojectDDL.Items.Count = 0 Then
            warning.Text = "ไม่มีข้อมูลของชื่อโครงงาน"
            Exit Sub
        End If
        warning.Text = ""
        Dim currentID As String = ""
        Dim statusreport As Boolean = False
        Dim statuscode As Boolean = False
        Dim mypathreport As String = ""
        Dim mypathcode As String = ""
        Dim objreport As New FileInfo(Server.MapPath("~") & "\Thesis\Bachelor\Document\testing.txt")
        Dim objcode As New FileInfo(Server.MapPath("~") & "\Thesis\Bachelor\Code\testing.txt")
        If degreeDDL.SelectedIndex = 0 Then
            warning.Text = "กรุณาเลือกระดับปริญญา"
            Exit Sub
        ElseIf degreeDDL.SelectedIndex = 1 Then
            mypathreport = "\Thesis\Bachelor\Document\"
            mypathcode = "\Thesis\Bachelor\Code\"
            objreport = New FileInfo(Server.MapPath("~") & mypathreport & report2.Text)
            objcode = New FileInfo(Server.MapPath("~") & mypathcode & code2.Text)
        ElseIf degreeDDL.SelectedIndex = 2 Then
            mypathreport = "\Thesis\Master\Document\"
            mypathcode = "\Thesis\Master\Code\"
            objreport = New FileInfo(Server.MapPath("~") & mypathreport & report2.Text)
            objcode = New FileInfo(Server.MapPath("~") & mypathcode & code2.Text)
        ElseIf degreeDDL.SelectedIndex = 3 Then
            mypathreport = "\Thesis\Doctor\Document\"
            mypathcode = "\Thesis\Doctor\Code\"
            objreport = New FileInfo(Server.MapPath("~") & mypathreport & report2.Text)
            objcode = New FileInfo(Server.MapPath("~") & mypathcode & code2.Text)
        End If
        QueryStr = "delete from AdvisorThesis where tsis_id = '" & eprojectDDL.SelectedItem.Value & "'"
        If ExecuteComm(QueryStr) = False Then
            Response.Redirect("../DBFailed.aspx")
        End If
        QueryStr = "delete from DeveloperThesis where tsis_id = '" & eprojectDDL.SelectedItem.Value & "'"
        If ExecuteComm(QueryStr) = False Then
            Response.Redirect("../DBFailed.aspx")
        End If
        QueryStr = "delete from Thesis where tsis_id = '" & eprojectDDL.SelectedItem.Value & "'"
        If ExecuteComm(QueryStr) = False Then
            Response.Redirect("../DBFailed.aspx")
        Else
            objreport.Delete()
            objcode.Delete()
            Response.Redirect("../Result.aspx?msg=ได้ลบวิทยานิพนธ์เรื่อง " & eprojectDDL.SelectedItem.Text & " เสร็จเรียบร้อยแล้ว&user=Administrator")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Administrator" Then
                delete.Attributes.Add("onclick", "return confirm('Are you sure you want to delete this thesis ?');")
            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้ดูแลระบบ คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If
    End Sub
End Class
