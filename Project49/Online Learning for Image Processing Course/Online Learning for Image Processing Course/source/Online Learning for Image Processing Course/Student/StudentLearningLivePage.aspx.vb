Imports System.Data
Imports System.Data.SqlClient

Partial Class Student_StudentLearningLivePage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack Then
        Else
            'Dim mydate As Date = Now
            Dim mydate As Date = System.DateTime.Now.ToLongTimeString
            Dim myday As Integer = Weekday(mydate)
            Dim myhours As Integer = Hour(mydate)
            Dim myminutes As Integer = Minute(mydate)

            Dim daylearn As String = Request.QueryString("date")
            Dim gettimelearn(1) As String
            Dim timestart(1) As String
            Dim timeend(1) As String
            Dim StatusDay As Boolean = False
            Dim StatusTime As Boolean = False

            gettimelearn = Request.QueryString("time").Split("-")
            timestart = gettimelearn(0).Split(".")
            timeend = gettimelearn(1).Split(".")

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
                    If daylearn = "อาทิตย์" Then
                        daylearn = 1
                    ElseIf daylearn = "จันทร์" Then
                        daylearn = 2
                    ElseIf daylearn = "อังคาร" Then
                        daylearn = 3
                    ElseIf daylearn = "พุธ" Then
                        daylearn = 4
                    ElseIf daylearn = "พฤหัสบดี" Then
                        daylearn = 5
                    ElseIf daylearn = "ศุกร์" Then
                        daylearn = 6
                    ElseIf daylearn = "เสาร์" Then
                        daylearn = 7
                    End If
                    If myday = daylearn Then
                        StatusDay = True
                    Else
                        StatusDay = False
                    End If
                    If (Val(timestart(0)) <= myhours) And (myhours <= Val(timeend(0))) Then
                        If Val(timestart(0)) = myhours Then
                            If myminutes >= Val(timestart(1)) Then
                                StatusTime = True
                            Else
                                StatusTime = False
                            End If
                        ElseIf Val(timeend(0)) = myhours Then
                            If myminutes <= Val(timeend(1)) Then
                                StatusTime = True
                            Else
                                StatusTime = False
                            End If
                        Else
                            StatusTime = True
                        End If
                    Else
                        StatusTime = False
                    End If
                    '----------------------------- Set Learning
                    Dim topic As String = ""
                    Dim calid As String = ""

                    'Dim setdate As Date = Now
                    'Dim hh As Integer = Hour(setdate)
                    'Dim mm As Integer = Minute(setdate)
                    'Dim ss As Integer = Second(setdate)
                    'Dim setmyday As String = Today
                    'Dim setmytime As String = hh & ":" & mm & ":" & ss

                    Dim setmyday As Date = System.DateTime.Now.ToLongDateString
                    Dim setmytime As Date = System.DateTime.Now.ToLongTimeString

                    If (StatusDay = True) And (StatusTime = True) Then
                        QueryStr = "select sub_name from Subject where sub_id = '" & Request.QueryString("sub_id") & "'"
                        TableStr = "gettopic"
                        If FillCommQ(QueryStr, TableStr) = True Then
                            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                    topic = "การเรียนการสอนแบบถ่ายทอดสอดวิชา " & CStr(row("sub_name"))
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
                            calid & "','" & Request.QueryString("sub_id") & "','" & Session("user") & "','" & topic & "','" & setmyday & "','" & setmytime & "')"
                        If ExecuteComm(QueryStr) = False Then
                            Response.Redirect("../DBFailed.aspx")
                        End If
                        QueryStr = "select std_name from Student where std_id = '" & Session("user") & "'"
                        TableStr = "getname"
                        If FillCommQ(QueryStr, TableStr) = True Then
                            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                    Session("StudentName") = row("std_name")
                                Next
                            Else
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../Result.aspx?msg=วิชานี้เรียนในวัน " & Request.QueryString("date") & " และเวลาที่สามารถเข้าไปเรียนได้คือ " & Request.QueryString("time") & "&action=close")
                    End If
                Else
                    Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้เรียน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
                End If
            Else
                Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
            End If
        End If
    End Sub
End Class
