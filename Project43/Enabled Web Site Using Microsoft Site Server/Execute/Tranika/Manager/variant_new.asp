<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>




<!--#INCLUDE FILE="include/Manager.asp" -->
<!--#INCLUDE FILE="xt_variant_insert.asp" -->



<% REM   header: %>
<% pageTitle = "New Variant" %>
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
cmdTemp.CommandText = Replace("SELECT * FROM ?", "?", "tranika_attr_door")
Set rsAlldoorValues = Server.CreateObject("ADODB.Recordset")
On Error Resume Next
rsAlldoorValues.Open cmdTemp, , adOpenStatic, adLockReadOnly

if Err.Number <> 0 then
    Set errorList = Server.CreateObject("Commerce.SimpleList")
    errorList.Add "The table could not be found or the database connection failed."
    %>
    <!--#INCLUDE FILE="include/error.asp" -->
    <!--#INCLUDE FILE="include/mgmt_footer.asp" -->
    <%
    Response.end
end if

cmdTemp.CommandText = Replace("SELECT * FROM ?", "?", "tranika_attr_door2")
Set rsAlldoor2Values = Server.CreateObject("ADODB.Recordset")
On Error Resume Next
rsAlldoor2Values.Open cmdTemp, , adOpenStatic, adLockReadOnly

if Err.Number <> 0 then
    Set errorList = Server.CreateObject("Commerce.SimpleList")
    errorList.Add "The table could not be found or the database connection failed."
    %>
    <!--#INCLUDE FILE="include/error.asp" -->
    <!--#INCLUDE FILE="include/mgmt_footer.asp" -->
    <%
    Response.end
end if

cmdTemp.CommandText = Replace("SELECT * FROM ?", "?", "tranika_attr_toilet")
Set rsAlltoiletValues = Server.CreateObject("ADODB.Recordset")
On Error Resume Next
rsAlltoiletValues.Open cmdTemp, , adOpenStatic, adLockReadOnly

if Err.Number <> 0 then
    Set errorList = Server.CreateObject("Commerce.SimpleList")
    errorList.Add "The table could not be found or the database connection failed."
    %>
    <!--#INCLUDE FILE="include/error.asp" -->
    <!--#INCLUDE FILE="include/mgmt_footer.asp" -->
    <%
    Response.end
end if

cmdTemp.CommandText = Replace("SELECT * FROM ?", "?", "tranika_attr_floor")
Set rsAllfloorValues = Server.CreateObject("ADODB.Recordset")
On Error Resume Next
rsAllfloorValues.Open cmdTemp, , adOpenStatic, adLockReadOnly

if Err.Number <> 0 then
    Set errorList = Server.CreateObject("Commerce.SimpleList")
    errorList.Add "The table could not be found or the database connection failed."
    %>
    <!--#INCLUDE FILE="include/error.asp" -->
    <!--#INCLUDE FILE="include/mgmt_footer.asp" -->
    <%
    Response.end
end if

if Not rsAlldoorValues.EOF and Not rsAlltoiletValues.EOF and Not rsAllfloorValues.EOF then %>
<FORM METHOD="POST"
    ACTION="variant_new.asp">
    <INPUT TYPE="HIDDEN" NAME="pf_id" VALUE="<% = mscsPage.HTMLEncode(Request("pf_id")) %>">
    <INPUT TYPE="HIDDEN" NAME="Validate" VALUE="1">

    <TABLE BORDER="0">
	
    <TR>
        <% REM label:  %> 
        <TH ALIGN="RIGHT" VALIGN="TOP"> SKU: </TH>
        <% REM value:  %> 
        <TH ALIGN="LEFT" VALIGN="TOP"> 
            <INPUT NAME="sku" TYPE="text" SIZE=32 VALUE="<% = mscsPage.HTMLEncode(Request("pf_id")) %>-<%= Request("sku") %>">
        </TH>
    </TR>

    <TR>
        <% REM label:  %> 
        <TH ALIGN="RIGHT" VALIGN="TOP"> Home Door :  </TH>

        <TD VALIGN="TOP"><SELECT NAME="door_id">

        <% do while not rsAlldoorValues.EOF %>
            <%= mscsPage.Option(rsAlldoorValues("door_id").value, Request("door_id")) %> <%= rsAlldoorValues("door_value").value %>
        <%  rsAlldoorValues.MoveNext %>
        <% loop %>
        </SELECT></TD>
    </TR>

	<TR>
        <% REM label:  %> 
        <TH ALIGN="RIGHT" VALIGN="TOP"> Room Door :  </TH>

        <TD VALIGN="TOP"><SELECT NAME="door2_id">

        <% do while not rsAlldoor2Values.EOF %>
            <%= mscsPage.Option(rsAlldoor2Values("door2_id").value, Request("door2_id")) %> <%= rsAlldoor2Values("door2_value").value %>
        <%  rsAlldoor2Values.MoveNext %>
        <% loop %>
        </SELECT></TD>
    </TR>

    <TR>
        <% REM label:  %> 
        <TH ALIGN="RIGHT" VALIGN="TOP"> Toilet:  </TH>

        <TD VALIGN="TOP"><SELECT NAME="toilet_id">

        <% do while not rsAlltoiletValues.EOF %>
            <%= mscsPage.Option(rsAlltoiletValues("toilet_id").value, Request("toilet_id")) %> <%= rsAlltoiletValues("toilet_value").value %>
        <%  rsAlltoiletValues.MoveNext %>
        <% loop %>
        </SELECT></TD>
    </TR>

    <TR>
        <% REM label:  %> 
        <TH ALIGN="RIGHT" VALIGN="TOP"> Tile :  </TH>

        <TD VALIGN="TOP"><SELECT NAME="floor_id">

        <% do while not rsAllfloorValues.EOF %>
            <%= mscsPage.Option(rsAllfloorValues("floor_id").value, Request("floor_id")) %> <%= rsAllfloorValues("floor_value").value %>
        <%  rsAllfloorValues.MoveNext %>
        <% loop %>
        </SELECT></TD>
    </TR>

    </TABLE>
  
    <BR>
    <INPUT TYPE="submit" VALUE="Add Variant">
  
</FORM>
<H6>
    FIELD LABELS IN BOLD INDICATE REQUIRED FIELDS
</H6>
<% else %>
<BR><FONT FACE="Arial, sans-serif" COLOR="#FF0000" STYLE="{font-family: Arial, sans-serif; font-color: red; font-weight: bold; font-size: 10pt}">*** IMPORTANT *** You must add at least one Attribute value for each attribute before you can enter any Products Variants.</FONT>

<A HREF="attr_new.asp?<% = mscsPage.URLArgs("attr", "Door", "attr_table", "tranika_attr_door") %>"> <H2> Add New <%= UCase(Left("Door",1)) & LCase(Mid("Door",2)) %> Value </H2> </A></TD>

<A HREF="attr_new.asp?<% = mscsPage.URLArgs("attr", "Door2", "attr_table", "tranika_attr_door2") %>"> <H2> Add New <%= UCase(Left("Door2",1)) & LCase(Mid("Door2",2)) %> Value </H2> </A></TD>

<A HREF="attr_new.asp?<% = mscsPage.URLArgs("attr", "Toilet", "attr_table", "tranika_attr_toilet") %>"> <H2> Add New <%= UCase(Left("Toilet",1)) & LCase(Mid("Toilet",2)) %> Value </H2> </A></TD>

<A HREF="attr_new.asp?<% = mscsPage.URLArgs("attr", "Floor", "attr_table", "tranika_attr_floor") %>"> <H2> Add New <%= UCase(Left("Floor",1)) & LCase(Mid("Floor",2)) %> Value </H2> </A></TD>

<% end if %>

<% REM -- footer:  %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
