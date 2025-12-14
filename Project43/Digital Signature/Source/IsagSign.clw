; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CIsagSignDoc
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "isagsign.h"
LastPage=0

ClassCount=8
Class1=CInPlaceFrame
Class2=CIsagSignApp
Class3=CAboutDlg
Class4=CIsagSignDoc
Class5=CIsagSignView
Class6=CMainFrame
Class7=CNewSigDlg

ResourceCount=6
Resource1=IDD_ABOUTBOX (English (U.S.))
Resource2=IDD_NEWSIG
Resource3=IDR_MAINFRAME (English (U.S.))
Resource4=IDD_WAIT
Resource5=IDR_SRVR_INPLACE (English (U.S.))
Class8=CWaitDlg
Resource6=IDR_SRVR_EMBEDDED (English (U.S.))

[CLS:CInPlaceFrame]
Type=0
BaseClass=COleIPFrameWnd
HeaderFile=IpFrame.h
ImplementationFile=IpFrame.cpp
LastObject=CInPlaceFrame
Filter=T
VirtualFilter=PfWC

[CLS:CIsagSignApp]
Type=0
BaseClass=CWinApp
HeaderFile=IsagSign.h
ImplementationFile=IsagSign.cpp

[CLS:CAboutDlg]
Type=0
BaseClass=CDialog
HeaderFile=IsagSign.cpp
ImplementationFile=IsagSign.cpp
LastObject=CAboutDlg

[CLS:CIsagSignDoc]
Type=0
BaseClass=COleServerDoc
HeaderFile=IsagSignDoc.h
ImplementationFile=IsagSignDoc.cpp
LastObject=CIsagSignDoc
Filter=N
VirtualFilter=vLODC

[CLS:CIsagSignView]
Type=0
BaseClass=CListView
HeaderFile=IsagView.h
ImplementationFile=IsagView.cpp
LastObject=CIsagSignView
Filter=C
VirtualFilter=VWC

[CLS:CMainFrame]
Type=0
BaseClass=CFrameWnd
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp

[CLS:CNewSigDlg]
Type=0
BaseClass=CDialog
HeaderFile=NewSigDlg.h
ImplementationFile=NewSigDlg.cpp
LastObject=CNewSigDlg
Filter=D
VirtualFilter=dWC

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg

[DLG:IDD_NEWSIG]
Type=1
Class=CNewSigDlg
ControlCount=20
Control1=IDC_NAME,edit,1350631552
Control2=IDC_SURNAME,edit,1350631552
Control3=IDC_MD4,button,1342177289
Control4=IDC_MD5,button,1342177289
Control5=IDC_SHA1,button,1342177289
Control6=IDC_SIGSIZE,combobox,1344339971
Control7=IDC_USEPIC,button,1342242819
Control8=IDC_BROWSE,button,1476460544
Control9=IDOK,button,1342242817
Control10=IDCANCEL,button,1342242816
Control11=IDC_STATIC,static,1342308352
Control12=IDC_STATIC,static,1342308352
Control13=IDC_THUMNAIL,static,1476395534
Control14=IDC_STATIC,button,1342177287
Control15=IDC_TXTSIGPIC,button,1476395015
Control16=IDC_STATIC,static,1342308352
Control17=IDC_STATIC,static,1342308352
Control18=IDC_STATIC,static,1342308352
Control19=IDC_STATIC,button,1342177287
Control20=IDC_STATIC,static,1342308352

[DLG:IDD_ABOUTBOX (English (U.S.))]
Type=1
Class=?
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[TB:IDR_MAINFRAME (English (U.S.))]
Type=1
Class=?
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_EDIT_CUT
Command5=ID_EDIT_COPY
Command6=ID_EDIT_PASTE
Command7=ID_FILE_PRINT
Command8=ID_APP_ABOUT
CommandCount=8

[TB:IDR_SRVR_INPLACE (English (U.S.))]
Type=1
Class=?
Command1=ID_EDIT_CUT
Command2=ID_EDIT_COPY
Command3=ID_EDIT_PASTE
Command4=ID_APP_ABOUT
CommandCount=4

[MNU:IDR_MAINFRAME (English (U.S.))]
Type=1
Class=?
Command1=ID_SIGNATURE_NEWSIGNATURE
Command2=ID_SIGNATURE_REMOVESIGNATURE
Command3=ID_APP_EXIT
Command4=ID_EDIT_CUT
Command5=ID_VIEW_TOOLBAR
Command6=ID_VIEW_STATUS_BAR
Command7=ID_APP_ABOUT
CommandCount=7

[MNU:IDR_SRVR_INPLACE (English (U.S.))]
Type=1
Class=?
Command1=ID_SIGNATURE_NEWSIGNATURE
Command2=ID_SIGNATURE_REMOVESIGNATURE
Command3=ID_SIGNATURE_SIGNSIGNATURE
Command4=ID_SIGNATURE_VERIFYSIGNATURE
Command5=ID_EDIT_CUT
Command6=ID_VIEW_TOOLBAR
Command7=ID_APP_ABOUT
CommandCount=7

[MNU:IDR_SRVR_EMBEDDED (English (U.S.))]
Type=1
Class=?
Command1=ID_FILE_UPDATE
Command2=ID_FILE_SAVE_COPY_AS
Command3=ID_FILE_PRINT
Command4=ID_FILE_PRINT_PREVIEW
Command5=ID_FILE_PRINT_SETUP
Command6=ID_APP_EXIT
Command7=ID_EDIT_UNDO
Command8=ID_EDIT_CUT
Command9=ID_EDIT_COPY
Command10=ID_EDIT_PASTE
Command11=ID_VIEW_TOOLBAR
Command12=ID_VIEW_STATUS_BAR
Command13=ID_APP_ABOUT
CommandCount=13

[ACL:IDR_MAINFRAME (English (U.S.))]
Type=1
Class=?
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_PRINT
Command5=ID_EDIT_UNDO
Command6=ID_EDIT_CUT
Command7=ID_EDIT_COPY
Command8=ID_EDIT_PASTE
Command9=ID_EDIT_UNDO
Command10=ID_EDIT_CUT
Command11=ID_EDIT_COPY
Command12=ID_EDIT_PASTE
Command13=ID_NEXT_PANE
Command14=ID_PREV_PANE
CommandCount=14

[ACL:IDR_SRVR_INPLACE (English (U.S.))]
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
Command9=ID_CANCEL_EDIT_SRVR
CommandCount=9

[ACL:IDR_SRVR_EMBEDDED (English (U.S.))]
Type=1
Class=?
Command1=ID_FILE_UPDATE
Command2=ID_FILE_PRINT
Command3=ID_EDIT_UNDO
Command4=ID_EDIT_CUT
Command5=ID_EDIT_COPY
Command6=ID_EDIT_PASTE
Command7=ID_EDIT_UNDO
Command8=ID_EDIT_CUT
Command9=ID_EDIT_COPY
Command10=ID_EDIT_PASTE
Command11=ID_NEXT_PANE
Command12=ID_PREV_PANE
CommandCount=12

[DLG:IDD_WAIT]
Type=1
Class=CWaitDlg
ControlCount=1
Control1=IDC_STATIC,static,1342308352

[CLS:CWaitDlg]
Type=0
HeaderFile=WaitDlg.h
ImplementationFile=WaitDlg.cpp
BaseClass=CDialog
Filter=D
LastObject=CWaitDlg

