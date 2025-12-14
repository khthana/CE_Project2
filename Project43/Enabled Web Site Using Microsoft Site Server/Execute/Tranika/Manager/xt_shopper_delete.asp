











<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Validate").count <> 0 then

    cmdTemp.CommandText = Replace("SELECT * FROM tranika_basket WHERE shopper_id = ?", "?", "'" & Request("shopper_id") & "'")
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic
    rsExe.Delete
    if Err.Number <> 0 then
        errorList.Add "Database error when deleting basket for shopper: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
    end if
    err.Clear

    Set cmdTemp = cycleADOConnection()
    cmdTemp.CommandText = Replace("SELECT * FROM tranika_shopper WHERE shopper_id = ?", "?", "'" & Request("shopper_id") & "'")
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic
    rsExe.Delete

    if Err.Number = 0 then
        Response.Redirect "shopper_list.asp"
    else
        errorList.Add "Database error when deleting shopper: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
    end if
end if
%>
