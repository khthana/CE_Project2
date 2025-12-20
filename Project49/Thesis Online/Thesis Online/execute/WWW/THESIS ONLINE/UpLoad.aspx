<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UpLoad.aspx.vb" Inherits="UpLoad" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body style="text-align: center" bgcolor="lightblue">
    <center>
        <form id="form1" runat="server">
            <div>
                <table atomicselection="false" bgcolor="#ffffff" contenteditable="false" style="vertical-align: top;
                    width: 888px">
                    <tr>
                        <td colspan="8" style="text-align: center">
                            <asp:Image ID="Image1" runat="server" Width="888px" Height="101" ImageUrl="~/Picture_Files/Head.jpg" /></td>
                    </tr>
                    <tr>
                        <td colspan="8" style="height: 23px; text-align: center">
                            <table style="border-right: black thin solid; table-layout: fixed; border-top: black thin solid;
                                vertical-align: middle; border-left: black thin solid; width: 100%; border-bottom: black thin solid;
                                border-collapse: collapse; text-align: center">
                                <tr>
                                    <td bgcolor="#ff3300" style="width: 102px; height: 20px">
                                    </td>
                                    <td bgcolor="#ff3300" style="width: 225px; height: 20px">
                                        <img height="10" src="./Picture_Files/P27.GIF" width="10" /><asp:HyperLink ID="HyperLink1"
                                            runat="server" Font-Bold="True" Font-Size="Smaller" Font-Strikeout="False" ForeColor="Black"
                                            NavigateUrl="~/ShowUpLoadFile.aspx" Width="140px">[ Uploaded ]</asp:HyperLink></td>
                                    <td bgcolor="#ff3300" colspan="2" style="width: 240px; height: 20px">
                                        <img height="10" src="./Picture_Files/P27.GIF" width="10" />
                                        <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Size="Smaller"
                                            Font-Strikeout="False" ForeColor="Black" NavigateUrl="~/ShowFileNotUp.aspx" Width="140px">[ Un Upload ]</asp:HyperLink></td>
                                    <td bgcolor="#ff3300" style="width: 157px; height: 20px">
                                        <img height="10" src="./Picture_Files/P27.GIF" width="10" />
                                        <asp:HyperLink ID="HyperLink4" runat="server" Font-Bold="True" Font-Size="Smaller"
                                            Font-Strikeout="False" ForeColor="Black" NavigateUrl="~/Index.aspx" Width="140px">[ Sign Out ]</asp:HyperLink></td>
                                    <td bgcolor="#ff3300" style="height: 20px">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                        </td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: right">
                        </td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: right">
                        </td>
                        <td colspan="4" style="height: 5px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                        </td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: right">
                        </td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: right">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #3333ff">Full Document :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload1" runat="server" BorderStyle="None" EnableTheming="True"
                                Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #3333ff">Document :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload2" runat="server" Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #0033ff">Chapter 1 :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload3" runat="server" Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #0033ff">Chapter 2 :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload4" runat="server" Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #0033ff">Chapter 3 :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload5" runat="server" Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #0033ff">Chapter 4 :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload6" runat="server" Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #0033ff">Chapter 5 :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload7" runat="server" Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #0033ff">Chapter 6 :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload8" runat="server" Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #0033ff">Chapter 7 :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload9" runat="server" Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #0033ff">Chapter 8 :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload10" runat="server" Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #0033ff">Chapter 9 :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload11" runat="server" Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #0033ff">Chapter 10 :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload12" runat="server" Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #0033ff">Chapter 11 :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload13" runat="server" Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #0033ff">Chapter 12 :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload14" runat="server" Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #0033ff">Chapter 13 :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload15" runat="server" Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #0033ff">Chapter 14 :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload16" runat="server" Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                            <span style="font-size: 10pt; color: #0033ff">Chapter 15 :</span></td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                            <asp:FileUpload ID="FileUpload17" runat="server" Width="326px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 2px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                        </td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: left">
                        </td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 2px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 2px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                        </td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: right">
                        </td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: right">
                        </td>
                        <td colspan="4" style="height: 2px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 5px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                        </td>
                        <td style="vertical-align: middle; width: 300px; height: 5px; text-align: left">
                            &nbsp;<asp:Button ID="cmdOK" runat="server" Text="ตกลง" Width="69px" />
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                            <asp:Button ID="cmdCancle" runat="server" Text="ยกเลิก" Width="69px" /></td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: left">
                        </td>
                        <td colspan="4" style="height: 5px; text-align: left">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 2px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 5px; text-align: right">
                        </td>
                        <td style="vertical-align: middle; width: 23px; height: 5px; text-align: right">
                        </td>
                        <td style="vertical-align: middle; width: 84px; height: 5px; text-align: right">
                        </td>
                        <td colspan="4" style="height: 2px">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td style="width: 172px; height: 1px">
                        </td>
                        <td style="vertical-align: middle; width: 149px; height: 1px; text-align: right">
                        </td>
                        <td style="vertical-align: middle; width: 23px; height: 1px; text-align: right">
                        </td>
                        <td style="vertical-align: middle; width: 84px; height: 1px; text-align: right">
                        </td>
                        <td colspan="4" style="height: 1px">
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </center>
</body>
</html>
