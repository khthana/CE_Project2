<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>





	

<!--#INCLUDE FILE="include/Manager.asp" -->



<% REM   header: %>
<% pageTitle = " Plan " %>
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
        <TD VALIGN="TOP" ALIGN="CENTER">
            <A HREF ="<% = listElemTemplate & "?" & mscsPage.URLArgs("dept_id", rsList("dept_id").value, "dept_name", rsList("dept_name").value ) %>"> <% = rsList("dept_id").value %> </A>
        </TD>
        <TD VALIGN="TOP" ALIGN="LEFT"> 
            <A HREF="<% = listElemTemplate & "?" & mscsPage.URLArgs("dept_id", rsList("dept_id").value, "dept_name", rsList("dept_name").value ) %>"> <% = rsList("dept_name").value %> </A> 
        </TD>
        
<%  end function

listElemTemplate = "dept_edit.asp"
listColumns = "<TH ALIGN=""LEFT""> Plan ID  &nbsp &nbsp</TH>" & vbCr & _
              "<TH ALIGN=""LEFT""> Plan name </TH>" & vbCr

listNoRows = "<I>No departments in table</I>"
cmdTemp.CommandText = "SELECT dept_id, dept_name FROM tranika_dept ORDER BY dept_id"
%>

<% REM   body: %>
<A HREF="dept_new.asp"> <H4>Add New Plan</H4> </A>

<!--#INCLUDE FILE="include/list.asp" -->

<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->