<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>







<!--#INCLUDE FILE="include/Manager.asp" -->
<!--#INCLUDE FILE="xt_variant_update.asp" -->



<% REM   header: %>
<% pageTitle = "Edit Variant '" &  Request("sku") & "'" %>
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
cmdTemp.CommandText = Replace("SELECT * FROM tranika_variant WHERE sku = ?", "?", "'" & Replace(Request("sku"),"'","''") & "'")
Set rsVariant = Server.CreateObject("ADODB.Recordset")
rsVariant.Open cmdTemp, , adOpenStatic, adLockReadOnly
%>

<FORM METHOD="POST" ACTION="variant_edit.asp">
    <INPUT TYPE="HIDDEN" NAME="pf_id" VALUE="<% if Request("pf_id").count > 0 then %><% = mscsPage.HTMLEncode(Request("pf_id")) %><% else %><% = mscsPage.HTMLEncode(rsVariant("pf_id").value) %><% end if %>">
    <INPUT TYPE="HIDDEN" NAME="Validate" VALUE="1">

<TABLE >
    <TR>
        <% REM label:  %> 
        <TH ALIGN="RIGHT" VALIGN="TOP"> SKU:    </TH>
  
        <% REM value:  %>
        <TD VALIGN="TOP">
            <INPUT
                TYPE="hidden"
                NAME="sku"
                VALUE = "<% if Request("sku").count > 0 then %><% = mscsPage.HTMLEncode(Request("sku")) %><% else %><% = mscsPage.HTMLEncode(rsVariant("sku").value) %><% end if %>">
            <STRONG><% if Request("sku").count > 0 then %><% = mscsPage.HTMLEncode(Request("sku")) %><% else %><% = rsVariant("sku").value %><% end if %></STRONG>
        </TD>
    </TR>


    <TR>
        <% REM label:  %> 
        <TH ALIGN="RIGHT" VALIGN="TOP"> Home Door:  </TH>
  
        <% REM value:  %>
<%
cmdTemp.CommandText = Replace("SELECT * FROM ?", "?", "tranika_attr_door")
Set rsAllValues = Server.CreateObject("ADODB.Recordset")
rsAllValues.Open cmdTemp, , adOpenStatic, adLockReadOnly
%>
        <TD VALIGN="TOP"><SELECT NAME="attr_door">
        <% do while not rsAllValues.EOF %>
            <% if Request("door_id").count > 0 then %><%= mscsPage.Option(Request("door_id"), Request("attr_door")) %><% else %><%= mscsPage.Option(CInt(rsAllValues("door_id").value), CInt(rsVariant("attr_door").value)) %><% end if %> <% if Request("door_value").count > 0 then %><%= Request("door_value") %><% else %><%= rsAllValues("door_value").value %><% end if %>
            <%
            if Request("door_id").count = 0 then
                if CInt(rsAllValues("door_id").value) = CInt(rsVariant("attr_door").value) then
                    if idString <> "" then idString = idString &  ", "
                    idString = idString & rsAllValues("door_value").value
                end if
            end if
            rsAllValues.MoveNext
        loop
        %>
        </SELECT></TD>

        </TD>
    </TR>

    <TR>
        <% REM label:  %> 
        <TH ALIGN="RIGHT" VALIGN="TOP"> Room Door:  </TH>
  
        <% REM value:  %>
<%
cmdTemp.CommandText = Replace("SELECT * FROM ?", "?", "tranika_attr_door2")
Set rsAllValues = Server.CreateObject("ADODB.Recordset")
rsAllValues.Open cmdTemp, , adOpenStatic, adLockReadOnly
%>
        <TD VALIGN="TOP"><SELECT NAME="attr_door2">
        <% do while not rsAllValues.EOF %>
            <% if Request("door2_id").count > 0 then %><%= mscsPage.Option(Request("door2_id"), Request("attr_door2")) %><% else %><%= mscsPage.Option(CInt(rsAllValues("door2_id").value), CInt(rsVariant("attr_door2").value)) %><% end if %> <% if Request("door2_value").count > 0 then %><%= Request("door2_value") %><% else %><%= rsAllValues("door2_value").value %><% end if %>
            <%
            if Request("door2_id").count = 0 then
                if CInt(rsAllValues("door2_id").value) = CInt(rsVariant("attr_door2").value) then
                    if idString <> "" then idString = idString &  ", "
                    idString = idString & rsAllValues("door2_value").value
                end if
            end if
            rsAllValues.MoveNext
        loop
        %>
        </SELECT></TD>

        </TD>
    </TR>

    <TR>
        <% REM label:  %> 
        <TH ALIGN="RIGHT" VALIGN="TOP"> Toilet:  </TH>
  
        <% REM value:  %>
<%
cmdTemp.CommandText = Replace("SELECT * FROM ?", "?", "tranika_attr_toilet")
Set rsAllValues = Server.CreateObject("ADODB.Recordset")
rsAllValues.Open cmdTemp, , adOpenStatic, adLockReadOnly
%>
        <TD VALIGN="TOP"><SELECT NAME="attr_toilet">
        <% do while not rsAllValues.EOF %>
            <% if Request("toilet_id").count > 0 then %><%= mscsPage.Option(Request("toilet_id"), Request("attr_toilet")) %><% else %><%= mscsPage.Option(CInt(rsAllValues("toilet_id").value), CInt(rsVariant("attr_toilet").value)) %><% end if %> <% if Request("toilet_value").count > 0 then %><%= Request("toilet_value") %><% else %><%= rsAllValues("toilet_value").value %><% end if %>
            <%
            if Request("toilet_id").count = 0 then
                if CInt(rsAllValues("toilet_id").value) = CInt(rsVariant("attr_toilet").value) then
                    if idString <> "" then idString = idString &  ", "
                    idString = idString & rsAllValues("toilet_value").value
                end if
            end if
            rsAllValues.MoveNext
        loop
        %>
        </SELECT></TD>

        </TD>
    </TR>

    <TR>
        <% REM label:  %> 
        <TH ALIGN="RIGHT" VALIGN="TOP"> Tile:  </TH>
  
        <% REM value:  %>
<%
cmdTemp.CommandText = Replace("SELECT * FROM ?", "?", "tranika_attr_floor")
Set rsAllValues = Server.CreateObject("ADODB.Recordset")
rsAllValues.Open cmdTemp, , adOpenStatic, adLockReadOnly
%>
        <TD VALIGN="TOP"><SELECT NAME="attr_floor">
        <% do while not rsAllValues.EOF %>
            <% if Request("floor_id").count > 0 then %><%= mscsPage.Option(Request("floor_id"), Request("attr_floor")) %><% else %><%= mscsPage.Option(CInt(rsAllValues("floor_id").value), CInt(rsVariant("attr_floor").value)) %><% end if %> <% if Request("floor_value").count > 0 then %><%= Request("floor_value") %><% else %><%= rsAllValues("floor_value").value %><% end if %>
            <%
            if Request("floor_id").count = 0 then
                if CInt(rsAllValues("floor_id").value) = CInt(rsVariant("attr_floor").value) then
                    if idString <> "" then idString = idString &  ", "
                    idString = idString & rsAllValues("floor_value").value
                end if
            end if
            rsAllValues.MoveNext
        loop
        %>
        </SELECT></TD>

        </TD>
    </TR>

</TABLE>
  
<BR>
<TABLE>
    <TR>
        <TD>
            <INPUT TYPE="submit" VALUE="Update Variant">
        </TD>
</FORM>
        <FORM METHOD="POST" ACTION="variant_delete.asp">
        <TD>
                <INPUT TYPE="HIDDEN" NAME="pf_id" VALUE="<% if Request("pf_id").count > 0 then %><% = mscsPage.HTMLEncode(Request("pf_id")) %><% else %><% = mscsPage.HTMLEncode(rsVariant("pf_id").value) %><% end if %>">
                <INPUT TYPE="HIDDEN" NAME="sku" VALUE="<% if Request("sku").count > 0 then %><% = mscsPage.HTMLEncode(Request("sku")) %><% else %><% = mscsPage.HTMLEncode(rsVariant("sku").value) %>"><% end if %>">
                <INPUT TYPE="HIDDEN" NAME="attrs" VALUE="<% = idString %>">
                <INPUT TYPE="submit" VALUE="Delete Variant...">
        </TD>
        </FORM>
    </TR>
</TABLE>
<H6>
    FIELD LABELS IN BOLD INDICATE REQUIRED FIELDS
</H6>

<% REM -- footer:  %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
