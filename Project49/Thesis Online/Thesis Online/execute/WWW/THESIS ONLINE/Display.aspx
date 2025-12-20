<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Display.aspx.vb" Inherits="Display" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Display</title>
</head>
<body bgcolor="lightblue">
    <center>
        <form id="form1" runat="server">
            <div style="text-align: center">
                <table bgcolor="#ffffff" bordercolor="0" style="width: 100%">
                    <tr>
                        <td colspan="1" style="width: 54px">
                        </td>
                        <td colspan="6" style="vertical-align: top; width: 125px; color: blue; height: 20px;
                            text-align: left; font-variant: normal">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7" style="height: 21px">
                            <img border="0" height="101" src="Picture_Files/Head.jpg" width="616" /></td>
                    </tr>
                    <tr>
                        <td colspan="1" style="width: 54px; height: 21px">
                        </td>
                        <td colspan="6" style="height: 20px; vertical-align: top; width: 125px; color: blue;
                            text-align: left; font-variant: normal;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1" style="width: 54px; height: 19px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; color: blue; height: 19px; text-align: left;
                            font-variant: normal; vertical-align: top;">
                            <strong><span style="color: #004000">Digital Object Files:</span></strong></td>
                        <td colspan="5" rowspan="3" style="width: 641px; text-align: left">
                            <asp:DataGrid ID="GridSearch" runat="server" AutoGenerateColumns="False" Font-Size="Small"
                                GridLines="None" Height="1%" PagerStyle-Mode="NumericPages" PagerStyle-PageButtonCount="10"
                                PageSize="15" Width="100%" ShowHeader="False">
                                <EditItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                <SelectedItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                <PagerStyle HorizontalAlign="Left" Mode="NumericPages" />
                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                <Columns>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" Height="11px" ImageUrl="~/Picture_Files/arrowgreenright.gif"
                                                Width="11px" />
                                            <a href='<%# Eval("LinkId") %><%# Eval("FileId") %>' target="_blank" hreflang="th"
                                                style="cursor: hand;" type="text/asp">
                                                <asp:Label ID="Filexml" Font-Underline="false" runat="server" ForeColor="RoyalBlue"
                                                    Width="144px"><%# Eval("FileId") %></asp:Label></a><br />
                                            <br />
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                            </asp:DataGrid>
                            <asp:LinkButton runat=server ID=linkxml Width="28px" >
                            <img id="IMG1" runat="server" src="Picture_Files/xml.gif" />
                            </asp:LinkButton>
                            </td>
                            
                    </tr>
                    <tr>
                        <td colspan="1" style="width: 54px; text-align: center; height: 37px;" rowspan="2">
                        </td>
                        <td colspan="1" style="vertical-align: top; width: 175px; color: blue; text-align: left;
                            font-variant: normal; height: 37px;" rowspan="2">
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; color: blue; text-align: left; font-variant: normal;
                            vertical-align: top; height: 20px;">
                            <strong><span style="color: #004000">Title: </span></strong>
                        </td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <asp:Label ID="Label1" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="1" style="width: 54px; height: 5px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; height: 20px; text-align: left; color: blue;
                            font-variant: normal; vertical-align: top;">
                            <strong><span style="color: #004000">Title Alternative:</span></strong></td>
                        <td colspan="5" style="height: 5px; text-align: left; width: 641px;">
                            <asp:Label ID="Label2" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; height: 20px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; height: 20px; text-align: left; color: blue;
                            font-variant: normal; vertical-align: top;">
                            <strong><span style="color: #004000">Creator:&nbsp;</span></strong></td>
                        <td colspan="5" style="width: 641px; height: 20px; text-align: left">
                            <em><span style="color: #660000">Name:</span></em>
                            <asp:Label ID="Label3" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; height: 20px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; height: 20px; text-align: left; color: blue;
                            font-variant: normal; vertical-align: top;">
                            <strong><span style="color: #004000">Subject: &nbsp;</span></strong></td>
                        <td colspan="5" style="width: 641px; height: 20px; text-align: left">
                            <em><span style="color: #660000">ThaSH:</span></em>
                            <asp:Label ID="Label4" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; height: 20px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; color: blue; height: 20px; text-align: left;
                            font-variant: normal; vertical-align: top;">
                        </td>
                        <td colspan="5" style="width: 641px; height: 20px; text-align: left">
                            <em><span style="color: #660000">Others:</span></em>
                            <asp:Label ID="Label5" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; height: 20px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; color: blue; height: 20px; text-align: left;
                            font-variant: normal; vertical-align: top;">
                            <strong><span style="color: #004000">Description:</span></strong></td>
                        <td colspan="5" style="width: 641px; height: 20px; text-align: left">
                            Abstract:
                            <asp:Label ID="Label6" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label><br />
                            <br />
                            Abstract :<asp:Label ID="Label7" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; height: 20px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; height: 20px; text-align: left; color: blue;
                            font-variant: normal; vertical-align: top;">
                            <strong><span style="color: #004000">Contributor: &nbsp;</span></strong></td>
                        <td colspan="5" style="width: 641px; height: 20px; text-align: left">
                            <em><span style="color: #660000">Name:</span></em>
                            <asp:Label ID="Label8" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; height: 20px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; height: 20px; text-align: left; color: blue;
                            font-variant: normal; vertical-align: top;">
                        </td>
                        <td colspan="5" style="font-size: 12pt; width: 641px; height: 20px; text-align: left">
                            <em><span style="color: #660000">Roles:</span></em>
                            <asp:Label ID="Label9" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; color: blue; font-variant: normal;
                            vertical-align: top; height: 20px;">
                        </td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <em><span style="color: #660000">E-Mail:</span></em>
                            <asp:Label ID="Label10" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; height: 20px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; height: 20px; text-align: left; color: blue;
                            font-variant: normal; vertical-align: top;">
                            <strong><span style="color: #004000">Publisher:</span></strong></td>
                        <td colspan="5" style="height: 20px; text-align: left; width: 641px;">
                            <em><span style="color: #660000">Name:</span></em>
                            <asp:Label ID="Label11" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                        </td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <em><span style="color: #660000">Address:</span></em>
                            <asp:Label ID="Label12" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                        </td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <em><span style="color: #660000">E-Mail:</span></em>
                            <asp:Label ID="Label13" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                            <strong><span style="color: #004000">Date Created: &nbsp;</span></strong></td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <asp:Label ID="Label14" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                            <strong><span style="color: #004000">Date Modify:&nbsp;</span></strong></td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <asp:Label ID="Label15" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                            <strong><span style="color: #004000">Type:</span></strong></td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <asp:Label ID="Label16" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                            <strong><span style="color: #004000">Format:&nbsp;</span></strong></td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <asp:Label ID="Label17" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                            <strong><span style="color: #004000">Identifier: &nbsp;</span></strong></td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <em><span style="color: #660000">URL:</span></em>
                            <asp:Label ID="Label18" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                        </td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <em><span style="color: #660000">ISBN:</span></em>
                            <asp:Label ID="Label19" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                            <strong><span style="color: #004000">Source: &nbsp;</span></strong></td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <em><span style="color: #660000">Call Number:</span></em>
                            <asp:Label ID="Label20" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                            <strong><span style="color: #004000">Language: &nbsp;</span></strong></td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <asp:Label ID="Label21" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                            <strong><span style="color: #004000">Thesis:&nbsp;</span></strong></td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <em><span style="color: #660000">Degree Name:</span></em>
                            <asp:Label ID="Label22" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center; height: 22px;">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 22px; font-variant: normal;">
                        </td>
                        <td colspan="5" style="width: 641px; text-align: left; height: 22px;">
                            <em><span style="color: #660000">Degree Level:</span></em>
                            <asp:Label ID="Label23" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                        </td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <em><span style="color: #660000">Degree Descipline:</span></em>
                            <asp:Label ID="Label24" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                        </td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <em><span style="color: #660000">Degree Grantor:</span></em>
                            <asp:Label ID="Label25" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                            <strong><span style="color: #004000">Right:&nbsp;</span></strong></td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <em><span style="color: #660000">©Copyrights :</span></em>
                            <asp:Label ID="Label26" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                        </td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            <em><span style="color: #660000">Rights Access:</span></em>
                            <asp:Label ID="Label27" runat="server" Font-Names="Verdana" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                        </td>
                        <td colspan="5" style="width: 641px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                        </td>
                        <td colspan="5" style="width: 641px; text-align: left">
                            &nbsp;</td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                        </td>
                        <td colspan="5" style="width: 641px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                        </td>
                        <td colspan="5" style="width: 641px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="1" style="width: 54px; text-align: center">
                        </td>
                        <td colspan="1" style="width: 175px; text-align: left; vertical-align: top; color: blue;
                            height: 20px; font-variant: normal;">
                        </td>
                        <td colspan="5" style="width: 641px; text-align: left">
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </center>
</body>
</html>
