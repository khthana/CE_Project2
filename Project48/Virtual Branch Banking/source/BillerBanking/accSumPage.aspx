<%@ Page Language="vb" AutoEventWireup="false" Codebehind="accSumPage.aspx.vb" Inherits="BillerBanking.accSumPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Account Summary</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:datagrid id="DataGrid1" style="Z-INDEX: 103; LEFT: 96px; POSITION: absolute; TOP: 72px" runat="server"
				Width="576px" AutoGenerateColumns="False" BackColor="PapayaWhip">
				<SelectedItemStyle VerticalAlign="Middle"></SelectedItemStyle>
				<EditItemStyle VerticalAlign="Middle"></EditItemStyle>
				<AlternatingItemStyle VerticalAlign="Middle" BackColor="White"></AlternatingItemStyle>
				<ItemStyle VerticalAlign="Middle" BackColor="White"></ItemStyle>
				<HeaderStyle Font-Names="Arial" Font-Bold="True" HorizontalAlign="Center" ForeColor="DimGray"></HeaderStyle>
				<FooterStyle VerticalAlign="Middle"></FooterStyle>
				<Columns>
					<asp:HyperLinkColumn DataNavigateUrlField="ACC_NO" DataNavigateUrlFormatString="accHistoryPage.aspx?accNo={0}"
						DataTextField="ACC_NO" HeaderText="Account No"></asp:HyperLinkColumn>
					<asp:BoundColumn DataField="ACC_TYPE" ReadOnly="True" HeaderText="Account Type"></asp:BoundColumn>
					<asp:BoundColumn DataField="CUR_BALANCE" ReadOnly="True" HeaderText="Current Balance" DataFormatString="{0,1:C}"></asp:BoundColumn>
					<asp:BoundColumn DataField="AVAL_BALANCE" ReadOnly="True" HeaderText="Available Balance" DataFormatString="{0,1:C}"></asp:BoundColumn>
				</Columns>
				<PagerStyle VerticalAlign="Middle" BackColor="White"></PagerStyle>
			</asp:datagrid>
			<asp:label id="Label1" style="Z-INDEX: 102; LEFT: 296px; POSITION: absolute; TOP: 24px" runat="server"
				Font-Bold="True" Font-Names="Arial" Font-Size="Medium">Account Summary</asp:label>
		</form>
	</body>
</HTML>
