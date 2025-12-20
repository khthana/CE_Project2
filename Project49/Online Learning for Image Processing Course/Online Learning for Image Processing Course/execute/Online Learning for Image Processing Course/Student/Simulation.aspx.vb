Imports System.Data
Imports System.Data.SqlClient

Partial Class Student_Simulation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Student" Then
                '************************* Register Check
                QueryStr = "select sub_id from result where reg_id = (select reg_id from register " & _
                    "where reg_year = (select max(reg_year) from register) and reg_term = " & _
                    "(select max(reg_term) from register where reg_year = (select max(reg_year) " & _
                    "from register)) and std_id = '" & Session("user") & "') order by sub_id"
                TableStr = "checking"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                        Dim tmp As Boolean = False
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            If row("sub_id") = Request.QueryString("sub_id") Then
                                tmp = True
                                Exit For
                            Else
                                tmp = False
                            End If
                        Next
                        If tmp = False Then
                            Response.Redirect("../Result.aspx?msg=คุณไม่ได้ลงทะเบียนในวิชานี้&action=close")
                        End If
                    Else
                        Response.Redirect("../Result.aspx?msg=คุณไม่ได้ลงทะเบียนในวิชานี้&action=close")
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
                '*************************
                If Request.QueryString("sim") = "" Then
                    Response.Redirect("../Result.aspx?msg=วิชานี้ยังไม่มีตัวอย่างการทดลอง&action=close")
                Else
                    '--------------------------- Set Learning
                    Dim topic As String = ""
                    Dim calid As String = ""

                    'Dim setdate As Date = Now
                    'Dim hh As Integer = Hour(setdate)
                    'Dim mm As Integer = Minute(setdate)
                    'Dim ss As Integer = Second(setdate)
                    'Dim myday As String = Today
                    'Dim mytime As String = hh & ":" & mm & ":" & ss

                    Dim myday As Date = System.DateTime.Now.ToLongDateString
                    Dim mytime As Date = System.DateTime.Now.ToLongTimeString

                    QueryStr = "select sub_name from Subject where sub_id = '" & Request.QueryString("sub_id") & "'"
                    TableStr = "gettopic"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                topic = "การเรียนรู้จากตัวอย่างการทดลองวิชา " & CStr(row("sub_name"))
                            Next
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    QueryStr = "select cal_id from LearningCalendar where cal_year = (select max(cal_year) from learningcalendar) and cal_term = (select max(cal_term) from learningcalendar where cal_year=(select max(cal_year) from learningcalendar))"
                    TableStr = "getcalid"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                calid = row("cal_id")
                            Next
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    CloseConn()
                    QueryStr = "insert into Learning(cal_id,sub_id,std_id,lrn_content,lrn_date,lrn_time) values('" & _
                        calid & "','" & Request.QueryString("sub_id") & "','" & Session("user") & "','" & topic & "','" & myday & "','" & mytime & "')"
                    If ExecuteComm(QueryStr) = False Then
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    Response.Redirect("../" & Request.QueryString("sim") & "?sub_id=" & Request.QueryString("sub_id"))
                End If
            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้เรียน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If
    End Sub
End Class
