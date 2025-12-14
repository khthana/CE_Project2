<%@ Page Language="vb" AutoEventWireup="false" Codebehind="flightstatus.aspx.vb" Inherits="skyhighbeta.flightstatus"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SkyHigh :: Flight Status</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" background="image/background.gif">
		<form id="Form1" method="post" runat="server">
			<table id="Table1" cellSpacing="0" cellPadding="0" width="800" align="center" border="0">
				<tr>
					<td align="center"><asp:image id="Image1" runat="server" ImageUrl="image/airflash2.jpg"></asp:image></td>
				</tr>
				<tr bgColor="#ffffee">
					<td>
						<TABLE id="Table2" style="FONT-SIZE: x-small; COLOR: black; FONT-FAMILY: Tahoma, 'Microsoft Sans Serif'"
							cellSpacing="0" cellPadding="2" width="96%" align="center">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 16pt; COLOR: #cc6633; FONT-FAMILY: Tahoma; HEIGHT: 35px"
								vAlign="middle">
								<td>
									ARRIVALS&nbsp; &amp;&nbsp;DEPARTURES&nbsp;
									<asp:label id="lblStatus" runat="server" Visible="False" Font-Names="Tahoma" Font-Bold="True"
										ForeColor="OrangeRed" Font-Size="8pt"></asp:label></td>
							</tr>
							<TR>
								<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ff9933"
									align="left" height="24">&nbsp;
									<asp:label id="lblArrival" runat="server" Visible="False" Font-Names="Tahoma" Font-Bold="True"
										ForeColor="White" Font-Size="8pt"></asp:label>
									<asp:label id="lblDeparture" runat="server" Font-Size="8pt" ForeColor="White" Font-Bold="True"
										Font-Names="Tahoma" Visible="False"></asp:label></td>
							</TR>
							<tr bgColor="#ff9933">
								<TD style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma" align="center">
									<asp:datagrid id="grdDeparture" runat="server" Font-Size="8pt" ForeColor="Black" Font-Names="Tahoma"
										Visible="False" HorizontalAlign="Center" BackColor="#FFFFC1" AutoGenerateColumns="False" Width="100%"
										CellPadding="3" GridLines="None" PageSize="6" DataKeyField="FlightID">
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										<HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#FFCC33"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="FLIGHTID" ReadOnly="True" HeaderText="Flight">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="AIRCRAFT" HeaderText="Aircraft">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="DEPT_TIME" HeaderText="Scheduled">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="DEPT_ACTUAL" HeaderText="Actual Departure">
												<HeaderStyle Width="25%"></HeaderStyle>
												<ItemStyle ForeColor="Firebrick"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="AIRPORTNAME" HeaderText="Arrival Airport">
												<HeaderStyle HorizontalAlign="Left" Width="25%"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
										<PagerStyle Font-Size="X-Small" Font-Names="Microsoft Sans Serif" HorizontalAlign="Right" ForeColor="Yellow"
											BackColor="#FF9933" Mode="NumericPages"></PagerStyle>
									</asp:datagrid><asp:datagrid id="grdArrival" runat="server" Visible="False" Font-Names="Tahoma" ForeColor="Black"
										Font-Size="8pt" DataKeyField="FlightID" PageSize="6" GridLines="None" CellPadding="3" Width="100%" AutoGenerateColumns="False"
										BackColor="#FFFFC1" HorizontalAlign="Center">
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										<HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#FFCC33"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="FLIGHTID" ReadOnly="True" HeaderText="Flight">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="AIRCRAFT" HeaderText="Aircraft">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="ARR_TIME" HeaderText="Scheduled">
												<HeaderStyle Width="15%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="ARR_ACTUAL" HeaderText="Actual Arrival">
												<HeaderStyle Width="25%"></HeaderStyle>
												<ItemStyle ForeColor="Firebrick"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="AIRPORTNAME" HeaderText="Departure Airport">
												<HeaderStyle HorizontalAlign="Left" Width="25%"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
										<PagerStyle Font-Size="X-Small" Font-Names="Microsoft Sans Serif" HorizontalAlign="Right" ForeColor="Yellow"
											BackColor="#FF9933" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></TD>
							</tr>
							<tr>
								<td align="center" style="HEIGHT: 19px"></td>
							</tr>
							<TR height="20">
								<TD></TD>
							</TR>
						</TABLE>
				<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; TEXT-ALIGN: center" bgColor="#ff9933">
					<td height="24">| <A href="http://161.246.5.166">Terms &amp; Conditions</A> | <A href="http://161.246.5.166">
							Conditions of Carriage</A> | <A href="http://161.246.5.166">Privacy &amp; 
							Security</A> |
					</td>
				</tr>
				<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; TEXT-ALIGN: center" height="30">
					<td>Copyright 2006 SkyHigh Alliance Co., Ltd. All reserved.
					</td>
				</tr>
				</td></tr>
			</table>
		</form>
	</body>
</HTML>
