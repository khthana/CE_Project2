<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StudentRegister.aspx.vb" Inherits="Student_StudentRegister" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Student Register</title>
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
                            <td colspan="2">:: ระบบสมาชิกประเภทผู้เรียน ::</td>
                        </tr>
                        <tr height="10"><td></td></tr>
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
                            <td colspan="2">การจัดการการลงทะเบียน</td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td>
                                <asp:Button ID="register" runat="server" Text="ลงทะเบียน" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                <asp:Button ID="updateregister" runat="server" Text="แก้ไขรายวิชา" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                <asp:Button ID="deleteregister" runat="server" BackColor="#FF8000" Font-Bold="True"
                                    Font-Names="Microsoft Sans Serif" ForeColor="White" Text="ถอนรายวิชา" Width="90px" /></td>
                        </tr>
                        <tr height="10"><td></td></tr>
                        <tr>
                            <td style="font-weight:bold">เลือกวิชาเพื่อดูสถานะการลงทะเบียน &nbsp;&nbsp;
                                <asp:DropDownList ID="subjectDDL" runat="server" AutoPostBack="true" DataSourceID="subjectDTS" DataTextField="sub_name" DataValueField="sub_id">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="subjectDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                    SelectCommand="SELECT [sub_id], [sub_name] FROM [Subject] WHERE ([sub_status] = @sub_status) ORDER BY [sub_id]">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="true" Name="sub_status" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr height="10"><td></td></tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="detailDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" SelectCommand="SELECT [sub_id], [sub_name], [sub_quantity] FROM [Subject] WHERE ([sub_id] = @sub_id) ORDER BY [sub_id]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="studentDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                    SelectCommand="select count(reg_id) from Result where ([sub_id] = @sub_id) 
                                        and reg_id in (select reg_id from Register 
                                        where reg_year = (select max(cal_year) from LearningCalendar)
                                        and reg_term = (select max(cal_term) from LearningCalendar 
                                        where cal_year = (select max(cal_year) from Learningcalendar)))">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DataList ID="DataList1" runat="server" DataKeyField="sub_id" DataSourceID="detailDTS">
                                    <ItemTemplate>
                                        <table width="550" border="1" bordercolor="#cccccc" >
                                            <tr height="30" bgcolor="#990000" style="font-weight:bold;color:White">
                                                <td width="70">รหัส</td>
                                                <td width="200">วิชา</td>
                                                <td width="100">จำนวนที่รับ</td>
                                                <td width="150">จำนวนผู้ที่ลงทะเบียนวิชานี้</td>
                                            </tr>
                                            <tr height="30">
                                                <td><asp:Label ID="sub_idLabel" runat="server" Text='<%# Eval("sub_id") %>'></asp:Label></td>
                                                <td><asp:Label ID="sub_nameLabel" runat="server" Text='<%# Eval("sub_name") %>'></asp:Label></td>
                                                <td><asp:Label ID="sub_quantityLabel" runat="server" Text='<%# Eval("sub_quantity") %>'></asp:Label></td>
                                                <td>
                                                    <asp:DataList ID="DataList3" runat="server" DataSourceID="studentDTS">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Column1Label" runat="server" Text='<%# Eval("Column1") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
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
