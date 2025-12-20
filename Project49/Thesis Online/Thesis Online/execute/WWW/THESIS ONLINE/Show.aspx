<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Show.aspx.vb" Inherits="_Default" %>

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
    <title>ระบบสืบค้นวิทยานิพนธ์ แสดงข้อมูลวิทยานิพนธ์</title>
</head>
<body style="text-align: center" bgcolor="lightblue">
    <center>
        <form id="form1" runat="server">
            <table style="width: 888px; vertical-align: top;" bgcolor="#ffffff" height="600">
                <tr>
                    <td colspan="3" style="text-align: center">
                        <asp:Image ID="Image1" runat="server" Width="888px" Height="101" ImageUrl="~/Picture_Files/Head.jpg" /></td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center">
                        <table style="border-right: black thin solid; table-layout: fixed; border-top: black thin solid;
                            vertical-align: middle; border-left: black thin solid; width: 100%; border-bottom: black thin solid;
                            border-collapse: collapse; text-align: center">
                            <tr>
                                <td bgcolor="#ff3300" style="width: 124px; height: 21px">
                                </td>
                                <td bgcolor="#ff3300" style="width: 161px; height: 21px">
                                    <img height="10" src="./Picture_Files/P27.GIF" width="10" /><asp:HyperLink ID="HyperLink1"
                                        runat="server" Font-Bold="True" Font-Size="Smaller" Font-Strikeout="False" ForeColor="Black"
                                        NavigateUrl="~/Default.aspx" Width="99px">[ Menu ]</asp:HyperLink></td>
                                <td bgcolor="#ff3300" style="width: 153px; height: 21px">
                                    <img height="10" src="./Picture_Files/P27.GIF" width="10" />
                                    <asp:HyperLink ID="HyperLink5" runat="server" Font-Bold="True" Font-Size="Smaller"
                                        Font-Strikeout="False" ForeColor="Black" NavigateUrl="~/Inputdata.aspx" Width="112px">[ New MetaData ]</asp:HyperLink></td>
                                <td bgcolor="#ff3300" style="width: 156px; height: 21px">
                                    &nbsp;<img height="10" src="./Picture_Files/P27.GIF" width="10" />
                                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Size="Smaller"
                                        Font-Strikeout="False" ForeColor="Black" NavigateUrl="~/MainManu.aspx" Width="135px">[ Data Option ]</asp:HyperLink></td>
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
                <tr style="font-size: 12pt">
                    <td colspan="3" style="text-align: center; height: 59px;">
                    </td>
                </tr>
                <tr style="font-size: 12pt">
                    <td colspan="3" style="text-align: center; height: 25px;">
                        <asp:DropDownList ID="DegreeLevel" runat="server" AutoPostBack="True" Width="132px">
                            <asp:ListItem Selected="True">&lt;&lt;ระดับปริญญา&gt;&gt;</asp:ListItem>
                            <asp:ListItem>ปริญญาตรี</asp:ListItem>
                            <asp:ListItem>ปริญญาโท</asp:ListItem>
                            <asp:ListItem>ปริญญาเอก</asp:ListItem>
                        </asp:DropDownList>&nbsp;<asp:DropDownList ID="FacultyList" runat="server" DataTextField="FACULTY_THAI"
                            Width="150px" AutoPostBack="True">
                            <asp:ListItem>&lt;&lt;คณะวิชา&gt;&gt;</asp:ListItem>
                        </asp:DropDownList>&nbsp;<asp:DropDownList ID="DepartmentThai" runat="server" AutoPostBack="True"
                            DataTextField="DEPARTMENT_THAI" Width="150px">
                            <asp:ListItem>&lt;&lt;ภาควิชา&gt;&gt;</asp:ListItem>
                        </asp:DropDownList>&nbsp;<asp:DropDownList ID="DesciptionThai" runat="server" AutoPostBack="True"
                            DataTextField="DESCIPTION_THAI" Width="150px">
                            <asp:ListItem Selected="True">&lt;&lt;สาขาวิชา&gt;&gt;</asp:ListItem>
                        </asp:DropDownList>&nbsp;<asp:DropDownList ID="YareListsh" runat="server" AutoPostBack="True"
                            Width="70px">
                            <asp:ListItem>&lt;&lt;ปี&gt;&gt;</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp; &nbsp;<asp:Button ID="Button1" runat="server" Text="แสดงข้อมูล" />
                        &nbsp;&nbsp;
                    </td>
                </tr>
                <tr style="font-size: 12pt">
                    <td colspan="3" style="height: 16px; text-align: center">
                    </td>
                </tr>
                <tr style="font-size: 12pt">
                    <td colspan="3" style="height: 10px; text-align: center">
                        <asp:DropDownList ID="SelectList" runat="server" Width="104px">
                            <asp:ListItem>Title</asp:ListItem>
                            <asp:ListItem>Subject</asp:ListItem>
                            <asp:ListItem>Call Number</asp:ListItem>
                            <asp:ListItem>ISBN/ISSN</asp:ListItem>
                            <asp:ListItem>Year</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="TextSearch" runat="server" Width="284px" AutoPostBack="True"></asp:TextBox>
                        <asp:Button ID="Search" runat="server" Text="Search" Width="75px" /></td>
                </tr>
                <tr style="font-size: 12pt">
                    <td colspan="3" style="height: 48px; text-align: right">
                    </td>
                </tr>
                <tr style="font-size: 12pt">
                    <td colspan="3" style="height: 322px; text-align: center; vertical-align: top;">
                        <asp:DataGrid ID="Datagrid1" runat="server" Width="100%" CellPadding="4" Font-Names="verdana"
                            Font-Size="Smaller" HeaderStyle-BackColor="#99cccc" DataKeyField="Book_id" 
                            
                            OnDeleteCommand="Datagrid1_deleteCommand"
                            OnEditCommand="DataGrid1_EditCommand"
                            OnItemDataBound="DataGrid1_ItemDataBound"                            
                            OnPageIndexChanged="PageIndxchanged" 
                            AllowPaging="True"
                            AllowSorting="True" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None"
                            DataMember="DefaultView" Height="19px">
                            <Columns>
                                <asp:ButtonColumn Text="Delete" CommandName="Delete" />
                                <asp:ButtonColumn Text="Edit" CommandName="Edit" />
                                <asp:BoundColumn DataField="CALL_NUMBER" HeaderText="เลขหนังสือ" SortExpression="CALL_NUMBER">
                                    <ItemStyle Width="86px" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="TITLE_THAI" HeaderText="เรื่อง" SortExpression="TITLE_THAI">
                                    <ItemStyle Width="180px" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="DEGREE_LAVEL" HeaderText="ระดับปริญญา" SortExpression="DEGREE_LAVEL">
                                    <ItemStyle Width="100px" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="FACULTY_THAI" HeaderText="คณะวิชา" SortExpression="FACULTY_THAI">
                                    <ItemStyle Width="150px" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="DEPARTMENT_THAI" HeaderText="ภาควิชา" SortExpression="DEPARTMENT_THAI">
                                    <ItemStyle Width="150px" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="DESCIPTION_THAI" HeaderText="สาขาวิชา" SortExpression="DESCIPTION_THAI">
                                    <ItemStyle Width="150px" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="YEAYCREATED_THAI" HeaderText="ปี" SortExpression="YEAYCREATED_THAI">
                                    <ItemStyle Width="30px" />
                                </asp:BoundColumn>
                            </Columns>
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditItemStyle BackColor="#2461BF" />
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#2461BF" ForeColor="Red" HorizontalAlign="Left" Font-Bold="True"
                                Font-Italic="False" Font-Names="Verdana" Font-Overline="False" Font-Size="Small"
                                Font-Strikeout="False" Font-Underline="False" Mode="NumericPages" VerticalAlign="Middle" />
                            <AlternatingItemStyle BackColor="White" />
                            <ItemStyle BackColor="#EFF3FB" />
                        </asp:DataGrid>
                        &nbsp;&nbsp;
                    </td>
                </tr>
                <tr style="font-size: 12pt">
                    <td style="height: 5px">
                    </td>
                    <td style="height: 5px" align="center">
                        <asp:Button ID="CutWordBt" runat="server" Text="ตัดคำ" Width="76px" /></td>
                    <td style="height: 5px">
                    </td>
                </tr>
                <tr style="font-size: 12pt">
                    <td style="height: 2px">
                    </td>
                    <td style="height: 2px">
                    </td>
                    <td style="height: 2px">
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
