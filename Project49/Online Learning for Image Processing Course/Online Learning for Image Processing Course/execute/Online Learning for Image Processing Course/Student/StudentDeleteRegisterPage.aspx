<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StudentDeleteRegisterPage.aspx.vb" Inherits="Student_StudentDeleteRegisterPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Student Delete Register Page</title>
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
                <td colspan="2">:: ระบบสมาชิกประเภทผู้เรียน ::</td>
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
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="userDTS">
                        <ItemTemplate>
                            คุณ 
                            <asp:Label ID="std_nameLabel" runat="server" Text='<%# Eval("std_name") %>'></asp:Label><br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr height="30" style="font-weight:bold;">
                <td colspan="2">การถอนรายวิชาที่ได้ลงทะเบียนไปแล้ว</td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr height="580">
                <td valign="top">
                    <table style="margin-top:10px;margin-bottom:10px;" width="750">
                        <tr>
                            <td><asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" Width="750" runat="server" AutoGenerateColumns="False" 
                                    OnRowDeleting="GridView1_DeleteRow" OnRowDataBound="GridView1_RowDataBound" 
                                    OnRowCommand="GridView1_RowCommand" OnRowDeleted="GridView1_RowDeleted"
                                    DataKeyNames="sub_id" DataSourceID="deleteDTS" BackColor="White" 
                                    BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                                    ForeColor="Black" GridLines="Vertical">
                                    <Columns>
                                        <asp:TemplateField HeaderText="">
                                             <ItemTemplate>
                                                <asp:ImageButton ID="ImgButt" CommandArgument='<%# Eval("sub_id") %>' CommandName="Delete" runat="server" ImageUrl="~/Image/bin.jpg" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--<asp:CommandField ButtonType="Image" DeleteImageUrl="~/Image/bin.jpg" ShowDeleteButton="True" />--%>
                                        <asp:BoundField DataField="sub_id" HeaderText="รหัสวิชา" InsertVisible="False" ReadOnly="True"
                                            SortExpression="sub_id" />
                                        <asp:BoundField DataField="sub_name" HeaderText="วิชา" SortExpression="sub_name" />
                                        <asp:BoundField DataField="sec_number" HeaderText="กลุ่ม" SortExpression="sec_number" />
                                        <asp:BoundField DataField="sec_dlearn" HeaderText="วันที่เรียน" SortExpression="sec_dlearn" />
                                        <asp:BoundField DataField="sec_tlearn" HeaderText="เวลาที่เรียน" SortExpression="sec_tlearn" />
                                        <asp:BoundField DataField="tch_name" HeaderText="ผู้สอน" SortExpression="tch_name" />
                                        <asp:BoundField DataField="sub_dexam" HeaderText="วันที่สอบ" SortExpression="sub_dexam" />
                                        <asp:BoundField DataField="sub_texam" HeaderText="เวลาที่สอบ" SortExpression="sub_texam" />
                                        <asp:BoundField DataField="sub_quantity" HeaderText="sub_quantity" SortExpression="sub_quantity" Visible="False" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" />
                                    <RowStyle BackColor="#F7F7DE" />
                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="deleteDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                                    SelectCommand="select s.sub_id, s.sub_name,ss.sec_number, ss.sec_dlearn, ss.sec_tlearn,t.tch_name, 
                                                    s.sub_dexam, s.sub_texam, s.sub_quantity
                                                    from subject s, subjectsection ss, teacher t
                                                    where s.sub_id in (
                                                    select sub_id from result where reg_id = (
                                                    select reg_id from register where ([std_id] = @std_id) and reg_year = (select max(reg_year) from register)
                                                    and reg_term = (select max(reg_term) from register where reg_year = (select max(reg_year) from register))
                                                    ))
                                                    and ss.sec_id in (
                                                    select sec_id from result where reg_id = (
                                                    select reg_id from register where ([std_id] = @std_id) and reg_year = (select max(reg_year) from register)
                                                    and reg_term = (select max(reg_term) from register where reg_year = (select max(reg_year) from register))
                                                    ))
                                                    and s.sub_id=ss.sub_id
                                                    and s.tch_id=t.tch_id">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
                                    </SelectParameters>
                                </asp:SqlDataSource>   
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Button ID="back" runat="server" Text="ย้อนกลับ" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" /></td>
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
