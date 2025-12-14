<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>




<!--#INCLUDE FILE="include/Manager.asp" -->
<!--#INCLUDE FILE="xt_location_insert.asp" -->
<%
		dept_id = mscsPage.RequestString("dept_id")
		sqlText = ("SELECT DISTINCT pf.area FROM tranika_product pf , tranika_dept_prod pd WHERE pd.dept_id = : 1 AND pf.pf_id = pd.pf_id ")
		sqlText = Replace(sqlText ," : 1 ", dept_id)
		cmdTemp.CommandText = sqlText
		Set rsZone = Server.CreateObject("ADODB.Recordset")
        On Error Resume Next
        rsZone.Open cmdTemp, , adOpenStatic, adLockOptimistic

		set value = rsZone("area")
		
%>
<% REM   header: %>
<% pageTitle = "New Location" %>
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


<FORM METHOD="POST"    ACTION="location_new.asp">
    <INPUT TYPE="HIDDEN" NAME="dept_id" VALUE="00<% = mscsPage.HTMLEncode(Request("dept_id")) %>">
    <INPUT TYPE="HIDDEN" NAME="Validate" VALUE="1">

    <TABLE BORDER="0">
	
    <TR>
        <% REM label:  %> 
        <TH ALIGN="LEFT" VALIGN="TOP"> LKU: </TH>
        <% REM value:  %> 
        <TH ALIGN="LEFT" VALIGN="TOP"> 
            <INPUT NAME="lku" TYPE="text" SIZE=32 VALUE="00<% = mscsPage.HTMLEncode(Request("dept_id")) %>-<%= Request("lku") %>">
        </TH>
    </TR>

	<TR>
        <% REM label:  %> 
        <TH ALIGN="LEFT" VALIGN="TOP"> Code :  </TH>

        <TD VALIGN="TOP">
					<INPUT TYPE="text" SIZE=32 NAME="zone_code" VALUE="<%= Request("zone_code") %>">
		</TD>
    </TR>

    <TR>
        <% REM label:  %> 
        <TH ALIGN="LEFT" VALIGN="TOP"> Zone Start :  </TH>

        <TD VALIGN="TOP">
					<INPUT TYPE="text" SIZE=32 NAME="zone_start" VALUE="<%= Request("zone_start") %>">
		</TD>
    </TR>

	<TR>
        <% REM label:  %> 
        <TH ALIGN="LEFT" VALIGN="TOP"> Zone End :  </TH>

        <TD VALIGN="TOP">
					<INPUT TYPE="text" SIZE=32 NAME="zone_end" VALUE="<%= Request("zone_end") %>">
		</TD>
    </TR>

    <TR>
        <% REM label:  %> 
        <TH ALIGN="LEFT" VALIGN="TOP"> Zone Value :  </TH>
		<TD VALIGN="TOP">
		 <SELECT NAME="zone_value">
		<%	do while Not rsZone.EOF %>
		          			<OPTION VALUE="<% = value %>">&nbsp &nbsp<%= value %>&nbsp &nbsp
				    <% rsZone.MoveNext		
					loop
					 rsZone.Close        	%>
        
		</TD>
    </TR>

    </TABLE>
  
    <BR>
    <INPUT TYPE="submit" VALUE="Add New">
  
</FORM>
<H6>
    FIELD LABELS IN BOLD INDICATE REQUIRED FIELDS
</H6>


<% REM -- footer:  %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
