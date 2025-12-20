<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdministratorTeacherAssessment.aspx.vb" Inherits="Administrator_AdministratorTeacherAssessment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Teacher Assessment</title>
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
                            <td>:: ระบบสมาชิกประเภทผู้ดูแลระบบ ::</td>
                        </tr>
                        <tr height="10"><td></td></tr>
                        <tr style="font-weight:bold">
                            <td>
                                <asp:SqlDataSource ID="userDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                                    SelectCommand="SELECT [adm_name] FROM [Administrator] WHERE ([adm_id] = @adm_id)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="adm_id" SessionField="user" Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DataList ID="DataList1" runat="server" DataSourceID="userDTS">
                                    <ItemTemplate>
                                        คุณ 
                                        <asp:Label ID="adm_nameLabel" runat="server" Text='<%# Eval("adm_name") %>'></asp:Label><br />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight:bold">การสร้างและแก้ไขแบบประเมินผู้สอน</td>
                        </tr>
                        <tr height="10"><td></td></tr>
                        <tr>
                            <td>
                                <asp:Button ID="create" runat="server" Text="สร้างแบบประเมินผู้สอน" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="150px" />
                                <asp:Button ID="update" runat="server" Text="แก้ไขและลบแบบการประเมินผู้สอน" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="200px" />
                                <asp:Button ID="add" runat="server" Text="เพิ่มแบบการประเมินผู้สอน" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="160px" />
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <table id="createform" visible="false" runat="server" width="550">
                                    <tr>
                                        <td>เลือกจำนวนหัวข้อ
                                            <asp:DropDownList ID="createnumber" runat="server" AutoPostBack="True">
                                                <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
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
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="createnumberRFV" runat="server" ControlToValidate="createnumber"
                                                Display="Dynamic" ErrorMessage="กรุณาเลือกจำนวนหัวข้อ" InitialValue="select" ValidationGroup="assess1system"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:PlaceHolder ID="createholder" runat="server"></asp:PlaceHolder>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="createdata" runat="server" Text="ตกลง" ValidationGroup="assess1system" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                                            <asp:Button ID="createclear" runat="server" Text="เคลียร์" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table id="updateform" visible="false" runat="server" width="550">
                                    <tr>
                                        <td>
                                            <asp:PlaceHolder ID="updateholder" runat="server"></asp:PlaceHolder>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="updatedata" runat="server" Text="อัพเดท" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                                            <asp:Button ID="updateclear" runat="server" Text="เคลียร์" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table id="addform" visible="false" runat="server" width="550">
                                    <tr>
                                        <td>เลือกจำนวนหัวข้อที่ต้องการเพิ่ม
                                            <asp:DropDownList ID="addnumber" runat="server" AutoPostBack="True">
                                                <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
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
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="addnumberRFV" runat="server" ControlToValidate="addnumber"
                                                Display="Dynamic" ErrorMessage="กรุณาเลือกจำนวนหัวข้อที่ต้องการเพิ่ม" InitialValue="select" ValidationGroup="assess2system"></asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:PlaceHolder ID="addholder" runat="server"></asp:PlaceHolder>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="adddata" runat="server" Text="เพิ่ม" ValidationGroup="assess2system" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                                            <asp:Button ID="addclear" runat="server" Text="เคลียร์" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                                        </td>
                                    </tr>
                                </table>
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

