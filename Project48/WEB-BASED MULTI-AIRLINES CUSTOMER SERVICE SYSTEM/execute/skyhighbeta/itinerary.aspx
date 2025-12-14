<%@ Page Language="vb" AutoEventWireup="false" Codebehind="itinerary.aspx.vb" Inherits="skyhighbeta.itinerary"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SkyHigh :: Your Itinerary</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body background="image/background.gif" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<table id="Table1" cellSpacing="0" cellPadding="0" width="800" align="center" border="0">
					<tr>
						<td align="center"><asp:image id="Image1" runat="server" ImageUrl="http://localhost/skyhighbeta/image/airflash2.jpg"></asp:image></td>
					</tr>
					<tr bgcolor="#ffffee">
						<td>
							<TABLE id="Table2" style="FONT-SIZE: x-small; COLOR: black; FONT-FAMILY: Tahoma, 'Microsoft Sans Serif'"
								cellSpacing="0" cellPadding="2" width="98%" align="center">
								<tr height="12">
									<td bgColor="#ff9933" colSpan="6"></td>
								</tr>
								<TR style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: darkgray; FONT-FAMILY: Tahoma"
									height="24">
									<TD>&nbsp;E-SERVICE &gt; YOUR ITINERARY</TD>
								</TR>
								<tr height="4">
									<td background="image/bar.gif"></td>
								</tr>
								<tr style="FONT-WEIGHT: bold; FONT-SIZE: 16pt; COLOR: #cc6633; FONT-FAMILY: Tahoma; HEIGHT: 35px"
									vAlign="middle">
									<td>YOUR ITINERARY
									</td>
								</tr>
								<tr>
									<td>
										<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellPadding="4" width="100%">
											<tr>
												<td width="25%" background="image/bar.gif">
													<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellSpacing="0" cellPadding="3"
														width="100%" bgColor="#fffff1">
														<tr>
															<td style="FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: saddlebrown" align="center" bgColor="#ffffcc">BOOKING 
																REFERENCE</td>
														</tr>
														<tr>
															<td align="center"><asp:label id="lblBookRef" runat="server" Font-Names="Tahoma" Font-Bold="True" ForeColor="Chocolate"
																	Font-Size="Medium"></asp:label></td>
														</tr>
													</table>
												</td>
												<td width="75%">
													<ul>
														<li>
															<b>Your booking was made on:&nbsp; </b>
															<asp:label id="lblBookDateTime" runat="server" Font-Names="Tahoma" ForeColor="Black" Font-Size="8pt"></asp:label>&nbsp; 
														(Thailand local time,GMT+7)
														<li>
															<STRONG>This booking must be&nbsp;paid before:&nbsp; </STRONG>
															<asp:label id="lblPaidTime" runat="server" Font-Names="Tahoma" ForeColor="Black" Font-Size="8pt"></asp:label>&nbsp;(Thailand 
															local time,GMT+7)&nbsp;<STRONG><BR>
															</STRONG>
															<asp:label id="lblPaidTime2" runat="server" Font-Size="8pt" ForeColor="Black" Font-Names="Tahoma"
																Visible="False">otherwise your booking will be automatically canceled.</asp:label>
														<li>
															Please note that this is not your receipt.</li></ul>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ff9933"
										align="left">&nbsp;Passenger Details</td>
								</tr>
								<tr bgColor="#ff9933">
									<td><asp:datagrid id="grdPassenger" runat="server" Font-Names="Tahoma" ForeColor="Black" Font-Size="8pt"
											GridLines="None" CellPadding="4" Width="100%" AutoGenerateColumns="False" HorizontalAlign="Right">
											<ItemStyle HorizontalAlign="Left" BackColor="#FFFFC1"></ItemStyle>
											<HeaderStyle Font-Bold="True" HorizontalAlign="Left" VerticalAlign="Middle" BackColor="#FFCC33"></HeaderStyle>
											<Columns>
												<asp:BoundColumn DataField="FullName" HeaderText="Adult Name">
													<HeaderStyle Width="25%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="Age" HeaderText="Age">
													<HeaderStyle Width="10%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Left"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="Email" HeaderText="E-Mail Address">
													<HeaderStyle HorizontalAlign="Left" Width="25%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Left"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="Country" HeaderText="Country of Residence">
													<HeaderStyle HorizontalAlign="Left" Width="20%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Left"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="Meal" HeaderText="Meal">
													<HeaderStyle HorizontalAlign="Left" Width="10%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Left"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="MemberID" HeaderText="MemberID">
													<HeaderStyle HorizontalAlign="Right" Width="10%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Right"></ItemStyle>
												</asp:BoundColumn>
											</Columns>
											<PagerStyle Font-Size="X-Small" Font-Names="Microsoft Sans Serif" HorizontalAlign="Right" ForeColor="Yellow"
												BackColor="#FF9933" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></td>
								</tr>
								<tr>
									<td height="24"></td>
								</tr>
								<TR>
									<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ff9933"
										align="left">&nbsp;Flight Itinerary</td>
								</TR>
								<tr bgColor="#ff9933">
									<TD style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma" align="center">
										<asp:datagrid id="grdSelected" runat="server" Font-Size="8pt" ForeColor="Black" Font-Names="Tahoma"
											AutoGenerateColumns="False" Width="100%" CellPadding="4" GridLines="None" DataKeyField="FlightID">
											<ItemStyle BackColor="#FFFFC1"></ItemStyle>
											<HeaderStyle Font-Bold="True" BackColor="#FFCC33"></HeaderStyle>
											<Columns>
												<asp:BoundColumn DataField="Leg" HeaderText="Leg"></asp:BoundColumn>
												<asp:BoundColumn DataField="MDY" HeaderText="Date">
													<HeaderStyle Width="10%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="Departure">
													<HeaderStyle HorizontalAlign="Left" Width="12%"></HeaderStyle>
													<ItemTemplate>
														<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" width="100%">
															<tr>
																<td align="left" width="65%"><%# Container.DataItem("DEPT_TIME") %></td>
																<td align="left" width="35%"><%# Container.DataItem("DEPT_AIRPORT") %></td>
															</tr>
														</table>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Arrival">
													<HeaderStyle HorizontalAlign="Left" Width="12%"></HeaderStyle>
													<ItemTemplate>
														<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" width="100%">
															<tr>
																<td align="left" width="65%"><%# Container.DataItem("ARR_TIME") %></td>
																<td align="left" width="35%"><%# Container.DataItem("ARR_AIRPORT") %></td>
															</tr>
														</table>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:BoundColumn DataField="FLIGHTID" ReadOnly="True" HeaderText="Flight">
													<HeaderStyle HorizontalAlign="Center" Width="8%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="Cabin" HeaderText="Class"></asp:BoundColumn>
												<asp:BoundColumn DataField="Fare" HeaderText="Fare*"></asp:BoundColumn>
												<asp:BoundColumn DataField="WebFare" HeaderText="Validity"></asp:BoundColumn>
											</Columns>
											<PagerStyle Mode="NumericPages"></PagerStyle>
										</asp:datagrid></TD>
								</tr>
								<TR height="20">
									<TD></TD>
								</TR>
								<tr>
									<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ff9933"
										align="left">&nbsp;Total Price</td>
								</tr>
								<TR bgColor="#ff9933">
									<TD align="center"><asp:datagrid id="grdFare" runat="server" Font-Names="Tahoma" ForeColor="Black" Font-Size="8pt"
											DataKeyField="FlightID" GridLines="None" CellPadding="4" Width="100%" AutoGenerateColumns="False" HorizontalAlign="Right">
											<ItemStyle HorizontalAlign="Right" BackColor="#FFFFC1"></ItemStyle>
											<HeaderStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Middle" BackColor="#FFCC33"></HeaderStyle>
											<Columns>
												<asp:BoundColumn DataField="Passenger" HeaderText="Passenger(s)">
													<HeaderStyle HorizontalAlign="Left" Width="40%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Left"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="PersonFare" HeaderText="Fare per Person**">
													<HeaderStyle Width="20%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="PersonTax" HeaderText="Airport Tax per Person">
													<HeaderStyle Width="20%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="Total" HeaderText="Total">
													<HeaderStyle Width="20%"></HeaderStyle>
												</asp:BoundColumn>
											</Columns>
											<PagerStyle Font-Size="X-Small" Font-Names="Microsoft Sans Serif" HorizontalAlign="Right" ForeColor="Yellow"
												BackColor="#FF9933" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></TD>
								</TR>
								<tr>
									<td bgColor="#ff9933">
										<table style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ff9933; TEXT-ALIGN: right"
											width="100%" cellspacing="0" cellpadding="4">
											<tr>
												<td>Total</td>
												<td width="20%"><asp:label id="lblTotal" runat="server"></asp:label></td>
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
												The fare quoted above is&nbsp;valid for bookings made on <A href="http://www.skyhigh.com/">
													http://www.skyhigh.com/</A>
											only.
											<li>
											Credit card holder must be part of the traveling party and the card must be 
											presented upon check-in.
											<li>
												Excludes Taxes &amp; surcharges for some airports.</li></ul>
									</td>
								</tr>
								<tr>
									<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ff9933"
										align="left" colSpan="2">&nbsp;Fare Conditions</td>
								</tr>
								<tr bgColor="#ff9933">
									<td>
										<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" width="100%" bgColor="#ffffc1">
											<tr>
												<td colSpan="2"><asp:label id="lblCondition" runat="server"></asp:label></td>
											</tr>
											<tr>
												<td width="20%"></td>
												<td width="80%"><b>
														<asp:Label id="lbl6MonthsHead" runat="server" Visible="False">Web Fare 6 Months</asp:Label></b></td>
											</tr>
											<tr>
												<td width="20%"></td>
												<td width="80%">
													<P>
														<asp:Label id="lbl6Months" runat="server" Visible="False">
															<ul>
																<li>
																Valid for bookings made on www.bangkokair.com only.<li>Rerouting is not 
																allowed.<li>Unused tickets and partially used tickets can be refunded subject to 
																	refund administrative fee at USD 30 or<br>
																equivalent per passenger.<li>Fare combinations are allowed, lowest restricted 
																conditions and validity will be applied.<li>This fare is for one way and to be 
																	doubled in case of round trip.</li></ul>
														</asp:Label></P>
												</td>
											</tr>
											<tr>
												<td width="20%"></td>
												<td width="80%"><b>
														<asp:Label id="lbl1YearHead" runat="server" Visible="False">Web Fare 1 Year</asp:Label></b></td>
											</tr>
											<tr>
												<td width="20%"></td>
												<td width="80%">
													<P>
														<asp:Label id="lbl1Year" runat="server" Visible="False">
															<ul>
																<li>
																Valid for bookings made on www.bangkokair.com only.<li>Rerouting is not 
																allowed.<li>Unused tickets and partially used tickets can be refunded subject to 
																	refund administrative fee at USD 30 or<br>
																equivalent per passenger.<li>Fare combinations are allowed, lowest restricted 
																conditions and validity will be applied.<li>This fare is for one way and to be 
																	doubled in case of round trip.</li></ul>
														</asp:Label></P>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr height="24">
									<td></td>
								</tr>
								<tr bgColor="#ff9933">
									<td>
										<table cellSpacing="0" cellPadding="4" width="100%">
											<TR>
												<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ff9933"
													align="left">&nbsp;Acknowledgement</td>
											</TR>
											<tr>
												<TD style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ffffc1"><asp:checkbox id="chkAck" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="I have read, understood and accepted Fare Conditions,"
														AutoPostBack="True"></asp:checkbox><A href="http://161.246.5.166">Conditions of 
														Carriage</A> and <A href="http://www.skyhigh.com">Term and Conditions</A>
												</TD>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma" cellSpacing="4" width="100%">
											<tr vAlign="middle">
												<td width="50%"><asp:button id="btnPrint" runat="server" Font-Names="Tahoma" Font-Bold="True" ForeColor="White"
														Font-Size="8pt" Text="Print" BackColor="Firebrick" BorderColor="MistyRose"></asp:button>&nbsp;<asp:button id="btnCancel" runat="server" Font-Names="Tahoma" Font-Bold="True" ForeColor="White"
														Font-Size="8pt" Text="Cancel Booking" BackColor="Firebrick" BorderColor="MistyRose"></asp:button></td>
												<td align="right" width="50%"><asp:button id="btnPayNow" runat="server" Font-Names="Tahoma" Font-Bold="True" ForeColor="White"
														Font-Size="8pt" Text="Pay Now" BackColor="Firebrick" BorderColor="MistyRose" Enabled="False"></asp:button>&nbsp;<asp:button id="btnChange" runat="server" Font-Names="Tahoma" Font-Bold="True" ForeColor="White"
														Font-Size="8pt" Text="Change Flight &amp; Date" BackColor="Firebrick" BorderColor="MistyRose"></asp:button>&nbsp;
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
			</FONT>
		</form>
	</body>
</HTML>
