<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>







<!--#INCLUDE FILE="include/Manager.asp" -->

<% REM   header: %>
<% pageTitle = "Order Manager" %>
<HTML>
<HEAD>
    <TITLE> <% = pageTitle %> </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
    <!--#INCLUDE FILE="include/mgmt_define.asp" -->
</HEAD>

<BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="<% = Application("bgcolor") %>" TEXT="#000000" LINK="#FF0000" ALINK="#FF0000" VLINK="#FF0000">
<!--#INCLUDE FILE="include/mgmt_header.asp" -->

<% REM   body: %>
<UL>
    <LI> <A HREF="order_list.asp"> ทุกการสั่งจอง </A>
    <LI> <A HREF="order_day.asp"> การสั่งจองในแต่ละเดือน </A>
    <LI> <A HREF="order_month.asp"> การสั่งจองในแต่ละปี </A>
      
</UL>

<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
