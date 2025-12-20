<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ShowSearch.aspx.vb" Inherits="ShowSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KMITL Library Public Access Catalog</title>
</head>
<body style="width: 98%; text-align: left;">
    <center>
        <form id="form1" runat="server">
            <div>
                <table style="width: 100%">
                    <tr>
                        <td style="text-align: center; width: 182px;" rowspan="3">
                            <strong><span style="font-size: 16pt; color: #ffcc66">Thesis Online<br />
                                KMITL</span></strong></td>
                        <td colspan="4" style="height: 20px" width="800">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:DropDownList ID="SelectList" runat="server" Width="104px">
                                <asp:ListItem>Title</asp:ListItem>
                                <asp:ListItem>Author</asp:ListItem>
                                <asp:ListItem>Subject</asp:ListItem>
                                <asp:ListItem>Call Number</asp:ListItem>
                                <asp:ListItem>ISBN/ISSN</asp:ListItem>
                                <asp:ListItem>Year</asp:ListItem>
                                <asp:ListItem Value="Other"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="WordSearch" runat="server" Width="342px" AutoPostBack="True"></asp:TextBox>
                            <asp:Button ID="Search" runat="server" Text="ค้นหา" /></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 21px" width="800">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <hr style="width: 800px;" color="#ffffff" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <hr style="background-color: teal" />
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 14px; color: red; height: 16px; background-color: teal; font-variant: normal;
                            text-align: right;" colspan="5">
                            &nbsp; &nbsp; &nbsp;ผลการค้นหาคำว่า &nbsp;
                            <asp:Label ID="textWord" runat="server" ForeColor="White"></asp:Label>
                            &nbsp; พบในหนังสือทั้งหมด &nbsp;
                            <asp:Label ID="Number" runat="server" ForeColor="White"></asp:Label>
                            &nbsp; เล่ม &nbsp; มีคำทั้งหมด &nbsp;<asp:Label ID="countword" runat="server" ForeColor="White"></asp:Label>&nbsp;
                            คำ &nbsp; &nbsp; &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <hr style="background-color: teal" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <asp:DataGrid ID="GridSearch" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                PagerStyle-Mode="NumericPages" GridLines="None" PagerStyle-PageButtonCount="10"
                                Width="100%" Font-Size="Small" ShowFooter="True" Height="22%" OnPageIndexChanged="PageIndxchanged">
                                <Columns>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <a href='Display.aspx?BookId=<%# Eval("BookId") %>'>
                                                <asp:Label ID="TitleThai" runat="server" ForeColor="RoyalBlue" Text='<%# Eval("TitleThai") %>'></asp:Label></a><br />
                                            <asp:Label ID="TitleEng" runat="server" ForeColor="Black" Text='<%# Eval("TitleEng") %>'
                                                Font-Bold="True"></asp:Label><br />
                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                            <asp:Label ID="abstract" runat="server" ForeColor="Black" Text='<%# Eval("abstract") %>'></asp:Label>
                                            <br />
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                                <PagerStyle Mode="NumericPages" HorizontalAlign="Left" />
                                <EditItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                <SelectedItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                            </asp:DataGrid>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </center>
</body>
</html>
