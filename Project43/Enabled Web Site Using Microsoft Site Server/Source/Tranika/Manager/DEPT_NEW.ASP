<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>





<!--#INCLUDE FILE="include/Manager.asp" -->
<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
%>


<% REM   header: %>
<% pageTitle = " New Plan" %>
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

<FORM METHOD="GET"    ACTION="Script_dept_insert.asp">
    <INPUT TYPE="HIDDEN" NAME="Validate" VALUE="1">

<TABLE CELLPADDING="5" WIDTH="450" BORDER="0">

    <TR>
        <% REM  label: %>
        <TH ALIGN="RIGHT"  VALIGN="TOP"> 
			Plan id  : 
        </TH>

        <% REM  value: %>
        <TD VALIGN="TOP"> 
            <INPUT TYPE = "text"  SIZE ="32"   NAME = "dept_id"  VALUE = "<%= Request("dept_id") %>"onChange="dirty = true"> 
        </TD>
    </TR>
<%
    '<TR>
    '    <TD VALIGN="TOP" COLSPAN="2">
    '        <FONT SIZE="-1">&nbsp;<B>Note:</B> ID can contain only numbers, e.g., 1955</FONT>
    '    </TD>
    '</TR>
%>

    <TR>
        <% REM  label: %>
        <TH  ALIGN="RIGHT"   VALIGN="TOP"> 
            Plan name : 
        </TH>

        <% REM  value: %>
        <TD VALIGN="TOP"> 
            <INPUT TYPE = "text" 
                   SIZE = "32" 
                   NAME = "dept_name"
                   VALUE = "<%= Request("dept_name") %>"> 
        </TD>
    </TR>

    <TR>
        <% REM  label: %>
        <TH ALIGN="RIGHT"  VALIGN="TOP"> 
            Description : 
        </TH>

        <% REM  value: %>
        <TD VALIGN="TOP"> 
            <TEXTAREA COLS="45" 
                      ROWS="5" 
                      NAME="dept_description" 
                      WRAP = "virtual"><%= Request("dept_description") %></TEXTAREA> 
        </TD>

	<TR>
        <% REM  label: %>
        <TH  ALIGN="RIGHT"   VALIGN="TOP"> 
            Plan image : 
        </TH>

        <% REM  value: %>
        <TD VALIGN="TOP"> 
            <INPUT TYPE = "text" 
                   SIZE = "32" 
                   NAME = "dept_map"
                   VALUE = "<%= Request("dept_map") %>"> 
        </TD>
    </TR>

	<TR>
        <% REM  label: %>
        <TH  ALIGN="RIGHT"   VALIGN="TOP"> 
            Zone image : 
        </TH>

        <% REM  value: %>
        <TD VALIGN="TOP"> 
            <INPUT TYPE = "text" 
                   SIZE = "32" 
                   NAME = "dept_zone"
                   VALUE = "<%= Request("dept_zone") %>"> 
        </TD>
    </TR>

    <TR>
        <% REM  label: %>
        <TD VALIGN="TOP"></TD>

        <% REM  value: %>
        <TD VALIGN="TOP">
            <INPUT TYPE="submit" VALUE=" Add New Plan ">
        </TD>
    </TR>
</TABLE>

</FORM>


<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
</BODY>
</HTML>