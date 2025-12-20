<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TeacherLearningFile.aspx.vb" Inherits="Teacher_TeacherLearningFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Teacher Learning File</title>
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
                            <td style="font-weight:bold">แบบฟอร์มสำหรับการจัดการสื่อที่ใช้ในการเรียนการสอน</td>
                        </tr>
                        <tr height="10"><td></td></tr>                        
                        <tr>
                            <td style="font-weight:bold">
                                เลือกวิชา
                                <asp:DropDownList ID="subjectDDL" runat="server" AutoPostBack="True" DataSourceID="subjectDTS" DataTextField="sub_name" DataValueField="sub_id" Width="150px">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label>
                                <asp:SqlDataSource ID="subjectDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" SelectCommand="SELECT [sub_id], [sub_name] FROM [Subject] WHERE (([tch_id] = @tch_id) AND ([sub_status] = @sub_status)) ORDER BY [sub_id]">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="tch_id" SessionField="user" Type="Int64" />
                                        <asp:Parameter DefaultValue="true" Name="sub_status" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                           </td>
                        </tr>
                        <tr>
                            <td style="font-weight:bold">เลือกประเภทของสื่อการสอน
                                <asp:DropDownList ID="uploadtypeDDL" runat="server" AutoPostBack="true" Width="200px">
                                    <asp:ListItem Value="select">- - - เลือก - - -</asp:ListItem>
                                    <asp:ListItem Value="LearningContent">เอกสารสำหรับดาวน์โหลด</asp:ListItem>
                                    <asp:ListItem Value="LearningOnWebPPT">สื่อการสอน Power Point</asp:ListItem>
                                    <asp:ListItem Value="LearningOnWebVDO">สื่อการสอน Clip VDO</asp:ListItem>
                                </asp:DropDownList>
                                </td>
                        </tr>
                        <tr height="10"><td>
                                <asp:RequiredFieldValidator ID="uploadtypeDDLRFV" runat="server" ControlToValidate="uploadtypeDDL"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกประเภทของสื่อการสอน" InitialValue="select"
                                    ValidationGroup="learningfilesystem"></asp:RequiredFieldValidator></td></tr>
                        <tr>
                            <td>
                                <asp:Button ID="createupload" runat="server" Text="อัพโหลดไฟล์สื่อการสอน" ValidationGroup="learningfilesystem" Width="200px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                                <asp:Button ID="updateupload" runat="server" Text="เปลี่ยนแปลงแก้ไขไฟล์สื่อการสอน" ValidationGroup="learningfilesystem" Width="200px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                            </td>
                        </tr>
                    </table>
                    <table id="tablecreate" visible="false" runat="server" width="550">
                        <tr>
                            <td width="200">ปีการศึกษา</td>
                            <td width="350">
                                <asp:TextBox ID="yearcreate" runat="server" Width="70px" MaxLength="4"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="yearcreateRFV" runat="server" ControlToValidate="yearcreate" Display="Dynamic" ErrorMessage="กรุณาใส่ปีการศึกษา"
                                    ValidationGroup="file1system"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="yearcreateRV"
                                    runat="server" ControlToValidate="yearcreate" Display="Dynamic" ErrorMessage="2549 - 2600"
                                    MaximumValue="2600" MinimumValue="2549" ValidationGroup="file1system"></asp:RangeValidator></td>
                        </tr>
                        <tr>
                            <td>ภาคการศึกษา</td>
                            <td>
                                <asp:TextBox ID="termcreate" runat="server" Width="70px" MaxLength="1"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="termcreateRFV" runat="server" ControlToValidate="termcreate" Display="Dynamic" ErrorMessage="กรุณาใส่ภาคการศึกษา"
                                    ValidationGroup="file1system"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator
                                    ID="termcreateREV" runat="server" ControlToValidate="termcreate" Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หลัก"
                                    ValidationExpression="1|2|3|4|5|6|7|8|9" ValidationGroup="file1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>หัวข้อ</td>
                            <td>
                                <asp:TextBox ID="topiccreate" runat="server" Width="300px" MaxLength="195"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="topiccreateRFV" runat="server" ControlToValidate="topiccreate" Display="Dynamic" ErrorMessage="กรุณาใส่หัวข้อ"
                                    ValidationGroup="file1system"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator
                                    ID="topiccreateREV" runat="server" ControlToValidate="topiccreate" Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')"
                                    ValidationExpression="[^']+" ValidationGroup="file1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>รายละเอียด</td>
                            <td>
                                <asp:TextBox ID="desccreate" runat="server" Width="300px" Height="50px" TextMode="MultiLine" MaxLength="990"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="desccreateRFV" runat="server" ControlToValidate="desccreate" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่รายละเอียด" ValidationGroup="file1system"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator
                                    ID="desccreateREV" runat="server" ControlToValidate="desccreate" Display="Dynamic"
                                    ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="file1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>ประกาศโดย</td>
                            <td>
                                <asp:TextBox ID="writercreate" runat="server" Width="300px" MaxLength="45"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="writercreateRFV" runat="server" ControlToValidate="writercreate" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ชื่อผู้ประกาศ" ValidationGroup="file1system"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator
                                    ID="writercreateREV" runat="server" ControlToValidate="writercreate" Display="Dynamic"
                                    ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="file1system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>วันที่สามารถดาวน์โหลดหรือเปิดได้</td>
                            <td>
                                <input class="plain" name="dc1" id="txt1" runat="server" onfocus="this.blur()" readonly="readonly" size="12" />
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.txt1);return false;">
                                <img align="absMiddle" alt="" border="0" class="PopcalTrigger" height="22" src="DateRange/calbtn.gif" width="34" /></a>
                                <asp:RequiredFieldValidator ID="txt1RFV" runat="server" ControlToValidate="txt1"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันวันที่ดาวน์โหลด" ValidationGroup="file1system"></asp:RequiredFieldValidator><%--<asp:TextBox ID="dateshowcreate" runat="server" Width="300px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td>เลือกไฟล์</td>
                            <td><asp:FileUpload ID="upcreate1" runat="server" Width="305px" /></td>
                        </tr>
                        <tr id="createfile2" visible="false" runat="server">
                            <td>เลือกไฟล์</td>
                            <td><asp:FileUpload ID="upcreate2" runat="server" Width="305px" /></td>
                        </tr>
                        <tr id="createfile3" visible="false" runat="server">
                            <td>เลือกไฟล์</td>
                            <td><asp:FileUpload ID="upcreate3" runat="server" Width="305px" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="upload" runat="server" Text="อัพโหลด" ValidationGroup="file1system" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                <asp:Button ID="clear1" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                            </td>
                        </tr>
                    </table>
                    <table id="tableupdate" visible="false" runat="server" width="550">
                        <tr>
                            <td>เลือกหัวข้อ</td>
                            <td><asp:DropDownList ID="fileDDL" runat="server" AutoPostBack="True" Width="305px">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td width="200">ปีการศึกษา</td>
                            <td width="350">
                                <asp:TextBox ID="yearupdate" runat="server" Width="70px" MaxLength="4"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="yearupdateRFV" runat="server" ControlToValidate="yearupdate" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ปีการศึกษา" ValidationGroup="file2system"></asp:RequiredFieldValidator>
                                <asp:RangeValidator
                                    ID="yearupdateRV" runat="server" ControlToValidate="yearupdate" Display="Dynamic"
                                    ErrorMessage="2549 - 2600" MaximumValue="2600" MinimumValue="2549" ValidationGroup="file2system"></asp:RangeValidator></td>
                        </tr>
                        <tr>
                            <td>ภาคการศึกษา</td>
                            <td>
                                <asp:TextBox ID="termupdate" runat="server" Width="70px" MaxLength="1"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="termupdateRFV" runat="server" ControlToValidate="termupdate" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ภาคการศึกษา" ValidationGroup="file2system"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator
                                    ID="termupdateREV" runat="server" ControlToValidate="termupdate" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ตัวเลข 1 หลัก" ValidationExpression="1|2|3|4|5|6|7|8|9"
                                    ValidationGroup="file2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>หัวข้อ</td>
                            <td>
                                <asp:TextBox ID="topicupdate" runat="server" Width="300px" MaxLength="190"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="topicupdateRFV" runat="server" ControlToValidate="topicupdate" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่หัวข้อ" ValidationGroup="file2system"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator
                                    ID="topicupdateREV" runat="server" ControlToValidate="topicupdate" Display="Dynamic"
                                    ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="file2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>รายละเอียด</td>
                            <td>
                                <asp:TextBox ID="descupdate" runat="server" Width="300px" Height="50px" TextMode="MultiLine" MaxLength="990"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="descupdateRFV" runat="server" ControlToValidate="descupdate" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่รายละเอียด" ValidationGroup="file2system"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator
                                    ID="descupdateREV" runat="server" ControlToValidate="descupdate" Display="Dynamic"
                                    ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="file2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>ประกาศโดย</td>
                            <td>
                                <asp:TextBox ID="writerupdate" runat="server" Width="300px" MaxLength="45"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                    ID="writerupdateRFV" runat="server" ControlToValidate="writerupdate" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ชื่อผู้ประกาศ" ValidationGroup="file2system"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator
                                    ID="writerupdateREV" runat="server" ControlToValidate="writerupdate" Display="Dynamic"
                                    ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="file2system"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>วันที่สามารถดาวน์โหลดหรือเปิดได้</td>
                            <td>
                                <input class="plain" name="dc2" id="txt2" runat="server" onfocus="this.blur()" readonly="readonly" size="12" />
                                <a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.form1.txt2);return false;">
                                <img align="absMiddle" alt="" border="0" class="PopcalTrigger" height="22" src="DateRange/calbtn.gif" width="34" /></a>
                                <asp:RequiredFieldValidator ID="txt2RFV" runat="server" ControlToValidate="txt2"
                                    Display="Dynamic" ErrorMessage="กรุณาเลือกวันวันที่ดาวน์โหลด" ValidationGroup="file2system"></asp:RequiredFieldValidator><%--<asp:TextBox ID="dateshowupdate" runat="server" Width="300px"></asp:TextBox>--%></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:PlaceHolder ID="fileholder" runat="server"></asp:PlaceHolder>
                            </td>
                        </tr>
                        <tr>
                            <td>เลือกไฟล์ใหม่</td>
                            <td><asp:FileUpload ID="upupdate1" runat="server" Width="305px" /></td>
                        </tr>
                        <tr id="updatefile2" visible="false" runat="server">
                            <td>เลือกไฟล์ใหม่</td>
                            <td><asp:FileUpload ID="upupdate2" runat="server" Width="305px" /></td>
                        </tr>
                        <tr id="updatefile3" visible="false" runat="server">
                            <td>เลือกไฟล์ใหม่</td>
                            <td><asp:FileUpload ID="upupdate3" runat="server" Width="305px" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="update" runat="server" Text="อัพเดทข้อมูล" ValidationGroup="file2system" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
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
