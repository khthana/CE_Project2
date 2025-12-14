<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>








<!--#INCLUDE FILE="include/Manager.asp" -->
<!--#INCLUDE FILE="xt_attr_update.asp" -->


<% id = request("id") %>
<% name = request("attr") %>
<% table = request("attr_table") %>
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
<% REM   body: %>
<%
sqlText = "SELECT * FROM :1 WHERE :2 = :3"
sqlText = Replace(sqlText, ":1", table)
sqlText = Replace(sqlText, ":2", name & "_id")
sqlText = Replace(sqlText, ":3", id)
cmdTemp.CommandText = sqlText
Set rsAttr = Server.CreateObject("ADODB.Recordset")
rsAttr.Open cmdTemp, , adOpenStatic, adLockReadOnly
%>

<% REM   header: %>
<% pageTitle = "Edit " & UCase(Left(name,1)) & LCase(Mid(name,2)) & " Value '" & rsAttr(name + "_value").value & "'" %>
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
<FORM METHOD="get" ACTION="attr_edit.asp">
    <INPUT TYPE="HIDDEN" NAME="attr" VALUE="<%= mscsPage.HTMLEncode(request("attr")) %>">
    <INPUT TYPE="HIDDEN" NAME="attr_table" VALUE="<%= table %>">
    <INPUT TYPE="HIDDEN" NAME="Validate" VALUE="1">

<TABLE BORDER="0"  WIDTH="70%" CELLPADDING="5"  >

    <TR>
        <% REM  label: %>
        <TH ALIGN="RIGHT" VALIGN="TOP"  WIDTH="15%">
			<% = aname %> id :
																	<%
																			'= UCase(Left(name,1)) & LCase(Mid(name,2)) 
																	%>
			
        </TH>
		<TD WIDTH="1%">			</TD>
        <% REM  value: %>
        <TD VALIGN="TOP" WIDTH="30%">
            <INPUT
                TYPE = "HIDDEN" 
                NAME = "id"
                VALUE = "<% = mscsPage.HTMLEncode(rsAttr(name + "_id").value) %>">
            <STRONG><% = rsAttr(name + "_id").value %></STRONG>
        </TD>

<%	'	รับชื่อของอุปกรณ์	%>
    <TR>
        <% REM  label: %>
        <TH  ALIGN="RIGHT"  VALIGN="TOP">
            name<%'= aname %>:
        </TH>
		<TD WIDTH="1%">			</TD>
        <% REM  value: %>
        <TD VALIGN="TOP">
            <INPUT
                TYPE = "text" 
                SIZE = "32"
                NAME = "value"
                VALUE = "<% if Request(name + "_value").count > 0 then %><% = mscsPage.HTMLEncode(Request(name + "_value")) %><% else %><% = mscsPage.HTMLEncode(rsAttr(name + "_value").value) %><% end if %>">
        </TD>
    </TR>
<%	'	รับราคาของอุปกรณ์	%>
        <TR>
        <% REM  label: %>
        <TH  ALIGN="RIGHT" VALIGN="TOP">
            Price :
        </TH>
		<TD WIDTH="1%">			</TD>
        <% REM  value: %>
        <TD VALIGN="TOP">
            <INPUT
                TYPE = "text" 
                SIZE = "32"
                NAME = "price"
                VALUE = "<% if Request(name + "_price").count > 0 then %><% = mscsPage.HTMLEncode(Request(name + "_price")) %><% else %><% = MSCSDataFunctions.Money(rsAttr(name + "_price").value) %><% end if %>">
        </TD>
    </TR>
<%	'	รับรายละเอียดของอุปกรณ์	%>
    <TR>
        <% REM  label: %>
        <TH  ALIGN="RIGHT" VALIGN="TOP">
            Description :
        </TH>
		<TD WIDTH="1%">			</TD>
        <% REM  value: %>

        <TD VALIGN="TOP">
            <INPUT
                TYPE = "text" 
                SIZE = "32"
                NAME = "description"
                VALUE = "<% if Request(name + "_description").count > 0 then %><% = mscsPage.HTMLEncode(Request(name + 	"_description")) %><% else %><% = mscsPage.HTMLEncode(rsAttr(name + "_description").value) %><% end if %>">
       </TD>
    </TR>
<%	'	รับชื่อไฟล์ภาพของอุปกรณ์	%>
    <TR>
        <% REM  label: %>
        <TH  ALIGN="RIGHT"  VALIGN="TOP">
            <% = aname%> image :
        </TH>
		<TD WIDTH="1%">			</TD>
        <% REM  value: %>
        <TD VALIGN="TOP">
            <INPUT
                TYPE = "text" 
                SIZE = "32"
                NAME = "file"
                VALUE = "<% if Request(name + "_file").count > 0 then %><% = mscsPage.HTMLEncode(Request(name + "_file")) %><% else %><% = mscsPage.HTMLEncode(rsAttr(name + "_file").value) %><% end if %>">
        </TD>
    </TR>
</TABLE>
<%	'	ส่วนของปุ่มกด	%>
<TABLE BORDER="0"  WIDTH="800" CELLPADDING="0" CELLSPACING="0">
         <% REM  value: %>
            <TR>
            <TD WIDTH=230 ALIGN=RIGHT>
                <INPUT TYPE="SUBMIT" VALUE="Update <%= aname %>">
            </TD>

</FORM>

            <TD WIDTH="15%" >&nbsp;</TD>
            <FORM METHOD="POST" ACTION="attr_delete.asp">
                <INPUT TYPE="HIDDEN" NAME="attr" VALUE="<%= mscsPage.HTMLEncode(name) %>">
                <INPUT TYPE="HIDDEN" NAME="attr_table" VALUE="<%= table %>">
                <INPUT TYPE="HIDDEN" NAME="id" VALUE="<% = rsAttr(name + "_id").value %>">
                <INPUT TYPE="HIDDEN" NAME="value" VALUE="<% = mscsPage.HTMLEncode(rsAttr(name + "_value").value) %>">
            <TD WIDTH="250" ALIGN="LEFT" >
                <INPUT TYPE="SUBMIT" VALUE="Delete <%= aname %> ">
            </TD>
			<TD WIDTH="50">			</TD>
			<TD>
						 <% if Request(name + "_file").count > 0 then %>
                            <IMG SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<%= mscsPage.HTMLEncode(Request(name + "_file")) %>"
                                 WIDTH=128
                                 HEIGHT=128
							>
                        <% elseif not IsNull(rsAttr(name + "_file").value) and _
							MSCSDataFunctions.CleanString(rsAttr(name + "_file").value) <> "" then %>
                            <IMG SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<%= mscsPage.HTMLEncode(rsAttr(name + "_file").value) %>"
                                 WIDTH=128
							    HEIGHT=128
							>
                        <% else %>
                            <FONT FACE="Arial, sans-serif">No image entered</FONT>
                        <% end if %>

			</TD>
            </FORM>
            </TR>
            </TABLE>

		</TD>
</TR>
</TABLE>
<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
