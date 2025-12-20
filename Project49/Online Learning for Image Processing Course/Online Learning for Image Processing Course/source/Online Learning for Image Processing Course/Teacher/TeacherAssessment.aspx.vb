Imports System.Data
Imports System.Data.SqlClient

Partial Class Teacher_TeacherAssessment
    Inherits System.Web.UI.Page

    Protected Sub createassessment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles createassessment.Click
        If subjectDDL.Items.Count = 0 Then
            warning.Text = "ไม่พบข้อมูลของรายวิชาต่างๆ"
            Exit Sub
        End If
        QueryStr = "select * from Examination where sub_id = '" & subjectDDL.SelectedItem.Value & "' and exm_year = (select max(exm_year) from Examination) and exm_term = (select max(exm_term) from Examination where exm_year = (select max(exm_year) from Examination))"
        TableStr = "checklessonforcreate"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count <> 0 Then
                warning.Text = "วิชานี้ได้มีการกำหนดคะแนนการทดสอบไว้แล้ว"
                table1.Visible = False
                table2.Visible = False
                Exit Sub
            Else
                table1.Visible = True
                table2.Visible = False
                warning.Text = ""
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If

        QueryStr = "select sub_dexam,sub_texam from Subject where sub_id = '" & subjectDDL.SelectedItem.Value & "'"
        TableStr = "getdatetimetesting"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    datestart.Text = row("sub_dexam")
                    dateend.Text = row("sub_dexam")
                    timetotesting.Text = row("sub_texam")
                Next
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub updateassessment_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updateassessment.Click
        typetestingDDL.SelectedIndex = 0
        numberoftestingDDL.Items.Clear()
        updatescore.Text = ""
        '-------
        txt1.Value = ""
        txt2.Value = ""
        '-------
        'updatedatestart.Text = ""
        'updatedateend.Text = ""
        updatetimeDDL.SelectedIndex = 0

        If subjectDDL.Items.Count = 0 Then
            warning.Text = "ไม่พบข้อมูลของรายวิชาต่างๆ"
            Exit Sub
        End If
        QueryStr = "select * from Examination where sub_id = '" & subjectDDL.SelectedItem.Value & "' and exm_year = (select max(exm_year) from Examination) and exm_term = (select max(exm_term) from Examination where exm_year = (select max(exm_year) from Examination))"
        TableStr = "checklessonforcreate"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "วิชานี้ยังไม่ได้มีการกำหนดคะแนนการทดสอบไว้"
                table1.Visible = False
                table2.Visible = False
                Exit Sub
            Else
                table1.Visible = False
                table2.Visible = True
                warning.Text = ""
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub cleartable1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cleartable1.Click
        year.Text = ""
        term.Text = ""
        moduletotal.Text = ""
        assignmenttotal.Text = ""
        examtotal.Text = ""
        numberofmoduleDDL.SelectedIndex = 0
        moduleholder.Controls.Clear()
        numberofassignmentDDL.SelectedIndex = 0
        assignmentholder.Controls.Clear()
        warning.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Session("loginstatus") = True And Session("user") <> 0 Then
                If Session("usertype") = "Teacher" Then
                Else
                    Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้สอน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
                End If
            Else
                Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
            End If

            If Not Page.IsPostBack Then
            Else
                If table1.Visible = True Then
                    If numberofmoduleDDL.SelectedItem.Value = "select" And Val(moduletotal.Text) = 0 Then
                    ElseIf numberofmoduleDDL.SelectedItem.Value <> "select" Then
                        warning.Text = ""
                        CreateTextBoxModule(numberofmoduleDDL.SelectedItem.Value)
                    End If
                    If numberofassignmentDDL.SelectedItem.Value = "select" And Val(assignmenttotal.Text) = 0 Then
                    ElseIf numberofassignmentDDL.SelectedItem.Value <> "select" Then
                        warning.Text = ""
                        CreateTextBoxAssignment(numberofassignmentDDL.SelectedItem.Value)
                    End If
                End If
            End If
        Catch ex As Exception
            warning.Text = ex.Message
            Exit Sub
        End Try
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

    Sub CreateTextBoxModule(ByVal size As Integer)
        Try
            Dim i As Integer
            For i = 1 To size
                Dim SetOrderLabel As New Label

                Dim SetScoreLabel As New Label
                Dim SetDateStartLabel As New Label
                Dim SetDateEndLabel As New Label
                Dim SetTimeLabel As New Label

                Dim SetScoreBox As New TextBox
                Dim SetDateStartBox As New TextBox
                Dim SetDateEndBox As New TextBox
                Dim SetTimeDDL As New DropDownList

                SetOrderLabel.ID = "OMlabel" & i
                SetOrderLabel.Text = "Module" & i & " "

                SetScoreLabel.ID = "SMlabel" & i
                SetScoreLabel.Text = "คะแนน : "

                SetDateStartLabel.ID = "DSMlabel" & i
                SetDateStartLabel.Text = "วันเริ่มต้น : "

                SetDateEndLabel.ID = "DEMlabel" & i
                SetDateEndLabel.Text = "วันสุดท้าย : "

                SetTimeLabel.ID = "TMlabel" & i
                SetTimeLabel.Text = "เวลาที่ใช้ : "

                SetScoreBox.ID = "SMbox" & i
                SetScoreBox.Width = "25"
                SetScoreBox.Text = ""

                SetDateStartBox.ID = "DSMbox" & i
                SetDateStartBox.Width = "65"
                SetDateStartBox.Text = ""

                SetDateEndBox.ID = "DEMbox" & i
                SetDateEndBox.Width = "65"
                SetDateEndBox.Text = ""

                SetTimeDDL.ID = "TMDDL" & i
                SetTimeDDL.Width = "60"
                SetTimeDDL.Items.Add("เลือก")
                SetTimeDDL.Items.Add("1")
                SetTimeDDL.Items.Add("2")
                SetTimeDDL.Items.Add("3")

                moduleholder.Controls.Add(SetOrderLabel)
                moduleholder.Controls.Add(SetScoreLabel)
                moduleholder.Controls.Add(SetScoreBox)
                moduleholder.Controls.Add(GetLiteral(" "))
                moduleholder.Controls.Add(SetDateStartLabel)
                moduleholder.Controls.Add(SetDateStartBox)
                moduleholder.Controls.Add(GetLiteral(" "))
                moduleholder.Controls.Add(SetDateEndLabel)
                moduleholder.Controls.Add(SetDateEndBox)
                moduleholder.Controls.Add(GetLiteral(" "))
                moduleholder.Controls.Add(SetTimeLabel)
                moduleholder.Controls.Add(SetTimeDDL)
                moduleholder.Controls.Add(GetLiteral("<br />"))
            Next
        Catch ex As Exception
            warning.Text = "พบปัญหาที่ฟังก์ชัน CreateTextBoxModule" & "<br />" & ex.Message
            Exit Sub
        End Try
    End Sub

    Sub CreateTextBoxAssignment(ByVal size As Integer)
        Try
            Dim i As Integer
            For i = 1 To size
                Dim SetOrderLabel As New Label

                Dim SetScoreLabel As New Label
                Dim SetDateStartLabel As New Label
                Dim SetDateEndLabel As New Label
                Dim SetTimeLabel As New Label

                Dim SetScoreBox As New TextBox
                Dim SetDateStartBox As New TextBox
                Dim SetDateEndBox As New TextBox
                Dim SetTimeDDL As New DropDownList

                SetOrderLabel.ID = "OAlabel" & i
                SetOrderLabel.Text = "Assignment" & i & " "

                SetScoreLabel.ID = "SAlabel" & i
                SetScoreLabel.Text = "คะแนน : "

                SetDateStartLabel.ID = "DSAlabel" & i
                SetDateStartLabel.Text = "วันเริ่มต้น : "

                SetDateEndLabel.ID = "DEAlabel" & i
                SetDateEndLabel.Text = "วันสุดท้าย : "

                SetTimeLabel.ID = "TAlabel" & i
                SetTimeLabel.Text = "เวลาที่ใช้ : "

                SetScoreBox.ID = "SAbox" & i
                SetScoreBox.Width = "25"
                SetScoreBox.Text = ""

                SetDateStartBox.ID = "DSAbox" & i
                SetDateStartBox.Width = "65"
                SetDateStartBox.Text = ""

                SetDateEndBox.ID = "DEAbox" & i
                SetDateEndBox.Width = "65"
                SetDateEndBox.Text = ""

                SetTimeDDL.ID = "TADDL" & i
                SetTimeDDL.Width = "60"
                SetTimeDDL.Items.Add("เลือก")
                SetTimeDDL.Items.Add("1")
                SetTimeDDL.Items.Add("2")
                SetTimeDDL.Items.Add("3")

                assignmentholder.Controls.Add(SetOrderLabel)
                assignmentholder.Controls.Add(SetScoreLabel)
                assignmentholder.Controls.Add(SetScoreBox)
                assignmentholder.Controls.Add(GetLiteral(" "))
                assignmentholder.Controls.Add(SetDateStartLabel)
                assignmentholder.Controls.Add(SetDateStartBox)
                assignmentholder.Controls.Add(GetLiteral(" "))
                assignmentholder.Controls.Add(SetDateEndLabel)
                assignmentholder.Controls.Add(SetDateEndBox)
                assignmentholder.Controls.Add(GetLiteral(" "))
                assignmentholder.Controls.Add(SetTimeLabel)
                assignmentholder.Controls.Add(SetTimeDDL)
                assignmentholder.Controls.Add(GetLiteral("<br />"))
            Next
        Catch ex As Exception
            warning.Text = "พบปัญหาที่ฟังก์ชัน CreateTextBoxAssignment" & "<br />" & ex.Message
            Exit Sub
        End Try
    End Sub

    Function GetScore(ByVal size As Integer, ByVal ArrScore As Array, ByVal str As String, ByVal total As String) As Array
        Dim i As Integer
        Dim sum As Integer = 0
        Dim temp(10) As String
        For i = 1 To size
            Dim sb As String = str & i
            Dim GetScoreBox As TextBox = CType(Me.FindControl(sb), TextBox)
            If IsNumeric(GetScoreBox.Text) Then
                ArrScore(i - 1) = GetScoreBox.Text
                sum = sum + Val(GetScoreBox.Text)
            ElseIf GetScoreBox.Text = "" Then
                warning.Text = "คะแนนที่ Module " & i & " : ไม่ได้ใส่ค่า"
                temp(10) = "0123456789"
                Return temp
            Else
                warning.Text = "คะแนนที่ Module " & i & " : ไม่ใช่ตัวเลข"
                temp(10) = "0123456789"
                Return temp
            End If
        Next
        If sum <> total Then
            warning.Text = "กรุณาใส่ค่าของคะแนน Module ให้ได้ค่ารวมเท่ากับค่าที่กำหนดไว้ในตอนต้น"
            temp(10) = "0123546789"
            Return temp
        Else
            Return ArrScore
        End If
    End Function

    Function GetDateStart(ByVal size As Integer, ByVal ArrDateStart As Array, ByVal str As String) As Array
        Dim i As Integer
        Dim temp(10) As String
        For i = 1 To size
            Dim ds As String = str & i
            Dim GetDSBox As TextBox = CType(Me.FindControl(ds), TextBox)
            If GetDSBox.Text = "" Then
                warning.Text = "วันเริ่มการทดสอบ " & i & " : ไม่ได้ใส่ค่า"
                temp(10) = "0123456789"
                Return temp
            Else
                ArrDateStart(i - 1) = GetDSBox.Text
            End If
        Next
        Return ArrDateStart
    End Function

    Function GetDateEnd(ByVal size As Integer, ByVal ArrDateEnd As Array, ByVal str As String) As Array
        Dim i As Integer
        Dim temp(10) As String
        For i = 1 To size
            Dim de As String = str & i
            Dim GetDEBox As TextBox = CType(Me.FindControl(de), TextBox)
            If GetDEBox.Text = "" Then
                warning.Text = "วันสิ้นสุดการทดสอบ " & i & " : ไม่ได้ใส่ค่า"
                temp(10) = "0123456789"
                Return temp
            Else
                ArrDateEnd(i - 1) = GetDEBox.Text
            End If
        Next
        Return ArrDateEnd
    End Function

    Function GetTime(ByVal size As Integer, ByVal ArrTime As Array, ByVal str As String) As Array
        Dim i As Integer
        Dim temp(10) As String
        For i = 1 To size
            Dim t As String = str & i
            Dim GetTimeDDL As DropDownList = CType(Me.FindControl(t), DropDownList)
            If GetTimeDDL.SelectedIndex = 0 Then
                warning.Text = "ระยะเวลาการทดสอบ " & i & " : ไม่ได้เลือกค่า"
                temp(10) = "0123456789"
                Return temp
            Else
                ArrTime(i - 1) = GetTimeDDL.SelectedItem.Text
            End If
        Next
        Return ArrTime
    End Function

    Protected Sub inserttesting_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles inserttesting.Click
        Dim statusM As Boolean = True
        Dim statusA As Boolean = True
        Dim sum As Integer = Val(moduletotal.Text) + Val(assignmenttotal.Text) + Val(examtotal.Text)
        If sum <> 100 Then
            warning.Text = "กรุณาใส่ค่าการทดสอบต่างๆให้ได้ค่ารวมกันเท่ากับ 100"
            Exit Sub
        Else
            If Val(moduletotal.Text) <> 0 And numberofmoduleDDL.SelectedItem.Value = "select" Then
                warning.Text = "กรุณากำหนดคะแนนของการทดสอบประจำบทเรียนต่างๆ"
                Exit Sub
            ElseIf Val(moduletotal.Text) = 0 And numberofmoduleDDL.SelectedItem.Value <> "select" Then
                warning.Text = "กรุณากำหนดคะแนนของการทดสอบประจำบทเรียนรวม"
                Exit Sub
            ElseIf Val(moduletotal.Text) = 0 And numberofmoduleDDL.SelectedItem.Value = "select" Then
                statusM = False
            End If
            If Val(assignmenttotal.Text) <> 0 And numberofassignmentDDL.SelectedItem.Value = "select" Then
                warning.Text = "กรุณากำหนดคะแนนของการทดสอบเก็บคะแนนต่างๆ"
                Exit Sub
            ElseIf Val(assignmenttotal.Text) = 0 And numberofassignmentDDL.SelectedItem.Value <> "select" Then
                warning.Text = "กรุณากำหนดคะแนนของการทดสอบเก็บคะแนนรวม"
                Exit Sub
            ElseIf Val(assignmenttotal.Text) = 0 And numberofassignmentDDL.SelectedItem.Value = "select" Then
                statusA = False
            End If

            Dim i As Integer
            If statusM = True Then
                Dim sizeM As Integer = numberofmoduleDDL.SelectedItem.Value
                Dim ArrScoreM(sizeM - 1) As String
                Dim ArrDateStartM(sizeM - 1) As String
                Dim ArrDateEndM(sizeM - 1) As String
                Dim ArrTimeM(sizeM - 1) As String

                If GetScore(sizeM, ArrScoreM, "SMbox", Val(moduletotal.Text)).Length = 11 Then
                    Exit Sub
                ElseIf GetDateStart(sizeM, ArrDateStartM, "DSMbox").Length = 11 Then
                    Exit Sub
                ElseIf GetDateEnd(sizeM, ArrDateEndM, "DEMbox").Length = 11 Then
                    Exit Sub
                ElseIf GetTime(sizeM, ArrTimeM, "TMDDL").Length = 11 Then
                    Exit Sub
                Else
                    For i = 1 To sizeM
                        QueryStr = "insert into Module(sub_id,mod_number,mod_wscore,mod_datestart,mod_dateend,mod_time,mod_year,mod_term) values('" & _
                                   subjectDDL.SelectedItem.Value & "','" & i & "','" & ArrScoreM(i - 1) & "','" & _
                                   ArrDateStartM(i - 1) & "','" & ArrDateEndM(i - 1) & "','" & ArrTimeM(i - 1) & _
                                   "','" & year.Text & "','" & term.Text & "')"
                        If ExecuteComm(QueryStr) = False Then
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Next
                End If
            End If

            If statusA = True Then
                Dim sizeA As Integer = numberofassignmentDDL.SelectedItem.Value
                Dim ArrScoreA(sizeA - 1) As String
                Dim ArrDateStartA(sizeA - 1) As String
                Dim ArrDateEndA(sizeA - 1) As String
                Dim ArrTimeA(sizeA - 1) As String

                If GetScore(sizeA, ArrScoreA, "SAbox", Val(assignmenttotal.Text)).Length = 11 Then
                    Exit Sub
                ElseIf GetDateStart(sizeA, ArrDateStartA, "DSAbox").Length = 11 Then
                    Exit Sub
                ElseIf GetDateEnd(sizeA, ArrDateEndA, "DEAbox").Length = 11 Then
                    Exit Sub
                ElseIf GetTime(sizeA, ArrTimeA, "TADDL").Length = 11 Then
                    Exit Sub
                Else
                    For i = 1 To sizeA
                        QueryStr = "insert into Assignment(sub_id,ass_number,ass_wscore,ass_datestart,ass_dateend,ass_time,ass_year,ass_term) values('" & _
                                   subjectDDL.SelectedItem.Value & "','" & i & "','" & ArrScoreA(i - 1) & "','" & _
                                   ArrDateStartA(i - 1) & "','" & ArrDateEndA(i - 1) & "','" & ArrTimeA(i - 1) & _
                                   "','" & year.Text & "','" & term.Text & "')"
                        If ExecuteComm(QueryStr) = False Then
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Next
                End If
            End If
            QueryStr = "insert into Examination(sub_id,exm_number,exm_wscore,exm_datestart,exm_dateend,exm_time,exm_year,exm_term) values('" & _
                       subjectDDL.SelectedItem.Value & "','1','" & examtotal.Text & "','" & _
                       datestart.Text & "','" & dateend.Text & "','3','" & year.Text & "','" & term.Text & "')"
            If ExecuteComm(QueryStr) = False Then
                Response.Redirect("../DBFailed.aspx")
            End If
            Response.Redirect("../Result.aspx?msg=การกำหนดคะแนนการทดสอบเสร็จเรียบร้อยแล้ว&user=Teacher")
        End If
    End Sub

    Protected Sub subjectDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles subjectDDL.SelectedIndexChanged
        table1.Visible = False
        table2.Visible = False
        warning.Text = ""
    End Sub

    Protected Sub typetestingDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles typetestingDDL.SelectedIndexChanged
        Dim prefix As String = ""
        Dim tablename As String = ""
        Dim mydate(2) As String
        If typetestingDDL.SelectedItem.Value = "Module" Then
            prefix = "mod_"
            tablename = "Module"
        ElseIf typetestingDDL.SelectedItem.Value = "Assignment" Then
            prefix = "ass_"
            tablename = "Assignment"
        Else
            numberoftestingDDL.Items.Clear()
            Exit Sub
        End If
        QueryStr = "select " & prefix & "id," & prefix & "number from " & tablename & " where sub_id = '" & _
                    subjectDDL.SelectedItem.Value & "' and " & prefix & "year = (select max(" & prefix & _
                    "year) from " & tablename & ") and " & prefix & "term = (select max(" & prefix & _
                    "term) from " & tablename & " where " & prefix & "year = (select max(" & prefix & _
                    "year) from " & tablename & "))"
        TableStr = "getidandnumber"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                numberoftestingDDL.DataTextField = prefix & "number"
                numberoftestingDDL.DataValueField = prefix & "id"
                numberoftestingDDL.DataSource = sqlDS.Tables(TableStr)
                numberoftestingDDL.DataBind()
                warning.Text = ""
                QueryStr = "select " & prefix & "wscore," & prefix & "datestart," & prefix & "dateend," & prefix & _
                    "time," & prefix & "year," & prefix & "term from " & tablename & " where sub_id = '" & _
                    subjectDDL.SelectedItem.Value & "' and " & prefix & "number = '" & numberoftestingDDL.SelectedItem.Text & "'"
                TableStr = "getdetailtesting"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            updatescore.Text = row(prefix & "wscore")

                            mydate = CStr(row(prefix & "datestart")).Split("/")
                            '----------
                            mydate(2) = mydate(2) - 543
                            txt1.Value = mydate(0) & "/" & mydate(1) & "/" & mydate(2)
                            '----------

                            mydate = CStr(row(prefix & "dateend")).Split("/")
                            '----------
                            mydate(2) = mydate(2) - 543
                            txt2.Value = mydate(0) & "/" & mydate(1) & "/" & mydate(2)
                            '----------

                            'updatedatestart.Text = row(prefix & "datestart")
                            'updatedateend.Text = row(prefix & "dateend")

                            updatetimeDDL.SelectedIndex = Val(row(prefix & "time"))
                            updateyear.Text = row(prefix & "year")
                            updateterm.Text = row(prefix & "term")
                        Next
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            Else
                warning.Text = "การทดสอบนี้ไม่มีข้อมูล"
                numberoftestingDDL.Items.Clear()
                updatescore.Text = ""

                '-------
                txt1.Value = ""
                txt2.Value = ""
                '-------

                'updatedatestart.Text = ""
                'updatedateend.Text = ""
                updatetimeDDL.SelectedIndex = 0

                Exit Sub
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub numberoftestingDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles numberoftestingDDL.SelectedIndexChanged
        Dim prefix As String = ""
        Dim tablename As String = ""
        Dim mydate(2) As String
        If typetestingDDL.SelectedItem.Value = "Module" Then
            prefix = "mod_"
            tablename = "Module"
        ElseIf typetestingDDL.SelectedItem.Value = "Assignment" Then
            prefix = "ass_"
            tablename = "Assignment"
        Else
            Exit Sub
        End If
        QueryStr = "select " & prefix & "wscore," & prefix & "datestart," & prefix & "dateend," & prefix & _
                    "time," & prefix & "year," & prefix & "term from " & tablename & " where sub_id = '" & _
                    subjectDDL.SelectedItem.Value & "' and " & prefix & "number = '" & numberoftestingDDL.SelectedItem.Text & "'"
        TableStr = "getdetailtesting"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    updatescore.Text = row(prefix & "wscore")

                    mydate = CStr(row(prefix & "datestart")).Split("/")
                    '----------
                    mydate(2) = mydate(2) - 543
                    txt1.Value = mydate(0) & "/" & mydate(1) & "/" & mydate(2)
                    '----------

                    mydate = CStr(row(prefix & "dateend")).Split("/")
                    '----------
                    mydate(2) = mydate(2) - 543
                    txt2.Value = mydate(0) & "/" & mydate(1) & "/" & mydate(2)
                    '----------

                    'updatedatestart.Text = row(prefix & "datestart")
                    'updatedateend.Text = row(prefix & "dateend")

                    updatetimeDDL.SelectedIndex = Val(row(prefix & "time"))
                    updateyear.Text = row(prefix & "year")
                    updateterm.Text = row(prefix & "term")
                Next
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub cleartable2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cleartable2.Click
        '-------
        txt1.Value = ""
        txt2.Value = ""
        '-------

        'updatedatestart.Text = ""
        'updatedateend.Text = ""

        updatetimeDDL.SelectedIndex = 0
        warning.Text = ""
    End Sub

    Protected Sub updatetesting_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updatetesting.Click
        Dim prefix As String = ""
        Dim tablename As String = ""
        If typetestingDDL.SelectedItem.Value = "select" Then
            warning.Text = "กรุณาเลือกประเภทของการทดสอบ"
            Exit Sub
        Else
            If typetestingDDL.SelectedItem.Value = "Module" Then
                prefix = "mod_"
                tablename = "Module"
            ElseIf typetestingDDL.SelectedItem.Value = "Assignment" Then
                prefix = "ass_"
                tablename = "Assignment"
            End If
            If numberoftestingDDL.Items.Count = 0 Then
                warning.Text = "การทดสอบนี้ไม่มีข้อมูล"
                Exit Sub
            End If
            If txt1.Value = "" Or txt2.Value = "" Or updatetimeDDL.SelectedIndex = 0 Then
                'If updatedatestart.Text = "" Or updatedateend.Text = "" Or updatetimeDDL.SelectedIndex = 0 Then
                warning.Text = "กรุณาใส่ข้อมูลให้ครบถ้วน"
                Exit Sub
            Else
                Dim arr(2) As String
                arr = txt1.Value.Split("/")
                arr(2) = Val(arr(2)) + 543
                Dim datetostart As String = arr(0) & "/" & arr(1) & "/" & arr(2)

                arr = txt2.Value.Split("/")
                arr(2) = Val(arr(2)) + 543
                Dim datetoend As String = arr(0) & "/" & arr(1) & "/" & arr(2)

                'QueryStr = "update " & tablename & " set " & prefix & "datestart = '" & updatedatestart.Text & _
                '            "'," & prefix & "dateend = '" & updatedateend.Text & "'," & prefix & "time = '" & updatetimeDDL.SelectedItem.Value & "'" & _
                '            " where sub_id = '" & subjectDDL.SelectedItem.Value & "' and " & prefix & "id = '" & numberoftestingDDL.SelectedItem.Value & "'"

                QueryStr = "update " & tablename & " set " & prefix & "datestart = '" & datetostart & _
                            "'," & prefix & "dateend = '" & datetoend & "'," & prefix & "time = '" & updatetimeDDL.SelectedItem.Value & "'" & _
                            " where sub_id = '" & subjectDDL.SelectedItem.Value & "' and " & prefix & "id = '" & numberoftestingDDL.SelectedItem.Value & "'"
                If ExecuteComm(QueryStr) = True Then
                    Response.Redirect("../Result.aspx?msg=การแก้ไขวันและเวลาของการทดสอบเสร็จเรียบร้อยแล้ว&user=Teacher")
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            End If
        End If
    End Sub

End Class
