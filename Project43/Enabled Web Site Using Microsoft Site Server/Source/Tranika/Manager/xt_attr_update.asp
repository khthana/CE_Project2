










<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Validate").count <> 0 then

    anameID = Request("attr") & "_id"
    anameValue = Request("attr") & "_value"
	anamePrice = RequestMoney("attr") & "_price"
	anameDescription = Request("attr") &  "_description"
	anameFile = Request("attr") & "_file"
    table = Request("attr_table")
    sqlText = "SELECT * FROM :1 WHERE :2 = :3"
    sqlText = Replace(sqlText, ":1", table)
    sqlText = Replace(sqlText, ":2", anameID)
    sqlText = Replace(sqlText, ":3", Request("id"))
    cmdTemp.CommandText = sqlText
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic

    aid = mscsPage.RequestNumber("id", "", 0, 20000)
    if IsNull(aid) then
        errorList.Add anameID + " must be between 0 and 20000"
    end if
    av = mscsPage.RequestString("value", "", 1, 255)
    if IsNull(av) then
        errorList.Add anameValue + " must be between 1 and 255 characters"
    else
        rsExe.Update anameValue , av
    end if
	ap = mscsPage.RequestMoneyAsNumber("price", "", 0, 2147483647)
'    if IsNull(ap) then
'        errorList.Add anamePrice + " must be between 0 and 2147483647"
'    else
        rsExe.Update anamePrice , ap
'    end if
	ad = mscsPage.RequestString("description", "", 0, 255)
    'if IsNull(ad) then
    '    errorList.Add anameDescription + "must be between 0 and 255 characters"
    'else
        rsExe.Update anameDescription , ad
	'end if
	
	af = mscsPage.RequestString("file", "", 1, 50)
    if IsNull(af) then
        errorList.Add anameFile + " must be between 1 and 50 characters"
    else
        rsExe.Update anameFile , af
   end if


'    If errorList.Count = 0 Then
'        if Err.Number = 0 then
            Response.Redirect "attr_list.asp?" & mscsPage.URLArgs("attr", Request("attr"), "attr_table", table)
'        else
'            if Err.Number = UNIQUE_CONSTRAINT then
'                errorList.Add "A product attribute with that Id or value already exists."
'            else
'                errorList.Add "Database error when updating product attribute: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
'            end if
'        end if
'    end if
'    On Error Goto 0
end if
%>