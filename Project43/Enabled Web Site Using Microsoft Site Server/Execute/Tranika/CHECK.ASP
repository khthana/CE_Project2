<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>
<!--#INCLUDE FILE="i_shop.asp" --> 
<%  if Validate = 1 then	%>
<% else	 ' ตรวจสอบว่าเข้าครั้งแรกหรือเปล่า %>
<HTML>
<HEAD>
    <TITLE><%= displayName %> : Check <% if product_exists then %>: '<%= mscsPage.HTMLEncode(name) %>'<% end if %></TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
</HEAD>
<BODY BGCOLOR="FFFFFF" TEXT= "#000000" LINK= "#FF0000" VLINK= "#FF0000" ALINK=  "#FF0000" >
<!--#INCLUDE FILE="main.htm" --> 
<TABLE WIDTH="60%" BORDER="1" ALIGN="center">
<FORM METHOD="post" ACTION="test_check.asp">
		 <INPUT TYPE="HIDDEN" NAME="Validate" VALUE="1">
		 <TR><TD COLSPAN="2" BGCOLOR="#66CCCC" ALIGN="CENTER"><B>INSERT INFORMATION </B></TD></TR>
		 <TR><TD WIDTH="20%" BGCOLOR="#99FFFF" ALIGN="right">Email : &nbsp &nbsp</TD><TD BGCOLOR="#99FFFF">&nbsp &nbsp <INPUT TYPE="Text" NAME="shopper_id"></TD></TR>
		 <TR><TD WIDTH="20%" BGCOLOR="#99FFFF" ALIGN="right">Pass  : &nbsp &nbsp</TD><TD BGCOLOR="#99FFFF">&nbsp &nbsp <INPUT TYPE="password" NAME="password" ></TD></TR>
		<TR><TD BGCOLOR="#99FFFF" ALIGN="center" COLSPAN="2"><INPUT TYPE="submit"   VALUE="  login  "></TD></TR>						
</FORM>
</TABLE>
<BR><BR>
<% 	End if %>
</BODY>
</HTML>