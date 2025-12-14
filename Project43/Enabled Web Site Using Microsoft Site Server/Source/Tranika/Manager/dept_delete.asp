<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>






<!--#INCLUDE FILE="include/Manager.asp" -->
<!--#INCLUDE FILE="xt_dept_delete.asp" -->

<% REM   header: %>
<% pageTitle = "Delete Department" %>
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
<H1> Delete the department '<% = Request.Form("dept_name") %>'? </H1>

<FORM METHOD="POST"
    ACTION="dept_delete.asp">
    <INPUT TYPE="HIDDEN" NAME="id" VALUE="<% = Request.Form("dept_id") %>">
    <INPUT TYPE="HIDDEN" NAME="Validate" VALUE="1">
    <INPUT TYPE="SUBMIT" VALUE="Delete">
	<INPUT TYPE="BUTTON" VALUE="Cancel" onClick="history.back()"> 
</FORM>

<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
