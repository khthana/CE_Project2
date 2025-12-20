<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StudentTeacherAssessment.aspx.vb" Inherits="Student_StudentTeacherAssessment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Student Teacher Assessment</title>
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
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr style="font-weight:bold">
                            <td colspan="2">
                                <asp:SqlDataSource ID="userDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                                    SelectCommand="SELECT [std_name] FROM [Student] WHERE ([std_id] = @std_id)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DataList ID="DataList1" runat="server" DataSourceID="userDTS">
                                    <ItemTemplate>
                                        คุณ 
                                        <asp:Label ID="std_nameLabel" runat="server" Text='<%# Eval("std_name") %>'></asp:Label><br />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                        <tr><td style="font-weight:bold">
                            การประเมินผู้สอน</td></tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="subjectDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                    SelectCommand="select sub_id, sub_name, tch_id from subject where sub_id in (select sub_id 
                                        from result where reg_id = (SELECT reg_id FROM [register] 
                                        WHERE reg_year = (SELECT MAX(reg_year) FROM [register]) 
                                        and reg_term = (select max(reg_term) from register 
                                        where reg_year = (select max(reg_year) from register)) 
                                        and ([std_id] = @std_id))) order by sub_id">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CC9966"
                                    BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False" DataKeyNames="sub_id" DataSourceID="subjectDTS">
                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                    <RowStyle BackColor="White" ForeColor="#330099" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                    <Columns>
                                        <asp:BoundField DataField="sub_id" HeaderText="รหัสวิชา" InsertVisible="False" ReadOnly="True"
                                            SortExpression="sub_id" />
                                        <asp:BoundField DataField="sub_name" HeaderText="วิชา" SortExpression="sub_name" />
                                        <asp:HyperLinkField DataNavigateUrlFields="sub_id,tch_id" DataNavigateUrlFormatString="StudentTeacherAssessmentPage.aspx?sub_id={0}&amp;tch_id={1}"
                                            HeaderText="การประเมิน" SortExpression="sub_id" Target="_self" Text="ประเมิน" />
                                        <asp:BoundField DataField="tch_id" HeaderText="tch_id" SortExpression="tch_id" Visible="False" />
                                    </Columns>
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
