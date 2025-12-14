Attribute VB_Name = "SpkModule"
Option Explicit
'Play Wave Declaration
Public Declare Function waveOutGetNumDevs Lib "winmm.dll" () As Long
Public Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long

'Database Declaration
Public Con As Connection
Public strConnect As String

'Wave File Header Declaration
Type WaveHeader
        h1 As String * 4        ' Label "RIFF"
        h2 As Long               ' Filesize - 8 bytes --> length field(4 bytes)
        h3 As String * 4        ' wave chunk identification (4 bytes)
        h4 As String * 4        ' format sub-chunk identification (4 bytes)
        h5 As Long               ' length of format sub-chunk (4 byte integer)
        h6 As Integer           ' format specifier (2 byte integer)
        h7 As Integer           ' number of channels (2 byte integer)
        h8 As Long               ' sample rate in Hz (4 byte integer)
        h9 As Long               ' bytes per second (4 byte integer)
        h10 As Integer         ' bytes per sample (2 byte integer)
        h11 As Integer         ' bytes per channel (2 byte integer)
        h12 As String * 4     ' data sub-chunk identification (4 bytes)
        h13 As Long            ' length of data sub-chunk (4 byte integer)    {waveheader length 44 byte}
    End Type
    
    Type DataType
        a1 As Byte
        a2 As Byte
        a3 As Byte
        a4 As Byte
        a5 As Byte
        a6 As Byte
        a7 As Byte
        a8 As Byte
        a9 As Byte
        a10 As Byte
        a11 As Byte
        a12 As Byte
        a13 As Byte
        a14 As Byte
        a15 As Byte
        a16 As Byte
        a17 As Byte
        a18 As Byte
        a19 As Byte
        a20 As Byte
    End Type
    
    'WordBucket Declaration
    Public WorkingPtr As Long
    Public StartPointPtr As Long
    Public Wordbuffer As String
    Public WordBucket(5) As String
    Public CurBucketIndex As Integer
    Public BucketEndPtr As Integer
    Public CheckPtr As Long
    Public Chk As Boolean
    Public CantCut As Boolean
    Public CharBuff As String
    
    'Other Declaration
    Public PhonePath As String
    Public Tempfile As String
     
Sub Main()
        Set Con = New Connection
        strConnect = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source  =" & App.Path & "\Database\dict.mdb"
        Con.Open strConnect
        PhonePath = App.Path & "\Phone\"
        frmain.Show 1
 End Sub

Public Function HasSoundCard() As Boolean
  If waveOutGetNumDevs > 0 Then
    HasSoundCard = True
  Else
    HasSoundCard = False
  End If
End Function

Public Sub PlayWave(W$)
    StopWave
    Dim i As Long, RS As String, cb As Long
    RS = Space$(128)
    i = mciSendString("open waveaudio!" & W$ & " alias sound", RS, 128, cb)
    If i Then MsgBox "PlayWave Error!"
    i = mciSendString("play sound", RS, 128, cb)
End Sub

Public Sub StopWave()
    Dim i As Long, RS As String, cb As Long
    RS = Space$(128)
    i = mciSendString("stop sound", RS, 128, cb)
    i = mciSendString("close sound", RS, 128, cb)
End Sub
Public Sub MergeWave(f1$, f2$)
        'File Pointer
        Dim File_p1 As Long
        Dim File_p2 As Long
        Dim File_p3 As Long
        'File Name
        Dim file1 As String
        Dim File2 As String
        Dim File3 As String
        'Wave Header
        Dim Head1 As WaveHeader
        Dim Head2 As WaveHeader
        Dim Head3 As WaveHeader
        'Buffer
        Dim Buffer As Byte
        Dim Data As DataType
        
    Dim i As Long, j As Long, k As Long
            
        StopWave
        file1 = f1
        File2 = f2
        File3 = App.Path & "\" & "mix.wav"
        
        'Initial file pointer
        File_p1 = 1
        File_p2 = 1
        File_p3 = 1
        
        Open file1 For Binary Access Read As #1
        Open File2 For Binary Access Read As #2
        Open File3 For Binary Access Write As #3
        
        Seek #1, File_p1
        Get #1, , Head1
        Seek #2, File_p2
        Get #2, , Head2
        
        Head3 = Head1
        Head3.h2 = Head1.h2 + Head2.h2 + 28
        Head3.h13 = Head1.h13 + Head2.h13
        Put #3, , Head3
        
        File_p3 = 45
        File_p1 = 45
        File_p2 = 45
        
        i = (Head1.h2 - 36) - File_p1 + 1
        j = i Mod 20 'เศษ
        k = i \ 20 'ผลเต็ม
        
        For i = 1 To k
                 Seek #1, File_p1
                Get #1, , Data
                Seek #3, File_p3
                Put #3, , Data
                File_p3 = File_p3 + 20
                File_p1 = File_p1 + 20
        Next i
        
        For i = 1 To j
                Seek #1, File_p1
                Get #1, , Buffer
                Seek #3, File_p3
                Put #3, , Buffer
                File_p3 = File_p3 + 1
                File_p1 = File_p1 + 1
        Next i
        
        
        i = (Head2.h2 - 36) - File_p2 + 1
        j = i Mod 20 'เศษ
        k = i \ 20 'ผลเต็ม
        
        For i = 1 To k
                Seek #2, File_p2
                Get #2, , Data
                Seek #3, File_p3
                Put #3, , Data
                File_p3 = File_p3 + 20
                File_p2 = File_p2 + 20
        Next i
        
        For i = 1 To j
                Seek #2, File_p2
                Get #2, , Buffer
                Seek #3, File_p3
                Put #3, , Buffer
                File_p3 = File_p3 + 1
                File_p2 = File_p2 + 1
        Next i
        
       
        Close #1
        Close #2
        Close #3
 End Sub

 Public Sub ClearMix()
 Dim f1 As String, f2 As String
 Dim fso As New FileSystemObject, mixfile
 Dim file1 As String
    
     f1 = PhonePath & "sp.wav"
     f2 = f1
     MergeWave f1, f2

End Sub

Public Function ClearBucket()
Dim i As Integer
    
    For i = 0 To 5
        WordBucket(i) = ""
    Next i
    BucketEndPtr = -1
    CurBucketIndex = -1
End Function

Private Function CheckChar(ch As String) As Boolean
    CheckChar = False
    If (ch = " ") Or (ch = Chr(13)) Then CheckChar = True
End Function

Private Sub InitVar()
    StartPointPtr = WorkingPtr
    CharBuff = ""
    ClearBucket
    CurBucketIndex = -1
    CheckPtr = -1
    Chk = True
    CantCut = False
End Sub

Private Function CheckVowel(CheckPtr As Long, CharBuff As String) As Boolean
Dim ch As String

'CheckPtr = CheckPtr - 1
ch = Mid(CharBuff, CheckPtr + 1, 1)
CheckVowel = False
If (ch = "ะ") Or (ch = "า") Or (ch = "ิ") Or (ch = "ี") Or (ch = "ึ") Or (ch = "ื") Or (ch = "ุ") Or (ch = "ู") Or (ch = "่") Or (ch = "้") Or (ch = "๊") Or (ch = "๋") Or (ch = "็") Or (ch = "์") Or (ch = "ั") Or (ch = "ำ") Then
    CheckVowel = True
End If
End Function

Private Sub GetSymbol(Word As String)
Dim RS As Recordset
Dim SqlCmd As String
Dim allSym As String
Dim Sym As String
Dim ch As String
Dim spPos As Long, i As Long

    Set RS = New Recordset
    Set RS = Nothing
    SqlCmd = "SELECT SYMBOL From tblDict WHERE WORD = '" & Word & "';"
    Set RS = Con.Execute(SqlCmd)
    allSym = RS.Fields(0)
    
    Do Until Len(allSym) <= 0
        spPos = InStr(1, allSym, " ", vbTextCompare)
        If spPos = 0 Then
            Sym = allSym
            allSym = ""
        ElseIf spPos > 0 Then
            Sym = Left(allSym, (spPos - 1))
            i = Len(allSym) - spPos
            allSym = Right(allSym, i)
        End If
        frmain.txtsym.Text = frmain.txtsym.Text & Sym & vbCrLf
    Loop
    If frmain.musesil.Checked = True Then
            frmain.txtsym.Text = frmain.txtsym.Text & "sil" & vbCrLf
    End If
End Sub

Public Sub CutWord()
Dim RS As Recordset
Dim ch As String * 1
Dim Pass As Boolean
Dim Result As String
Dim Word As String
Dim SqlCmd As String
    
    WorkingPtr = 0
    InitVar
    Result = ""
    Word = ""
    Pass = False

    Do Until StartPointPtr > Len(frmain.txtspk.Text)
    
    Do Until WorkingPtr = Len(frmain.txtspk.Text) Or (Pass = True)
        frmain.txtspk.SelStart = WorkingPtr
        frmain.txtspk.SelLength = 1
        ch = frmain.txtspk.SelText
        Pass = CheckChar(ch)
        CharBuff = CharBuff & ch
        WorkingPtr = WorkingPtr + 1
        Set RS = New Recordset
        Set RS = Nothing
        SqlCmd = "SELECT WORD From tblDict WHERE WORD = '" & CharBuff & "';"
        Set RS = Con.Execute(SqlCmd)
        
        If RS.BOF = False Then Result = RS.Fields(0)
        If Not (Result = "") Then
            CurBucketIndex = CurBucketIndex + 1
            WordBucket(CurBucketIndex) = CharBuff
            BucketEndPtr = CurBucketIndex
            Result = ""
        End If
    Loop
    
    Do Until Chk = False
        If BucketEndPtr < 0 Then 'ถ้าตัดไม่ได้เลย
            Chk = False
            CantCut = True
        Else 'ตัดได้
        
        Word = WordBucket(BucketEndPtr)
        CheckPtr = StartPointPtr + Len(Word)
        If CheckPtr <= Len(frmain.txtspk.Text) Then
            Chk = CheckVowel(CheckPtr, frmain.txtspk.Text) 'ตรวจสอบตัวถัดไปว่านำหน้าด้วยสระรึเปล่า
        Else
            Chk = False 'สุคคำแล้ว
        End If
        If Chk = True Then BucketEndPtr = BucketEndPtr - 1
        If BucketEndPtr < 0 Then
            BucketEndPtr = BucketEndPtr + 1
            CantCut = True
            Chk = False
        Else
            Word = WordBucket(BucketEndPtr)
            CheckPtr = StartPointPtr + Len(Word)
            Chk = False
        End If
        
        End If
    Loop
    
    If CantCut = False Then
        WorkingPtr = StartPointPtr + Len(Word)
    Else
        WorkingPtr = StartPointPtr + Len(Word) + 1
    End If
    
    If Word <> "" Then
        frmain.txtwrd.Text = frmain.txtwrd.Text & Word & vbCrLf
        GetSymbol (Word)
    End If
    InitVar
    Word = ""
    Pass = False
    Loop
       
End Sub

