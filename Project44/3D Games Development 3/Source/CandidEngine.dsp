# Microsoft Developer Studio Project File - Name="CandidEngine" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=CandidEngine - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "CandidEngine.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "CandidEngine.mak" CFG="CandidEngine - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "CandidEngine - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "CandidEngine - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "CandidEngine - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /FR /FD /c
# SUBTRACT CPP /YX /Yc /Yu
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x41e /d "NDEBUG"
# ADD RSC /l 0x41e /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 d3dx8.lib opengl32.lib glu32.lib glaux.lib winmm.lib dsound.lib dxguid.lib dxerr8.lib /nologo /subsystem:windows /machine:I386

!ELSEIF  "$(CFG)" == "CandidEngine - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 1
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /Yu"stdafx.h" /FD /GZ /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR /FD /GZ /c
# SUBTRACT CPP /YX /Yc /Yu
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x41e /d "_DEBUG"
# ADD RSC /l 0x41e /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 d3dx8.lib opengl32.lib glu32.lib glaux.lib winmm.lib dsound.lib dxguid.lib dxerr8.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept

!ENDIF 

# Begin Target

# Name "CandidEngine - Win32 Release"
# Name "CandidEngine - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\Camera2.cpp
# End Source File
# Begin Source File

SOURCE=.\CandidEngine.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\dsutil.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\DynamicModel.cpp
# End Source File
# Begin Source File

SOURCE=.\GLApplication.cpp
# End Source File
# Begin Source File

SOURCE=.\MyGlApp.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\PartDef.cpp
# End Source File
# Begin Source File

SOURCE=.\ProjectileObject.cpp
# End Source File
# Begin Source File

SOURCE=.\Soldier.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\Sound.cpp
# End Source File
# Begin Source File

SOURCE=.\StdAfx.cpp
# End Source File
# Begin Source File

SOURCE=.\Tree.cpp
# End Source File
# Begin Source File

SOURCE=.\TreeList.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\Camera2.h
# End Source File
# Begin Source File

SOURCE=.\Engine\dsutil.h
# End Source File
# Begin Source File

SOURCE=.\Engine\DynamicModel.h
# End Source File
# Begin Source File

SOURCE=.\GLApplication.h
# End Source File
# Begin Source File

SOURCE=.\MyGlApp.h
# End Source File
# Begin Source File

SOURCE=.\Engine\PartDef.h
# End Source File
# Begin Source File

SOURCE=.\ProjectileObject.h
# End Source File
# Begin Source File

SOURCE=.\Soldier.h
# End Source File
# Begin Source File

SOURCE=.\Engine\Sound.h
# End Source File
# Begin Source File

SOURCE=.\StdAfx.h
# End Source File
# Begin Source File

SOURCE=.\Tree.h
# End Source File
# Begin Source File

SOURCE=.\TreeList.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Group "Vertices Files"

# PROP Default_Filter "*.map"
# End Group
# Begin Group "Indices Files"

# PROP Default_Filter "*.mai"
# End Group
# Begin Group "TexCoord Files"

# PROP Default_Filter "*.mau"
# End Group
# Begin Group "VertexColor Files"

# PROP Default_Filter "*.mac"
# End Group
# End Group
# Begin Group "Engine"

# PROP Default_Filter ""
# Begin Group "Engine Source Files"

# PROP Default_Filter "*.cpp"
# Begin Source File

SOURCE=.\Engine\Abstract.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\AbTree.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\Animation.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\AnimationSet.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\CacheTriangle.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\Camera.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\EffectBillboard.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\EffectBillboardList.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\EngineInterface.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\FrameModel.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\GLGfx.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\Indices.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\Logger.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\Matrix.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\Model.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\ModelData.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\MousePointer.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\MultiDetailData.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\Normals.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\OP.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\StaticModel.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\StaticModelData.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\TexCoord.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\Text2D.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\Texture.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\Triangle.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\UseMultidetailData.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\Util.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\VertexColor.cpp
# End Source File
# Begin Source File

SOURCE=.\Engine\Vertices.cpp
# End Source File
# End Group
# Begin Group "Engine Header Files"

# PROP Default_Filter "*.h"
# Begin Source File

SOURCE=.\Engine\Abstract.h
# End Source File
# Begin Source File

SOURCE=.\Engine\AbTree.h
# End Source File
# Begin Source File

SOURCE=.\Engine\Animation.h
# End Source File
# Begin Source File

SOURCE=.\Engine\AnimationSet.h
# End Source File
# Begin Source File

SOURCE=.\Engine\CacheTriangle.h
# End Source File
# Begin Source File

SOURCE=.\Engine\Camera.h
# End Source File
# Begin Source File

SOURCE=.\Engine\EffectBillboard.h
# End Source File
# Begin Source File

SOURCE=.\Engine\EffectBillboardList.h
# End Source File
# Begin Source File

SOURCE=.\Engine\EngineInterface.h
# End Source File
# Begin Source File

SOURCE=.\Engine\FrameModel.h
# End Source File
# Begin Source File

SOURCE=.\Engine\GLGfx.h
# End Source File
# Begin Source File

SOURCE=.\Engine\Indices.h
# End Source File
# Begin Source File

SOURCE=.\Engine\Logger.h
# End Source File
# Begin Source File

SOURCE=.\Engine\Matrix.h
# End Source File
# Begin Source File

SOURCE=.\Engine\Model.h
# End Source File
# Begin Source File

SOURCE=.\Engine\ModelData.h
# End Source File
# Begin Source File

SOURCE=.\Engine\MousePointer.h
# End Source File
# Begin Source File

SOURCE=.\Engine\MultiDetailData.h
# End Source File
# Begin Source File

SOURCE=.\Engine\Normals.h
# End Source File
# Begin Source File

SOURCE=.\Engine\OP.h
# End Source File
# Begin Source File

SOURCE=.\Engine\StaticModel.h
# End Source File
# Begin Source File

SOURCE=.\Engine\StaticModelData.h
# End Source File
# Begin Source File

SOURCE=.\Engine\TexCoord.h
# End Source File
# Begin Source File

SOURCE=.\Engine\Text2D.h
# End Source File
# Begin Source File

SOURCE=.\Engine\Texture.h
# End Source File
# Begin Source File

SOURCE=.\Engine\Triangle.h
# End Source File
# Begin Source File

SOURCE=.\Engine\UseMultidetailData.h
# End Source File
# Begin Source File

SOURCE=.\Engine\Util.h
# End Source File
# Begin Source File

SOURCE=.\Engine\VertexColor.h
# End Source File
# Begin Source File

SOURCE=.\Engine\Vertices.h
# End Source File
# End Group
# End Group
# Begin Source File

SOURCE=.\ReadMe.txt
# End Source File
# End Target
# End Project
