; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CBasicDlg
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "Basic.h"

ClassCount=8
Class1=CBasicApp
Class2=CBasicDlg

ResourceCount=9
Resource2=IDD_BASIC_DIALOG
Resource1=IDR_MAINFRAME
Resource3=IDD_BASIC_DIALOG (English (U.S.))
Class3=CLimitDlg
Resource4=IDD_SETCREDIT_DIALOG
Class4=CSetCreditDlg
Resource5=IDD_SETLIMIT_DIALOG
Class5=CAddcreditDlg
Resource6=IDD_ADDCREDIT_DIALOG
Class6=CChargeDlg
Resource7=IDD_CHARGE_DIALOG
Class7=OnPrint
Resource8=IDD_SETBALANCE_DIALOG
Class8=CSetBalanceDlg
Resource9=IDR_MAINMENU (English (U.S.))

[CLS:CBasicApp]
Type=0
HeaderFile=Basic.h
ImplementationFile=Basic.cpp
Filter=N
LastObject=CBasicApp

[CLS:CBasicDlg]
Type=0
HeaderFile=BasicDlg.h
ImplementationFile=BasicDlg.cpp
Filter=D
BaseClass=CDialog
VirtualFilter=dWC
LastObject=ID_ADD



[DLG:IDD_BASIC_DIALOG]
Type=1
ControlCount=3
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,static,1342308352
Class=CBasicDlg

[DLG:IDD_BASIC_DIALOG (English (U.S.))]
Type=1
Class=CBasicDlg
ControlCount=12
Control1=ID_EXIT,button,1342242816
Control2=ID_SET,button,1342242817
Control3=ID_ADD,button,1342242817
Control4=ID_LIMIT,button,1342242817
Control5=ID_SETBALANCE,button,1342242817
Control6=ID_CHARGE,button,1342242817
Control7=ID_HISTORY,button,1342242817
Control8=IDC_LISTBOX,listbox,1352728835
Control9=IDC_STATIC_NAME,static,1342308352
Control10=IDC_STATIC_MESSAGE,static,1342308352
Control11=IDC_STATIC_BALANCE,static,1342308352
Control12=IDC_STATIC_LIMIT,static,1342308352

[DLG:IDD_SETLIMIT_DIALOG]
Type=1
Class=CLimitDlg
ControlCount=5
Control1=IDC_ENTER_LIMIT,edit,1350631552
Control2=IDCANCEL,button,1342242816
Control3=IDOK,button,1342242817
Control4=IDC_CREDIT_LIMIT,static,1342308352
Control5=IDC_CURRENT_LIMIT,static,1342308352

[CLS:CLimitDlg]
Type=0
HeaderFile=LimitDlg.h
ImplementationFile=LimitDlg.cpp
BaseClass=CDialog
Filter=D
LastObject=CLimitDlg

[CLS:CSetCreditDlg]
Type=0
HeaderFile=SetCreditDlg.h
ImplementationFile=SetCreditDlg.cpp
BaseClass=CDialog
Filter=D
LastObject=CSetCreditDlg

[DLG:IDD_SETCREDIT_DIALOG]
Type=1
Class=CSetCreditDlg
ControlCount=5
Control1=IDC_EDIT_SET_CREDIT,edit,1350631552
Control2=IDOK,button,1342242817
Control3=IDCANCEL,button,1342242816
Control4=IDC_STATIC_CURRENT_CREDIT,static,1342308352
Control5=IDC_STATIC_SET_CREDIT,static,1342308352

[DLG:IDD_ADDCREDIT_DIALOG]
Type=1
Class=CAddcreditDlg
ControlCount=5
Control1=IDC_EDIT2,edit,1350631552
Control2=IDOK,button,1342242817
Control3=IDCANCEL,button,1342242816
Control4=IDC_ADDCREDIT_STATIC,static,1342308352
Control5=IDC_ADDCREDIT_STATIC2,static,1342308352

[CLS:CAddcreditDlg]
Type=0
HeaderFile=AddcreditDlg.h
ImplementationFile=AddcreditDlg.cpp
BaseClass=CDialog
Filter=D
LastObject=CAddcreditDlg

[DLG:IDD_CHARGE_DIALOG]
Type=1
Class=CChargeDlg
ControlCount=5
Control1=IDC_CHARGE_EDIT,edit,1350631552
Control2=IDOK,button,1342242817
Control3=IDCANCEL,button,1342242816
Control4=IDC_CHARGE_STATIC,static,1342308352
Control5=IDC_CHARGE_STATIC2,static,1342308352

[CLS:CChargeDlg]
Type=0
HeaderFile=ChargeDlg.h
ImplementationFile=ChargeDlg.cpp
BaseClass=CDialog
Filter=D
LastObject=CChargeDlg

[MNU:IDR_MAINMENU (English (U.S.))]
Type=1
Class=?
Command1=ID_FILE_OPEN
Command2=ID_FILE_EXIT
Command3=ID_ACC_GROUP
Command4=ID_ACC_USER
Command5=ID_INDEX_HELP
Command6=ID_SEARCH_HELP
CommandCount=6

[CLS:OnPrint]
Type=0
HeaderFile=OnPrint.h
ImplementationFile=OnPrint.cpp
BaseClass=CDialog
Filter=D
LastObject=ID_ACC_GROUP

[DLG:IDD_SETBALANCE_DIALOG]
Type=1
Class=CSetBalanceDlg
ControlCount=5
Control1=IDC_SETBALANCE_EDIT,edit,1350631552
Control2=IDCANCEL,button,1342242816
Control3=IDOK,button,1342242817
Control4=IDC_BALANCE_STATIC,static,1342308352
Control5=IDC_SETBALANCE_STATIC,static,1342308352

[CLS:CSetBalanceDlg]
Type=0
HeaderFile=SetBalanceDlg.h
ImplementationFile=SetBalanceDlg.cpp
BaseClass=CDialog
Filter=D
LastObject=CSetBalanceDlg

