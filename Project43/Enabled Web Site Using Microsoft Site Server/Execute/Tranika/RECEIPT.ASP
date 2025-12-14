<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>












<!--#INCLUDE FILE="i_shop.asp" -->
<!--#INCLUDE FILE="i_util.asp" -->


<%
REM -- Create a storage object for the receipts
Set mscsReceiptStorage = UtilGetReceiptStorage()

REM -- retrieve receipt from storage using the shopper id and order id:
dim key(1), value(1)
key(0) = "order_id"
key(1) = "shopper_id"
value(0) = Request("order_id")
value(1) = mscsShopperID
on error resume next
set receipt = mscsReceiptStorage.LookupData(null, key, value)
on error goto 0
if IsEmpty(receipt) then
    items = null
    nitems = 0
else
    set items = receipt.items
    nitems = items.Count
end if
%>

<HTML>
<HEAD>
    <TITLE><%= displayName %>: Receipt: <% = Request("order_id") %></TITLE>
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

<% if nitems <> 0 then %>
<TABLE BORDER="0" CELLPADDING="2" CELLSPACING="1">
    <TR>
        <TH BGCOLOR="#000000" VALIGN="TOP" COLSPAN="9">
            <FONT SIZE="4" COLOR="#FFFFFF"><B> Receipt # <% = Request("order_id") %> </B></FONT>
        </TH>
    </TR>
    <% REM ship to & bill to:  %>
    <TR>
        <TH BGCOLOR="#000000" VALIGN="TOP">
            <FONT SIZE="2" COLOR="#FFFFFF"><B> Ship To: </B></FONT>
        </TH>
        <TD VALIGN="TOP">
            <% = mscsPage.HTMLEncode(receipt.ship_to_name) %> <BR>
        
            <% = mscsPage.HTMLEncode(receipt.ship_to_address1) %> <BR>
            <% = mscsPage.HTMLEncode(receipt.ship_to_address2) %>,
            <% = mscsPage.HTMLEncode(receipt.ship_to_address3) %>&nbsp
            <% = mscsPage.HTMLEncode(receipt.ship_to_address4) %>
        
        </TD>
        <TH BGCOLOR="#000000" VALIGN="TOP">
            <FONT SIZE="2" COLOR="#FFFFFF"><B> Bill To: </B></FONT>
        </TH>
        <TD VALIGN="TOP" COLSPAN="2">
            <% = mscsPage.HTMLEncode(receipt.bill_to_name) %> <BR>
        
            <% = mscsPage.HTMLEncode(receipt.bill_to_address1) %> <BR>
            <% = mscsPage.HTMLEncode(receipt.bill_to_address2) %>,
            <% = mscsPage.HTMLEncode(receipt.bill_to_address3) %>&nbsp
            <% = mscsPage.HTMLEncode(receipt.bill_to_address4) %>
        
        </TD>
        <TH BGCOLOR="#000000" VALIGN="TOP">
            <FONT SIZE="2" COLOR="#FFFFFF"><B> Date: </B></FONT>
        </TH>
        <TD VALIGN="TOP">
            <% = MSCSDataFunctions.Date(receipt.date_entered) %>
        </TD>
    </TR>
    <% REM item column labels:  %>
    <TR>
        <TH BGCOLOR="#000000" ALIGN="LEFT">
            <FONT COLOR="#FFFFFF">Label</FONT>
        </TH>
        <TH BGCOLOR="#000000" ALIGN="LEFT">
            <FONT COLOR="#FFFFFF">Name</FONT>
        </TH>
        
        <TH BGCOLOR="#000000" ALIGN="LEFT">
            <FONT COLOR="#FFFFFF">Attributes</FONT>
        </TH>
        
        <TH BGCOLOR="#000000" ALIGN="CENTER">
            <FONT COLOR="#FFFFFF">Unit Price</FONT>
        </TH>
        <TH BGCOLOR="#000000" ALIGN="CENTER">
            <FONT COLOR="#FFFFFF">Today's Price</FONT>
        </TH>
        <TH BGCOLOR="#000000" ALIGN="LEFT">
            <FONT COLOR="#FFFFFF">Qty</FONT>
        </TH>
        
        <TH BGCOLOR="#000000" ALIGN="CENTER">
            <FONT COLOR="#FFFFFF">Total Price</FONT>
        </TH>
    </TR>
    <% REM row values:  %>
    <% for each row_item in items %>
    <TR>
        <TD WIDTH="75" VALIGN="TOP">
            <% = mscsPage.HTMLEncode(row_item.[_product_pf_id]) %>
        </TD>
        <TD WIDTH="210" VALIGN="TOP">
            <% = mscsPage.HTMLEncode(row_item.[_product_name]) %>
        </TD>
        
        <TD VALIGN="TOP">
            
                <%= mscsPage.HTMLEncode(row_item.door_value) %>
                
                , &nbsp;<%= mscsPage.HTMLEncode(row_item.toilet_value) %>
                
                , &nbsp;<%= mscsPage.HTMLEncode(row_item.floor_value) %>
                
        </TD> 
        
        <TD WIDTH="60" VALIGN="TOP" ALIGN="RIGHT">
            <% = MSCSDataFunctions.Money(row_item.[_product_list_price]) %>
        </TD>
        <TD WIDTH="60" VALIGN="TOP" ALIGN="RIGHT">
            <% = MSCSDataFunctions.Money(row_item.[_iadjust_currentprice]) %>
        </TD>
        <TD WIDTH="30" VALIGN="TOP" ALIGN="CENTER">
            <% = row_item.quantity %>
        </TD>
        
        <TD WIDTH="60" VALIGN="TOP" ALIGN="RIGHT">
            <% = MSCSDataFunctions.Money(row_item.[_oadjust_adjustedprice]) %>
        </TD>
    </TR>
    <% next %>
    
    <% REM divider:  %>
    <TR>
        <TH BGCOLOR="#000000" COLSPAN=8 HEIGHT=2></TH>
    </TR>
    <% REM show subtotal:  %>
    <TR>
        <TD COLSPAN="5"></TD>
        <TH BGCOLOR="#000000" VALIGN="TOP" ALIGN="RIGHT">
            <FONT COLOR="#FFFFFF"><B>Subtotal:</B></FONT>
        </TH>
        <TD VALIGN="TOP" ALIGN="RIGHT">
            <B><% = MSCSDataFunctions.Money(receipt.[_oadjust_subtotal]) %></B>
        </TD>
    </TR>
    <% REM show shipping:  %>
    <TR>
        <TD COLSPAN="5"></TD>
        <TH BGCOLOR="#000000" VALIGN="TOP" ALIGN="RIGHT">
            <FONT COLOR="#FFFFFF"><B>Shipping:</B></FONT>
        </TH>
        <TD VALIGN="TOP" ALIGN="RIGHT">
            <B><% = MSCSDataFunctions.Money(receipt.[_shipping_total]) %></B>
        </TD>
    </TR>
    
    <% REM show tax:  %>
    <TR>
        <TD COLSPAN="5"></TD>
        <TH BGCOLOR="#000000" VALIGN="TOP" ALIGN="RIGHT">
            <FONT COLOR="#FFFFFF"><B>Tax:</B></FONT>
        </TH>
        <TD VALIGN="TOP" ALIGN="RIGHT">
            <B><% = MSCSDataFunctions.Money(receipt.[_tax_total]) %></B>
        </TD>
    </TR>
    <% REM divider:  %>
    <TR>
        <TD COLSPAN="5"></TD>
        <TD BGCOLOR="#000000" COLSPAN="3" HEIGHT="4"></TD>
    </TR>
    <% REM show total:  %>
    <TR>
        <TD COLSPAN=5></TD>
        <TH BGCOLOR="#000000" VALIGN="TOP" ALIGN="RIGHT">
            <FONT COLOR="#FFFFFF"><B>Total:</B></FONT>
        </TH>
        <TD VALIGN=TOP ALIGN=RIGHT>
            <B><% = MSCSDataFunctions.Money(receipt.[_total_total]) %></B>
        </TD>
    </TR>
    <% REM divider:  %>
    <TR>
        <TD COLSPAN="8" HEIGHT="2"></TD>
    </TR>
</TABLE>
<% else %>
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="8">
        <TR>
            <TD>
                <STRONG>Receipt # <% = Request("order_id") %>&nbsp;not found.</STRONG>
            </TD>
        </TR>
    </TABLE>
<% end if %>
<!--#INCLUDE FILE="i_footer.asp" -->
</BODY>
</HTML>
