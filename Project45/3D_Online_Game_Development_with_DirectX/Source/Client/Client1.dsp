# Microsoft Developer Studio Project File - Name="Client1" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=Client1 - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Client1.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Client1.mak" CFG="Client1 - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Client1 - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "Client1 - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Client1 - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x41e /d "NDEBUG"
# ADD RSC /l 0x41e /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386

!ELSEIF  "$(CFG)" == "Client1 - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /I ".\\" /I ".\Lib" /I ".\GameLib" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x41e /d "_DEBUG"
# ADD RSC /l 0x41e /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 msimg32.lib wsock32.lib dxguid.lib dplayx.lib d3d8.lib d3dx8.lib d3dxof.lib dxguid.lib dinput8.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept

!ENDIF 

# Begin Target

# Name "Client1 - Win32 Release"
# Name "Client1 - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\WinMain.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\WinMain.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\resource.h
# End Source File
# Begin Source File

SOURCE=.\Script1.rc
# End Source File
# End Group
# Begin Group "Core Library Header Files"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\Lib\Core_Global.h
# End Source File
# Begin Source File

SOURCE=.\Lib\Core_Graphics.h
# End Source File
# Begin Source File

SOURCE=.\Lib\Core_Input.h
# End Source File
# Begin Source File

SOURCE=.\Lib\Core_Network.h
# End Source File
# Begin Source File

SOURCE=.\Lib\Core_System.h
# End Source File
# Begin Source File

SOURCE=.\Lib\Tile.h
# End Source File
# End Group
# Begin Group "Core Library Source Files"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\Lib\Core_Graphics.cpp
# End Source File
# Begin Source File

SOURCE=.\Lib\Core_Input.cpp
# End Source File
# Begin Source File

SOURCE=.\Lib\Core_Network.cpp
# End Source File
# Begin Source File

SOURCE=.\Lib\Core_System.cpp
# End Source File
# Begin Source File

SOURCE=.\Lib\Tile.cpp
# End Source File
# End Group
# Begin Group "Dialog Header Files"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\GameLib\cChatDialog.h
# End Source File
# Begin Source File

SOURCE=.\GameLib\cDisplayDialog.h
# End Source File
# Begin Source File

SOURCE=.\GameLib\cLoginDialog.h
# End Source File
# Begin Source File

SOURCE=.\GameLib\cMessageDlg.h
# End Source File
# Begin Source File

SOURCE=.\GameLib\cReturnDialog.h
# End Source File
# Begin Source File

SOURCE=.\GameLib\Global_Func.h
# End Source File
# End Group
# Begin Group "Dialog Soruce Files"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\GameLib\cChatDialog.cpp
# End Source File
# Begin Source File

SOURCE=.\GameLib\cDisplayDialog.cpp
# End Source File
# Begin Source File

SOURCE=.\GameLib\cLoginDialog.cpp
# End Source File
# Begin Source File

SOURCE=.\GameLib\cMessageDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\GameLib\cReturnDialog.cpp
# End Source File
# Begin Source File

SOURCE=.\GameLib\Global_Func.cpp
# End Source File
# End Group
# Begin Group "Game Header Files"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\GameLib\cCreature.h
# End Source File
# Begin Source File

SOURCE=.\GameLib\cLandscape.h
# End Source File
# Begin Source File

SOURCE=.\GameLib\cLayerWindow.h
# End Source File
# Begin Source File

SOURCE=.\GameLib\cMiniMap.h
# End Source File
# Begin Source File

SOURCE=.\GameLib\cMonster.h
# End Source File
# Begin Source File

SOURCE=.\GameLib\cNumber.h
# End Source File
# Begin Source File

SOURCE=.\GameLib\cPacket.h
# End Source File
# Begin Source File

SOURCE=.\GameLib\cPlayer.h
# End Source File
# Begin Source File

SOURCE=.\GameLib\cRelCamera.h
# End Source File
# Begin Source File

SOURCE=.\GameLib\cStatusBar.h
# End Source File
# End Group
# Begin Group "Game Source Files"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\GameLib\cCreature.cpp
# End Source File
# Begin Source File

SOURCE=.\GameLib\cLanscape.cpp
# End Source File
# Begin Source File

SOURCE=.\GameLib\cLayerWindow.cpp
# End Source File
# Begin Source File

SOURCE=.\GameLib\cMiniMap.cpp
# End Source File
# Begin Source File

SOURCE=.\GameLib\cMonster.cpp
# End Source File
# Begin Source File

SOURCE=.\GameLib\cNumber.cpp
# End Source File
# Begin Source File

SOURCE=.\GameLib\cPlayer.cpp
# End Source File
# Begin Source File

SOURCE=.\GameLib\cRelCamera.cpp
# End Source File
# Begin Source File

SOURCE=.\GameLib\cStatusBar.cpp
# End Source File
# End Group
# End Target
# End Project
