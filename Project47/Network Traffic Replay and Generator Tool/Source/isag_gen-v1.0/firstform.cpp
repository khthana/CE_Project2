/****************************************************************************
** Form implementation generated from reading ui file 'firstform.ui'
**
** Created: Thu Jan 27 19:27:57 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "firstform.h"

#include <qvariant.h>
#include <qpushbutton.h>
#include <qwidgetstack.h>
#include <qwidget.h>
#include <qframe.h>
#include <qbuttongroup.h>
#include <qradiobutton.h>
#include <qgroupbox.h>
#include <qlineedit.h>
#include <qlabel.h>
#include <qcombobox.h>
#include <qtable.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qaction.h>
#include <qmenubar.h>
#include <qpopupmenu.h>
#include <qtoolbar.h>
#include <qimage.h>
#include <qpixmap.h>

#include "qapplication.h"
#include "firstform.ui.h"
/*
 *  Constructs a firstForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 */
firstForm::firstForm( QWidget* parent, const char* name, WFlags fl )
    : QMainWindow( parent, name, fl )
{
    (void)statusBar();
    if ( !name )
	setName( "firstForm" );
    setIcon( QPixmap::fromMimeSource( "designer_home.png" ) );
    setCentralWidget( new QWidget( this, "qt_central_widget" ) );
    firstFormLayout = new QGridLayout( centralWidget(), 1, 1, 11, 6, "firstFormLayout"); 

    functionWidgetStack = new QWidgetStack( centralWidget(), "functionWidgetStack" );

    generatePage = new QWidget( functionWidgetStack, "generatePage" );
    generatePageLayout = new QGridLayout( generatePage, 1, 1, 11, 6, "generatePageLayout"); 

    frame11 = new QFrame( generatePage, "frame11" );
    frame11->setFrameShape( QFrame::StyledPanel );
    frame11->setFrameShadow( QFrame::Raised );

    QWidget* privateLayoutWidget = new QWidget( frame11, "layout81" );
    privateLayoutWidget->setGeometry( QRect( 10, 100, 588, 202 ) );
    layout81 = new QVBoxLayout( privateLayoutWidget, 11, 6, "layout81"); 

    layout80 = new QHBoxLayout( 0, 0, 6, "layout80"); 
    spacer43 = new QSpacerItem( 180, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout80->addItem( spacer43 );

    generatePacketButtonGroup = new QButtonGroup( privateLayoutWidget, "generatePacketButtonGroup" );

    templateRadioButton = new QRadioButton( generatePacketButtonGroup, "templateRadioButton" );
    templateRadioButton->setGeometry( QRect( 11, 22, 140, 21 ) );
    templateRadioButton->setChecked( TRUE );

    configFileRadioButton = new QRadioButton( generatePacketButtonGroup, "configFileRadioButton" );
    configFileRadioButton->setGeometry( QRect( 11, 49, 140, 21 ) );
    layout80->addWidget( generatePacketButtonGroup );
    spacer44 = new QSpacerItem( 190, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout80->addItem( spacer44 );
    layout81->addLayout( layout80 );
    spacer49 = new QSpacerItem( 20, 60, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout81->addItem( spacer49 );

    layout65 = new QHBoxLayout( 0, 0, 6, "layout65"); 
    spacer5 = new QSpacerItem( 290, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout65->addItem( spacer5 );

    acceptPushButton = new QPushButton( privateLayoutWidget, "acceptPushButton" );
    acceptPushButton->setDefault( TRUE );
    layout65->addWidget( acceptPushButton );

    ExitpushButton = new QPushButton( privateLayoutWidget, "ExitpushButton" );
    layout65->addWidget( ExitpushButton );
    spacer41 = new QSpacerItem( 120, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout65->addItem( spacer41 );
    layout81->addLayout( layout65 );

    generatePageLayout->addWidget( frame11, 0, 0 );
    functionWidgetStack->addWidget( generatePage, 0 );

    replayPage = new QWidget( functionWidgetStack, "replayPage" );
    replayPageLayout = new QHBoxLayout( replayPage, 11, 6, "replayPageLayout"); 

    replayGroupBox = new QGroupBox( replayPage, "replayGroupBox" );
    replayGroupBox->setColumnLayout(0, Qt::Vertical );
    replayGroupBox->layout()->setSpacing( 6 );
    replayGroupBox->layout()->setMargin( 11 );
    replayGroupBoxLayout = new QGridLayout( replayGroupBox->layout() );
    replayGroupBoxLayout->setAlignment( Qt::AlignTop );

    layout99 = new QVBoxLayout( 0, 0, 6, "layout99"); 

    layout48 = new QHBoxLayout( 0, 0, 6, "layout48"); 

    fileLineEdit1 = new QLineEdit( replayGroupBox, "fileLineEdit1" );
    fileLineEdit1->setAlignment( int( QLineEdit::AlignLeft ) );
    layout48->addWidget( fileLineEdit1 );

    browsePushButton1 = new QPushButton( replayGroupBox, "browsePushButton1" );
    layout48->addWidget( browsePushButton1 );
    layout99->addLayout( layout48 );

    layout98 = new QHBoxLayout( 0, 0, 6, "layout98"); 

    buttonGroup3 = new QButtonGroup( replayGroupBox, "buttonGroup3" );
    buttonGroup3->setEnabled( TRUE );
    buttonGroup3->setColumnLayout(0, Qt::Vertical );
    buttonGroup3->layout()->setSpacing( 6 );
    buttonGroup3->layout()->setMargin( 11 );
    buttonGroup3Layout = new QGridLayout( buttonGroup3->layout() );
    buttonGroup3Layout->setAlignment( Qt::AlignTop );

    layout21 = new QHBoxLayout( 0, 0, 6, "layout21"); 

    textLabel1 = new QLabel( buttonGroup3, "textLabel1" );
    layout21->addWidget( textLabel1 );

    patturnComboBox = new QComboBox( FALSE, buttonGroup3, "patturnComboBox" );
    layout21->addWidget( patturnComboBox );

    buttonGroup3Layout->addLayout( layout21, 0, 0 );

    layout95 = new QHBoxLayout( 0, 0, 6, "layout95"); 

    textLabel1_2_2 = new QLabel( buttonGroup3, "textLabel1_2_2" );
    layout95->addWidget( textLabel1_2_2 );
    spacer103 = new QSpacerItem( 81, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout95->addItem( spacer103 );

    lineEdit_Replay_inf = new QLineEdit( buttonGroup3, "lineEdit_Replay_inf" );
    layout95->addWidget( lineEdit_Replay_inf );

    buttonGroup3Layout->addLayout( layout95, 6, 0 );

    layout97 = new QHBoxLayout( 0, 0, 6, "layout97"); 

    iptextLabel = new QLabel( buttonGroup3, "iptextLabel" );
    layout97->addWidget( iptextLabel );
    spacer32 = new QSpacerItem( 55, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout97->addItem( spacer32 );

    ipLineEdit = new QLineEdit( buttonGroup3, "ipLineEdit" );
    ipLineEdit->setEnabled( FALSE );
    ipLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout97->addWidget( ipLineEdit );

    buttonGroup3Layout->addLayout( layout97, 1, 0 );

    layout113 = new QVBoxLayout( 0, 0, 6, "layout113"); 

    textLabel2 = new QLabel( buttonGroup3, "textLabel2" );
    layout113->addWidget( textLabel2 );
    spacer104 = new QSpacerItem( 20, 20, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout113->addItem( spacer104 );

    listNumberLineEdit = new QLineEdit( buttonGroup3, "listNumberLineEdit" );
    listNumberLineEdit->setEnabled( FALSE );
    listNumberLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout113->addWidget( listNumberLineEdit );

    buttonGroup3Layout->addLayout( layout113, 2, 0 );
    spacer107 = new QSpacerItem( 20, 16, QSizePolicy::Minimum, QSizePolicy::Expanding );
    buttonGroup3Layout->addItem( spacer107, 3, 0 );

    layout49 = new QHBoxLayout( 0, 0, 6, "layout49"); 

    textLabel3_3 = new QLabel( buttonGroup3, "textLabel3_3" );
    layout49->addWidget( textLabel3_3 );

    protocolComboBox = new QComboBox( FALSE, buttonGroup3, "protocolComboBox" );
    protocolComboBox->setEnabled( FALSE );
    layout49->addWidget( protocolComboBox );

    buttonGroup3Layout->addLayout( layout49, 4, 0 );
    spacer108 = new QSpacerItem( 20, 21, QSizePolicy::Minimum, QSizePolicy::Expanding );
    buttonGroup3Layout->addItem( spacer108, 5, 0 );
    layout98->addWidget( buttonGroup3 );

    layout50 = new QVBoxLayout( 0, 0, 6, "layout50"); 

    buttonGroup4 = new QButtonGroup( replayGroupBox, "buttonGroup4" );
    buttonGroup4->setColumnLayout(0, Qt::Vertical );
    buttonGroup4->layout()->setSpacing( 6 );
    buttonGroup4->layout()->setMargin( 11 );
    buttonGroup4Layout = new QGridLayout( buttonGroup4->layout() );
    buttonGroup4Layout->setAlignment( Qt::AlignTop );

    matchRadioButton = new QRadioButton( buttonGroup4, "matchRadioButton" );
    matchRadioButton->setEnabled( TRUE );
    matchRadioButton->setAutoMask( FALSE );
    matchRadioButton->setChecked( TRUE );

    buttonGroup4Layout->addWidget( matchRadioButton, 0, 0 );

    nMatchRadioButton = new QRadioButton( buttonGroup4, "nMatchRadioButton" );

    buttonGroup4Layout->addWidget( nMatchRadioButton, 0, 1 );
    layout50->addWidget( buttonGroup4 );

    changeIPGroup = new QButtonGroup( replayGroupBox, "changeIPGroup" );

    sIPLineEdit = new QLineEdit( changeIPGroup, "sIPLineEdit" );
    sIPLineEdit->setGeometry( QRect( 11, 56, 175, 29 ) );
    sIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    dIPLineEdit = new QLineEdit( changeIPGroup, "dIPLineEdit" );
    dIPLineEdit->setGeometry( QRect( 11, 119, 175, 29 ) );
    dIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    textLabel3_2 = new QLabel( changeIPGroup, "textLabel3_2" );
    textLabel3_2->setGeometry( QRect( 11, 91, 175, 22 ) );

    textLabel3 = new QLabel( changeIPGroup, "textLabel3" );
    textLabel3->setGeometry( QRect( 11, 28, 175, 22 ) );
    layout50->addWidget( changeIPGroup );
    layout98->addLayout( layout50 );

    layout91 = new QVBoxLayout( 0, 0, 6, "layout91"); 
    spacer102 = new QSpacerItem( 20, 81, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout91->addItem( spacer102 );

    buttonGroup2 = new QButtonGroup( replayGroupBox, "buttonGroup2" );
    buttonGroup2->setColumnLayout(0, Qt::Vertical );
    buttonGroup2->layout()->setSpacing( 6 );
    buttonGroup2->layout()->setMargin( 11 );
    buttonGroup2Layout = new QGridLayout( buttonGroup2->layout() );
    buttonGroup2Layout->setAlignment( Qt::AlignTop );

    normalRadioButton = new QRadioButton( buttonGroup2, "normalRadioButton" );
    normalRadioButton->setChecked( TRUE );

    buttonGroup2Layout->addWidget( normalRadioButton, 0, 0 );

    fastRadioButton = new QRadioButton( buttonGroup2, "fastRadioButton" );

    buttonGroup2Layout->addWidget( fastRadioButton, 1, 0 );
    layout91->addWidget( buttonGroup2 );

    layout90 = new QVBoxLayout( 0, 0, 6, "layout90"); 

    sendPushButton = new QPushButton( replayGroupBox, "sendPushButton" );
    layout90->addWidget( sendPushButton );

    showButton_2 = new QPushButton( replayGroupBox, "showButton_2" );
    layout90->addWidget( showButton_2 );

    cancelPushButton = new QPushButton( replayGroupBox, "cancelPushButton" );
    layout90->addWidget( cancelPushButton );
    layout91->addLayout( layout90 );
    layout98->addLayout( layout91 );
    layout99->addLayout( layout98 );

    tableResult = new QTable( replayGroupBox, "tableResult" );
    tableResult->setNumCols( tableResult->numCols() + 1 );
    tableResult->horizontalHeader()->setLabel( tableResult->numCols() - 1, tr( "Time" ) );
    tableResult->setNumCols( tableResult->numCols() + 1 );
    tableResult->horizontalHeader()->setLabel( tableResult->numCols() - 1, tr( "Source            " ) );
    tableResult->setNumCols( tableResult->numCols() + 1 );
    tableResult->horizontalHeader()->setLabel( tableResult->numCols() - 1, tr( "Destination             " ) );
    tableResult->setNumCols( tableResult->numCols() + 1 );
    tableResult->horizontalHeader()->setLabel( tableResult->numCols() - 1, tr( "Protocol" ) );
    tableResult->setNumCols( tableResult->numCols() + 1 );
    tableResult->horizontalHeader()->setLabel( tableResult->numCols() - 1, tr( "Info                    " ) );
    tableResult->setSizePolicy( QSizePolicy( (QSizePolicy::SizeType)7, (QSizePolicy::SizeType)7, 20, 0, tableResult->sizePolicy().hasHeightForWidth() ) );
    tableResult->setLineWidth( 2 );
    tableResult->setNumRows( 0 );
    tableResult->setNumCols( 5 );
    layout99->addWidget( tableResult );

    replayGroupBoxLayout->addLayout( layout99, 0, 0 );
    replayPageLayout->addWidget( replayGroupBox );
    functionWidgetStack->addWidget( replayPage, 1 );

    capturePage = new QWidget( functionWidgetStack, "capturePage" );
    capturePageLayout = new QGridLayout( capturePage, 1, 1, 11, 6, "capturePageLayout"); 

    groupBox35 = new QGroupBox( capturePage, "groupBox35" );
    groupBox35->setFrameShape( QGroupBox::GroupBoxPanel );
    groupBox35->setFrameShadow( QGroupBox::Sunken );
    groupBox35->setColumnLayout(0, Qt::Vertical );
    groupBox35->layout()->setSpacing( 6 );
    groupBox35->layout()->setMargin( 11 );
    groupBox35Layout = new QGridLayout( groupBox35->layout() );
    groupBox35Layout->setAlignment( Qt::AlignTop );

    layout114 = new QVBoxLayout( 0, 0, 6, "layout114"); 

    showButton = new QPushButton( groupBox35, "showButton" );
    layout114->addWidget( showButton );

    ButtonExit = new QPushButton( groupBox35, "ButtonExit" );
    layout114->addWidget( ButtonExit );

    groupBox35Layout->addMultiCellLayout( layout114, 0, 1, 1, 1 );

    layout118 = new QHBoxLayout( 0, 0, 6, "layout118"); 

    fileLineEdit2 = new QLineEdit( groupBox35, "fileLineEdit2" );
    fileLineEdit2->setAlignment( int( QLineEdit::AlignLeft ) );
    layout118->addWidget( fileLineEdit2 );

    browsePushButton2 = new QPushButton( groupBox35, "browsePushButton2" );
    layout118->addWidget( browsePushButton2 );

    groupBox35Layout->addLayout( layout118, 0, 0 );

    layout120 = new QHBoxLayout( 0, 0, 6, "layout120"); 

    layout106 = new QHBoxLayout( 0, 0, 6, "layout106"); 

    textLabel1_2 = new QLabel( groupBox35, "textLabel1_2" );
    layout106->addWidget( textLabel1_2 );

    lineEdit_Capture_inf = new QLineEdit( groupBox35, "lineEdit_Capture_inf" );
    lineEdit_Capture_inf->setAlignment( int( QLineEdit::AlignRight ) );
    layout106->addWidget( lineEdit_Capture_inf );
    layout120->addLayout( layout106 );
    spacer109 = new QSpacerItem( 145, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout120->addItem( spacer109 );

    layout119 = new QHBoxLayout( 0, 0, 6, "layout119"); 

    textLabel2_2 = new QLabel( groupBox35, "textLabel2_2" );
    layout119->addWidget( textLabel2_2 );

    startButton = new QPushButton( groupBox35, "startButton" );
    layout119->addWidget( startButton );
    layout120->addLayout( layout119 );

    groupBox35Layout->addLayout( layout120, 1, 0 );

    capturePageLayout->addWidget( groupBox35, 0, 0 );

    capturetable = new QTable( capturePage, "capturetable" );
    capturetable->setNumCols( capturetable->numCols() + 1 );
    capturetable->horizontalHeader()->setLabel( capturetable->numCols() - 1, tr( "Time" ) );
    capturetable->setNumCols( capturetable->numCols() + 1 );
    capturetable->horizontalHeader()->setLabel( capturetable->numCols() - 1, tr( "Source" ) );
    capturetable->setNumCols( capturetable->numCols() + 1 );
    capturetable->horizontalHeader()->setLabel( capturetable->numCols() - 1, tr( "Destination" ) );
    capturetable->setNumCols( capturetable->numCols() + 1 );
    capturetable->horizontalHeader()->setLabel( capturetable->numCols() - 1, tr( "Protocol" ) );
    capturetable->setNumCols( capturetable->numCols() + 1 );
    capturetable->horizontalHeader()->setLabel( capturetable->numCols() - 1, tr( "Info" ) );
    capturetable->setNumRows( 0 );
    capturetable->setNumCols( 5 );
    capturetable->setReadOnly( TRUE );

    capturePageLayout->addWidget( capturetable, 1, 0 );
    functionWidgetStack->addWidget( capturePage, 2 );

    firstFormLayout->addWidget( functionWidgetStack, 0, 0 );

    // actions
    fileOpenAction = new QAction( this, "fileOpenAction" );
    fileOpenAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_fileopen.png" ) ) );
    fileSaveAction = new QAction( this, "fileSaveAction" );
    fileSaveAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_filesave.png" ) ) );
    fileSaveAsAction = new QAction( this, "fileSaveAsAction" );
    fileExitAction = new QAction( this, "fileExitAction" );
    helpAboutAction = new QAction( this, "helpAboutAction" );
    functionActionGroup = new QActionGroup( this, "functionActionGroup" );
    functionActionGroup->setUsesDropDown( FALSE );
    generateAction = new QAction( functionActionGroup, "generateAction" );
    generateAction->setToggleAction( TRUE );
    generateAction->setOn( TRUE );
    generateAction->setEnabled( TRUE );
    generateAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_textsmaller.png" ) ) );
    replayAction = new QAction( functionActionGroup, "replayAction" );
    replayAction->setToggleAction( TRUE );
    replayAction->setOn( FALSE );
    replayAction->setEnabled( TRUE );
    replayAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_textlarger.png" ) ) );
    captureAction = new QAction( functionActionGroup, "captureAction" );
    captureAction->setToggleAction( TRUE );
    captureAction->setOn( FALSE );
    captureAction->setEnabled( TRUE );
    captureAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_textfont.png" ) ) );
    Action = new QAction( this, "Action" );
    Action_2 = new QAction( this, "Action_2" );
    Action_3 = new QAction( this, "Action_3" );
    Action_4 = new QAction( this, "Action_4" );
    Action_5 = new QAction( this, "Action_5" );
    Action_6 = new QAction( this, "Action_6" );
    Action_7 = new QAction( this, "Action_7" );
    Action_8 = new QAction( this, "Action_8" );
    functionnew_itemAction = new QAction( this, "functionnew_itemAction" );
    separatornew_itemAction = new QAction( this, "separatornew_itemAction" );
    Action_9 = new QAction( this, "Action_9" );
    Action_10 = new QAction( this, "Action_10" );
    separatornew_itemAction_2 = new QAction( this, "separatornew_itemAction_2" );


    // toolbars
    toolBar = new QToolBar( QString(""), this, DockTop ); 

    toolBar->setGeometry( QRect( 0, 0, 182, 29 ) );
    fileOpenAction->addTo( toolBar );
    fileSaveAction->addTo( toolBar );
    fileSaveAsAction->addTo( toolBar );
    fileExitAction->addTo( toolBar );
    toolBar->addSeparator();
    generateAction->addTo( toolBar );
    replayAction->addTo( toolBar );
    captureAction->addTo( toolBar );
    toolBar->addSeparator();
    helpAboutAction->addTo( toolBar );


    // menubar
    MenuBar = new QMenuBar( this, "MenuBar" );


    fileMenu = new QPopupMenu( this );
    fileOpenAction->addTo( fileMenu );
    fileSaveAction->addTo( fileMenu );
    fileSaveAsAction->addTo( fileMenu );
    fileMenu->insertSeparator();
    fileExitAction->addTo( fileMenu );
    MenuBar->insertItem( QString(""), fileMenu, 1 );

    Function = new QPopupMenu( this );
    generateAction->addTo( Function );
    replayAction->addTo( Function );
    captureAction->addTo( Function );
    MenuBar->insertItem( QString(""), Function, 2 );

    helpMenu = new QPopupMenu( this );
    helpMenu->insertSeparator();
    helpAboutAction->addTo( helpMenu );
    MenuBar->insertItem( QString(""), helpMenu, 3 );

    MenuBar->insertSeparator( 4 );

    languageChange();
    resize( QSize(671, 587).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( fileOpenAction, SIGNAL( activated() ), this, SLOT( fileOpen() ) );
    connect( fileSaveAction, SIGNAL( activated() ), this, SLOT( fileSave() ) );
    connect( fileSaveAsAction, SIGNAL( activated() ), this, SLOT( fileSaveAs() ) );
    connect( fileExitAction, SIGNAL( activated() ), this, SLOT( fileExit() ) );
    connect( helpAboutAction, SIGNAL( activated() ), this, SLOT( helpAbout() ) );
    connect( acceptPushButton, SIGNAL( clicked() ), this, SLOT( ModeChange() ) );
    connect( cancelPushButton, SIGNAL( clicked() ), this, SLOT( close() ) );
    connect( sendPushButton, SIGNAL( clicked() ), this, SLOT( showReplay() ) );
    connect( browsePushButton1, SIGNAL( clicked() ), this, SLOT( fileOpen() ) );
    connect( ExitpushButton, SIGNAL( clicked() ), this, SLOT( close() ) );
    connect( fileLineEdit1, SIGNAL( textChanged(const QString&) ), this, SLOT( fileNameChanged(const QString&) ) );
    connect( patturnComboBox, SIGNAL( activated(const QString&) ), this, SLOT( ChangeMode() ) );
    connect( protocolComboBox, SIGNAL( activated(const QString&) ), this, SLOT( ChangeMode() ) );
    connect( showButton, SIGNAL( clicked() ), this, SLOT( ShowCapture() ) );
    connect( fileLineEdit2, SIGNAL( textChanged(const QString&) ), this, SLOT( fileNameChanged(const QString&) ) );
    connect( browsePushButton2, SIGNAL( clicked() ), this, SLOT( fileOpen2() ) );
    connect( tableResult, SIGNAL( clicked(int,int,int,const QPoint&) ), this, SLOT( clickTable(int,int) ) );
    connect( startButton, SIGNAL( clicked() ), this, SLOT( startCapture() ) );
    connect( functionActionGroup, SIGNAL( selected(QAction*) ), this, SLOT( changeFunction(QAction*) ) );
    connect( showButton_2, SIGNAL( clicked() ), this, SLOT( displayshow() ) );
    connect( ButtonExit, SIGNAL( clicked() ), this, SLOT( close() ) );

    // tab order
    setTabOrder( fileLineEdit1, browsePushButton1 );
    setTabOrder( browsePushButton1, sendPushButton );
    setTabOrder( sendPushButton, cancelPushButton );
    setTabOrder( cancelPushButton, templateRadioButton );
    setTabOrder( templateRadioButton, acceptPushButton );
}

/*
 *  Destroys the object and frees any allocated resources
 */
firstForm::~firstForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void firstForm::languageChange()
{
    setCaption( tr( "ISAG GEN" ) );
    generatePacketButtonGroup->setTitle( tr( "Generate Pakcet Mode" ) );
    templateRadioButton->setText( tr( "Template Packet" ) );
    configFileRadioButton->setText( tr( "Configuration File" ) );
    acceptPushButton->setText( tr( "Accept" ) );
    ExitpushButton->setText( tr( "Exit" ) );
    replayGroupBox->setTitle( tr( "Replay Packet" ) );
    fileLineEdit1->setText( QString::null );
    browsePushButton1->setText( tr( "Selecte File" ) );
    buttonGroup3->setTitle( tr( "Option Replay" ) );
    textLabel1->setText( tr( "Pattern:" ) );
    patturnComboBox->clear();
    patturnComboBox->insertItem( tr( "Select Patern here" ) );
    patturnComboBox->insertItem( tr( "SourceIP" ) );
    patturnComboBox->insertItem( tr( "DestinationIP" ) );
    patturnComboBox->insertItem( tr( "Source&DestinationIP" ) );
    patturnComboBox->insertItem( tr( "Source||DestinationIP" ) );
    patturnComboBox->insertItem( tr( "ListofPacketNumbers" ) );
    patturnComboBox->insertItem( tr( "Protocol" ) );
    textLabel1_2_2->setText( tr( "Interface" ) );
    lineEdit_Replay_inf->setText( tr( "eth0" ) );
    iptextLabel->setText( tr( "IP:    " ) );
    ipLineEdit->setText( tr( "161.246.5.12" ) );
    textLabel2->setText( tr( "List Packet Number:" ) );
    listNumberLineEdit->setText( tr( "1-50" ) );
    textLabel3_3->setText( tr( "Type of Protocols:" ) );
    protocolComboBox->clear();
    protocolComboBox->insertItem( tr( "Select  Here" ) );
    protocolComboBox->insertItem( tr( "TCP" ) );
    protocolComboBox->insertItem( tr( "UDP" ) );
    protocolComboBox->insertItem( tr( "ARP" ) );
    protocolComboBox->insertItem( tr( "ICMP" ) );
    buttonGroup4->setTitle( tr( "Order" ) );
    matchRadioButton->setText( tr( "Match" ) );
    nMatchRadioButton->setText( tr( "Not Match" ) );
    changeIPGroup->setTitle( tr( "Change IP" ) );
    sIPLineEdit->setText( tr( "161.246.5.12" ) );
    dIPLineEdit->setText( tr( "161.246.5.6" ) );
    textLabel3_2->setText( tr( "Destination  IP:  " ) );
    textLabel3->setText( tr( "Source IP:    " ) );
    buttonGroup2->setTitle( tr( "Speed" ) );
    normalRadioButton->setText( tr( "Normal" ) );
    fastRadioButton->setText( tr( "Fast" ) );
    sendPushButton->setText( tr( "Send" ) );
    showButton_2->setText( tr( "Show" ) );
    cancelPushButton->setText( tr( "Exit" ) );
    tableResult->horizontalHeader()->setLabel( 0, tr( "Time" ) );
    tableResult->horizontalHeader()->setLabel( 1, tr( "Source            " ) );
    tableResult->horizontalHeader()->setLabel( 2, tr( "Destination             " ) );
    tableResult->horizontalHeader()->setLabel( 3, tr( "Protocol" ) );
    tableResult->horizontalHeader()->setLabel( 4, tr( "Info                    " ) );
    groupBox35->setTitle( tr( "Option Capture" ) );
    showButton->setText( tr( "Show" ) );
    ButtonExit->setText( tr( "Exit" ) );
    fileLineEdit2->setText( QString::null );
    browsePushButton2->setText( tr( "Selecte File" ) );
    textLabel1_2->setText( tr( "Interface:" ) );
    lineEdit_Capture_inf->setText( tr( "eth0" ) );
    textLabel2_2->setText( tr( "Start Capture:" ) );
    startButton->setText( tr( "Start" ) );
    capturetable->horizontalHeader()->setLabel( 0, tr( "Time" ) );
    capturetable->horizontalHeader()->setLabel( 1, tr( "Source" ) );
    capturetable->horizontalHeader()->setLabel( 2, tr( "Destination" ) );
    capturetable->horizontalHeader()->setLabel( 3, tr( "Protocol" ) );
    capturetable->horizontalHeader()->setLabel( 4, tr( "Info" ) );
    fileOpenAction->setText( tr( "Open" ) );
    fileOpenAction->setMenuText( tr( "&Open..." ) );
    fileOpenAction->setAccel( tr( "Ctrl+O" ) );
    fileSaveAction->setText( tr( "Save" ) );
    fileSaveAction->setMenuText( tr( "&Save" ) );
    fileSaveAction->setAccel( tr( "Ctrl+S" ) );
    fileSaveAsAction->setText( tr( "Save As" ) );
    fileSaveAsAction->setMenuText( tr( "Save &As..." ) );
    fileSaveAsAction->setAccel( QString::null );
    fileExitAction->setText( tr( "Exit" ) );
    fileExitAction->setMenuText( tr( "E&xit" ) );
    fileExitAction->setAccel( QString::null );
    helpAboutAction->setText( tr( "About" ) );
    helpAboutAction->setMenuText( tr( "&About" ) );
    helpAboutAction->setAccel( QString::null );
    functionActionGroup->setText( tr( "Function" ) );
    generateAction->setText( tr( "Generate Function" ) );
    generateAction->setMenuText( tr( "&Generate Function" ) );
    generateAction->setToolTip( tr( "Generate Function(Ctrl+G)" ) );
    generateAction->setAccel( tr( "Ctrl+G" ) );
    replayAction->setText( tr( "&Replay Function" ) );
    replayAction->setMenuText( tr( "&Replay Function" ) );
    replayAction->setToolTip( tr( "Replay Function(Ctrl+R)" ) );
    replayAction->setWhatsThis( QString::null );
    replayAction->setAccel( tr( "Ctrl+R" ) );
    captureAction->setText( tr( "&Capture Function" ) );
    captureAction->setMenuText( tr( "&Capture Function" ) );
    captureAction->setToolTip( tr( "Capture Function(Ctrl+c)" ) );
    captureAction->setAccel( tr( "Ctrl+C" ) );
    Action->setText( tr( "Unnamed" ) );
    Action_2->setText( tr( "Unnamed" ) );
    Action_3->setText( tr( "Unnamed" ) );
    Action_4->setText( tr( "Unnamed" ) );
    Action_5->setText( tr( "Unnamed" ) );
    Action_6->setText( tr( "Unnamed" ) );
    Action_7->setText( tr( "Unnamed" ) );
    Action_8->setText( tr( "Unnamed" ) );
    functionnew_itemAction->setText( tr( "new item" ) );
    functionnew_itemAction->setMenuText( tr( "new item" ) );
    separatornew_itemAction->setText( tr( "new item" ) );
    separatornew_itemAction->setMenuText( tr( "new item" ) );
    Action_9->setText( tr( "Unnamed" ) );
    Action_10->setText( tr( "Unnamed" ) );
    separatornew_itemAction_2->setText( tr( "new item" ) );
    separatornew_itemAction_2->setMenuText( tr( "new item" ) );
    toolBar->setLabel( tr( "Tools" ) );
    if (MenuBar->findItem(1))
        MenuBar->findItem(1)->setText( tr( "&File" ) );
    if (MenuBar->findItem(2))
        MenuBar->findItem(2)->setText( tr( "Function" ) );
    if (MenuBar->findItem(3))
        MenuBar->findItem(3)->setText( tr( "&Help" ) );
}

