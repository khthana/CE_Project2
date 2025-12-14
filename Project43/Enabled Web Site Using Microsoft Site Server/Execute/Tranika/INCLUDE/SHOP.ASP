<% REM ######################################################################### %>
<% REM                                                                           %>
<% REM   SHOP.ASP                                                                %>
<% REM   Microsoft Commerce Server v3.00                                         %>
<% REM                                                                           %>
<% REM   Copyright (c) 1996-98 Microsoft Corporation.  All rights reserved.      %>
<% REM                                                                           %>
<% REM ######################################################################### %>

<% REM This file gets included by all Commerce Server pages %>

<% 
function this_page(nowat) 
    this_page = ( Right(Request.ServerVariables("SCRIPT_NAME"),len(nowat)) = nowat)
end function
%>

<%
REM -- ADO command types
adCmdText       = 1 
adCmdTable      = 2 
adCmdStoredProc = 4
adCmdUnknown    = 8

REM -- ADO cursor types
adOpenForwardOnly = 0
adOpenKeyset      = 1
adOpenDynamic     = 2
adOpenStatic      = 3

REM -- ADO lock types
adLockReadOnly        = 1
adLockPessimistic     = 2
adLockOptimistic      = 3
adLockBatchOptimistic = 4

REM page constants
color_text  = "#51392B"
color_link  = "#cc9966"
color_alink = "#00FF00"
color_vlink = "#FF0000"
BGCOLOR= "#DDFFDD"
background = "assets/images/background.gif"

    
REM -- Set up objects for easy reference on the page

Set MSCSQueryMap         = Application("MSCSQueryMap")
Set MSCSShopperManager   = Application("MSCSShopperManager")
Set MSCSDataFunctions    = Application("MSCSDataFunctions")
Set MSCSSite             = Application("MSCSSite")
Set MSCSMessageManager   = Application("MSCSMessageManager")

REM -- If store is not open then redirect to closed URL
if MSCSSite.Status <> "Open" then
    response.redirect(MSCSSite.CloseRedirectURL)
end if

REM -- mscs because it is created on the page rather than in global.asa
Set mscsPage   = Server.CreateObject("Commerce.Page")

REM -- Manually create shopper id
mscsShopperID = mscsPage.GetShopperId
if IsNull(mscsShopperID) then
    if Not this_page("default.asp") and Not this_page("welcome_lookup.asp") and Not this_page("welcome_new.asp") and not this_page("xt_shopper_lookup.asp") and not this_page("xt_shopper_new.asp") then
        Response.Redirect(mscsPage.URL("default.asp"))          
    end if
end if

REM -- Create ADO Connection and Command Objects
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open MSCSSite.DefaultConnectionString
Set cmdTemp = Server.CreateObject("ADODB.Command")
cmdTemp.CommandType = adCmdText
Set cmdTemp.ActiveConnection = conn
%>


