










<%
Set errorList = Server.CreateObject("Commerce.SimpleList")
On Error Resume Next
if Request("Validate").count <> 0 then

    cmdTemp.CommandText = Replace("SELECT dept_id, dept_name, dept_description , dept_map , dept_zone FROM tranika_dept WHERE dept_id = ?", "?", Request("dept_id"))
    Set rsExe = Server.CreateObject("ADODB.Recordset")
    rsExe.Open cmdTemp, , adOpenStatic, adLockOptimistic

    dept_id = mscsPage.RequestNumber("dept_id", "", 1, 20000)
    if IsNull(dept_id) then
        errorList.Add "dept_id must be between 1 and 20000"
    end if
    dept_name = mscsPage.RequestString("dept_name", "", 1, 255)
    if IsNull(dept_name) then
        errorList.Add "dept_name must be between 1 and 255 characters"
    else
        rsExe.Update "dept_name", dept_name
    end if
    dept_description = mscsPage.RequestString("dept_description", "", 0, 255)
    if IsNull(dept_description) then
        errorList.Add " dept_description must be less than or equal to 255 characters"
    else
        if dept_description = "" then dept_description = " "
        rsExe.Update "dept_description", dept_description
    end if
	dept_map = mscsPage.RequestString("dept_map", "", 1, 255)
    if IsNull(dept_map) then
        errorList.Add " dept_map must be between 1 and 255 characters"
    else
        rsExe.Update "dept_map", dept_map
    end if
    	dept_zone = mscsPage.RequestString("dept_zone", "", 1, 255)
    if IsNull(dept_zone) then
        errorList.Add " dept_zone must be between 1 and 255 characters"
    else
        rsExe.Update "dept_zone", dept_zone
    end if

    If errorList.Count = 0 Then
        if Err.Number = 0 then
			'ReloadSite
            Response.Redirect "dept_list.asp"
        else
            errorList.Add "Database error when updating department: " & Err.Number & " (0x" & Hex(Err.Number) & ")<BLOCKQUOTE>" & Err.Description  & "</BLOCKQUOTE>"
        end if
    end if
    On Error Goto 0
end if
%>
