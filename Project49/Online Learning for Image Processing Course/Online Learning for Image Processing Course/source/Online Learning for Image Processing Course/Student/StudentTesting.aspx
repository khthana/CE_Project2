<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StudentTesting.aspx.vb" Inherits="Student_StudentTesting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Student Testing</title>
<script src="../js/studentbtn.js" language="javascript" type="text/javascript"></script>
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
                    <table style="margin-top:10px;" cellpadding="0" cellspacing="0" border="0" bgcolor="#1CAC28">
                       <tr>
                            <td>
                                <a href = "StudentProfile.aspx" onMouseOver="turnOn('profile');" onMouseOut="turnOff('profile');">
                                    <img name="profile" class="imgTrans" src="../Image/Button/student/stprofile1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "StudentRegister.aspx" onMouseOver="turnOn('register');" onMouseOut="turnOff('register');">
                                    <img name="register" class="imgTrans" src="../Image/Button/student/stregister1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "StudentSchedule.aspx" onMouseOver="turnOn('schedule');" onMouseOut="turnOff('schedule');">
                                    <img name="schedule" class="imgTrans" src="../Image/Button/student/stschedule1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "StudentLesson.aspx" onMouseOver="turnOn('lesson');" onMouseOut="turnOff('lesson');">
                                    <img name="lesson" class="imgTrans" src="../Image/Button/student/stlesson1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "StudentTesting.aspx" onMouseOver="turnOn('testing');" onMouseOut="turnOff('testing');">
                                    <img name="testing" class="imgTrans" src="../Image/Button/student/sttesting1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "StudentPPT.aspx" onMouseOver="turnOn('ppt');" onMouseOut="turnOff('ppt');">
                                    <img name="ppt" class="imgTrans" src="../Image/Button/student/stppt1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "StudentVDO.aspx" onMouseOver="turnOn('vdo');" onMouseOut="turnOff('vdo');">
                                    <img name="vdo" class="imgTrans" src="../Image/Button/student/stvdo1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "StudentSimulation.aspx" onMouseOver="turnOn('sim');" onMouseOut="turnOff('sim');">
                                    <img name="sim" class="imgTrans" src="../Image/Button/student/stsim1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "StudentLearningLive.aspx" onMouseOver="turnOn('live');" onMouseOut="turnOff('live');">
                                    <img name="live" class="imgTrans" src="../Image/Button/student/stlive1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "StudentDownload.aspx" onMouseOver="turnOn('doc');" onMouseOut="turnOff('doc');">
                                    <img name="doc" class="imgTrans" src="../Image/Button/student/stdoc1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "StudentTracking.aspx" onMouseOver="turnOn('track');" onMouseOut="turnOff('track');">
                                    <img name="track" class="imgTrans" src="../Image/Button/student/sttrack1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "StudentTeacherAssessment.aspx" onMouseOver="turnOn('assess');" onMouseOut="turnOff('assess');">
                                    <img name="assess" class="imgTrans" src="../Image/Button/student/stassessteacher1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "StudentMessageBoard.aspx" onMouseOver="turnOn('mb');" onMouseOut="turnOff('mb');">
                                    <img name="mb" class="imgTrans" src="../Image/Button/student/stmb1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "StudentSignOut.aspx" onMouseOver="turnOn('out');" onMouseOut="turnOff('out');">
                                    <img name="out" class="imgTrans" src="../Image/Button/student/stout1.jpg" border="0" align="middle" width="200" height="20">
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
                            <td colspan="2">
                                :: ระบบสมาชิกประเภทผู้เรียน ::</td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr style="font-weight:bold">
                            <td colspan="2">
                                <asp:SqlDataSource ID="userDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                                    SelectCommand="SELECT [std_name] FROM [Student] WHERE ([std_id] = @std_id)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DataList ID="DataList2" runat="server" DataSourceID="userDTS">
                                    <ItemTemplate>
                                        คุณ 
                                        <asp:Label ID="std_nameLabel" runat="server" Text='<%# Eval("std_name") %>'></asp:Label><br />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                        <tr height="30" style="font-weight:bold">
                            <td colspan="2">
                                การทดสอบและผลการทดสอบของประเภทต่างๆในแต่ละวิชา</td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td style="font-weight:bold">
                                เลือกวิชา
                                <asp:DropDownList ID="subjectDDL" runat="server" AutoPostBack="True" DataSourceID="subjectDTS" DataTextField="sub_name" DataValueField="sub_id">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="subjectDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                    SelectCommand="select sub_id, sub_name from subject where sub_id in (select sub_id 
                                        from result where reg_id = (SELECT reg_id FROM [register] 
                                        WHERE reg_year = (SELECT MAX(reg_year) FROM [register]) 
                                        and reg_term = (select max(reg_term) from register 
                                        where reg_year = (select max(reg_year) from register)) 
                                        and ([std_id] = @std_id))) order by sub_id">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <%--<asp:SqlDataSource ID="gradelevelDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                    SelectCommand="SELECT [gl_a], [gl_bp], [gl_b], [gl_cp], [gl_c], [gl_dp], [gl_d], [gl_f] FROM [GradeLevel] WHERE ([sub_id] = @sub_id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>--%>
                            </td>
                        </tr>
                        <%--<tr height="10"><td colspan="2"></td></tr>
                        <tr height="10"><td colspan="2">
                            <asp:GridView ID="gradelevelGV" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="gradelevelDTS">
                                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                <Columns>
                                    <asp:BoundField DataField="gl_a" HeaderText="A" SortExpression="gl_a" />
                                    <asp:BoundField DataField="gl_bp" HeaderText="B+" SortExpression="gl_bp" />
                                    <asp:BoundField DataField="gl_b" HeaderText="B" SortExpression="gl_b" />
                                    <asp:BoundField DataField="gl_cp" HeaderText="C+" SortExpression="gl_cp" />
                                    <asp:BoundField DataField="gl_c" HeaderText="C" SortExpression="gl_c" />
                                    <asp:BoundField DataField="gl_dp" HeaderText="D+" SortExpression="gl_dp" />
                                    <asp:BoundField DataField="gl_d" HeaderText="D" SortExpression="gl_d" />
                                    <asp:BoundField DataField="gl_f" HeaderText="F(ค่าที่น้อยกว่า)" SortExpression="gl_f" />
                                </Columns>
                                <RowStyle BackColor="White" ForeColor="#330099" />
                                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFff" />
                            </asp:GridView>
                        </td></tr>--%>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="gradeDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                                    SelectCommand="select res_grade,res_score,reg_id from result where ([sub_id] = @sub_id) and reg_id = (
                                        select reg_id from register where ([std_id] = @std_id) 
                                        and reg_year = (select max(reg_year) from register) 
                                        and reg_term = (select max(reg_term) from register 
                                        where reg_year = (select max(reg_year) from register))
                                        )">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                            Type="Int64" />
                                        <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="gradeGV" Width="150px" runat="server" AutoGenerateColumns="False" DataSourceID="gradeDTS" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                                    <Columns>
                                        <asp:BoundField DataField="res_grade" HeaderText="เกรด" SortExpression="res_grade" />
                                        <asp:BoundField DataField="res_score" HeaderText="คะแนนรวม" SortExpression="res_score" />
                                        <asp:BoundField DataField="reg_id" HeaderText="reg_id" SortExpression="reg_id" Visible="False" />
                                    </Columns>
                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                    <RowStyle BackColor="White" ForeColor="#330099" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#ff6633" Font-Bold="True" ForeColor="#FFFFff" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td style="font-weight:bold">การทดสอบประจำบทเรียน</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="moduleDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                                    SelectCommand="SELECT [mod_id], [sub_id], [mod_number], [mod_wscore], [mod_datestart], [mod_dateend], [mod_time] 
                                        FROM [Module] WHERE ([sub_id] = @sub_id) and mod_year=(select max(cal_year) from learningcalendar)
                                        and mod_term=(select max(cal_term) from learningcalendar 
                                        where cal_year=(select max(cal_year) from learningcalendar)) ORDER BY [mod_number]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="moduleGV" Width="550px" runat="server" AutoGenerateColumns="False" DataKeyNames="mod_id"
                                    DataSourceID="moduleDTS" CellPadding="4" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                                    <Columns>
                                        <asp:BoundField DataField="mod_id" HeaderText="mod_id" InsertVisible="False" ReadOnly="True"
                                            SortExpression="mod_id" Visible="False" />
                                        <asp:HyperLinkField DataNavigateUrlFields="mod_id,sub_id" DataNavigateUrlFormatString="StudentTestingPage.aspx?typeid={0}&amp;sub_id={1}&amp;type=Module"
                                            DataTextField="mod_number" HeaderText="การทดสอบครั้งที่" SortExpression="mod_number"
                                            Target="_self" />
                                        <asp:BoundField DataField="mod_wscore" HeaderText="คะแนนเต็ม" SortExpression="mod_wscore" />
                                        <asp:BoundField DataField="mod_datestart" HeaderText="วันเริ่มต้นของการทดสอบ (ว/ด/ป)" SortExpression="mod_datestart" />
                                        <asp:BoundField DataField="mod_dateend" HeaderText="วันสุดท้ายของการทดสอบ (ว/ด/ป)" SortExpression="mod_dateend" />
                                        <asp:BoundField DataField="mod_time" HeaderText="เวลาที่ใช้ในการทดสอบ (ชั่วโมง)" SortExpression="mod_time" />
                                        <asp:BoundField DataField="sub_id" HeaderText="sub_id" SortExpression="sub_id" Visible="False" />
                                        <asp:BoundField DataField="mod_number" HeaderText="mod_number" SortExpression="mod_number"
                                            Visible="False" />
                                    </Columns>
                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                    <RowStyle BackColor="#EFF3FB" ForeColor="#330099" />
                                    <AlternatingRowStyle BackColor="White" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td style="font-weight:bold">การทดสอบเก็บคะแนน</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="assignmentDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                                    SelectCommand="SELECT [ass_id], [sub_id], [ass_number], [ass_wscore], [ass_datestart], [ass_dateend], [ass_time] 
                                        FROM [Assignment] WHERE ([sub_id] = @sub_id) and ass_year=(select max(cal_year) from learningcalendar)
                                        and ass_term=(select max(cal_term) from learningcalendar 
                                        where cal_year=(select max(cal_year) from learningcalendar)) ORDER BY [ass_number]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="assignmentGV" Width="550px" runat="server" DataSourceID="assignmentDTS" AutoGenerateColumns="False" DataKeyNames="ass_id" CellPadding="4" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                                    <Columns>
                                        <asp:HyperLinkField DataNavigateUrlFields="ass_id,sub_id" DataNavigateUrlFormatString="StudentTestingPage.aspx?typeid={0}&amp;sub_id={1}&amp;type=Assignment"
                                            DataTextField="ass_number" HeaderText="การทดสอบครั้งที่" SortExpression="ass_number"
                                            Target="_self" />
                                        <asp:BoundField DataField="ass_wscore" HeaderText="คะแนนเต็ม" SortExpression="ass_wscore" />
                                        <asp:BoundField DataField="ass_datestart" HeaderText="วันเริ่มต้นของการทดสอบ (ว/ด/ป)" SortExpression="ass_datestart" />
                                        <asp:BoundField DataField="ass_dateend" HeaderText="วันสุดท้ายของการทดสอบ (ว/ด/ป)" SortExpression="ass_dateend" />
                                        <asp:BoundField DataField="ass_time" HeaderText="เวลาที่ใช้ในการทดสอบ (ชั่วโมง)" SortExpression="ass_time" />
                                        <asp:BoundField DataField="sub_id" HeaderText="sub_id" SortExpression="sub_id" Visible="False" />
                                        <asp:BoundField DataField="ass_id" HeaderText="ass_id" InsertVisible="False" ReadOnly="True"
                                            SortExpression="ass_id" Visible="False" />
                                        <asp:BoundField DataField="ass_number" HeaderText="ass_number" SortExpression="ass_number"
                                            Visible="False" />
                                    </Columns>
                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                    <RowStyle BackColor="#E3EAEB" ForeColor="#330099" />
                                    <AlternatingRowStyle BackColor="White" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td style="font-weight:bold">งานที่ได้รับมอบหมาย (Assignment)</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="workDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                                    SelectCommand="select a.ass_number,t.asst_topic,a.ass_id,a.sub_id from assignmenttopic t, assignment a 
                                        where t.ass_id=a.ass_id and a.ass_year = (select max(cal_year) from learningcalendar) 
                                        and a.ass_term = (select max(cal_term) from learningcalendar 
                                        where cal_year=(select max(cal_year) from learningcalendar))
                                        and ([sub_id] = @sub_id) ORDER BY [ass_number]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="workGV" runat="server" AutoGenerateColumns="False" DataSourceID="workDTS" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ass_id" GridLines="Vertical">
                                    <Columns>
                                        <asp:BoundField DataField="ass_number" HeaderText="Assignment ครั้งที่" SortExpression="ass_number" />
                                        <asp:HyperLinkField DataNavigateUrlFields="ass_id,sub_id" DataNavigateUrlFormatString="StudentAssignment.aspx?ass_id={0}&amp;sub_id={1}"
                                            DataTextField="asst_topic" HeaderText="หัวข้อ" SortExpression="asst_topic" Target="_blank" />
                                        <asp:BoundField DataField="asst_topic" HeaderText="asst_topic" SortExpression="asst_topic"
                                            Visible="False" />
                                        <asp:BoundField DataField="ass_id" HeaderText="ass_id" InsertVisible="False" ReadOnly="True"
                                            SortExpression="ass_id" Visible="False" />
                                        <asp:BoundField DataField="sub_id" HeaderText="sub_id" InsertVisible="False" ReadOnly="True"
                                            SortExpression="sub_id" Visible="False" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="Gainsboro" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td style="font-weight:bold">การทดสอบปลายภาค</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="examDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                                    SelectCommand="SELECT [exm_id], [sub_id], [exm_number], [exm_wscore], [exm_datestart], [exm_dateend], [exm_time] 
                                        FROM [Examination] WHERE ([sub_id] = @sub_id) and exm_year=(select max(cal_year) from learningcalendar)
                                        and exm_term=(select max(cal_term) from learningcalendar 
                                        where cal_year=(select max(cal_year) from learningcalendar)) ORDER BY [exm_number]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="examGV" runat="server" AutoGenerateColumns="False" DataKeyNames="exm_id"
                                    DataSourceID="examDTS" CellPadding="4" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                                    <Columns>
                                        <asp:HyperLinkField DataNavigateUrlFields="exm_id,sub_id" DataNavigateUrlFormatString="StudentTestingPage.aspx?typeid={0}&amp;sub_id={1}&amp;type=Examination"
                                            DataTextField="exm_number" HeaderText="การทดสอบครั้งที่" SortExpression="exm_number"
                                            Target="_self" />
                                        <asp:BoundField DataField="exm_wscore" HeaderText="คะแนนเต็ม" SortExpression="exm_wscore" />
                                        <asp:BoundField DataField="exm_datestart" HeaderText="วันเริ่มต้นของการทดสอบ (ว/ด/ป)" SortExpression="exm_datestart" />
                                        <asp:BoundField DataField="exm_dateend" HeaderText="วันสุดท้ายของการทดสอบ (ว/ด/ป)" SortExpression="exm_dateend" />
                                        <asp:BoundField DataField="exm_time" HeaderText="เวลาที่ใช้ในการทดสอบ (ชั่วโมง)" SortExpression="exm_time" />
                                        <asp:BoundField DataField="sub_id" HeaderText="sub_id" SortExpression="sub_id" Visible="False" />
                                        <asp:BoundField DataField="exm_id" HeaderText="exm_id" InsertVisible="False" ReadOnly="True"
                                            SortExpression="exm_id" Visible="False" />
                                        <asp:BoundField DataField="exm_number" HeaderText="exm_number" SortExpression="exm_number"
                                            Visible="False" />
                                    </Columns>
                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#330099" />
                                    <AlternatingRowStyle BackColor="White" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td style="font-weight:bold">ผลคะแนนของการทดสอบประจำบทเรียน</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="resultmoduleDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                                    SelectCommand="select s.scr_score,m.mod_number,m.mod_wscore from scoremodule s, module m 
                                        where s.mod_id=m.mod_id 
                                        and ([std_id] = @std_id) and s.mod_id in (select mod_id from module 
                                        where mod_year = (select max(cal_year) from learningcalendar) 
                                        and mod_term = (select max(cal_term) from learningcalendar where cal_year = (select max(cal_year) from learningcalendar)) 
                                        and ([sub_id] = @sub_id))">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                            Type="Int64" />
                                        <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="ResultModuleGV" Width="400px" runat="server" DataSourceID="resultmoduleDTS" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                                    <Columns>
                                        <asp:BoundField DataField="mod_number" HeaderText="การทดสอบครั้งที่" SortExpression="mod_number" />
                                        <asp:BoundField DataField="mod_wscore" HeaderText="คะแนนเต็ม" SortExpression="mod_wscore" />
                                        <asp:BoundField DataField="scr_score" HeaderText="คะแนนที่ได้" SortExpression="scr_score" />
                                    </Columns>
                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                    <RowStyle BackColor="#EFF3FB" ForeColor="#330099" />
                                    <AlternatingRowStyle BackColor="white" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="#FFFFff" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td style="font-weight:bold">
                                ผลคะแนนของการทดสอบเก็บคะแนนและ Assignment</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="resultassignmentDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                                    SelectCommand="select s.scr_score,a.ass_number,a.ass_wscore from scoreassignment s, assignment a 
                                        where s.ass_id=a.ass_id 
                                        and ([std_id] = @std_id) and s.ass_id in (select ass_id from assignment 
                                        where ass_year = (select max(cal_year) from learningcalendar) 
                                        and ass_term = (select max(cal_term) from learningcalendar where cal_year = (select max(cal_year) from learningcalendar)) 
                                        and ([sub_id] = @sub_id))">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                            Type="Int64" />
                                        <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="ResultAssignmentGV" Width="400px" runat="server" DataSourceID="resultassignmentDTS" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                                    <Columns>
                                        <asp:BoundField DataField="ass_number" HeaderText="การทดสอบครั้งที่" SortExpression="ass_number" />
                                        <asp:BoundField DataField="ass_wscore" HeaderText="คะแนนเต็ม" SortExpression="ass_wscore" />
                                        <asp:BoundField DataField="scr_score" HeaderText="คะแนนที่ได้" SortExpression="scr_score" />
                                    </Columns>
                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                    <RowStyle BackColor="#E3EAEB" ForeColor="#330099" />
                                    <AlternatingRowStyle BackColor="white" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="#FFFFff" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td style="font-weight:bold">ผลคะแนนของการทดสอบปลายภาค</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="resultexaminationDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                                    SelectCommand="select s.scr_score,e.exm_number,e.exm_wscore from scoreexamination s, examination e 
                                        where s.exm_id=e.exm_id 
                                        and ([std_id] = @std_id) and s.exm_id in (select exm_id from examination 
                                        where exm_year = (select max(cal_year) from learningcalendar) 
                                        and exm_term = (select max(cal_term) from learningcalendar where cal_year = (select max(cal_year) from learningcalendar)) 
                                        and ([sub_id] = @sub_id))">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                            Type="Int64" />
                                        <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="ResultExaminationGV" Width="400px" runat="server" DataSourceID="resultexaminationDTS" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                                    <Columns>
                                        <asp:BoundField DataField="exm_number" HeaderText="การทดสอบครั้งที่" SortExpression="exm_number" />
                                        <asp:BoundField DataField="exm_wscore" HeaderText="คะแนนเต็ม" SortExpression="exm_wscore" />
                                        <asp:BoundField DataField="scr_score" HeaderText="คะแนนที่ได้" SortExpression="scr_score" />
                                    </Columns>
                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#330099" />
                                    <AlternatingRowStyle BackColor="white" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFff" />
                                </asp:GridView>
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
