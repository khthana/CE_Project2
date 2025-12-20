Imports System.Data
Imports System.Data.SqlClient

Partial Class Student_StudentMessageBoard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Student" Then
            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้เรียน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        If subjectDDL.Items.Count = 0 Then
            newtopictable.Visible = False
            Warning.Text = "คุณยังไม่ได้ลงทะเบียน เพราะ Message Board นี้จะแบ่งตามรายวิชาที่ลงทะเบียน"
            Exit Sub
        End If
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

        QueryStr = "insert into TopicMB(sub_id,top_name,top_writer,top_date,top_email,top_content,top_ip,top_nreplier,top_nreader) values('" & _
                    subjectDDL.SelectedItem.Value & "','" & topic.Text & "','" & name.Text & "','" & postDate & "','" & email.Text & "','" & _
                    content.Text & "','" & Request.ServerVariables("REMOTE_ADDR") & "','0','0')"
        TableStr = "settopic"
        If CloseConn() = True Then
            If ExecuteComm(QueryStr) = True Then
                newtopictable.Visible = False
                Response.Redirect("StudentMessageBoard.aspx")
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub
End Class
