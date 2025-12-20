Imports System.Data
Imports System.Data.SqlClient

Partial Class Administrator_AdministratorTeacherAssessment
    Inherits System.Web.UI.Page

    Protected Sub create_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles create.Click
        QueryStr = "select * from AssessmentTopic"
        TableStr = "getassessmenttopic"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                warning.Text = "แบบการประเมินได้มีการสร้างไว้แล้ว"
                createform.Visible = False
                updateform.Visible = False
                addform.Visible = False
                Exit Sub
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                createform.Visible = True
                updateform.Visible = False
                addform.Visible = False

                createholder.Controls.Clear()
                createnumber.SelectedIndex = 0
                warning.Text = ""
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub update_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles update.Click
        QueryStr = "select * from AssessmentTopic"
        TableStr = "gettoupdateassessmenttopic"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                createform.Visible = False
                updateform.Visible = True
                addform.Visible = False
                UpdateTextBox()
                warning.Text = ""
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "แบบประเมินผู้สอนยังไม่ได้ถูกสร้างขึ้น กรุณาสร้างแบบประเมินนี้ก่อน"
                createform.Visible = False
                updateform.Visible = False
                addform.Visible = False
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub add_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles add.Click
        createform.Visible = False
        updateform.Visible = False
        addform.Visible = True
        warning.Text = ""
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Session("loginstatus") = True And Session("user") <> 0 Then
                If Session("usertype") = "Administrator" Then
                Else
                    Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้ดูแลระบบ คุณไม่สามารถเข้าเว็บเพจนี้ได้")
                End If
            Else
                Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
            End If

            If Not Page.IsPostBack Then
            Else
                If createform.Visible = True Then
                    If createnumber.SelectedItem.Value = "select" Then
                    Else
                        CreateTextBox(createnumber.SelectedItem.Value)
                    End If
                End If
                If updateform.Visible = True Then
                    UpdateTextBox()
                End If
                If addform.Visible = True Then
                    If addnumber.SelectedItem.Value = "select" Then
                    Else
                        AddTextBox(addnumber.SelectedItem.Value)
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

    Sub CreateTextBox(ByVal size As Integer)
        Try
            Dim i As Integer
            For i = 1 To size
                Dim order As New Label
                Dim txtbox As New TextBox
                order.ID = "COlabel" & i
                order.Text = i & ". "
                txtbox.ID = "Cbox" & i
                txtbox.Text = ""
                txtbox.Width = "300"

                createholder.Controls.Add(order)
                createholder.Controls.Add(txtbox)
                createholder.Controls.Add(GetLiteral("<br />"))
            Next
        Catch ex As Exception
            warning.Text = "พบปัญหาที่ฟังก์ชัน CreateTextBox" & "<br />" & ex.Message
            Exit Sub
        End Try
    End Sub

    Protected Sub createclear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles createclear.Click
        createholder.Controls.Clear()
        createnumber.SelectedIndex = 0
        warning.Text = ""
    End Sub

    Function GetData(ByVal size As Integer, ByVal ArrData As Array, ByVal str As String) As Array
        Dim i As Integer
        Dim temp(10) As String
        For i = 1 To size
            Dim b As String = str & i
            Dim getbox As TextBox = CType(Me.FindControl(b), TextBox)
            If getbox.Text = "" Then
                warning.Text = "หัวข้อที่ " & i & " : ไม่ได้ใส่ค่า"
                temp(10) = "0123456789"
                Return temp
            Else
                ArrData(i - 1) = getbox.Text
            End If
        Next
        Return ArrData
    End Function

    Protected Sub createdata_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles createdata.Click
        Dim i As Integer = 0
        If createnumber.SelectedItem.Value = "select" Then
            warning.Text = "กรุณาเลือกจำนวนหัวข้อ"
            Exit Sub
        Else
            Dim ArrData(createnumber.SelectedItem.Value - 1) As String
            If GetData(createnumber.SelectedItem.Value, ArrData, "Cbox").Length = 11 Then
                Exit Sub
            Else
                For i = 1 To createnumber.SelectedItem.Value
                    QueryStr = "insert into AssessmentTopic(assess_topic) values('" & ArrData(i - 1) & "')"
                    If ExecuteComm(QueryStr) = False Then
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Next
                Response.Redirect("../Result.aspx?msg=การสร้างหัวข้อแบบประเมินผู้สอนเสร็จเรียบร้อยแล้ว&user=Administrator")
            End If
        End If
    End Sub

    Protected Sub updateclear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updateclear.Click
        updateholder.Controls.Clear()
        warning.Text = ""
    End Sub

    Protected Sub updatedata_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updatedata.Click
        Dim i As Integer = 0
        Dim size As Integer = 0
        Dim ArrID(0) As Integer
        Dim ArrDel(0) As Boolean
        QueryStr = "select * from AssessmentTopic"
        TableStr = "getassessmenttopic"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                size = sqlDS.Tables(TableStr).Rows.Count
                ReDim ArrID(size - 1)
                i = 0
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    ArrID(i) = Val(row("assess_id"))
                    i = i + 1
                Next
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "แบบประเมินผู้สอนยังไม่ได้ถูกสร้างขึ้น กรุณาสร้างแบบประเมินนี้ก่อน"
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
        CloseConn()
        Dim ArrData(size - 1) As String
        If GetData(size, ArrData, "Ubox").Length = 11 Then
            Exit Sub
        Else
            ReDim ArrDel(size - 1)
            ArrDel = GetDelete(size, ArrDel)
            For i = 1 To size
                If ArrDel(i - 1) = True Then
                    QueryStr = "delete from AssessmentTopic where assess_id = '" & ArrID(i - 1) & "'"
                    If ExecuteComm(QueryStr) = False Then
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    QueryStr = "update AssessmentTopic set assess_topic = '" & ArrData(i - 1) & "' where assess_id = '" & ArrID(i - 1) & "'"
                    If ExecuteComm(QueryStr) = False Then
                        Response.Redirect("../DBFailed.aspx")
                    End If
                End If
            Next
            Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงหัวข้อแบบประเมินผู้สอนเสร็จเรียบร้อยแล้ว&user=Administrator")
        End If
    End Sub

    Sub UpdateTextBox()
        Try
            Dim i As Integer = 1
            Dim size As Integer = 0
            QueryStr = "select * from AssessmentTopic"
            TableStr = "getassessmenttopic"
            If FillCommQ(QueryStr, TableStr) = True Then
                If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                    For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                        Dim order As New Label
                        Dim txtbox As New TextBox
                        Dim check As New CheckBox
                        order.ID = "UOlabel" & i
                        order.Text = i & ". "
                        txtbox.ID = "Ubox" & i
                        txtbox.Text = row("assess_topic")
                        txtbox.Width = "300"
                        check.ID = "UDchk" & i
                        check.Text = "Delete : "
                        check.TextAlign = TextAlign.Left
                        updateholder.Controls.Add(order)
                        updateholder.Controls.Add(txtbox)
                        updateholder.Controls.Add(check)
                        updateholder.Controls.Add(GetLiteral("<br />"))
                        i = i + 1
                    Next
                ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                    warning.Text = "แบบประเมินผู้สอนยังไม่ได้ถูกสร้างขึ้น กรุณาสร้างแบบประเมินนี้ก่อน"
                    Exit Sub
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Catch ex As Exception
            warning.Text = "พบปัญหาที่ฟังก์ชัน UpdateTextBox" & "<br />" & ex.Message
            Exit Sub
        End Try
    End Sub

    Function GetDelete(ByVal size As Integer, ByVal ArrChk As Array) As Array
        Dim i As Integer
        For i = 1 To size
            Dim b As String = "UDchk" & i
            Dim chk As CheckBox = CType(Me.FindControl(b), CheckBox)
            If chk.Checked Then
                ArrChk(i - 1) = True
            Else
                ArrChk(i - 1) = False
            End If
        Next
        Return ArrChk
    End Function

    Protected Sub addclear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles addclear.Click
        addholder.Controls.Clear()
        addnumber.SelectedIndex = 0
        warning.Text = ""
    End Sub

    Protected Sub adddata_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles adddata.Click
        Dim i As Integer = 0
        If addnumber.SelectedItem.Value = "select" Then
            warning.Text = "กรุณาเลือกจำนวนหัวข้อที่ต้องการเพิ่ม"
            Exit Sub
        Else
            Dim ArrData(addnumber.SelectedItem.Value - 1) As String
            If GetData(addnumber.SelectedItem.Value, ArrData, "Abox").Length = 11 Then
                Exit Sub
            Else
                For i = 1 To addnumber.SelectedItem.Value
                    QueryStr = "insert into AssessmentTopic(assess_topic) values('" & ArrData(i - 1) & "')"
                    If ExecuteComm(QueryStr) = False Then
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Next
                Response.Redirect("../Result.aspx?msg=การสร้างหัวข้อแบบประเมินผู้สอนเสร็จเรียบร้อยแล้ว&user=Administrator")
            End If
        End If
    End Sub

    Sub AddTextBox(ByVal size As Integer)
        Try
            Dim i As Integer
            For i = 1 To size
                Dim order As New Label
                Dim txtbox As New TextBox
                order.ID = "AOlabel" & i
                order.Text = i & ". "
                txtbox.ID = "Abox" & i
                txtbox.Text = ""
                txtbox.Width = "300"

                addholder.Controls.Add(order)
                addholder.Controls.Add(txtbox)
                addholder.Controls.Add(GetLiteral("<br />"))
            Next
        Catch ex As Exception
            warning.Text = "พบปัญหาที่ฟังก์ชัน AddTextBox" & "<br />" & ex.Message
            Exit Sub
        End Try
    End Sub
End Class
