VERSION 5.00
Begin VB.Form FrmAdvancedSearch 
   Caption         =   "Advance Search Form"
   ClientHeight    =   3930
   ClientLeft      =   3990
   ClientTop       =   4755
   ClientWidth     =   7395
   LinkTopic       =   "Form1"
   ScaleHeight     =   3930
   ScaleWidth      =   7395
   Begin VB.ComboBox cmbHeight 
      Height          =   315
      ItemData        =   "FrmAdvancedSearch.frx":0000
      Left            =   4440
      List            =   "FrmAdvancedSearch.frx":001C
      TabIndex        =   11
      Top             =   2160
      Width           =   1095
   End
   Begin VB.ComboBox cmbAge 
      Height          =   315
      ItemData        =   "FrmAdvancedSearch.frx":0068
      Left            =   6000
      List            =   "FrmAdvancedSearch.frx":008A
      TabIndex        =   9
      Top             =   1680
      Width           =   1095
   End
   Begin VB.ComboBox cmbSex 
      Height          =   315
      ItemData        =   "FrmAdvancedSearch.frx":00D4
      Left            =   4440
      List            =   "FrmAdvancedSearch.frx":00DE
      TabIndex        =   8
      Top             =   1680
      Width           =   615
   End
   Begin VB.CommandButton cmdSearch 
      Caption         =   "&Search"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5880
      TabIndex        =   7
      Top             =   3240
      Width           =   1335
   End
   Begin VB.TextBox txtSureName 
      Height          =   375
      Left            =   4440
      TabIndex        =   4
      Top             =   1200
      Width           =   1815
   End
   Begin VB.TextBox txtName 
      Height          =   375
      Left            =   4440
      TabIndex        =   2
      Top             =   720
      Width           =   1815
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   3255
      Left            =   360
      ScaleHeight     =   217
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   185
      TabIndex        =   0
      Top             =   360
      Width           =   2775
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "Cm."
      Height          =   195
      Left            =   5640
      TabIndex        =   12
      Top             =   2160
      Width           =   270
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Height :"
      Height          =   195
      Left            =   3480
      TabIndex        =   10
      Top             =   2160
      Width           =   555
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Age :"
      Height          =   315
      Left            =   5400
      TabIndex        =   6
      Top             =   1680
      Width           =   375
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Sex :"
      Height          =   195
      Left            =   3480
      TabIndex        =   5
      Top             =   1680
      Width           =   360
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "LastName :"
      Height          =   195
      Left            =   3480
      TabIndex        =   3
      Top             =   1200
      Width           =   810
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "FirstName :"
      Height          =   195
      Left            =   3480
      TabIndex        =   1
      Top             =   720
      Width           =   795
   End
End
Attribute VB_Name = "FrmAdvancedSearch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim OraDyna As OraDynaset
Dim Command, Sql As String
Dim maskX, maskY As Integer
Dim same As Integer
Dim Data As String
Dim Seq As String

Private Sub cmdSearch_Click()
    Sql_Command = GetSql_Command
    
    Trim (Sql_Command)
    Sql = "select count(id) as amount from project where " & Sql_Command
    
    Set OraDyna = OraDatabase.CreateDynaset(Sql, &H0&)
    
    OraDynaset.FindFirst Sql_Command
     If OraDynaset.NoMatch Then
        MsgBox "Can not Find Record"
    ElseIf Picture1.Picture = none Then
        FileName = OraDynaset.Fields("path")
        FrmShowResult.Picture1.Picture = LoadPicture(FileName)
        FrmShowResult.txtID.Text = OraDynaset.Fields("id")
        FrmShowResult.txtName.Text = OraDynaset.Fields("name")
        FrmShowResult.txtSureName.Text = OraDynaset.Fields("surename")
        FrmShowResult.txtSex.Text = OraDynaset.Fields("sex")
        FrmShowResult.txtAge.Text = OraDynaset.Fields("age")
        FrmShowResult.txtHeight.Text = OraDynaset.Fields("Heigth")
        FrmShowResult.txtWieght.Text = OraDynaset.Fields("Weigth")
        FrmShowResult.Show
    Else
        Call search
        Sql_Command = "id='" & same & "'"
        OraDynaset.FindFirst Sql_Command
        FileName = OraDynaset.Fields("path")
        FrmShowResult.Picture1.Picture = LoadPicture(FileName)
        FrmShowResult.txtID.Text = OraDynaset.Fields("id")
        FrmShowResult.txtName.Text = OraDynaset.Fields("name")
        FrmShowResult.txtSureName.Text = OraDynaset.Fields("surename")
        FrmShowResult.txtSex.Text = OraDynaset.Fields("sex")
        FrmShowResult.txtAge.Text = OraDynaset.Fields("age")
        FrmShowResult.txtHeight.Text = OraDynaset.Fields("Heigth")
        FrmShowResult.txtWieght.Text = OraDynaset.Fields("Weigth")
        FrmShowResult.Show
    End If
End Sub

Function GetSql_Command() As String
    Command = ""
    If txtName.Text <> "" Then
        Command = "name ='" & txtName.Text & "'"
    ElseIf txtSureName.Text <> "" Then
        If Command <> "" Then
            Command = Command & "and surename = '" & txtSureName.Text & "'"
        Else: Command = "surename = '" & txtSureName.Text & "'"
        End If
    ElseIf cmbSex.Text <> "" Then
        If Command <> "" Then
            Command = Command & "and sex = '" & cmbSex.Text & "'"
        Else: Command = "sex = '" & cmbSex.Text & "'"
        End If
    ElseIf cmbAge.Text <> "" Then
        Call getAge
    ElseIf cmbHeight <> "" Then
        Call getHeight
    End If
    GetSql_Command = Command
End Function

Private Sub getAge()
Dim strAge  As String
Dim valAge As Integer
    strAge = cmbAge.Text
    valAge = val(Left(strAge, 2))
    For i = 0 To 4
        If Command <> "" Then
            Command = Command & "or age = '" & Str(valAge + i) & "'"
        Else: Command = "age = '" & Str(valAge + i) & "'"
        End If
    Next i
End Sub

Private Sub getHeight()
Dim strHeight  As String
Dim valHeight As Integer
    strHeight = cmbHeight.Text
    valHeight = val(Left(strHeight, 3))
    For i = 0 To 4
        If Command <> "" Then
            Command = Command & "or heigth = '" & Str(valHeight + i) & "'"
        Else: Command = "heigth = '" & Str(valHeight + i) & "'"
        End If
    Next i
End Sub

Sub search()
Dim fso As New FileSystemObject
Dim objts As TextStream
Dim objFil As File
Dim Seq As String
Dim SeqIn, most, found, num As Integer
Dim FileData As String
Dim blank As String
Dim Count As Integer

    Call getData
    
    Set objts = fso.OpenTextFile("c:\sequence.txt", ForReading, False)
    Seq = Trim(objts.ReadLine)
    SeqIn = val(Seq)
    most = 0
    
    For b = 1 To SeqIn
        Sql_Criteria = "id =' " & b & "'"
        OraDynaset.FindNext Sql_Criteria
        FileData = OraDynaset.Fields("Data")
        
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
                    Count = Count + 1
                End If
           Next y
        Next x
        
        If Count > most Then
            most = Count
            same = b
        End If
    Next b
    
End Sub

Public Sub getData()
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
            Picture1.PSet (i, j), RGB(Temp, Temp, Temp)
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
            Debug.Print arr(i, j)
        Next j
    Next i
    
    Dim fso As New FileSystemObject
    Dim objFil As File
    Dim objts As TextStream
    
    Dim tee As String
    FileData = Left(FileName, Len(FileName) - 4) & ".txt"
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

Private Sub Form_Load()
'Create the OraSession Object.
    Set OraSession = CreateObject("OracleInProcServer.XOraSession")
'Create the OraDatabase Object by opening a connection to Oracle
    Set OraDatabase = OraSession.DbOpenDatabase("exOracle", "teety/bobo", &H0&)
'Create the OraDynaset Object.
    Set OraDynaset = OraDatabase.CreateDynaset("select * from Project order by id asc", &H0&)

End Sub

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


