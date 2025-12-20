Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class Teacher_TeacherTesting
    Inherits System.Web.UI.Page

    Protected Sub createtesting_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles createtesting.Click
        If subjectDDL.Items.Count = 0 Then
            warning.Text = "ไม่พบข้อมูลของรายวิชาต่างๆ"
            tableUpAss1.Visible = False
            tableUpAss2.Visible = False
            table1.Visible = False
            testingform.Visible = False
            table2.Visible = False
            updateform.Visible = False
            Exit Sub
        End If
        tableUpAss1.Visible = False
        tableUpAss2.Visible = False
        table1.Visible = True
        testingform.Visible = False
        table2.Visible = False
        updateform.Visible = False
        warning.Text = ""
        createtypetestingDDL.SelectedIndex = 0
        createtestingDDL.Items.Clear()
    End Sub

    Protected Sub managetesting_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles managetesting.Click
        If subjectDDL.Items.Count = 0 Then
            warning.Text = "ไม่พบข้อมูลของรายวิชาต่างๆ"
            tableUpAss1.Visible = False
            tableUpAss2.Visible = False
            table1.Visible = False
            testingform.Visible = False
            table2.Visible = False
            updateform.Visible = False
            Exit Sub
        End If
        tableUpAss1.Visible = False
        tableUpAss2.Visible = False
        table1.Visible = False
        testingform.Visible = False
        table2.Visible = True
        updateform.Visible = False
        warning.Text = ""
        updatetypetestingDDL.SelectedIndex = 0
        updatetestingDDL.Items.Clear()
        updatequestionDDL.Items.Clear()
    End Sub

    Protected Sub createtypetestingDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles createtypetestingDDL.SelectedIndexChanged
        warning.Text = ""
        Dim prefix As String = ""
        Dim tablename As String = ""
        If createtypetestingDDL.SelectedItem.Value = "Module" Then
            prefix = "mod_"
            tablename = "Module"
        ElseIf createtypetestingDDL.SelectedItem.Value = "Assignment" Then
            prefix = "ass_"
            tablename = "Assignment"
        ElseIf createtypetestingDDL.SelectedItem.Value = "Examination" Then
            prefix = "exm_"
            tablename = "Examination"
        Else
            createtestingDDL.Items.Clear()
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
                createtestingDDL.DataTextField = prefix & "number"
                createtestingDDL.DataValueField = prefix & "id"
                createtestingDDL.DataSource = sqlDS.Tables(TableStr)
                createtestingDDL.DataBind()
            Else
                warning.Text = "ยังไม่มีข้อมูล"
                Exit Sub
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
        testingform.Visible = False
    End Sub

    Protected Sub createok_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles createok.Click
        createquestion.Text = ""
        createpicture.Style.Clear()
        createscore.Text = ""
        numberofchoiceDDL.SelectedIndex = 0
        choiceanswerholder.Controls.Clear()
        warning.Text = ""
        If createtestingDDL.Items.Count = 0 Then
            testingform.Visible = False
            warning.Text = "ไม่พบข้อมูล"
            Exit Sub
        Else
            '-------------------------------------- เช็คว่า ได้มีการกำหนด Assignment ครั้งนี้แล้วหรือยัง
            QueryStr = "select asst_id from AssignmentTopic where ass_id = '" & createtestingDDL.SelectedItem.Value & "'"
            TableStr = "getasstid"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    warning.Text = "การทดสอบครั้งที่ " & createtestingDDL.SelectedItem.Text & " นี้ได้มีการกำหนด Assignment ไว้แล้ว"
                    tableUpAss1.Visible = False
                    tableUpAss2.Visible = False
                    table1.Visible = False
                    testingform.Visible = False
                    table2.Visible = False
                    updateform.Visible = False
                    Exit Sub
                ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then

                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If


            testingform.Visible = True
            warning.Text = ""
        End If
        table2.Visible = False
        updateform.Visible = False
    End Sub

    Protected Sub subjectDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles subjectDDL.SelectedIndexChanged
        tableUpAss1.Visible = False
        topicUpAss1.Text = ""
        descUpAss1.Text = ""
        UpAssFile1.Controls.Clear()

        tableUpAss2.Visible = False
        topicUpAss2.Text = ""
        descUpAss2.Text = ""
        UpAssFile2.Controls.Clear()

        table1.Visible = False
        testingform.Visible = False
        table2.Visible = False
        updateform.Visible = False
        warning.Text = ""
    End Sub

    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    '    Try
    '        If Session("loginstatus") = True And Session("user") <> 0 Then
    '            If Session("usertype") = "Teacher" Then
    '            Else
    '                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้สอน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
    '            End If
    '        Else
    '            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
    '        End If

    '        If Not Page.IsPostBack Then
    '        Else
    '            If testingform.Visible = True Then
    '                If numberofchoiceDDL.SelectedItem.Value = "select" Then
    '                    Exit Sub
    '                ElseIf numberofchoiceDDL.SelectedItem.Value <> "select" Then
    '                    warning.Text = ""
    '                    CreateChoice(numberofchoiceDDL.SelectedItem.Value)
    '                End If
    '            End If
    '            If updateform.Visible = True Then
    '                Dim prefix As String = ""
    '                Dim tablename As String = ""
    '                If updatetypetestingDDL.SelectedItem.Value = "select" Then
    '                    Exit Sub
    '                ElseIf updatetypetestingDDL.SelectedItem.Value = "Module" Then
    '                    prefix = "mod_"
    '                    tablename = "Module"
    '                ElseIf updatetypetestingDDL.SelectedItem.Value = "Assignment" Then
    '                    prefix = "ass_"
    '                    tablename = "Assignment"
    '                ElseIf updatetypetestingDDL.SelectedItem.Value = "Examination" Then
    '                    prefix = "exm_"
    '                    tablename = "Examination"
    '                End If
    '                If updatequestionDDL.Items.Count = 0 Then
    '                    Exit Sub
    '                Else
    '                    QueryStr = "select chc_choice,chc_answer from Choice" & tablename & " where qst_id = '" & updatequestionDDL.SelectedItem.Value & "'"
    '                    TableStr = "getmychoice"
    '                    If FillCommQ(QueryStr, TableStr) = True Then
    '                        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
    '                            CreateChoiceUpdate(sqlDS)
    '                        Else
    '                            warning.Text = "ไม่พบตัวเลือก"
    '                            Exit Sub
    '                        End If
    '                    Else
    '                        Response.Redirect("../DBfailed.aspx")
    '                    End If
    '                End If
    '            End If
    '            If tableUpAss2.Visible = True Then
    '                Dim size As Integer = 0
    '                Dim filename(0) As String
    '                Dim filepath(0) As String
    '                Dim i As Integer = 0
    '                If UpAssDDL2.Items.Count = 0 Then
    '                    Exit Sub
    '                Else
    '                    QueryStr = "select * from AssignmentFile where ass_id = '" & UpAssDDL2.SelectedItem.Value & "'"
    '                    TableStr = "getdetailassignmentfile"
    '                    If FillCommQ(QueryStr, TableStr) = True Then
    '                        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
    '                            size = sqlDS.Tables(TableStr).Rows.Count
    '                            ReDim filename(size - 1)
    '                            ReDim filepath(size - 1)
    '                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
    '                                If row("assf_file") Is DBNull.Value Or row("assf_path") Is DBNull.Value Then
    '                                    filename(i) = "-"
    '                                    filepath(i) = "-"
    '                                ElseIf row("assf_file") = "" Or row("assf_path") = "" Then
    '                                    filename(i) = "-"
    '                                    filepath(i) = "-"
    '                                Else
    '                                    filename(i) = row("assf_file")
    '                                    filepath(i) = row("assf_path")
    '                                End If

    '                                'topicUpAss2.Text = row("assf_topic")
    '                                'descUpAss2.Text = row("assf_description")
    '                                i = i + 1
    '                            Next
    '                            CreateFileForDelete(size, filename, filepath)
    '                        ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
    '                            warning.Text = "ไม่พบข้อมูลของการทดสอบเก็บคะแนน"
    '                            Exit Sub
    '                        Else
    '                            Response.Redirect("../DBFailed.aspx")
    '                        End If
    '                    Else
    '                        Response.Redirect("../DBFailed.aspx")
    '                    End If
    '                End If
    '            End If
    '        End If
    '    Catch ex As Exception
    '        warning.Text = ex.Message
    '        Exit Sub
    '    End Try
    'End Sub

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
                deletetesting.Attributes.Add("onclick", "return confirm('Are you sure you want to delete this testing ?');")
                deleteAss.Attributes.Add("onclick", "return confirm('Are you sure you want to delete this assignment ?');")
                If testingform.Visible = True Then
                    If numberofchoiceDDL.SelectedItem.Value = "select" Then
                        Exit Sub
                    ElseIf numberofchoiceDDL.SelectedItem.Value <> "select" Then
                        warning.Text = ""
                        CreateChoice(numberofchoiceDDL.SelectedItem.Value)
                    End If
                End If
                If updateform.Visible = True Then
                    Dim prefix As String = ""
                    Dim tablename As String = ""
                    If updatetypetestingDDL.SelectedItem.Value = "select" Then
                        Exit Sub
                    ElseIf updatetypetestingDDL.SelectedItem.Value = "Module" Then
                        prefix = "mod_"
                        tablename = "Module"
                    ElseIf updatetypetestingDDL.SelectedItem.Value = "Assignment" Then
                        prefix = "ass_"
                        tablename = "Assignment"
                    ElseIf updatetypetestingDDL.SelectedItem.Value = "Examination" Then
                        prefix = "exm_"
                        tablename = "Examination"
                    End If
                    If updatequestionDDL.Items.Count = 0 Then
                        Exit Sub
                    Else
                        QueryStr = "select chc_choice,chc_answer from Choice" & tablename & " where qst_id = '" & updatequestionDDL.SelectedItem.Value & "'"
                        TableStr = "getmychoice"
                        If FillCommQ(QueryStr, TableStr) = True Then
                            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                                CreateChoiceUpdate(sqlDS)
                            Else
                                warning.Text = "ไม่พบตัวเลือก"
                                Exit Sub
                            End If
                        Else
                            Response.Redirect("../DBfailed.aspx")
                        End If
                    End If
                End If

                If tableUpAss2.Visible = True Then
                    Dim size As Integer = 0
                    Dim filename(0) As String
                    Dim filepath(0) As String
                    Dim i As Integer = 0
                    If UpAssDDL2.Items.Count = 0 Then
                        Exit Sub
                    Else
                        Dim AssTID As Integer = 0
                        QueryStr = "select * from AssignmentTopic where ass_id = '" & UpAssDDL2.SelectedItem.Value & "'"
                        TableStr = "getAssignmentTopic"
                        If FillCommQ(QueryStr, TableStr) = True Then
                            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                    AssTID = Val(row("asst_id"))
                                Next
                                QueryStr = "select * from AssignmentFile where asst_id = '" & AssTID & "'"
                                TableStr = "getAssignmentFile"
                                If FillCommQ(QueryStr, TableStr) = True Then
                                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                                        size = sqlDS.Tables(TableStr).Rows.Count
                                        ReDim filename(size - 1)
                                        ReDim filepath(size - 1)
                                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                            If row("assf_file") Is DBNull.Value Or row("assf_path") Is DBNull.Value Then
                                                filename(i) = "-"
                                                filepath(i) = "-"
                                            ElseIf row("assf_file") = "" Or row("assf_path") = "" Then
                                                filename(i) = "-"
                                                filepath(i) = "-"
                                            Else
                                                filename(i) = row("assf_file")
                                                filepath(i) = row("assf_path")
                                            End If
                                            i = i + 1
                                        Next
                                        CreateFileForDelete(size, filename, filepath)
                                    ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                                        '------------------------------------------------ ไม่มีไฟล์
                                    Else
                                        Response.Redirect("../DBFailed.aspx")
                                    End If
                                Else
                                    Response.Redirect("../DBFailed.aspx")
                                End If
                            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                                warning.Text = "ไม่พบข้อมูลของการทดสอบเก็บคะแนน"
                                Exit Sub
                            Else
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
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

    Sub CreateChoice(ByVal size As Integer)
        Try
            Dim i As Integer
            For i = 1 To size
                Dim SetChoiceBox As New TextBox
                Dim SetAnswerBox As New CheckBox

                SetChoiceBox.ID = "Cbox" & i
                SetChoiceBox.Width = "400"
                SetChoiceBox.Height = "50"
                SetChoiceBox.TextMode = TextBoxMode.MultiLine
                SetChoiceBox.Text = ""

                SetAnswerBox.ID = "Abox" & i
                SetAnswerBox.Text = ""

                choiceanswerholder.Controls.Add(GetLiteral(i & ". "))
                choiceanswerholder.Controls.Add(SetChoiceBox)
                choiceanswerholder.Controls.Add(GetLiteral(" Answer : "))
                choiceanswerholder.Controls.Add(SetAnswerBox)
                choiceanswerholder.Controls.Add(GetLiteral("<br />"))
            Next
        Catch ex As Exception
            warning.Text = "พบปัญหาที่ฟังก์ชัน CreateTextBox" & "<br />" & ex.Message
            Exit Sub
        End Try
    End Sub

    Function GetChoice(ByVal size As Integer, ByVal ArrChoice As Array) As Array
        Dim i As Integer
        Dim temp(5) As String
        For i = 1 To size
            Dim c As String = "Cbox" & i
            Dim GetChoiceBox As TextBox = CType(Me.FindControl(c), TextBox)
            If GetChoiceBox.Text = "" Then
                warning.Text = "ตัวเลือกที่ " & i & " : ไม่ได้ใส่ค่า"
                temp(5) = "0123456789"
                Return temp
            Else
                ArrChoice(i - 1) = GetChoiceBox.Text
            End If
        Next
        Return ArrChoice
    End Function

    Function GetAnswer(ByVal size As Integer, ByVal ArrAnswer As Array) As Array
        Dim i As Integer
        Dim temp(5) As String
        Dim counttrue As Integer = 0
        Dim countfalse As Integer = 0
        For i = 1 To size
            Dim a As String = "Abox" & i
            Dim GetAnswerBox As CheckBox = CType(Me.FindControl(a), CheckBox)
            If GetAnswerBox.Checked Then
                ArrAnswer(i - 1) = "1"
                counttrue = counttrue + 1
            Else
                ArrAnswer(i - 1) = "0"
                countfalse = countfalse + 1
            End If
        Next
        If counttrue = size Then
            warning.Text = "คุณกำหนดให้ตัวเลือกทุกข้อเป็นคำตอบที่ถูกไม่ได้ กรุณากำหนดใหม่"
            temp(5) = "0123456789"
            Return temp
        ElseIf countfalse = size Then
            warning.Text = "คุณกำหนดให้ตัวเลือกทุกข้อเป็นคำตอบที่ผิดไม่ได้ กรุณากำหนดใหม่"
            temp(5) = "0123456789"
            Return temp
        Else
            Return ArrAnswer
        End If
    End Function

    Protected Sub cleartableform_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cleartableform.Click
        createquestion.Text = ""
        createpicture.Style.Clear()
        createscore.Text = ""
        numberofchoiceDDL.SelectedIndex = 0
        choiceanswerholder.Controls.Clear()
        warning.Text = ""
    End Sub

    Protected Sub addtableform_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addtableform.Click
        Dim prefix As String = ""
        Dim tablename As String = ""
        Dim checktype As String = ""
        Dim statuspic As Boolean = False
        Dim number As String = ""
        Dim currentID As String = ""
        If createtypetestingDDL.SelectedItem.Value = "select" Then
            warning.Text = "กรุณาเลือกประเภทของการทดสอบ"
            Exit Sub
        ElseIf createtypetestingDDL.SelectedItem.Value = "Module" Then
            prefix = "mod_"
            tablename = "Module"
        ElseIf createtypetestingDDL.SelectedItem.Value = "Assignment" Then
            prefix = "ass_"
            tablename = "Assignment"
        ElseIf createtypetestingDDL.SelectedItem.Value = "Examination" Then
            prefix = "exm_"
            tablename = "Examination"
        End If
        If createtestingDDL.Items.Count = 0 Then
            warning.Text = "ไม่มีข้อมูล"
            Exit Sub
        End If
        If numberofchoiceDDL.SelectedItem.Value = "select" Then
            warning.Text = "กรุณากำหนดตัวเลือก"
            Exit Sub
        End If
        Dim ArrChoice(numberofchoiceDDL.SelectedItem.Value - 1) As String
        Dim ArrAnswer(numberofchoiceDDL.SelectedItem.Value - 1) As String
        Dim objpic As New FileInfo(Server.MapPath("~") & "\PictureQuestion\" & tablename & "\" & Path.GetFileName(createpicture.PostedFile.FileName.Trim()))
        If GetChoice(numberofchoiceDDL.SelectedItem.Value, ArrChoice).Length = 6 Then
            Exit Sub
        ElseIf GetAnswer(numberofchoiceDDL.SelectedItem.Value, ArrAnswer).Length = 6 Then
            Exit Sub
        Else
            If (createpicture.PostedFile.FileName <> "" And createpicture.PostedFile.FileName.Trim().Length > 0 And createpicture.PostedFile.ContentLength > 0 And createpicture.PostedFile.ContentLength <= 400000000) Then
                checktype = createpicture.PostedFile.ContentType
                checktype = checktype.Substring(0, 5)
                If checktype = "image" Then
                Else
                    warning.Text = "ไฟล์ที่คุณเลือกสำหรับเป็นรูปภาพประกอบไม่ใช่ไฟล์ประเภทรูปภาพ กรุณาเลือกไฟล์รูปภาพประกอบใหม่"
                    Exit Sub
                End If
                If objpic.Exists Then
                    statuspic = False
                    warning.Text = "กรุณาเปลี่ยนชื่อไฟล์รูปภาพประกอบ"
                    Exit Sub
                Else
                    statuspic = True
                End If
            Else
                statuspic = False
            End If

            QueryStr = "select count(qst_number) as countnumber from Question" & tablename & " where " & prefix & "id = '" & createtestingDDL.SelectedItem.Value & "'"
            TableStr = "getcountnumber"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        number = row("countnumber")
                    Next
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If

            number = Val(number) + 1

            If statuspic = True Then
                createpicture.PostedFile.SaveAs(Server.MapPath("~") & "\PictureQuestion\" & tablename & "\" & Path.GetFileName(createpicture.PostedFile.FileName.Trim()))
                QueryStr = "insert into Question" & tablename & "(" & prefix & "id,qst_number,qst_question,qst_picfile,qst_picpath,qst_score) values('" & _
                    createtestingDDL.SelectedItem.Value & "','" & number & "','" & createquestion.Text & "','" & Path.GetFileName(createpicture.PostedFile.FileName.Trim()) & "','" & _
                    "PictureQuestion/" & tablename & "/" & Path.GetFileName(createpicture.PostedFile.FileName.Trim()) & "','" & createscore.Text & "')"
            Else
                QueryStr = "insert into Question" & tablename & "(" & prefix & "id,qst_number,qst_question,qst_score) values('" & _
                    createtestingDDL.SelectedItem.Value & "','" & number & "','" & createquestion.Text & "','" & createscore.Text & "')"
            End If

            OpenConn()

            sqlComm = New SqlCommand(QueryStr, sqlConn)
            sqlComm.CommandType = CommandType.Text
            sqlComm.ExecuteNonQuery()

            QueryStr = "select @@identity as currentID"
            TableStr = "getcurrentID"
            If FillCommQ(QueryStr, TableStr) = True Then
                If IsNothing(sqlDS) Then
                    warning.Text = "Dataset has not found . There is no currentID." & "<br />" & "ไม่สามารถกำหนดตัวเลือกได้"
                    Exit Sub
                Else
                    If sqlDS.Tables(TableStr).Columns.Count > 0 Then
                        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                currentID = row("currentID")
                                Exit For
                            Next
                        Else
                            warning.Text = "Dataset has no row. There is no currentID." & "<br />" & "ไม่สามารถกำหนดตัวเลือกได้"
                            Exit Sub
                        End If
                    Else
                        warning.Text = "Dataset has no column. There is no currentID." & "<br />" & "ไม่สามารถกำหนดตัวเลือกได้"
                        Exit Sub
                    End If
                End If
            Else
                Response.Write("../DBFailed.aspx")
            End If

            Dim i As Integer = 0
            For i = 1 To numberofchoiceDDL.SelectedItem.Value
                QueryStr = "insert into Choice" & tablename & "(qst_id,chc_choice,chc_answer) values('" & _
                    currentID & "','" & ArrChoice(i - 1) & "','" & ArrAnswer(i - 1) & "')"
                If ExecuteComm(QueryStr) = False Then
                    Response.Redirect("../DBFailed.aspx")
                End If
            Next
            createquestion.Text = ""
            createpicture.Style.Clear()
            createscore.Text = ""
            numberofchoiceDDL.SelectedIndex = 0
            choiceanswerholder.Controls.Clear()
            Response.Redirect("../Result.aspx?msg=การสร้างข้อสอบข้อที่ " & number & "เสร็จเรียบร้อยแล้ว&user=Teacher&action=redirect")
        End If
    End Sub

    Protected Sub viewtableform_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles viewtableform.Click
        Dim prefix As String = ""
        Dim tablename As String = ""
        If createtypetestingDDL.SelectedItem.Value = "select" Then
            warning.Text = "กรุณาเลือกประเภทของการทดสอบ"
            Exit Sub
        ElseIf createtypetestingDDL.SelectedItem.Value = "Module" Then
            prefix = "mod_"
            tablename = "Module"
        ElseIf createtypetestingDDL.SelectedItem.Value = "Assignment" Then
            prefix = "ass_"
            tablename = "Assignment"
        ElseIf createtypetestingDDL.SelectedItem.Value = "Examination" Then
            prefix = "exm_"
            tablename = "Examination"
        End If
        If createtestingDDL.Items.Count = 0 Then
            warning.Text = "ไม่มีข้อมูล"
            Exit Sub
        End If
        Response.Redirect("TeacherViewTesting.aspx?type=Question" & tablename & "&subtype=" & prefix & "id&typeid=" & createtestingDDL.SelectedItem.Value)
    End Sub

    Protected Sub updatetypetestingDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles updatetypetestingDDL.SelectedIndexChanged
        warning.Text = ""
        Dim prefix As String = ""
        Dim tablename As String = ""
        If updatetypetestingDDL.SelectedItem.Value = "Module" Then
            prefix = "mod_"
            tablename = "Module"
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Assignment" Then
            prefix = "ass_"
            tablename = "Assignment"
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Examination" Then
            prefix = "exm_"
            tablename = "Examination"
        Else
            updatetestingDDL.Items.Clear()
            updatequestionDDL.Items.Clear()
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
                updatetestingDDL.DataTextField = prefix & "number"
                updatetestingDDL.DataValueField = prefix & "id"
                updatetestingDDL.DataSource = sqlDS.Tables(TableStr)
                updatetestingDDL.DataBind()
                '---------------------------------------------------------
                QueryStr = "select qst_id,qst_number from Question" & tablename & " where " & prefix & "id = '" & updatetestingDDL.SelectedItem.Value & "'"
                TableStr = "getquestionid"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                        updatequestionDDL.DataTextField = "qst_number"
                        updatequestionDDL.DataValueField = "qst_id"
                        updatequestionDDL.DataSource = sqlDS.Tables(TableStr)
                        updatequestionDDL.DataBind()
                    Else
                        warning.Text = "ยังไม่มีข้อมูลของข้อสอบ"
                        updatequestionDDL.Items.Clear()
                        Exit Sub
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            Else
                warning.Text = "ยังไม่มีข้อมูลของการกำหนดการทดสอบ"
                updatequestionDDL.Items.Clear()
                Exit Sub
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub updatetestingDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles updatetestingDDL.SelectedIndexChanged
        warning.Text = ""
        Dim prefix As String = ""
        Dim tablename As String = ""
        If updatetypetestingDDL.SelectedItem.Value = "select" Then
            warning.Text = "กรุณาเลือกประเภทการทดสอบ"
            Exit Sub
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Module" Then
            prefix = "mod_"
            tablename = "Module"
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Assignment" Then
            prefix = "ass_"
            tablename = "Assignment"
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Examination" Then
            prefix = "exm_"
            tablename = "Examination"
        End If
        QueryStr = "select qst_id,qst_number from Question" & tablename & " where " & prefix & "id = '" & updatetestingDDL.SelectedItem.Value & "'"
        TableStr = "getquestionid"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                updatequestionDDL.DataTextField = "qst_number"
                updatequestionDDL.DataValueField = "qst_id"
                updatequestionDDL.DataSource = sqlDS.Tables(TableStr)
                updatequestionDDL.DataBind()
            Else
                warning.Text = "ยังไม่มีข้อมูลของข้อสอบ"
                updatequestionDDL.Items.Clear()
                Exit Sub
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub updatequestionDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles updatequestionDDL.SelectedIndexChanged
        warning.Text = ""
        'updateform.Visible = True
        'showchoiceanswerholder.Controls.Clear()
        'Dim prefix As String = ""
        'Dim tablename As String = ""
        'If updatetypetestingDDL.SelectedItem.Value = "select" Then
        '    warning.Text = "กรุณาเลือกประเภทการทดสอบ"
        '    Exit Sub
        'ElseIf updatetypetestingDDL.SelectedItem.Value = "Module" Then
        '    prefix = "mod_"
        '    tablename = "Module"
        'ElseIf updatetypetestingDDL.SelectedItem.Value = "Assignment" Then
        '    prefix = "ass_"
        '    tablename = "Assignment"
        'ElseIf updatetypetestingDDL.SelectedItem.Value = "Examination" Then
        '    prefix = "exm_"
        '    tablename = "Examination"
        'End If
        'If updatequestionDDL.SelectedItem.Text = "" Then
        '    Exit Sub
        'Else
        '    QueryStr = "select qst_question,qst_picpath,qst_score from Question" & tablename & " where qst_id = '" & updatequestionDDL.SelectedItem.Value & "'"
        '    TableStr = "getquestion"
        '    If FillCommQ(QueryStr, TableStr) = True Then
        '        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
        '            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
        '                updatequestion.Text = row("qst_question")
        '                If IsNothing(row("qst_picpath")) Then
        '                Else
        '                    oldpicture.ImageUrl = "~/" & row("qst_picpath")
        '                End If
        '                score.Text = row("qst_score")
        '            Next
        '        Else
        '            Response.Redirect("../DBfailed.aspx")
        '        End If
        '    Else
        '        Response.Redirect("../DBfailed.aspx")
        '    End If

        '    Dim i As Integer = 0
        '    QueryStr = "select chc_choice,chc_answer from Choice" & tablename & " where qst_id = '" & updatequestionDDL.SelectedItem.Value & "'"
        '    TableStr = "getmychoice"
        '    If FillCommQ(QueryStr, TableStr) = True Then
        '        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
        '            CreateChoiceUpdate(sqlDS)
        '        Else
        '            warning.Text = "ไม่พบตัวเลือก"
        '            Exit Sub
        '        End If
        '    Else
        '        Response.Redirect("../DBfailed.aspx")
        '    End If
        'End If
    End Sub

    Protected Sub clearupdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clearupdate.Click
        Dim choice As Integer = 0
        Dim prefix As String = ""
        Dim tablename As String = ""
        If updatetypetestingDDL.SelectedItem.Value = "select" Then
            warning.Text = "กรุณาเลือกประเภทการทดสอบ"
            Exit Sub
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Module" Then
            prefix = "mod_"
            tablename = "Module"
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Assignment" Then
            prefix = "ass_"
            tablename = "Assignment"
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Examination" Then
            prefix = "exm_"
            tablename = "Examination"
        End If
        If updatequestionDDL.Items.Count = 0 Then
            warning.Text = "ไม่มีข้อมูลของการทดสอบนี้"
            Exit Sub
        Else
            QueryStr = "select count(chc_choice) as clearchoice from Choice" & tablename & " where qst_id = '" & updatequestionDDL.SelectedItem.Value & "'"
            TableStr = "getchoice"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        choice = row("clearchoice")
                    Next
                Else
                    Response.Redirect("../DBfailed.aspx")
                End If
            Else
                Response.Redirect("../DBfailed.aspx")
            End If
        End If
        updatequestion.Text = ""
        newpicture.Style.Clear()
        score.Text = ""
        warning.Text = ""
        Dim i As Integer
        For i = 1 To choice
            Dim c As String = "C" & i
            Dim a As String = "A" & i
            Dim getchoice As TextBox = CType(Me.FindControl(c), TextBox)
            Dim getanswer As CheckBox = CType(Me.FindControl(a), CheckBox)
            getchoice.Text = ""
            getanswer.Checked = False
        Next
    End Sub

    Protected Sub deletetesting_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles deletetesting.Click
        Dim prefix As String = ""
        Dim tablename As String = ""
        If updatetypetestingDDL.SelectedItem.Value = "select" Then
            warning.Text = "กรุณาเลือกประเภทการทดสอบ"
            Exit Sub
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Module" Then
            prefix = "mod_"
            tablename = "Module"
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Assignment" Then
            prefix = "ass_"
            tablename = "Assignment"
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Examination" Then
            prefix = "exm_"
            tablename = "Examination"
        End If
        If updatequestionDDL.Items.Count = 0 Then
            warning.Text = "ไม่มีข้อมูลของการทดสอบ"
            Exit Sub
        Else
            Dim count As Integer = updatequestionDDL.Items.Count
            Dim number As Integer = Val(updatequestionDDL.SelectedItem.Text)
            Dim i As Integer = 0

            QueryStr = "delete from Choice" & tablename & " where qst_id = '" & updatequestionDDL.SelectedItem.Value & "'"
            If ExecuteComm(QueryStr) = True Then
                QueryStr = "delete from Question" & tablename & " where qst_id = '" & updatequestionDDL.SelectedItem.Value & "'"
                If ExecuteComm(QueryStr) = True Then
                    For i = (number + 1) To count
                        QueryStr = "update Question" & tablename & " set qst_number = '" & Val(updatequestionDDL.Items(i - 1).Text) - 1 & "'" & _
                            " where qst_id = '" & updatequestionDDL.Items(i - 1).Value & "'"
                        If ExecuteComm(QueryStr) = False Then
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Next
                    Response.Redirect("../Result.aspx?msg=ลบข้อสอบที่ " & updatequestionDDL.SelectedItem.Text & " เรียบร้อยแล้ว&user=Teacher&action=redirect")
                    updatequestion.Text = ""
                    newpicture.Style.Clear()
                    score.Text = ""
                    showchoiceanswerholder.Controls.Clear()
                    updateform.Visible = False
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        End If
    End Sub

    Protected Sub updatetesting_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updatetesting.Click
        Dim prefix As String = ""
        Dim tablename As String = ""
        Dim checktype As String = ""
        Dim statuspic As Boolean = False
        Dim choice As Integer = 0
        If updatetypetestingDDL.SelectedItem.Value = "select" Then
            warning.Text = "กรุณาเลือกประเภทการทดสอบ"
            Exit Sub
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Module" Then
            prefix = "mod_"
            tablename = "Module"
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Assignment" Then
            prefix = "ass_"
            tablename = "Assignment"
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Examination" Then
            prefix = "exm_"
            tablename = "Examination"
        End If
        If updatequestionDDL.Items.Count = 0 Then
            warning.Text = "ไม่มีข้อมูลของการทดสอบ"
            Exit Sub
        Else
            If (newpicture.PostedFile.FileName <> "" And newpicture.PostedFile.FileName.Trim().Length > 0 And newpicture.PostedFile.ContentLength > 0 And newpicture.PostedFile.ContentLength <= 400000000) Then
                checktype = newpicture.PostedFile.ContentType
                checktype = checktype.Substring(0, 5)
                If checktype = "image" Then
                Else
                    warning.Text = "ไฟล์ที่คุณเลือกสำหรับเป็นรูปภาพประกอบไม่ใช่ไฟล์ประเภทรูปภาพ กรุณาเลือกไฟล์รูปภาพประกอบใหม่"
                    Exit Sub
                End If
                If oldpicture.ImageUrl <> "" Then
                    Dim tmp As String = oldpicture.ImageUrl
                    Dim objold As New FileInfo(tmp)
                    objold.Delete()
                End If
                Dim objpic As New FileInfo(Server.MapPath("~") & "\PictureQuestion\" & tablename & "\" & Path.GetFileName(newpicture.PostedFile.FileName.Trim()))
                If objpic.Exists Then
                    statuspic = False
                    warning.Text = "กรุณาเปลี่ยนชื่อไฟล์รูปภาพประกอบ"
                    Exit Sub
                Else
                    statuspic = True
                End If
            Else
                statuspic = False
            End If
            QueryStr = "select count(chc_choice) as clearchoice from Choice" & tablename & " where qst_id = '" & updatequestionDDL.SelectedItem.Value & "'"
            TableStr = "getchoice"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        choice = row("clearchoice")
                    Next
                Else
                    Response.Redirect("../DBfailed.aspx")
                End If
            Else
                Response.Redirect("../DBfailed.aspx")
            End If
            Dim ArrChoiceUpdate(choice - 1) As String
            Dim ArrAnswerUpdate(choice - 1) As String

            If GetChoiceUpdate(choice, ArrChoiceUpdate).Length = 6 Then
                Exit Sub
            ElseIf GetAnswerUpdate(choice, ArrAnswerUpdate).Length = 6 Then
                Exit Sub
            Else
                Dim Arr(choice - 1) As String
                Dim j As Integer = 0
                QueryStr = "select chc_id from Choice" & tablename & " where qst_id = '" & updatequestionDDL.SelectedItem.Value & "'"
                TableStr = "getchoiceid"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            Arr(j) = row("chc_id")
                            j = j + 1
                        Next
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
                If statuspic = True Then
                    QueryStr = "update Question" & tablename & " set qst_question = '" & updatequestion.Text & _
                        "',qst_picfile = '" & Path.GetFileName(newpicture.PostedFile.FileName.Trim()) & "',qst_picpath = '" & _
                        "PictureQuestion/" & tablename & "/" & Path.GetFileName(newpicture.PostedFile.FileName.Trim()) & "',qst_score = '" & _
                        score.Text & "' where qst_id = '" & updatequestionDDL.SelectedItem.Value & "'"
                    If ExecuteComm(QueryStr) = True Then
                        Dim i As Integer
                        For i = 1 To choice
                            QueryStr = "update Choice" & tablename & " set chc_choice = '" & ArrChoiceUpdate(i - 1) & _
                                "',chc_answer = '" & ArrAnswerUpdate(i - 1) & "' where qst_id = '" & updatequestionDDL.SelectedItem.Value & "'" & _
                                " and chc_id = '" & Arr(i - 1) & "'"
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        Next
                        Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงข้อมูลเสร็จเรียบร้อยแล้ว&user=Teacher&action=redirect")
                        Exit Sub
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    QueryStr = "update Question" & tablename & " set qst_question = '" & updatequestion.Text & "',qst_score = '" & _
                        score.Text & "' where qst_id = '" & updatequestionDDL.SelectedItem.Value & "'"
                    If ExecuteComm(QueryStr) = True Then
                        Dim i As Integer
                        For i = 1 To choice
                            QueryStr = "update Choice" & tablename & " set chc_choice = '" & ArrChoiceUpdate(i - 1) & _
                                "',chc_answer = '" & ArrAnswerUpdate(i - 1) & "' where qst_id = '" & updatequestionDDL.SelectedItem.Value & "'" & _
                                " and chc_id = '" & Arr(i - 1) & "'"
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFailed.aspx")
                            End If
                        Next
                        Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงข้อมูลเสร็จเรียบร้อยแล้ว&user=Teacher&action=redirect")
                        Exit Sub
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                End If
            End If
        End If
    End Sub

    Sub CreateChoiceUpdate(ByVal ds As DataSet)
        Try
            Dim i As Integer = 1
            For Each row As DataRow In ds.Tables("getmychoice").Rows
                Dim setchoice As New TextBox
                Dim setanswer As New CheckBox
                setchoice.ID = "C" & i
                setchoice.Text = row("chc_choice")
                setchoice.Width = "400"
                setchoice.Height = "50"
                setchoice.TextMode = TextBoxMode.MultiLine
                setanswer.ID = "A" & i
                setanswer.Text = ""
                If row("chc_answer") = "1" Then
                    setanswer.Checked = True
                ElseIf row("chc_answer") = "0" Then
                    setanswer.Checked = False
                End If
                showchoiceanswerholder.Controls.Add(GetLiteral(i & ". "))
                showchoiceanswerholder.Controls.Add(setchoice)
                showchoiceanswerholder.Controls.Add(GetLiteral(" Answer : "))
                showchoiceanswerholder.Controls.Add(setanswer)
                showchoiceanswerholder.Controls.Add(GetLiteral("<br />"))
                i = i + 1
            Next
        Catch ex As Exception
            warning.Text = "พบปัญหาที่ฟังก์ชัน CreateTextBox" & "<br />" & ex.Message
            Exit Sub
        End Try
    End Sub

    Function GetChoiceUpdate(ByVal size As Integer, ByVal ArrChoiceUpdate As Array) As Array
        Dim i As Integer
        Dim temp(5) As String
        For i = 1 To size
            Dim c As String = "C" & i
            Dim GetChoiceBox As TextBox = CType(Me.FindControl(c), TextBox)
            If GetChoiceBox.Text = "" Then
                warning.Text = "ตัวเลือกที่ " & i & " : ไม่ได้ใส่ค่า"
                temp(5) = "0123456789"
                Return temp
            Else
                ArrChoiceUpdate(i - 1) = GetChoiceBox.Text
            End If
        Next
        Return ArrChoiceUpdate
    End Function

    Function GetAnswerUpdate(ByVal size As Integer, ByVal ArrAnswerUpdate As Array) As Array
        Dim i As Integer
        Dim temp(5) As String
        Dim counttrue As Integer = 0
        Dim countfalse As Integer = 0
        For i = 1 To size
            Dim a As String = "A" & i
            Dim GetAnswerBox As CheckBox = CType(Me.FindControl(a), CheckBox)
            If GetAnswerBox.Checked Then
                ArrAnswerUpdate(i - 1) = "1"
                counttrue = counttrue + 1
            Else
                ArrAnswerUpdate(i - 1) = "0"
                countfalse = countfalse + 1
            End If
        Next
        If counttrue = size Then
            warning.Text = "คุณกำหนดให้ตัวเลือกทุกข้อเป็นคำตอบที่ถูกไม่ได้ กรุณากำหนดใหม่"
            temp(5) = "0123456789"
            Return temp
        ElseIf countfalse = size Then
            warning.Text = "คุณกำหนดให้ตัวเลือกทุกข้อเป็นคำตอบที่ผิดไม่ได้ กรุณากำหนดใหม่"
            temp(5) = "0123456789"
            Return temp
        Else
            Return ArrAnswerUpdate
        End If
    End Function

    Protected Sub viewtesting_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles viewtesting.Click
        Dim prefix As String = ""
        Dim tablename As String = ""
        If updatetypetestingDDL.SelectedItem.Value = "select" Then
            warning.Text = "กรุณาเลือกประเภทของการทดสอบ"
            Exit Sub
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Module" Then
            prefix = "mod_"
            tablename = "Module"
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Assignment" Then
            prefix = "ass_"
            tablename = "Assignment"
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Examination" Then
            prefix = "exm_"
            tablename = "Examination"
        End If
        If updatetestingDDL.SelectedItem.Text = "" Then
            warning.Text = "ยังไม่มีข้อมูล"
            Exit Sub
        End If
        Response.Redirect("TeacherViewTesting.aspx?type=Question" & tablename & "&subtype=" & prefix & "id&typeid=" & updatetestingDDL.SelectedItem.Value)
    End Sub

    Protected Sub updateok_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updateok.Click
        warning.Text = ""
        updateform.Visible = True
        showchoiceanswerholder.Controls.Clear()
        Dim prefix As String = ""
        Dim tablename As String = ""
        If updatetypetestingDDL.SelectedItem.Value = "select" Then
            updateform.Visible = False
            warning.Text = "กรุณาเลือกประเภทการทดสอบ"
            Exit Sub
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Module" Then
            prefix = "mod_"
            tablename = "Module"
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Assignment" Then
            prefix = "ass_"
            tablename = "Assignment"
        ElseIf updatetypetestingDDL.SelectedItem.Value = "Examination" Then
            prefix = "exm_"
            tablename = "Examination"
        End If
        If updatetestingDDL.Items.Count = 0 Then
            warning.Text = "กรุณาเลือกการทดสอบ"
            updateform.Visible = False
            Exit Sub
        End If
        If updatequestionDDL.Items.Count = 0 Then
            warning.Text = "การทดสอบนี้ยังไม่มีข้อมูลของข้อมูล กรุณาสร้างข้อสอบของการทดสอบนี้ก่อน"
            updateform.Visible = False
            Exit Sub
        Else
            QueryStr = "select qst_question,qst_picpath,qst_score from Question" & tablename & " where qst_id = '" & updatequestionDDL.SelectedItem.Value & "'"
            TableStr = "getquestion"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        updatequestion.Text = row("qst_question")
                        If row("qst_picpath") Is DBNull.Value Then
                        Else
                            oldpicture.ImageUrl = "~/" & row("qst_picpath")
                        End If
                        score.Text = row("qst_score")
                    Next
                Else
                    Response.Redirect("../DBfailed.aspx")
                End If
            Else
                Response.Redirect("../DBfailed.aspx")
            End If

            Dim i As Integer = 0
            QueryStr = "select chc_choice,chc_answer from Choice" & tablename & " where qst_id = '" & updatequestionDDL.SelectedItem.Value & "'"
            TableStr = "getmychoice"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    CreateChoiceUpdate(sqlDS)
                Else
                    warning.Text = "ไม่พบตัวเลือก"
                    Exit Sub
                End If
            Else
                Response.Redirect("../DBfailed.aspx")
            End If
        End If
    End Sub

    Protected Sub createAssignmentFile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles createAssignmentFile.Click
        If subjectDDL.Items.Count = 0 Then
            warning.Text = "ไม่พบข้อมูลของรายวิชาต่างๆ"
            tableUpAss1.Visible = False
            tableUpAss2.Visible = False
            table1.Visible = False
            testingform.Visible = False
            table2.Visible = False
            updateform.Visible = False
            Exit Sub
        Else
            '-------------------------- เช็คว่ามีการกำหนด assessment หรือยัง
            QueryStr = "select ass_id from Assignment where sub_id = '" & subjectDDL.SelectedItem.Value & "'"
            TableStr = "getassid"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then

                ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                    warning.Text = "ไม่พบข้อมูลของการทดสอบเก็บคะแนน กรุณากำหนดข้อมูลที่หัวข้อ Assessment"
                    tableUpAss1.Visible = False
                    tableUpAss2.Visible = False
                    table1.Visible = False
                    testingform.Visible = False
                    table2.Visible = False
                    updateform.Visible = False
                    Exit Sub
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        End If

        QueryStr = "select ass_id,ass_number from Assignment where sub_id = '" & subjectDDL.SelectedItem.Value & "'"
        TableStr = "getassnumberid"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                UpAssDDL1.DataTextField = "ass_number"
                UpAssDDL1.DataValueField = "ass_id"
                UpAssDDL1.DataSource = sqlDS.Tables(TableStr)
                UpAssDDL1.DataBind()
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "ไม่พบข้อมูลของการทดสอบเก็บคะแนน"
                tableUpAss2.Visible = False
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If

        table1.Visible = False
        testingform.Visible = False
        table2.Visible = False
        updateform.Visible = False
        tableUpAss1.Visible = True
        topicUpAss1.Text = ""
        descUpAss1.Text = ""
        UpAssFile1.Controls.Clear()

        tableUpAss2.Visible = False
        UpAssDDL2.Items.Clear()

        table1.Visible = False
        testingform.Visible = False
        table2.Visible = False
        updateform.Visible = False
        warning.Text = ""
        createtypetestingDDL.SelectedIndex = 0
        createtestingDDL.Items.Clear()
        updatetypetestingDDL.SelectedIndex = 0
        updatetestingDDL.Items.Clear()
        updatequestionDDL.Items.Clear()
    End Sub

    'Protected Sub updateAssignmentFile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updateAssignmentFile.Click
    '    If subjectDDL.Items.Count = 0 Then
    '        warning.Text = "ไม่พบข้อมูลของรายวิชาต่างๆ"
    '        tableUpAss1.Visible = False
    '        tableUpAss2.Visible = False
    '        table1.Visible = False
    '        testingform.Visible = False
    '        table2.Visible = False
    '        updateform.Visible = False
    '        Exit Sub
    '    End If
    '    table1.Visible = False
    '    testingform.Visible = False
    '    table2.Visible = False
    '    updateform.Visible = False

    '    tableUpAss1.Visible = False
    '    topicUpAss1.Text = ""
    '    descUpAss1.Text = ""
    '    UpAssFile1.Controls.Clear()

    '    Dim filename(0) As String
    '    Dim filepath(0) As String
    '    Dim size As Integer = 0
    '    Dim i As Integer = 0

    '    QueryStr = "select ass_id,ass_number from Assignment where sub_id = '" & subjectDDL.SelectedItem.Value & "'"
    '    TableStr = "getassnumberid"
    '    If FillCommQ(QueryStr, TableStr) = True Then
    '        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
    '            UpAssDDL2.DataTextField = "ass_number"
    '            UpAssDDL2.DataValueField = "ass_id"
    '            UpAssDDL2.DataSource = sqlDS.Tables(TableStr)
    '            UpAssDDL2.DataBind()
    '        ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
    '            warning.Text = "ไม่พบข้อมูลของการทดสอบเก็บคะแนน"
    '            tableUpAss2.Visible = False
    '            Exit Sub
    '        Else
    '            Response.Redirect("../DBFailed.aspx")
    '        End If
    '    Else
    '        Response.Redirect("../DBFailed.aspx")
    '    End If
    '    'If UpAssDDL2.Items.Count = 0 Then
    '    '    warning.Text = "ไม่พบข้อมูลของการทดสอบเก็บคะแนน"
    '    '    tableUpAss1.Visible = False
    '    '    tableUpAss2.Visible = False
    '    '    table1.Visible = False
    '    '    testingform.Visible = False
    '    '    table2.Visible = False
    '    '    updateform.Visible = False
    '    '    Exit Sub
    '    'Else
    '    QueryStr = "select * from AssignmentFile where ass_id = '" & UpAssDDL2.SelectedItem.Value & "'"
    '    TableStr = "getassfile"
    '    If FillCommQ(QueryStr, TableStr) = True Then
    '        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
    '            size = sqlDS.Tables(TableStr).Rows.Count
    '            ReDim filename(size - 1)
    '            ReDim filepath(size - 1)
    '            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
    '                If row("assf_file") Is DBNull.Value Or row("assf_path") Is DBNull.Value Then
    '                    filename(i) = "-"
    '                    filepath(i) = "-"
    '                ElseIf row("assf_file") = "" Or row("assf_path") = "" Then
    '                    filename(i) = "-"
    '                    filepath(i) = "-"
    '                Else
    '                    filename(i) = row("assf_file")
    '                    filepath(i) = row("assf_path")
    '                End If
    '                topicUpAss2.Text = row("assf_topic")
    '                descUpAss2.Text = row("assf_description")
    '                i = i + 1
    '            Next
    '            CreateFileForDelete(size, filename, filepath)
    '        ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
    '            warning.Text = "ไม่พบข้อมูลของการทดสอบเก็บคะแนน"
    '            Exit Sub
    '        Else
    '            Response.Redirect("../DBFailed.aspx")
    '        End If
    '    Else
    '        Response.Redirect("../DBFailed.aspx")
    '    End If
    '    'End If
    '    tableUpAss2.Visible = True
    '    table1.Visible = False
    '    testingform.Visible = False
    '    table2.Visible = False
    '    updateform.Visible = False
    '    warning.Text = ""
    '    createtypetestingDDL.SelectedIndex = 0
    '    createtestingDDL.Items.Clear()
    '    updatetypetestingDDL.SelectedIndex = 0
    '    updatetestingDDL.Items.Clear()
    '    updatequestionDDL.Items.Clear()
    'End Sub

    Protected Sub updateAssignmentFile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updateAssignmentFile.Click
        If subjectDDL.Items.Count = 0 Then
            warning.Text = "ไม่พบข้อมูลของรายวิชาต่างๆ"
            tableUpAss1.Visible = False
            tableUpAss2.Visible = False
            table1.Visible = False
            testingform.Visible = False
            table2.Visible = False
            updateform.Visible = False
            Exit Sub
        End If
        table1.Visible = False
        testingform.Visible = False
        table2.Visible = False
        updateform.Visible = False

        tableUpAss1.Visible = False
        topicUpAss1.Text = ""
        descUpAss1.Text = ""
        UpAssFile1.Controls.Clear()

        Dim filename(0) As String
        Dim filepath(0) As String
        Dim size As Integer = 0
        Dim i As Integer = 0

        QueryStr = "select ass_id,ass_number from Assignment where sub_id = '" & subjectDDL.SelectedItem.Value & "'"
        TableStr = "getassnumberid"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                UpAssDDL2.DataTextField = "ass_number"
                UpAssDDL2.DataValueField = "ass_id"
                UpAssDDL2.DataSource = sqlDS.Tables(TableStr)
                UpAssDDL2.DataBind()
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "ไม่พบข้อมูลของการทดสอบเก็บคะแนน"
                tableUpAss2.Visible = False
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
        Dim AssTID As Integer = 0
        QueryStr = "select * from AssignmentTopic where ass_id = '" & UpAssDDL2.SelectedItem.Value & "'"
        TableStr = "getAssignmentTopic"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    topicUpAss2.Text = row("asst_topic")
                    descUpAss2.Text = row("asst_description")
                    AssTID = Val(row("asst_id"))
                Next
                QueryStr = "select * from AssignmentFile where asst_id = '" & AssTID & "'"
                TableStr = "getAssignmentFile"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                        size = sqlDS.Tables(TableStr).Rows.Count
                        ReDim filename(size - 1)
                        ReDim filepath(size - 1)
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            If row("assf_file") Is DBNull.Value Or row("assf_path") Is DBNull.Value Then
                                filename(i) = "-"
                                filepath(i) = "-"
                            ElseIf row("assf_file") = "" Or row("assf_path") = "" Then
                                filename(i) = "-"
                                filepath(i) = "-"
                            Else
                                filename(i) = row("assf_file")
                                filepath(i) = row("assf_path")
                            End If
                            i = i + 1
                        Next
                        CreateFileForDelete(size, filename, filepath)
                    ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                        '------------------------------------------------ ไม่มีไฟล์
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "ไม่พบข้อมูลของการทดสอบเก็บคะแนน"
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If

        tableUpAss2.Visible = True
        table1.Visible = False
        testingform.Visible = False
        table2.Visible = False
        updateform.Visible = False
        warning.Text = ""
        createtypetestingDDL.SelectedIndex = 0
        createtestingDDL.Items.Clear()
        updatetypetestingDDL.SelectedIndex = 0
        updatetestingDDL.Items.Clear()
        updatequestionDDL.Items.Clear()
    End Sub

    Sub CreateFileForDelete(ByVal size As Integer, ByVal filename As Array, ByVal filepath As Array)
        Try
            Dim i As Integer
            For i = 1 To size
                Dim file As New HyperLink
                Dim del As New CheckBox
                If filename(i - 1) = "-" Or filepath(i - 1) = "-" Then
                    file.ID = "File" & i
                    del.ID = "DelBox" & i
                Else
                    file.ID = "File" & i
                    file.Text = filename(i - 1)
                    file.NavigateUrl = "../" & filepath(i - 1)

                    del.ID = "DelBox" & i
                    del.Text = "Delete : "
                    del.TextAlign = TextAlign.Left

                    holdFile.Controls.Add(file)
                    holdFile.Controls.Add(GetLiteral(" => "))
                    holdFile.Controls.Add(del)
                    holdFile.Controls.Add(GetLiteral("<br />"))
                End If
            Next
        Catch ex As Exception
            warning.Text = "พบปัญหาที่ฟังก์ชัน CreateFileForDelete" & "<br />" & ex.Message
            Exit Sub
        End Try
    End Sub

    Protected Sub clearUpAss1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clearUpAss1.Click
        topicUpAss1.Text = ""
        descUpAss1.Text = ""
        UpAssFile1.Controls.Clear()
    End Sub

    Protected Sub clearUpAss2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clearUpAss2.Click
        topicUpAss2.Text = ""
        descUpAss2.Text = ""
        UpAssFile2.Controls.Clear()
    End Sub

    'Protected Sub submitUpAss_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submitUpAss.Click
    '    Dim status As Boolean = False
    '    Dim objfile As New FileInfo(Server.MapPath("~") & "\Assignment\" & Path.GetFileName(UpAssFile1.PostedFile.FileName.Trim()))
    '    If (UpAssFile1.PostedFile.FileName <> "" And UpAssFile1.PostedFile.FileName.Trim().Length > 0 And UpAssFile1.PostedFile.ContentLength > 0 And UpAssFile1.PostedFile.ContentLength <= 400000000) Then
    '        If objfile.Exists Then
    '            warning.Text = "กรุณาเปลี่ยนชื่อไฟล์"
    '            Exit Sub
    '        Else
    '            status = True
    '        End If
    '    Else
    '        status = False
    '    End If
    '    If status = True Then
    '        UpAssFile1.PostedFile.SaveAs(Server.MapPath("~") & "\Assignment\" & Path.GetFileName(UpAssFile1.PostedFile.FileName.Trim()))
    '        QueryStr = "insert into AssignmentFile(ass_id,assf_topic,assf_description,assf_file,assf_path) values('" & _
    '            UpAssDDL1.SelectedItem.Value & "','" & topicUpAss1.Text & "','" & descUpAss1.Text & "','" & _
    '            Path.GetFileName(UpAssFile1.PostedFile.FileName.Trim()) & "','" & "Assignment/" & Path.GetFileName(UpAssFile1.PostedFile.FileName.Trim()) & "')"
    '    Else
    '        QueryStr = "insert into AssignmentFile(ass_id,assf_topic,assf_description) values('" & _
    '            UpAssDDL1.SelectedItem.Value & "','" & topicUpAss1.Text & "','" & descUpAss1.Text & "')"
    '    End If
    '    If ExecuteComm(QueryStr) = True Then
    '        Response.Redirect("../Result.aspx?msg=การกำหนด Assignment ของการทดสอบครั้งที่ " & UpAssDDL1.SelectedItem.Text & " เสร็จเรียบร้อยแล้ว&user=Teacher")
    '    Else
    '        Response.Redirect("../DBFailed.aspx")
    '    End If
    'End Sub

    Protected Sub submitUpAss_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submitUpAss.Click
        '-------------------------------------- เช็คว่า การทดสอบนี้ได้กำหนดเป็นแบบ choice หรือยัง ถ้าไม่ก็กำหนดเป็น assignment ได้ แต่ถ้าใช่ก็ไม่สามารถกำหนดเป็น assignment ได้
        QueryStr = "select qst_id from QuestionAssignment where ass_id = '" & UpAssDDL1.SelectedItem.Value & "'"
        TableStr = "getqstid"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                warning.Text = "การทดสอบครั้งที่ " & UpAssDDL1.SelectedItem.Text & " นี้ได้มีการกำหนดเป็นการทดสอบแบบตัวเลือก(choice)แล้ว"
                tableUpAss1.Visible = False
                tableUpAss2.Visible = False
                table1.Visible = False
                testingform.Visible = False
                table2.Visible = False
                updateform.Visible = False
                Exit Sub
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then

            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If

        '-------------------------------------- เช็คว่า ได้มีการกำหนด Assignment ครั้งนี้แล้วหรือยัง
        QueryStr = "select asst_id from AssignmentTopic where ass_id = '" & UpAssDDL1.SelectedItem.Value & "'"
        TableStr = "getasstid"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                warning.Text = "การทดสอบครั้งที่ " & UpAssDDL1.SelectedItem.Text & " นี้ได้มีการกำหนด Assignment ไว้แล้ว"
                tableUpAss1.Visible = False
                tableUpAss2.Visible = False
                table1.Visible = False
                testingform.Visible = False
                table2.Visible = False
                updateform.Visible = False
                Exit Sub
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then

            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If

        Dim currentID As Integer = 0
        Dim status As Boolean = False
        Dim objfile As New FileInfo(Server.MapPath("~") & "\Assignment\" & Path.GetFileName(UpAssFile1.PostedFile.FileName.Trim()))
        If (UpAssFile1.PostedFile.FileName <> "" And UpAssFile1.PostedFile.FileName.Trim().Length > 0 And UpAssFile1.PostedFile.ContentLength > 0 And UpAssFile1.PostedFile.ContentLength <= 400000000) Then
            If objfile.Exists Then
                warning.Text = "กรุณาเปลี่ยนชื่อไฟล์"
                Exit Sub
            Else
                status = True
            End If
        Else
            status = False
        End If
        If status = True Then
            UpAssFile1.PostedFile.SaveAs(Server.MapPath("~") & "\Assignment\" & Path.GetFileName(UpAssFile1.PostedFile.FileName.Trim()))

            QueryStr = "insert into AssignmentTopic(ass_id,asst_topic,asst_description) values('" & _
                UpAssDDL1.SelectedItem.Value & "','" & topicUpAss1.Text & "','" & descUpAss1.Text & "')"

            OpenConn()

            sqlComm = New SqlCommand(QueryStr, sqlConn)
            sqlComm.CommandType = CommandType.Text
            sqlComm.ExecuteNonQuery()

            QueryStr = "select @@identity as currentID"
            TableStr = "getcurrentID"
            If FillCommQ(QueryStr, TableStr) = True Then
                If IsNothing(sqlDS) Then
                    warning.Text = "Dataset has not found . There is no currentID." & "<br />" & "ไม่สามารถอัพโหลดไฟล์ได้"
                    Exit Sub
                Else
                    If sqlDS.Tables(TableStr).Columns.Count > 0 Then
                        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                currentID = Val(row("currentID"))
                                Exit For
                            Next
                        Else
                            warning.Text = "Dataset has no row. There is no currentID." & "<br />" & "ไม่สามารถอัพโหลดไฟล์ได้"
                            Exit Sub
                        End If
                    Else
                        warning.Text = "Dataset has no column. There is no currentID." & "<br />" & "ไม่สามารถอัพโหลดไฟล์ได้"
                        Exit Sub
                    End If
                End If
            Else
                Response.Write("../DBFailed.aspx")
            End If
            CloseConn()
            QueryStr = "insert into AssignmentFile(asst_id,assf_file,assf_path) values('" & _
                currentID & "','" & Path.GetFileName(UpAssFile1.PostedFile.FileName.Trim()) & _
                "','" & "Assignment/" & Path.GetFileName(UpAssFile1.PostedFile.FileName.Trim()) & "')"
            If ExecuteComm(QueryStr) = True Then
                Response.Redirect("../Result.aspx?msg=การกำหนด Assignment ของการทดสอบครั้งที่ " & UpAssDDL1.SelectedItem.Text & " เสร็จเรียบร้อยแล้ว&user=Teacher")
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            CloseConn()
            QueryStr = "insert into AssignmentTopic(ass_id,asst_topic,asst_description) values('" & _
                UpAssDDL1.SelectedItem.Value & "','" & topicUpAss1.Text & "','" & descUpAss1.Text & "')"
            If ExecuteComm(QueryStr) = True Then
                Response.Redirect("../Result.aspx?msg=การกำหนด Assignment ของการทดสอบครั้งที่ " & UpAssDDL1.SelectedItem.Text & " เสร็จเรียบร้อยแล้ว&user=Teacher")
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        End If
    End Sub

    'Protected Sub updateUpAss_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updateUpAss.Click
    '    If UpAssDDL2.Items.Count = 0 Then
    '        warning.Text = "ไม่พบข้อมูลของการทดสอบเก็บคะแนน"
    '        tableUpAss2.Visible = False
    '        Exit Sub
    '    End If
    '    Dim ArrDel(0) As String
    '    Dim ArrID(0) As Integer
    '    Dim ArrPath(0) As String
    '    Dim size As Integer = 0
    '    Dim i As Integer = 0
    '    Dim status As Boolean = False
    '    QueryStr = "select * from AssignmentFile where ass_id = '" & UpAssDDL2.SelectedItem.Value & "'"
    '    TableStr = "getassignmentfile"
    '    If FillCommQ(QueryStr, TableStr) = True Then
    '        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
    '            size = sqlDS.Tables(TableStr).Rows.Count
    '            ReDim ArrDel(size - 1)
    '            ReDim ArrID(size - 1)
    '            ReDim ArrPath(size - 1)
    '            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
    '                ArrID(i) = Val(row("assf_id"))
    '                If row("assf_path") Is DBNull.Value Then
    '                    ArrPath(i) = "-"
    '                ElseIf row("assf_path") = "" Then
    '                    ArrPath(i) = "-"
    '                Else
    '                    ArrPath(i) = row("assf_path")
    '                End If
    '                i = i + 1
    '            Next
    '            ArrDel = GetDel(size, ArrDel)
    '            Dim objfile As New FileInfo(Server.MapPath("~") & "\Assignment\" & Path.GetFileName(UpAssFile2.PostedFile.FileName.Trim()))
    '            If (UpAssFile2.PostedFile.FileName <> "" And UpAssFile2.PostedFile.FileName.Trim().Length > 0 And UpAssFile2.PostedFile.ContentLength > 0 And UpAssFile2.PostedFile.ContentLength <= 400000000) Then
    '                If objfile.Exists Then
    '                    warning.Text = "กรุณาเปลี่ยนชื่อไฟล์"
    '                    Exit Sub
    '                Else
    '                    status = True
    '                End If
    '            Else
    '                status = False
    '            End If

    '            CloseConn()
    '            If status = True Then
    '                UpAssFile2.PostedFile.SaveAs(Server.MapPath("~") & "\Assignment\" & Path.GetFileName(UpAssFile2.PostedFile.FileName.Trim()))
    '                QueryStr = "insert into AssignmentFile(ass_id,assf_topic,assf_description,assf_file,assf_path) values('" & _
    '                    UpAssDDL2.SelectedItem.Value & "','" & topicUpAss2.Text & "','" & descUpAss2.Text & "','" & _
    '                    Path.GetFileName(UpAssFile2.PostedFile.FileName.Trim()) & "','" & "Assignment/" & Path.GetFileName(UpAssFile2.PostedFile.FileName.Trim()) & "')"
    '                If ExecuteComm(QueryStr) = False Then
    '                    Response.Redirect("../DBFaile.aspx")
    '                End If
    '            End If

    '            Dim objpath As New FileInfo(Server.MapPath("~") & "/" & ArrPath(0))
    '            For i = 0 To size - 1
    '                If ArrDel(i) = "1" Then
    '                    If ArrPath(i) = "-" Then
    '                        QueryStr = "update AssignmentFile set assf_topic = '" & topicUpAss2.Text & _
    '                            "', assf_description = '" & descUpAss2.Text & "'" & _
    '                            " where ass_id = '" & UpAssDDL2.SelectedItem.Value & "'"
    '                        If ExecuteComm(QueryStr) = False Then
    '                            Response.Redirect("../DBFaile.aspx")
    '                        End If
    '                    Else
    '                        QueryStr = "update AssignmentFile set assf_file = '', assf_path = ''" & _
    '                            ", assf_topic = '" & topicUpAss2.Text & "', assf_description = '" & descUpAss2.Text & "'" & _
    '                            " where assf_id = '" & ArrID(i) & "'"
    '                        If ExecuteComm(QueryStr) = False Then
    '                            Response.Redirect("../DBFaile.aspx")
    '                        Else
    '                            objpath = New FileInfo(Server.MapPath("~") & "/" & ArrPath(i))
    '                            objpath.Delete()
    '                        End If
    '                    End If
    '                ElseIf ArrDel(i) = "0" Then
    '                    QueryStr = "update AssignmentFile set assf_topic = '" & topicUpAss2.Text & _
    '                        "', assf_description = '" & descUpAss2.Text & "'" & _
    '                        " where ass_id = '" & UpAssDDL2.SelectedItem.Value & "'"
    '                    If ExecuteComm(QueryStr) = False Then
    '                        Response.Redirect("../DBFaile.aspx")
    '                    End If
    '                End If
    '            Next
    '            Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลง Assignment ของการทดสอบครั้งที่ " & UpAssDDL2.SelectedItem.Text & " เสร็จเรียบร้อยแล้ว&user=Teacher")
    '        ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
    '            warning.Text = "ไม่พบข้อมูลของการทดสอบเก็บคะแนน"
    '            Exit Sub
    '        Else
    '            Response.Redirect("../DBFailed.aspx")
    '        End If
    '    Else
    '        Response.Redirect("../DBFailed.aspx")
    '    End If
    'End Sub

    Protected Sub updateUpAss_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updateUpAss.Click
        If UpAssDDL2.Items.Count = 0 Then
            warning.Text = "ไม่พบข้อมูลของการทดสอบเก็บคะแนน"
            tableUpAss2.Visible = False
            Exit Sub
        End If
        Dim ArrDel(0) As String
        Dim ArrID(0) As Integer
        Dim ArrPath(0) As String
        Dim size As Integer = 0
        Dim i As Integer = 0
        Dim status As Boolean = False
        Dim AsstID As Integer = 0
        '------------------------------------ Get asst_id
        QueryStr = "select asst_id from AssignmentTopic where ass_id = '" & UpAssDDL2.SelectedItem.Value & "'"
        TableStr = "getasstid"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    AsstID = Val(row("asst_id"))
                Next
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "ไม่พบข้อมูลของการทดสอบเก็บคะแนน"
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
        '------------------------------------ Get Detail of Assignment File
        QueryStr = "select * from AssignmentFile where asst_id = '" & AsstID & "'"
        TableStr = "getassignmentfile"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                size = sqlDS.Tables(TableStr).Rows.Count
                ReDim ArrDel(size - 1)
                ReDim ArrID(size - 1)
                ReDim ArrPath(size - 1)
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    ArrID(i) = Val(row("assf_id"))
                    If row("assf_path") Is DBNull.Value Then
                        ArrPath(i) = "-"
                    ElseIf row("assf_path") = "" Then
                        ArrPath(i) = "-"
                    Else
                        ArrPath(i) = row("assf_path")
                    End If
                    i = i + 1
                Next
                ArrDel = GetDel(size, ArrDel)
                Dim objfile As New FileInfo(Server.MapPath("~") & "\Assignment\" & Path.GetFileName(UpAssFile2.PostedFile.FileName.Trim()))
                If (UpAssFile2.PostedFile.FileName <> "" And UpAssFile2.PostedFile.FileName.Trim().Length > 0 And UpAssFile2.PostedFile.ContentLength > 0 And UpAssFile2.PostedFile.ContentLength <= 400000000) Then
                    If objfile.Exists Then
                        warning.Text = "กรุณาเปลี่ยนชื่อไฟล์"
                        Exit Sub
                    Else
                        status = True
                    End If
                Else
                    status = False
                End If

                CloseConn()
                '--------------------------------- Update Assignment Topic
                QueryStr = "update AssignmentTopic set asst_topic = '" & topicUpAss2.Text & _
                    "', asst_description = '" & descUpAss2.Text & "' where ass_id = '" & _
                    UpAssDDL2.SelectedItem.Value & "'"
                If ExecuteComm(QueryStr) = False Then
                    Response.Redirect("../DBFaile.aspx")
                End If
                '--------------------------------- Insert and Save New File
                If status = True Then
                    UpAssFile2.PostedFile.SaveAs(Server.MapPath("~") & "\Assignment\" & Path.GetFileName(UpAssFile2.PostedFile.FileName.Trim()))
                    QueryStr = "insert into AssignmentFile(asst_id,assf_file,assf_path) values('" & _
                        AsstID & "','" & Path.GetFileName(UpAssFile2.PostedFile.FileName.Trim()) & "','" & _
                        "Assignment/" & Path.GetFileName(UpAssFile2.PostedFile.FileName.Trim()) & "')"
                    If ExecuteComm(QueryStr) = False Then
                        Response.Redirect("../DBFaile.aspx")
                    End If
                End If

                Dim objpath As New FileInfo(Server.MapPath("~") & "/" & ArrPath(0))
                For i = 0 To size - 1
                    If ArrDel(i) = "1" Then
                        If ArrPath(i) = "-" Then
                        Else
                            QueryStr = "delete from AssignmentFile where assf_id = '" & ArrID(i) & "'" 
                            If ExecuteComm(QueryStr) = False Then
                                Response.Redirect("../DBFaile.aspx")
                            Else
                                objpath = New FileInfo(Server.MapPath("~") & "/" & ArrPath(i))
                                objpath.Delete()
                            End If
                        End If
                    ElseIf ArrDel(i) = "0" Then

                    End If
                Next
                Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลง Assignment ของการทดสอบครั้งที่ " & UpAssDDL2.SelectedItem.Text & " เสร็จเรียบร้อยแล้ว&user=Teacher")

            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                Dim objfile As New FileInfo(Server.MapPath("~") & "\Assignment\" & Path.GetFileName(UpAssFile2.PostedFile.FileName.Trim()))
                If (UpAssFile2.PostedFile.FileName <> "" And UpAssFile2.PostedFile.FileName.Trim().Length > 0 And UpAssFile2.PostedFile.ContentLength > 0 And UpAssFile2.PostedFile.ContentLength <= 400000000) Then
                    If objfile.Exists Then
                        warning.Text = "กรุณาเปลี่ยนชื่อไฟล์"
                        Exit Sub
                    Else
                        status = True
                    End If
                Else
                    status = False
                End If
                '--------------------------------- Update Assignment Topic
                CloseConn()
                QueryStr = "update AssignmentTopic set asst_topic = '" & topicUpAss2.Text & _
                    "', asst_description = '" & descUpAss2.Text & "' where ass_id = '" & _
                    UpAssDDL2.SelectedItem.Value & "'"
                If ExecuteComm(QueryStr) = False Then
                    Response.Redirect("../DBFaile.aspx")
                End If
                '--------------------------------- Insert and Save New File
                If status = True Then
                    UpAssFile2.PostedFile.SaveAs(Server.MapPath("~") & "\Assignment\" & Path.GetFileName(UpAssFile2.PostedFile.FileName.Trim()))
                    QueryStr = "insert into AssignmentFile(asst_id,assf_file,assf_path) values('" & _
                        AsstID & "','" & Path.GetFileName(UpAssFile2.PostedFile.FileName.Trim()) & "','" & _
                        "Assignment/" & Path.GetFileName(UpAssFile2.PostedFile.FileName.Trim()) & "')"
                    If ExecuteComm(QueryStr) = False Then
                        Response.Redirect("../DBFaile.aspx")
                    End If
                End If
                Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลง Assignment ของการทดสอบครั้งที่ " & UpAssDDL2.SelectedItem.Text & " เสร็จเรียบร้อยแล้ว&user=Teacher")
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Function GetDel(ByVal size As Integer, ByVal ArrDel As Array) As Array
        Dim i As Integer
        For i = 1 To size
            Dim c As String = "DelBox" & i
            Dim del As CheckBox = CType(Me.FindControl(c), CheckBox)
            If IsNothing(del) Then
                ArrDel(i - 1) = "0"
            Else
                If del.Checked Then
                    ArrDel(i - 1) = "1"
                Else
                    ArrDel(i - 1) = "0"
                End If
            End If
        Next
        Return ArrDel
    End Function

    'Protected Sub deleteAss_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles deleteAss.Click
    '    Dim ArrID(0) As Integer
    '    Dim ArrPath(0) As String
    '    Dim size As Integer = 0
    '    Dim i As Integer = 0
    '    QueryStr = "select * from AssignmentFile where ass_id = '" & UpAssDDL2.SelectedItem.Value & "'"
    '    TableStr = "getassignmentfile"
    '    If FillCommQ(QueryStr, TableStr) = True Then
    '        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
    '            size = sqlDS.Tables(TableStr).Rows.Count
    '            ReDim ArrID(size - 1)
    '            ReDim ArrPath(size - 1)
    '            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
    '                ArrID(i) = Val(row("assf_id"))
    '                If row("assf_path") Is DBNull.Value Then
    '                    ArrPath(i) = "-"
    '                ElseIf row("assf_path") = "" Then
    '                    ArrPath(i) = "-"
    '                Else
    '                    ArrPath(i) = row("assf_path")
    '                End If
    '                i = i + 1
    '            Next
    '            Dim objpath As New FileInfo(Server.MapPath("~") & "/" & ArrPath(0))
    '            For i = 0 To size - 1
    '                If ArrPath(i) = "-" Then
    '                    QueryStr = "delete from AssignmentFile where assf_id = '" & ArrID(i) & "'"
    '                    If ExecuteComm(QueryStr) = False Then
    '                        Response.Redirect("../DBFaile.aspx")
    '                    End If
    '                Else
    '                    QueryStr = "delete from AssignmentFile where assf_id = '" & ArrID(i) & "'"
    '                    If ExecuteComm(QueryStr) = False Then
    '                        Response.Redirect("../DBFaile.aspx")
    '                    Else
    '                        objpath = New FileInfo(Server.MapPath("~") & "/" & ArrPath(i))
    '                        objpath.Delete()
    '                    End If
    '                End If
    '            Next
    '            Response.Redirect("../Result.aspx?msg=การลบ Assignment ของการทดสอบครั้งที่ " & UpAssDDL2.SelectedItem.Text & " เสร็จเรียบร้อยแล้ว&user=Teacher")
    '        ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
    '            warning.Text = "ไม่พบข้อมูลของการทดสอบเก็บคะแนน"
    '            Exit Sub
    '        Else
    '            Response.Redirect("../DBFailed.aspx")
    '        End If
    '    Else
    '        Response.Redirect("../DBFailed.aspx")
    '    End If
    'End Sub

    Protected Sub deleteAss_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles deleteAss.Click
        Dim ArrID(0) As Integer
        Dim ArrPath(0) As String
        Dim size As Integer = 0
        Dim i As Integer = 0
        '--------------------------------- Get Path File For Delete
        QueryStr = "select * from AssignmentFile where asst_id = (select asst_id from AssignmentTopic where ass_id = '" & UpAssDDL2.SelectedItem.Value & "')"
        TableStr = "getfilefordelete"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                size = sqlDS.Tables(TableStr).Rows.Count
                ReDim ArrID(size - 1)
                ReDim ArrPath(size - 1)
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    ArrID(i) = Val(row("assf_id"))
                    If row("assf_path") Is DBNull.Value Then
                        ArrPath(i) = "-"
                    ElseIf row("assf_path") = "" Then
                        ArrPath(i) = "-"
                    Else
                        ArrPath(i) = row("assf_path")
                    End If
                    i = i + 1
                Next
                CloseConn()
                Dim objpath As New FileInfo(Server.MapPath("~") & "/" & ArrPath(0))
                For i = 0 To size - 1
                    If ArrPath(i) = "-" Then
                        QueryStr = "delete from AssignmentFile where assf_id = '" & ArrID(i) & "'"
                        If ExecuteComm(QueryStr) = False Then
                            Response.Redirect("../DBFaile.aspx")
                        End If
                    Else
                        QueryStr = "delete from AssignmentFile where assf_id = '" & ArrID(i) & "'"
                        If ExecuteComm(QueryStr) = False Then
                            Response.Redirect("../DBFaile.aspx")
                        Else
                            objpath = New FileInfo(Server.MapPath("~") & "/" & ArrPath(i))
                            objpath.Delete()
                        End If
                    End If
                Next
                QueryStr = "delete from AssignmentTopic where ass_id = '" & UpAssDDL2.SelectedItem.Value & "'"
                If ExecuteComm(QueryStr) = False Then
                    Response.Redirect("../DBFaile.aspx")
                End If
                Response.Redirect("../Result.aspx?msg=การลบ Assignment ของการทดสอบครั้งที่ " & UpAssDDL2.SelectedItem.Text & " เสร็จเรียบร้อยแล้ว&user=Teacher")
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                CloseConn()
                QueryStr = "delete from AssignmentTopic where ass_id = '" & UpAssDDL2.SelectedItem.Value & "'"
                If ExecuteComm(QueryStr) = False Then
                    Response.Redirect("../DBFaile.aspx")
                End If
                Response.Redirect("../Result.aspx?msg=การลบ Assignment ของการทดสอบครั้งที่ " & UpAssDDL2.SelectedItem.Text & " เสร็จเรียบร้อยแล้ว&user=Teacher")
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    'Protected Sub UpAssDDL2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpAssDDL2.SelectedIndexChanged
    '    warning.Text = ""
    '    holdFile.Controls.Clear()
    '    Dim filename(0) As String
    '    Dim filepath(0) As String
    '    Dim size As Integer = 0
    '    Dim i As Integer = 0
    '    QueryStr = "select * from AssignmentFile where ass_id = '" & UpAssDDL2.SelectedItem.Value & "'"
    '    TableStr = "getdetailassignmentfile"
    '    If FillCommQ(QueryStr, TableStr) = True Then
    '        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
    '            size = sqlDS.Tables(TableStr).Rows.Count
    '            ReDim filename(size - 1)
    '            ReDim filepath(size - 1)
    '            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
    '                If row("assf_file") Is DBNull.Value Or row("assf_path") Is DBNull.Value Then
    '                    filename(i) = "-"
    '                    filepath(i) = "-"
    '                Else
    '                    filename(i) = row("assf_file")
    '                    filepath(i) = row("assf_path")
    '                End If
    '                topicUpAss2.Text = row("assf_topic")
    '                descUpAss2.Text = row("assf_description")
    '                i = i + 1
    '            Next
    '            CreateFileForDelete(size, filename, filepath)
    '        ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
    '            warning.Text = "ไม่พบข้อมูลของการทดสอบเก็บคะแนน"
    '            topicUpAss2.Text = ""
    '            descUpAss2.Text = ""
    '            UpAssFile2.Controls.Clear()
    '            holdFile.Controls.Clear()
    '            tableUpAss2.Visible = False
    '            Exit Sub
    '        Else
    '            Response.Redirect("../DBFailed.aspx")
    '        End If
    '    Else
    '        Response.Redirect("../DBFailed.aspx")
    '    End If
    'End Sub

    Protected Sub UpAssDDL2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles UpAssDDL2.SelectedIndexChanged
        warning.Text = ""
        holdFile.Controls.Clear()
        Dim filename(0) As String
        Dim filepath(0) As String
        Dim size As Integer = 0
        Dim i As Integer = 0
        Dim AssTID As Integer = 0
        QueryStr = "select * from AssignmentTopic where ass_id = '" & UpAssDDL2.SelectedItem.Value & "'"
        TableStr = "getAssignmentTopic"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    topicUpAss2.Text = row("asst_topic")
                    descUpAss2.Text = row("asst_description")
                    AssTID = Val(row("asst_id"))
                Next
                QueryStr = "select * from AssignmentFile where asst_id = '" & AssTID & "'"
                TableStr = "getAssignmentFile"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                        size = sqlDS.Tables(TableStr).Rows.Count
                        ReDim filename(size - 1)
                        ReDim filepath(size - 1)
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            If row("assf_file") Is DBNull.Value Or row("assf_path") Is DBNull.Value Then
                                filename(i) = "-"
                                filepath(i) = "-"
                            ElseIf row("assf_file") = "" Or row("assf_path") = "" Then
                                filename(i) = "-"
                                filepath(i) = "-"
                            Else
                                filename(i) = row("assf_file")
                                filepath(i) = row("assf_path")
                            End If
                            i = i + 1
                        Next
                        CreateFileForDelete(size, filename, filepath)
                    ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                        '------------------------------------------------ ไม่มีไฟล์
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "ไม่พบข้อมูลของการทดสอบเก็บคะแนนสำหรับการทดสอบครั้งที่ " & UpAssDDL2.SelectedItem.Text
                tableUpAss1.Visible = False
                topicUpAss1.Text = ""
                descUpAss1.Text = ""
                UpAssFile1.Controls.Clear()

                tableUpAss2.Visible = False
                topicUpAss2.Text = ""
                descUpAss2.Text = ""
                UpAssFile2.Controls.Clear()

                table1.Visible = False
                testingform.Visible = False
                table2.Visible = False
                updateform.Visible = False
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub
End Class
