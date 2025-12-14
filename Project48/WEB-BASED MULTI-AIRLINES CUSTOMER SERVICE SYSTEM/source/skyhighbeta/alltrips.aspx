<%@ Page Language="vb" AutoEventWireup="false" Codebehind="alltrips.aspx.vb" Inherits="skyhighbeta.alltrips"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SkyHigh :: All Trips</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout" background="image/background.gif">
		<form id="Form1" method="post" runat="server">
			<table id="Table1" cellSpacing="0" cellPadding="0" width="800" align="center" border="0">
				<tr>
					<td align="center"><asp:image id="Image1" runat="server" ImageUrl="http://localhost/skyhighbeta/image/airflash2.jpg"></asp:image></td>
				</tr>
				<tr bgColor="#ffffee">
					<td>
						<TABLE id="Table2" style="FONT-SIZE: x-small; COLOR: black; FONT-FAMILY: Tahoma, 'Microsoft Sans Serif'"
							cellSpacing="0" cellPadding="2" width="96%" align="center">
							<tr height="12">
								<td bgColor="#ff9933" colSpan="6"></td>
							</tr>
							<TR style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: darkgray; FONT-FAMILY: Tahoma"
								height="24">
								<TD>&nbsp;CUSTOMER INFO &gt; ALL TRIPS</TD>
							</TR>
							<tr height="4">
								<td background="image/bar.gif"></td>
							</tr>
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 16pt; COLOR: #cc6633; FONT-FAMILY: Tahoma; HEIGHT: 35px"
								vAlign="middle">
								<td>ALL TRIPS
								</td>
							</tr>
							<TR>
								<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ff9933"
									align="left">&nbsp;All of your trips -
									<asp:Label id="lblMemberID" runat="server"></asp:Label></td>
							</TR>
							<tr bgColor="#ff9933">
								<TD style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma" align="center"><asp:datagrid id="grdAllTrips" runat="server" ForeColor="Black" GridLines="None" CellPadding="4"
										Width="100%" Font-Size="8pt" Font-Names="Tahoma" HorizontalAlign="Left" AutoGenerateColumns="False" DataKeyField="FlightID">
										<ItemStyle BackColor="#FFFFC1"></ItemStyle>
										<HeaderStyle Font-Bold="True" BackColor="#FFCC33"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="BookRef" HeaderText="Booking Reference">
												<HeaderStyle Width="10%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Leg">
												<HeaderStyle Width="8%"></HeaderStyle>
												<ItemTemplate>
													<%# GetLeg(Container.DataItem("Isreturn")) %>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="FLIGHTID" ReadOnly="True" HeaderText="Flight">
												<HeaderStyle HorizontalAlign="Center" Width="8%"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="MDY" HeaderText="Date">
												<HeaderStyle Width="10%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Departure">
												<HeaderStyle HorizontalAlign="Left" Width="14%"></HeaderStyle>
												<ItemTemplate>
													<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" width="100%">
														<tr>
															<td align="left" width="55%"><%# Container.DataItem("DEPT_TIME") %></td>
															<td align="left" width="45%"><%# Container.DataItem("DEPT_AIRPORT") %></td>
														</tr>
													</table>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="Arrival">
												<HeaderStyle HorizontalAlign="Left" Width="14%"></HeaderStyle>
												<ItemTemplate>
													<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" width="100%">
														<tr>
															<td align="left" width="55%"><%# Container.DataItem("ARR_TIME") %></td>
															<td align="left" width="45%"><%# Container.DataItem("ARR_AIRPORT") %></td>
														</tr>
													</table>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="Class">
												<HeaderStyle HorizontalAlign="Center" Width="8%"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
												<ItemTemplate>
													<%# GetCabin(Container.DataItem("CABINCLASSTYPE")) %>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="Validity">
												<HeaderStyle HorizontalAlign="Left" Width="16%"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left"></ItemStyle>
												<ItemTemplate>
													<%# GetWebFare(Container.DataItem("WEBFARETYPE")) %>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="Mile" HeaderText="Mile">
												<HeaderStyle HorizontalAlign="Right" Width="8%"></HeaderStyle>
												<ItemStyle HorizontalAlign="Right"></ItemStyle>
											</asp:BoundColumn>
										</Columns>
										<PagerStyle Mode="NumericPages"></PagerStyle>
									</asp:datagrid></TD>
							</tr>
							<tr>
								<td bgColor="#ff9933">
									<table style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ff9933; TEXT-ALIGN: right"
										cellSpacing="0" cellPadding="4" width="100%">
										<tr>
											<td>Total Point</td>
											<td width="11%"><asp:label id="lblTotal" runat="server"></asp:label></td>
										</tr>
										<tr style="FONT-WEIGHT: normal; FONT-SIZE: 8pt; COLOR: #cc3333; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ffffc1"
											align="left">
											<td colSpan="2"><b>Excludes airport departure tax&nbsp;at Samui/Sukhothai/Trat 
													airports.</b>&nbsp;
												<br>
												Airport Construction and Maintenance Fee/Passenger Service Charge and will be 
												collected at departure.<BR>
												<b>
													<BR>
													* Fare is not include WebCharge rate.<BR>
													** Alredy include WebFare Charge rate for each adult and child.</b>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma"><br>
									<ul>
										<li>
											The fare quoted above is&nbsp;valid for bookings made on <A href="promotion.aspx">about 
												promotion</A>
										only.
										<li>
										Credit card holder must be part of the traveling party and the card must be 
										presented upon check-in.
										<li>
											Excludes Taxes &amp; surcharges for some airports.</li></ul>
									</A>
								</td>
							</tr>
							<tr>
								<td>
									<table style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma" cellSpacing="4" width="100%">
										<tr vAlign="middle">
											<td width="50%">&nbsp;</td>
											<td align="right" width="50%">
												<asp:button id="btnHome" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="White"
													Text="Home" Font-Bold="True" BorderColor="MistyRose" BackColor="Firebrick"></asp:button>&nbsp;&nbsp;
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</TABLE>
					</td>
				</tr>
				<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; TEXT-ALIGN: center" bgColor="#ff9933">
					<td height="24">| <A href="http://161.246.5.166">Terms &amp; Conditions</A> | <A href="http://161.246.5.166">
							Conditions of Carriage</A> | <A href="http://161.246.5.166">Privacy &amp; 
							Security</A> |
					</td>
				</tr>
				<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; TEXT-ALIGN: center" height="30">
					<td>Copyright 2006 SkyHigh Alliance Co., Ltd. All reserved.</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
