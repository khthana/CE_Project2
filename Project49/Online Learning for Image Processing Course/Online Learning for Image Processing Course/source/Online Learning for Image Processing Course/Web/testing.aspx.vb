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


Partial Class testing
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim mydate As Date = System.DateTime.Now.ToLongDateString
            Dim my_date As String = mydate
            Dim my__date(2) As String
            my__date = my_date.Split("/")
            my__date(2) = my__date(2) - 543
            txt.Value = my__date(0) & "/" & my__date(1) & "/" & my__date(2) '"28/3/2007"
        End If

        Button1.Attributes.Add("onclick", "return confirm('Are you sure you want to delete?');")
        Dim i As Integer = 1
        Dim tmp As Boolean = False
        QueryStr = "select * from questionmodule where mod_id = '30' order by qst_number"
        TableStr = "getquestion"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    Dim order As New Label
                    Dim question As New Label
                    Dim pic As New System.Web.UI.WebControls.Image
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
                    QueryStr = "select * from ChoiceModule where qst_id = '" & CStr(row("qst_id")) & "'"
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
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
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

    Protected Sub ok_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ok.Click
        Dim gr As GridViewRow
        Dim arr1(0) As String
        Dim arr2(0) As String
        Dim i As Integer = 0
        Dim j As Integer = 0
        For Each gr In GridView1.Rows
            Dim chk As CheckBox = CType(gr.FindControl("registerChB"), CheckBox)
            If chk.Checked Then
                ReDim Preserve arr1(i)
                arr1(i) = gr.Cells(1).Text
                ReDim Preserve arr2(i)
                arr2(i) = gr.Cells(4).Text
                i = i + 1
            End If
        Next
        For Each i In arr1
            Response.Write(i & " : " & arr2(j))
            j = j + 1
        Next
    End Sub

    'Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
    '    Response.Write("Hello" & box2.Text)
    'End Sub

    Sub selectDDL(ByVal sender As Object, ByVal e As ServerValidateEventArgs)
        Dim value As String = e.Value
        If e.Value = "select" Then
            e.IsValid = False
        Else
            e.IsValid = True
        End If
        'If DDL.SelectedItem.Value = "select" Then

        'End If
    End Sub

    Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        Dim arr(0) As String
        Dim size As Integer = 0
        Dim i As Integer = 0
        QueryStr = "select qst_score from questionmodule where mod_id = '30'"
        TableStr = "getscore"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                size = sqlDS.Tables(TableStr).Rows.Count
                ReDim Preserve arr(size - 1)
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    arr(i) = row("qst_score")
                    i = i + 1
                Next
                warning.Text = GetScore(size, arr)
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If


    End Sub

    Function GetScore(ByVal size As Integer, ByVal ArrScore As Array) As Double
        Dim score As Double = 0.0
        Dim i As Integer
        Dim sum As Integer = 0
        Dim temp(10) As String
        Dim j As Integer = 0

        Dim gettrue As Double = 0.0
        Dim getanswer As Double = 0.0

        For i = 1 To size
            Dim sb As String = "Radio" & i
            Dim ch As String = "Check" & i
            Dim GetScoreBox As RadioButtonList = CType(Me.FindControl(sb), RadioButtonList)
            Dim getcheck As CheckBoxList = CType(Me.FindControl(ch), CheckBoxList)
            If IsNothing(GetScoreBox) Then
            Else
                'warning.Text = GetScoreBox.SelectedItem.Value
                If GetScoreBox.Text = "" Then
                Else
                    If GetScoreBox.SelectedItem.Value = True Then
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
                        warning.Text = getcheck.Items(j).Value
                        If getcheck.Items(j).Value = True Then
                            getanswer = getanswer + 1
                        End If
                    End If
                Next
                score = score + ((ArrScore(i - 1) / gettrue) * getanswer)
            End If


            'If GetScoreBox.Items.FindByValue(1).Value Then
            '    warning.Text = GetScoreBox.Items.FindByValue(1).Value
            '    Return temp
            'End If
            'If IsNumeric(GetScoreBox.Text) Then
            '    ArrScore(i - 1) = GetScoreBox.Text
            '    sum = sum + Val(GetScoreBox.Text)
            'ElseIf GetScoreBox.Text = "" Then
            '    warning.Text = "คะแนนที่ Module " & i & " : ไม่ได้ใส่ค่า"
            '    temp(10) = "0123456789"
            '    Return temp
            'Else
            '    warning.Text = "คะแนนที่ Module " & i & " : ไม่ใช่ตัวเลข"
            '    temp(10) = "0123456789"
            '    Return temp
            'End If
        Next
        Return score
        'If sum <> 0 Then
        '    warning.Text = "กรุณาใส่ค่าของคะแนน Module ให้ได้ค่ารวมเท่ากับค่าที่กำหนดไว้ในตอนต้น"
        '    temp(10) = "0123546789"
        '    Return temp
        'Else
        '    Return ArrScore
        'End If
    End Function

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim currentdate(2) As String
        currentdate = txt.Value.Split("/")
        currentdate(2) = Val(currentdate(2)) + 543
        Response.Write("this date is " & currentdate(0) & "/" & currentdate(1) & "/" & currentdate(2))
        'Response.Write("Hello.................................")
        'Dim mydate As Date = System.DateTime.Now.ToLongTimeString
        'Dim myday As Integer = Weekday(mydate)
        'Dim myhours As Integer = Hour(mydate)
        'Dim myminutes As Integer = Minute(mydate)
        'Response.Write("<br />")
        'Response.Write("Time : " & mydate)
        'mydate = System.DateTime.Now.ToLongDateString
        'Dim getmydate(2) As String
        'Dim tmp As String = mydate
        'getmydate = tmp.Split("/")
        'Response.Write("<br />")
        'Response.Write("Date : " & mydate)
        'Response.Write("Date... : " & getmydate(0) & "/" & getmydate(1) & "/" & getmydate(2))

        'Dim setdate As Date = System.DateTime.Now.ToLongTimeString
        'Dim hh As Integer = Hour(setdate) + 6
        'Dim mm As Integer = Minute(setdate)
        'Dim ss As Integer = Second(setdate)
        'Dim mytime As String = hh & ":" & mm & ":" & ss
        'Response.Write("<br />")
        'Response.Write("mytime++++++++++++++++ : " & mytime)
        Dim starttime As Integer = 21
        Dim endtime As Integer = 23
        Dim usetime As Integer = 22
        Dim t As Integer = 2
        Dim a As Integer = endtime - t
        If a > usetime Then
            usetime = usetime + 24
            If usetime > endtime Then
                Response.Write("cann't go")
            Else
                Response.Write("go")
            End If
        Else
            Response.Write("gogo")
        End If

        Dim total As Integer = 0
        Dim ArrScore(100) As Double
        Dim ArrLevel(9) As Integer
        Dim value As Double = 0.0
        QueryStr = "select res_score from Result where sub_id = '10000001'" & _
            " and reg_id in (select reg_id from Register" & _
            " where reg_year = (select max(cal_year) from LearningCalendar)" & _
            " and reg_term = (select max(cal_term) from LearningCalendar" & _
            " where cal_year = (select max(cal_year) from LearningCalendar)))"
        TableStr = "getscore"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                total = sqlDS.Tables(TableStr).Rows.Count
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
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "จำนวนผู้ลงทะเบียนเป็นศูนย์"
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If

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
        'MyLineChart.ChartTitle.ForeColor = Color.Black
    End Sub

    Sub CreateChart(ByVal value() As Integer)
        'Dim chart As PieChart = New PieChart
        'chart.DataSource = GetDataSet.Tables(0).DefaultView
        'chart.DataXValueField = "Title"
        'chart.DataYValueField = "Price"
        'chart.DataLabels.Visible = True
        'chart.DataLabels.ForeColor = System.Drawing.Color.Blue
        'chart.Shadow.Visible = True
        'chart.DataBind()
        'chart.Explosion = 10
        'MyPieChart.Charts.Add(chart)
        'MyPieChart.RedrawChart()
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
        'Dim ds As DataSet = New DataSet
        'Dim table As DataTable = ds.Tables.Add("My Table")
        'table.Columns.Add(New DataColumn("Title"))
        'table.Columns.Add(New DataColumn("Price", GetType(System.Int32)))
        'Dim rnd As Random = New Random
        'Dim i As Integer = 0
        'Do While (i < 10)
        '    Dim row As DataRow = table.NewRow
        '    row("Title") = ("Title:" + i.ToString)
        '    row("Price") = rnd.Next(1, 1000)
        '    table.Rows.Add(row)
        '    i = (i + 1)
        'Loop
        'Return ds

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

    Protected Sub signin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles signin.Click
        lbl.Text = "Welcome"
    End Sub
End Class
