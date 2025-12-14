@echo off
REM -- First make map file from Microsoft Visual C++ generated resource.h
echo // MAKEHELP.BAT generated Help Map file.  Used by NIDSFORWIN.HPJ. >"hlp\NidsForWin.hm"
echo. >>"hlp\NidsForWin.hm"
echo // Commands (ID_* and IDM_*) >>"hlp\NidsForWin.hm"
makehm ID_,HID_,0x10000 IDM_,HIDM_,0x10000 resource.h >>"hlp\NidsForWin.hm"
echo. >>"hlp\NidsForWin.hm"
echo // Prompts (IDP_*) >>"hlp\NidsForWin.hm"
makehm IDP_,HIDP_,0x30000 resource.h >>"hlp\NidsForWin.hm"
echo. >>"hlp\NidsForWin.hm"
echo // Resources (IDR_*) >>"hlp\NidsForWin.hm"
makehm IDR_,HIDR_,0x20000 resource.h >>"hlp\NidsForWin.hm"
echo. >>"hlp\NidsForWin.hm"
echo // Dialogs (IDD_*) >>"hlp\NidsForWin.hm"
makehm IDD_,HIDD_,0x20000 resource.h >>"hlp\NidsForWin.hm"
echo. >>"hlp\NidsForWin.hm"
echo // Frame Controls (IDW_*) >>"hlp\NidsForWin.hm"
makehm IDW_,HIDW_,0x50000 resource.h >>"hlp\NidsForWin.hm"
REM -- Make help for Project NIDSFORWIN


echo Building Win32 Help files
start /wait hcw /C /E /M "hlp\NidsForWin.hpj"
if errorlevel 1 goto :Error
if not exist "hlp\NidsForWin.hlp" goto :Error
if not exist "hlp\NidsForWin.cnt" goto :Error
echo.
if exist Debug\nul copy "hlp\NidsForWin.hlp" Debug
if exist Debug\nul copy "hlp\NidsForWin.cnt" Debug
if exist Release\nul copy "hlp\NidsForWin.hlp" Release
if exist Release\nul copy "hlp\NidsForWin.cnt" Release
echo.
goto :done

:Error
echo hlp\NidsForWin.hpj(1) : error: Problem encountered creating help file

:done
echo.
