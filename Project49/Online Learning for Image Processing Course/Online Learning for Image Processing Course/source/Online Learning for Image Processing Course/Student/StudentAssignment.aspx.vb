Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class Student_StudentAssignment
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack Then
            If Session("loginstatus") = True And Session("user") <> 0 Then
                If Session("usertype") = "Student" Then
                    
                End If
            End If
        Else
            If Request.QueryString("ass_id") = "" Or Request.QueryString("sub_id") = "" Then
                Response.Redirect("../Result.aspx?msg=ไม่พบข้อมูล&user=Student")
            End If
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
                                Response.Redirect("../Result.aspx?msg=คุณไม่ได้ลงทะเบียนในวิชานี้&user=Student")
                            End If
                        Else
                            Response.Redirect("../Result.aspx?msg=คุณไม่ได้ลงทะเบียนในวิชานี้&user=Student")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    '*************************
                    Dim number As String = ""
                    Dim datestart(2) As String
                    Dim dateend(2) As String
                    Dim mydate As String = Today
                    Dim last As String = ""
                    Dim getmydate(2) As String
                    getmydate = mydate.Split("/")
                    '-------
                    QueryStr = "select * from Assignment where ass_id = '" & Request.QueryString("ass_id") & "'"
                    TableStr = "getassignment"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                number = row("ass_number")
                                datestart = CStr(row("ass_datestart")).Split("/")
                                dateend = CStr(row("ass_dateend")).Split("/")
                                last = CStr(row("ass_dateend"))
                            Next
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    QueryStr = "select count(scr_score) as getscore from ScoreAssignment" & _
                        " where std_id = '" & Session("user") & "' and ass_id = '" & Request.QueryString("ass_id") & "'"
                    TableStr = "gettypescore"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                If Val(row("getscore")) = 0 Then
                                    '+++++++++++++++++ check date to testing
                                    Dim tmp1 As Boolean = False
                                    Dim tmp2 As Boolean = False
                                    If Val(getmydate(2)) > Val(datestart(2)) Then
                                        tmp1 = True
                                    ElseIf Val(getmydate(2)) = Val(datestart(2)) Then
                                        If Val(getmydate(1)) > Val(datestart(1)) Then
                                            tmp1 = True
                                        ElseIf Val(getmydate(1)) = Val(datestart(1)) Then
                                            If Val(getmydate(0)) > Val(datestart(0)) Then
                                                tmp1 = True
                                            ElseIf Val(getmydate(0)) = Val(datestart(0)) Then
                                                tmp2 = True
                                            Else
                                                Response.Redirect("../Result.aspx?msg=ตอนนี้ยังไม่ถึงกำหนดการของการมอบหมายงาน Assignment&user=Student")
                                            End If
                                        Else
                                            Response.Redirect("../Result.aspx?msg=ตอนนี้ยังไม่ถึงกำหนดการของการมอบหมายงาน Assignment&user=Student")
                                        End If
                                    Else
                                        Response.Redirect("../Result.aspx?msg=ตอนนี้ยังไม่ถึงกำหนดการของการมอบหมายงาน Assignment&user=Student")
                                    End If
                                    If tmp1 = True Then
                                        If Val(getmydate(2)) > Val(dateend(2)) Then
                                            Response.Redirect("../Result.aspx?msg=ได้ทำการปิดการส่งงานนี้แล้ว&user=Student")
                                        ElseIf Val(getmydate(2)) = Val(dateend(2)) Then
                                            If Val(getmydate(1)) > Val(dateend(1)) Then
                                                Response.Redirect("../Result.aspx?msg=ได้ทำการปิดการส่งงานนี้แล้ว&user=Student")
                                            ElseIf Val(getmydate(1)) = Val(dateend(1)) Then
                                                If Val(getmydate(0)) > Val(dateend(0)) Then
                                                    Response.Redirect("../Result.aspx?msg=ได้ทำการปิดการส่งงานนี้แล้ว&user=Student")
                                                ElseIf Val(getmydate(0)) = Val(dateend(0)) Then
                                                    tmp2 = True
                                                Else
                                                    tmp2 = True
                                                End If
                                            Else
                                                tmp2 = True
                                            End If
                                        Else
                                            tmp2 = True
                                        End If
                                    End If
                                    '++++++++++++++++++++++++++++
                                    If tmp2 = False Then
                                        Response.Redirect("../Result.aspx?msg=ขณะนี้ไม่ใช่ช่วงวันและเวลาของการมอบหมายงานหรือส่งงานครั้งที่ " & number & "&user=Student")
                                    End If
                                    '------------------------------------ Set Learning
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

                                    QueryStr = "select sub_name from Subject where sub_id = '" & Request.QueryString("sub_id") & "'"
                                    TableStr = "gettopic"
                                    If FillCommQ(QueryStr, TableStr) = True Then
                                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                                            For Each roww As DataRow In sqlDS.Tables(TableStr).Rows
                                                topic = "Assignment ครั้งที่ " & number & " วิชา " & CStr(roww("sub_name"))
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
                                            For Each rowww As DataRow In sqlDS.Tables(TableStr).Rows
                                                calid = rowww("cal_id")
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
                                    '****************************
                                    title.Text = topic & "<br />" & "ส่งได้ไม่เกิน " & last
                                    '****************************
                                ElseIf Val(row("getscore")) = 1 Then
                                    Response.Redirect("../Result.aspx?msg=Assignment ครั้งที่ " & number & " ผู้สอนได้ให้คะแนนสำหรับงานของคุณแล้ว&user=Student")
                                Else
                                    Response.Redirect("../DBFailed.aspx")
                                End If
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

    Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        Dim status As Boolean = False
        Dim objfile As New FileInfo(Server.MapPath("~") & "\AssignmentFileOfStudent\" & Path.GetFileName(AssFile.PostedFile.FileName.Trim()))
        If (AssFile.PostedFile.FileName <> "" And AssFile.PostedFile.FileName.Trim().Length > 0 And AssFile.PostedFile.ContentLength > 0 And AssFile.PostedFile.ContentLength <= 400000000) Then
            If objfile.Exists Then
                warning.Text = "กรุณาเปลี่ยนชื่อไฟล์"
                Exit Sub
            Else
                status = True
            End If
        Else
            status = False
            warning.Text = "กรุณาเลือกไฟล์สำหรับส่งงาน Assignment"
            Exit Sub
        End If

        If status = True Then
            AssFile.PostedFile.SaveAs(Server.MapPath("~") & "\AssignmentFileOfStudent\" & Path.GetFileName(AssFile.PostedFile.FileName.Trim()))
            QueryStr = "insert into AssignmentStudentFile(ass_id,std_id,asf_file,asf_path) values('" & _
                Request.QueryString("ass_id") & "','" & Session("user") & "','" & _
                Path.GetFileName(AssFile.PostedFile.FileName.Trim()) & "','" & _
                "AssignmentFileOfStudent/" & Path.GetFileName(AssFile.PostedFile.FileName.Trim()) & "')"
            If ExecuteComm(QueryStr) = True Then
                Response.Redirect("../Result.aspx?msg=การส่งงาน Assignment เสร็จเรียบร้อยแล้ว&action=close")
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        End If
    End Sub
End Class
