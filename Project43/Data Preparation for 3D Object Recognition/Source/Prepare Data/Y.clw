; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CYDlg
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "Y.h"

ClassCount=10
Class1=CYApp
Class2=CYDlg
Class3=CAboutDlg

ResourceCount=8
Resource1=IDD_ABOUTBOX
Resource2=IDR_MAINFRAME
Resource3=IDD_Y_DIALOG
Resource4=IDD_DIALOG7
Resource5=IDD_ABOUTBOX (English (U.S.))
Resource6=IDD_Y_DIALOG (English (U.S.))
Class4=CIMAGE1
Resource7=IDD_DIALOG4
Class5=IMAGE2
Class6=C3D
Class7=Edge
Class8=PGM
Class9=CThreshold
Class10=CHISTOGRAM
Resource8=IDR_MENU1

[CLS:CYApp]
Type=0
HeaderFile=Y.h
ImplementationFile=Y.cpp
Filter=N
LastObject=CYApp

[CLS:CYDlg]
Type=0
HeaderFile=YDlg.h
ImplementationFile=YDlg.cpp
Filter=D
LastObject=ID_FILE_OPEN3IMAGE
BaseClass=CDialog
VirtualFilter=dWC

[CLS:CAboutDlg]
Type=0
HeaderFile=YDlg.h
ImplementationFile=YDlg.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308352
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889
Class=CAboutDlg


[DLG:IDD_Y_DIALOG]
Type=1
ControlCount=3
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,static,1342308352
Class=CYDlg

[DLG:IDD_Y_DIALOG (English (U.S.))]
Type=1
Class=CYDlg
ControlCount=0

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
Class=?
Command1=ID_FILE_OPEN3IMAGE
Command2=ID_IMAGEPROCESSING_SHOWIMAGE
Command3=ID_PGM_HIS
Command4=ID_IMAGEPROCESSING_SHOWEDGE
Command5=ID_IMAGEPROCESSING_SHOWEDGEOUT
Command6=ID_IMAGEPROCESSING_COLOROBJECTAREA
Command7=ID_SAVE_FILEDATA
CommandCount=7

[CLS:CIMAGE1]
Type=0
HeaderFile=IMAGE1.h
ImplementationFile=IMAGE1.cpp
BaseClass=CDialog
Filter=D
LastObject=CIMAGE1
VirtualFilter=dWC

[CLS:IMAGE2]
Type=0
HeaderFile=IMAGE2.h
ImplementationFile=IMAGE2.cpp
BaseClass=CDialog
Filter=D
LastObject=IMAGE2
VirtualFilter=dWC

[CLS:C3D]
Type=0
HeaderFile=3D.h
ImplementationFile=3D.cpp
BaseClass=CDialog
Filter=D
LastObject=C3D
VirtualFilter=dWC

[DLG:IDD_DIALOG4]
Type=1
Class=Edge
ControlCount=0

[CLS:Edge]
Type=0
HeaderFile=Edge.h
ImplementationFile=Edge.cpp
BaseClass=CDialog
Filter=D
LastObject=ID_IMAGEPROCESSING_SHOWIMAGE
VirtualFilter=dWC

[CLS:PGM]
Type=0
HeaderFile=PGM.h
ImplementationFile=PGM.cpp
BaseClass=CDialog
Filter=D
LastObject=PGM
VirtualFilter=dWC

[CLS:CThreshold]
Type=0
HeaderFile=Threshold.h
ImplementationFile=Threshold.cpp
BaseClass=CDialog
Filter=D
LastObject=CThreshold
VirtualFilter=dWC

[DLG:IDD_DIALOG7]
Type=1
Class=CHISTOGRAM
ControlCount=0

[CLS:CHISTOGRAM]
Type=0
HeaderFile=HISTOGRAM.h
ImplementationFile=HISTOGRAM.cpp
BaseClass=CDialog
Filter=D
LastObject=CHISTOGRAM
VirtualFilter=dWC

