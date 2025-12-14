; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CNidsForWinDlg
LastTemplate=CListCtrl
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "NidsForWin.h"

ClassCount=6
Class1=CNidsForWinApp
Class2=CNidsForWinDlg
Class3=CAboutDlg

ResourceCount=11
Resource1=IDD_NIDSFORWIN_DIALOG (English (U.S.))
Resource2=IDR_MAINFRAME
Resource3=IDD_SELECT_ADAP
Resource4=IDD_ABOUTBOX (English (U.S.))
Resource5=IDD_NIDSFORWIN_DIALOG
Resource6=IDR_MENUTRAY
Class4=CSelectAdapter
Resource7=IDD_SELECT_ADAP (English (U.S.))
Resource8=IDR_MAINMENU (English (U.S.))
Resource9=IDD_ABOUTBOX
Resource10=IDR_MAINMENU
Class5=CSortHeaderCtrl
Class6=CSortListCtrl
Resource11=IDR_MENUTRAY (English (U.S.))

[CLS:CNidsForWinApp]
Type=0
HeaderFile=NidsForWin.h
ImplementationFile=NidsForWin.cpp
Filter=N
LastObject=CNidsForWinApp

[CLS:CNidsForWinDlg]
Type=0
HeaderFile=NidsForWinDlg.h
ImplementationFile=NidsForWinDlg.cpp
Filter=W
BaseClass=CDialog
VirtualFilter=dWC
LastObject=IDOK

[CLS:CAboutDlg]
Type=0
HeaderFile=NidsForWinDlg.h
ImplementationFile=NidsForWinDlg.cpp
Filter=D
LastObject=CAboutDlg

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[DLG:IDD_NIDSFORWIN_DIALOG]
Type=1
Class=CNidsForWinDlg
ControlCount=5
Control1=IDOK,button,1342242817
Control2=IDC_STOP,button,1342242816
Control3=IDCANCEL,button,1342242816
Control4=ID_HELP,button,1342242816
Control5=IDC_LIST,SysListView32,1350631425

[DLG:IDD_NIDSFORWIN_DIALOG (English (U.S.))]
Type=1
Class=CNidsForWinDlg
ControlCount=3
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_LIST,SysListView32,1350631425

[DLG:IDD_ABOUTBOX (English (U.S.))]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342308480
Control2=IDC_STATIC,static,1342308352
Control3=IDOK,button,1342373889
Control4=IDC_STATIC,static,1342308480

[MNU:IDR_MAINMENU (English (U.S.))]
Type=1
Class=CNidsForWinDlg
Command1=IDOpen
Command2=IDClearAll
Command3=IDSave
Command4=IDSaveAs
Command5=IDCANCEL
Command6=ID_Select_Adap
Command7=ID_HELP_CONTENTS
Command8=ID_HELP_ABOUT
CommandCount=8

[DLG:IDD_SELECT_ADAP (English (U.S.))]
Type=1
Class=CSelectAdapter
ControlCount=3
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_LIST_ADAP,SysListView32,1350631425

[CLS:CSelectAdapter]
Type=0
HeaderFile=SelectAdapter.h
ImplementationFile=SelectAdapter.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=CSelectAdapter

[MNU:IDR_MENUTRAY (English (U.S.))]
Type=1
Class=?
Command1=ID_OPEN
Command2=ID_CLOSE
CommandCount=2

[DLG:IDD_SELECT_ADAP]
Type=1
Class=CSelectAdapter
ControlCount=3
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_LIST_ADAP,SysListView32,1350631425

[MNU:IDR_MAINMENU]
Type=1
Class=CNidsForWinDlg
Command1=IDOpen
Command2=IDClearAll
Command3=IDSave
Command4=IDSaveAs
Command5=IDCANCEL
Command6=ID_Select_Adap
CommandCount=6

[MNU:IDR_MENUTRAY]
Type=1
Class=?
Command1=ID_OPEN
Command2=ID_CLOSE
CommandCount=2

[CLS:CSortHeaderCtrl]
Type=0
HeaderFile=SortHeaderCtrl.h
ImplementationFile=SortHeaderCtrl.cpp
BaseClass=CHeaderCtrl
Filter=W

[CLS:CSortListCtrl]
Type=0
HeaderFile=SortListCtrl.h
ImplementationFile=SortListCtrl.cpp
BaseClass=CListCtrl
Filter=W

