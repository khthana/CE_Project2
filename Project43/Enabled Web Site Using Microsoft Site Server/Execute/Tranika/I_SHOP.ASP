

<%
function this_page(nowat) 
    this_page = ( Right(Request.ServerVariables("SCRIPT_NAME"),len(nowat)) = nowat)
end function

REM -- ADO command types
adCmdText       = 1 
adCmdTable      = 2 
adCmdStoredProc = 4
adCmdUnknown    = 8

REM -- ADO cursor types
adOpenForwardOnly = 0 '# (Default)
adOpenKeyset      = 1
adOpenDynamic     = 2
adOpenStatic      = 3

REM -- ADO lock types
adLockReadOnly        = 1
adLockPessimistic     = 2
adLockOptimistic      = 3
adLockBatchOptimistic = 4

REM -- Used to check ADO Supports for Oracle
adApproxPosition = 16384

REM -- If store is not open then redirect to closed URL
if MSCSSite.Status <> "Open" then
	response.redirect(MSCSSite.CloseRedirectURL)
end if

REM -- mscs = created on the page; MSCS = created in global.asa
set mscsPage = Server.CreateObject("Commerce.Page")

REM -- Manually create shopper id
mscsShopperID = mscsPage.GetShopperId



REM ******************************************************
REM -- functions for faster page links

function pageURL(pageName)
    pageURL = rootURL & pageName & "?" & emptyArgs
end function

function pageSURL(pageName)
    pageSURL = rootSURL & pageName & "?" & emptyArgs
end function

function baseURL(pageName)
    REM -- you must put on your own shopperArgs
    baseURL = rootURL & pageName & "?"
end function

function baseSURL(pageName)
    REM -- you must put on your own shopperArgs
    baseSURL = rootSURL & pageName & "?"
end function

displayName = MSCSSite.DisplayName
siteRoot    = mscsPage.SiteRoot()
rootURL     = mscsPage.URLPrefix() & "/" & siteRoot & "/"
rootSURL    = mscsPage.SURLPrefix() & "/" & siteRoot & "/"
emptyArgs   = mscsPage.URLShopperArgs()

REM ******************************************************

REM -- Create ADO Connection and Command Objects
Set MSCS = Server.CreateObject("ADODB.Connection")
MSCS.Open MSCSSite.DefaultConnectionString
Set cmdTemp = Server.CreateObject("ADODB.Command")
cmdTemp.CommandType = adCmdText
Set cmdTemp.ActiveConnection = MSCS
%>
