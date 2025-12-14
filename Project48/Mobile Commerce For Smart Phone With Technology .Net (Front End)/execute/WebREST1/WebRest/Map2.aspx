<%@ Page Language="C#" MasterPageFile="~/WebRest/MasterPage.master" AutoEventWireup="true" CodeFile="Map2.aspx.cs" Inherits="WebRest_Map" Title="WebRest MCL Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" Runat="Server">
<script language="javascript" type="text/javascript">
// <!CDATA[

function FIELDSET1_onclick() {

}

// ]]>
</script>

    <div id="TimeEntryView" runat="server">
        <div id="body">
            <div id="addhours" style="width: 363px">
 
                <fieldset style="height: 383px">
                    <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
                    <h2 class="none">Restaurant</h2>
                    <legend>Restaurant</legend>
        
                </fieldset>
            </div>
            <div id="timesheet">
                 <fieldset id="FIELDSET1" onclick="return FIELDSET1_onclick()">
                    <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
                    <h2 class="none">Map</h2>
                    <legend>Map</legend>
                    <asp:Image ID="Image1" runat="server" Height="512px" Width="512px" ImageAlign="Right" />&nbsp;
                </fieldset>
                <asp:Label ID="Labelmap" runat="server"></asp:Label></div>
            </div>
        </div>
    
    <div id="control" runat="server" >
        <div id="projectadministration">
            <fieldset>
                <br />
                <table style="width: 516px">
                    <tr>
                        <td style="width: 122px; height: 15px">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#0000C0" Text="lat"></asp:Label></td>
                        <td style="width: 100px; height: 15px">
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#0000C0" Text="long"></asp:Label></td>
                        <td style="width: 103px; height: 15px">
                        </td>
                    </tr>
                </table>
                <table style="width: 519px">
                    <tr>
                        <td style="width: 100px">
                            <asp:TextBox ID="tlat" runat="server"></asp:TextBox></td>
                        <td style="width: 100px">
                            <asp:TextBox ID="tlon" runat="server"></asp:TextBox></td>
                        <td style="width: 100px">
                            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" /></td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td style="width: 100px">
                            &nbsp;<asp:Button ID="ButtonListrest" runat="server" Text="Listrest" /></td>
                        <td style="width: 100px">
                        </td>
                        <td style="width: 100px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                            <asp:Button ID="ButtonInsert" runat="server" Height="24px" Text="Insert" Width="68px" /></td>
                        <td style="width: 100px">
                        </td>
                        <td style="width: 100px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                        </td>
                        <td style="width: 100px">
                        </td>
                        <td style="width: 100px">
                        </td>
                    </tr>
                </table>

            </fieldset>
        </div>
    </div>

</asp:Content>

