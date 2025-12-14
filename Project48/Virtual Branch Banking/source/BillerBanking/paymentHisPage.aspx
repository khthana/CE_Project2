<%@ Page Language="vb" AutoEventWireup="false" Codebehind="paymentHisPage.aspx.vb" Inherits="BillerBanking.paymentHisPage"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>paymentCheckPage</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<asp:datagrid id="DataGrid1" style="Z-INDEX: 107; LEFT: 64px; POSITION: absolute; TOP: 112px"
					runat="server" BackColor="PapayaWhip" AutoGenerateColumns="False" Width="624px">
					<SelectedItemStyle VerticalAlign="Middle"></SelectedItemStyle>
					<EditItemStyle VerticalAlign="Middle"></EditItemStyle>
					<AlternatingItemStyle VerticalAlign="Middle" BackColor="White"></AlternatingItemStyle>
					<ItemStyle VerticalAlign="Middle" BackColor="White"></ItemStyle>
					<HeaderStyle Font-Names="Arial" Font-Bold="True" HorizontalAlign="Center" ForeColor="DimGray"></HeaderStyle>
					<FooterStyle VerticalAlign="Middle"></FooterStyle>
					<Columns>
						<asp:BoundColumn DataField="DUE_DATE" ReadOnly="True" HeaderText="Date"></asp:BoundColumn>
						<asp:BoundColumn DataField="MERCHANT_NAME" ReadOnly="True" HeaderText="To Merchant"></asp:BoundColumn>
						<asp:BoundColumn DataField="CUSTOMER_NAME" ReadOnly="True" HeaderText="From Customer"></asp:BoundColumn>
						<asp:BoundColumn DataField="PAY_BY" ReadOnly="True" HeaderText="Payment By"></asp:BoundColumn>
						<asp:BoundColumn DataField="AMOUNT" ReadOnly="True" HeaderText="Amount" DataFormatString="{0,1:C}"></asp:BoundColumn>
					</Columns>
					<PagerStyle VerticalAlign="Middle" BackColor="White"></PagerStyle>
				</asp:datagrid>
				<asp:label id="Label1" style="Z-INDEX: 102; LEFT: 304px; POSITION: absolute; TOP: 32px" runat="server"
					Font-Size="Medium" Font-Names="Arial" Font-Bold="True">Payment History</asp:label>
				<asp:label id="Label3" style="Z-INDEX: 104; LEFT: 64px; POSITION: absolute; TOP: 80px" runat="server"
					Font-Size="Smaller" Font-Names="Arial" Font-Bold="True">Merchant Name</asp:label>
				<asp:Label id="merNameLabel" style="Z-INDEX: 106; LEFT: 176px; POSITION: absolute; TOP: 80px"
					runat="server" Font-Size="Smaller" Font-Names="Microsoft Sans Serif" ForeColor="Blue"></asp:Label></FONT>
		</form>
	</body>
</HTML>
