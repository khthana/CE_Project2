<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Research.aspx.vb" Inherits="Research" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Research</title>
    <script src="js/buttonscript.js" language="javascript" type="text/javascript"></script>
    <style>
	    a:link {COLOR: #000080; TEXT-DECORATION: none}
	    a:visited {	COLOR: #000080; TEXT-DECORATION: none}
	    a:hover {COLOR: blue; TEXT-DECORATION: none}
    </style>
</head>
<body topmargin="0" bottommargin="0" background="Image/bg.jpg" style="font-family:MS Sans Serif;font-size:10pt">
    <form id="form1" runat="server">
    <div>
        <table width="800" align="center" bgcolor="white" border="0" cellpadding="0" cellspacing="0" style="border:0px;text-align:center;">
            <tr height="150" valign="top">
                <td colspan="2" width="800" height="150"><img src="Image/colorfull.jpg" border="0px" width="800" height="150" /></td>
            </tr>
            <tr height="40" bgcolor="#ffffff">
                <td colspan="2">
                    <a href = "default.aspx" onMouseOver="turnOn('home');" onMouseOut="turnOff('home');">
                        <img name="home" class="imgTrans" src="Image/Button/home1.jpg" border="0" align="middle" width="120" height="20">
                    </a>
                    <a href = "Staff.aspx" onMouseOver="turnOn('staff');" onMouseOut="turnOff('staff');">
                        <img name="staff" class="imgTrans" src="Image/Button/staff1.jpg" border="0" align="middle" width="120" height="20">
                    </a>
                    <a href = "Research.aspx" onMouseOver="turnOn('research');" onMouseOut="turnOff('research');">
                        <img name="research" class="imgTrans" src="Image/Button/research1.jpg" border="0" align="middle" width="135" height="20">
                    </a>
                    <a href = "OnlineLearning.aspx" onMouseOver="turnOn('learning');" onMouseOut="turnOff('learning');">
                        <img name="learning" class="imgTrans" src="Image/Button/learning1.jpg" border="0" align="middle" width="135" height="20">
                    </a>
                    <a href = "Webboard.aspx" onMouseOver="turnOn('webboard');" onMouseOut="turnOff('webboard');">
                        <img name="webboard" class="imgTrans" src="Image/Button/webboard1.jpg" border="0" align="middle" width="135" height="20">
                    </a>
                    <a href = "Contact.aspx" onMouseOver="turnOn('contact');" onMouseOut="turnOff('contact');">
                        <img name="contact" class="imgTrans" src="Image/Button/contact1.jpg" border="0" align="middle" width="135" height="20">
                    </a>
                </td>                
            </tr>
            <tr height="100">
                <td align="center" style="width: 200px">
                    <table align="center">
                        <tr bgcolor="#00cc00" style="font-weight:bold;color:White" valign="top" height="20">
                            <td colspan="2">:: ระบบสมาชิก ::</td>
                        </tr>
                        <tr>
                            <td width="100">ชื่อผู้ใช้</td>
                            <td width="100"><asp:TextBox ID="usernamelogin" runat="server" Width="100px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                รหัสผ่าน</td>
                            <td><asp:TextBox ID="passwordlogin" runat="server" Width="100px" TextMode="Password"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2"><asp:Button ID="signin" runat="server" Text="เข้าสู่ระบบ" ValidationGroup="loginsystem" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" Font-Overline="False" Font-Size="Small" ForeColor="White" Width="98px" />
                                <asp:Button ID="signup" runat="server" Text="สมัครสมาชิก" BackColor="#FF8000" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="98px" Font-Bold="True" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><asp:Button ID="forget" runat="server" Text="ลืมรหัสผ่าน" BackColor="#FF8000" Font-Names="Microsoft Sans Serif" Font-Size="Small" ForeColor="White" Width="200px" Font-Bold="True" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:RequiredFieldValidator ID="usernameRFV" runat="server" ControlToValidate="usernamelogin" Display="Dynamic" ValidationGroup="loginsystem" ErrorMessage="กรุณาใส่ชื่อผู้ใช้"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="usernameREV" runat="server" ControlToValidate="usernamelogin" ValidationExpression="\w{8,16}" Display="Dynamic" ValidationGroup="loginsystem" ErrorMessage="ชื่อผู้ใช้ไม่ถูกต้อง"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="passwordRFV" runat="server" ControlToValidate="passwordlogin" Display="Dynamic" ValidationGroup="loginsystem" ErrorMessage="กรุณาใส่รหัสผ่าน"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="passwordREV" runat="server" ControlToValidate="passwordlogin" ValidationExpression="\w{8,16}" Display="Dynamic" ValidationGroup="loginsystem" ErrorMessage="รหัสผ่านไม่ถูกต้อง"></asp:RegularExpressionValidator>
                                <asp:Label ID="warninglogin" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="600" rowspan="2" valign="top">
                    <table style="margin-bottom:10px;margin-left:10px;margin-right:10px">
                        <tr bgcolor="#00cc00" style="font-weight:bold;color:White" height="20">
                            <td colspan="4">:: วิทยานิพนธ์ ::</td>
                        </tr>
                        <tr height="10">
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td style="width: 80px">ค้นหาตาม</td>
                            <td>
                                <asp:DropDownList ID="typeDDL" runat="server" AutoPostBack="true">
                                    <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                                    <asp:ListItem Value="tsis_year">Year</asp:ListItem>
                                    <asp:ListItem Value="tsis_tname">Thai Title</asp:ListItem>
                                    <asp:ListItem Value="tsis_ename">English Title</asp:ListItem>
                                    <asp:ListItem Value="tsis_degree">Degree</asp:ListItem>
                                    <asp:ListItem Value="adv_name">Advisor</asp:ListItem>
                                    <asp:ListItem Value="dev_name">Developer</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td><asp:TextBox ID="keyword" runat="server"></asp:TextBox></td>
                            <td><asp:Button ID="search" runat="server" Text="ค้นหา" ValidationGroup="searchsystem" BackColor="#FF8000" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="120px" Font-Bold="True" Font-Size="Small" /></td>
                        </tr>
                        <tr height="10">
                            <td colspan="4">
                                <asp:RequiredFieldValidator ID="keywordRFV" runat="server" ControlToValidate="keyword"
                                    Display="Dynamic" ErrorMessage="กรุณาใส่คำหลัก" ValidationGroup="searchsystem"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator
                                    ID="keywordREV" runat="server" ControlToValidate="keyword" Display="Dynamic"
                                    ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="searchsystem"
                                    Width="140px"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:Label ID="Warning" runat="server" ForeColor="Red"></asp:Label>
                                <asp:SqlDataSource ID="ThesisDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                    SelectCommand="SELECT [tsis_id], [tsis_year], [tsis_degree], [tsis_tname], [tsis_ename] FROM [Thesis] WHERE [tsis_year] = (SELECT MAX(tsis_year) FROM [Thesis]) ORDER BY [tsis_id]">
                                </asp:SqlDataSource>
                                <asp:DataList ID="DataList1" runat="server" DataKeyField="tsis_id" DataSourceID="ThesisDTS" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black">
                                    <HeaderTemplate>
                                        <table bordercolor="white" width="550">
                                            <tr>
                                                <td colspan="2">โครงงานของห้องปฏิบัติการการประมวลผลภาพ</td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table>
                                            <tr align="left">
                                                <td width="200">ปีการศึกษา</td>
                                                <td width="300"><asp:Label ID="tsis_yearLabel" runat="server" Text='<%# Eval("tsis_year") %>'></asp:Label></td>
                                            </tr>
                                            <tr align="left">
                                                <td>ระดับปริญญา</td>
                                                <td><asp:Label ID="tsis_degreeLabel" runat="server" Text='<%# Eval("tsis_degree") %>'></asp:Label></td>
                                            </tr>
                                            <tr align="left">
                                                <td>ชื่อโครงงานภาษาไทย</td>
                                                <td><%#"<a href=ThesisDetail.aspx?tsis_id=" & Container.DataItem("tsis_id") & " target=_blank>" & Container.DataItem("tsis_tname") & "</a>"%></td>
                                            </tr>
                                            <tr align="left">
                                                <td>ชื่อโครงงานภาษาอังกฤษ</td>
                                                <td><%#"<a href=ThesisDetail.aspx?tsis_id=" & Container.DataItem("tsis_id") & " target=_blank>" & Container.DataItem("tsis_ename") & "</a>"%></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <FooterStyle BackColor="Tan" />
                                    <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                    <AlternatingItemStyle BackColor="PaleGoldenrod" />
                                    <HeaderStyle BackColor="#FF9933" Font-Bold="True" ForeColor="white" />
                                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr height="400">
                <td valign="top" style="width: 200px"><br />
                    <table align="center">
                        <tr bgcolor="#00cc00" style="font-weight:bold;color:White" height="20">
                            <td>:: ปฏิทิน ::</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Calendar ID="calendar" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" FirstDayOfWeek="Sunday" Font-Names="Verdana" Font-Size="8pt" ForeColor="Blue" Height="200px" ShowGridLines="True" Width="200px">
                                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                <SelectorStyle BackColor="#FFCC66" />
                                <OtherMonthDayStyle ForeColor="#CC9966" />
                                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                </asp:Calendar><br />
                            </td>
                        </tr>
                        <tr bgcolor="#00cc00" style="font-weight:bold;color:White" height="20">
                            <td>:: ลิงค์อื่นๆ ::</td>
                        </tr>
                        <tr>
                            <td><hr size="1" color="#ff9933" /></td>
                        </tr>
                        <tr>
                            <td><a href="http://www.kmitl.ac.th" target="_blank">KMITL</a></td>
                        </tr>
                        <tr>
                            <td><hr size="1" color="#ff9933" /></td>
                        </tr>
                        <tr>
                            <td><a href="http://www.ce.kmitl.ac.th" target="_blank">CE - KMITL</a></td>
                        </tr>
                        <tr>
                            <td><hr size="1" color="#ff9933" /></td>
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
