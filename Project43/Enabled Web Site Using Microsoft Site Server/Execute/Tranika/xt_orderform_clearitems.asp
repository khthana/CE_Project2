<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>












<!--#INCLUDE FILE="i_shop.asp" -->
<!--#INCLUDE FILE="i_util.asp" -->

<%
REM -- Create the order form storage
set mscsOrderFormStorage = UtilGetOrderFormStorage()

REM Get the order form
set mscsOrderForm = UtilGetOrderForm(mscsOrderFormStorage, created)

if mscsOrderForm.Items.Count > 0 then
    call mscsOrderForm.ClearItems()

    call mscsOrderFormStorage.CommitData(NULL, mscsOrderForm)
end if

call Response.Redirect("basket.asp?" & mscsPage.URLShopperArgs())
%>
