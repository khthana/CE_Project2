











<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Validate").count <> 0 then

    lku = mscsPage.RequestString("lku", null, 1, 100)
    if IsNull(lku) then
        errorList.Add "LKU must be between 1 and 100 characters"
    end if
    dept_id = mscsPage.RequestNumber("dept_id", "", 0, 20000)
    if IsNull(dept_id) then
        errorList.Add "dept_id must be between 0 and 20000"
    end if
    
	zone_code = mscsPage.RequestString("zone_code", "", 1, 100)
    if IsNull(zone_code) then
        errorList.Add "zone_code must be between 1 and 100 characters"
    end if
	
    zone_start  = mscsPage.RequestNumber("zone_start", "", 0, 20000)
    if IsNull(zone_start) then
        errorList.Add "zone_start must be between 0 and 20000"
    end if

	 zone_end = mscsPage.RequestNumber("zone_end", "", 0, 20000)
    if IsNull(zone_end) then
        errorList.Add "zone_end must be between 0 and 20000"
    end if
    
    zone_value = mscsPage.RequestNumber("zone_value", "", 0, 20000)
    if IsNull(zone_value) then
        errorList.Add "zone_value must be between 0 and 20000"
    end if
    
    
    If errorList.Count = 0 Then
        cmdTemp.CommandText = Replace("SELECT * FROM tranika_location WHERE lku = ?", "?", "'" & Replace(Request("lku"),"'","''") & "'")
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
        rsExe("lku").Value      = lku
        rsExe("dept_id").Value = dept_id
        rsExe("zone_code").Value = mscsPage.RequestString("zone_code", "", 1, 100)
        rsExe("zone_start").Value = mscsPage.RequestNumber("zone_start", "", 0, 20000)
        rsExe("zone_end").Value = mscsPage.RequestNumber("zone_end", "", 0, 20000)
        rsExe("zone_value").Value = mscsPage.RequestNumber("zone_value", "", 0, 20000)
        
        rsExe.Update

        if Err.Number = 0 then
            Response.Redirect "dept_edit.asp?" & mscsPage.URLArgs("dept_id", Request.Form("dept_id"))
        else
            if Err.Number = UNIQUE_CONSTRAINT then
                errorList.Add "A product variant with that attribute combination or LKU already exists."
            else
                errorList.Add "Database error when adding product variant: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
            end if
        end if
    end if
    On Error Goto 0
end if
%>
