<%@ Page Language="vb" AutoEventWireup="false" Codebehind="searchresult.aspx.vb" Inherits="skyhighbeta.searchresult"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SkyHigh :: Select</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	</HEAD>
	<body background="image/background.gif" MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="Tahoma">
				<table id="Table1" cellSpacing="0" cellPadding="0" width="800" align="center" border="0">
					<tr>
						<td align="center"><asp:image id="Image1" runat="server" ImageUrl="image/airflash2.jpg"></asp:image></td>
					</tr>
					<tr bgColor="#ffffee">
						<td>
							<TABLE id="Table2" style="FONT-SIZE: x-small; COLOR: black; FONT-FAMILY: Tahoma, 'Microsoft Sans Serif'"
								cellSpacing="0" cellPadding="2" width="96%" align="center">
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
												<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: yellowgreen; FONT-FAMILY: Tahoma"
													width="16%">Select</td>
												<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: peachpuff; FONT-FAMILY: Tahoma"
													width="16%">Fares</td>
												<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: peachpuff; FONT-FAMILY: Tahoma"
													width="18%">Passenger Details</td>
												<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: peachpuff; FONT-FAMILY: Tahoma"
													width="16%">Review</td>
												<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: peachpuff; FONT-FAMILY: Tahoma"
													width="16%">Payment</td>
											</tr>
											<tr height="2">
												<td bgColor="saddlebrown"></td>
												<td bgColor="yellowgreen"></td>
												<td bgColor="peachpuff" colSpan="4"></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr style="FONT-WEIGHT: bold; FONT-SIZE: 16pt; COLOR: #cc6633; FONT-FAMILY: Tahoma; HEIGHT: 35px"
									vAlign="middle">
									<td>SELECT FLIGHT(S)&nbsp; &amp; FARE(S)&nbsp;
										<asp:label id="lblStatus" runat="server" Font-Size="8pt" ForeColor="OrangeRed" Font-Bold="True"
											Font-Names="Tahoma" Visible="False"></asp:label></td>
								</tr>
								<tr style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma">
									<td height="50"><b><asp:image id="Image2" runat="server" ImageUrl="image/point.gif"></asp:image>&nbsp;Number 
											of passenger:
											<asp:label id="lblAmont" runat="server" Font-Size="8pt" ForeColor="Black" Font-Bold="True"
												Font-Names="Tahoma"></asp:label></b><br>
										Fare is not include WebCharge rate. <b>Taxes &amp; surcharges exclude.</b> Total 
										price for all passengers will be displayed on the next page.</td>
								</tr>
								<TR>
									<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ff9933"
										align="left">&nbsp;
										<asp:label id="lblOnewayHead" runat="server" Font-Size="8pt" ForeColor="White" Font-Bold="True"
											Font-Names="Tahoma" Visible="False"></asp:label></td>
								</TR>
								<tr bgColor="#ff9933">
									<TD style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma" align="center"><asp:datagrid id="grdOneway" runat="server" Font-Size="8pt" ForeColor="Black" Font-Names="Tahoma"
											Visible="False" HorizontalAlign="Center" BackColor="#FFFFC1" AutoGenerateColumns="False" Width="100%" CellPadding="3" GridLines="None" PageSize="6" DataKeyField="FlightID">
											<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
											<HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#FFCC33"></HeaderStyle>
											<Columns>
												<asp:BoundColumn DataField="FLIGHTID" ReadOnly="True" HeaderText="Flight">
													<HeaderStyle Width="8%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="DEPT_TIME" HeaderText="Departure">
													<HeaderStyle Width="12%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="ARR_TIME" HeaderText="Arrival">
													<HeaderStyle Width="12%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="AIRCRAFT" HeaderText="Aircraft">
													<HeaderStyle Width="10%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="Duration">
													<ItemTemplate>
														<%# GetAllDuration(Container.DataItem("DURATION")) %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Seat">
													<HeaderStyle Width="14%"></HeaderStyle>
													<HeaderTemplate>
														<TABLE style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black" align="center" width="100%">
															<TR>
																<TD colSpan="3" align="center">Seat Available</TD>
															</TR>
															<TR>
																<TD align="center">1st</TD>
																<TD align="center">Biz</TD>
																<TD align="center">Eco</TD>
															</TR>
														</TABLE>
													</HeaderTemplate>
													<ItemTemplate>
														<TABLE style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" align="center" width="100%">
															<TR>
																<TD align="center" width="33%"><%# CheckSeat(Container.DataItem("FIRST"),Request("Adult"),Request("Child")) %></TD>
																<TD align="center" width="34%"><%# CheckSeat(Container.DataItem("BUSINESS"),Request("Adult"),Request("Child")) %></TD>
																<TD align="center" width="33%"><%# CheckSeat(Container.DataItem("ECONOMY"),Request("Adult"),Request("Child")) %></TD>
															</TR>
														</TABLE>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Fare">
													<HeaderStyle HorizontalAlign="Center" Width="16%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Center"></ItemStyle>
													<HeaderTemplate>
														<TABLE id="table4" style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma"
															width="100%">
															<TR>
																<TD align="center" colSpan="3" width="100%">Fare</TD>
															</TR>
															<TR>
																<TD align="center" width="33%">1st</TD>
																<TD align="center" width="34%">Biz</TD>
																<TD align="center" width="33%">Eco</TD>
															</TR>
														</TABLE>
													</HeaderTemplate>
													<ItemTemplate>
														<TABLE id="table5" style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" width="100%"
															align="center">
															<TR>
																<TD align="center" width="33%"><%# Container.DataItem("A_FIRST") %></TD>
																<TD align="center" width="34%"><%# Container.DataItem("A_BUSINESS") %></TD>
																<TD align="center" width="33%"><%# Container.DataItem("A_ECONOMY") %></TD>
															</TR>
														</TABLE>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:ButtonColumn Text="Select" ButtonType="PushButton" CommandName="Selecting">
													<HeaderStyle Width="12%"></HeaderStyle>
												</asp:ButtonColumn>
											</Columns>
											<PagerStyle Font-Size="X-Small" Font-Names="Microsoft Sans Serif" HorizontalAlign="Right" ForeColor="Yellow"
												BackColor="#FF9933" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></TD>
								</tr>
								<tr>
									<td align="center" bgColor="#ff9933">
										<asp:datagrid id="grdOneway2" runat="server" Visible="False" Font-Names="Tahoma" ForeColor="Black"
											Font-Size="8pt" PageSize="6" GridLines="None" CellPadding="3" Width="100%" AutoGenerateColumns="False"
											BackColor="#FFFFC1" HorizontalAlign="Center">
											<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
											<HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#FFCC33"></HeaderStyle>
											<Columns>
												<asp:BoundColumn DataField="FLIGHT1" ReadOnly="True" HeaderText="Flight">
													<HeaderStyle Width="8%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="airport1" HeaderText="Airport">
													<HeaderStyle Width="8%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="day1" HeaderText="On Date">
													<HeaderStyle Width="9%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn>
													<HeaderStyle Width="5%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="FLIGHT2" HeaderText="Flight2">
													<HeaderStyle Width="8%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="airport2" HeaderText="Airport2">
													<HeaderStyle Width="8%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="day2" HeaderText="On Date2">
													<HeaderStyle Width="9%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn>
													<HeaderStyle Width="5%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="All Duration">
													<HeaderStyle Width="10%"></HeaderStyle>
													<ItemTemplate>
														<%# GetAllDuration(Container.DataItem("DURATION1"),Container.DataItem("DURATION2")) %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="All Cost">
													<HeaderStyle Width="8%"></HeaderStyle>
													<ItemTemplate>
														<%# GetAllCost(Container.DataItem("AllEconomyCost"),Container.DataItem("AllBusinessCost"),Container.DataItem("AllFirstCost"),Request("CabinOne")) %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Details">
													<HeaderStyle Width="8%"></HeaderStyle>
													<ItemTemplate>
														<%# "<a href=flightdetails.aspx?FID=" & Container.DataItem("Flight1") & "&FID2=" & Container.DataItem("Flight2") & "&FID3=null&MDY=" & Container.DataItem("day1") & "&MDY2=" & Container.DataItem("day2") & "&Adult=" & Request("Adult") & "&Child=" & Request("Child") & " target=_blank>details</a>" %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:ButtonColumn Text="Select" ButtonType="PushButton" CommandName="Selecting2">
													<HeaderStyle Width="8%"></HeaderStyle>
												</asp:ButtonColumn>
											</Columns>
											<PagerStyle Font-Size="X-Small" Font-Names="Microsoft Sans Serif" HorizontalAlign="Right" ForeColor="Yellow"
												BackColor="#FF9933" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></td>
								</tr>
								<tr>
									<td align="center" bgColor="#ff9933">
										<asp:datagrid id="grdOneway3" runat="server" Visible="False" Font-Names="Tahoma" ForeColor="Black"
											Font-Size="8pt" PageSize="1" GridLines="None" CellPadding="3" Width="100%" AutoGenerateColumns="False"
											BackColor="#FFFFC1" HorizontalAlign="Center">
											<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
											<HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#FFCC33"></HeaderStyle>
											<Columns>
												<asp:BoundColumn DataField="FLIGHT1" ReadOnly="True" HeaderText="Flight">
													<HeaderStyle HorizontalAlign="Left" Width="8%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Left"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="airport1" HeaderText="Airport">
													<HeaderStyle Width="6%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="day1" HeaderText="On Date">
													<HeaderStyle Width="12%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn>
													<HeaderStyle Width="2%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="FLIGHT2" HeaderText="Flight2">
													<HeaderStyle HorizontalAlign="Left" Width="8%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Left"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="airport2" HeaderText="Airport2">
													<HeaderStyle Width="6%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="day2" HeaderText="On Date2">
													<HeaderStyle Width="12%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn>
													<HeaderStyle Width="2%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="FLIGHT3" HeaderText="Flight3">
													<HeaderStyle HorizontalAlign="Left" Width="8%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Left"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="airport3" HeaderText="Airport3">
													<HeaderStyle Width="6%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="day3" HeaderText="On Date3">
													<HeaderStyle Width="12%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="All Duration">
													<HeaderStyle Width="10%"></HeaderStyle>
													<ItemTemplate>
														<%# GetAllDuration(Container.DataItem("DURATION1"),Container.DataItem("DURATION2"),Container.DataItem("DURATION3")) %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="All Cost">
													<HeaderStyle Width="8%"></HeaderStyle>
													<ItemTemplate>
														<%# GetAllCost(Container.DataItem("AllEconomyCost"),Container.DataItem("AllBusinessCost"),Container.DataItem("AllFirstCost"),Request("CabinOne")) %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Details">
													<HeaderStyle Width="8%"></HeaderStyle>
													<ItemTemplate>
														<%# "<a href=flightdetails.aspx?FID=" & Container.DataItem("Flight1") & "&FID2=" & Container.DataItem("Flight2") & "&FID3=" & Container.DataItem("Flight3") & "&MDY=" &  Container.DataItem("day1") & "&MDY2=" & Container.DataItem("day2") & "&MDY3=" & Container.DataItem("day3") & "&Adult=" & Request("Adult") & "&Child=" & Request("Child") & " target=_blank>details</a>" %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:ButtonColumn Text="Select" ButtonType="PushButton" CommandName="Selecting3">
													<HeaderStyle Width="8%"></HeaderStyle>
												</asp:ButtonColumn>
											</Columns>
											<PagerStyle Font-Size="X-Small" Font-Names="Microsoft Sans Serif" HorizontalAlign="Right" ForeColor="Yellow"
												BackColor="#FF9933" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></td>
								</tr>
								<tr>
									<td align="center"><asp:label id="lblNotFOne" runat="server" Font-Size="8pt" ForeColor="Firebrick" Font-Bold="True"
											Font-Names="Tahoma" Visible="False"></asp:label></td>
								</tr>
								<tr>
									<td align="center"><asp:label id="lblNotFOne2" runat="server" Font-Size="8pt" ForeColor="Firebrick" Font-Bold="True"
											Font-Names="Tahoma" Visible="False"></asp:label></td>
								</tr>
								<tr>
									<td align="center"><asp:label id="lblNotFOne3" runat="server" Font-Size="8pt" ForeColor="Firebrick" Font-Bold="True"
											Font-Names="Tahoma" Visible="False"></asp:label></td>
								</tr>
								<TR height="20">
									<TD></TD>
								</TR>
								<tr>
									<td>
										<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellPadding="4" width="100%"
											align="left">
											<tr>
												<td align="right" width="12%"><b><asp:label id="lblCabinOne" runat="server" Font-Size="8pt" ForeColor="Black" Font-Bold="True"
															Font-Names="Tahoma" Visible="False">Cabin Class :</asp:label></b></td>
												<td width="24%"><asp:radiobuttonlist id="radCabinOne" runat="server" Font-Size="8pt" Font-Names="Tahoma" Visible="False"
														RepeatDirection="Horizontal">
														<asp:ListItem Value="0">First</asp:ListItem>
														<asp:ListItem Value="1" Selected="True">Business</asp:ListItem>
														<asp:ListItem Value="2">Economy</asp:ListItem>
													</asp:radiobuttonlist></td>
												<td width="14%"><asp:button id="btnSortCost" runat="server" Font-Size="8pt" ForeColor="DimGray" Font-Bold="True"
														Font-Names="Tahoma" Visible="False" BackColor="LightGray" BorderStyle="Solid" Text="Sort by Cost"></asp:button></td>
												<td align="right" width="12%"><asp:label id="lblWebFareOne" runat="server" Font-Size="8pt" ForeColor="Black" Font-Bold="True"
														Font-Names="Tahoma" Visible="False">Web Fare :</asp:label></td>
												<td align="left" width="38%"><asp:radiobuttonlist id="radWebFareOne" runat="server" Font-Size="8pt" Font-Names="Tahoma" Visible="False"
														RepeatDirection="Horizontal">
														<asp:ListItem Value="0" Selected="True">Web Fare 6 Months</asp:ListItem>
														<asp:ListItem Value="1">Web Fare 1 Year</asp:ListItem>
													</asp:radiobuttonlist></td>
											</tr>
										</table>
									</td>
								</tr>
								<TR height="20">
									<TD></TD>
								</TR>
								<tr height="24">
									<td style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: white; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #ff9933"
										align="left">&nbsp;
										<asp:label id="lblReturnHead" runat="server" Font-Size="8pt" ForeColor="White" Font-Bold="True"
											Font-Names="Tahoma" Visible="False"></asp:label></td>
								</tr>
								<TR bgColor="#ff9933">
									<TD align="center"><asp:datagrid id="grdReturn" runat="server" Font-Size="8pt" ForeColor="Black" Font-Names="Tahoma"
											Visible="False" HorizontalAlign="Center" BackColor="#FFFFC1" AutoGenerateColumns="False" Width="100%" CellPadding="3"
											GridLines="None" PageSize="6" DataKeyField="FlightID">
											<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
											<HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#FFCC33"></HeaderStyle>
											<Columns>
												<asp:BoundColumn DataField="FLIGHTID" ReadOnly="True" HeaderText="Flight">
													<HeaderStyle Width="8%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="DEPT_TIME" HeaderText="Departure">
													<HeaderStyle Width="12%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="ARR_TIME" HeaderText="Arrival">
													<HeaderStyle Width="12%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="AIRCRAFT" HeaderText="Aircraft">
													<HeaderStyle Width="10%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="Duration">
													<ItemTemplate>
														<%# GetAllDuration(Container.DataItem("DURATION")) %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Seat">
													<HeaderStyle Width="14%"></HeaderStyle>
													<HeaderTemplate>
														<TABLE style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" width="100%">
															<TR>
																<TD align="center" colSpan="3">Seat Available</TD>
															</TR>
															<TR>
																<TD align="center">1st</TD>
																<TD align="center">Biz</TD>
																<TD align="center">Eco</TD>
															</TR>
														</TABLE>
													</HeaderTemplate>
													<ItemTemplate>
														<TABLE id="table6" style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" align="center"
															width="100%">
															<TR>
																<TD align="center" width="33%"><%# CheckSeat(Container.DataItem("FIRST"),Request("Adult"),Request("Child")) %></TD>
																<TD align="center" width="34%"><%# CheckSeat(Container.DataItem("BUSINESS"),Request("Adult"),Request("Child")) %></TD>
																<TD align="center" width="33%"><%# CheckSeat(Container.DataItem("ECONOMY"),Request("Adult"),Request("Child")) %></TD>
															</TR>
														</TABLE>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Fare">
													<HeaderStyle Width="16%"></HeaderStyle>
													<HeaderTemplate>
														<TABLE style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" width="100%">
															<TR>
																<TD align="center" colSpan="3">Fare</TD>
															</TR>
															<TR>
																<TD align="center">1st</TD>
																<TD align="center">Biz</TD>
																<TD align="center">Eco</TD>
															</TR>
														</TABLE>
													</HeaderTemplate>
													<ItemTemplate>
														<TABLE id="table7" style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" align="center"
															width="100%">
															<TR>
																<TD align="center" width="33%"><%# Container.DataItem("A_FIRST") %></TD>
																<TD align="center" width="34%"><%# Container.DataItem("A_BUSINESS") %></TD>
																<TD align="center" width="33%"><%# Container.DataItem("A_ECONOMY") %></TD>
															</TR>
														</TABLE>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:ButtonColumn Text="Select" ButtonType="PushButton" CommandName="SelectingReturn">
													<HeaderStyle Width="12%"></HeaderStyle>
												</asp:ButtonColumn>
											</Columns>
											<PagerStyle Font-Size="X-Small" Font-Names="Microsoft Sans Serif" HorizontalAlign="Right" ForeColor="Yellow"
												BackColor="#FF9933" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></TD>
								</TR>
								<tr>
									<td align="center" bgColor="#ff9933"><asp:datagrid id="grdReturn2" runat="server" Font-Size="8pt" ForeColor="Black" Font-Names="Tahoma"
											Visible="False" HorizontalAlign="Center" BackColor="#FFFFC1" AutoGenerateColumns="False" Width="100%" CellPadding="3" GridLines="None"
											PageSize="6">
											<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
											<HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#FFCC33"></HeaderStyle>
											<Columns>
												<asp:BoundColumn DataField="FLIGHT1" ReadOnly="True" HeaderText="Flight">
													<HeaderStyle Width="8%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="airport1" HeaderText="Airport">
													<HeaderStyle Width="8%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="day1" HeaderText="On Date">
													<HeaderStyle Width="9%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn>
													<HeaderStyle Width="5%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="FLIGHT2" HeaderText="Flight2">
													<HeaderStyle Width="8%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="airport2" HeaderText="Airport2">
													<HeaderStyle Width="8%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="day2" HeaderText="On Date2">
													<HeaderStyle Width="9%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn>
													<HeaderStyle Width="5%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="All Duration">
													<HeaderStyle Width="10%"></HeaderStyle>
													<ItemTemplate>
														<%# GetAllDuration(Container.DataItem("DURATION1"),Container.DataItem("DURATION2")) %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="All Cost">
													<HeaderStyle Width="8%"></HeaderStyle>
													<ItemTemplate>
														<%# GetAllCost(Container.DataItem("AllEconomyCost"),Container.DataItem("AllBusinessCost"),Container.DataItem("AllFirstCost"),Request("CabinReturn")) %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Details">
													<HeaderStyle Width="8%"></HeaderStyle>
													<ItemTemplate>
														<%# "<a href=flightdetails.aspx?FID=" & Container.DataItem("Flight1") & "&FID2=" & Container.DataItem("Flight2") & "&FID3=null&MDY=" & Container.DataItem("day1") & "&MDY2=" & Container.DataItem("day2") & "&Adult=" & Request("Adult") & "&Child=" & Request("Child") & " target=_blank>details</a>" %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:ButtonColumn Text="Select" ButtonType="PushButton" CommandName="Selecting2">
													<HeaderStyle Width="8%"></HeaderStyle>
												</asp:ButtonColumn>
											</Columns>
											<PagerStyle Font-Size="X-Small" Font-Names="Microsoft Sans Serif" HorizontalAlign="Right" ForeColor="Yellow"
												BackColor="#FF9933" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></td>
								</tr>
								<tr>
									<td align="center" bgColor="#ff9933"><asp:datagrid id="grdReturn3" runat="server" Font-Size="8pt" ForeColor="Black" Font-Names="Tahoma"
											Visible="False" HorizontalAlign="Center" BackColor="#FFFFC1" AutoGenerateColumns="False" Width="100%" CellPadding="3" GridLines="None"
											PageSize="1">
											<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
											<HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#FFCC33"></HeaderStyle>
											<Columns>
												<asp:BoundColumn DataField="FLIGHT1" ReadOnly="True" HeaderText="Flight">
													<HeaderStyle HorizontalAlign="Left" Width="8%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Left"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="airport1" HeaderText="Airport">
													<HeaderStyle Width="6%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="day1" HeaderText="On Date">
													<HeaderStyle Width="12%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn>
													<HeaderStyle Width="2%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="FLIGHT2" HeaderText="Flight2">
													<HeaderStyle HorizontalAlign="Left" Width="8%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Left"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="airport2" HeaderText="Airport2">
													<HeaderStyle Width="6%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="day2" HeaderText="On Date2">
													<HeaderStyle Width="12%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn>
													<HeaderStyle Width="2%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="FLIGHT3" HeaderText="Flight3">
													<HeaderStyle HorizontalAlign="Left" Width="8%"></HeaderStyle>
													<ItemStyle HorizontalAlign="Left"></ItemStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="airport3" HeaderText="Airport3">
													<HeaderStyle Width="6%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:BoundColumn DataField="day3" HeaderText="On Date3">
													<HeaderStyle Width="12%"></HeaderStyle>
												</asp:BoundColumn>
												<asp:TemplateColumn HeaderText="All Duration">
													<HeaderStyle Width="10%"></HeaderStyle>
													<ItemTemplate>
														<%# GetAllDuration(Container.DataItem("DURATION1"),Container.DataItem("DURATION2"),Container.DataItem("DURATION3")) %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="All Cost">
													<HeaderStyle Width="8%"></HeaderStyle>
													<ItemTemplate>
														<%# GetAllCost(Container.DataItem("AllEconomyCost"),Container.DataItem("AllBusinessCost"),Container.DataItem("AllFirstCost"),Request("CabinReturn")) %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Details">
													<HeaderStyle Width="8%"></HeaderStyle>
													<ItemTemplate>
														<%# "<a href=flightdetails.aspx?FID=" & Container.DataItem("Flight1") & "&FID2=" & Container.DataItem("Flight2") & "&FID3=" & Container.DataItem("Flight3") & "&MDY=" &  Container.DataItem("day1") & "&MDY2=" & Container.DataItem("day2") & "&MDY3=" & Container.DataItem("day3") & "&Adult=" & Request("Adult") & "&Child=" & Request("Child") & " target=_blank>details</a>" %>
													</ItemTemplate>
												</asp:TemplateColumn>
												<asp:ButtonColumn Text="Select" ButtonType="PushButton" CommandName="SelectingReturn3">
													<HeaderStyle Width="8%"></HeaderStyle>
												</asp:ButtonColumn>
											</Columns>
											<PagerStyle Font-Size="X-Small" Font-Names="Microsoft Sans Serif" HorizontalAlign="Right" ForeColor="Yellow"
												BackColor="#FF9933" Mode="NumericPages"></PagerStyle>
										</asp:datagrid></td>
								</tr>
								<tr>
									<td align="center"><asp:label id="lblNotFRe" runat="server" Font-Size="8pt" ForeColor="Firebrick" Font-Bold="True"
											Font-Names="Tahoma" Visible="False"></asp:label></td>
								</tr>
								<tr>
									<td align="center"><asp:label id="lblNotFRe2" runat="server" Font-Size="8pt" ForeColor="Firebrick" Font-Bold="True"
											Font-Names="Tahoma" Visible="False"></asp:label></td>
								</tr>
								<tr>
									<td align="center"><asp:label id="lblNotFRe3" runat="server" Font-Size="8pt" ForeColor="Firebrick" Font-Bold="True"
											Font-Names="Tahoma" Visible="False"></asp:label></td>
								</tr>
								<tr height="15">
									<td></td>
								</tr>
								<tr>
									<td>
										<table style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma" cellSpacing="1" cellPadding="4"
											width="100%" align="left">
											<tr>
												<td align="right" width="12%"><b><asp:label id="lblCabinReturn" runat="server" Font-Size="8pt" ForeColor="Black" Font-Bold="True"
															Font-Names="Tahoma" Visible="False">Cabin Class :</asp:label></b></td>
												<td width="24%"><asp:radiobuttonlist id="radCabinReturn" runat="server" Font-Size="8pt" Font-Names="Tahoma" Visible="False"
														RepeatDirection="Horizontal">
														<asp:ListItem Value="0">First</asp:ListItem>
														<asp:ListItem Value="1" Selected="True">Business</asp:ListItem>
														<asp:ListItem Value="2">Economy</asp:ListItem>
													</asp:radiobuttonlist></td>
												<td width="14%"><asp:button id="btnReSortCost" runat="server" Font-Size="8pt" ForeColor="DimGray" Font-Bold="True"
														Font-Names="Tahoma" Visible="False" BackColor="LightGray" BorderStyle="Solid" Text="Sort by Cost"></asp:button></td>
												<td align="right" width="12%"><b><asp:label id="lblWebFareReturn" runat="server" Font-Size="8pt" ForeColor="Black" Font-Bold="True"
															Font-Names="Tahoma" Visible="False">Web Fare :</asp:label></b></td>
												<td align="left" width="38%"><asp:radiobuttonlist id="radWebFareReturn" runat="server" Font-Size="8pt" Font-Names="Tahoma" Visible="False"
														RepeatDirection="Horizontal">
														<asp:ListItem Value="0" Selected="True">Web Fare 6 Months</asp:ListItem>
														<asp:ListItem Value="1">Web Fare 1 Year</asp:ListItem>
													</asp:radiobuttonlist></td>
											</tr>
											<tr height="15">
												<td colSpan="5"></td>
											</tr>
											<tr vAlign="middle" bgColor="lightgrey" height="30">
												<td align="right" width="12%"><asp:label id="lblFlight" runat="server" Font-Size="8pt" ForeColor="Black" Font-Bold="True"
														Font-Names="Tahoma" Visible="False">Your flight :</asp:label></td>
												<td colSpan="2"><asp:label id="lblOneway" runat="server" Font-Size="8pt" ForeColor="Black" Font-Names="Tahoma"
														Visible="False"></asp:label>
												<td align="right" width="16%"><asp:label id="lblReturnFlight" runat="server" Font-Size="8pt" ForeColor="Black" Font-Bold="True"
														Font-Names="Tahoma" Visible="False">Your return flight :</asp:label></td>
												<td align="left" width="34%"><asp:label id="lblReturn" runat="server" Font-Size="8pt" ForeColor="Black" Font-Names="Tahoma"
														Visible="False"></asp:label></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table style="FONT-SIZE: 8pt; FONT-FAMILY: Tahoma" cellPadding="4" width="100%">
											<tr vAlign="middle">
												<td width="50%"><asp:button id="btnBack" runat="server" Font-Size="8pt" ForeColor="White" Font-Bold="True" Font-Names="Tahoma"
														BackColor="Firebrick" Text="Back" BorderColor="MistyRose"></asp:button></td>
												<td align="right" width="50%"><b>Go to:&nbsp;</b>Fares&nbsp;&nbsp;<asp:button id="btnNext" runat="server" Font-Size="8pt" ForeColor="White" Font-Bold="True" Font-Names="Tahoma"
														BackColor="Firebrick" Text="Next" BorderColor="MistyRose"></asp:button>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr style="FONT-SIZE: 8pt; COLOR: darkorange; FONT-FAMILY: Tahoma" height="24">
									<td><b>Note</b>
									</td>
								</tr>
								<tr height="4">
									<td background="image/bar.gif"></td>
								</tr>
								<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma">
									<td>
										<ul>
											<li>
											X = Not have this cabin class
											<li>
											F = Seat availability is full.
											<li>
											NE = Seat availability is less than requested.
											<li>
											Only Visa and MasterCard are accepted.
											<LI>
												Credit card holder must be part of the traveling party and the card must be 
												presented upon check-in.
											</LI>
										</ul>
									</td>
								</tr>
							</TABLE>
						</td>
					</tr>
					<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; TEXT-ALIGN: center" bgColor="#ff9933">
						<td style="HEIGHT: 24px" height="24">| <A href="http://161.246.5.166">Terms &amp; 
								Conditions</A> | <A href="http://161.246.5.166">Conditions of Carriage</A> |
							<A href="http://161.246.5.166">Privacy &amp; Security</A> |
						</td>
					</tr>
					<tr style="FONT-SIZE: 8pt; COLOR: black; FONT-FAMILY: Tahoma; TEXT-ALIGN: center" height="30">
						<td>Copyright 2006 SkyHigh Alliance Co., Ltd. All reserved.
						</td>
					</tr>
				</table>
			</FONT>
		</form>
	</body>
</HTML>
