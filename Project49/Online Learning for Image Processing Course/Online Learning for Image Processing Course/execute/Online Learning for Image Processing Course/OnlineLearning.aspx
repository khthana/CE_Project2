<%@ Page Language="VB" AutoEventWireup="false" CodeFile="OnlineLearning.aspx.vb" Inherits="OnlineLearning" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Online Learning</title>
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
                    <table style="margin-bottom:10px;margin-left:10px;margin-right:10px" width="550">
                        <tr bgcolor="#00cc00" style="font-weight:bold;color:White" height="20">
                            <td colspan="3">:: การเรียนการสอนแบบออนไลน์ ::</td>
                        </tr>
                        <tr>
                            <td style="text-align:justify" colspan="3"><br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ยินดีต้อนรับผู้เยี่ยมชมเว็บไชต์เข้าสู่การเรียนการสอนแบบออนไลน์
                            ซึ่งเราจะใช้อินเตอร์เน็ตเป็นตัวกลางในการเรียนรู้ คุณสามารถสมัครสมาชิกเพื่อเข้าสู่ระบบการเรียนการสอน พร้อมทั้งเลือกวิชา วันและเวลาที่จะเรียนได้ การเรียนนี้จะเป็นการถ่ายทอดสด
                             ผู้รับชมสามารถถามคำถามกับอาจารย์ผู้สอนได้ในขณะที่เรียน การเรียนการสอนของเราก็จะมีส่วนของการทดสอบต่างๆ เพื่อให้ผู้เรียนได้วัดผลการเรียนของตน
                             นอกจากนี้เราได้เพิ่มส่วนของการทดลอง (Simulation) เพื่อให้ผู้เรียนได้เรียนรู้เพื่อทำความเข้าใจได้ดียิ่งขึ้น ซึ่งตอนนี้ส่วนของการทดลองนั้นได้เปิดเฉพาะวิชาการประมวลผลภาพ
                             ทั้งหมดนี้เป็นรายละเอียดคร่าวๆของเว็บไชต์เรา คุณสามารถดูปฏิทินการศึกษา ตารางเรียน และรายละเอียดวิชาได้ที่ด้านล่างนี้</td>
                        </tr>
                        <tr height="10">
                            <td colspan="3"></td>
                        </tr>
                        <tr height="30">
                            <td width="200"></td>
                            <td width="150" align="left"><a href="LearningCalendar.aspx"target="_blank">
                                <img src="Image/calendar_icon.jpg" align="middle" width="15" height="15" border="0" />
                                &nbsp;ปฏิทินการศึกษา</a></td>
                            <td width="200"></td>
                        </tr>
                        <tr height="30">
                            <td></td>
                            <td align="left"><a href="LearningSchedule.aspx"target="_blank">
                                <img src="Image/schedule_icon.jpg" align="middle" width="15" height="15" border="0" />
                                &nbsp;ตารางเรียน</a></td>
                            <td></td>
                        </tr>
                        <tr height="30">
                            <td></td>
                            <td align="left"><a href="SubjectDetail.aspx" target="_blank">
                                <img src="Image/subject_icon.jpg" align="middle" width="15" height="15" border="0" />
                                &nbsp;รายละเอียดวิชา</a></td>
                            <td></td>
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
