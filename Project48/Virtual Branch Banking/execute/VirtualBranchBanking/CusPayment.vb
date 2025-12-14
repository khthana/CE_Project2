'************************************************************
'Class Cheque  : Definition Class for Payment transaction   * 
'************************************************************
Public Class CusPayment
    Private cus_pay_id As Integer
    Private to_merchant As Merchant
    Private customerUsed As Customer
    '*****************************
    'Constructor
    '*****************************
    Public Sub New()
    End Sub
    Public Sub New(ByVal id As Integer, ByVal mer As Merchant, ByVal cus As Customer)
        cus_pay_id = id
        to_merchant = mer
        customerUsed = cus
    End Sub
    '*****************************
    'Class Interface
    '*****************************
    Public Function GetCusPayID() As Integer
        Return cus_pay_id
    End Function
    Public Function SetCusPayID(ByVal id As Integer)
        cus_pay_id = id
    End Function
    Public Function GetToMerchant() As Merchant
        Return to_merchant
    End Function
    Public Function SetToMerchant(ByVal mer As Merchant)
        to_merchant = mer
    End Function
    Public Function GetCustomerUsed() As Customer
        Return customerUsed
    End Function
    Public Function SetCustomerUsed(ByVal cus As Customer)
        customerUsed = cus
    End Function
    '******************************
    'Class Method
    '******************************

End Class
