<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TeacherTesting.aspx.vb" Inherits="Teacher_TeacherTesting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Teacher Testing</title>
<script src="../js/teacherbtn.js" language="javascript" type="text/javascript"></script>
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
                <td valign="top" style="width: 506px">
                    <table style="margin-top:10px;margin-bottom:10px;margin-left:10px;margin-right:10px" width="550">
                        <tr height="30" bgcolor="#ff9933" style="font-weight:bold;color:White">
                            <td colspan="2">:: ระบบสมาชิกประเภทผู้สอน ::</td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
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
                            <td style="font-weight:bold">แบบฟอร์มสำหรับการจัดการข้อสอบ</td>
                        </tr>
                        <tr height="10"><td></td></tr>
                        <tr>
                            <td style="font-weight:bold">เลือกวิชา <asp:DropDownList ID="subjectDDL" runat="server" AutoPostBack="True" DataSourceID="subjectDTS" DataTextField="sub_name" DataValueField="sub_id" Width="150px"></asp:DropDownList></td>
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
                                <%--<asp:SqlDataSource ID="AssignmentFileDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                    SelectCommand="SELECT [ass_id], [ass_number] FROM [Assignment] WHERE ([sub_id] = @sub_id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="subjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                            Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>--%>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="createtesting" runat="server" Text="สร้างข้อสอบแบบตัวเลือก" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="220px" />
                                <asp:Button ID="managetesting" runat="server" Text="เปลี่ยนแปลงแก้ไขข้อสอบแบบตัวเลือก" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="220px" />
                            </td>
                        </tr>
                       <%-- '------------------ เริ่มการเพิ่ม code ของการกำหนด Assignment แบบอัพไฟล์ ------------------' --%>
                        <tr>
                            <td>
                                <asp:Button ID="createAssignmentFile" runat="server" Text="การกำหนด Assignment" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="220px" />
                                <asp:Button ID="updateAssignmentFile" runat="server" Text="การเปลี่ยนแปลง Assignment" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="220px" />
                            </td>
                        </tr>
                    </table>
                    <table id="tableUpAss1" visible="false" runat="server">
                        <tr>
                            <td style="width: 120px">เลือกการทดสอบครั้งที่</td>
                            <td style="width: 260px"><%--<asp:DropDownList ID="UpAssDDL1" runat="server" AutoPostBack="True" DataSourceID="AssignmentFileDTS" DataTextField="ass_number" DataValueField="ass_id">--%>
                                <asp:DropDownList ID="UpAssDDL1" runat="server" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 120px">หัวข้อ</td>
                            <td style="width: 260px"><asp:TextBox ID="topicUpAss1" runat="server" Width="250px" MaxLength="195"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="topicUpAss1RFV" runat="server" ControlToValidate="topicUpAss1" Display="Dynamic" ErrorMessage="กรุณาใส่หัวข้อ"
                                    ValidationGroup="assignment1system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="topicUpAss1REV" runat="server" ControlToValidate="topicUpAss1" Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')"
                                ValidationExpression="[^']+" ValidationGroup="assignment1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 120px">รายละเอียด</td>
                            <td style="width: 260px"><asp:TextBox ID="descUpAss1" runat="server" Height="50px" TextMode="MultiLine" Width="250px" MaxLength="990"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="descUpAss1RFV" runat="server" ControlToValidate="descUpAss1" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่รายละเอียด" ValidationGroup="assignment1system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="descUpAss1REV" runat="server" ControlToValidate="descUpAss1" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="assignment1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 120px">เลือกไฟล์</td>
                            <td style="width: 260px"><asp:FileUpload ID="UpAssFile1" runat="server" Width="256px" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="submitUpAss" runat="server" Text="กำหนด Assignment" ValidationGroup="assignment1system" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="150px" />
                                <asp:Button ID="clearUpAss1" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="80px" />
                            </td>
                        </tr>
                    </table>
                    <table id="tableUpAss2" visible="false" runat="server">
                        <tr>
                            <td style="width: 120px">เลือกการทดสอบครั้งที่</td>
                            <td style="width: 260px"><asp:DropDownList ID="UpAssDDL2" runat="server" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 120px">หัวข้อ</td>
                            <td style="width: 260px"><asp:TextBox ID="topicUpAss2" runat="server" Width="250px" MaxLength="195"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="topicUpAss2RFV" runat="server" ControlToValidate="topicUpAss2" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่หัวข้อ" ValidationGroup="assignment2system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="topicUpAss2REV" runat="server" ControlToValidate="topicUpAss2" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="assignment2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 120px">รายละเอียด</td>
                            <td style="width: 260px"><asp:TextBox ID="descUpAss2" runat="server" Height="50px" TextMode="MultiLine" Width="250px" MaxLength="990"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="descUpAss2RFV" runat="server" ControlToValidate="descUpAss2" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่รายละเอียด" ValidationGroup="assignment2system"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="descUpAss2REV" runat="server" ControlToValidate="descUpAss2" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="assignment2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr align="left">
                            <td colspan="2"><asp:PlaceHolder ID="holdFile" runat="server"></asp:PlaceHolder></td>
                        </tr>
                        <tr>
                            <td style="width: 120px">เลือกไฟล์</td>
                            <td style="width: 260px"><asp:FileUpload ID="UpAssFile2" runat="server" Width="256px" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="updateUpAss" runat="server" Text="อัพเดท Assignment" ValidationGroup="assignment2system" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="150px" />
                                <asp:Button ID="clearUpAss2" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="70px" />
                                <asp:Button ID="deleteAss" runat="server" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif"
                                    ForeColor="White" Text="ลบ Assignment" Width="120px" /></td>
                        </tr>
                    </table>
                    <%-- '------------------ จบการเพิ่ม code ของการกำหนด Assignment แบบอัพไฟล์ ------------------' --%>                    
                    <table id="table1" visible="false" runat="server" width="550">
                    <tr>
                        <td width="150">เลือกประเภทของการทดสอบ</td>
                        <td width="400"><asp:DropDownList ID="createtypetestingDDL" runat="server" AutoPostBack="True" Width="220px">
                            <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                            <asp:ListItem Value="Module">การทดสอบประจำบทเรียน</asp:ListItem>
                            <asp:ListItem Value="Assignment">การทดสอบเก็บคะแนน</asp:ListItem>
                            <asp:ListItem Value="Examination">การทดสอบปลายภาคการศึกษา</asp:ListItem>
                        </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="createtypetestingDDLRFV" runat="server" ControlToValidate="createtypetestingDDL"
                                Display="Dynamic" ErrorMessage="กรุณาเลือกประเภทการทดสอบ" InitialValue="select" ValidationGroup="testingsystem"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>เลือกการทดสอบครั้งที่</td>
                        <td><asp:DropDownList ID="createtestingDDL" runat="server" AutoPostBack="True" Width="220px"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="createok" runat="server" Text="ตกลง" ValidationGroup="testingsystem" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                        </td>
                    </tr>
                </table>
                <table id="testingform" visible="false" runat="server" width="550">
                    <tr>
                        <td style="width: 684px">คำถาม</td>
                        <td width="400"><asp:TextBox ID="createquestion" TextMode="MultiLine" runat="server" Height="50" Width="300px" MaxLength="990"></asp:TextBox>
                        <asp:RequiredFieldValidator
                                ID="createquestionRFV" runat="server" ControlToValidate="createquestion" Display="Dynamic"
                                ErrorMessage="กรุณาใส่คำถาม" ValidationGroup="test1system"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator
                            ID="createquestionREV" runat="server" ControlToValidate="createquestion"
                            Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                            ValidationGroup="test1system"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 684px">รูปภาพประกอบ</td>
                        <td><asp:FileUpload ID="createpicture" runat="server" Width="305px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 684px">คะแนน</td>
                        <td><asp:TextBox ID="createscore" runat="server" Width="50px"></asp:TextBox>
                        <asp:RequiredFieldValidator
                                ID="createscoreRFV" runat="server" ControlToValidate="createscore" Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน"
                                ValidationGroup="test1system"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator
                            ID="createscoreREV" runat="server" ControlToValidate="createscore" Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก"
                            ValidationExpression="\d{1,2}" ValidationGroup="test1system"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 684px">เลือกจำนวนตัวเลือก</td>
                        <td><asp:DropDownList ID="numberofchoiceDDL" runat="server" AutoPostBack="True" Width="110px">
                            <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="numberofchoiceDDLRFV" runat="server" ControlToValidate="numberofchoiceDDL"
                                Display="Dynamic" ErrorMessage="กรุณาเลือกจำนวนตัวเลือก" InitialValue="select" ValidationGroup="test1system"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left"><asp:PlaceHolder ID="choiceanswerholder" runat="server"></asp:PlaceHolder></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="addtableform" runat="server" Text="เพิ่มข้อสอบ" ValidationGroup="test1system" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                            <asp:Button ID="cleartableform" runat="server" Text="เคลียร์" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                            <asp:Button ID="viewtableform" runat="server" Text="ดูตัวอย่างข้อสอบ" Width="100px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                        </td>
                    </tr>
                </table>
                <table id="table2" visible="false" runat="server" width="550">
                    <tr>
                        <td width="150">เลือกประเภทของการทดสอบ</td>
                        <td width="400"><asp:DropDownList ID="updatetypetestingDDL" runat="server" AutoPostBack="True" Width="220px">
                            <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                            <asp:ListItem Value="Module">การทดสอบประจำบทเรียน</asp:ListItem>
                            <asp:ListItem Value="Assignment">การทดสอบเก็บคะแนน</asp:ListItem>
                            <asp:ListItem Value="Examination">การทดสอบปลายภาคการศึกษา</asp:ListItem>
                        </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="updatetypetestingDDLRFV" runat="server" ControlToValidate="updatetypetestingDDL"
                                Display="Dynamic" ErrorMessage="กรุณาเลือกประเภทการทดสอบ" InitialValue="select" ValidationGroup="testsystem"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>เลือกการทดสอบครั้งที่</td>
                        <td><asp:DropDownList ID="updatetestingDDL" runat="server" AutoPostBack="true" Width="220px"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>เลือกข้อของการทดสอบ</td>
                        <td><asp:DropDownList ID="updatequestionDDL" runat="server" AutoPostBack="true" Width="220px"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="updateok" runat="server" Text="ตกลง" ValidationGroup="testsystem" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                        </td>
                    </tr>
                </table>
                <table id="updateform" visible="false" runat="server" width="550">
                    <tr>
                        <td style="width: 666px">คำถาม</td>
                        <td width="400"><asp:TextBox ID="updatequestion" Textmode="MultiLine" runat="server" Height="50" Width="300px" MaxLength="990"></asp:TextBox>
                        <asp:RequiredFieldValidator
                                ID="updatequestionRFV" runat="server" ControlToValidate="updatequestion" Display="Dynamic"
                                ErrorMessage="กรุณาใส่คำถาม" ValidationGroup="test2system"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator
                            ID="updatequestionREV" runat="server" ControlToValidate="updatequestion" Display="Dynamic"
                            ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="test2system"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 666px">รูปภาพประกอบเดิม</td>
                        <td><asp:Image ID="oldpicture" runat="server" Height="150px" Width="150px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 666px">รูปภาพประกอบใหม่</td>
                        <td><asp:FileUpload ID="newpicture" runat="server" Width="305px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 666px">คะแนน</td>
                        <td><asp:TextBox ID="score" runat="server" Width="50px"></asp:TextBox>
                        <asp:RequiredFieldValidator
                                ID="scoreRFV" runat="server" ControlToValidate="score" Display="Dynamic"
                                ErrorMessage="กรุณาใส่คะแนน" ValidationGroup="test2system"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator
                            ID="scoreREV" runat="server" ControlToValidate="score" Display="Dynamic"
                            ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก" ValidationExpression="\d{1,2}" ValidationGroup="test2system"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left"><asp:PlaceHolder ID="showchoiceanswerholder" runat="server"></asp:PlaceHolder></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="updatetesting" runat="server" Text="อัพเดทข้อมูล" ValidationGroup="test2system" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                            <asp:Button ID="clearupdate" runat="server" Text="เคลียร์" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                            <asp:Button ID="deletetesting" runat="server" Text="ลบข้อมูล" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                            <asp:Button ID="viewtesting" runat="server" Text="ดูตัวอย่างข้อสอบ" Width="100px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
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
