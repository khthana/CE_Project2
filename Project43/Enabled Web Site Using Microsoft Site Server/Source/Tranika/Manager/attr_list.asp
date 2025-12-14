<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>






<!--#INCLUDE FILE="include/Manager.asp" -->


<%
name = Request("attr")
table = Request("attr_table")
%>
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
<% REM   header: %>
<% pageTitle = name %>

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
        <TD VALIGN="TOP" ALIGN="CENTER"  >
            <A HREF="<% = listElemTemplate & "?" & mscsPage.URLArgs("id", rsList(name + "_id").value, "attr", name, "attr_table", table) %>"> <% = rsList(name + "_id").value %> </A>
        </TD>
        <TD ALIGN="LEFT"  > 
            &nbsp <A HREF="<% = listElemTemplate & "?" & mscsPage.URLArgs("id", rsList(name + "_id").value, "attr", name, "attr_table", table) %>"> <% = rsList(name + "_value").value %> </A>
        </TD>
		<TD ALIGN="LEFT">&nbsp &nbsp<% = MSCSDataFunctions.Money(rsList(name + "_price").value) %>&nbsp Bath
<%  end function

listElemTemplate = "attr_edit.asp"
listColumns = "<TH ALIGN=""LEFT"">" & aname &" id </TH>" & vbCr & _
              "<TH ALIGN=""LEFT""> &nbsp name </TH>" & vbCr & "<TH ALIGN=""LEFT"">&nbsp &nbsp &nbsp price </TH>" & vbCr 	 
listNoRows = "<I>No " & name & " values in table</I>"
cmdTemp.CommandText = Replace("SELECT * FROM ?", "?", table)
%>

<% REM   body: %>
<A HREF="attr_new.asp?<% = mscsPage.URLArgs("attr", name, "attr_table", table) %>"> <H3> Add New <%= aname %> </H3> </A></TD>

<!--#INCLUDE FILE="include/list.asp" -->

<BR>

<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
