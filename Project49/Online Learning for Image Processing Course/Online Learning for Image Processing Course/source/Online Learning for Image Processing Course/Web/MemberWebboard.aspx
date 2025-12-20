<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MemberWebboard.aspx.vb" Inherits="MemberWebboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Member Webboard</title>
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
                <td>
                    <asp:LinkButton ID="LinkButton1" runat="server"><img src="Image/newtopic.jpg" align="middle" border="0" /></asp:LinkButton>&nbsp;&nbsp;&nbsp;
                    ค้นหาตามชื่อกระทู้ &nbsp;
                    <asp:TextBox ID="keyword" runat="server"></asp:TextBox>
                    <asp:Button ID="search" runat="server" Text="ค้นหา" ValidationGroup="searchsystem" BackColor="#FF8000" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="100px" Font-Bold="True" />
                    <asp:RequiredFieldValidator ID="keywordRFV" runat="server" ControlToValidate="keyword" Display="Dynamic"
                        ErrorMessage="กรุณาใส่คำหลัก" ValidationGroup="searchsystem"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="keywordREV" runat="server" ControlToValidate="keyword" Display="Dynamic"
                        ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="searchsystem"
                        Width="140px"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <table visible="false" id="newtopictable" runat="server" align="center" width="550">
                        <tr>
                            <td width="150">ชื่อผู้ตั้งกระทู้</td>
                            <td width="400"><asp:TextBox ID="name" runat="server" Width="400" MaxLength="45"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="posterRFV" runat="server" ControlToValidate="name" Display="Dynamic" ErrorMessage="กรุณาใส่ชื่อผู้ตอบกระทู้"
                                    ValidationGroup="postsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="posterREV" runat="server" ControlToValidate="name" Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')"
                                ValidationExpression="[^']+" ValidationGroup="postsystem" Width="140px"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>E - Mail</td>
                            <td><asp:TextBox ID="email" runat="server" Width="400" MaxLength="45"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="emailREV" runat="server" ControlToValidate="email"
                                    Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+"
                                    ValidationGroup="postsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td>ชื่อหัวข้อกระทู้</td>
                            <td><asp:TextBox ID="topic" runat="server" Width="400" MaxLength="45"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="topicRFV" runat="server" ControlToValidate="topic" Display="Dynamic" ErrorMessage="กรุณาใส่ชื่อหัวข้อกระทู้"
                                    ValidationGroup="postsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="topicREV" runat="server" ControlToValidate="topic" Display="Dynamic" ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')"
                                ValidationExpression="[^']+" ValidationGroup="postsystem" Width="140px"></asp:RegularExpressionValidator></td>
                        </tr>                            
                        <tr>
                            <td>ข้อความ</td>
                            <td><asp:TextBox ID="content" runat="server" Width="400" Height="100" TextMode="MultiLine" MaxLength="990"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                    ID="contentRFV" runat="server" ControlToValidate="content" Display="Dynamic"
                                    ErrorMessage="กรุณาใส่ข้อความ" ValidationGroup="postsystem"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="contentREV" runat="server" ControlToValidate="content" Display="Dynamic"
                                ErrorMessage="กรุณาใช้เครื่องหมายอื่นแทน(')" ValidationExpression="[^']+" ValidationGroup="postsystem"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                            <td colspan="2"><asp:Label ID="Warning" runat="server" ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2"><asp:Button ID="send" runat="server" Text="ส่งข้อความ" ValidationGroup="postsystem" Width="100px" BackColor="#FF8000" Font-Names="Microsoft Sans Serif" ForeColor="White" Font-Bold="True" />
                                <asp:Button ID="clear" runat="server" Text="เคลียร์" Width="100px" BackColor="#FF8000" Font-Names="Microsoft Sans Serif" ForeColor="White" Font-Bold="True" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr height="10">
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="TopicWebboardDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT * FROM [TopicWB] WHERE ([top_type] = @top_type) ORDER BY [top_id] desc">
                        <SelectParameters>
                            <asp:SessionParameter Name="top_type" SessionField="member" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" Width="800px" runat="server" AllowPaging="True" PageSize="20" AutoGenerateColumns="False"
                        CellPadding="4" DataSourceID="TopicWebboardDTS" ForeColor="#333333"
                        GridLines="None">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="top_id" HeaderText="เลขกระทู้" InsertVisible="False" ReadOnly="True"
                                SortExpression="top_id" >
                                <ControlStyle Width="100px" />
                            </asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="top_id" DataNavigateUrlFormatString="MemberDetailWebboard.aspx?top_id={0}"
                                DataTextField="top_name" HeaderText="หัวข้อกระทู้" Target="_blank" >
                                <ControlStyle Width="300px" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="top_writer" HeaderText="ผู้ตั้งกระทู้" SortExpression="top_writer" >
                                <ControlStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="top_nreplier" HeaderText="จำนวนผู้ตอบกระทู้" SortExpression="top_nreplier" >
                                <ControlStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="top_nreader" HeaderText="จำนวนผู้อ่านกระทู้" SortExpression="top_nreader" >
                                <ControlStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="top_type" HeaderText="top_type" SortExpression="top_type"
                                Visible="False" />
                            <asp:BoundField DataField="top_name" HeaderText="top_name" SortExpression="top_name"
                                Visible="False" />
                            <asp:BoundField DataField="top_date" HeaderText="top_date" SortExpression="top_date"
                                Visible="False" />
                            <asp:BoundField DataField="top_email" HeaderText="top_email" SortExpression="top_email"
                                Visible="False" />
                            <asp:BoundField DataField="top_content" HeaderText="top_content" SortExpression="top_content"
                                Visible="False" />
                            <asp:BoundField DataField="top_ip" HeaderText="top_ip" SortExpression="top_ip" Visible="False" />
                        </Columns>
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr height="10">
                <td></td>
            </tr>
            <tr>
                <td><asp:Button ID="back" runat="server" Text="กลับไปสู่หน้าแรก" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" /></td>
            </tr>
            <tr height="10">
                <td></td>
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
