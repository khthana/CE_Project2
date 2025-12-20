<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Insert_Degree.aspx.vb" Inherits="InsertDescription" Culture="th-TH" %>
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
<body style="text-align: center" >
    <form id="form1" runat="server">
        <div style="text-align: center">
            <div style="width: 787px; height: 440px; background-color: white; text-align: left">
                <table style="table-layout: fixed; width: 730px; color: #6666cc; text-align: left">
                    <tr>
                        <td style="width: 30px; text-align: left; height: 30px;">
                        </td>
                        <td style="width: 135px; text-align: left; height: 30px;">
                        </td>
                        <td style="width: 235px; height: 30px;">
                        </td>
                        <td style="width: 114px; height: 30px;">
                        </td>
                        <td style="width: 278px; height: 30px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px;">
                        </td>
                        <td style="width: 135px;">
                            <span style="color: #ff0000; font-size: 8pt; font-family: Verdana;"><strong>Search Degree&nbsp; :</strong></span></td>
                        <td style="width: 235px;">
                            &nbsp;<asp:TextBox ID="SearchDegreeN" runat="server" Columns="40" ToolTip="ค้นหา สาขาวิชา"
                                Width="220px"></asp:TextBox></td>
                        <td style="width: 114px;">
                            &nbsp;<asp:ImageButton ID="Searchdegree" runat="server" ImageUrl="~/Picture_Files/Search.JPG" /></td>
                        <td style="width: 278px;">
                            &nbsp;<asp:Label ID="MsgSearchDegree" runat="server" Font-Bold="True" Font-Size="10pt" Style="font-weight: bold;
                                font-size: 16px; color: red" Width="174px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 30px">
                        </td>
                        <td style="width: 135px; height: 30px">
                        </td>
                        <td style="width: 235px; height: 30px">
                        </td>
                        <td style="width: 114px; height: 30px">
                        </td>
                        <td style="width: 278px; height: 30px">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="height: 9px; text-align: center">
                            <asp:DataGrid ID="DatagridA" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"
                                CellPadding="2" DataKeyField="DEGREE_ID" Font-Names="verdana" Font-Size="Smaller"
                                HeaderStyle-BackColor="#99cccc" Height="1px" OnPageIndexChanged="PageIndxchanged"
                                PageSize="5" Width="80%">
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <PagerStyle BackColor="#99CCCC" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                    Font-Strikeout="False" Font-Underline="False" ForeColor="#003399" HorizontalAlign="Left"
                                    Mode="NumericPages" VerticalAlign="Middle" />
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
                                    <asp:BoundColumn DataField="DEGREE_LAVEL" HeaderText="DEGREE LAVEL" SortExpression="DEGREE_LAVEL">
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="DEGREE_NAME" HeaderText="DEGREE NAME" SortExpression="DEGREE_NAME">
                                        <HeaderStyle Width="50%" />
                                    </asp:BoundColumn>
                                </Columns>
                            </asp:DataGrid></td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 49px">
                        </td>
                        <td style="width: 135px; height: 49px">
                        </td>
                        <td style="width: 235px; height: 49px">
                        </td>
                        <td style="width: 114px; height: 49px">
                        </td>
                        <td style="width: 278px; height: 49px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 9px">
                        </td>
                        <td style="width: 135px; height: 9px">
                        </td>
                        <td style="width: 235px; height: 9px">
                        </td>
                        <td style="width: 114px; height: 9px">
                        </td>
                        <td style="width: 278px; height: 9px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 9px">
                        </td>
                        <td style="width: 135px; height: 9px">
                        </td>
                        <td style="width: 235px; height: 9px">
                        </td>
                        <td style="width: 114px; height: 9px">
                        </td>
                        <td style="width: 278px; height: 9px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 9px">
                        </td>
                        <td style="width: 135px; height: 9px">
                        </td>
                        <td style="width: 235px; height: 9px">
                        </td>
                        <td style="width: 114px; height: 9px">
                        </td>
                        <td style="width: 278px; height: 9px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 9px;">
                        </td>
                        <td style="width: 135px; height: 9px;">
                            <span style="font-size: 10pt">
                            Degree&nbsp; Level<span> :</span></span></td>
                        <td style="width: 235px; height: 9px;">
                            &nbsp;<asp:TextBox ID="AddDegreeLevel" runat="server" Width="224px"></asp:TextBox></td>
                        <td style="width: 114px; height: 9px;">
                            <span style="font-size: 10pt">
                            Degree Name<span> :</span></span></td>
                        <td style="width: 278px; height: 9px;">
                            &nbsp;<asp:TextBox ID="AddDegreeName" runat="server" Width="225px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td height="15" style="width: 30px">
                        </td>
                        <td height="15" style="width: 135px">
                        </td>
                        <td colspan="2" height="15"><asp:ImageButton ID="AddDegree" runat="server" ImageUrl="~/Picture_Files/save.JPG" Height="30px" Width="30px" ToolTip="บันทึก" />
                            &nbsp; &nbsp;
                            <asp:ImageButton ID="Editdegree" runat="server" Height="30px" ImageUrl="~/Picture_Files/Edit.jpg"
                                Width="30px" ToolTip="แก้ไข" />
                            &nbsp; &nbsp;
                            <asp:ImageButton ID="DeletdDegree" runat="server" Height="30px"
                                ImageUrl="~/Picture_Files/delete.JPG" Width="30px" ToolTip="ลบ" />
                            &nbsp; &nbsp;
                            <asp:ImageButton ID="ClearDegree" runat="server" Height="30px"
                                ImageUrl="~/Picture_Files/cl.JPG" Width="30px" ToolTip="ยกเลิก" />&nbsp;</td>
                        <td height="15" style="width: 278px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 15px">
                        </td>
                        <td style="width: 135px; height: 15px">
                        </td>
                        <td style="width: 235px; height: 15px">
                        </td>
                        <td style="width: 114px; height: 15px">
                        </td>
                        <td style="width: 278px; height: 15px">
                        </td>
                    </tr>
                </table>
                </div>
        </div>
    </form>
</body>
</html>
