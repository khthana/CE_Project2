
Partial Class Teacher_TeacherCheckAssignment
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Teacher" Then
                If Not Page.IsPostBack Then
                    QueryStr = "SELECT sub_id, sub_name FROM Subject" & _
                        " WHERE tch_id = '" & Session("user") & "' AND sub_status = '1' ORDER BY sub_id"
                    TableStr = "getsubject"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                            subjectDDL.DataTextField = "sub_name"
                            subjectDDL.DataValueField = "sub_id"
                            subjectDDL.DataSource = sqlDS.Tables(TableStr)
                            subjectDDL.DataBind()
                        ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                            warning.Text = "คุณยังไม่มีวิชาที่ต้องสอน"
                            Exit Sub
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    QueryStr = "select ass_id, ass_number from Assignment where sub_id = '" & subjectDDL.SelectedItem.Value & "'" & _
                        " and ass_year = (select max(cal_year) from learningcalendar)" & _
                        " and ass_term = (select max(cal_term) from learningcalendar" & _
                        " where cal_year = (select max(cal_year) from learningcalendar))" & _
                        " order by ass_number"
                    TableStr = "getdata"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                            AssignmentDDL.DataTextField = "ass_number"
                            AssignmentDDL.DataValueField = "ass_id"
                            AssignmentDDL.DataSource = sqlDS.Tables(TableStr)
                            AssignmentDDL.DataBind()
                        ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                            warning.Text = "วิชานี้ยังไม่ได้กำหนดเกณฑ์การทดสอบหรืองาน Assignment"
                            Exit Sub
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    warning.Text = ""
                End If
            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้สอน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If
    End Sub

    Protected Sub AssignmentDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles AssignmentDDL.SelectedIndexChanged
        QueryStr = "select * from AssignmentTopic where ass_id = '" & AssignmentDDL.SelectedItem.Value & "'"
        TableStr = "getdata"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "Assignment ครั้งที่ " & AssignmentDDL.SelectedItem.Text & " ไม่ได้มีการกำหนดให้เป็นการส่งงาน Assignment"
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub subjectDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles subjectDDL.SelectedIndexChanged
        If subjectDDL.Items.Count = 0 Then
            warning.Text = "คุณยังไม่มีวิชาที่ต้องสอน"
            Exit Sub
        End If
        QueryStr = "select ass_id, ass_number from Assignment where sub_id = '" & subjectDDL.SelectedItem.Value & "'" & _
            " and ass_year = (select max(cal_year) from learningcalendar)" & _
            " and ass_term = (select max(cal_term) from learningcalendar" & _
            " where cal_year = (select max(cal_year) from learningcalendar))" & _
            " order by ass_number"
        TableStr = "getdata"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                AssignmentDDL.DataTextField = "ass_number"
                AssignmentDDL.DataValueField = "ass_id"
                AssignmentDDL.DataSource = sqlDS.Tables(TableStr)
                AssignmentDDL.DataBind()
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "วิชานี้ยังไม่ได้กำหนดเกณฑ์การทดสอบหรืองาน Assignment"
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub
End Class
