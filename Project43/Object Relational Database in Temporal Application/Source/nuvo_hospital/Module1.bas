Attribute VB_Name = "Module1"
Public datetime As String
Public Const forever = "9999-12-31 23:59"
Public oEngine As ddoEngine
Public oModel As ddoModel
Public oProject As ddoProject
Public oDatagrop As ddoDataGroup
Public oLogonInfo As ddoLogonInfo
Public oRoutine As ddoRoutine

Public dis_char() As String
Public dis_id() As Integer
Public dis_code() As Integer
Public med_char() As String
Public med_id() As Integer
Public med_code() As Integer
Public doc_id() As Integer
Public doc_code() As Integer
Public doc_char() As String

Public package_char() As String
Public package_id() As Integer
Public room_num() As Integer
Public room_id() As Integer
Public name_char() As String
Public name_id() As Integer
Public sur_char() As String
Public sur_id() As Integer
Public lab_id() As Integer
Public lab_code() As Integer
Public lab_char() As String
Public lab_type() As String

Public id_col() As Integer
Public hn_col() As Integer
Public name_col() As String
Public sur_col() As String
Public birth_col() As Date
Public sex_col() As String
Public idnum_col() As String
Public blood_col() As String
Public address_col() As String
Public tel_col() As String
Public dis_col() As String
Public med_col() As String
Public diag_col() As Integer
Public diag_from() As String
Public diag_to() As String
Public admit_col() As Integer
Public pic_col() As Integer
Public pic_from() As String
Public pic_to() As String
Public pic_show() As Boolean

Public rowid_setofmed() As Integer
Public rowid_setofmedquan() As Integer
Public rowid_setoflabc() As Integer
Public rowid_setoflabn() As Integer
Public rowid_setoflabp() As Integer
Public setofadmit_rowid() As Integer
Public setofadmit_from() As String
Public setofadmit_to() As String
Public setofnurse_id() As Integer
Public setofnurse_from() As String
Public setofnurse_to() As String
Public setofdiag_id() As Integer
Public setofdiag_from() As String
Public setofdiag_to() As String
Public setofdate() As String

Public t0bool As Boolean
Public t1bool As Boolean
Public t2bool As Boolean
Public rowtemp As Integer

Public Function CalDate() As String
Dim X As String
    X = Year(Date) & "-" & Month(Date) & "-" & Day(Date) & " " & Hour(Time) & ":" & Minute(Time)
    CalDate = X
End Function
