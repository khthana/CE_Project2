<%@ Page Language="C#" MasterPageFile="~/WebRest/MasterPage.master" AutoEventWireup="true" CodeFile="map.aspx.cs" Inherits="WebRest_map" Title="WebRest MCL Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" Runat="Server">
<script language="javascript" type="text/javascript">
// <!CDATA[

function LEGEND1_onclick() {

}

// ]]>
</script>

    <table style="width: 100%">
        <tr>
            <td  valign="top" style="width: 250px; height: 150px;">
                <div id="addhours" style="left: 0px; width: 250px; top: 0px; height: 150px;">
                    <fieldset style="width: 80%">
                        <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
                        <h2 class="none">
                            Map</h2>
                        <legend id="LEGEND1" onclick="return LEGEND1_onclick()">Position</legend>
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
                                    Latitude :</td>
                                <td style="width: 100px">
                                    <asp:Label ID="LabelLat" runat="server"></asp:Label></td>
                                <td style="width: 40px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 40px">
                                    Longtitude :</td>
                                <td style="width: 100px">
                                    <asp:Label ID="LabelLon" runat="server"></asp:Label></td>
                                <td style="width: 40px">
                                </td>
                            </tr>
                        </table>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></fieldset>
                </div>
                </td>
            <td valign="top" rowspan="2">
                <div id="timesheet" title="Map" style="width: 550px; height: 550px"><br />
                    <fieldset title="Map" style="vertical-align: middle; text-align: center">
                    <legend id="LEGEND2" onclick="return LEGEND1_onclick()">Position</legend>
                        <br />
                        <asp:ImageMap ID="ImageMap1" runat="server" Height="512px" Width="512px" HotSpotMode="Navigate" OnClick="ImageMap1_Click">
                        </asp:ImageMap><br />
                    </fieldset>
                </div>
            </td>
        </tr>
        <tr>
                    <td  valign="top" style="width: 250px">
                <div id="timesheet" style="width: 250px; height: 400px;">
                    &nbsp;&nbsp;<br />
                    <fieldset>
                        <br />
                        <asp:GridView ID="GridRest" runat="server" AllowPaging="True" AutoGenerateSelectButton="True"
                            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="0px" CellPadding="2"
                            GridLines="Horizontal"
                            PageSize="4" Width="100%" AutoGenerateColumns="False" OnSelectedIndexChanged="GridRest_SelectedIndexChanged">
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <RowStyle BorderStyle="None" CssClass="row1" />
                            <SelectedRowStyle BackColor="#738A9C" BorderStyle="Dotted" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <HeaderStyle CssClass="grid-header" HorizontalAlign="Left" />
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Restaurant" />
                                <asp:BoundField DataField="Type" HeaderText="Type" />
                            </Columns>
                        </asp:GridView>
                        &nbsp;
                        <asp:GridView ID="GridPlace" runat="server" AllowPaging="True" AutoGenerateSelectButton="True"
                            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="0px" CellPadding="2"
                            GridLines="Horizontal"
                            PageSize="4" Width="100%" AutoGenerateColumns="False" OnSelectedIndexChanged="GridPlace_SelectedIndexChanged">
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <RowStyle BorderStyle="None" CssClass="row1" />
                            <SelectedRowStyle BackColor="#738A9C" BorderStyle="Dotted" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <HeaderStyle CssClass="grid-header" HorizontalAlign="Left" />
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>
                                <asp:BoundField DataField="name" HeaderText="Place" />
                                <asp:BoundField DataField="type" HeaderText="Type" />
                            </Columns>
                        </asp:GridView>
                        <br />
                        <asp:GridView ID="GridBuilding" runat="server" AllowPaging="True" AutoGenerateSelectButton="True"
                            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="0px" CellPadding="2"
                            GridLines="Horizontal"
                            PageSize="4" Width="100%" AutoGenerateColumns="False" OnSelectedIndexChanged="GridBuilding_SelectedIndexChanged">
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <RowStyle BorderStyle="None" CssClass="row1" />
                            <SelectedRowStyle BackColor="#738A9C" BorderStyle="Dotted" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <HeaderStyle CssClass="grid-header" HorizontalAlign="Left" />
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>
                                <asp:BoundField DataField="name" HeaderText="Building Name" />
                            </Columns>
                        </asp:GridView>
                    </fieldset>
                </div>
                </td>
        </tr>
    </table>
</asp:Content>

