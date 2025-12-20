<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TeacherLessonOld.aspx.vb" Inherits="Teacher_TeacherLessonOld" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Teacher Lesson</title>
    <style>
	    a:link {COLOR: #000080; TEXT-DECORATION: none}
	    a:visited {	COLOR: #000080; TEXT-DECORATION: none}
	    a:hover {COLOR: blue; TEXT-DECORATION: none}
    </style>
</head>
<body topmargin="0" bottommargin="0" background="../Image/snowflake5.jpg">
    <form id="form1" runat="server">
    <div>
        <table width="800" height="800" align="center" bgcolor="white" style="border:0px;text-align:center;">
            <tr height="150">
                <td colspan="2" width="800" height="150"><img src="../Image/colorfull.jpg" width="800" height="150" /></td>
            </tr>
            <tr height="580">
                <td valign="top" width="200">
                    <table>
                        <tr>
                            <td>Profile</td>
                        </tr>
                        <tr>
                            <td>
                                News</td>
                        </tr>
                        <tr>
                            <td>
                                Learning File</td>
                        </tr>
                        <tr>
                            <td>
                                Subject</td>
                        </tr>
                        <tr>
                            <td>
                                Lesson</td>
                        </tr>
                        <tr>
                            <td>
                                Assessment</td>
                        </tr>
                        <tr>
                            <td>
                                Testing</td>
                        </tr>
                        <tr>
                            <td>
                                Student Tracking</td>
                        </tr>
                        <tr>
                            <td>
                                Signout</td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                        <tr>
                            <td><br />
                                <asp:Calendar ID="calendar" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66"
                                     BorderWidth="1px" DayNameFormat="Shortest" FirstDayOfWeek="Sunday" Font-Names="Verdana" 
                                     Font-Size="8pt" ForeColor="Blue" ShowGridLines="True" Height="100px" Width="200px">
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
                        <tr height="30">
                            <td colspan="2">ระบบสมาชิกประเภทผู้สอน</td>
                        </tr>
                        <tr>
                            <td colspan="2"><hr /></td>
                        </tr>
                        <tr height="30">
                            <td colspan="2">แบบฟอร์มสำหรับการจัดการบทเรียน</td>
                        </tr>
                        <tr height="30">
                            <td colspan="2">วิชา <asp:DropDownList ID="subjectDDL" runat="server" AutoPostBack="True" Width="180px" DataSourceID="subjectDTS" DataTextField="sub_name" DataValueField="sub_id"></asp:DropDownList>
                            
                                <asp:SqlDataSource ID="subjectDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                    SelectCommand="SELECT [sub_id], [sub_name] FROM [Subject] WHERE (([tch_id] = @tch_id) AND ([sub_status] = @sub_status)) ORDER BY [sub_id]">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="tch_id" SessionField="user" Type="Int64" />
                                        <asp:Parameter DefaultValue="true" Name="sub_status" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="lessonDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                    SelectCommand="SELECT [les_id], [les_number] FROM [Lesson] WHERE ([sub_id] = @sub_id) ORDER BY [les_number]">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                           </td>
                        </tr>
                        <tr>
                            <td colspan="2"><asp:Label ID="warning" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <table align="center" width="550">
                                    <tr height="30" align="center">
                                        <%--<td width="183"><asp:LinkButton ID="createlesson" runat="server">กำหนดบทเรียน</asp:LinkButton></td>
                                        <td width="183"><asp:LinkButton ID="updatelesson" runat="server">แก้ไขบทเรียน</asp:LinkButton></td>
                                        <td width="183"><asp:LinkButton ID="deletelesson" runat="server">ลบบทเรียน</asp:LinkButton></td>--%>
                                        <td width="183"><asp:Button ID="createlesson" runat="server" Text="กำหนดบทเรียน" /></td>
                                        <td width="183"><asp:Button ID="updatelesson" runat="server" Text="แก้ไขบทเรียน" /></td>
                                        <td width="183"><asp:Button ID="deletelesson" runat="server" Text="ลบบทเรียน" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="2">
                                <table id="table1" width="550">
                                    <tr align="center">
                                        <td width="150">เลือกจำนวนบท</td>
                                        <td width="400"><asp:DropDownList ID="lessonDDL1" runat="server" Width="100px" AutoPostBack="True">
                                            <asp:ListItem Value="select">[เลือก]</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>6</asp:ListItem>
                                            <asp:ListItem>7</asp:ListItem>
                                            <asp:ListItem>8</asp:ListItem>
                                            <asp:ListItem>9</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                            <asp:ListItem>13</asp:ListItem>
                                            <asp:ListItem>14</asp:ListItem>
                                            <asp:ListItem>15</asp:ListItem>
                                            <asp:ListItem>16</asp:ListItem>
                                            <asp:ListItem>17</asp:ListItem>
                                            <asp:ListItem>18</asp:ListItem>
                                            <asp:ListItem>19</asp:ListItem>
                                            <asp:ListItem>20</asp:ListItem>
                                        </asp:DropDownList></td>
                                    </tr>
                                    <tr align="left">
                                        <td colspan="2"><asp:PlaceHolder ID="lessonholder" runat="server"></asp:PlaceHolder></td>
                                    </tr>
                                    <tr align="center">
                                        <td colspan="2">
                                            <asp:Button ID="submit" runat="server" Text="SUBMIT" BackColor="#FFC080" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                            <asp:Button ID="clear1" runat="server" Text="CLEAR" BackColor="#FFC080" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                        </td>
                                    </tr>
                                </table>
                                <table id="table2" visible="false" runat="server"  width="550">
                                    <tr align="center">
                                        <td width="150">เลือกบทเรียน</td>
                                        <td width="400">
                                            <asp:DropDownList ID="lessonDDL2" runat="server" Width="100px" AutoPostBack="True" DataSourceID="lessonDTS" DataTextField="les_number" DataValueField="les_id"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px">ชื่อบทเรียน</td>
                                        <td><asp:TextBox ID="topic" Width="400" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px">รายละเอียด</td>
                                        <td><asp:TextBox ID="description" Height="100" Width="400" TextMode="MultiLine" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="update" runat="server" Text="UPDATE" BackColor="#FFC080" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                            <asp:Button ID="clear2" runat="server" Text="CLEAR" BackColor="#FFC080" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                        </td>
                                    </tr>
                                </table>
                                <table id="table3" visible="false" runat="server" width="550">
                                    <tr>
                                        <td>เลือกบทเรียน</td>
                                        <td><asp:DropDownList ID="lessonDDL3" runat="server" Width="100px" AutoPostBack="True" DataSourceID="lessonDTS" DataTextField="les_number" DataValueField="les_id"></asp:DropDownList></td>
                                        <td><asp:Button ID="delete" runat="server" Text="DELETE" BackColor="#FFC080" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr height="70">
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
