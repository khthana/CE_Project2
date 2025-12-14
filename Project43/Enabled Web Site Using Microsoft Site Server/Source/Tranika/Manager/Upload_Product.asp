<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>


<!--#INCLUDE FILE="include/Manager.asp" -->
<% pageTitle = "Product_Upload" %>
<HTML>
<HEAD>
    <TITLE> <% = pageTitle %> </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
    <!--#INCLUDE FILE="include/mgmt_define.asp" -->
	<!--#INCLUDE FILE="include/mgmt_header.asp" -->
<BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="<% = Application("bgcolor") %>" TEXT="#000000" LINK="#FF0000" ALINK="#FF0000" VLINK="#FF0000">


<FORM METHOD="POST" ENCTYPE="multipart/form-data" ACTION="Product_Script.asp">
		
<TABLE BORDER="1" CELLPADDING="0" CELLSPACING="0">
		<TR>
				<TD WIDTH="150" ALIGN="LEFT"><FONT COLOR="BLUE">&nbsp File </FONT><FONT FACE="Arial, sans-serif" COLOR="red" STYLE="{font-family: Arial, sans-serif; color: red; font-weight: bold; font-size: 9pt}"> &nbsp<%=Request("image_file")%> &nbsp</FONT>
				</TD>
				<TD><INPUT TYPE=FILE SIZE=60 NAME="FILE1"><BR></TD>
		</TR>

		<TR>
				<TD WIDTH="150" ALIGN="LEFT"><FONT COLOR="BLUE">&nbsp File</FONT><FONT FACE="Arial, sans-serif" COLOR="red" STYLE="{font-family: Arial, sans-serif; color: red; font-weight: bold; font-size: 9pt}"> &nbsp<%=Request("image_first")%> &nbsp</FONT>
				</TD>
				<TD><INPUT TYPE=FILE SIZE=60 NAME="FILE2"><BR></TD>
		</TR>

		<TR><TD WIDTH="150" ALIGN="LEFT"><FONT COLOR="BLUE">&nbsp File</FONT><FONT FACE="Arial, sans-serif" COLOR="red" STYLE="{font-family: Arial, sans-serif; color: red; font-weight: bold; font-size: 9pt}"> &nbsp<%=Request("image_second")%> &nbsp</FONT>
				</TD>
				<TD><INPUT TYPE=FILE SIZE=60 NAME="FILE3"><BR></TD>
		</TR>

</TABLE>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="600">
		<TR>
				<TD COLSPAN=2 ALIGN="CENTER"  VALIGN="MIDDLE"><BR><INPUT TYPE=SUBMIT VALUE="Upload!"></TD>
		</TR>
</TABLE>
	</FORM>

</BODY>
</HTML>
<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->