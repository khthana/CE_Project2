Attribute VB_Name = "mCmnDlg"
'NOTE! - TO EZVIDCAP TESTERS!!!
'THIS FILE IS ONLY USED FOR SAVE FILE DIALOGS
'YOU DON'T NEED TO BETA-TEST THIS FILE, IT IS
'NOT PART OF ezVidCap.OCX
'IT'S JUST HERE SO THE TEST PROGRAM IS EASIER TO USE
'-RAY

'****************************************************************
'*  VB file:   CmnDlg.bas... VB32 wrapper for Win32 common dialog
'*                           functions.
'*  created:        1997 by Ray Mercer
'*  modified:       8/98 by Ray Mercer (added browse for folders)
'*  modified:       10/21/98 by Ray Mercer (added comments)
'*  modified:       11/19/98 by Ray Mercer (major enhancements)
'*
'*
'*  original functions based on code found in Bruce McKinney's book
'*  "Hardcore Visual Basic"
'*  enhancements on 11/19/98 based on code by Brad Martinez (especially
'*  useful comments)
'*
'*  Copyright (c) 1997,1998 Ray Mercer.  All rights reserved.
'****************************************************************


Option Private Module
Option Explicit

Private Const MAX_PATH = 1024
Private Const MAX_FILE = 512

Private Type SHITEMID
    cb As Long     'Size of the ID (including cb itself)
    abID As Byte   'The item ID (variable length)
End Type
Private Type ITEMIDLIST
    mkid As SHITEMID
End Type

'most of these are also in
'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders
Public Enum SPECIAL_FOLDERS
    'Windows desktop virtual folder at the root of the name space
    vbCSIDL_DESKTOP = &H0&   'File system directory that contains the
   'user's program groups (which are also file   'system directories)
    vbCSIDL_PROGRAMS = &H2&
   'Control Panel - virtual folder containing
   'icons for the control panel applications
    vbCSIDL_CONTROLS = &H3&
   'Printers folder - virtual folder containing    'installed printers.
    vbCSIDL_PRINTERS = &H4&   'File system directory that serves as a
   'common repository for documents (Documents folder)
    vbCSIDL_PERSONAL = &H5&
   'File system directory that contains the
   'user's favorite Internet Explorer URLs
    vbCSIDL_FAVORITES = &H6&
   'File system directory that corresponds to the
   'user's Startup program group
    vbCSIDL_STARTUP = &H7&
   'File system directory that contains the
   'user's most recently used documents (Recent folder)
    vbCSIDL_RECENT = &H8&   'File system directory that contains
   'Send To menu items    Public Const
    vbCSIDL_SENDTO = &H9&
   'Recycle bin file system directory containing file
   'objects in the user's recycle bin. The location of
   'this directory is not in the registry; it is marked
   'with the hidden and system attributes to prevent the
   'user from moving or deleting it.
    vbCSIDL_BITBUCKET = &HA&
   'File system directory containing Start menu items
    vbCSIDL_STARTMENU = &HB&
   'File system directory used to physically store
   'file objects on the desktop (not to be confused
   'with the desktop folder itself).
    vbCSIDL_DESKTOPDIRECTORY = &H10&
   'My Computer - virtual folder containing everything
   'on the local computer: storage devices, printers,
   'and Control Panel. The folder may also contain    'mapped network drives.
    vbCSIDL_DRIVES = &H11&
   'Network Neighborhood - virtual folder representing
   'the top level of the network hierarchy
    vbCSIDL_NETWORK = &H12&
   'File system directory containing objects that
   'appear in the network neighborhood
    vbCSIDL_NETHOOD = &H13&
   'Virtual folder containing fonts
    vbCSIDL_FONTS = &H14&
   'File system directory that serves as a
   'common repository for document templates    '(ShellNew folder.)
    vbCSIDL_TEMPLATES = &H15&
End Enum
Private Declare Function SHGetSpecialFolderLocation Lib "shell32.dll" (ByVal hwndOwner As Long, ByVal nFolder As SPECIAL_FOLDERS, pidl As ITEMIDLIST) As Long 'returns NOERROR on success
Public Const NOERROR As Long = 0

Private Type OPENFILENAME
    lStructSize As Long          ' Filled with UDT size
    hwndOwner As Long            ' Tied to Owner
    hInstance As Long            ' Ignored (used only by templates)
    lpstrFilter As String        ' Tied to Filter
    lpstrCustomFilter As String  ' Ignored (exercise for reader)
    nMaxCustFilter As Long       ' Ignored (exercise for reader)
    nFilterIndex As Long         ' Tied to FilterIndex
    lpstrFile As String          ' Tied to FileName
    nMaxFile As Long             ' Handled internally
    lpstrFileTitle As String     ' Tied to FileTitle
    nMaxFileTitle As Long        ' Handled internally
    lpstrInitialDir As String    ' Tied to InitDir
    lpstrTitle As String         ' Tied to DlgTitle
    Flags As Long                ' Tied to Flags
    nFileOffset As Integer       ' Ignored (exercise for reader)
    nFileExtension As Integer    ' Ignored (exercise for reader)
    lpstrDefExt As String        ' Tied to DefaultExt
    lCustData As Long            ' Ignored (needed for hooks)
    lpfnHook As Long             ' Ignored (good luck with hooks)
    lpTemplateName As Long       ' Ignored (good luck with templates)
End Type

Private Declare Function GetOpenFileName Lib "COMDLG32" Alias "GetOpenFileNameA" (filestruct As OPENFILENAME) As Long
Private Declare Function GetSaveFileName Lib "COMDLG32" Alias "GetSaveFileNameA" (filestruct As OPENFILENAME) As Long
Private Declare Function GetFileTitle Lib "COMDLG32" Alias "GetFileTitleA" (ByVal szFile As String, ByVal szTitle As String, ByVal cbBuf As Integer) As Integer
'VFW "customized" File Dialogs
Private Declare Function GetOpenFileNamePreview Lib "MSVFW32" Alias "GetOpenFileNamePreviewA" (filestruct As OPENFILENAME) As Long
Private Declare Function GetSaveFileNamePreview Lib "MSVFW32" Alias "GetSaveFileNamePreviewA" (filestruct As OPENFILENAME) As Long

Public Enum EOpenFile
    OFN_READONLY = &H1
    OFN_OVERWRITEPROMPT = &H2
    OFN_HIDEREADONLY = &H4
    OFN_NOCHANGEDIR = &H8
    OFN_SHOWHELP = &H10
    OFN_ENABLEHOOK = &H20
    OFN_ENABLETEMPLATE = &H40
    OFN_ENABLETEMPLATEHANDLE = &H80
    OFN_NOVALIDATE = &H100
    OFN_ALLOWMULTISELECT = &H200
    OFN_EXTENSIONDIFFERENT = &H400
    OFN_PATHMUSTEXIST = &H800
    OFN_FILEMUSTEXIST = &H1000
    OFN_CREATEPROMPT = &H2000
    OFN_SHAREAWARE = &H4000
    OFN_NOREADONLYRETURN = &H8000
    OFN_NOTESTFILECREATE = &H10000
    OFN_NONETWORKBUTTON = &H20000
    OFN_NOLONGNAMES = &H40000
    OFN_EXPLORER = &H80000
    OFN_NODEREFERENCELINKS = &H100000
    OFN_LONGNAMES = &H200000
End Enum

Private Declare Function CommDlgExtendedError Lib "COMDLG32" () As Long

Public Enum EDialogError
    CDERR_DIALOGFAILURE = &HFFFF

    CDERR_GENERALCODES = &H0
    CDERR_STRUCTSIZE = &H1
    CDERR_INITIALIZATION = &H2
    CDERR_NOTEMPLATE = &H3
    CDERR_NOHINSTANCE = &H4
    CDERR_LOADSTRFAILURE = &H5
    CDERR_FINDRESFAILURE = &H6
    CDERR_LOADRESFAILURE = &H7
    CDERR_LOCKRESFAILURE = &H8
    CDERR_MEMALLOCFAILURE = &H9
    CDERR_MEMLOCKFAILURE = &HA
    CDERR_NOHOOK = &HB
    CDERR_REGISTERMSGFAIL = &HC

    PDERR_PRINTERCODES = &H1000
    PDERR_SETUPFAILURE = &H1001
    PDERR_PARSEFAILURE = &H1002
    PDERR_RETDEFFAILURE = &H1003
    PDERR_LOADDRVFAILURE = &H1004
    PDERR_GETDEVMODEFAIL = &H1005
    PDERR_INITFAILURE = &H1006
    PDERR_NODEVICES = &H1007
    PDERR_NODEFAULTPRN = &H1008
    PDERR_DNDMMISMATCH = &H1009
    PDERR_CREATEICFAILURE = &H100A
    PDERR_PRINTERNOTFOUND = &H100B
    PDERR_DEFAULTDIFFERENT = &H100C

    CFERR_CHOOSEFONTCODES = &H2000
    CFERR_NOFONTS = &H2001
    CFERR_MAXLESSTHANMIN = &H2002

    FNERR_FILENAMECODES = &H3000
    FNERR_SUBCLASSFAILURE = &H3001
    FNERR_INVALIDFILENAME = &H3002
    FNERR_BUFFERTOOSMALL = &H3003

    CCERR_CHOOSECOLORCODES = &H5000
End Enum

Private Declare Function SHBrowseForFolder Lib "Shell32" (lpbi As TBrowseInfo) As Long
Private Declare Function SHGetPathFromIDList Lib "Shell32" Alias "SHGetPathFromIDListA" (ByVal pidl As Long, ByVal pszPath As String) As Long 'C BOOL returns true on success
Public Declare Sub CoTaskMemFree Lib "ole32.dll" (ByVal pv As Long)


Private Type TBrowseInfo
    'Handle of the owner window for the dialog box.
    hwndOwner As Long
    'Pointer to an item identifier list (an
    'ITEMIDLIST structure) specifying the location of
    'the "root" folder to browse from. Only the
    'specified folder and its subfolders appear in the dialog box.
    'This member can be NULL, and in that case, the namespace
    'root (the desktop folder) is used.              pidlRoot As Long
    'Pointer to a buffer that receives the display
    'name of the folder selected by the user. The
    'size of this buffer is assumed to be MAX_PATH bytes.
    pidlRoot As Long
    'Pointer to a buffer that receives the display
    'name of the folder selected by the user. The
    'size of this buffer is assumed to be MAX_PATH bytes.
    pszDisplayName As String
    'Pointer to a null-terminated string that is
    'displayed above the tree view control in the
    'dialog box.This string can be used to specify
    'instructions to the user.
    lpszTitle As String
    'Value specifying the types of folders to be
    'listed in the dialog box as well as other options.
    'This member can include zero or more of
    'the following values below.
    ulFlags As Long
    'Address an application-defined function that the
    'dialog box calls when events occur. For more information,
    'see the description of the BrowseCallbackProc function.
    'This member can be NULL. (note: VB4 does not support
    'callbacks, therefore this member is ignored.)
    lpfn As Long
    'Application-defined value that the dialog box
    'passes to the callback function (if one is specified).
    lParam As Long
    'Variable that receives the image associated with
    'the selected folder. The image is specified as an
    'index to the system image list.
    iImage As Long
End Type
    
Public Enum BROWSE_FLAGS
   'default
   vbBIF_NONE = &H0&
   'Only returns file system directories. If the
   'user selects folders that are not part of the
   'file system, the OK button is grayed.
    vbBIF_RETURNONLYFSDIRS = &H1&
   'Does not include network folders below the
   'domain level in the tree view control.
    vbBIF_DONTGOBELOWDOMAIN = &H2&
   'Includes a status area in the dialog box.
   'The callback function can set the status
   'text by sending messages to the dialog box.
    vbBIF_STATUSTEXT = &H4&
   'Only returns file system ancestors. If the
   'user selects anything other than a file
   'system ancestor, the OK button is grayed.
    vbBIF_RETURNFSANCESTORS = &H8&
   'Only returns computers. If the user selects
   'anything other than a computer, the OK
   'button is grayed.
    vbBIF_BROWSEFORCOMPUTER = &H1000&
   'Only returns (network) printers. If the user
   'selects anything other than a printer, the
   'OK button is grayed.
    vbBIF_BROWSEFORPRINTER = &H2000&
   '// Browsing for Everything
    vbBIF_BROWSEINCLUDEFILES = &H4000&
End Enum
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Const WM_USER As Long = &H400&
Private Const BFFM_INITIALIZED As Long = 1&
'Constants ending in 'A' are for Win95 ANSI
'calls; those ending in 'W' are the wide Unicode'calls for NT.
'Sets the status text to the null-terminated
'string specified by the lParam parameter.
'wParam is ignored and should be set to 0.
Private Const BFFM_SETSTATUSTEXTA As Long = (WM_USER + 100)
Private Const BFFM_SETSTATUSTEXTW As Long = (WM_USER + 104)
'If the lParam  parameter is non-zero, enables the
'OK button, or disables it if lParam is zero.'(docs erroneously said wParam!)
'wParam is ignored and should be set to 0.
Private Const BFFM_ENABLEOK As Long = (WM_USER + 101)
'Selects the specified folder. If the wParam
'parameter is FALSE, the lParam parameter is the
'PIDL of the folder to select , or it is the path
'of the folder if wParam is the C value TRUE (or 1).
'Note that after this message is sent, the browse
'dialog receives a subsequent BFFM_SELECTIONCHANGED'message.
Private Const BFFM_SETSELECTIONA As Long = (WM_USER + 102)
Private Const BFFM_SETSELECTIONW As Long = (WM_USER + 103)

'mem functions
Private Const LMEM_FIXED As Long = &H0&
Private Const LMEM_ZEROINIT As Long = &H40&
Private Declare Function LocalAlloc Lib "kernel32" (ByVal uFlags As Long, ByVal uBytes As Long) As Long
Private Declare Function LocalFree Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Sub MoveMemory Lib "kernel32" Alias "RtlMoveMemory" (pDest As Any, pSource As Any, ByVal dwLength As Long)
   
   
Private Const sEmpty As String = ""

Public Function VBGetOpenFileName(filename As String, Optional FileTitle As String, Optional FileMustExist As Boolean = True, Optional MultiSelect As Boolean = False, Optional ReadOnly As Boolean = False, Optional HideReadOnly As Boolean = False, Optional filter As String = "All (*.*)| *.*", Optional FilterIndex As Long = 1, Optional InitDir As String = "", Optional DlgTitle As String = "", Optional DefaultExt As String = "", Optional Owner As Long = -1, Optional Flags As Long = 0) As Boolean

    Dim opfile As OPENFILENAME, s As String, afFlags As Long
With opfile
    .lStructSize = Len(opfile)
    
    ' Add in specific flags and strip out non-VB flags
    .Flags = (-FileMustExist * OFN_FILEMUSTEXIST) Or _
             (-MultiSelect * OFN_ALLOWMULTISELECT) Or _
             (-ReadOnly * OFN_READONLY) Or _
             (-HideReadOnly * OFN_HIDEREADONLY) Or _
             (Flags And CLng(Not (OFN_ENABLEHOOK Or _
                                  OFN_ENABLETEMPLATE)))
    ' Owner can take handle of owning window
    If Owner <> -1 Then .hwndOwner = Owner
    ' InitDir can take initial directory string
    .lpstrInitialDir = InitDir
    ' DefaultExt can take default extension
    .lpstrDefExt = DefaultExt
    ' DlgTitle can take dialog box title
    .lpstrTitle = DlgTitle
    
    ' To make Windows-style filter, replace | and : with nulls
    Dim ch As String, i As Integer
    For i = 1 To Len(filter)
        ch = Mid$(filter, i, 1)
        If ch = "|" Or ch = ":" Then
            s = s & vbNullChar
        Else
            s = s & ch
        End If
    Next
    ' Put double null at end
    s = s & vbNullChar & vbNullChar
    .lpstrFilter = s
    .nFilterIndex = FilterIndex

    ' Pad file and file title buffers to maximum path
    s = filename & String$(MAX_PATH - Len(filename), 0)
    .lpstrFile = s
    .nMaxFile = MAX_PATH
    s = FileTitle & String$(MAX_FILE - Len(FileTitle), 0)
    .lpstrFileTitle = s
    .nMaxFileTitle = MAX_FILE
    ' All other fields set to zero
    
    If GetOpenFileName(opfile) Then
        VBGetOpenFileName = True
        filename = Left$(.lpstrFile, InStr(.lpstrFile, vbNullChar) - 1)
        FileTitle = Left$(.lpstrFileTitle, InStr(.lpstrFileTitle, vbNullChar) - 1)
        Flags = .Flags
        ' Return the filter index
        FilterIndex = .nFilterIndex
        ' Look up the filter the user selected and return that
        filter = FilterLookup(.lpstrFilter, FilterIndex)
        If (.Flags And OFN_READONLY) Then ReadOnly = True
    Else
        VBGetOpenFileName = False
        filename = vbNullChar
        FileTitle = vbNullChar
        Flags = 0
        FilterIndex = -1
        filter = vbNullChar
    End If
End With
End Function

Public Function VBGetSaveFileName(filename As String, _
                           Optional FileTitle As String, _
                           Optional OverWritePrompt As Boolean = True, _
                           Optional filter As String = "All (*.*)| *.*", _
                           Optional FilterIndex As Long = 1, _
                           Optional InitDir As String = "", _
                           Optional DlgTitle As String = "", _
                           Optional DefaultExt As String = "", _
                           Optional Owner As Long = -1, _
                           Optional Flags As Long) As Boolean
            
    Dim opfile As OPENFILENAME, s As String
With opfile
    .lStructSize = Len(opfile)
    
    ' Add in specific flags and strip out non-VB flags
    .Flags = (-OverWritePrompt * OFN_OVERWRITEPROMPT) Or _
             OFN_HIDEREADONLY Or _
             (Flags And CLng(Not (OFN_ENABLEHOOK Or _
                                  OFN_ENABLETEMPLATE)))
    ' Owner can take handle of owning window
    If Owner <> -1 Then .hwndOwner = Owner
    ' InitDir can take initial directory string
    .lpstrInitialDir = InitDir
    ' DefaultExt can take default extension
    .lpstrDefExt = DefaultExt
    ' DlgTitle can take dialog box title
    .lpstrTitle = DlgTitle
    
    ' Make new filter with bars (|) replacing nulls and double null at end
    Dim ch As String, i As Integer
    For i = 1 To Len(filter)
        ch = Mid$(filter, i, 1)
        If ch = "|" Or ch = ":" Then
            s = s & vbNullChar
        Else
            s = s & ch
        End If
    Next
    ' Put double null at end
    s = s & vbNullChar & vbNullChar
    .lpstrFilter = s
    .nFilterIndex = FilterIndex

    ' Pad file and file title buffers to maximum path
    s = filename & String$(MAX_PATH - Len(filename), 0)
    .lpstrFile = s
    .nMaxFile = MAX_PATH
    s = FileTitle & String$(MAX_FILE - Len(FileTitle), 0)
    .lpstrFileTitle = s
    .nMaxFileTitle = MAX_FILE
    ' All other fields zero
    
    If GetSaveFileName(opfile) Then
        VBGetSaveFileName = True
        filename = Left$(.lpstrFile, InStr(.lpstrFile, vbNullChar) - 1)
        FileTitle = Left$(.lpstrFileTitle, InStr(.lpstrFileTitle, vbNullChar) - 1)
        Flags = .Flags
        ' Return the filter index
        FilterIndex = .nFilterIndex
        ' Look up the filter the user selected and return that
        filter = FilterLookup(.lpstrFilter, FilterIndex)
    Else
        VBGetSaveFileName = False
        filename = vbNullChar
        FileTitle = vbNullChar
        Flags = 0
        FilterIndex = 0
        filter = vbNullChar
    End If
End With
End Function

Private Function FilterLookup(ByVal sFilters As String, ByVal iCur As Long) As String
    Dim iStart As Long, iEnd As Long, s As String
    iStart = 1
    If sFilters = vbNullChar Then Exit Function
    Do
        ' Cut out both parts marked by null character
        iEnd = InStr(iStart, sFilters, vbNullChar)
        If iEnd = 0 Then Exit Function
        iEnd = InStr(iEnd + 1, sFilters, vbNullChar)
        If iEnd Then
            s = Mid$(sFilters, iStart, iEnd - iStart)
        Else
            s = Mid$(sFilters, iStart)
        End If
        iStart = iEnd + 1
        If iCur = 1 Then
            FilterLookup = s
            Exit Function
        End If
        iCur = iCur - 1
    Loop While iCur
End Function

Public Function VBGetFileTitle(sFile As String) As String
    Dim sFileTitle As String, cFileTitle As Integer

    cFileTitle = MAX_PATH
    sFileTitle = String$(MAX_PATH, 0)
    cFileTitle = GetFileTitle(sFile, sFileTitle, MAX_PATH)
    If cFileTitle Then
        VBGetFileTitle = ""
    Else
        VBGetFileTitle = Left$(sFileTitle, InStr(sFileTitle, vbNullChar) - 1)
    End If

End Function

Public Function VBGetOpenFileNamePreview(filename As String, _
                           Optional FileTitle As String, _
                           Optional FileMustExist As Boolean = True, _
                           Optional MultiSelect As Boolean = False, _
                           Optional ReadOnly As Boolean = False, _
                           Optional HideReadOnly As Boolean = False, _
                           Optional filter As String = "All (*.*)| *.*", _
                           Optional FilterIndex As Long = 1, _
                           Optional InitDir As String, _
                           Optional DlgTitle As String, _
                           Optional DefaultExt As String, _
                           Optional Owner As Long = -1, _
                           Optional Flags As Long = 0) As Boolean

    Dim opfile As OPENFILENAME, s As String, afFlags As Long
With opfile
    .lStructSize = Len(opfile)
    
    ' Add in specific flags and strip out non-VB flags
    .Flags = (-FileMustExist * OFN_FILEMUSTEXIST) Or _
             (-MultiSelect * OFN_ALLOWMULTISELECT) Or _
             (-ReadOnly * OFN_READONLY) Or _
             (-HideReadOnly * OFN_HIDEREADONLY) Or _
             (Flags And CLng(Not (OFN_ENABLEHOOK Or _
                                  OFN_ENABLETEMPLATE)))
    ' Owner can take handle of owning window
    If Owner <> -1 Then .hwndOwner = Owner
    ' InitDir can take initial directory string
    .lpstrInitialDir = InitDir
    ' DefaultExt can take default extension
    .lpstrDefExt = DefaultExt
    ' DlgTitle can take dialog box title
    .lpstrTitle = DlgTitle
    
    ' To make Windows-style filter, replace | and : with nulls
    Dim ch As String, i As Integer
    For i = 1 To Len(filter)
        ch = Mid$(filter, i, 1)
        If ch = "|" Or ch = ":" Then
            s = s & vbNullChar
        Else
            s = s & ch
        End If
    Next
    ' Put double null at end
    s = s & vbNullChar & vbNullChar
    .lpstrFilter = s
    .nFilterIndex = FilterIndex

    ' Pad file and file title buffers to maximum path
    s = filename & String$(MAX_PATH - Len(filename), 0)
    .lpstrFile = s
    .nMaxFile = MAX_PATH
    s = FileTitle & String$(MAX_FILE - Len(FileTitle), 0)
    .lpstrFileTitle = s
    .nMaxFileTitle = MAX_FILE
    ' All other fields set to zero
    
    If GetOpenFileNamePreview(opfile) Then
        VBGetOpenFileNamePreview = True
        filename = Left$(.lpstrFile, InStr(.lpstrFile, vbNullChar) - 1)
        FileTitle = Left$(.lpstrFileTitle, InStr(.lpstrFileTitle, vbNullChar) - 1)
        Flags = .Flags
        ' Return the filter index
        FilterIndex = .nFilterIndex
        ' Look up the filter the user selected and return that
        filter = FilterLookup(.lpstrFilter, FilterIndex)
        If (.Flags And OFN_READONLY) Then ReadOnly = True
    Else
        VBGetOpenFileNamePreview = False
        filename = vbNullChar
        FileTitle = vbNullChar
        Flags = 0
        FilterIndex = -1
        filter = vbNullChar
    End If
End With
End Function

Public Function VBGetSaveFileNamePreview(filename As String, _
                           Optional FileTitle As String = "", _
                           Optional FileMustExist As Boolean = True, _
                           Optional MultiSelect As Boolean = False, _
                           Optional ReadOnly As Boolean = False, _
                           Optional HideReadOnly As Boolean = False, _
                           Optional filter As String = "All (*.*)| *.*", _
                           Optional FilterIndex As Long = 1, _
                           Optional InitDir As String = "", _
                           Optional DlgTitle As String = "", _
                           Optional DefaultExt As String = "", _
                           Optional Owner As Long = -1, _
                           Optional Flags As Long = 0) As Boolean

    Dim opfile As OPENFILENAME, s As String, afFlags As Long
With opfile
    .lStructSize = Len(opfile)
    
    ' Add in specific flags and strip out non-VB flags
    .Flags = (-FileMustExist * OFN_FILEMUSTEXIST) Or _
             (-MultiSelect * OFN_ALLOWMULTISELECT) Or _
             (-ReadOnly * OFN_READONLY) Or _
             (-HideReadOnly * OFN_HIDEREADONLY) Or _
             (Flags And CLng(Not (OFN_ENABLEHOOK Or _
                                  OFN_ENABLETEMPLATE)))
    ' Owner can take handle of owning window
    If Owner <> -1 Then .hwndOwner = Owner
    ' InitDir can take initial directory string
    .lpstrInitialDir = InitDir
    ' DefaultExt can take default extension
    .lpstrDefExt = DefaultExt
    ' DlgTitle can take dialog box title
    .lpstrTitle = DlgTitle
    
    ' To make Windows-style filter, replace | and : with nulls
    Dim ch As String, i As Integer
    For i = 1 To Len(filter)
        ch = Mid$(filter, i, 1)
        If ch = "|" Or ch = ":" Then
            s = s & vbNullChar
        Else
            s = s & ch
        End If
    Next
    ' Put double null at end
    s = s & vbNullChar & vbNullChar
    .lpstrFilter = s
    .nFilterIndex = FilterIndex

    ' Pad file and file title buffers to maximum path
    s = filename & String$(MAX_PATH - Len(filename), 0)
    .lpstrFile = s
    .nMaxFile = MAX_PATH
    s = FileTitle & String$(MAX_FILE - Len(FileTitle), 0)
    .lpstrFileTitle = s
    .nMaxFileTitle = MAX_FILE
    ' All other fields set to zero
    
    If GetSaveFileNamePreview(opfile) Then
        VBGetSaveFileNamePreview = True
        filename = Left$(.lpstrFile, InStr(.lpstrFile, vbNullChar) - 1)
        FileTitle = Left$(.lpstrFileTitle, InStr(.lpstrFileTitle, vbNullChar) - 1)
        Flags = .Flags
        ' Return the filter index
        FilterIndex = .nFilterIndex
        ' Look up the filter the user selected and return that
        filter = FilterLookup(.lpstrFilter, FilterIndex)
        If (.Flags And OFN_READONLY) Then ReadOnly = True
    Else
        VBGetSaveFileNamePreview = False
        filename = vbNullChar
        FileTitle = vbNullChar
        Flags = 0
        FilterIndex = -1
        filter = vbNullChar
    End If
End With
End Function

Public Function BrowseForFolder(ByVal hwndOwner As Long, _
                                ByVal sTitle As String, _
                                Optional ByVal initFolder As String = "", _
                                Optional ByVal vRoot As SPECIAL_FOLDERS = vbCSIDL_DESKTOP, _
                                Optional ByVal Flags As BROWSE_FLAGS = vbBIF_NONE) As String

    Dim BI As TBrowseInfo
    Dim lpsz As Long
    Dim pidl As Long
    Dim sPath As String

    BI.hwndOwner = hwndOwner
    BI.pszDisplayName = String$(MAX_PATH, 0)
    BI.lpszTitle = sTitle
    BI.pidlRoot = vRoot
    BI.ulFlags = Flags
    BI.lpfn = vbGetProcAddress(AddressOf BrowseCallbackProc)
    If initFolder <> "" Then
        lpsz = LocalAlloc(LMEM_FIXED Or LMEM_ZEROINIT, Len(initFolder))
        Call MoveMemory(ByVal lpsz, ByVal initFolder, Len(initFolder))
        BI.lParam = lpsz
    End If
    'show dialog here
    pidl = SHBrowseForFolder(BI)
    sPath = String$(MAX_PATH, 0)
    Call SHGetPathFromIDList(pidl, sPath)
    If pidl <> 0 Then
        Call CoTaskMemFree(pidl)
        BrowseForFolder = StrZToStr(sPath)
    End If
    If lpsz <> 0 Then
        Call LocalFree(lpsz)
    End If
   
End Function


'*******************************************
'StrZToStr()
'by Ray Mercer copyright (c) 1997
'converts a C string to a Visual Basic string
'based on a function from "VBPG by Dan Appleman"
'*******************************************
Private Function StrZToStr(s As String) As String
'    Dim startp As Integer, endp As Integer
'    Dim newString As String
'
'    startp = 1
'    Do While (Asc(Mid$(s, startp, 1)) <> 0)
'        endp = InStr(startp, s, vbNullChar)
'        If endp = 0 Then StrZToStr = s: Exit Function 'handle VB strings
'        newString = newString & Mid$(s, startp, endp - startp)
'        startp = endp + 1
'    Loop
'    StrZToStr = newString
    'different algorithm
Dim TempString As String
    TempString = Left$(s, InStr(s, vbNullChar) - 1)
    If TempString = "" Then
        'if VB string is accidently passed in there will be no NULL
        'so just pass back the original string in that case
        StrZToStr = s
    Else
        StrZToStr = TempString
    End If
End Function

' Test file existence with error trapping
Private Function ExistFile(ByVal sSpec As String) As Boolean
    On Error Resume Next
    Call FileLen(sSpec)
    ExistFile = (Err = 0)
End Function
Private Function vbGetProcAddress(ByVal lpfunc As Long) As Long
    'indirection function for using AddressOf within VB
    vbGetProcAddress = lpfunc
End Function
Private Function BrowseCallbackProc(ByVal hWnd As Long, _
                                   ByVal uMsg As Long, _
                                   ByVal lParam As Long, _
                                   ByVal lpData As Long) As Long
  'Callback for the Browse PIDL method.
  'On initialization, set the dialog's
  'pre-selected folder using the pidl
  'set as the bi.lParam, and passed back
  'to the callback as lpData param.
  Select Case uMsg
      Case BFFM_INITIALIZED
         Call SendMessage(hWnd, BFFM_SETSELECTIONA, _
                          1&, ByVal lpData)
         Case Else
            '
         End Select
End Function

