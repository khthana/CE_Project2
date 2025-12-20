Imports System.Data
Imports System.Data.SqlClient

Partial Class Administrator_AdministratorViewReplyMB
    Inherits System.Web.UI.Page

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

    Protected Sub GridView1_DeleteRow(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs)
        Dim RepID As Integer = CType(GridView1.DataKeys(e.RowIndex).Value, Integer)
        DeleteRecordByID(RepID)
        'QueryStr = "delete from ReplyMB where rep_id = '" & GridView1.DataKeys(Convert.ToInt32(e.RowIndex)).Value.ToString() & "'"
        'If ExecuteComm(QueryStr) = True Then
        '    Response.Redirect("../Result.aspx?msg=ได้ลบคำตอบที่ " & GridView1.DataKeys(Convert.ToInt32(e.RowIndex)).Value.ToString() & " ของกระทู้ที่ " & Request.QueryString("top_id") & " เสร็จเรียบร้อยแล้ว&user=Administrator")
        'Else
        '    Response.Redirect("../DBFailed.aspx")
        'End If
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim db As ImageButton = CType(e.Row.FindControl("ImgButt"), ImageButton)
            db.Attributes.Add("onclick", "javascript:return " & "confirm('Are you sure you want to delete this Reply ID : " & DataBinder.Eval(e.Row.DataItem, "rep_id") & "')")
        End If
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Delete" Then
            Dim RepID As Integer = Convert.ToInt32(e.CommandArgument)
            DeleteRecordByID(RepID)
        End If
    End Sub

    Protected Sub GridView1_RowDeleted(ByVal sender As Object, ByVal e As GridViewDeletedEventArgs)
    End Sub

    Private Sub DeleteRecordByID(ByVal RepID As Integer)
        Dim nreplier As Integer = 0
        Dim topid As String = ""
        Dim subname As String = ""
        
        QueryStr = "select t.top_nreplier,t.top_id,s.sub_name from TopicMB t,Subject s" & _
            " where t.sub_id = s.sub_id and top_id = (select top_id from ReplyMB where rep_id = '" & RepID & "')"
        TableStr = "getnumberreplier"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                For Each row As datarow In sqlDS.Tables(TableStr).Rows
                    nreplier = Val(row("top_nreplier"))
                    topid = row("top_id")
                    subname = row("sub_name")
                Next
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If

        nreplier = nreplier - 1

        CloseConn()

        QueryStr = "delete from ReplyMB where rep_id = '" & RepID & "'"
        If ExecuteComm(QueryStr) = True Then
            QueryStr = "update TopicMB set top_nreplier = '" & nreplier & "' where top_id = '" & topid & "'"
            If ExecuteComm(QueryStr) = False Then
                Response.Redirect("../DBFailed.aspx")
            Else
                Response.Redirect("../Result.aspx?msg=ได้ลบคำตอบที่ " & RepID & " ของกระทู้ที่ " & Request.QueryString("top_id") & " ของวิชา " & subname & "เสร็จเรียบร้อยแล้ว&action=close")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub
End Class
