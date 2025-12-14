# Microsoft Developer Studio Project File - Name="TcpScan" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=TcpScan - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "TcpScan.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "TcpScan.mak" CFG="TcpScan - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "TcpScan - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "TcpScan - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "TcpScan - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Release"
# PROP BASE Intermediate_Dir ".\Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\Release"
# PROP Intermediate_Dir ".\Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MD /W4 /GX /O2 /I ".\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /FD /c
# SUBTRACT CPP /YX
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 /nologo /subsystem:windows /machine:I386

!ELSEIF  "$(CFG)" == "TcpScan - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Debug"
# PROP BASE Intermediate_Dir ".\Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\Debug"
# PROP Intermediate_Dir ".\Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MDd /W4 /GX /ZI /Od /I ".\include" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /FR /FD /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 /nologo /subsystem:windows /incremental:no /debug /machine:I386

!ENDIF 

# Begin Target

# Name "TcpScan - Win32 Release"
# Name "TcpScan - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\CAsyncSock.cpp
# End Source File
# Begin Source File

SOURCE=.\CBase64.cpp
# End Source File
# Begin Source File

SOURCE=.\CBinFile.cpp
# End Source File
# Begin Source File

SOURCE=.\CConfig.cpp
# End Source File
# Begin Source File

SOURCE=.\CDateTime.cpp
# End Source File
# Begin Source File

SOURCE=.\CListCtrlEx.cpp
# End Source File
# Begin Source File

SOURCE=.\CNodeList.cpp
# End Source File
# Begin Source File

SOURCE=.\CPropertyPageDialog.cpp
# End Source File
# Begin Source File

SOURCE=.\CPropertySheetDialog.cpp
# End Source File
# Begin Source File

SOURCE=.\CRegistry.cpp
# End Source File
# Begin Source File

SOURCE=.\CRegKey.cpp
# End Source File
# Begin Source File

SOURCE=.\CSock.cpp
# End Source File
# Begin Source File

SOURCE=.\CTextFile.cpp
# End Source File
# Begin Source File

SOURCE=.\CUuenc.cpp
# End Source File
# Begin Source File

SOURCE=.\CWinsock.cpp
# End Source File
# Begin Source File

SOURCE=.\strcpyn.cpp
# End Source File
# Begin Source File

SOURCE=.\strichr.cpp
# End Source File
# Begin Source File

SOURCE=.\stristr.cpp
# End Source File
# Begin Source File

SOURCE=.\TcpConnectPage.cpp
# End Source File
# Begin Source File

SOURCE=.\TcpPropertySheet.cpp
# End Source File
# Begin Source File

SOURCE=.\TcpScan.cpp
# End Source File
# Begin Source File

SOURCE=.\TcpScan.rc
# End Source File
# Begin Source File

SOURCE=.\TcpScanAddServiceDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\TcpScanAddUrlDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\TcpScanConfig.cpp
# End Source File
# Begin Source File

SOURCE=.\TcpScanPage.cpp
# End Source File
# Begin Source File

SOURCE=.\TcpServicesPage.cpp
# End Source File
# Begin Source File

SOURCE=.\win32api.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\include\CAsyncSock.h
# End Source File
# Begin Source File

SOURCE=.\include\CAsyncSockMessages.h
# End Source File
# Begin Source File

SOURCE=.\include\CBase64.h
# End Source File
# Begin Source File

SOURCE=.\include\CBinFile.h
# End Source File
# Begin Source File

SOURCE=.\include\CConfig.h
# End Source File
# Begin Source File

SOURCE=.\include\CDateTime.h
# End Source File
# Begin Source File

SOURCE=.\include\CListCtrlEx.h
# End Source File
# Begin Source File

SOURCE=.\include\CNodeList.h
# End Source File
# Begin Source File

SOURCE=.\include\CPropertyPageDialog.h
# End Source File
# Begin Source File

SOURCE=.\include\CPropertyPageList.h
# End Source File
# Begin Source File

SOURCE=.\include\CPropertySheetDialog.h
# End Source File
# Begin Source File

SOURCE=.\include\CPropertySheetDialogMessages.h
# End Source File
# Begin Source File

SOURCE=.\include\CRegistry.h
# End Source File
# Begin Source File

SOURCE=.\include\CRegKey.h
# End Source File
# Begin Source File

SOURCE=.\include\CSock.h
# End Source File
# Begin Source File

SOURCE=.\include\CTextFile.h
# End Source File
# Begin Source File

SOURCE=.\include\CUuenc.h
# End Source File
# Begin Source File

SOURCE=.\include\CWinsock.h
# End Source File
# Begin Source File

SOURCE=.\include\env.h
# End Source File
# Begin Source File

SOURCE=.\include\lmhosts.h
# End Source File
# Begin Source File

SOURCE=.\include\macro.h
# End Source File
# Begin Source File

SOURCE=.\include\pragma.h
# End Source File
# Begin Source File

SOURCE=.\include\strcpyn.h
# End Source File
# Begin Source File

SOURCE=.\include\strichr.h
# End Source File
# Begin Source File

SOURCE=.\include\stristr.h
# End Source File
# Begin Source File

SOURCE=.\include\TcpConnectPage.h
# End Source File
# Begin Source File

SOURCE=.\include\TcpMessages.h
# End Source File
# Begin Source File

SOURCE=.\include\TcpPropertySheet.h
# End Source File
# Begin Source File

SOURCE=.\include\TcpScan.h
# End Source File
# Begin Source File

SOURCE=.\include\TcpScanAddServiceDlg.h
# End Source File
# Begin Source File

SOURCE=.\include\TcpScanAddUrlDlg.h
# End Source File
# Begin Source File

SOURCE=.\include\TcpScanConfig.h
# End Source File
# Begin Source File

SOURCE=.\include\TcpScanPage.h
# End Source File
# Begin Source File

SOURCE=.\include\TcpScanVersion.h
# End Source File
# Begin Source File

SOURCE=.\include\TcpServicesPage.h
# End Source File
# Begin Source File

SOURCE=.\include\typedef.h
# End Source File
# Begin Source File

SOURCE=.\include\win32api.h
# End Source File
# Begin Source File

SOURCE=.\include\window.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\res\iconport.ico
# End Source File
# Begin Source File

SOURCE=.\res\iconporterror.ico
# End Source File
# Begin Source File

SOURCE=.\res\TcpScan.ico
# End Source File
# End Group
# End Target
# End Project
