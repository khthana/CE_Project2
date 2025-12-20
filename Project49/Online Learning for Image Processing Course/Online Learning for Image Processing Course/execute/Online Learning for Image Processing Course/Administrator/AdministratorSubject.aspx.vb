Imports System.Data
Imports System.Data.SqlClient

Partial Class Administrator_AdministratorSubject
    Inherits System.Web.UI.Page

    Protected Sub createsubject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles createsubject.Click
        tablecreate.Visible = True
        tableupdate.Visible = False
        warning.Text = ""
    End Sub

    Protected Sub updatesubject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updatesubject.Click
        QueryStr = "select sub_id,sub_name from Subject"
        TableStr = "getsubjectid"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                name2.DataTextField = "sub_name"
                name2.DataValueField = "sub_id"
                name2.DataSource = sqlDS.Tables(TableStr)
                name2.DataBind()
                Dim mydate(2) As String
                QueryStr = "select s.sub_description,s.sub_book,s.sub_dexam,s.sub_texam,s.sub_quantity,s.sub_sim,s.sub_url,s.sub_status,t.tch_name from Subject s,Teacher t where s.sub_id = '" & name2.SelectedItem.Value & "' and s.tch_id = t.tch_id"
                TableStr = "getdetailsubject"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            detail2.Text = row("sub_description")
                            reference2.Text = row("sub_book")
                            mydate = CStr(row("sub_dexam")).Split("/")
                            '----------
                            mydate(2) = mydate(2) - 543
                            txt2.Value = mydate(0) & "/" & mydate(1) & "/" & mydate(2)
                            '----------
                            'dayexam2.SelectedIndex = mydate(0)
                            'monthexam2.SelectedIndex = mydate(1)
                            'yearexam2.Text = mydate(2)
                            If row("sub_texam") = "9.00-12.00" Then
                                timeexam2.SelectedIndex = 1
                            ElseIf row("sub_texam") = "13.00-16.00" Then
                                timeexam2.SelectedIndex = 2
                            End If
                            quantity2.Text = row("sub_quantity")
                            If row("sub_sim") Is DBNull.Value Then
                                sim2.Text = ""
                            Else
                                sim2.Text = row("sub_sim")
                            End If
                            url2.Text = row("sub_url")
                            If row("sub_status") = "1" Then
                                status2.Checked = True
                            ElseIf row("sub_status") = "0" Then
                                status2.Checked = False
                            End If
                            teacher2.Text = row("tch_name")
                        Next
                    ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                        warning.Text = "ไม่พบข้อมูล"
                        tableupdate.Visible = False
                        tablecreate.Visible = False
                        Exit Sub
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "ไม่พบข้อมูล"
                tableupdate.Visible = False
                tablecreate.Visible = False
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
        
        tablecreate.Visible = False
        tableupdate.Visible = True
        warning.Text = ""
    End Sub

    Protected Sub clear1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear1.Click
        name1.Text = ""
        detail1.Text = ""
        reference1.Text = ""
        teacherDDL1.SelectedIndex = 0
        'dayexam1.SelectedIndex = 0
        'monthexam1.SelectedIndex = 0
        'yearexam1.Text = ""
        '-------
        txt1.Value = ""
        '-------
        timeexam1.SelectedIndex = 0
        quantity1.Text = ""
        sim1.Text = ""
        url1.Text = ""
        status1.Checked = False
        warning.Text = ""
    End Sub

    Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        If teacherDDL1.Items.Count = 0 Then
            warning.Text = "ไม่พบข้อมูลของอาจารย์ผู้สอน"
            Exit Sub
        End If

        '----------------
        Dim arraymydateexam(2) As String
        arraymydateexam = txt1.Value.Split("/")
        arraymydateexam(2) = Val(arraymydateexam(2)) + 543
        Dim userdateexam As String = arraymydateexam(0) & "/" & arraymydateexam(1) & "/" & arraymydateexam(2)
        '----------------

        Dim mydate As String = userdateexam 'dayexam1.SelectedItem.Value & "/" & monthexam1.SelectedItem.Value & "/" & yearexam1.Text
        Dim status As String = ""
        If status1.Checked Then
            status = "1"
        Else
            status = "0"
        End If
        QueryStr = "insert into Subject(tch_id,sub_name,sub_description,sub_book,sub_dexam,sub_texam,sub_quantity,sub_sim,sub_url,sub_status) values('" & _
            teacherDDL1.SelectedItem.Value & "','" & name1.Text & "','" & detail1.Text & "','" & reference1.Text & "','" & _
            mydate & "','" & timeexam1.SelectedItem.Value & "','" & quantity1.Text & "','" & sim1.Text & "','" & url1.Text & "','" & status & "')"
        If ExecuteComm(QueryStr) = True Then
            Response.Redirect("../Result.aspx?msg=การกำหนดรายวิชา " & name1.Text & " เสร็จเรียบร้อยแล้ว&user=Administrator")
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub clear2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear2.Click
        detail2.Text = ""
        reference2.Text = ""
        teacher2.Text = ""
        'dayexam2.SelectedIndex = 0
        'monthexam2.SelectedIndex = 0
        'yearexam2.Text = ""
        '-------
        txt2.Value = ""
        '-------
        timeexam2.SelectedIndex = 0
        quantity2.Text = ""
        sim2.Text = ""
        url2.Text = ""
        status2.Checked = False
        warning.Text = ""
    End Sub

    Protected Sub name2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles name2.SelectedIndexChanged
        Dim mydate(2) As String
        QueryStr = "select s.sub_description,s.sub_book,s.sub_dexam,s.sub_texam,s.sub_quantity,s.sub_sim,s.sub_url,s.sub_status,t.tch_name from Subject s,Teacher t where s.sub_id = '" & name2.SelectedItem.Value & "' and s.tch_id = t.tch_id"
        TableStr = "getdetailsubject"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    detail2.Text = row("sub_description")
                    reference2.Text = row("sub_book")
                    mydate = CStr(row("sub_dexam")).Split("/")
                    '----------
                    mydate(2) = mydate(2) - 543
                    txt2.Value = mydate(0) & "/" & mydate(1) & "/" & mydate(2)
                    '----------
                    'dayexam2.SelectedIndex = mydate(0)
                    'monthexam2.SelectedIndex = mydate(1)
                    'yearexam2.Text = mydate(2)
                    If row("sub_texam") = "9.00-12.00" Then
                        timeexam2.SelectedIndex = 1
                    ElseIf row("sub_texam") = "13.00-16.00" Then
                        timeexam2.SelectedIndex = 2
                    End If
                    quantity2.Text = row("sub_quantity")
                    If row("sub_sim") Is DBNull.Value Then
                        sim2.Text = ""
                    Else
                        sim2.Text = row("sub_sim")
                    End If
                    url2.Text = row("sub_url")
                    If row("sub_status") = "1" Then
                        status2.Checked = True
                    ElseIf row("sub_status") = "0" Then
                        status2.Checked = False
                    End If
                    teacher2.Text = row("tch_name")
                Next
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "ไม่พบข้อมูล"
                tableupdate.Visible = False
                tablecreate.Visible = False
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub update_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles update.Click
        If name2.Items.Count = 0 Then
            warning.Text = "ไม่พบข้อมูลของรายวิชาต่างๆ"
            Exit Sub
        End If
        Dim teacherid As String = ""
        QueryStr = "select tch_id from Teacher where tch_name = '" & teacher2.Text & "'"
        TableStr = "getteacherid"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    teacherid = row("tch_id")
                Next
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "ชื่อผู้สอนไม่ตรงกับฐานข้อมูล"
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If

        Dim status As String = ""

        If status2.Checked Then
            status = "1"
        Else
            status = "0"
        End If

        '----------------
        Dim arraymydateexam(2) As String
        arraymydateexam = txt2.Value.Split("/")
        arraymydateexam(2) = Val(arraymydateexam(2)) + 543
        Dim userdateexam As String = arraymydateexam(0) & "/" & arraymydateexam(1) & "/" & arraymydateexam(2)
        '----------------

        Dim mydate As String = userdateexam 'dayexam2.SelectedItem.Value & "/" & monthexam2.SelectedItem.Value & "/" & yearexam2.Text

        QueryStr = "select * from Examination where sub_id = '" & name2.SelectedItem.Value & "'" & _
            " and exm_year = (select max(cal_year) from LearningCalendar)" & _
            " and exm_term = (select max(cal_term) from LearningCalendar" & _
            " where cal_year = (select max(cal_year) from LearningCalendar))"
        TableStr = "getexamination"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                QueryStr = "update Examination set exm_datestart = '" & mydate & "',exm_dateend = '" & mydate & "'" & _
                    " where sub_id = '" & name2.SelectedItem.Value & "'" & _
                    " and exm_year = (select max(cal_year) from LearningCalendar)" & _
                    " and exm_term = (select max(cal_term) from LearningCalendar" & _
                    " where cal_year = (select max(cal_year) from LearningCalendar))"
                CloseConn()
                If ExecuteComm(QueryStr) = False Then
                    Response.Redirect("../DBFailed.aspx")
                End If
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then

            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFaile.aspx")
        End If

        QueryStr = "update Subject set tch_id = '" & teacherid & "',sub_description = '" & detail2.Text & _
            "',sub_book = '" & reference2.Text & "',sub_dexam = '" & mydate & "',sub_texam = '" & timeexam2.SelectedItem.Text & _
            "',sub_quantity = '" & quantity2.Text & "',sub_sim = '" & sim2.Text & "',sub_url = '" & url2.Text & _
            "',sub_status = '" & status & "' where sub_id = '" & name2.SelectedItem.Value & "'"
        CloseConn()
        If ExecuteComm(QueryStr) = True Then
            Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงข้อมูลของวิชา " & name2.SelectedItem.Text & " เสร็จเรียบร้อยแล้ว&user=Administrator")
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Administrator" Then
            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้ดูแลระบบ คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If
    End Sub
End Class
