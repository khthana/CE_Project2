Module LinkForm
    Public strConn As String = "server =(local);initial catalog=SmartFood;integrated security=SSPI;persist security info=False; workstation id=THAIVB;packet size=4096"
    Public Money As Double
    Public TotalMoneyBay As Double
    Public Student_id As String
    Public NameStudent As String
    Public SurName As String

    Public SmartStudent As String = ""
    Public SmartHealth As String = ""
    Public SmartMoney As String = ""

    Public Pwd As Boolean = False
    Public DataOfCard As String = ""

    Public InsertMoneyStatus As Double

    Public AdminCheck As Boolean = False

    Public StCardIn As Boolean = False
    Public DateTimeCurrent As String = ""

    '/////////////////link PrintPreview//////////////////
    Public Stdate As String = ""
    Public SrData As String = ""
    Public SrTypeData As String = ""

    '//////////////////////////////////////////
End Module
