
<%
function UtilGetShopperStorage()
    Set  shopperStorage = Server.CreateObject("Commerce.DBStorage")
    Call shopperStorage.InitStorage(MSCSSite.DefaultConnectionString, "tranika_shopper", "shopper_id")

    Set UtilGetShopperStorage = shopperStorage
end function

function UtilGetShopper(shopperStorage)
    On Error Resume Next
    Set shopper = shopperStorage.GetData(NULL, mscsShopperID)
    On Error Goto 0
    if IsEmpty(shopper) then
        UtilGetShopper = NULL
    else
        Set UtilGetShopper = shopper
    end if
end function


function UtilGetOrderFormStorage()
    Set orderFormStorage = Server.CreateObject("Commerce.DBStorage")
    Call orderFormStorage.InitStorage(MSCSSite.DefaultConnectionString, "tranika_basket", "shopper_id", "Commerce.OrderForm", "marshalled_basket", "date_changed")

    Set UtilGetOrderFormStorage = orderFormStorage
end function

function UtilGetOrderForm(byRef orderFormStorage, byRef created)
    created = 0
    On Error Resume Next
    Set orderForm = orderFormStorage.GetData(null, mscsShopperID)
    On Error Goto 0
    if IsEmpty(orderForm) then
        set orderForm = Server.CreateObject("Commerce.OrderForm")
        orderForm.shopper_id = mscsShopperID
        created = 1
    end if
    set UtilGetOrderForm = orderForm
end function

function UtilPutOrderForm(byRef orderFormStorage, byRef orderForm, byRef created)
    if created = 0 then
        Call orderFormStorage.CommitData(NULL, orderForm)
    else
    
    REM Create a Storage object for the shopper information
    Set mscsShopperStorage = UtilGetShopperStorage()

    REM Get the shopper from the shopper storage
    set mscsShopper = UtilGetShopper(mscsShopperStorage)
    REM If the shopper didn't exist, then we shouldn't save the order form
    if Not IsNull(mscsShopper) then
        Call orderFormStorage.InsertData(NULL, orderForm)
    end if
    
    end if
end function

function UtilGetReceiptStorage()
    REM Create a storage object for receipts
    Set receiptStorage = Server.CreateObject("Commerce.DBStorage")
    Call receiptStorage.InitStorage(MSCSSite.DefaultConnectionString, "tranika_receipt", "order_id", "Commerce.OrderForm" , "marshalled_receipt", "date_entered")
    receiptStorage.Mapping.Value("_total_total") = "total"

    Set UtilGetReceiptStorage = receiptStorage
end function

function UtilGetPipeContext()
    Set pipeContext = Server.CreateObject("Commerce.Dictionary")
    Set pipeContext("MessageManager")      = MSCSMessageManager
    Set pipeContext("DataFunctions")       = MSCSDataFunctions
    Set pipeContext("QueryMap")            = MSCSQueryMap
    Set pipeContext("ConnectionStringMap") = MSCSSite.ConnectionStringMap
    pipeContext("SiteName")                = displayName
    pipeContext("DefaultConnectionString") = MSCSSite.DefaultConnectionString
    pipeContext("Language")                = "THA"

    Set UtilGetPipeContext = pipeContext
end function

function UtilRunPipe(file, orderForm, pipeContext)
    Set pipeline = Server.CreateObject("Commerce.MtsPipeline")
    
    Call pipeline.LoadPipe(Request.ServerVariables("APPL_PHYSICAL_PATH") & "config\" & file)

    REM Call pipeline.SetLogFile(Request.ServerVariables("APPL_PHYSICAL_PATH") & "config\pipeline.log")

    errorLevel = pipeline.Execute(1, orderForm, pipeContext, 0)

    UtilRunPipe = errorLevel
end function

function UtilRunTxPipe(file, orderForm, pipeContext)
    Set pipeline = Server.CreateObject("Commerce.MtsTxPipeline")
    
    Call pipeline.LoadPipe(Request.ServerVariables("APPL_PHYSICAL_PATH") & "config\" & file)

    REM Call pipeline.SetLogFile(Request.ServerVariables("APPL_PHYSICAL_PATH") & "config\txpipeline.log")

    errorLevel = pipeline.Execute(1, orderForm, pipeContext, 0)

    UtilRunTxPipe = errorLevel
end function

function UtilRunPlan()
    
    REM Create a Storage object for the shopper information
    Set mscsShopperStorage = UtilGetShopperStorage()

    REM Get the shopper from the shopper storage
    set mscsShopper = UtilGetShopper(mscsShopperStorage)
    
    REM Create a storage object for the order forms
    Set mscsOrderFormStorage = UtilGetOrderFormStorage()

    REM Get the orderform
    Set mscsOrderForm = UtilGetOrderForm(mscsOrderFormStorage, created)

    REM Get the basic pipe context
    Set mscsPipeContext = UtilGetPipeContext()

    
    if Not IsNull(mscsShopper) then
        Set mscsPipeContext.Shopper = mscsShopper
    end if
    
    REM Create and run the pipe
    errorLevel = UtilRunPipe("plan.pcf", mscsOrderForm, mscsPipeContext)

    REM Save the order form in case running the pipe made changes to the order form
    if created then
        
        REM Only insert if a real shopper....note that for bad shoppers we return the
        REM order form but it is never saved to the database
        if Not IsNull(mscsShopper) then
            Call mscsOrderFormStorage.InsertData(null, mscsOrderForm)
        end if
        
    else
        Call mscsOrderFormStorage.CommitData(null, mscsOrderForm)
    end if

    Set UtilRunPlan = mscsOrderForm
end function
%>
