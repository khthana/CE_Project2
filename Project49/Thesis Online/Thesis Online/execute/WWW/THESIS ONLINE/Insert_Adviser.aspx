<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Insert_Adviser.aspx.vb" Inherits="InsertAdviser" %>
<% 
    If Session("Status") <> "K" Then
        If (Session("Status") <> "A") Then
            Response.Redirect("Login.aspx")
        End If
    End If
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta content="text/VBScript" http-equiv="content-script-type" />
    <title>Untitled Page</title>
    <link href="App_Code/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body style="text-align: center">
    <form id="form1" runat="server">
        <div style="text-align: center">
            <div style="width: 810px; height: 440px; background-color: white; text-align: left">
                <table style="table-layout: fixed; width: 730px; color: #6666cc; text-align: left">
                    <tr>
                        <td style="width: 30px; height: 28px; text-align: left">
                        </td>
                        <td style="width: 128px; height: 28px; text-align: left">
                        </td>
                        <td style="width: 235px; height: 28px">
                        </td>
                        <td style="width: 114px; height: 28px">
                        </td>
                        <td style="width: 280px; height: 28px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 1px; text-align: left">
                        </td>
                        <td style="width: 128px; height: 1px; text-align: left">
                            <span style="color: #ff0000; font-size: 10pt;"><strong>Search&nbsp; Adviser:</strong></span></td>
                        <td style="width: 235px; height: 1px">
                            <asp:TextBox ID="SearchAdviser" runat="server" Columns="40" Width="215px"></asp:TextBox></td>
                        <td style="width: 114px; height: 1px">
                            &nbsp;<asp:ImageButton ID="SearchA" runat="server" ImageUrl="~/Picture_Files/Search.JPG" /></td>
                        <td style="width: 280px; height: 1px">
                            <asp:Label ID="NOSearch" runat="server" Font-Bold="False" Font-Size="10pt" Style="font-weight: bold;
                                font-size: 16px; color: red" Width="174px" Font-Names="Times New Roman"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 30px; text-align: left">
                        </td>
                        <td style="width: 128px; height: 30px; text-align: left">
                        </td>
                        <td style="width: 235px; height: 30px">
                        </td>
                        <td style="width: 114px; height: 30px">
                        </td>
                        <td style="width: 280px; height: 30px">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="height: 1px; text-align: center">
                            <asp:DataGrid ID="DatagridA" runat="server"  DataKeyField="CONTRIBUTOR_ID"  OnPageIndexChanged="PageIndxchanged"
                                AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None"
                                BorderWidth="1px" CellPadding="2"
                                Font-Names="verdana" Font-Size="Smaller" HeaderStyle-BackColor="#99cccc" Height="1px"
                                PageSize="5" Width="80%" AllowPaging="True">
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" Mode="NumericPages" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" VerticalAlign="Middle" />
                                <ItemStyle BackColor="White" ForeColor="#003399" HorizontalAlign="Left" VerticalAlign="Middle" />
                                <HeaderStyle BackColor="#003399" Font-Bold="True" Font-Italic="False" Font-Overline="False"
                                    Font-Strikeout="False" Font-Underline="False" ForeColor="#CCCCFF" HorizontalAlign="Center"
                                    VerticalAlign="Middle" />
                                <Columns>
                                    <asp:ButtonColumn CommandName="Delete" HeaderText="ลบ" Text="Edit">
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                                    </asp:ButtonColumn>
                                    <asp:BoundColumn DataField="CONTRIBUTOR_NAME" HeaderText="Thai Adviser " SortExpression="CONTRIBUTOR_NAME">
                                    </asp:BoundColumn>
                                    <asp:BoundColumn HeaderText="English Adviser " DataField="CONTRIBUTOR_ENGLISH" SortExpression="CONTRIBUTOR_ENGLISH">
                                        <HeaderStyle Width="50%" />
                                    </asp:BoundColumn>
                                </Columns>
                            </asp:DataGrid></td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 7px; text-align: left">
                        </td>
                        <td style="width: 128px; height: 7px; text-align: left">
                        </td>
                        <td style="width: 235px; height: 7px">
                        </td>
                        <td style="width: 114px; height: 7px">
                        </td>
                        <td style="width: 280px; height: 7px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 7px; text-align: left">
                        </td>
                        <td style="width: 128px; height: 7px; text-align: left">
                        </td>
                        <td style="width: 235px; height: 7px">
                        </td>
                        <td style="width: 114px; height: 7px">
                        </td>
                        <td style="width: 280px; height: 7px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; text-align: left">
                        </td>
                        <td style="width: 128px; text-align: left">
                        </td>
                        <td style="width: 235px;">
                        </td>
                        <td style="width: 114px;">
                        </td>
                        <td style="width: 280px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 11px; text-align: left">
                        </td>
                        <td style="width: 128px; height: 11px; text-align: left">
                        </td>
                        <td style="width: 235px; height: 11px">
                        </td>
                        <td style="width: 114px; height: 11px">
                        </td>
                        <td style="width: 280px; height: 11px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 5px; text-align: left">
                        </td>
                        <td style="width: 128px; height: 5px; text-align: left">
                            <span style="font-size: 10pt">
                            Thai Adviser :</span></td>
                        <td style="width: 235px; height: 5px">
                            <asp:TextBox ID="Thai_Adviser" runat="server" Columns="40" ToolTip="ชื่ออาจารย์ที่ปรึกษา ภาาษา Thai"
                                Width="217px"></asp:TextBox></td>
                        <td style="width: 114px; height: 5px">
                            <span style="font-size: 10pt">
                            English Adviser :</span></td>
                        <td style="width: 280px; height: 5px">
                            <asp:TextBox ID="English_Adviser" runat="server" Columns="40" ToolTip="ชื่ออาจารย์ที่ปรึกษา ภาษา English"
                                Width="246px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 5px; text-align: left">
                        </td>
                        <td style="width: 128px; height: 5px; text-align: left">
                            <span style="font-size: 10pt">
                            Roles :</span></td>
                        <td style="width: 235px; height: 5px">
                            <asp:TextBox ID="Roles_Adviser" runat="server" Columns="30" ToolTip='"อาจารย์ผู้ควบคุมวิทยานิพนธ์"'
                                Width="214px"></asp:TextBox></td>
                        <td style="width: 114px; height: 5px">
                            <span style="font-size: 10pt">
                            E-Mail :</span></td>
                        <td style="width: 280px; height: 5px">
                            <asp:TextBox ID="Email_Adviser" runat="server" Columns="30" ToolTip="e-mai อาจารย์ผู้ควบคุมวิทยานิพนธ์"
                                Width="242px"></asp:TextBox>
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; text-align: left;">
                        </td>
                        <td style="width: 128px; text-align: left;">
                            </td>
                        <td style="width: 235px;">
                            </td>
                        <td style="width: 114px;">
                        </td>
                        <td style="width: 280px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 5px; text-align: left">
                        </td>
                        <td style="width: 128px; height: 5px; text-align: left">
                        </td>
                        <td colspan="2" style="height: 5px">
                            <asp:ImageButton ID="AddBaseAdviser" runat="server" ImageUrl="~/Picture_Files/save.JPG" Height="30px" Width="30px" ToolTip="บันทึก" />&nbsp;&nbsp;
                            &nbsp;
                            <asp:ImageButton ID="EditBaseAdviser" runat="server" Height="30px" ImageUrl="~/Picture_Files/Edit.jpg"
                                Width="30px" ToolTip="แก้ไข" />
                            &nbsp; &nbsp;
                            <asp:ImageButton ID="DeleteBaseAdviser" runat="server" Height="30px"
                                ImageUrl="~/Picture_Files/delete.JPG" Width="30px" ToolTip="ลบ" />
                            &nbsp; &nbsp;
                            <asp:ImageButton ID="ClearAdviser" runat="server" Height="30px"
                                ImageUrl="~/Picture_Files/cl.JPG" Width="30px" ToolTip="ยกเลิก" />&nbsp;</td>
                        <td style="width: 280px; height: 5px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px;">
                        </td>
                        <td style="width: 128px;">
                        </td>
                        <td style="width: 235px;">
                        </td>
                        <td style="width: 114px;">
                        </td>
                        <td style="width: 280px;">
                        </td>
                    </tr>
                </table>
                </div>
        </div>
    </form>
</body>
</html>
