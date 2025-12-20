
Partial Class Administrator_AdministratorViewNews
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Administrator" Then
                'close.Attributes.Add("onclick", "window.close();")
            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้ดูแลระบบ คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If
    End Sub

    Protected Sub close_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles close.Click
        Response.Redirect("Administrator.aspx")
        'Response.Write("<script language='javascript'> { window.close();}</script>")
    End Sub
End Class
