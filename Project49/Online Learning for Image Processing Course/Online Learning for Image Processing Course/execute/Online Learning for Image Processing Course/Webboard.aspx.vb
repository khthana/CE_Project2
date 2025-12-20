Imports System.Data
Imports System.Data.SqlClient

Partial Class Webboard
    Inherits System.Web.UI.Page

    Protected Sub Cancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Cancel.Click
        showlogintable.Visible = False
        Warning.Text = ""
        username.Text = ""
        password.Text = ""
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        showlogintable.Visible = True
        Warning.Text = ""
        username.Text = ""
        password.Text = ""
    End Sub

    Protected Sub checkUser_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles checkUser.Click
        Warning.Text = ""
        Dim tmp As Boolean = False
        QueryStr = "select std_id,std_username,std_password from Student where std_username = '" & username.Text & _
            "' and std_password = '" & password.Text & "'"
        TableStr = "checkMember"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                Session("member") = "member"
                Response.Redirect("MemberWebboard.aspx")
            Else
                tmp = True
            End If
        Else
            Response.Redirect("DBFailed.aspx")
        End If

        QueryStr = "select tch_id,tch_username,tch_password from Teacher where tch_username = '" & username.Text & _
            "' and tch_password = '" & password.Text & "'"
        TableStr = "checkMember"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                Session("member") = "member"
                Response.Redirect("MemberWebboard.aspx")
            Else
                tmp = True
            End If
        Else
            Response.Redirect("DBFailed.aspx")
        End If

        QueryStr = "select stf_id,stf_username,stf_password from Staff where stf_username = '" & username.Text & _
            "' and stf_password = '" & password.Text & "'"
        TableStr = "checkMember"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                Session("member") = "member"
                Response.Redirect("MemberWebboard.aspx")
            Else
                tmp = True
            End If
        Else
            Response.Redirect("DBFailed.aspx")
        End If

        QueryStr = "select adm_id,adm_username,adm_password from Administrator where adm_username = '" & username.Text & _
            "' and adm_password = '" & password.Text & "'"
        TableStr = "checkMember"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                Session("member") = "member"
                Session("admin") = True
                Response.Redirect("MemberWebboard.aspx")
            Else
                tmp = True
            End If
        Else
            Response.Redirect("DBFailed.aspx")
        End If

        If tmp = True Then
            Warning.Text = "รหัสผ่านไม่ถูกต้อง" & "<br />" & "ผู้ใช้ที่เป็นสมาชิกเว็บไชต์นี้เท่านั้นที่จะสามารถเข้าได้"
            Exit Sub
        End If
    End Sub

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
