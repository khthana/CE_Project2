<%@ Page Language="C#" MasterPageFile="~/WebRest/MasterPage.master" AutoEventWireup="true" CodeFile="User_Create.aspx.cs" Inherits="WebRest_User_Create" Title="WebRest MCL Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" Runat="Server">
<div id="adminedit">
        <fieldset>
            <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
            <h2 class="none">Create Member User</h2>
            <legend>Create Member User</legend>
            <table>
                <tr>
                    <td style="width: 100px; height: 33px">
                        <asp:Label ID="LabelName" runat="server" Text="Name"></asp:Label></td>
                    <td style="width: 219px; height: 33px">
                        <asp:TextBox ID="TextBoxgName" runat="server"></asp:TextBox></td>
                    <td style="width: 100px; height: 33px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 24px">
                        <asp:Label ID="LabelAddress" runat="server" Text="Address"></asp:Label></td>
                    <td style="width: 219px; height: 24px">
                        <asp:TextBox ID="TextBoxgAddress" runat="server"></asp:TextBox></td>
                    <td style="width: 100px; height: 24px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 25px">
                        <asp:Label ID="LabelTelephone" runat="server" Text="Telephone"></asp:Label></td>
                    <td style="width: 219px; height: 25px">
                        <asp:TextBox ID="TextBoxgTelephone" runat="server"></asp:TextBox></td>
                    <td style="width: 100px; height: 25px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 26px">
                        <asp:Label ID="LabelIdentitycard" runat="server" Text="Identitycard"></asp:Label></td>
                    <td style="width: 219px; height: 26px">
                        <asp:TextBox ID="TextBoxgIdentitycard" runat="server"></asp:TextBox></td>
                    <td style="width: 100px; height: 26px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 26px">
                        <asp:Label ID="LabelUsername" runat="server" Text="Username"></asp:Label></td>
                    <td style="width: 219px; height: 26px">
                        <asp:TextBox ID="TextBoxgUsername" runat="server"></asp:TextBox></td>
                    <td style="width: 100px; height: 26px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 26px">
                        <asp:Label ID="LabelPassword" runat="server" Text="Password"></asp:Label></td>
                    <td style="width: 219px; height: 26px">
                        <asp:TextBox ID="TextBoxgPassword" runat="server"></asp:TextBox></td>
                    <td style="width: 100px; height: 26px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px; height: 27px">
                    </td>
                    <td style="width: 219px; height: 27px">
                        <asp:Button ID="ButtonCreate" runat="server" Text="Create" OnClick="ButtonCreate_Click" /></td>
                    <td style="width: 100px; height: 27px">
                    </td>
                </tr>
            </table>
            <asp:Label ID="Labelcreate" runat="server" Text=""></asp:Label></fieldset>
    </div>
</asp:Content>

