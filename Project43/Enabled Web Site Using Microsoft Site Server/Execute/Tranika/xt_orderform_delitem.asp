<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>












<!--#INCLUDE FILE="i_shop.asp" -->
<!--#INCLUDE FILE="i_util.asp" -->

<%
REM Create a storage object for the order forms
Set mscsOrderFormStorage = UtilGetOrderFormStorage()

REM Get the order form
set mscsOrderForm = UtilGetOrderForm(mscsOrderFormStorage, created)

REM Get the index of the item to delete
if mscsOrderForm.Items.Count > 0 then
    index = mscsPage.RequestNumber("index", NULL, 0, mscsOrderForm.Items.Count - 1)
    if Not IsNull(index) then
        call mscsOrderForm.Items.Delete(index)

        call mscsOrderFormStorage.CommitData(NULL, mscsOrderForm)
    end if
end if

call Response.Redirect("basket.asp?" & mscsPage.URLShopperArgs())
%>
