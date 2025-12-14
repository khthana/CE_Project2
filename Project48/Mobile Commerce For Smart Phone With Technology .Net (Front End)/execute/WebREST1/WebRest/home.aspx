<%@ Page Language="C#" MasterPageFile="~/WebRest/MasterPage.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="WebRest_home" Title="WebRest MCL Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" Runat="Server">
    <table style="width: 100%">
        <tr>
            <td style="width: 250px" valign="top">
                <div id="addhours" style="width: 250px; left: 0px; top: 0px;">
                    <fieldset>
                        <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
                        <h2 class="none" style="width: 200px">User Login</h2>
                        <legend>User Login</legend>
                        <table style="width: 200px">
                            <tr>
                                <td>
                                    <asp:Label ID="LabelName" runat="server">UserName</asp:Label>
                                </td>
                                <td style="width: 172px">
                                    <asp:TextBox ID="TextBoxUsername" runat="server" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LabelPassword" runat="server">Password</asp:Label>
                                </td>
                                <td style="width: 172px">
                                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" Width="100px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td style="width: 172px">
                                    <asp:Button ID="ButtonLogin" runat="server" Height="36px" OnClick="ButtonLogin_Click"
                                        Text="Login" Width="107px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td style="width: 172px">
                                    <asp:Label ID="LabelToken" runat="server"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:HyperLink ID="User_Create" runat="server" NavigateUrl="~/WebRest/User_Create.aspx">Create new user</asp:HyperLink></td>
                            </tr>
                        </table>
                    </fieldset>
                    <br />
                    <fieldset style="width: 200px">
                        <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
                        <h2 class="none">
                            Profile</h2>
                        <legend>Profile</legend>
                        <table>
                            <tr>
                                <td style="width: 40px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 40px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 40px">
                                </td>
                                <td style="width: 100px">
                                    <asp:Label ID="Labelgetprofile" runat="server"></asp:Label></td>
                                <td style="width: 40px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 40px">
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 40px">
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </div>
            </td>
            <td>
                <div id="timesheet">
                    &nbsp;<fieldset>
                        <legend>Booked List</legend>
                        <br />
                        <br /><asp:GridView ID="GridView2" runat="server" AllowPaging="True"
                            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="0px" CellPadding="2"
                            GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <RowStyle BorderStyle="None" CssClass="row1" />
                            <SelectedRowStyle BackColor="#738A9C" BorderStyle="Dotted" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <HeaderStyle CssClass="grid-header" HorizontalAlign="Left" />
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                        </asp:GridView>
                    </fieldset>
                    <br />
                    <fieldset>
                        <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
                        <h2 class="none">
                            Search</h2>
                        <legend>Search</legend>
                        <br />
                        <table style="width: 335px">
                            <tr>
                                <td style="width: 100px; height: 19px">
                                </td>
                                <td align="center" style="width: 75px; height: 19px">
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                <td style="width: 62px; height: 19px">
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="search" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 75px">
                                </td>
                                <td style="width: 62px">
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <br />
                    <fieldset>
                     <legend>Search List</legend>
                        <br />
                        <br />
                        <asp:GridView ID="GridRest" runat="server" AllowPaging="True" AutoGenerateSelectButton="True"
                            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="0" CellPadding="2"
                            GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <RowStyle BorderStyle="None" CssClass="row1" />
                            <SelectedRowStyle BackColor="#738A9C" BorderStyle="Dotted" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <HeaderStyle CssClass="grid-header" HorizontalAlign="Left" />
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                        </asp:GridView><asp:GridView ID="GridPlace" runat="server" AllowPaging="True" AutoGenerateSelectButton="True"
                            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="0" CellPadding="2"
                            GridLines="Horizontal"  Width="100%" OnSelectedIndexChanged="GridPlace_SelectedIndexChanged">
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <RowStyle BorderStyle="None" CssClass="row1" />
                            <SelectedRowStyle BackColor="#738A9C" BorderStyle="Dotted" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <HeaderStyle CssClass="grid-header" HorizontalAlign="Left" />
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                        </asp:GridView>
                        <asp:GridView ID="GridBuilding" runat="server" AllowPaging="True" AutoGenerateSelectButton="True"
                            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="0" CellPadding="2"
                            GridLines="Horizontal" Width="100%" OnSelectedIndexChanged="GridBuilding_SelectedIndexChanged">
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <RowStyle BorderStyle="None" CssClass="row1" />
                            <SelectedRowStyle BackColor="#738A9C" BorderStyle="Dotted" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <HeaderStyle CssClass="grid-header" HorizontalAlign="Left" />
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                        </asp:GridView>
                    </fieldset>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

