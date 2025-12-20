<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TeacherAssessment.aspx.vb" Inherits="Teacher_TeacherAssessment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Teacher Assessment</title>
    <script src="../js/teacherbtn.js" language="javascript" type="text/javascript"></script>
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
                    <table style="margin-top:10px;" cellpadding="0" cellspacing="0" border="0" bgcolor="#1A2DC7">
                        <tr>
                            <td>
                                <a href = "TeacherProfile.aspx" onMouseOver="turnOn('profile');" onMouseOut="turnOff('profile');">
                                    <img name="profile" class="imgTrans" src="../Image/Button/teacher/tprofile1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherPostNews.aspx" onMouseOver="turnOn('news');" onMouseOut="turnOff('news');">
                                    <img name="news" class="imgTrans" src="../Image/Button/teacher/tnews1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherGradeLevel.aspx" onMouseOver="turnOn('gradelevel');" onMouseOut="turnOff('gradelevel');">
                                    <img name="gradelevel" class="imgTrans" src="../Image/Button/teacher/tgrade1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherResult.aspx" onMouseOver="turnOn('studentresult');" onMouseOut="turnOff('studentresult');">
                                    <img name="studentresult" class="imgTrans" src="../Image/Button/teacher/tsudentresult1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherLearningFile.aspx" onMouseOver="turnOn('file');" onMouseOut="turnOff('file');">
                                    <img name="file" class="imgTrans" src="../Image/Button/teacher/tfile1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherSubject.aspx" onMouseOver="turnOn('subject');" onMouseOut="turnOff('subject');">
                                    <img name="subject" class="imgTrans" src="../Image/Button/teacher/tsubject1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherLesson.aspx" onMouseOver="turnOn('lesson');" onMouseOut="turnOff('lesson');">
                                    <img name="lesson" class="imgTrans" src="../Image/Button/teacher/tlesson1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherAssessment.aspx" onMouseOver="turnOn('assessment');" onMouseOut="turnOff('assessment');">
                                    <img name="assessment" class="imgTrans" src="../Image/Button/teacher/tassessment1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherTesting.aspx" onMouseOver="turnOn('testing');" onMouseOut="turnOff('testing');">
                                    <img name="testing" class="imgTrans" src="../Image/Button/teacher/ttesting1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherCheckAssignment.aspx" onMouseOver="turnOn('checkass');" onMouseOut="turnOff('checkass');">
                                    <img name="checkass" class="imgTrans" src="../Image/Button/teacher/tcheckass1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherTeachingLive.aspx" onMouseOver="turnOn('live');" onMouseOut="turnOff('live');">
                                    <img name="live" class="imgTrans" src="../Image/Button/teacher/tlive1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherTracking.aspx" onMouseOver="turnOn('track');" onMouseOut="turnOff('track');">
                                    <img name="track" class="imgTrans" src="../Image/Button/teacher/ttrack1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherAssessmentResult.aspx" onMouseOver="turnOn('assessresult');" onMouseOut="turnOff('assessresult');">
                                    <img name="assessresult" class="imgTrans" src="../Image/Button/teacher/tassessresult1.jpg" border="0" align="middle" width="200" height="20">
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href = "TeacherSignOut.aspx" onMouseOver="turnOn('out');" onMouseOut="turnOff('out');">
                                    <img name="out" class="imgTrans" src="../Image/Button/teacher/tout1.jpg" border="0" align="middle" width="200" height="20">
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
                            <td>
                                :: ระบบสมาชิกประเภทผู้สอน ::</td>
                        </tr>
                        <tr height="10"><td></td></tr>
                        <tr style="font-weight:bold">
                            <td colspan="2">
                                <asp:SqlDataSource ID="userDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                                    SelectCommand="SELECT [tch_name] FROM [Teacher] WHERE ([tch_id] = @tch_id)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="tch_id" SessionField="user" Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DataList ID="DataList1" runat="server" DataSourceID="userDTS">
                                    <ItemTemplate>
                                        คุณ 
                                        <asp:Label ID="tch_nameLabel" runat="server" Text='<%# Eval("tch_name") %>'></asp:Label><br />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight:bold">แบบฟอร์มสำหรับการจัดการการประเมินผลการทดสอบ</td>
                        </tr>
                        <tr height="10"><td></td></tr>
                        <tr>
                            <td style="font-weight:bold">
                                เลือกวิชา
                                <asp:DropDownList ID="subjectDDL" runat="server" AutoPostBack="True" DataSourceID="subjectDTS" DataTextField="sub_name" DataValueField="sub_id" Width="150px"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label>
                                <asp:SqlDataSource ID="subjectDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                    SelectCommand="SELECT [sub_id], [sub_name] FROM [Subject] WHERE (([tch_id] = @tch_id) AND ([sub_status] = @sub_status)) ORDER BY [sub_id]">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="tch_id" SessionField="user" Type="Int64" />
                                        <asp:Parameter DefaultValue="true" Name="sub_status" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="createassessment" runat="server" Text="กำหนดคะแนนของการทดสอบ" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="190px" />
                                <asp:Button ID="updateassessment" runat="server" Text="แก้ไขวันเวลาของการทดสอบ" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="190px" />
                            </td>
                        </tr>
                    </table>
                    <table id="table1" visible="false" runat="server" width="550">
                        <tr>
                            <td width="200">ปีการศึกษา</td>
                            <td colspan="2" width="350"><asp:TextBox ID="year" runat="server" Width="70px" MaxLength="4"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="yearRFV" runat="server" ControlToValidate="year" Display="Dynamic" ErrorMessage="กรุณาใส่ปีการศึกษา"
                                    ValidationGroup="assess1system"></asp:RequiredFieldValidator>
                            <asp:RangeValidator
                                ID="yearRV" runat="server" ControlToValidate="year" Display="Dynamic" ErrorMessage="2549 - 2600"
                                MaximumValue="2600" MinimumValue="2549" ValidationGroup="assess1system"></asp:RangeValidator></td>
                        </tr>
                        <tr>
                            <td>ภาคการศึกษา</td>
                            <td colspan="2"><asp:TextBox ID="term" runat="server" Width="70px" MaxLength="1"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="termRFV" runat="server" ControlToValidate="term" Display="Dynamic" ErrorMessage="กรุณาใส่ภาคการศึกษา"
                                    ValidationGroup="assess1system"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator
                                        ID="termREV" runat="server" ControlToValidate="term" Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หลัก"
                                        ValidationExpression="1|2|3|4|5|6|7|8|9" ValidationGroup="assess1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>
                                คะแนนรวมของการทดสอบประจำบทเรียน</td>
                            <td colspan="2"><asp:TextBox ID="moduletotal" runat="server" Width="70px"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="moduletotalRFV" runat="server" ControlToValidate="moduletotal" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่คะแนนรวมประจำบทเรียน" ValidationGroup="assess1system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="moduletotalREV" runat="server" ControlToValidate="moduletotal" Display="Dynamic"
                                ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หรือ 3 หลัก" ValidationExpression="\d{1,3}"
                                ValidationGroup="assess1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>
                                คะแนนรวมของการทดสอบเก็บคะแนน</td>
                            <td colspan="2"><asp:TextBox ID="assignmenttotal" runat="server" Width="70px"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="assignmenttotalRFV" runat="server" ControlToValidate="assignmenttotal" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่คะแนนรวมเก็บคะแนน" ValidationGroup="assess1system"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator
                                        ID="assignmenttotalREV" runat="server" ControlToValidate="assignmenttotal" Display="Dynamic"
                                        ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หรือ 3 หลัก" ValidationExpression="\d{1,3}"
                                        ValidationGroup="assess1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>
                                คะแนนรวมของการสอบปลายภาคการศึกษา</td>
                            <td colspan="2"><asp:TextBox ID="examtotal" runat="server" Width="70px"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="examtotalRFV" runat="server" ControlToValidate="examtotal" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่คะแนนรวมสอบปลายภาค" ValidationGroup="assess1system"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator
                                        ID="examtotalREV" runat="server" ControlToValidate="examtotal" Display="Dynamic"
                                        ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หรือ 3 หลัก" ValidationExpression="\d{1,3}"
                                        ValidationGroup="assess1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>เลือกจำนวนการทดสอบประจำบทเรียน</td>
                            <td colspan="2"><asp:DropDownList ID="numberofmoduleDDL" runat="server" AutoPostBack="True" Width="100px">
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
                                <asp:RequiredFieldValidator ID="numberofmoduleDDLRFV" runat="server" ControlToValidate="numberofmoduleDDL"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกจำนวนการทดสอบประจำบทเรียน" InitialValue="select"
                                    ValidationGroup="assess1system"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr height="10"><td colspan="3"></td></tr>
                        <tr>
                            <td colspan="3" align="left"><asp:PlaceHolder ID="moduleholder" runat="server"></asp:PlaceHolder></td>
                        </tr>
                        <tr height="10"><td colspan="3"></td></tr>
                        <tr>
                            <td>เลือกจำนวนการทดสอบเก็บคะแนน</td>
                            <td colspan="2"><asp:DropDownList ID="numberofassignmentDDL" runat="server" AutoPostBack="True" Width="100px">
                                <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                            </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="numberofassignmentDDLRFV" runat="server" ControlToValidate="numberofassignmentDDL"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกจำนวนการทดสอบเก็บคะแนน" InitialValue="select"
                                    ValidationGroup="assess1system"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr height="10"><td colspan="3"></td></tr>
                        <tr>
                            <td colspan="3" align="left"><asp:PlaceHolder ID="assignmentholder" runat="server"></asp:PlaceHolder></td>
                        </tr>
                        <tr height="10"><td colspan="3"></td></tr>
                        <tr>
                            <td colspan="3">กำหนดการสอบปลายภาค</td>
                        </tr>
                        <tr>
                            <td>วันเริ่มการสอบ</td>
                            <td>วันสิ้นสุดการสอบ</td>
                            <td>เวลาการสอบ</td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="datestart" runat="server" Enabled="false" Width="110px"></asp:TextBox></td>
                            <td><asp:TextBox ID="dateend" runat="server" Enabled="false" Width="110px"></asp:TextBox></td>
                            <td><asp:TextBox ID="timetotesting" runat="server" Enabled="false" Width="110px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Button ID="inserttesting" runat="server" Text="ตกลง" ValidationGroup="assess1system" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                                <asp:Button ID="cleartable1" runat="server" Text="เคลียร์" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                            </td>
                        </tr>
                    </table>
                    <table id="table2" visible="false" runat="server" width="550">
                        <tr>
                            <td style="width: 120px">ประเภทของการทดสอบ</td>
                            <td colspan="3" width="415"><asp:DropDownList ID="typetestingDDL" runat="server" AutoPostBack="True" Width="200px">
                                <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                                <asp:ListItem Value="Module">การทดสอบประจำบทเรียน</asp:ListItem>
                                <asp:ListItem Value="Assignment">การทดสอบเก็บคะแนน</asp:ListItem>
                            </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="typetestingDDLRFV" runat="server" ControlToValidate="typetestingDDL"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกประเภทของการทดสอบ" InitialValue="select"
                                    ValidationGroup="assess2system"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 120px">การทดสอบที่</td>
                            <td colspan="3"><asp:DropDownList ID="numberoftestingDDL" runat="server" AutoPostBack="True" Width="200px"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td colspan="4">การแก้ไขวันและเวลาการทดสอบ ปีการศึกษา<asp:Label ID="updateyear" runat="server"></asp:Label>
                                ภาคการศึกษา
                                <asp:Label ID="updateterm" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 120px">คะแนน</td>
                            <td>วันเริ่มการสอบ</td>
                            <td>วันสิ้นสุดการสอบ</td>
                            <td>ระยะเวลาของการสอบ</td>
                        </tr>
                        <tr>
                            <td style="width: 120px"><asp:TextBox ID="updatescore" Enabled="false" runat="server" Width="50px"></asp:TextBox></td>
                            <td>
                                <input id="txt1" runat="server" class="plain" name="dc1" onfocus="this.blur()" readonly="readonly" size="12" />
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fStartPop(document.form1.txt1,document.form1.txt2);return false;">
                                <img align="absMiddle" alt="" border="0" class="PopcalTrigger" height="22" src="DateRange/calbtn.gif" width="34" /></a>
                                <%--<asp:TextBox ID="updatedatestart" runat="server" Width="110px"></asp:TextBox>--%>
                                <asp:RequiredFieldValidator ID="updatedatestartRFV" runat="server" ControlToValidate="txt1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันเริ่มต้นการทดสอบ" ValidationGroup="assess2system"></asp:RequiredFieldValidator></td>
                            <td>
                                <input id="txt2" runat="server" class="plain" name="dc2" onfocus="this.blur()" readonly="readonly" size="12" />
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fEndPop(document.form1.txt1,document.form1.txt2);return false;">
                                <img align="absMiddle" alt="" border="0" class="PopcalTrigger" height="22" src="DateRange/calbtn.gif" width="34" /></a>
                                <%--<asp:TextBox ID="updatedateend" runat="server" Width="110px"></asp:TextBox>--%>
                                <asp:RequiredFieldValidator ID="updatedateendRFV" runat="server" ControlToValidate="txt2"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันสุดท้ายการทดสอบ" ValidationGroup="assess2system"></asp:RequiredFieldValidator></td>
                            <td>
                                <asp:DropDownList ID="updatetimeDDL" runat="server" AutoPostBack="True" Width="90px">
                                    <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="updatetimeDDLRFV" runat="server" ControlToValidate="updatetimeDDL"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกระยะเวลาการทดสอบ" InitialValue="select"
                                    ValidationGroup="assess2system"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:Button ID="updatetesting" runat="server" Text="อัพเดทข้อมูล" ValidationGroup="assess2system" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                <asp:Button ID="cleartable2" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
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
