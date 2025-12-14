











<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Validate").count <> 0 then

    name = Request("attr")
    table = Request("attr_table")
    sqlText = "DELETE FROM tranika_variant WHERE :1 = :2"
    sqlText = Replace(sqlText, ":1", "attr_" & name)
    sqlText = Replace(sqlText, ":2", Request("id"))
    cmdTemp.CommandText = sqlText
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic

    sqlText = "DELETE FROM :1 WHERE :2 = :3"
    sqlText = Replace(sqlText, ":1", table)
    sqlText = Replace(sqlText, ":2", name & "_id")
    sqlText = Replace(sqlText, ":3", Request("id"))
    cmdTemp.CommandText = sqlText
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic

    if Err.Number = 0 then
        Response.Redirect "attr_list.asp?" & mscsPage.URLArgs("attr", name, "attr_table", table)
    else
        errorList.Add "Database error when deleting product attribute: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
    end if
end if
%>
