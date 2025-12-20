<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TeacherResult.aspx.vb" Inherits="Teacher_TeacherResult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Teacher Result of Student Learning</title>
    <script src="../js/teacherbtn.js" language="javascript" type="text/javascript"></script>
    <style>
	    a:link {COLOR: #000080; TEXT-DECORATION: none}
	    a:visited {	COLOR: #000080; TEXT-DECORATION: none}
	    a:hover {COLOR: blue; TEXT-DECORATION: none}
    </style>
</head>
<body topmargin="0" bottommargin="0" background="../Image/bg.jpg" style="font-family:MS Sans Serif;font-size:10pt">
    <form id="form1" runat="server">
    <div>
    <table width="800" align="center" bgcolor="white" border="0" cellpadding="0" cellspacing="0" style="border:0px;text-align:center;">
            <tr height="150" valign="top">
                <td colspan="2" width="800" style="height: 150px"><img src="../Image/colorfull.jpg" border="0px" width="800" height="150" /></td>
            </tr>
            <tr height="580">
                <td valign="top" width="200">
                    <table style="margin-top:10px;" cellpadding="0" cellspacing="0" border="0" bgcolor="#1A2DC7">
                        <tr>
                            <td>
                                <a href = "TeacherProfile.aspx" onMouseOver="turnOn('profile');" onMouseOut="turnOff('profile');">
                                    <img name="profile" class="imgTrans" src="../Image/Button/teacher/tprofile1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherPostNews.aspx" onMouseOver="turnOn('news');" onMouseOut="turnOff('news');">
                                    <img name="news" class="imgTrans" src="../Image/Button/teacher/tnews1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherGradeLevel.aspx" onMouseOver="turnOn('gradelevel');" onMouseOut="turnOff('gradelevel');">
                                    <img name="gradelevel" class="imgTrans" src="../Image/Button/teacher/tgrade1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherResult.aspx" onMouseOver="turnOn('studentresult');" onMouseOut="turnOff('studentresult');">
                                    <img name="studentresult" class="imgTrans" src="../Image/Button/teacher/tsudentresult1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherLearningFile.aspx" onMouseOver="turnOn('file');" onMouseOut="turnOff('file');">
                                    <img name="file" class="imgTrans" src="../Image/Button/teacher/tfile1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherSubject.aspx" onMouseOver="turnOn('subject');" onMouseOut="turnOff('subject');">
                                    <img name="subject" class="imgTrans" src="../Image/Button/teacher/tsubject1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherLesson.aspx" onMouseOver="turnOn('lesson');" onMouseOut="turnOff('lesson');">
                                    <img name="lesson" class="imgTrans" src="../Image/Button/teacher/tlesson1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherAssessment.aspx" onMouseOver="turnOn('assessment');" onMouseOut="turnOff('assessment');">
                                    <img name="assessment" class="imgTrans" src="../Image/Button/teacher/tassessment1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherTesting.aspx" onMouseOver="turnOn('testing');" onMouseOut="turnOff('testing');">
                                    <img name="testing" class="imgTrans" src="../Image/Button/teacher/ttesting1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherCheckAssignment.aspx" onMouseOver="turnOn('checkass');" onMouseOut="turnOff('checkass');">
                                    <img name="checkass" class="imgTrans" src="../Image/Button/teacher/tcheckass1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherTeachingLive.aspx" onMouseOver="turnOn('live');" onMouseOut="turnOff('live');">
                                    <img name="live" class="imgTrans" src="../Image/Button/teacher/tlive1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherTracking.aspx" onMouseOver="turnOn('track');" onMouseOut="turnOff('track');">
                                    <img name="track" class="imgTrans" src="../Image/Button/teacher/ttrack1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherAssessmentResult.aspx" onMouseOver="turnOn('assessresult');" onMouseOut="turnOff('assessresult');">
                                    <img name="assessresult" class="imgTrans" src="../Image/Button/teacher/tassessresult1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherSignOut.aspx" onMouseOver="turnOn('out');" onMouseOut="turnOff('out');">
                                    <img name="out" class="imgTrans" src="../Image/Button/teacher/tout1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr bgcolor="white">
                            <td><br />
                                <asp:Calendar ID="calendar" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                                     BorderWidth="1px" DayNameFormat="Shortest" FirstDayOfWeek="Sunday" Font-Names="Verdana" 
                                     Font-Size="8pt" ForeColor="Blue" ShowGridLines="True" Height="200px" Width="200px">
                                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                    <SelectorStyle BackColor="#FFCC66" />
                                    <OtherMonthDayStyle ForeColor="#CC9966" />
                                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                </asp:Calendar>
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top" width="600">
                    <table style="margin: 10px" width="550">
                        <tbody>
                            <tr bgcolor="#ff9933" height="30" style="font-weight: bold; color: white">
                                <td colspan="2">
                                    :: ระบบสมาชิกประเภทผู้สอน ::</td>
                            </tr>
                            <tr height="10">
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr style="font-weight: bold">
                                <td colspan="2">
                                    <asp:SqlDataSource ID="userDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                        SelectCommand="SELECT [tch_name] FROM [Teacher] WHERE ([tch_id] = @tch_id)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="tch_id" SessionField="user" Type="Int64" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:DataList ID="DataList1" runat="server" DataSourceID="userDTS">
                                        <ItemTemplate>
                                        คุณ 
                                            <asp:Label ID="tch_nameLabel" runat="server" Text='<%# Eval("tch_name") %>'></asp:Label><br />
                                            <br />
                                        </ItemTemplate>
                                    </asp:DataList>
                                </td>
                            </tr>
                            <tr height="30" style="font-weight: bold">
                                <td colspan="2">
                                    การติดตามผลการเรียน</td>
                            </tr>
                            <tr style="font-weight: bold">
                                <td style="width: 553px">
                                เลือกวิชา
                                    <asp:DropDownList ID="subjectDDL" runat="server" AutoPostBack="True" DataSourceID="subjectDTS"
                                        DataTextField="sub_name" DataValueField="sub_id">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="subjectDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                        SelectCommand="SELECT [sub_id], [sub_name] FROM [Subject] WHERE (([tch_id] = @tch_id) AND ([sub_status] = @sub_status)) ORDER BY [sub_id]">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="tch_id" SessionField="user" Type="Int64" />
                                            <asp:Parameter DefaultValue="true" Name="sub_status" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr height="10">
                                <td colspan="2" style="height: 10px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 553px">
                                    <%--
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                    SelectCommand="select l.lrn_content,l.lrn_date,l.lrn_time,s.std_name from learning l,student s 
                                        where ([sub_id] = @sub_id) and l.std_id=s.std_id 
                                        and cal_id = (select cal_id from learningcalendar  
                                        where cal_year = (select max(cal_year) from learningcalendar) 
                                        and cal_term = (select max(cal_term) from learningcalendar 
                                        where cal_year=(select max(cal_year) from learningcalendar))) 
                                        order by s.std_id,l.lrn_id desc">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>--%>
                                    <asp:SqlDataSource ID="resultDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                        SelectCommand="SELECT DISTINCT Student.std_name, Student.std_id, Result.sub_id, Result.res_grade, Result.res_score FROM Register INNER JOIN Result ON Register.reg_id = Result.reg_id INNER JOIN Student ON Register.std_id = Student.std_id INNER JOIN LearningCalendar ON Register.reg_year = (SELECT MAX(cal_year) AS Expr1 FROM LearningCalendar) AND Register.reg_term = (SELECT MAX(cal_term) AS Expr1 FROM LearningCalendar WHERE (cal_year = (SELECT MAX(cal_year) AS Expr1 FROM LearningCalendar))) AND Result.sub_id = @subject">
                                        <SelectParameters>
                                            <asp:ControlParameter Name="subject" ControlID="subjectDDL" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:GridView ID="learningGV" runat="server" AllowPaging="True" AllowSorting="True"
                                        AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None"
                                        BorderWidth="1px" CellPadding="4" DataSourceID="resultDTS" Width="355px">
                                        <FooterStyle BackColor="#507CD1" ForeColor="#330099" />
                                        <RowStyle BackColor="#EFF3FB" ForeColor="#330099" />
                                        <AlternatingRowStyle BackColor="White" />
                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                        <PagerStyle BackColor="#507CD1" ForeColor="#330099" HorizontalAlign="Center" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <Columns>
                                            <asp:HyperLinkField DataNavigateUrlFields="std_id,sub_id" DataNavigateUrlFormatString="TeacherResultDetail.aspx?student={0}&subject={1}"
                                                DataTextField="std_name" HeaderText="ชื่อผู้เรียน" SortExpression="std_name"
                                                Target="_blank">
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:HyperLinkField>
                                            <asp:BoundField DataField="res_score" HeaderText="คะแนนที่ได้" SortExpression="res_score" />
                                            <asp:BoundField DataField="res_grade" HeaderText="เกรด" SortExpression="res_grade" />
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr height="70" bgcolor="#cccccc">
                <td colspan="2">
                    <span style="font-size: 10pt; color: #000080; font-family: MS Sans Serif">
                        Developed by Ant + Namtan<br />
                        Department of Computer Engineering Faculty of Engineering<br />
                        King Mongkut's Institute of Technology Ladkrabang BKK 10520, Thailand.</span></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
