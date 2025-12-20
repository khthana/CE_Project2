Imports System.Data
Imports System.Data.SqlClient

Partial Class Teacher_TeacherViewTesting
    Inherits System.Web.UI.Page

    Protected Sub back_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles back.Click
        Response.Redirect("TeacherTesting.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Teacher" Then
                If Request.QueryString("type") = "" Then
                    warning.Text = "เกิดข้อผิดพลาด ไม่พบข้อมูล"
                    Exit Sub
                End If
                If Request.QueryString("subtype") = "" Then
                    warning.Text = "เกิดข้อผิดพลาด ไม่พบข้อมูล"
                    Exit Sub
                End If
                If Request.QueryString("typeid") = "" Then
                    warning.Text = "เกิดข้อผิดพลาด ไม่พบข้อมูล"
                    Exit Sub
                End If

                Dim i As Integer = 1
                Dim tmp As Boolean = False
                QueryStr = "select * from " & Request.QueryString("type") & " where " & Request.QueryString("subtype") & _
                    " = '" & Request.QueryString("typeid") & "' order by qst_number"
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
                            Dim tablename As String = ""
                            If Request.QueryString("type") = "QuestionModule" Then
                                tablename = "Module"
                            ElseIf Request.QueryString("type") = "QuestionAssignment" Then
                                tablename = "Assignment"
                            ElseIf Request.QueryString("type") = "QuestionExamination" Then
                                tablename = "Examination"
                            End If
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
                    ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                        warning.Text = "การทดสอบนี้ยังไม่มีข้อมูลของข้อสอบ"
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
