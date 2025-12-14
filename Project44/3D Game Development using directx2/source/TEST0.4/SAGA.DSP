# Microsoft Developer Studio Project File - Name="saga" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=saga - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "saga.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "saga.mak" CFG="saga - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "saga - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "saga - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "saga - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
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
# ADD LINK32 d3d8.lib d3dx8.lib d3dxof.lib ddraw.lib dinput8.lib dsound.lib dxerr8.lib dxguid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib comctl32.lib strmiids.lib /nologo /subsystem:windows /machine:I386

!ELSEIF  "$(CFG)" == "saga - Win32 Debug"

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
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x41e /d "_DEBUG"
# ADD RSC /l 0x41e /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 d3d8.lib d3dx8.lib d3dxof.lib ddraw.lib dinput8.lib dsound.lib dxerr8.lib dxguid.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib comctl32.lib strmiids.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept

!ENDIF 

# Begin Target

# Name "saga - Win32 Release"
# Name "saga - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Group "Engine_cpp"

# PROP Default_Filter ".cpp"
# Begin Group "3D_cpp"

# PROP Default_Filter ".cpp"
# Begin Source File

SOURCE=.\Ng3d.cpp
# End Source File
# Begin Source File

SOURCE=.\nganime.cpp
# End Source File
# Begin Source File

SOURCE=.\ngbuffer.cpp
# End Source File
# Begin Source File

SOURCE=.\ngcamera.cpp
# End Source File
# Begin Source File

SOURCE=.\ngcollision.cpp
# End Source File
# Begin Source File

SOURCE=.\ngframe.cpp
# End Source File
# Begin Source File

SOURCE=.\nggraphics.cpp
# End Source File
# Begin Source File

SOURCE=.\nglight.cpp
# End Source File
# Begin Source File

SOURCE=.\ngmdlfile.cpp
# End Source File
# Begin Source File

SOURCE=.\Ngmodel.cpp
# End Source File
# Begin Source File

SOURCE=.\ngmtrl.cpp
# End Source File
# Begin Source File

SOURCE=.\Ngpanel.cpp
# End Source File
# Begin Source File

SOURCE=.\ngrender.cpp
# End Source File
# Begin Source File

SOURCE=.\ngresource.cpp
# End Source File
# Begin Source File

SOURCE=.\ngscene.cpp
# End Source File
# Begin Source File

SOURCE=.\ngtexfile.cpp
# End Source File
# Begin Source File

SOURCE=.\ngtexture.cpp
# End Source File
# End Group
# Begin Group "Sound_cpp"

# PROP Default_Filter ".cpp"
# Begin Source File

SOURCE=.\dsutil.cpp
# End Source File
# Begin Source File

SOURCE=.\nsound.cpp
# End Source File
# End Group
# Begin Group "Show_cpp"

# PROP Default_Filter ".cpp"
# Begin Source File

SOURCE=.\nmusic.cpp
# End Source File
# Begin Source File

SOURCE=.\nvideo.cpp
# End Source File
# End Group
# Begin Group "Input_cpp"

# PROP Default_Filter "cpp"
# Begin Source File

SOURCE=.\Nginput.cpp
# End Source File
# End Group
# Begin Source File

SOURCE=.\ngcore.cpp
# End Source File
# Begin Source File

SOURCE=.\Ngfile.cpp
# End Source File
# Begin Source File

SOURCE=.\Ngmisc.cpp
# End Source File
# Begin Source File

SOURCE=.\Ngtypes.cpp
# End Source File
# End Group
# Begin Group "Game_cpp"

# PROP Default_Filter "cpp"
# Begin Source File

SOURCE=.\ngame.cpp
# End Source File
# End Group
# Begin Source File

SOURCE=.\Gamemain.cpp
# End Source File
# Begin Source File

SOURCE=.\Winmain.cpp
# End Source File
# Begin Source File

SOURCE=.\Winmain.rc
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Group "DirectX"

# PROP Default_Filter ""
# Begin Source File

SOURCE=D:\mssdk\include\d3d8.h
# End Source File
# Begin Source File

SOURCE=D:\mssdk\include\d3d8caps.h
# End Source File
# Begin Source File

SOURCE=D:\mssdk\include\d3d8types.h
# End Source File
# Begin Source File

SOURCE=D:\mssdk\include\d3dx8.h
# End Source File
# Begin Source File

SOURCE=D:\mssdk\include\d3dx8core.h
# End Source File
# Begin Source File

SOURCE=D:\mssdk\include\d3dx8effect.h
# End Source File
# Begin Source File

SOURCE=D:\mssdk\include\d3dx8math.h
# End Source File
# Begin Source File

SOURCE=D:\mssdk\include\d3dx8shape.h
# End Source File
# Begin Source File

SOURCE=D:\mssdk\include\d3dx8tex.h
# End Source File
# Begin Source File

SOURCE=D:\mssdk\include\ddraw.h
# End Source File
# End Group
# Begin Group "Engine_h"

# PROP Default_Filter ".h"
# Begin Group "3D_h"

# PROP Default_Filter ".h"
# Begin Source File

SOURCE=.\Ng3d.h
# End Source File
# Begin Source File

SOURCE=.\nganime.h
# End Source File
# Begin Source File

SOURCE=.\ngbuffer.h
# End Source File
# Begin Source File

SOURCE=.\ngcamera.h
# End Source File
# Begin Source File

SOURCE=.\ngcollision.h
# End Source File
# Begin Source File

SOURCE=.\ngframe.h
# End Source File
# Begin Source File

SOURCE=.\nggraphics.h
# End Source File
# Begin Source File

SOURCE=.\nglight.h
# End Source File
# Begin Source File

SOURCE=.\ngmdlfile.h
# End Source File
# Begin Source File

SOURCE=.\Ngmodel.h
# End Source File
# Begin Source File

SOURCE=.\ngmtrl.h
# End Source File
# Begin Source File

SOURCE=.\Ngpanel.h
# End Source File
# Begin Source File

SOURCE=.\ngrender.h
# End Source File
# Begin Source File

SOURCE=.\ngresource.h
# End Source File
# Begin Source File

SOURCE=.\ngscene.h
# End Source File
# Begin Source File

SOURCE=.\ngtexfile.h
# End Source File
# Begin Source File

SOURCE=.\ngtexture.h
# End Source File
# End Group
# Begin Group "Sound_h"

# PROP Default_Filter ".h"
# Begin Source File

SOURCE=.\dsutil.h
# End Source File
# Begin Source File

SOURCE=.\nsound.h
# End Source File
# End Group
# Begin Group "Show_h"

# PROP Default_Filter ".h"
# Begin Source File

SOURCE=.\Nmusic.h
# End Source File
# Begin Source File

SOURCE=.\nvideo.h
# End Source File
# End Group
# Begin Group "Input_h"

# PROP Default_Filter "h"
# Begin Source File

SOURCE=.\Nginput.h
# End Source File
# End Group
# Begin Source File

SOURCE=.\Ng.h
# End Source File
# Begin Source File

SOURCE=.\ngcore.h
# End Source File
# Begin Source File

SOURCE=.\Ngfile.h
# End Source File
# Begin Source File

SOURCE=.\Ngmisc.h
# End Source File
# Begin Source File

SOURCE=.\Ngtypes.h
# End Source File
# End Group
# Begin Group "Game_h"

# PROP Default_Filter "h"
# Begin Source File

SOURCE=.\ngame.h
# End Source File
# End Group
# Begin Source File

SOURCE=.\Gamemain.h
# End Source File
# Begin Source File

SOURCE=.\resource.h
# End Source File
# Begin Source File

SOURCE=.\stdafx.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\icon1.ico
# End Source File
# Begin Source File

SOURCE=.\small.ico
# End Source File
# End Group
# End Target
# End Project
