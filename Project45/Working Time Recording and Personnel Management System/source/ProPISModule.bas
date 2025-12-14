Attribute VB_Name = "ProPISModule"
Public Const gblDSN As String = "PISpro"
Public Const gblMedDateTimeFmt As String = "ddd dd/MM/yyyy Hh:Nn:Ss"
Public gblUser As String
Public gblPassword As String
Public GblConnStr As String
Public sConn As New ADODB.Connection
Public CurUser As String
Public CurCmp As String
Public CurDyr As Integer
Public CurSes As String
Public CurWst As String
Public cmpFLAG As Boolean
Public dyrFLAG As Boolean
Public appPath As String

Public Enum Accessibility
    None = 0
    Viewable = 1
    Modifiable = 2
    Removable = 3
    Printable = 4
    Approvable = 5
End Enum

Public Enum FormState
    Uninitialized = 0
    Create = 1
    View = 2
    Modify = 3
End Enum

Sub Main()

appPath = App.Path
If Right(appPath, 1) <> "\" Then appPath = appPath + "\"

Load Welcome
Welcome.Show

cmpFLAG = False
dyrFLAG = False

End Sub

Public Function CFC(Xcur As String) As Currency
Dim XLen, Xpos As Integer

Xce$ = Trim(Xcur)
If Right(Xce$, 1) = ")" Or Right(Xce$, 1) = "%" Or Right(Xce$, 1) = "$" Then Xce$ = Left(Xce$, Len(Xce$) - 1)
If Left(Xce$, 1) = "(" Or Left(Xce$, 1) = "%" Or Left(Xce$, 1) = "$" Then Xce$ = Right(Xce$, Len(Xce$) - 1)
XLen = Len(Xce$)
Xpos = 0

Do While XLen >= Xpos
 Xpos = Xpos + 1
 If Mid(Xce$, Xpos, 1) = "," Then
  XLen = XLen - 1
  Xce$ = Left(Xce$, Xpos - 1) + Right(Xce$, Len(Xce$) - Xpos)
 End If
Loop
CFC = Val(Xce$)
End Function

Public Function DateFilter(ByVal xDate As Date) As Date
    DateFilter = CDateX(Format(xDate, "dd/MM/yyyy"))
End Function

Public Function CDateX(ByVal xStr As String) As Date
Dim dStr As String
Dim tStr As String
    If Format(CDate("01/02/2000"), "dd/MM/yyyy") = "01/02/2000" Then
        CDateX = CDate(xStr)
    Else
        If Format(CDate("01/02/2000"), "dd/MM/yyyy") = "02/01/2000" Then
        
            tStr = Format(CDate(xStr), "HH:mm:ss")
            dStr = Format(CDate(xStr), "dd/MM/yyyy")
        
            CDateX = CDate(Mid(dStr, 4, 2) + "/" + Left(dStr, 2) + "/" + Right(dStr, 4) + " " + tStr)
        Else
            CDateX = Null
        End If
    End If
End Function

Public Function FillSpace(ByVal a As String, ByVal n As Long) As String
    FillSpace = a + Space(n - Len(a))
End Function

Public Function TTc(ByVal ip As String) As String
    TTc = Format(CFC(ip), "#,##0.00")
End Function

Public Function TTi(ByVal ip As String) As String
    TTi = Format(CFC(ip), "#,##0")
End Function
Public Function CalMethodTxt(ByVal CM As String) As String

Select Case CM
    Case Is = "H"
        CalMethodTxt = "H - Hourly Rate"
    Case Is = "D"
        CalMethodTxt = "D - Daily Rate"
    Case Is = "M"
        CalMethodTxt = "M - Monthly Rate"
    Case Is = "P"
        CalMethodTxt = "P - Piece Work"
    Case Is = "A"
        CalMethodTxt = "A - Annual Salary"
    Case Is = "V"
        CalMethodTxt = "V - Variable Amount"
    Case Is = "F"
        CalMethodTxt = "F - Fixed Amount"
    Case Else
        CalMethodTxt = "Invalid CalMethod"
End Select

End Function

Public Function ByteArr2Str(ByRef ip() As Byte) As String
Dim i As Long
Dim s As String
Dim t As String

s = ""
For i = LBound(ip) To UBound(ip)
    t = Hex(ip(i))
    t = String(2 - Len(t), "0") + t
    s = s + t
Next i

ByteArr2Str = s

End Function

Public Function Sec2HourDSP(ByVal sip As Long) As String
Dim h As Long
Dim m As Long
Dim s As Long

h = sip \ 3600
m = (sip - (h * 3600)) \ 60
s = sip - (h * 3600) - (m * 60)

Sec2HourDSP = Format(h, "00") + ":" + Format(m, "00") + ":" + Format(s, "00")

End Function

Public Function Bool2X(ByVal ip As Boolean) As String

If ip = False Then
    Bool2X = ""
Else
    Bool2X = "X"
End If

End Function

Public Function X2Bool(ByVal ip As String) As Boolean

If ip = "X" Then
    X2Bool = True
Else
    X2Bool = False
End If

End Function

Public Function Cur2IntwUp(ByVal ip As Currency) As Long
    
If Fix(ip) = ip Then
    Cur2IntwUp = Fix(ip)
Else
    If ip > 0 Then
        Cur2IntwUp = Fix(ip) + 1
    Else
        Cur2IntwUp = Fix(ip) - 1
    End If
End If

End Function

Public Function FileExists(sFullPath As String) As Boolean

Dim oFile As New Scripting.FileSystemObject
FileExists = oFile.FileExists(sFullPath)

End Function

Public Sub DeleteFile(sFullPath As String)

Dim oFile As New Scripting.FileSystemObject
oFile.DeleteFile sFullPath, True

End Sub

Public Sub CallReport(ByVal ReportName As String, ByVal ReportTitle As String, ByVal CIDflag As Boolean)

Dim obj As Object

Set obj = New frmRp

'Set Parameters !here!
obj.ReportName = ReportName
obj.ReportTitle = ReportTitle
obj.CIDflag = CIDflag
obj.Show
obj.ZOrder 0

End Sub

Public Function LoadPictureFromDB(ByRef RS As ADODB.Recordset, ByVal FieldName As String, ByRef ImageObj As Image) As Boolean

On Error GoTo procNoPicture

'If Recordset is Empty, Then Exit
If RS Is Nothing Then
    GoTo procNoPicture
End If

Set StrStream = New ADODB.Stream
StrStream.Type = adTypeBinary
StrStream.Open

StrStream.Write RS.Fields(FieldName).Value

tFile$ = App.Path + "\Temp.bmp"

StrStream.SaveToFile tFile$, adSaveCreateOverWrite
ImageObj.Picture = LoadPicture(tFile$)
DeleteFile (tFile$)
LoadPictureFromDB = True

procExitFunction:
Exit Function
procNoPicture:
ImageObj.Picture = LoadPicture()
LoadPictureFromDB = False

End Function

Public Function SavePictureToParam(ByRef Param As ADODB.Parameter, ByRef ImageObj As Image, ByRef Size As Long) As Boolean

Dim oPict As StdPicture
Dim StrStream As ADODB.Stream

On Error GoTo procNoPicture

Set oPict = ImageObj.Picture

'Exit Function if this is NOT a picture file
If oPict Is Nothing Then
    SavePictureToParam = False
    GoTo procExitSub
End If

tFile$ = App.Path + "\Temp.bmp"

SavePicture ImageObj, tFile$

Set StrStream = New ADODB.Stream
StrStream.Type = adTypeBinary
StrStream.Open
StrStream.LoadFromFile tFile$
Size = StrStream.Size
Param.Value = StrStream.Read

SavePictureToParam = True

procExitSub:
Exit Function
procNoPicture:

Size = 1
Param.Value = Null
SavePictureToParam = False

End Function

Public Function GetAccess(ByVal FeatureCode As String) As Boolean

Dim tCmd As New ADODB.Command
Dim tRs As New ADODB.Recordset
Dim tPr(2) As Variant
Dim i As Long

On Error GoTo ErrHandler

Set tCmd.ActiveConnection = sConn

tCmd.CommandType = adCmdStoredProc
tCmd.CommandText = "app_user_group_permission_select"

tPr(0) = CurUser
tPr(1) = CurCmp
tPr(2) = FeatureCode

Set tRs = tCmd.Execute(, tPr)

If tRs.EOF = False Then
    GetAccess = Not IsNull(tRs("fc"))
Else
    GetAccess = False
End If

Set tRs = Nothing
Set tCmd = Nothing

Exit Function

ErrHandler:

'MsgBox Err.Description, vbCritical + vbOKOnly
GetAccess = False

End Function
