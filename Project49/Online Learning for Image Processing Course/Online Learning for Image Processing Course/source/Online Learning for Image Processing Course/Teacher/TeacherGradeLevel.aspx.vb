Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Collections
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.ComponentModel
Imports WebChart

Partial Class Teacher_TeacherGradeLevel
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Teacher" Then
                If Not Page.IsPostBack Then
                    QueryStr = "SELECT sub_id, sub_name FROM Subject WHERE tch_id = '" & Session("user") & "' AND sub_status = '1' ORDER BY sub_id"
                    TableStr = "getsubject"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                            subjectDDL.DataTextField = "sub_name"
                            subjectDDL.DataValueField = "sub_id"
                            subjectDDL.DataSource = sqlDS.Tables(TableStr)
                            subjectDDL.DataBind()
                        ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                            warning.Text = "คุณยังไม่มีวิชาที่ได้รับผิดชอบในการสอน"
                            Exit Sub
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    'Else
                End If
                'MyLineChart.Controls.Clear()
                'MyPieChart.Controls.Clear()
                Dim total As Integer = 0
                Dim ArrScore(100) As Double
                Dim ArrLevel(9) As Integer
                Dim value As Double = 0.0
                QueryStr = "select res_score from Result where sub_id = '" & subjectDDL.SelectedItem.Value & "'" & _
                    " and reg_id in (select reg_id from Register" & _
                    " where reg_year = (select max(cal_year) from LearningCalendar)" & _
                    " and reg_term = (select max(cal_term) from LearningCalendar" & _
                    " where cal_year = (select max(cal_year) from LearningCalendar)))"
                TableStr = "getscore"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                        total = sqlDS.Tables(TableStr).Rows.Count
                        TotalStudent.Text = "จำนวนผู้ลงทะเบียนทั้งหมดของวิชา " & subjectDDL.SelectedItem.Text & " = " & total
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            value = Val(row("res_score"))
                            ArrScore(value) = ArrScore(value) + 1
                            If value >= 90 And value <= 100 Then
                                ArrLevel(0) = ArrLevel(0) + 1
                            ElseIf value >= 80 And value < 90 Then
                                ArrLevel(1) = ArrLevel(1) + 1
                            ElseIf value >= 70 And value < 80 Then
                                ArrLevel(2) = ArrLevel(2) + 1
                            ElseIf value >= 60 And value < 70 Then
                                ArrLevel(3) = ArrLevel(3) + 1
                            ElseIf value >= 50 And value < 60 Then
                                ArrLevel(4) = ArrLevel(4) + 1
                            ElseIf value >= 40 And value < 50 Then
                                ArrLevel(5) = ArrLevel(5) + 1
                            ElseIf value >= 30 And value < 40 Then
                                ArrLevel(6) = ArrLevel(6) + 1
                            ElseIf value >= 20 And value < 30 Then
                                ArrLevel(7) = ArrLevel(7) + 1
                            ElseIf value >= 10 And value < 20 Then
                                ArrLevel(8) = ArrLevel(8) + 1
                            ElseIf value >= 0 And value < 10 Then
                                ArrLevel(9) = ArrLevel(9) + 1
                            End If
                        Next
                        CreateGraph(ArrScore)
                        CreateChart(ArrLevel)
                        MyLineChart.Visible = True
                        MyPieChart.Visible = True
                    ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                        warning.Text = "จำนวนผู้ลงทะเบียนเป็นศูนย์"
                        Exit Sub
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If

            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้สอน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If
    End Sub

    Protected Sub create_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles create.Click
        If subjectDDL.Items.Count = 0 Then
            warning.Text = "คุณไม่มีวิชาที่สอน"
            Exit Sub
        End If
        QueryStr = "select * from GradeLevel where sub_id = '" & subjectDDL.SelectedItem.Value & "'" & _
            " and gl_year = (select max(cal_year) from LearningCalendar) and gl_term = (select max(cal_term) from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar))"
        TableStr = "getgrade"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                warning.Text = "สำหรับวิชานี้ได้มีการกำหนดระดับเกรดแล้ว"
                Exit Sub
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                createform.Visible = True
                updateform.Visible = False
                warning.Text = ""
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub update_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles update.Click
        If subjectDDL.Items.Count = 0 Then
            warning.Text = "คุณไม่มีวิชาที่สอน"
            Exit Sub
        End If
        QueryStr = "select * from GradeLevel where sub_id = '" & subjectDDL.SelectedItem.Value & "'" & _
                    " and gl_year = (select max(cal_year) from LearningCalendar) and gl_term = (select max(cal_term) from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar))"
        TableStr = "getgrade"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                createform.Visible = False
                updateform.Visible = True
                warning.Text = ""
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    a2.Text = row("gl_a")
                    bp2.Text = row("gl_bp")
                    b2.Text = row("gl_b")
                    cp2.Text = row("gl_cp")
                    c2.Text = row("gl_c")
                    dp2.Text = row("gl_dp")
                    d2.Text = row("gl_d")
                    f2.Text = row("gl_f")
                Next
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "สำหรับวิชานี้ยังไม่มีการกำหนดระดับเกรด"
                updateform.Visible = False
                createform.Visible = False
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub clear1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear1.Click
        a1.Text = ""
        bp1.Text = ""
        b1.Text = ""
        cp1.Text = ""
        c1.Text = ""
        dp1.Text = ""
        d1.Text = ""
        f1.Text = ""
        warning.Text = ""
    End Sub

    Protected Sub submit1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit1.Click
        Dim year As Integer = 0
        Dim term As Integer = 0
        QueryStr = "select cal_year,cal_term from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar) and cal_term = (select max(cal_term) from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar))"
        TableStr = "getyearterm"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    year = Val(row("cal_year"))
                    term = Val(row("cal_term"))
                Next
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "สำหรับวิชานี้ยังไม่มีการกำหนดระดับเกรดแล้ว"
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If

        Dim ScoreTemp As Double = 0.0
        Dim RegID As String = ""
        Dim Grade As String = ""
        QueryStr = "select reg_id,res_score from Result where sub_id = '" & subjectDDL.SelectedItem.Value & "'" & _
            " and reg_id in (select reg_id from Register" & _
            " where reg_year = (select max(cal_year) from LearningCalendar)" & _
            " and reg_term = (select max(cal_term) from LearningCalendar" & _
            " where cal_year = (select max(cal_year) from LearningCalendar)))"
        TableStr = "getregid"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    RegID = row("reg_id")
                    ScoreTemp = Val(row("res_score"))
                    If ScoreTemp >= Val(a1.Text) Then
                        Grade = "A"
                    ElseIf ScoreTemp >= Val(bp1.Text) Then
                        Grade = "B+"
                    ElseIf ScoreTemp >= Val(b1.Text) Then
                        Grade = "B"
                    ElseIf ScoreTemp >= Val(cp1.Text) Then
                        Grade = "C+"
                    ElseIf ScoreTemp >= Val(c1.Text) Then
                        Grade = "C"
                    ElseIf ScoreTemp >= Val(dp1.Text) Then
                        Grade = "D+"
                    ElseIf ScoreTemp >= Val(d1.Text) Then
                        Grade = "D"
                    ElseIf ScoreTemp < Val(f1.Text) Then
                        Grade = "F"
                    End If
                    CloseConn()
                    QueryStr = "update Result set res_grade = '" & Grade & "' where reg_id = '" & RegID & "'" & _
                        " and sub_id = '" & subjectDDL.SelectedItem.Value & "'"
                    If ExecuteComm(QueryStr) = False Then
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Next
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "วิชานี้ยังไม่มีคนลงทะเบียน"
                createform.Visible = False
                Exit Sub
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
        CloseConn()
        QueryStr = "insert into GradeLevel(sub_id,gl_a,gl_bp,gl_b,gl_cp,gl_c,gl_dp,gl_d,gl_f,gl_year,gl_term) values('" & _
            subjectDDL.SelectedItem.Value & "','" & a1.Text & "','" & bp1.Text & "','" & b1.Text & "','" & _
            cp1.Text & "','" & c1.Text & "','" & dp1.Text & "','" & d1.Text & "','" & f1.Text & "','" & _
            year & "','" & term & "')"
        If ExecuteComm(QueryStr) = True Then
            Response.Redirect("../Result.aspx?msg=การกำหนดระดับเกรดและการคำนวณเกรดเสร็จเรียบร้อยแล้ว&user=Teacher")
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub clear2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear2.Click
        a2.Text = ""
        bp2.Text = ""
        b2.Text = ""
        cp2.Text = ""
        c2.Text = ""
        dp2.Text = ""
        d2.Text = ""
        f2.Text = ""
        warning.Text = ""
    End Sub

    Protected Sub submit2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit2.Click
        Dim year As Integer = 0
        Dim term As Integer = 0
        QueryStr = "select * from GradeLevel where sub_id = '" & subjectDDL.SelectedItem.Value & "'" & _
            " and gl_year = (select max(cal_year) from LearningCalendar) and gl_term = (select max(cal_term) from LearningCalendar where cal_year = (select max(cal_year) from LearningCalendar))"
        TableStr = "getyearterm"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    year = Val(row("gl_year"))
                    term = Val(row("gl_term"))
                Next
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "สำหรับวิชานี้ยังไม่มีการกำหนดระดับเกรดแล้ว"
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If

        Dim ScoreTemp As Double = 0.0
        Dim RegID As String = ""
        Dim Grade As String = ""
        QueryStr = "select reg_id,res_score from Result where sub_id = '" & subjectDDL.SelectedItem.Value & "'" & _
            " and reg_id in (select reg_id from Register" & _
            " where reg_year = (select max(cal_year) from LearningCalendar)" & _
            " and reg_term = (select max(cal_term) from LearningCalendar" & _
            " where cal_year = (select max(cal_year) from LearningCalendar)))"
        TableStr = "getregid"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    RegID = row("reg_id")
                    ScoreTemp = Val(row("res_score"))
                    If ScoreTemp >= Val(a2.Text) Then
                        Grade = "A"
                    ElseIf ScoreTemp >= Val(bp2.Text) Then
                        Grade = "B+"
                    ElseIf ScoreTemp >= Val(b2.Text) Then
                        Grade = "B"
                    ElseIf ScoreTemp >= Val(cp2.Text) Then
                        Grade = "C+"
                    ElseIf ScoreTemp >= Val(c2.Text) Then
                        Grade = "C"
                    ElseIf ScoreTemp >= Val(dp2.Text) Then
                        Grade = "D+"
                    ElseIf ScoreTemp >= Val(d2.Text) Then
                        Grade = "D"
                    ElseIf ScoreTemp < Val(f2.Text) Then
                        Grade = "F"
                    End If
                    CloseConn()
                    QueryStr = "update Result set res_grade = '" & Grade & "' where reg_id = '" & RegID & "'" & _
                        " and sub_id = '" & subjectDDL.SelectedItem.Value & "'"
                    If ExecuteComm(QueryStr) = False Then
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Next
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "วิชานี้ยังไม่มีคนลงทะเบียน"
                createform.Visible = False
                Exit Sub
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If

        CloseConn()
        QueryStr = "update GradeLevel set gl_a = '" & a2.Text & "',gl_bp = '" & bp2.Text & "',gl_b = '" & _
            b2.Text & "',gl_cp = '" & cp2.Text & "',gl_c = '" & c2.Text & "',gl_dp = '" & dp2.Text & _
            "',gl_d = '" & d2.Text & "',gl_f = '" & f2.Text & "' where sub_id = '" & subjectDDL.SelectedItem.Value & _
            "' and gl_year = '" & year & "' and gl_term = '" & term & "'"
        If ExecuteComm(QueryStr) = True Then
            Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงระดับเกรดและการคำนวณเกรดเสร็จเรียบร้อยแล้ว&user=Teacher")
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub subjectDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles subjectDDL.SelectedIndexChanged
        If subjectDDL.Items.Count = 0 Then
            warning.Text = "คุณไม่มีวิชาที่สอน"
            Exit Sub
        End If

        'Dim total As Integer = 0
        'Dim ArrScore(100) As Double
        'Dim ArrLevel(9) As Integer
        'Dim value As Double = 0.0
        'QueryStr = "select res_score from Result where sub_id = '" & subjectDDL.SelectedItem.Value & "'" & _
        '    " and reg_id in (select reg_id from Register" & _
        '    " where reg_year = (select max(cal_year) from LearningCalendar)" & _
        '    " and reg_term = (select max(cal_term) from LearningCalendar" & _
        '    " where cal_year = (select max(cal_year) from LearningCalendar)))"
        'TableStr = "getscore"
        'If FillCommQ(QueryStr, TableStr) = True Then
        '    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
        '        total = sqlDS.Tables(TableStr).Rows.Count
        '        TotalStudent.Text = "จำนวนผู้ลงทะเบียนทั้งหมดของวิชา " & subjectDDL.SelectedItem.Text & " = " & total
        '        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
        '            value = Val(row("res_score"))
        '            ArrScore(value) = ArrScore(value) + 1
        '            If value >= 90 And value <= 100 Then
        '                ArrLevel(0) = ArrLevel(0) + 1
        '            ElseIf value >= 80 And value < 90 Then
        '                ArrLevel(1) = ArrLevel(1) + 1
        '            ElseIf value >= 70 And value < 80 Then
        '                ArrLevel(2) = ArrLevel(2) + 1
        '            ElseIf value >= 60 And value < 70 Then
        '                ArrLevel(3) = ArrLevel(3) + 1
        '            ElseIf value >= 50 And value < 60 Then
        '                ArrLevel(4) = ArrLevel(4) + 1
        '            ElseIf value >= 40 And value < 50 Then
        '                ArrLevel(5) = ArrLevel(5) + 1
        '            ElseIf value >= 30 And value < 40 Then
        '                ArrLevel(6) = ArrLevel(6) + 1
        '            ElseIf value >= 20 And value < 30 Then
        '                ArrLevel(7) = ArrLevel(7) + 1
        '            ElseIf value >= 10 And value < 20 Then
        '                ArrLevel(8) = ArrLevel(8) + 1
        '            ElseIf value >= 0 And value < 10 Then
        '                ArrLevel(9) = ArrLevel(9) + 1
        '            End If
        '        Next
        '        CreateGraph(ArrScore)
        '        CreateChart(ArrLevel)
        '        MyLineChart.Visible = True
        '        MyPieChart.Visible = True
        '    ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
        '        warning.Text = "จำนวนผู้ลงทะเบียนเป็นศูนย์"
        '        MyLineChart.Visible = False
        '        MyPieChart.Visible = False
        '        Exit Sub
        '    Else
        '        Response.Redirect("../DBFailed.aspx")
        '    End If
        'Else
        '    Response.Redirect("../DBFailed.aspx")
        'End If

        createform.Visible = False
        updateform.Visible = False
        warning.Text = ""

        a1.Text = ""
        bp1.Text = ""
        b1.Text = ""
        cp1.Text = ""
        c1.Text = ""
        dp1.Text = ""
        d1.Text = ""
        f1.Text = ""

        a2.Text = ""
        bp2.Text = ""
        b2.Text = ""
        cp2.Text = ""
        c2.Text = ""
        dp2.Text = ""
        d2.Text = ""
        f2.Text = ""

        'TotalStudent.Text = ""
    End Sub

    Private Sub CreateGraph(ByVal value() As Double)
        Dim ds As DataSet = GetDataSet(value)
        If IsNothing(ds) Then
            warning.Text = "พบปัญหาที่ฟังก์ชัน GetDataSet"
            Exit Sub
        Else
            Dim view As DataView = ds.Tables(0).DefaultView
            Dim chart As New LineChart
            chart.Line.Color = Color.SteelBlue
            chart.Line.Width = 1
            chart.DataSource = view
            chart.DataXValueField = "Score"
            chart.DataYValueField = "NumberOfStudent"
            chart.DataBind()
            MyLineChart.Charts.Add(chart)
            ConfigureColors()
            MyLineChart.RedrawChart()
        End If
    End Sub

    Private Function GetDataSet(ByVal value() As Double) As DataSet
        Dim ds As New DataSet()
        Dim table As DataTable = ds.Tables.Add("Data")
        table.Columns.Add("Score", GetType(Double))
        table.Columns.Add("NumberOfStudent", GetType(Integer))
        Dim i As Integer
        For i = 0 To 100
            Dim row As DataRow = table.NewRow()
            row("Score") = i.ToString()
            row("NumberOfStudent") = value(i)
            table.Rows.Add(row)
        Next
        Return ds
    End Function

    ' Configure some colors for the Chart, this could be done declaratively also
    Private Sub ConfigureColors()
        MyLineChart.ChartTitle.Text = "กราฟเส้นแสดงแนวโน้มของคะแนนกับจำนวนผู้เรียน"
    End Sub

    Sub CreateChart(ByVal value() As Integer)
        Dim ds As DataSet = GetDataSet1(value)
        Dim chart As PieChart = New PieChart
        chart.DataSource = ds.Tables(0).DefaultView
        chart.DataXValueField = "Level"
        chart.DataYValueField = "Number"
        chart.DataLabels.Visible = True
        chart.DataLabels.ForeColor = System.Drawing.Color.Blue
        chart.Shadow.Visible = True
        chart.DataBind()
        chart.Explosion = 10
        MyPieChart.Charts.Add(chart)
        ConfigureColors1()
        MyPieChart.RedrawChart()
    End Sub

    Function GetDataSet1(ByVal value() As Integer) As DataSet
        Dim ds As DataSet = New DataSet
        Dim table As DataTable = ds.Tables.Add("Table")
        table.Columns.Add(New DataColumn("Level"))
        table.Columns.Add(New DataColumn("Number", GetType(System.Int32)))
        Dim i As Integer = 0
        Do While (i < 10)
            Dim row As DataRow = table.NewRow
            If i = 0 Then
                row("Level") = ("100 - 90")
            ElseIf i = 1 Then
                row("Level") = ("90 - 80")
            ElseIf i = 2 Then
                row("Level") = ("80 - 70")
            ElseIf i = 3 Then
                row("Level") = ("70 - 60")
            ElseIf i = 4 Then
                row("Level") = ("60 - 50")
            ElseIf i = 5 Then
                row("Level") = ("50 - 40")
            ElseIf i = 6 Then
                row("Level") = ("40 - 30")
            ElseIf i = 7 Then
                row("Level") = ("30 - 20")
            ElseIf i = 8 Then
                row("Level") = ("20 - 10")
            ElseIf i = 9 Then
                row("Level") = ("10 - 0")
            End If
            row("Number") = value(i)
            table.Rows.Add(row)
            i = (i + 1)
        Loop
        Return ds
    End Function

    Private Sub ConfigureColors1()
        MyPieChart.ChartTitle.Text = "กราฟพายแสดงผลของระดับคะแนนกับจำนวนผู้เรียน"
    End Sub
End Class
