Imports System.Data
Imports System.Data.SqlClient

Partial Class Administrator_AdministratorViewReplyBoard
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
        'Dim tmp As String = ""
        'If Request.QueryString("top_type") = "general" Then
        '    tmp = "กระดานสนทนาทั่วไป"
        'ElseIf Request.QueryString("top_type") = "member" Then
        '    tmp = "กระดานสนทนาของสมาชิก"
        'End If
        'QueryStr = "delete from replywb where rep_id = '" & GridView1.DataKeys(Convert.ToInt32(e.RowIndex)).Value.ToString() & "'"
        'If ExecuteComm(QueryStr) = True Then
        '    Response.Redirect("../Result.aspx?msg=ได้ลบคำตอบที่ " & GridView1.DataKeys(Convert.ToInt32(e.RowIndex)).Value.ToString() & " ของกระทู้ที่ " & Request.QueryString("top_id") & " ของ" & tmp & "เสร็จเรียบร้อยแล้ว&user=Administrator")
        'Else
        '    Response.Redirect("../DBFailed.aspx")
        'End If
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim db As ImageButton = CType(e.Row.FindControl("ImgButt"), ImageButton)
            'db.CommandName = "Delete"
            db.Attributes.Add("onclick", "javascript:return " & "confirm('Are you sure you want to delete this Reply ID : " & DataBinder.Eval(e.Row.DataItem, "rep_id") & "')")

            'Dim getID As string = CType(GridView1.DataKeys(Convert.ToInt32(e.Row)).Value.ToString(), String)
            'db.OnClientClick = String.Format("return confirm('Are you certain you want to delete the Reply ID : {0}?');", getID.Replace("'", "\'"))
            'db.OnClientClick = String.Format("return confirm('Are you certain you want to delete the Reply ID ?');")
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
        Dim tmp As String = ""
        Dim nreplier As Integer = 0
        Dim topid As String = ""
        If Request.QueryString("top_type") = "general" Then
            tmp = "กระดานสนทนาทั่วไป"
        ElseIf Request.QueryString("top_type") = "member" Then
            tmp = "กระดานสนทนาของสมาชิก"
        End If
        QueryStr = "select top_nreplier,top_id from TopicWB where top_id = (select top_id from ReplyWB where rep_id = '" & RepID & "')"
        TableStr = "getnumberreplier"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                For Each row As datarow In sqlDS.Tables(TableStr).Rows
                    nreplier = Val(row("top_nreplier"))
                    topid = row("top_id")
                Next
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If

        nreplier = nreplier - 1

        CloseConn()

        QueryStr = "delete from replywb where rep_id = '" & RepID & "'"
        If ExecuteComm(QueryStr) = True Then
            QueryStr = "update TopicWb set top_nreplier = '" & nreplier & "' where top_id = '" & topid & "'"
            If ExecuteComm(QueryStr) = False Then
                Response.Redirect("../DBFailed.aspx")
            Else
                Response.Redirect("../Result.aspx?msg=ได้ลบคำตอบที่ " & RepID & " ของกระทู้ที่ " & Request.QueryString("top_id") & " ของ" & tmp & "เสร็จเรียบร้อยแล้ว&action=close")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub
End Class
