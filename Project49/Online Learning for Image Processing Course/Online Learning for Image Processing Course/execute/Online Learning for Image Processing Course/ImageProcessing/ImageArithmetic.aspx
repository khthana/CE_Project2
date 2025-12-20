<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ImageArithmetic.aspx.vb" Inherits="ImageArithmetic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Image Arithmetic</title>
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
                <td colspan="5" style="border-color:#ff9933;border-width:thin;border-style:double">
                <font style="font-family:Arial;font-weight:bolder;font-size:medium">Image Arithmetic</font></td>
            </tr>
            <tr align="center" height="30">
                <td><asp:FileUpload ID="ImageFile1" runat="server" EnableTheming="True" Width="250px" /></td>
                <td></td>
                <td><asp:FileUpload ID="ImageFile2" runat="server" EnableTheming="True" Width="250px" /></td>
                <td></td>
                <td><asp:Button ID="OK" runat="server" Text="ตกลง" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" /></td>
            </tr>
            <tr>
                <td colspan="5" align="center"><asp:Label ID="Warning" runat="server" ForeColor="red"></asp:Label></td>
            </tr>
            <tr align="center" height="30">
                <td><asp:DropDownList ID="DDLImage1" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="building.bmp">Building</asp:ListItem>
                    <asp:ListItem Value="HaveBottle.bmp">Things and Bottle</asp:ListItem>
                    <asp:ListItem Value="TreeNoon.bmp">Tree At Noon</asp:ListItem>
                </asp:DropDownList></td>
                <td></td>
                <td><asp:DropDownList ID="DDLImage2" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="freedom.bmp">Freedom</asp:ListItem>
                    <asp:ListItem Value="NoBottle.bmp">Things and No Bottle</asp:ListItem>
                    <asp:ListItem Value="TreeNight.bmp">Tree At Night</asp:ListItem>
                </asp:DropDownList></td>
                <td colspan="2"></td>
            </tr>
            <tr align="center" height="30">
                <td style="border-color:#ff9933;border-width:thin;border-style:double">Image1</td>
                <td></td>
                <td style="border-color:#ff9933;border-width:thin;border-style:double">Image2</td>
                <td></td>
                <td style="border-color:#ff9933;border-width:thin;border-style:double">Image Result</td>
            </tr>
            <tr align="center">
                <td style="border-color:#ff9933;border-width:thin;border-style:double"><asp:Image ID="Image1" runat="server" AlternateText="Please browse image file" 
                    ToolTip="Image1" Height="256px" Width="256px" ImageUrl="~/ImageProcessing/ImageDefaultBefore/DefaultImageA.bmp" />
                </td>
                <td></td>
                <td style="border-color:#ff9933;border-width:thin;border-style:double"><asp:Image ID="Image2" runat="server" AlternateText="Please browse image file"
                    ToolTip="Image2" Height="256px" Width="256px" ImageUrl="~/ImageProcessing/ImageDefaultBefore/DefaultImageB.bmp" />
                </td>
                <td></td>
                <td style="border-color:#ff9933;border-width:thin;border-style:double"><asp:Image ID="ImageResult" runat="server" AlternateText="Wait For Result"
                    ToolTip="Image Result" Height="256px" Width="256px" ImageUrl="~/ImageProcessing/ImageDefaultAfter/DefaultImageResult.bmp" />
                </td>
            </tr>
            <tr height="10"><td colspan="5"></td></tr>
            <tr align="center" height="30">
                <td><asp:Button ID="ImageAddition" runat="server" Text="Image Addition" Width="200px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" /></td>
                <td></td>
                <td><asp:Button ID="ImageSubtraction" runat="server" Text="Image Subtraction" Width="200px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" /></td>
                <td></td>
                <td><asp:Button ID="ImageMultiplication" runat="server" Text="Image Multiplication" Width="200px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" /></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
