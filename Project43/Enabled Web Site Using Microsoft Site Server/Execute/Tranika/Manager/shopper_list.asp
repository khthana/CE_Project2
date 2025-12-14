<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>






<!--#INCLUDE FILE="include/Manager.asp" -->



<% REM   header: %>
<% pageTitle = "All Shoppers" %>
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
        <TD ALIGN="CENTER"> <% = RowCount %> </TD>
        <TD ALIGN="LEFT"  >  <% = rsList("shopper_id").value %>  </TD>
        <TD ALIGN="LEFT"  > <A HREF="<% = listElemTemplate & "?" & mscsPage.URLArgs("shopper_id", rsList("shopper_id").value) %>"><% = rsList("name").value %> </A></TD>
<%  end function

listElemTemplate = "shop_view.asp"
listColumns = "<TH ALIGN=""LEFT""> # </TH>" & vbCr & _
              "<TH ALIGN=""LEFT""> Shopper ID </TH>" & vbCr & _
              "<TH ALIGN=""LEFT""> Name </TH>" & vbCr
listNoRows = "<I>No shoppers in table</I>"
cmdTemp.CommandText = "SELECT shopper_id, name FROM tranika_shopper ORDER BY shopper_id"
%>

<% REM   body: %>
<P>
<!--#INCLUDE FILE="include/list.asp" -->

<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
