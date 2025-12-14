Attribute VB_Name = "mdlConst"
Option Explicit

Public Const DisplayMode = 1

Global StatusOpen As Boolean

Public Const imgPR = 1
Public Const imgPO = 2
Public Const imgIV = 3
Public Const imgTS = 4
Public Const imgPN = 5
Public Const imgMP = 6

Global LocalIP As String
Global LocalName As String
Global LocalPort As Long
Global FileName As String
Global remoteIP As String
Global remotePort As String
Global Password As String

Global DBconString As String
Global LogFileName As String
Global flag As Boolean

'------------- Directory ---------------
Public Const POdir = "\PO"
Public Const Otherdir = "\OtherFile"
Public Const PRdir = "\PR"
Public Const IVdir = "\Invoice"
Public Const TmpFileDir = "\Temp"
Public Const TSdir = "\Transaction"
Public Const PNdir = "\Partner"

'------------ Socket Type Constance ----------------
Public Const DestBegin = "#Dest Path#"
Public Const EofFile = "#EOF#"
Public Const FileType = "#File Type#"
Public Const ftPO = "PO"
Public Const ftPR = "PR"
Public Const ftInvoice = "IV"
Public Const ftOther = "OT"
Public Const ftTS = "TS"
Public Const ftMS = "MS"
Public Const strTestCon = "Test Connection"
Public Const ftPN = "PN"
Public Const ftMP = "MP"

Public Const GetUserID = "#Request UserID#"

'------------- Status ---------------
Public Const SOpen = "opened"
Public Const SConfirm = "confirmed"
Public Const SAccept = "accepted"
Public Const SReject = "rejected"
Public Const SDelete = "deleted"
Public Const SSent = "sent"
Public Const SReceive = "received"
Public Const SPartial = "partially delivered"
Public Const SDeliver = "delivered"
Public Const SPaid = "paid"

Public Function GetFileName(ByVal PathFileName As String) As String
    Dim pos As Integer
    Dim pos1 As Integer
    pos = InStr(1, PathFileName, "\")
    Do While (pos > 0)
        pos1 = pos
        pos = InStr(pos1 + 1, PathFileName, "\")
    Loop
    GetFileName = Right$(PathFileName, Len(PathFileName) - pos1)
End Function

Public Sub delFile(ByVal PathFileName As String)
        On Error Resume Next
        Kill PathFileName
End Sub

Public Sub Message(ByVal Text As String)
        If DisplayMode = 0 Then
                MsgBox Text
        Else
                Dim datestr As String
                If Text <> "" Then
                        datestr = Format$(Now, "dd/mm/yy  hh:nn:ss")
                        frmEvent.AddEvent datestr & vbTab & Text
                        LogFile.AddLog datestr & vbTab & Text
                Else
                        frmEvent.AddEvent ""
                        LogFile.AddLog ""
                End If
         End If
End Sub

