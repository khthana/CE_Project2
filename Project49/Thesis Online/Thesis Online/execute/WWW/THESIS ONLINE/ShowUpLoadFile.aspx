<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ShowUpLoadFile.aspx.vb"
    Inherits="ShowUpLoadFile" %>

<% 
    If Session("Status") <> "U" Then
        If (Session("Status") <> "A") Then
            Response.Redirect("Login.aspx")
        End If
    End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body  bgcolor="lightblue">
     <center>
        <form id="form1" runat="server">
            <div >
                <table width="888px" bgcolor="#ffffff" style="vertical-align: top; ">
                    <tr>
                        <td colspan="3" style="text-align: center; height: 22px;">
                            <asp:Image ID="Image1" runat="server" Width="888px" Height="101" ImageUrl="~/Picture_Files/Head.jpg" /></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: center;">
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
                        <td colspan="3" style="text-align: center;">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="3" style="height: 26px; text-align: center">
                            <asp:DropDownList ID="DegreeLevel" runat="server" AutoPostBack="True" Width="132px">
                                <asp:ListItem Selected="True">&lt;&lt;ระดับปริญญา&gt;&gt;</asp:ListItem>
                                <asp:ListItem>ปริญญาตรี</asp:ListItem>
                                <asp:ListItem>ปริญญาโท</asp:ListItem>
                                <asp:ListItem>ปริญญาเอก</asp:ListItem>
                            </asp:DropDownList>&nbsp;<asp:DropDownList ID="FacultyList" runat="server" AutoPostBack="True"
                                DataTextField="FACULTY_THAI" Width="150px">
                                <asp:ListItem>&lt;&lt;คณะวิชา&gt;&gt;</asp:ListItem>
                            </asp:DropDownList>&nbsp;<asp:DropDownList ID="DepartmentThai" runat="server" AutoPostBack="True"
                                DataTextField="DEPARTMENT_THAI" Width="150px">
                                <asp:ListItem>&lt;&lt;ภาควิชา&gt;&gt;</asp:ListItem>
                            </asp:DropDownList>&nbsp;<asp:DropDownList ID="DesciptionThai" runat="server" AutoPostBack="True"
                                DataTextField="DESCIPTION_THAI" Width="150px">
                                <asp:ListItem Selected="True">&lt;&lt;สาขาวิชา&gt;&gt;</asp:ListItem>
                            </asp:DropDownList>&nbsp;<asp:DropDownList ID="YareListsh" runat="server" AutoPostBack="True"
                                Width="70px">
                                <asp:ListItem>&lt;&lt;ปี&gt;&gt;</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp; &nbsp;<asp:Button ID="Button1" runat="server" Text="แสดงข้อมูล" />
                            &nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="3" style="text-align: right">
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td colspan="3"  height="330" style="vertical-align: top; text-align: center">
                            &nbsp;<asp:DataGrid ID="Datagrid1" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None"
                                BorderWidth="1px" CellPadding="4" DataKeyField="Book_id" DataMember="DefaultView"
                                Font-Names="verdana" Font-Size="Smaller" HeaderStyle-BackColor="#99cccc" Height="19px"
                                Width="100%">
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <PagerStyle BackColor="#99CCCC" Font-Names="Verdana" Font-Size="Small" ForeColor="#003399"
                                    HorizontalAlign="Left" Mode="NumericPages" VerticalAlign="Middle" />
                                <ItemStyle BackColor="White" ForeColor="#003399" />
                                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                <Columns>
                                    <asp:ButtonColumn CommandName="Edit" Text="Select">
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <HeaderStyle Width="50px" />
                                    </asp:ButtonColumn>
                                    <asp:BoundColumn DataField="CALL_NUMBER" HeaderText="เลขหนังสือ" SortExpression="CALL_NUMBER">
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Left" VerticalAlign="Middle" Width="150px" />
                                        <HeaderStyle Width="150px" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="TITLE_THAI" HeaderText="เรื่อง" SortExpression="TITLE_THAI">
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Left" VerticalAlign="Middle" Width="500px"
                                            Wrap="False" />
                                        <HeaderStyle Width="500px" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="POSITIONFILE" HeaderText="สถานะ" SortExpression="POSITIONFILE">
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Middle" Width="110px" />
                                    </asp:BoundColumn>
                                    <asp:EditCommandColumn EditText="Edit" HeaderText="เพิ่มไฟล์" Visible="False"></asp:EditCommandColumn>
                                </Columns>
                            </asp:DataGrid>
                            &nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr style="font-size: 12pt">
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr >
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </div>
            
        </form>
    </center>
</body>
</html>
