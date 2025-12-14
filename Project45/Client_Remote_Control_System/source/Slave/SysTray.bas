Attribute VB_Name = "modSystray"
Option Explicit

' *** Icon loading functions
Public Const LR_LOADFROMFILE = &H10 ' Not NT
Public Const IMAGE_BITMAP = 0
Public Const IMAGE_ICON = 1
Public Const IMAGE_CURSOR = 2
Public Const IMAGE_ENHMETAFILE = 3

Public Declare Function LoadImage Lib "user32" Alias "LoadImageA" (ByVal hInst As Long, ByVal lpsz As String, ByVal dwImageType As Long, ByVal dwDesiredWidth As Long, ByVal dwDesiredHeight As Long, ByVal dwFlags As Long) As Long
Public Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long

' *** System Tray functions
Public Declare Function SetWindowLongA Lib "user32" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Declare Function CallWindowProcA Lib "user32" (ByVal lpPrevWndFunc As Long, ByVal hWnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Public Declare Function Shell_NotifyIconA Lib "shell32.dll" (ByVal dwMessage As Long, lpData As NOTIFYICONDATA) As Long

Public Type NOTIFYICONDATA
    cbSize As Long              ' Size of the NotifyIconData structure
    hWnd As Long                ' Window handle of the window processing the icon events
    uID As Long                 ' Icon ID (to allow multiple icons per application)
    uFlags As Long              ' NIF Flags
    uCallbackMessage As Long    ' The message received for the system tray icon if NIF_MESSAGE
                                ' specified. Can be in the range 0x0400 through 0x7FFF (1024 to 32767)
    hIcon As Long               ' The memory location of our icon if NIF_ICON is specifed
    szTip As String * 64        ' Tooltip if NIF_TIP is specified (64 characters max)
End Type

' Shell_NotifyIconA() messages
Public Const NIM_ADD = &H0      ' Add icon to the System Tray
Public Const NIM_MODIFY = &H1   ' Modify System Tray icon
Public Const NIM_DELETE = &H2   ' Delete icon from System Tray

' NotifyIconData Flags
Public Const NIF_MESSAGE = &H1  ' Send event messages to the parent window
Public Const NIF_ICON = &H2     ' Display the icon
Public Const NIF_TIP = &H4      ' Use a tooltip

' The events sent appear in lParam and are as follows:
Private Const MOUSE_MOVE = 512
Private Const MOUSE_LEFT_DOWN = 513
Private Const MOUSE_LEFT_UP = 514
Private Const MOUSE_LEFT_DBLCLICK = 515
Private Const MOUSE_RIGHT_DOWN = 516
Private Const MOUSE_RIGHT_UP = 517
Private Const MOUSE_RIGHT_DBLCLICK = 518
Private Const MOUSE_MIDDLE_DOWN = 519
Private Const MOUSE_MIDDLE_UP = 520
Private Const MOUSE_MIDDLE_DBLCLICK = 521

Public Const GWL_WNDPROC = -4

Public OldWindowProc As Long

Public Function WindowProc(ByVal hWnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    
    If Msg = 1024 Then
        If lParam = MOUSE_RIGHT_UP And wParam = 0 Then ' SysTray event for icon number 0
            'frmSystray.PopupMenu frmSystray.mnuSysTray
            frmMain.PopupMenu frmMain.mMain
        End If
    End If
        
    ' Pass the event onto the default window handler so that all other events get
    ' handled correctly
    WindowProc = CallWindowProcA(OldWindowProc, hWnd, Msg, wParam, lParam)
End Function

