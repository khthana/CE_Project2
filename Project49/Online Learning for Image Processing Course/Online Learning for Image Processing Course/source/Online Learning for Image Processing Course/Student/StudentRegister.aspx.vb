
Partial Class Student_StudentRegister
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

    Protected Sub register_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles register.Click
        Response.Redirect("StudentRegisterPage.aspx")
    End Sub

    Protected Sub updateregister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updateregister.Click
        Response.Redirect("StudentUpdateRegisterPage.aspx")
    End Sub

    Protected Sub deleteregister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles deleteregister.Click
        Response.Redirect("StudentDeleteRegisterPage.aspx")
    End Sub
End Class
