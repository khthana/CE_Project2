Attribute VB_Name = "wavGeneral"
Option Explicit

Public wFormat As WAVEFORMAT
Public bufferIn As Long
Public hWaveOut As Long
Public hmem As Long
Public outHdr As WAVEHDR
Public numSamples As Long
Public fFileLoaded As Boolean
Public donePlaying As Boolean
Public isPlaying As Boolean

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

Public Sub waveOutProc(ByVal hwi As Long, ByVal uMsg As Long, ByVal dwInstance As Long, ByRef hdr As WAVEHDR, ByVal dwParam2 As Long)
  ' Wave IO Callback function
  If (uMsg = MM_WOM_DONE) Then
    donePlaying = True
    isPlaying = False
  End If
End Sub

Public Sub CloseWaveOut()
  Dim ret As Long
  ' Close the waveout device
  ret = waveOutReset(hWaveOut)
  ret = waveOutUnprepareHeader(hWaveOut, outHdr, Len(outHdr))
  ret = waveOutClose(hWaveOut)
End Sub

Public Sub LoadFile(inFile As String)
' Load wavefile into memory
  Dim mmckinfoParentIn As MMCKINFO
  Dim mmckinfoSubchunkIn As MMCKINFO
  Dim hmmioIn As Long
  Dim mmioinf As mmioinfo
  Dim ret As Long
  
  fFileLoaded = False
  If (inFile = "") Then
    GlobalFree (hmem)
    Exit Sub
  End If

  ' Open the input file
  hmmioIn = mmioOpen(inFile, mmioinf, MMIO_READ)
  If hmmioIn = 0 Then
    err.Raise mmioinf.wErrorRet, "LoadFile", _
    "Error opening input file: " & App.Path & inFile
    Exit Sub
  End If
   
  ' Check if this is a wave file
  mmckinfoParentIn.fccType = mmioStringToFOURCC("WAVE", 0)
  ret = mmioDescendParent(hmmioIn, mmckinfoParentIn, 0, MMIO_FINDRIFF)
  If (ret <> 0) Then
    ret = mmioClose(hmmioIn, 0)
    err.Raise -1, "LoadFile", "Not a WAVE file"
    Exit Sub
  End If
   
  ' Get format info
  mmckinfoSubchunkIn.ckid = mmioStringToFOURCC("fmt", 0)
  ret = mmioDescend(hmmioIn, mmckinfoSubchunkIn, mmckinfoParentIn, MMIO_FINDCHUNK)
  If (ret <> 0) Then
    ret = mmioClose(hmmioIn, 0)
    err.Raise -1, "LoadFile", "Couldn't get format chunk"
    Exit Sub
  End If
  ret = mmioReadFormat(hmmioIn, wFormat, Len(wFormat))
  If (ret = -1) Then
    ret = mmioClose(hmmioIn, 0)
    err.Raise -1, "LoadFile", "Error reading format"
    Exit Sub
  End If
  ret = mmioAscend(hmmioIn, mmckinfoSubchunkIn, 0)
   
  ' Find the data subchunk
  mmckinfoSubchunkIn.ckid = mmioStringToFOURCC("data", 0)
  ret = mmioDescend(hmmioIn, mmckinfoSubchunkIn, mmckinfoParentIn, MMIO_FINDCHUNK)
  If (ret <> 0) Then
    ret = mmioClose(hmmioIn, 0)
    err.Raise -1, "LoadFile", "Couldn't get data chunk"
    Exit Sub
  End If
   
  ' Allocate soundbuffer and read sound data
  GlobalFree hmem
  hmem = GlobalAlloc(&H40, mmckinfoSubchunkIn.ckSize)
  bufferIn = GlobalLock(hmem)
  ret = mmioRead(hmmioIn, bufferIn, mmckinfoSubchunkIn.ckSize)
  numSamples = mmckinfoSubchunkIn.ckSize / wFormat.nBlockAlign
  
  ' Close file
  ret = mmioClose(hmmioIn, 0)
  If ret <> 0 Then ErrBox "Error: " & ret & " in Wave->LoadFile"
  fFileLoaded = True
End Sub

Public Sub Play(ByVal soundcard As Integer)
  Dim lFlags As Long
  Dim msg As String * 200
  Dim ret As Long
  
  isPlaying = True
  If soundcard = -1 Then
    lFlags = CALLBACK_FUNCTION
  Else
    lFlags = CALLBACK_FUNCTION Or WAVE_MAPPED
  End If
    
  wFormat.cbSize = 0
  ret = waveOutOpen(hWaveOut, soundcard, wFormat, AddressOf waveOutProc, 0, lFlags)
  If (ret <> 0) Then
    GlobalFree (hmem)
    waveOutGetErrorText ret, msg, Len(msg)
    If ret = 32 Then
      ErrBox "‚¡‡¥Á¡‰¡Ë√Õß√—∫ Wave Format " & vbCrLf & "¢ÈÕ§«“¡‰¡Ë‰¥È∂Ÿ° Ëß"
      DonePlayWave
    Else
      ErrBox msg
    End If
    Exit Sub
  End If

  outHdr.lpData = bufferIn
  outHdr.dwBufferLength = numSamples * wFormat.nBlockAlign
  outHdr.dwFlags = 0
  outHdr.dwLoops = 0

  ret = waveOutPrepareHeader(hWaveOut, outHdr, Len(outHdr))
  If (ret <> 0) Then
    waveOutGetErrorText ret, msg, Len(msg)
    err.Raise ret, "Play", msg & ""
    Exit Sub
  End If

  ret = waveOutWrite(hWaveOut, outHdr, Len(outHdr))
  If (ret <> 0) Then
    GlobalFree (hmem)
  End If
End Sub

Public Sub PausePlay()
    waveOutPause (hWaveOut)
End Sub

Public Sub ResumePlay()
    waveOutRestart (hWaveOut)
End Sub

Public Sub StopPlay()
   waveOutReset (hWaveOut)
End Sub

Public Sub MergeWave(ByVal f1 As String, ByVal f2 As String, ByVal TargetFile As String)
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
            
  file1 = f1
  File2 = f2
  File3 = TargetFile
    
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
  j = i Mod 20 '‡»…
  k = i \ 20 'º≈‡µÁ¡
        
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
  j = i Mod 20 '‡»…
  k = i \ 20 'º≈‡µÁ¡
        
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
