Module LinkedForm
    Public data_ID As String = ""         ' index ของ Grid
    Public Student_ID As String = ""
    Public Sta_NUM As String = "" 'ตารางสถานะภาพ
    Public RStd_NUM As String = "" 'ตารางประวัติการศึกษา
    Public H_number As String = "" 'ตารางสุขภาพ
    Public thaiNM As String = ""
    Public ThaiSurNM As String = ""
    Public EthaiNM As String = ""
    Public EThaiSurNM As String = ""

    Public H_LINKED As Boolean = False   'link มาจากตารางสุขภาพ
    Public H_DAY As Integer 'ID ของ  H_DAY ที่ link มา

    Public LinkSubject As String = "" 'เชื่อม 2 ฟร์อม รายวิชากับ เปลี่ยนรายวิชา

    Public mComs(3) As Boolean ' ตรวจสอบ Serial Port
    Public Pwd As Boolean = False
    Public DataOfCard As String = ""

    Public PwdToCard As String = ""
    Public StatusUser As Boolean = False

    Public GlDepart As String = ""
    Public GlFactory As String = ""

    Public NewID As Boolean = False

    Public SmartStudent As String = ""
    Public SmartHealth As String = ""
    Public SmartMoney As String = ""

    Public RegisterSTD As Boolean = False
    Public TxtSendData As String = ""

    ' สำหรับ link จาก from grade
    Public LinkGrade1 As String = ""
    Public LinkGrade2 As String = ""
    Public LinkGrade3 As String = ""
    Public LinkGrade4 As String = ""
    Public LinkGrade5 As String = ""
    '**************************

    '*******เงินที่ เพิ่ม เปลี่ยน ถอน รายวิชา*********************
    Public MoneyChangSubject As Double

    '****************************
    '**********Card Id **********
    Public UniqeCardID As String = ""
    '****************************

End Module
