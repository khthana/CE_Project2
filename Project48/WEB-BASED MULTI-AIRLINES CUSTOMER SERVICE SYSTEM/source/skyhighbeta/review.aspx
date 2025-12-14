<%@ Page Language="vb" AutoEventWireup="false" Codebehind="review.aspx.vb" Inherits="skyhighbeta.review"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SkyHigh :: Review</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body background="image/background.gif" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table cellSpacing="0" cellPadding="0" width="800" align="center">
				<tr>
					<td align="center"><asp:image id="Image1" runat="server" ImageUrl="http://localhost/skyhighbeta/image/airflash2.jpg"></asp:image></td>
				</tr>
				<tr bgColor="#ffffee">
					<td>
						<table id="Table2" cellSpacing="0" cellPadding="2" width="96%" align="center" border="0">
							<tr>
								<td>
									<table style="FONT-WEIGHT: bold; FONT-SIZE: x-small; COLOR: black; FONT-FAMILY: Tahoma, 'Microsoft Sans Serif'"
										cellPadding="4" width="100%" align="left">
										<tr height="12">
											<td bgColor="#ff9933" colSpan="6"></td>
										</tr>
										<tr>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: saddlebrown; FONT-FAMILY: Tahoma"
												width="18%">Plan Your Trip</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: saddlebrown; FONT-FAMILY: Tahoma"
												width="16%">Select</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: saddlebrown; FONT-FAMILY: Tahoma"
												width="16%">Fares</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: saddlebrown; FONT-FAMILY: Tahoma"
												width="18%">Passenger Details</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: yellowgreen; FONT-FAMILY: Tahoma"
												width="16%">Review</td>
											<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: peachpuff; FONT-FAMILY: Tahoma"
												width="16%">Payment</td>
										</tr>
										<tr height="2">
											<td bgColor="saddlebrown" colSpan="4"></td>
											<td bgColor="yellowgreen"></td>
											<td bgColor="peachpuff"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 16pt; COLOR: #cc6633; FONT-FAMILY: Tahoma; HEIGHT: 35px"
								vAlign="middle">
								<td>Review&nbsp;
									<asp:label id="lblStatus" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="OrangeRed"
										Visible="False"></asp:label></td>
							</tr>
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ff9933"
								align="left">
								<td>&nbsp;Passenger Details</td>
							</tr>
							<tr bgColor="#ff9933">
								<td>
									<table cellSpacing="0" cellPadding="4" width="100%">
										<tr style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ffcc33"
											align="left">
											<td width="35%"><FONT face="Tahoma">Adult</FONT></td>
											<td width="10%"><FONT face="Tahoma">Age</FONT></td>
											<td width="20%"><FONT face="Tahoma">Country of residence</FONT></td>
											<td width="20%"><FONT face="Tahoma">Meal</FONT></td>
											<td width="15%"><FONT face="Tahoma">Member ID</FONT></td>
										</tr>
										<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ffffc1"
											align="left">
											<td width="35%"><asp:label id="lblName" runat="server" Font-Names="Tahoma" Font-Size="8pt"></asp:label></td>
											<td width="10%"><asp:label id="lblAge" runat="server" Font-Names="Tahoma" Font-Size="8pt"></asp:label></td>
											<td width="20%"><asp:label id="lblCountry" runat="server" Font-Names="Tahoma" Font-Size="8pt"></asp:label></td>
											<td width="20%"><asp:label id="lblMeal" runat="server" Font-Names="Tahoma" Font-Size="8pt"></asp:label></td>
											<td width="15%"><asp:label id="lblMemberID" runat="server" Font-Names="Tahoma" Font-Size="8pt"></asp:label></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr height="15">
								<td></td>
							</tr>
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ff9933"
								align="left">
								<td>&nbsp;Contact Details</td>
							</tr>
							<tr bgColor="#ff9933">
								<td>
									<table cellSpacing="0" cellPadding="4" width="100%">
										<tr style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ffcc33"
											align="left">
											<td width="55%" colSpan="2"><FONT face="Tahoma">Name</FONT></td>
											<td width="45%"><FONT face="Tahoma">E-Mail Address</FONT></td>
										</tr>
										<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ffffc1"
											align="left">
											<td width="55%" colSpan="2"><asp:label id="lblName2" runat="server" Font-Names="Tahoma" Font-Size="8pt"></asp:label></td>
											<td width="45%"><asp:label id="lblEmail" runat="server" Font-Names="Tahoma" Font-Size="8pt"></asp:label></td>
										</tr>
										<tr style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ffcc33"
											align="left">
											<td width="45%" colSpan="3"><FONT face="Tahoma">Phone Contact</FONT></td>
										</tr>
										<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ffffc1"
											align="left">
											<td align="right" width="20%">Home or Mobile Number:</td>
											<td width="25%"><asp:label id="lblHome" runat="server" Font-Names="Tahoma" Font-Size="8pt"></asp:label></td>
											<td width="55%"></td>
										</tr>
										<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ffffc1"
											align="left">
											<td align="right" width="20%">Business Number:</td>
											<td width="25%"><asp:label id="lblBusiness" runat="server" Font-Names="Tahoma" Font-Size="8pt"></asp:label></td>
											<td width="55%"></td>
										</tr>
										<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ffffc1"
											align="left">
											<td align="right" width="20%">Fax Number:</td>
											<td width="25%"><asp:label id="lblFax" runat="server" Font-Names="Tahoma" Font-Size="8pt"></asp:label></td>
											<td width="55%"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr height="15">
								<td></td>
							</tr>
							<TR>
								<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; HEIGHT: 24px; BACKGROUND-COLOR: #ff9933"
									align="left">&nbsp;Flight Itinerary</td>
							</TR>
							<tr bgColor="#ff9933">
								<TD style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma" align="center"><asp:datagrid id="grdSelected" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black"
										HorizontalAlign="Left" AutoGenerateColumns="False" Width="100%" CellPadding="4" GridLines="None" DataKeyField="FlightID">
										<ItemStyle BackColor="#FFFFC1"></ItemStyle>
										<HeaderStyle Font-Bold="True" BackColor="#FFCC33"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="Date" HeaderText="Date">
												<HeaderStyle Width="10%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Departure">
												<HeaderStyle HorizontalAlign="Left" Width="15%"></HeaderStyle>
												<ItemTemplate>
													<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" width="100%">
														<tr>
															<td align="left" width="45%"><%# Container.DataItem("DEPT_TIME") %></td>
															<td align="left" width="55%"><%# Container.DataItem("DEPT_AIRPORT") %></td>
														</tr>
													</table>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="Arrival">
												<HeaderStyle HorizontalAlign="Left" Width="15%"></HeaderStyle>
												<ItemTemplate>
													<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" width="100%">
														<tr>
															<td align="left" width="45%"><%# Container.DataItem("ARR_TIME") %></td>
															<td align="left" width="55%"><%# Container.DataItem("ARR_AIRPORT") %></td>
														</tr>
													</table>
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:BoundColumn DataField="FLIGHTID" ReadOnly="True" HeaderText="Flight">
												<HeaderStyle HorizontalAlign="Center" Width="10%"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Cabin" HeaderText="Class">
												<HeaderStyle HorizontalAlign="Center" Width="10%"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="Fare" HeaderText="Fare*">
												<HeaderStyle HorizontalAlign="Center" Width="10%"></HeaderStyle>
												<ItemStyle HorizontalAlign="Center"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="WebFare" HeaderText="Valid">
												<HeaderStyle Width="20%"></HeaderStyle>
											</asp:BoundColumn>
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
								<TD align="center"><asp:datagrid id="grdFare" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black"
										HorizontalAlign="Right" AutoGenerateColumns="False" Width="100%" CellPadding="4" GridLines="None" DataKeyField="FlightID">
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
										cellSpacing="0" cellPadding="4" width="100%">
										<tr>
											<td>Total</td>
											<td width="20%"><asp:label id="lblTotal" runat="server"></asp:label></td>
										</tr>
										<tr style="FONT-WEIGHT: normal; FONT-SIZE: 8pt; COLOR: #cc3333; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ffffc1"
											align="left">
											<td colSpan="2"><B>Excludes airport departure tax&nbsp;at Samui/Sukhothai/Trat 
													airports.</B>&nbsp;<BR>
												Airport Construction and Maintenance Fee/Passenger Service Charge and will be 
												collected at departure.<BR>
												<B>
													<BR>
													* Fare is not include WebCharge rate.<BR>
													** Alredy include WebFare Charge rate for each adult and child.</B>
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
							<tr>
								<td>
									<table style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma" cellSpacing="4" width="100%">
										<tr vAlign="middle">
											<td width="50%"><asp:button id="btnBack" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="White"
													BorderColor="MistyRose" BackColor="Firebrick" Text="Back" Font-Bold="True"></asp:button></td>
											<td align="right" width="50%"><STRONG>Go to: </STRONG>Payment&nbsp;&nbsp;
												<asp:button id="btnPayLater" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="White"
													BorderColor="MistyRose" BackColor="Firebrick" Text="Pay Later" Font-Bold="True"></asp:button>&nbsp;<asp:button id="btnPayNow" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="White"
													BorderColor="MistyRose" BackColor="Firebrick" Text="Pay Now" Font-Bold="True"></asp:button>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; TEXT-ALIGN: center" bgColor="#ff9933"
					height="24">
					<td>| <A href="http://161.246.5.166">Terms &amp; Conditions</A> | <A href="http://161.246.5.166">
							Conditions of Carriage</A> | <A href="http://161.246.5.166">Privacy &amp; 
							Security</A> |
					</td>
				</tr>
				<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; TEXT-ALIGN: center" height="30">
					<td>Copyright 2006 SkyHigh Alliance Co., Ltd. All reserved.</td>
				</tr>
			</table>
			</TD></TR></TABLE></form>
	</body>
</HTML>
