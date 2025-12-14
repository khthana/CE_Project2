VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "Richtx32.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form Form1 
   Caption         =   "Print Management"
   ClientHeight    =   6120
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8145
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6120
   ScaleWidth      =   8145
   StartUpPosition =   2  'CenterScreen
   Begin TabDlg.SSTab SSTab1 
      Height          =   6015
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8055
      _ExtentX        =   14208
      _ExtentY        =   10610
      _Version        =   393216
      Tab             =   1
      TabHeight       =   520
      BackColor       =   -2147483648
      TabCaption(0)   =   "Queue Printing"
      TabPicture(0)   =   "Form1.frx":030A
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "flex1"
      Tab(0).Control(1)=   "stop"
      Tab(0).Control(2)=   "start"
      Tab(0).ControlCount=   3
      TabCaption(1)   =   "Add Credit"
      TabPicture(1)   =   "Form1.frx":0326
      Tab(1).ControlEnabled=   -1  'True
      Tab(1).Control(0)=   "Label3"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "Frame2"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).Control(2)=   "Frame1"
      Tab(1).Control(2).Enabled=   0   'False
      Tab(1).Control(3)=   "PrintDlg"
      Tab(1).Control(3).Enabled=   0   'False
      Tab(1).Control(4)=   "rtf"
      Tab(1).Control(4).Enabled=   0   'False
      Tab(1).Control(5)=   "flex2"
      Tab(1).Control(5).Enabled=   0   'False
      Tab(1).Control(6)=   "printreport"
      Tab(1).Control(6).Enabled=   0   'False
      Tab(1).Control(7)=   "Text3"
      Tab(1).Control(7).Enabled=   0   'False
      Tab(1).Control(8)=   "set_cost"
      Tab(1).Control(8).Enabled=   0   'False
      Tab(1).Control(9)=   "Text1"
      Tab(1).Control(9).Enabled=   0   'False
      Tab(1).Control(10)=   "Text2"
      Tab(1).Control(10).Enabled=   0   'False
      Tab(1).ControlCount=   11
      TabCaption(2)   =   "Print Log"
      TabPicture(2)   =   "Form1.frx":0342
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "Combo1"
      Tab(2).Control(1)=   "refresh_log"
      Tab(2).Control(2)=   "flex3"
      Tab(2).Control(3)=   "Label4"
      Tab(2).ControlCount=   4
      Begin VB.TextBox Text2 
         Height          =   375
         Left            =   6480
         TabIndex        =   5
         Top             =   1440
         Width           =   1095
      End
      Begin VB.TextBox Text1 
         Height          =   375
         Left            =   6480
         TabIndex        =   4
         Top             =   960
         Width           =   1095
      End
      Begin MSHierarchicalFlexGridLib.MSHFlexGrid flex1 
         Height          =   4095
         Left            =   -74760
         TabIndex        =   14
         Top             =   600
         Width           =   7575
         _ExtentX        =   13361
         _ExtentY        =   7223
         _Version        =   393216
         BackColor       =   16777215
         Cols            =   4
         FixedCols       =   0
         BackColorFixed  =   12632256
         BackColorSel    =   16761024
         BackColorBkg    =   8421504
         BackColorUnpopulated=   16777152
         GridColorFixed  =   16711680
         GridColorUnpopulated=   16711935
         AllowUserResizing=   1
         _NumberOfBands  =   1
         _Band(0).Cols   =   4
      End
      Begin VB.ComboBox Combo1 
         Height          =   315
         Left            =   -70320
         TabIndex        =   12
         Top             =   5400
         Width           =   1815
      End
      Begin VB.CommandButton refresh_log 
         Caption         =   "Refresh"
         Height          =   375
         Left            =   -74040
         TabIndex        =   11
         Top             =   5400
         Width           =   2055
      End
      Begin MSFlexGridLib.MSFlexGrid flex3 
         Height          =   4815
         Left            =   -74760
         TabIndex        =   10
         Top             =   480
         Width           =   7455
         _ExtentX        =   13150
         _ExtentY        =   8493
         _Version        =   393216
         Cols            =   4
         ScrollBars      =   2
      End
      Begin VB.CommandButton set_cost 
         Caption         =   "Set Cost"
         Height          =   435
         Left            =   5280
         TabIndex        =   9
         Top             =   3600
         Width           =   2295
      End
      Begin VB.TextBox Text3 
         Height          =   375
         Left            =   6525
         TabIndex        =   8
         Top             =   3120
         Width           =   1050
      End
      Begin VB.CommandButton printreport 
         Caption         =   "Print Report"
         Height          =   435
         Left            =   5280
         TabIndex        =   6
         Top             =   4680
         Width           =   2280
      End
      Begin MSFlexGridLib.MSFlexGrid flex2 
         Height          =   4815
         Left            =   390
         TabIndex        =   3
         Top             =   675
         Width           =   4215
         _ExtentX        =   7435
         _ExtentY        =   8493
         _Version        =   393216
         AllowUserResizing=   1
      End
      Begin VB.CommandButton stop 
         Caption         =   "stop read"
         Height          =   375
         Left            =   -70560
         Style           =   1  'Graphical
         TabIndex        =   2
         Top             =   5160
         Width           =   1935
      End
      Begin VB.CommandButton start 
         Caption         =   "read spool"
         Height          =   375
         Left            =   -73920
         TabIndex        =   1
         Top             =   5160
         Width           =   1935
      End
      Begin RichTextLib.RichTextBox rtf 
         Height          =   1935
         Left            =   1680
         TabIndex        =   7
         Top             =   2400
         Visible         =   0   'False
         Width           =   2535
         _ExtentX        =   4471
         _ExtentY        =   3413
         _Version        =   393217
         TextRTF         =   $"Form1.frx":035E
      End
      Begin MSComDlg.CommonDialog PrintDlg 
         Left            =   2880
         Top             =   3480
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.Frame Frame1 
         Height          =   1980
         Left            =   5040
         TabIndex        =   15
         Top             =   660
         Width           =   2805
         Begin VB.CommandButton Command1 
            Caption         =   "Add Credit"
            Height          =   435
            Left            =   240
            TabIndex        =   19
            Top             =   1320
            Width           =   2295
         End
         Begin VB.Label Label7 
            Caption         =   "Username"
            Height          =   495
            Left            =   120
            TabIndex        =   18
            Top             =   360
            Width           =   855
         End
         Begin VB.Label Label6 
            Caption         =   "Add Credits ($)"
            Height          =   375
            Left            =   120
            TabIndex        =   17
            Top             =   840
            Width           =   1215
         End
      End
      Begin VB.Frame Frame2 
         Height          =   1455
         Left            =   5040
         TabIndex        =   20
         Top             =   2805
         Width           =   2775
         Begin VB.Label Label1 
            Caption         =   "Cost Per Page"
            Height          =   225
            Left            =   135
            TabIndex        =   21
            Top             =   360
            Width           =   1335
         End
      End
      Begin VB.Label Label3 
         Caption         =   "Cost Per Page"
         Height          =   375
         Left            =   5190
         TabIndex        =   22
         Top             =   3120
         Width           =   1455
      End
      Begin VB.Label Label4 
         Caption         =   "Sort By"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   222
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   -71160
         TabIndex        =   13
         Top             =   5400
         Width           =   1335
      End
   End
   Begin VB.Label Label5 
      Caption         =   "Label5"
      Height          =   495
      Left            =   3465
      TabIndex        =   16
      Top             =   2820
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim flag As Boolean ' update
Dim lhwndp As Long
Dim lastuptime As String 'เวลาที่ตรวจล่าสุด
Dim rateperpage As Double 'ราคาต่อแผ่น
Private JobsDesc(0 To 127) As JOB_INFO_1 'เก็บรายละเอียดการ print
Private Const obu As String = "4D"
Private Const time_refresh As Integer = 1 ' refresh spool every X second
'*****************************************************
Private Const CCHDEVICENAME = 32
Private Const CCHFORMNAME = 32
Private Const PRINTER_ACCESS_ADMINISTER = &H4
Private Const PRINTER_ACCESS_USE = &H8
Private Const JOB_STATUS_SPOOLING = &H8

Private Type DEVMODE
    dmDeviceName As String * CCHDEVICENAME
    dmSpecVersion As Integer
    dmDriverVersion As Integer
    dmSize As Integer
    dmDriverExtra As Integer
    dmFields As Long
    dmOrientation As Integer
    dmPaperSize As Integer
    dmPaperLength As Integer
    dmPaperWidth As Integer
    dmScale As Integer
    dmCopies As Integer
    dmDefaultSource As Integer
    dmPrintQuality As Integer
    dmColor As Integer
    dmDuplex As Integer
    dmYResolution As Integer
    dmTTOption As Integer
    dmCollate As Integer
    dmFormName As String * CCHFORMNAME
    dmUnusedPadding As Integer
    dmBitsPerPel As Long
    dmPelsWidth As Long
    dmPelsHeight As Long
    dmDisplayFlags As Long
    dmDisplayFrequency As Long
End Type

Private Type PRINTER_DEFAULTS
    pDatatype As String
    pDevMode As DEVMODE
    DesiredAccess As Long
End Type

Private Type SYSTEMTIME
    wYear As Integer
    wMonth As Integer
    wDayOfWeek As Integer
    wDay As Integer
    wHour As Integer
    wMinute As Integer
    wSecond As Integer
    wMilliseconds As Integer
End Type

Private Type JOB_INFO_1_API
    JobId As Long
    pPrinterName As Long
    pMachineName As Long
    pUserName As Long
    pDocument As Long
    pDatatype As Long
    pStatus As Long
    Status As Long
    Priority As Long
    Position As Long
    TotalPages As Long
    PagesPrinted As Long
    Submitted As SYSTEMTIME
End Type

Private Type JOB_INFO_1
    JobId As Long
    pPrinterName As String
    pMachineName As String
    pUserName As String
    pDocument As String
    pDatatype As String
    pStatus As String
    Status As Long
    Priority As Long
    Position As Long
    TotalPages As Long
    PagesPrinted As Long
    Submitted As SYSTEMTIME
End Type

Private Declare Function SetJob Lib "winspool.drv" Alias "SetJobA" (ByVal hPrinter As Long, ByVal JobId As Long, ByVal Level As Long, pJob As Byte, ByVal Command As Long) As Long
Private Declare Function OpenPrinter Lib "winspool.drv" Alias "OpenPrinterA" (ByVal pPrinterName As String, phPrinter As Long, pDefault As PRINTER_DEFAULTS) As Long
Private Declare Function EnumJobs Lib "winspool.drv" Alias "EnumJobsA" (ByVal hPrinter As Long, ByVal FirstJob As Long, ByVal NoJobs As Long, ByVal Level As Long, ByVal pJob As Long, ByVal cdBuf As Long, pcbNeeded As Long, pcReturned As Long) As Long
Private Declare Function CloseHandle Lib "kernel32.dll" (ByVal hObject As Long) As Long
Private Declare Sub CopyMem Lib "kernel32.dll" Alias "RtlMoveMemory" (pTo As Any, uFrom As Any, ByVal lSize As Long)
Private Declare Function lstrlenW Lib "kernel32.dll" (ByVal lpString As Long) As Long
Private Declare Function HeapAlloc Lib "kernel32.dll" (ByVal hHeap As Long, ByVal dwFlags As Long, ByVal dwBytes As Long) As Long
Private Declare Function GetProcessHeap Lib "kernel32.dll" () As Long
Private Declare Function HeapFree Lib "kernel32.dll" (ByVal hHeap As Long, ByVal dwFlags As Long, lpMem As Any) As Long

' getprintqueue to jobsdesc
Function PrinterQueueItems(sPrinterName As String) As Long
    Dim tPrinterStruct As PRINTER_DEFAULTS
    Dim lhwndPrinter As Long
    Dim bRet As Boolean
    Dim atJobs(0 To 127) As JOB_INFO_1_API
    Dim lpcbNeeded As Long
    Dim lpcReturned As Long
    Dim lThisJob As Integer
    Dim lTempBuff As Long

    'Initialize the Printer structure
    tPrinterStruct.pDatatype = vbNullString
    tPrinterStruct.pDevMode.dmSize = Len(tPrinterStruct.pDevMode)
    tPrinterStruct.DesiredAccess = PRINTER_ACCESS_USE
    'Get the printer Handle
    bRet = OpenPrinter(sPrinterName, lhwndPrinter, tPrinterStruct)
    'Get the Printer active atJobs
    bRet = EnumJobs(lhwndPrinter, 0, 127, 1, lTempBuff, 0, lpcbNeeded, lpcReturned)
    If lpcbNeeded = 0 Then
        PrinterQueueItems = 0
    Else
        'Allocate the Buffer
        lTempBuff = HeapAlloc(GetProcessHeap(), 0, lpcbNeeded)
        bRet = EnumJobs(lhwndPrinter, 0, 127, 1, lTempBuff, lpcbNeeded, lpcbNeeded, lpcReturned)
        CopyMem atJobs(0), ByVal lTempBuff, lpcbNeeded
        flex1.Rows = lpcReturned + 1
        For lThisJob = 0 To lpcReturned - 1
            JobsDesc(lThisJob).pPrinterName = LPSTRtoSTRING(atJobs(lThisJob).pPrinterName)
            JobsDesc(lThisJob).pMachineName = LPSTRtoSTRING(atJobs(lThisJob).pMachineName)
            JobsDesc(lThisJob).pUserName = LPSTRtoSTRING(atJobs(lThisJob).pUserName)
            JobsDesc(lThisJob).pDocument = LPSTRtoSTRING(atJobs(lThisJob).pDocument)
            JobsDesc(lThisJob).pDatatype = LPSTRtoSTRING(atJobs(lThisJob).pDatatype)
            JobsDesc(lThisJob).pStatus = LPSTRtoSTRING(atJobs(lThisJob).pStatus)
            JobsDesc(lThisJob).JobId = atJobs(lThisJob).JobId
            JobsDesc(lThisJob).Status = atJobs(lThisJob).Status
            JobsDesc(lThisJob).Priority = atJobs(lThisJob).Priority
            JobsDesc(lThisJob).Position = atJobs(lThisJob).Position
            JobsDesc(lThisJob).TotalPages = atJobs(lThisJob).TotalPages 'page not print
            JobsDesc(lThisJob).PagesPrinted = atJobs(lThisJob).PagesPrinted ' page printed
            JobsDesc(lThisJob).Submitted = atJobs(lThisJob).Submitted
           lhwndp = lhwndPrinter
           If Not (atJobs(lThisJob).Status = JOB_STATUS_SPOOLING) Then
                       update_table (lThisJob) ' call
            End If
        Next
        If lTempBuff Then HeapFree GetProcessHeap(), 0, lTempBuff
        PrinterQueueItems = lpcReturned
    End If
    'Close printer
    bRet = CloseHandle(lhwndPrinter)
End Function
 
'Removes Null Characters
Private Function TrimStr(strName As String) As String
    'Finds a null then trims the string
Dim x As Integer
    x = InStr(strName, vbNullChar)
    If x > 0 Then
        TrimStr = Left(strName, x - 1)
    Else
        TrimStr = strName
    End If
End Function


'Returns a string from a pointer
Private Function LPSTRtoSTRING(ByVal lngPointer As Long) As String
Dim lngLength As Long
    'Get number of characters in string
    lngLength = lstrlenW(lngPointer) * 2
    'Initialize string so we have something to copy the string into
    LPSTRtoSTRING = String(lngLength, 0)
    'Copy the string
    CopyMem ByVal StrPtr(LPSTRtoSTRING), ByVal lngPointer, lngLength
    'Convert to Unicode
    LPSTRtoSTRING = TrimStr(StrConv(LPSTRtoSTRING, vbUnicode))
End Function
'*****************************************************************************



Private Sub Combo1_Click()
    sort_printlog (Combo1.Text)
End Sub

Private Sub Command1_Click()
Dim Con As ADODB.Connection
Dim rs As ADODB.Recordset
Dim sql  As String
Dim sum  As Double
Dim i As Integer
        Set Con = New ADODB.Connection
        Set rs = New ADODB.Recordset
        Con.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=dataprint;Data Source=coolsharks"
        sql = "select id,credit from print_credit where id = '" & Text1.Text & "'"
        rs.Open sql, Con, , , adCmdText
        If rs.EOF And rs.BOF Then
            MsgBox "no user in database", vbOKOnly
            Text1.Text = ""
            Text2.Text = ""
            Exit Sub
        Else
            rs.MoveFirst
            sum = Text2.Text
            sum = rs("credit") + sum
        End If
        Call move_group(rs("id"), "canprint")
        Call remove_group(rs("id"), "noprint")
        rs.Close
        sql = "update print_credit set credit = '" & sum & "' where id = '" & Text1.Text & "'"
        Con.Execute sql
        Con.Close
        flex2.Col = 0
        For i = 1 To flex2.Rows
            flex2.Row = i
            If flex2.Text = Text1.Text Then
                flex2.Col = 1
                flex2.Text = sum
                Text1.Text = ""
                Text2.Text = ""
                Exit Sub
            End If
        Next i
End Sub

Private Sub Form_Unload(Cancel As Integer)
    End
End Sub

' print report
Private Sub printreport_Click()
On Error Resume Next
    Dim Con As ADODB.Connection
    Dim rs As ADODB.Recordset 'rs sound
    Dim sql  As String
        Set Con = New ADODB.Connection
        Set rs = New ADODB.Recordset
        Con.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=dataprint;Data Source=coolsharks"
        rtf.Text = ""
        sql = "select id,credit from print_credit "
        rs.Open sql, Con, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            rtf.Text = rtf.Text & "Username" & vbTab & "Credit" & vbCrLf
            Do While Not (rs.EOF)
                rtf.Text = rtf.Text & rs("id") & vbTab & rs("credit") & vbCrLf
                rs.MoveNext
            Loop
        End If
        PrintDlg.ShowPrinter
        PrintRTF rtf, 2.5 * 567, 2.5 * 567, 2.5 * 567, 2.5 * 567 ' margin left, top, right, bottom
End Sub

'id to text1
Private Sub flex2_Click()
    flex2.Col = 0
    Text1.Text = flex2.Text
End Sub

Private Sub initial_cost()
    Dim Con As ADODB.Connection
    Dim rs As ADODB.Recordset 'rs sound
    Dim sql  As String
        Set Con = New ADODB.Connection
        Set rs = New ADODB.Recordset
        Con.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=dataprint;Data Source=coolsharks"
        sql = "select val from setting where valname = 'cost_per_page'"
        rs.Open sql, Con, , , adCmdText
        rs.MoveFirst
        rateperpage = rs("val")
        rs.Close
        Con.Close
End Sub

Private Sub refresh_log_Click()
    sort_printlog ("Id")
End Sub

Private Sub sort_printlog(sortby As String)
Dim Con As ADODB.Connection
Dim rs As ADODB.Recordset 'rs sound
Dim sql  As String
Dim timed As String
Dim a As Long
Dim st1, st2 As String
Dim strdate As String
Dim strtime As String
'Dim sortby As String
    Set Con = New ADODB.Connection
    Set rs = New ADODB.Recordset
    Con.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=dataprint;Data Source=coolsharks"
    sql = "select * from print_log order by " & sortby
    rs.Open sql, Con, , , adCmdText
    If Not (rs.EOF And rs.BOF) Then
        rs.MoveFirst
        flex3.Row = 0
        Do While Not (rs.EOF)
            flex3.Row = flex3.Row + 1
            flex3.Rows = flex3.Rows + 1
            flex3.Col = 0
            flex3.Text = rs("id")
            flex3.Col = 1
            flex3.Text = rs("filename")
            flex3.Col = 2
            flex3.Text = rs("pages")
            flex3.Col = 3
            strtime = ":"
            st1 = Mid(rs("times"), 1, Len(rs("times")) - 3)
            st2 = st1 Mod 60 ' sec
            strtime = strtime & st2
            st1 = (st1 - st2) / 60
            st2 = st1 Mod 60 'min
            strtime = ":" & st2 & strtime
            st1 = (st1 - st2) / 60
            st2 = st1 Mod 24 'hr
            strtime = st2 & strtime
            st1 = (st1 - st2) / 24
            strdate = "/"
            st2 = st1 Mod 31 'day
            strdate = st2 & strdate
            st1 = (st1 - st2) / 31
            st2 = st1 Mod 12 'month
            strdate = strdate & st2 & "/"
            st1 = (st1 - st2) / 12
            strdate = strdate & "0" & st1
            flex3.Text = strdate & " " & strtime
            'Debug.Print strdate & strtime
            rs.MoveNext
        Loop
        rs.Close
        flex3.Rows = flex3.Row + 2
    End If
End Sub

Private Sub set_cost_Click()
    Dim Con As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim sql  As String
        Set Con = New ADODB.Connection
        Con.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=dataprint;Data Source=coolsharks"
        sql = "update setting set val = '" & Text3.Text & "' where valname = 'cost_per_page'"
        Con.Execute sql
        Con.Close
End Sub

' stop update table
Private Sub stop_Click()
    flag = False
End Sub
'*************************************************************************
Private Sub Form_Load()
    flag = True  'for update
    initial_cost ' get rate per page
    zero_credit
    set_flex ' set format of flex
    get_lastuptime 'lasttime of printjob
    PrinterQueueItems (Printer.DeviceName)
    show_output  ' show output  on flex 1
    get_credit 'show output on flex 2
    SSTab1.Tab = 0  'show queprinting TAB first
    refresh_log_Click 'refresh printlog
End Sub
'*************************************************************************
Private Sub zero_credit()
    Dim Con As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim sql  As String
        Set Con = New ADODB.Connection
        Set rs = New ADODB.Recordset
        Con.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=dataprint;Data Source=coolsharks"
        sql = "select * from print_credit where credit <= '0'"
        rs.Open sql, Con, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            Do While Not rs.EOF
                Call move_group(rs("id"), "noprint")
                Call remove_group(rs("id"), "canprint")
                rs.MoveNext
            Loop
        End If
        rs.Close
        sql = "select * from print_credit where credit > '0'"
        rs.Open sql, Con, , , adCmdText
        If Not (rs.EOF And rs.BOF) Then
            rs.MoveFirst
            Do While Not rs.EOF
                Call move_group(rs("id"), "canprint")
                Call remove_group(rs("id"), "noprint")
                rs.MoveNext
            Loop
        End If
        rs.Close
End Sub
'show output on flex at tab 1

Private Function show_output()
Dim i As Integer
    For i = 0 To flex1.Rows - 2
        flex1.Row = i + 1
        flex1.Col = 0
        flex1.Text = JobsDesc(i).pUserName
        flex1.Col = 1
        flex1.Text = JobsDesc(i).pDocument
        flex1.Col = 2
        flex1.Text = JobsDesc(i).TotalPages
        flex1.Col = 3
        flex1.Text = JobsDesc(i).Status
    Next i
End Function

'set flex1 and flex2
Private Function set_flex()
    flex1.ColWidth(0) = 1500
    flex1.ColWidth(1) = 3600
    flex1.ColWidth(2) = 800
    flex1.ColWidth(3) = 1000
    flex1.Row = 0
    flex1.Col = 0
    flex1.Text = "USER"
    flex1.Col = 1
    flex1.Text = "FILENAME"
    flex1.Col = 2
    flex1.Text = "PAGES"
    flex1.Col = 3
    flex1.Text = "STATUS"
    flex2.ColWidth(0) = 1500
    flex2.ColWidth(1) = 1000
    flex2.Row = 0
    flex2.Col = 0
    flex2.Text = "Username"
    flex2.Col = 1
    flex2.Text = "Credit"
    flex3.ColWidth(0) = 1500
    flex3.ColWidth(1) = 3600
    flex3.ColWidth(2) = 600
    flex3.ColWidth(3) = 1400
    flex3.Row = 0
    flex3.Col = 0
    flex3.Text = "ID"
    flex3.Col = 1
    flex3.Text = "FILENAME"
    flex3.Col = 2
    flex3.Text = "PAGES"
    flex3.Col = 3
    flex3.Text = "TIMES"
    Combo1.AddItem "ID"
    Combo1.AddItem "FILENAME"
    Combo1.AddItem "PAGES"
    Combo1.AddItem "TIMES"
    Combo1.ListIndex = 0
   ' flex2.ColWidth(0) = 1500
    'flex2.ColWidth(1) = 3600
End Function

'delay time a
Private Function delay(DelayTime)
Dim LoopTime As Long
Const SecInDay = 86400
LoopTime = Timer + DelayTime
     If LoopTime > SecInDay Then
         LoopTime = LoopTime - SecInDay
         Do While Timer > LoopTime
                  DoEvents
         Loop
     End If
         Do While Timer < LoopTime
                  DoEvents
         Loop
End Function

' update table every 5 second(upon delay time)
Private Sub start_Click()
    flag = True
    Do While flag
        delay (time_refresh)
        PrinterQueueItems (Printer.DeviceName)
        show_output
    Loop
End Sub
'data format be4 insert a
Private Function update_table(que As Integer)
Dim st1, st2, st3, st4, st5 As String
    st1 = JobsDesc(que).pUserName 'st1 = username
    st2 = (JobsDesc(que).Submitted.wYear Mod 100) * 12
    st2 = (st2 + JobsDesc(que).Submitted.wMonth) * 31
    st2 = (st2 + JobsDesc(que).Submitted.wDay) * 24
    st2 = (st2 + JobsDesc(que).Submitted.wHour) * 60
    st2 = (st2 + JobsDesc(que).Submitted.wMinute) * 60
    st2 = (st2 + JobsDesc(que).Submitted.wSecond) * 1000
    st2 = st2 + JobsDesc(que).Submitted.wMilliseconds 'st2 = time
    st3 = Left(JobsDesc(que).pDocument, 50) ' st3 = name of document
    st4 = JobsDesc(que).TotalPages ' st4 = pages
    st5 = "cannot"
    If lastuptime < st2 Then ' true => don't check spool file
        If sub_credit(que) Then
            Call ins_table(st1, st2, st3, st4, st5)
        End If
        lastuptime = st2
    End If
End Function

'insert data to table print_log a
Private Function ins_table(ByVal val1 As String, ByVal val2 As String, ByVal val3 As String, ByVal val4 As String, ByVal val5 As String)
Dim Con As ADODB.Connection
Dim sql  As String
    'On Error Resume Next
    Set Con = New ADODB.Connection
    Con.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=dataprint;Data Source=coolsharks"
    sql = "INSERT INTO print_log(id,times,filename,pages) VALUES ('" & val1 & "','" & val2 & "','" & val3 & "'," & val4 & ")"
    Con.Execute sql
    Con.Close
End Function

' get lastuptime a
Private Function get_lastuptime()
Dim Con As ADODB.Connection
Dim rs As ADODB.Recordset 'rs sound
Dim sql  As String
    Set Con = New ADODB.Connection
    Set rs = New ADODB.Recordset
    Con.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=dataprint;Data Source=coolsharks"
    sql = "select max(times) from print_log "
    rs.Open sql, Con, , , adCmdText
    If IsNull(rs.Fields(0).Value) Then
        lastuptime = 0
    Else
        lastuptime = rs.Fields(0).Value
    End If
    rs.Close
End Function

'get credit and show in flex2 a
Private Function get_credit()
Dim Con As ADODB.Connection
Dim rs As ADODB.Recordset 'rs sound
Dim sql  As String
    Set Con = New ADODB.Connection
    Set rs = New ADODB.Recordset
    Con.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=dataprint;Data Source=coolsharks"
    sql = "select id,credit from print_credit "
    rs.Open sql, Con, , , adCmdText
    If Not (rs.EOF And rs.BOF) Then
        rs.MoveFirst
        flex2.Row = 0
        Do While Not (rs.EOF)
            flex2.Row = flex2.Row + 1
            flex2.Rows = flex2.Rows + 1
            flex2.Col = 0
            flex2.Text = rs("id")
            flex2.Col = 1
            flex2.Text = rs("credit")
            rs.MoveNext
        Loop
        rs.Close
        flex2.Rows = flex2.Rows - 1
    End If
End Function

'if press enter then add credit to database
Private Sub Text2_KeyPress(KeyAscii As Integer)
Dim Con As ADODB.Connection
Dim rs As ADODB.Recordset
Dim sql  As String
Dim sum  As Double
Dim i As Integer
    If KeyAscii = 13 Then
        Set Con = New ADODB.Connection
        Set rs = New ADODB.Recordset
        Con.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=dataprint;Data Source=coolsharks"
        sql = "select id,credit from print_credit where id = '" & Text1.Text & "'"
        rs.Open sql, Con, , , adCmdText
        If rs.EOF And rs.BOF Then
            MsgBox "no user in database", vbOKOnly
            Text1.Text = ""
            Text2.Text = ""
            Exit Sub
        Else
            rs.MoveFirst
            sum = Text2.Text
            sum = rs("credit") + sum
        End If
        
        Call move_group(rs("id"), "canprint")
        Call remove_group(rs("id"), "noprint")
        rs.Close
        sql = "update print_credit set credit = '" & sum & "' where id = '" & Text1.Text & "'"
        Con.Execute sql
        Con.Close
        flex2.Col = 0
        For i = 1 To flex2.Rows
            flex2.Row = i
            If flex2.Text = Text1.Text Then
                flex2.Col = 1
                flex2.Text = sum
                Text1.Text = ""
                Text2.Text = ""
                Exit Sub
            End If
        Next i
    End If
End Sub

Private Function sub_credit(que As Integer) As Boolean
Dim Con As ADODB.Connection
Dim rs As ADODB.Recordset
Dim sql  As String
Dim sum  As Double
Dim i As Integer
Dim user As String
Dim boo As Boolean
        user = JobsDesc(que).pUserName
        'user = "march"
        Set Con = New ADODB.Connection
        Set rs = New ADODB.Recordset
        Con.Open "Provider=SQLOLEDB.1;User ID=sa;Password=;Initial Catalog=dataprint;Data Source=coolsharks"
        sql = "select id,credit from print_credit where id = '" & user & "'"
        rs.Open sql, Con, , , adCmdText
        If rs.EOF And rs.BOF Then ' true => not in account list
            boo = SetJob(lhwndp, JobsDesc(que).JobId, 0, 0, 5) 'delete job
            rs.Close
            Con.Close
            sub_credit = False
            Exit Function
        Else
            rs.MoveFirst
            sum = (rs("credit")) - (JobsDesc(que).TotalPages * rateperpage)
            If sum < 0 Then ' true => credit is none
                boo = SetJob(lhwndp, JobsDesc(que).JobId, 0, 0, 5) 'delete job
                rs.Close
                Con.Close
                sub_credit = False
                Exit Function
            ElseIf sum = 0 Then
                Call move_group(user, "noprint")
                Call remove_group(user, "canprint")
            End If
        End If
        rs.Close
        sql = "update print_credit set credit = '" & sum & "' where id = '" & user & "'"
        Con.Execute sql
        Con.Close
        get_credit
        sub_credit = True
End Function

Private Sub move_group(user As String, grp As String)
    On Error Resume Next
    'Dim strcomputer As String
    Dim objgroup  As Object
    Dim objUser  As Object
    'user = "march"
    'user = "wwW"
    Set objgroup = GetObject("LDAP://cn=" & grp & ",cn=Users,dc=awesome,dc=com")
    Set objUser = GetObject("LDAP://cn= " & user & " ,ou=" & obu & ",dc=awesome,dc=com")
    objgroup.Add (objUser.ADsPath)
    
End Sub
Private Sub remove_group(user As String, grp As String)
    On Error Resume Next
    'Dim strcomputer As String
    Dim objgroup  As Object
    Dim objUser  As Object
    'user = "march"
    'user = "wwW"
    Set objgroup = GetObject("LDAP://cn=" & grp & ",cn=Users,dc=awesome,dc=com")
    Set objUser = GetObject("LDAP://cn= " & user & " ,ou=" & obu & ",dc=awesome,dc=com")
    objgroup.Remove (objUser.ADsPath)
    
End Sub

