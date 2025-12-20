<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdministratorSubject.aspx.vb" Inherits="Administrator_AdministratorSubject" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Administrator Subject</title>
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
                        <tr height="30" style="font-weight:bold;">
                            <td colspan="2">แบบฟอร์มสำหรับการจัดการรายละเอียดเกี่ยวกับรายวิชาต่างๆ</td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td>
                                <asp:Button ID="createsubject" runat="server" Text="การกำหนดรายละเอียดวิชา" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="180px" />
                                <asp:Button ID="updatesubject" runat="server" Text="การเปลี่ยนแปลงรายละเอียดวิชา" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="180px" />
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label>
                                <asp:SqlDataSource ID="teacherDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                    SelectCommand="SELECT [tch_id], [tch_name] FROM [Teacher] ORDER BY [tch_id]"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="subjectDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                    SelectCommand="SELECT [sub_id], [sub_name] FROM [Subject] ORDER BY [sub_id]"></asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                    <table id="tablecreate" visible="false" runat="server" width="550">
                        <tr>
                            <td style="width: 228px">ชื่อวิชา</td>
                            <td width="350"><asp:TextBox ID="name1" runat="server" Width="300px"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="name1RFV" runat="server" ControlToValidate="name1" Display="Dynamic" ErrorMessage="กรุณาใส่ชื่อวิชา"
                                    ValidationGroup="subject1system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="name1REV" runat="server" ControlToValidate="name1" Display="Dynamic" ErrorMessage="ชื่อวิชาไม่ถูกต้อง"
                                ValidationExpression="\w{1,45}" ValidationGroup="subject1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 228px">รายละเอียด</td>
                            <td><asp:TextBox ID="detail1" TextMode="MultiLine" runat="server" Width="300px" Height="100px" MaxLength="990"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="detail1RFV" runat="server" ControlToValidate="detail1" Display="Dynamic" ErrorMessage="กรุณาใส่รายละเอียด"
                                    ValidationGroup="subject1system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="detail1REV" runat="server" ControlToValidate="detail1" Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')"
                                ValidationExpression="[^']+" ValidationGroup="subject1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 228px">หนังสือประกอบการเรียน</td>
                            <td><asp:TextBox ID="reference1" TextMode="MultiLine" runat="server" Width="300px" Height="50px" MaxLength="490"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="reference1RFV" runat="server" ControlToValidate="reference1" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ชื่อหนังสือประกอบการเรียน" ValidationGroup="subject1system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="reference1REV" runat="server" ControlToValidate="reference1" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="subject1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 228px">ผู้สอน</td>
                            <td><asp:DropDownList ID="teacherDDL1" runat="server" AutoPostBack="True" DataSourceID="teacherDTS" DataTextField="tch_name" DataValueField="tch_id" Width="305px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 228px">วันเดือนปีที่สอบ</td>
                            <td>
                                <input class="plain" name="dc2" id="txt1" runat="server" onfocus="this.blur()" readonly="readonly" size="12" />
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.txt1);return false;">
                                <img align="absMiddle" alt="" border="0" class="PopcalTrigger" height="22" src="DateRange/calbtn.gif" width="34" /></a>
                                <asp:RequiredFieldValidator ID="txt1RFV" runat="server" ControlToValidate="txt1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันเดือนปีที่สอบ" ValidationGroup="subject1system"></asp:RequiredFieldValidator>
                                    <%--<asp:DropDownList ID="dayexam1" runat="server" Width="98px">
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
                                <asp:DropDownList ID="monthexam1" runat="server" Width="145px">
                                    <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
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
                                <asp:TextBox ID="yearexam1" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 228px">เวลาที่สอบ</td>
                            <td>
                                <asp:DropDownList ID="timeexam1" runat="server" Width="305px">
                                    <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                                    <asp:ListItem>9.00-12.00</asp:ListItem>
                                    <asp:ListItem>13.00-16.00</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="timeexam1RFV" runat="server" ControlToValidate="timeexam1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกเวลาที่สอบ" InitialValue="select" ValidationGroup="subject1system"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 228px">จำนวนผู้เรียน</td>
                            <td><asp:TextBox ID="quantity1" runat="server" Width="300px"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="quantity1RFV" runat="server" ControlToValidate="quantity1" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่จำนวนผู้เรียน" ValidationGroup="subject1system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="quantity1REV" runat="server" ControlToValidate="quantity1" Display="Dynamic"
                                ErrorMessage="จำนวนผู้เรียนไม่ถูกต้อง" ValidationExpression="\d{1,4}" ValidationGroup="subject1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 228px">ตัวอย่างการทดลอง</td>
                            <td>
                                <asp:TextBox ID="sim1" runat="server" Width="300px" MaxLength="195"></asp:TextBox>
                                <asp:RegularExpressionValidator
                                    ID="sim1REV" runat="server" ControlToValidate="sim1" Display="Dynamic"
                                    ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="subject1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 228px">URL ที่ใช้ในการถ่ายทอดสด</td>
                            <td><asp:TextBox ID="url1" runat="server" Width="300px" MaxLength="195"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="url1REV" runat="server" ControlToValidate="url1" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="subject1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 228px">เปิด/ปิด</td>
                            <td><asp:CheckBox ID="status1" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="submit" runat="server" Text="ตกลง" ValidationGroup="subject1system" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                <asp:Button ID="clear1" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                            </td>
                        </tr>
                    </table>
                    <table id="tableupdate" visible="false" runat="server" width="550">
                        <tr>
                            <td style="width: 226px">ชื่อวิชา</td>
                            <td width="350"><asp:DropDownList ID="name2" runat="server" AutoPostBack="True" Width="305px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 226px">รายละเอียด</td>
                            <td><asp:TextBox ID="detail2" TextMode="MultiLine" runat="server" Height="100px" Width="300px" MaxLength="990"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="detail2RFV" runat="server" ControlToValidate="detail2" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่รายละเอียด" ValidationGroup="subject2system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="detail2REV" runat="server" ControlToValidate="detail2" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="subject2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 226px">หนังสือประกอบการเรียน</td>
                            <td><asp:TextBox ID="reference2" TextMode="MultiLine" runat="server" Height="50px" Width="300px" MaxLength="490"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="reference2RFV" runat="server" ControlToValidate="reference2" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ชื่อ-นามสกุล" ValidationGroup="subject2system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="reference2REV" runat="server" ControlToValidate="reference2" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="subject2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 226px">ผู้สอน</td>
                            <td><asp:TextBox ID="teacher2" runat="server" Width="300px" MaxLength="45"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="teacher2RFV" runat="server" ControlToValidate="teacher2" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ชื่อ-นามสกุลผู้สอน" ValidationGroup="subject2system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="teacher2REV" runat="server" ControlToValidate="teacher2" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="subject2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 226px">วันเดือนปีที่สอบ</td>
                            <td>
                                <input class="plain" name="dc2" id="txt2" runat="server" onfocus="this.blur()" readonly="readonly" size="12" />
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.txt2);return false;">
                                <img align="absMiddle" alt="" border="0" class="PopcalTrigger" height="22" src="DateRange/calbtn.gif" width="34" /></a>
                                <asp:RequiredFieldValidator ID="txt2RFV" runat="server" ControlToValidate="txt2"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันเดือนปีที่สอบ" ValidationGroup="subject2system"></asp:RequiredFieldValidator>
                                    <%--<asp:DropDownList ID="dayexam2" runat="server" Width="100px">
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
                                <asp:DropDownList ID="monthexam2" runat="server" Width="144px">
                                    <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
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
                                <asp:TextBox ID="yearexam2" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 226px">เวลาที่สอบ</td>
                            <td>
                                <asp:DropDownList ID="timeexam2" runat="server" Width="305px">
                                    <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                                    <asp:ListItem>9.00-12.00</asp:ListItem>
                                    <asp:ListItem>13.00-16.00</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="timeexam2RFV" runat="server" ControlToValidate="timeexam2"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกเวลาที่สอบ" InitialValue="select" ValidationGroup="subject2system"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 226px">จำนวนผู้เรียน</td>
                            <td><asp:TextBox ID="quantity2" runat="server" Width="300px"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="quantity2RFV" runat="server" ControlToValidate="quantity2" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่จำนวนผู้เรียน" ValidationGroup="subject2system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="quantity2REV" runat="server" ControlToValidate="quantity2" Display="Dynamic"
                                ErrorMessage="จำนวนผู้เรียนไม่ถูกต้อง" ValidationExpression="\d{1,4}" ValidationGroup="subject2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 226px">ตัวอย่างการทดลอง</td>
                            <td>
                                <asp:TextBox ID="sim2" runat="server" Width="300px" MaxLength="45"></asp:TextBox>
                                <asp:RegularExpressionValidator
                                    ID="sim2REV" runat="server" ControlToValidate="sim2" Display="Dynamic"
                                    ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="subject2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 226px">URL ที่ใช้ในการถ่ายทอดสด</td>
                            <td><asp:TextBox ID="url2" runat="server" Width="300px" MaxLength="45"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="url2REV" runat="server" ControlToValidate="url2" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="subject2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 226px">เปิด/ปิด</td>
                            <td><asp:CheckBox ID="status2" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="update" runat="server" Text="อัพเดทข้อมูล" ValidationGroup="subject2system" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                <asp:Button ID="clear2" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
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
</body>
</html>
