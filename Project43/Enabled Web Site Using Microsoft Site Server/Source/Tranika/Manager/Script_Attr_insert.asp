<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>






<!--#INCLUDE FILE="include/Manager.asp" -->
<!--#INCLUDE FILE="include/mgmt_define.asp" -->
<!--#INCLUDE FILE="include/mgmt_header.asp" -->
<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Validate").count <> 0 then

    aname = Request("attr")
    table = Request("attr_table")
    aid = mscsPage.RequestNumber(aname + "_id", "", 0, 20000)
    if IsNull(aid) then
        errorList.Add aname + "_id must be between 0 and 20000"
    end if
    av = mscsPage.RequestString(aname + "_value", "", 1, 50)
    if IsNull(av) then
        errorList.Add aname + "_value must be between 1 and 50 characters"
    end if

    ap = mscsPage.RequestMoneyAsNumber(aname + "_price", "", 0, 2147483647)
    if IsNull(ap) then
        errorList.Add aname + "_price must be between 0 and 2147483647"
    end if

    ad = mscsPage.RequestString(aname + "_description", "", 0, 50)
    if IsNull(ad) then
        errorList.Add aname + "_description must be between 0 and 50 characters"
    end if

    af = mscsPage.RequestString(aname + "_file", "", 1, 50)
    if IsNull(af) then
        errorList.Add aname + "_file must be between 1 and 50 characters"
    end if
	
	name_1= af

    If errorList.Count = 0 Then
        sqlText = Replace("SELECT * FROM :1 WHERE :2 = :3", ":1", table)
        sqlText = Replace(sqlText, ":2", aname & "_id")
        sqlText = Replace(sqlText, ":3", Request(aname & "_id"))
        cmdTemp.CommandText = sqlText
        Set rsExe = Server.CreateObject("ADODB.Recordset")
        On Error Resume Next
        rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic

        if Err.Number <> 0 then
            Set errorList = Server.CreateObject("Commerce.SimpleList")
            errorList.Add "The table could not be found or the database connection failed."
            pageTitle = "Error"

			  Response.end
        end if
%>

<% pageTitle = "New Product" %>
<HTML>
<HEAD>
    <TITLE> <% = pageTitle %> </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
   <SCRIPT>
    <!--
        dirty = false
    //-->
    </SCRIPT>
</HEAD>

<BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="<% = Application("bgcolor") %>" TEXT="#000000" LINK="#FF0000" ALINK="#FF0000" VLINK="#FF0000">

<%
          

        rsExe.AddNew
        rsExe(aname + "_id").Value = aid
        rsExe(aname + "_value").Value = av
        rsExe(aname + "_price").Value =ap		
        rsExe(aname + "_description").Value =ad		
        rsExe(aname + "_file").Value =af		
        rsExe.Update

        if Err.Number = 0 then
            Response.Redirect "Script_attr_insert.asp?" & mscsPage.URLArgs("attr", aname, "attr_table", table)
        else
            if Err.Number = UNIQUE_CONSTRAINT then
                errorList.Add "A product attribute with that Id or value already exists."
            else
                errorList.Add "Database error when adding product attribute: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
            end if
        end if
    end if
    On Error Goto 0
end if
%>

<TABLE WIDTH="800" BORDER="1">
<TR>
	<TD ROWSPAN="1" >	<FONT SIZE="-1">Put file name</TD>
	<TD WIDTH="300"><%Response.Write af%></TD>
</TR>

<TR><TD COLSPAN="2"><BR>Place file in <%= Server.MapPath("/" & mscsPage.SiteRoot) %>\assets\product_images  หรือ   &nbsp &nbsp </FONT>



<A HREF="Upload_Attr.asp?image_file=<%=af%>"> <FONT FACE="Arial, sans-serif" COLOR="red" STYLE="{font-family: Arial, sans-serif; color: red; font-weight: bold; font-size: 14pt}">Upload ภาพ</FONT> </A> 
</TD></TR>
</TABLE>

<%'	Response.Redirect "product_list.asp" %>

<% REM   body: %>


<!--#INCLUDE FILE="include/error.asp" -->
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
</BODY>
</HTML>