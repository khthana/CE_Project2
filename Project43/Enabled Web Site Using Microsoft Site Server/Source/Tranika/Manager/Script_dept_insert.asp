<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>





<!--#INCLUDE FILE="include/Manager.asp" -->
<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Validate").count <> 0 then

dept_id = mscsPage.RequestString("dept_id", "", 1, 100)
    if IsNull(dept_id) then
        errorList.Add "dept_id must be between 1 and 100 characters"
    end if
'    dept_id = mscsPage.RequestNumber("dept_id", "", 1, 20000)
 '   if IsNull(dept_id) then
  '      errorList.Add "dept_id must be between 1 and 20000"
   ' end if
    dept_name = mscsPage.RequestString("dept_name", "", 1, 255)
    if IsNull(dept_name) then
        errorList.Add "dept_name must be between 1 and 255 characters"
    end if
    dept_desc = mscsPage.RequestString("dept_description", "", 0, 255)
    if IsNull(dept_desc) then
        errorList.Add "dept_description must be less than or equal to 255 characters"
    end if
    dept_map = mscsPage.RequestString("dept_map", "", 1, 255)
    if IsNull(dept_map) then
        errorList.Add "dept_map must be between 1 and 255 characters"
    end if
	dept_zone = mscsPage.RequestString("dept_zone", "", 1, 255)
    if IsNull(dept_zone) then
        errorList.Add "dept_zone must be between 1 and 255 characters"
    end if

	name_1= dept_map
	name_2= dept_zone

    If errorList.Count = 0 Then
        cmdTemp.CommandText = Replace("SELECT dept_id, dept_name, dept_description , dept_map , dept_zone FROM tranika_dept WHERE dept_id = ?", "?", Request("dept_id"))
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
<% pageTitle = " New Plan" %>
<HTML>
<HEAD>
    <TITLE> <% = pageTitle %> </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
    <!--#INCLUDE FILE="include/mgmt_define.asp" -->
</HEAD>

<BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="<% = Application("bgcolor") %>" TEXT="#000000" LINK="#FF0000" ALINK="#FF0000" VLINK="#FF0000">
<!--#INCLUDE FILE="include/mgmt_header.asp" -->

<TABLE WIDTH="800" BORDER="1">
<TR>
	<TD ROWSPAN="2" >	<FONT SIZE="-1">Put file name</TD>
	<TD WIDTH="300"><%Response.Write name_1%></TD>
</TR>
<TR><TD><%Response.Write name_2%></TD></TR>

<TR><TD COLSPAN="2"><BR>&nbsp Place file in <%= Server.MapPath("/" & mscsPage.SiteRoot) %>\assets\product_images  or   &nbsp &nbsp </FONT>


<%
          
        rsExe.AddNew
        rsExe("dept_id").Value = dept_id
        rsExe("dept_name").Value = dept_name
        rsExe("dept_description").Value = dept_desc
        rsExe("dept_map").Value = dept_map
        rsExe("dept_zone").Value = dept_zone        
        rsExe.Update

        if Err.Number = 0 then
            ReloadSite
            Response.Redirect "dept_list.asp"
        else
            if Err.Number = UNIQUE_CONSTRAINT then
                errorList.Add "A department with that deptartment Id already exists."
            else
                errorList.Add "Database error when adding department: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
            end if
        end if
    end if
    On Error Goto 0
end if
%>

<A HREF="Upload_dept.asp?dept_map=<%=name_1%>&dept_zone=<%=name_2%>"> <FONT FACE="Arial, sans-serif" COLOR="red" STYLE="{font-family: Arial, sans-serif; color: red; font-weight: bold; font-size: 14pt}">Upload file</FONT> </A>
	</TR>
</TABLE>
<% REM   footer: %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
</BODY>
</HTML>







