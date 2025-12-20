<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StudentMessageBoardDetail.aspx.vb" Inherits="Student_StudentMessageBoardDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Student Message Board Detail</title>
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
            <tr height="10"><td></td></tr>
            <tr height="30" bgcolor="#ff9933" style="font-weight:bold;color:White">
                <td colspan="2">
                    :: ระบบสมาชิกประเภทผู้เรียน ::</td>
            </tr>
            <tr height="10"><td></td></tr>
            <tr style="font-weight:bold">
                <td colspan="2">
                    <asp:SqlDataSource ID="userDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                        SelectCommand="SELECT [std_name] FROM [Student] WHERE ([std_id] = @std_id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList3" runat="server" DataSourceID="userDTS">
                        <ItemTemplate>
                            คุณ 
                            <asp:Label ID="std_nameLabel" runat="server" Text='<%# Eval("std_name") %>'></asp:Label><br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr height="30" style="font-weight:bold">
                <td colspan="2">รายละเอียดของกระทู้</td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr>
                <td valign="top">
                    <asp:SqlDataSource ID="topicDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT [top_id], [top_name], [top_writer], [top_date], [top_email], [top_content], [top_ip], [sub_id] FROM [TopicMB] WHERE ([top_id] = @top_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="top_id" QueryStringField="top_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="replyDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT * FROM [ReplyMB] WHERE ([top_id] = @top_id) order by rep_id desc">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="top_id" QueryStringField="top_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="top_id" DataSourceID="topicDTS" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                        <ItemTemplate>
                            <table width="750">
                                <tr align="center">
                                    <td colspan="2">
                                        หัวข้อ : <asp:Label ID="top_nameLabel" runat="server" Text='<%# Eval("top_name") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr align="center" bgcolor="#F7F7F7">
                                    <td rowspan="3" width="150" valign="top">
                                        <img src="../Image/snowflake3.jpg" width="30" height="30" border="0" align="middle" />
                                        <asp:Label ID="top_idLabel" runat="server" Text='<%# Eval("top_id") %>'></asp:Label>
                                        <br /><br />
                                        <img src="../Image/general_icon.jpg" width="30" height="30" border="0" align="middle" />
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("top_writer") %>'></asp:Label>
                                    </td>
                                    <td align="right">
                                        วัน/เดือน/ปี ที่ประกาศ : <asp:Label ID="top_dateLabel" runat="server" Text='<%# Eval("top_date") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr height="100" style="text-align:justify" bgcolor="white">
                                    <td><asp:Label ID="top_contentLabel" runat="server" Text='<%# Eval("top_content") %>'></asp:Label></td>
                                </tr>
                                <tr bgcolor="#F7F7F7">
                                    <td align="right">E-Mail : <asp:Label ID="top_emailLabel" runat="server" Text='<%# Eval("top_email") %>'></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IP : <asp:Label ID="top_ipLabel" runat="server" Text='<%# Eval("top_ip") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <AlternatingItemStyle BackColor="#E7E7FF" />
                        <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    </asp:DataList>
                    <br />
                    <br />
                    <asp:DataList ID="DataList2" runat="server" BackColor="#DCDCDC" BorderColor="#999999"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyField="rep_id" DataSourceID="replyDTS" GridLines="Vertical">
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                            <table width="750">
                                <tr bgcolor="#EEEEEE">
                                    <td rowspan="3" width="150" valign="top">
                                        <img src="../Image/snowflake4.jpg" width="30" height="30" border="0" align="middle" />
                                        <asp:Label ID="rep_idLabel" runat="server" Text='<%# Eval("rep_id") %>'></asp:Label>
                                        <br /><br />
                                        <img src="../Image/general_icon.jpg" width="30" height="30" border="0" align="middle" />
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("rep_writer") %>'></asp:Label>
                                    </td>
                                    <td align="right">
                                        วัน/เดือน/ปี ที่ประกาศ : <asp:Label ID="rep_dateLabel" runat="server" Text='<%# Eval("rep_date") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr height="100" style="text-align:justify" bgcolor="white">
                                    <td>
                                        <asp:Label ID="rep_contentLabel" runat="server" Text='<%# Eval("rep_content") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr bgcolor="#EEEEEE">
                                    <td align="right">E-Mail : <asp:Label ID="rep_emailLabel" runat="server" Text='<%# Eval("rep_email") %>'></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IP : <asp:Label ID="rep_ipLabel" runat="server" Text='<%# Eval("rep_ip") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                        <AlternatingItemStyle BackColor="#DCDCDC" />
                        <ItemStyle BackColor="#DCDCDC" ForeColor="Black" />
                    </asp:DataList>
                </td>
            </tr>
            <tr height="10"><td></td></tr>
            <tr>
                <td>
                    <table align="center" width="550" bgcolor="white">
                        <tr bgcolor="#ff9933" style="font-weight:bold;color:White" height="20">
                            <td colspan="2">
                                :: ตอบกระทู้ ::</td>
                        </tr>
                        <tr height="10"><td colspan="2"></td></tr>
                        <tr>
                            <td width="150">ชื่อผู้ตอบกระทู้</td>
                            <td width="400"><asp:TextBox ID="replywriter" runat="server" Width="400px" MaxLength="45"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="writerRFV" runat="server" ControlToValidate="replywriter" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ชื่อผู้ตอบกระทู้" ValidationGroup="replysystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="writerREV" runat="server" ControlToValidate="replywriter" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="replysystem"
                                Width="140px"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>E - Mail</td>
                            <td><asp:TextBox ID="replyemail" runat="server" Width="400px" MaxLength="45"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="replyemailREV" runat="server" ControlToValidate="replyemail"
                                    Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                                    ValidationGroup="replysystem" Width="140px"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>ข้อความ</td>
                            <td><asp:TextBox ID="replycontent" runat="server" Width="400px" Height="100" TextMode="MultiLine" MaxLength="990"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="contentRFV" runat="server" ControlToValidate="replycontent" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ข้อความ" ValidationGroup="replysystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="contentREV" runat="server" ControlToValidate="replycontent" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="replysystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td colspan="2"><asp:Label ID="Warning" runat="server" ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2"><asp:Button ID="send" runat="server" Text="ส่งข้อความ" ValidationGroup="replysystem" Width="120px" BackColor="#FF8000" Font-Names="Microsoft Sans Serif" ForeColor="White" Font-Bold="True" />
                            <asp:Button ID="clear" runat="server" Text="เคลียร์" Width="120px" BackColor="#FF8000" Font-Names="Microsoft Sans Serif" ForeColor="White" Font-Bold="True" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
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
