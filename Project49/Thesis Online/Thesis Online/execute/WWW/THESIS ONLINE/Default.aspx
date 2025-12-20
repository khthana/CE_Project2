<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<% 
    If Session("Status") <> "K" Then
        If (Session("Status") <> "A") Then
            Response.Redirect("Login.aspx")
        End If
    End If
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="text/VBScript" http-equiv="content-script-type" />
    <title>Menu Edit</title>
    <link href="App_Code/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="lightblue">

    <form id="form1" runat="server">
        <div style="text-align: center">
        <center>
            <table bgcolor="#ffffff" style="width: 791px" bordercolor="#0">
                <tr>
                    <td colspan="5">
                    </td>
                </tr>
                <tr>
                    <td colspan="5" style="height: 21px">
                                <img border="0" src="Picture_Files/Head.jpg" width="785px" height="101"></td>
                </tr>
                <tr>
                    <td colspan="5" style="height: 71px; text-align: center">
                        &nbsp;&nbsp;</td>
                </tr>
                <tr>
                    <td width="45%">
                    </td>
                    <td height="40" style="text-align: left" colspan="4">
                                            <img border="0" src="Picture_Files/xp012.bmp" width="31" height="35"><asp:LinkButton ID="LinkButton5" runat="server" Font-Overline="False" PostBackUrl="~/Show.aspx" > [ Show Data, Edit ]</asp:LinkButton></td>
                </tr>
                <tr>
                    <td width="45%">
                    </td>
                    <td height="40" style="text-align: left" colspan="4">
                                            <img border="0" src="Picture_Files/cl.JPG" width="31" height="35"><asp:LinkButton ID="LinkButton4" runat="server" Font-Overline="False" PostBackUrl="~/Inputdata.aspx" > [ New MetaData ]</asp:LinkButton></td>
                </tr>
                <tr>
                    <td width="45%">
                    </td>
                    <td colspan="4" height="40" style="text-align: left">
                                        <img border="0" src="Picture_Files/edit.jpg" style="width: 29px; height: 34px"><asp:LinkButton ID="LinkButton3" runat="server" Font-Overline="False" PostBackUrl="~/MainManu.aspx" >[ Data Option ]</asp:LinkButton></td>
                </tr>
                <tr>
                    <td width="45%">
                    </td>
                    <td height="40" style="text-align: left" colspan="4">
                                        <img border="0" src="Picture_Files/xp004.bmp" style="width: 27px; height: 30px"><asp:LinkButton ID="LinkButton2" runat="server" Font-Overline="False" PostBackUrl="~/Index.aspx"> [ Sign Out ]</asp:LinkButton></td>
                </tr>
                <tr>
                    <td style="width: 194px; height: 198px">
                    </td>
                    <td colspan="4" style="height: 198px">
                    </td>
                </tr>
            </table>
            </center>
        </div>
    </form>
</body>
</html>
