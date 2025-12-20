
Partial Class Teacher_TeacherResult
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("loginstatus") = True And Session("user") <> 0 Then
            If Session("usertype") = "Teacher" Then
            Else
                Response.Redirect("../Result.aspx?msg=คุณไม่ใช่สมาชิกประเภทผู้สอน คุณไม่สามารถเข้าเว็บเพจนี้ได้")
            End If
        Else
            Response.Redirect("../Result.aspx?msg=คุณยังไม่ได้ Sign In กรุณา Sign In ด้วยค่ะ")
        End If
    End Sub
    '<asp:SqlDataSource ID="learningDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
    '                                    SelectCommand="SELECT DISTINCT s.std_name, s.std_id, COUNT(s.std_name) AS count, Result.res_score, Result.res_grade FROM Learning AS l INNER JOIN Student AS s ON l.std_id = s.std_id INNER JOIN Register ON s.std_id = Register.std_id INNER JOIN Result ON Register.reg_id = Result.reg_id WHERE (l.sub_id = @sub_id) AND (l.cal_id = (SELECT cal_id FROM LearningCalendar WHERE (cal_year = (SELECT MAX(cal_year) AS Expr1 FROM LearningCalendar AS LearningCalendar_3)) AND (cal_term = (SELECT MAX(cal_term) AS Expr1 FROM LearningCalendar AS LearningCalendar_2 WHERE (cal_year = (SELECT MAX(cal_year) AS Expr1 FROM LearningCalendar AS LearningCalendar_1)))))) GROUP BY s.std_name, s.std_id, l.lrn_id, Result.res_score, Result.res_grade">
    '                                    <SelectParameters>
    '                                        <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
    '                                            Type="Int64" />
    '                                    </SelectParameters>
    '                                </asp:SqlDataSource>
End Class
