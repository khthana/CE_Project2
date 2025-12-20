<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdministratorLearningCalendar.aspx.vb" Inherits="Administrator_AdministratorLearningCalendar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Administrator Learning Calendar</title>
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
                            <td colspan="2">
                                :: ระบบสมาชิกประเภทผู้ดูแลระบบ ::</td>
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
                            <td colspan="2">แบบฟอร์มสำหรับการจัดการปฏิทินการศึกษา</td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td colspan="2">
                                <asp:HyperLink ID="OldCalendar" Target="_blank" runat="server" Font-Bold="True" ForeColor="#FF8000" NavigateUrl="~/Administrator/AdminViewOldCalendar.aspx">ดูปฏิทินการศึกษาย้อนหลัง</asp:HyperLink>
                            </td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td>
                                &nbsp;<asp:Button ID="createcalendar" runat="server" Text="กำหนดปฏิทินการศึกษา" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="170px" />
                                <asp:Button ID="updatecalendar" runat="server" Text="เปลี่ยนแปลงปฏิทินการศึกษา" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="170px" />
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label></td>
                        </tr>
                    </table>
                    <table id="tablecreate" visible="false" runat="server" width="550">
                        <tr>
                            <td style="width: 209px">ปีการศึกษา</td>
                            <td><asp:TextBox ID="year1" MaxLength="4" runat="server" Width="70px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="year1RFV" runat="server" ControlToValidate="year1"
                                    Display="Dynamic" ErrorMessage="กรุณาใส่ปีการศึกษา" ValidationGroup="cal1system"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="year1RV" runat="server" ControlToValidate="year1"
                                    Display="Dynamic" MaximumValue="2600" MinimumValue="2549" ErrorMessage="2549 - 2600" ValidationGroup="cal1system"></asp:RangeValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 209px">ภาคการศึกษา</td>
                            <td><asp:TextBox ID="term1" MaxLength="1" runat="server" Width="70px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="term1RFV" runat="server" ControlToValidate="term1"
                                    Display="Dynamic" ErrorMessage="กรุณาใส่ภาคการศึกษา" ValidationGroup="cal1system"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="term1REV" runat="server" ControlToValidate="term1" ValidationExpression="1|2|3|4|5|6|7|8|9"
                                    Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หลัก" ValidationGroup="cal1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 209px">วันเริ่มต้นของการลงทะเบียน</td>
                            <td>
                                <input class="plain" name="dc1" id="sRegister1" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fStartPop(document.form1.sRegister1,document.form1.eRegister1);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="sRegister1RFV" runat="server" ControlToValidate="sRegister1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันเริ่มต้นลงทะเบียน" ValidationGroup="cal1system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_bregister1" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_bregister1" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_bregister1" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 209px">วันสุดท้ายของการลงทะเบียน</td>
                            <td>
                                <input class="plain" name="dc2" id="eRegister1" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fEndPop(document.form1.sRegister1,document.form1.eRegister1);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="eRegister1RFV" runat="server" ControlToValidate="eRegister1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันสุดท้ายที่ลงทะเบียน" ValidationGroup="cal1system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_eregister1" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_eregister1" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_eregister1" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 209px">วันเปิดเรียนของภาคการศึกษา</td>
                            <td>
                                <input class="plain" name="dc11" id="sTerm1" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fStartPop(document.form1.sTerm1,document.form1.eTerm1);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="sTerm1RFV" runat="server" ControlToValidate="sTerm1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันเปิดเรียน" ValidationGroup="cal1system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_bterm1" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_bterm1" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_bterm1" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 209px">วันปิดเรียนของภาคการศึกษา</td>
                            <td>
                                <input class="plain" name="dc22" id="eTerm1" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fEndPop(document.form1.sTerm1,document.form1.eTerm1);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="eTerm1RFV" runat="server" ControlToValidate="eTerm1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันปิดเรียน" ValidationGroup="cal1system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_eterm1" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_eterm1" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_eterm1" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 209px">วันเริ่มต้นของการเพิ่มและเปลี่ยนแปลงรายวิชา</td>
                            <td>
                                <input class="plain" name="dc111" id="sChange1" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fStartPop(document.form1.sChange1,document.form1.eChange1);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="sChange1RFV" runat="server" ControlToValidate="sChange1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันเริ่มต้นการเพิ่ม เปลี่ยนวิชา" ValidationGroup="cal1system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_bchange1" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_bchange1" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_bchange1" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 209px">วันสุดท้ายของการเพิ่มและเปลี่ยนแปลงรายวิชา</td>
                            <td>
                                <input class="plain" name="dc222" id="eChange1" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fEndPop(document.form1.sChange1,document.form1.eChange1);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="eChange1RFV" runat="server" ControlToValidate="eChange1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันสุดท้ายการเพิ่ม เปลี่ยนวิชา" ValidationGroup="cal1system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_echange1" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_echange1" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_echange1" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 209px">วันเริ่มต้นของการถอนรายวิชา</td>
                            <td>
                                <input class="plain" name="dc1111" id="sDrop1" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fStartPop(document.form1.sDrop1,document.form1.eDrop1);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="sDrop1RFV" runat="server" ControlToValidate="sDrop1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันเริ่มต้นการถอนวิชา" ValidationGroup="cal1system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_bdrop1" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_bdrop1" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_bdrop1" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 209px">วันสุดท้ายของการถอนรายวิชา</td>
                            <td>
                                <input class="plain" name="dc2222" id="eDrop1" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fEndPop(document.form1.sDrop1,document.form1.eDrop1);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="eDrop1RFV" runat="server" ControlToValidate="eDrop1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันสุดท้ายการถอนวิชา" ValidationGroup="cal1system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_edrop1" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_edrop1" runat="server" Width="150px">                    
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
                                <asp:TextBox ID="year_edrop1" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 209px">วันเริ่มต้นของการสอบปลายภาคการศึกษา</td>
                            <td>
                                <input class="plain" name="dc11111" id="sExam1" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fStartPop(document.form1.sExam1,document.form1.eExam1);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="sExam1RFV" runat="server" ControlToValidate="sExam1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันเริ่มต้นการสอบปลาย" ValidationGroup="cal1system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_bexam1" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_bexam1" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_bexam1" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 209px">วันสุดท้ายของการสอบปลายภาคการศึกษา</td>
                            <td>
                                <input class="plain" name="dc22222" id="eExam1" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fEndPop(document.form1.sExam1,document.form1.eExam1);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="eExam1RFV" runat="server" ControlToValidate="eExam1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันสุดท้ายการสอบปลาย" ValidationGroup="cal1system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_eexam1" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_eexam1" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_eexam1" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="submit" runat="server" Text="ตกลง" ValidationGroup="cal1system" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                <asp:Button ID="clear1" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                            </td>
                        </tr>
                    </table>
                    <table id="tableupdate" visible="false" runat="server" width="550">
                        <tr>
                            <td style="width: 208px">ปีการศึกษา</td>
                            <td>
                                <asp:TextBox ID="year2" Enabled="false" runat="server" Width="70px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 208px">ภาคการศึกษา</td>
                            <td>
                                <asp:TextBox ID="term2" Enabled="false" runat="server" Width="70px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 208px">วันเริ่มต้นของการลงทะเบียน</td>
                            <td>
                                <input class="plain" name="dc3" id="sRegister2" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fStartPop(document.form1.sRegister2,document.form1.eRegister2);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="sRegister2RFV" runat="server" ControlToValidate="sRegister2"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันเริ่มต้นลงทะเบียน" ValidationGroup="cal2system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_bregister2" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_bregister2" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_bregister2" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 208px">วันสุดท้ายของการลงทะเบียน</td>
                            <td>
                                <input class="plain" name="dc4" id="eRegister2" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fEndPop(document.form1.sRegister2,document.form1.eRegister2);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="eRegister2RFV" runat="server" ControlToValidate="eRegister2"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันสุดท้ายที่ลงทะเบียน" ValidationGroup="cal2system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_eregister2" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_eregister2" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_eregister2" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 208px">วันเปิดเรียนของภาคการศึกษา</td>
                            <td>
                                <input class="plain" name="dc33" id="sTerm2" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fStartPop(document.form1.sTerm2,document.form1.eTerm2);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="sTerm2RFV" runat="server" ControlToValidate="sTerm2"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันเปิดเรียน" ValidationGroup="cal2system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_bterm2" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_bterm2" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_bterm2" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 208px">วันปิดเรียนของภาคการศึกษา</td>
                            <td>
                                <input class="plain" name="dc44" id="eTerm2" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fEndPop(document.form1.sTerm2,document.form1.eTerm2);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="eTerm2RFV" runat="server" ControlToValidate="eTerm2"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันปิดเรียน" ValidationGroup="cal2system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_eterm2" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_eterm2" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_eterm2" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 208px">วันเริ่มต้นของการเพิ่มและเปลี่ยนแปลงรายวิชา</td>
                            <td>
                                <input class="plain" name="dc333" id="sChange2" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fStartPop(document.form1.sChange2,document.form1.eChange2);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="sChange2RFV" runat="server" ControlToValidate="sChange2"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันเริ่มต้นการเพิ่ม เปลี่ยนวิชา" ValidationGroup="cal2system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_bchange2" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_bchange2" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_bchange2" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 208px">วันสุดท้ายของการเพิ่มและเปลี่ยนแปลงรายวิชา</td>
                            <td>
                                <input class="plain" name="dc444" id="eChange2" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fEndPop(document.form1.sChange2,document.form1.eChange2);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="eChange2RFV" runat="server" ControlToValidate="eChange2"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันสุดท้ายการเพิ่ม เปลี่ยนวิชา" ValidationGroup="cal2system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_echange2" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_echange2" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_echange2" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 208px">วันเริ่มต้นของการถอนรายวิชา</td>
                            <td>
                                <input class="plain" name="dc3333" id="sDrop2" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fStartPop(document.form1.sDrop2,document.form1.eDrop2);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="sDrop2RFV" runat="server" ControlToValidate="sDrop2"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันเริ่มต้นการถอนวิชา" ValidationGroup="cal2system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_bdrop2" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_bdrop2" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_bdrop2" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 208px">วันสุดท้ายของการถอนรายวิชา</td>
                            <td>
                                <input class="plain" name="dc4444" id="eDrop2" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fEndPop(document.form1.sDrop2,document.form1.eDrop2);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="eDrop2RFV" runat="server" ControlToValidate="eDrop2"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันสุดท้ายการถอนวิชา" ValidationGroup="cal2system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_edrop2" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_edrop2" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_edrop2" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 208px">วันเริ่มต้นของการสอบปลายภาคการศึกษา</td>
                            <td>
                                <input class="plain" name="dc33333" id="sExam2" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fStartPop(document.form1.sExam2,document.form1.eExam2);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="sExam2RFV" runat="server" ControlToValidate="sExam2"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันเริ่มต้นการสอบปลาย" ValidationGroup="cal2system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_bexam2" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_bexam2" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_bexam2" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td style="width: 208px">วันสุดท้ายของการสอบปลายภาคการศึกษา</td>
                            <td>
                                <input class="plain" name="dc44444" id="eExam2" runat="server" size="12" onfocus="this.blur()" readonly>
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fEndPop(document.form1.sExam2,document.form1.eExam2);return false;" >
                                <img class="PopcalTrigger" align="absmiddle" src="DateRange/calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                <asp:RequiredFieldValidator ID="eExam2RFV" runat="server" ControlToValidate="eExam2"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันสุดท้ายการสอบปลาย" ValidationGroup="cal2system"></asp:RequiredFieldValidator><%--<asp:DropDownList ID="day_eexam2" runat="server">
                                    <asp:ListItem Value="select">-เลือก-</asp:ListItem>
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
                                <asp:DropDownList ID="month_eexam2" runat="server" Width="150px">
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
                                <asp:TextBox ID="year_eexam2" runat="server" Width="50px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="update" runat="server" Text="อัพเดทข้อมูล" ValidationGroup="cal2system" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                <asp:Button ID="clear2" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                <asp:Button ID="delete" runat="server" Text="ลบข้อมูล" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" /></td>
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
