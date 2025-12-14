<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>






<!--#INCLUDE FILE="include/Manager.asp" -->

<% pageTitle = "New Home" %>
<HTML>
<HEAD>
    <TITLE> <% = pageTitle %> </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
    <!--#INCLUDE FILE="include/mgmt_define.asp" -->
   


<BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="<% = Application("bgcolor") %>" TEXT="#000000" LINK="#FF0000" ALINK="#FF0000" VLINK="#FF0000">
<%cmdTemp.CommandText = "SELECT dept_id, dept_name FROM tranika_dept ORDER BY dept_name"
Set rsDept = Server.CreateObject("ADODB.Recordset")
On Error Resume Next
rsDept.Open cmdTemp, , adOpenStatic, adLockReadOnly

if Err.Number <> 0 then
    Set errorList = Server.CreateObject("Commerce.SimpleList")
    errorList.Add "The table could not be found or the database connection failed."

    Response.end
end if
%>

<!--#INCLUDE FILE="include/mgmt_header.asp" -->



<% REM   body: %>

<FORM METHOD="POST"  ACTION="Script_Product_insert.asp">
		    <INPUT TYPE="HIDDEN" NAME="Validate" VALUE="1">

<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="750">
    <TR>
        <TD VALIGN="TOP">

            <TABLE CELLPADDING="5">
                <TR>
                    <% REM  label: %>
                    <TH ALIGN="RIGHT"  VALIGN="TOP">
                        ID :
                    </TH>

                    <% REM  value: %>
                    <TD VALIGN="TOP">
                        <INPUT  TYPE="text"  SIZE="32" NAME="pf_id"  VALUE="<%= Request("pf_id") %>" onChange="dirty = true">
                    </TD>
                </TR>

                <TR>
                    <% REM  label: %>
                    <TH ALIGN="RIGHT"  VALIGN="TOP">
                        Name :
                    </TH ALIGN="LEFT">

                    <% REM  value: %>
					<TD VALIGN="TOP">
                        <INPUT	TYPE="text" SIZE="32" NAME="name" VALUE="<%= Request("name") %>" onChange="dirty = true">
                    </TD>
                </TR>

				 <TR>
                    <% REM  label: %>
                    <TH ALIGN="RIGHT"   VALIGN="TOP">
                        Home Type :
                    </TH ALIGN="LEFT">

                    <% REM  value: %>
                    <TD VALIGN="TOP">
                        <INPUT	TYPE="text" SIZE="32" NAME="model" VALUE="<%= Request("model") %>" onChange="dirty = true">
                    </TD>
                </TR>

                <TR>
                    <% REM  label: %>
                    <TH ALIGN="RIGHT"  VALIGN="TOP">
                        Land of home  :
                    </TH ALIGN="LEFT">

                    <% REM  value: %>
                    <TD VALIGN="TOP">
                        <INPUT	TYPE="text" SIZE="32" NAME="area"  VALUE="<%= Request("area") %>" onChange="dirty = true">
                    </TD>
                </TR>

				<TR>
                    <% REM  label: %>
                    <TH ALIGN="RIGHT"  VALIGN="TOP">
                        uses area :
                    </TH ALIGN="LEFT">

                    <% REM  value: %>
                    <TD VALIGN="TOP">
                        <INPUT	TYPE="text" SIZE="32" NAME="body"  VALUE="<%= Request("body") %>" onChange="dirty = true">
                    </TD>
                </TR>

                <TR>
                    <% REM  label: %>
                    <TH ALIGN="RIGHT"  VALIGN="TOP">
                        Bedroom :
                    </TH ALIGN="LEFT">

                    <% REM  value: %>
                    <TD VALIGN="TOP">
                        <INPUT	TYPE="text" SIZE="32" NAME="bedroom" VALUE="<%= Request("bedroom") %>" onChange="dirty = true">
                    </TD>
                </TR>

                <TR>
                    <% REM  label: %>
                    <TH ALIGN="RIGHT"  VALIGN="TOP">
                       Bathroom :
                    </TH ALIGN="LEFT">

                    <% REM  value: %>
                    <TD VALIGN="TOP">
                        <INPUT	TYPE="text" SIZE="32" NAME="bathroom" VALUE="<%= Request("bathroom") %>" onChange="dirty = true">
                    </TD>
                </TR>

                <TR>
                    <% REM  label: %>
                    <TH ALIGN="RIGHT"   VALIGN="TOP">
                        Description :
                    </TH ALIGN="LEFT">

                    <% REM  value: %>
                    <TD VALIGN="TOP">
                        <INPUT	TYPE="text" SIZE="32" NAME="description" VALUE="<%= Request("description") %>" onChange="dirty = true">
                    </TD>
                </TR>

                <TR>
                    <% REM  label: %>
                    <TH ALIGN="RIGHT"   VALIGN="TOP">
                        Price :
                    </TH ALIGN="LEFT">

                    <% REM  value: %>
                    <TD VALIGN="TOP">
                        <INPUT	TYPE="text" SIZE="32" NAME="list_price" VALUE="<%= Request("list_price") %>" onChange="dirty = true">
                    </TD>
                </TR>

                <TR>
                    <% REM  label: %>
                    <TD ALIGN="RIGHT"  VALIGN="TOP">
                        Home image :
                    </TD>
                    <% REM  value: %>
                    <TD VALIGN="TOP">
                        <INPUT TYPE="text" SIZE=32 NAME="image_file" VALUE="<% if Request("image_file").count > 0 then %><%= mscsPage.HTMLEncode(Request("image_file")) %><% else %><%= mscsPage.HTMLEncode(rsProduct("image_file").value) %><% end if %>" onChange="dirty = true">

                   </TD>
                </TR>
                <TR>
                    <% REM  label: %>
                    <TD ALIGN="RIGHT"  VALIGN="TOP">
                        1' Plans image :
                    </TD>

                    <% REM  value: %>
                    <TD ALIGN="LEFT"  VALIGN="TOP">
                        <INPUT	TYPE="text" SIZE="32" NAME="image_first" VALUE="<%= Request("image_first") %>" onChange="dirty = true">
						
                    </TD>
                </TR>

                <TR>
                    <% REM  label: %>
                    <TD ALIGN="RIGHT"  VALIGN="TOP">
                        2' Plans image :
                    </TD>

                    <% REM  value: %>
	                <TD VALIGN="TOP">
	                         <INPUT	TYPE="text" SIZE="32" NAME="image_second" VALUE="<%= Request("image_second") %>" onChange="dirty = true">
                    </TD>
                </TR>

            </TABLE>
        </TD>
        <TD VALIGN="TOP">
            <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                <TR>
                    <TD VALIGN="TOP">
                        <%                        
                        if Not rsDept.EOF then
                        %>
                        <FONT SIZE="-1">Click - Select Plan</FONT><BR><BR>
					</TD>
				</TR>
				<TR>
					<TD ALIGN="CENTER" VALIGN="MIDDLE">
						<SELECT NAME="dept_id"  SIZE="10" onChange="dirty = true" MULTIPLE >
                        <%
                        selected = " SELECTED"
                        Do While Not rsDept.EOF
                            %>
                            <OPTION VALUE="<%= rsDept("dept_id").value %>"<%= selected %>> <% = rsDept("dept_name").value %>&nbsp;
                            <%
                            if selected = " SELECTED" then selected = ""
                            rsDept.MoveNext
                        Loop
                        %>
                        </SELECT>
                        <BR>
                        
                        <% else %>
                        <FONT FACE="Arial, sans-serif" COLOR="#FF0000" STYLE="{font-family: Arial, sans-serif; font-color: red; font-weight: bold; font-size: 10pt}">*** IMPORTANT *** You should add Departments before entering products otherwise you will have to edit each product and select at least one department for each product in order to display them in the store.</FONT>
                        <% end if %>
                    </TD>
                </TR>
            </TABLE>
        </TD>
    </TR>

<TR>
    <TD  COLSPAN="2"  ALIGN="CENTER" VALIGN="MIDDLE">
		<BR>
		<INPUT TYPE="submit" VALUE=" Add New Home"   >
		<BR><BR>
    </TD>
</TR>
</TABLE>

</FORM>

<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
</BODY>
</HTML>