<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Editdata.aspx.vb" Inherits="EditData"
    Culture="th-TH" %>

<% 
    If Session("Status") <> "K" Then
        If (Session("Status") <> "A") Then
            Response.Redirect("Login.aspx")
        End If
    End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="text/VBScript" http-equiv="content-script-type" />
    <title>Untitled Page</title>
    <link href="App_Code/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="text-align: center; vertical-align: top;" bgcolor="lightblue">
    <center>
        <form id="form1" runat="server">
            <div style="text-align: center">
                <div style="width: 810px; height: 2700px; background-color: white; text-align: left;">
                    <table align="center" style="table-layout: fixed; font-size: 16pt; width: 730px; color: #6666cc;
                        font-family: 'Angsana New', Sans-Serif; text-align: left">
                        <tr>
                            <td style="width: 18px; text-align: left">
                            </td>
                            <td style="width: 133px; text-align: left">
                            </td>
                            <td style="width: 241px">
                            </td>
                            <td style="width: 134px">
                            </td>
                            <td style="width: 261px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" style="height: 103px; text-align: center">
                                <img border="0" height="101" src="Picture_Files/Head.jpg" width="800px" /></td>
                        </tr>
                        <tr>
                            <td style="height: 30px; text-align: center" colspan="5">
                                <table style="border-right: black thin solid; table-layout: fixed; border-top: black thin solid;
                                    vertical-align: middle; border-left: black thin solid; width: 100%; border-bottom: black thin solid;
                                    border-collapse: collapse; text-align: center">
                                    <tr>
                                        <td bgcolor="#ff3300" style="width: 102px; height: 21px">
                                        </td>
                                        <td bgcolor="#ff3300" style="width: 161px; height: 21px">
                                            <img height="10" src="./Picture_Files/P27.GIF" width="10" /><asp:HyperLink ID="HyperLink1"
                                                runat="server" Font-Bold="True" Font-Size="Smaller" Font-Strikeout="False" ForeColor="Black"
                                                NavigateUrl="~/Default.aspx" Width="140px">[  Menu ]</asp:HyperLink></td>
                                        <td bgcolor="#ff3300" style="width: 164px; height: 21px">
                                            <img height="10" src="./Picture_Files/P27.GIF" width="10" />
                                            <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Size="Smaller"
                                                Font-Strikeout="False" ForeColor="Black" NavigateUrl="~/Inputdata.aspx" Width="140px">[ New MetaData ]</asp:HyperLink></td>
                                        <td bgcolor="#ff3300" style="width: 156px; height: 21px">
                                            <img height="10" src="./Picture_Files/P27.GIF" width="10" />
                                            <asp:HyperLink ID="HyperLink3" runat="server" Font-Bold="True" Font-Size="Smaller"
                                                Font-Strikeout="False" ForeColor="Black" NavigateUrl="~/Show.aspx" Width="140px">[ Show Data, Edit ]</asp:HyperLink></td>
                                        <td bgcolor="#ff3300" style="width: 157px; height: 21px">
                                            <img height="10" src="./Picture_Files/P27.GIF" width="10" />
                                            <asp:HyperLink ID="HyperLink4" runat="server" Font-Bold="True" Font-Size="Smaller"
                                                Font-Strikeout="False" ForeColor="Black" NavigateUrl="~/Index.aspx" Width="140px">[ Sign Out ]</asp:HyperLink></td>
                                        <td bgcolor="#ff3300" style="height: 21px">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 18px; text-align: left; height: 30px;">
                            </td>
                            <td style="width: 133px; text-align: left; height: 30px;">
                            </td>
                            <td style="width: 241px; height: 30px;">
                            </td>
                            <td style="width: 134px; height: 30px;">
                            </td>
                            <td style="width: 261px; height: 30px;">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 18px; height: 5px; text-align: left">
                            </td>
                            <td style="width: 133px; height: 5px; text-align: left">
                                Call Number :</td>
                            <td style="height: 5px" colspan="2">
                                <asp:TextBox ID="CallNumber" runat="server" Columns="30" ToolTip="เลขทะเบียนหนังสือ"
                                    AutoCompleteType="Notes"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ErrorCallNumber" runat="server" ControlToValidate="CallNumber"
                                    ErrorMessage="เลขทะเบียนหนังสือ" SetFocusOnError="True" ValidationGroup="Savedata"
                                    Width="2px">*</asp:RequiredFieldValidator></td>
                            <td style="width: 261px; height: 5px">
                            </td>
                        </tr>
                        <tr>
                            <td height="15" style="width: 18px">
                            </td>
                            <td height="15" style="width: 133px">
                            </td>
                            <td height="15" style="width: 241px">
                            </td>
                            <td height="15" style="width: 134px">
                            </td>
                            <td height="15" style="width: 261px">
                            </td>
                        </tr>
                        <tr>
                            <td height="15" style="width: 18px">
                            </td>
                            <td height="15" style="width: 133px">
                                <strong><span style="font-size: 15pt; color: #ff0000">Title</span></strong></td>
                            <td height="15" style="width: 241px">
                            </td>
                            <td height="15" style="width: 134px">
                            </td>
                            <td height="15" style="width: 261px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 18px; height: 31px;">
                            </td>
                            <td style="width: 133px; height: 31px;">
                                Thai Title :</td>
                            <td colspan="3" style="height: 31px">
                                <asp:TextBox ID="Thai_Title" runat="server" Columns="60" Width="450px" ToolTip="ชื่อโครงการวิจัย ภาษา  Thai"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Thai_Title"
                                    ErrorMessage="*" Font-Bold="False" Font-Overline="False" SetFocusOnError="True"
                                    ValidationExpression="\d{2}/\d{2}/\d{4}" ValidationGroup="Savedata" Width="2px"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 18px; height: 31px">
                            </td>
                            <td style="width: 133px; height: 31px">
                                English Title :</td>
                            <td colspan="3" style="height: 31px">
                                <asp:TextBox ID="English_Title" runat="server" Columns="60" Rows="5" TextMode="SingleLine"
                                    Width="450px" ToolTip="ชื่อโครงการวิจัย  ภาษา English"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="English_Title"
                                    ErrorMessage="*" Font-Bold="False" Font-Overline="False" SetFocusOnError="True"
                                    ValidationExpression="\d{2}/\d{2}/\d{4}" ValidationGroup="Savedata" Width="2px"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 18px; height: 15px;">
                            </td>
                            <td style="width: 133px; height: 15px;">
                            </td>
                            <td style="width: 241px; height: 15px;">
                            </td>
                            <td style="width: 134px; height: 15px;">
                            </td>
                            <td style="width: 261px; height: 15px;">
                            </td>
                        </tr>
                        <tr>
                            <td height="15" style="width: 18px">
                            </td>
                            <td height="15" style="width: 133px; text-align: left">
                                <span style="font-size: 20px; color: #ff0000"><strong>Creator </strong></span>
                            </td>
                            <td height="15" style="width: 241px">
                            </td>
                            <td height="15" style="width: 134px">
                            </td>
                            <td height="15" style="width: 261px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Thai Creator
                                <asp:Label ID="NName" runat="server" Width="10px"></asp:Label>:</td>
                            <td style="width: 241px">
                                <asp:TextBox ID="Thai_Creator" runat="server" Columns="50" Width="170px" ToolTip="ชื่อ นามสกุล ผู้ทำวิทยานิพนธ์ ภาษาThai"></asp:TextBox>&nbsp;
                            </td>
                            <td style="width: 134px">
                                English Creator :</td>
                            <td style="width: 261px">
                                <asp:TextBox ID="English_Creator" runat="server" Columns="35" ToolTip="ชื่อผู้ทำวิทยานิพนธ์ภาษา English"
                                    Width="170px"></asp:TextBox>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 18px; height: 31px;">
                            </td>
                            <td style="width: 133px; height: 31px;">
                                Org Name :</td>
                            <td style="width: 241px; height: 31px;">
                                <asp:TextBox ID="OrgName" runat="server" Columns="50" Width="170px" ToolTip="ชื่อภาควิชาที่สังกัด"></asp:TextBox>&nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="OrgName"
                                    ErrorMessage="**" Font-Size="Smaller" ToolTip="ภาควิชา" ValidationExpression="\D+"
                                    ValidationGroup="AddCreator"></asp:RegularExpressionValidator></td>
                            <td style="width: 134px; height: 31px;">
                                E-Mail :</td>
                            <td style="width: 261px; height: 31px;">
                                <asp:TextBox ID="MailCreator" runat="server" Columns="25" ToolTip="e-mail ของผู้ทำวิทยานิพนธ์"
                                    Width="170px"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="MailCreator"
                                    ErrorMessage="**" Font-Size="Smaller" ToolTip="อีเมล์" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ValidationGroup="AddCreator"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td style="width: 18px; height: 50px">
                            </td>
                            <td style="width: 133px; height: 50px">
                            </td>
                            <td colspan="2" style="height: 50px">
                                <asp:Button ID="AddCreator" runat="server" Text="Add" ToolTip="บันทึก" />
                                &nbsp;&nbsp;
                                <asp:Button ID="ClearCreator" runat="server" Text="Clear" ToolTip="ลบทั้งหมด" />&nbsp;
                                &nbsp;<asp:Button ID="EditCreator" runat="server" Text="Edit" ToolTip="แก้ไข" />
                                &nbsp;&nbsp;
                                <asp:Button ID="BackCreator" runat="server" Text="Back" ToolTip="ย้อนหลัง" />&nbsp;
                                &nbsp;<asp:Button ID="NextCreator" runat="server" Text="Next" ToolTip="ไปข้างหน้า" /></td>
                            <td style="width: 261px; height: 50px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 18px; height: 11px">
                            </td>
                            <td style="width: 133px; height: 11px">
                                <span style="font-size: 20px; color: #ff0000"><strong>Adviser</strong></span></td>
                            <td style="width: 241px; height: 11px">
                            </td>
                            <td style="width: 134px; height: 11px">
                            </td>
                            <td style="width: 261px; height: 11px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 18px; height: 12px;">
                            </td>
                            <td style="width: 133px; height: 12px;">
                                Thai Adviser
                                <asp:Label ID="AName" runat="server" Width="12px"></asp:Label>:</td>
                            <td style="width: 241px; height: 12px;">
                                <asp:DropDownList ID="Thai_AdviserList" runat="server" AutoPostBack="True" DataTextField="CONTRIBUTOR_NAME"
                                    Width="230px">
                                    <asp:ListItem>&lt;&lt;อาจารย์ที่ปรึกษา&gt;&gt;</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width: 134px; height: 12px;">
                                English Adviser :</td>
                            <td style="width: 261px; height: 12px;">
                                <asp:TextBox ID="English_Adviser" runat="server" Enabled="False" Width="174px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 18px; height: 31px">
                            </td>
                            <td style="width: 133px; height: 31px">
                                Roles :</td>
                            <td style="width: 241px; height: 31px">
                                <asp:TextBox ID="Roles_Adviser" runat="server" Enabled="False" Width="174px" ForeColor="Black"></asp:TextBox></td>
                            <td style="width: 134px; height: 31px">
                                E-Mail :</td>
                            <td style="width: 261px; height: 31px">
                                <asp:TextBox ID="Email_Adviser" runat="server" Enabled="False" Width="174px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 18px; height: 50px">
                            </td>
                            <td style="width: 133px; height: 50px">
                            </td>
                            <td colspan="2" style="height: 50px">
                                <asp:Button ID="AddAdviser" runat="server" Text="Add" ToolTip="บันทึก" Width="40px" />
                                &nbsp;&nbsp;
                                <asp:Button ID="ClearAdviser" runat="server" Text="Clear" ToolTip="ลบทั้งหมด" Width="40px" />
                                &nbsp;&nbsp;
                                <asp:Button ID="EditAdviser" runat="server" Text="Edit" ToolTip="แก้ไข" Width="40px" />
                                &nbsp;&nbsp;
                                <asp:Button ID="BackAdviser" runat="server" Text="Back" ToolTip="ย้อนหลัง" Width="40px" />
                                &nbsp;&nbsp;
                                <asp:Button ID="NextAdviser" runat="server" Text="Next" ToolTip="ไปข้างหน้า" Width="40px" /></td>
                            <td style="width: 261px; height: 50px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                            </td>
                            <td style="width: 241px">
                            </td>
                            <td style="width: 134px">
                            </td>
                            <td style="width: 261px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                <strong><span style="font-size: 15pt; color: #ff0000">Degree</span></strong></td>
                            <td style="width: 241px; font-size: 16pt;">
                            </td>
                            <td style="width: 134px; font-size: 16pt;">
                            </td>
                            <td style="width: 261px; font-size: 16pt;">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px; height: 27px;">
                            </td>
                            <td style="width: 133px; height: 27px;">
                                Degree Level :</td>
                            <td style="width: 241px; height: 27px;">
                                <asp:DropDownList ID="DegreeLevel" runat="server" Width="200px" AutoPostBack="True">
                                    <asp:ListItem Selected="True">&lt;&lt;หลักสูตร&gt;&gt;</asp:ListItem>
                                    <asp:ListItem>ปริญญาตรี</asp:ListItem>
                                    <asp:ListItem>ปริญญาโท</asp:ListItem>
                                    <asp:ListItem>ปริญญาเอก</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="DegreeLevel"
                                    ErrorMessage="*" Font-Bold="False" Font-Overline="False" SetFocusOnError="True"
                                    ValidationExpression="\d{2}/\d{2}/\d{4}" ValidationGroup="Savedata" Width="2px"></asp:RequiredFieldValidator></td>
                            <td style="width: 134px; height: 27px;">
                                Degree &nbsp;Name :</td>
                            <td style="width: 261px; height: 27px;">
                                <asp:DropDownList ID="DegreeName" runat="server" Width="200px" AutoPostBack="True"
                                    DataTextField="DEGREE_NAME">
                                    <asp:ListItem>&lt;&lt;ชื่อปริญญา&gt;&gt;</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="DegreeName"
                                    ErrorMessage="*" Font-Bold="False" Font-Overline="False" SetFocusOnError="True"
                                    ValidationExpression="\d{2}/\d{2}/\d{4}" ValidationGroup="Savedata" Width="2px"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px; height: 13px;">
                            </td>
                            <td style="width: 133px; height: 13px;">
                                Faculty Thai :</td>
                            <td style="width: 241px; height: 13px;">
                                <asp:DropDownList ID="FacultyList" runat="server" AutoPostBack="True" Width="200px"
                                    DataTextField="FACULTY_THAI">
                                    <asp:ListItem>&lt;&lt;คณะวิชา&gt;&gt;</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="FacultyList"
                                    ErrorMessage="*" Font-Bold="False" Font-Overline="False" SetFocusOnError="True"
                                    ValidationExpression="\d{2}/\d{2}/\d{4}" ValidationGroup="Savedata" Width="2px"></asp:RequiredFieldValidator></td>
                            <td style="width: 134px; height: 13px;">
                                Faculty English :</td>
                            <td style="width: 261px; height: 13px;">
                                <asp:TextBox ID="FacultyEng" runat="server" Width="200px" Enabled="False" ForeColor="Black"></asp:TextBox>
                                </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Department Thai<span> :</span></td>
                            <td style="width: 241px">
                                <asp:DropDownList ID="DepartmentThai" runat="server" Width="200px" DataTextField="DEPARTMENT_THAI"
                                    AutoPostBack="True">
                                    <asp:ListItem>&lt;&lt;ภาควิชา&gt;&gt;</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="DepartmentThai"
                                    ErrorMessage="*" Font-Bold="False" Font-Overline="False" SetFocusOnError="True"
                                    ValidationExpression="\d{2}/\d{2}/\d{4}" ValidationGroup="Savedata" Width="2px"></asp:RequiredFieldValidator></td>
                            <td style="width: 134px">
                                Department English <span>:</span></td>
                            <td style="width: 261px">
                                <asp:TextBox ID="DepartmentEnglish" runat="server" Width="200px" Enabled="False"
                                    ForeColor="Black"></asp:TextBox>
                                </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Desciption <span>Thai :</span></td>
                            <td style="width: 241px">
                                <asp:DropDownList ID="DesciptionThai" runat="server" Width="200px" AutoPostBack="True"
                                    DataTextField="DESCIPTION_THAI">
                                    <asp:ListItem>&lt;&lt;สาขาวิชา&gt;&gt;</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="DesciptionThai"
                                    ErrorMessage="*" Font-Bold="False" Font-Overline="False" SetFocusOnError="True"
                                    ValidationExpression="\d{2}/\d{2}/\d{4}" ValidationGroup="Savedata" Width="2px"></asp:RequiredFieldValidator></td>
                            <td style="width: 134px">
                                Descipline <span>English :</span></td>
                            <td style="width: 261px">
                                <asp:TextBox ID="DesciptionEng" runat="server" Width="200px" Enabled="False" ForeColor="Black"></asp:TextBox>
                                </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px; height: 26px;">
                            </td>
                            <td style="width: 133px; height: 26px;">
                                Degree Grantor :</td>
                            <td colspan="3" style="height: 26px; text-align: left;">
                                <asp:TextBox ID="DegreeGrantor" runat="server" Width="563px" ToolTip="ชื่อสถาบัน (สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง)"></asp:TextBox>
                                </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px; height: 15px;">
                            </td>
                            <td style="width: 133px; height: 15px;">
                            </td>
                            <td style="width: 241px; height: 15px;">
                            </td>
                            <td style="width: 134px; height: 15px;">
                            </td>
                            <td style="width: 261px; height: 15px;">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td height="15" style="width: 18px">
                            </td>
                            <td height="15" style="width: 133px">
                                <strong><span style="color: #ff0000">Publisher </span></strong>
                            </td>
                            <td height="15" style="width: 241px">
                            </td>
                            <td height="15" style="width: 134px">
                            </td>
                            <td height="15" style="width: 261px">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Publisher Name :</td>
                            <td style="width: 241px">
                                <asp:TextBox ID="Publisher_Name" runat="server" Columns="30" ToolTip="ชื่อหน่วยงานที่จัดทำ(สำนักหอสมุดกลาง)"
                                    Width="180px"></asp:TextBox>&nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Publisher_Name"
                                    ErrorMessage="**" ToolTip=" สำนักหอสมุดกลาง" ValidationExpression="\D+" ValidationGroup="Savedata"></asp:RegularExpressionValidator></td>
                            <td style="width: 134px">
                                URL :</td>
                            <td style="width: 261px">
                                <asp:TextBox ID="URL" runat="server" Columns="30" ToolTip="เว็บ ของ สำนักหอสมุด"
                                    Width="180px"></asp:TextBox>&nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                                    ControlToValidate="URL" ErrorMessage="**" ToolTip="http://............" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"
                                    ValidationGroup="Savedata"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Place :</td>
                            <td style="width: 241px">
                                <asp:TextBox ID="Place" runat="server" Columns="30" ToolTip="ชื่อจังหวัด" Width="160px"></asp:TextBox>&nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="Place"
                                    ErrorMessage="**" ToolTip="จังหวัด" ValidationExpression="\D+" ValidationGroup="Savedata"></asp:RegularExpressionValidator></td>
                            <td style="width: 134px">
                                E-Mail :</td>
                            <td style="width: 261px">
                                <asp:TextBox ID="E_mail_Publisher" runat="server" Columns="30" Width="204px" ToolTip="e-mail ของหน่วยงานที่ทำ"></asp:TextBox>&nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server"
                                    ControlToValidate="E_mail_Publisher" ErrorMessage="**" ToolTip="อีเมล์" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ValidationGroup="Savedata"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td height="15" style="width: 18px">
                            </td>
                            <td height="15" style="width: 133px">
                            </td>
                            <td height="15" style="width: 241px">
                            </td>
                            <td height="15" style="width: 134px">
                            </td>
                            <td height="15" style="width: 261px">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Year Created Thai :</td>
                            <td style="width: 241px">
                                <asp:TextBox ID="Created" runat="server" Columns="30" ToolTip="ปี พ.ศ. ของวิทยานิพนธ์"
                                    Width="100px"></asp:TextBox>&nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="Created"
                                    ErrorMessage="**" Font-Bold="False" ToolTip="xxxx" ValidationExpression="\d{4}"
                                    ValidationGroup="Savedata" Width="13px"></asp:RegularExpressionValidator></td>
                            <td style="width: 134px">
                                Year Created English :</td>
                            <td style="width: 261px">
                                <asp:TextBox ID="CreatedYEnglish" runat="server" Columns="30" ToolTip="ปี ค.ศ. ของวิทยานิพนธ์ "
                                    Width="100px"></asp:TextBox>&nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="CreatedYEnglish"
                                    ErrorMessage="**" Font-Bold="False" ToolTip="xxxx" ValidationExpression="\d{4}"
                                    ValidationGroup="Savedata" Width="5px"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px; height: 35px;">
                            </td>
                            <td style="width: 133px; height: 35px;">
                                Date Issued :</td>
                            <td style="width: 241px; height: 35px;">
                                <asp:TextBox ID="Date_Issued" runat="server" Columns="11" ToolTip="บันทึกเมื่อ วัน / เดือน / ปี"
                                    Width="119px" MaxLength="10" Enabled="False"></asp:TextBox></td>
                            <td style="width: 134px; height: 35px;">
                                Date Modified :</td>
                            <td style="width: 261px; height: 35px;">
                                <asp:TextBox ID="Date_Modified" runat="server" Columns="11" ToolTip="แก้ไขเมื่อ วัน / เดือน / ปี"
                                    Width="120px" MaxLength="10" ValidationGroup="Savedata" Enabled="False"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                ISSN :</td>
                            <td style="width: 241px">
                                <asp:TextBox ID="ISSN" runat="server" Columns="30" ToolTip="เลข ISSN" Width="167px"
                                    MaxLength="10"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="ISSN"
                                    ErrorMessage="**" ToolTip=" xxxx-xxxx" ValidationExpression="\d{4}-\d\d\d+" ValidationGroup="Savedata"></asp:RegularExpressionValidator></td>
                            <td style="width: 134px">
                                ISBN :
                            </td>
                            <td style="width: 261px">
                                <asp:TextBox ID="ISBN" runat="server" Columns="30" ToolTip="เลข ISBN" Width="180px"
                                    MaxLength="10"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Rights :</td>
                            <td colspan="3">
                                <asp:TextBox ID="Rights" runat="server" Columns="70" Width="580px" ToolTip="ชื่อสถาบัน"></asp:TextBox>
                                </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Rights &nbsp;Access :</td>
                            <td colspan="3">
                                <asp:TextBox ID="Access" runat="server" Columns="40" Width="228px" ToolTip="สามารถเข้าใช้ได้เฉพาะสมาชิกในกลุ่ม"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td height="15" style="width: 18px">
                            </td>
                            <td height="15" style="width: 133px">
                            </td>
                            <td height="15" style="width: 241px">
                            </td>
                            <td height="15" style="width: 134px">
                            </td>
                            <td height="15" style="width: 261px">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Thai Eng :</td>
                            <td style="width: 241px">
                                <asp:RadioButton ID="LanguageThai" runat="server" Checked="True" GroupName="Language"
                                    Text="Thai" Value="Thai" ToolTip="ภาษาที่ใช้ในการเก็บเอกสาร" />
                                &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                                <asp:RadioButton ID="LanguageEnglish" runat="server" Checked="False" GroupName="Language"
                                    Text="English" Value="English" ToolTip="ภาษาที่ใช้ในการเก็บเอกสาร" /></td>
                            <td style="width: 134px">
                                Format :</td>
                            <td style="width: 261px">
                                &nbsp;
                                <asp:RadioButton ID="RadioPDF" runat="server" GroupName="Formatpaper" Text="PDF"
                                    ToolTip="ชนิดของเอกสาร" Checked="True" />
                                &nbsp; &nbsp; &nbsp; &nbsp;
                                <asp:RadioButton ID="RadioDOC" runat="server" GroupName="Formatpaper" Text="DOC"
                                    ToolTip="ชนิดของเอกสาร" /></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td height="15" style="width: 18px">
                            </td>
                            <td height="15" style="width: 133px">
                            </td>
                            <td height="15" style="width: 241px">
                            </td>
                            <td height="15" style="width: 134px">
                            </td>
                            <td height="15" style="width: 261px">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Subject
                                <asp:Label ID="sName" runat="server" Width="12px"></asp:Label>:</td>
                            <td colspan="3">
                                <asp:TextBox ID="Subject" runat="server" Columns="50" Width="550px" ToolTip="หัวเรื่อง"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px; height: 48px;">
                            </td>
                            <td style="width: 133px; height: 48px;">
                            </td>
                            <td style="width: 241px; height: 48px;">
                                <asp:Button ID="AddSub" runat="server" Text="Add" Width="40px" />
                                &nbsp;
                                <asp:Button ID="ClearSub" runat="server" Text="Clear" Width="40px" />
                                &nbsp;
                                <asp:Button ID="EditSub" runat="server" Text="Edit" Width="40px" />
                                &nbsp;
                                <asp:Button ID="BackSub" runat="server" Text="Back" Width="40px" />
                                &nbsp;&nbsp;
                                <asp:Button ID="NextSub" runat="server" Text="Next" Width="40px" /></td>
                            <td style="width: 134px; height: 48px;">
                            </td>
                            <td style="width: 261px; height: 48px;">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                            </td>
                            <td style="width: 241px">
                            </td>
                            <td style="width: 134px">
                            </td>
                            <td style="width: 261px">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Abstract Thai :</td>
                            <td colspan="3">
                                <asp:TextBox ID="Abstract_Thai" runat="server" Columns="30" Height="125px" Width="550px"
                                    ToolTip="บทคัดย่อโครงการวิจัย  Thai" TextMode="MultiLine"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                            </td>
                            <td style="width: 241px">
                            </td>
                            <td style="width: 134px">
                            </td>
                            <td style="width: 261px">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Abstract English :</td>
                            <td colspan="3">
                                <asp:TextBox ID="Abstract_English" runat="server" Columns="30" Height="125px" Width="550px"
                                    TextMode="MultiLine" ToolTip="บทคัดย่อโครงการวิจัย  English"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                            </td>
                            <td style="width: 241px">
                            </td>
                            <td style="width: 134px">
                            </td>
                            <td style="width: 261px">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Contents :</td>
                            <td colspan="3">
                                <asp:TextBox ID="Contents" runat="server" Columns="30" Height="125px" Width="550px"
                                    TextMode="MultiLine" ToolTip="สารบัญ"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                            </td>
                            <td style="width: 241px">
                            </td>
                            <td style="width: 134px">
                            </td>
                            <td style="width: 261px">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Illustrative :</td>
                            <td colspan="3">
                                <asp:TextBox ID="Illustrative" runat="server" Columns="30" Height="125px" TextMode="MultiLine"
                                    Width="550px" ToolTip="สารบัญรูป"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px; height: 31px;">
                            </td>
                            <td style="width: 133px; height: 31px;">
                            </td>
                            <td style="width: 241px; height: 31px;">
                            </td>
                            <td style="width: 134px; height: 31px;">
                            </td>
                            <td style="width: 261px; height: 31px;">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Chapter&nbsp;
                                <asp:Label ID="CName" runat="server"></asp:Label>:</td>
                            <td colspan="3">
                                <asp:TextBox ID="Chapter" runat="server" Columns="30" Height="125px" Width="550px"
                                    TextMode="MultiLine" ToolTip="เนื้อหา"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px; height: 50px">
                            </td>
                            <td style="width: 133px; height: 50px">
                            </td>
                            <td colspan="2" style="height: 50px">
                                <asp:Button ID="AddChapter" runat="server" Text="Add" Width="40px" />
                                &nbsp;
                                <asp:Button ID="ClearChapter" runat="server" Text="Clear" Width="40px" />
                                &nbsp;
                                <asp:Button ID="EditChapter" runat="server" Text="Edit" Width="40px" />
                                &nbsp;
                                <asp:Button ID="BackChapter" runat="server" Text="Back" Width="40px" />
                                &nbsp;&nbsp;
                                <asp:Button ID="NextChapter" runat="server" Text="Next" Width="40px" /></td>
                            <td style="width: 261px; height: 50px">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Appendix :</td>
                            <td colspan="3">
                                <asp:TextBox ID="Appendix" runat="server" Columns="30" Height="125px" Width="550px"
                                    TextMode="MultiLine" ToolTip="ภาคผนวก"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                            </td>
                            <td style="width: 241px">
                            </td>
                            <td style="width: 134px">
                            </td>
                            <td style="width: 261px">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Bibliography :</td>
                            <td colspan="3">
                                <asp:TextBox ID="Bibliography" runat="server" Columns="30" Height="125px" Width="550px"
                                    TextMode="MultiLine" ToolTip="อ้างอิง"></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                            </td>
                            <td style="width: 241px">
                            </td>
                            <td style="width: 134px">
                            </td>
                            <td style="width: 261px">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                                Keyword :</td>
                            <td colspan="3">
                                <asp:TextBox ID="Keyword" runat="server" Columns="30" Height="55px" TextMode="MultiLine"
                                    Width="550px" ToolTip="คำค้นหา "></asp:TextBox></td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px; height: 31px">
                            </td>
                            <td style="width: 133px; height: 31px">
                            </td>
                            <td style="width: 241px; height: 31px">
                            </td>
                            <td style="width: 134px; height: 31px">
                            </td>
                            <td style="width: 261px; height: 31px">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                            </td>
                            <td style="width: 241px; text-align: center">
                                <asp:Button ID="Savea" runat="server" Text="Save" ValidationGroup="Savedata" Width="67px" /></td>
                            <td style="width: 134px; text-align: center">
                                <asp:Button ID="Clear" runat="server" Text="Clear" Width="70" /></td>
                            <td style="width: 261px">
                            </td>
                        </tr>
                        <tr style="font-size: 16pt">
                            <td style="width: 18px">
                            </td>
                            <td style="width: 133px">
                            </td>
                            <td style="width: 241px">
                            </td>
                            <td style="width: 134px">
                            </td>
                            <td style="width: 261px">
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </form>
    </center>
</body>
</html>
