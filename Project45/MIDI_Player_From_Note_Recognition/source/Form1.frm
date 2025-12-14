VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{C1A8AF28-1257-101B-8FB0-0020AF039CA3}#1.1#0"; "MCI32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   10500
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   15240
   LinkTopic       =   "Form1"
   ScaleHeight     =   10500
   ScaleWidth      =   15240
   Begin VB.CommandButton OpenMidi 
      Caption         =   "Open MIDI"
      Height          =   495
      Left            =   3840
      TabIndex        =   13
      Top             =   8760
      Width           =   1215
   End
   Begin VB.CommandButton SaveMidi 
      Caption         =   "Save as MIDI"
      Height          =   495
      Left            =   3960
      TabIndex        =   12
      Top             =   7440
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "File"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   480
      TabIndex        =   9
      Top             =   8520
      Width           =   3255
      Begin VB.TextBox FileName 
         Height          =   315
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   3015
      End
   End
   Begin VB.ListBox NoteList 
      Height          =   5520
      Left            =   11400
      TabIndex        =   8
      Top             =   3120
      Width           =   1695
   End
   Begin VB.CommandButton DetectButton 
      Caption         =   "&Detect Note"
      Height          =   495
      Left            =   9600
      TabIndex        =   7
      Top             =   9480
      Width           =   1095
   End
   Begin VB.ListBox PositionList 
      Height          =   5520
      Left            =   13320
      TabIndex        =   6
      Top             =   3120
      Width           =   1575
   End
   Begin VB.CommandButton LocateButton 
      Caption         =   "&Locate Note"
      Height          =   495
      Left            =   9600
      TabIndex        =   5
      Top             =   8880
      Width           =   1095
   End
   Begin VB.CommandButton DelSLButton 
      Caption         =   "Del &Staffline"
      Height          =   495
      Left            =   9600
      TabIndex        =   4
      Top             =   8280
      Width           =   1095
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   7800
      TabIndex        =   3
      Text            =   "250"
      Top             =   7800
      Width           =   1695
   End
   Begin VB.CommandButton ThresholdButton 
      Caption         =   "&Threshold"
      Height          =   495
      Left            =   9600
      TabIndex        =   2
      Top             =   7680
      Width           =   1095
   End
   Begin VB.ListBox BMPList 
      Height          =   1230
      Left            =   11400
      TabIndex        =   1
      Top             =   840
      Width           =   3495
   End
   Begin MSComDlg.CommonDialog OpenDialog 
      Left            =   1560
      Top             =   7440
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DefaultExt      =   "*.bmp"
      FileName        =   "*.bmp"
      Filter          =   "Bitmap Files(*.bmp)|*.bmp"
   End
   Begin VB.CommandButton OpenButton 
      Caption         =   "&Open Image"
      Height          =   495
      Left            =   360
      TabIndex        =   0
      Top             =   7440
      Width           =   1095
   End
   Begin MCI.MMControl MMControl1 
      Height          =   495
      Left            =   480
      TabIndex        =   11
      Top             =   9360
      Width           =   1200
      _ExtentX        =   2117
      _ExtentY        =   873
      _Version        =   393216
      PrevVisible     =   0   'False
      NextVisible     =   0   'False
      BackVisible     =   0   'False
      StepVisible     =   0   'False
      RecordVisible   =   0   'False
      EjectVisible    =   0   'False
      DeviceType      =   ""
      FileName        =   ""
   End
   Begin MSComDlg.CommonDialog SaveMidiDialog 
      Left            =   5280
      Top             =   7440
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog OpenMidiDialog 
      Left            =   5280
      Top             =   8760
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame2 
      Caption         =   "MIDI Fuction"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2055
      Left            =   360
      TabIndex        =   14
      Top             =   8160
      Width           =   4815
   End
   Begin VB.Frame Frame4 
      Caption         =   "Function"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2895
      Left            =   7320
      TabIndex        =   16
      Top             =   7320
      Width           =   3495
      Begin VB.Label Label4 
         Caption         =   "Detect Note's Type"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   360
         TabIndex        =   23
         Top             =   2280
         Width           =   2055
      End
      Begin VB.Label Label3 
         Caption         =   "Locate Note's Position"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   22
         Top             =   1680
         Width           =   2175
      End
      Begin VB.Label Label2 
         Caption         =   "Delete Staff Line"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   600
         TabIndex        =   21
         Top             =   1080
         Width           =   1575
      End
   End
   Begin VB.Frame Frame5 
      Caption         =   "Bitmap Information"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   11160
      TabIndex        =   17
      Top             =   480
      Width           =   3975
   End
   Begin VB.Frame Frame6 
      Caption         =   "Note Information"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   6495
      Left            =   11160
      TabIndex        =   18
      Top             =   2520
      Width           =   3975
      Begin VB.Label Label1 
         Caption         =   "Position"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   2160
         TabIndex        =   20
         Top             =   360
         Width           =   1455
      End
      Begin VB.Label Note 
         Caption         =   "Note"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   222
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   19
         Top             =   360
         Width           =   1575
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Picture"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   6735
      Left            =   360
      TabIndex        =   15
      Top             =   480
      Width           =   10575
      Begin VB.Image Image1 
         Height          =   6255
         Left            =   240
         Stretch         =   -1  'True
         Top             =   360
         Width           =   10215
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim header As BITMAPINFO
Dim colortable(256) As RGBQUAD
Dim stImage As String, stOut As String
Dim pos As Long
Dim loop1 As Boolean
Dim part As Byte, line1 As Byte, num As Byte, gap As Byte, noteCount As Byte
Dim i As Integer, j As Integer, k As Integer, l As Integer, m As Integer, count1 As Integer
Dim pix() As Byte
Dim sumHA() As Integer, sumVP() As Integer, sumHN() As Integer, staffLine1() As Integer, staffLine2() As Integer
Dim note1() As Integer, note2() As Integer, note3() As Integer, note4() As Integer
Dim stprint As String
Dim PauseClick As Boolean
Dim MidiName As String
Dim MidiPos As Long
Dim MidiPos2 As Long
Dim NumberOfNote As Integer
Dim TrackData() As TrackChunk
Dim TrackLength(4) As Byte
Dim round As Byte, mCount As Byte
Dim sF As Boolean, fF As Boolean

Private Sub DelSLButton_Click()
    ''''''' Find&Delete staffline '''''''
    Call findSL
    Call delSL
    Call out2file
    Image1 = LoadPicture(stOut)
End Sub

Private Sub DetectButton_Click()
    '''''' Detect Note ''''''
    round = 1
    NumberOfNote = 0
    Call detectNote
    round = 2
    mCount = 1
    ReDim TrackData(NumberOfNote) As TrackChunk
    Call detectNote
End Sub

Private Sub LocateButton_Click()
    ''''''' Find position of note ''''''
    Call sumVerPart
    For l = 0 To part
        gap = staffLine1(l, 1) - staffLine2(l, 0)
        Call locateNote
        For num = 0 To noteCount - 1
            PositionList.AddItem ("(" + Str(note1(num)) + " to " + Str(note2(num)) + ") , (" + Str(note3(num)) + " to " + Str(note4(num)) + ")")
        Next num
    Next l
End Sub

Private Sub OpenButton_Click()
    '''''' Open image ''''''
    OpenDialog.ShowOpen
    stImage = OpenDialog.FileName
    If (stImage <> "*.bmp") And (stImage <> "*.*") Then
        Image1 = LoadPicture(stImage)
        Call getImageData
        '''''' Show header information '''''''
        BMPList.Clear
        BMPList.AddItem ("++File Header++")
        BMPList.AddItem ("bfType             = " & header.bmifHeader.bfType)
        BMPList.AddItem ("bfSize             = " & header.bmifHeader.bfSize)
        BMPList.AddItem ("bfReserved1        = " & header.bmifHeader.bfReserved1)
        BMPList.AddItem ("bfReserved2        = " & header.bmifHeader.bfReserved2)
        BMPList.AddItem ("bfOffBits          = " & header.bmifHeader.bfOffBits)
        BMPList.AddItem ("++Image Header++")
        BMPList.AddItem ("biSize             = " & header.bmiHeader.biSize)
        BMPList.AddItem ("biWidth            = " & header.bmiHeader.biWidth)
        BMPList.AddItem ("biHeight           = " & header.bmiHeader.biHeight)
        BMPList.AddItem ("biPlanes           = " & header.bmiHeader.biPlanes)
        BMPList.AddItem ("biBitCount         = " & header.bmiHeader.biBitCount)
        BMPList.AddItem ("biCompression      = " & header.bmiHeader.biCompression)
        BMPList.AddItem ("biSizeImage        = " & header.bmiHeader.biSizeImage)
        BMPList.AddItem ("biXPelsPerMeter    = " & header.bmiHeader.biXPelsPerMeter)
        BMPList.AddItem ("biYPelsPerMeter    = " & header.bmiHeader.biYPelsPerMeter)
        BMPList.AddItem ("biClrUsed          = " & header.bmiHeader.biClrUsed)
        BMPList.AddItem ("biClrImportant     = " & header.bmiHeader.biClrImportant)
    End If
End Sub

Private Sub ThresholdButton_Click()
    '''''' Threshold ''''''
    Call therdshold
    Call out2file
    Image1 = LoadPicture(stOut)
End Sub

Private Sub getImageData()
    ''''''' Get header ''''''
    Open stImage For Binary As #1
    Get #1, 1, header
    '''''' Get pixel '''''''
    ReDim pix(header.bmiHeader.biWidth - 1, header.bmiHeader.biHeight - 1) As Byte
    pos = 55
    For i = 1 To 256
        Get #1, pos, colortable(i)
        pos = pos + 4
    Next i
    pos = header.bmifHeader.bfOffBits + 1
    For j = header.bmiHeader.biHeight - 1 To 0 Step -1
        For i = 0 To header.bmiHeader.biWidth - 1
            Get #1, pos, pix(i, j)
            pos = pos + 1
        Next i
    Next j
    Close #1
End Sub

Private Sub out2file()
    '''''' Output Image to file ''''''
    stOut = "D:\out.bmp"
    Open stOut For Binary As #1
        Put #1, 1, header
        pos = 55
        For i = 1 To 256
            Put #1, pos, colortable(i)
            pos = pos + 4
        Next i
        pos = header.bmifHeader.bfOffBits + 1
        For j = header.bmiHeader.biHeight - 1 To 0 Step -1
            For i = 0 To header.bmiHeader.biWidth - 1
                Put #1, pos, pix(i, j)
                pos = pos + 1
            Next i
        Next j
    Close #1
End Sub

Private Sub therdshold()
        '''''' Threshold '''''''
    For j = 0 To header.bmiHeader.biHeight - 1
            For i = 0 To header.bmiHeader.biWidth - 1
                    If pix(i, j) < Text1.Text Then
                        pix(i, j) = 0
                    Else
                        pix(i, j) = 255
                    End If
            Next i
    Next j
End Sub

Private Sub findSL()
    ''''''' Sum horizontal whole pix '''''''
    ReDim sumHA(header.bmiHeader.biHeight - 1) As Integer
    For j = 0 To header.bmiHeader.biHeight - 1
        count1 = 0
        For i = 0 To header.bmiHeader.biWidth - 1
            If pix(i, j) = 0 Then
                count1 = count1 + 1
            End If
        Next i
        sumHA(j) = count1
    Next j
    
    '''''' Find Max '''''
    Dim max As Integer
    max = 0
    For i = 0 To header.bmiHeader.biHeight - 1
        If sumHA(i) > max Then
            max = sumHA(i)
        End If
    Next i
    
    ''''''' How many part? '''''
    line1 = 1
    num = 0
    count1 = 0
    For i = 0 To header.bmiHeader.biHeight - 1
        If (sumHA(i) > (max * 0.8)) Then
            count1 = count1 + 1
            loop1 = True
            Do While loop1
                i = i + 1
                If (sumHA(i) < (max * 0.8)) Then
                    loop1 = False
                End If
            Loop
        End If
    Next i
    count1 = count1 / 5
    part = count1 - 1
    '''''' Find staffline ''''''
    ReDim staffLine1(part, 4) As Integer
    ReDim staffLine2(part, 4) As Integer
    For i = 0 To header.bmiHeader.biHeight - 1
        If sumHA(i) > (max * 0.8) Then
            staffLine1(num, line1 - 1) = i
            loop1 = True
            Do While loop1
                If (sumHA(i + 1) < (max * 0.8)) Then
                    staffLine2(num, line1 - 1) = i
                    loop1 = False
                End If
                i = i + 1
            Loop
            If line1 = 1 Then
                line1 = line1 + 1
            Else
                If line1 = 5 Then
                    line1 = 1
                    num = num + 1
                Else
                    line1 = line1 + 1
                End If
            End If
        End If
    Next i
End Sub

Private Sub delSL()
    '''''' Delete staffLine ''''''
    For k = 0 To part
        gap = staffLine1(k, 1) - staffLine2(k, 0)
        '''' main ''''
        For l = 0 To 4
            For i = 0 To header.bmiHeader.biWidth - 1
                    If pix(i, staffLine1(k, l) - 2) = 0 And pix(i, staffLine2(k, l) + 2) = 0 Then
                    Else
                            For j = staffLine1(k, l) - 1 To staffLine2(k, l) + 1
                                pix(i, j) = 255
                            Next j
                    End If
            Next i
        Next l
        '''' sub top''''
        For l = 0 To 4
            For i = 0 To header.bmiHeader.biWidth - 1
                If pix(i, staffLine1(k, 0) - (gap * (l + 1)) - 3) = 0 And pix(i, staffLine2(k, 0) - (gap * (l + 1)) + 3) = 0 Then
                Else
                    For j = staffLine1(k, 0) - (gap * (l + 1)) - 2 To staffLine2(k, 0) - (gap * (l + 1)) + 2
                        pix(i, j) = 255
                    Next j
                End If
            Next i
        Next l
        '''' sub bottom''''
        For l = 0 To 4
            For i = 0 To header.bmiHeader.biWidth - 1
                If pix(i, staffLine1(k, 4) + (gap * (l + 1)) - 3) = 0 And pix(i, staffLine2(k, 4) + (gap * (l + 1)) + 3) = 0 Then
                Else
                    For j = staffLine1(k, 4) + (gap * (l + 1)) - 2 To staffLine2(k, 4) + (gap * (l + 1)) + 2
                        pix(i, j) = 255
                    Next j
                End If
            Next i
        Next l
    Next k
End Sub

Private Sub sumVerPart()
    '''''' Sum vertical each part ''''''
    ReDim sumVP(part, header.bmiHeader.biWidth - 1) As Integer
    For k = 0 To part
        gap = staffLine1(k, 1) - staffLine2(k, 0)
        For i = 0 To header.bmiHeader.biWidth - 1
            count1 = 0
            For j = (staffLine1(k, 0) - (gap * 4)) To (staffLine2(k, 4) + (gap * 4))
                If pix(i, j) = 0 Then
                    count1 = count1 + 1
                End If
            Next j
            sumVP(k, i) = count1
        Next i
    Next k
End Sub

Private Sub locateNote()
    '''''' Find position of note ''''''
    '''''' x ''''''''
    j = -1
    noteCount = 0
    Do While (j <> header.bmiHeader.biWidth - 1)
        j = j + 1
        If (sumVP(l, j) > 0) Then
            k = 0
            Do Until (sumVP(l, j + k) = 0)
                k = k + 1
            Loop
            If k > 5 Or (k < 5 And sumVP(l, j) > 5) Then
                noteCount = noteCount + 1
                j = j + k
            Else  ''''' noise
            End If
        End If
    Loop
    ReDim note1(noteCount - 1) As Integer, note2(noteCount - 1) As Integer, note3(noteCount - 1) As Integer, note4(noteCount - 1) As Integer
    j = -1
    num = 0
    Do While (j <> header.bmiHeader.biWidth - 1)
            j = j + 1
            If (sumVP(l, j) > 0) Then
                k = 0
                Do Until (sumVP(l, j + k) = 0)
                    k = k + 1
                Loop
                If k > 5 Or (k < 5 And sumVP(l, j) > 5) Then
                    note1(num) = j
                    j = j + k
                    note2(num) = j - 1
                num = num + 1
                Else  ''''' noise
                End If
            End If
    Loop
    '''''' y ''''''
    ReDim sumHN((staffLine2(l, 4) + (gap * 4)) - (staffLine1(l, 0) - (gap * 4)))
    For num = 0 To noteCount - 1
        k = 0
        For j = (staffLine1(l, 0) - (gap * 4)) To (staffLine2(l, 4) + (gap * 4))
            count1 = 0
            For i = note1(num) To note2(num)
                If pix(i, j) = 0 Then
                    count1 = count1 + 1
                End If
            Next i
            sumHN(k) = count1
            k = k + 1
        Next j

        i = -1
        loop1 = True
        Do While (i <> (k - 1)) And loop1
            i = i + 1
            If sumHN(i) > 0 Then
                m = 0
                Do Until (sumHN(i + m) = 0)
                    m = m + 1
                Loop
                If m > 5 Then
                    note3(num) = (staffLine1(l, 0) - (gap * 4)) + i
                    i = i + m
                    note4(num) = (staffLine1(l, 0) - (gap * 4)) + (i - 1)
                    loop1 = False
                Else  '''' noise
                End If
            End If
        Loop
    Next num
End Sub

Private Function symmetry(ByVal sel As Byte, ByRef part1, ByRef part2, ByVal val As Single) As Boolean
    Select Case sel
        Case 1
                For i = note1(num) To note2(num)
                    For j = note3(num) To (note3(num) + note4(num)) \ 2
                        If pix(i, j) = 0 Then
                            part1 = part1 + 1
                        End If
                    Next j
                    For j = (note3(num) + note4(num)) \ 2 To note4(num)
                        If pix(i, j) = 0 Then
                            part2 = part2 + 1
                        End If
                    Next j
                Next i
            Case 2
                For j = note3(num) To note4(num)
                    For i = note1(num) To (note1(num) + note2(num)) \ 2
                        If pix(i, j) = 0 Then
                            part1 = part1 + 1
                        End If
                    Next i
                    For i = (note1(num) + note2(num)) \ 2 To note2(num)
                        If pix(i, j) = 0 Then
                            part2 = part2 + 1
                        End If
                    Next i
                Next j
        End Select
        If Abs(part1 - part2) < ((note2(num) - note1(num)) * (note4(num) - note3(num)) * val) Then
            symmetry = True
        Else
            symmetry = False
        End If
End Function

Private Sub getPitch(sel As Integer, s As Integer, n1 As Integer, n2 As Integer)
        ''''''' determine pitch
        Select Case sel
            ''''' QH   o|
            Case 1
                    s = ((s + note4(num)) \ 2) + 1
            ''''' QH   |o
            Case 2
                    s = ((s + note3(num)) \ 2) + 1
            ''''' Whole
            Case 3
                    s = ((note3(num) + note4(num)) \ 2) + 1
            ''''' E   o|
            Case 4
                    s = ((s + n2) \ 2) + 1
            ''''' E   |o
            Case 5
                    s = ((s + n1) \ 2) + 1
            ''''' E o|~
            Case 6
                    s = ((s + note4(num)) \ 2) + 1
            ''''' E |o~
            Case 7
                s = ((s + note3(num)) \ 2) + 1
        End Select
        Select Case s
            Case staffLine1(l, 0) - (gap * 3) - 1 To staffLine1(l, 0) - (gap * 3) + 1
                    If round = 1 Then
                        stprint = stprint & " E "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 88
                        End If
                    End If
            Case staffLine1(l, 0) - (gap * 3) + 2 To staffLine1(l, 0) - (gap * 2) - 2
                    If round = 1 Then
                        stprint = stprint & " D "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 86
                        End If
                    End If
            Case staffLine1(l, 0) - (gap * 2) - 1 To staffLine1(l, 0) - (gap * 2) + 1
                    If round = 1 Then
                        stprint = stprint & " C "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 84
                        End If
                    End If
            Case staffLine1(l, 0) - (gap * 2) + 2 To staffLine1(l, 0) - gap - 2
                    If round = 1 Then
                        stprint = stprint & " B "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 83
                        End If
                    End If
            Case staffLine1(l, 0) - gap - 1 To staffLine1(l, 0) - gap + 1
                    If round = 1 Then
                        stprint = stprint & " A "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 81
                        End If
                    End If
            Case staffLine1(l, 0) - gap + 2 To staffLine1(l, 0) - 2
                    If round = 1 Then
                        stprint = stprint & " G "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 79
                        End If
                    End If
            Case staffLine1(l, 0) - 1 To staffLine2(l, 0) + 1
                    If round = 1 Then
                        stprint = stprint & " F "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 77
                        End If
                    End If
            Case staffLine2(l, 0) + 2 To staffLine1(l, 1) - 2
                    If round = 1 Then
                        stprint = stprint & " E "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 76
                        End If
                    End If
            Case staffLine1(l, 1) - 1 To staffLine2(l, 1) + 1
                    If round = 1 Then
                        stprint = stprint & " D "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 74
                        End If
                    End If
            Case staffLine2(l, 1) + 2 To staffLine1(l, 2) - 2
                    If round = 1 Then
                        stprint = stprint & " C "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 72
                        End If
                    End If
            Case staffLine1(l, 2) - 1 To staffLine2(l, 2) + 1
                    If round = 1 Then
                        stprint = stprint & " B "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 71
                        End If
                    End If
            Case staffLine2(l, 2) + 2 To staffLine1(l, 3) - 2
                    If round = 1 Then
                        stprint = stprint & " A "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 69
                        End If
                    End If
            Case staffLine1(l, 3) - 1 To staffLine2(l, 3) + 1
                    If round = 1 Then
                        stprint = stprint & " G "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 67
                        End If
                    End If
            Case staffLine2(l, 3) + 2 To staffLine1(l, 4) - 2
                    If round = 1 Then
                        stprint = stprint & " F "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 65
                        End If
                    End If
            Case staffLine1(l, 4) - 1 To staffLine2(l, 4) + 1
                    If round = 1 Then
                        stprint = stprint & " E "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 64
                        End If
                    End If
            Case staffLine2(l, 4) + 2 To staffLine2(l, 4) + gap - 2
                    If round = 1 Then
                        stprint = stprint & " D "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 62
                        End If
                    End If
            Case staffLine2(l, 4) + gap - 1 To staffLine2(l, 4) + gap + 1
                    If round = 1 Then
                        stprint = stprint & " C "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 60
                        End If
                    End If
            Case staffLine2(l, 4) + gap + 2 To staffLine2(l, 4) + (gap * 2) - 2
                    If round = 1 Then
                        stprint = stprint & " B "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 59
                        End If
                    End If
            Case staffLine2(l, 4) + (gap * 2) - 1 To staffLine2(l, 4) + (gap * 2) + 1
                    If round = 1 Then
                        stprint = stprint & " A "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 57
                        End If
                    End If
            Case staffLine2(l, 4) + (gap * 2) + 2 To staffLine2(l, 4) + (gap * 3) - 2
                    If round = 1 Then
                        stprint = stprint & " G "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 55
                        End If
                    End If
            Case staffLine2(l, 4) + (gap * 3) - 1 To staffLine2(l, 4) + (gap * 3) + 1
                    If round = 1 Then
                        stprint = stprint & " F "
                    Else
                        If round = 2 Then
                            TrackData(mCount).MidiEvent = 53
                        End If
                    End If
        End Select
        If sF Then
            TrackData(mCount).MidiEvent = TrackData(mCount).MidiEvent + 1
        End If
        If fF Then
            TrackData(mCount).MidiEvent = TrackData(mCount).MidiEvent - 1
        End If
End Sub


Private Sub detect0()
        ''''' detect whole note , dotted ,  whole rest , half rest , eight rest
        Dim part1 As Integer, part2 As Integer
        Dim w As Boolean, pw As Boolean
        
        part1 = 0
        part2 = 0
        w = False
        pw = False
        '''''' check symmetry
        If symmetry(1, part1, part2, 0.1) Then
            For i = note1(num) To note2(num) - 1
                If pix(i, (note3(num) + note4(num)) \ 2) = 0 And pix(i + 1, (note3(num) + note4(num)) \ 2) = 255 Then
                    pw = True
                End If
                If pix(i, (note3(num) + note4(num)) \ 2) = 255 And pix(i + 1, (note3(num) + note4(num)) \ 2) = 0 And pw Then
                    w = True
                End If
            Next i
            If w Then
                If round = 1 Then
                    stprint = "Whole note"
                    Call getPitch(3, 0, 0, 0)
                    NumberOfNote = NumberOfNote + 1
                Else
                    If round = 2 Then
                        TrackData(mCount).DeltaTime = 1
                        Call getPitch(3, 0, 0, 0)
                        mCount = mCount + 1
                    End If
                End If
            Else
                If Abs((note4(num) - note3(num)) - (note2(num) - note1(num))) < 5 Then
                    If round = 1 Then
                        stprint = "Dotted"
                    Else
                        If round = 2 Then
                            TrackData(mCount - 1).DeltaTime = TrackData(mCount - 1).DeltaTime + 4
                        End If
                    End If
                Else
                        If (note3(num) - 1) = (staffLine2(l, 1) + 1) Then
                            If round = 1 Then
                                stprint = "Whole rest"
                                NumberOfNote = NumberOfNote + 1
                            Else
                                If round = 2 Then
                                    TrackData(mCount).DeltaTime = 1
                                    TrackData(mCount).StopEvent = True
                                    mCount = mCount + 1
                                End If
                            End If
                        Else
                            If (note4(num) + 1) = (staffLine1(l, 2) - 1) Then
                                If round = 1 Then
                                    stprint = "Half rest"
                                    NumberOfNote = NumberOfNote + 1
                                Else
                                    If round = 2 Then
                                        TrackData(mCount).DeltaTime = 2
                                        TrackData(mCount).StopEvent = True
                                        mCount = mCount + 1
                                    End If
                                End If
                            End If
                        End If
                End If
            End If
        Else
            If round = 1 Then
                stprint = "Eight rest"
                NumberOfNote = NumberOfNote + 1
            Else
                If round = 2 Then
                    TrackData(mCount).DeltaTime = 4
                    TrackData(mCount).StopEvent = True
                    mCount = mCount + 1
                End If
            End If
        End If
End Sub

Private Sub checkQH()
    '''''' check quarter or half
    Dim ph As Boolean, h As Boolean
    
    h = False
    ph = False
    For j = note3(num) To note4(num) - 1
        If pix((note1(num) + note2(num)) \ 2, j) = 0 And pix((note1(num) + note2(num)) \ 2, j + 1) = 255 Then
            ph = True
        End If
        If pix((note1(num) + note2(num)) \ 2, j) = 255 And pix((note1(num) + note2(num)) \ 2, j + 1) = 0 And ph Then
            h = True
        End If
    Next j
    If h Then
        If round = 1 Then
            stprint = "Half note"
            NumberOfNote = NumberOfNote + 1
        Else
            If round = 2 Then
                TrackData(mCount).DeltaTime = 2
            End If
        End If
    Else
        If round = 1 Then
            stprint = "Quarter note"
            NumberOfNote = NumberOfNote + 1
        Else
            If round = 2 Then
                TrackData(mCount).DeltaTime = 3
            End If
        End If
    End If
End Sub

Private Sub fourPart(ByRef part() As Integer)
        '''''' divide to 4 part
        For i = 0 To 3
            part(i) = 0
        Next i
        For i = note1(num) To (note1(num) + note2(num)) \ 2
            For j = note3(num) To (note3(num) + note4(num)) \ 2
                If pix(i, j) = 0 Then
                    part(0) = part(0) + 1
                End If
            Next j
        Next i
        For i = (note1(num) + note2(num)) \ 2 To note2(num)
            For j = note3(num) To (note3(num) + note4(num)) \ 2
                If pix(i, j) = 0 Then
                    part(1) = part(1) + 1
                End If
            Next j
        Next i
        For i = note1(num) To (note1(num) + note2(num)) \ 2
            For j = (note3(num) + note4(num)) \ 2 To note4(num)
                If pix(i, j) = 0 Then
                    part(2) = part(2) + 1
                End If
            Next j
        Next i
        For i = (note1(num) + note2(num)) \ 2 To note2(num)
            For j = (note3(num) + note4(num)) \ 2 To note4(num)
                If pix(i, j) = 0 Then
                    part(3) = part(3) + 1
                End If
            Next j
        Next i
End Sub

Private Function findS(sel As Integer, ByVal x1, ByVal x2, ByVal x3, ByVal x4)
    Select Case sel
        Case 1
                For j = x3 To x4
                    count1 = 0
                    For i = x1 To x2
                            If pix(i, j) = 0 Then
                                count1 = count1 + 1
                            End If
                    Next i
                    If j = x3 Then
                        m = count1
                    End If
                    If count1 - m > 3 Then
                        findS = j
                        j = x4
                    End If
                Next j
        Case 2
                For j = x4 To x3 Step -1
                    count1 = 0
                    For i = x1 To x2
                            If pix(i, j) = 0 Then
                                count1 = count1 + 1
                            End If
                    Next i
                    If j = x4 Then
                        m = count1
                    End If
                    If count1 - m > 3 Then
                        findS = j
                        j = x3
                    End If
                Next j
        Case 3
                For j = x3 To x4
                    count1 = 0
                    For i = x1 To x2
                            If pix(i, j) = 0 Then
                                count1 = count1 + 1
                            End If
                    Next i
                    If count1 < 3 Then
                        findS = j
                        j = x4
                    End If
                Next j
    End Select
End Function

Private Sub detect1()
    '''''' detect quarter note , half note , eight note , flat , quarter rest
    Dim peak As Integer
    Dim part(3) As Integer
    
    For i = note1(num) To note2(num)
        If sumVP(l, i) > (2 * gap) + 5 Then
            peak = i
        End If
    Next i
    If Abs(peak - note1(num)) < 5 Then
        Call fourPart(part())
        If part(0) > 5 And part(1) > 5 And part(2) > 5 And part(3) > 5 Then
            If round = 1 Then
                stprint = "Eight note"
                 Call getPitch(7, findS(3, note1(num), note2(num), note3(num), note4(num)), 0, 0)
                NumberOfNote = NumberOfNote + 1
            Else
                If round = 2 Then
                    TrackData(mCount).DeltaTime = 4
                    Call getPitch(7, findS(3, note1(num), note2(num), note3(num), note4(num)), 0, 0)
                    mCount = mCount + 1
                End If
            End If
        Else
            If part(1) < 5 And part(0) > 5 And part(2) > 5 And part(3) > 5 Then
                If round = 1 Then
                    stprint = "flat"
                Else
                    If round = 2 Then
                        fF = True
                    End If
                End If
            Else
                If part(3) < 5 And part(0) > 5 And part(1) > 5 And part(2) > 5 Then
                    Call checkQH
                    Call getPitch(2, findS(2, note1(num), note2(num), note3(num), note4(num)), 0, 0)
                    If round = 2 Then
                        mCount = mCount + 1
                    End If
                End If
            End If
        End If
    Else
        If Abs(peak - note2(num)) < 5 Then
            Call checkQH
            Call getPitch(1, findS(1, note1(num), note2(num), note3(num), note4(num)), 0, 0)
            If round = 2 Then
                        mCount = mCount + 1
            End If
        Else
            Call fourPart(part())
            If part(0) > 5 And part(1) > 5 And part(2) > 5 And part(3) > 5 Then
                If round = 1 Then
                    stprint = "Quarter rest"
                    NumberOfNote = NumberOfNote + 1
                Else
                    If round = 2 Then
                        TrackData(mCount).DeltaTime = 3
                        TrackData(mCount).StopEvent = True
                        mCount = mCount + 1
                    End If
                End If
            Else
                If part(0) < 5 And part(1) > 5 And part(2) > 5 And part(3) > 5 Then
                    If round = 1 Then
                        stprint = "Eight note"
                        Call getPitch(6, findS(1, note1(num), peak, note3(num), note4(num)), 0, 0)
                        NumberOfNote = NumberOfNote + 1
                    Else
                        If round = 2 Then
                            TrackData(mCount).DeltaTime = 4
                            Call getPitch(6, findS(1, note1(num), peak, note3(num), note4(num)), 0, 0)
                            mCount = mCount + 1
                        End If
                    End If
                End If
            End If
        End If
    End If
End Sub

Private Sub checkE(sel As Byte)
    Dim sumVN() As Integer, sumHN() As Integer
    Dim n1() As Integer, n2() As Integer, n3() As Integer, n4() As Integer
    Dim snCount As Byte, n As Byte, v As Byte
    ReDim sumVN(note2(num) - note1(num)) As Integer
    
    m = 0
    For i = note1(num) To note2(num)
        count1 = 0
        For j = note3(num) To note4(num)
            If pix(i, j) = 0 Then
                count1 = count1 + 1
            End If
        Next j
        sumVN(m) = count1
        m = m + 1
    Next i
    j = -1
    loop1 = True
    Do While loop1
        j = j + 1
        If (sumVN(j) > 0) Then
            i = 0
            Do Until (sumVN(j + i) = 0) Or (j + i) = m - 1
                i = i + 1
            Loop
            If i > 5 Or (i < 5 And sumVN(j) > 5) Then
                snCount = snCount + 1
                j = j + i
                If j = m - 1 Then
                    loop1 = False
                End If
            Else  ''''' noise
            End If
        End If
    Loop
    
    ReDim n1(snCount - 1) As Integer, n2(snCount - 1) As Integer, n3(snCount - 1) As Integer, n4(snCount - 1) As Integer
    ''''' x
    j = -1
    loop1 = True
    n = 0
    Do While loop1
        j = j + 1
        If (sumVN(j) > 0) Then
            i = 0
            Do Until (sumVN(j + i) = 0) Or (j + i) = m - 1
                i = i + 1
            Loop
            If i > 5 Or (i < 5 And sumVN(j) > 5) Then
                n1(n) = j + note1(num)
                j = j + i
                If j = m - 1 Then
                    n2(n) = j + note1(num)
                    loop1 = False
                Else
                    n2(n) = j + note1(num) - 1
                End If
                n = n + 1
            Else  ''''' noise
            End If
        End If
    Loop
    ''''' y
    ReDim sumHN(note4(num) - note3(num)) As Integer
    
    For m = 0 To snCount - 1
        n = 0
        For j = note3(num) To note4(num)
            count1 = 0
            For i = n1(m) To n2(m)
                If pix(i, j) = 0 Then
                    count1 = count1 + 1
                End If
            Next i
            sumHN(n) = count1
            n = n + 1
        Next j

        i = -1
        loop1 = True
        Do While loop1
            i = i + 1
            If sumHN(i) > 0 Then
                v = 0
                Do Until (sumHN(i + v) = 0) Or (i + v) = n - 1
                    v = v + 1
                Loop
                If v > 5 Then
                    n3(m) = note3(num) + i
                    i = i + v
                    If i = n - 1 Then
                        n4(m) = note3(num) + i
                    Else
                        n4(m) = note3(num) + i - 1
                    End If
                    loop1 = False
                Else  '''' noise
                End If
            End If
        Loop
    Next m
    
    Dim index As Byte
    For index = 0 To snCount - 1
        stprint = ""
        Select Case sel
            Case 1
                    If n3(index) = note3(num) Then
                        If round = 1 Then
                            stprint = "Eight note"
                            Call getPitch(4, findS(1, n1(index), n2(index), n3(index), n4(index)), n3(index), n4(index))
                            NumberOfNote = NumberOfNote + 1
                        Else
                            If round = 2 Then
                                TrackData(mCount).DeltaTime = 4
                                Call getPitch(4, findS(1, n1(index), n2(index), n3(index), n4(index)), n3(index), n4(index))
                                mCount = mCount + 1
                            End If
                        End If
                    Else
                    End If
            Case 2
                    If n4(index) = note4(num) Then
                        If round = 1 Then
                            stprint = "Eight note"
                            Call getPitch(5, findS(2, n1(index), n2(index), n3(index), n4(index)), n3(index), n4(index))
                            NumberOfNote = NumberOfNote + 1
                        Else
                            If round = 2 Then
                                TrackData(mCount).DeltaTime = 4
                                Call getPitch(5, findS(2, n1(index), n2(index), n3(index), n4(index)), n3(index), n4(index))
                                mCount = mCount + 1
                            End If
                        End If
                    Else
                    End If
        End Select
        If index <> snCount - 1 Then
            If round = 1 Then
                NoteList.AddItem (stprint)
            End If
        End If
    Next index
End Sub


Private Sub detect2()
    '''''' detect eight note , sharp , natural
    Dim peak As Integer
    Dim part1 As Integer, part2 As Integer
    Dim c As Boolean, pc As Boolean
    
    If symmetry(1, part1, part2, 0.05) And symmetry(2, part1, part2, 0.05) And count1 = 2 Then
        For i = note1(num) To note2(num)
            If sumVP(l, i) > (2 * gap) + 5 Then
                peak = i
                i = note2(num)
            End If
        Next i
        If Abs(peak - note1(num)) < 2 Then
            If round = 1 Then
                stprint = "Natural"
            Else
                If round = 2 Then
                    sF = False
                    fF = False
                End If
            End If
        Else
            If round = 1 Then
                stprint = "Sharp"
            Else
                If round = 2 Then
                    sF = True
                End If
            End If
        End If
    Else
        For i = note1(num) To note2(num)
            If sumVP(l, i) > (2 * gap) + 5 Then
                peak = i
                i = note2(num)
            End If
        Next i
        If Abs(peak - note1(num)) < 5 Then
            For j = note4(num) + 2 To note3(num) Step -1
                c = False
                pc = False
                For i = note1(num) To note2(num) - 1
                    If pix(i, j) = 0 And pix(i + 1, j) = 255 Then
                        pc = True
                    End If
                    If pix(i, j) = 255 And pix(i + 1, j) = 0 And pc Then
                        c = True
                    End If
                Next i
                If c Then
                    note4(num) = j
                    j = note3(num)
                End If
            Next j
            Call checkE(2)
        Else
            For j = note3(num) + 2 To note4(num)
                c = False
                pc = False
                For i = note1(num) To note2(num) - 1
                    If pix(i, j) = 0 And pix(i + 1, j) = 255 Then
                        pc = True
                    End If
                    If pix(i, j) = 255 And pix(i + 1, j) = 0 And pc Then
                        c = True
                    End If
                Next i
                If c Then
                    note3(num) = j
                    j = note4(num)
                End If
            Next j
            Call checkE(1)
        End If
    End If
End Sub

Private Sub detectNote()
    For l = 0 To part
        Call locateNote
        If l = 0 Then  ''''  ***skip Key and Time signature
            k = 3
        Else
            k = 2
        End If
        For num = k To noteCount - 1
            stprint = ""
            ''''''' group note
            count1 = 0
            For i = note1(num) To note2(num)
                If sumVP(l, i) > (2 * gap) + 5 Then
                    count1 = count1 + 1
                    Do Until sumVP(l, i) < (2 * gap) + 5
                        i = i + 1
                    Loop
                End If
            Next i
            If count1 > 1 Then
                '''''' eight , sharp , natural
                Call detect2
            Else
                If count1 = 1 Then
                    m = 0
                    For i = note1(num) To note2(num)
                        If sumVP(l, i) > (2 * gap) + 5 Then
                            m = m + 1
                        End If
                    Next i
                    ''''' bar line
                    If Abs((note2(num) - note1(num)) - m) < 5 Then
                        If round = 1 Then
                            stprint = "Bar line"
                        Else
                            If round = 2 Then
                                sF = False
                                fF = False
                            End If
                        End If
                    Else
                        '''''' quarter , half , eight , flat , q rest
                        Call detect1
                    End If
                Else
                    '''''' whole , dotted , w rest , h rest , e rest
                    Call detect0
                End If
            End If
            If round = 1 Then
                NoteList.AddItem (stprint)
            End If
        Next num
    Next l
End Sub

Private Sub Form_Load()
    MMControl1.DeviceType = "Sequencer"
End Sub

Private Sub Form_Unload(Cancel As Integer)
    MMControl1.Command = "Close"
End Sub

Private Sub MMControl1_PauseClick(Cancel As Integer)
    PauseClick = True
End Sub

Private Sub MMControl1_PlayClick(Cancel As Integer)
    If PauseClick = False Then
        MMControl1.Command = "Prev"
        MMControl1.Command = "Play"
    Else
        PauseClick = False
        MMControl1.Command = "Play"
    End If
End Sub

Private Sub MMControl1_StopClick(Cancel As Integer)
    MMControl1.Command = "Prev"
End Sub

Private Sub OpenMidi_Click()
    OpenMidiDialog.CancelError = True
On Error GoTo Error1:
    OpenMidiDialog.Filter = "MIDI Format(*.Mid)|*.Mid"
    OpenMidiDialog.ShowOpen
    MMControl1.FileName = OpenMidiDialog.FileName
    MMControl1.Command = "Open"
    FileName.Text = OpenMidiDialog.FileName
Exit Sub
Error1:
    Unload Me
End Sub

Private Sub Exit_Click()
    Unload Me
End Sub


Private Sub SaveMidi_Click()
    SaveMidiDialog.CancelError = True
On Error GoTo Error2:
    SaveMidiDialog.Filter = "MIDI Format(*.Mid)|*.Mid"
    SaveMidiDialog.ShowSave
    
    MidiName = SaveMidiDialog.FileName
    Open MidiName For Binary As #1
        Call BuildHeaderChunk
        Call BuildFirstTrackChunk
        Call BuildSecondTrackChunk
    Close #1
Exit Sub

Error2:
   Unload Me
End Sub

Private Sub BuildHeaderChunk()
''Set Position
    MidiPos = 1
''Start Build Header
    Put #1, MidiPos, 77     ''M
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 84     ''T
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 104    ''h
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 100    ''d
    MidiPos = MidiPos + 1
''Header Data's Length
    Put #1, MidiPos, 0
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 0
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 0
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 6
    MidiPos = MidiPos + 1
''Format 1
    Put #1, MidiPos, 0
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 1
    MidiPos = MidiPos + 1
''2 Track
    Put #1, MidiPos, 0
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 2
    MidiPos = MidiPos + 1
''Delta-Time
    Put #1, MidiPos, 0
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 120
    MidiPos = MidiPos + 1
End Sub

Private Sub BuildFirstTrackChunk()
''Start Build Track
    Put #1, MidiPos, 77     ''M
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 84     ''T
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 114    ''r
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 107    ''k
    MidiPos = MidiPos + 1
''Track Data's Length
    Put #1, MidiPos, 0
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 0
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 0
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 19
    MidiPos = MidiPos + 1
''Time Signature
    Put #1, MidiPos, 0
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 255
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 88
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 4
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 4
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 2
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 24
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 8
    MidiPos = MidiPos + 1
''Tempo
    Put #1, MidiPos, 0
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 255
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 81
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 3
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 4
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 61
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 11
    MidiPos = MidiPos + 1
''End Track
    Put #1, MidiPos, 0
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 255
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 47
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 0
    MidiPos = MidiPos + 1
End Sub

Private Sub BuildSecondTrackChunk()
''Start Build Track
    Put #1, MidiPos, 77     ''M
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 84     ''T
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 114    ''r
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 107    ''k
    MidiPos = MidiPos + 1
''Track Data's Length
    Call CheckLength
    For i = 1 To 4
        Put #1, MidiPos, TrackLength(i)
        MidiPos = MidiPos + 1
    Next i
''Set Instrument
    Put #1, MidiPos, 0
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 192
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 1
    MidiPos = MidiPos + 1

''Start Event
    For i = 1 To NumberOfNote
      
''Check Delta-Time For Event
        If TrackData(i).DeltaTime = 1 Then      ''Note Tua Glom
            Put #1, MidiPos, 0
            MidiPos = MidiPos + 1
            If i = 1 Then
                Put #1, MidiPos, 144                ''Note On
                MidiPos = MidiPos + 1
            End If
            Put #1, MidiPos, TrackData(i).MidiEvent ''Put Note
            MidiPos = MidiPos + 1
            
            If TrackData(i).StopEvent = False Then  ''Check Stop Event
                Put #1, MidiPos, 100            ''If Not, Velocity = 100
                MidiPos = MidiPos + 1
            ElseIf TrackData(i).StopEvent = True Then
                Put #1, MidiPos, 0              ''If Yes, Velocity = 0
                MidiPos = MidiPos + 1
            End If
            
            Put #1, MidiPos, 131
            MidiPos = MidiPos + 1
            Put #1, MidiPos, 96
            MidiPos = MidiPos + 1
            Put #1, MidiPos, TrackData(i).MidiEvent
            MidiPos = MidiPos + 1
            Put #1, MidiPos, 0
            MidiPos = MidiPos + 1
        ElseIf TrackData(i).DeltaTime = 2 Then  ''Note Tua Kao
            Put #1, MidiPos, 0
            MidiPos = MidiPos + 1
            If i = 1 Then
                Put #1, MidiPos, 144                ''Note On
                MidiPos = MidiPos + 1
            End If
            Put #1, MidiPos, TrackData(i).MidiEvent ''Put Note
            MidiPos = MidiPos + 1
            
            If TrackData(i).StopEvent = False Then  ''Check Stop Event
                Put #1, MidiPos, 100            ''If Not, Velocity = 100
                MidiPos = MidiPos + 1
            ElseIf TrackData(i).StopEvent = True Then
                Put #1, MidiPos, 0              ''If Yes, Velocity = 0
                MidiPos = MidiPos + 1
            End If
            
            Put #1, MidiPos, 129
            MidiPos = MidiPos + 1
            Put #1, MidiPos, 112
            MidiPos = MidiPos + 1
            Put #1, MidiPos, TrackData(i).MidiEvent
            MidiPos = MidiPos + 1
            Put #1, MidiPos, 0
            MidiPos = MidiPos + 1
        ElseIf TrackData(i).DeltaTime = 3 Then  ''Note Tua Dum
            Put #1, MidiPos, 0
            MidiPos = MidiPos + 1
            If i = 1 Then
                Put #1, MidiPos, 144                ''Note On
                MidiPos = MidiPos + 1
            End If
            Put #1, MidiPos, TrackData(i).MidiEvent ''Put Note
            MidiPos = MidiPos + 1
            
            If TrackData(i).StopEvent = False Then  ''Check Stop Event
                Put #1, MidiPos, 100            ''If Not, Velocity = 100
                MidiPos = MidiPos + 1
            ElseIf TrackData(i).StopEvent = True Then
                Put #1, MidiPos, 0              ''If Yes, Velocity = 0
                MidiPos = MidiPos + 1
            End If
            
            Put #1, MidiPos, 120
            MidiPos = MidiPos + 1
            Put #1, MidiPos, TrackData(i).MidiEvent
            MidiPos = MidiPos + 1
            Put #1, MidiPos, 0
            MidiPos = MidiPos + 1
        ElseIf TrackData(i).DeltaTime = 4 Then  ''Note Kabet 1
            Put #1, MidiPos, 0
            MidiPos = MidiPos + 1
            If i = 1 Then
                Put #1, MidiPos, 144                ''Note On
                MidiPos = MidiPos + 1
            End If
            Put #1, MidiPos, TrackData(i).MidiEvent ''Put Note
            MidiPos = MidiPos + 1
            
            If TrackData(i).StopEvent = False Then  ''Check Stop Event
                Put #1, MidiPos, 100            ''If Not, Velocity = 100
                MidiPos = MidiPos + 1
            ElseIf TrackData(i).StopEvent = True Then
                Put #1, MidiPos, 0              ''If Yes, Velocity = 0
                MidiPos = MidiPos + 1
            End If
            
            Put #1, MidiPos, 60
            MidiPos = MidiPos + 1
            Put #1, MidiPos, TrackData(i).MidiEvent
            MidiPos = MidiPos + 1
            Put #1, MidiPos, 0
            MidiPos = MidiPos + 1
        ElseIf TrackData(i).DeltaTime = 5 Then  ''Note Kabet 2
            Put #1, MidiPos, 0
            MidiPos = MidiPos + 1
            If i = 1 Then
                Put #1, MidiPos, 144                ''Note On
                MidiPos = MidiPos + 1
            End If
            Put #1, MidiPos, TrackData(i).MidiEvent ''Put Note
            MidiPos = MidiPos + 1
            
            If TrackData(i).StopEvent = False Then  ''Check Stop Event
                Put #1, MidiPos, 100            ''If Not, Velocity = 100
                MidiPos = MidiPos + 1
            ElseIf TrackData(i).StopEvent = True Then
                Put #1, MidiPos, 0              ''If Yes, Velocity = 0
                MidiPos = MidiPos + 1
            End If
            
            Put #1, MidiPos, 30
            MidiPos = MidiPos + 1
            Put #1, MidiPos, TrackData(i).MidiEvent
            MidiPos = MidiPos + 1
            Put #1, MidiPos, 0
            MidiPos = MidiPos + 1
        ElseIf TrackData(i).DeltaTime = 6 Then  ''Note White with dot
            Put #1, MidiPos, 0
            MidiPos = MidiPos + 1
            If i = 1 Then
                Put #1, MidiPos, 144                ''Note On
                MidiPos = MidiPos + 1
            End If
            Put #1, MidiPos, TrackData(i).MidiEvent ''Put Note
            MidiPos = MidiPos + 1
            
            If TrackData(i).StopEvent = False Then  ''Check Stop Event
                Put #1, MidiPos, 100            ''If Not, Velocity = 100
                MidiPos = MidiPos + 1
            ElseIf TrackData(i).StopEvent = True Then
                Put #1, MidiPos, 0              ''If Yes, Velocity = 0
                MidiPos = MidiPos + 1
            End If
            
            Put #1, MidiPos, 130
            MidiPos = MidiPos + 1
            Put #1, MidiPos, 104
            MidiPos = MidiPos + 1
            Put #1, MidiPos, TrackData(i).MidiEvent
            MidiPos = MidiPos + 1
            Put #1, MidiPos, 0
            MidiPos = MidiPos + 1
        ElseIf TrackData(i).DeltaTime = 7 Then  ''Black with Dot
            Put #1, MidiPos, 0
            MidiPos = MidiPos + 1
            If i = 1 Then
                Put #1, MidiPos, 144                ''Note On
                MidiPos = MidiPos + 1
            End If
            Put #1, MidiPos, TrackData(i).MidiEvent ''Put Note
            MidiPos = MidiPos + 1
            
            If TrackData(i).StopEvent = False Then  ''Check Stop Event
                Put #1, MidiPos, 100            ''If Not, Velocity = 100
                MidiPos = MidiPos + 1
            ElseIf TrackData(i).StopEvent = True Then
                Put #1, MidiPos, 0              ''If Yes, Velocity = 0
                MidiPos = MidiPos + 1
            End If
            
            Put #1, MidiPos, 129
            MidiPos = MidiPos + 1
            Put #1, MidiPos, 52
            MidiPos = MidiPos + 1
            Put #1, MidiPos, TrackData(i).MidiEvent
            MidiPos = MidiPos + 1
            Put #1, MidiPos, 0
            MidiPos = MidiPos + 1
        End If
    Next i
''End Track
    Put #1, MidiPos, 0
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 255
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 47
    MidiPos = MidiPos + 1
    Put #1, MidiPos, 0
    MidiPos = MidiPos + 1
End Sub

Private Sub CheckLength()
    
''Build Temp For CountEvent
    MidiPos2 = 1
''Set Instrument
    MidiPos2 = MidiPos2 + 3
''Start Event
    For i = 1 To NumberOfNote
        MidiPos2 = MidiPos2 + 1
        If i = 1 Then
            MidiPos2 = MidiPos2 + 1
        End If
        MidiPos2 = MidiPos2 + 2
''Check Delta-Time For Event
        If TrackData(i).DeltaTime = 1 Then      ''Note Tua Glom
            MidiPos2 = MidiPos2 + 2
        ElseIf TrackData(i).DeltaTime = 2 Then  ''Note Tua Kao
            MidiPos2 = MidiPos2 + 2
        ElseIf TrackData(i).DeltaTime = 3 Then  ''Note Tua Dum
            MidiPos2 = MidiPos2 + 1
        ElseIf TrackData(i).DeltaTime = 4 Then  ''Note Kabet 1
            MidiPos2 = MidiPos2 + 1
        ElseIf TrackData(i).DeltaTime = 5 Then  ''Note Kabet 2
            MidiPos2 = MidiPos2 + 1
        ElseIf TrackData(i).DeltaTime = 6 Then  ''White with dot
            MidiPos2 = MidiPos2 + 2
        ElseIf TrackData(i).DeltaTime = 7 Then  ''Black with dot
            MidiPos2 = MidiPos2 + 2
            
        End If
        MidiPos2 = MidiPos2 + 2
    Next i
''End Track
    MidiPos2 = MidiPos2 + 4
    
    Call ConvertToLength
End Sub

Private Sub ConvertToLength()

''Reset TrackLength
For i = 1 To 4
    TrackLength(i) = 0
Next i
''MidiPos2 = 127
''Value Reprensentations
If MidiPos2 <= 127 Then
    TrackLength(4) = 127
Else

For i = 1 To MidiPos2
    If TrackLength(4) < 127 Then
        If TrackLength(4) = 0 Then
            TrackLength(4) = 1
        Else
            TrackLength(4) = TrackLength(4) + 1
        End If
    ElseIf TrackLength(4) >= 127 Then
        TrackLength(4) = 0
            If TrackLength(3) < 255 Then
                If TrackLength(3) = 0 Then
                    TrackLength(3) = 129
                Else
                    TrackLength(3) = TrackLength(3) + 1
                End If
            ElseIf TrackLength(3) >= 255 Then
                TrackLength(3) = 128
                    If TrackLength(2) < 255 Then
                        If TrackLength(2) = 0 Then
                            TrackLength(2) = 129
                        Else
                            TrackLength(2) = TrackLength(2) + 1
                        End If
                    ElseIf TrackLength(2) >= 255 Then
                        TrackLength(2) = 128
                            If TrackLength(1) < 255 Then
                                If TrackLength(1) = 0 Then
                                    TrackLength(1) = 129
                                Else
                                    TrackLength(1) = TrackLength(1) + 1
                                End If
                            End If
                    End If
            End If
    End If
Next i

End If

End Sub





