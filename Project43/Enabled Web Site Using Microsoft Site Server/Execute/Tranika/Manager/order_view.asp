<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>





<!--#INCLUDE FILE="include/Manager.asp" -->



<% REM -- page vars:  %>
<% pageTitle = "Order '" & Request("order_id") & "'" %>

<% REM -- header:  %>
<HTML>
<HEAD>
    <TITLE> <% = pageTitle %> </TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=TIS-620">
    <!--#INCLUDE FILE="include/mgmt_define.asp" -->
</HEAD>

<BODY TOPMARGIN="8" LEFTMARGIN="8" BGCOLOR="<% = Application("bgcolor") %>" TEXT="#000000" LINK="#FF0000" ALINK="#FF0000" VLINK="#FF0000">
<!--#INCLUDE FILE="include/mgmt_header.asp" -->

<% REM -- body:  %>
<%
REM -- Create a storage object for the receipts
Set  mscsReceiptStorage = Server.CreateObject("Commerce.DBStorage")
Call mscsReceiptStorage.InitStorage(mscsManagerSite.DefaultConnectionString, "tranika_receipt", "order_id", "Commerce.OrderForm", "marshalled_receipt", "date_entered")
mscsReceiptStorage.Mapping.Value("_total_total") = "total"


REM -- retrieve order form from storage:
on error resume next
set receipt = mscsReceiptStorage.GetData(null, Cstr(Request("order_id")))
on error goto 0
if IsEmpty(receipt) then
    nitems = 0
else
    set items = receipt.items
    nitems = items.Count
end if
%>

<% if nitems = 0 then %>
    Order Not Found!
<% else %>
<BR>
<TABLE>
    <TR>
        <% REM date:  %>
        <TD VALIGN="TOP">
            <B>Date:</B>
        </TD>
        <TD VALIGN="TOP">
            <% = MSCSDataFunctions.Date(receipt.date_entered) %>
        </TD>
    </TR>

    <TR>
        <% REM order status:  %>
        <TD VALIGN="TOP">
            <B>Status:</B>
        </TD>
        <TD VALIGN="TOP">
            <% = receipt.status %>
        </TD>
    </TR>

    <TR>
        <% REM bill to:  %>
        <TD VALIGN="TOP">
            <B>Bill To:</B>
        </TD>
        <TD VALIGN="TOP">
            <% = receipt.bill_to_name %>

            <BR>
            <% = receipt.bill_to_address1 %>
            <BR>
            <% = receipt.bill_to_address2 %>
            <BR>
            <% = receipt.bill_to_address3 %>
            <BR>
            <% = receipt.bill_to_address4 %>

            <BR>
            <% = receipt.bill_to_country %>
        </TD>
        
        <% REM col spacer:  %>
        <TD WIDTH="16"></TD>

        <% REM ship to:  %>
        <TD VALIGN="TOP">
            <B>Ship To:</B>
        </TD>
        <TD VALIGN="TOP">
            <% = receipt.ship_to_name %>

            <BR>
            <% = receipt.ship_to_address1 %>
            <BR>
            <% = receipt.ship_to_address2 %>
            <BR>
            <% = receipt.ship_to_address3 %>
            <BR>
            <% =receipt.ship_to_address4 %>

            <BR>
            <% = receipt.ship_to_country %>
        </TD>
    </TR>
</TABLE>

<% if nitems > 0 then %>
<BR>
<TABLE CELLPADDING="3" CELLSPACING="0" BORDER="0">
    <% REM column labels:  %>
    <TR>
        <TH VALIGN="BOTTOM" ALIGN="LEFT"   WIDTH="75">SKU</TH>
        <TH VALIGN="BOTTOM" ALIGN="LEFT"   WIDTH="180">Item</TH>


        <TH VALIGN="BOTTOM" ALIGN="CENTER" WIDTH=75>Door</TH>

        <TH VALIGN="BOTTOM" ALIGN="CENTER" WIDTH=75>Toilet</TH>

        <TH VALIGN="BOTTOM" ALIGN="CENTER" WIDTH=75>Floor</TH>


        <TH VALIGN="BOTTOM" ALIGN="CENTER" WIDTH="60">List Price</TH>
        <TH VALIGN="BOTTOM" ALIGN="CENTER" WIDTH="60">Today's Price</TH>
        <TH VALIGN="BOTTOM" ALIGN="CENTER" WIDTH="30">Qty</TH>
        <TH VALIGN="BOTTOM" ALIGN="CENTER" WIDTH="60">Extra Disc.</TH>
        <TH VALIGN="BOTTOM" ALIGN="CENTER" WIDTH="60">Total</TH>
    </TR>
    <TR> <TD COLSPAN="9" HEIGHT="1" BGCOLOR="#000000"></TD></TR>
    
    <% REM items:  %>
    <% for each row_items in items %>
        <TR>
            <TD ALIGN="LEFT"  > <% = mscsPage.HTMLEncode(row_items.sku) %></TD>
            <TD ALIGN="LEFT"  > <% = mscsPage.HTMLEncode(row_items.[_product_name]) %></TD> 


                <TD VALIGN="CENTER"><%= mscsPage.HTMLEncode(row_items.door_value) %></TD>

                <TD VALIGN="CENTER"><%= mscsPage.HTMLEncode(row_items.toilet_value) %></TD>

                <TD VALIGN="CENTER"><%= mscsPage.HTMLEncode(row_items.floor_value) %></TD>


            <TD ALIGN="RIGHT"> <% = MSCSDataFunctions.Money(row_items.[_product_list_price]) %></TD>
            <TD ALIGN="RIGHT"> <% = MSCSDataFunctions.Money(row_items.[_iadjust_currentprice]) %></TD>
            <TD ALIGN="CENTER"> <% = row_items.quantity %></TD>
            <TD ALIGN="RIGHT"> <% = MSCSDataFunctions.Money(row_items.[_oadjust_discount]) %></TD>
            <TD ALIGN="RIGHT"> <% = MSCSDataFunctions.Money(row_items.[_oadjust_adjustedprice]) %></TD>
        </TR>
    <% next %>
      
    <% REM divider:  %>
    <TR> <TD COLSPAN="9" HEIGHT="1" BGCOLOR="#000000"></TD></TR>

    <% REM show subtotal:  %>
    <TR>
        <TD COLSPAN="6"></TD>
        <TD COLSPAN="2" VALIGN="TOP" ALIGN="LEFT">
            Subtotal:
        </TD>
        <TD ALIGN=RIGHT>
            <% = MSCSDataFunctions.Money(receipt.[_oadjust_subtotal]) %>
        </TD>
    </TR>

    <% REM show shipping:  %>
    <TR>
        <TD COLSPAN="6"></TD>
        <TD COLSPAN="2" VALIGN="TOP" ALIGN="LEFT">
            Shipping:
        </TD>
        <TD ALIGN=RIGHT>
            <% = MSCSDataFunctions.Money(receipt.[_shipping_total]) %>
        </TD>
    </TR>

    <% REM show handling:  %>
    <TR>
        <TD COLSPAN="6"></TD>
        <TD COLSPAN="2" VALIGN="TOP" ALIGN="LEFT">
            Handling:
        </TD>
        <TD ALIGN=RIGHT>
            <% = MSCSDataFunctions.Money(receipt.[_handling_total]) %>
        </TD>
    </TR>

    <% REM show tax:  %>
    <TR>
        <TD COLSPAN="6"></TD>
        <TD COLSPAN="2" VALIGN="TOP" ALIGN="LEFT">
            Tax:
        </TD>
        <TD ALIGN=RIGHT>
            <% = MSCSDataFunctions.Money(receipt.[_tax_total]) %>
        </TD>
    </TR>

    <% REM divider:  %>
    <TR>
        <TD COLSPAN="6" HEIGHT="1"></TD>
        <TD COLSPAN="4" HEIGHT="1" BGCOLOR="#000000"></TD>
    </TR>

    <% REM show total:  %>
    <TR>
        <TD COLSPAN="6"></TD>
        <TD COLSPAN="2" VALIGN="TOP" ALIGN="LEFT">
            <B>Total:</B>
        </TD>
        <TD VALIGN="TOP" ALIGN="RIGHT">
            <B><% = MSCSDataFunctions.Money(receipt.[_total_total]) %></B>
        </TD>
    </TR>

</TABLE>
<% end if %>

<% end if %>

<% REM -- footer:  %>
<!--#INCLUDE FILE="include/mgmt_footer.asp" -->
