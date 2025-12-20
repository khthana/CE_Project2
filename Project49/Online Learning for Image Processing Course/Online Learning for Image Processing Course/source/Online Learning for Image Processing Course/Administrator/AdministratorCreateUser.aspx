<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdministratorCreateUser.aspx.vb" Inherits="Administrator_AdministratorCreateUser" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Administrator Create User</title>
    <script src="../js/adminbtn.js" language="javascript" type="text/javascript"></script>
    <style type="text/css">
    .plain {height:20px; vertical-align:middle;}
    </style>
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
                            <td colspan="2" style="font-weight:bold">
                                การสร้างข้อมูลส่วนบุคคลสำหรับสมาชิกประเภทผู้สอนและสมาชิกห้อง Image Processing</td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td width="200">
                                เลือกประเภทสมาชิก</td>
                            <td width="350">
                                <asp:DropDownList ID="usertypeDDL" runat="server" AutoPostBack="True" Width="355px">
                                    <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                                    <asp:ListItem Value="Teacher">ผู้สอน</asp:ListItem>
                                    <asp:ListItem Value="Staff">สมาชิกห้อง Image Processing</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="usertypeRFV" runat="server" ControlToValidate="usertypeDDL"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกประเภทสมาชิก" InitialValue="select" ValidationGroup="signupsystem"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>
                                เลือกรูปภาพ</td>
                            <td><asp:FileUpload ID="newpicture" runat="server" Width="356px" /></td>
                        </tr>
                        <tr>
                            <td>ชื่อ-นามสุกล</td>
                            <td><asp:TextBox ID="name" runat="server" Width="350" MaxLength="45"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="nameRFV" runat="server" ControlToValidate="name" Display="Dynamic" ErrorMessage="กรุณาใส่ชื่อ-นามสกุล"
                                    ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="nameREV" runat="server" ControlToValidate="name" Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')"
                                ValidationExpression="[^']+" ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>วันเดือนปีเกิด</td>
                            <td>
                                <input class="plain" name="dc2" id="txt" runat="server" onfocus="this.blur()" readonly="readonly" size="12" />
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.txt);return false;">
                                <img align="absMiddle" alt="" border="0" class="PopcalTrigger" height="22" src="DateRange/calbtn.gif" width="34" /></a>
                                <asp:RequiredFieldValidator ID="birthRFV" runat="server" ControlToValidate="txt"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันเดือนปีเกิด" ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                                    <%--<asp:DropDownList ID="dayDDL" runat="server" Width="93px" AutoPostBack="True">
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
                                <asp:DropDownList ID="monthDDL" runat="server" Width="181px" AutoPostBack="True">
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
                            <td>ที่อยู่ปัจจุบัน</td>
                            <td><asp:TextBox ID="address" runat="server" Width="350" TextMode="MultiLine" Height="50px" MaxLength="195"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="addressRFV" runat="server" ControlToValidate="address" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ที่อยู่ปัจจุบัน" ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="addressREV" runat="server" ControlToValidate="address" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>หมายเลขโทรศัพท์</td>
                            <td><asp:TextBox ID="tel" runat="server" Width="350"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="telRFV" runat="server" ControlToValidate="tel" Display="Dynamic" ErrorMessage="กรุณาใส่หมายเลขโทรศัพท์"
                                    ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="telREV" runat="server" ControlToValidate="tel" Display="Dynamic" ErrorMessage="รูปแบบ 08XXXXXXXX"
                                ValidationExpression="08\d{8}" ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>E - Mail</td>
                            <td><asp:TextBox ID="email" runat="server" Width="350" MaxLength="45"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="emailRFV" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="กรุณาใส่ E - Mail"
                                    ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="emailREV" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="ข้อมูลไม่อยู่ในรูปแบบของ E - Mail (com|net|org|edu|mil)"
                                ValidationExpression="^[\w-]+@[\w-]+\.(com|net|org|edu|mil)$" ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>คุณวุฒิ</td>
                            <td><asp:TextBox ID="qualification" runat="server" Width="350" Height="50px" TextMode="MultiLine" MaxLength="195"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="qualificationREV" runat="server" ControlToValidate="qualification"
                                    Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                                    ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>ผลงานทางวิชาการ</td>
                            <td><asp:TextBox ID="performance" runat="server" Width="350" Height="50px" TextMode="MultiLine" MaxLength="195"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="performanceREV" runat="server" ControlToValidate="performance"
                                    Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                                    ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>ความสนใจ</td>
                            <td><asp:TextBox ID="attention" runat="server" Width="350" Height="50px" TextMode="MultiLine" MaxLength="195"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="attentionREV" runat="server" ControlToValidate="attention"
                                    Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                                    ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>คำถามเมื่อลืมรหัสผ่าน</td>
                            <td>
                                <asp:DropDownList ID="questionDDL" runat="server" Width="356px" AutoPostBack="True">
                                    <asp:ListItem Value="Select">- - - เลือก - - -</asp:ListItem>
                                    <asp:ListItem Value="1">สถานที่ที่คุณชอบไป</asp:ListItem>
                                    <asp:ListItem Value="2">ชื่อสัตว์เลี้ยงตัวโปรดของคุณ</asp:ListItem>
                                    <asp:ListItem Value="3">ภาพยนตร์ที่คุณชอบ</asp:ListItem>
                                    <asp:ListItem Value="4">ชื่อแฟนคนแรกของคุณ</asp:ListItem>
                                    <asp:ListItem Value="5">อาหารที่คุณคิดว่าอร่อยที่สุด</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="questionRFV" runat="server" ControlToValidate="questionDDL"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกคำถาม" InitialValue="Select" ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>คำตอบ</td>
                            <td><asp:TextBox ID="answer" runat="server" Width="350"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="answerRFV" runat="server" ControlToValidate="answer" Display="Dynamic" ErrorMessage="กรุณาใส่คำตอบ"
                                    ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="answerREV" runat="server" ControlToValidate="answer" Display="Dynamic" ErrorMessage="คำตอบไม่ถูกต้อง"
                                ValidationExpression="\w{1,45}" ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>ชื่อผู้ใช้</td>
                            <td><asp:TextBox ID="username" runat="server" Width="350"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="userRFV" runat="server" ControlToValidate="username" Display="Dynamic" ErrorMessage="กรุณาใส่ชื่อผู้ใช้"
                                    ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="userREV" runat="server" ControlToValidate="username" Display="Dynamic" ErrorMessage="ชื่อผู้ใช้ไม่ถูกต้อง"
                                ValidationExpression="\w{8,16}" ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>รหัสผ่าน</td>
                            <td><asp:TextBox ID="password" runat="server" Width="350"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="pwdRFV" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="กรุณาใส่รหัสผ่าน"
                                    ValidationGroup="signupsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="pwdREV" runat="server" ControlToValidate="password" Display="Dynamic" ErrorMessage="รหัสผ่านไม่ถูกต้อง"
                                ValidationExpression="\w{8,16}" ValidationGroup="signupsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td colspan="2"><asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="submit" runat="server" Text="ตกลง" ValidationGroup="signupsystem" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                <asp:Button ID="clear" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
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
    <iframe width=132 height=142 name="gToday:contrast:agenda.js" id="gToday:contrast:agenda.js" 
    src="DateRange/ipopeng.htm" scrolling="no" frameborder="0" 
    style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
</iframe>
</body>
</html>
