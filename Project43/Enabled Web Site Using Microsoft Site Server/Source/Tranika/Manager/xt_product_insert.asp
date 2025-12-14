






<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Validate").count <> 0 then

    pf_id = mscsPage.RequestString("pf_id", "", 1, 100)
    if IsNull(pf_id) then
        errorList.Add "pf_id must be between 1 and 100 characters"
    end if
    name = mscsPage.RequestString("name", "", 1, 255)
    if IsNull(name) then
        errorList.Add "name must be between 1 and 255 characters"
    end if

	model = mscsPage.RequestString("model", "", 1, 255)
	if IsNull(model) then
   	errorList.Add "model must be between 1 and 255 characters"
    end if
	area = mscsPage.RequestString("area", "", 1, 255)
    if IsNull(area) then
        errorList.Add "area must be between 1 and 255 characters"
    end if
    bedroom = mscsPage.RequestString("bedroom", "", 1, 255)
    if IsNull(bedroom) then
        errorList.Add "bedroom must be between 1 and 255 characters"
    end if
    bathroom = mscsPage.RequestString("bathroom", "", 1, 255)
    if IsNull(bathroom) then
        errorList.Add "bathroom must be between 1 and 255 characters"
    end if
	description = mscsPage.RequestString("description")
    if IsNull(description) then
        errorList.Add "description must be between 1 and 255 characters"
    end if
    list_price = mscsPage.RequestMoneyAsNumber("list_price", "", 0, 2147483647)
'    list_price = mscsPage.RequestString("list_price", "", 1, 255)
    if IsNull(list_price) then
        errorList.Add "list_price must be between 0 and 2147483647"
'        errorList.Add "list_price must be between 1 and 255 characters"
    end if
    image_file = mscsPage.RequestString("image_file", "", 0, 100)
    if IsNull(image_file) then
        errorList.Add "image_file must be less than or equal to 100 characters"
    end if
    image_first = mscsPage.RequestString("image_first" , "" , 0 , 100)
    if IsNull(image_first) then
        errorList.Add "image_first must be less than or equal to 100 characters"
    end if
    image_second = mscsPage.RequestString("image_second", "" ,0 ,100)
    if IsNull(image_second) then
        errorList.Add "image_second must be less than or equal to 100 characters"
    end if
'    sale_price = mscsPage.RequestMoneyAsNumber("sale_price", "0", 0, 2147483647)
'    if IsNull(sale_price) then
'        errorList.Add "sale_price must be between 0 and 2147483647"
'    end if
'    sale_start = mscsPage.RequestDate("sale_start", "1/1/1975")
'    if IsNull(sale_start) then
'        errorList.Add "sale_start must be a valid date"
'    end if
'    sale_end = mscsPage.RequestDate("sale_end", "1/1/1975")
'    if IsNull(sale_end) then
'        errorList.Add "sale_end must be a valid date"
'    end if
    	
'    if DateDiff("d", sale_end, sale_start) > 0 then
'        errorList.Add "sale_end must be a valid date on or after sale_start"
'    end if
    
    If errorList.Count = 0 Then
        cmdTemp.CommandText = Replace("SELECT * FROM tranika_product WHERE pf_id = ?", "?", "'" & Replace(Request("pf_id"),"'","''") & "'")
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
        rsExe("pf_id").value = pf_id
        rsExe("name").Value = mscsPage.RequestString("name", "", 1, 255)
        rsExe("model").Value = mscsPage.RequestString("model", "", 1, 255)
		rsExe("area").Value = mscsPage.RequestString("area", "", 1, 255)
		rsExe("bedroom").Value = mscsPage.RequestString("bedroom", "", 1, 255)
		rsExe("bathroom").Value = mscsPage.RequestString("bathroom", "", 1, 255)
		rsExe("description").Value = mscsPage.RequestString("description", "", 1, 255)
        rsExe("list_price").Value = mscsPage.RequestMoneyAsNumber("list_price", "", 0, 2147483647)
        rsExe("image_file").Value = mscsPage.RequestString("image_file", "", 0, 100)
        rsExe("image_first").Value = mscsPage.RequestString("image_first", "",1 ,100)
        rsExe("image_second").Value = mscsPage.RequestString("image_second", "" , 1 , 100)
'        rsExe("sale_price").Value = mscsPage.RequestMoneyAsNumber("sale_price", "0", 0, 2147483647)
'        rsExe("sale_start").Value = mscsPage.RequestDate("sale_start", "1/1/1975")
'        rsExe("sale_end").Value = mscsPage.RequestDate("sale_end", "1/1/1975")

        rsExe.Update
'        if Err.Number <> 0 then
'            if Err.Number = UNIQUE_CONSTRAINT then
'                errorList.Add "A product with that pf_id already exists."
'            else
'                errorList.Add "Database error when adding product: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
'            end if
'       end if
'      err.Clear

        cmdTemp.CommandText = Replace("DELETE FROM tranika_dept_prod WHERE pf_id = ?", "?", "'" & Replace(Request("pf_id"),"'","''") & "'")
        Set rsExe = Server.CreateObject("ADODB.Recordset")
        rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic
        if Request("dept_id").Count <> 0 then
            for index = 1 to Request("dept_id").Count
                dept_id = Request("dept_id")(index)
                if dept_id < 0 or dept_id > 20000 then
                    errorList.Add "dept_id must be between 0 and 20000"
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

'        if Err.Number <> 0 then
'           errorList.Add "Database error when adding departments: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
'        end if
        if errorList.Count = 0 then
            ReloadSite
            Response.Redirect "product_list.asp"
        end if
    end if
    On Error Goto 0
end if
%>
