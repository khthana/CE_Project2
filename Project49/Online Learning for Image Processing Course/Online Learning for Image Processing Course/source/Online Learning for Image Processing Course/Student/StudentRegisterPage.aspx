<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StudentRegisterPage.aspx.vb" Inherits="Student_StudentRegisterPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Student Register Page</title>
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
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="userDTS">
                        <ItemTemplate>
                            คุณ 
                            <asp:Label ID="std_nameLabel" runat="server" Text='<%# Eval("std_name") %>'></asp:Label><br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr height="30" style="font-weight:bold">
                <td colspan="2">การลงทะเบียนรายวิชา</td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr height="580">
                <td valign="top">
                    <table style="margin-top:10px;margin-bottom:10px;" width="750">
                        <tr>
                            <td>
                                <asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="ScheduleDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                                    SelectCommand="select s.sub_id, s.sub_name, t.tch_name, ss.sec_number, ss.sec_dlearn, ss.sec_tlearn, s.sub_dexam, s.sub_texam, s.sub_quantity from subject s, teacher t, subjectsection ss where s.tch_id=t.tch_id and s.sub_id=ss.sub_id and ([sub_status] = @sub_status) order by s.sub_id">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="true" Name="sub_status" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="GridView1" Width="750px" runat="server" AutoGenerateColumns="False" DataKeyNames="sub_id"
                                    DataSourceID="ScheduleDTS" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:CheckBox ID="registerChB" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sub_id" HeaderText="รหัสวิชา" InsertVisible="False" ReadOnly="True"
                                            SortExpression="sub_id" />
                                        <asp:BoundField DataField="sub_name" HeaderText="วิชา" SortExpression="sub_name" />
                                        <asp:BoundField DataField="sec_number" HeaderText="กลุ่ม" SortExpression="sec_number" />
                                        <asp:BoundField DataField="sec_dlearn" HeaderText="วันที่เรียน" SortExpression="sec_dlearn" />
                                        <asp:BoundField DataField="sec_tlearn" HeaderText="เวลาที่เรียน" SortExpression="sec_tlearn" />
                                        <asp:BoundField DataField="tch_name" HeaderText="ผู้สอน" SortExpression="tch_name" />
                                        <asp:BoundField DataField="sub_dexam" HeaderText="วันที่สอบ" SortExpression="sub_dexam" />
                                        <asp:BoundField DataField="sub_texam" HeaderText="เวลาที่สอบ" SortExpression="sub_texam" />
                                        <asp:BoundField DataField="sub_quantity" HeaderText="จำนวนที่รับ" SortExpression="sub_quantity" Visible="false" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </EmptyDataTemplate>
                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                    <RowStyle BackColor="lightgoldenrodyellow" ForeColor="#330099" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="submit" runat="server" Text="ตกลง" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                                <asp:Button ID="back" runat="server" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif"
                                    ForeColor="White" Text="ย้อนกลับ" Width="90px" /></td>
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
