<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>






<!--#INCLUDE FILE="include/Manager.asp" -->
<!--#INCLUDE FILE="xt_product_insert.asp" -->
<% pageTitle = "New Product" %>
<HTML>
<HEAD>
    <TITLE> <% = pageTitle %> </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
    <!--#INCLUDE FILE="include/mgmt_define.asp" -->
    <SCRIPT>
    <!--
        dirty = false
    //-->
    </SCRIPT>
</HEAD>

<BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="<% = Application("bgcolor") %>" TEXT="#000000" LINK="#FF0000" ALINK="#FF0000" VLINK="#FF0000">
<!--#INCLUDE FILE="include/mgmt_header.asp" -->
<%cmdTemp.CommandText = "SELECT dept_id, dept_name FROM tranika_dept ORDER BY dept_name"
Set rsDept = Server.CreateObject("ADODB.Recordset")
On Error Resume Next
rsDept.Open cmdTemp, , adOpenStatic, adLockReadOnly

if Err.Number <> 0 then
    Set errorList = Server.CreateObject("Commerce.SimpleList")
    errorList.Add "The table could not be found or the database connection failed."
    %>
    <!--#INCLUDE FILE="include/error.asp" -->
    <!--#INCLUDE FILE="include/mgmt_footer.asp" -->
    <%
    Response.end
end if
%>


<FONT FACE="Arial, sans-serif" COLOR="#FF0000">
<BR>
</FONT>
<FONT FACE="Arial, sans-serif">
<P>
</FONT>


<% REM   body: %>
<!--#INCLUDE FILE="include/error.asp" -->