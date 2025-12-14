
<% Response.ExpiresAbsolute=DateAdd("yyyy", -10, Date) %>

<%
    REM This file gets included by all Commerce Server pages

    Set mscsPage            = Server.CreateObject("Commerce.Page")

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

    REM -- Database Error numbers for trapping:
    const FORIEGN_KEY_CONSTRAINT = -2147217873
    const PRIMARY_KEY_CONSTRAINT = -2147217900
    const UNIQUE_CONSTRAINT      = -2147217887

    REM -- Read Manager Dictionary
    Set fileDocument = Server.CreateObject("Commerce.FileDocument")
    
    managerCSC = Server.MapPath("/" & mscsPage.SiteRoot & "/manager/config/site.csc")
    set mscsManagerSite = fileDocument.ReadFromFile(managerCSC, "IISProperties")

    function cycleADOConnection()
	    Set cmdTemp = Nothing
	    MSCS.Close
        MSCS.ConnectionTimeout = 15
        MSCS.CommandTimeout = 30
	    MSCS.Open mscsManagerSite.DefaultConnectionString

	    Set cmdTemp = Server.CreateObject("ADODB.Command")
	    cmdTemp.CommandType = adCmdText
	    Set cmdTemp.ActiveConnection = MSCS
	    Set cycleADOConnection = cmdTemp
    end function

    REM  setup ADO connection
    Set MSCS = Server.CreateObject("ADODB.Connection")
    MSCS.ConnectionTimeout = 15
    MSCS.CommandTimeout = 30
    MSCS.Open mscsManagerSite.DefaultConnectionString

    Set cmdTemp = Server.CreateObject("ADODB.Command")
    cmdTemp.CommandType = adCmdText
    Set cmdTemp.ActiveConnection = MSCS
%>
<!--#INCLUDE FILE="site_util.asp" -->