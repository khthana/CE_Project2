<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>







<!--#INCLUDE FILE="include/Manager.asp" -->
<!--#INCLUDE FILE="xt_location_delete.asp" -->



<% REM   header: %>
<% pageTitle = "Delete Location" %>
<HTML>
<HEAD>
    <TITLE> <% = pageTitle %> </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
    <!--#INCLUDE FILE="include/mgmt_define.asp" -->
</HEAD>

<BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="<% = Application("bgcolor") %>" TEXT="#000000" LINK="#FF0000" ALINK="#FF0000" VLINK="#FF0000">
<!--#INCLUDE FILE="include/mgmt_header.asp" -->

<% REM   body: %>
<!--#INCLUDE FILE="include/error.asp" -->
<H1> Delete the Location <%= Request.Form("lku") %>  </H1>

<FORM METHOD="POST"    ACTION="location_delete.asp">
    <INPUT TYPE="HIDDEN" NAME="lku" VALUE="<%= mscsPage.HTMLEncode(Request.Form("lku")) %>">
    <INPUT TYPE="HIDDEN" NAME="dept_id" VALUE="<%= mscsPage.HTMLEncode(Request.Form("dept_id")) %>">
    <INPUT TYPE="HIDDEN" NAME="location" VALUE="1">
    <INPUT TYPE="SUBMIT" VALUE="Delete">
	<INPUT TYPE="BUTTON" VALUE="Cancel" onClick="history.back()"> 
</FORM>

<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
