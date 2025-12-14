<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>












<!--#INCLUDE FILE="i_shop.asp" -->
<!--#INCLUDE FILE="i_util.asp" -->

<%
function OrderFormPurchaseArgs(byRef orderForm, byRef errorList)
    REM -- cc info:
    cc_name = mscsPage.RequestString("cc_name", null, 1, 100)
    if IsNull(cc_name) then
        errorList.Add("Credit card name must be a string between 1 and 100 characters")
    else
        orderForm.cc_name = cc_name
    end if

    cc_type = mscsPage.RequestString("cc_type", null, 1, 100)
    orderForm.cc_type = cc_type
    if IsNull(cc_type) then
        errorList.Add("Credit card type must be a string between 1 and 100 characters")
    else
        orderForm.cc_type = cc_type
    end if
    
    cc_number = mscsPage.RequestString("_cc_number", null, 13, 19)
    if IsNull(cc_number) then
        errorList.Add("Credit card number must be a string between 13 and 19 characters")
    else
        orderForm.[_cc_number] = cc_number
    end if
    cc_expmonth = mscsPage.RequestNumber("_cc_expmonth", null, 1, 12)
    if IsNull(cc_expmonth) then
        errorList.Add("Expiration month must be a number between 1 and 12")
    else
        orderForm.[_cc_expmonth] = cc_expmonth
    end if
    cc_expyear = mscsPage.RequestNumber("_cc_expyear", null, 1997, 2003)
    if IsNull(cc_expyear) then
        errorList.Add("Expiration year must be a number between 1997 and 2003")
    else
        orderForm.[_cc_expyear]  = cc_expyear
    end if
    
    REM -- bill to:
    bill_to_name = mscsPage.RequestString("bill_to_name", null, 1, 100)
    if IsNull(bill_to_name) then
        errorList.Add("Ship to name must be a string between 1 and 100 characters")
    else
        orderForm.bill_to_name = bill_to_name
    end if
    
    bill_to_address1 = mscsPage.RequestString("bill_to_address1", null, 1, 100)
    if IsNull(bill_to_address1) then
        errorList.Add("Ship to address 1 must be a string between 1 and 100 characters")
    else
        orderForm.bill_to_address1 = bill_to_address1
    end if
    bill_to_address2 = mscsPage.RequestString("bill_to_address2", null, 1, 100)
    if IsNull(bill_to_address2) then
        errorList.Add("Ship to address 2 must be a string between 1 and 100 characters")
    else
        orderForm.bill_to_address2 = bill_to_address2
    end if
    bill_to_address3 = mscsPage.RequestString("bill_to_address3", null, 1, 100)
    if IsNull(bill_to_address3) then
        errorList.Add("Ship to address 3 must be a string between 1 and 100 characters")
    else
        orderForm.bill_to_address3 = bill_to_address3
    end if
    bill_to_address4 = mscsPage.RequestString("bill_to_address4", null, 1, 100)
    if IsNull(bill_to_address4) then
        errorList.Add("Ship to address 4 must be a string between 1 and 100 characters")
    else
        orderForm.bill_to_address4 = bill_to_address4
    end if
    
    bill_to_country = mscsPage.RequestString("bill_to_country", null, 1, 100)
    if IsNull(bill_to_country) then
        errorList.Add("Ship to country must be a string between 1 and 100 characters")
    else
        orderForm.bill_to_country = bill_to_country
    end if
    bill_to_phone   = mscsPage.RequestString("bill_to_phone", null, 1, 100)
    if IsNull(bill_to_phone) then
        errorList.Add("Ship to phone must be a string between 1 and 100 characters")
    else
        orderForm.bill_to_phone = bill_to_phone
    end if

    OrderFormPurchaseArgs = true
end function

function OrderFormPurchase(byRef errorList)
    OrderFormPurchase = null

    
    REM Create a Storage object for the shopper information
    Set mscsShopperStorage = UtilGetShopperStorage()

    REM Get the shopper from the shopper storage
    set mscsShopper = UtilGetShopper(mscsShopperStorage)
    REM If the shopper is null, there is no sense in us going on
    if IsNull(mscsShopper) then
        errorList.Add("Invalid shopper.")
        exit Function
    end if
    
    REM  Create a storage object for the order form
    Set mscsOrderFormStorage = UtilGetOrderFormStorage()

    REM Retrieve order from the storage
    Set mscsOrderForm = UtilGetOrderForm(mscsOrderFormStorage, created)

    REM Retrieve args from form:
    Call OrderFormPurchaseArgs(mscsOrderForm, errorList)

    REM If the order form has no items, add an error
    if mscsOrderForm.Items.Count = 0 then
        errorList.Add("No items to order.")
    end if

    if errorList.Count > 0 then 

        REM Save changes to the order form so far
        call UtilPutOrderForm(mscsOrderFormStorage, mscsOrderForm, created)

        exit function
    end if
    
    REM Set the verify with flags onto the orderform
    call mscsPage.ProcessVerifyWith(mscsOrderForm)

    REM Create the basic pipe context
    set mscsPipeContext = UtilGetPipeContext()

    
    REM Add necessary data to the pipe context 
    set mscsPipeContext.Shopper = mscsShopper

    
    REM Run the plan
    errorLevel = UtilRunPipe("plan.pcf", mscsOrderForm, mscsPipeContext)

    REM -- Finally if no errors, run the actual purchase
    REM -- Create a transacted pipeline for this execution
    if mscsOrderForm.[_Basket_Errors].Count = 0 and mscsOrderForm.[_Purchase_Errors].Count = 0 and errorLevel = 1 then

        REM Create the receipt storage
        Set mscsReceiptStorage = UtilGetReceiptStorage()

        REM Add the receipt storage into the pipe context...the Save Receipt component uses it
        Set mscsPipeContext.ReceiptStorage = MSCSReceiptStorage
        
        REM Run the transacted pipe
        errorLevel = UtilRunTxPipe("purchase.pcf", mscsOrderForm, mscsPipeContext)
    end if

    if mscsOrderForm.[_Basket_Errors].Count > 0 then
        REM -- goto basket to show errors 
        Response.redirect "basket.asp?" & mscsPage.URLShopperArgs()
        Response.End
    end if

	if mscsOrderForm.[_Purchase_Errors].Count > 0 or errorLevel > 1 then
		if mscsOrderForm.[_Purchase_Errors].Count > 0 then
			for each errorStr in mscsOrderForm.[_Purchase_Errors]
				errorList.Add(errorStr)
			next
		else
			errorList.Add("Unable to complete purchase at this time")
		end if
		OrderFormPurchase = null
	
		exit function
    end if

    REM Save the order id before we delete it
    order_id = mscsOrderForm.order_id

    REM Purchase was successful....delete the order form from the storage
    call MSCSOrderFormStorage.DeleteData(null, mscsOrderForm)

    REM Return the order id
    OrderFormPurchase = order_id
end function

Set errorList = Server.CreateObject("Commerce.SimpleList")

order_id = OrderFormPurchase(errorList)
if errorList.Count > 0 then
%>
    <!--#INCLUDE FILE="i_error.asp" -->
<%
else
    call Response.Redirect("confirmed.asp?" & mscsPage.URLShopperArgs("order_id", order_id))
end if
%>
