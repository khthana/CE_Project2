<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>












<!--#INCLUDE FILE="i_shop.asp" -->
<!--#INCLUDE FILE="i_util.asp" -->

<%
function ShopperNew(byVal page, byVal shopper, byRef errorList, byRef labelList)

    
    REM -- validate password:
    shopper_password = page.RequestString("shopper_password", null, 1, 100)
    shopper_password2 = page.RequestString("shopper_password2", null, 1, 100)
    if IsNull(shopper_password) then
        errorList.Add "shopper_missingpassword"
    elseif IsNull(shopper_password2) then
        errorList.Add "shopper_missingpassword"
    elseif shopper_password <> shopper_password2 then
        errorList.Add "shopper_passwordsdifferent"
    end if
    shopper.password = shopper_password
    

    REM -- validate name, and address information:
    shopper_name = page.RequestString("shopper_name", null, 1, 100)
    if IsNull(shopper_name) then
        labelList.Add "name"
    end if

    
    shopper_address1 = page.RequestString("shopper_address1", null, 1, 100)
    if IsNull(shopper_address1) then
        labelList.Add "address1"
    end if

    shopper_address2 = page.RequestString("shopper_address2", null, 1, 100)
    if IsNull(shopper_address2) then
        labelList.Add "address2"
    end if

    shopper_address3 = page.RequestString("shopper_address3", "", 0, 100)
    if IsNull(shopper_address3) then
        labelList.Add "address3"
    end if

    shopper_address4 = page.RequestString("shopper_address4", "", 0, 100)
    if IsNull(shopper_address4) then
        labelList.Add "address4"
    end if
    

    shopper_country = page.RequestString("shopper_country", null, 1, 100)
    if IsNull(shopper_country) then
        genericRequired = TRUE
        labelList.Add "country"
    end if

    shopper_phone = page.RequestString("shopper_phone", null, 1, 100)
    if IsNull(shopper_phone) then
        labelList.Add "phone"
    end if

    shopper_email = page.RequestString("shopper_email", null, 1, 100)
    if IsNull(shopper_email) then
        labelList.Add "email"
    end if
    
    if labelList.Count <> 0 or errorList.Count <> 0 then
        ShopperNew = false
        exit function
    end if

    REM -- copy to shopper object:
    shopper.name    = shopper_name

    
    shopper.address1    = shopper_address1
    shopper.address2    = shopper_address2
    shopper.address3    = shopper_address3
    shopper.address4    = shopper_address4
    

    shopper.country = shopper_country

    shopper.phone   = shopper_phone
    shopper.email   = shopper_email

    ShopperNew = true
end function


REM -- set up error vars:
set errorList = Server.CreateObject("Commerce.SimpleList")
set labelList = Server.CreateObject("Commerce.SimpleList")
if Request("Validate").count > 0 then
    
    set mscsShopper = Server.CreateObject("Commerce.Dictionary")
    if ShopperNew(mscsPage, mscsShopper, errorList, labelList) then
        mscsShopperID = MSCSShopperManager.CreateShopperID()
        mscsShopper.shopper_id = mscsShopperID
        mscsShopper.date_created = Date

        REM Create a Storage object for the shopper information
        Set mscsShopperStorage = UtilGetShopperStorage()

        on error resume next
        call mscsShopperStorage.InsertData(null, mscsShopper)
        if Err.Number = 0 then
            call mscsPage.PutShopperId(mscsShopperID)
            
		    if Request("target") = "" then
			    Response.Redirect("default.asp?" & mscsPage.URLShopperArgs())
            else
            
			    Response.Redirect(Request("target") & "?" & mscsPage.URLShopperArgs("pf_id",Request("pf_id"),"dept_id",Request("dept_id"),"door_id",Request("door_id"),"toilet_id",Request("toilet_id"),"floor_id",Request("floor_id")))
            end if
            
        else
            if Err = &H80040E2F then
                REM -- key constraint violation:
                errorList.Add "duplicate_key"
            else
                errorList.Add "err_unknown"
            end if
        end if
    end if
end if

strDownlevelURL = baseSURL("shopper_new.asp") & mscsPage.URLShopperArgs("target", Request("target"), "pf_id", Request("pf_id"),"dept_id",Request("dept_id"), "door_id", Request("door_id"), "toilet_id", Request("toilet_id"), "floor_id", Request("floor_id"))
%>

<HTML>

<HEAD>
    <TITLE><%= displayName %>: New Shopper</TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
    <% fMSWltAddressSelector = True %>
    <!--#INCLUDE FILE="i_mswallet.asp" -->
    <% if fMSWltUplevelBrowser then %>
        <SCRIPT LANGUAGE="Javascript">
        <!--
            function submitShopperToAddr()
            {

                if (MSWltPrepareForm(document.shopper_new, 18, "shopper_name", "ship_to_name", "shopper_address1", "ship_to_street", "shopper_address2", "ship_to_city", "shopper_address3", "ship_to_state", "shopper_address4", "ship_to_zip", "shopper_country", "ship_to_country", "shopper_phone", "ship_to_phone", "shopper_email", "ship_to_email")) {

                    document.shopper_new.submit();
                }
            }
        // -->
        </SCRIPT>
    <% end if %>
</HEAD>

<BODY    BGCOLOR="<% = Application("BGCOLOR") %>"  TEXT=   "#000000" LINK=   "#FF0000" VLINK=  "#FF0000" ALINK=  "#FF0000"
    <% if fMSWltUplevelBrowser then  %>onLoad="<% = MSWltLoadDone(strDownlevelURL) %>"<% 
    end if %>>




<H1><%= displayName %>: New Shopper</H1>


<% if fMSWltUplevelBrowser then %>
    <FORM NAME="shopper_new" METHOD=POST ACTION="<%= pageSURL("shopper_new.asp") %>">
        <INPUT TYPE="HIDDEN" NAME="use_form" VALUE="0">
        <INPUT TYPE="HIDDEN" NAME="Validate" = "1">
        <INPUT TYPE="HIDDEN" NAME="shopper_name">
        <INPUT TYPE="HIDDEN" NAME="shopper_address1">
        <INPUT TYPE="HIDDEN" NAME="shopper_address2">
        <INPUT TYPE="HIDDEN" NAME="shopper_address3">
        <INPUT TYPE="HIDDEN" NAME="shopper_address4">
        <INPUT TYPE="HIDDEN" NAME="shopper_country">
        <INPUT TYPE="HIDDEN" NAME="shopper_phone">
        <INPUT TYPE="HIDDEN" NAME="shopper_email">
        <INPUT TYPE="HIDDEN" NAME="target" VALUE="<% = Request("target") %>">
	    <INPUT TYPE="HIDDEN" NAME="pf_id" VALUE="<% = Request("pf_id") %>">
        <INPUT TYPE="HIDDEN" NAME="dept_id" VALUE="<%= Request("dept_id") %>">
        <INPUT TYPE="HIDDEN" NAME="door_id" VALUE="<% = Request("door_id") %>">
        <INPUT TYPE="HIDDEN" NAME="toilet_id" VALUE="<% = Request("toilet_id") %>">
       <INPUT TYPE="HIDDEN" NAME="floor_id" VALUE="<% = Request("floor_id") %>">
            

        <TABLE BORDER="1">
            <% if errorList.Count = 0 and labelList.Count = 0 then %>
            <TR>
                <TD COLSPAN="2">Please enter the following information</TD>
            <% else %>
                <TD COLSPAN="2">
                    <FONT COLOR="#FF0000"><STRONG>
                    <%
                    for each errorLine in errorList
                        select case errorLine
                        case "shopper_passwordsdifferent" %>
                        You entered two different passwords. Please be sure to type the same password twice.<BR>
                        <% case "shopper_missingpassword" %>
                        You did not provide a password. Please be sure to provide a password.<BR>
                        <% case "duplicate_key" %>
                        A shopper with that email address is already registered with this store.<BR>Please specify a different email address.<BR>
                        <% case "err_unknown" %>
                        You could not be registered at this time because of a problem at the server.<BR>Please try again later.<BR>
                        <% end select
                    next
                    for each label in labelList %>
                        You must provide a value for <%= label %> between 1 and 100 characters long.<BR>
                    <% next %> 
                    </STRONG></FONT>
                </TD>
            </TR>
            <% end if %>

            <TR>
                <TD HEIGHT="4">&nbsp;</TD>
            </TR>

            <TR>
                <TH ALIGN="LEFT">Password:</TH>
                <TD><INPUT TYPE=PASSWORD NAME="shopper_password" SIZE="32"></TD>
            </TR>
            <TR>
                <TH ALIGN="LEFT">Password again:</TH>
                <TD><INPUT TYPE=PASSWORD NAME="shopper_password2" SIZE="32"></TD>
            </TR>

    </FORM>

            <TR>
                <TD HEIGHT="4">&nbsp;</TD>
            </TR>

            <TR>
            <TD VALIGN="TOP">Shopper Address:</TD>
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
                    VALUE="Register"
                    onClick="submitShopperToAddr()">
        </FORM> 
        </TD>
    </TR>
    </TABLE>

    <P>

    <%= MSWltLastChanceText(strDownlevelURL) %>

<% else %>
    <FORM NAME="shopper_new" METHOD=POST ACTION="<%= baseSURL("shopper_new.asp") & mscsPage.URLShopperArgs("use_form", 1) %>">
        <INPUT TYPE="HIDDEN" NAME="shopper_country" VALUE="THA">
        <INPUT TYPE="HIDDEN" NAME="target" VALUE="<% = Request("target") %>">
	    <INPUT TYPE="HIDDEN" NAME="pf_id" VALUE="<% = Request("pf_id") %>">
        <INPUT TYPE="HIDDEN" NAME="dept_id" VALUE="<%= Request("dept_id") %>">
        <INPUT TYPE="HIDDEN" NAME="door_id" VALUE="<% = Request("door_id") %>">
            <INPUT TYPE="HIDDEN" NAME="toilet_id" VALUE="<% = Request("toilet_id") %>">
            <INPUT TYPE="HIDDEN" NAME="floor_id" VALUE="<% = Request("floor_id") %>">
            
        <INPUT TYPE="HIDDEN" NAME="Validate" = "1">
<%
			price = Request("price")
			price =  MSCSDataFunctions.Money(price)
			Response.Write price
%>
        <TABLE BORDER="1">
            <% if errorList.Count = 0 and labelList.Count = 0 then %>
            <TR>
                <TD COLSPAN="2">Please enter the following information</TD>
            <% else %>
                <TD COLSPAN="2">
                    <FONT COLOR="#FF0000"><STRONG>
                    <%
                    for each errorLine in errorList
                        select case errorLine
                        case "shopper_passwordsdifferent" %>
                        You entered two different passwords. Please be sure to type the same password twice.<BR>
                        <% case "shopper_missingpassword" %>
                        You did not provide a password. Please be sure to provide a password.<BR>
                        <% case "duplicate_key" %>
                        A shopper with that email address is already registered with this store.<BR>Please specify a different email address.<BR>
                        <% case "err_unknown" %>
                        You could not be registered at this time because of a problem at the server.<BR>Please try again later.<BR>
                        <% end select
                    next
                    for each label in labelList %>
                        You must provide a value for <%= label %> between 1 and 100 characters long.<BR>
                    <% next %> 
                    </STRONG></FONT>
                </TD>
            </TR>
            <% end if %>

            <TR>
                <TD HEIGHT="4">&nbsp;</TD>
            </TR>

            <TR>
                <TH ALIGN="LEFT" WIDTH="125">Name:</TH>
                <TD><INPUT TYPE="TEXT" NAME="shopper_name" SIZE="32" VALUE="<%= mscsPage.HTMLEncode(Request("shopper_name")) %>"></TD>
            </TR>

            <TR>
                <TD HEIGHT="4">&nbsp;</TD>
            </TR>

            <TR>
                <TH ALIGN="LEFT">Password:</TH>
                <TD><INPUT TYPE="PASSWORD" NAME="shopper_password" SIZE="32"></TD>
            </TR>
            <TR>
                <TH ALIGN="LEFT">Password again:</TH>
                <TD><INPUT TYPE="PASSWORD" NAME="shopper_password2" SIZE="32"></TD>
            </TR>

            <TR>
                <TD HEIGHT=4>&nbsp;</TD>
            </TR>

            
            <TR>
                <TH ALIGN="LEFT">Address 1:</TH>
                <TD><INPUT TYPE="TEXT" NAME="shopper_address1" SIZE="32" VALUE="<%= mscsPage.HTMLEncode(Request("shopper_address1")) %>"></TD>
            </TR>
            <TR>
                <TH ALIGN="LEFT">Address 2:</TH>
                <TD><INPUT TYPE="TEXT" NAME="shopper_address2" SIZE="32" VALUE="<%= mscsPage.HTMLEncode(Request("shopper_address2")) %>"></TD>
            </TR>
            <TR>
                <TH ALIGN="LEFT">Address 3:</TH>
                <TD><INPUT TYPE="TEXT" NAME="shopper_address3" SIZE="32" VALUE="<%= mscsPage.HTMLEncode(Request("shopper_address3")) %>"></TD>
            </TR>
            <TR>
                <TH ALIGN="LEFT">Address 4:</TH>
                <TD><INPUT TYPE="TEXT" NAME="shopper_address4" SIZE="32" VALUE="<%= mscsPage.HTMLEncode(Request("shopper_address4")) %>"></TD>
            </TR>
            

            <TR>
                <TD HEIGHT="4">&nbsp;</TD>
            </TR>

            <TR>
                <TH ALIGN="LEFT">Phone</TH>
                <TD><INPUT TYPE="TEXT" NAME="shopper_phone" SIZE="32" VALUE="<%= mscsPage.HTMLEncode(Request("shopper_phone")) %>"></TD>
            </TR>
            <TR>
                <TH ALIGN="LEFT">Email:</TH>
                <TD><INPUT TYPE="TEXT" NAME="shopper_email" SIZE="32" VALUE="<%= mscsPage.HTMLEncode(Request("shopper_email")) %>"></TD>
            </TR>

            <TR>
                <TD>&nbsp;</TD>
                <TD>
                    <INPUT TYPE=SUBMIT NAME="submit" VALUE="Register">
                    <BR><H6>FIELD LABELS IN BOLD INDICATE REQUIRED FIELDS</H6>
                </TD>
            </TR>
        </TABLE>
    </FORM>
<% end if %>

<!--#INCLUDE FILE="i_footer.asp" -->

</BODY>

</HTML>
