<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ThesisDetail.aspx.vb" Inherits="ThesisDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Thesis Detail</title>
    <style>
	    a:link {COLOR: #000080; TEXT-DECORATION: none}
	    a:visited {	COLOR: #000080; TEXT-DECORATION: none}
	    a:hover {COLOR: blue; TEXT-DECORATION: none}
    </style>
</head>
<body topmargin="0" bottommargin="0" background="Image/bg.jpg" style="font-family:MS Sans Serif;font-size:10pt">
    <form id="form1" runat="server">
    <div>
        <table width="800" align="center" bgcolor="white" border="0" cellpadding="0" cellspacing="0" style="border:0px;text-align:center;">
            <tr height="150" valign="top">
                <td colspan="2" width="800" height="150"><img src="Image/colorfull.jpg" border="0px" width="800" height="150" /></td>
            </tr>
            <tr height="10">
                <td></td>
            </tr>
            <tr bgcolor="#00cc00" style="font-weight:bold;color:White" height="20">
                <td colspan="2">:: รายละเอียดของวิทยานิพนธ์ ::</td>
            </tr>
            <tr height="10">
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="ThesisDetailDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT * FROM [Thesis] WHERE ([tsis_id] = @tsis_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="tsis_id" QueryStringField="tsis_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="AdvisorDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT * FROM [AdvisorThesis] WHERE ([tsis_id] = @tsis_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="tsis_id" QueryStringField="tsis_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="DeveloperDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT * FROM [DeveloperThesis] WHERE ([tsis_id] = @tsis_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="tsis_id" QueryStringField="tsis_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" CellPadding="2" DataKeyField="tsis_id"
                        DataSourceID="ThesisDetailDTS" ForeColor="Black" BackColor="PaleGoldenrod" BorderColor="Tan" BorderWidth="1px">
                        <FooterStyle BackColor="Tan" />
                        <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <ItemTemplate>
                            <table style="text-align:left" width="600">
                                <tr bgcolor="lightgoldenrodyellow">
                                    <td width="200" align="center">ปีการศึกษา</td>
                                    <td width="400" bgcolor="white"><asp:Label ID="tsis_yearLabel" runat="server" Text='<%# Eval("tsis_year") %>'></asp:Label></td>
                                </tr>
                                <tr bgcolor="lightgoldenrodyellow">
                                    <td align="center">ระดับปริญญา</td>
                                    <td bgcolor="white"><asp:Label ID="tsis_degreeLabel" runat="server" Text='<%# Eval("tsis_degree") %>'></asp:Label></td>
                                </tr>
                                <tr bgcolor="lightgoldenrodyellow">
                                    <td align="center">ชื่อโครงงานภาษาไทย</td>
                                    <td bgcolor="white"><asp:Label ID="tsis_tnameLabel" runat="server" Text='<%# Eval("tsis_tname") %>'></asp:Label></td>
                                </tr>
                                <tr bgcolor="lightgoldenrodyellow">
                                    <td align="center">ชื่อโครงงานภาษาอังกฤษ</td>
                                    <td bgcolor="white"><asp:Label ID="tsis_enameLabel" runat="server" Text='<%# Eval("tsis_ename") %>'></asp:Label></td>
                                </tr>
                                <tr height="10">
                                    <td colspan="2"></td>
                                </tr>
                                <tr bgcolor="lightgoldenrodyellow">
                                    <td colspan="2">
                                        <asp:DataList ID="DataList2" BackColor="palegoldenrod" runat="server" DataKeyField="adv_id" DataSourceID="AdvisorDTS">
                                            <ItemTemplate>
                                            <table border="0">
                                                <tr bgcolor="LightGoldenrodYellow">
                                                    <td width="200" align="center">อาจารย์ที่ปรึกษา</td>
                                                    <td width="400" bgcolor="white"><asp:Label ID="adv_nameLabel" runat="server" Text='<%# Eval("adv_name") %>'></asp:Label></td>
                                                </tr>
                                            </table>
                                            </ItemTemplate>
                                        </asp:DataList></td>
                                </tr>
                                <tr height="10">
                                    <td colspan="2"></td>
                                </tr>
                                <tr bgcolor="lightgoldenrodyellow">
                                    <td colspan="2">
                                        <asp:DataList ID="DataList3" BackColor="palegoldenrod" runat="server" DataKeyField="dev_id" DataSourceID="DeveloperDTS">
                                            <ItemTemplate>
                                            <table>
                                                <tr bgcolor="LightGoldenrodYellow">
                                                    <td width="200" align="center">รายชื่อนักศึกษา</td>
                                                    <td width="400" bgcolor="white">
                                                        <asp:Label ID="dev_nameLabel" runat="server" Text='<%# Eval("dev_name") %>'></asp:Label>
                                                        &nbsp;รหัสนักศึกษา&nbsp;<asp:Label ID="dev_codeLabel" runat="server" Text='<%# Eval("dev_code") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            </ItemTemplate>
                                        </asp:DataList></td>
                                </tr>
                                <tr height="10">
                                    <td colspan="2"></td>
                                </tr>
                                <tr bgcolor="lightgoldenrodyellow">
                                    <td align="center">บทคัดย่อ</td>
                                    <td bgcolor="white"><asp:Label ID="tsis_tabstractLabel" runat="server" Text='<%# Eval("tsis_tabstract") %>'></asp:Label></td>
                                </tr>
                                <tr bgcolor="lightgoldenrodyellow">
                                    <td align="center">Abstract</td>
                                    <td bgcolor="white"><asp:Label ID="tsis_eabstractLabel" runat="server" Text='<%# Eval("tsis_eabstract") %>'></asp:Label></td>
                                </tr>
                                <tr height="10">
                                    <td colspan="2"></td>
                                </tr>
                                <tr bgcolor="lightgoldenrodyellow">
                                    <td colspan="2" align="center" bgcolor="white"><%#"<a href=" & Container.DataItem("tsis_reppath") & ">Download Document</a>" %> 
                                    &nbsp;&nbsp;&nbsp; <asp:LinkButton ID="GetCodeThesis" runat="server" OnClick="GetCodeThesis_Click">Download Code</asp:LinkButton></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemStyle BackColor="PaleGoldenrod" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    </asp:DataList>
                </td>
            </tr>
            <tr height="10">
                <td></td>
            </tr>
        </table>
        <table id="GetCodeTable" runat="server" visible="false" align="center" width="800" bgcolor="white">
            <tr bgcolor="#00cc00" style="font-weight:bold;color:White" align="center" height="20">
                <td colspan="4">:: ตรวจสอบการเป็นสมาชิก ::</td>
            </tr>
            <tr height="10">
                <td colspan="4"></td>
            </tr>
            <tr>
                <td width="250"></td>
                <td align="center">ชื่อผู้ใช้</td>
                <td align="center"><asp:TextBox ID="username" runat="server" Width="140px"></asp:TextBox></td>
                <td width="250">
                    <asp:RequiredFieldValidator ID="usernameRFV" runat="server" ControlToValidate="username"
                        Display="Dynamic" ErrorMessage="กรุณาใส่ชื่อผู้ใช้" ValidationGroup="thesissystem"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator
                        ID="usernameREV" runat="server" ControlToValidate="username" Display="Dynamic"
                        ErrorMessage="ชื่อผู้ใช้ไม่ถูกต้อง" ValidationExpression="\w{8,16}" ValidationGroup="thesissystem"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td></td>
                <td align="center">รหัสผ่าน</td>
                <td align="center"><asp:TextBox ID="password" runat="server" TextMode="Password" Width="140px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="passwordRFV" runat="server" ControlToValidate="password"
                        Display="Dynamic" ErrorMessage="กรุณาใส่รหัสผ่าน" ValidationGroup="thesissystem"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                            ID="passwordREV" runat="server" ControlToValidate="password" Display="Dynamic"
                            ErrorMessage="รหัสผ่านไม่ถูกต้อง" ValidationExpression="\w{8,16}" ValidationGroup="thesissystem"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td colspan="4" align="center"><asp:Label ID="Warning" runat="server" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="4" align="center"><asp:Button ID="checkUser" runat="server" Text="ตกลง" ValidationGroup="thesissystem" BackColor="#FF8000" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="80px" Font-Bold="True" />
                    <asp:Button ID="Cancel" runat="server" BackColor="#FF8000" ForeColor="White" Text="ยกเลิก"
                        Width="80px" Font-Bold="True" Font-Names="Microsoft Sans Serif" /></td>
            </tr>
            <tr height="10">
                <td colspan="4"></td>
            </tr>
        </table>
        <table width="800" align="center">
            <tr height="70" bgcolor="#cccccc" align="center">
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
