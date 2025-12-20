<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TeacherTrackDetail.aspx.vb" Inherits="TeacherTrackDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Teacher Tracking Detail</title>
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
            <table align="center" bgcolor="white" border="0" cellpadding="0" cellspacing="0"
                style="border-top-width: 0px; border-left-width: 0px; border-bottom-width: 0px;
                text-align: center; border-right-width: 0px" width="800">
                <tr height="150" valign="top">
                    <td colspan="2" height="150" width="800">
                        <img border="0" height="150" src="../Image/colorfull.jpg" width="800" /></td>
                </tr>
                <tr height="580">
                    <td valign="top" width="200">
                        <table bgcolor="#1a2dc7" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px">
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
                            <tr bgcolor="white" style="color: #000080">
                                <td>
                                    <br />
                                    <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                                        BorderWidth="1px" DayNameFormat="Shortest" FirstDayOfWeek="Sunday" Font-Names="Verdana"
                                        Font-Size="8pt" ForeColor="Blue" Height="200px" ShowGridLines="True" Width="200px">
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
                            <tr bgcolor="#ff9933" height="30" style="font-weight: bold; color: white">
                                <td colspan="2">
                                    :: ระบบสมาชิกประเภทผู้สอน ::</td>
                            </tr>
                            <tr height="10">
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td>
    <asp:SqlDataSource ID="learningDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
        SelectCommand="SELECT l.lrn_content, l.lrn_date, l.lrn_time, s.std_name, l.sub_id FROM Learning AS l INNER JOIN Student AS s ON l.std_id = s.std_id WHERE (l.sub_id = @subject) AND (l.cal_id = (SELECT cal_id FROM LearningCalendar WHERE (cal_year = (SELECT MAX(cal_year) AS Expr1 FROM LearningCalendar AS LearningCalendar_3)) AND (cal_term = (SELECT MAX(cal_term) AS Expr1 FROM LearningCalendar AS LearningCalendar_2 WHERE (cal_year = (SELECT MAX(cal_year) AS Expr1 FROM LearningCalendar AS LearningCalendar_1)))))) AND s.std_id = @student ORDER BY s.std_id, l.lrn_id DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="subject" QueryStringField="subject" />           
            <asp:QueryStringParameter Name="student" QueryStringField="student" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="learningGV" Width="355px" runat="server" AutoGenerateColumns="False" 
        DataSourceID="learningDTS" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
            <asp:BoundField DataField="std_name" HeaderText="ชื่อผู้เรียน" SortExpression="std_name" />
            <asp:BoundField DataField="lrn_content" HeaderText="กิจกรรมที่ทำ" SortExpression="lrn_content" />
            <asp:BoundField DataField="lrn_date" HeaderText="วัน" SortExpression="lrn_date" />
            <asp:BoundField DataField="lrn_time" HeaderText="เวลา" SortExpression="lrn_time" />
        </Columns>
            
                
        <FooterStyle BackColor="#507CD1" ForeColor="#330099" />
        <RowStyle BackColor="#EFF3FB" ForeColor="#330099" />
        <AlternatingRowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <PagerStyle BackColor="#507CD1" ForeColor="#330099" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr bgcolor="#cccccc" height="70">
                    <td colspan="2">
                        <span style="font-size: 10pt; color: #000080; font-family: MS Sans Serif">Developed
                            by Ant + Namtan<br />
                            Department of Computer Engineering Faculty of Engineering<br />
                            King Mongkut's Institute of Technology Ladkrabang BKK 10520, Thailand.</span></td>
                </tr>
            </table>
        </div>
    
    </form>
</body>
</html>
