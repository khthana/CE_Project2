<%@ Page Language="vb" AutoEventWireup="false" Codebehind="accHistoryPage.aspx.vb" Inherits="BillerBanking.accHistoryPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>Account History</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:datagrid id="DataGrid1" style="Z-INDEX: 107; LEFT: 64px; POSITION: absolute; TOP: 112px"
				runat="server" Width="624px" AutoGenerateColumns="False" BackColor="PapayaWhip">
				<SelectedItemStyle VerticalAlign="Middle"></SelectedItemStyle>
				<EditItemStyle VerticalAlign="Middle"></EditItemStyle>
				<AlternatingItemStyle VerticalAlign="Middle" BackColor="White"></AlternatingItemStyle>
				<ItemStyle VerticalAlign="Middle" BackColor="White"></ItemStyle>
				<HeaderStyle Font-Names="Arial" Font-Bold="True" HorizontalAlign="Center" ForeColor="DimGray"></HeaderStyle>
				<FooterStyle VerticalAlign="Middle"></FooterStyle>
				<Columns>
					<asp:BoundColumn DataField="DUE_DATE" ReadOnly="True" HeaderText="Date"></asp:BoundColumn>
					<asp:BoundColumn DataField="WITHDRAW" ReadOnly="True" HeaderText="Withdraw" DataFormatString="{0,1:C}"></asp:BoundColumn>
					<asp:BoundColumn DataField="DEPOSIT" ReadOnly="True" HeaderText="Deposit" DataFormatString="{0,1:C}"></asp:BoundColumn>
					<asp:BoundColumn DataField="FEE" ReadOnly="True" HeaderText="Fee" DataFormatString="{0,1:C}"></asp:BoundColumn>
					<asp:BoundColumn DataField="BALANCE" ReadOnly="True" HeaderText="Remain Balance" DataFormatString="{0,1:C}"></asp:BoundColumn>
				</Columns>
				<PagerStyle VerticalAlign="Middle" BackColor="White"></PagerStyle>
			</asp:datagrid>
			<asp:label id="Label1" style="Z-INDEX: 102; LEFT: 304px; POSITION: absolute; TOP: 32px" runat="server"
				Font-Bold="True" Font-Names="Arial" Font-Size="Medium">Account History</asp:label>
			<asp:label id="Label2" style="Z-INDEX: 103; LEFT: 64px; POSITION: absolute; TOP: 72px" runat="server"
				Font-Bold="True" Font-Names="Arial" Font-Size="Smaller">Account No.</asp:label>
			<asp:label id="Label3" style="Z-INDEX: 104; LEFT: 64px; POSITION: absolute; TOP: 88px" runat="server"
				Font-Bold="True" Font-Names="Arial" Font-Size="Smaller">Merchant Name</asp:label>
			<asp:Label id="accNoLabel" style="Z-INDEX: 105; LEFT: 176px; POSITION: absolute; TOP: 72px"
				runat="server" Font-Names="Microsoft Sans Serif" Font-Size="Smaller" ForeColor="Blue"></asp:Label>
			<asp:Label id="merNameLabel" style="Z-INDEX: 106; LEFT: 176px; POSITION: absolute; TOP: 88px"
				runat="server" Font-Names="Microsoft Sans Serif" Font-Size="Smaller" ForeColor="Blue"></asp:Label>
		</form>
	</body>
</HTML>
