

<% 
    REM -- For intranets not connected to the internet, override default
    REM    download location here.  For example:
    '  If LCase(CStr(Request("HTTP_UA_CPU"))) <> "alpha" Then
    '     strMSWltIEDwnldLoc  = "/" & siteRoot & "/manager/MSCS_Images/controls/MSWallet.cab"
    '  Else
    '     strMSWltIEDwnldLoc  = "/" & siteRoot & "/manager/MSCS_Images/controls/MSWltAlp.cab"
    '  End If
    '  strMSWltNavDwnldLoc = "/" & siteRoot & "/manager/MSCS_Images/controls"

    REM -- Set wallet control accept credit card types.
    strMSWltAcceptedTypes = "visa:clear;mastercard:clear;amex:clear;discover:clear;"

    REM -- use_form set to 1 as a Request parameter will force the downlevel page
%>
<!--#INCLUDE FILE="i_selector.asp" -->
