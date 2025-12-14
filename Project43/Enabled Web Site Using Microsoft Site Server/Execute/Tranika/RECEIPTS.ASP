<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>










<% Response.ExpiresAbsolute=DateAdd("yyyy", -10, Date) %>

<!--#INCLUDE FILE="i_shop.asp" -->
<!--#INCLUDE FILE="i_util.asp" -->

<HTML>
<HEAD>
    <TITLE><%= displayName %>: Order History</TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
</HEAD>
<BODY
    BGCOLOR="#FFFFFF"
    TEXT=   "#000000"
    LINK=   "#FF0000"
    VLINK=  "#FF0000"
    ALINK=  "#FF0000"
>

<!--#INCLUDE FILE="i_header.asp" -->

<%

REM Create a Storage object for the shopper information
Set mscsShopperStorage = UtilGetShopperStorage()

REM Get the shopper from the shopper storage
set mscsShopper = UtilGetShopper(mscsShopperStorage)

sqlText = Replace(MSCSQueryMap.receipts_for_shopper.SQLCommand,":1","'" & mscsShopperID & "'")
Set rsReceipts = MSCS.Execute (sqlText, nReceipts, adCmdText)
%>
<TABLE WIDTH="400"
    BORDER=     "0"
    CELLPADDING="2"
    CELLSPACING="2"
>
    <TR>
        <TD COLSPAN="3" ALIGN="CENTER" BGCOLOR="#000000">
            <FONT COLOR="#FFFFFF" SIZE="5">
                Order History
                
                    for '<% = mscsPage.HTMLEncode(mscsShopper.name) %>'
                
            </FONT>
        </TD>
    </TR>
    <TR>
        <TH BGCOLOR="#000000"><FONT COLOR="#FFFFFF">Order #</FONT></TH>
        <TH BGCOLOR="#000000"><FONT COLOR="#FFFFFF">Date</FONT></TH>
        <TH BGCOLOR="#000000"><FONT COLOR="#FFFFFF">Amount</FONT></TH>
    </TR>
    <%
    if Not rsReceipts.EOF then
        set order_idField = rsReceipts("order_id")
        set date_enteredField = rsReceipts("date_entered")
        set totalField = rsReceipts("total")
        do while Not rsReceipts.EOF
            %>
            <TR>
                <TD WIDTH="100" VALIGN="TOP" ALIGN="CENTER"> 
                    <A HREF="<% = baseURL("receipt.asp") & mscsPage.URLShopperArgs("order_id", order_idField.value) %>"> <% = mscsPage.HTMLEncode(order_idField.value) %> </A> 
                </TD>
                <TD WIDTH="100" VALIGN="TOP" ALIGN="CENTER"> 
                    <% = MSCSDataFunctions.Date(date_enteredField.value) %> 
                </TD>
                <TD WIDTH="100" VALIGN="TOP" ALIGN="RIGHT"> 
                    <% = MSCSDataFunctions.Money(totalField.value) %> 
                </TD>
            </TR>   
            <% rsReceipts.MoveNext
        loop
        rsReceipts.Close
        %>

    <% else %>
    <TR>
        <TD COLSPAN="3">
        No&nbsp;receipts&nbsp;found.
        </TD>
    </TR>
    <% end if %>
</TABLE>
<!--#INCLUDE FILE="i_footer.asp" -->
</BODY>
</HTML>
