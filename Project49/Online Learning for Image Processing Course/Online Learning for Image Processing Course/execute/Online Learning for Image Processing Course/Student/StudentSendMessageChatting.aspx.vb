
Partial Class Student_StudentSendMessageChatting
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Session("loginstatus") = True And Session("user") <> 0 Then
                If Session("usertype") = "Student" Then
                    writtingbox.Focus()
                End If
            End If
        Else
            writtingbox.Focus()
        End If
    End Sub

    Protected Sub send_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles send.Click
        Dim username As String = Session("StudentName")
        Application.Lock()
        Application(Request.QueryString("sub_id") & "Display") = username & " : " & writtingbox.Text & vbCrLf & "--------------------" & vbCrLf
        Application(Request.QueryString("sub_id") & "Message") &= Application(Request.QueryString("sub_id") & "Display")
        Application.UnLock()
        writtingbox.Text = ""
    End Sub
End Class
