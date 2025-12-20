
Partial Class Teacher_TeacherSignOut
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session.Abandon()
        Response.Redirect("../Default.aspx")
    End Sub
End Class
