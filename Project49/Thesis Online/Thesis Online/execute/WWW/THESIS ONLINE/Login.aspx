<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login"
    Culture="th-TH" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta content="text/VBScript" http-equiv="content-script-type" />
    <title>Untitled Page</title>
    <link href="App_Code/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="text-align: center; font-family: Times New Roman; font-size: 12pt;"
    bgcolor="lightblue">
    <form id="form1" runat="server">
        <div style="text-align: center">
            <center>
                <table bgcolor="#ffffff" style="width: 765px">
                    <tr>
                        <td colspan="5">
                            <img border="0" src="./Picture_Files/Head.jpg" width="785px" height="101"></td>
                    </tr>
                    <tr>
                        <td bgcolor="#006785" colspan="4" style="height: 24px">
                            <center>
                                <span style="color: #ffffff; font-family: Verdana;"><strong>Log In</strong></span>
                            </center>
                        </td>
                        <td style="height: 24px; width: 3px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 99px; height: 111px">
                        </td>
                        <td style="width: 407px; height: 111px">
                        </td>
                        <td style="width: 4px; height: 111px">
                        </td>
                        <td style="width: 515px; height: 111px">
                        </td>
                        <td style="height: 111px; width: 3px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 99px; height: 21px">
                        </td>
                        <td style="width: 407px; height: 21px; text-align: right">
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Font-Size="Smaller"
                                ForeColor="Red" Width="70px" Font-Bold="True" Font-Names="Verdana">User Name  :  </asp:Label></td>
                        <td style="width: 4px; height: 21px">
                        </td>
                        <td style="width: 515px; height: 21px; text-align: left">
                            <asp:TextBox ID="UserName" runat="server" Width="160px"></asp:TextBox><asp:RequiredFieldValidator
                                ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required."
                                ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator></td>
                        <td style="height: 21px; width: 3px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 99px; height: 19px">
                        </td>
                        <td style="width: 407px; height: 19px; text-align: right">
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Font-Size="Smaller"
                                ForeColor="Red" Width="428px" Font-Bold="True" Font-Names="Verdana">Password  : </asp:Label></td>
                        <td style="width: 4px; height: 19px">
                            &nbsp;</td>
                        <td style="width: 515px; height: 19px; text-align: left">
                            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="160px"></asp:TextBox><asp:RequiredFieldValidator
                                ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required."
                                ToolTip="Password is required." ValidationGroup="Login1" Width="1px">*</asp:RequiredFieldValidator></td>
                        <td style="height: 19px; width: 3px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 99px; height: 21px">
                        </td>
                        <td style="width: 407px; height: 21px; text-align: right">
                        </td>
                        <td style="width: 4px; height: 21px">
                        </td>
                        <td style="width: 515px; height: 21px">
                        </td>
                        <td style="height: 21px; width: 3px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 99px; height: 21px">
                        </td>
                        <td colspan="3" style="height: 21px">
                            <center>
                                &nbsp;</center>
                        </td>
                        <td style="height: 21px; width: 3px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 99px; height: 21px">
                        </td>
                        <td colspan="3" style="font-size: small; color: red; height: 21px">
                            <center><asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></center></td>
                        <td style="height: 21px; width: 3px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 99px; height: 21px">
                        </td>
                        <td style="width: 407px; height: 21px; text-align: right">
                        </td>
                        <td style="width: 4px; height: 21px; text-align: right">
                        </td>
                        <td style="width: 515px; height: 21px; text-align: right">
                        </td>
                        <td style="height: 21px; width: 3px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 99px; height: 20px">
                        </td>
                        <td style="width: 407px; height: 20px; text-align: right">
                        </td>
                        <td style="width: 4px; height: 20px; text-align: right">
                        </td>
                        <td style="width: 515px; height: 20px; text-align: center">
                            <asp:Button ID="LoginButton" runat="server" BackColor="#FFFBFF" BorderColor="#CCCCCC"
                                BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Bold="True" Font-Names="Verdana"
                                Font-Size="XX-Small" ForeColor="#284775" Text="Log In" ValidationGroup="Login1" /></td>
                        <td style="height: 20px; width: 3px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 99px; height: 142px">
                        </td>
                        <td style="width: 407px; height: 142px; text-align: right">
                        </td>
                        <td style="width: 4px; height: 142px; text-align: right">
                        </td>
                        <td style="width: 515px; height: 142px; text-align: right">
                        </td>
                        <td style="height: 142px; width: 3px;">
                        </td>
                    </tr>
                </table>
            </center>
        </div>
    </form>
</body>
</html>
