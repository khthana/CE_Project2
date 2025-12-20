
Partial Class Administrator_AdministratorBoard
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

    Protected Sub gwb_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles gwb.Click
        Response.Redirect("AdministratorGeneralWB.aspx")
    End Sub

    Protected Sub mwb_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles mwb.Click
        Response.Redirect("AdministratorMemberWB.aspx")
    End Sub

    Protected Sub msb_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles msb.Click
        Response.Redirect("AdministratorMSB.aspx")
    End Sub
End Class
