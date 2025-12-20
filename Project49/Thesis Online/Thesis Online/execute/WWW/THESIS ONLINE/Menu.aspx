<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Menu.aspx.vb" Inherits="Menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<table style="width: 181px; border-right: white thin solid; border-top: white thin solid; border-left: white thin solid; border-bottom: white thin solid; height: 310px;" border="0" bordercolor="#ffffff" id="TABLE1" language="javascript" onclick="return TABLE1_onclick()">
            <tr>
                <td bgcolor="lightgrey" colspan="2" style="font-weight: bold; font-size: medium;
                    vertical-align: middle; color: red; background-color: navy; text-align: center;">
                    <span style="font-size: 9pt; color: #ff0000"><strong style="font-size: medium; color: red">
                        Menu</strong></span></td>
            </tr>
            <tr>
                <td style="width: 17px; height: 21px;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Picture_Files/i_cycle2.gif" /></td>
                <td style="width: 155px; height: 21px;">
                    <a href=Insert_Adviser.aspx target="datails"> New Adviser </a>
                    
                </td>
            </tr>
            <tr>
                <td style="width: 17px">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Picture_Files/i_cycle2.gif" /></td>
                <td style="width: 155px">
                        <a href=Insert_Degree.aspx target="datails">AddDegree</a>  
                </td>
            </tr>
            <tr>
                <td style="width: 17px">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Picture_Files/i_cycle2.gif" /></td>
                <td style="width: 155px">
                    
                <a href=Insert_Faculty.aspx target="datails">AddFaculty</a> 
                     
                </td>
            </tr>
            <tr>
                <td style="width: 17px">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Picture_Files/i_cycle2.gif" /></td>
                <td style="width: 155px">
                    <a href=Insert_Department.aspx target="datails">AddDepartment</a></td>
            </tr>
            <tr>
                <td style="width: 17px">
                    <asp:Image ID="Image5" runat="server" ImageUrl="~/Picture_Files/i_cycle2.gif" /></td>
                <td style="width: 155px">
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Insert_Description.aspx" target="datails">AddDesciption</asp:HyperLink></td>
            </tr>
            <tr>
                <td style="width: 17px;">
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/Picture_Files/i_cycle2.gif" /></td>
                <td style="width: 155px;" abbr="">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Show.aspx" Target="_parent">ShowData</asp:HyperLink></td>
            </tr>
            <tr>
                <td style="width: 17px">
                    <asp:Image ID="Image8" runat="server" ImageUrl="~/Picture_Files/i_cycle2.gif" /></td>
                <td style="width: 155px">
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Default.aspx" Target="_parent">Menu</asp:HyperLink></td>
            </tr>
            <tr>
                <td style="width: 17px; height: 21px;">
                    <asp:Image ID="Image7" runat="server" DescriptionUrl="~/Index.aspx" ImageUrl="~/Picture_Files/i_cycle2.gif" /></td>
                <td style="width: 155px; height: 21px;">
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Index.aspx" Target="_parent">Log Out</asp:HyperLink></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
