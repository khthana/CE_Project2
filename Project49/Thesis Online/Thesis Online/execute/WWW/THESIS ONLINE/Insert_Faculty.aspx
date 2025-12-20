<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Insert_Faculty.aspx.vb" Inherits="Insert_Faculty" Culture="th-TH" %>
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
                <table style="table-layout: fixed; font-size: small; width: 730px; text-align: left">
                    <tr>
                        <td style="width: 30px; text-align: left; height: 30px;">
                        </td>
                        <td style="width: 128px; text-align: left; height: 30px;">
                        </td>
                        <td style="width: 237px; height: 30px;">
                        </td>
                        <td style="width: 98px; height: 30px;">
                        </td>
                        <td style="width: 293px; height: 30px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px">
                        </td>
                        <td style="width: 128px">
                            <span style="color: #ff0000"><strong>Search&nbsp; </strong></span>
							<font color="#FF0000"><b>Faculty </b></font>
							<span style="color: #ff0000"><strong>:</strong></span></td>
                        <td style="width: 237px">
                            <asp:TextBox ID="SearchFaculty" runat="server" Columns="40" ToolTip="ค้นหาคณะวิชา"
                                Width="219px"></asp:TextBox></td>
                        <td style="width: 98px">
                            &nbsp;<asp:ImageButton ID="SearchF" runat="server" ImageUrl="~/Picture_Files/Search.JPG" /></td>
                        <td style="width: 293px">
                            <asp:Label ID="MsgSearchFaculty" runat="server" Font-Bold="True" Font-Size="X-Small"
                                Style="font-weight: bold; font-size: 16px; color: red" Width="174px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 30px;">
                        </td>
                        <td style="width: 128px; height: 30px;">
                        </td>
                        <td style="width: 237px; height: 30px;">
                        </td>
                        <td style="width: 98px; height: 30px;">
                        </td>
                        <td style="width: 293px; height: 30px;">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="text-align: center">
                            <asp:DataGrid ID="DatagridA" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                BackColor="White" BorderColor="#3366CC" BorderStyle="None"
                                CellPadding="2" DataKeyField="FACULTYID" Font-Names="verdana"
                                HeaderStyle-BackColor="#99cccc" PageSize="5" Width="80%">
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
                                    <asp:BoundColumn DataField="FACULTY_THAI" HeaderText="FACULTY THAI" SortExpression="FACULTY_THAI">
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="FACULTY_ENGLISH" HeaderText="FACULTY ENGLISH" SortExpression="FACULTY_ENGLISH">
                                        <HeaderStyle Width="50%" />
                                    </asp:BoundColumn>
                                </Columns>
                            </asp:DataGrid></td>
                    </tr>
                    <tr>
                        <td colspan="5" rowspan="1" style="height: 50px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px;">
                        </td>
                        <td style="width: 128px;">
                        </td>
                        <td style="width: 237px;">
                        </td>
                        <td style="width: 98px;">
                        </td>
                        <td style="width: 293px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px;">
                        </td>
                        <td style="width: 128px;">
                            <font color="#FF0000"><b>Degree Level</b></font><strong><span style="color: #ff0000">:</span></strong></td>
                        <td style="width: 237px;">
                            <asp:DropDownList ID="DegreeLevel" runat="server" AppendDataBoundItems="True" Width="195px" AutoPostBack="True">
                                <asp:ListItem>&lt;&lt;ระดับปริญญา&gt;&gt;</asp:ListItem>
                                <asp:ListItem>ปริญญาตรี</asp:ListItem>
                                <asp:ListItem>ปริญญาโท</asp:ListItem>
                                <asp:ListItem>ปริญญาเอก</asp:ListItem>
                            </asp:DropDownList></td>
                        <td style="width: 98px;">
                            <strong><span style="color: #ff0000">Degree &nbsp;Name :</span></strong></td>
                        <td style="width: 293px;">
                            <asp:DropDownList ID="DegreeNameL" runat="server" DataTextField=DEGREE_NAME  AppendDataBoundItems="False" AutoPostBack="True" Width="195px">
                                  </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 17px;">
                        </td>
                        <td style="width: 128px; height: 17px;">
                            </td>
                        <td style="width: 237px; height: 17px;">
                            </td>
                        <td style="width: 98px; height: 17px;">
                            </td>
                        <td style="width: 293px; height: 17px;">
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 30px;">
                        </td>
                        <td style="width: 128px;">
                            <span style="color: #6666ff">
                            Faculty Thai :</span></td>
                        <td style="width: 237px;">
                            <asp:TextBox ID="AddFacultyThai" runat="server" Width="225px"></asp:TextBox></td>
                        <td abbr="AddD" style="width: 98px;">
                            <span style="color: #6666ff">
                            Faculty English :</span></td>
                        <td style="width: 293px;">
                            <asp:TextBox ID="AddFacultyEng" runat="server" Width="208px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 30px; height: 41px;">
                        </td>
                        <td style="width: 128px; height: 41px;">
                        </td>
                        <td colspan="2" style="height: 41px"><asp:ImageButton ID="AddBaseDegree" runat="server" ImageUrl="~/Picture_Files/save.JPG" Height="30px" Width="30px" ToolTip="บันทึก" />
                            &nbsp; &nbsp;
                            <asp:ImageButton ID="EditBaseDegree" runat="server" Height="30px" ImageUrl="~/Picture_Files/Edit.jpg"
                                Width="30px" ToolTip="แก้ไข" />
                            &nbsp; &nbsp;
                            <asp:ImageButton ID="DeleteBaseDegree" runat="server" Height="30px"
                                ImageUrl="~/Picture_Files/delete.JPG" Width="30px" ToolTip="ลบ" />
                            &nbsp; &nbsp;
                            <asp:ImageButton ID="ClearDegree" runat="server" Height="30px"
                                ImageUrl="~/Picture_Files/cl.JPG" Width="30px" ToolTip="ยกเลิก" />&nbsp;</td>
                        <td style="width: 293px; height: 41px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px;">
                        </td>
                        <td style="width: 128px;">
                        </td>
                        <td style="width: 237px;">
                        </td>
                        <td style="width: 98px;">
                        </td>
                        <td style="width: 293px;">
                        </td>
                    </tr>
                </table>
                </div>
        </div>
    </form>
</body>
</html>