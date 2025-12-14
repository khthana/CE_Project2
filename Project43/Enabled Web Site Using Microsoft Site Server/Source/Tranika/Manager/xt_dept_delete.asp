











<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Validate").count <> 0 then

    cmdTemp.CommandText = Replace("DELETE FROM tranika_dept_prod WHERE dept_id = ?", "?", Request("id"))
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic

    cmdTemp.CommandText = Replace("DELETE FROM tranika_dept WHERE dept_id = ?", "?", Request("id"))
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic

    if Err.Number = 0 then
        ReloadSite
        Response.Redirect "dept_list.asp"
    else
        errorList.Add "Database error when deleting department: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
    end if
end if
%>
