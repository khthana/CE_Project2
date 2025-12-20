Imports System.Data
Imports System.Data.SqlClient

Partial Class Administrator_AdministratorMSB
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
        Dim TopID As Integer = CType(GridView1.DataKeys(e.RowIndex).Value, Integer)
        DeleteRecordByID(TopID)
        'QueryStr = "delete from ReplyMB where top_id = '" & GridView3.DataKeys(Convert.ToInt32(e.RowIndex)).Value.ToString() & "'"
        'If ExecuteComm(QueryStr) = True Then
        '    QueryStr = "delete from TopicMB where top_id = '" & GridView3.DataKeys(Convert.ToInt32(e.RowIndex)).Value.ToString() & "'"
        '    If ExecuteComm(QueryStr) = True Then
        '        Response.Redirect("../Result.aspx?msg=ได้ลบกระทู้ที่ " & GridView3.DataKeys(Convert.ToInt32(e.RowIndex)).Value.ToString() & " ของกระดานสนทนารายวิชาเสร็จเรียบร้อยแล้ว&user=Administrator")
        '    Else
        '        Response.Redirect("../DBFailed.aspx")
        '    End If

        'Else
        '    Response.Redirect("../DBFailed.aspx")
        'End If
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim db As ImageButton = CType(e.Row.FindControl("ImgButt"), ImageButton)
            db.Attributes.Add("onclick", "javascript:return " & "confirm('Are you sure you want to delete this Topic ID : " & DataBinder.Eval(e.Row.DataItem, "top_id") & "')")
        End If
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Delete" Then
            Dim TopID As Integer = Convert.ToInt32(e.CommandArgument)
            DeleteRecordByID(TopID)
        End If
    End Sub

    Protected Sub GridView1_RowDeleted(ByVal sender As Object, ByVal e As GridViewDeletedEventArgs)
    End Sub

    Private Sub DeleteRecordByID(ByVal TopID As Integer)
        QueryStr = "delete from ReplyMB where top_id = '" & TopID & "'"
        If ExecuteComm(QueryStr) = True Then
            QueryStr = "delete from TopicMB where top_id = '" & TopID & "'"
            If ExecuteComm(QueryStr) = True Then
                Response.Redirect("../Result.aspx?msg=ได้ลบกระทู้ที่ " & TopID & " ของกระดานสนทนารายวิชา " & subjectDDL.SelectedItem.Text & " เสร็จเรียบร้อยแล้ว&user=Administrator")
            Else
                Response.Redirect("../DBFailed.aspx")
            End If

        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub
End Class
