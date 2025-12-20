<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DetailWB.aspx.vb" Inherits="DetailWB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Detail Webboard</title>
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
            <tr height="150">
                <td colspan="2" width="800" height="150"><img src="Image/colorfull.jpg" border="0px" width="800" height="150" /></td>
            </tr>
            <tr height="10">
                <td></td>
            </tr>
            <tr bgcolor="#00cc00" style="font-weight:bold;color:White" height="20">
                <td>:: กระดานสนทนา ::</td>
            </tr>
            <tr height="10">
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="TopicWebboardDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT * FROM [TopicWB] WHERE ([top_id] = @top_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="top_id" QueryStringField="top_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" CellPadding="2" DataKeyField="top_id" DataSourceID="TopicWebboardDTS" ForeColor="Black" BackColor="PaleGoldenrod" BorderColor="Tan" BorderWidth="1px">
                        <FooterStyle BackColor="Tan" />
                        <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <ItemTemplate>
                            <table width="750">
                                <tr align="center">
                                    <td colspan="2" bgcolor="PaleGoldenrod" style="font-weight:bold;">หัวข้อ : 
                                        <asp:Label ID="top_nameLabel" runat="server" Text='<%# Eval("top_name") %>'></asp:Label></font>
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td rowspan="3" valign="top" width="150" bgcolor="LightGoldenrodYellow">
                                        <img src="Image/member_icon.jpg" align="middle" width="20" height="20" border="0" />
                                        <asp:Label ID="top_idLabel" runat="server" Text='<%# Eval("top_id") %>'></asp:Label>
                                        <br /><br />
                                         <img src="Image/general_icon.jpg" align="middle" width="20" height="20" border="0" />
                                        <asp:Label ID="top_writerLabel" runat="server" Text='<%# Eval("top_writer") %>'></asp:Label>                                     
                                    </td>
                                    <td align="right" bgcolor="LightGoldenrodYellow">วัน/เดือน/ปี : 
                                        <asp:Label ID="top_dateLabel" runat="server" Text='<%# Eval("top_date") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr style="text-align:justify" height="100">
                                    <td bgcolor="#ffffff"><asp:Label ID="top_contentLabel" runat="server" Text='<%# Eval("top_content") %>'></asp:Label></td>
                                </tr>
                                <tr align="right">
                                    <td bgcolor="LightGoldenrodYellow">E - Mail : 
                                        <asp:Label ID="top_emailLabel" runat="server" Text='<%# Eval("top_email") %>'></asp:Label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IP : <asp:Label ID="top_ipLabel" runat="server" Text='<%# Eval("top_ip") %>'></asp:Label>
                                    </td>
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
            <tr>
                <td>
                    <asp:SqlDataSource ID="ReplyWebboardDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT * FROM [ReplyWB] WHERE ([top_id] = @top_id) ORDER BY [rep_id] DESC">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="top_id" QueryStringField="top_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList2" runat="server" CellPadding="2" DataKeyField="rep_id" DataSourceID="ReplyWebboardDTS" BackColor="#DCDCDC" BorderColor="Tan" BorderWidth="1px" ForeColor="Black">
                        <FooterStyle BackColor="Tan" />
                        <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <ItemTemplate>
                            <table width="750">
                                <tr align="center">
                                    <td bgcolor="#EEEEEE" rowspan="3" valign="top" width="150" ><img src="Image/lamp3.jpg" align="middle" width="20" height="20" border="0" />
                                        <asp:Label ID="rep_idLabel" runat="server" Text='<%# Eval("rep_id") %>'></asp:Label>
                                        <br /><br />
                                        <img src="Image/general_icon.jpg" align="middle" width="20" height="20" border="0" />
                                        <asp:Label ID="rep_writerLabel" runat="server" Text='<%# Eval("rep_writer") %>'></asp:Label>
                                    </td>
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
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
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
                <td style="width: 420px"><asp:TextBox ID="replywriter" MaxLength="45" runat="server" Width="400px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="writerRFV" runat="server" ControlToValidate="replywriter" Display="Dynamic" ValidationGroup="replysystem" ErrorMessage="กรุณาใส่ชื่อผู้ตอบกระทู้"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="writerREV" runat="server" ControlToValidate="replywriter" ValidationExpression="[^']+" Display="Dynamic" ValidationGroup="replysystem" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" Width="140px"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr align="center">
                <td style="width: 100px"></td>
                <td>E - Mail</td>
                <td style="width: 420px"><asp:TextBox ID="replyemail" MaxLength="45" runat="server" Width="400px"></asp:TextBox></td>
                <td>
                    <asp:RegularExpressionValidator ID="replyemailREV" runat="server" ControlToValidate="replyemail"
                        Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                        ValidationGroup="replysystem" Width="140px"></asp:RegularExpressionValidator></td>
            </tr>
            <tr align="center">
                <td style="width: 100px"></td>
                <td>ข้อความ</td>
                <td style="width: 420px"><asp:TextBox ID="replycontent" MaxLength="990" runat="server" Width="400px" Height="100" TextMode="MultiLine"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="contentRFV" runat="server" ControlToValidate="replycontent" Display="Dynamic" ValidationGroup="replysystem" ErrorMessage="กรุณาใส่ข้อความ"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="contentREV" runat="server" ControlToValidate="replycontent" ValidationExpression="[^']+" Display="Dynamic" ValidationGroup="replysystem" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr align="center">
                <td colspan="4"><asp:Label ID="Warning" runat="server" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr align="center">
                <td colspan="4"><asp:Button ID="send" runat="server" Text="ส่งข้อความ" Width="120px" BackColor="#FF8000" Font-Names="Microsoft Sans Serif" ForeColor="White" Font-Bold="True" ValidationGroup="replysystem" />
                <asp:Button ID="clear" runat="server" Text="เคลียร์" Width="120px" BackColor="#FF8000" Font-Names="Microsoft Sans Serif" ForeColor="White" Font-Bold="True" /></td>
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
