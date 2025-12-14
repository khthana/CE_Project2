; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CProject1Doc
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "Project1.h"
LastPage=0

ClassCount=10
Class1=CProject1App
Class2=CProject1Doc
Class3=CProject1View
Class4=CMainFrame

ResourceCount=8
Resource1=IDD_ABOUTBOX
Resource2=IDR_MAINFRAME
Class5=CAboutDlg
Resource3=IDD_DIALOG_ENTER_CLASS
Resource4=IDD_DIALOG_SHOW
Class6=CDlgEnterClass
Resource5=IDD_DIALOG_MONITOR
Class7=CDlgShow
Class8=CDlgDebug
Resource6=IDD_DIALOG_SETTING
Class9=CDlgSetting
Resource7=IDD_ABOUTBOX (English (U.S.))
Class10=CDlgMonitor
Resource8=IDR_MAINFRAME (English (U.S.))

[CLS:CProject1App]
Type=0
HeaderFile=Project1.h
ImplementationFile=Project1.cpp
Filter=N

[CLS:CProject1Doc]
Type=0
HeaderFile=Project1Doc.h
ImplementationFile=Project1Doc.cpp
Filter=N
LastObject=ID_BUTTON_TRAIN
BaseClass=CDocument
VirtualFilter=DC

[CLS:CProject1View]
Type=0
HeaderFile=Project1View.h
ImplementationFile=Project1View.cpp
Filter=C
BaseClass=CScrollView
VirtualFilter=VWC
LastObject=ID_BUTTON_SET


[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T
BaseClass=CFrameWnd
VirtualFilter=fWC
LastObject=ID_BUTTON__SAVE_AS




[CLS:CAboutDlg]
Type=0
HeaderFile=Project1.cpp
ImplementationFile=Project1.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308352
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889
Class=CAboutDlg

[MNU:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command3=ID_FILE_SAVE
Command4=ID_FILE_SAVE_AS
Command5=ID_FILE_MRU_FILE1
Command6=ID_APP_EXIT
Command10=ID_EDIT_PASTE
Command11=ID_VIEW_TOOLBAR
Command12=ID_VIEW_STATUS_BAR
Command13=ID_APP_ABOUT
CommandCount=13
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command7=ID_EDIT_UNDO
Command8=ID_EDIT_CUT
Command9=ID_EDIT_COPY

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command5=ID_EDIT_CUT
Command6=ID_EDIT_COPY
Command7=ID_EDIT_PASTE
Command8=ID_EDIT_UNDO
Command9=ID_EDIT_CUT
Command10=ID_EDIT_COPY
Command11=ID_EDIT_PASTE
Command12=ID_NEXT_PANE
CommandCount=13
Command4=ID_EDIT_UNDO
Command13=ID_PREV_PANE


[TB:IDR_MAINFRAME (English (U.S.))]
Type=1
Class=?
Command1=ID_BUTTON_LOAD
Command2=ID_BUTTON_SAVE
Command3=ID_BUTTON_SAVE_AS
Command4=ID_FILE_OPEN
Command5=ID_BUTTON_TRAIN
Command6=ID_BUTTON_CLASS
Command7=ID_BUTTON_SHOW
Command8=ID_BUTTON_CLEAR
CommandCount=8

[MNU:IDR_MAINFRAME (English (U.S.))]
Type=1
Class=CMainFrame
Command1=ID_BUTTON_LOAD
Command2=ID_BUTTON_SAVE
Command3=ID_BUTTON__SAVE_AS
Command4=ID_FILE_OPEN
Command5=ID_APP_EXIT
Command6=ID_VIEW_TOOLBAR
Command7=ID_VIEW_STATUS_BAR
Command8=ID_BUTTON_SET
Command9=ID_BUTTON_SHOW
Command10=ID_BUTTON_CLEAR
Command11=ID_BUTTON_TRAIN
Command12=ID_BUTTON_CLASS
Command13=ID_APP_ABOUT
CommandCount=13

[ACL:IDR_MAINFRAME (English (U.S.))]
Type=1
Class=?
Command1=ID_BUTTON_SAVE_AS
Command2=ID_BUTTON_SET
Command3=ID_BUTTON_CLASS
Command4=ID_BUTTON_SHOW
Command5=ID_FILE_OPEN
Command6=ID_BUTTON_LOAD
Command7=ID_BUTTON_CLEAR
Command8=ID_BUTTON_SAVE
Command9=ID_BUTTON_TRAIN
CommandCount=9

[DLG:IDD_ABOUTBOX (English (U.S.))]
Type=1
Class=CAboutDlg
ControlCount=3
Control1=IDC_STATIC,static,1342308481
Control2=IDOK,button,1342373889
Control3=IDC_STATIC,button,1342177287

[DLG:IDD_DIALOG_ENTER_CLASS]
Type=1
Class=CDlgEnterClass
ControlCount=4
Control1=IDC_EDIT1,edit,1350631568
Control2=IDOK,button,1342242817
Control3=IDCANCEL,button,1342242816
Control4=IDC_STATIC,button,1342177287

[CLS:CDlgEnterClass]
Type=0
HeaderFile=DlgEnterClass.h
ImplementationFile=DlgEnterClass.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=CDlgEnterClass

[DLG:IDD_DIALOG_SHOW]
Type=1
Class=CDlgShow
ControlCount=4
Control1=IDC_LIST1,SysListView32,1350631425
Control2=IDC_LIST2,SysListView32,1350631425
Control3=IDC_STATIC,button,1342177287
Control4=IDC_STATIC,button,1342177287

[CLS:CDlgShow]
Type=0
HeaderFile=DlgShow.h
ImplementationFile=DlgShow.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=CDlgShow

[CLS:CDlgDebug]
Type=0
HeaderFile=DlgDebug.h
ImplementationFile=DlgDebug.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=CDlgDebug

[DLG:IDD_DIALOG_SETTING]
Type=1
Class=CDlgSetting
ControlCount=5
Control1=IDC_STATIC,button,1342177287
Control2=IDC_SLIDER1,msctls_trackbar32,1342242821
Control3=IDC_EDIT1,edit,1350633600
Control4=IDC_STATIC,static,1342308352
Control5=IDC_STATIC,static,1342308352

[CLS:CDlgSetting]
Type=0
HeaderFile=DlgSetting.h
ImplementationFile=DlgSetting.cpp
BaseClass=CDialog
Filter=D
LastObject=CDlgSetting
VirtualFilter=dWC

[DLG:IDD_DIALOG_MONITOR]
Type=1
Class=CDlgMonitor
ControlCount=7
Control1=IDC_LIST1,SysListView32,1350631425
Control2=IDC_LIST2,SysListView32,1350631425
Control3=IDC_STATIC,button,1342177287
Control4=IDC_STATIC,button,1342177287
Control5=IDC_EDIT1,edit,1484849280
Control6=IDC_BUTTON1,button,1342242816
Control7=IDC_BUTTON2,button,1342242816

[CLS:CDlgMonitor]
Type=0
HeaderFile=DlgMonitor.h
ImplementationFile=DlgMonitor.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=CDlgMonitor

