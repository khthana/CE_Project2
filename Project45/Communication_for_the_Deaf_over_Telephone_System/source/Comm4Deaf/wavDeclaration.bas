Attribute VB_Name = "wavDeclaration"
Option Explicit

Public Const CALLBACK_FUNCTION = &H30000

Public Const WAVE_FORMAT_QUERY = &H1
Public Const WAVE_MAPPED = &H4
Public Const SND_FILENAME = &H20000

Public Const MMIO_READ = &H0
Public Const MMIO_FINDCHUNK = &H10
Public Const MMIO_FINDRIFF = &H20

Public Const MM_WOM_DONE = &H3BD
Public Const MM_WIM_OPEN = &H3BE
Public Const MM_WIM_CLOSE = &H3BF
Public Const MM_WIM_DATA = &H3C0

Public Const WAVE_FORMAT_PCM = &H1

Public Const GMEM_FIXED = &H0
Public Const GMEM_ZEROINIT = &H40
Public Const GPTR = GMEM_FIXED Or GMEM_ZEROINIT

Type WAVEHDR
  lpData As Long
  dwBufferLength As Long
  dwBytesRecorded As Long
  dwUser As Long
  dwFlags As Long
  dwLoops As Long
  lpNext As Long
  Reserved As Long
End Type

Type WAVEINCAPS
  wMid As Integer
  wPid As Integer
  vDriverVersion As Long
  szPname As String * 32
  dwFormats As Long
  wChannels As Integer
End Type

Type WAVEFORMAT
  wFormatTag As Integer
  nChannels As Integer
  nSamplesPerSec As Long
  nAvgBytesPerSec As Long
  nBlockAlign As Integer
  wBitsPerSample As Integer
  cbSize As Integer
End Type

Type mmioinfo
  dwFlags As Long
  fccIOProc As Long
  pIOProc As Long
  wErrorRet As Long
  htask As Long
  cchBuffer As Long
  pchBuffer As String
  pchNext As String
  pchEndRead As String
  pchEndWrite As String
  lBufOffset As Long
  lDiskOffset As Long
  adwInfo(4) As Long
  dwReserved1 As Long
  dwReserved2 As Long
  hmmio As Long
End Type

Type MMCKINFO
  ckid As Long
  ckSize As Long
  fccType As Long
  dwDataOffset As Long
  dwFlags As Long
End Type

Declare Function waveInOpen Lib "winmm.dll" (lphWaveIn As Long, ByVal uDeviceID As Long, lpFormat As WAVEFORMAT, ByVal dwCallback As Long, ByVal dwInstance As Long, ByVal dwFlags As Long) As Long
                                             
Declare Function waveInPrepareHeader Lib "winmm.dll" (ByVal hWaveIn As Long, lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
                                                      
Declare Function waveInAddBuffer Lib "winmm.dll" (ByVal hWaveIn As Long, lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
                                                   
Declare Function waveInUnprepareHeader Lib "winmm.dll" (ByVal hWaveIn As Long, lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
                                          
Declare Function waveInStart Lib "winmm.dll" (ByVal hWaveIn As Long) As Long

Declare Function waveInReset Lib "winmm.dll" (ByVal hWaveIn As Long) As Long

Declare Function waveInClose Lib "winmm.dll" (ByVal hWaveIn As Long) As Long

Declare Function waveInStop Lib "winmm.dll" (ByVal hWaveIn As Long) As Long

Declare Function waveOutOpen Lib "winmm.dll" (lphWaveIn As Long, ByVal uDeviceID As Long, lpFormat As WAVEFORMAT, ByVal dwCallback As Long, ByVal dwInstance As Long, ByVal dwFlags As Long) As Long
    
Declare Function waveOutPrepareHeader Lib "winmm.dll" (ByVal hWaveIn As Long, lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
    
Declare Function waveOutReset Lib "winmm.dll" (ByVal hWaveIn As Long) As Long

Declare Function waveOutStart Lib "winmm.dll" (ByVal hWaveIn As Long) As Long

Declare Function waveOutStop Lib "winmm.dll" (ByVal hWaveIn As Long) As Long

Declare Function waveOutPause Lib "winmm.dll" (ByVal hWaveOut As Long) As Long

Declare Function waveOutRestart Lib "winmm.dll" (ByVal hWaveOut As Long) As Long
 
Declare Function waveOutUnprepareHeader Lib "winmm.dll" (ByVal hWaveIn As Long, lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
    
Declare Function waveOutClose Lib "winmm.dll" (ByVal hWaveIn As Long) As Long

Declare Function waveOutGetDevCaps Lib "winmm.dll" Alias "waveInGetDevCapsA" (ByVal uDeviceID As Long, lpCaps As WAVEINCAPS, ByVal uSize As Long) As Long
    
Declare Function waveOutGetNumDevs Lib "winmm.dll" () As Long

Declare Function waveOutGetErrorText Lib "winmm.dll" Alias "waveInGetErrorTextA" (ByVal err As Long, ByVal lpText As String, ByVal uSize As Long) As Long
    
Declare Function waveOutAddBuffer Lib "winmm.dll" (ByVal hWaveIn As Long, lpWaveInHdr As WAVEHDR, ByVal uSize As Long) As Long
    
Declare Function waveOutWrite Lib "winmm.dll" (ByVal hWaveOut As Long, lpWaveOutHdr As WAVEHDR, ByVal uSize As Long) As Long
    
Declare Function mmioClose Lib "winmm.dll" (ByVal hmmio As Long, ByVal uFlags As Long) As Long
    
Declare Function mmioDescend Lib "winmm.dll" (ByVal hmmio As Long, lpck As MMCKINFO, lpckParent As MMCKINFO, ByVal uFlags As Long) As Long
    
Declare Function mmioDescendParent Lib "winmm.dll" Alias "mmioDescend" (ByVal hmmio As Long, lpck As MMCKINFO, ByVal x As Long, ByVal uFlags As Long) As Long
    
Declare Function mmioOpen Lib "winmm.dll" Alias "mmioOpenA" (ByVal szFileName As String, lpmmioinfo As mmioinfo, ByVal dwOpenFlags As Long) As Long
    
Declare Function mmioRead Lib "winmm.dll" (ByVal hmmio As Long, ByVal pch As Long, ByVal cch As Long) As Long
    
Declare Function mmioReadFormat Lib "winmm.dll" Alias "mmioRead" (ByVal hmmio As Long, ByRef pch As WAVEFORMAT, ByVal cch As Long) As Long
    
Declare Function mmioStringToFOURCC Lib "winmm.dll" Alias "mmioStringToFOURCCA" (ByVal sz As String, ByVal uFlags As Long) As Long
    
Declare Function mmioAscend Lib "winmm.dll" (ByVal hmmio As Long, lpck As MMCKINFO, ByVal uFlags As Long) As Long
    
Declare Function apisndPlaySound Lib "winmm" Alias "sndPlaySoundA" (ByVal Filename As String, ByVal snd_async As Long) As Long
  
Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
                                                
Declare Function GlobalLock Lib "kernel32" (ByVal hmem As Long) As Long

Declare Function GlobalFree Lib "kernel32" (ByVal hmem As Long) As Long

Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pvDest As Any, ByVal pvSource As Any, ByVal lBytes As Long)
   
Declare Sub CopyStructFromPtr Lib "kernel32" Alias "RtlMoveMemory" (struct As Any, ByVal ptr As Long, ByVal cb As Long)
