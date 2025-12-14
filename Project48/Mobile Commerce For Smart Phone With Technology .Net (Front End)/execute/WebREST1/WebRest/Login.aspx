<%@ Page Language="C#" MasterPageFile="~/WebRest/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="WebRest_Login" Title="WebRest MCL Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" Runat="Server">
    <div id="TimeEntryView" runat="server" >
        <div id="body">
            &nbsp;<table width="100%">
                <tr>
                    <td style="width: 95px" valign="top">
                <div id="addhours" style="left: 0px; width: 400px; top: 0px">
 
                <fieldset style="width: 235px">
                    <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
                    <h2 class="none">User Login</h2>
                    <legend>User Login</legend>
                <table>
                <tr>
                    <td style="width: 100px; height: 34px">
                     <asp:Label ID="LabelName" runat="server" >UserName</asp:Label>
                    </td>
                    <td style="width: 262px; height: 34px">
                    <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 36570px; height: 34px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 36px">
                    <asp:Label ID="LabelPassword" runat="server">Password</asp:Label>
                    </td>
                    <td style="width: 262px; height: 36px">
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td style="width: 36570px; height: 36px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 65px">
                    </td>
                    <td style="width: 262px; height: 65px">
                    <asp:Button ID="ButtonLogin" runat="server" Height="36px" OnClick="ButtonLogin_Click"
                Text="Button"
                Width="107px" />
                    </td>
                    <td style="width: 36570px; height: 65px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 38px">
                    </td>
                    <td style="width: 262px; height: 38px">
                    <asp:Label ID="LabelToken" runat="server" ></asp:Label>
                        <br />
                        <br />
                        <asp:HyperLink ID="User_Create" runat="server" NavigateUrl="~/WebRest/User_Create.aspx">Create new user</asp:HyperLink></td>
                    <td style="width: 36570px; height: 38px">
                        </td>
                </tr>
            </table>

           
                </fieldset>
               
                <br />
                
                <fieldset style="width: 234px">
                    <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
                    <h2 class="none">Profile</h2>
                    <legend>Profile</legend>
                    <table>
                        <tr>
                            <td style="width: 48px">
                            </td>
                            <td style="width: 100px">
                            </td>
                            <td style="width: 26px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 48px">
                            </td>
                            <td style="width: 100px">
                        <asp:Label ID="Labelgetprofile" runat="server"></asp:Label></td>
                            <td style="width: 26px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 48px">
                            </td>
                            <td style="width: 100px">
                            </td>
                            <td style="width: 26px">
                            </td>
                        </tr>
                    </table>
                </fieldset>
                
                
                
            </div>
                    </td>
                    <td style="width: 100px" valign="top">
            <div id="timesheet">
                <fieldset style="width: 100%">
                    <br /><asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateSelectButton="True"
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="0" CellPadding="2" PageSize="25" GridLines="Horizontal" Width="100%" >
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <RowStyle cssClass="row1" BorderStyle="None" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" BorderStyle="Dotted" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <HeaderStyle cssClass="grid-header" HorizontalAlign="Left" />
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                    </asp:GridView>
                    <br />
             
                </fieldset>
                <br />
                <fieldset>
                    <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
                    <h2 class="none">Search</h2>
                    <legend>Search</legend>
                    <br />
                    <table style="width: 335px">
                        <tr>
                            <td style="width: 100px; height: 19px;">
                            </td>
                            <td align="center" style="width: 75px; height: 19px;">
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                            <td style="width: 62px; height: 19px;">
                                <asp:Button ID="Button1" runat="server" Text="search" OnClick="Button1_Click" /></td>
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
                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateSelectButton="True"
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="0" CellPadding="2" PageSize="25" GridLines="Horizontal" Width="100%" >
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle cssClass="row1" BorderStyle="None" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" BorderStyle="Dotted" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <HeaderStyle cssClass="grid-header" HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    </asp:GridView>
                </fieldset>
                
            </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="MessageView" runat="server" >
        <div id="projectadministration">
            <fieldset>

            </fieldset>
        </div>
    </div>   

</asp:Content>

