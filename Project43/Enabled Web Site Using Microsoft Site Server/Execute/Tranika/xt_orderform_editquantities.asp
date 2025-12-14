<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>












<!--#INCLUDE FILE="i_shop.asp" -->
<!--#INCLUDE FILE="i_util.asp" -->

<%
REM Create a storage object for the order forms
Set mscsOrderFormStorage = UtilGetOrderFormStorage()

REM Get the order form
set mscsOrderForm = UtilGetOrderForm(mscsOrderFormStorage, created)

strError = ""
if Not IsEmpty(mscsOrderForm) then
    set items = mscsOrderForm.Items
    for index = mscsOrderForm.Items.Count - 1 to 0 step -1
        set item = items(index)
        quantity = mscsPage.RequestNumber("qty_" & CStr(index), item.quantity, 0, 999)
        if IsNull(quantity) then
            strError = "nonnumber"
        else
            if quantity = 0 then
                call mscsOrderForm.Items.Delete(index)
            else
                item.quantity = quantity
            end if
            call MSCSOrderFormStorage.CommitData(null, mscsOrderForm)
        end if
    next
end if

if strError = "" then
    pageRedirect = "basket.asp?" & mscsPage.URLShopperArgs()
else
    pageRedirect = "basket.asp?" & mscsPage.URLShopperArgs("error", strError)
end if

Response.Redirect(pageRedirect)
%>
