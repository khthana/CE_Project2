<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LearningSchedule.aspx.vb" Inherits="LearningSchedule" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Learning Schedule</title>
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
            <tr height="10"><td></td></tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="YearTermDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT [cal_year], [cal_term] FROM [LearningCalendar] WHERE cal_year = (SELECT MAX(cal_year) FROM [LearningCalendar]) AND cal_term = (SELECT MAX(cal_term) FROM [LearningCalendar] WHERE cal_year = (SELECT MAX(cal_year) FROM [LearningCalendar]))">
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList2" runat="server" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="0px" CellPadding="0" DataSourceID="YearTermDTS"
                        GridLines="Both">
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                            <table width="800" bgcolor="#00cc00" style="color:White;font-weight:bold">
                                <tr align="center">
                                    <td>:: ตารางการศึกษา ::</td>
                                </tr>
                                <tr align="center">
                                    <td>ปีการศึกษา 
                                        <asp:Label ID="cal_yearLabel" runat="server" Text='<%# Eval("cal_year") %>'></asp:Label>
                                        &nbsp; ภาคการศึกษาที่
                                        <asp:Label ID="cal_termLabel" runat="server" Text='<%# Eval("cal_term") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <ItemStyle ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    </asp:DataList>
                </td>
            </tr>
            <tr height="10"><td></td></tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="ScheduleDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="select s.sub_id, s.sub_name, t.tch_name, ss.sec_number, ss.sec_dlearn, ss.sec_tlearn, s.sub_dexam, s.sub_texam, s.sub_quantity from subject s, teacher t, subjectsection ss where s.tch_id=t.tch_id and s.sub_id=ss.sub_id and ([sub_status] = @sub_status) order by s.sub_id">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="true" Name="sub_status" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="sub_id" DataSourceID="ScheduleDTS" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="0px" CellPadding="0" GridLines="Both">
                        <HeaderTemplate>
                            <table width="800" bgcolor="#ff9933">
                                <tr>
                                    <td width="50" align="center">รหัสวิชา</td>
                                    <td width="200" align="center">วิชา</td>
                                    <td width="100" align="center">อาจารย์ผู้สอน</td>
                                    <td width="50" align="center">กลุ่มที่</td>
                                    <td width="90" align="center">วันที่เรียน</td>
                                    <td width="100" align="center">เวลาที่เรียน</td>
                                    <td width="90" align="center">วันที่สอบ</td>
                                    <td width="100" align="center">เวลาที่สอบ</td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table width="800" bgcolor="lightgoldenrodyellow">
                                <tr>
                                    <td width="50" align="center"><asp:Label ID="sub_idLabel" runat="server" Text='<%# Eval("sub_id") %>'></asp:Label></td>
                                    <td width="200" align="center"><asp:Label ID="sub_nameLabel" runat="server" Text='<%# Eval("sub_name") %>'></asp:Label></td>
                                    <td width="100" align="center"><asp:Label ID="tch_nameLabel" runat="server" Text='<%# Eval("tch_name") %>'></asp:Label></td>
                                    <td width="50" align="center"><asp:Label ID="sec_numberLabel" runat="server" Text='<%# Eval("sec_number") %>'></asp:Label></td>
                                    <td width="90" align="center"><asp:Label ID="sec_dlearnLabel" runat="server" Text='<%# Eval("sec_dlearn") %>'></asp:Label></td>
                                    <td width="100" align="center"><asp:Label ID="sec_tlearnLabel" runat="server" Text='<%# Eval("sec_tlearn") %>'></asp:Label></td>
                                    <td width="90" align="center"><asp:Label ID="sub_dexamLabel" runat="server" Text='<%# Eval("sub_dexam") %>'></asp:Label></td>
                                    <td width="100" align="center"><asp:Label ID="sub_texamLabel" runat="server" Text='<%# Eval("sub_texam") %>'></asp:Label></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <ItemStyle ForeColor="#000066" />
                        <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="White" />
                    </asp:DataList>
                </td>
            </tr>
            <tr height="10"><td></td></tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="quantityDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="select sub_id, sub_name, sub_quantity from subject where ([sub_status] = @sub_status) order by sub_id">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="true" Name="sub_status" Type="Boolean" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="quantityDTS" AutoGenerateColumns="False" DataKeyNames="sub_id">
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <Columns>
                            <asp:BoundField DataField="sub_id" HeaderText="รหัส" InsertVisible="False" ReadOnly="True"
                                SortExpression="sub_id" />
                            <asp:BoundField DataField="sub_name" HeaderText="วิชา" SortExpression="sub_name" />
                            <asp:BoundField DataField="sub_quantity" HeaderText="จำนวนที่รับ" SortExpression="sub_quantity" />
                            <asp:BoundField DataField="tch_name" HeaderText="tch_name" SortExpression="tch_name"
                                Visible="False" />
                            <asp:BoundField DataField="sec_number" HeaderText="sec_number" SortExpression="sec_number"
                                Visible="False" />
                            <asp:BoundField DataField="sec_dlearn" HeaderText="sec_dlearn" SortExpression="sec_dlearn"
                                Visible="False" />
                            <asp:BoundField DataField="sec_tlearn" HeaderText="sec_tlearn" SortExpression="sec_tlearn"
                                Visible="False" />
                            <asp:BoundField DataField="sub_dexam" HeaderText="sub_dexam" SortExpression="sub_dexam"
                                Visible="False" />
                            <asp:BoundField DataField="sub_texam" HeaderText="sub_texam" SortExpression="sub_texam"
                                Visible="False" />
                        </Columns>
                        <RowStyle BackColor="White" ForeColor="#330099" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFff" />
                    </asp:GridView>
                </td>
            </tr>
            <%--<tr height="10"><td></td></tr>
            <tr><td>หมายเหตุ : วิชาใดๆจะรับผู้เรียนได้ตามจำนวนที่ระบุไว้ โดยจำนวนของผู้เรียนทุกกลุ่มรวมกันจะไม่เกินตามจำนวนที่ระบุไว้</td></tr>--%>
            <tr height="10"><td></td></tr>
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
