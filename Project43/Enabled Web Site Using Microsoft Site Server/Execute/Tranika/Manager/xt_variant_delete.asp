











<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Validate").count <> 0 then
    cmdTemp.CommandText = Replace("DELETE FROM tranika_variant WHERE sku = ?", "?", "'" & Replace(Request("sku"),"'","''") & "'")
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic

    if Err.Number = 0 then
        Response.Redirect "product_edit.asp?" & mscsPage.URLArgs("pf_id", Request.Form("pf_id"))
    else
        errorList.Add "Database error when deleting product variant: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
    end if
end if
%>
