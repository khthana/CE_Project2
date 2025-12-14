<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>












<!--#INCLUDE FILE="i_shop.asp" -->
<!--#INCLUDE FILE="i_util.asp" -->

<%
function OrderFormPrepareArgs(byRef orderForm, byRef errorList)
    
    REM -- shipping method:
    orderForm.shipping_method = mscsPage.RequestString("shipping_method")
    

    REM -- ship to:
    ship_to_name = mscsPage.RequestString("ship_to_name", null, 1, 100)
    if IsNull(ship_to_name) then
        errorList.Add("Ship to name must be a string between 1 and 100 characters")
    else
        orderForm.ship_to_name = ship_to_name
        orderForm.bill_to_name = orderForm.ship_to_name
    end if
    
    ship_to_address1 = mscsPage.RequestString("ship_to_address1", null, 1, 100)
    if IsNull(ship_to_address1) then
        errorList.Add("Ship to address 1 must be a string between 1 and 100 characters")
    else
        orderForm.ship_to_address1 = ship_to_address1
        orderForm.bill_to_address1 = orderForm.ship_to_address1
    end if
    ship_to_address2 = mscsPage.RequestString("ship_to_address2", null, 1, 100)
    if IsNull(ship_to_address2) then
        errorList.Add("Ship to address 2 must be a string between 1 and 100 characters")
    else
        orderForm.ship_to_address2 = ship_to_address2
        orderForm.bill_to_address2 = orderForm.ship_to_address2
    end if
    ship_to_address3 = mscsPage.RequestString("ship_to_address3", null, 1, 100)
    if IsNull(ship_to_address3) then
        errorList.Add("Ship to address 3 must be a string between 1 and 100 characters")
    else
        orderForm.ship_to_address3 = ship_to_address3
        orderForm.bill_to_address3 = orderForm.ship_to_address3
    end if
    ship_to_address4 = mscsPage.RequestString("ship_to_address4", null, 1, 100)
    if IsNull(ship_to_address4) then
        errorList.Add("Ship to address 4 must be a string between 1 and 100 characters")
    else
        orderForm.ship_to_address4 = ship_to_address4
        orderForm.bill_to_address4 = orderForm.ship_to_address4
    end if
    
    ship_to_country = mscsPage.RequestString("ship_to_country", null, 1, 100)
    if IsNull(ship_to_country) then
        errorList.Add("Ship to country must be a string between 1 and 100 characters")
    else
        orderForm.ship_to_country = ship_to_country
        orderForm.bill_to_country = orderForm.ship_to_country
    end if
    ship_to_phone   = mscsPage.RequestString("ship_to_phone", null, 1, 100)
    if IsNull(ship_to_phone) then
        errorList.Add("Ship to phone must be a string between 1 and 100 characters")
    else
        orderForm.ship_to_phone = ship_to_phone
        orderForm.bill_to_phone = orderForm.ship_to_phone
    end if
end function

REM Create a dictionary to store errors
Set errorList = Server.CreateObject("Commerce.SimpleList")

REM Get the order form storage
Set mscsOrderFormStorage = UtilGetOrderFormStorage()

REM Get the order form
Set mscsOrderForm = UtilGetOrderForm(mscsOrderFormStorage, created)

REM Retreive the args from the form
Call OrderFormPrepareArgs(mscsOrderForm, errorList)

if errorList.Count > 0 then
%>
    <!--#INCLUDE FILE="i_error.asp" -->
<%

else
    call UtilPutOrderForm(mscsOrderFormStorage, mscsOrderForm, created)
    
    call Response.Redirect("payment.asp?" & mscsPage.URLShopperArgs("use_form", mscsPage.RequestString("use_form", 0)))
end if
%>
