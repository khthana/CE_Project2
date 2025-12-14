<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>



<!--#INCLUDE FILE="include/Manager.asp" -->



<% name = request("attr") %>
<% table = request("attr_table") %>
<% REM   header: %>
<% pageTitle = "New " + UCase(Left(name,1)) & LCase(Mid(name,2)) + " Value" %>

<%
	Dim aname
	If name = "door"  then
				aname= "Home Door "
	End if
	If name = "door2"  then
				aname= "Room Door "
	End if
	If name = "toilet"  then
				aname= "Toilet"
	End if
	If name = "floor"  then
				aname= "Tile"
	End if
%>
	    
<HTML>
<HEAD>
    <TITLE> <% = pageTitle %> </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
    <!--#INCLUDE FILE="include/mgmt_define.asp" -->
</HEAD>

<BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="<% = Application("bgcolor") %>" TEXT="#000000" LINK="#FF0000" ALINK="#FF0000" VLINK="#FF0000">
<!--#INCLUDE FILE="include/mgmt_header.asp" -->

<% REM   body: %>

<FORM METHOD="POST"   ACTION="Script_Attr_insert.asp">
    <INPUT TYPE="HIDDEN" NAME="attr" VALUE="<%= mscsPage.HTMLEncode(name) %>">
    <INPUT TYPE="HIDDEN" NAME="attr_table" VALUE="<%= table %>">
    <INPUT TYPE="HIDDEN" NAME="Validate" VALUE="1">

<TABLE CELLPADDING=5 WIDTH=450 BORDER="0">

    <TR>
        <% REM  label: %>
        <TH ALIGN="RIGHT" VALIGN="TOP"> 
					<% = aname %> id:            
			<%
				'= UCase(Left(name,1)) & LCase(Mid(name,2)) 
			%>  
        </TH>

        <% REM  value: %>
        <TD VALIGN="TOP"> 
            <INPUT TYPE = "text" 
                   SIZE = "32" 
                   NAME = "<%= name %>_id"
                   VALUE = "<%= Request(name & "_id") %>"> 
        </TD>
    </TR>

    <TR>
        <% REM  label: %>
        <TH ALIGN="RIGHT" VALIGN="TOP"> 
            Name<%'= aname %> : 
        </TH>

        <% REM  value: %>
        <TD VALIGN="TOP"> 
            <INPUT TYPE = "text" 
                   SIZE = "32" 
                   NAME = "<%= name %>_value"
                   VALUE = "<%= Request(name & "_value") %>"> 
        </TD>
    </TR>
<%
'	---------------------------------
%>
        <TR>
        <% REM  label: %>
        <TH ALIGN="RIGHT" VALIGN="TOP"> 
            Price : 
        </TH>

        <% REM  value: %>
        <TD VALIGN="TOP"> 
            <INPUT TYPE = "text" 
                   SIZE = "32" 
                   NAME = "<%= name %>_price"
                   VALUE = "<%= Request(name & "_price") %>"> 
        </TD>
    </TR>		

    <TR>
        <% REM  label: %>
        <TH ALIGN="RIGHT"  VALIGN="TOP"> 
            Description : 
        </TH>

        <% REM  value: %>
        <TD VALIGN="TOP"> 
            <INPUT TYPE = "text" 
                   SIZE = "32" 
                   NAME = "<%= name %>_description"
                   VALUE = "<%= Request(name & "_description") %>"> 
        </TD>
    </TR>		
    
    <TR>
        <% REM  label: %>
        <TH ALIGN="RIGHT"  VALIGN="TOP"> 
            <% = aname%> image : 
        </TH>

        <% REM  value: %>
        <TD VALIGN="TOP"> 
            <INPUT TYPE = "text" 
                   SIZE = "32" 
                   NAME = "<%= name %>_file"
                   VALUE = "<%= Request(name & "_file") %>"> 
        </TD>
    </TR>		
<%
'	---------------------------------
%>

    <TR>
        <% REM  label: %>
        <TD VALIGN="TOP"></TD>

        <% REM  value: %>
        <TD VALIGN="TOP">
            <INPUT TYPE="submit" VALUE="Add New <%= aname %> ">
        </TD>
    </TR>
</TABLE>

</FORM>

<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
