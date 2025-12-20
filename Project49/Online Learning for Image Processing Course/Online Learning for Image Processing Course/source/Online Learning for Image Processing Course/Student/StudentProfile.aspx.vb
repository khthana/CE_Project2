Imports System.Data
Imports System.Data.SqlClient

Partial Class Student_StudentProfile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim mydate As String = ""
            Dim getmydate(2) As String
            If Session("loginstatus") = True And Session("user") <> 0 Then
                If Session("usertype") = "Student" Then
                    QueryStr = "select * from Student where std_id = '" & Session("user") & "'"
                    TableStr = "userprofile"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                name.Text = row("std_name")
                                mydate = row("std_birthdate")
                                getmydate = mydate.Split("/")
                                '----------
                                getmydate(2) = getmydate(2) - 543
                                txt.Value = getmydate(0) & "/" & getmydate(1) & "/" & getmydate(2)
                                '----------
                                'dayDDL.SelectedIndex = getmydate(0)
                                'monthDDL.SelectedIndex = getmydate(1)
                                'year.Text = getmydate(2)
                                address.Text = row("std_address")
                                job.Text = row("std_work")
                                tel.Text = row("std_phone")
                                email.Text = row("std_email")
                                questionDDL.SelectedIndex = row("std_question")
                                answer.Text = row("std_answer")
                                username.Text = row("std_username")
                                password.Text = row("std_password")
                            Next
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้เรียน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
                End If
            Else
                Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
            End If
        End If
    End Sub

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
        Dim OldUsername As String = ""
        Dim OldPassword As String = ""
        QueryStr = "select std_username,std_password from Student where std_id = '" & Session("user") & "'"
        TableStr = "getOldUserDetail"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    OldUsername = row("std_username")
                    OldPassword = row("std_password")
                Next
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBfailed.aspx")
        End If
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

            If OldUsername <> username.Text Then
                If OldPassword <> password.Text Then
                    QueryStr = "select " & prefix & "username," & prefix & "password from " & tablename & _
                                " where " & prefix & "username = '" & username.Text & "' or " & prefix & "password = '" & _
                                password.Text & "'"
                Else
                    QueryStr = "select std_username from Student where std_username = '" & username.Text & "'"
                End If
            Else
                If OldPassword <> password.Text Then
                    QueryStr = "select std_password from Student where std_password = '" & password.Text & "'"
                Else
                    status = "1"
                    QueryStr = ""
                End If
            End If

            If QueryStr = "" Then
                Exit For
            Else
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
                    Response.Redirect("../DBFailed.aspx")
                End If
            End If
        Next

        '----------------
        Dim arrayuserbirthdate(2) As String
        arrayuserbirthdate = txt.Value.Split("/")
        arrayuserbirthdate(2) = Val(arrayuserbirthdate(2)) + 543
        Dim userbirthdate As String = arrayuserbirthdate(0) & "/" & arrayuserbirthdate(1) & "/" & arrayuserbirthdate(2)
        '----------------

        If status = "1" Then
            'QueryStr = "update Student set std_name = '" & name.Text & "', std_birthdate = '" & _
            '            dayDDL.SelectedItem.Value & "/" & monthDDL.SelectedItem.Value & "/" & year.Text & _
            '            "', std_address = '" & address.Text & "', std_work = '" & job.Text & "', std_phone = '" & _
            '            tel.Text & "', std_email = '" & email.Text & "', std_question = '" & _
            '            questionDDL.SelectedItem.Value & "', std_answer = '" & answer.Text & _
            '            "', std_username = '" & username.Text & "', std_password = '" & password.Text & "'" & _
            '            " where std_id = '" & Session("user") & "'"

            QueryStr = "update Student set std_name = '" & name.Text & "', std_birthdate = '" & _
                        userbirthdate & "', std_address = '" & address.Text & "', std_work = '" & job.Text & _
                        "', std_phone = '" & tel.Text & "', std_email = '" & email.Text & "', std_question = '" & _
                        questionDDL.SelectedItem.Value & "', std_answer = '" & answer.Text & _
                        "', std_username = '" & username.Text & "', std_password = '" & password.Text & "'" & _
                        " where std_id = '" & Session("user") & "'"
            CloseConn()
            If ExecuteComm(QueryStr) = False Then
                Response.Redirect("../DBFailed.aspx")
            Else
                Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงข้อมูลส่วนบุคคลเสร็จเรียบร้อยแล้ว&user=Student")
            End If
        End If
    End Sub
End Class
