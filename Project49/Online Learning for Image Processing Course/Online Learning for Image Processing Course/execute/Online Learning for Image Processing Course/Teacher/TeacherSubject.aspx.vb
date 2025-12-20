Imports System.Data
Imports System.Data.SqlClient

Partial Class Teacher_TeacherSubject
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Session("loginstatus") = True And Session("user") <> 0 Then
                If Session("usertype") = "Teacher" Then
                    QueryStr = "select sub_id,sub_name from Subject where tch_id = '" & Session("user") & "' and sub_status = '1'"
                    TableStr = "getsubject"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count > 0 Then
                            subjectDDL.DataTextField = "sub_name"
                            subjectDDL.DataValueField = "sub_id"
                            subjectDDL.DataSource = sqlDS
                            subjectDDL.DataBind()
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    QueryStr = "select sub_description,sub_book from Subject where sub_id = '" & subjectDDL.SelectedItem.Value & "'"
                    TableStr = "getdetail"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                description.Text = row("sub_description")
                                reference.Text = row("sub_book")
                            Next
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
        End If
    End Sub

    Protected Sub clear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clear.Click
        description.Text = ""
        reference.Text = ""
        warning.Text = ""
    End Sub

    Protected Sub update_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles update.Click
        If subjectDDL.Items.Count = 0 Then
            warning.Text = "ไม่พบข้อมูลของรายวิชาต่างๆ"
            Exit Sub
        End If
        QueryStr = "update Subject set sub_description = '" & description.Text & "',sub_book = '" & reference.Text & _
                    "' where sub_id = '" & subjectDDL.SelectedItem.Value & "'"
        If ExecuteComm(QueryStr) = False Then
            Response.Redirect("../DBFailed.aspx")
        Else
            Response.Redirect("../Result.aspx?msg=การเปลี่ยนแปลงแก้ไขรายะเอียดวิชาเสร็จเรียบร้อยแล้ว&user=Teacher")
        End If
    End Sub

    Protected Sub subjectDDL_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles subjectDDL.SelectedIndexChanged
        QueryStr = "select sub_description,sub_book from Subject where sub_id = '" & subjectDDL.SelectedItem.Value & "'"
        TableStr = "getdetail"
        If FillCommQ(QueryStr, TableStr) = True Then
            If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                    description.Text = row("sub_description")
                    reference.Text = row("sub_book")
                Next
            Else
                Response.Redirect("../DBFailed.aspx")
            End If
        Else
            Response.Redirect("../DBFailed.aspx")
        End If
    End Sub
End Class
