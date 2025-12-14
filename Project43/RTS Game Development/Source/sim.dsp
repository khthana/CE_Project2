# Microsoft Developer Studio Project File - Name="sim" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=sim - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "sim.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "sim.mak" CFG="sim - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "sim - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "sim - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "sim - Win32 Release"

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

!ELSEIF  "$(CFG)" == "sim - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "sim___Win32_Debug"
# PROP BASE Intermediate_Dir "sim___Win32_Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "sim___Win32_Debug"
# PROP Intermediate_Dir "sim___Win32_Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR /YX /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x41e /d "_DEBUG"
# ADD RSC /l 0x41e /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 dxguid.lib ddraw.lib winmm.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept

!ENDIF 

# Begin Target

# Name "sim - Win32 Release"
# Name "sim - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\ActionInterpreter.cpp
# End Source File
# Begin Source File

SOURCE=.\CmdButtonBar.cpp
# End Source File
# Begin Source File

SOURCE=.\ddutil.cpp
# End Source File
# Begin Source File

SOURCE=.\eventproc.cpp
# End Source File
# Begin Source File

SOURCE=.\Fansy_Button.cpp
# End Source File
# Begin Source File

SOURCE=.\Fansy_Window.cpp
# End Source File
# Begin Source File

SOURCE=.\GameCommand.cpp
# End Source File
# Begin Source File

SOURCE=.\GameCommandButton.cpp
# End Source File
# Begin Source File

SOURCE=.\GameCommandButtons.cpp
# End Source File
# Begin Source File

SOURCE=.\GameCommandQueue.cpp
# End Source File
# Begin Source File

SOURCE=.\GameEvent.cpp
# End Source File
# Begin Source File

SOURCE=.\GameMap.cpp
# End Source File
# Begin Source File

SOURCE=.\GameObject.cpp
# End Source File
# Begin Source File

SOURCE=.\GameObjectAnimator.cpp
# End Source File
# Begin Source File

SOURCE=.\GameObjectMap.cpp
# End Source File
# Begin Source File

SOURCE=.\gameutil.cpp
# End Source File
# Begin Source File

SOURCE=.\GameWorld.cpp
# End Source File
# Begin Source File

SOURCE=.\GFXManager.cpp
# End Source File
# Begin Source File

SOURCE=.\God.cpp
# End Source File
# Begin Source File

SOURCE=.\GodOfRenderring.cpp
# End Source File
# Begin Source File

SOURCE=.\Graphics.cpp
# End Source File
# Begin Source File

SOURCE=.\GroundLayerMap.cpp
# End Source File
# Begin Source File

SOURCE=.\Gui.cpp
# End Source File
# Begin Source File

SOURCE=.\Gui_Button.cpp
# End Source File
# Begin Source File

SOURCE=.\Gui_Container.cpp
# End Source File
# Begin Source File

SOURCE=.\gui_plane.cpp
# End Source File
# Begin Source File

SOURCE=.\Gui_Window.cpp
# End Source File
# Begin Source File

SOURCE=.\House1.cpp
# End Source File
# Begin Source File

SOURCE=.\Map.cpp
# End Source File
# Begin Source File

SOURCE=.\MapViewer.cpp
# End Source File
# Begin Source File

SOURCE=.\MiniMapViewer.cpp
# End Source File
# Begin Source File

SOURCE=.\PathFinder.cpp
# End Source File
# Begin Source File

SOURCE=.\Player.cpp
# End Source File
# Begin Source File

SOURCE=.\SelfHealable.cpp
# End Source File
# Begin Source File

SOURCE=.\sim.cpp
# End Source File
# Begin Source File

SOURCE=.\StdAfx.cpp
# End Source File
# Begin Source File

SOURCE=.\tree.cpp
# End Source File
# Begin Source File

SOURCE=.\zergling.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\ActionInterpreter.h
# End Source File
# Begin Source File

SOURCE=.\AI.h
# End Source File
# Begin Source File

SOURCE=.\CmdButtonBar.h
# End Source File
# Begin Source File

SOURCE=.\eventproc.h
# End Source File
# Begin Source File

SOURCE=.\Fansy_Button.h
# End Source File
# Begin Source File

SOURCE=.\Fansy_Window.h
# End Source File
# Begin Source File

SOURCE=.\GameCharacters.h
# End Source File
# Begin Source File

SOURCE=.\GameCommand.h
# End Source File
# Begin Source File

SOURCE=.\GameCommandButton.h
# End Source File
# Begin Source File

SOURCE=.\GameCommandButtons.h
# End Source File
# Begin Source File

SOURCE=.\GameCommandQueue.h
# End Source File
# Begin Source File

SOURCE=.\GameConfig.h
# End Source File
# Begin Source File

SOURCE=.\GameEvent.h
# End Source File
# Begin Source File

SOURCE=.\GameMap.h
# End Source File
# Begin Source File

SOURCE=.\GameObject.h
# End Source File
# Begin Source File

SOURCE=.\GameObjectAnimator.h
# End Source File
# Begin Source File

SOURCE=.\GameObjectMap.h
# End Source File
# Begin Source File

SOURCE=.\gameutil.h
# End Source File
# Begin Source File

SOURCE=.\GameWorld.h
# End Source File
# Begin Source File

SOURCE=.\God.h
# End Source File
# Begin Source File

SOURCE=.\GodOfRenderring.h
# End Source File
# Begin Source File

SOURCE=.\Graphics.h
# End Source File
# Begin Source File

SOURCE=.\GroundLayerMap.h
# End Source File
# Begin Source File

SOURCE=.\Gui.h
# End Source File
# Begin Source File

SOURCE=.\Gui_Button.h
# End Source File
# Begin Source File

SOURCE=.\Gui_Container.h
# End Source File
# Begin Source File

SOURCE=.\Gui_Plane.h
# End Source File
# Begin Source File

SOURCE=.\Gui_Window.h
# End Source File
# Begin Source File

SOURCE=.\House1.h
# End Source File
# Begin Source File

SOURCE=.\Image.h
# End Source File
# Begin Source File

SOURCE=.\Map.h
# End Source File
# Begin Source File

SOURCE=.\MapViewer.h
# End Source File
# Begin Source File

SOURCE=.\MiniMapViewer.h
# End Source File
# Begin Source File

SOURCE=.\PathFinder.h
# End Source File
# Begin Source File

SOURCE=.\Player.h
# End Source File
# Begin Source File

SOURCE=.\tree.h
# End Source File
# Begin Source File

SOURCE=.\zergling.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
