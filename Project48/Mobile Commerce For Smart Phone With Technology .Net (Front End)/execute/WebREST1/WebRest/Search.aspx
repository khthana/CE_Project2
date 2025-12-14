<%@ Page Language="C#" MasterPageFile="~/WebRest/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="WebRest_Search" Title="WebRest MCL Project" %>
<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" Runat="Server">       
       <div id="adminedit" runat="server" >
        <div id="body">
            <div id="addhours">
                <a name="content_start" id="content_start"></a>
                <fieldset>
                 <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
         <h2 class="none">Search</h2>
         <legend>Search</legend>
       <table>
           <tr>
               <td style="width: 40px; height: 51px">
               </td>
               <td style="width: 150px; height: 51px">
               <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
               </td>
               <td style="width: 50px; height: 51px">
               <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
               </td>
               <td style="width: 100px; height: 51px">
                   &nbsp;</td>
           </tr>
       </table>
                </fieldset>
                &nbsp;<br />
                <br />
                <br />
                <br />
               <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Labeltoken" runat="server"></asp:Label></div>
            <div id="timesheet">
                <fieldset>
       <table style="width: 100%; height: 100%;">
           <tr>
               <td style="width: 100%; height: 100%">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateSelectButton="True"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Width="100%" >
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" BorderStyle="Dotted" />
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
    <div id="MessageView" runat="server" visible="false">
        <div id="projectadministration">
            <fieldset>

            </fieldset>
        </div>
    </div>
</asp:Content>

