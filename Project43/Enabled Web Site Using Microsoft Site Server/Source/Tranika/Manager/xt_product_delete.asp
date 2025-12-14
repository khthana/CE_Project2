











<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Validate").count <> 0 then

    
    cmdTemp.CommandText = Replace("DELETE FROM tranika_variant WHERE pf_id = ?", "?", "'" & Replace(Request("pf_id"),"'","''") & "'")
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic
    if Err.Number <> 0 then
        errorList.Add "Database error when deleting product variants for product: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
    end if
    err.Clear
    
    Set cmdTemp = cycleADOConnection()
    cmdTemp.CommandText = Replace("DELETE FROM tranika_dept_prod WHERE pf_id = ?", "?", "'" & Replace(Request("pf_id"),"'","''") & "'")
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic
    if Err.Number <> 0 then
        errorList.Add "Database error when deleting department links for product: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
    end if
    err.Clear

    Set cmdTemp = cycleADOConnection()
    cmdTemp.CommandText = Replace("DELETE FROM tranika_product WHERE pf_id = ?", "?", "'" & Replace(Request("pf_id"),"'","''") & "'")
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic
    if Err.Number <> 0 then
        errorList.Add "Database error when deleting product: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
    end if
    err.Clear

    if errorList.count = 0 then
        ReloadSite
        Response.Redirect "product_list.asp"
    end if
end if
%>
