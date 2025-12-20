<%@ Page Language="VB" AutoEventWireup="false" CodeFile="NewUser.aspx.vb" Inherits="NewUser" %>

<% 
    If (Session("Status") <> "A") Then
        Response.Redirect("Login.aspx")
    End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body style="text-align: center; vertical-align: top;" bgcolor="lightblue">
    <center>
        <form id="form1" runat="server">
            <div>
                <table bgcolor="#ffffff" style="vertical-align: top; width: 888px" height="600">
                    <tr>
                        <td colspan="5" style="text-align: center">
                            <asp:Image ID="Image1" runat="server" Width="888px" Height="101" ImageUrl="~/Picture_Files/Head.jpg" /></td>
                    </tr>
                    <tr>
                        <td colspan="5" style="height: 46px; text-align: center">
                            <table style="border-right: black thin solid; table-layout: fixed; border-top: black thin solid;
                                vertical-align: middle; border-left: black thin solid; width: 100%; border-bottom: black thin solid;
                                border-collapse: collapse; text-align: center">
                                <tr>
                                    <td bgcolor="#ff3300" style="width: 102px; height: 21px">
                                    </td>
                                    <td bgcolor="#ff3300" style="width: 161px; height: 21px">
                                        <img height="10" src="./Picture_Files/P27.GIF" width="10" /><asp:HyperLink ID="HyperLink1"
                                            runat="server" Font-Bold="True" Font-Size="Smaller" Font-Strikeout="False" ForeColor="Black"
                                            NavigateUrl="~/Menuadmin.aspx" Width="140px">[ Menu Admin ]</asp:HyperLink></td>
                                    <td bgcolor="#ff3300" style="width: 164px; height: 21px">
                                        <img height="10" src="./Picture_Files/P27.GIF" width="10" />
                                        <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Size="Smaller"
                                            Font-Strikeout="False" ForeColor="Black" NavigateUrl="~/Default.aspx" Width="140px">[ Mene MetaData ]</asp:HyperLink></td>
                                    <td bgcolor="#ff3300" style="width: 156px; height: 21px">
                                        <img height="10" src="./Picture_Files/P27.GIF" width="10" />
                                        <asp:HyperLink ID="HyperLink3" runat="server" Font-Bold="True" Font-Size="Smaller"
                                            Font-Strikeout="False" ForeColor="Black" NavigateUrl="~/ShowUpLoadFile.aspx"
                                            Width="140px">[ Menu Up File ]</asp:HyperLink></td>
                                    <td bgcolor="#ff3300" style="width: 157px; height: 21px">
                                        <img height="10" src="./Picture_Files/P27.GIF" width="10" />
                                        <asp:HyperLink ID="HyperLink4" runat="server" Font-Bold="True" Font-Size="Smaller"
                                            Font-Strikeout="False" ForeColor="Black" NavigateUrl="~/Index.aspx" Width="140px">[ Sign Out ]</asp:HyperLink></td>
                                    <td bgcolor="#ff3300" style="height: 21px">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="text-align: center">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="text-align: center; height: 13px;">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 368px; height: 21px">
                        </td>
                        <td style="height: 21px">
                        </td>
                        <td style="height: 21px">
                        </td>
                        <td style="height: 21px" colspan="2">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 368px; height: 21px">
                        </td>
                        <td style="height: 21px">
                        </td>
                        <td style="height: 21px">
                        </td>
                        <td style="height: 21px" colspan="2">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid;
                            width: 368px; border-bottom: black thin solid; height: 21px">
                            <strong><span style="font-size: 10pt; color: #006666; font-family: Verdana">Your&nbsp;
                                Account</span></strong></td>
                        <td colspan="4" style="border-right: black thin solid; border-top: black thin solid;
                            border-left: black thin solid; border-bottom: black thin solid; height: 21px">
                            <strong><span style="font-size: 10pt; color: #ff9966; font-family: Verdana">Sign Up
                                for Your New Account</span></strong></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td rowspan="8" style="border-right: black thin solid; border-top: black thin solid;
                            vertical-align: top; border-left: black thin solid; width: 368px; border-bottom: black thin solid">
                            <asp:DataGrid ID="Datagrid1" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" CellPadding="4" DataKeyField="USERNAME" DataMember="DefaultView"
                                Font-Names="verdana" Font-Size="Smaller" OnPageIndexChanged="PageIndxchanged"
                                HeaderStyle-BackColor="#99cccc" Height="1px" Width="130%" BackColor="White" BorderColor="#3366CC"
                                BorderStyle="None" BorderWidth="1px">
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" Mode="NumericPages" />
                                <ItemStyle BackColor="White" HorizontalAlign="Left" VerticalAlign="Middle" ForeColor="#003399" />
                                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                <Columns>
                                    <asp:ButtonColumn CommandName="Delete" Text="Delete" HeaderText="ลบ">
                                        <HeaderStyle Width="50px" Font-Bold="True" Font-Italic="False" Font-Overline="False"
                                            Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    </asp:ButtonColumn>
                                    <asp:BoundColumn HeaderText="UserName" DataField="USERNAME" SortExpression="USERNAME">
                                        <ItemStyle Width="86px" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                            Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="150px" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn HeaderText="PassWord" DataField="PASSWORD" SortExpression="PASSWORD">
                                        <ItemStyle Width="180px" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                            Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" VerticalAlign="Middle" />
                                        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="PRIVILEGE" HeaderText="สิทธิ์" SortExpression="PRIVILEGE">
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <FooterStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                                    </asp:BoundColumn>
                                </Columns>
                            </asp:DataGrid></td>
                        <td colspan="4" style="height: 21px; background-color: silver; text-align: left">
                            <span style="font-size: 9pt; color: mediumblue; font-family: Verdana"><strong>กำหนดสิทธิ์&nbsp;
                                :</strong></span><asp:RadioButton ID="UsKeyData" runat="server" Font-Names="Verdana"
                                    Font-Size="X-Small" ForeColor="RoyalBlue" GroupName="privilege" Text="MetaData"
                                    ValidationGroup="privilege" Width="80px" /><asp:RadioButton ID="UsUpLoadFile" runat="server"
                                        Font-Names="Verdana" Font-Size="X-Small" ForeColor="RoyalBlue" GroupName="privilege"
                                        Text="Upload File" ValidationGroup="privilege" Width="95px" /><asp:RadioButton ID="Administrator"
                                            runat="server" Font-Names="Verdana" Font-Size="X-Small" ForeColor="RoyalBlue"
                                            GroupName="privilege" Text="Administrator" ValidationGroup="privilege" Width="90px" /></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="font-weight: bold; border-left-width: thin; border-left-color: black;
                            color: blue; font-family: Verdana; height: 1px; text-align: right">
                            <span style="font-size: 9pt; color: red">UserName :</span></td>
                        <td style="font-weight: bold; color: blue; font-family: Verdana; height: 1px; text-align: left">
                        </td>
                        <td style="font-weight: bold; color: blue; font-family: Verdana; height: 1px; text-align: left"
                            colspan="2">
                            <asp:TextBox ID="UserName" runat="server" Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="font-weight: bold; border-left-width: thin; border-left-color: black;
                            color: blue; font-family: Verdana; height: 2px; text-align: right">
                            <span style="font-size: 9pt; color: red">PassWord :</span></td>
                        <td style="font-weight: bold; color: blue; font-family: Verdana; height: 2px; text-align: left">
                        </td>
                        <td style="font-weight: bold; color: blue; font-family: Verdana; height: 2px; text-align: left"
                            colspan="2">
                            <asp:TextBox ID="PassWord" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PassWord"
                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="font-weight: bold; border-left-width: thin; border-left-color: black;
                            color: blue; font-family: Verdana; height: 2px; text-align: right">
                            <asp:Label ID="ConfirmPasswordLabel" runat="server" Font-Names="Verdana" Font-Size="9pt"
                                ForeColor="Red">Confirm Password:</asp:Label></td>
                        <td style="font-weight: bold; color: blue; font-family: Verdana; height: 2px; text-align: left">
                        </td>
                        <td style="font-weight: bold; color: blue; font-family: Verdana; height: 2px; text-align: left"
                            colspan="2">
                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ConfirmPassword"
                                ErrorMessage="*"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="font-weight: bold; border-left-width: thin; border-left-color: black;
                            color: blue; font-family: Verdana; height: 2px; text-align: right">
                        </td>
                        <td style="font-weight: bold; color: blue; font-family: Verdana; height: 2px; text-align: left">
                        </td>
                        <td style="font-weight: bold; color: blue; font-family: Verdana; height: 2px; text-align: left">
                            <asp:Label ID="ErrorMsg" runat="server" Font-Names="Verdana" Font-Size="X-Small"
                                ForeColor="Red" Width="155px"></asp:Label></td>
                        <td style="font-weight: bold; color: blue; font-family: Verdana; height: 2px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="font-weight: bold; border-left-width: thin; border-left-color: black;
                            color: blue; font-family: Verdana; height: 2px; text-align: right">
                        </td>
                        <td style="font-weight: bold; color: blue; font-family: Verdana; height: 2px; text-align: left">
                        </td>
                        <td style="font-weight: bold; color: blue; font-family: Verdana; height: 2px; text-align: left">
                            <asp:Button ID="CreateUse" runat="server" Text="Create User" Width="100px" /></td>
                        <td style="font-weight: bold; color: blue; font-family: Verdana; height: 2px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="font-weight: bold; border-left-width: thin; border-left-color: black;
                            color: blue; font-family: Verdana; height: 2px; text-align: right">
                        </td>
                        <td style="font-weight: bold; color: blue; font-family: Verdana; height: 5px; text-align: left">
                        </td>
                        <td style="font-weight: bold; color: blue; font-family: Verdana; height: 5px; text-align: left">
                        </td>
                        <td style="font-weight: bold; color: blue; font-family: Verdana; height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="font-weight: normal; border-left-width: thin; border-left-color: black;
                            color: red; font-family: Verdana; height: 196px; text-align: left; font-size: x-small;
                            vertical-align: top;" colspan="3">
                            <span style="font-size: 10pt">* หมายเหตุ การกำหนด สิทธ์<br />
                                <br />
                            </span><span style="font-size: 10pt; color: navy">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                &nbsp; &nbsp; K =&nbsp; MetaData<br />
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; U =&nbsp; Upload File<br />
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; A =&nbsp; Administrator</span></td>
                        <td colspan="1" style="font-weight: bold; border-left-width: thin; border-left-color: black;
                            color: blue; font-family: Verdana; height: 196px; text-align: right">
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </center>
</body>
</html>
