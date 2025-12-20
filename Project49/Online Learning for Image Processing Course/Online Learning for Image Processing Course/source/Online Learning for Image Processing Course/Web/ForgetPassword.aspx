<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ForgetPassword.aspx.vb" Inherits="ForgetPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Forget Password</title>
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
        <table width="800" height="800" align="center" bgcolor="white" border="0" cellpadding="0" cellspacing="0" style="border:0px;text-align:center;">
            <tr height="150">
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
                        <tr bgcolor="#00cc00" style="font-weight:bold;color:White" height="20">
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
                            <td colspan="2">:: การค้นคืนรหัสผ่าน ::</td>
                        </tr>
                        <tr height="10">
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td style="width: 120px">ชื่อผู้ใช้</td>
                            <td style="width: 170px"><asp:TextBox ID="username" runat="server" Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="userRFV" runat="server" ControlToValidate="username" Display="Dynamic" ErrorMessage="กรุณาใส่ชื่อผู้ใช้"
                                    ValidationGroup="retrievesystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="userREV" runat="server" ControlToValidate="username"
                                Display="Dynamic" ErrorMessage="ชื่อผู้ใช้ไม่ถูกต้อง" ValidationExpression="\w{8,16}"
                                ValidationGroup="retrievesystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 120px">คำถามเมื่อลืมรหัสผ่าน</td>
                            <td style="width: 170px">
                                <asp:DropDownList ID="questionDDL" runat="server" Width="156px" AutoPostBack="True">
                                    <asp:ListItem Value="Select">[เลือก]</asp:ListItem>
                                    <asp:ListItem Value="1">สถานที่ที่คุณชอบไป</asp:ListItem>
                                    <asp:ListItem Value="2">ชื่อสัตว์เลี้ยงตัวโปรดของคุณ</asp:ListItem>
                                    <asp:ListItem Value="3">ภาพยนตร์ที่คุณชอบ</asp:ListItem>
                                    <asp:ListItem Value="4">ชื่อแฟนคนแรกของคุณ</asp:ListItem>
                                    <asp:ListItem Value="5">อาหารที่คุณคิดว่าอร่อยที่สุด</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="questionRFV" runat="server" ControlToValidate="questionDDL"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกคำถาม" InitialValue="Select" ValidationGroup="retrievesystem"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 120px">คำตอบ</td>
                            <td style="width: 170px"><asp:TextBox ID="answer" runat="server" Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="answerRFV" runat="server" ControlToValidate="answer" Display="Dynamic" ErrorMessage="กรุณาใส่คำตอบ"
                                    ValidationGroup="retrievesystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="answerREV" runat="server" ControlToValidate="answer"
                                Display="Dynamic" ErrorMessage="คำตอบไม่ถูกต้อง" ValidationExpression="\w{1,45}"
                                ValidationGroup="retrievesystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td colspan="2"><asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="submit" runat="server" Text="ค้นคืนรหัสผ่าน" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="110px" ValidationGroup="retrievesystem" />
                                <asp:Button ID="clear" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="110px" />
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