Imports System.Data
Imports System.Data.SqlClient

Partial Class Student_StudentDeleteRegisterPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim year As String = ""
        Dim term As String = ""
        'Dim mydate As String = Today
        Dim mydate As Date = System.DateTime.Now.ToLongDateString
        Dim my_date As String = mydate
        Dim getmydate(2) As String
        getmydate = my_date.Split("/")
        Dim getbdrop(2) As String
        Dim getedrop(2) As String
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Student" Then
                If Not Page.IsPostBack Then
                    '************ Check Date Time to Delete Registet
                    QueryStr = "select cal_id,cal_year,cal_term,cal_bdrop,cal_edrop from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar) and cal_term = (select max(cal_term) from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar))"
                    TableStr = "getregisterdate"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                year = row("cal_year")
                                term = row("cal_term")
                                getbdrop = CStr(row("cal_bdrop")).Split("/")
                                getedrop = CStr(row("cal_edrop")).Split("/")
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
                    If Val(getmydate(2)) > Val(getbdrop(2)) Then
                        tmp1 = True
                    ElseIf Val(getmydate(2)) = Val(getbdrop(2)) Then
                        If Val(getmydate(1)) > Val(getbdrop(1)) Then
                            tmp1 = True
                        ElseIf Val(getmydate(1)) = Val(getbdrop(1)) Then
                            If Val(getmydate(0)) > Val(getbdrop(0)) Then
                                tmp1 = True
                            ElseIf Val(getmydate(0)) = Val(getbdrop(0)) Then
                                tmp2 = True
                            Else
                                Response.Redirect("../Result.aspx?msg=ตอนนี้ยังไม่ถึงกำหนดการถอนรายวิชาของการลงทะเบียน&user=Student")
                            End If
                        Else
                            Response.Redirect("../Result.aspx?msg=ตอนนี้ยังไม่ถึงกำหนดการถอนรายวิชาของการลงทะเบียน&user=Student")
                        End If
                    Else
                        Response.Redirect("../Result.aspx?msg=ตอนนี้ยังไม่ถึงกำหนดการถอนรายวิชาของการลงทะเบียน&user=Student")
                    End If
                    Dim tmp3 As Boolean = False
                    If tmp2 = True Then
                        tmp3 = True
                    End If
                    If tmp1 = True Then
                        If Val(getmydate(2)) > Val(getedrop(2)) Then
                            Response.Redirect("../Result.aspx?msg=ปิดการถอนรายวิชาของการลงทะเบียน&user=Student")
                        ElseIf Val(getmydate(2)) = Val(getedrop(2)) Then
                            If Val(getmydate(1)) > Val(getedrop(1)) Then
                                Response.Redirect("../Result.aspx?msg=ปิดการถอนรายวิชาของการลงทะเบียน&user=Student")
                            ElseIf Val(getmydate(1)) = Val(getedrop(1)) Then
                                If Val(getmydate(0)) > Val(getedrop(0)) Then
                                    Response.Redirect("../Result.aspx?msg=ปิดการถอนรายวิชาของการลงทะเบียน&user=Student")
                                ElseIf Val(getmydate(0)) = Val(getedrop(0)) Then
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
                        '    Response.Redirect("../Result.aspx?msg=ตอนนี้ยังไม่ถึงกำหนดการถอนรายวิชาของการลงทะเบียน&user=Student")
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
                                    '-----------go to delete register
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
                        Response.Redirect("../Result.aspx?msg=ตอนนี้ยังไม่ถึงกำหนดการถอนรายวิชาของการลงทะเบียน&user=Student")
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

    Protected Sub GridView1_DeleteRow(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs)
        Dim TopID As Integer = CType(GridView1.DataKeys(e.RowIndex).Value, Integer)
        DeleteRecordByID(TopID)
        'Dim RegID As String = ""
        'QueryStr = "select reg_id from Register where std_id = '" & Session("user") & "'" & _
        '    " and reg_year = (select max(reg_year) from Register) and reg_term = (select max(reg_term) from Register where reg_year = (select max(reg_year) from Register))"
        'TableStr = "getregid"
        'If FillCommQ(QueryStr, TableStr) = True Then
        '    If sqlDS.Tables(TableStr).Rows.Count = 1 Then
        '        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
        '            RegID = row("reg_id")
        '        Next
        '    Else
        '        Response.Redirect("../DBFailed.aspx")
        '    End If
        'Else
        '    Response.Redirect("../DBFailed.aspx")
        'End If
        'CloseConn()
        'QueryStr = "delete from Result where sub_id = '" & _
        '    GridView1.DataKeys(Convert.ToInt32(e.RowIndex)).Value.ToString() & "'" & _
        '    " and reg_id = '" & RegID & "'"
        'If ExecuteComm(QueryStr) = True Then
        '    Response.Redirect("../Result.aspx?msg=การถอนรายวิชาเสร็จเรียบร้อยแล้ว&user=Student")
        'Else
        '    Response.Redirect("../DBFailed.aspx")
        'End If
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim db As ImageButton = CType(e.Row.FindControl("ImgButt"), ImageButton)
            db.Attributes.Add("onclick", "javascript:return " & "confirm('Are you sure you want to drop this Subject ID : " & DataBinder.Eval(e.Row.DataItem, "sub_id") & "')")
        End If
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As GridViewCommandEventArgs)
        If e.CommandName = "Delete" Then
            Dim SubID As Integer = Convert.ToInt32(e.CommandArgument)
            DeleteRecordByID(SubID)
        End If
    End Sub

    Protected Sub GridView1_RowDeleted(ByVal sender As Object, ByVal e As GridViewDeletedEventArgs)
    End Sub

    Private Sub DeleteRecordByID(ByVal SubID As Integer)
        Dim RegID As String = ""
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
        QueryStr = "delete from Result where sub_id = '" & SubID & "'" & _
            " and reg_id = '" & RegID & "'"
        If ExecuteComm(QueryStr) = True Then
            Response.Redirect("../Result.aspx?msg=คุณได้ถอนรายวิชารหัส " & SubID & " เสร็จเรียบร้อยแล้ว&user=Student")
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub back_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles back.Click
        Response.Redirect("StudentRegister.aspx")
    End Sub
End Class
