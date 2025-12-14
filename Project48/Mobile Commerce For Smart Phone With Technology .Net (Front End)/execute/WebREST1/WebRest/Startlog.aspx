<%@ Page Language="C#" MasterPageFile="~/WebRest/MasterPage.master" AutoEventWireup="true" CodeFile="Startlog.aspx.cs" Inherits="WebRest_Startlog" Title="WebRest MCL Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" Runat="Server">
    <div id="TimeEntryView" runat="server">
        <div id="body">
            <div id="addhours">
 
                <fieldset>
                    <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
                    <h2 class="none">User Login</h2>
                    <legend>User Login</legend>
                <table>
                <tr>
                    <td style="width: 100px; height: 34px">
                     <asp:Label ID="LabelName" runat="server" >UserName</asp:Label>
                    </td>
                    <td style="width: 285px; height: 34px">
                    <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 100px; height: 34px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 36px">
                    <asp:Label ID="LabelPassword" runat="server">Password</asp:Label>
                    </td>
                    <td style="width: 285px; height: 36px">
                    <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                    <td style="width: 100px; height: 36px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 65px">
                    </td>
                    <td style="width: 285px; height: 65px">
                    <asp:Button ID="ButtonLogin" runat="server" Height="36px" OnClick="ButtonLogin_Click"
                Text="Button"
                Width="107px" />
                    </td>
                    <td style="width: 100px; height: 65px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 38px">
                    </td>
                    <td style="width: 285px; height: 38px">
                    <asp:Label ID="LabelToken" runat="server" ></asp:Label>
                        <br />
                        <br />
                        <asp:HyperLink ID="User_Create" runat="server" NavigateUrl="~/WebRest/User_Create.aspx">Create new user</asp:HyperLink></td>
                    <td style="width: 100px; height: 38px">
                        <asp:Label ID="Labelgetprofile" runat="server"></asp:Label></td>
                </tr>
            </table>

           
                </fieldset>
                &nbsp;<br />
                
                
                
            </div>
            <div id="timesheet">
                &nbsp;<br />
                <br />
                
            </div>
        </div>
    </div>
    <div id="MessageView" runat="server" >
        <div id="projectadministration">
            <fieldset>

            </fieldset>
        </div>
    </div>
</asp:Content>

