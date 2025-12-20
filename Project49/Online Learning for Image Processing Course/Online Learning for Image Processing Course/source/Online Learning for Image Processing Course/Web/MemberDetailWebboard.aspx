<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MemberDetailWebboard.aspx.vb" Inherits="MemberDetailWebboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Member Detail Webboard</title>
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
                <td>:: กระดานสนทนาของสมาชิก ::</td>
            </tr>
            <tr height="10">
                <td></td>
            </tr>
            <tr>
                <td><asp:Label ID="Warningtxt" runat="server" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="TopicWebboardDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT * FROM [TopicWB] WHERE (([top_id] = @top_id) AND ([top_type] = @top_type))">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="top_id" QueryStringField="top_id" Type="Int64" />
                            <asp:SessionParameter Name="top_type" SessionField="member" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" CellPadding="3" DataKeyField="top_id" DataSourceID="TopicWebboardDTS" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <ItemTemplate>
                            <table width="750">
                                <tr align="center">
                                    <td colspan="2" style="font-weight:bold;">หัวข้อ : 
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("top_name") %>'></asp:Label>
                                    </td>
                                <tr align="center">
                                    <td rowspan="3" valign="top" width="150" bgcolor="#F7F7F7">
                                        <img src="Image/member_icon.jpg" align="middle" width="20" height="20" border="0" />
                                        <asp:Label ID="top_idLabel" runat="server" Text='<%# Eval("top_id") %>'></asp:Label>
                                        <br /><br />
                                         <img src="Image/general_icon.jpg" align="middle" width="20" height="20" border="0" />
                                         <asp:Label ID="Label2" runat="server" Text='<%# Eval("top_writer") %>'></asp:Label>
                                    </td>
                                    <td align="right" bgcolor="#F7F7F7">วัน/เดือน/ปี : 
                                        <asp:Label ID="top_dateLabel" runat="server" Text='<%# Eval("top_date") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr style="text-align:justify" height="100">
                                    <td bgcolor="#ffffff"><asp:Label ID="top_contentLabel" runat="server" Text='<%# Eval("top_content") %>'></asp:Label></td>
                                </tr>
                                <tr align="right">
                                    <td bgcolor="#F7F7F7">E - Mail : 
                                        <asp:Label ID="top_emailLabel" runat="server" Text='<%# Eval("top_email") %>'></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IP : 
                                        <asp:Label ID="top_ipLabel" runat="server" Text='<%# Eval("top_ip") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <AlternatingItemStyle BackColor="#E7E7FF" />
                        <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    </asp:DataList>
                </td>
            </tr>
            <tr height="10">
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="ReplyWebboardDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT * FROM [ReplyWB] WHERE ([top_id] = @top_id) ORDER BY [rep_id] DESC">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="top_id" QueryStringField="top_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList2" runat="server" CellPadding="3" DataKeyField="rep_id" DataSourceID="ReplyWebboardDTS" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" GridLines="Vertical">
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                            <table width="750">
                                <tr align="center">
                                    <td bgcolor="#EEEEEE" rowspan="3" valign="top" width="150" ><img src="Image/lamp3.jpg" align="middle" width="20" height="20" border="0" />
                                        <asp:Label ID="rep_idLabel" runat="server" Text='<%# Eval("rep_id") %>'></asp:Label>
                                        <br /><br />
                                        <img src="Image/general_icon.jpg" align="middle" width="20" height="20" border="0" />
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("rep_writer") %>'></asp:Label>
                                    <td bgcolor="#EEEEEE" align="right">วัน/เดือน/ปี : 
                                        <asp:Label ID="rep_dateLabel" runat="server" Text='<%# Eval("rep_date") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr style="text-align:justify" height="100">
                                    <td bgcolor="#FFFFFF"><asp:Label ID="rep_contentLabel" runat="server" Text='<%# Eval("rep_content") %>'></asp:Label></td>
                                </tr>
                                <tr align="right">
                                    <td bgcolor="#EEEEEE">E-Mail : 
                                        <asp:Label ID="rep_emailLabel" runat="server" Text='<%# Eval("rep_email") %>'></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IP : 
                                        <asp:Label ID="rep_ipLabel" runat="server" Text='<%# Eval("rep_ip") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <ItemStyle BackColor="#DCDCDC" ForeColor="Black" />
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <AlternatingItemStyle BackColor="#DCDCDC" />
                    </asp:DataList>
                </td>
            </tr>
            <tr height="10">
                <td></td>
            </tr>
        </table>
        <table align="center" width="800" bgcolor="white">
            <tr bgcolor="#00cc00" style="font-weight:bold;color:White" align="center" height="20">
                <td colspan="4">:: ตอบกระทู้ ::</td>
            </tr>
            <tr height="10">
                <td colspan="4"></td>
            </tr>
            <tr align="center">
                <td style="width: 100px"></td>
                <td width="100">ชื่อผู้ตอบกระทู้</td>
                <td style="width: 420px"><asp:TextBox ID="replywriter" runat="server" Width="400px" MaxLength="45"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="writerRFV" runat="server" ControlToValidate="replywriter"
                        Display="Dynamic" ErrorMessage="กรุณาใส่ชื่อผู้ตอบกระทู้" ValidationGroup="replysystem"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="writerREV" runat="server" ControlToValidate="replywriter" Display="Dynamic"
                        ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="replysystem"
                        Width="140px"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr align="center">
                <td style="width: 100px"></td>
                <td>E - Mail</td>
                <td style="width: 420px"><asp:TextBox ID="replyemail" runat="server" Width="400px" MaxLength="45"></asp:TextBox></td>
                <td>
                    <asp:RegularExpressionValidator ID="replyemailREV" runat="server" ControlToValidate="replyemail"
                        Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                        ValidationGroup="replysystem" Width="140px"></asp:RegularExpressionValidator></td>
            </tr>
            <tr align="center">
                <td style="width: 100px"></td>
                <td>ข้อความ</td>
                <td style="width: 420px"><asp:TextBox ID="replycontent" runat="server" Width="400px" Height="100" TextMode="MultiLine" MaxLength="990"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="contentRFV" runat="server" ControlToValidate="replycontent"
                        Display="Dynamic" ErrorMessage="กรุณาใส่ข้อความ" ValidationGroup="replysystem"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="contentREV" runat="server" ControlToValidate="replycontent" Display="Dynamic"
                        ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="replysystem"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr align="center">
                <td colspan="4"><asp:Label ID="Warning" runat="server" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr align="center">
                <td colspan="4"><asp:Button ID="send" runat="server" Text="ส่งข้อความ" ValidationGroup="replysystem" Width="100px" BackColor="#FF8000" Font-Names="Microsoft Sans Serif" ForeColor="White" Font-Bold="True" />
                <asp:Button ID="clear" runat="server" Text="เคลียร์" Width="100px" BackColor="#FF8000" Font-Names="Microsoft Sans Serif" ForeColor="White" Font-Bold="True" /></td>
            </tr>
            <tr height="10">
                <td colspan="4"></td>
            </tr>
            <tr height="70" bgcolor="#cccccc" align="center">
                <td colspan="4">
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
