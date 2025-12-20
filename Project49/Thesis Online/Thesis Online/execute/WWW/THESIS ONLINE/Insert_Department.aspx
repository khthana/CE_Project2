<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Insert_Department.aspx.vb" Inherits="Department" Culture="th-TH" %>
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
                <table style="width: 807px; color: #6666cc; text-align: left; height: 108px;">
                    <tr>
                        <td style="width: 30px; text-align: left; height: 30px;">
                        </td>
                        <td style="width: 128px; text-align: left; height: 30px;">
                        </td>
                        <td style="width: 235px; height: 30px;">
                        </td>
                        <td style="width: 119px; height: 30px;">
                        </td>
                        <td style="width: 278px; height: 30px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 29px;">
                        </td>
                        <td style="width: 128px; height: 29px;">
                            <span style="color: #ff0000"><strong><span style="font-size: 10pt">
                            <span>Search&nbsp; Department</span><span>:</span></span></strong></span></td>
                        <td style="width: 235px; height: 29px;">
                            <asp:TextBox ID="SearchDep" runat="server" Columns="40" ToolTip="ค้นหาคณะวิชา"
                                Width="219px"></asp:TextBox></td>
                        <td style="width: 119px; height: 29px;">
                            &nbsp;<asp:ImageButton ID="SearchDEPM" runat="server" ImageUrl="~/Picture_Files/Search.JPG" /></td>
                        <td style="width: 278px; height: 29px;">
                            <asp:Label ID="MsgSearchDep" runat="server" Font-Bold="True" Font-Size="10pt"
                                Style="font-weight: bold; font-size: 16px; color: red" Width="174px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 29px">
                        </td>
                        <td style="width: 128px; height: 29px">
                        </td>
                        <td style="width: 235px; height: 29px">
                        </td>
                        <td style="width: 119px; height: 29px">
                        </td>
                        <td style="width: 278px; height: 29px">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="height: 9px; text-align: center">
                            <asp:DataGrid ID="DatagridA" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"
                                CellPadding="2" DataKeyField="DEPARTMENTID" Font-Names="verdana" Font-Size="Smaller"
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
                                    <asp:BoundColumn DataField="DEPARTMENT_THAI" HeaderText="DEPARTMENT THAI" SortExpression="DEPARTMENT_THAI">
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="DEPARTMENTID_ENG" HeaderText="DEPARTMENTID  ENGLISH"
                                        SortExpression="DEPARTMENTID_ENG">
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
                        <td style="width: 119px; height: 50px">
                        </td>
                        <td style="width: 278px; height: 50px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 9px">
                        </td>
                        <td style="width: 128px; height: 9px">
                        </td>
                        <td style="width: 235px; height: 9px">
                        </td>
                        <td style="width: 119px; height: 9px">
                        </td>
                        <td style="width: 278px; height: 9px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 9px">
                        </td>
                        <td style="width: 128px; height: 9px">
                            <span style="font-size: 10pt">
                            <font color="#FF0000"><b>Degree Level</b></font><strong><span style="color: #ff0000">:</span></strong></span></td>
                        <td style="width: 235px; height: 9px">
                            <asp:DropDownList ID="DegreeLevel" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                Width="195px">
                                <asp:ListItem Selected="True">&lt;&lt;ระดับปริญญา&gt;&gt;</asp:ListItem>
                                <asp:ListItem>ปริญญาตรี</asp:ListItem>
                                <asp:ListItem>ปริญญาโท</asp:ListItem>
                                <asp:ListItem>ปริญญาเอก</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 119px; height: 9px">
                            <strong><span style="color: #ff0000; font-size: 10pt;">Degree &nbsp;Name :</span></strong></td>
                        <td style="width: 278px; height: 9px"><asp:DropDownList ID="DegreeName" runat="server" DataTextField="DEGREE_NAME" AutoPostBack="True" Width="195px">
                            <asp:ListItem>&lt;&lt;หลักสูตร&gt;&gt;</asp:ListItem>
                        </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 31px;">
                        </td>
                        <td style="width: 128px; height: 31px;">
                            <span style="color: #ff0000"><span style="font-size: 10pt"><strong>Facult</strong><strong> :</strong></span></span></td>
                        <td style="width: 235px; height: 31px;">
                            <asp:DropDownList ID="FacultList" runat="server" DataTextField="FACULTY_THAI"  AppendDataBoundItems="False" AutoPostBack="True" Width="195px">
                                <asp:ListItem>&lt;&lt;คณะวิชา&gt;&gt;</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 119px; height: 31px;">
                            </td>
                        <td style="width: 278px; height: 31px;">
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 30px;">
                        </td>
                        <td style="width: 128px;">
                        </td>
                        <td style="width: 235px;">
                        </td>
                        <td abbr="AddD" style="width: 119px;">
                        </td>
                        <td style="width: 278px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 31px">
                        </td>
                        <td style="width: 128px; height: 31px">
                            <span style="font-size: 10pt">
                            Department Thai :</span></td>
                        <td style="width: 235px; height: 31px">
                            <asp:TextBox ID="AddDepartmentThai" runat="server" Width="220px"></asp:TextBox></td>
                        <td abbr="AddD" style="width: 119px; height: 31px">
                            <span style="font-size: 10pt">
                            Department English :</span></td>
                        <td style="width: 278px; height: 31px">
                            <asp:TextBox ID="AddDepartmentEng" runat="server" Width="208px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 30px;">
                        </td>
                        <td style="width: 128px;">
                        </td>
                        <td colspan="2">
                        </td>
                        <td style="width: 278px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 24px;">
                        </td>
                        <td style="width: 128px; height: 24px;">
                        </td>
                        <td colspan="2" style="height: 24px"><asp:ImageButton ID="AddBaseDegree" runat="server" ImageUrl="~/Picture_Files/save.JPG" Height="30px" Width="30px" ToolTip="บันทึก" />
                            &nbsp; &nbsp;
                            <asp:ImageButton ID="EditBaseDegree" runat="server" Height="30px" ImageUrl="~/Picture_Files/Edit.jpg"
                                Width="30px" ToolTip="แก้ไข" />
                            &nbsp; &nbsp;
                            <asp:ImageButton ID="DeleteDepartment" runat="server" Height="30px"
                                ImageUrl="~/Picture_Files/delete.JPG" Width="30px" ToolTip="ลบ" />
                            &nbsp; &nbsp;
                            <asp:ImageButton ID="ClearDegree" runat="server" Height="30px"
                                ImageUrl="~/Picture_Files/cl.JPG" Width="30px" ToolTip="ยกเลิก" />&nbsp;</td>
                        <td style="width: 278px; height: 24px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px;">
                        </td>
                        <td style="width: 128px;">
                        </td>
                        <td style="width: 235px;">
                        </td>
                        <td style="width: 119px;">
                        </td>
                        <td style="width: 278px;">
                        </td>
                    </tr>
                </table>
                </div>
        </div>
    </form>
</body>
</html>