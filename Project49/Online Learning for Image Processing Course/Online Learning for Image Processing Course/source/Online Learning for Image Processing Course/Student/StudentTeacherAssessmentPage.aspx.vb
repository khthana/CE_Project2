Imports System.Data
Imports System.Data.SqlClient

Partial Class Student_StudentTeacherAssessmentPage
    Inherits System.Web.UI.Page

    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    '    If Session("loginstatus") = True And Session("user") <> 0 Then
    '        If Session("usertype") = "Student" Then
    '            If Not Page.IsPostBack Then
    '                '************************* Register Check
    '                QueryStr = "select sub_id from result where reg_id = (select reg_id from register " & _
    '                    "where reg_year = (select max(reg_year) from register) and reg_term = " & _
    '                    "(select max(reg_term) from register where reg_year = (select max(reg_year) " & _
    '                    "from register)) and std_id = '" & Session("user") & "') order by sub_id"
    '                TableStr = "checking"
    '                If FillCommQ(QueryStr, TableStr) = True Then
    '                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
    '                        Dim tmp As Boolean = False
    '                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
    '                            If row("sub_id") = Request.QueryString("sub_id") Then
    '                                tmp = True
    '                                Exit For
    '                            Else
    '                                tmp = False
    '                            End If
    '                        Next
    '                        If tmp = False Then
    '                            Response.Redirect("../Result.aspx?msg=คุณไม่ได้ลงทะเบียนในวิชานี้&action=close")
    '                        Else
    '                            QueryStr = "select * from AssessmentPoint where std_id = '" & Session("user") & _
    '                                "' and sub_id = '" & Request.QueryString("sub_id") & "' and p_year = (select max(cal_year) from LearningCalendar)" & _
    '                                " and p_term = (select max(cal_term) from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar))"
    '                            TableStr = "getstatus"
    '                            If FillCommQ(QueryStr, TableStr) = True Then
    '                                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
    '                                    Response.Redirect("../Result.aspx?msg=คุณได้ทำการประเมินผู้สอนในวิชานี้แล้ว&user=Student")
    '                                ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
    '                                    CreateForm()
    '                                Else
    '                                    Response.Redirect("../DBFailed.aspx")
    '                                End If
    '                            Else
    '                                Response.Redirect("../DBFailed.aspx")
    '                            End If
    '                        End If
    '                    Else
    '                        Response.Redirect("../Result.aspx?msg=คุณไม่ได้ลงทะเบียนในวิชานี้&action=close")
    '                    End If
    '                Else
    '                    Response.Redirect("../DBFailed.aspx")
    '                End If
    '                '*************************    
    '            Else
    '                CreateForm()
    '            End If
    '        Else
    '            Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้เรียน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
    '        End If
    '    Else
    '        Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
    '    End If
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Student" Then
                If Not Page.IsPostBack Then
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
                            Else
                                '------------------------------------- เช็ค การประเมินผู้สอน ว่าผู้เรียนได้ทำการประเมินแล้วหรือยัง
                                Dim ResAssess As String = ""
                                QueryStr = "select res_assess from Result" & _
                                    " where reg_id = (select reg_id from register where std_id = '" & Session("user") & "'" & _
                                    " and reg_year = (select max(cal_year) from Learningcalendar)" & _
                                    " and reg_term = (select max(cal_term) from Learningcalendar" & _
                                    " where cal_year = (select max(cal_year) from Learningcalendar)))" & _
                                    " and sub_id = '" & Request.QueryString("sub_id") & "'"
                                TableStr = "getstatus"
                                If FillCommQ(QueryStr, TableStr) = True Then
                                    If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                            If row("res_assess") = True Then
                                                ResAssess = "1"
                                            Else
                                                ResAssess = "0"
                                            End If
                                        Next
                                        If ResAssess = "1" Then
                                            Response.Redirect("../Result.aspx?msg=คุณได้ทำการประเมินผู้สอนในวิชานี้แล้ว&user=Student")
                                        ElseIf ResAssess = "0" Then
                                            CreateForm()
                                        Else
                                            Response.Redirect("../DBFailed.aspx")
                                        End If
                                    Else
                                        Response.Redirect("../DBFailed.aspx")
                                    End If
                                Else
                                    Response.Redirect("../DBFailed.aspx")
                                End If
                                '-------------------------------------------------------
                            End If
                        Else
                            Response.Redirect("../Result.aspx?msg=คุณไม่ได้ลงทะเบียนในวิชานี้&action=close")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    '*************************    
                Else
                    CreateForm()
                End If
            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้เรียน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If
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

    Sub CreateForm()
        Try
            Dim i As Integer = 1
            QueryStr = "select * from AssessmentTopic"
            TableStr = "getassessmenttopic"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        Dim topic As New Label
                        Dim radio As New RadioButtonList
                        topic.ID = "Olabel" & i
                        topic.Text = i & ". " & row("assess_topic")
                        topic.Width = "300"
                        radio.ID = "Radio" & i
                        radio.TextAlign = TextAlign.Left
                        radio.RepeatDirection = RepeatDirection.Horizontal
                        radio.Items.Add(5)
                        radio.Items.Add(4)
                        radio.Items.Add(3)
                        radio.Items.Add(2)
                        radio.Items.Add(1)
                        radio.Items.Add(9)
                        holder.Controls.Add(topic)
                        holder.Controls.Add(radio)
                        holder.Controls.Add(GetLiteral("<br />"))
                        i = i + 1
                    Next
                ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                    Response.Redirect("../Result.aspx?msg=ยังไม่มีแบบฟอร์มการประเมินผู้สอน&user=Student")
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Catch ex As Exception
            warning.Text = "พบปัญหาที่ฟังก์ชัน CreateForm" & "<br />" & ex.Message
            Exit Sub
        End Try
    End Sub

    Function GetData(ByVal size As Integer, ByVal ArrData As Array) As Array
        Dim i As Integer
        Dim temp(10) As String
        For i = 1 To size
            Dim r As String = "radio" & i
            Dim getradio As RadioButtonList = CType(Me.FindControl(r), RadioButtonList)
            If IsNothing(getradio) Then
                warning.Text = "เกิดข้อผิดพลาด ไม่พบ RadioButtonList"
            Else
                If getradio.Text = "" Then
                    warning.Text = "กรุณาเลือกคะแนนในข้อที่ " & i
                    temp(10) = "0123456789"
                    Return temp
                Else
                    ArrData(i - 1) = getradio.SelectedItem.Text
                End If
            End If
        Next
        Return ArrData
    End Function

    'Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
    '    warning.Text = ""
    '    Dim year As Integer = 0
    '    Dim term As Integer = 0
    '    Dim ArrData(0) As String
    '    Dim ArrID(0) As Integer
    '    Dim size As Integer = 0
    '    Dim i As Integer = 0
    '    QueryStr = "select * from AssessmentTopic"
    '    TableStr = "gettopicassessment"
    '    If FillCommQ(QueryStr, TableStr) = True Then
    '        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
    '            size = sqlDS.Tables(TableStr).Rows.Count
    '            ReDim ArrData(size - 1)
    '            ReDim ArrID(size - 1)
    '            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
    '                ArrID(i) = Val(row("assess_id"))
    '                i = i + 1
    '            Next
    '            If GetData(size, ArrData).Length = 11 Then
    '                Exit Sub
    '            Else
    '                ArrData = GetData(size, ArrData)
    '            End If

    '            QueryStr = "select cal_year,cal_term from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar) and cal_term = (select max(cal_term) from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar))"
    '            TableStr = "getyearterm"
    '            If FillCommQ(QueryStr, TableStr) = True Then
    '                If sqlDS.Tables(TableStr).Rows.Count = 1 Then
    '                    For Each roww As DataRow In sqlDS.Tables(TableStr).Rows
    '                        year = roww("cal_year")
    '                        term = roww("cal_term")
    '                    Next
    '                ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
    '                    warning.Text = "ยังไม่มีการกำหนดปฏิทินการศึกษา"
    '                    Exit Sub
    '                End If
    '            Else
    '                Response.Redirect("../DBFailed.aspx")
    '            End If
    '            CloseConn()
    '            For i = 1 To size
    '                If ArrData(i - 1) = "5" Then
    '                    QueryStr = "insert into AssessmentPoint(sub_id,tch_id,assess_id,std_id,p_year,p_term,p_5,p_4,p_3,p_2,p_1,p_9) values('" & _
    '                        Request.QueryString("sub_id") & "','" & Request.QueryString("tch_id") & "','" & ArrID(i - 1) & "','" & Session("user") & _
    '                        "','" & year & "','" & term & "','1','0','0','0','0','0')"
    '                    If ExecuteComm(QueryStr) = False Then
    '                        Response.Redirect("../DBFailed.aspx")
    '                    End If
    '                ElseIf ArrData(i - 1) = "4" Then
    '                    QueryStr = "insert into AssessmentPoint(sub_id,tch_id,assess_id,std_id,p_year,p_term,p_5,p_4,p_3,p_2,p_1,p_9) values('" & _
    '                        Request.QueryString("sub_id") & "','" & Request.QueryString("tch_id") & "','" & ArrID(i - 1) & "','" & Session("user") & _
    '                        "','" & year & "','" & term & "','0','1','0','0','0','0')"
    '                    If ExecuteComm(QueryStr) = False Then
    '                        Response.Redirect("../DBFailed.aspx")
    '                    End If
    '                ElseIf ArrData(i - 1) = "3" Then
    '                    QueryStr = "insert into AssessmentPoint(sub_id,tch_id,assess_id,std_id,p_year,p_term,p_5,p_4,p_3,p_2,p_1,p_9) values('" & _
    '                        Request.QueryString("sub_id") & "','" & Request.QueryString("tch_id") & "','" & ArrID(i - 1) & "','" & Session("user") & _
    '                        "','" & year & "','" & term & "','0','0','1','0','0','0')"
    '                    If ExecuteComm(QueryStr) = False Then
    '                        Response.Redirect("../DBFailed.aspx")
    '                    End If
    '                ElseIf ArrData(i - 1) = "2" Then
    '                    QueryStr = "insert into AssessmentPoint(sub_id,tch_id,assess_id,std_id,p_year,p_term,p_5,p_4,p_3,p_2,p_1,p_9) values('" & _
    '                        Request.QueryString("sub_id") & "','" & Request.QueryString("tch_id") & "','" & ArrID(i - 1) & "','" & Session("user") & _
    '                        "','" & year & "','" & term & "','0','0','0','1','0','0')"
    '                    If ExecuteComm(QueryStr) = False Then
    '                        Response.Redirect("../DBFailed.aspx")
    '                    End If
    '                ElseIf ArrData(i - 1) = "1" Then
    '                    QueryStr = "insert into AssessmentPoint(sub_id,tch_id,assess_id,std_id,p_year,p_term,p_5,p_4,p_3,p_2,p_1,p_9) values('" & _
    '                        Request.QueryString("sub_id") & "','" & Request.QueryString("tch_id") & "','" & ArrID(i - 1) & "','" & Session("user") & _
    '                        "','" & year & "','" & term & "','0','0','0','0','1','0')"
    '                    If ExecuteComm(QueryStr) = False Then
    '                        Response.Redirect("../DBFailed.aspx")
    '                    End If
    '                ElseIf ArrData(i - 1) = "9" Then
    '                    QueryStr = "insert into AssessmentPoint(sub_id,tch_id,assess_id,std_id,p_year,p_term,p_5,p_4,p_3,p_2,p_1,p_9) values('" & _
    '                        Request.QueryString("sub_id") & "','" & Request.QueryString("tch_id") & "','" & ArrID(i - 1) & "','" & Session("user") & _
    '                        "','" & year & "','" & term & "','0','0','0','0','0','1')"
    '                    If ExecuteComm(QueryStr) = False Then
    '                        Response.Redirect("../DBFailed.aspx")
    '                    End If
    '                End If
    '            Next
    '            Response.Redirect("../Result.aspx?msg=การประเมินผู้สอนเสร็จเรียบร้อยแล้ว&user=Student")
    '        ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
    '            warning.Text = "ยังไม่มีแบบฟอร์มของการประเมินผู้สอน"
    '            Exit Sub
    '        Else
    '            Response.Redirect("../DBFailed.aspx")
    '        End If
    '    Else
    '        Response.Redirect("../DBFailed.aspx")
    '    End If
    'End Sub

    Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        warning.Text = ""
        Dim status As Boolean = False
        Dim point As String = ""
        Dim score As Integer = 5
        Dim tmpScore As Integer = score
        Dim year As Integer = 0
        Dim term As Integer = 0
        Dim ArrData(0) As String
        Dim ArrID(0) As Integer
        Dim ArrPoint(0, 5) As Integer
        Dim size As Integer = 0
        Dim i As Integer = 0
        Dim j As Integer = 0
        QueryStr = "select * from AssessmentTopic"
        TableStr = "gettopicassessment"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                size = sqlDS.Tables(TableStr).Rows.Count
                ReDim ArrData(size - 1)
                ReDim ArrID(size - 1)
                ReDim ArrPoint(size - 1, 5)
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    ArrID(i) = Val(row("assess_id"))
                    i = i + 1
                Next
                If GetData(size, ArrData).Length = 11 Then
                    Exit Sub
                Else
                    ArrData = GetData(size, ArrData)
                End If
                '-------------------------------------- Get Year & Term
                QueryStr = "select cal_year,cal_term from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar) and cal_term = (select max(cal_term) from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar))"
                TableStr = "getyearterm"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            year = row("cal_year")
                            term = row("cal_term")
                        Next
                    ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                        warning.Text = "ยังไม่มีการกำหนดปฏิทินการศึกษา"
                        Exit Sub
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If

                '-------------------------------------- เอาค่า point ของคะแนนแต่ละค่าที่เก็บไว้มาใส่ใน array
                For i = 0 To size - 1
                    point = "p_5"
                    tmpScore = score
                    For j = 0 To score
                        QueryStr = "select " & point & " from AssessmentPoint where sub_id = '" & _
                            Request.QueryString("sub_id") & "'" & _
                            " and tch_id = '" & Request.QueryString("tch_id") & "'" & _
                            " and assess_id = '" & ArrID(i) & "'" & _
                            " and p_year = (select max(cal_year) from Learningcalendar)" & _
                            " and p_term = (select max(cal_term) from Learningcalendar" & _
                            " where cal_year = (select max(cal_year) from Learningcalendar))"
                        TableStr = "getpoint"
                        If FillCommQ(QueryStr, TableStr) = True Then
                            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                    'If row(point) = True Then
                                    '    ArrPoint(i, j) = 1
                                    'Else
                                    '    ArrPoint(i, j) = 0
                                    'End If
                                    ArrPoint(i, j) = Val(row(point))
                                    status = True
                                Next
                            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                                ArrPoint(i, j) = 0
                                status = False
                            Else
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                        tmpScore = tmpScore - 1
                        If tmpScore = 0 Then
                            tmpScore = 9
                        End If
                        point = "p_" & tmpScore
                    Next
                Next
                '----------------------------------------------------
                CloseConn()
                If status = True Then   '---------- แสดงว่ามีข้อมูลอยู่แล้ว ก็ให้ update
                    For i = 1 To size
                        If ArrData(i - 1) = "5" Then
                            QueryStr = "update AssessmentPoint set p_5 = '" & (ArrPoint(i - 1, 0) + 1) & "'" & _
                                " where sub_id = '" & Request.QueryString("sub_id") & "'" & _
                                " and tch_id = '" & Request.QueryString("tch_id") & "'" & _
                                " and assess_id = '" & ArrID(i - 1) & "'" & _
                                " and p_year = (select max(cal_year) from Learningcalendar)" & _
                                " and p_term = (select max(cal_term) from Learningcalendar" & _
                                " where cal_year = (select max(cal_year) from Learningcalendar))"
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        ElseIf ArrData(i - 1) = "4" Then
                            QueryStr = "update AssessmentPoint set p_4 = '" & (ArrPoint(i - 1, 1) + 1) & "'" & _
                                " where sub_id = '" & Request.QueryString("sub_id") & "'" & _
                                " and tch_id = '" & Request.QueryString("tch_id") & "'" & _
                                " and assess_id = '" & ArrID(i - 1) & "'" & _
                                " and p_year = (select max(cal_year) from Learningcalendar)" & _
                                " and p_term = (select max(cal_term) from Learningcalendar" & _
                                " where cal_year = (select max(cal_year) from Learningcalendar))"
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        ElseIf ArrData(i - 1) = "3" Then
                            QueryStr = "update AssessmentPoint set p_3 = '" & (ArrPoint(i - 1, 2) + 1) & "'" & _
                                " where sub_id = '" & Request.QueryString("sub_id") & "'" & _
                                " and tch_id = '" & Request.QueryString("tch_id") & "'" & _
                                " and assess_id = '" & ArrID(i - 1) & "'" & _
                                " and p_year = (select max(cal_year) from Learningcalendar)" & _
                                " and p_term = (select max(cal_term) from Learningcalendar" & _
                                " where cal_year = (select max(cal_year) from Learningcalendar))"
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        ElseIf ArrData(i - 1) = "2" Then
                            QueryStr = "update AssessmentPoint set p_2 = '" & (ArrPoint(i - 1, 3) + 1) & "'" & _
                                " where sub_id = '" & Request.QueryString("sub_id") & "'" & _
                                " and tch_id = '" & Request.QueryString("tch_id") & "'" & _
                                " and assess_id = '" & ArrID(i - 1) & "'" & _
                                " and p_year = (select max(cal_year) from Learningcalendar)" & _
                                " and p_term = (select max(cal_term) from Learningcalendar" & _
                                " where cal_year = (select max(cal_year) from Learningcalendar))"
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        ElseIf ArrData(i - 1) = "1" Then
                            QueryStr = "update AssessmentPoint set p_1 = '" & (ArrPoint(i - 1, 4) + 1) & "'" & _
                                " where sub_id = '" & Request.QueryString("sub_id") & "'" & _
                                " and tch_id = '" & Request.QueryString("tch_id") & "'" & _
                                " and assess_id = '" & ArrID(i - 1) & "'" & _
                                " and p_year = (select max(cal_year) from Learningcalendar)" & _
                                " and p_term = (select max(cal_term) from Learningcalendar" & _
                                " where cal_year = (select max(cal_year) from Learningcalendar))"
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        ElseIf ArrData(i - 1) = "9" Then
                            QueryStr = "update AssessmentPoint set p_9 = '" & (ArrPoint(i - 1, 5) + 1) & "'" & _
                                " where sub_id = '" & Request.QueryString("sub_id") & "'" & _
                                " and tch_id = '" & Request.QueryString("tch_id") & "'" & _
                                " and assess_id = '" & ArrID(i - 1) & "'" & _
                                " and p_year = (select max(cal_year) from Learningcalendar)" & _
                                " and p_term = (select max(cal_term) from Learningcalendar" & _
                                " where cal_year = (select max(cal_year) from Learningcalendar))"
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        End If
                    Next
                ElseIf status = False Then  '-------------- แสดงว่าไม่มีค่าอยู่เลย ให้ insert
                    For i = 1 To size
                        If ArrData(i - 1) = "5" Then
                            QueryStr = "insert into AssessmentPoint(sub_id,tch_id,assess_id,p_year,p_term,p_5,p_4,p_3,p_2,p_1,p_9) values('" & _
                                Request.QueryString("sub_id") & "','" & Request.QueryString("tch_id") & "','" & ArrID(i - 1) & "','" & _
                                year & "','" & term & "','1','0','0','0','0','0')"
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        ElseIf ArrData(i - 1) = "4" Then
                            QueryStr = "insert into AssessmentPoint(sub_id,tch_id,assess_id,p_year,p_term,p_5,p_4,p_3,p_2,p_1,p_9) values('" & _
                                Request.QueryString("sub_id") & "','" & Request.QueryString("tch_id") & "','" & ArrID(i - 1) & "','" & _
                                year & "','" & term & "','0','1','0','0','0','0')"
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        ElseIf ArrData(i - 1) = "3" Then
                            QueryStr = "insert into AssessmentPoint(sub_id,tch_id,assess_id,p_year,p_term,p_5,p_4,p_3,p_2,p_1,p_9) values('" & _
                                Request.QueryString("sub_id") & "','" & Request.QueryString("tch_id") & "','" & ArrID(i - 1) & "','" & _
                                year & "','" & term & "','0','0','1','0','0','0')"
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        ElseIf ArrData(i - 1) = "2" Then
                            QueryStr = "insert into AssessmentPoint(sub_id,tch_id,assess_id,p_year,p_term,p_5,p_4,p_3,p_2,p_1,p_9) values('" & _
                                Request.QueryString("sub_id") & "','" & Request.QueryString("tch_id") & "','" & ArrID(i - 1) & "','" & _
                                year & "','" & term & "','0','0','0','1','0','0')"
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        ElseIf ArrData(i - 1) = "1" Then
                            QueryStr = "insert into AssessmentPoint(sub_id,tch_id,assess_id,p_year,p_term,p_5,p_4,p_3,p_2,p_1,p_9) values('" & _
                                Request.QueryString("sub_id") & "','" & Request.QueryString("tch_id") & "','" & ArrID(i - 1) & "','" & _
                                year & "','" & term & "','0','0','0','0','1','0')"
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        ElseIf ArrData(i - 1) = "9" Then
                            QueryStr = "insert into AssessmentPoint(sub_id,tch_id,assess_id,p_year,p_term,p_5,p_4,p_3,p_2,p_1,p_9) values('" & _
                                Request.QueryString("sub_id") & "','" & Request.QueryString("tch_id") & "','" & ArrID(i - 1) & "','" & _
                                year & "','" & term & "','0','0','0','0','0','1')"
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        End If
                    Next
                End If

                '------------------------------- update ที่ Result ว่าได้ทำการประเมินผู้สอนแล้ว ที่ res_assess
                QueryStr = "update Result set res_assess = '1'" & _
                    " where reg_id = (select reg_id from Register where std_id = '" & Session("user") & "'" & _
                    " and reg_year = (select max(cal_year) from Learningcalendar)" & _
                    " and reg_term = (select max(cal_term) from Learningcalendar" & _
                    " where cal_year = (select max(cal_year) from Learningcalendar)))" & _
                    " and sub_id = '" & Request.QueryString("sub_id") & "'"
                If ExecuteComm(QueryStr) = False Then
                    Response.Redirect("../DBFailed.aspx")
                Else
                    Response.Redirect("../Result.aspx?msg=การประเมินผู้สอนเสร็จเรียบร้อยแล้ว&user=Student")
                End If
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "ยังไม่มีแบบฟอร์มของการประเมินผู้สอน"
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub
End Class
