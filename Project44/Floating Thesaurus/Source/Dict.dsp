# Microsoft Developer Studio Project File - Name="Dict" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=Dict - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Dict.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Dict.mak" CFG="Dict - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Dict - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "Dict - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Dict - Win32 Release"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /D "_MBCS" /Yu"stdafx.h" /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x41e /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x41e /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:I386
# ADD LINK32 /nologo /subsystem:windows /machine:I386

!ELSEIF  "$(CFG)" == "Dict - Win32 Debug"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /Yu"stdafx.h" /FD /GZ /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_AFXDLL" /FR /Yu"stdafx.h" /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x41e /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x41e /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept

!ENDIF 

# Begin Target

# Name "Dict - Win32 Release"
# Name "Dict - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\Add.cpp
# End Source File
# Begin Source File

SOURCE=.\Delete.cpp
# End Source File
# Begin Source File

SOURCE=.\DialogThread.cpp
# End Source File
# Begin Source File

SOURCE=.\Dict.cpp
# End Source File
# Begin Source File

SOURCE=.\Dict.rc
# End Source File
# Begin Source File

SOURCE=.\DictDoc.cpp
# End Source File
# Begin Source File

SOURCE=.\DictSet.cpp
# End Source File
# Begin Source File

SOURCE=.\DictView.cpp
# End Source File
# Begin Source File

SOURCE=.\GifAnimation.cpp
# End Source File
# Begin Source File

SOURCE=.\HangmanTutor.cpp
# End Source File
# Begin Source File

SOURCE=.\HangResult.cpp
# End Source File
# Begin Source File

SOURCE=.\MainFrm.cpp
# End Source File
# Begin Source File

SOURCE=.\PictureEx.cpp
# End Source File
# Begin Source File

SOURCE=.\SearchOnline.cpp
# End Source File
# Begin Source File

SOURCE=.\StdAfx.cpp
# ADD CPP /Yc"stdafx.h"
# End Source File
# Begin Source File

SOURCE=.\SystemTray.cpp
# End Source File
# Begin Source File

SOURCE=.\Update.cpp
# End Source File
# Begin Source File

SOURCE=.\UpdateBox.cpp
# End Source File
# Begin Source File

SOURCE=.\XInfoTip.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\Add.h
# End Source File
# Begin Source File

SOURCE=.\Delete.h
# End Source File
# Begin Source File

SOURCE=.\DialogThread.h
# End Source File
# Begin Source File

SOURCE=.\Dict.h
# End Source File
# Begin Source File

SOURCE=.\DictDoc.h
# End Source File
# Begin Source File

SOURCE=.\DictSet.h
# End Source File
# Begin Source File

SOURCE=.\DictView.h
# End Source File
# Begin Source File

SOURCE=.\GifAnimation.h
# End Source File
# Begin Source File

SOURCE=.\HangmanTutor.h
# End Source File
# Begin Source File

SOURCE=.\HangResult.h
# End Source File
# Begin Source File

SOURCE=.\MainFrm.h
# End Source File
# Begin Source File

SOURCE=.\PictureEx.h
# End Source File
# Begin Source File

SOURCE=.\Resource.h
# End Source File
# Begin Source File

SOURCE=.\SearchOnline.h
# End Source File
# Begin Source File

SOURCE=.\StdAfx.h
# End Source File
# Begin Source File

SOURCE=.\SystemTray.h
# End Source File
# Begin Source File

SOURCE=.\Update.h
# End Source File
# Begin Source File

SOURCE=.\UpdateBox.h
# End Source File
# Begin Source File

SOURCE=.\XInfoTip.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\res\ape10.gif
# End Source File
# Begin Source File

SOURCE=.\res\balloons.gif
# End Source File
# Begin Source File

SOURCE=.\res\cur00001.cur
# End Source File
# Begin Source File

SOURCE=.\res\cursor1.cur
# End Source File
# Begin Source File

SOURCE=.\res\Dict.ico
# End Source File
# Begin Source File

SOURCE=.\res\Dict.rc2
# End Source File
# Begin Source File

SOURCE=.\res\DictDoc.ico
# End Source File
# Begin Source File

SOURCE=.\res\Hang.GIF
# End Source File
# Begin Source File

SOURCE=.\res\Hang01.GIF
# End Source File
# Begin Source File

SOURCE=.\res\Hang02.GIF
# End Source File
# Begin Source File

SOURCE=.\res\Hang03.GIF
# End Source File
# Begin Source File

SOURCE=.\res\Hang04.GIF
# End Source File
# Begin Source File

SOURCE=.\res\Hang05.GIF
# End Source File
# Begin Source File

SOURCE=.\res\Hang06.GIF
# End Source File
# Begin Source File

SOURCE=.\res\Hang07.GIF
# End Source File
# Begin Source File

SOURCE=.\res\Hang08.GIF
# End Source File
# Begin Source File

SOURCE=.\res\Hang09.gif
# End Source File
# Begin Source File

SOURCE=.\res\icon1.ico
# End Source File
# Begin Source File

SOURCE=.\res\icon2.ico
# End Source File
# Begin Source File

SOURCE=.\res\idr_main.ico
# End Source File
# Begin Source File

SOURCE=.\res\Jack.ico
# End Source File
# Begin Source File

SOURCE=.\res\lose.gif
# End Source File
# Begin Source File

SOURCE=.\res\monkey1.gif
# End Source File
# Begin Source File

SOURCE=.\res\result.gif
# End Source File
# Begin Source File

SOURCE=.\res\Toolbar.bmp
# End Source File
# End Group
# Begin Source File

SOURCE=.\ReadMe.txt
# End Source File
# End Target
# End Project
