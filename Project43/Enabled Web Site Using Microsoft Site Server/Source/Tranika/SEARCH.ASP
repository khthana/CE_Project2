<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>
<!--#INCLUDE FILE="i_shop.asp" -->
<% '  เป็นส่วนของ link ต่าง ๆ ด้านซ้ายมือ		%>
<!--#INCLUDE FILE="main.htm" -->
<HTML>
<HEAD>
    <TITLE><%= displayName %> : Search </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
</HEAD>
<% ' เป็นส่วนของ ข้อมูลในการเลือกด้านขวามือ	%> 	
<TABLE WIDTH="800" BORDER="0" ALIGN="center" VALIGN="top">
<TR>
			<TD WIDTH="78%" ALIGN=LEFT VALIGN=TOP >
				<TABLE WIDTH="100%" ALIGN="CENTER" VALIGN="TOP" BORDER="0">
					<TR>
						<TD WIDTH="100%" ALIGN="CENTER" COLSPAN="3" BGCOLOR="#6699CC">		 <H1>		Search	</H1>				</TD>
					 </TD>
					 <TR BORDER="0">
						<TD WIDTH="30%" ALIGN="RIGHT" BGCOLOR="#6699CC" > Please select &nbsp	</TD>
						<TD WIDTH="30%" ALIGN="CENTER" BGCOLOR="#6699CC" COLSPAN="2"> </TD>
					</TR>
					<TR>						
						<FORM METHOD=POST ACTION="list.asp">
							<TD WIDTH="20%" ALIGN="RIGHT" BGCOLOR="#99CCFF">	 budget  :	&nbsp</TD>
							<TD WIDTH="5%" BGCOLOR="#99CCFF">						&nbsp					</TD>
							<TD WIDTH="70%" BGCOLOR="#99CCFF">		
													<SELECT NAME="price" SIZE="1">
																				<OPTION VALUE="0">&nbsp &nbsp&nbsp&nbsp &nbsp&nbsp	none
																				<OPTION VALUE="1">  less than&nbsp &nbsp&nbsp1,000,000 &nbsp &nbsp &nbsp &nbsp    Bath
																				<OPTION VALUE="2">  between&nbsp &nbsp &nbsp1,000,000 - 2,000,000 &nbsp    Bath
																				<OPTION VALUE="3">  between&nbsp &nbsp &nbsp2,000,000 - 3,000,000 &nbsp  Bath
																				<OPTION VALUE="4">  &nbsp up &nbsp&nbsp &nbsp    3,000,000 &nbsp &nbsp &nbsp &nbsp  Bath
													</SELECT>	
							</TD>
					</TR>
					<TR>
						<TD WIDTH="20%" ALIGN="RIGHT" BGCOLOR="#99CCFF"> Location  :	&nbsp</TD>
						<TD WIDTH="5%" BGCOLOR="#99CCFF">						&nbsp					</TD>
						<TD WIDTH="70%" BGCOLOR="#99CCFF">
										<SELECT NAME="dept" SIZE="1" >
													<OPTION VALUE=" 0 ">&nbsp &nbsp &nbsp &nbsp&nbsp none
													<%
													cmdTemp.CommandText = "SELECT  dept_id, dept_name FROM tranika_dept "
													Set rsFindSpec = Server.CreateObject("ADODB.Recordset")
													rsFindSpec.Open cmdTemp, , adOpenStatic, adLockReadOnly
													set nameField = rsFindSpec("dept_name")
													set valueField = rsFindSpec("dept_id")
													Do While Not rsFindSpec.EOF
													%>
													<OPTION VALUE="<% = valueField %>">&nbsp &nbsp&nbsp&nbsp&nbsp &nbsp &nbsp <%= mscsPage.HTMLEncode(nameField.value) %> &nbsp &nbsp  
													<%
													rsFindSpec.MoveNext
													Loop
													%>
										</SELECT>	
						</TD>
					</TR>
					<TR>
						<TD WIDTH="20%" ALIGN="RIGHT" BGCOLOR="#99CCFF">	Type of home   :	&nbsp</TD>
						<TD WIDTH="5%" BGCOLOR="#99CCFF">						&nbsp					</TD>
						<TD WIDTH="70%" BGCOLOR="#99CCFF">
										<SELECT NAME="model" SIZE="1" >
													<OPTION VALUE=" 0 ">&nbsp &nbsp &nbsp&nbsp&nbsp none
													<%
													cmdTemp.CommandText = "SELECT DISTINCT model FROM tranika_product "
													Set rsFindSpec = Server.CreateObject("ADODB.Recordset")
													rsFindSpec.Open cmdTemp, , adOpenStatic, adLockReadOnly
													set nameField = rsFindSpec("model")
													Do While Not rsFindSpec.EOF
													%>
													<OPTION VALUE="<%= mscsPage.HTMLEncode(nameField.value) %>" >&nbsp &nbsp &nbsp   &nbsp &nbsp &nbsp	<%= mscsPage.HTMLEncode(nameField.value) %>  &nbsp &nbsp &nbsp   &nbsp &nbsp &nbsp &nbsp 
													<%
													rsFindSpec.MoveNext
													Loop
													%>

													</SELECT>
						</TD>
					</TR>
					<TR>
						<TD WIDTH="20%" ALIGN="RIGHT" BGCOLOR="#99CCFF">	Land of home  :		&nbsp</TD>
						<TD WIDTH="5%" BGCOLOR="#99CCFF">						&nbsp					</TD>
						<TD WIDTH="70%" BGCOLOR="#99CCFF">
													<SELECT NAME="area_num">
																				<OPTION VALUE=" 0 ">&nbsp &nbsp &nbsp&nbsp&nbsp&nbsp   none &nbsp 
																				<OPTION VALUE=" 1 ">&nbsp   less than 60 ตรว  &nbsp 
																				<OPTION VALUE=" 2 ">&nbsp   betwwen 60 - 80 ตรว &nbsp 
																				<OPTION VALUE=" 3 ">&nbsp   between  80 - 100 ตรว &nbsp 
																				<OPTION VALUE=" 4 ">&nbsp   up 100 ตรว &nbsp 
													</SELECT>	
							</TD>
						</TR>
						<TR>
							<TD WIDTH="20%" ALIGN="RIGHT" BGCOLOR="#99CCFF">	Bedroom  :	&nbsp</TD>
							<TD WIDTH="5%" BGCOLOR="#99CCFF">						&nbsp					</TD>
							<TD WIDTH="70%" BGCOLOR="#99CCFF">
													<SELECT NAME="bedroom">
													<OPTION VALUE = " 0 ">&nbsp &nbsp &nbsp&nbsp&nbsp&nbsp   none
													<%
													cmdTemp.CommandText = "SELECT DISTINCT bedroom  FROM tranika_product "
													Set rsFindSpec = Server.CreateObject("ADODB.Recordset")
													rsFindSpec.Open cmdTemp, , adOpenStatic, adLockReadOnly
													set nameField = rsFindSpec("bedroom")
													Do While Not rsFindSpec.EOF
													%>
													<OPTION VALUE = "<%= mscsPage.HTMLEncode(nameField.value) %>">&nbsp &nbsp &nbsp &nbsp	&nbsp 
													<%= mscsPage.HTMLEncode(nameField.value) %>  room  &nbsp &nbsp &nbsp &nbsp&nbsp 
													<%
													rsFindSpec.MoveNext
													Loop
													%>
													</SELECT>	
							</TD>
						</TR>
						<TR>
							<TD WIDTH="20%" ALIGN="RIGHT" BGCOLOR="#99CCFF">	Bathroom  :		&nbsp</TD>
							<TD WIDTH="5%" BGCOLOR="#99CCFF">						&nbsp					</TD>
							<TD WIDTH="70%" BGCOLOR="#99CCFF">
													<SELECT NAME="bathroom">
													<OPTION VALUE = " 0 ">&nbsp &nbsp &nbsp&nbsp&nbsp&nbsp   none
													<%
														cmdTemp.CommandText = "SELECT DISTINCT bathroom  FROM tranika_product "
													Set rsFindSpec = Server.CreateObject("ADODB.Recordset")
													rsFindSpec.Open cmdTemp, , adOpenStatic, adLockReadOnly
													set nameField = rsFindSpec("bathroom")
													Do While Not rsFindSpec.EOF
													%>
													<OPTION VALUE = "<%= mscsPage.HTMLEncode(nameField.value) %>">&nbsp &nbsp &nbsp &nbsp	&nbsp 
													<%= mscsPage.HTMLEncode(nameField.value) %>  room  &nbsp &nbsp &nbsp &nbsp&nbsp 
													<%
													rsFindSpec.MoveNext
													Loop
													%>
													</SELECT>	
						</TD>
					</TR>
					<TR>
						<TD WIDTH="20%" ALIGN="RIGHT" BGCOLOR="#99CCFF">	&nbsp	</TD>			
						<TD WIDTH="5%" BGCOLOR="#99CCFF">						&nbsp					</TD>						
						<TD WIDTH="70%" BGCOLOR="#99CCFF"><INPUT TYPE=SUBMIT VALUE="  search  "> &nbsp &nbsp	<INPUT TYPE=RESET VALUE="  cancel  "></td>
					</TR>
				</FORM>
				</TABLE>
<% ' -------------------------------------------------------------------------------------------- %>
</BODY>
</HTML>