<%@ Page Language="C#" MasterPageFile="~/WebRest/MasterPage.master" AutoEventWireup="true" CodeFile="Restaurant.aspx.cs" Inherits="WebRest_Restaurant" Title="WebRest MCL Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" Runat="Server">
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
                            <asp:Button ID="Button3" runat="server" Text="Booking" OnClick="Button3_Click" />
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
                &nbsp;<fieldset style="width: 403px; height: 446px">
                    <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
                    <h2 class="none">
                        Booking Form</h2>
                    <legend>Booking</legend>
                    <table id="TABLE1" onclick="return TABLE1_onclick()" style="height: 106px">
                        <tr>
                            <td style="width: 100px">
                                <asp:Label ID="Label5" runat="server" Text="Date" Width="39px"></asp:Label></td>
                            <td style="width: 190px">
                                <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged">
                                </asp:Calendar>
                            </td>
                            <td style="width: 190px">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 100px; height: 62px" valign="middle">
                                <asp:Label ID="Label6" runat="server" Text="Time"></asp:Label></td>
                            <td style="width: 190px; height: 62px">
                                &nbsp;&nbsp;
                                <asp:DropDownList ID="drophour" runat="server">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                    <asp:ListItem>13</asp:ListItem>
                                    <asp:ListItem>14</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>16</asp:ListItem>
                                    <asp:ListItem>17</asp:ListItem>
                                    <asp:ListItem>18</asp:ListItem>
                                    <asp:ListItem>19</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>21</asp:ListItem>
                                    <asp:ListItem>22</asp:ListItem>
                                    <asp:ListItem>23</asp:ListItem>
                                    <asp:ListItem>24</asp:ListItem>
                                </asp:DropDownList>
                                &nbsp;
                                <asp:DropDownList ID="dropminute" runat="server">
                                    <asp:ListItem>0</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>45</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width: 190px; height: 62px">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 100px; height: 62px" valign="middle">
                                &nbsp;<asp:Label ID="Label10" runat="server" Text="Duration"></asp:Label></td>
                            <td style="width: 190px; height: 62px">
                                &nbsp;&nbsp;
                                <asp:DropDownList ID="Dropduration" runat="server">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width: 190px; height: 62px">
                                <asp:Label ID="Label11" runat="server" Text="Hours"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                &nbsp;<asp:Label ID="Label8" runat="server" Text="Covers"></asp:Label></td>
                            <td style="width: 190px">
                                &nbsp;&nbsp;
                                <asp:DropDownList ID="DropCover" runat="server">
                                    <asp:ListItem>0</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="width: 190px">
                                <asp:Label ID="Label9" runat="server" Text="Person"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                </td>
                            <td style="width: 190px">
                                </td>
                            <td style="width: 190px">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Send Booking" /></td>
                            <td colspan="1">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="Result" runat="server"></asp:Label></td>
                            <td colspan="1">
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </fieldset>
            </div>
        </div>
    </div>
 
</asp:Content>

