<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>












<% Response.ExpiresAbsolute=DateAdd("yyyy", -10, Date) %>

<!--#INCLUDE FILE="i_shop.asp" -->
<!--#INCLUDE FILE="i_util.asp" -->



<%
REM Run the basic plan
Set mscsOrderForm = UtilRunPlan()

set mscsOrderItems = mscsOrderForm.Items
nOrderItems = mscsOrderItems.Count

set mscsBasketErrors = mscsOrderForm.[_Basket_Errors]
nBasketErrors = mscsBasketErrors.Count

strDownlevelURL = pageSURL("shipping.asp")
%>

<HTML>

<HEAD>
    <TITLE><%= displayName %>: Shipping</TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
    <% fMSWltAddressSelector = True %>
    <!--#INCLUDE FILE="i_mswallet.asp" -->
    <% if fMSWltUplevelBrowser and CBool(nOrderItems > 0) then %>
        <SCRIPT LANGUAGE="Javascript">
        <!--
            function submitShipToAddr()
            {

                if (MSWltPrepareForm(document.shipinfo, 10, "ship_to_address1", "ship_to_street", "ship_to_address2", "ship_to_city", "ship_to_address3", "ship_to_state", "ship_to_address4", "ship_to_zip")) {

                    document.shipinfo.submit();
                }
            }
        // -->
        </SCRIPT>
    <% end if %>
</HEAD>

<BODY
    BGCOLOR="#FFFFFF"
    TEXT=   "#000000"
    LINK=   "#FF0000"
    VLINK=  "#FF0000"
    ALINK=  "#FF0000"
    <% if fMSWltUplevelBrowser and CBool(nOrderItems > 0) then 
        %>onLoad="<% = MSWltLoadDone(strDownlevelURL) %>"<% 
    end if %>
>



<!--#INCLUDE FILE="i_header.asp" -->

<H1>Shipping</H1>

<% if Request("error").Count <> 0 then %>
<TABLE WIDTH="500">
    <TR><TD><FONT COLOR="#FF0000"><STRONG>Quantity must be a number less than 999.</STRONG></FONT></TD></TR>
</TABLE>
<P>
&nbsp;
<P>
<% end if %>
<% if nOrderItems = 0 then %>
    <BLOCKQUOTE>
        <STRONG>Your&nbsp;basket&nbsp;is&nbsp;empty.</STRONG>
    </BLOCKQUOTE>
<% else %>
    <% if nBasketErrors > 0 then %>
    <TABLE WIDTH="500">
        <% for iError = 0 to nBasketErrors - 1 %>
        <TR><TD><FONT COLOR="#FF0000"><STRONG><%= mscsPage.HTMLEncode(mscsBasketErrors(iError)) %></STRONG></FONT></TD></TR>
        <% next %>
    </TABLE>
    <P>
    &nbsp;
    <P>
    <% end if %>

    <% if fMSWltUplevelBrowser then %>
        <TABLE >
        <TR>
        
        <TD VALIGN="TOP">Shipping Method:</TD>
        
        <TD>
        <FORM NAME="shipinfo" METHOD="POST" ACTION="<%= pageSURL("xt_orderform_prepare.asp") %>">
            <INPUT TYPE="HIDDEN" NAME="use_form" VALUE="0">
            <INPUT TYPE="HIDDEN" NAME="ship_to_name">
            
            <INPUT TYPE="HIDDEN" NAME="ship_to_address1">
            <INPUT TYPE="HIDDEN" NAME="ship_to_address2">
            <INPUT TYPE="HIDDEN" NAME="ship_to_address3">
            <INPUT TYPE="HIDDEN" NAME="ship_to_address4">
            
            <INPUT TYPE="HIDDEN" NAME="ship_to_country">
            <INPUT TYPE="HIDDEN" NAME="ship_to_phone">
            <INPUT TYPE="HIDDEN" NAME="ship_to_email">
            
            <SELECT NAME="shipping_method">
            
                <%= mscsPage.Option("shipping_method_1", mscsOrderForm.shipping_method) %> Overnight&nbsp;&nbsp;
            
            
                <%= mscsPage.Option("shipping_method_2", mscsOrderForm.shipping_method) %> 2nd Day&nbsp;&nbsp;
            
            
            </SELECT>
            
        </FORM>
        </TD>
        </TR>

        <TR>
        
        <TD VALIGN="TOP">Ship-To Address:</TD>
        
        <TD VALIGN="TOP" ALIGN="CENTER">
        <% if fMSWltActiveXBrowser then %>
            <OBJECT
                ID="addrSelector"
                CLASSID="<% = MSWltIEAddrSelectorClassid() %>"
                CODEBASE="<% = MSWltIECodebase() %>"
                HEIGHT="123"
                WIDTH="154"
            >
            </OBJECT>
        <% elseif fMSWltLiveConnectBrowser then %>
            <EMBED
                NAME="addrSelector"
				TYPE="application/x-msaddr"
                PLUGINSPAGE="<%= MSWltNavDwnldURL("plginst.htm") %>"
                VERSION="<%= strMSWltDwnldVer %>"
                HEIGHT="123"
                WIDTH="154"
            >
        <% end if %>
        </TD>
        </TR>
        
        <TR>
        
        <TD>&nbsp;</TD>
        
        <TD VALIGN="TOP" ALIGN="CENTER">
        <FORM> 
            <INPUT TYPE="BUTTON"
                    VALUE="Total"
                    onClick="submitShipToAddr()"
                    SRC="<%= "/" & siteRoot %>/manager/MSCS_Images/buttons/btntotal1.gif"
                    WIDTH="116"
                    HEIGHT="25"
                    BORDER="0"
                    ALT="Total">
        </FORM> 
        </TD>
        </TR>
        <TR>
        <TD VALIGN="TOP" ALIGN="CENTER" COLSPAN=2>
            <%= MSWltLastChanceText(strDownlevelURL) %>
        </TD>
        </TR>
        </TABLE>

    <% else %>
    <TABLE WIDTH="500">
        <TR>
            <TD>    
                If you need to change any items, please go to the 
                <A HREF="<%= pageSURL("basket.asp") %>">shopping basket</A> to correct them.
                <P>
                If the order is correct, then please fill out the shipping
                instructions below and press the "Total" button.  This will
                show you what your total cost (including tax and shipping) 
                will be.  If the total is satisfactory, then you'll be able 
                to complete the purchase.
            </TD>    
        </TR>
    </TABLE>
    
    <P>
    
    <FORM METHOD="POST" ACTION="<%= pageSURL("xt_orderform_prepare.asp") %>">

    <INPUT TYPE="HIDDEN" NAME="use_form" VALUE="1">
    <INPUT TYPE="HIDDEN" NAME="ship_to_country" VALUE="THA">
    

    <P>
    
    <TABLE BORDER="0" COLS="4" WIDTH="550">
        
        <% REM shipping methods:  %>

        <TR>
            <TD WIDTH="80"></TD>
            <TD ALIGN="CENTER" COLSPAN="3">
                <FONT SIZE="+1"><STRONG>Shipping Method</STRONG></FONT>
            </TD>
        </TR>

        <TR>
            <TD></TD>
            <TD ALIGN="CENTER" COLSPAN="3">
                <SELECT NAME="shipping_method">
                
                    <%= mscsPage.Option("shipping_method_1", mscsOrderForm.shipping_method) %> Overnight&nbsp;&nbsp;
                
                
                    <%= mscsPage.Option("shipping_method_2", mscsOrderForm.shipping_method) %> 2nd Day&nbsp;&nbsp;
                
                
                </SELECT>
            </TD>
        </TR>

        <TR>
            <TD>
                &nbsp;
            </TD>
        </TR>
        

        <% REM ship-to:  %>
        <TR>
            <TD></TD>
            <TD ALIGN="CENTER" COLSPAN="3">
                <FONT SIZE="+1"><STRONG>Shipping Address</STRONG></FONT>
            </TD>
        </TR>
        <TR>
            <TD ALIGN="RIGHT">
                <B>Name:</B>
            </TD>
            <TD COLSPAN="3">
                <INPUT TYPE="text" 
                       NAME="ship_to_name" 
                       SIZE="54,1"
                       VALUE="<%= mscsPage.HTMLEncode(mscsOrderForm.ship_to_name) %>">
            </TD>
        </TR>

        
        <TR>
            <TD ALIGN="RIGHT">
                <B>Address 1:</B>
            </TD>
            <TD COLSPAN="3">
                <INPUT TYPE="text" 
                       NAME="ship_to_address1" 
                       SIZE="54,1"
                       VALUE="<%= mscsPage.HTMLEncode(mscsOrderForm.ship_to_address1) %>">
            </TD>
        </TR>
        <TR>
            <TD ALIGN="RIGHT">
                <B>Address 2:</B>
            </TD>
            <TD COLSPAN="3">
                <INPUT TYPE="text" 
                       NAME="ship_to_address2" 
                       SIZE="54,1"
                       VALUE="<%= mscsPage.HTMLEncode(mscsOrderForm.ship_to_address2) %>">
            </TD>
        </TR>
        <TR>
            <TD ALIGN="RIGHT">
                <B>Address 3:</B>
            </TD>
            <TD COLSPAN="3">
                <INPUT TYPE="text" 
                       NAME="ship_to_address3" 
                       SIZE="54,1"
                       VALUE="<%= mscsPage.HTMLEncode(mscsOrderForm.ship_to_address3) %>">
            </TD>
        </TR>
        <TR>
            <TD ALIGN="RIGHT">
                <B>Address 4:</B>
            </TD>
            <TD COLSPAN="3">
                <INPUT TYPE="text" 
                       NAME="ship_to_address4" 
                       SIZE="54,1"
                       VALUE="<%= mscsPage.HTMLEncode(mscsOrderForm.ship_to_address4) %>">
            </TD>
        </TR>
        

        <TR>
            <TD ALIGN="RIGHT">
                <B>Phone:</B>
            </TD>
            <TD COLSPAN="3">
                <INPUT TYPE="text" 
                       NAME="ship_to_phone" 
                       SIZE="54,1"
                       VALUE="<%= mscsPage.HTMLEncode(mscsOrderForm.ship_to_phone) %>">
            </TD>
        </TR>

        <TR>
            <TD COLSPAN="4">
                &nbsp;
            </TD>
        </TR>

        <TR>
            <TD></TD>
            <TD ALIGN="CENTER">
                <INPUT TYPE="Image" 
                       VALUE="Total" 
                       SRC="<%= "/" & siteRoot %>/manager/MSCS_Images/buttons/btntotal1.gif" 
                       WIDTH="116" 
                       HEIGHT="25" 
                       BORDER="0" 
                       ALT="Total">
            </TD>
            <TD ALIGN="CENTER" COLSPAN="2">
                <INPUT TYPE="reset" 
                       VALUE="Reset">
            </TD>
        </TR>
    </TABLE>
    </FORM>
    <% end if %>
<% end if %>

<!--#INCLUDE FILE="i_footer.asp" -->

</BODY>

</HTML>
