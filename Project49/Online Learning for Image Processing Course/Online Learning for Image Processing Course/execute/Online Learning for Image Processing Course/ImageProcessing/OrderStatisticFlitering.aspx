<%@ Page Language="VB" AutoEventWireup="false" CodeFile="OrderStatisticFlitering.aspx.vb" Inherits="OrderStatisticFlitering" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Order - Statistic Filtering</title>
<style>
	    a:link {COLOR: #000080; TEXT-DECORATION: none}
	    a:visited {	COLOR: #000080; TEXT-DECORATION: none}
	    a:hover {COLOR: blue; TEXT-DECORATION: none}
    </style>
</head>
<body bottommargin="0" background="../Image/bg.jpg" style="font-family:MS Sans Serif;font-size:10pt">
    <form id="form1" runat="server">
    <div>
        <table align="center" width="600" bgcolor="white" border="0">
            <tr align="center" height="50">
                <td colspan="3" style="border-color:#ff9933;border-width:thin;border-style:double">
                <font style="font-family:Arial;font-weight:bolder;font-size:medium">
                Order - Statistic Filtering</font></td>
            </tr>
            <tr align="center" height="30">
                <td colspan="3"><asp:FileUpload ID="ImageFile" runat="server" EnableTheming="True" Width="450px" />
                    <asp:Button ID="OK" runat="server" Text="ตกลง" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center"><asp:Label ID="Warning" runat="server" ForeColor="red"></asp:Label></td>
            </tr>
            <tr align="center" height="30">
                <td style="border-color:#ff9933;border-width:thin;border-style:double">Before</td>
                <td></td>
                <td style="border-color:#ff9933;border-width:thin;border-style:double">After</td>
            </tr>
            <tr align="center">
                <td style="border-color:#ff9933;border-width:thin;border-style:double"><asp:Image ID="ImageBefore" runat="server" AlternateText="Please browse image file" 
                    ToolTip="Image Before" Height="256px" Width="256px" />
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td style="border-color:#ff9933;border-width:thin;border-style:double"><asp:Image ID="ImageAfter" runat="server" AlternateText="Please browse image file"
                    ToolTip="Image After" Height="256px" Width="256px" ImageUrl="~/ImageProcessing/ImageDefaultAfter/DefaultImageAfter.bmp" />
                </td>
            </tr>
            <tr height="10"><td colspan="3"></td></tr>
            <tr align="center" height="30">
                <td colspan="3" style="border-color:#ff9933;border-width:thin;border-style:double">Window Size <asp:DropDownList ID="Window" runat="server" AutoPostBack="True" Width="60px">
                        <asp:ListItem Value="3">3 x 3</asp:ListItem>
                        <asp:ListItem Value="5">5 x 5</asp:ListItem>
                        <asp:ListItem Value="7">7 x 7</asp:ListItem>
                        <asp:ListItem Value="9">9 x 9</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr height="10"><td colspan="3"></td></tr>
            <tr align="center" height="30">
                <td colspan="2"></td>
                <td><asp:Button ID="MedianFilter" runat="server" Text="Median Filter" Width="210px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" /></td>
            </tr>
            <tr align="center" height="30">
                <td colspan="2"></td>
                <td><asp:Button ID="MaxFilter" runat="server" Text="Max Filter" Width="210px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" /></td>
            </tr>
            <tr align="center" height="30">
                <td colspan="2"></td>
                <td><asp:Button ID="MinFilter" runat="server" Text="Min Filter" Width="210px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" /></td>
            </tr>
            <tr align="center" height="30">
                <td colspan="2"></td>
                <td><asp:Button ID="MidPointFilter" runat="server" Text="MidPoint Filter" Width="210px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" /></td>
            </tr>
            <tr align="center">
                <td colspan="2" align="right">Value D : <asp:TextBox ID="D" runat="server" Width="30px"></asp:TextBox></td>
                <td>
                    <asp:Button ID="AlphaTrimmedMeanFilter" runat="server" Text="Alpha Trimmed Mean Filter" Width="210px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                </td>
            </tr>
            <tr height="10"><td colspan="3"></td></tr>
        </table>
    </div>
    </form>
</body>
</html>
