<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TeacherLesson.aspx.vb" Inherits="Teacher_TeacherLesson" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Teacher Lesson</title>
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
                <td valign="top" width="600">
                    <table style="margin-top:10px;margin-bottom:10px;margin-left:10px;margin-right:10px" width="550">
                        <tr height="30" bgcolor="#ff9933" style="font-weight:bold;color:White">
                            <td>:: ระบบสมาชิกประเภทผู้สอน ::</td>
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
                            <td style="font-weight:bold">แบบฟอร์มสำหรับการจัดการบทเรียน</td>
                        </tr>
                        <tr height="10"><td></td></tr>
                        <tr>
                            <td style="font-weight:bold">
                                เลือกวิชา
                                <asp:DropDownList ID="subjectDDL" runat="server" AutoPostBack="True" DataSourceID="subjectDTS" DataTextField="sub_name" DataValueField="sub_id" Width="150px"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="createlesson" runat="server" Text="กำหนดบทเรียน" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" Font-Size="Small" ForeColor="White" Width="100px" />
                                <asp:Button ID="updatelesson" runat="server" Text="แก้ไขบทเรียน" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" Font-Size="Small" ForeColor="White" Width="100px" />
                                <asp:Button ID="deletelesson" runat="server" Text="ลบบทเรียน" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" Font-Size="Small" ForeColor="White" Width="100px" />
                            </td>
                        </tr>
                        <tr height="10"><td></td></tr>
                    </table>
                    <asp:SqlDataSource ID="subjectDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                            SelectCommand="SELECT [sub_id], [sub_name] FROM [Subject] WHERE (([tch_id] = @tch_id) AND ([sub_status] = @sub_status)) ORDER BY [sub_id]">
                            <SelectParameters>
                                <asp:SessionParameter Name="tch_id" SessionField="user" Type="Int64" />
                                <asp:Parameter DefaultValue="true" Name="sub_status" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <table visible="false" id="mytable1" runat="server" width="550" align="center">
                            <tr>
                                <td style="width: 301px">เลือกจำนวนบท</td>
                                <td width="400" align="center"><asp:DropDownList ID="numberoflessonDDL" runat="server" AutoPostBack="True" Width="110px">
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
                                </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="numberoflessonDDLRFV" runat="server" ControlToValidate="numberoflessonDDL"
                                        Display="Dynamic" ErrorMessage="กรุณาเลือกจำนวนบท" InitialValue="Select"
                                        ValidationGroup="lesson1system"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><asp:PlaceHolder ID="CreateTextBoxHere" runat="server"></asp:PlaceHolder></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="createtable1" runat="server" Text="ตกลง" ValidationGroup="lesson1system" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                                    <asp:Button ID="cleartable1" runat="server" Text="เคลียร์" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                                </td>
                            </tr>
                        </table>
                        <table visible="false" ID="mytable2" runat="server" width="550" align="center">
                            <tr>
                                <td style="width: 223px">เลือกบทเรียน</td>
                                <td width="400" align="center">
                                    <asp:DropDownList ID="orderlessonddl" runat="server" AutoPostBack="True" Width="110px"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 223px">ชื่อบทเรียน</td>
                                <td><asp:TextBox ID="topic" Width="300px" runat="server" MaxLength="195"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                        ID="topicRFV" runat="server" ControlToValidate="topic" Display="Dynamic"
                                        ErrorMessage="กรุณาใส่ชื่อบทเรียน" ValidationGroup="lesson2system"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator
                                    ID="topicREV" runat="server" ControlToValidate="topic" Display="Dynamic"
                                    ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="lesson2system"></asp:RegularExpressionValidator></td>
                            </tr>
                            <tr>
                                <td style="width: 223px">รายละเอียด</td>
                                <td><asp:TextBox ID="description" Height="100" Width="300px" TextMode="MultiLine" runat="server" MaxLength="990"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                        ID="descriptionRFV" runat="server" ControlToValidate="description" Display="Dynamic"
                                        ErrorMessage="กรุณาใส่รายละเอียด" ValidationGroup="lesson2system"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator
                                    ID="descriptionREV" runat="server" ControlToValidate="description"
                                    Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                                    ValidationGroup="lesson2system"></asp:RegularExpressionValidator></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="updatetable2" runat="server" Text="อัพเดทข้อมูล" ValidationGroup="lesson2system" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                    <asp:Button ID="cleartable2" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
                                    <asp:Button ID="inserttable2" runat="server" Text="เพิ่มข้อมูล" BackColor="#FF8000" Font-Bold="true" Font-Names="Microsoft Sans Serif" ForeColor="white" Width="90px" />
                                </td>
                            </tr>
                        </table>
                        <table visible="false" id="mytable3" runat="server" width="550">
                            <tr align="center" height="30">
                                <td width="150">เลือกบทเรียน</td>
                                <td width="200"><asp:DropDownList ID="orderlessonfordeleteddl" runat="server" AutoPostBack="True" Width="110px"></asp:DropDownList></td>
                                <td width="200"><asp:Button ID="deletetable3" runat="server" Text="ลบข้อมูล" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" /></td>
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
