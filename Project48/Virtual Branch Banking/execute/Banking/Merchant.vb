'****************************************************************************
'Class Merchant  : Definition Class for add new merchant to the system      *
'****************************************************************************
Public Class Merchant
    Private merchant_id As Integer
    Private merchant_name As String
    Private merchant_type As String
    Private product As String
    Private phone_no As String
    Private fax_no As String
    '***************************
    'Constructure
    '***************************
    Public Sub New()
    End Sub
    Public Sub New(ByVal id As Integer)
        merchant_id = id
        merchant_name = ""
        merchant_type = ""
        product = ""
        phone_no = ""
        fax_no = ""
    End Sub
    Public Sub New(ByVal id As Integer, ByVal name As String, ByVal type As String, ByVal pro As String, _
        ByVal phone As String, ByVal fax As String)
        merchant_id = id
        merchant_name = name
        merchant_type = type
        product = pro
        phone_no = phone
        fax_no = fax
    End Sub
    '***************************
    'Class Interface
    '***************************
    Public Function GetMerchantID() As Integer
        Return merchant_id
    End Function
    Public Function SetMerchantID(ByVal id As Integer)
        merchant_id = id
    End Function
    Public Function GetMerchantName() As String
        Return merchant_name
    End Function
    Public Function SetMerchantName(ByVal name As String)
        merchant_name = name
    End Function
    Public Function GetMerchantType() As String
        Return merchant_type
    End Function
    Public Function SetMerchantType(ByVal type As String)
        merchant_type = type
    End Function
    Public Function GetMerchantProduct() As String
        Return product
    End Function
    Public Function SetMerchantProduct(ByVal pro As String)
        product = pro
    End Function
    Public Function GetMerchantPhoneNO() As String
        Return phone_no
    End Function
    Public Function SetMerchantPhoneNo(ByVal phone As String)
        phone_no = phone
    End Function
    Public Function GetMerchantFaxNo() As String
        Return fax_no
    End Function
    Public Function SetMerchantFaxNo(ByVal fax As String)
        fax_no = fax
    End Function
    '*******************************
    'Class Method
    '*******************************
    Public Function Save(ByVal mer As Merchant) As Integer
        Dim merDA As New MerchantDA
        If (merDA.MerchantInsert(mer)) = -1 Then
            Return -1 ' Merchant had already exist in database
        Else
            Return 1 ' Save successed...
        End If
    End Function
    Public Function Check(ByVal mer As Merchant) As Merchant
        Dim merDA As New MerchantDA
        Dim merChecked As New Merchant
        merChecked = merDA.MerchantSelect(mer)
        Return merChecked
    End Function
    Public Function CheckAccNo(ByVal mer As Merchant) As Merchant
        Dim merDA As New MerchantDA
        Dim merChecked As New Merchant
        merChecked = merDA.MerchantSelectAccNo(mer)
        Return merChecked
    End Function
End Class
