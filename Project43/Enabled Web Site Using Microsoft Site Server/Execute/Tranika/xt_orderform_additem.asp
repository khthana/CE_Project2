<%@ LANGUAGE=vbscript enablesessionstate=false LCID=1054 %>












<!--#INCLUDE FILE="i_shop.asp" -->
<!--#INCLUDE FILE="i_util.asp" -->

<%
function OrderFormAddItem(byVal orderFormStorage, byVal shopperID, byRef errorStr)
    Set mscsOrderForm = UtilGetOrderForm(mscsOrderFormStorage, created)

    REM -- retrieve quantity:
    product_qty = mscsPage.RequestNumber("qty", "1", 1, 999)
    if IsNull(product_qty) then
        product_qty = 1
    end if

    REM -- retrieve pf_id and dept_id:
    pf_id = mscsPage.RequestString("pf_id")
    quoted_pf_id = "'" & Replace(pf_id,"'","''") & "'"
    dept_id = mscsPage.RequestNumber("dept_id")

    
    sqlText = MSCSQueryMap.product_by_attrs.SQLCommand
    sqlText = Replace(sqlText,":1", quoted_pf_id)
    sqlText = Replace(sqlText,":2", dept_id)
    
            sqlText = Replace(sqlText,":3", Request("door_id"))
        
            sqlText = Replace(sqlText,":4", Request("toilet_id"))
        
            sqlText = Replace(sqlText,":5", Request("floor_id"))
        

    REM -- retrieve product:
    cmdTemp.CommandText = sqlText
    Set rsProduct = Server.CreateObject("ADODB.Recordset")
    rsProduct.Open cmdTemp, , adOpenStatic, adLockReadOnly
    if rsProduct.EOF then
        errorStr="unavailable"
        OrderFormAddItem = false
        exit function
    end if
    sku = rsProduct("sku").value
    
    list_price = rsProduct("list_price").value
    name = rsProduct("name").value
    rsProduct.Close

    REM -- add item to order form:
    set item = mscsOrderForm.AddItem(sku, product_qty, list_price)
    item.name = name
    item.list_price = list_price
    item.dept_id = dept_id
    
    item.pf_id = pf_id

    REM -- adding the attributes to the item allows us to display them in the basket without needing a query on that page
    sqlText = MSCSQueryMap.product_attrs_by_id.SQLCommand
    sqlText = Replace(sqlText,":1",Request("door_id"))
    sqlText = Replace(sqlText,":2",Request("toilet_id"))
    sqlText = Replace(sqlText,":3",Request("floor_id"))
    
    cmdTemp.CommandText = sqlText
    Set rsAttr = Server.CreateObject("ADODB.Recordset")
    rsAttr.Open cmdTemp, , adOpenStatic, adLockReadOnly
    item.door_value = rsAttr("door_value").value
    item.toilet_value = rsAttr("toilet_value").value
    item.floor_value = rsAttr("floor_value").value
    
    rsAttr.Close
    
    MSCS.Close

    REM -- commit order form back to storage:
    Call UtilPutOrderForm(orderFormStorage, mscsOrderForm, created)

    OrderFormAddItem = true
end function

Set mscsOrderFormStorage = UtilGetOrderFormStorage()


errorStr = ""
success = OrderFormAddItem(mscsOrderFormStorage, mscsShopperID, errorStr)
if success then
    call Response.Redirect("basket.asp?" & mscsPage.URLShopperArgs())
else
    call Response.Redirect("product.asp?" & mscsPage.URLShopperArgs("pf_id", Request("pf_id"), "dept_id", Request("dept_id"), "error", errorStr))
end if

%>
