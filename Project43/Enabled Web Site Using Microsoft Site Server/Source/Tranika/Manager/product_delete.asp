<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>




<!--#INCLUDE FILE="include/Manager.asp" -->
<!--#INCLUDE FILE="xt_product_delete.asp" -->


<% REM   header: %>
<% pageTitle = "Delete Product" %>
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
<H1> Delete the product '<%= Request.Form("name") %>'? </H1>
<FONT FACE="Arial, sans-serif" COLOR="#FF0000" SIZE="+1" STYLE="{font-family: Arial, sans-serif; color: red; font-size: 12pt}"> <B>WARNING:</B> This will also delete all variants (SKUs), and attributes for this product. </FONT>

<FORM METHOD="POST"
    ACTION="product_delete.asp">
    <INPUT TYPE="HIDDEN" NAME="pf_id" VALUE="<%= mscsPage.HTMLEncode(Request.Form("pf_id")) %>">
    <INPUT TYPE="HIDDEN" NAME="Validate" VALUE="1">
    <INPUT TYPE="SUBMIT" VALUE="Delete">
	<INPUT TYPE="BUTTON" VALUE="Cancel" onClick="history.back()"> 
</FORM>

<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
