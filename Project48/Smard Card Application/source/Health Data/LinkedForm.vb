Module LinkedForm
    Public data_ID As String = ""         ' index ของ Grid
    Public Student_ID As String = ""
    Public EthaiNM As String = ""
    Public EThaiSurNM As String = ""

    Public H_LINKED As Boolean = False   'link มาจากตารางสุขภาพ
    Public H_DAY As Integer 'ID ของ  H_DAY ที่ link มา


    Public mComs(3) As Boolean ' ตรวจสอบ Serial Port
    Public Pwd As Boolean = False
    Public DataOfCard As String = ""

    Public PwdToCard As String = ""
    Public StatusUser As Boolean = True

    Public GlDepart As String = ""
    Public GlFactory As String = ""

    Public NewID As Boolean = False

    Public SmartStudent As String = ""
    Public SmartHealth As String = ""
    Public SmartMoney As String = ""

    Public RegisterSTD As Boolean = False
    Public TxtSendData As String = ""


End Module
