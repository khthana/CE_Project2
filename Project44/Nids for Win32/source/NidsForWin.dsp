# Microsoft Developer Studio Project File - Name="NidsForWin" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=NidsForWin - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "NidsForWin.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "NidsForWin.mak" CFG="NidsForWin - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "NidsForWin - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "NidsForWin - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "NidsForWin - Win32 Release"

# PROP BASE Use_MFC 5
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 5
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /Yu"stdafx.h" /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x41e /d "NDEBUG"
# ADD RSC /l 0x41e /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:I386
# ADD LINK32 /nologo /subsystem:windows /machine:I386

!ELSEIF  "$(CFG)" == "NidsForWin - Win32 Debug"

# PROP BASE Use_MFC 5
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 5
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /Yu"stdafx.h" /FD /GZ /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /Yu"stdafx.h" /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x41e /d "_DEBUG"
# ADD RSC /l 0x41e /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept

!ENDIF 

# Begin Target

# Name "NidsForWin - Win32 Release"
# Name "NidsForWin - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\Analy_ICMP.cpp
# End Source File
# Begin Source File

SOURCE=.\Analy_IP.cpp
# End Source File
# Begin Source File

SOURCE=.\Analy_TCP.cpp
# End Source File
# Begin Source File

SOURCE=.\Analy_UDP.cpp
# End Source File
# Begin Source File

SOURCE=.\Analysis.cpp
# End Source File
# Begin Source File

SOURCE=.\Bomb_Packet.cpp
# End Source File
# Begin Source File

SOURCE=.\DeviceList.cpp
# End Source File
# Begin Source File

SOURCE=.\Fragment.cpp
# End Source File
# Begin Source File

SOURCE=.\GetFin.cpp
# End Source File
# Begin Source File

SOURCE=.\GetPort.cpp
# End Source File
# Begin Source File

SOURCE=.\Header_Packet.cpp
# End Source File
# Begin Source File

SOURCE=.\Link_Fragment.cpp
# End Source File
# Begin Source File

SOURCE=.\NidsForWin.cpp
# End Source File
# Begin Source File

SOURCE=.\hlp\NidsForWin.hpj

!IF  "$(CFG)" == "NidsForWin - Win32 Release"

# PROP Ignore_Default_Tool 1
# Begin Custom Build - Making help file...
OutDir=.\Release
InputPath=.\hlp\NidsForWin.hpj
InputName=NidsForWin

"$(OutDir)\$(InputName).hlp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	start /wait hcw /C /E /M "hlp\$(InputName).hpj" 
	if errorlevel 1 goto :Error 
	if not exist "hlp\$(InputName).hlp" goto :Error 
	copy "hlp\$(InputName).hlp" $(OutDir) 
	goto :done 
	:Error 
	echo hlp\$(InputName).hpj(1) : error: 
	type "hlp\$(InputName).log" 
	:done 
	
# End Custom Build

!ELSEIF  "$(CFG)" == "NidsForWin - Win32 Debug"

# PROP Ignore_Default_Tool 1
# Begin Custom Build - Making help file...
OutDir=.\Debug
InputPath=.\hlp\NidsForWin.hpj
InputName=NidsForWin

"$(OutDir)\$(InputName).hlp" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	start /wait hcw /C /E /M "hlp\$(InputName).hpj" 
	if errorlevel 1 goto :Error 
	if not exist "hlp\$(InputName).hlp" goto :Error 
	copy "hlp\$(InputName).hlp" $(OutDir) 
	goto :done 
	:Error 
	echo hlp\$(InputName).hpj(1) : error: 
	type "hlp\$(InputName).log" 
	:done 
	
# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\NidsForWin.rc
# End Source File
# Begin Source File

SOURCE=.\NidsForWinDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\PingSweeps.cpp
# End Source File
# Begin Source File

SOURCE=.\Registry.cpp
# End Source File
# Begin Source File

SOURCE=.\Result.cpp
# End Source File
# Begin Source File

SOURCE=.\SelectAdapter.cpp
# End Source File
# Begin Source File

SOURCE=.\Sniff.cpp
# End Source File
# Begin Source File

SOURCE=.\SortHeaderCtrl.cpp
# End Source File
# Begin Source File

SOURCE=.\SortListCtrl.cpp
# End Source File
# Begin Source File

SOURCE=.\StdAfx.cpp
# ADD CPP /Yc"stdafx.h"
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\Analy_ICMP.h
# End Source File
# Begin Source File

SOURCE=.\Analy_IP.h
# End Source File
# Begin Source File

SOURCE=.\Analy_TCP.h
# End Source File
# Begin Source File

SOURCE=.\Analy_UDP.h
# End Source File
# Begin Source File

SOURCE=.\Analysis.h
# End Source File
# Begin Source File

SOURCE=.\Bomb_Packet.h
# End Source File
# Begin Source File

SOURCE=.\DeviceList.h
# End Source File
# Begin Source File

SOURCE=.\Fragment.h
# End Source File
# Begin Source File

SOURCE=.\GetFin.h
# End Source File
# Begin Source File

SOURCE=.\GetPort.h
# End Source File
# Begin Source File

SOURCE=.\Header_Packet.h
# End Source File
# Begin Source File

SOURCE=.\Link_Fragment.h
# End Source File
# Begin Source File

SOURCE=.\NidsForWin.h
# End Source File
# Begin Source File

SOURCE=.\NidsForWinDlg.h
# End Source File
# Begin Source File

SOURCE=.\PingSweeps.h
# End Source File
# Begin Source File

SOURCE=.\Registry.h
# End Source File
# Begin Source File

SOURCE=.\Resource.h

!IF  "$(CFG)" == "NidsForWin - Win32 Release"

# PROP Ignore_Default_Tool 1
# Begin Custom Build - Making help include file...
TargetName=NidsForWin
InputPath=.\Resource.h

"hlp\$(TargetName).hm" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	echo. >"hlp\$(TargetName).hm" 
	echo // Commands (ID_* and IDM_*) >>"hlp\$(TargetName).hm" 
	makehm ID_,HID_,0x10000 IDM_,HIDM_,0x10000 resource.h >>"hlp\$(TargetName).hm" 
	echo. >>"hlp\$(TargetName).hm" 
	echo // Prompts (IDP_*) >>"hlp\$(TargetName).hm" 
	makehm IDP_,HIDP_,0x30000 resource.h >>"hlp\$(TargetName).hm" 
	echo. >>"hlp\$(TargetName).hm" 
	echo // Resources (IDR_*) >>"hlp\$(TargetName).hm" 
	makehm IDR_,HIDR_,0x20000 resource.h >>"hlp\$(TargetName).hm" 
	echo. >>"hlp\$(TargetName).hm" 
	echo // Dialogs (IDD_*) >>"hlp\$(TargetName).hm" 
	makehm IDD_,HIDD_,0x20000 resource.h >>"hlp\$(TargetName).hm" 
	echo. >>"hlp\$(TargetName).hm" 
	echo // Frame Controls (IDW_*) >>"hlp\$(TargetName).hm" 
	makehm IDW_,HIDW_,0x50000 resource.h >>"hlp\$(TargetName).hm" 
	
# End Custom Build

!ELSEIF  "$(CFG)" == "NidsForWin - Win32 Debug"

# PROP Ignore_Default_Tool 1
# Begin Custom Build - Making help include file...
TargetName=NidsForWin
InputPath=.\Resource.h

"hlp\$(TargetName).hm" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	echo. >"hlp\$(TargetName).hm" 
	echo // Commands (ID_* and IDM_*) >>"hlp\$(TargetName).hm" 
	makehm ID_,HID_,0x10000 IDM_,HIDM_,0x10000 resource.h >>"hlp\$(TargetName).hm" 
	echo. >>"hlp\$(TargetName).hm" 
	echo // Prompts (IDP_*) >>"hlp\$(TargetName).hm" 
	makehm IDP_,HIDP_,0x30000 resource.h >>"hlp\$(TargetName).hm" 
	echo. >>"hlp\$(TargetName).hm" 
	echo // Resources (IDR_*) >>"hlp\$(TargetName).hm" 
	makehm IDR_,HIDR_,0x20000 resource.h >>"hlp\$(TargetName).hm" 
	echo. >>"hlp\$(TargetName).hm" 
	echo // Dialogs (IDD_*) >>"hlp\$(TargetName).hm" 
	makehm IDD_,HIDD_,0x20000 resource.h >>"hlp\$(TargetName).hm" 
	echo. >>"hlp\$(TargetName).hm" 
	echo // Frame Controls (IDW_*) >>"hlp\$(TargetName).hm" 
	makehm IDW_,HIDW_,0x50000 resource.h >>"hlp\$(TargetName).hm" 
	
# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Result.h
# End Source File
# Begin Source File

SOURCE=.\SelectAdapter.h
# End Source File
# Begin Source File

SOURCE=.\Sniff.h
# End Source File
# Begin Source File

SOURCE=.\SortHeaderCtrl.h
# End Source File
# Begin Source File

SOURCE=.\SortListCtrl.h
# End Source File
# Begin Source File

SOURCE=.\StdAfx.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\res\Alert.ico
# End Source File
# Begin Source File

SOURCE=.\NidsForWin.ico
# End Source File
# Begin Source File

SOURCE=.\res\NidsForWin.ico
# End Source File
# Begin Source File

SOURCE=.\res\NidsForWin.rc2
# End Source File
# Begin Source File

SOURCE=.\res\Normal.ico
# End Source File
# End Group
# Begin Group "Help Files"

# PROP Default_Filter "cnt;rtf"
# Begin Source File

SOURCE=.\hlp\AfxDlg.rtf
# End Source File
# Begin Source File

SOURCE=.\hlp\NidsForWin.cnt

!IF  "$(CFG)" == "NidsForWin - Win32 Release"

# PROP Ignore_Default_Tool 1
# Begin Custom Build - Copying contents file...
OutDir=.\Release
InputPath=.\hlp\NidsForWin.cnt
InputName=NidsForWin

"$(OutDir)\$(InputName).cnt" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	copy "hlp\$(InputName).cnt" $(OutDir)

# End Custom Build

!ELSEIF  "$(CFG)" == "NidsForWin - Win32 Debug"

# PROP Ignore_Default_Tool 1
# Begin Custom Build - Copying contents file...
OutDir=.\Debug
InputPath=.\hlp\NidsForWin.cnt
InputName=NidsForWin

"$(OutDir)\$(InputName).cnt" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
	copy "hlp\$(InputName).cnt" $(OutDir)

# End Custom Build

!ENDIF 

# End Source File
# End Group
# Begin Source File

SOURCE=.\ReadMe.txt
# End Source File
# Begin Source File

SOURCE=.\LIB\Packet.lib
# End Source File
# End Target
# End Project
