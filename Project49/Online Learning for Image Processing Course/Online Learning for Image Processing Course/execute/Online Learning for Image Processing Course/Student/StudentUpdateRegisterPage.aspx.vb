Imports System.Data
Imports System.Data.SqlClient

Partial Class Student_StudentUpdateRegisterPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim year As String = ""
        Dim term As String = ""
        'Dim mydate As String = Today
        Dim mydate As Date = System.DateTime.Now.ToLongDateString
        Dim my_date As String = mydate
        Dim getmydate(2) As String
        getmydate = my_date.Split("/")
        Dim getbchange(2) As String
        Dim getechange(2) As String
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Student" Then
                If Not Page.IsPostBack Then
                    '************ Check Date Time to Update Registet
                    QueryStr = "select cal_id,cal_year,cal_term,cal_bchange,cal_echange from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar) and cal_term = (select max(cal_term) from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar))"
                    TableStr = "getregisterdate"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                year = row("cal_year")
                                term = row("cal_term")
                                getbchange = CStr(row("cal_bchange")).Split("/")
                                getechange = CStr(row("cal_echange")).Split("/")
                            Next
                        ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                            warning.Text = "ไม่พบข้อมูล"
                            Exit Sub
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If

                    '+++++++++++++++++ check date to register
                    Dim tmp1 As Boolean = False
                    Dim tmp2 As Boolean = False
                    If Val(getmydate(2)) > Val(getbchange(2)) Then
                        tmp1 = True
                    ElseIf Val(getmydate(2)) = Val(getbchange(2)) Then
                        If Val(getmydate(1)) > Val(getbchange(1)) Then
                            tmp1 = True
                        ElseIf Val(getmydate(1)) = Val(getbchange(1)) Then
                            If Val(getmydate(0)) > Val(getbchange(0)) Then
                                tmp1 = True
                            ElseIf Val(getmydate(0)) = Val(getbchange(0)) Then
                                tmp2 = True
                            Else
                                Response.Redirect("../Result.aspx?msg=ตอนนี้ยังไม่ถึงกำหนดการเปลี่ยนแปลงการลงทะเบียน&user=Student")
                            End If
                        Else
                            Response.Redirect("../Result.aspx?msg=ตอนนี้ยังไม่ถึงกำหนดการเปลี่ยนแปลงการลงทะเบียน&user=Student")
                        End If
                    Else
                        Response.Redirect("../Result.aspx?msg=ตอนนี้ยังไม่ถึงกำหนดการเปลี่ยนแปลงการลงทะเบียน&user=Student")
                    End If
                    Dim tmp3 As Boolean = False
                    If tmp2 = True Then
                        tmp3 = True
                    End If
                    If tmp1 = True Then
                        If Val(getmydate(2)) > Val(getechange(2)) Then
                            Response.Redirect("../Result.aspx?msg=ปิดการเปลี่ยนแปลงการลงทะเบียน&user=Student")
                        ElseIf Val(getmydate(2)) = Val(getechange(2)) Then
                            If Val(getmydate(1)) > Val(getechange(1)) Then
                                Response.Redirect("../Result.aspx?msg=ปิดการเปลี่ยนแปลงการลงทะเบียน&user=Student")
                            ElseIf Val(getmydate(1)) = Val(getechange(1)) Then
                                If Val(getmydate(0)) > Val(getechange(0)) Then
                                    Response.Redirect("../Result.aspx?msg=ปิดการเปลี่ยนแปลงการลงทะเบียน&user=Student")
                                ElseIf Val(getmydate(0)) = Val(getechange(0)) Then
                                    tmp3 = True
                                Else
                                    tmp3 = True
                                End If
                            Else
                                tmp3 = True
                            End If
                        Else
                            tmp3 = True
                        End If
                        'Else
                        '    Response.Redirect("../Result.aspx?msg=ตอนนี้ยังไม่ถึงกำหนดการเปลี่ยนแปลงการลงทะเบียน&user=Student")
                    End If
                    '++++++++++++++++++++++++++++

                    Dim getreg As String = ""
                    Dim tmp4 As Boolean = False

                    '++++++++++++++ เช็คว่าได้ลงทะเบียนในปีการศึกษาและภาคการศึกษานั้นหรือยัง
                    If tmp3 = True Then
                        QueryStr = "select count(reg_id) as reg from register where reg_year = '" & year & "' and reg_term = '" & term & "' and std_id = '" & Session("user") & "'"
                        TableStr = "getreg"
                        If FillCommQ(QueryStr, TableStr) = True Then
                            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                    getreg = row("reg")
                                Next
                                If Val(getreg) = 1 Then
                                    '-----------go to update register
                                    tmp4 = True
                                ElseIf Val(getreg) = 0 Then
                                    Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ลงทะเบียน กรุณาลงทะเบียนก่อนค่ะ&user=Student")
                                Else
                                    Response.Redirect("../DBFailed.aspx")
                                End If
                            Else
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../Result.aspx?msg=ตอนนี้ยังไม่ถึงกำหนดการเปลี่ยนแปลงการลงทะเบียน&user=Student")
                    End If
                    If tmp4 = True Then
                    Else
                        Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ลงทะเบียน กรุณาลงทะเบียนก่อนค่ะ&user=Student")
                    End If
                    '++++++++++++
                    '**************************
                End If
            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้เรียน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If
    End Sub

    Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        Dim gr As GridViewRow
        Dim arrSubID(0) As String
        Dim arrSecID(0) As String
        Dim i As Integer = 0
        Dim j As Integer = 0
        Dim k As Integer = 0
        Dim count As Integer = 0
        For Each gr In GridView1.Rows
            Dim chk As CheckBox = CType(gr.FindControl("registerChB"), CheckBox)
            If chk.Checked Then
                ReDim Preserve arrSubID(i)
                arrSubID(i) = gr.Cells(1).Text
                ReDim Preserve arrSecID(i)
                arrSecID(i) = gr.Cells(3).Text
                i = i + 1
            End If
        Next
        If i = 0 Then
            warning.Text = "กรุณาเลือกวิชาลงทะเบียน"
            Exit Sub
        ElseIf i > 4 Then
            warning.Text = "ลงทะเบียนได้ไม่เกิน 5 วิชา"
            Exit Sub
        Else
            k = arrSubID.Length - 1
            For j = 0 To arrSubID.Length - 2
                count = 1
                While count <= k
                    If arrSubID(j) = arrSubID(j + count) Then
                        warning.Text = "คุณเลือกวิชาซ้ำกัน กรุณาเลือกวิชาใหม่"
                        Exit Sub
                    End If
                    count = count + 1
                End While
                k = k - 1
            Next
        End If
        Dim arrsec(0) As String
        j = 0
        For Each i In arrSubID
            QueryStr = "select sec_id from SubjectSection where sub_id = '" & i & "' and sec_number = '" & arrSecID(j) & "'"
            TableStr = "getsecid"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        ReDim Preserve arrsec(j)
                        arrsec(j) = row("sec_id")
                    Next
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
            j = j + 1
        Next

        Dim RegID As String = ""
        Dim status As Boolean = RegisterChecking(arrSubID, arrSecID)
        If status = True Then
            QueryStr = "select reg_id from Register where std_id = '" & Session("user") & "'" & _
                " and reg_year = (select max(reg_year) from Register) and reg_term = (select max(reg_term) from Register where reg_year = (select max(reg_year) from Register))"
            TableStr = "getregid"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        RegID = row("reg_id")
                    Next
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
            CloseConn()
            QueryStr = "delete from Result where reg_id = '" & RegID & "'"
            If ExecuteComm(QueryStr) = False Then
                Response.Redirect("../DBFailed.aspx")
            End If
            For j = 0 To arrSubID.Length - 1
                QueryStr = "insert into Result(reg_id,sub_id,sec_id,res_grade,res_score,res_assess) values('" & _
                    RegID & "','" & arrSubID(j) & "','" & arrsec(j) & "','-','0.0','0')"
                If ExecuteComm(QueryStr) = False Then
                    Response.Redirect("../DBFailed.aspx")
                End If
            Next

            Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงการลงทะเบียนเสร็จเรียบร้อยแล้ว&user=Student")
        Else
            warning.Text = "กรุณาเลือกวิชาใหม่ เนื่องจากคุณอาจจะเลือกวิชาที่มีวัน เวลาที่เรียนและที่สอบตรงกัน หรือไม่ก็วิชานั้นเต็มแล้ว"
            Exit Sub
        End If
    End Sub

    Function RegisterChecking(ByVal sid As Array, ByVal secid As Array) As Boolean
        Dim size As Integer = sid.Length
        Dim arr(size - 1) As String
        Dim i, j, k As Integer
        For i = 0 To size - 1
            QueryStr = "select ss.sec_dlearn, ss.sec_tlearn, s.sub_dexam, s.sub_texam, s.sub_quantity" & _
                        " from subject s, subjectsection ss where s.sub_id=ss.sub_id and s.sub_id='" & _
                        sid(i) & "' and ss.sec_number='" & secid(i) & "'"
            TableStr = "getalldatetime"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        arr(i) = row("sec_dlearn") & " " & row("sec_tlearn") & "&" & row("sub_dexam") & _
                                " " & row("sub_texam") & "&" & row("sub_quantity") & " "
                    Next
                    QueryStr = "select count(sub_id) as tmp from result where sub_id = '" & _
                                sid(i) & "' and reg_id in (select reg_id from register" & _
                                " where reg_year = (select max(reg_year) from register)" & _
                                " and reg_term = (select max(reg_term) from register))"
                    TableStr = "gettmp"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each roww As DataRow In sqlDS.Tables(TableStr).Rows
                                arr(i) = arr(i) & roww("tmp")
                            Next
                        Else
                            Response.Redirect("DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("DBFailed.aspx")
                    End If
                Else
                    Response.Redirect("DBFailed.aspx")
                End If
            Else
                Response.Redirect("DBFailed.aspx")
            End If
        Next
        Dim status As Boolean = False
        Dim detail_subject1(2), detail_subject2(2), check_number_of_student(1) As String
        k = size - 1
        For i = 0 To size - 2
            j = 1
            While j <= k
                detail_subject1 = arr(i).Split("&")
                detail_subject2 = arr(i + j).Split("&")

                If detail_subject1(0) = detail_subject2(0) Then
                    status = False
                    Return False
                ElseIf detail_subject1(1) = detail_subject2(1) Then
                    status = False
                    Return False
                Else
                    check_number_of_student = detail_subject1(2).Split(" ")
                    If Val(check_number_of_student(0)) > Val(check_number_of_student(1)) Then
                        status = True
                    Else
                        status = False
                        Return False
                    End If
                    If i = (size - 2) Then
                        check_number_of_student = detail_subject2(2).Split(" ")
                        If Val(check_number_of_student(0)) > Val(check_number_of_student(1)) Then
                            status = True
                        Else
                            status = False
                            Return False
                        End If
                    End If
                End If
                j = j + 1
            End While
            k = k - 1
        Next
        If size = 1 Then
            Return True
        End If
        If status = True Then
            Return True
        End If
    End Function

    Protected Sub back_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles back.Click
        Response.Redirect("StudentRegister.aspx")
    End Sub
End Class
