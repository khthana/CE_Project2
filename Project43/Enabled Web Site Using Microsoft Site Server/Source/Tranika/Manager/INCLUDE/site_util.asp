
<% 
'========================================================================
' ReportOnError
'
Sub ReportOnError(ByVal strErr)
    If Err.Number <> 0 Then
        %><H3><%= strErr %></H3><%
        %><BLOCKQUOTE><%= Replace(Err.Description, "~", vbCr + "<BR>&nbsp;&nbsp;") %><%
        %><%= Hex(Err.Number) %></BLOCKQUOTE>
        <%
        Response.End
    End If
End Sub


'========================================================================
' GetSiteObject
'
Function GetSiteObject
    On Error Resume Next 

    Set SiteObj = Server.CreateObject("Commerce.AdminSite")
    ReportOnError "Unable to create object.  Check Commerce installation."
    
    SiteObj.InitializeFromMDPath Request.ServerVariables("APPL_MD_PATH")
    Set GetSiteObject = SiteObj
End Function


'========================================================================
' OpenSite
'
Sub OpenSite
    On Error Resume Next 

    Dim SiteObj
    Set SiteObj = GetSiteObject
    SiteObj.Status = TRUE

    ReportOnError "Unable to open site."
End Sub


'========================================================================
' CloseSite
'
Sub CloseSite
    On Error Resume Next 

    Dim SiteObj
    Set SiteObj = GetSiteObject
    SiteObj.Status = FALSE

    ReportOnError "Unable to close site."
End Sub


'========================================================================
' ToggleSiteStatus
'
Sub ToggleSiteStatus
    On Error Resume Next 

    Dim SiteObj
    Set SiteObj = GetSiteObject
    SiteObj.Status = Not Siteobj.Status

    ReportOnError "Unable to change site status."
End Sub


'========================================================================
' GetStatus
'
Sub GetStatus(ByRef Status, ByRef RevStatus)
    On Error Resume Next

    Dim SiteObj
    Set SiteObj = GetSiteObject

    Status    = "Invalid"
    RevStatus = "Invalid"

    Dim IsOpen
    IsOpen = SiteObj.Status

    If Err.Number = 0 Then
        If IsOpen Then 
            Status    = "open"
            RevStatus = "Close"
        Else
            Status    = "close"
            RevStatus = "Open"
        End If
    End If
    Err.Clear
End Sub


'========================================================================
' ReloadSite
'
Sub ReloadSite
    On Error Resume Next 

    Dim SiteObj
    Set SiteObj = GetSiteObject
    SiteObj.Reload

    ReportOnError "Unable to reload site."
End Sub


'========================================================================
' GetPCFFiles
'
Function GetPCFFiles
    Dim AdminFiles
    Set AdminFiles = Server.CreateObject("Commerce.AdminFiles")

    Dim ConfigDir
    ConfigDir = Request.ServerVariables("APPL_PHYSICAL_PATH") + "\Config"

    GetPCFFiles = AdminFiles.GetFiles(ConfigDir + "\*.pcf")
End Function

%>
