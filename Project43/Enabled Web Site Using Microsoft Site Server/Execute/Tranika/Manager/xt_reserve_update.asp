
<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Validate").count <> 0 then
	shopper_id = Requset("shopper_id")
	Response.Write shopper_id

    cmdTemp.CommandText = Replace("SELECT status FROM tranika_reserve WHERE shopper_id = ?", "?", Request("shopper_id"))
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic

    status = mscsPage.RequestString("status", "", 1, 255)
    if IsNull(status) then
        errorList.Add " status must be between 1 and 255 characters"
    else
        rsExe.Update "status", status
    end if

'    If errorList.Count = 0 Then
'        if Err.Number = 0 then
			'ReloadSite
 '           Response.Redirect "reserve_edit.asp"
'        else
'            errorList.Add "Database error when updating department: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
'        end if
'    end if
'    On Error Goto 0
end if
%>
