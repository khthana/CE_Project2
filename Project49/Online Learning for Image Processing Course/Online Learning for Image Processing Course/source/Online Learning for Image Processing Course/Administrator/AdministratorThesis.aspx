<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdministratorThesis.aspx.vb" Inherits="Administrator_AdministratorThesis" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Administrator Thesis</title>
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
                            <td colspan="2">แบบฟอร์มสำหรับการจัดการวิทยานิพนธ์</td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td>
                                <asp:Button ID="createthesis" runat="server" Text="กำหนดวิทยานิพนธ์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="110px" />
                                <asp:Button ID="updatethesis" runat="server" Text="แก้ไขวิทยานิพนธ์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="110px" />
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label></td>
                        </tr>
                    </table>
                    <table id="tablecreate" visible="false" runat="server" width="550">
                        <tr>
                            <td style="width: 117px">ระดับปริญญา</td>
                            <td colspan="3" width="400"><asp:DropDownList ID="degree1" runat="server" AutoPostBack="True" Width="306px">
                                    <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                                    <asp:ListItem Value="bachelor">ปริญญาตรี</asp:ListItem>
                                    <asp:ListItem Value="master">ปริญญาโท</asp:ListItem>
                                    <asp:ListItem Value="doctor">ปริญญาเอก</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="degree1RFV" runat="server" ControlToValidate="degree1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกระดับปริญญา" InitialValue="select" ValidationGroup="thesis1system"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 117px">ปีการศึกษา</td>
                            <td colspan="3"><asp:TextBox ID="year1" runat="server" Width="70px" MaxLength="4"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="year1RFV" runat="server" ControlToValidate="year1" Display="Dynamic" ErrorMessage="กรุณาใส่ปีการศึกษา"
                                    ValidationGroup="thesis1system"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="year1RV"
                                runat="server" ControlToValidate="year1" Display="Dynamic" ErrorMessage="2549 - 2600"
                                MaximumValue="2600" MinimumValue="2549" ValidationGroup="thesis1system"></asp:RangeValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 117px">ชื่อโครงงานภาษาไทย</td>
                            <td colspan="3"><asp:TextBox ID="tname1" runat="server" Width="300px" MaxLength="195"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="tname1RFV" runat="server" ControlToValidate="tname1" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ชื่อโครงงานภาษาไทย" ValidationGroup="thesis1system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="tname1REV" runat="server" ControlToValidate="tname1" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="thesis1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 117px">ชื่อโครงงานภาษาอังกฤษ</td>
                            <td colspan="3"><asp:TextBox ID="ename1" runat="server" Width="300px" MaxLength="195"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="ename1RFV" runat="server" ControlToValidate="ename1" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ชื่อโครงงานภาษาอังกฤษ" ValidationGroup="thesis1system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="ename1REV" runat="server" ControlToValidate="ename1" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="thesis1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 117px">บทคัดย่อภาษาไทย</td>
                            <td colspan="3"><asp:TextBox ID="tabstract1" TextMode="MultiLine" runat="server" Height="100px" Width="300px" MaxLength="1990"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="tabstract1RFV" runat="server" ControlToValidate="tabstract1" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่บทคัดย่อภาษาไทย" ValidationGroup="thesis1system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="tabstract1REV" runat="server" ControlToValidate="tabstract1" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="thesis1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 117px">บทคัดย่อภาษาอังกฤษ</td>
                            <td colspan="3"><asp:TextBox ID="eabstract1" TextMode="MultiLine" runat="server" Height="100px" Width="300px" MaxLength="1990"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="eabstract1RFV" runat="server" ControlToValidate="eabstract1" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่บทคัดย่อภาษาอังกฤษ" ValidationGroup="thesis1system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="eabstract1REV" runat="server" ControlToValidate="eabstract1" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="thesis1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 117px">ชื่ออาจารย์ที่ปรึกษา 1</td>
                            <td colspan="3"><asp:TextBox ID="advisor11" runat="server" Width="300px" MaxLength="45"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="advisor11RFV" runat="server" ControlToValidate="advisor11" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ชื่ออาจารย์ที่ปรึกษา 1" ValidationGroup="thesis1system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="advisor11REV" runat="server" ControlToValidate="advisor11" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="thesis1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 117px">ชื่ออาจารย์ที่ปรึกษา 2</td>
                            <td colspan="3"><asp:TextBox ID="advisor12" runat="server" Width="300px" MaxLength="45"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="advisor12REV" runat="server" ControlToValidate="advisor12" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="thesis1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 117px">ชื่อนักษาศึกษา 1</td>
                            <td style="width: 200px"><asp:TextBox ID="student11" runat="server" Width="200px" MaxLength="45"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="student11RFV" runat="server" ControlToValidate="student11" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ชื่อนักษาศึกษา 1" ValidationGroup="thesis1system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="student11REV" runat="server" ControlToValidate="student11" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="thesis1system"></asp:RegularExpressionValidator></td>
                            <td style="width: 85px">รหัสนักศึกษา</td>
                            <td><asp:TextBox ID="id11" runat="server" Width="85px"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="id11RFV" runat="server" ControlToValidate="id11" Display="Dynamic" ErrorMessage="กรุณาใส่รหัสนักศึกษา"
                                    ValidationGroup="thesis1system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="id11REV" runat="server" ControlToValidate="id11" Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 8 หลัก"
                                ValidationExpression="\d{8}" ValidationGroup="thesis1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 117px">ชื่อนักษาศึกษา 2</td>
                            <td style="width: 200px"><asp:TextBox ID="student12" runat="server" Width="200px" MaxLength="45"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="student12REV" runat="server" ControlToValidate="student12" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="thesis1system"></asp:RegularExpressionValidator></td>
                            <td style="width: 85px">รหัสนักศึกษา</td>
                            <td><asp:TextBox ID="id12" runat="server" Width="85px"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="id12REV" runat="server" ControlToValidate="id12" Display="Dynamic"
                                ErrorMessage="กรุณาใส่ตัวเลข 8 หลัก" ValidationExpression="\d{8}"
                                ValidationGroup="thesis1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 117px">ชื่อนักษาศึกษา 3</td>
                            <td style="width: 200px"><asp:TextBox ID="student13" runat="server" Width="200px" MaxLength="45"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="student13REV" runat="server" ControlToValidate="student13" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="thesis1system"></asp:RegularExpressionValidator></td>
                            <td style="width: 85px">รหัสนักศึกษา</td>
                            <td><asp:TextBox ID="id13" runat="server" Width="85px"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="id13REV" runat="server" ControlToValidate="id13" Display="Dynamic"
                                ErrorMessage="กรุณาใส่ตัวเลข 8 หลัก" ValidationExpression="\d{8}"
                                ValidationGroup="thesis1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 117px">ไฟล์รายงาน</td>
                            <td colspan="3"><asp:FileUpload ID="report1" runat="server" Width="306px" /></td>
                        </tr>
                        <tr>
                            <td style="width: 117px">ไฟล์ Source Code</td>
                            <td colspan="3"><asp:FileUpload ID="code1" runat="server" Width="306px" /></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:Button ID="submit" runat="server" Text="ตกลง" ValidationGroup="thesis1system" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                <asp:Button ID="clear1" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                            </td>
                        </tr>
                    </table>
                    <table id="tableupdate" visible="false" runat="server" width="550">
                        <tr>
                            <td width="200">ระดับปริญญา</td>
                            <td width="350"><asp:DropDownList ID="degreeDDL" runat="server" AutoPostBack="True" Width="300px">
                                    <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                                    <asp:ListItem Value="bachelor">ปริญญาตรี</asp:ListItem>
                                    <asp:ListItem Value="master">ปริญญาโท</asp:ListItem>
                                    <asp:ListItem Value="doctor">ปริญญาเอก</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="degreeDDLRFV" runat="server" ControlToValidate="degreeDDL"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกระดับปริญญา" InitialValue="select" ValidationGroup="thesis2system"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>เลือกปีการศึกษา</td>
                            <td><asp:DropDownList ID="yearDDL" runat="server" AutoPostBack="True" Width="300px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>เลือกตามชื่อโครงงานเป็นภาษาอังกฤษ</td>
                            <td><asp:DropDownList ID="eprojectDDL" runat="server" AutoPostBack="True" Width="300px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="ok" runat="server" Text="ตกลง" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" /></td>
                        </tr>
                   </table>
                    <table id="tableshow" visible="false" runat="server" width="550">
                        <tr>
                            <td style="width: 113px">ชื่อโครงงานภาษาไทย</td>
                            <td colspan="3"><asp:TextBox ID="tname2" runat="server" Width="300px" MaxLength="45"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="tname2RFV" runat="server" ControlToValidate="tname2" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ชื่อโครงงานภาษาไทย" ValidationGroup="thesis2system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="tname2REV" runat="server" ControlToValidate="tname2" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="thesis2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 113px">ชื่อโครงงานภาษาอังกฤษ</td>
                            <td colspan="3"><asp:TextBox ID="ename2" runat="server" Width="300px" MaxLength="45"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="ename2RFV" runat="server" ControlToValidate="ename2" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ชื่อโครงงานภาษาอังกฤษ" ValidationGroup="thesis2system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="ename2REV" runat="server" ControlToValidate="ename2"
                                Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                                ValidationGroup="thesis2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 113px">บทคัดย่อภาษาไทย</td>
                            <td colspan="3"><asp:TextBox ID="tabstract2" TextMode="MultiLine" runat="server" Height="100px" Width="300px" MaxLength="1990"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="tabstract2RFV" runat="server" ControlToValidate="tabstract2" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่บทคัดย่อภาษาไทย" ValidationGroup="thesis2system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="tabstract2REV" runat="server" ControlToValidate="tabstract2"
                                Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                                ValidationGroup="thesis2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 113px">บทคัดย่อภาษาอังกฤษ</td>
                            <td colspan="3"><asp:TextBox ID="eabstract2" TextMode="MultiLine" runat="server" Height="100px" Width="300px" MaxLength="1990"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="eabstract2RFV" runat="server" ControlToValidate="eabstract2" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่บทคัดย่อภาษาอังกฤษ" ValidationGroup="thesis2system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="eabstract2REV" runat="server" ControlToValidate="eabstract2"
                                Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                                ValidationGroup="thesis2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 113px">ชื่ออาจารย์ที่ปรึกษา 1</td>
                            <td colspan="3"><asp:TextBox ID="advisor21" runat="server" Width="300px" MaxLength="45"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="advisor21RFV" runat="server" ControlToValidate="advisor21" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ชื่ออาจารย์ที่ปรึกษา 1" ValidationGroup="thesis2system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="advisor21REV" runat="server" ControlToValidate="advisor21"
                                Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                                ValidationGroup="thesis2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 113px">ชื่ออาจารย์ที่ปรึกษา 2</td>
                            <td colspan="3"><asp:TextBox ID="advisor22" runat="server" Width="300px" MaxLength="45"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="advisor22REV" runat="server" ControlToValidate="advisor22"
                                Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                                ValidationGroup="thesis2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>ชื่อนักษาศึกษา 1</td>
                            <td><asp:TextBox ID="student21" runat="server" Width="200px" MaxLength="45"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="student21RFV" runat="server" ControlToValidate="student21" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ชื่อนักษาศึกษา 1" ValidationGroup="thesis2system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="student21REV" runat="server" ControlToValidate="student21"
                                Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                                ValidationGroup="thesis2system"></asp:RegularExpressionValidator></td>
                            <td style="width: 83px">รหัสนักศึกษา</td>
                            <td style="width: 118px"><asp:TextBox ID="id21" runat="server" Width="85px"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="id21RFV" runat="server" ControlToValidate="id21" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่รหัสนักศึกษา" ValidationGroup="thesis2system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="id21REV" runat="server" ControlToValidate="id21" Display="Dynamic"
                                ErrorMessage="กรุณาใส่ตัวเลข 8 หลัก" ValidationExpression="\d{8}"
                                ValidationGroup="thesis2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>ชื่อนักษาศึกษา 2</td>
                            <td><asp:TextBox ID="student22" runat="server" Width="200px" MaxLength="45"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="student22REV" runat="server" ControlToValidate="student22"
                                Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                                ValidationGroup="thesis2system"></asp:RegularExpressionValidator></td>
                            <td>รหัสนักศึกษา</td>
                            <td><asp:TextBox ID="id22" runat="server" Width="85px"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="id22REV" runat="server" ControlToValidate="id22" Display="Dynamic"
                                ErrorMessage="กรุณาใส่ตัวเลข 8 หลัก" ValidationExpression="\d{8}"
                                ValidationGroup="thesis2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>ชื่อนักษาศึกษา 3</td>
                            <td><asp:TextBox ID="student23" runat="server" Width="200px" MaxLength="45"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="student23REV" runat="server" ControlToValidate="student23"
                                Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                                ValidationGroup="thesis2system"></asp:RegularExpressionValidator></td>
                            <td style="width: 83px">รหัสนักศึกษา</td>
                            <td style="width: 118px"><asp:TextBox ID="id23" runat="server" Width="85px"></asp:TextBox>
                            <asp:RegularExpressionValidator
                                ID="id23REV" runat="server" ControlToValidate="id23" Display="Dynamic"
                                ErrorMessage="กรุณาใส่ตัวเลข 8 หลัก" ValidationExpression="\d{8}"
                                ValidationGroup="thesis2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 113px">ไฟล์รายงาน</td>
                            <td colspan="3"><asp:TextBox ID="report2" Enabled="false" runat="server" Width="300px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 113px">ไฟล์ Source Code</td>
                            <td colspan="3"><asp:TextBox ID="code2" Enabled="false" runat="server" Width="300px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:Button ID="update" runat="server" Text="อัพเดทข้อมูล" ValidationGroup="thesis2system" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
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
