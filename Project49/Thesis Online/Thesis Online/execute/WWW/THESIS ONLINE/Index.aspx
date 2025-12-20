<%@ Page Language="VB" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="Index"
    Culture="th-TH" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KMITL Library Public Access Catalog </title>
</head>
<body bgcolor="lightblue">
<center>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <center>
                <table bgcolor="#ffffff" style="width: 785px">
                    <tr>
                        <td colspan="2">
                            <center>
                                <img border="0" src="./Picture_Files/Head.jpg" width="785px" height="101">
                            </center>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 141px; text-align: right">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" rowspan="1" style="text-align: right">
                            <center>
                                <asp:DropDownList ID="SelectList" runat="server" Width="104px">
                                    <asp:ListItem>Title</asp:ListItem>
                                    <asp:ListItem>Author</asp:ListItem>
                                    <asp:ListItem>Subject</asp:ListItem>
                                    <asp:ListItem>Call Number</asp:ListItem>
                                    <asp:ListItem>ISBN/ISSN</asp:ListItem>
                                    <asp:ListItem>Year</asp:ListItem>
                                    <asp:ListItem Value="Other"></asp:ListItem>
                                </asp:DropDownList><asp:TextBox ID="TextSearch" runat="server" Width="255px"></asp:TextBox>
                            </center>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" rowspan="1" style="text-align: center" height="21">
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Search" runat="server" Text="Search" Width="90px" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="MainMenu" runat="server" Text="MainMenu" Width="90px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: right; height: 127px;">
                            <p style="text-align: center">
                                &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" height=90px >
                            <center>
                                      <span style="font-size: 10pt; color: #000080; font-family: MS Sans Serif">
                                        <img onclick='self.open("./Login.aspx","_top");' src="Picture_Files/xp052.bmp" width="25"
                                            border="0" id="IMG1"><br />
                                        ระบบสืบค้นข้อมูลวิทยานิพนธ์
                                        <br />
                                        สำนักหอสมุดกลาง สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง<br />
                                    </span>
                            </center>
                        </td>
                    </tr>
                </table>
            </center>
        </div>
    </form>
</center>    
</body>
</html>
