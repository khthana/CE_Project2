<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>

<!--#INCLUDE FILE="i_shop.asp" -->
<!--#INCLUDE FILE="i_util.asp" -->

<%
function ShopperLookup(byVal page, byRef mscsShopper, byRef errorList, byRef labelList)

    
    shopper_password = page.RequestString("shopper_password", null, 1, 100)
    if IsNull(shopper_password) then
        labelList.Add "password"
    end if
    

    shopper_email = page.RequestString("shopper_email", null, 1, 100)
    if IsNull(shopper_email) then
        labelList.Add "email"
    end if

    if labelList.Count <> 0 then
        ShopperLookup = false
        exit function
    end if
    
    dim keys(1), values(1)
    
    keys(0) = "email"
    values(0) = shopper_email
    keys(1) = "password"
    values(1) = shopper_password
    
    REM Create a Storage object for the shopper information
    Set mscsShopperStorage = UtilGetShopperStorage()

    on error resume next
    set shopper = mscsShopperStorage.LookupData(null, keys, values)
    on error goto 0
    if IsEmpty(shopper) then
        errorList.Add "shopper_nouser"
        ShopperLookup = false
        exit function
    end if

    set mscsShopper = shopper

    ShopperLookup = true
end function

REM -- set up error vars:
set errorList = Server.CreateObject("Commerce.SimpleList")
set labelList = Server.CreateObject("Commerce.SimpleList")
if Request("Validate").count > 0 then
    mscsShopper = null

    if ShopperLookup(mscsPage, mscsShopper, errorList, labelList) then
        call mscsPage.PutShopperId(mscsShopper.shopper_id)
        
		if Request("target") = "" then
			Response.Redirect("default.asp?" & mscsPage.URLShopperArgs())
        else
        
			Response.Redirect(Request("target") & "?" & mscsPage.URLShopperArgs("pf_id",Request("pf_id"),"dept_id",Request("dept_id"),"door_id",Request("door_id"),"toilet_id",Request("toilet_id"),"floor_id",Request("floor_id")))
        end if
        
    end if
end if
%>

<HTML>

<HEAD>
    <TITLE><%= displayName %>: Lookup Shopper</TITLE>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
</HEAD>

<BODY  BACKGROUND="<% = Application("background")%> " TEXT="#000000"  LINK="#FF0000"  VLINK="#FF0000" ALINK="#FF0000" >
<%	'<!--#INCLUDE FILE="header.asp" --> %>
<H1><P ALIGN=CENTER><%= displayName %>: Lookup Shopper</P></H1>
<BR><BR>

<FORM NAME="shopper_lookup" METHOD="POST" ACTION="<%= pageSURL("shopper_lookup.asp") %>" >
    
	<INPUT TYPE="HIDDEN" NAME="target" VALUE="<% = Request("target") %>">
	<INPUT TYPE="HIDDEN" NAME="pf_id" VALUE="<% = Request("pf_id") %>">
    <INPUT TYPE="HIDDEN" NAME="dept_id" VALUE="<%= Request("dept_id") %>">
    
	<INPUT TYPE="HIDDEN" NAME="door_id" VALUE="<% = Request("door_id") %>">
        
	<INPUT TYPE="HIDDEN" NAME="toilet_id" VALUE="<% = Request("toilet_id") %>">
        
	<INPUT TYPE="HIDDEN" NAME="floor_id" VALUE="<% = Request("floor_id") %>">
        
    <INPUT TYPE="HIDDEN" NAME="Validate" VALUE="1">
    <TABLE WIDTH="850" ALIGN="CENTER" VALIGN="TOP" BORDER="0">
        <TR>
			<TD WIDTH=300>			</TD>
            <% if errorList.Count = 0 and labelList.Count = 0 then %>
            <TD COLSPAN="2">If you are a returning shopper, please provide your email and password.</TD>
            <% else %>
            <TD COLSPAN="2">
                <FONT COLOR="#FF0000"><STRONG>
                <%
                for each errorLine in errorList
                    select case errorLine
                    case "shopper_nouser" %>
                    There is no shopper with that email and/or password. Please try again.<BR>
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
			<TD WIDTH=300>			</TD>
            <TD WIDTH=100>Email:</TD>
            <TD WIDTH=600><INPUT TYPE="TEXT" NAME="shopper_email" SIZE="32"></TD>
        </TR>
        <TR>
			<TD WIDTH=300>			</TD>
            <TD WIDTH=100>Password:</TD>
            <TD WIDTH=600><INPUT TYPE="PASSWORD" NAME="shopper_password" SIZE="32"></TD>
        </TR>
        <TR>
			<TD WIDTH=300>			</TD>
            <TD WIDTH=100>&nbsp;</TD>
            <TD WIDTH=600><INPUT TYPE=SUBMIT NAME="SUBMIT" VALUE="Lookup"></TD>
        </TR>

        <TR>
            <TD HEIGHT="4">&nbsp;</TD>
        </TR>

        <TR>
			<TD WIDTH=300>			</TD>
            <TD COLSPAN="2">
                If you've never been here, click 
                <A HREF="<% = baseSURL("shopper_new.asp") & mscsPage.URLShopperArgs("target",Request("target"),"pf_id",Request("pf_id"),"dept_id",Request("dept_id"),"door_id",Request("door_id"),"toilet_id",Request("toilet_id"),"floor_id",Request("floor_id")) %>">here</A>
                
            </TD>
        </TR>
    </TABLE>
</FORM>

<!--#INCLUDE FILE="i_footer.asp" -->

</BODY>

</HTML>
