<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TeacherGradeLevel.aspx.vb" Inherits="Teacher_TeacherGradeLevel" %>
<%@ Register Assembly="WebChart" Namespace="WebChart" TagPrefix="Web" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Teacher Grade Level</title>
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
                            <td style="font-weight:bold">
                                <%-- <asp:SqlDataSource ID="subjectDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                                    SelectCommand="SELECT [sub_id], [sub_name] FROM [Subject] WHERE (([tch_id] = @tch_id) AND ([sub_status] = @sub_status)) ORDER BY [sub_id]">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="tch_id" SessionField="user" Type="Int64" />
                                        <asp:Parameter DefaultValue="true" Name="sub_status" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource> --%>
                                เลือกวิชา
                                <asp:DropDownList ID="subjectDDL" runat="server" AutoPostBack="True" Width="150px"></asp:DropDownList>
                                <br />
                                <asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td style="font-weight:bold">
                                <asp:Label ID="TotalStudent" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td>
                                <web:chartcontrol id="MyLineChart" Visible="false" runat="server" borderstyle="Outset" borderwidth="3px" 
                                    height="250px" leftchartpadding="5" width="550px" HasChartLegend="False" 
                                    ShowTitlesOnBackground="False" TopPadding="20" YCustomEnd="0" YCustomStart="0" 
                                    YValuesInterval="0" ShowXValues="False" ShowYValues="False">
                                    <YAXISFONT StringFormat="Far,Near,Character,LineLimit" />
                                    <XTITLE Text="คะแนน 0 - 100" StringFormat="Center,Far,Character,LineLimit" ForeColor="SteelBlue" Font="Tahoma, 8pt, style=Bold" />
                                    <PLOTBACKGROUND ForeColor="#FFFFC0" LinearGradientMode="Vertical" EndPoint="100, 400" CenterPoint="100, 100" Angle="90" Type="LinearGradient" />
                                    <CHARTTITLE StringFormat="Center,Near,Character,LineLimit" Font="Tahoma, 10pt, style=Bold" ForeColor="White" />
                                    <XAXISFONT StringFormat="Center,Near,Character,LineLimit" />
                                    <BACKGROUND ForeColor="#80FF80" Color="CornflowerBlue" Angle="90" EndPoint="100, 400" Type="LinearGradient" />
                                    <LEGEND Width="0" Font="Microsoft Sans Serif, 8pt" />
                                    <YTITLE Text="จำนวนผู้เรียน" StringFormat="Near,Near,Character,DirectionVertical" ForeColor="SteelBlue" Font="Tahoma, 8pt, style=Bold" />
                                    <Border Color="CornflowerBlue" />
                                </web:chartcontrol>
                            </td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td>
                                <web:chartcontrol runat="server" id="MyPieChart" Visible="false" height="400px" width="350px" gridlines="None" 
                                    legend-position="Bottom" ChartPadding="30" ShowTitlesOnBackground="False" TopPadding="20" 
                                    YCustomEnd="0" YCustomStart="0" YValuesInterval="0" >
                                    <YAxisFont StringFormat="Far,Near,Character,LineLimit" />
                                    <XTitle Font="Tahoma, 8pt, style=Bold" ForeColor="SteelBlue" StringFormat="Center,Far,Character,LineLimit" />
                                    <PlotBackground Angle="90" EndPoint="100, 400" ForeColor="#FFFFC0" Type="LinearGradient" />
                                    <ChartTitle Font="Tahoma, 10pt, style=Bold" ForeColor="White" StringFormat="Center,Near,Character,LineLimit" />
                                    <Border Color="CornflowerBlue" />
                                    <XAxisFont StringFormat="Center,Near,Character,LineLimit" />
                                    <Background Angle="90" Color="CornflowerBlue" EndPoint="100, 400" ForeColor="#80FF80" Type="LinearGradient" />
                                    <Legend Position="Bottom"></Legend>
                                    <YTitle Font="Tahoma, 8pt, style=Bold" ForeColor="SteelBlue" StringFormat="Near,Near,Character,DirectionVertical" />
                                </web:chartcontrol>
                            </td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td>
                                <asp:Button ID="create" runat="server" Text="กำหนดระดับของเกรด" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="160px" />
                                <asp:Button ID="update" runat="server" Text="เปลี่ยนแปลงระดับของเกรด" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="160px" />
                            </td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td>
                                <table id="createform" visible="false" runat="server">
                                    <tr>
                                        <td>A</td>
                                        <td>
                                            <asp:TextBox ID="a1" runat="server" Width="50px"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ID="a1RFV" runat="server" ControlToValidate="a1" Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน A"
                                                ValidationGroup="grade1system"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator
                                                ID="a1REV" runat="server" ControlToValidate="a1" Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก"
                                                ValidationExpression="\d{1,2}" ValidationGroup="grade1system"></asp:RegularExpressionValidator></td>
                                        <td>คะแนนขั้นต่ำของเกรด A</td>
                                    </tr>
                                    <tr>
                                        <td>B+</td>
                                        <td><asp:TextBox ID="bp1" runat="server" Width="50px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="bp1RFV" runat="server" ControlToValidate="bp1"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน B+" ValidationGroup="grade1system"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="bp1REV" runat="server" ControlToValidate="bp1"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก" ValidationExpression="\d{1,2}"
                                                ValidationGroup="grade1system"></asp:RegularExpressionValidator></td>
                                        <td>คะแนนขั้นต่ำของเกรด B+</td>
                                    </tr>
                                    <tr>
                                        <td>B</td>
                                        <td><asp:TextBox ID="b1" runat="server" Width="50px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="b1RFV" runat="server" ControlToValidate="b1"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน B" ValidationGroup="grade1system"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="b1REV" runat="server" ControlToValidate="b1"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก" ValidationExpression="\d{1,2}"
                                                ValidationGroup="grade1system"></asp:RegularExpressionValidator></td>
                                        <td>คะแนนขั้นต่ำของเกรด B</td>
                                    </tr>
                                    <tr>
                                        <td>C+</td>
                                        <td><asp:TextBox ID="cp1" runat="server" Width="50px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="cp1RFV" runat="server" ControlToValidate="cp1"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน C+" ValidationGroup="grade1system"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="cp1REV" runat="server" ControlToValidate="cp1"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก" ValidationExpression="\d{1,2}"
                                                ValidationGroup="grade1system"></asp:RegularExpressionValidator></td>
                                        <td>คะแนนขั้นต่ำของเกรด C+</td>
                                    </tr>
                                    <tr>
                                        <td>C</td>
                                        <td><asp:TextBox ID="c1" runat="server" Width="50px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="c1RFV" runat="server" ControlToValidate="c1"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน C" ValidationGroup="grade1system"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="c1REV" runat="server" ControlToValidate="c1"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก" ValidationExpression="\d{1,2}"
                                                ValidationGroup="grade1system"></asp:RegularExpressionValidator></td>
                                        <td>คะแนนขั้นต่ำของเกรด C</td>
                                    </tr>
                                    <tr>
                                        <td>D+</td>
                                        <td><asp:TextBox ID="dp1" runat="server" Width="50px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="dp1RFV" runat="server" ControlToValidate="dp1"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน D+" ValidationGroup="grade1system"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="dp1REV" runat="server" ControlToValidate="dp1"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก" ValidationExpression="\d{1,2}"
                                                ValidationGroup="grade1system"></asp:RegularExpressionValidator></td>
                                        <td>คะแนนขั้นต่ำของเกรด D+</td>
                                    </tr>
                                    <tr>
                                        <td>D</td>
                                        <td><asp:TextBox ID="d1" runat="server" Width="50px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="d1RFV" runat="server" ControlToValidate="d1"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน D" ValidationGroup="grade1system"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="d1REV" runat="server" ControlToValidate="d1"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก" ValidationExpression="\d{1,2}"
                                                ValidationGroup="grade1system"></asp:RegularExpressionValidator></td>
                                        <td>คะแนนขั้นต่ำของเกรด D</td>
                                    </tr>
                                    <tr>
                                        <td>F</td>
                                        <td><asp:TextBox ID="f1" runat="server" Width="50px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="f1RFV" runat="server" ControlToValidate="f1"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน F" ValidationGroup="grade1system"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="f1REV" runat="server" ControlToValidate="f1"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก" ValidationExpression="\d{1,2}"
                                                ValidationGroup="grade1system"></asp:RegularExpressionValidator></td>
                                        <td>คะแนนที่ต่ำกว่านี้จะเป็นเกรด F</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <asp:Button ID="submit1" runat="server" Text="บันทึกข้อมูลและคำนวณเกรด" ValidationGroup="grade1system" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="170px" />
                                            <asp:Button ID="clear1" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="50px" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table id="updateform" visible="false" runat="server">
                                    <tr>
                                        <td>A</td>
                                        <td><asp:TextBox ID="a2" runat="server" Width="50px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="a2RFV" runat="server" ControlToValidate="a2"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน A" ValidationGroup="grade2system"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="a2REV" runat="server" ControlToValidate="a2"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก" ValidationExpression="\d{1,2}"
                                                ValidationGroup="grade2system"></asp:RegularExpressionValidator>
                                        </td>
                                        <td>คะแนนขั้นต่ำของเกรด A</td>
                                    </tr>
                                    <tr>
                                        <td>B+</td>
                                        <td><asp:TextBox ID="bp2" runat="server" Width="50px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="bp2RFV" runat="server" ControlToValidate="bp2"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน B+" ValidationGroup="grade2system"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="bp2REV" runat="server" ControlToValidate="bp2"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก" ValidationExpression="\d{1,2}"
                                                ValidationGroup="grade2system"></asp:RegularExpressionValidator></td>
                                        <td>คะแนนขั้นต่ำของเกรด B+</td>
                                    </tr>
                                    <tr>
                                        <td>B</td>
                                        <td><asp:TextBox ID="b2" runat="server" Width="50px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="b2RFV" runat="server" ControlToValidate="b2"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน B" ValidationGroup="grade2system"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="b2REV" runat="server"
                                                ControlToValidate="b2" Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก"
                                                ValidationExpression="\d{1,2}" ValidationGroup="grade2system"></asp:RegularExpressionValidator></td>
                                        <td>คะแนนขั้นต่ำของเกรด B</td>
                                    </tr>
                                    <tr>
                                        <td>C+</td>
                                        <td><asp:TextBox ID="cp2" runat="server" Width="50px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="cp2RFV" runat="server" ControlToValidate="cp2"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน C+" ValidationGroup="grade2system"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="cp2REV" runat="server"
                                                ControlToValidate="cp2" Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก"
                                                ValidationExpression="\d{1,2}" ValidationGroup="grade2system"></asp:RegularExpressionValidator></td>
                                        <td>คะแนนขั้นต่ำของเกรด C+</td>
                                    </tr>
                                    <tr>
                                        <td>C</td>
                                        <td><asp:TextBox ID="c2" runat="server" Width="50px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="c2RFV" runat="server" ControlToValidate="c2"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน C" ValidationGroup="grade2system"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="c2REV" runat="server"
                                                ControlToValidate="c2" Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก"
                                                ValidationExpression="\d{1,2}" ValidationGroup="grade2system"></asp:RegularExpressionValidator></td>
                                        <td>คะแนนขั้นต่ำของเกรด C</td>
                                    </tr>
                                    <tr>
                                        <td>D+</td>
                                        <td><asp:TextBox ID="dp2" runat="server" Width="50px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="dp2RFV" runat="server" ControlToValidate="dp2"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน D+" ValidationGroup="grade2system"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="dp2REV" runat="server"
                                                ControlToValidate="dp2" Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก"
                                                ValidationExpression="\d{1,2}" ValidationGroup="grade2system"></asp:RegularExpressionValidator></td>
                                        <td>คะแนนขั้นต่ำของเกรด D+</td>
                                    </tr>
                                    <tr>
                                        <td>D</td>
                                        <td><asp:TextBox ID="d2" runat="server" Width="50px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="d2RFV" runat="server" ControlToValidate="d2"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน D" ValidationGroup="grade2system"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="d2REV" runat="server"
                                                ControlToValidate="d2" Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก"
                                                ValidationExpression="\d{1,2}" ValidationGroup="grade2system"></asp:RegularExpressionValidator></td>
                                        <td>คะแนนขั้นต่ำของเกรด D</td>
                                    </tr>
                                    <tr>
                                        <td>F</td>
                                        <td><asp:TextBox ID="f2" runat="server" Width="50px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="f2RFV" runat="server" ControlToValidate="f2"
                                                Display="Dynamic" ErrorMessage="กรุณาใส่คะแนน F" ValidationGroup="grade2system"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="f2REV" runat="server"
                                                ControlToValidate="f2" Display="Dynamic" ErrorMessage="กรุณาใส่ตัวเลข 1 หรือ 2 หลัก"
                                                ValidationExpression="\d{1,2}" ValidationGroup="grade2system"></asp:RegularExpressionValidator></td>
                                        <td>คะแนนที่ต่ำกว่านี้จะเป็นเกรด F</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Button ID="submit2" runat="server" Text="อัพเดทข้อมูลและคำนวณเกรด" ValidationGroup="grade2system" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="170px" CausesValidation="true" />
                                            <asp:Button ID="clear2" runat="server" Text="เคลียร์" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="50px" />
                                        </td>
                                    </tr>
                                </table>
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
