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


<FORM METHOD="POST" ENCTYPE="multipart/form-data" ACTION="dept_Script.asp">
		
<TABLE BORDER="1" CELLPADDING="0" CELLSPACING="0">
		<TR>
				<TD WIDTH="150" ALIGN="LEFT"><FONT COLOR="BLUE">&nbsp ไฟล์ชื่อ</FONT><FONT FACE="Arial, sans-serif" COLOR="red" STYLE="{font-family: Arial, sans-serif; color: red; font-weight: bold; font-size: 8pt}"> &nbsp<%=Request("dept_map")%> &nbsp</FONT>
				</TD>
				<TD><INPUT TYPE=FILE SIZE=60 NAME="FILE1"><BR></TD>
		</TR>

		<TR>
				<TD WIDTH="150" ALIGN="LEFT"><FONT COLOR="BLUE">&nbsp ไฟล์ชื่อ</FONT><FONT FACE="Arial, sans-serif" COLOR="red" STYLE="{font-family: Arial, sans-serif; color: red; font-weight: bold; font-size: 8pt}"> &nbsp<%=Request("dept_zone")%> &nbsp</FONT>
				</TD>
				<TD><INPUT TYPE=FILE SIZE=60 NAME="FILE2"><BR></TD>
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
