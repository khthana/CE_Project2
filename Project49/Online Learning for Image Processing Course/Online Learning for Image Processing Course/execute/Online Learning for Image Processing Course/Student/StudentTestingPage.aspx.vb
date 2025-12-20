Imports System.Data
Imports System.Data.SqlClient

Partial Class Student_StudentTestingPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack Then
            If Session("loginstatus") = True And Session("user") <> 0 Then
                If Session("usertype") = "Student" Then
                    If hold.Visible = True Then
                        Dim tablename As String = ""
                        Dim field As String = ""
                        Dim typeid As String = ""
                        typeid = Request.QueryString("typeid")
                        If Request.QueryString("type") = "" Then
                            Response.Redirect("../Result.aspx?msg=ไม่พบข้อมูล&user=Student")
                        ElseIf Request.QueryString("type") = "Module" Then
                            tablename = "Module"
                            field = "mod_id"
                        ElseIf Request.QueryString("type") = "Assignment" Then
                            tablename = "Assignment"
                            field = "ass_id"
                        ElseIf Request.QueryString("type") = "Examination" Then
                            tablename = "Examination"
                            field = "exm_id"
                        Else
                            Response.Redirect("../Result.aspx?msg=ไม่พบข้อมูล&user=Student")
                        End If
                        CreateTesting(tablename, field, typeid)
                    End If
                End If
            End If
        Else
            If Request.QueryString("typeid") = "" Or Request.QueryString("sub_id") = "" Or Request.QueryString("type") = "" Then
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
                    Dim tablename As String = ""
                    Dim field As String = ""
                    Dim typeid As String = ""
                    Dim subid As String = ""
                    Dim time As String = ""
                    Dim number As String = ""
                    Dim datestart(2) As String
                    Dim dateend(2) As String
                    Dim thai As String = ""
                    Dim prefix As String = ""
                    'Dim mydate As String = Today
                    Dim mydate As Date = System.DateTime.Now.ToLongDateString
                    Dim my_date As String = mydate
                    Dim getmydate(2) As String
                    getmydate = my_date.Split("/")
                    '-------
                    typeid = Request.QueryString("typeid")
                    subid = Request.QueryString("sub_id")
                    If Request.QueryString("type") = "" Then
                        Response.Redirect("../Result.aspx?msg=ไม่พบข้อมูล&user=Student")
                    ElseIf Request.QueryString("type") = "Module" Then
                        tablename = "Module"
                        field = "mod_id"
                        prefix = "mod_"
                        thai = "การทดสอบประจำบทเรียน"
                    ElseIf Request.QueryString("type") = "Assignment" Then
                        tablename = "Assignment"
                        field = "ass_id"
                        prefix = "ass_"
                        thai = "การทดสอบเก็บคะแนน"
                    ElseIf Request.QueryString("type") = "Examination" Then
                        tablename = "Examination"
                        field = "exm_id"
                        prefix = "exm_"
                        thai = "การทดสอบปลายภาค"
                    Else
                        Response.Redirect("../Result.aspx?msg=ไม่พบข้อมูล&user=Student")
                    End If
                    QueryStr = "select * from " & tablename & " where " & field & " = '" & typeid & "' and sub_id = '" & subid & "'"
                    TableStr = "gettypedetail"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                time = row(prefix & "time")
                                number = row(prefix & "number")
                                datestart = CStr(row(prefix & "datestart")).Split("/")
                                dateend = CStr(row(prefix & "dateend")).Split("/")
                            Next
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    QueryStr = "select count(scr_score) as getscore from Score" & tablename & _
                        " where std_id = '" & Session("user") & "' and " & field & " = '" & typeid & "'"
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
                                                Response.Redirect("../Result.aspx?msg=ตอนนี้ยังไม่ถึงกำหนดการที่จะทำการทดสอบ&user=Student")
                                            End If
                                        Else
                                            Response.Redirect("../Result.aspx?msg=ตอนนี้ยังไม่ถึงกำหนดการที่จะทำการทดสอบ&user=Student")
                                        End If
                                    Else
                                        Response.Redirect("../Result.aspx?msg=ตอนนี้ยังไม่ถึงกำหนดการที่จะทำการทดสอบ&user=Student")
                                    End If
                                    If tmp1 = True Then
                                        If Val(getmydate(2)) > Val(dateend(2)) Then
                                            Response.Redirect("../Result.aspx?msg=ได้ทำการปิดการทดสอบนี้แล้ว&user=Student")
                                        ElseIf Val(getmydate(2)) = Val(dateend(2)) Then
                                            If Val(getmydate(1)) > Val(dateend(1)) Then
                                                Response.Redirect("../Result.aspx?msg=ได้ทำการปิดการทดสอบนี้แล้ว&user=Student")
                                            ElseIf Val(getmydate(1)) = Val(dateend(1)) Then
                                                If Val(getmydate(0)) > Val(dateend(0)) Then
                                                    Response.Redirect("../Result.aspx?msg=ได้ทำการปิดการทดสอบนี้แล้ว&user=Student")
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
                                        Response.Redirect("../Result.aspx?msg=ขณะนี้ไม่ใช่ช่วงวันและเวลาของ" & thai & "ครั้งที่ " & number & "&user=Student")
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
                                                topic = thai & "ครั้งที่ " & number & " วิชา " & CStr(roww("sub_name"))
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
                                    title.Text = thai & " ครั้งที่ " & number & "<br />" & "คุณมีเวลาในการทำข้อสอบ " & _
                                        time & " ชั่วโมง" & "<br />" & "เมื่อคุณพร้อมแล้วให้กดปุ่ม """"เริ่มทำข้อสอบ"""" "
                                    '****************************
                                ElseIf Val(row("getscore")) = 1 Then
                                    Response.Redirect("../Result.aspx?msg=คุณได้ทำ" & thai & " ในครั้งที่ " & number & " แล้ว&user=Student")
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

    Protected Sub StartTesting_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles StartTesting.Click
        If Request.QueryString("typeid") = "" Or Request.QueryString("sub_id") = "" Or Request.QueryString("type") = "" Then
            Response.Redirect("../Result.aspx?msg=ไม่พบข้อมูล&user=Student")
        End If
        Dim tablename As String = ""
        Dim field As String = ""
        Dim typeid As String = ""
        Dim subid As String = ""
        Dim time As String = ""
        Dim prefix As String = ""
        typeid = Request.QueryString("typeid")
        subid = Request.QueryString("sub_id")
        If Request.QueryString("type") = "" Then
            Response.Redirect("../Result.aspx?msg=ไม่พบข้อมูล&user=Student")
        ElseIf Request.QueryString("type") = "Module" Then
            tablename = "Module"
            field = "mod_id"
            prefix = "mod_"
        ElseIf Request.QueryString("type") = "Assignment" Then
            tablename = "Assignment"
            field = "ass_id"
            prefix = "ass_"
        ElseIf Request.QueryString("type") = "Examination" Then
            tablename = "Examination"
            field = "exm_id"
            prefix = "exm_"
        Else
            Response.Redirect("../Result.aspx?msg=ไม่พบข้อมูล&user=Student")
        End If
        QueryStr = "select * from " & tablename & " where " & field & " = '" & typeid & "' and sub_id = '" & subid & "'"
        TableStr = "gettypedetail"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    time = row(prefix & "time")
                Next
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
        CreateTesting(tablename, field, typeid)
        hold.Visible = True
        submit.Visible = True
        StartTesting.Visible = False
        CloseConn()
        QueryStr = "insert into Score" & tablename & "(" & field & ",std_id,scr_score) values('" & _
            typeid & "','" & Session("user") & "','0')"
        If ExecuteComm(QueryStr) = False Then
            Response.Redirect("../DBFailed.aspx")
        End If
        'Dim mytime As Date = Now
        Dim mytime As Date = System.DateTime.Now.ToLongTimeString
        Dim myhour As Integer = Hour(mytime) + Val(time)
        Dim myminute As Integer = Minute(mytime)
        Dim mysecond As Integer = Second(mytime)
        Session("TestingEndTime") = CStr(myhour) & ":" & CStr(myminute) & ":" & CStr(mysecond)
        '--------------
        Session("Time") = Val(time)
        '--------------
        Dim temp As Integer = 0
        If myhour > 23 Then
            temp = myhour - 24
            showtime.Text = "คุณมีเวลาถึง " & temp & ":" & myminute & ":" & mysecond & ":" & " น."
        Else
            showtime.Text = "คุณมีเวลาถึง " & Session("TestingEndTime") & " น."
        End If

    End Sub

    Sub CreateTesting(ByVal tablename As String, ByVal field As String, ByVal typeid As String)
        'Try
        Dim i As Integer = 1
        Dim tmp As Boolean = False
        QueryStr = "select * from Question" & tablename & " where " & field & " = '" & typeid & "' order by qst_number"
        TableStr = "getquestion"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    Dim order As New Label
                    Dim question As New Label
                    Dim pic As New Image
                    order.ID = "Order" & i
                    order.Text = CStr(row("qst_number")) & ". "
                    question.ID = "Question" & i
                    question.Text = CStr(row("qst_question"))
                    pic.ID = "Picture" & i
                    If row("qst_picpath") Is DBNull.Value Then
                        tmp = False
                    Else
                        tmp = True
                        pic.ImageUrl = "~/" & CStr(row("qst_picpath"))
                    End If
                    Dim count As Integer = 0
                    QueryStr = "select * from Choice" & tablename & " where qst_id = '" & CStr(row("qst_id")) & "'"
                    TableStr = "getchoice"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                            For Each roww As DataRow In sqlDS.Tables(TableStr).Rows
                                If CStr(roww("chc_answer")) = True Then
                                    count = count + 1
                                End If
                            Next
                            Dim rl As New RadioButtonList
                            Dim ch As New CheckBoxList
                            If count > 1 Then
                                ch.ID = "Check" & i
                                ch.DataTextField = "chc_choice"
                                ch.DataValueField = "chc_answer"
                                ch.DataSource = sqlDS.Tables(TableStr)
                                ch.DataBind()
                            ElseIf count = 1 Then
                                rl.ID = "Radio" & i
                                rl.DataTextField = "chc_choice"
                                rl.DataValueField = "chc_answer"
                                rl.DataSource = sqlDS.Tables(TableStr)
                                rl.DataBind()
                            End If

                            hold.Controls.Add(order)
                            If tmp = True Then
                                hold.Controls.Add(pic)
                                hold.Controls.Add(GetLiteral("<br />"))
                            End If
                            hold.Controls.Add(question)
                            hold.Controls.Add(GetLiteral("<br />"))
                            hold.Controls.Add(GetLiteral("     "))
                            If count > 1 Then
                                hold.Controls.Add(ch)
                            ElseIf count = 1 Then
                                hold.Controls.Add(rl)
                            End If

                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    i = i + 1
                Next
            Else
                Response.Redirect("../Result.aspx?msg=การทดสอบนี้ยังไม่มีข้อสอบ&user=Student")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
        'Catch ex As Exception
        '    Response.Redirect("../Result.aspx?msg=พบปัญหาที่ฟังก์ชัน CreateTesting ของ StudentTestingPage.aspx")
        '    Exit Sub
        'End Try
    End Sub

    Function GetLiteral(ByVal text As String)
        Try
            Dim rv As Literal
            rv = New Literal
            rv.Text = text
            GetLiteral = rv
        Catch ex As Exception
            GetLiteral = "<br />"
        End Try
    End Function

    Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        Dim score As Double = 0.0
        Dim sum As Double = 0.0
        Dim arr(0) As String
        Dim size As Integer = 0
        Dim i As Integer = 0
        Dim tablename As String = ""
        Dim field As String = ""
        Dim typeid As String = ""
        Dim subid As String = ""
        Dim prefix As String = ""
        Dim result As String = ""
        If Request.QueryString("typeid") = "" Or Request.QueryString("sub_id") = "" Or Request.QueryString("type") = "" Then
            Response.Redirect("../Result.aspx?msg=ไม่พบข้อมูล&user=Student")
        End If
        '--------------------- check session
        'Dim mytime As Date = Now
        Dim mytime As Date = System.DateTime.Now.ToLongTimeString
        Dim myhour As Integer = Hour(mytime)
        Dim myminute As Integer = Minute(mytime)
        Dim mysecond As Integer = Second(mytime)
        Dim endtime(2) As String

        '-------------
        Dim t As Integer = Session("Time")
        '-------------

        endtime = CStr(Session("TestingEndTime")).Split(":")
        Session.Remove("TestingEndTime")

        '-------------
        Session.Remove("Time")
        '-------------

        '-------------
        Dim originalTime As Integer = Val(endtime(0)) - t
        If originalTime > myhour Then
            myhour = myhour + 24
            If myhour > Val(endtime(0)) Then
                Response.Redirect("../Result.aspx?msg=คุณได้ทำข้อสอบเกินเวลา คุณจะได้คะแนนในการทดสอบครั้งนี้เป็นศูนย์&user=Student")
            Else
            End If
        Else
        End If
        '-------------

        If myhour > Val(endtime(0)) Then
            Response.Redirect("../Result.aspx?msg=คุณได้ทำข้อสอบเกินเวลา คุณจะได้คะแนนในการทดสอบครั้งนี้เป็นศูนย์&user=Student")
        ElseIf myhour = Val(endtime(0)) Then
            If myminute > Val(endtime(1)) Then
                Response.Redirect("../Result.aspx?msg=คุณได้ทำข้อสอบเกินเวลา คุณจะได้คะแนนในการทดสอบครั้งนี้เป็นศูนย์&user=Student")
            ElseIf myminute = Val(endtime(1)) Then
                If mysecond > Val(endtime(2)) Then
                    Response.Redirect("../Result.aspx?msg=คุณได้ทำข้อสอบเกินเวลา คุณจะได้คะแนนในการทดสอบครั้งนี้เป็นศูนย์&user=Student")
                Else
                End If
            Else
            End If
        Else
        End If
        '---------------------
        typeid = Request.QueryString("typeid")
        subid = Request.QueryString("sub_id")
        If Request.QueryString("type") = "" Then
            Response.Redirect("../Result.aspx?msg=ไม่พบข้อมูล&user=Student")
        ElseIf Request.QueryString("type") = "Module" Then
            tablename = "Module"
            field = "mod_id"
            prefix = "mod_"
        ElseIf Request.QueryString("type") = "Assignment" Then
            tablename = "Assignment"
            field = "ass_id"
            prefix = "ass_"
        ElseIf Request.QueryString("type") = "Examination" Then
            tablename = "Examination"
            field = "exm_id"
            prefix = "exm_"
        Else
            Response.Redirect("../Result.aspx?msg=ไม่พบข้อมูล&user=Student")
        End If
        QueryStr = "select qst_score from Question" & tablename & " where " & field & " = '" & typeid & "'"
        TableStr = "getscore"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                size = sqlDS.Tables(TableStr).Rows.Count
                ReDim Preserve arr(size - 1)
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    arr(i) = row("qst_score")
                    sum = sum + Val(row("qst_score"))
                    i = i + 1
                Next
                score = GetScore(size, arr, sum)
                QueryStr = "select " & prefix & "wscore from " & tablename & " where " & field & " = '" & typeid & "'"
                TableStr = "getwscore"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            score = Val(row(prefix & "wscore")) * score
                            result = String.Format("{0:n2}", score)
                        Next
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
        CloseConn()
        QueryStr = "update Score" & tablename & " set scr_score = '" & result & "' where std_id = '" & _
            Session("user") & "' and " & field & " = '" & typeid & "'"
        If ExecuteComm(QueryStr) = False Then
            Response.Redirect("../DBFailed.aspx")
        End If

        '------------------------------------------------------------------ Grade
        Dim scoreM As Double = 0.0
        Dim scoreA As Double = 0.0
        Dim scoreE As Double = 0.0
        Dim SummaryScore As Double = 0.0
        Dim grade As String = ""
        If Request.QueryString("type") = "Examination" Then
            '******* Module
            QueryStr = "select scr_score from ScoreModule where std_id = '" & Session("user") & "'" & _
                " and mod_id in (select mod_id from Module where mod_year = (select max(cal_year) from LearningCalendar)" & _
                " and mod_term = (select max(cal_term) from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar))" & _
                " and sub_id = '" & subid & "')"
            TableStr = "getscoremodule"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        scoreM = scoreM + Val(row("scr_score"))
                    Next
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
            '******* Assignment
            QueryStr = "select scr_score from ScoreAssignment where std_id = '" & Session("user") & "'" & _
                " and ass_id in (select ass_id from Assignment where ass_year = (select max(cal_year) from LearningCalendar)" & _
                " and ass_term = (select max(cal_term) from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar))" & _
                " and sub_id = '" & subid & "')"
            TableStr = "getscoreassignment"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        scoreA = scoreA + Val(row("scr_score"))
                    Next
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
            '******* Examination
            QueryStr = "select scr_score from ScoreExamination where std_id = '" & Session("user") & "'" & _
                " and exm_id in (select exm_id from Examination where exm_year = (select max(cal_year) from LearningCalendar)" & _
                " and exm_term = (select max(cal_term) from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar))" & _
                " and sub_id = '" & subid & "')"
            TableStr = "getscoreexamination"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        scoreE = scoreE + Val(row("scr_score"))
                    Next
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If

            SummaryScore = scoreM + scoreA + scoreE

            '******* Module full score
            scoreM = 0
            QueryStr = "select mod_wscore from Module where" & _
                " mod_id in (select mod_id from Module where mod_year = (select max(cal_year) from LearningCalendar)" & _
                " and mod_term = (select max(cal_term) from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar))" & _
                " and sub_id = '" & subid & "')"
            TableStr = "getwscoremodule"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        scoreM = scoreM + Val(row("mod_wscore"))
                    Next
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If

            '******* Assignment full score
            scoreA = 0
            QueryStr = "select ass_wscore from Assignment where" & _
                " ass_id in (select ass_id from Assignment where ass_year = (select max(cal_year) from LearningCalendar)" & _
                " and ass_term = (select max(cal_term) from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar))" & _
                " and sub_id = '" & subid & "')"
            TableStr = "getwscoreassignment"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        scoreA = scoreA + Val(row("ass_wscore"))
                    Next
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If

            '******* Examination full score
            scoreE = 0
            QueryStr = "select exm_wscore from Examination where" & _
                " exm_id in (select exm_id from Examination where exm_year = (select max(cal_year) from LearningCalendar)" & _
                " and exm_term = (select max(cal_term) from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar))" & _
                " and sub_id = '" & subid & "')"
            TableStr = "getscoreexamination"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        scoreE = scoreE + Val(row("exm_wscore"))
                    Next
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
            Dim FullScore As Double = scoreM + scoreA + scoreE
            SummaryScore = (100 * SummaryScore) / FullScore

            '-------------------------------------------------- Grade Level
            'QueryStr = "select * from GradeLevel where sub_id = '" & subid & "'" & _
            '    " and gl_year = (select max(cal_year) from LearningCalendar)" & _
            '    " and gl_term = (select max(cal_term) from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar))"
            'TableStr = "getgradelevel"
            'If FillCommQ(QueryStr, TableStr) = True Then
            '    If sqlDS.Tables(TableStr).Rows.Count = 1 Then
            '        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
            '            If SummaryScore >= Val(row("gl_a")) Then
            '                grade = "A"
            '            ElseIf SummaryScore >= Val(row("gl_bp")) Then
            '                grade = "B+"
            '            ElseIf SummaryScore >= Val(row("gl_b")) Then
            '                grade = "B"
            '            ElseIf SummaryScore >= Val(row("gl_cp")) Then
            '                grade = "C+"
            '            ElseIf SummaryScore >= Val(row("gl_c")) Then
            '                grade = "C"
            '            ElseIf SummaryScore >= Val(row("gl_dp")) Then
            '                grade = "D+"
            '            ElseIf SummaryScore >= Val(row("gl_d")) Then
            '                grade = "D"
            '            ElseIf SummaryScore < Val(row("gl_f")) Then
            '                grade = "F"
            '            Else
            '                grade = "F"
            '            End If
            '        Next
            '    ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
            '        If SummaryScore >= 90 Then
            '            grade = "A"
            '        ElseIf SummaryScore >= 80 Then
            '            grade = "B+"
            '        ElseIf SummaryScore >= 70 Then
            '            grade = "B"
            '        ElseIf SummaryScore >= 60 Then
            '            grade = "C+"
            '        ElseIf SummaryScore >= 50 Then
            '            grade = "C"
            '        ElseIf SummaryScore >= 40 Then
            '            grade = "D+"
            '        ElseIf SummaryScore >= 30 Then
            '            grade = "D"
            '        Else
            '            grade = "F"
            '        End If
            '    Else
            '        Response.Redirect("../DBFailed.aspx")
            '    End If
            'Else
            '    Response.Redirect("../DBFailed.aspx")
            'End If
            '--------------------------------------------------
            
            Dim regid As String = ""
            QueryStr = "select reg_id from Result where sub_id = '" & subid & "' and reg_id = (" & _
                "select reg_id from Register where std_id = '" & Session("user") & "'" & _
                " and reg_year = (select max(reg_year) from Register)" & _
                " and reg_term = (select max(reg_term) from Register" & _
                " where reg_year = (select max(reg_year) from register)))"
            TableStr = "getregid"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        regid = row("reg_id")
                    Next
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
            CloseConn()
            QueryStr = "update Result set res_score = '" & SummaryScore & "' where sub_id = '" & subid & "'" & _
                " and reg_id = '" & regid & "'"
            If ExecuteComm(QueryStr) = True Then
                'If grade = "B+" Then
                '    grade = "B Plus"
                'ElseIf grade = "C+" Then
                '    grade = "C Plus"
                'ElseIf grade = "D+" Then
                '    grade = "D Plus"
                'End If
                Response.Redirect("../Result.aspx?msg=คุณได้คะแนนในการสอบปลายภาคนี้เท่ากับ " & result & " และคะแนนรวมคิดเป็นเปอร์เซ็นต์ได้เท่ากับ " & SummaryScore & "&user=Student")
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณได้คะแนนในการสอบครั้งนี้เท่ากับ " & result & "&user=Student")
        End If
        '----------------------------------------------------------------------------
    End Sub

    Function GetScore(ByVal size As Integer, ByVal ArrScore As Array, ByVal sum As Double) As Double
        Dim score As Double = 0.0
        Dim i As Integer = 0
        Dim j As Integer = 0

        Dim gettrue As Double = 0.0
        Dim getanswer As Double = 0.0

        For i = 1 To size
            Dim ra As String = "Radio" & i
            Dim ch As String = "Check" & i
            Dim getradio As RadioButtonList = CType(Me.FindControl(ra), RadioButtonList)
            Dim getcheck As CheckBoxList = CType(Me.FindControl(ch), CheckBoxList)
            If IsNothing(getradio) Then
            Else
                If getradio.Text = "" Then
                Else
                    If getradio.SelectedItem.Value = True Then
                        score = score + ArrScore(i - 1)
                    End If
                End If
            End If
            If IsNothing(getcheck) Then
            Else
                For j = 0 To getcheck.Items.Count - 1
                    If getcheck.Items(j).Value = True Then
                        gettrue = gettrue + 1
                    End If
                    If getcheck.Items(j).Selected Then
                        If getcheck.Items(j).Value = True Then
                            getanswer = getanswer + 1
                        End If
                    End If
                Next
                score = score + ((ArrScore(i - 1) / gettrue) * getanswer)
            End If
        Next
        score = score / sum
        Return score
    End Function
End Class
