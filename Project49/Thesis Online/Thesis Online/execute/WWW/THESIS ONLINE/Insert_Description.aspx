<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Insert_Description.aspx.vb" Inherits="InsertDescription" Culture="th-TH" %>
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
            <div style="width: 787px; height: 440px; background-color: white; text-align: left">
                <table style="table-layout: fixed; width: 730px; color: #6666cc; text-align: left">
                    <tr>
                        <td style="width: 30px; height: 30px;">
                        </td>
                        <td style="width: 128px; height: 30px;">
                        </td>
                        <td style="width: 235px; height: 30px;">
                        </td>
                        <td style="width: 114px; height: 30px;">
                        </td>
                        <td style="width: 278px; height: 30px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px">
                        </td>
                        <td style="width: 128px">
                            <span style="color: #ff0000; font-size: 10pt;"><strong>Search Desciption&nbsp; :</strong></span></td>
                        <td style="width: 235px">
                            <asp:TextBox ID="SearchDesciption" runat="server" Columns="40" ToolTip="ค้นหา สาขาวิชา"
                                Width="220px"></asp:TextBox></td>
                        <td style="width: 114px">
                            <asp:ImageButton ID="SearchDE" runat="server" ImageUrl="~/Picture_Files/Search.JPG" /></td>
                        <td style="width: 278px">
                            <asp:Label ID="MsgSearchDesciption" runat="server" Font-Bold="True" Font-Size="10pt" Style="font-weight: bold;
                                font-size: 16px; color: red" Width="174px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 30px;">
                        </td>
                        <td style="width: 128px; height: 30px;">
                        </td>
                        <td style="width: 235px; height: 30px;">
                        </td>
                        <td style="width: 114px; height: 30px;">
                        </td>
                        <td style="width: 278px; height: 30px;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="text-align: center">
                            <asp:DataGrid ID="DatagridA" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                                BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" OnPageIndexChanged="PageIndxchanged"
                                CellPadding="2" DataKeyField="DESCIPTION_ID" Font-Names="verdana" Font-Size="Smaller"
                                HeaderStyle-BackColor="#99cccc" Height="1px" PageSize="5" Width="80%">
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
                                    <asp:BoundColumn HeaderText="DESCIPTION THAI" DataField="DESCIPTION_THAI" SortExpression="DESCIPTION_THAI"></asp:BoundColumn>
                                    <asp:BoundColumn HeaderText="DESCIPTION ENGLISH" DataField="DESCIPTION_ENGLISH" SortExpression="DESCIPTION_ENGLISH">
                                        <HeaderStyle Width="50%" />
                                    </asp:BoundColumn>
                                </Columns>
                            </asp:DataGrid></td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 50px">
                        </td>
                        <td style="width: 128px; height: 50px">
                        </td>
                        <td style="width: 235px; height: 50px">
                        </td>
                        <td style="width: 114px; height: 50px">
                        </td>
                        <td style="width: 278px; height: 50px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px">
                        </td>
                        <td style="width: 128px">
                        </td>
                        <td style="width: 235px">
                        </td>
                        <td style="width: 114px">
                        </td>
                        <td style="width: 278px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 30px;">
                        </td>
                        <td style="width: 128px; height: 30px;">
                            <strong style="color: #ff0000"><span style="font-size: 10pt">Degree Level :</span></strong></td>
                        <td style="width: 235px; height: 30px;">
                            <asp:DropDownList ID="DegreeLevel" runat="server" AppendDataBoundItems="True"
                                AutoPostBack="True" Width="178px">
                                <asp:ListItem>&lt;&lt;ระดับปริญญา&gt;&gt;</asp:ListItem>
                                <asp:ListItem>ปริญญาตรี</asp:ListItem>
                                <asp:ListItem>ปริญญาโท</asp:ListItem>
                                <asp:ListItem>ปริญญาเอก</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 114px; height: 30px;" abbr="AddD">
                            <strong><span style="color: #ff0000; font-size: 10pt;">Degree &nbsp;Name :</span></strong></td>
                        <td style="width: 278px; height: 30px;">
                            <asp:DropDownList ID="DegreeName" runat="server" AppendDataBoundItems=false AutoPostBack="True" Width="181px" DataTextField="DEGREE_NAME">
                                <asp:ListItem>&lt;&lt;หลักสูตร&gt;&gt;</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 31px;">
                        </td>
                        <td style="width: 128px; height: 31px;" >
                            <strong><span style="color: #ff0000; font-size: 10pt;">Faculty :</span></strong></td>
                        <td style="width: 235px; height: 31px;"><asp:DropDownList ID="FacultList" runat="server"
                                AutoPostBack="True" DataTextField=FACULTY_THAI Width="180px" CausesValidation="True">
                            <asp:ListItem>&lt;&lt;คณะวิชา&gt;&gt;</asp:ListItem>
                        </asp:DropDownList>
                        </td>
                        <td style="width: 114px; height: 31px;">
                            <strong><span style="color: #ff0000; font-size: 10pt;">Department :</span></strong></td>
                        <td style="width: 278px; height: 31px;"><asp:DropDownList ID="DepartmentList" runat="server"
                                AutoPostBack="True" Width="180px" DataTextField="DEPARTMENT_THAI">
                            <asp:ListItem>&lt;&lt;ภาควิชา&gt;&gt;</asp:ListItem>
                        </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 31px;">
                        </td>
                        <td style="width: 128px; height: 31px;">
                            </td>
                        <td style="width: 235px; height: 31px;">
                            </td>
                        <td style="width: 114px; height: 31px;">
                        </td>
                        <td style="width: 278px; height: 31px;">
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 21px;">
                        </td>
                        <td style="width: 128px; height: 21px;">
                            <span style="font-size: 10pt">
                            Desciption <span>Thai :</span></span></td>
                        <td style="width: 235px; height: 21px;">
                            <asp:TextBox ID="AddDesciptionThai" runat="server" Width="224px"></asp:TextBox></td>
                        <td style="width: 114px; height: 21px;">
                            <span style="font-size: 10pt">
                            Desciption <span>English :</span></span></td>
                        <td style="width: 278px; height: 21px;">
                            <asp:TextBox ID="AddDesciptionEng" runat="server" Width="225px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 10px">
                        </td>
                        <td style="width: 128px; height: 10px">
                        </td>
                        <td colspan="2" style="height: 10px">
                        </td>
                        <td style="width: 278px; height: 10px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 10px;">
                        </td>
                        <td style="width: 128px; height: 10px;">
                        </td>
                        <td colspan="2" style="height: 10px"><asp:ImageButton ID="AddBaseDesciption" runat="server" ImageUrl="~/Picture_Files/save.JPG" Height="30px" Width="30px" ToolTip="บันทึก" />
                            &nbsp; &nbsp;
                            <asp:ImageButton ID="EditBaseDesciption" runat="server" Height="30px" ImageUrl="~/Picture_Files/Edit.jpg"
                                Width="30px" ToolTip="แก้ไข" />
                            &nbsp; &nbsp;
                            <asp:ImageButton ID="DeletdBaseDesciption" runat="server" Height="30px"
                                ImageUrl="~/Picture_Files/delete.JPG" Width="30px" ToolTip="ลบ" />
                            &nbsp; &nbsp;
                            <asp:ImageButton ID="ClearDesciption" runat="server" Height="30px"
                                ImageUrl="~/Picture_Files/cl.JPG" Width="30px" ToolTip="ยกเลิก" />&nbsp;</td>
                        <td style="width: 278px; height: 10px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 15px">
                        </td>
                        <td style="width: 128px; height: 15px">
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
