; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=Show
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "Test.h"
ODLFile=Test.odl

ClassCount=5
Class1=CTestApp
Class2=CTestDlg
Class3=CAboutDlg
Class4=CTestDlgAutoProxy

ResourceCount=7
Resource1=IDD_ABOUTBOX
Resource2=IDR_MAINFRAME
Resource3=IDD_TEST_DIALOG
Resource4=IDD_DIALOG1
Resource5=IDD_TEST_DIALOG (English (U.S.))
Resource6=IDD_ABOUTBOX (English (U.S.))
Class5=Show
Resource7=IDR_MENU1

[CLS:CTestApp]
Type=0
HeaderFile=Test.h
ImplementationFile=Test.cpp
Filter=N

[CLS:CTestDlg]
Type=0
HeaderFile=TestDlg.h
ImplementationFile=TestDlg.cpp
Filter=D
LastObject=CTestDlg
BaseClass=CDialog
VirtualFilter=dWC

[CLS:CAboutDlg]
Type=0
HeaderFile=TestDlg.h
ImplementationFile=TestDlg.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308352
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889
Class=CAboutDlg

[CLS:CTestDlgAutoProxy]
Type=0
HeaderFile=DlgProxy.h
ImplementationFile=DlgProxy.cpp
BaseClass=CCmdTarget
Filter=N

[DLG:IDD_TEST_DIALOG]
Type=1
ControlCount=3
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,static,1342308352
Class=CTestDlg

[DLG:IDD_TEST_DIALOG (English (U.S.))]
Type=1
Class=CTestDlg
ControlCount=39
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_EDIT1,edit,1350631552
Control4=IDC_STATIC,static,1342308352
Control5=IDC_EDIT2,edit,1350631552
Control6=IDC_STATIC,static,1342308352
Control7=IDC_EDIT3,edit,1350631552
Control8=IDC_STATIC,static,1342308352
Control9=IDC_EDIT4,edit,1350631552
Control10=IDC_STATIC,static,1342308352
Control11=IDC_STATIC,button,1342177287
Control12=IDC_EDIT5,edit,1350631552
Control13=IDC_STATIC,static,1342308352
Control14=IDC_EDIT6,edit,1350631552
Control15=IDC_STATIC,static,1342308352
Control16=IDC_STATIC,button,1342177287
Control17=IDC_EDIT7,edit,1350631552
Control18=IDC_STATIC,static,1342308352
Control19=IDC_EDIT8,edit,1350631552
Control20=IDC_STATIC,static,1342308352
Control21=IDC_EDIT9,edit,1350631552
Control22=IDC_STATIC,static,1342308352
Control23=IDC_EDIT10,edit,1350631552
Control24=IDC_STATIC,static,1342308352
Control25=IDC_EDIT11,edit,1350631552
Control26=IDC_STATIC,static,1342308352
Control27=IDC_EDIT12,edit,1350631552
Control28=IDC_STATIC,static,1342308352
Control29=IDC_EDIT13,edit,1350631552
Control30=IDC_STATIC,static,1342308352
Control31=IDC_EDIT14,edit,1350631552
Control32=IDC_STATIC,static,1342308352
Control33=IDC_STATIC,button,1342177287
Control34=IDC_CREATENETWORK,button,1342242816
Control35=IDC_EDIT15,edit,1350631552
Control36=IDC_STATIC,static,1342308352
Control37=IDC_STATIC,button,1342177287
Control38=IDC_PROGRESS1,msctls_progress32,1350565888
Control39=IDC_FINDOBJ,button,1342242816

[DLG:IDD_ABOUTBOX (English (U.S.))]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[MNU:IDR_MENU1]
Type=1
Class=CTestDlg
Command1=ID_CREATE_NETWORK
Command2=ID_CREATE_DATA
Command3=ID_SAVE_NETWORK
Command4=ID_SAVE_RESULT
Command5=ID_LOAD_NETWORK
Command6=ID_LOAD_DATAFORTRAIN
Command7=ID_RUN_TRAINING
Command8=ID_RUN_TEST
CommandCount=8

[DLG:IDD_DIALOG1]
Type=1
Class=Show
ControlCount=0

[CLS:Show]
Type=0
HeaderFile=Show.h
ImplementationFile=Show.cpp
BaseClass=CDialog
Filter=D
LastObject=Show
VirtualFilter=dWC

