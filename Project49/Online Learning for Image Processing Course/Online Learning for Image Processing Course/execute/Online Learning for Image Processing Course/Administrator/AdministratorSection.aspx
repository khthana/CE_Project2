<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdministratorSection.aspx.vb" Inherits="Administrator_AdministratorSection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Administrator Section</title>
<script src="../js/adminbtn.js" language="javascript" type="text/javascript"></script>
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
                    <table style="margin-top:10px;" cellpadding="0" cellspacing="0" border="0" bgcolor="#D90F0F">
                        <tr>
                            <td>
                                <a href = "AdministratorProfile.aspx" onMouseOver="turnOn('profile');" onMouseOut="turnOff('profile');">
                                    <img name="profile" class="imgTrans" src="../Image/Button/admin/aprofile1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "AdministratorPostNews.aspx" onMouseOver="turnOn('news');" onMouseOut="turnOff('news');">
                                    <img name="news" class="imgTrans" src="../Image/Button/admin/anews1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "AdministratorLearningCalendar.aspx" onMouseOver="turnOn('calendar');" onMouseOut="turnOff('calendar');">
                                    <img name="calendar" class="imgTrans" src="../Image/Button/admin/acalendar1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "AdministratorThesis.aspx" onMouseOver="turnOn('thesis');" onMouseOut="turnOff('thesis');">
                                    <img name="thesis" class="imgTrans" src="../Image/Button/admin/athesis1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "AdministratorCreateUser.aspx" onMouseOver="turnOn('user');" onMouseOut="turnOff('user');">
                                    <img name="user" class="imgTrans" src="../Image/Button/admin/auser1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "AdministratorSubject.aspx" onMouseOver="turnOn('subject');" onMouseOut="turnOff('subject');">
                                    <img name="subject" class="imgTrans" src="../Image/Button/admin/asubject1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "AdministratorSection.aspx" onMouseOver="turnOn('section');" onMouseOut="turnOff('section');">
                                    <img name="section" class="imgTrans" src="../Image/Button/admin/asec1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "AdministratorTeacherAssessment.aspx" onMouseOver="turnOn('assess');" onMouseOut="turnOff('assess');">
                                    <img name="assess" class="imgTrans" src="../Image/Button/admin/aassess1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "AdministratorBoard.aspx" onMouseOver="turnOn('board');" onMouseOut="turnOff('board');">
                                    <img name="board" class="imgTrans" src="../Image/Button/admin/aboard1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "AdministratorSignOut.aspx" onMouseOver="turnOn('out');" onMouseOut="turnOff('out');">
                                    <img name="out" class="imgTrans" src="../Image/Button/admin/aout1.jpg" border="0" align="middle" width="200" height="20">
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
                            <td colspan="2">:: ระบบสมาชิกประเภทผู้ดูแลระบบ ::</td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr style="font-weight:bold">
                            <td colspan="2">
                                <asp:SqlDataSource ID="userDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                                    SelectCommand="SELECT [adm_name] FROM [Administrator] WHERE ([adm_id] = @adm_id)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="adm_id" SessionField="user" Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DataList ID="DataList2" runat="server" DataSourceID="userDTS">
                                    <ItemTemplate>
                                        คุณ 
                                        <asp:Label ID="adm_nameLabel" runat="server" Text='<%# Eval("adm_name") %>'></asp:Label><br />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                        <tr height="30" style="font-weight:bold;">
                            <td colspan="2">แบบฟอร์มสำหรับการจัดการกลุ่มการเรียนในแต่ละวิชา</td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td style="font-weight:bold">เลือกวิชา 
                                <asp:DropDownList ID="subjectDDL" runat="server" AutoPostBack="True" DataSourceID="subjectDTS" DataTextField="sub_name" DataValueField="sub_id">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td>
                                <asp:Button ID="createsection" runat="server" Text="กำหนดกลุ่มการเรียน" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                                <asp:Button ID="updatesection" runat="server" Text="เปลี่ยนแปลงกลุ่มการเรียน" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label>
                                <asp:SqlDataSource ID="subjectDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                    SelectCommand="SELECT [sub_id], [sub_name] FROM [Subject] ORDER BY [sub_id]"></asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                    <table id="tablecreate" visible="false" runat="server" width="550">
                        <tr>
                            <td colspan="2">
                                <asp:DataList ID="DataList1" runat="server" DataKeyField="sec_id" CellPadding="4" ForeColor="#333333">
                                    <HeaderTemplate>
                                        <table width="500">
                                            <tr>
                                                <td width="100">กลุ่ม</td>
                                                <td width="200">วันที่เรียน</td>
                                                <td width="200">เวลาที่เรียน</td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td width="100"><asp:Label ID="sec_numberLabel" runat="server" Text='<%# Eval("sec_number") %>'></asp:Label></td>
                                                <td width="200"><asp:Label ID="sec_dlearnLabel" runat="server" Text='<%# Eval("sec_dlearn") %>'></asp:Label></td>
                                                <td width="200"><asp:Label ID="sec_tlearnLabel" runat="server" Text='<%# Eval("sec_tlearn") %>'></asp:Label></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <SelectedItemStyle BackColor="#E2DED6" ForeColor="#333333" Font-Bold="True" />
                                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                </asp:DataList></td>
                        </tr>
                        <tr>
                            <td width="200">วันที่เรียน</td>
                            <td width="350">
                                <asp:DropDownList ID="day1" runat="server" Width="120px">
                                    <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                                    <asp:ListItem Value="1">อาทิตย์</asp:ListItem>
                                    <asp:ListItem Value="2">จันทร์</asp:ListItem>
                                    <asp:ListItem Value="3">อังคาร</asp:ListItem>
                                    <asp:ListItem Value="4">พุธ</asp:ListItem>
                                    <asp:ListItem Value="5">พฤหัสบดี</asp:ListItem>
                                    <asp:ListItem Value="6">ศุกร์</asp:ListItem>
                                    <asp:ListItem Value="7">เสาร์</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="day1RFV" runat="server" ControlToValidate="day1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันที่เรียน" InitialValue="select" ValidationGroup="section1system"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>เวลาที่เรียน</td>
                            <td>
                                <asp:DropDownList ID="time1" runat="server" Width="120px">
                                    <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                                    <asp:ListItem>9.00-12.00</asp:ListItem>
                                    <asp:ListItem>13.00-16.00</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="time1RFV" runat="server" ControlToValidate="time1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกเวลาที่เรียน" InitialValue="select" ValidationGroup="section1system"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="submit" runat="server" Text="ตกลง" ValidationGroup="section1system" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                <asp:Button ID="clear1" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                            </td>
                        </tr>
                    </table>
                    <table id="tableupdate" visible="false" runat="server" width="550">
                        <tr>
                            <td width="200">เลือกกลุ่ม</td>
                            <td width="350">
                                <asp:DropDownList ID="sec" runat="server" AutoPostBack="True" Width="120px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>วันที่เรียน</td>
                            <td>
                                <asp:DropDownList ID="day2" runat="server" Width="120px">
                                    <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                                    <asp:ListItem Value="1">อาทิตย์</asp:ListItem>
                                    <asp:ListItem Value="2">จันทร์</asp:ListItem>
                                    <asp:ListItem Value="3">อังคาร</asp:ListItem>
                                    <asp:ListItem Value="4">พุธ</asp:ListItem>
                                    <asp:ListItem Value="5">พฤหัสบดี</asp:ListItem>
                                    <asp:ListItem Value="6">ศุกร์</asp:ListItem>
                                    <asp:ListItem Value="7">เสาร์</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="day2RFV" runat="server" ControlToValidate="day2"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันที่เรียน" InitialValue="select" ValidationGroup="section2system"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>เวลาที่เรียน</td>
                            <td>
                                <asp:DropDownList ID="time2" runat="server" Width="120px">
                                    <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                                    <asp:ListItem>9.00-12.00</asp:ListItem>
                                    <asp:ListItem>13.00-16.00</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="time2RFV" runat="server" ControlToValidate="time2"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกเวลาที่เรียน" InitialValue="select" ValidationGroup="section2system"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="update" runat="server" Text="อัพเดทข้อมูล" ValidationGroup="section2system" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                <asp:Button ID="clear2" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                <asp:Button ID="delete" runat="server" Text="ลบข้อมูล" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
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
