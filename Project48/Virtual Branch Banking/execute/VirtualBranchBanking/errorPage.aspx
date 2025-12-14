<%@ Page Language="vb" AutoEventWireup="false" Codebehind="errorPage.aspx.vb" Inherits="VirtualBranchBanking.errorPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>errorPage</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:Label id="Label1" style="Z-INDEX: 100; LEFT: 56px; POSITION: absolute; TOP: 32px" runat="server"
				Font-Bold="True" Font-Names="Tahoma" Font-Size="Medium">Error</asp:Label>
			<asp:Label id="errorReasonLabel" style="Z-INDEX: 102; LEFT: 56px; POSITION: absolute; TOP: 96px"
				runat="server" Font-Names="Tahoma" Font-Size="Smaller" ForeColor="Blue"></asp:Label>
			<TABLE id="Table2" style="Z-INDEX: 112; LEFT: 216px; WIDTH: 520px; POSITION: absolute; TOP: 56px; HEIGHT: 21px"
				cellSpacing="0" cellPadding="0" width="520" border="0">
				<TR>
					<TD style="WIDTH: 14px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><STRONG><FONT face="Tahoma" size="2"></FONT></STRONG></TD>
					<TD style="WIDTH: 19px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><FONT face="Tahoma" size="2"><STRONG></STRONG></FONT></TD>
					<TD style="WIDTH: 55px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><STRONG><FONT face="Tahoma" color="#ffffff" size="2"></FONT></STRONG></TD>
					<TD style="WIDTH: 82px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><STRONG><FONT face="Tahoma" color="#ffffff" size="2"></FONT></STRONG></TD>
					<TD style="WIDTH: 120px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00401g.gif"><FONT face="Tahoma">&nbsp;&nbsp;<FONT size="2"><STRONG>
								</STRONG></FONT></FONT>
					</TD>
					<TD style="WIDTH: 45px; HEIGHT: 17px" background="\VirtualBranchBanking\picture\bb00403g.gif"><FONT face="Tahoma"></FONT></TD>
					<TD style="WIDTH: 54px; HEIGHT: 17px"><FONT face="Tahoma">
							<asp:imagebutton id="logoffButton" runat="server" Height="21px" Width="64px" BorderStyle="None" BorderWidth="0px"
								ImageUrl="\VirtualBranchBanking\picture\bg-end.jpg"></asp:imagebutton></FONT></TD>
				</TR>
			</TABLE>
			<TABLE id="Table3" style="Z-INDEX: 114; LEFT: 56px; WIDTH: 167px; POSITION: absolute; TOP: 56px; HEIGHT: 34px"
				cellSpacing="0" cellPadding="0" width="167" background="\VirtualBranchBanking\picture\bb00201g.gif"
				border="0">
				<TR>
					<TD background="file:///C:\Inetpub\wwwroot\VirtualBranchBanking\picture\bb00201g.gif"><FONT face="Arial" color="#ffffff"><FONT size="4"><STRONG>&nbsp;</STRONG></FONT><FONT face="Tahoma" size="2">Virtual 
								Branch Banking</FONT></FONT></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
