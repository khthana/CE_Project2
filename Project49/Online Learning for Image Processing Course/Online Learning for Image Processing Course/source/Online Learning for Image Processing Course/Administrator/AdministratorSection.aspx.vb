Imports System.Data
Imports System.Data.SqlClient

Partial Class Administrator_AdministratorSection
    Inherits System.Web.UI.Page

    Protected Sub createsection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles createsection.Click
        If subjectDDL.Items.Count = 0 Then
            warning.Text = "ไม่พบข้อมูลของรายวิชาต่างๆ"
            Exit Sub
        End If
        QueryStr = "select * from SubjectSection where sub_id = '" & subjectDDL.SelectedItem.Value & "' order by sec_number"
        TableStr = "getdetailsection"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count >= 0 Then
                DataList1.DataSource = sqlDS.Tables(TableStr)
                DataList1.DataBind()
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If

        tablecreate.Visible = True
        tableupdate.Visible = False
        warning.Text = ""
    End Sub

    Protected Sub updatesection_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updatesection.Click
        If subjectDDL.Items.Count = 0 Then
            warning.Text = "ไม่พบข้อมูลของรายวิชาต่างๆ"
            Exit Sub
        End If
        QueryStr = "select sec_id,sec_number from SubjectSection where sub_id = '" & subjectDDL.SelectedItem.Value & "'"
        TableStr = "getidsection"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                sec.DataTextField = "sec_number"
                sec.DataValueField = "sec_id"
                sec.DataSource = sqlDS.Tables(TableStr)
                sec.DataBind()
                QueryStr = "select * from SubjectSection where sec_id = '" & sec.SelectedItem.Value & "'"
                TableStr = "getdetailsection"
                If FillCommQ(QueryStr, TableStr) = True Then
                    If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                        For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                            If row("sec_dlearn") = "อาทิตย์" Then
                                day2.SelectedIndex = 1
                            ElseIf row("sec_dlearn") = "จันทร์" Then
                                day2.SelectedIndex = 2
                            ElseIf row("sec_dlearn") = "อังคาร" Then
                                day2.SelectedIndex = 3
                            ElseIf row("sec_dlearn") = "พุธ" Then
                                day2.SelectedIndex = 4
                            ElseIf row("sec_dlearn") = "พฤหัสบดี" Then
                                day2.SelectedIndex = 5
                            ElseIf row("sec_dlearn") = "ศุกร์" Then
                                day2.SelectedIndex = 6
                            ElseIf row("sec_dlearn") = "เสาร์" Then
                                day2.SelectedIndex = 7
                            End If
                            If row("sec_tlearn") = "9.00-12.00" Then
                                time2.SelectedIndex = 1
                            ElseIf row("sec_tlearn") = "13.00-16.00" Then
                                time2.SelectedIndex = 2
                            End If
                        Next
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                Else
                    Response.Redirect("../DBFailed.aspx")
                End If
            ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then
                warning.Text = "ไม่พบข้อมูล"
                tableupdate.Visible = False
                tablecreate.Visible = False
                Exit Sub
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If

        tablecreate.Visible = False
        tableupdate.Visible = True
        warning.Text = ""
    End Sub

    Protected Sub subjectDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles subjectDDL.SelectedIndexChanged
        tablecreate.Visible = False
        tableupdate.Visible = False
        warning.Text = ""
    End Sub

    Protected Sub clear1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear1.Click
        day1.SelectedIndex = 0
        time1.SelectedIndex = 0
        warning.Text = ""
    End Sub

    Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        Dim number As Integer = 0
        QueryStr = "select count(*) as numberofsection from SubjectSection where sub_id = '" & subjectDDL.SelectedItem.Value & "'"
        TableStr = "getnumberofsection"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count >= 0 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    number = CInt(row("numberofsection"))
                Next
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
        number = number + 1
        QueryStr = "insert into SubjectSection(sub_id,sec_number,sec_dlearn,sec_tlearn) values('" & _
            subjectDDL.SelectedItem.Value & "','" & number & "','" & day1.SelectedItem.Text & "','" & _
            time1.SelectedItem.Text & "')"
        CloseConn()
        If ExecuteComm(QueryStr) = True Then
            Response.Redirect("../Result.aspx?msg=การกำหนดกลุ่มการเรียนที่ " & number & " ของวิชา " & subjectDDL.SelectedItem.Text & " เสร็จเรียบร้อยแล้ว&user=Administrator")
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub sec_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles sec.SelectedIndexChanged
        QueryStr = "select * from SubjectSection where sec_id = '" & sec.SelectedItem.Value & "' and sub_id = '" & subjectDDL.SelectedItem.Value & "'"
        TableStr = "getdetailsection"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    If row("sec_dlearn") = "อาทิตย์" Then
                        day2.SelectedIndex = 1
                    ElseIf row("sec_dlearn") = "จันทร์" Then
                        day2.SelectedIndex = 2
                    ElseIf row("sec_dlearn") = "อังคาร" Then
                        day2.SelectedIndex = 3
                    ElseIf row("sec_dlearn") = "พุธ" Then
                        day2.SelectedIndex = 4
                    ElseIf row("sec_dlearn") = "พฤหัสบดี" Then
                        day2.SelectedIndex = 5
                    ElseIf row("sec_dlearn") = "ศุกร์" Then
                        day2.SelectedIndex = 6
                    ElseIf row("sec_dlearn") = "เสาร์" Then
                        day2.SelectedIndex = 7
                    End If
                    If row("sec_tlearn") = "9.00-12.00" Then
                        time2.SelectedIndex = 1
                    ElseIf row("sec_tlearn") = "13.00-16.00" Then
                        time2.SelectedIndex = 2
                    End If
                Next
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub clear2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear2.Click
        day2.SelectedIndex = 0
        time2.SelectedIndex = 0
        warning.Text = ""
    End Sub

    Protected Sub update_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles update.Click
        If sec.Items.Count = 0 Then
            warning.Text = "วิชานี้ไม่ได้กำหนดกลุ่มที่เรียนไว้"
            Exit Sub
        End If
        QueryStr = "update SubjectSection set sec_dlearn = '" & day2.SelectedItem.Text & "',sec_tlearn = '" & _
            time2.SelectedItem.Text & "' where sec_id = '" & sec.SelectedItem.Value & "'"
        If ExecuteComm(QueryStr) = True Then
            Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงกลุ่มการเรียนที่ " & sec.SelectedItem.Text & " ของวิชา " & subjectDDL.SelectedItem.Text & " เสร็จเรียบร้อยแล้ว&user=Administrator")
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles delete.Click
        If sec.Items.Count = 0 Then
            warning.Text = "วิชานี้ไม่ได้กำหนดกลุ่มที่เรียนไว้"
            Exit Sub
        End If
        Dim count As Integer = sec.Items.Count
        Dim number As Integer = Val(sec.SelectedItem.Text)
        Dim i As Integer = 0

        QueryStr = "delete from SubjectSection where sec_id = '" & sec.SelectedItem.Value & "'"
        If ExecuteComm(QueryStr) = True Then
            For i = (number + 1) To count
                QueryStr = "update SubjectSection set sec_number = '" & Val(sec.Items(i - 1).Text) - 1 & "'" & _
                    " where sub_id = '" & subjectDDL.SelectedItem.Value & "' and sec_id = '" & sec.Items(i - 1).Value & "'"
                If ExecuteComm(QueryStr) = False Then
                    Response.Redirect("../DBFailed.aspx")
                End If
            Next
            Response.Redirect("../Result.aspx?msg=ได้ลบกลุ่มการเรียนที่ " & sec.SelectedItem.Text & " ของวิชา " & subjectDDL.SelectedItem.Text & " เสร็จเรียบร้อยแล้ว&user=Administrator")
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Administrator" Then
                delete.Attributes.Add("onclick", "return confirm('Are you sure you want to delete this section ?');")
            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้ดูแลระบบ คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If
    End Sub
End Class
