<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>









<!--#INCLUDE FILE="include/Manager.asp" -->
<!--#INCLUDE FILE="xt_product_update.asp" -->



<SCRIPT>
<!--
dirty = false
//-->
</SCRIPT>

<% REM   header: %>
<%
cmdTemp.CommandText = Replace("SELECT * FROM tranika_product WHERE pf_id = ?", "?", "'" & Replace(Request("pf_id"),"'","''") & "'")
Set rsProduct = Server.CreateObject("ADODB.Recordset")
rsProduct.Open cmdTemp, , adOpenStatic, adLockReadOnly

pageTitle = " Edit Product '" & rsProduct("name").value & "'"
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
<!--#INCLUDE FILE="include/error.asp" -->

<% if Not rsProduct.EOF then %>

<FONT FACE="Arial, sans-serif" COLOR="#FF0000">
<BR>NOTE: Remember you must add at least one <A HREF="#variants">variant</A> before this product can be purchased in the store.
</FONT>
<FONT FACE="Arial, sans-serif">
<P>Edit Product information here, then scroll down to end of page to edit or add <A HREF="#variants">Product Variants</A>.
</FONT>

<FORM METHOD="POST"    ACTION="product_edit.asp">
    <INPUT TYPE="HIDDEN" NAME="Validate" VALUE="1">

<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
        <TD VALIGN="TOP">

            <TABLE CELLPADDING="5">
                <TR>
                    <% REM  label: %>
                    <TH ALIGN="LEFT" VALIGN="TOP">
                        ID :
                    </TH>
              
                    <% REM  value: %>
                    <TD VALIGN="TOP">
                        <INPUT  TYPE="hidden"
                                NAME="pf_id"
                                VALUE="<% = mscsPage.HTMLEncode(rsProduct("pf_id").value) %>">
                        <STRONG><% = rsProduct("pf_id").value %></STRONG>
                    </TD>
                </TR>

                <TR>
                    <% REM  label: %>
                    <TH ALIGN="LEFT" VALIGN="TOP">
                        Name :
                    </TH ALIGN="LEFT">
              
                    <% REM  value: %>
                    <TD VALIGN="TOP">
                         <INPUT	TYPE="text" SIZE=32 NAME="name" VALUE = "<%= mscsPage.HTMLEncode(rsProduct("name").value) %>" onChange="dirty = true">
                    </TD>
                </TR>

				<TR>
                    <% REM  label: %>
                    <TH ALIGN="LEFT" VALIGN="TOP">
                        Home Type :
                    </TH ALIGN="LEFT">
              
                    <% REM  value: %>
                    <TD VALIGN="TOP">
                         <INPUT	TYPE="text" SIZE=32 NAME="model" VALUE = "<%= mscsPage.HTMLEncode(rsProduct("model").value) %>" onChange="dirty = true">
                    </TD>
                </TR>

				 <TR>
                    <% REM  label: %>
                    <TH ALIGN="LEFT" VALIGN="TOP">
                        Land of home :
                    </TH ALIGN="LEFT">
              
                    <% REM  value: %>
                    <TD VALIGN="TOP">
                         <INPUT	TYPE="text" SIZE=32 NAME="area" VALUE = "<%= mscsPage.HTMLEncode(rsProduct("area").value) %>" onChange="dirty = true">
                    </TD>
                </TR>

				<TR>
                    <% REM  label: %>
                    <TH ALIGN="LEFT" VALIGN="TOP">
                        uses area :
                    </TH ALIGN="LEFT">
              
                    <% REM  value: %>
                    <TD VALIGN="TOP">
                         <INPUT	TYPE="text" SIZE=32 NAME="body" VALUE = "<%= mscsPage.HTMLEncode(rsProduct("body").value) %>" onChange="dirty = true">
                    </TD>
                </TR>

				 <TR>
                    <% REM  label: %>
                    <TH ALIGN="LEFT" VALIGN="TOP">
                        Bedroom :
                    </TH ALIGN="LEFT">
              
                    <% REM  value: %>
                    <TD VALIGN="TOP">
                         <INPUT	TYPE="text" SIZE=32 NAME="bedroom" VALUE = "<%= mscsPage.HTMLEncode(rsProduct("bedroom").value) %>" onChange="dirty = true">
                    </TD>
                </TR>

				 <TR>
                    <% REM  label: %>
                    <TH ALIGN="LEFT" VALIGN="TOP">
                        Bathroom :
                    </TH ALIGN="LEFT">
              
                    <% REM  value: %>
                    <TD VALIGN="TOP">
                         <INPUT	TYPE="text" SIZE=32 NAME="bathroom" VALUE = "<%= mscsPage.HTMLEncode(rsProduct("bathroom").value) %>" onChange="dirty = true">
                    </TD>
                </TR>

                <TR>
                    <% REM  label: %>
                    <TH ALIGN="LEFT" VALIGN="TOP">
                        Description :
                    </TH ALIGN="LEFT">
              
                    <% REM  value: %>
                    <TD VALIGN="TOP">
                         <INPUT	TYPE="text" SIZE=32 NAME="description" VALUE = "<%= mscsPage.HTMLEncode(rsProduct("description").value) %>" onChange="dirty = true">
                    </TD>
                </TR>

                <TR>
                    <% REM  label: %>
                    <TH ALIGN="LEFT" VALIGN="TOP">
                        Price :
                    </TH ALIGN="LEFT">
              
                    <% REM  value: %>
                    <TD VALIGN="TOP">
                         <INPUT	TYPE="text" SIZE=32 NAME="list_price" VALUE = "<% = MSCSDataFunctions.Money(rsProduct("list_price").value) %>" onChange="dirty = true">
                    </TD>
                </TR>

                <TR>
                    <% REM  label: %>
                    <TD VALIGN="TOP">
                        Home image :
                    </TD>
              
                    <% REM  value: %>
                    <TD VALIGN="TOP">
                         <INPUT TYPE="text" SIZE=32 NAME="image_file" VALUE="<% if Request("image_file").count > 0 then %><%= mscsPage.HTMLEncode(Request("image_file")) %><% else %><%= mscsPage.HTMLEncode(rsProduct("image_file").value) %><% end if %>" onChange="dirty = true"><BR>
                    </TD>
                </TR>
		 <TR>
                    <% REM  label: %>
                    <TD VALIGN="TOP">
                        1' Plans image :
                    </TD>
              
                    <% REM  value: %>
                    <TD VALIGN="TOP">
                         <INPUT	TYPE="text" SIZE=32 NAME="image_first" VALUE = "<%= mscsPage.HTMLEncode(rsProduct("image_first").value) %>" onChange="dirty = true">
                    </TD>
                </TR>

                <TR>
                    <% REM  label: %>
                    <TD VALIGN="TOP">
                        2' Plans image :
                    </TD>
              
                    <% REM  value: %>
                    <TD VALIGN="TOP">
                         <INPUT	TYPE="text" SIZE=32 NAME="image_second" VALUE = "<%= mscsPage.HTMLEncode(rsProduct("image_second").value) %>" onChange="dirty = true">
                    </TD>
                </TR>

            </TABLE>
        </TD>
        <TD VALIGN="TOP">
            <TABLE BORDER="0" CELLPADDING=0 CELLSPACING=0>
                <TR>
                    <TD VALIGN="TOP" ALIGN="CENTER">
                        <% if Request("image_file").count > 0 then %>
                            <IMG SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<%= mscsPage.HTMLEncode(Request("image_file")) %>"
                                 WIDTH="300"
                                 HEIGHT="250">
                        <% elseif not IsNull(rsProduct("image_file").value) and _
							MSCSDataFunctions.CleanString(rsProduct("image_file").value) <> "" then %>
                            <IMG SRC="<%= "/" & mscsPage.SiteRoot %>/assets/product_images/<%= mscsPage.HTMLEncode(rsProduct("image_file").value) %>"
                                 WIDTH="250"
                                 HEIGHT="200">
                        <% else %>
                            <FONT FACE="Arial, sans-serif">No image entered</FONT>
                        <% end if %>
                        <P>
                        <%
						cmdTemp.CommandText = "SELECT dept_id, dept_name FROM tranika_dept ORDER BY dept_name"
                        Set rsDept = Server.CreateObject("ADODB.Recordset")
                        rsDept.Open cmdTemp, , adOpenStatic, adLockReadOnly

                        if Not rsDept.EOF then
                        %>
						</TD>
				</TR>
				<TR>
						<TD ALIGN="CENTER">
                        <FONT FACE="Arial, sans-serif" SIZE="-1">Click - Select Plan</FONT><BR><BR>
                        <SELECT NAME="dept_id" SIZE="10" onChange="dirty = true" MULTIPLE>
                        <%
                        cmdTemp.CommandText = Replace("SELECT dept_id FROM tranika_dept_prod WHERE pf_id = ?", "?", "'" & Replace(rsProduct("pf_id").value,"'","''") & "'")
                        Set rsPDept = Server.CreateObject("ADODB.Recordset")
                        rsPDept.Open cmdTemp, , adOpenStatic, adLockReadOnly

                        Do While Not rsDept.EOF
                            selected = ""
                            if Not rsPDept.BOF then rsPDept.MoveFirst
                            Do While Not rsPDept.EOF
                                if CInt(rsPDept("dept_id").value) = CInt(rsDept("dept_id").value) then selected = " SELECTED"
                                rsPDept.MoveNext
                            Loop %>
                            <OPTION VALUE="<%= rsDept("dept_id").value %>"<%= selected %>> <% = rsDept("dept_name").value %>&nbsp;
<%                          rsDept.MoveNext
                        Loop
                        %>
                        </SELECT>
                        <BR>
                        <FONT FACE="Arial, sans-serif" STYLE="{font-family: Arial, sans-serif; font-size: 10pt}">NOTE: You must add the product to at least one department in order to make it visible for purchasing.</FONT><BR><BR>
                        <% else %>
                        <FONT FACE="Arial, sans-serif" COLOR="#FF0000" STYLE="{font-family: Arial, sans-serif; font-color: red; font-weight: bold; font-size: 10pt}">*** IMPORTANT *** You must add Departments and select at least one department for each product to display them in the store.</FONT>
                        <% end if %>
                    </TD>
                </TR>
            </TABLE>
        </TD>
    </TR>
</TABLE>
                    
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR>
		<TH ALIGN=LEFT VALIGN=TOP>
				&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
		</TH ALIGN=LEFT>
	    <TD WIDTH="8">&nbsp;</TD>
		<TD><INPUT TYPE="SUBMIT" VALUE=" Update Home"></TD>
</FORM>
		<TH ALIGN=LEFT VALIGN=TOP>
				&nbsp &nbsp &nbsp 
		</TH ALIGN=LEFT>
    <TD WIDTH="8">&nbsp;</TD>
    <FORM METHOD="POST" ACTION="product_delete.asp">
        <INPUT TYPE="HIDDEN" NAME="name" VALUE="<% = mscsPage.HTMLEncode(rsProduct("name").value) %>">
        <INPUT TYPE="HIDDEN" NAME="pf_id" VALUE="<% = mscsPage.HTMLEncode(rsProduct("pf_id").value) %>">
    <TD>
        <INPUT TYPE="SUBMIT" VALUE=" Delete Home <% = mscsPage.HTMLEncode(rsProduct("name").value) %>">
    </TD>
    </FORM>
</TR>
</TABLE>


<BR>
<A NAME="variants">
<TABLE CELLPADDING="2" WIDTH="100%" BORDER="0">
    <TR>
        <TD BGCOLOR="#000000">
            <FONT FACE="Arial, sans-serif" COLOR="white" SIZE="+2" STYLE="{font-family: Arial, sans-serif; color: white; font-weight: bold; font-size: 16pt}">Variants for product <% = rsProduct("pf_id").value %>:</FONT>
        </TD>
    </TR>
</TABLE>

<A HREF="variant_new.asp?<% = mscsPage.URLArgs("pf_id", rsProduct("pf_id").value) %>" onClick="if (dirty) return confirm('Do you want to add a new variant and lose your changes?\nOK = lose changes\nCancel = stay on this page')"> <H3> Add New Variant</H3> </A></TD>

<% REM   list vars: %>
<%  function ShowRow() %>
        <TD VALIGN="TOP" ALIGN="CENTER"> <% = RowCount %> </TD>
        <TD VALIGN="TOP" ALIGN="LEFT"  > <A HREF="<% = listElemTemplate & "?" & mscsPage.URLArgs("sku", rsList("sku").value) %>" onClick="if (dirty) return confirm('Do you want to edit this variant and lose your changes?\nOK = lose changes\nCancel = stay on this page')"> <% = rsList("sku").value %> </A></TD>
        <TD VALIGN="TOP" ALIGN="CENTER"  > <%= rsList("door_value").value %> </TD>
		<TD VALIGN="TOP" ALIGN="CENTER"  > <%= rsList("door2_value").value %> </TD>
        <TD VALIGN="TOP" ALIGN="CENTER"  > <%= rsList("toilet_value").value %> </TD>
        <TD VALIGN="TOP" ALIGN="CENTER"  > <%= rsList("floor_value").value %> </TD>
        
<%  end function

listElemTemplate = "variant_edit.asp"
listColumns = "<TH ALIGN=""CENTER""> # </TH>" & vbCr & _
              "<TH ALIGN=""CENTER""> ID </TH>" & vbCr
listColumns = listColumns & "<TH ALIGN=""LEFT""> Home door </TH>" & vbCr
listColumns = listColumns & "<TH ALIGN=""LEFT""> Room door </TH>" & vbCr
listColumns = listColumns & "<TH ALIGN=""LEFT""> Toilet </TH>" & vbCr
listColumns = listColumns & "<TH ALIGN=""LEFT"">&nbsp Tile </TH>" & vbCr

listNoRows = "<FONT FACE=""Arial, sans-serif"" COLOR=""#FF0000""> WARNING: you must add at least one variant before this product can be purchased in the store. </FONT>"
cmdTemp.CommandText = Replace("SELECT * FROM tranika_variant, tranika_attr_door, tranika_attr_door2, tranika_attr_toilet, tranika_attr_floor WHERE pf_id = ? and tranika_variant.attr_door = tranika_attr_door.door_id and tranika_variant.attr_door2 = tranika_attr_door2.door2_id and tranika_variant.attr_toilet = tranika_attr_toilet.toilet_id and tranika_variant.attr_floor = tranika_attr_floor.floor_id ORDER BY sku", "?", "'" & Replace(Request("pf_id"),"'","''") & "'")
%>
<!--#INCLUDE FILE="include/list.asp" -->

<% else %>
<P>
<%
'<FONT FACE="Arial, sans-serif" COLOR="#FF0000" STYLE="{font-family: Arial, sans-serif; font-color: red; font-weight: bold; font-size: 10pt}">%>
<B>Update complete  <A HREF="product_list.asp">Click ! come back to home.</A></B>
</FONT>
<P>
<% end if %>
<BR>

<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
