<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdministratorViewReplyMB.aspx.vb" Inherits="Administrator_AdministratorViewReplyMB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Administrator View Reply Message Board For Delete</title>
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
            <tr height="10"><td colspan="2"></td></tr>
            <tr height="30" bgcolor="#ff9933" style="font-weight:bold;color:White">
                <td colspan="2">:: ระบบสมาชิกประเภทผู้ดูแลระบบ ::</td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr style="font-weight:bold">
            <td colspan="2">
                <asp:SqlDataSource ID="userDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                    SelectCommand="SELECT [adm_name] FROM [Administrator] WHERE ([adm_id] = @adm_id)">
                    <SelectParameters>
                        <asp:SessionParameter Name="adm_id" SessionField="user" Type="Int64" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="userDTS">
                    <ItemTemplate>
                        คุณ 
                        <asp:Label ID="adm_nameLabel" runat="server" Text='<%# Eval("adm_name") %>'></asp:Label><br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
        <tr height="30" style="font-weight:bold;">
            <td colspan="2">การลบข้อมูลในส่วนของการตอบกระทู้ตามรายวิชา</td>
        </tr>
        <tr height="10"><td colspan="2"></td></tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="replyMBSDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        DeleteCommand="DELETE FROM [ReplyMB] WHERE [rep_id] = @rep_id" InsertCommand="INSERT INTO [ReplyMB] ([top_id], [rep_content], [rep_writer], [rep_date]) VALUES (@top_id, @rep_content, @rep_writer, @rep_date)"
                        SelectCommand="SELECT [top_id], [rep_id], [rep_content], [rep_writer], [rep_date] FROM [ReplyMB] WHERE ([top_id] = @top_id) ORDER BY [rep_id] DESC"
                        UpdateCommand="UPDATE [ReplyMB] SET [top_id] = @top_id, [rep_content] = @rep_content, [rep_writer] = @rep_writer, [rep_date] = @rep_date WHERE [rep_id] = @rep_id">
                        <DeleteParameters>
                            <asp:Parameter Name="rep_id" Type="Int64" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="top_id" Type="Int64" />
                            <asp:Parameter Name="rep_content" Type="String" />
                            <asp:Parameter Name="rep_writer" Type="String" />
                            <asp:Parameter Name="rep_date" Type="String" />
                            <asp:Parameter Name="rep_id" Type="Int64" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="top_id" QueryStringField="top_id" Type="Int64" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="top_id" Type="Int64" />
                            <asp:Parameter Name="rep_content" Type="String" />
                            <asp:Parameter Name="rep_writer" Type="String" />
                            <asp:Parameter Name="rep_date" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" Width="750px" PageSize="20" runat="server" AutoGenerateColumns="False" CellPadding="4" 
                         OnRowDeleting="GridView1_DeleteRow" OnRowDataBound="GridView1_RowDataBound" 
                        OnRowCommand="GridView1_RowCommand" OnRowDeleted="GridView1_RowDeleted"
                        DataKeyNames="rep_id" DataSourceID="replyMBSDTS" ForeColor="#333333" GridLines="None" AllowPaging="True">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="">
                                 <ItemTemplate>
                                    <asp:ImageButton ID="ImgButt" CommandArgument='<%# Eval("rep_id") %>' CommandName="Delete" runat="server" ImageUrl="~/Image/bin.jpg" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/bin.jpg" ShowDeleteButton="True" />--%>
                            <asp:BoundField DataField="top_id" HeaderText="เลขกระทู้" SortExpression="top_id" />
                            <asp:BoundField DataField="rep_id" HeaderText="เลขตอบกระทู้" InsertVisible="False"
                                ReadOnly="True" SortExpression="rep_id" />
                            <asp:BoundField DataField="rep_content" HeaderText="ข้อความ" SortExpression="rep_content" >
                                <ItemStyle Width="400px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="rep_writer" HeaderText="ผู้ตอบกระทู้" SortExpression="rep_writer" />
                            <asp:BoundField DataField="rep_date" HeaderText="วันที่ตอบกระทู้" SortExpression="rep_date" />
                        </Columns>
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <EditRowStyle BackColor="#999999" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
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
