Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class Staff_StaffProfile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim mydate As String = ""
            Dim getmydate(2) As String
            If Session("loginstatus") = True And Session("user") <> 0 Then
                If Session("usertype") = "Staff" Then
                    QueryStr = "select * from Staff where stf_id = '" & Session("user") & "'"
                    TableStr = "userprofile"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                name.Text = row("stf_name")
                                mydate = row("stf_birthdate")
                                getmydate = mydate.Split("/")
                                '----------
                                getmydate(2) = getmydate(2) - 543
                                txt.Value = getmydate(0) & "/" & getmydate(1) & "/" & getmydate(2)
                                '----------
                                'dayDDL.SelectedIndex = getmydate(0)
                                'monthDDL.SelectedIndex = getmydate(1)
                                'year.Text = getmydate(2)
                                address.Text = row("stf_address")
                                tel.Text = row("stf_phone")
                                email.Text = row("stf_email")
                                qualification.Text = row("stf_qualification")
                                performance.Text = row("stf_performance")
                                attention.Text = row("stf_attention")
                                picture.ImageUrl = "~/" & row("stf_picture")
                                questionDDL.SelectedIndex = row("stf_question")
                                answer.Text = row("stf_answer")
                                username.Text = row("stf_username")
                                password.Text = row("stf_password")
                            Next
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทสมาชิกห้อง Image Processing คุณไม่สามารถเข้าเว็บเพจนี้ได้")
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
        tel.Text = ""
        email.Text = ""
        qualification.Text = ""
        performance.Text = ""
        attention.Text = ""
        picture.Style.Clear()
        newpicture.Style.Clear()
        questionDDL.SelectedIndex = 0
        answer.Text = ""
        username.Text = ""
        password.Text = ""
        warning.Text = ""
    End Sub

    Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        warning.Text = ""
        Dim OldUsername As String = ""
        Dim OldPassword As String = ""
        Dim OldPicture As String = ""
        QueryStr = "select stf_picture,stf_username,stf_password from Staff where stf_id = '" & Session("user") & "'"
        TableStr = "getOldUserDetail"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    OldUsername = row("stf_username")
                    OldPassword = row("stf_password")
                    OldPicture = row("stf_picture")
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
                    QueryStr = "select stf_username from Staff where stf_username = '" & username.Text & "'"
                End If
            Else
                If OldPassword <> password.Text Then
                    QueryStr = "select stf_password from Staff where stf_password = '" & password.Text & "'"
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

        Dim objoldfile As New FileInfo(Server.MapPath("~") & "\" & OldPicture)
        Dim objnewfile As New FileInfo(Server.MapPath("~") & "\PictureTeacherStaff\Staff\" & Path.GetFileName(newpicture.PostedFile.FileName.Trim()))
        Dim statuspic As Boolean = False
        If (newpicture.PostedFile.FileName <> "" And newpicture.PostedFile.FileName.Trim().Length > 0 And newpicture.PostedFile.ContentLength > 0 And newpicture.PostedFile.ContentLength <= 400000000) Then
            If objnewfile.Exists Then
                warning.Text = "กรุณาเปลี่ยนชื่อไฟล์"
                Exit Sub
            Else
                objoldfile.Delete()
                newpicture.PostedFile.SaveAs(Server.MapPath("~") & "\PictureTeacherStaff\Staff\" & Path.GetFileName(newpicture.PostedFile.FileName.Trim()))
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
                QueryStr = "update Staff set stf_name = '" & name.Text & "', stf_birthdate = '" & _
                    userbirthdate & _
                    "', stf_address = '" & address.Text & "', stf_phone = '" & _
                    tel.Text & "', stf_email = '" & email.Text & "', stf_qualification = '" & _
                    qualification.Text & "', stf_performance = '" & performance.Text & _
                    "', stf_attention = '" & attention.Text & "', stf_picture = 'PictureTeacherStaff/Staff/" & _
                    Path.GetFileName(newpicture.PostedFile.FileName.Trim()) & "', stf_question = '" & _
                    questionDDL.SelectedItem.Value & "', stf_answer = '" & answer.Text & _
                    "', stf_username = '" & username.Text & "', stf_password = '" & password.Text & "'" & _
                    " where stf_id = '" & Session("user") & "'"
            Else
                QueryStr = "update Staff set stf_name = '" & name.Text & "', stf_birthdate = '" & _
                    userbirthdate & _
                    "', stf_address = '" & address.Text & "', stf_phone = '" & _
                    tel.Text & "', stf_email = '" & email.Text & "', stf_qualification = '" & _
                    qualification.Text & "', stf_performance = '" & performance.Text & _
                    "', stf_attention = '" & attention.Text & "', stf_question = '" & _
                    questionDDL.SelectedItem.Value & "', stf_answer = '" & answer.Text & _
                    "', stf_username = '" & username.Text & "', stf_password = '" & password.Text & "'" & _
                    " where stf_id = '" & Session("user") & "'"
            End If
            CloseConn()
            If ExecuteComm(QueryStr) = False Then
                Response.Redirect("../DBFailed.aspx")
            Else
                Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงข้อมูลส่วนบุคคลเสร็จเรียบร้อยแล้ว&user=Staff")
            End If
        End If
    End Sub
End Class
