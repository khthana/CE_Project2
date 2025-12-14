<%@ Page Language="C#" MasterPageFile="~/WebRest/MasterPage.master" AutoEventWireup="true" CodeFile="Promotion.aspx.cs" Inherits="WebRest_Promotion" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" Runat="Server">
<script language="javascript" type="text/javascript">
// <!CDATA[

function TABLE1_onclick() {

}

// ]]>
</script>

     <div id="TimeEntryView" runat="server">
        <div id="body">
            <div id="addhours">
                 <fieldset>
                            <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
                            <h2 class="none">Restaurant   
                            </h2>
                            <legend>Restaurant</legend>
                     <table>
                         <tr>
                             <td style="width: 100px; height: 18px">
                                 <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="RoyalBlue"
                                     Text="Rest Name" Width="70px"></asp:Label></td>
                             <td style="width: 100px; height: 18px">
                                        <asp:Label ID="Labelnamerest" runat="server"></asp:Label></td>
                         </tr>
                     </table>
                     <br />
                     <table>
                         <tr>
                             <td style="width: 72px">
                                 <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="RoyalBlue"
                                     Text="Tel." Width="70px"></asp:Label></td>
                             <td style="width: 100px">
                                 <asp:Label ID="Labeltelrest" runat="server"></asp:Label></td>
                         </tr>
                     </table>
                    <br />
                    <table>
                        <tr>
                            <td style="width: 182px; height: 126px">
                            <asp:Image ID="Image1" runat="server" Height="128px" Width="159px" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td style="width: 100px">
                            <asp:Button ID="Button1" runat="server" Text="Menu" OnClick="Button1_Click" />
                            </td>
                            <td style="width: 100px">
                            <asp:Button ID="Button2" runat="server" Text="Promotion" OnClick="Button2_Click" />
                            </td>
                            <td style="width: 100px">
                            <asp:Button ID="Button3" runat="server" Text="Booking" OnClick="Button3_Click1" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table>
                        <tr>
                            <td style="width: 220px">
                            <asp:Label ID="Labelmap" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                     <br />
                     <table>
                         <tr>
                             <td style="width: 23px">
                                 <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="#0000C0"
                                     Text="Address" Width="69px"></asp:Label></td>
                             <td style="width: 164px">
                             </td>
                         </tr>
                     </table>
                     <table>
                         <tr>
                             <td style="width: 212px">
                                 <asp:Label ID="Labelrestaddress" runat="server" Width="214px"></asp:Label></td>
                         </tr>
                     </table>
                     <table>
                         <tr>
                             <td style="width: 64px; height: 18px">
                                 <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="#0000C0"
                                     Text="Zone" Width="69px"></asp:Label></td>
                             <td style="width: 100px; height: 18px">
                                 <asp:Label ID="Labelrestzone" runat="server"></asp:Label></td>
                         </tr>
                     </table>
        
                </fieldset>
            </div>
            <div id="timesheet">
                <fieldset style="width: 403px; height: 446px">
                 <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
                            <h2 class="none">Promotion List</h2>
                            <legend>Promotion List</legend>
                    <br />
                    <table style="width: 300px; height: 76px">
                        <tr>
                            <td style="width: 100px">
                                <asp:GridView ID="GridViewPrem" runat="server" BackColor="White" BorderColor="#E7E7FF"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnSelectedIndexChanged="GridViewPrem_SelectedIndexChanged" Height="143px" Width="293px">
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                    </asp:GridView>
                            </td>
                        </tr>
                    </table>
             
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>

