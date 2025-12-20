
Partial Class MemberWebboard
    Inherits System.Web.UI.Page

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        newtopictable.Visible = True
        name.Text = ""
        email.Text = ""
        topic.Text = ""
        content.Text = ""
        Warning.Text = ""
    End Sub

    Protected Sub clear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear.Click
        newtopictable.Visible = False
        name.Text = ""
        email.Text = ""
        topic.Text = ""
        content.Text = ""
        Warning.Text = ""
    End Sub

    Protected Sub send_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles send.Click
        'Dim postDate As Date = Today
        Dim postDate As Date = System.DateTime.Now.ToLongDateString

        QueryStr = "insert into TopicWB(top_type,top_name,top_writer,top_date,top_email,top_content,top_ip,top_nreplier,top_nreader) values('member','" & _
        topic.Text & "','" & name.Text & "','" & postDate & "','" & email.Text & "','" & content.Text & "','" & _
        Request.ServerVariables("REMOTE_ADDR") & "','0','0')"
        TableStr = "setreply"
        If CloseConn() = True Then
            If ExecuteComm(QueryStr) = True Then
                newtopictable.Visible = False
                Response.Redirect("MemberWebboard.aspx")
            Else
                Response.Redirect("DBFailed.aspx")
            End If
        Else
            Response.Redirect("DBFailed.aspx")
        End If
    End Sub

    Protected Sub search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles search.Click
        Response.Redirect("SearchTopicWB.aspx?type=member&key=" & keyword.Text)
    End Sub

    Protected Sub back_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles back.Click
        Response.Redirect("Default.aspx")
    End Sub
End Class
