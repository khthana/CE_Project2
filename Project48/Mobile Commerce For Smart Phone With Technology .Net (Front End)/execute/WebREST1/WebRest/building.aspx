<%@ Page Language="C#" MasterPageFile="~/WebRest/MasterPage.master" AutoEventWireup="true" CodeFile="building.aspx.cs" Inherits="WebRest_building" Title="WebRest MCL Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" Runat="Server">
    &nbsp;
    <table>
        <tr>
            <td style="width: 100px; height: 15px">
    <div id="timesheet">
        &nbsp;<fieldset style="width: 403px; height: 446px">
            <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
            <h2 class="none">
                Building Map</h2>
            <legend>Map</legend>
            <table id="TABLE1" onclick="return TABLE1_onclick()" style="height: 106px">
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="Label5" runat="server" Text="Name" Width="39px"></asp:Label>
                        </td>
                    <td style="width: 190px">
                        <asp:Label ID="namerest" runat="server" Height="12px" Width="25px"></asp:Label></td>
                </tr>
                <tr>
                    <td align="left" style="width: 100px; height: 62px" valign="top">
                        <asp:Label ID="Label6" runat="server" Text="ID"></asp:Label><br />
                        <br />
                        <br />
                        &nbsp;
                    </td>
                    <td style="width: 190px; height: 62px">
                        <asp:Label ID="DesAddr" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td align="left" style="width: 100px; height: 17px" valign="top">
                        Latitude</td>
                    <td style="width: 190px; height: 17px">
                        <asp:Label ID="Deslat" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td align="left" style="width: 100px; height: 16px" valign="top">
                        Longitude</td>
                    <td style="width: 190px; height: 16px">
                        <asp:Label ID="Deslon" runat="server"></asp:Label></td>
                </tr>
            </table>
            <br />
            <br />
            <asp:ImageMap ID="ImageMap1" runat="server">
            </asp:ImageMap></fieldset>
    </div>
            </td>
            <td style="width: 100px; height: 15px">
                <div id="addhours" style="left: 0px; width: 250px; top: 0px">
                    <fieldset>
                        <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
                        <h2 class="none" style="width: 200px">
                            Floors</h2>
                        <legend>List</legend>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        </asp:GridView>
                    </fieldset>
                    &nbsp;<br />
                </div>
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
            </td>
            <td style="width: 100px">
            </td>
        </tr>
    </table>
</asp:Content>

