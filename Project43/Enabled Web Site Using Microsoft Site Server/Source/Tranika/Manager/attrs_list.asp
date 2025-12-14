<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>




<!--#INCLUDE FILE="include/Manager.asp" -->



<% REM   header: %>
<% pageTitle = "Attribute Manager" %>
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

<LI> <A HREF="attr_list.asp?<% = mscsPage.URLArgs("attr", "door", "attr_table", "tranika_attr_door") %>"> Home Door</A></TD>

<LI> <A HREF="attr_list.asp?<% = mscsPage.URLArgs("attr", "door2", "attr_table", "tranika_attr_door2") %>"> Room Door </A></TD>

<LI> <A HREF="attr_list.asp?<% = mscsPage.URLArgs("attr", "toilet", "attr_table", "tranika_attr_toilet") %>">Toilet</A></TD>

<LI> <A HREF="attr_list.asp?<% = mscsPage.URLArgs("attr", "floor", "attr_table", "tranika_attr_floor") %>">Tile </A></TD>

</UL>
<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
