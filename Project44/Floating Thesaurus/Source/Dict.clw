; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CDictView
LastTemplate=CWinThread
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "Dict.h"
LastPage=0

ClassCount=19
Class1=CDictApp
Class2=CDictDoc
Class3=CDictView
Class4=CMainFrame
Class6=CAboutDlg

ResourceCount=19
Resource1=IDD_ABOUTBOX
Resource2=IDR_MAINFRAME
Class5=CDictSet
Resource3=IDD_DICT_FORM
Resource4=IDD_UPDATE_VOCAB
Resource5=IDD_ADD_DIALOG
Resource6=IDD_UPDATE_DIALOG
Class7=CAdd
Resource7=IDD_GAME_DIALOG
Class8=CUpdate
Resource8=IDD_GIF_DIALOG
Class9=CDelete
Resource9=IDD_DICT_FORM (English (U.S.))
Resource10=IDD_DIALOGBAR (English (U.S.))
Resource11=IDD_PROPPAGE_SMALL (English (U.S.))
Class10=CSearchOnline
Resource12=IDR_POPUP_MENU (English (U.S.))
Class11=CUpdateBox
Class12=CSystemTray
Resource13=IDD_DELETE_DIALOG
Resource14=IDD_GAME (English (U.S.))
Class13=CGifAnimation
Class14=CTutor
Class15=CGameTutor
Resource15=IDD_RESULT_DIALOG
Resource16=IDD_ABOUTBOX (English (U.S.))
Class16=CGame
Resource17=IDD_FORMVIEW (English (U.S.))
Resource18=IDD_SEARCHONLINE
Class17=CHangmanTutor
Class18=CHangResult
Class19=CDialogThread
Resource19=IDR_MAINFRAME (English (U.S.))

[CLS:CDictApp]
Type=0
HeaderFile=Dict.h
ImplementationFile=Dict.cpp
Filter=N
LastObject=CDictApp

[CLS:CDictDoc]
Type=0
HeaderFile=DictDoc.h
ImplementationFile=DictDoc.cpp
Filter=N
LastObject=CDictDoc

[CLS:CDictView]
Type=0
HeaderFile=DictView.h
ImplementationFile=DictView.cpp
Filter=D
BaseClass=CDaoRecordView
VirtualFilter=XRVWC
LastObject=ID_HANGMAN


[CLS:CDictSet]
Type=0
HeaderFile=DictSet.h
ImplementationFile=DictSet.cpp
Filter=N
LastObject=CDictSet

[DB:CDictSet]
DB=1
DBType=DAO
ColumnCount=9
Column1=[vocab], 12, 50
Column2=[noun], 12, 100
Column3=[verb], 12, 100
Column4=[adjective], 12, 100
Column5=[adverb], 12, 100
Column6=[pronoun], 12, 100
Column7=[conjunction], 12, 100
Column8=[preposition], 12, 100
Column9=[interjection], 12, 100


[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T
LastObject=ID_POPUP_ABOUTFLOATING
BaseClass=CFrameWnd
VirtualFilter=fWC




[CLS:CAboutDlg]
Type=0
HeaderFile=Dict.cpp
ImplementationFile=Dict.cpp
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
Command7=ID_EDIT_CUT
Command8=ID_EDIT_COPY
Command9=ID_EDIT_PASTE
Command10=ID_RECORD_FIRST
Command11=ID_RECORD_PREV
Command12=ID_RECORD_NEXT
Command13=ID_RECORD_LAST
Command14=ID_VIEW_TOOLBAR
Command15=ID_VIEW_STATUS_BAR
CommandCount=16
Command1=ID_FILE_PRINT
Command2=ID_FILE_PRINT_PREVIEW
Command3=ID_FILE_PRINT_SETUP
Command4=ID_FILE_MRU_FILE1
Command5=ID_APP_EXIT
Command6=ID_EDIT_UNDO
Command16=ID_APP_ABOUT

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command4=ID_EDIT_COPY
Command5=ID_EDIT_PASTE
Command6=ID_EDIT_UNDO
Command7=ID_EDIT_CUT
Command8=ID_EDIT_COPY
Command9=ID_EDIT_PASTE
Command10=ID_NEXT_PANE
Command11=ID_PREV_PANE
CommandCount=11
Command1=ID_FILE_PRINT
Command2=ID_EDIT_UNDO
Command3=ID_EDIT_CUT

[DLG:IDD_DICT_FORM]
Type=1
Class=CDictView

[DLG:IDD_DICT_FORM (English (U.S.))]
Type=1
Class=CDictView
ControlCount=6
Control1=IDC_CVOCAB,combobox,1344339970
Control2=IDC_Search,button,1342242816
Control3=IDC_THAI_MEANING,edit,1350633540
Control4=IDC_STATIC,static,1342308353
Control5=IDC_STATIC,button,1342177287
Control6=IDC_ENG_MEANING,edit,1350633540

[TB:IDR_MAINFRAME (English (U.S.))]
Type=1
Class=?
Command1=ID_ADDVOCAB
Command2=ID_UPDATEVOCAB
Command3=ID_DELETEVOCAB
Command4=ID_APP_ABOUT
CommandCount=4

[MNU:IDR_MAINFRAME (English (U.S.))]
Type=1
Class=CMainFrame
Command1=ID_MENU_FLOAT
Command2=ID_DEMO_GIF
Command3=ID_EN_ONLINE
Command4=ID_DIS_ONLINE
Command5=ID_EN_GAME
Command6=ID_DIS_GAME
Command7=ID_APP_EXIT
Command8=ID_EDIT_UNDO
Command9=ID_EDIT_CUT
Command10=ID_EDIT_COPY
Command11=ID_EDIT_PASTE
Command12=ID_VIEW_TOOLBAR
Command13=ID_VIEW_STATUS_BAR
Command14=IDC_SHOW_ICON
Command15=IDC_HIDE_ICON
Command16=ID_DEMO_MAXIMISE
Command17=ID_DEMO_MINIMISE
Command18=ID_APP_ABOUT
CommandCount=18

[ACL:IDR_MAINFRAME (English (U.S.))]
Type=1
Class=CMainFrame
Command1=ID_ADDVOCAB
Command2=ID_EDIT_COPY
Command3=ID_DELETEVOCAB
Command4=ID_UPDATEVOCAB
Command5=ID_MENU_FLOAT
Command6=ID_DEMO_GIF
Command7=ID_FILE_PRINT
Command8=ID_EDIT_PASTE
Command9=ID_EDIT_UNDO
Command10=ID_EDIT_CUT
Command11=ID_NEXT_PANE
Command12=ID_PREV_PANE
Command13=ID_EDIT_COPY
Command14=ID_EDIT_PASTE
Command15=ID_EDIT_CUT
Command16=ID_EDIT_UNDO
CommandCount=16

[DLG:IDD_ABOUTBOX (English (U.S.))]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[DLG:IDD_ADD_DIALOG]
Type=1
Class=CAdd
ControlCount=30
Control1=IDC_ADDVOCAB,edit,1350631552
Control2=IDC_ADDENOUN,edit,1350631556
Control3=IDC_ADDEVERB,edit,1350631552
Control4=IDC_ADDEADJ,edit,1350631552
Control5=IDC_ADDEADV,edit,1350631552
Control6=IDC_ADDEPREP,edit,1350631552
Control7=IDC_ADDTNOUN,edit,1350631552
Control8=IDC_ADDTVERB,edit,1350631552
Control9=IDC_ADDTADJ,edit,1350631552
Control10=IDC_ADDTADV,edit,1350631552
Control11=IDC_ADDTPREP,edit,1350631552
Control12=IDADDOK,button,1342242817
Control13=IDCANCEL,button,1342242816
Control14=IDC_STATIC,static,1342308353
Control15=IDC_STATIC,button,1342177287
Control16=IDC_STATIC,static,1342308353
Control17=IDC_STATIC,static,1342308353
Control18=IDC_STATIC,static,1342308353
Control19=IDC_STATIC,static,1342308353
Control20=IDC_STATIC,static,1342308353
Control21=IDC_STATIC,button,1342177287
Control22=IDC_STATIC,static,1342308353
Control23=IDC_STATIC,static,1342308353
Control24=IDC_STATIC,static,1342308353
Control25=IDC_ADDEPRON,edit,1350631552
Control26=IDC_ADDECONJ,edit,1350631552
Control27=IDC_ADDEINT,edit,1350631552
Control28=IDC_ADDTPRON,edit,1350631552
Control29=IDC_ADDTCONJ,edit,1350631552
Control30=IDC_ADDTINT,edit,1350631552

[DLG:IDD_UPDATE_DIALOG]
Type=1
Class=CUpdate
ControlCount=30
Control1=IDC_UPVOCAB,edit,1350633600
Control2=IDC_UPENOUN,edit,1350631552
Control3=IDC_UPEVERB,edit,1350631552
Control4=IDC_UPEADJ,edit,1350631552
Control5=IDC_UPEADV,edit,1350631552
Control6=IDC_UPEPREP,edit,1350631552
Control7=IDC_UPTNOUN,edit,1350631552
Control8=IDC_UPTVERB,edit,1350631552
Control9=IDC_UPTADJ,edit,1350631552
Control10=IDC_UPTADV,edit,1350631552
Control11=IDC_UPTPREP,edit,1350631552
Control12=IDOK,button,1342242816
Control13=IDCANCEL,button,1342242816
Control14=IDC_STATIC,static,1342308353
Control15=IDC_STATIC,button,1342177287
Control16=IDC_STATIC,static,1342308353
Control17=IDC_STATIC,static,1342308353
Control18=IDC_STATIC,static,1342308353
Control19=IDC_STATIC,static,1342308353
Control20=IDC_STATIC,static,1342308353
Control21=IDC_STATIC,button,1342177287
Control22=IDC_STATIC,static,1342308353
Control23=IDC_STATIC,static,1342308353
Control24=IDC_STATIC,static,1342308353
Control25=IDC_UPEPRON,edit,1350631552
Control26=IDC_UPECONJ,edit,1350631552
Control27=IDC_UPEINT,edit,1350631552
Control28=IDC_UPTPRON,edit,1350631552
Control29=IDC_UPTCONJ,edit,1350631552
Control30=IDC_UPTINT,edit,1350631552

[CLS:CUpdate]
Type=0
HeaderFile=Update.h
ImplementationFile=Update.cpp
BaseClass=CDialog
Filter=D
LastObject=CUpdate
VirtualFilter=dWC

[DLG:IDD_DELETE_DIALOG]
Type=1
Class=CDelete
ControlCount=4
Control1=IDC_DELVOCAB,edit,1350631552
Control2=IDOK,button,1342242817
Control3=IDCANCEL,button,1342242816
Control4=IDC_STATIC,static,1342308353

[CLS:CDelete]
Type=0
HeaderFile=Delete.h
ImplementationFile=Delete.cpp
BaseClass=CDialog
Filter=D
LastObject=ID_PEN_GAME
VirtualFilter=dWC

[DLG:IDD_DIALOGBAR (English (U.S.))]
Type=1
Class=CGame
ControlCount=1
Control1=IDC_STATIC,static,1342308352

[DLG:IDD_PROPPAGE_SMALL (English (U.S.))]
Type=1
Class=?
ControlCount=1
Control1=IDC_STATIC,static,1342308352

[DLG:IDD_SEARCHONLINE]
Type=1
Class=CSearchOnline
ControlCount=4
Control1=IDOnlineOK,button,1342242817
Control2=IDOnlineCANCEL,button,1342242816
Control3=IDC_STATIC,static,1342308353
Control4=IDC_STATIC,static,1342308353

[CLS:CSearchOnline]
Type=0
HeaderFile=SearchOnline.h
ImplementationFile=SearchOnline.cpp
BaseClass=CDialog
Filter=D
LastObject=IDOnlineCANCEL
VirtualFilter=dWC

[DLG:IDD_UPDATE_VOCAB]
Type=1
Class=CUpdateBox
ControlCount=4
Control1=IDC_EDIT_VOCAB,edit,1350631552
Control2=IDOK,button,1342242817
Control3=IDCANCEL,button,1342242816
Control4=IDC_STATIC,static,1342308353

[CLS:CUpdateBox]
Type=0
HeaderFile=UpdateBox.h
ImplementationFile=UpdateBox.cpp
BaseClass=CDialog
Filter=D
LastObject=CUpdateBox
VirtualFilter=dWC

[CLS:CSystemTray]
Type=0
HeaderFile=SystemTray.h
ImplementationFile=SystemTray.cpp
BaseClass=CWnd
Filter=W
VirtualFilter=WC
LastObject=CSystemTray

[MNU:IDR_POPUP_MENU (English (U.S.))]
Type=1
Class=?
Command1=ID_FLOAT
Command2=ID_HANGMAN
Command3=ID_PEN_ONLINE
Command4=ID_PDIS_ONLINE
Command5=ID_PEN_GAME
Command6=ID_PDIS_GAME
Command7=ID_DEMO_MAXIMISE
Command8=ID_DEMO_MINIMISE
Command9=ID_POPUP_ABOUTFLOATING
Command10=ID_APP_EXIT
CommandCount=10

[CLS:CAdd]
Type=0
HeaderFile=add.h
ImplementationFile=add.cpp
BaseClass=CDialog

[DLG:IDD_GIF_DIALOG]
Type=1
Class=CGifAnimation
ControlCount=1
Control1=IDC_GIF,static,1342177284

[CLS:CGifAnimation]
Type=0
HeaderFile=GifAnimation.h
ImplementationFile=GifAnimation.cpp
BaseClass=CDialog
Filter=D
LastObject=CGifAnimation
VirtualFilter=dWC

[DLG:IDD_FORMVIEW (English (U.S.))]
Type=1
ControlCount=1
Control1=IDC_STATIC,static,1342308352

[DLG:IDD_GAME (English (U.S.))]
Type=1
Class=CHangmanTutor
ControlCount=0

[CLS:CHangmanTutor]
Type=0
HeaderFile=HangmanTutor.h
ImplementationFile=HangmanTutor.cpp
BaseClass=CDialog
Filter=D
LastObject=CHangmanTutor
VirtualFilter=dWC

[DLG:IDD_GAME_DIALOG]
Type=1
Class=CHangmanTutor
ControlCount=5
Control1=IDC_VOCAB,static,1342308864
Control2=IDC_TIMES,static,1342308865
Control3=IDC_STATIC,button,1342177287
Control4=IDC_PICT,static,1342177284
Control5=IDC_MEAN,edit,1342179396

[DLG:IDD_RESULT_DIALOG]
Type=1
Class=CHangResult
ControlCount=8
Control1=IDOK,button,1342242817
Control2=IDC_PICT,static,1342177284
Control3=IDC_STATIC,static,1342308352
Control4=IDC_STATIC,static,1342308352
Control5=IDC_STATIC,static,1342308352
Control6=IDC_ALL,static,1342308352
Control7=IDC_WIN,static,1342308352
Control8=IDC_LOSE,static,1342308352

[CLS:CHangResult]
Type=0
HeaderFile=HangResult.h
ImplementationFile=HangResult.cpp
BaseClass=CDialog
Filter=D

[CLS:CDialogThread]
Type=0
HeaderFile=DialogThread.h
ImplementationFile=DialogThread.cpp
BaseClass=CWinThread
Filter=N
LastObject=ID_CONFIG

