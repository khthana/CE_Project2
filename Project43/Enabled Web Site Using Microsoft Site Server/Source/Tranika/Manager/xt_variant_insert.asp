











<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Validate").count <> 0 then

    sku = mscsPage.RequestString("sku", null, 1, 100)
    if IsNull(sku) then
        errorList.Add "SKU must be between 1 and 100 characters"
    end if
    pf_id = mscsPage.RequestString("pf_id", "", 1, 100)
    if IsNull(pf_id) then
        errorList.Add "pf_id must be between 1 and 100 characters"
    end if
    
    door_id = mscsPage.RequestNumber("door_id", "", 0, 20000)
    if IsNull(door_id) then
        errorList.Add "attr_door must be between 0 and 20000"
    end if

	 door2_id = mscsPage.RequestNumber("door2_id", "", 0, 20000)
    if IsNull(door2_id) then
        errorList.Add "attr_door2 must be between 0 and 20000"
    end if
    
    toilet_id = mscsPage.RequestNumber("toilet_id", "", 0, 20000)
    if IsNull(toilet_id) then
        errorList.Add "attr_toilet must be between 0 and 20000"
    end if
    
    floor_id = mscsPage.RequestNumber("floor_id", "", 0, 20000)
    if IsNull(floor_id) then
        errorList.Add "attr_floor must be between 0 and 20000"
    end if
    
    If errorList.Count = 0 Then
        cmdTemp.CommandText = Replace("SELECT * FROM tranika_variant WHERE sku = ?", "?", "'" & Replace(Request("sku"),"'","''") & "'")
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
        rsExe("sku").Value      = sku
        rsExe("pf_id").Value = pf_id
        rsExe("attr_door").Value = mscsPage.RequestNumber("door_id", "", 0, 20000)
        rsExe("attr_door2").Value = mscsPage.RequestNumber("door2_id", "", 0, 20000)
        rsExe("attr_toilet").Value = mscsPage.RequestNumber("toilet_id", "", 0, 20000)
        rsExe("attr_floor").Value = mscsPage.RequestNumber("floor_id", "", 0, 20000)
        
        rsExe.Update

        if Err.Number = 0 then
            Response.Redirect "product_edit.asp?" & mscsPage.URLArgs("pf_id", Request.Form("pf_id"))
        else
            if Err.Number = UNIQUE_CONSTRAINT then
                errorList.Add "A product variant with that attribute combination or SKU already exists."
            else
                errorList.Add "Database error when adding product variant: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
            end if
        end if
    end if
    On Error Goto 0
end if
%>
