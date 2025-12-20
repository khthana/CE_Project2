Imports System.Data
Imports System.Data.SqlClient

Partial Class Teacher_TeacherCheckAssignmentFile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Teacher" Then
                If Not Page.IsPostBack Then
                    '--------------------------- เช็คว่ามีคะแนนในการส่งงาน Assignment ครั้งนี้รึยัง
                    QueryStr = "select * from ScoreAssignment where std_id = '" & Request.QueryString("std_id") & "'" & _
                        " and ass_id = '" & Request.QueryString("ass_id") & "'"
                    TableStr = "getscore"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                Response.Redirect("../Result.aspx?msg=ผู้เรียนรหัส " & Request.QueryString("std_id") & " นี้ได้มีคะแนนสำหรับงาน Assignment นี้แล้ว&user=Teacher")
                            Next
                        ElseIf sqlDS.Tables(TableStr).Rows.Count = 0 Then

                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    '---------------------------
                    QueryStr = "select std_name from Student where std_id = '" & Request.QueryString("std_id") & "'"
                    TableStr = "getstudentname"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                name.Text = "ไฟล์ส่งงาน Assignment ของคุณ " & CStr(row("std_name"))
                            Next
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                    QueryStr = "select ass_wscore from Assignment where ass_id = '" & Request.QueryString("ass_id") & "'"
                    TableStr = "getweightscore"
                    If FillCommQ(QueryStr, TableStr) = True Then
                        If sqlDS.Tables(TableStr).Rows.Count = 1 Then
                            For Each row As DataRow In sqlDS.Tables(TableStr).Rows
                                fullscore.Text = CStr(row("ass_wscore"))
                            Next
                        Else
                            Response.Redirect("../DBFailed.aspx")
                        End If
                    Else
                        Response.Redirect("../DBFailed.aspx")
                    End If
                End If
            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้สอน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If
    End Sub

    Protected Sub submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        If Val(fullscore.Text) < Val(score.Text) Then
            warning.Text = "คะแนนที่ให้นั้น มากกว่า คะแนนเต็ม กรุณาแก้ไขด้วย"
            Exit Sub
        End If
        QueryStr = "insert into ScoreAssignment(ass_id,std_id,scr_score) values('" & _
            Request.QueryString("ass_id") & "','" & Request.QueryString("std_id") & "','" & Val(score.Text) & "')"
        If ExecuteComm(QueryStr) = True Then
            Response.Redirect("../Result.aspx?msg=การให้คะแนนการส่งงาน Assignment เสร็จเรียบร้อยแล้ว&user=Teacher")
        End If
    End Sub
End Class
