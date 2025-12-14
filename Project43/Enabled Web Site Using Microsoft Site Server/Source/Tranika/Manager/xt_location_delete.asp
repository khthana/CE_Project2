











<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Location").count <> 0 then
    cmdTemp.CommandText = Replace("DELETE FROM tranika_location WHERE lku = ?", "?", "'" & Replace(Request("lku"),"'","''") & "'")
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic

    if Err.Number = 0 then
        Response.Redirect "dept_edit.asp?" & mscsPage.URLArgs("dept_id", Request.Form("dept_id"))
    else
        errorList.Add "Database error when deleting product location: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
    end if
end if
%>
