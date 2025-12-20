Imports System.Data
Imports System.Data.SqlClient

Partial Class TeacherDetail
    Inherits System.Web.UI.Page

    Protected Sub signup_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles signup.Click
        Response.Redirect("SignUp.aspx")
    End Sub

    Protected Sub forget_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles forget.Click
        Response.Redirect("ForgetPassword.aspx")
    End Sub

    Protected Sub signin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles signin.Click
        Dim prefix As String = ""
        Dim tablename As String = ""
        Dim status As Boolean = True
        Dim i As Integer = 0
        For i = 0 To 3
            If i = 0 Then
                prefix = "std_"
                tablename = "Student"
            ElseIf i = 1 Then
                prefix = "stf_"
                tablename = "Staff"
            ElseIf i = 2 Then
                prefix = "tch_"
                tablename = "Teacher"
            ElseIf i = 3 Then
                prefix = "adm_"
                tablename = "Administrator"
            End If
            QueryStr = "select " & prefix & "id," & prefix & "username," & prefix & "password from " & tablename & _
                        " where " & prefix & "username = '" & usernamelogin.Text & "' and " & prefix & "password = '" & _
                        passwordlogin.Text & "'"
            TableStr = "checklogin"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        status = True
                        Session("user") = row(prefix & "id")
                        Session("usertype") = tablename
                        Session("loginstatus") = True
                    Next
                    Response.Redirect(tablename & "/" & tablename & ".aspx")
                Else
                    status = False
                End If
            Else
                Response.Redirect("DBFailed.aspx")
            End If
        Next
        If status = False Then
            warninglogin.Text = "ข้อมูลของคุณไม่ถูกต้อง"
            Exit Sub
        End If
    End Sub
End Class
