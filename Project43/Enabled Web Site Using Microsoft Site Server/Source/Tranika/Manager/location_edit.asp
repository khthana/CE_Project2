<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>







<!--#INCLUDE FILE="include/Manager.asp" -->
<!--#INCLUDE FILE="xt_location_update.asp" -->



<% REM   header: %>
<% pageTitle = "Edit Location '" &  Request("lku") & "'" %>
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
<%
cmdTemp.CommandText = Replace("SELECT * FROM tranika_location WHERE lku = ?", "?", "'" & Replace(Request("lku"),"'","''") & "'")
Set rsLocation = Server.CreateObject("ADODB.Recordset")
rsLocation.Open cmdTemp, , adOpenStatic, adLockReadOnly
%>

<FORM METHOD="POST" ACTION="location_edit.asp">
    <INPUT TYPE="HIDDEN" NAME="dept_id" VALUE="<% if Request("dept_id").count > 0 then %><% = mscsPage.HTMLEncode(Request("dept_id")) %><% else %><% = mscsPage.HTMLEncode(rsLocation("dept_id").value) %><% end if %>">
    <INPUT TYPE="HIDDEN" NAME="Location" VALUE="1">
<TABLE >
	
    <TR>
        <% REM label:  %> 
        <TH ALIGN="LEFT" VALIGN="TOP"> LKU:    </TH>
  
        <% REM value:  %>
        <TD VALIGN="TOP">
            <INPUT
                TYPE="hidden"
                NAME="lku"
                VALUE = "<% if Request("lku").count > 0 then %><% = mscsPage.HTMLEncode(Request("lku")) %><% else %><% = mscsPage.HTMLEncode(rsLocation("lku").value) %><% end if %>">
            <STRONG><% if Request("lku").count > 0 then %><% = mscsPage.HTMLEncode(Request("lku")) %><% else %><% = rsLocation("lku").value %><% end if %></STRONG>
        </TD>
    </TR>


    <TR>
        <% REM label:  %> 
        <TH ALIGN="LEFT" VALIGN="TOP"> Code :  </TH>
  
        <% REM value:  %>
<%
cmdTemp.CommandText = Replace("SELECT * FROM tranika_location WHERE lku = ?", "?", "'" & Replace(Request("lku"),"'","''") & "'")
Set rsAllzone = Server.CreateObject("ADODB.Recordset")
rsAllzone.Open cmdTemp, , adOpenStatic, adLockReadOnly
%>
        <TD VALIGN="TOP">
					<INPUT TYPE="text"	NAME="zone_code"  VALUE="<% = mscsPage.HTMLEncode(rsAllZone("zone_code").value) %>">
		</TD>

    </TR>

	    <TR>
        <% REM label:  %> 
        <TH ALIGN="LEFT" VALIGN="TOP"> Zone Start :  </TH>
  
        <% REM value:  %>

        <TD VALIGN="TOP">
					<INPUT TYPE="text"	NAME="zone_start"  VALUE="<% = mscsPage.HTMLEncode(rsAllZone("zone_start").value) %>">
		</TD>
    </TR>

    <TR>
        <% REM label:  %> 
        <TH ALIGN="LEFT" VALIGN="TOP"> Zone End :  </TH>
  
        <% REM value:  %>

        <TD VALIGN="TOP">
					<INPUT TYPE="text"	NAME="zone_end"  VALUE="<% = mscsPage.HTMLEncode(rsAllZone("zone_end").value) %>">
		</TD>
    </TR>

    <TR>
        <% REM label:  %> 
        <TH ALIGN="LEFT" VALIGN="TOP"> Zone Value :  </TH>
  
        <% REM value:  %>
		<TD VALIGN="TOP">
					<INPUT TYPE="text"	NAME="zone_value"  VALUE="<% = mscsPage.HTMLEncode(rsAllZone("zone_value").value) %>">
		</TD>
    </TR>

</TABLE>
  
<BR>
<TABLE>
    <TR>
        <TD>
            <INPUT TYPE="submit" VALUE="Update Location">
        </TD>
</FORM>
        <FORM METHOD="POST" ACTION="location_delete.asp">
        <TD>
                <INPUT TYPE="HIDDEN" NAME="dept_id" VALUE="<% if Request("dept_id").count > 0 then %><% = mscsPage.HTMLEncode(Request("dept_id")) %>
				<% else %><% = mscsPage.HTMLEncode(rsLocation("dept_id").value) %><% end if %>">
                <INPUT TYPE="HIDDEN" NAME="lku" VALUE="<% if Request("lku").count > 0 then %><% = mscsPage.HTMLEncode(Request("lku")) %>
				<% else %><% = mscsPage.HTMLEncode(rsLocation("lku").value) %><% end if %>">
				<INPUT TYPE="HIDDEN" NAME="zone_code" VALUE="<% = mscsPage.HTMLEncode(rsAllZone("zone_code").value) %>">
                <INPUT TYPE="HIDDEN" NAME="zone_start" VALUE="<% = mscsPage.HTMLEncode(rsAllZone("zone_start").value) %>">
				<INPUT TYPE="HIDDEN" NAME="zone_end" VALUE="<% = mscsPage.HTMLEncode(rsAllZone("zone_end").value) %>">
				<INPUT TYPE="HIDDEN" NAME="zone_value"  VALUE="<% =mscsPage.HTMLEncode(rsAllZone("zone_value").value) %>">
                <INPUT TYPE="submit" VALUE="Delete Location...">
        </TD>
        </FORM>
    </TR>
</TABLE>
<H6>
    FIELD LABELS IN BOLD INDICATE REQUIRED FIELDS
</H6>

<% REM -- footer:  %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
