<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SignUp.aspx.vb" Inherits="SignUp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script src="js/buttonscript.js" language="javascript" type="text/javascript"></script>
    <style type="text/css">
    .plain {height:20px; vertical-align:middle;}
    </style>
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
                                <asp:Button ID="signupbtn" runat="server" Text="สมัครสมาชิก" BackColor="#FF8000" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="98px" Font-Bold="True" />
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
                            <td colspan="2">:: การสมัครสมาชิก ::</td>
                        </tr>
                        <tr height="10">
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td style="width: 200px">ชื่อ-นามสุกล</td>
                            <td style="width: 381px"><asp:TextBox ID="name" runat="server" Width="350" MaxLength="45"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="nameRFV" runat="server" ControlToValidate="name" Display="Dynamic" ErrorMessage="กรุณาใส่ชื่อ-นามสกุล"
                                    ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="nameREV" runat="server" ControlToValidate="name" Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')"
                                ValidationExpression="[^']+" ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 200px">วันเดือนปีเกิด</td>
                            <td style="width: 381px">
                                <input class="plain" name="dc2" id="txt" runat="server" onfocus="this.blur()" readonly="readonly" size="12" />
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.txt);return false;">
                                <img align="absMiddle" alt="" border="0" class="PopcalTrigger" height="22" src="DateRange/calbtn.gif" width="34" /></a>
                                <asp:RequiredFieldValidator
                                    ID="birthRFV" runat="server" ControlToValidate="txt" Display="Dynamic"
                                    ErrorMessage="กรุณาเลือกวันเดือนปีเกิด" ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                                <%--<asp:DropDownList ID="dayDDL" runat="server" Width="94px" AutoPostBack="True">
                                    <asp:ListItem Value="Select">- - - เลือก - - -</asp:ListItem>
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
                                    <asp:ListItem>21</asp:ListItem>
                                    <asp:ListItem>22</asp:ListItem>
                                    <asp:ListItem>23</asp:ListItem>
                                    <asp:ListItem>24</asp:ListItem>
                                    <asp:ListItem>25</asp:ListItem>
                                    <asp:ListItem>26</asp:ListItem>
                                    <asp:ListItem>27</asp:ListItem>
                                    <asp:ListItem>28</asp:ListItem>
                                    <asp:ListItem>29</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>31</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="monthDDL" runat="server" Width="180px" AutoPostBack="True">
                                    <asp:ListItem Value="Select">- - - เลือก - - -</asp:ListItem>
                                    <asp:ListItem Value="1">มกราคม</asp:ListItem>
                                    <asp:ListItem Value="2">กุมภาพันธ์</asp:ListItem>
                                    <asp:ListItem Value="3">มีนาคม</asp:ListItem>
                                    <asp:ListItem Value="4">เมษายน</asp:ListItem>
                                    <asp:ListItem Value="5">พฤษภาคม</asp:ListItem>
                                    <asp:ListItem Value="6">มิถุนายน</asp:ListItem>
                                    <asp:ListItem Value="7">กรกฎาคม</asp:ListItem>
                                    <asp:ListItem Value="8">สิงหาคม</asp:ListItem>
                                    <asp:ListItem Value="9">กันยายน</asp:ListItem>
                                    <asp:ListItem Value="10">ตุลาคม</asp:ListItem>
                                    <asp:ListItem Value="11">พฤศจิกายน</asp:ListItem>
                                    <asp:ListItem Value="12">ธันวาคม</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="year" runat="server" Width="70px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 200px">ที่อยู่ปัจจุบัน</td>
                            <td style="width: 381px"><asp:TextBox ID="address" runat="server" Width="350" MaxLength="195"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="addressRFV" runat="server" ControlToValidate="address" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ที่อยู่ปัจจุบัน" ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="addressREV" runat="server" ControlToValidate="address"
                                Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                                ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 200px">อาชีพ</td>
                            <td style="width: 381px"><asp:TextBox ID="job" runat="server" Width="350" MaxLength="45"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="jobRFV" runat="server" ControlToValidate="job" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่อาชีพ" ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="jobREV" runat="server" ControlToValidate="job"
                                Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                                ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 200px">หมายเลขโทรศัพท์</td>
                            <td style="width: 381px"><asp:TextBox ID="tel" runat="server" Width="350"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="telRFV" runat="server" ControlToValidate="tel" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่หมายเลขโทรศัพท์" ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="telREV" runat="server" ControlToValidate="tel"
                                Display="Dynamic" ErrorMessage="รูปแบบ 08XXXXXXXX" ValidationExpression="08\d{8}"
                                ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 200px">E - Mail</td>
                            <td style="width: 381px"><asp:TextBox ID="email" runat="server" Width="350" MaxLength="45"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="emailRFV" runat="server" ControlToValidate="email" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ E - Mail" ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="emailREV" runat="server" ControlToValidate="email"
                                Display="Dynamic" ErrorMessage="ข้อมูลไม่อยู่ในรูปแบบของ E - Mail (com|net|org|edu|mil)" ValidationExpression="^[\w-]+@[\w-]+\.(com|net|org|edu|mil)$"
                                ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 200px">คำถามเมื่อลืมรหัสผ่าน</td>
                            <td style="width: 381px">
                                <asp:DropDownList ID="questionDDL" runat="server" Width="356px" AutoPostBack="True">
                                    <asp:ListItem Value="Select">- - - เลือก - - -</asp:ListItem>
                                    <asp:ListItem Value="1">สถานที่ที่คุณชอบไป</asp:ListItem>
                                    <asp:ListItem Value="2">ชื่อสัตว์เลี้ยงตัวโปรดของคุณ</asp:ListItem>
                                    <asp:ListItem Value="3">ภาพยนตร์ที่คุณชอบ</asp:ListItem>
                                    <asp:ListItem Value="4">ชื่อแฟนคนแรกของคุณ</asp:ListItem>
                                    <asp:ListItem Value="5">อาหารที่คุณคิดว่าอร่อยที่สุด</asp:ListItem>
                                </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="questionRFV" runat="server"
                                ControlToValidate="questionDDL" Display="Dynamic" InitialValue="Select" ErrorMessage="กรุณาเลือกคำถาม"
                                ValidationGroup="signupsystem"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 200px">คำตอบ</td>
                            <td style="width: 381px"><asp:TextBox ID="answer" runat="server" Width="350" MaxLength="45"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="answerRFV" runat="server" ControlToValidate="answer" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่คำตอบ" ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="answerREV" runat="server" ControlToValidate="answer"
                                Display="Dynamic" ErrorMessage="คำตอบไม่ถูกต้อง" ValidationExpression="\w{1,45}"
                                ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 200px">ชื่อผู้ใช้</td>
                            <td style="width: 381px"><asp:TextBox ID="username" runat="server" Width="350"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="userRFV" runat="server" ControlToValidate="username" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ชื่อผู้ใช้" ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="userREV" runat="server" ControlToValidate="username"
                                Display="Dynamic" ErrorMessage="ชื่อผู้ใช้ไม่ถูกต้อง" ValidationExpression="\w{8,16}"
                                ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 200px">รหัสผ่าน</td>
                            <td style="width: 381px"><asp:TextBox ID="password" runat="server" Width="350" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="pwdRFV" runat="server" ControlToValidate="password" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่รหัสผ่าน" ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="pwdREV" runat="server" ControlToValidate="password"
                                Display="Dynamic" ErrorMessage="รหัสผ่านไม่ถูกต้อง" ValidationExpression="\w{8,16}"
                                ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 200px">ยืนยันรหัสผ่าน</td>
                            <td style="width: 381px"><asp:TextBox ID="confirm" runat="server" Width="350" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                                    ID="confirmRFV" runat="server" ControlToValidate="password" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่รหัสผ่าน" ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="confirmCV" ControlToValidate="password" ControlToCompare="confirm" 
                                Display="Dynamic" runat="server" ErrorMessage="รหัสผ่านไม่ตรงกัน" ValidationGroup="signupsystem"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="submit" runat="server" Text="สมัครสมาชิก" ValidationGroup="signupsystem" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="110px" />
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
    <iframe width=132 height=142 name="gToday:contrast:agenda.js" id="gToday:contrast:agenda.js" 
    src="DateRange/ipopeng.htm" scrolling="no" frameborder="0" 
    style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
</iframe>
</body>
</html>

