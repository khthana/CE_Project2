Module modUseAll
    Public Const strConn As String = "Provider=Microsoft.JET.OLEDB.4.0;data source=C:\\RFID.mdb"

    '*****************************************************************
    'ตัวแปรใช้ระหว่างฟอร์ม FormCarIn.vb กับฟอร์ม FormMember.vb
    'เหตุการณ์ cmdMemberList_Click()
    Public rMemberID As String = ""
    Public rFullName As String = ""
    Public rAddress As String = ""
    Public rSex As String = ""
    Public rIDCard As String = ""
    Public rPhone As String = ""
    Public rMemberType As String = "0"
    Public rNumDateRentAdd As Integer = 0
    Public rRentRateDiscount As Single = 0
    Public rIsExpired As String = "1"
    '*****************************************************************

    '*****************************************************************
    'ตัวแปรที่ใช้ระหว่างฟอร์ม FormCarIn.vb กับฟอร์ม FormCar.vb
    'เหตุการณ์ cmdCarList_Click()
    Public rCarNumber As String = ""
    Public rProvince As String = ""
    Public rCarBrand As String = 0
    Public rBookInShop As Integer = 0
    Public rNumberDateRent As Integer = 0
    Public rPictureFileName As String = ""
    Public rIsNormalRent As String = ""
    '*****************************************************************
    Public Function StringFromRight(ByVal strTmp As String, ByVal strLength As Integer) As String
        If (strLength > 0 And strTmp.Length >= strLength) Then
            Return strTmp.Substring(strTmp.Length - strLength, strLength)
        Else
            Return strTmp
        End If
    End Function

    Public IsSave As Boolean
End Module