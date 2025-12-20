<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Menuadmin.aspx.vb" Inherits="Manuadmin" %>

<% 
    ' If (Session("Status") <> "A") Then
    'Response.Redirect("Login.aspx")
    ' End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body bgcolor="lightblue" style="text-align: center">
    <center>
        <form id="form1" runat="server">
            <table align="center" bgcolor="#ffffff" bordercolor="#0" width="791px">
                <tr align="center">
                    <td colspan="7" style="height: 21px">
                        <img border="0" height="101" src="Picture_Files/Head.jpg" width="785px" /></td>
                </tr>
                <tr>
                    <td colspan="7" style="height: 71px; text-align: center">
                        &nbsp;&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 318px">
                    </td>
                    <td align="right" style="width: 140px align: right">
                        <asp:LinkButton ID="ing1" runat="server" PostBackUrl="~/Default.aspx">
                        <img border="0" height="35" src="Picture_Files/xp012.bmp"/>
                        </asp:LinkButton>
                    </td>
                    <td align="left" style="width: 422px">
                        <asp:LinkButton ID="LinkButton5" runat="server" Font-Overline="False" PostBackUrl="~/Default.aspx"
                            Width="150px">[ Menu MetaData ]</asp:LinkButton></td>
                    <td style="text-align: left">
                    </td>
                </tr>
                <tr>
                    <td style="width: 318px">
                    </td>
                    <td align="right" style="width: 140px align: right">
                        <asp:LinkButton ID="img2" runat="server" Font-Overline="False" PostBackUrl="~/ShowUpLoadFile.aspx">
                        <img border="0" height="35" src="Picture_Files/cl.JPG" />
                        </asp:LinkButton>
                    </td>
                    <td align="left" style="width: 422px">
                        <asp:LinkButton ID="LinkButton4" runat="server" Font-Overline="False" PostBackUrl="~/ShowUpLoadFile.aspx"
                            Width="150px">[ Menu Up File ]</asp:LinkButton></td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td style="width: 318px">
                    </td>
                    <td align="right" style="width: 140px align: right">
                        <asp:LinkButton ID="img3" runat="server" Font-Overline="False" PostBackUrl="~/NewUser.aspx">
                        <img border="0" src="Picture_Files/edit.jpg" />
                        </asp:LinkButton>
                    </td>
                    <td align="left" style="width: 422px">
                        <asp:LinkButton ID="LinkButton3" runat="server" Font-Overline="False" PostBackUrl="~/NewUser.aspx"
                            Width="150px">[ Add User ]</asp:LinkButton></td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 318px">
                    </td>
                    <td align="right" style="width: 140px align: right">
                        <asp:LinkButton ID="img4" runat="server" Font-Overline="False" PostBackUrl="~/Index.aspx">
                        <img border="0" src="Picture_Files/xp004.bmp" />
                        </asp:LinkButton>
                    </td>
                    <td align="left" style="width: 422px">
                        <asp:LinkButton ID="LinkButton2" runat="server" Font-Overline="False" PostBackUrl="~/Index.aspx"
                            Width="150px"> [ Sign Out ]</asp:LinkButton></td>
                    <td>
                    </td>
                </tr>
                <tr height=180>
                    <td width: 318px>
                    </td>
                    <td>
                    </td>
                    <td width: 422px>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td style="width: 318px">
                    </td>
                    <td align="right">
                    </td>
                    <td align="left" style="width: 422px">
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
