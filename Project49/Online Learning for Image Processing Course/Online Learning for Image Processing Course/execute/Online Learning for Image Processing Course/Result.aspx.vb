
Partial Class Result
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txt.Text = Request.QueryString("msg")
        If Request.QueryString("action") = "close" Then
            back.Text = "Close"
            back.Attributes.Add("onclick", "window.close();")
        ElseIf Request.QueryString("action") = "redirect" Then
            back.Text = "Back"
        End If
    End Sub

    Protected Sub back_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles back.Click
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Request.QueryString("user") = "Student" Then
                Response.Redirect("Student/Student.aspx")
            ElseIf Request.QueryString("user") = "Staff" Then
                Response.Redirect("Staff/Staff.aspx")
            ElseIf Request.QueryString("user") = "Teacher" Then
                If Request.QueryString("action") = "redirect" Then
                    Response.Redirect("Teacher/TeacherTesting.aspx")
                Else
                    Response.Redirect("Teacher/Teacher.aspx")
                End If
            ElseIf Request.QueryString("user") = "Administrator" Then
                Response.Redirect("Administrator/Administrator.aspx")
            ElseIf Request.QueryString("action") = "close" Then
                Response.Write("<script language='javascript'> { window.close();}</script>")
            Else
                Response.Redirect("Default.aspx")
            End If
        Else
            Response.Redirect("Default.aspx")
        End If
    End Sub
End Class
