Imports System.Data
Imports System.Data.SqlClient

Partial Class SignUp
    Inherits System.Web.UI.Page

    Protected Sub clear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear.Click
        name.Text = ""
        'dayDDL.SelectedIndex = 0
        'monthDDL.SelectedIndex = 0
        'year.Text = ""
        '-------
        txt.Value = ""
        '-------
        address.Text = ""
        job.Text = ""
        tel.Text = ""
        email.Text = ""
        questionDDL.SelectedIndex = 0
        answer.Text = ""
        username.Text = ""
        password.Text = ""
        warning.Text = ""
    End Sub

    Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        Dim prefix As String = ""
        Dim tablename As String = ""
        Dim status As String = ""
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
            QueryStr = "select " & prefix & "username," & prefix & "password from " & tablename & _
                        " where " & prefix & "username = '" & username.Text & "' or " & prefix & "password = '" & _
                        password.Text & "'"
            TableStr = "checkmember"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count <> 0 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        warning.Text = "กรุณาเปลี่ยนชื่อผู้ใช้และรหัสผ่าน"
                        status = "0"
                        Exit Sub
                    Next
                Else
                    status = "1"
                End If
            Else
                Response.Redirect("DBFailed.aspx")
            End If
        Next

        '----------------
        Dim arrayuserbirthdate(2) As String
        arrayuserbirthdate = txt.Value.Split("/")
        arrayuserbirthdate(2) = Val(arrayuserbirthdate(2)) + 543
        Dim userbirthdate As String = arrayuserbirthdate(0) & "/" & arrayuserbirthdate(1) & "/" & arrayuserbirthdate(2)
        '----------------

        If status = "1" Then

            'QueryStr = "insert into Student(std_name,std_birthdate,std_address,std_work,std_phone,std_email,std_question,std_answer,std_username,std_password) values('" & _
            '    name.Text & "','" & dayDDL.SelectedItem.Value & "/" & monthDDL.SelectedItem.Value & "/" & year.Text & _
            '    "','" & address.Text & "','" & job.Text & "','" & tel.Text & "','" & email.Text & "','" & _
            '    questionDDL.SelectedItem.Value & "','" & answer.Text & "','" & username.Text & "','" & password.Text & "')"

            QueryStr = "insert into Student(std_name,std_birthdate,std_address,std_work,std_phone,std_email,std_question,std_answer,std_username,std_password) values('" & _
                name.Text & "','" & userbirthdate & "','" & address.Text & "','" & job.Text & "','" & tel.Text & "','" & email.Text & "','" & _
                questionDDL.SelectedItem.Value & "','" & answer.Text & "','" & username.Text & "','" & password.Text & "')"
            CloseConn()
            If ExecuteComm(QueryStr) = False Then
                Response.Redirect("DBFailed.aspx")
            Else
                Response.Redirect("Result.aspx?msg=การสมัครสมาชิกเสร็จเรียบร้อยแล้ว")
            End If
        End If
    End Sub

    Protected Sub signupbtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles signupbtn.Click
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
