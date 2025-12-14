<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>



<!--#INCLUDE FILE="include/Manager.asp" -->

<%
If Request("Reload").Count <> 0 then
    ReloadSite
    Response.redirect Request("URL")
End IF

If Request("Status").Count <> 0 then
    ToggleSiteStatus
    Response.redirect Request("URL")
End IF

Call GetStatus(Status, RevStatus)
PCFFiles = GetPCFFiles
%>

<% REM   header: %>
<% pageTitle = "Site Manager: " & MSCSSite.DisplayName %>
<HTML>
<HEAD>
    <TITLE> <% = pageTitle %> </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
    <!--#INCLUDE FILE="include/mgmt_define.asp" -->
</HEAD>
<BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="<% = Application("bgcolor") %>" TEXT="#000000" LINK="#FF0000" ALINK="#FF0000" VLINK="#FF0000">
<FONT FACE="AngsanaUPC, sans-serif">

<TABLE BORDER="0" CELLPADDING="3" CELLSPACING="0" WIDTH="100%">
<TR>
    <TD COLSPAN="" BGCOLOR="#000000">
        <FONT SIZE="+1" COLOR="#FFFFFF">
			<FONT SIZE="+2">Site Manager: </FONT>
			<%=  MSCSSite.DisplayName %>
		</FONT>
    </TD>
</TR>
</TABLE>

<% REM   body: %>
<BR>
<TABLE BORDER="1" CELLPADDING="3" CELLSPACING="0" BORDERCOLOR="#000000">
    <TR>
        <TD ALIGN="CENTER" WIDTH="200">
            <FONT FACE="Arial, sans-serif" COLOR="black" SIZE="+1" STYLE="{font-family: Arial, sans-serif; color: black; font-weight: bold; font-size: 14pt}"><FONT SIZE="+2" STYLE="{font-size: 18pt}">M</FONT>ERCHANDISING</FONT>
        </TD>
        <TD ALIGN="CENTER">

<TABLE BORDER="0" CELLPADDING="3">
    <TR>
        <FORM METHOD="POST" 
              ACTION="<% = tmplDept %>">
        <TD ALIGN="CENTER" WIDTH="100">
            <A HREF="<% = tmplDept %>"><IMG SRC="MSCS_images/admin/depts.gif" WIDTH="51" HEIGHT="41" BORDER="0" ALT="Departments"></A>
            <BR>
                <INPUT TYPE="SUBMIT"
                    NAME="Departments"
                    VALUE="   Plan    ">
        </TD>
        </FORM>
        <FORM METHOD="POST" 
              ACTION="<% = tmplProduct %>">
        <TD ALIGN="CENTER" WIDTH="100">
            <A HREF="<% = tmplProduct %>"><IMG SRC="MSCS_images/admin/home.gif"  WIDTH="51" HEIGHT="41" BORDER="0" ALT="Products"></A>
            <BR>
                <INPUT TYPE="SUBMIT"
                    NAME="Products"
                    VALUE="  Home  ">
        </TD>
        </FORM>


        <FORM METHOD="POST" 
              ACTION="<% = tmplAttr %>">
        <TD ALIGN="CENTER" WIDTH="100">
            <A HREF="<% = tmplAttr %>"><IMG SRC="MSCS_images/admin/events.gif" WIDTH="51" HEIGHT="41" BORDER="0" ALT="Attributes"></A>
            <BR>
                <INPUT TYPE="SUBMIT"
                    NAME="Attributes"
                    VALUE=" Accessories ">
        </TD>
        </FORM>


    </TR>
</TABLE>

        </TD>
    </TR>

    <TR>
        <TD ALIGN="CENTER" WIDTH="200">
            <FONT FACE="Arial, sans-serif" COLOR="black" SIZE="+1" STYLE="{font-family: Arial, sans-serif; color: black; font-weight: bold; font-size: 14pt}"><FONT SIZE="+2" STYLE="{font-size: 18pt}">T</FONT>RANSACTIONS</FONT>
        </TD>
        <TD ALIGN="CENTER">

<TABLE BORDER="0" CELLPADDING="3">
    <TR>
        <FORM METHOD="POST" 
              ACTION="<% = tmplOrder %>">
        <TD ALIGN="CENTER" WIDTH="100">
            <A HREF="<% = tmplOrder %>"><IMG SRC="MSCS_images/admin/orders.gif" WIDTH=51 HEIGHT=41 BORDER=0 ALT="Orders"></A>
            <BR>
                <INPUT TYPE="SUBMIT"
                    NAME="Orders"
                    VALUE=" Reserve ">
        </TD>
        </FORM>

		<FORM METHOD="POST" 
              ACTION="<% = tmplShopper %>">
		<TD ALIGN="CENTER" WIDTH="100">
			<A HREF="<% = tmplShopper %>"><IMG SRC="MSCS_images/admin/shoppers.gif" WIDTH=51 HEIGHT=41 BORDER=0 ALT="Shoppers"></A>
			<BR>
				<INPUT TYPE="SUBMIT"
					NAME="Shoppers"
					VALUE="  Shoppers  ">
		</TD>
		</FORM>

    </TR>
</TABLE>

        </TD>
    </TR>

    <TR>
        <TD ALIGN="CENTER">
            <FONT FACE="Arial, sans-serif" COLOR="black" SIZE="+1" STYLE="{font-family: Arial, sans-serif; color: black; font-weight: bold; font-size: 14pt}"><FONT SIZE="+2" STYLE="{font-size: 18pt}">S</FONT>YSTEM</FONT>
            <P>
			<FONT FACE="Arial, sans-serif" COLOR="black" STYLE="{font-family: Arial, sans-serif; color: black; font-weight: bold; font-size: 10pt}">Site status: [<%= status%>]</FONT>
            </TD>
        <TD ALIGN="CENTER">

<TABLE BORDER="0" CELLPADDING="3" WIDTH="100%">
    <TR>
        <FORM METHOD="POST" 
              ACTION="http://<% = Request.ServerVariables("SERVER_NAME") & ":" & Request.ServerVariables("SERVER_PORT") %>/<% = mscsPage.SiteRoot %>/default.asp">
        <TD ALIGN="CENTER" COLSPAN="2">
                <INPUT TYPE="SUBMIT"
                    NAME="Shop"
                    VALUE="  Shop Site  ">
        </TD>
        </FORM>
    </TR>
    <% if status <> "Invalid" then %>
        <TR>
            <FORM METHOD="GET" 
                  ACTION="<%= tmplManager %>">
            <TD ALIGN="CENTER" WIDTH="50%">
                    <INPUT TYPE="SUBMIT"
                        NAME="Status"
                        VALUE="   <%= RevStatus %>   ">
            </TD>
            </FORM>
            <FORM METHOD="GET" 
                  ACTION="<%= tmplManager %>">
            <TD ALIGN="CENTER" WIDTH=50%>
                    <INPUT TYPE="SUBMIT"
                        NAME="Reload"
                        VALUE=" Reload Site ">
            </TD>
            </FORM>
        </TR>
    <% end if %>
    
    
</TABLE>
        </TD>
    </TR>
</TABLE>
<% REM   footer: %>
<%'<!--#INCLUDE FILE="include/copyright.asp" -->	%>
