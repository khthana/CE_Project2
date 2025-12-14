










<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Location").count <> 0 then
    cmdTemp.CommandText = Replace("SELECT * FROM tranika_location WHERE lku = ?", "?", "'" & Replace(Request("lku"),"'","''") & "'")
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic

    lku = mscsPage.RequestString("lku", null, 1, 100)
    if IsNull(lku) then
        errorList.Add "lku must be between 1 and 100 characters"
    end if
    dept_id = mscsPage.RequestNumber("dept_id", "", 0, 20000)
    if IsNull(dept_id) then
        errorList.Add "dept_id must be between 0 and 20000"
    else
        rsExe.Update "dept_id", dept_id
    end if
   zone_code = mscsPage.RequestString("zone_code", "", 1, 100)
    if IsNull(zone_code) then
        errorList.Add "zone_code must be between 1 and 100 characters"
    else
        rsExe.Update "zone_code", zone_code
    end if

    zone_start = mscsPage.RequestNumber("zone_start", "", 0, 20000)
    if IsNull(zone_start) then
        errorList.Add "zone_start must be between 0 and 20000"
    else
        rsExe.Update "zone_start", zone_start
    end if
    
	zone_end = mscsPage.RequestNumber("zone_end", "", 0, 20000)
    if IsNull(zone_end) then
        errorList.Add "zone_end must be between 0 and 20000"
    else
        rsExe.Update "zone_end", zone_end
    end if
    
	zone_value = mscsPage.RequestNumber("zone_value", "", 0, 20000)
    if IsNull(zone_value) then
        errorList.Add "zone_value must be between 0 and 20000"
    else
        rsExe.Update "zone_value", zone_value
    end if
    

    If errorList.Count = 0 Then
        if Err.Number = 0 then
            Response.Redirect "dept_edit.asp?" & mscsPage.URLArgs("dept_id", Request.Form("dept_id"))
        else
            if Err.Number = UNIQUE_CONSTRAINT then
                errorList.Add "A product variant with that attribute combination or LKU already exists."
            else
                errorList.Add "Database error when updating product variant: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
            end if
        end if
    end if
    On Error Goto 0
end if
%>
