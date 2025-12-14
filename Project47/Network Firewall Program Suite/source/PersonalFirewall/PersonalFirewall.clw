; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CPersonalFirewallDlg
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "PersonalFirewall.h"

ClassCount=5
Class1=CPersonalFirewallApp
Class2=CPersonalFirewallDlg
Class3=CAboutDlg

ResourceCount=8
Resource1=IDD_ABOUTBOX
Resource2=IDR_MAINFRAME
Resource3=IDD_PERSONALFIREWALL_DIALOG
Resource4=IDD_DIALOG_RULE
Resource5=IDD_DIALOG_MAIN
Resource6=IDD_PERSONALFIREWALL_DIALOG (English (U.S.))
Class4=CDlgMain
Class5=CDlgRule
Resource7=IDD_ABOUTBOX (English (U.S.))
Resource8=IDR_MENUTRAY

[CLS:CPersonalFirewallApp]
Type=0
HeaderFile=PersonalFirewall.h
ImplementationFile=PersonalFirewall.cpp
Filter=N

[CLS:CPersonalFirewallDlg]
Type=0
HeaderFile=PersonalFirewallDlg.h
ImplementationFile=PersonalFirewallDlg.cpp
Filter=D
LastObject=ID_CLOSE
BaseClass=CDialog
VirtualFilter=dWC

[CLS:CAboutDlg]
Type=0
HeaderFile=PersonalFirewallDlg.h
ImplementationFile=PersonalFirewallDlg.cpp
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


[DLG:IDD_PERSONALFIREWALL_DIALOG]
Type=1
ControlCount=3
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,static,1342308352
Class=CPersonalFirewallDlg

[DLG:IDD_PERSONALFIREWALL_DIALOG (English (U.S.))]
Type=1
Class=CPersonalFirewallDlg
ControlCount=1
Control1=IDC_TAB,SysTabControl32,1342177280

[DLG:IDD_ABOUTBOX (English (U.S.))]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[DLG:IDD_DIALOG_MAIN]
Type=1
Class=CDlgMain
ControlCount=7
Control1=IDC_LIST_LOG,listbox,1344344321
Control2=IDC_LIST_GROUP,listbox,1344344321
Control3=IDC_STATIC_USER_NAME,static,1342308352
Control4=IDC_STATIC,static,1342308352
Control5=IDC_STATIC,static,1342308352
Control6=IDC_STATIC,static,1342177294
Control7=IDC_STATIC,button,1342177287

[DLG:IDD_DIALOG_RULE]
Type=1
Class=CDlgRule
ControlCount=6
Control1=IDC_LIST_RULE,SysListView32,1342242817
Control2=IDC_STATIC_HOST_IP,static,1342308352
Control3=IDC_STATIC_NUMBER_OF_GROUP_RULE,static,1342308352
Control4=IDC_STATIC,static,1342308352
Control5=IDC_STATIC,static,1342308352
Control6=IDC_STATIC,static,1342308352

[CLS:CDlgMain]
Type=0
HeaderFile=DlgMain.h
ImplementationFile=DlgMain.cpp
BaseClass=CDialog
Filter=D
LastObject=CDlgMain
VirtualFilter=dWC

[CLS:CDlgRule]
Type=0
HeaderFile=DlgRule.h
ImplementationFile=DlgRule.cpp
BaseClass=CDialog
Filter=D
LastObject=CDlgRule
VirtualFilter=dWC

[MNU:IDR_MENUTRAY]
Type=1
Class=?
Command1=ID_OPEN
Command2=ID_CLOSE
CommandCount=2

