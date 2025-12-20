
Partial Class SearchTopicWebboard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            QueryStr = "select top_id,top_name,top_writer,top_date,top_nreplier,top_nreader from TopicWB where top_type = '" & _
                Request.QueryString("type") & "' and top_name like '%" & Request.QueryString("key") & "%'"
            TableStr = "search"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    GridView1.DataSource = sqlDS.Tables(0)
                    GridView1.DataBind()
                    GridView1.Visible = True
                Else
                    Warning2.Text = "ไม่พบหัวข้อกระทู้ตามที่ค้นหา"
                    GridView1.Visible = False
                    Exit Sub
                End If
            Else
                Response.Redirect("DBFailed.aspx")
            End If
        End If
    End Sub

    Protected Sub back_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles back.Click
        If Request.QueryString("type") = "general" Then
            Response.Redirect("GeneralWebboard.aspx?wbtype=general")
        ElseIf Request.QueryString("type") = "member" Then
            Response.Redirect("MemberWebboard.aspx")
        Else
            Response.Redirect("Default.aspx")
        End If
    End Sub

    'Protected Sub search_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles search.Click
    '    Warning2.Text = ""
    '    QueryStr = "select top_id,top_name,top_writer,top_date,top_nreplier,top_nreader from TopicWB where top_type = '" & _
    '                    Request.QueryString("type") & "' and top_name like '%" & keyword.Text & "%'"
    '    TableStr = "search"
    '    If FillCommQ(QueryStr, TableStr) = True Then
    '        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
    '            GridView1.DataSource = sqlDS.Tables(0)
    '            GridView1.DataBind()
    '            GridView1.Visible = True
    '        Else
    '            Warning2.Text = "ไม่พบหัวข้อกระทู้ตามที่ค้นหา"
    '            GridView1.Visible = False
    '            Exit Sub
    '        End If
    '    Else
    '        Response.Redirect("DBFailed.aspx")
    '    End If
    'End Sub
End Class
