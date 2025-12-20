<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TeacherTracking.aspx.vb" Inherits="Teacher_TeacherTracking" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Teacher Tracking</title>
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
                <td colspan="2" width="800" height="150"><img src="../Image/colorfull.jpg" border="0px" width="800" height="150" /></td>
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
                    <table style="margin-top:10px;margin-bottom:10px;margin-left:10px;margin-right:10px" width="550">
                        <tr height="30" bgcolor="#ff9933" style="font-weight:bold;color:White">
                            <td colspan="2">:: ระบบสมาชิกประเภทผู้สอน ::</td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr style="font-weight:bold">
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
                        <tr height="30" style="font-weight:bold;">
                            <td colspan="2">การติดตามผลการเรียน</td>
                        </tr>
                        <tr style="font-weight:bold;">
                            <td>
                                เลือกวิชา <asp:DropDownList ID="subjectDDL" runat="server" AutoPostBack="True" DataSourceID="subjectDTS" DataTextField="sub_name" DataValueField="sub_id">
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
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td>
                            <asp:SqlDataSource ID="learningDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                    SelectCommand="SELECT s.std_name,s.std_id, l.sub_id, COUNT(*) AS count FROM Learning AS l INNER JOIN Student AS s ON l.std_id = s.std_id WHERE (l.sub_id = @sub_id) AND (l.cal_id = (SELECT cal_id FROM LearningCalendar WHERE (cal_year = (SELECT MAX(cal_year) AS Expr1 FROM LearningCalendar AS LearningCalendar_3)) AND (cal_term = (SELECT MAX(cal_term) AS Expr1 FROM LearningCalendar AS LearningCalendar_2 WHERE (cal_year = (SELECT MAX(cal_year) AS Expr1 FROM LearningCalendar AS LearningCalendar_1)))))) GROUP BY s.std_name, s.std_id, l.sub_id">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="learningGV" Width="355px" runat="server" AutoGenerateColumns="False" 
                                    DataSourceID="learningDTS" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                                    <Columns>
                                        <asp:HyperLinkField DataNavigateUrlFields="std_id,sub_id" DataNavigateUrlFormatString="teacherTrackDetail.aspx?student={0}&amp;subject={1}"
                                            DataTextField="std_name" SortExpression="std_name" HeaderText="ชื่อผู้เรียน" Target="_blank">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:HyperLinkField>
                                        <asp:BoundField DataField="count" HeaderText="จำนวนครั้ง" SortExpression="count">
                                            <ItemStyle Width="70px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <FooterStyle BackColor="#507CD1" ForeColor="#330099" />
                                    <RowStyle BackColor="#EFF3FB" ForeColor="#330099" />
                                    <AlternatingRowStyle BackColor="White" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <PagerStyle BackColor="#507CD1" ForeColor="#330099" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                                <%--<asp:SqlDataSource ID="learningDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
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
                                </asp:SqlDataSource>
                                <asp:GridView ID="learningGV" Width="550px" runat="server" AutoGenerateColumns="False" 
                                    DataSourceID="learningDTS" AllowPaging="True" PageSize="10" AllowSorting="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                                    <Columns>
                                        <asp:BoundField DataField="std_name" HeaderText="ชื่อผู้เรียน" SortExpression="std_name" />
                                        <asp:BoundField DataField="lrn_content" HeaderText="กิจกรรม" SortExpression="lrn_content" />
                                        <asp:BoundField DataField="lrn_date" HeaderText="วัน/เดือน/ปี" SortExpression="lrn_date" />
                                        <asp:BoundField DataField="lrn_time" HeaderText="เวลา" SortExpression="lrn_time" />
                                    </Columns>
                                    <FooterStyle BackColor="#507CD1" ForeColor="#330099" />
                                    <RowStyle BackColor="#EFF3FB" ForeColor="#330099" />
                                    <AlternatingRowStyle BackColor="white" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <PagerStyle BackColor="#507CD1" ForeColor="#330099" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="#FFFFff" />
                                </asp:GridView>--%>
                            </td>
                        </tr>
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
