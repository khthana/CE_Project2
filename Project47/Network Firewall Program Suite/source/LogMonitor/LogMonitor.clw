; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CMainFrame
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "LogMonitor.h"
LastPage=0

ClassCount=6
Class1=CLogMonitorApp
Class2=CLogMonitorDoc
Class3=CLogMonitorView
Class4=CMainFrame
Class6=CAboutDlg

ResourceCount=12
Resource1=IDR_MAINFRAME
Resource2=IDR_MENUTRAY
Resource7=IDD_ABOUTBOX
Resource8=IDR_MAINFRAME (English (U.S.))
Resource9=IDR_MENUTRAY (English (U.S.))
Class5=CLogMonitorSet
Resource10=IDD_ABOUTBOX (English (U.S.))
Resource11=IDD_LOGMONITOR_FORM (English (U.S.))
Resource12=IDD_LOGMONITOR_FORM

[CLS:CLogMonitorApp]
Type=0
HeaderFile=LogMonitor.h
ImplementationFile=LogMonitor.cpp
Filter=N

[CLS:CLogMonitorDoc]
Type=0
HeaderFile=LogMonitorDoc.h
ImplementationFile=LogMonitorDoc.cpp
Filter=N

[CLS:CLogMonitorView]
Type=0
HeaderFile=LogMonitorView.h
ImplementationFile=LogMonitorView.cpp
Filter=D
BaseClass=CRecordView
VirtualFilter=RVWC
LastObject=CLogMonitorView


[CLS:CLogMonitorSet]
Type=0
HeaderFile=LogMonitorSet.h
ImplementationFile=LogMonitorSet.cpp
Filter=N
BaseClass=CRecordset
VirtualFilter=r
LastObject=CLogMonitorSet

[DB:CLogMonitorSet]
DB=1
DBType=ODBC
ColumnCount=8
Column1=[LogNo], 4, 4
Column2=[AttackDst], 12, 100
Column3=[AttackSrc], 12, 100
Column4=[AttackType], 12, 200
Column5=[AttackDate], 12, 200
Column6=[AttackTime], 12, 200
Column7=[User], 12, 100
Column8=[Group], 12, 200

[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T
BaseClass=CFrameWnd
VirtualFilter=fWC
LastObject=CMainFrame




[CLS:CAboutDlg]
Type=0
HeaderFile=LogMonitor.cpp
ImplementationFile=LogMonitor.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[MNU:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_APP_EXIT
Command2=ID_EDIT_UNDO
Command3=ID_EDIT_CUT
Command4=ID_EDIT_COPY
Command5=ID_EDIT_PASTE
Command6=ID_RECORD_FIRST
Command7=ID_RECORD_PREV
Command8=ID_RECORD_NEXT
Command9=ID_RECORD_LAST
Command10=ID_VIEW_TOOLBAR
Command11=ID_VIEW_STATUS_BAR
Command12=ID_APP_ABOUT
CommandCount=12

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_EDIT_UNDO
Command2=ID_EDIT_CUT
Command3=ID_EDIT_COPY
Command4=ID_EDIT_PASTE
Command5=ID_EDIT_UNDO
Command6=ID_EDIT_CUT
Command7=ID_EDIT_COPY
Command8=ID_EDIT_PASTE
Command9=ID_NEXT_PANE
Command10=ID_PREV_PANE
CommandCount=10

[DLG:IDD_LOGMONITOR_FORM]
Type=1
Class=CLogMonitorView
ControlCount=10
Control1=IDC_LIST_LOG,SysListView32,1342242817
Control2=IDC_BUTTON_DELETE,button,1342242816
Control3=IDC_BUTTON_PREVIOUS,button,1342242816
Control4=IDC_BUTTON_NEXT,button,1342242816
Control5=IDC_STATIC,static,1342308352
Control6=IDC_STATIC_PAGE_NO,static,1342308352
Control7=IDC_STATIC,static,1342308352
Control8=IDC_STATIC_NUMBER_OF_LOG,static,1342308352
Control9=IDC_LIST_TYPE,listbox,1344344321
Control10=IDC_LIST_TYPE_SUB,listbox,1344344321

[DLG:IDD_LOGMONITOR_FORM (English (U.S.))]
Type=1
Class=CLogMonitorView
ControlCount=10
Control1=IDC_LIST_LOG,SysListView32,1342242817
Control2=IDC_BUTTON_DELETE,button,1342242816
Control3=IDC_BUTTON_PREVIOUS,button,1342242816
Control4=IDC_BUTTON_NEXT,button,1342242816
Control5=IDC_STATIC,static,1342308352
Control6=IDC_STATIC_PAGE_NO,static,1342308352
Control7=IDC_STATIC,static,1342308352
Control8=IDC_STATIC_NUMBER_OF_LOG,static,1342308352
Control9=IDC_LIST_TYPE,listbox,1344344321
Control10=IDC_LIST_TYPE_SUB,listbox,1344344321

[TB:IDR_MAINFRAME (English (U.S.))]
Type=1
Class=?
Command1=ID_EDIT_CUT
Command2=ID_EDIT_COPY
Command3=ID_EDIT_PASTE
Command4=ID_FILE_PRINT
Command5=ID_RECORD_FIRST
Command6=ID_RECORD_PREV
Command7=ID_RECORD_NEXT
Command8=ID_RECORD_LAST
Command9=ID_APP_ABOUT
CommandCount=9

[MNU:IDR_MAINFRAME (English (U.S.))]
Type=1
Class=?
Command1=ID_APP_EXIT
Command2=ID_EDIT_UNDO
Command3=ID_EDIT_CUT
Command4=ID_EDIT_COPY
Command5=ID_EDIT_PASTE
Command6=ID_RECORD_FIRST
Command7=ID_RECORD_PREV
Command8=ID_RECORD_NEXT
Command9=ID_RECORD_LAST
Command10=ID_VIEW_TOOLBAR
Command11=ID_VIEW_STATUS_BAR
Command12=ID_APP_ABOUT
CommandCount=12

[ACL:IDR_MAINFRAME (English (U.S.))]
Type=1
Class=?
Command1=ID_EDIT_UNDO
Command2=ID_EDIT_CUT
Command3=ID_EDIT_COPY
Command4=ID_EDIT_PASTE
Command5=ID_EDIT_UNDO
Command6=ID_EDIT_CUT
Command7=ID_EDIT_COPY
Command8=ID_EDIT_PASTE
Command9=ID_NEXT_PANE
Command10=ID_PREV_PANE
CommandCount=10

[DLG:IDD_ABOUTBOX (English (U.S.))]
Type=1
Class=?
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[MNU:IDR_MENUTRAY (English (U.S.))]
Type=1
Class=?
Command1=ID_OPEN
Command2=ID_CLOSE
CommandCount=2

[MNU:IDR_MENUTRAY]
Type=1
Class=?
Command1=ID_OPEN
Command2=ID_CLOSE
CommandCount=2

[TB:IDR_MAINFRAME]
Type=1
Class=?
Command1=ID_EDIT_CUT
Command2=ID_EDIT_COPY
Command3=ID_EDIT_PASTE
Command4=ID_FILE_PRINT
Command5=ID_RECORD_FIRST
Command6=ID_RECORD_PREV
Command7=ID_RECORD_NEXT
Command8=ID_RECORD_LAST
Command9=ID_APP_ABOUT
CommandCount=9

