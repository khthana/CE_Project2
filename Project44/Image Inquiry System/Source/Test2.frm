VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form MainFrm 
   Caption         =   "Image Inquiry System"
   ClientHeight    =   5415
   ClientLeft      =   3480
   ClientTop       =   3465
   ClientWidth     =   6165
   LinkTopic       =   "Form1"
   ScaleHeight     =   5415
   ScaleWidth      =   6165
   Begin VB.CommandButton ClearImage 
      Caption         =   "Clear Image"
      Height          =   495
      Left            =   1440
      TabIndex        =   6
      Top             =   4800
      Width           =   1575
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   3975
      Left            =   360
      ScaleHeight     =   261
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   237
      TabIndex        =   5
      Top             =   480
      Width           =   3615
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   4920
      Top             =   360
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command1 
      Caption         =   "  Advanced        Search"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4560
      TabIndex        =   4
      Top             =   3480
      Width           =   1335
   End
   Begin VB.CommandButton Processing 
      Caption         =   "Search"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4560
      TabIndex        =   3
      Top             =   2280
      Width           =   1335
   End
   Begin VB.CommandButton KeepintoDB 
      Caption         =   "Keep into Database"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   4560
      TabIndex        =   0
      Top             =   1080
      Width           =   1335
   End
   Begin VB.Label LabelFileName 
      Caption         =   "File Name :"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   360
      TabIndex        =   2
      Top             =   120
      Width           =   1215
   End
   Begin VB.Label LabelNameofFile 
      Caption         =   "-"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1680
      TabIndex        =   1
      Top             =   120
      Width           =   2535
   End
   Begin VB.Menu FileMenu 
      Caption         =   "&File"
      Begin VB.Menu OpenMenu 
         Caption         =   "&Open.. Ctrl+O"
      End
      Begin VB.Menu DashMenu 
         Caption         =   "-"
      End
      Begin VB.Menu ExitMenu 
         Caption         =   "E&xit..    Ctrl+x"
      End
   End
End
Attribute VB_Name = "MainFrm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim OraSession As OraSession
Dim OraDatabase As OraDatabase
Dim OraDynaset  As OraDynaset
Dim maskX, maskY As Integer
Dim same As Integer
Dim FileData, Data As String
Dim Seq As String

Private Sub ClearImage_Click()
    Picture1.Cls
    LabelNameofFile.Caption = "-"
End Sub

Private Sub Command1_Click()
    FrmAdvancedSearch.Picture1 = MainFrm.Picture1
    FrmAdvancedSearch.Show
End Sub

Private Sub ExitMenu_Click()
    End
End Sub

Private Sub Form_Load()
Dim ClickStatus As Integer                          ' if = 0 means "Keep" was clicked, if = 1 means "Processing".
'Create the OraSession Object.
    Set OraSession = CreateObject("OracleInProcServer.XOraSession")
'Create the OraDatabase Object by opening a connection to Oracle
    Set OraDatabase = OraSession.DbOpenDatabase("exOracle", "teety/bobo", &H0&)
'Create the OraDynaset Object.
    Set OraDynaset = OraDatabase.CreateDynaset("select * from Project order by id asc", &H0&)
End Sub

Sub KeepintoDB_Click()
    ClickStatus = 0
    FrmKeepIntoDB.Picture1 = MainFrm.Picture1
    FrmKeepIntoDB.Show
End Sub

Private Sub OpenMenu_Click()
On Error GoTo Killer
    'CommonDialog1.Filter = "Image File(*.jpeg)|*.jpeg "
    CommonDialog1.ShowOpen
    
    Picture1 = LoadPicture(CommonDialog1.FileName)
    FileName = CommonDialog1.FileName
    Exit Sub
Killer:
    MsgBox "Error!", 0 & 16, "Error:"
   
End Sub

Private Sub Processing_Click()
    ClickStatus = 1
            'Create the OraSession Object.
            '    Set OraSession = CreateObject("OracleInProcServer.XOraSession")
            'Create the OraDatabase Object by opening a connection to Oracle
            '   Set OraDatabase = OraSession.DbOpenDatabase("exOracle", "teety/bobo", &H0&)
            'Create the OraDynaset Object.
             Set OraDynaset = OraDatabase.CreateDynaset("select * from Project order by id asc", &H0&)
    
    Call searchData
    Sql_Command = "id='" & same & "'"
        OraDynaset.FindFirst Sql_Command
        FileName = OraDynaset.Fields("path")
        FrmShowResult.Picture1.Picture = LoadPicture(FileName)
        FrmShowResult.txtID.Text = OraDynaset.Fields("id")
        FrmShowResult.txtName.Text = OraDynaset.Fields("name")
        FrmShowResult.txtSurename.Text = OraDynaset.Fields("surename")
        FrmShowResult.txtSex.Text = OraDynaset.Fields("sex")
        FrmShowResult.txtAge.Text = OraDynaset.Fields("age")
        FrmShowResult.txtHeight.Text = OraDynaset.Fields("Heigth")
        FrmShowResult.txtWieght.Text = OraDynaset.Fields("Weigth")
        FrmShowResult.Show
End Sub

Sub search()
Dim fso As New FileSystemObject
Dim objts As TextStream
Dim objFil As File
Dim Seq As String
Dim SeqIn, most, found, num As Integer
Dim Count As Integer
Dim Sql_Criteria, blank As String

    Call getData            'get array representation of
                            'this picture => array(size*size)
    
    Set objts = fso.OpenTextFile("c:\sequence.txt", ForReading, False)
    Seq = Trim(objts.ReadLine)      'open file sequence for reading
                                    'the amount of picture in database
    SeqIn = val(Seq)
    most = 0
        'Create the OraSession Object.
        '    Set OraSession = CreateObject("OracleInProcServer.XOraSession")
        'Create the OraDatabase Object by opening a connection to Oracle
        '    Set OraDatabase = OraSession.DbOpenDatabase("exOracle", "teety/bobo", &H0&)
        'Create the OraDynaset Object.
        '    Set OraDynaset = OraDatabase.CreateDynaset("select * from Project order by id asc", &H0&)
        'SeqID = 1
    
    
    For b = 1 To SeqIn
        Sql_Criteria = "id =' " & b & "'"
        OraDynaset.FindNext Sql_Criteria
        FileData = OraDynaset.Fields("Data")          'FileData = pathname
                                                      'of file data representation
        
        Set objts = fso.OpenTextFile(FileData, ForReading, False)
        Seq = Trim(objts.ReadLine)
        Count = 0
        For x = 0 To size - 1
            For y = 0 To size - 1
                If x * y <> 81 Then
                    blank = " "
                    found = InStr(Seq, blank)
                    num = Int(Left(Seq, found - 1))
                    Seq = Trim(Right(Seq, Len(Seq) - found + 1))
                Else
                    num = Trim(Seq)
                End If
                If arr(x, y) < num + 30 And arr(x, y) > num - 30 Then
                    Count = Count + 1       'count is number of pixel of image
                                            'in DB that familiar with the input image
                End If
           Next y
        Next x
        If Count > most Then
            most = Count            'most is number of count that have maximum value
            same = b                'same is id of image that have most similar
        End If
    Next b
End Sub

Public Sub getData()
Dim x, y  As Integer

    maxx = Picture1.ScaleWidth
    maxy = Picture1.ScaleHeight
    
    ReDim color(maxx, maxy)         'keep gray scale value of this image
    
    For i = 0 To maxx - 1
        For j = 0 To maxy - 1
            tmp = CStr(Hex(Picture1.Point(i, j)))
            tmpR = Mid(tmp, 1, 2)
            tmpG = Mid(tmp, 3, 2)
            tmpB = Mid(tmp, 5, 2)
            
            tempR = val("&H" & tmpR)
            tempG = val("&H" & tmpG)
            tempB = val("&H" & tmpB)
            Temp = Int((tempR + tempG + tempB) / 3)
            color(i, j) = Temp
        Next j
    Next i
    
    maskX = Int(maxx / size)
    maskY = Int(maxy / size)
    
    For i = 0 To size - 1
        x = i * maskX
        For j = 0 To size - 1
            y = j * maskY
            arr(i, j) = GetRepresentBO(x, y)
        Next j
    Next i
    
    Dim fso As New FileSystemObject
    Dim objFil As File
    Dim objts As TextStream
    
    Dim tee As String
    FileData = Left(FileName, Len(FileName) - 4) & ".txt"   'FileData => path name of
                                                            'array representation
    fso.CreateTextFile (FileData)
    Set objFil = fso.GetFile(FileData)
    Set objts = objFil.OpenAsTextStream(ForWriting)
    For i = 0 To size - 1
        For j = 0 To size - 1
            objts.Write arr(i, j) & " "
        Next j
    Next i
    objts.Close
End Sub
 
Private Function GetRepresentBO(X1, Y1 As Integer) As Integer
Dim Temp As Double
Dim tmp As String
    Temp = 0
    For n = X1 To maskX + X1 - 1
        For m = Y1 To maskY + Y1 - 1
            Temp = Temp + color(n, m)
        Next m
    Next n
    GetRepresentBO = Int(Temp / (maskX * maskY))
End Function



Sub searchData()
Dim fso As New FileSystemObject
Dim objts As TextStream
Dim objFil As File
'Dim Seq As String
Dim SeqIn, most, found, num As Integer
Dim blank As String
Dim Count As Integer

    Call getFileData            'get array representation of
                                      'this picture => array(size*size)
    
    Set objts = fso.OpenTextFile("c:\sequence.txt", ForReading, False)
    Seq = Trim(objts.ReadLine)      'open file sequence for reading the amount of picture in database
    SeqIn = val(Seq)
    most = 0
        'Create the OraSession Object.
        '    Set OraSession = CreateObject("OracleInProcServer.XOraSession")
        'Create the OraDatabase Object by opening a connection to Oracle
        '    Set OraDatabase = OraSession.DbOpenDatabase("exOracle", "teety/bobo", &H0&)
        'Create the OraDynaset Object.
        '    Set OraDynaset = OraDatabase.CreateDynaset("select * from Project order by id asc", &H0&)
        'SeqID = 1
    

    For b = 1 To SeqIn
        Sql_Criteria = "id =' " & b & "'"
        OraDynaset.FindNext Sql_Criteria
        Seq = OraDynaset.Fields("Data")
        
        'Set objts = fso.OpenTextFile(FileData, ForReading, False)
        'Seq = Trim(objts.ReadLine)
        Count = 0
        For x = 0 To size - 1
            For y = 0 To size - 1
                If x * y <> 81 Then
                    blank = " "
                    found = InStr(Seq, blank)
                    num = Int(Left(Seq, found - 1))
                    Seq = Trim(Right(Seq, Len(Seq) - found + 1))
                Else
                    num = Trim(Seq)
                End If
                If arr(x, y) < num + 30 And arr(x, y) > num - 30 Then
                    Count = Count + 1
                End If
           Next y
        Next x
        MsgBox Count
        If Count > most Then
            most = Count
            same = b
        End If
    Next b
End Sub

Public Sub getFileData()
Dim x, y  As Integer

    maxx = Picture1.ScaleWidth
    maxy = Picture1.ScaleHeight
    
    ReDim color(maxx, maxy)
    
    For i = 0 To maxx - 1
        For j = 0 To maxy - 1
            tmp = CStr(Hex(Picture1.Point(i, j)))
            tmpR = Mid(tmp, 1, 2)
            tmpG = Mid(tmp, 3, 2)
            tmpB = Mid(tmp, 5, 2)
            
            tempR = val("&H" & tmpR)
            tempG = val("&H" & tmpG)
            tempB = val("&H" & tmpB)
            Temp = Int((tempR + tempG + tempB) / 3)
            color(i, j) = Temp
        Next j
    Next i
    
    maskX = Int(maxx / size)
    maskY = Int(maxy / size)
    
    Data = ""
    For i = 0 To size - 1
        x = i * maskX
        For j = 0 To size - 1
            y = j * maskY
            arr(i, j) = GetRepresentFile(x, y)
            Data = Data & arr(i, j) & " "
        Next j
    Next i
    
End Sub
 
Private Function GetRepresentFile(X1, Y1 As Integer) As Integer
Dim Temp As Double
    Temp = 0
    For n = X1 To maskX + X1 - 1
        For m = Y1 To maskY + Y1 - 1
             Temp = Temp + color(n, m)
        Next m
    Next n
    GetRepresentFile = Int(Temp / (maskX * maskY))
End Function

