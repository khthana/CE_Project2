<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>












<!--#INCLUDE FILE="i_shop.asp" -->
<!--#INCLUDE FILE="i_util.asp" -->

<%
Set mscsShopperStorage = UtilGetShopperStorage()
REM - Get shopper
set mscsShopper = UtilGetShopper(mscsShopperStorage)
if IsNull(mscsShopper) then
	call Response.Redirect("shopper_lookup.asp")
end if

function ShopperUpdate(byVal page, byVal shopper, byVal dataFuncs, byRef errorList, byRef labelList)

    
    pwd_old = page.RequestString("shopper_password_old", null, 1, 100)
    pwd_new1 = page.RequestString("shopper_password_new", null, 1, 100)
    pwd_new2 = page.RequestString("shopper_password_new2", null, 1, 100)
    
    REM -- only require old password if sertting a new one
    if Not IsNull(pwd_new1) then
        if pwd_old <> dataFuncs.CleanString(shopper.password) then
            errorList.Add "shopper_badpassword"
        elseif pwd_new1 <> pwd_new2 then
            errorList.Add "shopper_passwordsdifferent"
        elseif IsNull(pwd_new1) then
            strError  = "shopper_missingpassword"
        end if
        shopper.password = pwd_new1
    end if
    

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
        ShopperUpdate = false
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

    ShopperUpdate = true
end function

REM Create a Storage object for the shopper information
Set mscsShopperStorage = UtilGetShopperStorage()

REM Get the shopper from the shopper storage
set mscsShopper = UtilGetShopper(mscsShopperStorage)

REM -- set up error vars:
set errorList = Server.CreateObject("Commerce.SimpleList")
set labelList = Server.CreateObject("Commerce.SimpleList")
if Request("Validate").count > 0 then
    if ShopperUpdate(mscsPage, mscsShopper, MSCSDataFunctions, errorList, labelList) then
        call mscsShopperStorage.CommitData(null, mscsShopper)
    end if
end if
%>
<HTML>

<HEAD>
    <TITLE><%= displayName %>: Update Shopper</TITLE>
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

<H1><%= displayName %>: Update Shopper</H1>

<FORM NAME="shopper_update" METHOD="POST" ACTION="<% = pageURL("shopper_update.asp") %>">
    <INPUT TYPE="HIDDEN" NAME="shopper_country" VALUE="<%= mscsPage.HTMLEncode(mscsShopper.country) %>">
    <INPUT TYPE="HIDDEN" NAME="Validate" = "1">

    <TABLE >
        <TR>
            <% if errorList.Count = 0 and labelList.Count = 0 then %>
            <TD COLSPAN="2">Please enter the following information:</TD>
            <% else %>
            <TD COLSPAN="2">
                <FONT COLOR="#FF0000"><STRONG>
                <%
                for each errorLine in errorList
                    select case errorLine
                    case "shopper_badpassword" %>
                    The password you provided was not correct. Please be sure to type the correct password.<BR>
                    <% case "shopper_passwordsdifferent" %>
                    You entered two different passwords. Please be sure to type the same password twice.<BR>
                    <% case "shopper_missingpassword" %>
                    You did not provide a password. Please be sure to provide a password.<BR>
                    <% end select
                next
                for each label in labelList %>
                    You must provide a value for <%= label %> between 1 and 100 characters long.<BR>
                <% next %> 
                </STRONG></FONT>
            </TD>
            <% end if %>
        </TR>

        <TR>
            <TD HEIGHT="4">&nbsp;</TD>
        </TR>

        <TR>
            <TH ALIGN="LEFT">Name:</TH>
            <TD><INPUT TYPE="TEXT" NAME="shopper_name" VALUE="<%= mscsPage.HTMLEncode(mscsShopper.name) %>" SIZE="32"></TD>
        </TR>

        <TR>
            <TD HEIGHT="4">&nbsp;</TD>
        </TR>

        <TR>
            <TD>Old Password<B>*</B>:</TD>
            <TD><INPUT TYPE="PASSWORD" NAME="shopper_password_old" SIZE="32"></TD>
        </TR>
        <TR>
            <TD>New Password<B>*</B>:</TD>
            <TD><INPUT TYPE="PASSWORD" NAME="shopper_password_new" SIZE="32"></TD>
        </TR>
        <TR>
            <TD>New Password again<B>*</B>:</TD>
            <TD><INPUT TYPE="PASSWORD" NAME="shopper_password_new2" SIZE="32"></TD>
        </TR>
        <TR>
            <TD COLSPAN="2" ALIGN="RIGHT"><H6>* ONLY REQUIRED IF CHANGING PASSWORD</H6></TD>
        </TR>

        <TR>
            <TD HEIGHT="4">&nbsp;</TD>
        </TR>

        
        <TR>
            <TH ALIGN="LEFT">Address 1:</TH>
            <TD><INPUT TYPE="TEXT" NAME="shopper_address1" VALUE="<%= mscsPage.HTMLEncode(mscsShopper.address1) %>" SIZE="32"></TD>
        </TR>
        <TR>
            <TH ALIGN="LEFT">Address 2:</TH>
            <TD><INPUT TYPE="TEXT" NAME="shopper_address2" VALUE="<%= mscsPage.HTMLEncode(mscsShopper.address2) %>" SIZE="32"></TD>
        </TR>
        <TR>
            <TH ALIGN="LEFT">Address 3:</TH>
            <TD><INPUT TYPE="TEXT" NAME="shopper_address3" VALUE="<%= mscsPage.HTMLEncode(mscsShopper.address3) %>" SIZE="32"></TD>
        </TR>
        <TR>
            <TH ALIGN="LEFT">Address 4:</TH>
            <TD><INPUT TYPE="TEXT" NAME="shopper_address4" VALUE="<%= mscsPage.HTMLEncode(mscsShopper.address4) %>" SIZE="32"></TD>
        </TR>
        

        <TR>
            <TD HEIGHT="4">&nbsp;</TD>
        </TR>

        <TR>
            <TH ALIGN="LEFT">Phone:</TH>
            <TD><INPUT TYPE="TEXT" NAME="shopper_phone" VALUE="<%= mscsPage.HTMLEncode(mscsShopper.phone) %>" SIZE="32"></TD>
        </TR>
        <TR>
            <TH ALIGN="LEFT">Email:</TH>
            <TD><INPUT TYPE="TEXT" NAME="shopper_email" VALUE="<%= mscsPage.HTMLEncode(mscsShopper.email) %>" SIZE="32"></TD>
        </TR>

        <TR>
            <TD HEIGHT="4">&nbsp;</TD>
        </TR>

        <TR>
            <TD>&nbsp;</TD>
            <TD>
                <INPUT TYPE="SUBMIT" NAME="submit" VALUE="Update">
                <BR><H6>FIELD LABELS IN BOLD INDICATE REQUIRED FIELDS</H6>
            </TD>
        </TR>
    </TABLE>
</FORM>

<!--#INCLUDE FILE="i_footer.asp" -->

</BODY>

</HTML>
