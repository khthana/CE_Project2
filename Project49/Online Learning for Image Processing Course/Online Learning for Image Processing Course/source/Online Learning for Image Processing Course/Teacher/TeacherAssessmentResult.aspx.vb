Imports System.Data
Imports System.Data.SqlClient

Partial Class Teacher_TeacherAssessmentResult
    Inherits System.Web.UI.Page

    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    '    Dim i As Integer = 0
    '    Dim size As Integer = 0
    '    Dim AssessID(0) As Integer
    '    Dim AssessTopic(0) As String
    '    Dim numberStd As Integer = 0
    '    Dim Point5(0) As Integer
    '    Dim Point4(0) As Integer
    '    Dim Point3(0) As Integer
    '    Dim Point2(0) As Integer
    '    Dim Point1(0) As Integer
    '    Dim Point9(0) As Integer
    '    If Not Page.IsPostBack Then
    '        QueryStr = "select sub_id, sub_name from Subject where tch_id = '" & Session("user") & "' and sub_status = '1' order by sub_id"
    '        TableStr = "getsubject"
    '        If FillCommQ(QueryStr, TableStr) = True Then
    '            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
    '                subjectDDL.DataTextField = "sub_name"
    '                subjectDDL.DataValueField = "sub_id"
    '                subjectDDL.DataSource = sqlDS.Tables(TableStr)
    '                subjectDDL.DataBind()
    '            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
    '                warning.Text = "ไม่พบวิชาที่คุณเป็นผู้สอน"
    '                Exit Sub
    '            Else
    '                Response.Redirect("../DBFailed.aspx")
    '            End If
    '        Else
    '            Response.Redirect("../DBFailed.aspx")
    '        End If
    '    End If
    '    If Session("loginstatus") = True And Session("user") <> 0 Then
    '        If Session("usertype") = "Teacher" Then
    '            If subjectDDL.Items.Count = 0 Then
    '                warning.Text = "ไม่พบวิชาที่คุณเป็นผู้สอน"
    '                Exit Sub
    '            Else
    '                '-------------------------------------------------------- Assess_ID , Assess_Topic
    '                QueryStr = "select * from AssessmentTopic"
    '                TableStr = "gettopic"
    '                If FillCommQ(QueryStr, TableStr) = True Then
    '                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
    '                        size = sqlDS.Tables(TableStr).Rows.Count
    '                        ReDim AssessID(size - 1)
    '                        ReDim AssessTopic(size - 1)
    '                        i = 0
    '                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
    '                            AssessID(i) = Val(row("assess_id"))
    '                            AssessTopic(i) = row("assess_topic")
    '                            i = i + 1
    '                        Next
    '                    ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
    '                        warning.Text = "ยังไม่มีการประเมิน"
    '                        Exit Sub
    '                    End If
    '                Else
    '                    Response.Redirect("../DBFailed.aspx")
    '                End If
    '                '---------------------------------------------------------------- Number of Student
    '                QueryStr = "select count(distinct std_id) as std from AssessmentPoint where sub_id = '" & _
    '                    subjectDDL.SelectedItem.Value & "' and tch_id = '" & Session("user") & "'" & _
    '                    " and p_year = (select max(cal_year) from LearningCalendar)" & _
    '                    " and p_term = (select max(cal_term) from LearningCalendar" & _
    '                    " where cal_year = (select max(cal_year) from LearningCalendar))"
    '                TableStr = "getnumberstudent"
    '                If FillCommQ(QueryStr, TableStr) = True Then
    '                    If sqlDS.Tables(TableStr).Rows.Count = 1 Then
    '                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
    '                            numberStd = Val(row("std"))
    '                        Next
    '                    Else
    '                        Response.Redirect("../DBFailed.aspx")
    '                    End If
    '                Else
    '                    Response.Redirect("../DBFailed.aspx")
    '                End If
    '                '---------------------------------------------------------------- Get All Point
    '                ReDim Point5(size - 1)
    '                ReDim Point4(size - 1)
    '                ReDim Point3(size - 1)
    '                ReDim Point2(size - 1)
    '                ReDim Point1(size - 1)
    '                ReDim Point9(size - 1)
    '                For i = 0 To size - 1
    '                    '*********************** P5
    '                    QueryStr = "select count(p_5) as p5 from AssessmentPoint where p_5 = '1' and sub_id = '" & _
    '                        subjectDDL.SelectedItem.Value & "' and tch_id = '" & Session("user") & _
    '                        "' and assess_id = '" & AssessID(i) & "'"
    '                    TableStr = "getp5"
    '                    If FillCommQ(QueryStr, TableStr) = True Then
    '                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
    '                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
    '                                Point5(i) = Val(row("p5"))
    '                            Next
    '                        Else
    '                            Response.Redirect("../DBFailed.aspx")
    '                        End If
    '                    Else
    '                        Response.Redirect("../DBFailed.aspx")
    '                    End If
    '                    '************************ P4
    '                    QueryStr = "select count(p_4) as p4 from AssessmentPoint where p_4 = '1' and sub_id = '" & _
    '                        subjectDDL.SelectedItem.Value & "' and tch_id = '" & Session("user") & _
    '                        "' and assess_id = '" & AssessID(i) & "'"
    '                    TableStr = "getp4"
    '                    If FillCommQ(QueryStr, TableStr) = True Then
    '                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
    '                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
    '                                Point4(i) = Val(row("p4"))
    '                            Next
    '                        Else
    '                            Response.Redirect("../DBFailed.aspx")
    '                        End If
    '                    Else
    '                        Response.Redirect("../DBFailed.aspx")
    '                    End If
    '                    '************************ P3
    '                    QueryStr = "select count(p_3) as p3 from AssessmentPoint where p_3 = '1' and sub_id = '" & _
    '                        subjectDDL.SelectedItem.Value & "' and tch_id = '" & Session("user") & _
    '                        "' and assess_id = '" & AssessID(i) & "'"
    '                    TableStr = "getp3"
    '                    If FillCommQ(QueryStr, TableStr) = True Then
    '                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
    '                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
    '                                Point3(i) = Val(row("p3"))
    '                            Next
    '                        Else
    '                            Response.Redirect("../DBFailed.aspx")
    '                        End If
    '                    Else
    '                        Response.Redirect("../DBFailed.aspx")
    '                    End If
    '                    '************************ P2
    '                    QueryStr = "select count(p_2) as p2 from AssessmentPoint where p_2 = '1' and sub_id = '" & _
    '                        subjectDDL.SelectedItem.Value & "' and tch_id = '" & Session("user") & _
    '                        "' and assess_id = '" & AssessID(i) & "'"
    '                    TableStr = "getnumberstudent"
    '                    If FillCommQ(QueryStr, TableStr) = True Then
    '                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
    '                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
    '                                Point2(i) = Val(row("p2"))
    '                            Next
    '                        Else
    '                            Response.Redirect("../DBFailed.aspx")
    '                        End If
    '                    Else
    '                        Response.Redirect("../DBFailed.aspx")
    '                    End If
    '                    '************************ P1
    '                    QueryStr = "select count(p_1) as p1 from AssessmentPoint where p_1 = '1' and sub_id = '" & _
    '                        subjectDDL.SelectedItem.Value & "' and tch_id = '" & Session("user") & _
    '                        "' and assess_id = '" & AssessID(i) & "'"
    '                    TableStr = "getnumberstudent"
    '                    If FillCommQ(QueryStr, TableStr) = True Then
    '                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
    '                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
    '                                Point1(i) = Val(row("p1"))
    '                            Next
    '                        Else
    '                            Response.Redirect("../DBFailed.aspx")
    '                        End If
    '                    Else
    '                        Response.Redirect("../DBFailed.aspx")
    '                    End If
    '                    '************************ P9
    '                    QueryStr = "select count(p_9) as p9 from AssessmentPoint where p_9 = '1' and sub_id = '" & _
    '                        subjectDDL.SelectedItem.Value & "' and tch_id = '" & Session("user") & _
    '                        "' and assess_id = '" & AssessID(i) & "'"
    '                    TableStr = "getnumberstudent"
    '                    If FillCommQ(QueryStr, TableStr) = True Then
    '                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
    '                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
    '                                Point9(i) = Val(row("p9"))
    '                            Next
    '                        Else
    '                            Response.Redirect("../DBFailed.aspx")
    '                        End If
    '                    Else
    '                        Response.Redirect("../DBFailed.aspx")
    '                    End If
    '                Next
    '                '------------------------------------------------------------------ Display
    '                For i = 0 To size - 1
    '                    Dim mytopic As New Label
    '                    Dim mypoint As New Label
    '                    Dim mystudent As New Label
    '                    mytopic.ID = "topic" & i
    '                    mytopic.Text = (i + 1) & ". " & AssessTopic(i)
    '                    mytopic.Width = "200"
    '                    mypoint.ID = "point" & i
    '                    mypoint.Text = "{5} : " & Point5(i) & " , {4} : " & Point4(i) & " , {3} : " & Point3(i) & " , {2} : " & Point2(i) & " , {1} : " & Point1(i) & " , {9} : " & Point9(i)
    '                    mystudent.ID = "student" & i
    '                    mystudent.Text = "จำนวนผู้ทำการประเมิน : " & numberStd
    '                    holder.Controls.Add(mytopic)
    '                    holder.Controls.Add(mypoint)
    '                    holder.Controls.Add(GetLiteral("<br />"))
    '                    If i = size - 1 Then
    '                        holder.Controls.Add(GetLiteral("<br />"))
    '                        holder.Controls.Add(mystudent)
    '                    End If
    '                Next
    '            End If
    '        Else
    '            Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้สอน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
    '        End If
    '    Else
    '        Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
    '    End If
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim point As String = ""
        Dim score As Integer = 5
        Dim tmpScore As Integer = score
        Dim i As Integer = 0
        Dim j As Integer = 0
        Dim size As Integer = 0
        Dim AssessID(0) As Integer
        Dim AssessTopic(0) As String
        Dim ArrPoint(0, 5) As Integer
        Dim numberStd As Integer = 0
        If Not Page.IsPostBack Then
            '----------------------------- Get subject to add to DropDownList
            QueryStr = "select sub_id, sub_name from Subject where tch_id = '" & Session("user") & "' and sub_status = '1' order by sub_id"
            TableStr = "getsubject"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    subjectDDL.DataTextField = "sub_name"
                    subjectDDL.DataValueField = "sub_id"
                    subjectDDL.DataSource = sqlDS.Tables(TableStr)
                    subjectDDL.DataBind()
                ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                    warning.Text = "ไม่พบวิชาที่คุณเป็นผู้สอน"
                    Exit Sub
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        End If
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Teacher" Then
                If subjectDDL.Items.Count = 0 Then
                    warning.Text = "ไม่พบวิชาที่คุณเป็นผู้สอน"
                    Exit Sub
                Else
                    '-------------------------------------------------------- Assess_ID , Assess_Topic
                    QueryStr = "select * from AssessmentTopic"
                    TableStr = "gettopic"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                            size = sqlDS.Tables(TableStr).Rows.Count
                            ReDim AssessID(size - 1)
                            ReDim AssessTopic(size - 1)
                            ReDim ArrPoint(size - 1, 5)
                            i = 0
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                AssessID(i) = Val(row("assess_id"))
                                AssessTopic(i) = row("assess_topic")
                                i = i + 1
                            Next
                        ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                            warning.Text = "ยังไม่มีการประเมิน"
                            Exit Sub
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    '---------------------------------------------------------------- Number of Student
                    QueryStr = "select count(reg_id) as std from Result" & _
                        " where sub_id = '" & subjectDDL.SelectedItem.Value & "'" & _
                        " and res_assess = '1'" & _
                        " and reg_id in (select reg_id from register" & _
                        " where reg_year = (select max(cal_year) from Learningcalendar)" & _
                        " and reg_term = (select max(cal_term) from Learningcalendar" & _
                        " where cal_year = (select max(cal_year) from Learningcalendar)))"
                    TableStr = "getnumberstudent"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                numberStd = Val(row("std"))
                            Next
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    '---------------------------------------------------------------- Get All Point
                    For i = 0 To size - 1
                        point = "p_5"
                        tmpScore = score
                        For j = 0 To score
                            QueryStr = "select " & point & " from AssessmentPoint where sub_id = '" & _
                                subjectDDL.SelectedItem.Value & "'" & _
                                " and tch_id = '" & Session("user") & "'" & _
                                " and assess_id = '" & AssessID(i) & "'" & _
                                " and p_year = (select max(cal_year) from Learningcalendar)" & _
                                " and p_term = (select max(cal_term) from Learningcalendar" & _
                                " where cal_year = (select max(cal_year) from Learningcalendar))"
                            TableStr = "getpoint"
                            If FillCommQ(QueryStr, TableStr) = True Then
                                If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                        ArrPoint(i, j) = Val(row(point))
                                        'If row(point) = True Then
                                        '    ArrPoint(i, j) = 1
                                        'Else
                                        '    ArrPoint(i, j) = 0
                                        'End If
                                    Next
                                ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                                    ArrPoint(i, j) = 0
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
                    '------------------------------------------------------------------ Display
                    For i = 0 To size - 1
                        Dim mytopic As New Label
                        Dim mypoint As New Label
                        Dim mystudent As New Label
                        mytopic.ID = "topic" & i
                        mytopic.Text = (i + 1) & ". " & AssessTopic(i)
                        mytopic.Width = "200"
                        mypoint.ID = "point" & i
                        mypoint.Text = "{5} : " & ArrPoint(i, 0) & " , {4} : " & ArrPoint(i, 1) & _
                            " , {3} : " & ArrPoint(i, 2) & " , {2} : " & ArrPoint(i, 3) & " , {1} : " & _
                            ArrPoint(i, 4) & " , {9} : " & ArrPoint(i, 5)
                        mystudent.ID = "student" & i
                        mystudent.Text = "จำนวนผู้ทำการประเมิน : " & numberStd
                        holder.Controls.Add(mytopic)
                        holder.Controls.Add(mypoint)
                        holder.Controls.Add(GetLiteral("<br />"))
                        If i = size - 1 Then
                            holder.Controls.Add(GetLiteral("<br />"))
                            holder.Controls.Add(mystudent)
                        End If
                    Next
                End If
            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้สอน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
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
End Class
