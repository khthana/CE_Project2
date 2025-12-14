<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>

<!--#INCLUDE FILE="i_shop.asp" --> 
<%
		dept_id = mscsPage.RequestString("dept_id")
		pf_id = mscsPage.RequestString("pf_id")
		sku = mscsPage.RequestString("sku")
		zone = mscsPage.RequestString("zone")
		price = mscsPage.RequestNumber("price")
		
		sqlText = ("SELECT  zone  FROM tranika_reserve  WHERE  dept_id  = : 1 AND zone = : 2 ")
		sqlText = Replace(sqlText , " : 1 " , dept_id)
		sqlText = Replace(sqlText , " : 2 " , "'"&zone&"'")
		cmdTemp.CommandText = sqlText
        Set rsCheck = Server.CreateObject("ADODB.Recordset")
		rsCheck.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
		set zone = rsCheck("zone")

		sqlText = ("SELECT reserve_id  FROM  tranika_reserve;  ")
		sqlText = Replace(sqlText , " : 1 " , "'"&pf_id&"'")
		cmdTemp.CommandText = sqlText
        Set rsReserve = Server.CreateObject("ADODB.Recordset")
        rsReserve.Open cmdTemp, , adOpenForwardOnly, adLockReadOnly
		
		do while  NOT rsReserve.EOF
				set reserve = rsReserve("reserve_id")
				re = reserve
				rsReserve.MoveNext
				loop
		reserve_id =re+1

%>

<HTML>
<HEAD>
    <TITLE><%= displayName %>: Product<% if product_exists then %>: '<%= mscsPage.HTMLEncode(name) %>'<% end if %></TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
</HEAD>

<%
if   rsCheck.EOF  then
%>
<!--#INCLUDE FILE="main.htm" --> 
<TABLE WIDTH="80%" BORDER="0" ALIGN="center">
		<FORM METHOD="post" ACTION="thank.asp">
		<INPUT TYPE="HIDDEN" NAME="Validate" VALUE="1">
		<INPUT TYPE=HIDDEN NAME="reserve_id" VALUE="<% = reserve_id %>" >
		<INPUT TYPE=HIDDEN NAME="dept_id" VALUE="<% = Request("dept_id") %>" >
		<INPUT TYPE=HIDDEN NAME="pf_id" VALUE="<%= Request("pf_id") %>" >
		<INPUT TYPE=HIDDEN NAME="zone" VALUE="<% = Request("zone") %>" >
		<INPUT TYPE=HIDDEN NAME="sku" VALUE="<% = Request("sku") %>" >
		<INPUT TYPE=HIDDEN NAME="price" VALUE="<% = Request("price") %>" >
		<INPUT TYPE=HIDDEN NAME="status" VALUE="reserve" >
<TR>
		
		<TD Colspan="2" ALIGN="center">&nbsp &nbsp <FONT SIZE="6" color=#3333FF><b>Please insert information</b></FONT></TD> 
</TR>
<TR><TD COLSPAN="2" ALIGN="center"> &nbsp</TD></TR>
<TR>
		<TD WIDTH="30%" ALIGN="RIGHT"><b>email : &nbsp</b></TD>
		<TD><INPUT TYPE=TEXT NAME="shopper_id"  SIZE="32"></TD>
</TR>
<TR>
		<TD WIDTH="30%" ALIGN="RIGHT"><b>Password : &nbsp</b></TD>
		<TD><INPUT TYPE=PASSWORD NAME="password" SIZE="32"></TD>
</TR>
<TR>
		<TD WIDTH="30%" ALIGN="RIGHT"><b>Name : &nbsp</b></TD>
		<TD><INPUT TYPE="TEXT" NAME="name" SIZE="32"></TD>
</TR>
<TR>
		<TD WIDTH="30%" ALIGN="RIGHT"><b>Address : &nbsp</b></TD>	
		<TD><TEXTAREA ROWS="4"  COLS="46" NAME="address" ></TEXTAREA></TD>
</TR>
<TR>
		<TD WIDTH="30%" ALIGN="RIGHT"><b>Country : &nbsp</b></TD>
		<TD><INPUT TYPE=TEXT NAME="country" SIZE="32"></TD>
</TR>
<TR>
		<TD WIDTH="30%" ALIGN="RIGHT"><b>Phone : &nbsp</b></TD>
		<TD><INPUT TYPE=TEXT NAME="phone" SIZE="32"></TD>
</TR>
<TR>
		<TD WIDTH="30%" ALIGN="RIGHT"></TD>
		<TD>&nbsp</TD>
</TR>
<TR>
		<TD WIDTH="30%" ALIGN="RIGHT"></TD>
		<TD>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<INPUT TYPE="submit"  VALUE="    OK    "></TD>
</TR>
</TABLE>

<%		else 
			Response.Write "Sorry !	 Please come back to select zone"
%>

<%		end if	
			rsReserve.Close
			rsCheck.Close
%>

</BODY>
</HTML>