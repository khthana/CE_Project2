Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class Administrator_AdministratorCreateUser
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

    Protected Sub clear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear.Click
        usertypeDDL.SelectedIndex = 0
        name.Text = ""
        'dayDDL.SelectedIndex = 0
        'monthDDL.SelectedIndex = 0
        'year.Text = ""
        '-------
        txt.Value = ""
        '-------
        address.Text = ""
        tel.Text = ""
        email.Text = ""
        qualification.Text = ""
        performance.Text = ""
        attention.Text = ""
        newpicture.Style.Clear()
        questionDDL.SelectedIndex = 0
        answer.Text = ""
        username.Text = ""
        password.Text = ""
        warning.Text = ""
    End Sub

    Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        Dim pathpic As String = ""
        Dim prefixcheck As String = ""
        Dim prefix As String = ""
        Dim tablenamecheck As String = ""
        Dim tablename As String = ""
        Dim status As String = ""
        Dim statuspic As String = ""
        Dim i As Integer = 0
        If usertypeDDL.SelectedItem.Value = "select" Then
            warning.Text = "กรุณาเลือกประเภทสมาชิก"
            Exit Sub
        ElseIf usertypeDDL.SelectedItem.Value = "Teacher" Then
            prefix = "tch_"
            tablename = "Teacher"
            pathpic = Server.MapPath("~") & "\PictureTeacherStaff\Teacher\" & Path.GetFileName(newpicture.PostedFile.FileName.Trim())
        ElseIf usertypeDDL.SelectedItem.Value = "Staff" Then
            prefix = "stf_"
            tablename = "Staff"
            pathpic = Server.MapPath("~") & "\PictureTeacherStaff\Staff\" & Path.GetFileName(newpicture.PostedFile.FileName.Trim())
        End If

        For i = 0 To 3
            If i = 0 Then
                prefixcheck = "std_"
                tablenamecheck = "Student"
            ElseIf i = 1 Then
                prefixcheck = "stf_"
                tablenamecheck = "Staff"
            ElseIf i = 2 Then
                prefixcheck = "tch_"
                tablenamecheck = "Teacher"
            ElseIf i = 3 Then
                prefixcheck = "adm_"
                tablenamecheck = "Administrator"
            End If
            QueryStr = "select " & prefixcheck & "username," & prefixcheck & "password from " & tablenamecheck & _
                        " where " & prefixcheck & "username = '" & username.Text & "' or " & prefixcheck & "password = '" & _
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

        Dim objpic As New FileInfo(pathpic)
        If (newpicture.PostedFile.FileName <> "" And newpicture.PostedFile.FileName.Trim().Length > 0 And newpicture.PostedFile.ContentLength > 0 And newpicture.PostedFile.ContentLength <= 400000000) Then
            If objpic.Exists Then
                warning.Text = "กรุณาเปลี่ยนชื่อไฟล์"
                Exit Sub
            Else
                statuspic = True
            End If
        Else
            statuspic = False
        End If

        '----------------
        Dim arrayuserbirthdate(2) As String
        arrayuserbirthdate = txt.Value.Split("/")
        arrayuserbirthdate(2) = Val(arrayuserbirthdate(2)) + 543
        Dim userbirthdate As String = arrayuserbirthdate(0) & "/" & arrayuserbirthdate(1) & "/" & arrayuserbirthdate(2)
        '----------------

        If status = "1" Then
            If statuspic = True Then
                newpicture.PostedFile.SaveAs(Server.MapPath("~") & "\PictureTeacherStaff\" & tablename & "\" & Path.GetFileName(newpicture.PostedFile.FileName.Trim()))
                QueryStr = "insert into " & tablename & "(" & prefix & "name," & prefix & "birthdate," & prefix & _
                    "address," & prefix & "phone," & prefix & "email," & prefix & "qualification," & prefix & _
                    "performance," & prefix & "attention," & prefix & "picture," & prefix & "question," & prefix & _
                    "answer," & prefix & "username," & prefix & "password) values('" & _
                    name.Text & "','" & userbirthdate & _
                    "','" & address.Text & "','" & tel.Text & "','" & email.Text & "','" & qualification.Text & "','" & _
                    performance.Text & "','" & attention.Text & "','" & "PictureTeacherStaff/" & tablename & "/" & Path.GetFileName(newpicture.PostedFile.FileName.Trim()) & _
                    "','" & questionDDL.SelectedItem.Value & "','" & answer.Text & "','" & username.Text & "','" & password.Text & "')"
            Else
                QueryStr = "insert into " & tablename & "(" & prefix & "name," & prefix & "birthdate," & prefix & _
                    "address," & prefix & "phone," & prefix & "email," & prefix & "qualification," & prefix & _
                    "performance," & prefix & "attention," & prefix & "question," & prefix & "answer," & prefix & "username," & _
                    prefix & "password) values('" & name.Text & "','" & userbirthdate & _
                    "','" & address.Text & "','" & tel.Text & "','" & email.Text & "','" & qualification.Text & "','" & _
                    performance.Text & "','" & attention.Text & "','" & questionDDL.SelectedItem.Value & "','" & answer.Text & "','" & username.Text & "','" & password.Text & "')"
            End If

            CloseConn()
            If ExecuteComm(QueryStr) = False Then
                Response.Redirect("../DBFailed.aspx")
            Else
                Response.Redirect("../Result.aspx?msg=การสมัครสมาชิกประเภท " & usertypeDDL.SelectedItem.Text & " เสร็จเรียบร้อยแล้ว&user=Administrator")
            End If
        End If
    End Sub
End Class
