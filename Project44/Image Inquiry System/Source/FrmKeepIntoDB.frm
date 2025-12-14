VERSION 5.00
Begin VB.Form FrmKeepIntoDB 
   Caption         =   "Fill Data Form"
   ClientHeight    =   4875
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7530
   LinkTopic       =   "Form1"
   ScaleHeight     =   4875
   ScaleWidth      =   7530
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtAddress 
      Height          =   1335
      Left            =   4800
      TabIndex        =   15
      Top             =   2640
      Width           =   2415
   End
   Begin VB.CommandButton btnSave 
      Caption         =   "&Save"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   6120
      TabIndex        =   14
      Top             =   4200
      Width           =   1215
   End
   Begin VB.TextBox txtHeigth 
      Height          =   375
      Left            =   6360
      TabIndex        =   12
      Top             =   2160
      Width           =   735
   End
   Begin VB.TextBox txtWeigth 
      Height          =   375
      Left            =   4800
      TabIndex        =   10
      Top             =   2160
      Width           =   735
   End
   Begin VB.TextBox txtAge 
      Height          =   375
      Left            =   6360
      TabIndex        =   8
      Top             =   1680
      Width           =   735
   End
   Begin VB.TextBox txtSex 
      Height          =   375
      Left            =   4800
      TabIndex        =   6
      Top             =   1680
      Width           =   735
   End
   Begin VB.TextBox txtSurename 
      Height          =   375
      Left            =   4800
      TabIndex        =   4
      Top             =   1200
      Width           =   2295
   End
   Begin VB.TextBox txtName 
      Height          =   375
      Left            =   4800
      TabIndex        =   2
      Top             =   720
      Width           =   2295
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   3255
      Left            =   480
      ScaleHeight     =   217
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   185
      TabIndex        =   0
      Top             =   600
      Width           =   2775
   End
   Begin VB.Label Label7 
      Caption         =   "Address :"
      Height          =   375
      Left            =   3840
      TabIndex        =   13
      Top             =   2760
      Width           =   735
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "Heigth :"
      Height          =   195
      Left            =   5760
      TabIndex        =   11
      Top             =   2280
      Width           =   555
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Weigth :"
      Height          =   195
      Left            =   3840
      TabIndex        =   9
      Top             =   2280
      Width           =   600
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Age :"
      Height          =   195
      Left            =   5880
      TabIndex        =   7
      Top             =   1800
      Width           =   375
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Sex :"
      Height          =   195
      Left            =   3840
      TabIndex        =   5
      Top             =   1800
      Width           =   360
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "LastName :"
      Height          =   195
      Left            =   3840
      TabIndex        =   3
      Top             =   1320
      Width           =   810
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "FirstName :"
      Height          =   195
      Left            =   3840
      TabIndex        =   1
      Top             =   840
      Width           =   795
   End
End
Attribute VB_Name = "FrmKeepIntoDB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim Sql, Seq As String
Dim SeqIn As Integer

Dim fso As New FileSystemObject
Dim objts As TextStream
Dim objFil As File
Dim color() As Integer
Dim maskX, maskY As Integer
Dim FileData, Data As String

Private Sub btnSave_Click()
    
    Set objts = fso.OpenTextFile("c:\sequence.txt", ForReading, False)   'Refer to file
                                                                    'sequence.txt for read
    Seq = Trim(objts.ReadLine)
    SeqIn = val(Seq) + 1
    
    OraDynaset.AddNew
    
    OraDynaset.Fields("id").Value = SeqIn
    OraDynaset.Fields("name").Value = txtName.Text
    OraDynaset.Fields("surename").Value = txtSurename.Text
    OraDynaset.Fields("Path").Value = FileName
    OraDynaset.Fields("sex").Value = txtSex.Text
    OraDynaset.Fields("Age").Value = txtAge.Text
    OraDynaset.Fields("Weigth").Value = txtWeigth.Text
    OraDynaset.Fields("Heigth").Value = txtHeigth.Text
    OraDynaset.Fields("Address") = txtAddress.Text
    Call getFileData
    OraDynaset.Fields("Data").Value = Data
    
    OraDynaset.Update
    OraDynaset.Refresh
    
    MsgBox "Success"
    Set objFil = fso.GetFile("c:\sequence.txt")
    Set objts = objFil.OpenAsTextStream(ForWriting)
    objts.Write SeqIn
    objts.Close
    Unload Me
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
            color(i, j) = Temp
        Next j
    Next i
    
    maskX = Int(maxx / size)
    maskY = Int(maxy / size)
    
    For i = 0 To size - 1
        x = i * maskX
        For j = 0 To size - 1
            y = j * maskY
            arr(i, j) = GetRepresent(x, y)
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

Private Function GetRepresent(X1, Y1 As Integer) As Integer
Dim Temp As Double
Dim tmp As String
    Temp = 0
    For n = X1 To maskX + X1 - 1
        For m = Y1 To maskY + Y1 - 1
            Temp = Temp + color(n, m)
        Next m
    Next n
    GetRepresent = Int(Temp / (maskX * maskY))
End Function

Private Sub Form_Load()
'Create the OraSession Object.
    Set OraSession = CreateObject("OracleInProcServer.XOraSession")
'Create the OraDatabase Object by opening a connection to Oracle
    Set OraDatabase = OraSession.DbOpenDatabase("exOracle", "teety/bobo", &H0&)
'Create the OraDynaset Object.
    Set OraDynaset = OraDatabase.CreateDynaset("select * from Project", &H0&)
End Sub

Sub searchData()
Dim fso As New FileSystemObject
Dim objts As TextStream
Dim objFil As File
Dim Seq As String
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

