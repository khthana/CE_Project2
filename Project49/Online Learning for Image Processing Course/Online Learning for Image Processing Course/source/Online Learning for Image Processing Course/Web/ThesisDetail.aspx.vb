Imports System.Data
Imports System.Data.SqlClient

Partial Class ThesisDetail
    Inherits System.Web.UI.Page

    Protected Sub GetCodeThesis_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        GetCodeTable.Visible = True
        Warning.Text = ""
        username.Text = ""
        password.Text = ""
    End Sub

    Protected Sub Cancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Cancel.Click
        GetCodeTable.Visible = False
        Warning.Text = ""
        username.Text = ""
        password.Text = ""
    End Sub

    Protected Sub checkUser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles checkUser.Click
        QueryStr = "select stf_id,stf_username,stf_password from Staff where stf_username = '" & username.Text & _
            "' and stf_password = '" & password.Text & "'"
        TableStr = "getstaff"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                QueryStr = "select tsis_id,tsis_codepath from Thesis where tsis_id = '" & Request.QueryString("tsis_id") & "'"
                TableStr = "getcode"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            Warning.Text = ""
                            Response.Redirect(row("tsis_codepath"))
                            GetCodeTable.Visible = False
                        Next
                    End If
                Else
                    Response.Redirect("DBFailed.aspx")
                End If
            Else
                Warning.Text = "รหัสผ่านไม่ถูกต้อง" & "<br />" & "สมาชิกที่สามารถดาวน์โหลด Code ได้" & "<br />" & "คือสมาชิกประเภท Staff เท่านั้น"
            End If
        Else
            Response.Redirect("DBFailed.aspx")
        End If
    End Sub
End Class
