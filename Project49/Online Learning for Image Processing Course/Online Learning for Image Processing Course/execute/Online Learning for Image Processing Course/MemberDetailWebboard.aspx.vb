Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberDetailWebboard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Session("member") <> "member" Then
                DataList1.Visible = False
                DataList2.Visible = False
                Warningtxt.Text = "คุณยังไม่ได้ Login เพื่อตรวจสอบการเป็นสมาชิก"
                Exit Sub
            End If
            Dim number As String = ""
            QueryStr = "select top_nreader from TopicWB where top_id = " & Request.QueryString("top_id")
            TableStr = "getreader"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        number = row("top_nreader")
                    Next
                End If
            Else
                Response.Redirect("DBFailed.aspx")
            End If
            number = number + 1
            QueryStr = "update TopicWB set top_nreader = " & number & " where top_id = " & Request.QueryString("top_id")
            TableStr = "number_reader"
            If CloseConn() = True Then
                If ExecuteComm(QueryStr) = False Then
                    Response.Redirect("DBFailed.aspx")
                End If
            Else
                Response.Redirect("DBFailed.aspx")
            End If
        End If
    End Sub

    Protected Sub DeleteTopic_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Warningtxt.Text = ""
        If Session("admin") = True Then
            QueryStr = "delete from ReplyWB where top_id = '" & Request.QueryString("top_id") & "'"
            If ExecuteComm(QueryStr) = True Then
                QueryStr = "delete from TopicWB where top_id = '" & Request.QueryString("top_id") & "'"
                If ExecuteComm(QueryStr) = False Then
                    Warningtxt.Text = "ไม่สามารถลบหัวข้อกระทู้นี้ได้"
                    Exit Sub
                End If
            Else
                Warningtxt.Text = "ไม่สามารถลบคำตอบของกระทู้นี้ได้"
                Exit Sub
            End If
        End If
    End Sub

    Protected Sub clear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear.Click
        Warning.Text = ""
        Warningtxt.Text = ""
        replywriter.Text = ""
        replyemail.Text = ""
        replycontent.Text = ""
    End Sub

    Protected Sub send_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles send.Click
        'Dim postDate As Date = Today
        Dim postDate As Date = System.DateTime.Now.ToLongDateString
        Dim ntmp As String = ""

        QueryStr = "insert into ReplyWB(top_id,rep_writer,rep_date,rep_email,rep_content,rep_ip) values('" & _
        Request.QueryString("top_id") & "','" & replywriter.Text & "','" & postDate & "','" & replyemail.Text & "','" & _
        replycontent.Text & "','" & Request.ServerVariables("REMOTE_ADDR") & "')"
        TableStr = "sendreply"
        If CloseConn() = True Then
            If ExecuteComm(QueryStr) = True Then
                QueryStr = "select top_nreplier from TopicWB where top_id = " & Request.QueryString("top_id")
                TableStr = "getreplier"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            ntmp = row("top_nreplier")
                        Next
                    End If
                Else
                    Response.Redirect("DBFailed.aspx")
                End If
                ntmp = ntmp + 1
                QueryStr = "update TopicWB set top_nreplier = " & ntmp & " where top_id = " & Request.QueryString("top_id")
                TableStr = "number_replier"
                If CloseConn() = True Then
                    If ExecuteComm(QueryStr) = True Then
                        Response.Redirect("MemberDetailWebboard.aspx?top_id=" & Request.QueryString("top_id"))
                    Else
                        Response.Redirect("DBFailed.aspx")
                    End If
                Else
                    Response.Redirect("DBFailed.aspx")
                End If
            Else
                Response.Redirect("DBFailed.aspx")
            End If
        Else
            Response.Redirect("DBFailed.aspx")
        End If
    End Sub
End Class
