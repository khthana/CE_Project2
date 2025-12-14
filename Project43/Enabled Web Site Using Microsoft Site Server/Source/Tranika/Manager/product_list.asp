<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>







<!--#INCLUDE FILE="include/Manager.asp" -->



<% REM   header: %>
<% pageTitle = "Products" %>
<HTML>
<HEAD>
    <TITLE> <% = pageTitle %> </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
    <!--#INCLUDE FILE="include/mgmt_define.asp" -->
</HEAD>

<BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="<% = Application("bgcolor") %>" TEXT="#000000" LINK="#FF0000" ALINK="#FF0000" VLINK="#FF0000">
<!--#INCLUDE FILE="include/mgmt_header.asp" -->

<% REM   list vars: %>
<%  function ShowRow() %>
        <TD VALIGN="TOP"> <% = RowCount %> </TD>
        <TD VALIGN="TOP"> 
            <A HREF="<% = listElemTemplate & "?" & mscsPage.URLArgs("pf_id", rsList("pf_id").value, "name", rsList("name").value) %>"> <% = rsList("pf_id").value %> </A> 
        </TD>
        <TD VALIGN="TOP" ALIGN="LEFT">
            &nbsp &nbsp<A HREF="<% = listElemTemplate & "?" & mscsPage.URLArgs("pf_id", rsList("pf_id").value, "name", rsList("name").value) %>"><%= rsList("name").value %> </A>
        </TD>
        <TD VALIGN="TOP" ALIGN="RIGHT"><% if Not IsNull(rsList("list_price").value) then %>&nbsp &nbsp<%  = MSCSDataFunctions.Money(rsList("list_price").value) %>&nbsp &nbsp
		<%'= mscsPage.HTMLEncode(rsList("list_price").value) %>&nbsp Bath<% end if %></TD>
<%  end function


listElemTemplate = "product_edit.asp"			%>
<% '	ข้อความที่แสดงบน list %>
<%
listColumns = "<TH ALIGN=""LEFT""> # </TH>" & vbCr & _
              "<TH ALIGN=""LEFT""> ID </TH>" & vbCr & _
              "<TH ALIGN=""LEFT"">&nbsp Name </TH>" & vbCr & _
              "<TH ALIGN=""LEFT""> &nbsp &nbsp &nbsp &nbsp &nbsp Price </TH>" & vbCr
listNoRows = "<I>No products in table</I><P><FONT FACE=""Arial, sans-serif"" COLOR=""#FF0000"" STYLE=""{font-family: Arial, sans-serif; font-color: red; font-weight: bold; font-size: 10pt}"">*** IMPORTANT *** You must enter Attributes and Departments before entering new products.</FONT>"
cmdTemp.CommandText = "SELECT pf_id, name, list_price FROM tranika_product ORDER BY pf_id"
%>

<% REM   body: %>
<A HREF="product_new.asp"> <H3>Add New Home</H3> </A>

<!--#INCLUDE FILE="include/list.asp" -->

<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
