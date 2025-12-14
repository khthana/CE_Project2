Public Class Payment
    Private payment_id As Integer
    Private payment_type As String
    Private to_merchant As Merchant
    Private customerUSed As Customer
    Private pay_by As String
    Private amount As Double
    Private due_date As Date
    '*****************************
    'Constructor
    '*****************************
    Public Sub New()
    End Sub
    Public Sub New(ByVal id As Integer, ByVal type As String, ByVal mer As Merchant, ByVal cus As Customer, _
        ByVal by As String, ByVal amt As Double, ByVal dat As Date)
        payment_id = id
        payment_type = type
        to_merchant = mer
        customerUSed = cus
        pay_by = by
        amount = amt
        due_date = dat
    End Sub
    '*****************************
    'Classs Interface
    '*****************************
    Public Function GetPaymentID() As Integer
        Return payment_id
    End Function
    Public Function SetPaymentID(ByVal id As Integer)
        payment_id = id
    End Function
    Public Function GetPaymentType() As String
        Return payment_type
    End Function
    Public Function SetPaymentType(ByVal type As String)
        payment_type = type
    End Function
    Public Function GetMerChant() As Merchant
        Return to_merchant
    End Function
    Public Function SetMerchant(ByVal mer As Merchant)
        to_merchant = mer
    End Function
    Public Function GetCustomerUsed() As Customer
        Return customerUSed
    End Function
    Public Function SetCustomerUsed(ByVal cus As Customer)
        customerUSed = cus
    End Function
    Public Function GetPaymentBy() As String
        Return pay_by
    End Function
    Public Function SetPaymentBy(ByVal by As String)
        pay_by = by
    End Function
    Public Function GetPaymentAmount() As Double
        Return amount
    End Function
    Public Function SetPaymentAmount(ByVal amt As Double)
        amount = amt
    End Function
    Public Function GetPaymentDueDate() As Date
        Return due_date
    End Function
    Public Function SetPaymentDueDate(ByVal dat As Date)
        due_date = dat
    End Function
    '***********************************
    Public Function Save(ByVal pay As Payment) As Integer
        Dim payDA As New PaymentDA
        payDA.PaymentInsert(pay)
    End Function
End Class
