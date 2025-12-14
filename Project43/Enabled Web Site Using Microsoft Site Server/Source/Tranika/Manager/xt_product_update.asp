










<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Validate").count <> 0 then

    cmdTemp.CommandText = Replace("SELECT * FROM tranika_product WHERE pf_id = ?", "?", "'" & Replace(Request("pf_id"),"'","''") & "'")
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic

    pf_id = mscsPage.RequestString("pf_id", "", 1, 100)
    if IsNull(pf_id) then
        errorList.Add "pf_id must be between 1 and 100 characters"
    end if
    
	name = mscsPage.RequestString("name", "", 1, 255)
    if IsNull(name) then
        errorList.Add "name must be between 1 and 255 characters"
    else
        if name = "" then name = null
        rsExe.Update "name", name
    end if

    model = mscsPage.RequestString("model", "", 1, 255)
    if IsNull(model) then
        errorList.Add "model must be between 1 and 255 characters"
    else
	     if model = "" then model = null
        rsExe.Update "model", model
    end if

	area = mscsPage.RequestNumber("area", "", 0, 20000)
    if IsNull(area) then
        errorList.Add "area must be must be between 0 and 20000"
    else
        if area = "" then area = null
        rsExe.Update "area", area
    end if

	body = mscsPage.RequestNumber("body", "", 0, 20000)
    if IsNull(body) then
        errorList.Add "body must be must be between 0 and 20000"
    else
        if body = "" then body = null
        rsExe.Update "body", body
    end if

	bedroom = mscsPage.RequestNumber("bedroom", "", 0, 20000)
    if IsNull(bedroom) then
        errorList.Add "bedroom must be between 0 and 20000"
    else
       if bedroom = "" then bedroom = null
        rsExe.Update "bedroom", bedroom
    end if
	bathroom = mscsPage.RequestNumber("bathroom", "", 0, 20000)
    if IsNull(bathroom) then
        errorList.Add "bathroom must be between 0 and 20000"
    else
	if bathroom = "" then bathroom = null
        rsExe.Update "bathroom", bathroom
    end if
	description = mscsPage.RequestString("description", "", 0, 255)
    if IsNull(description) then
        errorList.Add "description must be between 0 and 255 characters"
    else
        if description = "" then description = null
        rsExe.Update "description", description
    end if
    list_price = mscsPage.RequestMoneyAsNumber("list_price", "", 0, 2147483647)
	'list_price = mscsPage.RequestString("list_price","",1,255)
	if IsNull(list_price) then
        errorList.Add "list_price must be between 0 and 2147483647"
'        errorList.Add "list_price must be between 1 and 255 characters"
    else
        if list_price = "" then list_price = null
        rsExe.Update "list_price", list_price
    end if
    image_file = mscsPage.RequestString("image_file", "", 0, 100)
    if IsNull(image_file) then
        errorList.Add "image_file must be less than or equal to 100 characters"
    else
        if image_file = "" then image_file = null
        rsExe.Update "image_file", image_file
    end if
    image_first = mscsPage.RequestString("image_first", "0", 0, 100)
    if IsNull(image_first) then
        errorList.Add "image_first must be less than or equal to 100 characters"
    else
         if image_first = "" then image_first = null
        rsExe.Update "image_first", image_first
    end if
    image_second = mscsPage.RequestString("image_second", "0", 0, 100)
    if IsNull(image_second) then
        errorList.Add "image_second must be less than or equal to 100 characters"
    else
		if image_second = "" then image_second = null
        rsExe.Update "image_second", image_second
    end if
'    sale_price = mscsPage.RequestMoneyAsNumber("sale_price", "0", 0, 2147483647)
'    if IsNull(sale_price) then
'        errorList.Add "sale_price must be between 0 and 2147483647"
'    else
'        if sale_price = "" then sale_price = null
'        rsExe.Update "sale_price", sale_price
'    end if
'    sale_start = mscsPage.RequestDate("sale_start", "1/1/1975")
'    if IsNull(sale_start) then
'        errorList.Add "sale_start must be a valid date"
'    else
'        if sale_start = "" then sale_start = null
'        rsExe.Update "sale_start", sale_start
'    end if
'    sale_end = mscsPage.RequestDate("sale_end", "1/1/1975")
'    if IsNull(sale_end) then
'        errorList.Add "sale_end must be a valid date"
'    else
'        if sale_end = "" then sale_end = null
'        rsExe.Update "sale_end", sale_end
'    end if
    
'    if DateDiff("d", rsExe("sale_end").value, rsExe("sale_start").value) > 0 then
'        errorList.Add "sale_end must be a valid date on or after sale_start"
'    end if
    
'    if err.Number <> 0 then
'        errorList.Add "Database error when updating product: " & err.Number & " " & err.Description
'    end if
'    err.Clear

    cmdTemp.CommandText = Replace("DELETE FROM tranika_dept_prod WHERE pf_id = ?", "?", "'" & Replace(pf_id,"'","''") & "'")
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, ,adOpenStatic, adLockOptimistic
    if Request("dept_id").Count <> 0 then
        for index = 1 to Request("dept_id").Count
            dept_id = Request("dept_id")(index)
            if dept_id < 0 or dept_id > 20000 then
                errorList.Add "dept_id must be a between 0 and 20000"
            else
                sqlText = "INSERT INTO tranika_dept_prod VALUES (:1, :2)"
                sqlText = Replace(sqlText, ":1", dept_id)
                sqlText = Replace(sqlText, ":2", "'" & Replace(pf_id,"'","''") & "'")
                cmdTemp.CommandText = sqlText
                Set rsExe = Server.CreateObject("ADODB.Recordset")
                rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic
            end if
        next
    end if
'    if Err.Number <> 0 then
'        errorList.Add "Database error when updating departments: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
'    end if
'    err.Clear

    If errorList.Count = 0 Then
        'ReloadSite
        Response.Redirect "product_list.asp"
    end if
    On Error Goto 0
end if
%>
