; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CInvalidDlg
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "Signature.h"
ODLFile=Signature.odl
LastPage=0

ClassCount=10
Class1=CSignatureApp
Class2=CSignatureDoc
Class3=CSignatureView
Class4=CMainFrame
Class5=CInPlaceFrame

ResourceCount=13
Resource1=IDD_ABOUTBOX
Resource2=IDR_MAINFRAME
Resource5=IDD_INVALID (Neutral (Default))
Resource6=IDD_DIALOGBAR (English (U.S.))
Resource8=IDD_VALID
Class6=CAboutDlg
Resource3=IDR_SRVR_INPLACE
Resource4=IDR_SRVR_EMBEDDED
Resource7=IDD_ABOUTBOX (English (U.S.))
Class7=CNewDlg
Resource9=IDR_SRVR_INPLACE (English (U.S.))
Class8=CWaitDlg
Resource10=IDR_MAINFRAME (English (U.S.))
Resource11=IDD_DIALOG1
Class9=CValidDlg
Resource12=IDD_WAIT (English (U.S.))
Class10=CInvalidDlg
Resource13=IDR_SRVR_EMBEDDED (English (U.S.))

[CLS:CSignatureApp]
Type=0
HeaderFile=Signature.h
ImplementationFile=Signature.cpp
Filter=N

[CLS:CSignatureDoc]
Type=0
HeaderFile=SignatureDoc.h
ImplementationFile=SignatureDoc.cpp
Filter=N

[CLS:CSignatureView]
Type=0
HeaderFile=SignatureView.h
ImplementationFile=SignatureView.cpp
Filter=C
LastObject=CSignatureView
BaseClass=CListView
VirtualFilter=VWC


[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T

[CLS:CInPlaceFrame]
Type=0
HeaderFile=IpFrame.h
ImplementationFile=IpFrame.cpp
Filter=T



[CLS:CAboutDlg]
Type=0
HeaderFile=Signature.cpp
ImplementationFile=Signature.cpp
Filter=D
LastObject=CAboutDlg

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
Command5=ID_FILE_PRINT
Command6=ID_FILE_PRINT_PREVIEW
Command7=ID_FILE_PRINT_SETUP
Command8=ID_FILE_MRU_FILE1
Command9=ID_APP_EXIT
Command10=ID_EDIT_UNDO
Command11=ID_EDIT_CUT
Command12=ID_EDIT_COPY
Command13=ID_EDIT_PASTE
Command14=ID_VIEW_TOOLBAR
Command15=ID_VIEW_STATUS_BAR
CommandCount=16
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command16=ID_APP_ABOUT

[MNU:IDR_SRVR_INPLACE]
Type=1
Class=CSignatureView
Command1=ID_EDIT_UNDO
Command2=ID_EDIT_CUT
Command3=ID_EDIT_COPY
Command4=ID_EDIT_PASTE
CommandCount=5
Command5=ID_APP_ABOUT

[TB:IDR_SRVR_INPLACE]
Type=1
Class=CSignatureView
Command1=ID_EDIT_CUT
Command2=ID_EDIT_COPY
Command3=ID_EDIT_PASTE
CommandCount=4
Command4=ID_APP_ABOUT

[MNU:IDR_SRVR_EMBEDDED]
Type=1
Class=CSignatureView
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
CommandCount=13
Command11=ID_VIEW_TOOLBAR
Command12=ID_VIEW_STATUS_BAR
Command13=ID_APP_ABOUT

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
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
CommandCount=14
Command13=ID_NEXT_PANE
Command14=ID_PREV_PANE

[ACL:IDR_SRVR_INPLACE]
Type=1
Class=CSignatureView
Command1=ID_EDIT_UNDO
Command2=ID_EDIT_CUT
Command3=ID_EDIT_COPY
Command4=ID_EDIT_PASTE
Command5=ID_EDIT_UNDO
Command6=ID_EDIT_CUT
Command7=ID_EDIT_COPY
Command8=ID_EDIT_PASTE
CommandCount=8

[ACL:IDR_SRVR_EMBEDDED]
Type=1
Class=CSignatureView
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
CommandCount=12
Command11=ID_NEXT_PANE
Command12=ID_PREV_PANE


[DLG:IDD_DIALOG1]
Type=1
Class=CNewDlg
ControlCount=18
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_NAME,edit,1350631552
Control4=IDC_SURNAME,edit,1350631552
Control5=IDC_STATIC_NAME,static,1342308352
Control6=IDC_STATIC_SURNAME,static,1342308352
Control7=IDC_STATIC_HASH,button,1342177287
Control8=IDC_MD5,button,1342177289
Control9=IDC_SHA1,button,1342177289
Control10=IDC_THUMNAIL,static,1476395534
Control11=IDC_TXTPIC,button,1476395015
Control12=IDC_USEPIC,button,1342242819
Control13=IDC_BROWSE,button,1476460544
Control14=IDC_MD4,button,1342177289
Control15=IDC_NOTE,button,1342177287
Control16=IDC_DIGNOTE,static,1342308352
Control17=IDC_PICNOTE,static,1342308352
Control18=IDC_PIC,button,1342177287

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

[DLG:IDD_ABOUTBOX (English (U.S.))]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[CLS:CNewDlg]
Type=0
HeaderFile=NewDlg.h
ImplementationFile=NewDlg.cpp
BaseClass=CDialog
Filter=D
LastObject=CNewDlg
VirtualFilter=dWC

[CLS:CWaitDlg]
Type=0
HeaderFile=WaitDlg.h
ImplementationFile=WaitDlg.cpp
BaseClass=CDialog
Filter=D
LastObject=CWaitDlg

[DLG:IDD_WAIT (English (U.S.))]
Type=1
Class=CWaitDlg
ControlCount=1
Control1=IDC_STATIC,static,1342308352

[DLG:IDD_DIALOGBAR (English (U.S.))]
Type=1
Class=?
ControlCount=1
Control1=IDC_STATIC,static,1342308352

[DLG:IDD_VALID]
Type=1
Class=CValidDlg
ControlCount=2
Control1=IDOK,button,1342242817
Control2=IDC_VALID,static,1350701057

[CLS:CValidDlg]
Type=0
HeaderFile=ValidDlg1.h
ImplementationFile=ValidDlg1.cpp
BaseClass=CDialog
Filter=D
LastObject=CValidDlg

[DLG:IDD_INVALID (Neutral (Default))]
Type=1
Class=CInvalidDlg
ControlCount=2
Control1=IDOK,button,1342242817
Control2=IDC_VALID,static,1350701057

[CLS:CInvalidDlg]
Type=0
HeaderFile=InvalidDlg1.h
ImplementationFile=InvalidDlg1.cpp
BaseClass=CDialog
Filter=D
LastObject=CInvalidDlg

