Imports System.Data
Imports System.Data.SqlClient

Partial Class Student_StudentMessageBoardDetail
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Student" Then
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
                    Response.Redirect("../DBFailed.aspx")
                End If
                '*************************
                If Not Page.IsPostBack Then
                    Dim number As String = ""
                    QueryStr = "select top_nreader from TopicMB where top_id = " & Request.QueryString("top_id")
                    TableStr = "getreader"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                number = row("top_nreader")
                            Next
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    number = Val(number) + 1
                    QueryStr = "update TopicMB set top_nreader = " & number & " where top_id = " & Request.QueryString("top_id")
                    TableStr = "number_reader"
                    If CloseConn() = True Then
                        If ExecuteComm(QueryStr) = False Then
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                End If
            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้เรียน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If
    End Sub

    Protected Sub clear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear.Click
        Warning.Text = ""
        replywriter.Text = ""
        replyemail.Text = ""
        replycontent.Text = ""
    End Sub

    Protected Sub send_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles send.Click
        'Dim postDate As Date = Today
        Dim postDate As Date = System.DateTime.Now.ToLongDateString
        Dim ntmp As String = ""

        QueryStr = "insert into ReplyMB(top_id,rep_writer,rep_date,rep_email,rep_content,rep_ip) values('" & _
        Request.QueryString("top_id") & "','" & replywriter.Text & "','" & postDate & "','" & replyemail.Text & "','" & _
        replycontent.Text & "','" & Request.ServerVariables("REMOTE_ADDR") & "')"
        TableStr = "sendreply"
        If CloseConn() = True Then
            If ExecuteComm(QueryStr) = True Then
                QueryStr = "select top_nreplier from TopicMB where top_id = " & Request.QueryString("top_id")
                TableStr = "getreplier"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            ntmp = row("top_nreplier")
                        Next
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
                ntmp = Val(ntmp) + 1
                QueryStr = "update TopicMB set top_nreplier = " & ntmp & " where top_id = " & Request.QueryString("top_id")
                TableStr = "number_replier"
                If CloseConn() = True Then
                    If ExecuteComm(QueryStr) = True Then
                        Response.Redirect("StudentMessageBoardDetail.aspx?top_id=" & Request.QueryString("top_id") & "&sub_id=" & Request.QueryString("sub_id"))
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
    End Sub
End Class
