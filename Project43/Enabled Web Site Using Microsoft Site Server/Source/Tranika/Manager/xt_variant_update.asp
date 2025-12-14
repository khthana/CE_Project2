










<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Validate").count <> 0 then
    cmdTemp.CommandText = Replace("SELECT * FROM tranika_variant WHERE sku = ?", "?", "'" & Replace(Request("sku"),"'","''") & "'")
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic

    sku = mscsPage.RequestString("sku", null, 1, 100)
    if IsNull(sku) then
        errorList.Add "sku must be between 1 and 100 characters"
    end if
    pf_id = mscsPage.RequestString("pf_id", "", 1, 100)
    if IsNull(pf_id) then
        errorList.Add "pf_id must be between 1 and 100 characters"
    else
        rsExe.Update "pf_id", pf_id
    end if
    
    attr_door = mscsPage.RequestNumber("attr_door", "", 0, 20000)
    if IsNull(attr_door) then
        errorList.Add "attr_door must be between 0 and 20000"
    else
        rsExe.Update "attr_door", attr_door
    end if
    
    attr_toilet = mscsPage.RequestNumber("attr_toilet", "", 0, 20000)
    if IsNull(attr_toilet) then
        errorList.Add "attr_toilet must be between 0 and 20000"
    else
        rsExe.Update "attr_toilet", attr_toilet
    end if
    
    attr_floor = mscsPage.RequestNumber("attr_floor", "", 0, 20000)
    if IsNull(attr_floor) then
        errorList.Add "attr_floor must be between 0 and 20000"
    else
        rsExe.Update "attr_floor", attr_floor
    end if
    

    If errorList.Count = 0 Then
        if Err.Number = 0 then
            Response.Redirect "product_edit.asp?" & mscsPage.URLArgs("pf_id", Request.Form("pf_id"))
        else
            if Err.Number = UNIQUE_CONSTRAINT then
                errorList.Add "A product variant with that attribute combination or SKU already exists."
            else
                errorList.Add "Database error when updating product variant: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
            end if
        end if
    end if
    On Error Goto 0
end if
%>
