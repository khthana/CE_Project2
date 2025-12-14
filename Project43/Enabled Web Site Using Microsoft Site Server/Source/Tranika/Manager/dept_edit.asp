<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>







<!--#INCLUDE FILE="include/Manager.asp" -->
<!--#INCLUDE FILE="xt_dept_update.asp" -->



<% REM   header: %>
<% pageTitle = "Edit Department '" & Request("dept_name") & "'" %>
<HTML>
<HEAD>
    <TITLE> <% = pageTitle %> </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
    <!--#INCLUDE FILE="include/mgmt_define.asp" -->
</HEAD>

<BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="<% = Application("bgcolor") %>">
<!--#INCLUDE FILE="include/mgmt_header.asp" -->

<% REM   body: %>
<!--#INCLUDE FILE="include/error.asp" -->
<%
cmdTemp.CommandText = Replace("SELECT dept_id, dept_name, dept_description, dept_map, dept_zone FROM tranika_dept WHERE dept_id = ?", "?", "'" & Replace(Request("dept_id"),"'","''") & "'")
Set rsDept = Server.CreateObject("ADODB.Recordset")
rsDept.Open cmdTemp, , adOpenStatic, adLockReadOnly
%>

<% if Not rsDept.EOF then %>

<FONT FACE="Arial, sans-serif" COLOR="#FF0000">
<BR>NOTE: Remember you must add at least one <A HREF="#Location">Location</A> before this home can be show in the web.
</FONT>
<FONT FACE="Arial, sans-serif">
<P>Edit Home information here, then scroll down to end of page to edit or add <A HREF="#Location">Dept Location</A>.
</FONT>

<FORM METHOD="POST"   ACTION="dept_edit.asp">
    <INPUT TYPE="HIDDEN" NAME="Validate" VALUE="1">

<TABLE CELLPADDING="5" WIDTH="450" BORDER="0" >

    <TR>
        <% REM  label: %>
        <TH ALIGN="RIGHT"  VALIGN="TOP">
				Plan id  :
        </TH>

        <% REM  value: %>
        <TD VALIGN="TOP">
            <INPUT TYPE = "HIDDEN" 
                NAME = "dept_id"
                VALUE = "<% = mscsPage.HTMLEncode(rsDept("dept_id").value) %>">
            <STRONG><% = rsDept("dept_id").value %></STRONG>
        </TD>
    </TR>


    <TR>
        <% REM  label: %>
        <TH ALIGN="RIGHT"   VALIGN="TOP">
            Plan name :        
        </TH>

        <% REM  value: %>
        <TD VALIGN="TOP">
	  <INPUT
                TYPE = "text" 
                SIZE = "32"
                NAME = "dept_name"
                VALUE = "<% if Request("dept_name").count > 0 then %><% = mscsPage.HTMLEncode(Request("dept_name")) %><% else %><% = mscsPage.HTMLEncode(rsDept("dept_name").value) %><% end if %>">
      	 </TD>
    </TR>
    <TR>
        <% REM  label: %>
        <TH  ALIGN="RIGHT"  VALIGN="TOP">
            Description :
        </TH>

        <% REM  value: %>
        <TD VALIGN="TOP">
            <TEXTAREA
                COLS="45"
                ROWS="5"
                NAME="dept_description"
                WRAP = "virtual"><% if Request("dept_description").count > 0 then %><% = Request("dept_description") %><% else %><% = rsDept("dept_description").value %><% end if %></TEXTAREA>
        </TD>
    </TR>

	<TR>
        <% REM  label: %>
        <TH ALIGN="RIGHT"   VALIGN="TOP">
            Plan image :        
        </TH>

        <% REM  value: %>
        <TD VALIGN="TOP">
	  <INPUT
                TYPE = "text" 
                SIZE = "32"
                NAME = "dept_map"
                VALUE = "<% if Request("dept_map").count > 0 then %><% = mscsPage.HTMLEncode(Request("dept_map")) %><% else %><% = mscsPage.HTMLEncode(rsDept("dept_map").value) %><% end if %>">
      	 </TD>
    </TR>

	<TR>
        <% REM  label: %>
        <TH ALIGN="RIGHT"   VALIGN="TOP">
            Zone image :        
        </TH>

        <% REM  value: %>
        <TD VALIGN="TOP">
	  <INPUT
                TYPE = "text" 
                SIZE = "32"
                NAME = "dept_zone"
                VALUE = "<% if Request("dept_zone").count > 0 then %><% = mscsPage.HTMLEncode(Request("dept_zone")) %><% else %><% = mscsPage.HTMLEncode(rsDept("dept_zone").value) %><% end if %>">
      	 </TD>
    </TR>

    <TR>
        <% REM  label: %>
        <TD VALIGN="TOP">
        </TD>

        <% REM  value: %>
        <TD VALIGN="TOP">
            <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
            <TR>
            <TD>
                <INPUT TYPE="SUBMIT" VALUE=" Update Plan ">
            </TD>

</FORM>

            <TD WIDTH="25">&nbsp;</TD>
            <FORM METHOD="POST" ACTION="dept_delete.asp">
                <INPUT TYPE="HIDDEN" NAME="dept_name" VALUE="<% = mscsPage.HTMLEncode(rsDept("dept_name").value) %>">
                <INPUT TYPE="HIDDEN" NAME="dept_id" VALUE="<% = rsDept("dept_id").value %>">
            <TD>
                <INPUT TYPE="SUBMIT" VALUE="  Delete Plan">
            </TD>
            </FORM>
            </TR>
            </TABLE>

        </TD>
    </TR>
</TABLE>

<BR>
<A NAME="Location">
<TABLE CELLPADDING="2" WIDTH="100%" BORDER="0">
    <TR>
        <TD BGCOLOR="#000000">
            <FONT FACE="Arial, sans-serif" COLOR="white" SIZE="+2" STYLE="{font-family: Arial, sans-serif; color: white; font-weight: bold; font-size: 16pt}">Location for Dept : 00<% = rsDept("dept_id").value %></FONT>
        </TD>
    </TR>
</TABLE>
<% 		dept_zone = rsDept("dept_zone")				%>
<A HREF="Location_new.asp?<% = mscsPage.URLArgs("dept_id", rsDept("dept_id").value) %>" onClick="if (dirty) return confirm('Do you want to add a new variant and lose your changes?\nOK = lose changes\nCancel = stay on this page')"> <H3>Add New Location</H3> </A></TD>
<IMG SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<% = dept_zone %>" ALIGN="RIGHT" WIDTH="250" HEIGHT="200"><br>
<% REM   list vars: %>
<%  function ShowRow() %>

        <TD VALIGN="TOP" ALIGN="CENTER"><% = RowCount %> </TD>
        <TD VALIGN="TOP" ALIGN="LEFT"  >&nbsp <A HREF="<% = listElemTemplate & "?" & mscsPage.URLArgs("lku", rsList("lku").value) %>" onClick="if (dirty) return confirm('Do you want to edit this location and lose your changes?\nOK = lose changes\nCancel = stay on this page')"> &nbsp<% = rsList("lku").value %> </A></TD>
        <TD VALIGN="TOP" ALIGN="CENTER"  > &nbsp <%= rsList("zone_code").value %></TD>
		<TD VALIGN="TOP" ALIGN="CENTER"  > <%= rsList("zone_start").value %> - &nbsp<%= rsList("zone_end").value %> </TD>
        <TD VALIGN="TOP" ALIGN="CENTER"  > &nbsp<%= rsList("zone_value").value %> </TD>

<%  end function	

listElemTemplate = "location_edit.asp"
listColumns = "<TH ALIGN=""CENTER""> # </TH>" & vbCr & _ 
              "<TH ALIGN=""LEFT""> &nbsp  &nbsp &nbsp LKU </TH>" & vbCr
listColumns = listColumns & "<TH ALIGN=""CENTER"">&nbsp Code &nbsp</TH>" & vbCr & vbCr
listColumns = listColumns & "<TH ALIGN=""CENTER"">&nbsp Start  End&nbsp</TH>" & vbCr
listColumns = listColumns & "<TH ALIGN=""CENTER"">&nbsp Zone Value &nbsp </TH>" & vbCr


listNoRows = "<FONT FACE=""Arial, sans-serif"" COLOR=""#FF0000""> WARNING: you must add at least one location before this product can be purchased in the store. </FONT>"
cmdTemp.CommandText = Replace("SELECT * FROM tranika_location WHERE dept_id = ?  ORDER BY lku", "?", "'" & Replace(Request("dept_id"),"'","''") & "'")
	



%>

<!--#INCLUDE FILE="include/list.asp" -->

<% else %>
<P>
<%
'<FONT FACE="Arial, sans-serif" COLOR="#FF0000" STYLE="{font-family: Arial, sans-serif; font-color: red; font-weight: bold; font-size: 10pt}">%>
<B>เสร็จสิ้นการเปลี่ยนแปลงข้อมูลกลับไปหน้า<A HREF="dept_list.asp"> โครงการ.</A></B>
</FONT>
<P>

<% end if 
rsDept.Close 
%>

<BR>
<BR>
<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->


