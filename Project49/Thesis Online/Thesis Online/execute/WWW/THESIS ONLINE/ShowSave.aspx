<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ShowSave.aspx.vb" Inherits="ShowSave" %>

<% 
    If Session("Status") <> "K" Then
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
<body bgcolor="lightblue">
    <center>
        <form id="form1" runat="server">
            <div style="text-align: center">
                <table bgcolor="#ffffff" style="table-layout: fixed; font-size: 16pt; width: 730px;
                    color: #6666cc; font-family: 'Angsana New', Sans-Serif; text-align: left">
                    <tr>
                        <td style="width: 18px; text-align: left">
                        </td>
                        <td style="width: 120px; text-align: left; vertical-align: top;">
                        </td>
                        <td style="width: 255px">
                        </td>
                        <td style="width: 134px">
                        </td>
                        <td style="width: 261px">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="height: 103px; text-align: center">
                            <img border="0" src="Picture_Files/Head.jpg" style="width: 802px; height: 105px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 18px; text-align: left;">
                        </td>
                        <td style="width: 120px; text-align: left; vertical-align: top;">
                        </td>
                        <td style="width: 255px;">
                        </td>
                        <td style="width: 134px;">
                        </td>
                        <td style="width: 261px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 66px; text-align: center" colspan="5">
                            <table style="border-right: black thin solid; table-layout: fixed; border-top: black thin solid;
                                vertical-align: middle; border-left: black thin solid; width: 100%; border-bottom: black thin solid;
                                border-collapse: collapse; text-align: center">
                                <tr>
                                    <td bgcolor="#ff3300" style="width: 102px; height: 21px">
                                    </td>
                                    <td bgcolor="#ff3300" style="width: 98px; height: 21px">
                                        <img height="10" src="./Picture_Files/P27.GIF" width="10" /><asp:HyperLink ID="HyperLink1"
                                            runat="server" Font-Bold="True" Font-Size="Smaller" Font-Strikeout="False" ForeColor="Black"
                                            NavigateUrl="~/Default.aspx" Width="46px">[ Menu ]</asp:HyperLink></td>
                                    <td bgcolor="#ff3300" style="width: 134px; height: 21px">
                                        <img height="10" src="./Picture_Files/P27.GIF" width="10" />
                                        <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Size="Smaller"
                                            Font-Strikeout="False" ForeColor="Black" NavigateUrl="~/Inputdata.aspx" Width="112px">[ New MetaData ]</asp:HyperLink></td>
                                    <td bgcolor="#ff3300" style="width: 121px; height: 21px">
                                        <img height="10" src="./Picture_Files/P27.GIF" width="10" /><asp:LinkButton ID="Edit"
                                            runat="server" Font-Bold="True" Font-Overline="False" Font-Size="Smaller" ForeColor="Black"
                                            PostBackUrl="~/Editdata.aspx">[ Edit ]</asp:LinkButton></td>
                                    <td bgcolor="#ff3300" style="width: 120px; height: 21px">
                                        <img height="10" src="./Picture_Files/P27.GIF" width="10" />
                                        <asp:HyperLink ID="HyperLink3" runat="server" Font-Bold="True" Font-Size="Smaller"
                                            Font-Strikeout="False" ForeColor="Black" NavigateUrl="~/Show.aspx" Width="88px">[ Show Data ]</asp:HyperLink></td>
                                    <td bgcolor="#ff3300" style="width: 136px; height: 21px">
                                        <img height="10" src="./Picture_Files/P27.GIF" width="10" />
                                        <asp:HyperLink ID="HyperLink4" runat="server" Font-Bold="True" Font-Size="Smaller"
                                            Font-Strikeout="False" ForeColor="Black" NavigateUrl="~/Index.aspx" Width="86px">[ Sign Out ]</asp:HyperLink></td>
                                    <td bgcolor="#ff3300" style="height: 21px">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 18px; height: 30px; text-align: left">
                        </td>
                        <td style="vertical-align: top; width: 120px; text-align: left">
                        </td>
                        <td style="width: 255px; height: 30px; text-align: center">
                        </td>
                        <td style="width: 134px; height: 30px">
                        </td>
                        <td style="width: 261px; height: 30px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 18px; height: 5px; text-align: left">
                        </td>
                        <td style="width: 120px; text-align: left; vertical-align: top;">
                            Call Number :</td>
                        <td colspan="2" style="height: 5px">
                            &nbsp;<asp:Label ID="CallNumber" runat="server" ForeColor="#000000" Width="114px"></asp:Label></td>
                        <td style="font-weight: bold; font-size: 15pt; width: 261px; height: 5px">
                        </td>
                    </tr>
                    <tr style="font-weight: bold; font-size: 15pt">
                        <td height="15" style="width: 18px">
                        </td>
                        <td height="15" style="width: 120px; vertical-align: top; text-align: left;">
                        </td>
                        <td height="15" style="width: 255px">
                        </td>
                        <td height="15" style="width: 134px">
                        </td>
                        <td height="15" style="width: 261px">
                        </td>
                    </tr>
                    <tr style="font-weight: bold; font-size: 15pt">
                        <td style="width: 18px; height: 15px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            <span style="font-size: 16pt; color: #ff0000">Title</span></td>
                        <td style="font-size: 16pt; width: 255px; color: #6666cc; height: 15px">
                        </td>
                        <td style="font-size: 16pt; width: 134px; color: #6666cc; height: 15px">
                        </td>
                        <td style="font-size: 16pt; width: 261px; color: #6666cc; height: 15px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt; color: #6666cc">
                        <td style="width: 18px; height: 31px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Thai Title :</td>
                        <td colspan="3" style="font-size: 15pt; color: #ff0000; height: 31px">
                            <asp:Label ID="ThaiTitle" runat="server" ForeColor="#000000" Width="642px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 15pt; color: #ff0000">
                        <td style="width: 18px; height: 31px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            <span style="font-size: 16pt; color: #6666cc">English Title :</span></td>
                        <td colspan="3" style="font-weight: bold; font-size: 16pt; color: #6666cc; height: 31px">
                            <asp:Label ID="EnglishTitle" runat="server" Font-Bold="False" ForeColor="#000000"
                                Width="642px"></asp:Label></td>
                    </tr>
                    <tr style="font-weight: bold; font-size: 16pt; color: #6666cc">
                        <td style="width: 18px; height: 15px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                        </td>
                        <td style="width: 255px; height: 15px">
                        </td>
                        <td style="width: 134px; height: 15px">
                        </td>
                        <td style="width: 261px; height: 15px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt; color: #6666cc">
                        <td height="15" style="width: 18px">
                        </td>
                        <td height="15" style="width: 120px; text-align: left; vertical-align: top;">
                            <span style="color: #ff0000"><strong>Creator </strong></span>
                        </td>
                        <td height="15" style="font-size: 16pt; width: 255px; color: #6666cc">
                            <asp:SqlDataSource ID="SqlCreator" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisOnline %>"
                                SelectCommand="SELECT [CREATOR_NAME], [CREATOR_ENGLIST], [CREATOR_E_MAIL], [CREATOR_ORG_NAME] FROM [DC_CREATOR] WHERE ([BOOK_ID] = @BOOK_ID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="BOOK_ID" QueryStringField="BookId" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td height="15" style="font-size: 16pt; width: 134px; color: #6666cc">
                        </td>
                        <td height="15" style="font-size: 16pt; width: 261px; color: #6666cc">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 18px; height: 14px;">
                        </td>
                        <td colspan="4" contenteditable="" style="vertical-align: top; width: 133px; text-align: left;">
                            <asp:DataList ID="DataList1" runat="server" ShowFooter="False" ShowHeader="False"
                                DataSourceID="SqlCreator">
                                <ItemTemplate>
                                    <table bgcolor="#ffffff" style="table-layout: fixed; font-size: 16pt; width: 730px;
                                        color: #6666cc; font-family: 'Angsana New', Sans-Serif; text-align: left">
                                        <tr>
                                            <td style="width: 117px">
                                                Thai Creator :</td>
                                            <td style="width: 260px">
                                                <asp:Label ID="ThaiCreator" runat="server" Text='<%# Eval("CREATOR_NAME") %>' Width="217px"
                                                    ForeColor="Black"></asp:Label></td>
                                            <td style="width: 134px">
                                                English Creator :</td>
                                            <td style="width: 261px">
                                                <asp:Label ID="EnglishCreator" runat="server" Text='<%# Eval("CREATOR_ENGLIST") %>'
                                                    Width="217px" ForeColor="Black"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 117px">
                                                Org Name :</td>
                                            <td style="width: 260px">
                                                <asp:Label ID="OrgName" runat="server" Text='<%# Eval("CREATOR_ORG_NAME") %>' Width="217px"
                                                    ForeColor="Black"></asp:Label></td>
                                            <td style="width: 134px">
                                                E-Mail :</td>
                                            <td style="width: 261px">
                                                <asp:Label ID="EMail" runat="server" Text='<%# Eval("CREATOR_E_MAIL") %>' Width="217px"
                                                    ForeColor="Black"></asp:Label></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px; height: 11px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            <span style="color: #ff0000"><strong>Adviser</strong></span></td>
                        <td style="width: 255px; color: #6666cc; height: 11px">
                            <asp:SqlDataSource ID="SqlDataAdviser" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisOnline %>"
                                SelectCommand="SELECT DC_CONTRIBUTOR.CONTRIBUTOR_NAME, DC_CONTRIBUTOR.CONTRIBUTOR_ENGLISH, DC_CONTRIBUTOR.CONTRIBUTOR_E_MAIL, DC_CONTRIBUTOR.CONTRIBUTOR_ROLES FROM DC_CONTRIBUTOR INNER JOIN SUB_BOOK ON DC_CONTRIBUTOR.CONTRIBUTOR_ID = SUB_BOOK.CONTRIBUTOR_ID WHERE (SUB_BOOK.BOOK_ID = @BOOK_ID)"
                                ProviderName="<%$ ConnectionStrings:ThesisOnline.ProviderName %>">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="BOOK_ID" QueryStringField="BookId" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="width: 134px; color: #6666cc; height: 11px">
                        </td>
                        <td style="width: 261px; color: #6666cc; height: 11px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt; color: #6666cc">
                        <td style="width: 18px; height: 12px">
                        </td>
                        <td colspan="4" style="vertical-align: top; width: 133px; text-align: left;">
                            <asp:DataList ID="DataList2" runat="server" ShowFooter="False" ShowHeader="False"
                                DataSourceID="SqlDataAdviser">
                                <ItemTemplate>
                                    <table bgcolor="#ffffff" style="table-layout: fixed; font-size: 16pt; width: 730px;
                                        color: #6666cc; font-family: 'Angsana New', Sans-Serif; text-align: left">
                                        <tr>
                                            <td style="width: 117px; height: 31px;">
                                                Thai Adviser :</td>
                                            <td style="width: 256px; height: 31px;">
                                                <asp:Label ID="ThaiCreator" runat="server" Text='<%# Eval("CONTRIBUTOR_NAME") %>'
                                                    Width="217px" ForeColor="Black"></asp:Label></td>
                                            <td style="width: 134px; height: 31px;">
                                                English Adviser :</td>
                                            <td style="width: 261px; height: 31px;">
                                                <asp:Label ID="EnglishCreator" runat="server" Text='<%# Eval("CONTRIBUTOR_ENGLISH") %>'
                                                    Width="217px" ForeColor="Black"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 117px">
                                                Roles :</td>
                                            <td style="width: 256px">
                                                <asp:Label ID="OrgName" runat="server" Text='<%# Eval("CONTRIBUTOR_ROLES") %>' Width="217px"
                                                    ForeColor="Black"></asp:Label></td>
                                            <td style="width: 134px">
                                                E-Mail :</td>
                                            <td style="width: 261px">
                                                <asp:Label ID="EMail" runat="server" Text='<%# Eval("CONTRIBUTOR_E_MAIL") %>' Width="217px"
                                                    ForeColor="Black"></asp:Label></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                        </td>
                        <td style="width: 255px">
                        </td>
                        <td style="width: 134px">
                        </td>
                        <td style="width: 261px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            <span style="color: #ff0000"><strong>Degree</strong></span></td>
                        <td style="font-size: 16pt; width: 255px; color: #6666cc">
                        </td>
                        <td style="font-size: 16pt; width: 134px; color: #6666cc">
                        </td>
                        <td style="font-size: 16pt; width: 261px; color: #6666cc">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt; color: #6666cc">
                        <td style="width: 18px; height: 27px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Degree Level :</td>
                        <td style="width: 255px; height: 27px">
                            <asp:Label ID="DegreeLevel" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                        <td style="width: 134px; height: 27px">
                            Degree &nbsp;Name :</td>
                        <td style="width: 261px; height: 27px">
                            <asp:Label ID="DegreeName" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px; height: 19px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Faculty Thai :</td>
                        <td style="width: 255px; height: 19px">
                            <asp:Label ID="FacultyThai" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                        <td style="width: 134px; height: 19px">
                            Faculty English :</td>
                        <td style="width: 261px; height: 19px">
                            <asp:Label ID="FacultyEnglish" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px; height: 30px;">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Department Thai<span> :</span></td>
                        <td style="width: 255px; height: 30px;">
                            <asp:Label ID="DepartmentThai" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                        <td style="width: 134px; height: 30px;">
                            Department English <span>:</span></td>
                        <td style="width: 261px; height: 30px;">
                            <asp:Label ID="DepartmentEnglish" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Desciption <span>Thai :</span></td>
                        <td style="width: 255px">
                            <asp:Label ID="DesciptionThai" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                        <td style="width: 134px">
                            Descipline <span>English :</span></td>
                        <td style="width: 261px">
                            <asp:Label ID="DesciplineEnglish" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px; height: 26px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Degree Grantor :</td>
                        <td colspan="3" style="height: 26px">
                            <asp:Label ID="DegreeGrantor" runat="server" ForeColor="Black" Width="502px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td height="15" style="width: 18px">
                        </td>
                        <td height="15" style="width: 120px; vertical-align: top; text-align: left;">
                        </td>
                        <td height="15" style="width: 255px">
                        </td>
                        <td height="15" style="width: 134px">
                        </td>
                        <td height="15" style="width: 261px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td height="15" style="width: 18px">
                        </td>
                        <td height="15" style="width: 120px; vertical-align: top; text-align: left;">
                            <span style="color: #ff0000"><strong>Publisher </strong></span>
                        </td>
                        <td height="15" style="width: 255px; color: #6666cc">
                        </td>
                        <td height="15" style="width: 134px; color: #6666cc">
                        </td>
                        <td height="15" style="width: 261px; color: #6666cc">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt; color: #6666cc">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Publisher Name :</td>
                        <td style="width: 255px">
                            <asp:Label ID="PublisherName" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                        <td style="width: 134px">
                            URL :</td>
                        <td style="width: 261px">
                            <asp:Label ID="URL" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Place :</td>
                        <td style="width: 255px">
                            <asp:Label ID="Place" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                        <td style="width: 134px">
                            E-Mail :</td>
                        <td style="width: 261px">
                            <asp:Label ID="EMail" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td height="15" style="width: 18px">
                        </td>
                        <td height="15" style="width: 120px; vertical-align: top; text-align: left;">
                        </td>
                        <td height="15" style="width: 255px">
                        </td>
                        <td height="15" style="width: 134px">
                        </td>
                        <td height="15" style="width: 261px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px; height: 34px;">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Year Created Thai :</td>
                        <td style="width: 255px; height: 34px;">
                            <asp:Label ID="YearThai" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                        <td style="width: 134px; height: 34px;">
                            Year Created English :</td>
                        <td style="width: 261px; height: 34px;">
                            <asp:Label ID="YearEnglish" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px; height: 35px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Date Issued :</td>
                        <td style="width: 255px; height: 35px">
                            <asp:Label ID="DateIssued" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                        <td style="width: 134px; height: 35px">
                            Date Modified :</td>
                        <td style="width: 261px; height: 35px">
                            <asp:Label ID="DateModified" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px; height: 30px;">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            ISSN :</td>
                        <td style="width: 255px; height: 30px;">
                            <asp:Label ID="ISSN" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                        <td style="width: 134px; height: 30px;">
                            ISBN :
                        </td>
                        <td style="width: 261px; height: 30px;">
                            <asp:Label ID="ISBN" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Rights :</td>
                        <td colspan="3">
                            <asp:Label ID="Rights" runat="server" ForeColor="Black" Width="558px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Rights &nbsp;Access :</td>
                        <td colspan="3">
                            <asp:Label ID="RightsAccess" runat="server" ForeColor="Black" Width="556px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td height="15" style="width: 18px">
                        </td>
                        <td height="15" style="width: 120px; vertical-align: top; text-align: left;">
                        </td>
                        <td height="15" style="width: 255px">
                        </td>
                        <td height="15" style="width: 134px">
                        </td>
                        <td height="15" style="width: 261px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Thai Eng :</td>
                        <td style="width: 255px">
                            <asp:Label ID="ThaiEng" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                        <td style="width: 134px">
                            Format :</td>
                        <td style="width: 261px">
                            <asp:Label ID="Format" runat="server" ForeColor="Black" Width="250px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td height="15" style="width: 18px">
                        </td>
                        <td height="15" style="width: 120px; vertical-align: top; text-align: left;">
                        </td>
                        <td height="15" style="width: 255px">
                        </td>
                        <td height="15" style="width: 134px">
                        </td>
                        <td height="15" style="width: 261px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Subject :</td>
                        <td colspan="3">
                            <asp:Label ID="Subject" runat="server" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                        </td>
                        <td style="width: 255px">
                        </td>
                        <td style="width: 134px">
                        </td>
                        <td style="width: 261px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Abstract Thai :</td>
                        <td colspan="3">
                            <asp:Label ID="AbstractThai" runat="server" Font-Size="Smaller" ForeColor="Black"
                                Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                        </td>
                        <td style="width: 255px">
                        </td>
                        <td style="width: 134px">
                        </td>
                        <td style="width: 261px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Abstract English :</td>
                        <td colspan="3">
                            <asp:Label ID="AbstractEnglish" runat="server" Font-Size="Smaller" ForeColor="Black"
                                Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                        </td>
                        <td style="width: 255px">
                        </td>
                        <td style="width: 134px">
                        </td>
                        <td style="width: 261px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Contents :</td>
                        <td colspan="3">
                            <asp:Label ID="Contents" runat="server" ForeColor="Black" Width="650px" Font-Size="Smaller"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                        </td>
                        <td style="width: 255px">
                        </td>
                        <td style="width: 134px">
                        </td>
                        <td style="width: 261px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Illustrative :</td>
                        <td colspan="3">
                            <asp:Label ID="Illustrative" runat="server" ForeColor="Black" Width="650px" Font-Size="Smaller"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px; height: 31px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                        </td>
                        <td style="width: 255px; height: 31px">
                        </td>
                        <td style="width: 134px; height: 31px">
                        </td>
                        <td style="width: 261px; height: 31px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            <strong><span style="color: #ff0000">Chapter&nbsp;</span></strong></td>
                        <td colspan="3">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px; height: 27px">
                        </td>
                        <td style="vertical-align: top; text-align: left; width: 120px;">
                            Chapter 1 :</td>
                        <td colspan="3" style="vertical-align: top; text-align: left">
                            <asp:Label ID="Chapter1" runat="server" Font-Size="Smaller" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="vertical-align: top; text-align: left; width: 120px;">
                            Chapter 2 :</td>
                        <td colspan="3" style="vertical-align: top; text-align: left">
                            <asp:Label ID="Chapter2" runat="server" Font-Size="Smaller" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="vertical-align: top; text-align: left; width: 120px;">
                            Chapter 3 :</td>
                        <td colspan="3" style="vertical-align: top; text-align: left">
                            <asp:Label ID="Chapter3" runat="server" Font-Size="Smaller" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="vertical-align: top; text-align: left; width: 120px;">
                            Chapter 4 :</td>
                        <td colspan="3" style="vertical-align: top; text-align: left">
                            <asp:Label ID="Chapter4" runat="server" Font-Size="Smaller" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="vertical-align: top; text-align: left; width: 120px;">
                            Chapter 5 :</td>
                        <td colspan="3" style="vertical-align: top; text-align: left">
                            <asp:Label ID="Chapter5" runat="server" Font-Size="Smaller" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="vertical-align: top; text-align: left; width: 120px;">
                            Chapter 6 :</td>
                        <td colspan="3" style="vertical-align: top; text-align: left">
                            <asp:Label ID="Chapter6" runat="server" Font-Size="Smaller" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="vertical-align: top; text-align: left; width: 120px;">
                            Chapter 7 :</td>
                        <td colspan="3" style="vertical-align: top; text-align: left">
                            <asp:Label ID="Chapter7" runat="server" Font-Size="Smaller" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px;">
                        </td>
                        <td style="vertical-align: top; text-align: left; width: 120px;">
                            Chapter 8 :</td>
                        <td colspan="3" style="vertical-align: top; text-align: left">
                            <asp:Label ID="Chapter8" runat="server" Font-Size="Smaller" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="vertical-align: top; text-align: left; width: 120px;">
                            Chapter 9 :</td>
                        <td colspan="3" style="vertical-align: top; text-align: left">
                            <asp:Label ID="Chapter9" runat="server" Font-Size="Smaller" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="vertical-align: top; text-align: left; width: 120px;">
                            Chapter 10 :</td>
                        <td colspan="3" style="vertical-align: top; text-align: left">
                            <asp:Label ID="Chapter10" runat="server" Font-Size="Smaller" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="vertical-align: top; text-align: left; width: 120px;">
                            Chapter 11 :</td>
                        <td colspan="3" style="vertical-align: top; text-align: left">
                            <asp:Label ID="Chapter11" runat="server" Font-Size="Smaller" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px; height: 31px;">
                        </td>
                        <td style="vertical-align: top; text-align: left; width: 120px; height: 31px;">
                            Chapter 12 :</td>
                        <td colspan="3" style="vertical-align: top; text-align: left; height: 31px;">
                            <asp:Label ID="Chapter12" runat="server" Font-Size="Smaller" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="vertical-align: top; text-align: left; width: 120px;">
                            Chapter 13 :</td>
                        <td colspan="3" style="vertical-align: top; text-align: left">
                            <asp:Label ID="Chapter13" runat="server" Font-Size="Smaller" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="vertical-align: top; text-align: left; width: 120px;">
                            Chapter 14 :</td>
                        <td colspan="3" style="vertical-align: top; text-align: left">
                            <asp:Label ID="Chapter14" runat="server" Font-Size="Smaller" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="vertical-align: top; text-align: left; width: 120px;">
                            Chapter 15 :</td>
                        <td colspan="3" style="vertical-align: top; text-align: left">
                            <asp:Label ID="Chapter15" runat="server" Font-Size="Smaller" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="vertical-align: top; width: 120px; text-align: right">
                        </td>
                        <td colspan="2">
                        </td>
                        <td style="width: 261px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Appendix :</td>
                        <td colspan="3">
                            <asp:Label ID="Appendix" runat="server" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                        </td>
                        <td style="width: 255px">
                        </td>
                        <td style="width: 134px">
                        </td>
                        <td style="width: 261px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Bibliography :</td>
                        <td colspan="3">
                            <asp:Label ID="Bibliography" runat="server" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                        </td>
                        <td style="width: 255px">
                        </td>
                        <td style="width: 134px">
                        </td>
                        <td style="width: 261px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                            Keyword :</td>
                        <td colspan="3">
                            <asp:Label ID="Keyword" runat="server" ForeColor="Black" Width="650px"></asp:Label></td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px; height: 32px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left; height: 32px;">
                        </td>
                        <td style="width: 255px; height: 32px">
                        </td>
                        <td style="width: 134px; height: 32px">
                        </td>
                        <td style="width: 261px; height: 32px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                        </td>
                        <td style="width: 255px; text-align: center">
                        </td>
                        <td style="width: 134px; text-align: center">
                        </td>
                        <td style="width: 261px">
                        </td>
                    </tr>
                    <tr style="font-size: 16pt">
                        <td style="width: 18px; height: 31px">
                        </td>
                        <td style="width: 120px; vertical-align: top; text-align: left;">
                        </td>
                        <td style="width: 255px; height: 31px">
                            &nbsp;</td>
                        <td style="width: 134px; height: 31px">
                        </td>
                        <td style="width: 261px; height: 31px">
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </center>
</body>
</html>
