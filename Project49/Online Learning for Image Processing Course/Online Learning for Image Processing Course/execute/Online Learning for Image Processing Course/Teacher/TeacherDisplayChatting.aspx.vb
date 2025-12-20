
Partial Class Teacher_TeacherDisplayChatting
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Session("loginstatus") = True And Session("user") <> 0 Then
                If Session("usertype") = "Teacher" Then
                    displaybox.Text = Application(Request.QueryString("sub_id") & "Message")
                    Application.Lock()
                    Application(Request.QueryString("sub_id") & "Display") = displaybox.Text
                    Application.UnLock()
                End If
            End If
        End If
    End Sub
End Class
