











<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Validate").count <> 0 then

    dept_id = mscsPage.RequestNumber("dept_id", "", 1, 20000)
    if IsNull(dept_id) then
        errorList.Add "dept_id must be between 1 and 20000"
    end if
    dept_name = mscsPage.RequestString("dept_name", "", 1, 255)
    if IsNull(dept_name) then
        errorList.Add "dept_name must be between 1 and 255 characters"
    end if
    dept_desc = mscsPage.RequestString("dept_description", "", 0, 255)
    if IsNull(dept_desc) then
        errorList.Add "dept_description must be less than or equal to 255 characters"
    end if
    
    If errorList.Count = 0 Then
        cmdTemp.CommandText = Replace("SELECT dept_id, dept_name, dept_description FROM tranika_dept WHERE dept_id = ?", "?", Request("dept_id"))
        Set rsExe = Server.CreateObject("ADODB.Recordset")
        On Error Resume Next
        rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic

        if Err.Number <> 0 then
            Set errorList = Server.CreateObject("Commerce.SimpleList")
            errorList.Add "The table could not be found or the database connection failed."
            pageTitle = "Error"
            %>
            <HTML>
            <HEAD>
                <TITLE> <% = pageTitle %> </TITLE>
                <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
                <!--#INCLUDE FILE="include/mgmt_define.asp" -->
            </HEAD>

            <BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" ALINK="#FF0000" VLINK="#FF0000">
            <!--#INCLUDE FILE="include/mgmt_header.asp" -->
            <!--#INCLUDE FILE="include/error.asp" -->
            <!--#INCLUDE FILE="include/mgmt_footer.asp" -->
            <%
            Response.end
        end if
        rsExe.AddNew
        rsExe("dept_id").Value = dept_id
        rsExe("dept_name").Value = dept_name
        rsExe("dept_description").Value = dept_desc
        
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
