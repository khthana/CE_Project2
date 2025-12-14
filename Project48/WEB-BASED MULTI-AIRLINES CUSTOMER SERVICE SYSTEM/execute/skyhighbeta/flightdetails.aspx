<%@ Page Language="vb" AutoEventWireup="false" Codebehind="flightdetails.aspx.vb" Inherits="skyhighbeta.flightdetails"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>SkyHigh :: Flight Details</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table width="800" align="center" cellspacing="0" cellpadding="0">
				<tr>
					<td><table width="96%" cellspacing="0" cellpadding="2" align="center">
							<tr bgcolor="#339900" height="24" valign="middle">
								<td><FONT face="Tahoma">&nbsp;
										<asp:label id="lblDetailsHead" runat="server" Font-Size="8pt" ForeColor="White" Font-Names="Tahoma"
											Font-Bold="True"></asp:label></FONT></td>
							</tr>
							<tr bgcolor="#339900">
								<td>
									<asp:datagrid id="grdOnewayDetails2" runat="server" HorizontalAlign="Center" BackColor="#FFFFC1"
										AutoGenerateColumns="False" Width="100%" CellPadding="3" GridLines="None" PageSize="6" DataKeyField="FlightID"
										Font-Size="8pt" ForeColor="Black" Font-Names="Tahoma">
										<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
										<HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="YellowGreen"></HeaderStyle>
										<Columns>
											<asp:BoundColumn DataField="FLIGHTID" ReadOnly="True" HeaderText="Flight">
												<HeaderStyle Width="8%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="DEPT_TIME" HeaderText="Departure">
												<HeaderStyle Width="8%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="airportname" HeaderText="Airport">
												<HeaderStyle HorizontalAlign="Left" Width="18%"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="ARR_TIME" HeaderText="Arrival">
												<HeaderStyle Width="8%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="airportname1" HeaderText="Airport">
												<HeaderStyle HorizontalAlign="Left" Width="18%"></HeaderStyle>
												<ItemStyle HorizontalAlign="Left"></ItemStyle>
											</asp:BoundColumn>
											<asp:BoundColumn DataField="AIRCRAFT" HeaderText="Aircraft">
												<HeaderStyle Width="7%"></HeaderStyle>
											</asp:BoundColumn>
											<asp:TemplateColumn HeaderText="Duration">
												<HeaderStyle Width="10%"></HeaderStyle>
												<ItemTemplate>
													<%# GetAllDuration(Container.DataItem("DURATION")) %>
													</asp:Label>
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
												<HeaderStyle HorizontalAlign="Center" Width="14%"></HeaderStyle>
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
										</Columns>
										<PagerStyle Font-Size="X-Small" Font-Names="Microsoft Sans Serif" HorizontalAlign="Right" ForeColor="Yellow"
											BackColor="#FF9933" Mode="NumericPages"></PagerStyle>
									</asp:datagrid></td>
							</tr>
							<tr>
								<td align="right">
									<asp:button id="btnClose" runat="server" BackColor="ForestGreen" Width="76px" Font-Size="8pt"
										ForeColor="White" Font-Names="Tahoma" Font-Bold="True" Text="Close" BorderColor="MistyRose"></asp:button></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
