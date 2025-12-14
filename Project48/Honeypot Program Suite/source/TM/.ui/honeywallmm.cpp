/****************************************************************************
** Form implementation generated from reading ui file 'honeywallmm.ui'
**
** Created: Wed Feb 8 12:50:38 2006
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.5   edited Aug 31 12:13 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "honeywallmm.h"

#include <qvariant.h>
#include <qprogressdialog.h>
#include <qmessagebox.h>
#include <qlistbox.h>
#include <qstring.h>
#include <qdialog.h>
#include <qlabel.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <qpushbutton.h>
#include <qsplitter.h>
#include <qframe.h>
#include <qtabwidget.h>
#include <qwidget.h>
#include <qcheckbox.h>
#include <qspinbox.h>
#include <qlineedit.h>
#include <qcombobox.h>
#include <qtable.h>
#include <qgroupbox.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qimage.h>
#include <qpixmap.h>

#include "connectdatabase.h"
#include "../honeywallmm.ui.h"
/*
 *  Constructs a HoneywallMM as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
HoneywallMM::HoneywallMM( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "HoneywallMM" );

    splitter3 = new QSplitter( this, "splitter3" );
    splitter3->setGeometry( QRect( 200, 16, 210, 60 ) );
    splitter3->setOrientation( QSplitter::Horizontal );

    frame9 = new QFrame( splitter3, "frame9" );
    frame9->setFrameShape( QFrame::StyledPanel );
    frame9->setFrameShadow( QFrame::Raised );

    configPushButton = new QPushButton( frame9, "configPushButton" );
    configPushButton->setGeometry( QRect( 4, 4, 57, 50 ) );
    configPushButton->setFocusPolicy( QPushButton::NoFocus );
    configPushButton->setPixmap( QPixmap::fromMimeSource( "kfloppy.png" ) );

    frame9_2 = new QFrame( splitter3, "frame9_2" );
    frame9_2->setFrameShape( QFrame::StyledPanel );
    frame9_2->setFrameShadow( QFrame::Raised );

    refreshPushButton = new QPushButton( frame9_2, "refreshPushButton" );
    refreshPushButton->setGeometry( QRect( 4, 4, 57, 50 ) );
    refreshPushButton->setFocusPolicy( QPushButton::NoFocus );
    refreshPushButton->setPixmap( QPixmap::fromMimeSource( "reload.png" ) );

    frame8_3 = new QFrame( splitter3, "frame8_3" );
    frame8_3->setFrameShape( QFrame::StyledPanel );
    frame8_3->setFrameShadow( QFrame::Raised );

    aboutPushButton = new QPushButton( frame8_3, "aboutPushButton" );
    aboutPushButton->setGeometry( QRect( 5, 5, 57, 49 ) );
    aboutPushButton->setFocusPolicy( QPushButton::NoFocus );
    aboutPushButton->setPixmap( QPixmap::fromMimeSource( "windows_users.png" ) );

    tabPage = new QTabWidget( this, "tabPage" );
    tabPage->setGeometry( QRect( 11, 90, 610, 560 ) );

    statusPage = new QWidget( tabPage, "statusPage" );

    line3 = new QFrame( statusPage, "line3" );
    line3->setGeometry( QRect( 1, 224, 606, 16 ) );
    line3->setFrameShape( QFrame::HLine );
    line3->setFrameShadow( QFrame::Sunken );
    line3->setFrameShape( QFrame::HLine );

    pixmapLabel2 = new QLabel( statusPage, "pixmapLabel2" );
    pixmapLabel2->setGeometry( QRect( 53, 366, 59, 50 ) );
    pixmapLabel2->setPixmap( QPixmap::fromMimeSource( "window_list.png" ) );
    pixmapLabel2->setScaledContents( TRUE );

    textLabel17 = new QLabel( statusPage, "textLabel17" );
    textLabel17->setGeometry( QRect( 53, 311, 59, 40 ) );

    frame20 = new QFrame( statusPage, "frame20" );
    frame20->setGeometry( QRect( 138, 282, 430, 171 ) );
    frame20->setFrameShape( QFrame::StyledPanel );
    frame20->setFrameShadow( QFrame::Raised );

    textLabel12_3 = new QLabel( frame20, "textLabel12_3" );
    textLabel12_3->setGeometry( QRect( 203, 19, 54, 22 ) );

    textLabel13_3_2 = new QLabel( frame20, "textLabel13_3_2" );
    textLabel13_3_2->setGeometry( QRect( 116, 19, 58, 22 ) );

    textLabel13_3 = new QLabel( frame20, "textLabel13_3" );
    textLabel13_3->setGeometry( QRect( 14, 19, 96, 22 ) );

    QWidget* privateLayoutWidget = new QWidget( frame20, "layout25" );
    privateLayoutWidget->setGeometry( QRect( 24, 37, 250, 110 ) );
    layout25 = new QGridLayout( privateLayoutWidget, 1, 1, 11, 6, "layout25"); 

    cage3Status = new QLabel( privateLayoutWidget, "cage3Status" );
    QFont cage3Status_font(  cage3Status->font() );
    cage3Status_font.setPointSize( 9 );
    cage3Status->setFont( cage3Status_font ); 
    cage3Status->setAlignment( int( QLabel::WordBreak | QLabel::AlignCenter ) );

    layout25->addWidget( cage3Status, 2, 2 );

    cage2Status = new QLabel( privateLayoutWidget, "cage2Status" );
    QFont cage2Status_font(  cage2Status->font() );
    cage2Status_font.setPointSize( 9 );
    cage2Status->setFont( cage2Status_font ); 
    cage2Status->setAlignment( int( QLabel::WordBreak | QLabel::AlignCenter ) );

    layout25->addWidget( cage2Status, 1, 2 );

    nameCage3 = new QLabel( privateLayoutWidget, "nameCage3" );
    QFont nameCage3_font(  nameCage3->font() );
    nameCage3_font.setPointSize( 8 );
    nameCage3->setFont( nameCage3_font ); 
    nameCage3->setAlignment( int( QLabel::WordBreak | QLabel::AlignCenter ) );

    layout25->addWidget( nameCage3, 2, 1 );

    hostNametextLabel1 = new QLabel( privateLayoutWidget, "hostNametextLabel1" );
    QFont hostNametextLabel1_font(  hostNametextLabel1->font() );
    hostNametextLabel1_font.setPointSize( 8 );
    hostNametextLabel1->setFont( hostNametextLabel1_font ); 
    hostNametextLabel1->setAlignment( int( QLabel::WordBreak | QLabel::AlignCenter ) );

    layout25->addWidget( hostNametextLabel1, 0, 0 );

    cage1Status = new QLabel( privateLayoutWidget, "cage1Status" );
    QFont cage1Status_font(  cage1Status->font() );
    cage1Status_font.setPointSize( 9 );
    cage1Status->setFont( cage1Status_font ); 
    cage1Status->setAlignment( int( QLabel::WordBreak | QLabel::AlignCenter ) );

    layout25->addWidget( cage1Status, 0, 2 );

    nameCage2 = new QLabel( privateLayoutWidget, "nameCage2" );
    QFont nameCage2_font(  nameCage2->font() );
    nameCage2_font.setPointSize( 8 );
    nameCage2->setFont( nameCage2_font ); 
    nameCage2->setAlignment( int( QLabel::WordBreak | QLabel::AlignCenter ) );

    layout25->addWidget( nameCage2, 1, 1 );

    hostNametextLabel3 = new QLabel( privateLayoutWidget, "hostNametextLabel3" );
    QFont hostNametextLabel3_font(  hostNametextLabel3->font() );
    hostNametextLabel3_font.setPointSize( 8 );
    hostNametextLabel3->setFont( hostNametextLabel3_font ); 
    hostNametextLabel3->setAlignment( int( QLabel::WordBreak | QLabel::AlignCenter ) );

    layout25->addWidget( hostNametextLabel3, 2, 0 );

    hostNametextLabel2 = new QLabel( privateLayoutWidget, "hostNametextLabel2" );
    QFont hostNametextLabel2_font(  hostNametextLabel2->font() );
    hostNametextLabel2_font.setPointSize( 8 );
    hostNametextLabel2->setFont( hostNametextLabel2_font ); 
    hostNametextLabel2->setAlignment( int( QLabel::WordBreak | QLabel::AlignCenter ) );

    layout25->addWidget( hostNametextLabel2, 1, 0 );

    nameCage1 = new QLabel( privateLayoutWidget, "nameCage1" );
    QFont nameCage1_font(  nameCage1->font() );
    nameCage1_font.setPointSize( 8 );
    nameCage1->setFont( nameCage1_font ); 
    nameCage1->setAlignment( int( QLabel::WordBreak | QLabel::AlignCenter ) );

    layout25->addWidget( nameCage1, 0, 1 );

    cage1SuspendButton = new QPushButton( frame20, "cage1SuspendButton" );
    cage1SuspendButton->setGeometry( QRect( 347, 45, 65, 27 ) );

    cage3StartButton = new QPushButton( frame20, "cage3StartButton" );
    cage3StartButton->setGeometry( QRect( 273, 111, 68, 27 ) );

    cage3SuspendButton = new QPushButton( frame20, "cage3SuspendButton" );
    cage3SuspendButton->setGeometry( QRect( 347, 111, 65, 27 ) );

    cage2SuspendButton = new QPushButton( frame20, "cage2SuspendButton" );
    cage2SuspendButton->setGeometry( QRect( 347, 78, 65, 27 ) );

    cage1StartButton = new QPushButton( frame20, "cage1StartButton" );
    cage1StartButton->setGeometry( QRect( 273, 45, 68, 27 ) );

    cage2StartButton = new QPushButton( frame20, "cage2StartButton" );
    cage2StartButton->setGeometry( QRect( 273, 78, 68, 27 ) );

    textLabel17_2 = new QLabel( statusPage, "textLabel17_2" );
    textLabel17_2->setGeometry( QRect( 48, 64, 116, 27 ) );

    pixmapLabel1 = new QLabel( statusPage, "pixmapLabel1" );
    pixmapLabel1->setGeometry( QRect( 78, 97, 50, 48 ) );
    pixmapLabel1->setPixmap( QPixmap::fromMimeSource( "find.png" ) );
    pixmapLabel1->setScaledContents( TRUE );

    frame18 = new QFrame( statusPage, "frame18" );
    frame18->setGeometry( QRect( 197, 33, 315, 160 ) );
    frame18->setFrameShape( QFrame::StyledPanel );
    frame18->setFrameShadow( QFrame::Raised );

    QWidget* privateLayoutWidget_2 = new QWidget( frame18, "layout28" );
    privateLayoutWidget_2->setGeometry( QRect( 50, 40, 243, 60 ) );
    layout28 = new QVBoxLayout( privateLayoutWidget_2, 11, 6, "layout28"); 

    layout27 = new QGridLayout( 0, 1, 1, 0, 6, "layout27"); 

    textLabel16 = new QLabel( privateLayoutWidget_2, "textLabel16" );

    layout27->addWidget( textLabel16, 0, 1 );

    textLabel12 = new QLabel( privateLayoutWidget_2, "textLabel12" );

    layout27->addWidget( textLabel12, 0, 2 );

    textLabel13 = new QLabel( privateLayoutWidget_2, "textLabel13" );

    layout27->addWidget( textLabel13, 0, 0 );
    layout28->addLayout( layout27 );

    layout26 = new QGridLayout( 0, 1, 1, 0, 6, "layout26"); 

    hostnameLabel = new QLabel( privateLayoutWidget_2, "hostnameLabel" );
    QFont hostnameLabel_font(  hostnameLabel->font() );
    hostnameLabel_font.setPointSize( 8 );
    hostnameLabel->setFont( hostnameLabel_font ); 
    hostnameLabel->setAlignment( int( QLabel::WordBreak | QLabel::AlignCenter ) );

    layout26->addWidget( hostnameLabel, 0, 0 );

    textLabel15_3 = new QLabel( privateLayoutWidget_2, "textLabel15_3" );

    layout26->addWidget( textLabel15_3, 0, 1 );

    h1Status = new QLabel( privateLayoutWidget_2, "h1Status" );
    QFont h1Status_font(  h1Status->font() );
    h1Status_font.setPointSize( 8 );
    h1Status->setFont( h1Status_font ); 
    h1Status->setAlignment( int( QLabel::WordBreak | QLabel::AlignCenter ) );

    layout26->addWidget( h1Status, 0, 2 );
    layout28->addLayout( layout26 );

    h1StopButton = new QPushButton( frame18, "h1StopButton" );
    h1StopButton->setGeometry( QRect( 183, 106, 68, 30 ) );

    h1StartButton = new QPushButton( frame18, "h1StartButton" );
    h1StartButton->setGeometry( QRect( 93, 106, 68, 30 ) );
    tabPage->insertTab( statusPage, QString::fromLatin1("") );

    rulePage = new QWidget( tabPage, "rulePage" );

    RuleChoiceListbox = new QListBox( rulePage, "RuleChoiceListbox" );
    RuleChoiceListbox->setGeometry( QRect( 12, 42, 200, 456 ) );

    QWidget* privateLayoutWidget_3 = new QWidget( rulePage, "layout66" );
    privateLayoutWidget_3->setGeometry( QRect( 230, 43, 49, 456 ) );
    layout66 = new QVBoxLayout( privateLayoutWidget_3, 11, 6, "layout66"); 
    spacer29 = new QSpacerItem( 20, 161, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout66->addItem( spacer29 );

    layout48 = new QVBoxLayout( 0, 0, 6, "layout48"); 

    SelectRuleButton = new QPushButton( privateLayoutWidget_3, "SelectRuleButton" );
    SelectRuleButton->setPixmap( QPixmap::fromMimeSource( "next-sail.png" ) );
    layout48->addWidget( SelectRuleButton );

    UnselectRuleButton = new QPushButton( privateLayoutWidget_3, "UnselectRuleButton" );
    UnselectRuleButton->setPixmap( QPixmap::fromMimeSource( "previos-sail.png" ) );
    layout48->addWidget( UnselectRuleButton );
    layout66->addLayout( layout48 );
    spacer27_2 = new QSpacerItem( 30, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout66->addItem( spacer27_2 );
    spacer30 = new QSpacerItem( 20, 191, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout66->addItem( spacer30 );

    selectRuleListbox = new QListBox( rulePage, "selectRuleListbox" );
    selectRuleListbox->setGeometry( QRect( 297, 42, 200, 456 ) );

    QWidget* privateLayoutWidget_4 = new QWidget( rulePage, "layout62" );
    privateLayoutWidget_4->setGeometry( QRect( 503, 42, 73, 456 ) );
    layout62 = new QVBoxLayout( privateLayoutWidget_4, 11, 6, "layout62"); 

    layout47 = new QVBoxLayout( 0, 0, 6, "layout47"); 

    RuleOkButton = new QPushButton( privateLayoutWidget_4, "RuleOkButton" );
    layout47->addWidget( RuleOkButton );

    RuleCancleButton = new QPushButton( privateLayoutWidget_4, "RuleCancleButton" );
    layout47->addWidget( RuleCancleButton );
    layout62->addLayout( layout47 );
    spacer26_2 = new QSpacerItem( 50, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout62->addItem( spacer26_2 );

    textLabel1_3 = new QLabel( rulePage, "textLabel1_3" );
    textLabel1_3->setGeometry( QRect( 13, 13, 65, 20 ) );

    textLabel2_4 = new QLabel( rulePage, "textLabel2_4" );
    textLabel2_4->setGeometry( QRect( 297, 13, 65, 20 ) );
    tabPage->insertTab( rulePage, QString::fromLatin1("") );

    managePage = new QWidget( tabPage, "managePage" );

    frame4 = new QFrame( managePage, "frame4" );
    frame4->setGeometry( QRect( 60, 240, 490, 275 ) );
    frame4->setFrameShape( QFrame::StyledPanel );
    frame4->setFrameShadow( QFrame::Raised );
    frame4Layout = new QGridLayout( frame4, 1, 1, 11, 6, "frame4Layout"); 

    layout21 = new QHBoxLayout( 0, 0, 6, "layout21"); 

    layout19 = new QVBoxLayout( 0, 0, 6, "layout19"); 

    numCheck = new QCheckBox( frame4, "numCheck" );
    layout19->addWidget( numCheck );

    groupCheck = new QCheckBox( frame4, "groupCheck" );
    layout19->addWidget( groupCheck );

    ownCheck = new QCheckBox( frame4, "ownCheck" );
    layout19->addWidget( ownCheck );

    passCheck = new QCheckBox( frame4, "passCheck" );
    layout19->addWidget( passCheck );

    modeCheck = new QCheckBox( frame4, "modeCheck" );
    layout19->addWidget( modeCheck );
    layout21->addLayout( layout19 );

    layout20 = new QVBoxLayout( 0, 0, 6, "layout20"); 

    numUser = new QSpinBox( frame4, "numUser" );
    layout20->addWidget( numUser );

    groupRoot = new QSpinBox( frame4, "groupRoot" );
    layout20->addWidget( groupRoot );

    ownerPass = new QLineEdit( frame4, "ownerPass" );
    layout20->addWidget( ownerPass );

    passCh = new QComboBox( FALSE, frame4, "passCh" );
    layout20->addWidget( passCh );

    modePass = new QComboBox( FALSE, frame4, "modePass" );
    layout20->addWidget( modePass );
    layout21->addLayout( layout20 );

    frame4Layout->addLayout( layout21, 1, 0 );

    layout279 = new QVBoxLayout( 0, 0, 6, "layout279"); 

    saveConfigButton = new QPushButton( frame4, "saveConfigButton" );
    layout279->addWidget( saveConfigButton );

    resetConfigButton = new QPushButton( frame4, "resetConfigButton" );
    layout279->addWidget( resetConfigButton );

    frame4Layout->addLayout( layout279, 2, 0 );

    textLabel5 = new QLabel( frame4, "textLabel5" );
    QFont textLabel5_font(  textLabel5->font() );
    textLabel5_font.setBold( TRUE );
    textLabel5_font.setUnderline( TRUE );
    textLabel5->setFont( textLabel5_font ); 
    textLabel5->setAlignment( int( QLabel::AlignCenter ) );

    frame4Layout->addWidget( textLabel5, 0, 0 );

    frame24 = new QFrame( managePage, "frame24" );
    frame24->setGeometry( QRect( 60, 10, 490, 220 ) );
    frame24->setFrameShape( QFrame::StyledPanel );
    frame24->setFrameShadow( QFrame::Raised );

    textLabel3 = new QLabel( frame24, "textLabel3" );
    textLabel3->setGeometry( QRect( 233, 62, 20, 20 ) );
    QFont textLabel3_font(  textLabel3->font() );
    textLabel3->setFont( textLabel3_font ); 

    pathCage = new QLineEdit( frame24, "pathCage" );
    pathCage->setGeometry( QRect( 83, 100, 140, 26 ) );
    QFont pathCage_font(  pathCage->font() );
    pathCage_font.setPointSize( 9 );
    pathCage->setFont( pathCage_font ); 

    PushButtonNext = new QPushButton( frame24, "PushButtonNext" );
    PushButtonNext->setGeometry( QRect( 247, 141, 114, 28 ) );

    PushButtonPrev = new QPushButton( frame24, "PushButtonPrev" );
    PushButtonPrev->setGeometry( QRect( 129, 141, 112, 28 ) );

    PushButtonLast = new QPushButton( frame24, "PushButtonLast" );
    PushButtonLast->setGeometry( QRect( 367, 141, 112, 28 ) );

    PushButtonFirst = new QPushButton( frame24, "PushButtonFirst" );
    PushButtonFirst->setGeometry( QRect( 11, 141, 112, 28 ) );

    textLabel4 = new QLabel( frame24, "textLabel4" );
    textLabel4->setGeometry( QRect( 233, 100, 90, 28 ) );
    QFont textLabel4_font(  textLabel4->font() );
    textLabel4->setFont( textLabel4_font ); 

    textLabel1 = new QLabel( frame24, "textLabel1" );
    textLabel1->setGeometry( QRect( 34, 61, 46, 20 ) );
    QFont textLabel1_font(  textLabel1->font() );
    textLabel1->setFont( textLabel1_font ); 

    textLabel2 = new QLabel( frame24, "textLabel2" );
    textLabel2->setGeometry( QRect( 33, 104, 35, 20 ) );
    QFont textLabel2_font(  textLabel2->font() );
    textLabel2->setFont( textLabel2_font ); 

    nameCage = new QLineEdit( frame24, "nameCage" );
    nameCage->setGeometry( QRect( 84, 58, 140, 26 ) );
    QFont nameCage_font(  nameCage->font() );
    nameCage_font.setPointSize( 9 );
    nameCage->setFont( nameCage_font ); 

    ipCage = new QLineEdit( frame24, "ipCage" );
    ipCage->setGeometry( QRect( 264, 58, 190, 26 ) );
    QFont ipCage_font(  ipCage->font() );
    ipCage_font.setPointSize( 9 );
    ipCage->setFont( ipCage_font ); 

    textLabel6 = new QLabel( frame24, "textLabel6" );
    textLabel6->setGeometry( QRect( 177, 18, 150, 20 ) );
    QFont textLabel6_font(  textLabel6->font() );
    textLabel6_font.setBold( TRUE );
    textLabel6_font.setUnderline( TRUE );
    textLabel6->setFont( textLabel6_font ); 

    PushButtonDelete = new QPushButton( frame24, "PushButtonDelete" );
    PushButtonDelete->setGeometry( QRect( 330, 175, 150, 28 ) );

    PushButtonClear = new QPushButton( frame24, "PushButtonClear" );
    PushButtonClear->setGeometry( QRect( 10, 175, 150, 28 ) );

    PushButtonInsert = new QPushButton( frame24, "PushButtonInsert" );
    PushButtonInsert->setGeometry( QRect( 171, 175, 150, 28 ) );

    hostnamecomboBox = new QComboBox( FALSE, frame24, "hostnamecomboBox" );
    hostnamecomboBox->setEnabled( TRUE );
    hostnamecomboBox->setGeometry( QRect( 325, 100, 130, 28 ) );
    QFont hostnamecomboBox_font(  hostnamecomboBox->font() );
    hostnamecomboBox_font.setPointSize( 9 );
    hostnamecomboBox->setFont( hostnamecomboBox_font ); 
    hostnamecomboBox->setAcceptDrops( FALSE );
    hostnamecomboBox->setEditable( FALSE );
    hostnamecomboBox->setDuplicatesEnabled( FALSE );
    tabPage->insertTab( managePage, QString::fromLatin1("") );

    controlPage = new QWidget( tabPage, "controlPage" );

    textLabel1_2 = new QLabel( controlPage, "textLabel1_2" );
    textLabel1_2->setGeometry( QRect( 37, 18, 150, 20 ) );
    QFont textLabel1_2_font(  textLabel1_2->font() );
    textLabel1_2_font.setBold( TRUE );
    textLabel1_2->setFont( textLabel1_2_font ); 

    cageTable = new QTable( controlPage, "cageTable" );
    cageTable->setNumCols( cageTable->numCols() + 1 );
    cageTable->horizontalHeader()->setLabel( cageTable->numCols() - 1, tr( "Name" ) );
    cageTable->setNumCols( cageTable->numCols() + 1 );
    cageTable->horizontalHeader()->setLabel( cageTable->numCols() - 1, tr( "IP" ) );
    cageTable->setNumCols( cageTable->numCols() + 1 );
    cageTable->horizontalHeader()->setLabel( cageTable->numCols() - 1, tr( "Path" ) );
    cageTable->setNumCols( cageTable->numCols() + 1 );
    cageTable->horizontalHeader()->setLabel( cageTable->numCols() - 1, tr( "Hostname" ) );
    cageTable->setNumCols( cageTable->numCols() + 1 );
    cageTable->horizontalHeader()->setLabel( cageTable->numCols() - 1, tr( "State" ) );
    cageTable->setNumCols( cageTable->numCols() + 1 );
    cageTable->horizontalHeader()->setLabel( cageTable->numCols() - 1, tr( "Current User" ) );
    cageTable->setNumCols( cageTable->numCols() + 1 );
    cageTable->horizontalHeader()->setLabel( cageTable->numCols() - 1, tr( "Limit User" ) );
    cageTable->setNumCols( cageTable->numCols() + 1 );
    cageTable->horizontalHeader()->setLabel( cageTable->numCols() - 1, tr( "User of group root" ) );
    cageTable->setNumCols( cageTable->numCols() + 1 );
    cageTable->horizontalHeader()->setLabel( cageTable->numCols() - 1, tr( "Limit of group root" ) );
    cageTable->setGeometry( QRect( 20, 50, 570, 470 ) );
    QFont cageTable_font(  cageTable->font() );
    cageTable_font.setPointSize( 9 );
    cageTable->setFont( cageTable_font ); 
    cageTable->setNumRows( 0 );
    cageTable->setNumCols( 9 );
    cageTable->setReadOnly( TRUE );
    tabPage->insertTab( controlPage, QString::fromLatin1("") );

    eventPage = new QWidget( tabPage, "eventPage" );

    snort_inline_log = new QGroupBox( eventPage, "snort_inline_log" );
    snort_inline_log->setEnabled( TRUE );
    snort_inline_log->setGeometry( QRect( 17, 58, 550, 430 ) );

    QWidget* privateLayoutWidget_5 = new QWidget( snort_inline_log, "layout31_2" );
    privateLayoutWidget_5->setGeometry( QRect( 10, 40, 520, 380 ) );
    layout31_2 = new QGridLayout( privateLayoutWidget_5, 1, 1, 11, 6, "layout31_2"); 

    layout50_2 = new QHBoxLayout( 0, 0, 6, "layout50_2"); 

    layout19_3 = new QHBoxLayout( 0, 0, 6, "layout19_3"); 

    layout14_2 = new QVBoxLayout( 0, 0, 6, "layout14_2"); 

    ip_src_checkBox = new QCheckBox( privateLayoutWidget_5, "ip_src_checkBox" );
    QFont ip_src_checkBox_font(  ip_src_checkBox->font() );
    ip_src_checkBox_font.setPointSize( 9 );
    ip_src_checkBox->setFont( ip_src_checkBox_font ); 
    layout14_2->addWidget( ip_src_checkBox );

    ip_src_lineEdit = new QLineEdit( privateLayoutWidget_5, "ip_src_lineEdit" );
    layout14_2->addWidget( ip_src_lineEdit );
    layout19_3->addLayout( layout14_2 );

    layout15_2 = new QVBoxLayout( 0, 0, 6, "layout15_2"); 

    ip_dst_checkBox = new QCheckBox( privateLayoutWidget_5, "ip_dst_checkBox" );
    QFont ip_dst_checkBox_font(  ip_dst_checkBox->font() );
    ip_dst_checkBox_font.setPointSize( 9 );
    ip_dst_checkBox->setFont( ip_dst_checkBox_font ); 
    layout15_2->addWidget( ip_dst_checkBox );

    ip_dst_lineEdit = new QLineEdit( privateLayoutWidget_5, "ip_dst_lineEdit" );
    layout15_2->addWidget( ip_dst_lineEdit );
    layout19_3->addLayout( layout15_2 );

    layout16_2 = new QVBoxLayout( 0, 0, 6, "layout16_2"); 

    sig_name_checkBox = new QCheckBox( privateLayoutWidget_5, "sig_name_checkBox" );
    QFont sig_name_checkBox_font(  sig_name_checkBox->font() );
    sig_name_checkBox_font.setPointSize( 9 );
    sig_name_checkBox->setFont( sig_name_checkBox_font ); 
    layout16_2->addWidget( sig_name_checkBox );

    sig_lineEdit = new QLineEdit( privateLayoutWidget_5, "sig_lineEdit" );
    layout16_2->addWidget( sig_lineEdit );
    layout19_3->addLayout( layout16_2 );

    layout17_3 = new QVBoxLayout( 0, 0, 6, "layout17_3"); 
    layout19_3->addLayout( layout17_3 );
    layout50_2->addLayout( layout19_3 );

    snortFind = new QPushButton( privateLayoutWidget_5, "snortFind" );
    QFont snortFind_font(  snortFind->font() );
    snortFind_font.setPointSize( 9 );
    snortFind->setFont( snortFind_font ); 
    layout50_2->addWidget( snortFind );

    layout31_2->addLayout( layout50_2, 0, 0 );

    snortLogTable = new QTable( privateLayoutWidget_5, "snortLogTable" );
    snortLogTable->setNumCols( snortLogTable->numCols() + 1 );
    snortLogTable->horizontalHeader()->setLabel( snortLogTable->numCols() - 1, tr( "time" ) );
    snortLogTable->setNumCols( snortLogTable->numCols() + 1 );
    snortLogTable->horizontalHeader()->setLabel( snortLogTable->numCols() - 1, tr( "sid" ) );
    snortLogTable->setNumCols( snortLogTable->numCols() + 1 );
    snortLogTable->horizontalHeader()->setLabel( snortLogTable->numCols() - 1, tr( "cid" ) );
    snortLogTable->setNumCols( snortLogTable->numCols() + 1 );
    snortLogTable->horizontalHeader()->setLabel( snortLogTable->numCols() - 1, tr( "signature" ) );
    snortLogTable->setNumCols( snortLogTable->numCols() + 1 );
    snortLogTable->horizontalHeader()->setLabel( snortLogTable->numCols() - 1, tr( "sig_name" ) );
    snortLogTable->setNumCols( snortLogTable->numCols() + 1 );
    snortLogTable->horizontalHeader()->setLabel( snortLogTable->numCols() - 1, tr( "sig_class_id" ) );
    snortLogTable->setNumCols( snortLogTable->numCols() + 1 );
    snortLogTable->horizontalHeader()->setLabel( snortLogTable->numCols() - 1, tr( "sig_priority" ) );
    snortLogTable->setNumCols( snortLogTable->numCols() + 1 );
    snortLogTable->horizontalHeader()->setLabel( snortLogTable->numCols() - 1, tr( "ip_src" ) );
    snortLogTable->setNumCols( snortLogTable->numCols() + 1 );
    snortLogTable->horizontalHeader()->setLabel( snortLogTable->numCols() - 1, tr( "ip_dst" ) );
    snortLogTable->setNumCols( snortLogTable->numCols() + 1 );
    snortLogTable->horizontalHeader()->setLabel( snortLogTable->numCols() - 1, tr( "sport" ) );
    snortLogTable->setNumCols( snortLogTable->numCols() + 1 );
    snortLogTable->horizontalHeader()->setLabel( snortLogTable->numCols() - 1, tr( "dport" ) );
    QFont snortLogTable_font(  snortLogTable->font() );
    snortLogTable_font.setPointSize( 9 );
    snortLogTable->setFont( snortLogTable_font ); 
    snortLogTable->setNumRows( 0 );
    snortLogTable->setNumCols( 11 );
    snortLogTable->setSelectionMode( QTable::NoSelection );

    layout31_2->addWidget( snortLogTable, 1, 0 );

    samhain_log = new QGroupBox( snort_inline_log, "samhain_log" );
    samhain_log->setEnabled( TRUE );
    samhain_log->setGeometry( QRect( 0, 0, 550, 430 ) );

    QWidget* privateLayoutWidget_6 = new QWidget( samhain_log, "layout32_3" );
    privateLayoutWidget_6->setGeometry( QRect( 20, 40, 510, 380 ) );
    layout32_3 = new QGridLayout( privateLayoutWidget_6, 1, 1, 11, 6, "layout32_3"); 

    layout38_3 = new QHBoxLayout( 0, 0, 6, "layout38_3"); 

    layout36_4 = new QVBoxLayout( 0, 0, 6, "layout36_4"); 

    path_checkBox = new QCheckBox( privateLayoutWidget_6, "path_checkBox" );
    QFont path_checkBox_font(  path_checkBox->font() );
    path_checkBox_font.setPointSize( 9 );
    path_checkBox->setFont( path_checkBox_font ); 
    layout36_4->addWidget( path_checkBox );

    path_lineEdit = new QLineEdit( privateLayoutWidget_6, "path_lineEdit" );
    layout36_4->addWidget( path_lineEdit );
    layout38_3->addLayout( layout36_4 );

    layout35_4 = new QVBoxLayout( 0, 0, 6, "layout35_4"); 

    owner_old_checkBox = new QCheckBox( privateLayoutWidget_6, "owner_old_checkBox" );
    QFont owner_old_checkBox_font(  owner_old_checkBox->font() );
    owner_old_checkBox_font.setPointSize( 9 );
    owner_old_checkBox->setFont( owner_old_checkBox_font ); 
    layout35_4->addWidget( owner_old_checkBox );

    owner_old_lineEdit = new QLineEdit( privateLayoutWidget_6, "owner_old_lineEdit" );
    layout35_4->addWidget( owner_old_lineEdit );
    layout38_3->addLayout( layout35_4 );

    layout34_4 = new QVBoxLayout( 0, 0, 6, "layout34_4"); 

    owner_new_checkBox = new QCheckBox( privateLayoutWidget_6, "owner_new_checkBox" );
    QFont owner_new_checkBox_font(  owner_new_checkBox->font() );
    owner_new_checkBox_font.setPointSize( 9 );
    owner_new_checkBox->setFont( owner_new_checkBox_font ); 
    layout34_4->addWidget( owner_new_checkBox );

    owner_new_lineEdit = new QLineEdit( privateLayoutWidget_6, "owner_new_lineEdit" );
    layout34_4->addWidget( owner_new_lineEdit );
    layout38_3->addLayout( layout34_4 );

    layout32_3->addLayout( layout38_3, 0, 0 );

    samhainLogTable = new QTable( privateLayoutWidget_6, "samhainLogTable" );
    samhainLogTable->setNumCols( samhainLogTable->numCols() + 1 );
    samhainLogTable->horizontalHeader()->setLabel( samhainLogTable->numCols() - 1, tr( "time" ) );
    samhainLogTable->setNumCols( samhainLogTable->numCols() + 1 );
    samhainLogTable->horizontalHeader()->setLabel( samhainLogTable->numCols() - 1, tr( "host" ) );
    samhainLogTable->setNumCols( samhainLogTable->numCols() + 1 );
    samhainLogTable->horizontalHeader()->setLabel( samhainLogTable->numCols() - 1, tr( "messege" ) );
    samhainLogTable->setNumCols( samhainLogTable->numCols() + 1 );
    samhainLogTable->horizontalHeader()->setLabel( samhainLogTable->numCols() - 1, tr( "path" ) );
    samhainLogTable->setNumCols( samhainLogTable->numCols() + 1 );
    samhainLogTable->horizontalHeader()->setLabel( samhainLogTable->numCols() - 1, tr( "mode_old" ) );
    samhainLogTable->setNumCols( samhainLogTable->numCols() + 1 );
    samhainLogTable->horizontalHeader()->setLabel( samhainLogTable->numCols() - 1, tr( "mode_new" ) );
    samhainLogTable->setNumCols( samhainLogTable->numCols() + 1 );
    samhainLogTable->horizontalHeader()->setLabel( samhainLogTable->numCols() - 1, tr( "owner_old" ) );
    samhainLogTable->setNumCols( samhainLogTable->numCols() + 1 );
    samhainLogTable->horizontalHeader()->setLabel( samhainLogTable->numCols() - 1, tr( "owner_new" ) );
    samhainLogTable->setNumCols( samhainLogTable->numCols() + 1 );
    samhainLogTable->horizontalHeader()->setLabel( samhainLogTable->numCols() - 1, tr( "group_old" ) );
    samhainLogTable->setNumCols( samhainLogTable->numCols() + 1 );
    samhainLogTable->horizontalHeader()->setLabel( samhainLogTable->numCols() - 1, tr( "group_new" ) );
    samhainLogTable->setNumCols( samhainLogTable->numCols() + 1 );
    samhainLogTable->horizontalHeader()->setLabel( samhainLogTable->numCols() - 1, tr( "ctime_old" ) );
    samhainLogTable->setNumCols( samhainLogTable->numCols() + 1 );
    samhainLogTable->horizontalHeader()->setLabel( samhainLogTable->numCols() - 1, tr( "ctime_new" ) );
    samhainLogTable->setNumCols( samhainLogTable->numCols() + 1 );
    samhainLogTable->horizontalHeader()->setLabel( samhainLogTable->numCols() - 1, tr( "link_old" ) );
    samhainLogTable->setNumCols( samhainLogTable->numCols() + 1 );
    samhainLogTable->horizontalHeader()->setLabel( samhainLogTable->numCols() - 1, tr( "link_new" ) );
    samhainLogTable->setNumCols( samhainLogTable->numCols() + 1 );
    samhainLogTable->horizontalHeader()->setLabel( samhainLogTable->numCols() - 1, tr( "hardlink_old" ) );
    samhainLogTable->setNumCols( samhainLogTable->numCols() + 1 );
    samhainLogTable->horizontalHeader()->setLabel( samhainLogTable->numCols() - 1, tr( "hardlink_new" ) );
    QFont samhainLogTable_font(  samhainLogTable->font() );
    samhainLogTable_font.setPointSize( 9 );
    samhainLogTable->setFont( samhainLogTable_font ); 
    samhainLogTable->setResizePolicy( QTable::Manual );
    samhainLogTable->setNumRows( 0 );
    samhainLogTable->setNumCols( 16 );
    samhainLogTable->setReadOnly( TRUE );
    samhainLogTable->setSorting( FALSE );
    samhainLogTable->setSelectionMode( QTable::NoSelection );

    layout32_3->addMultiCellWidget( samhainLogTable, 1, 1, 0, 1 );

    samhainFind = new QPushButton( privateLayoutWidget_6, "samhainFind" );
    QFont samhainFind_font(  samhainFind->font() );
    samhainFind_font.setPointSize( 9 );
    samhainFind->setFont( samhainFind_font ); 

    layout32_3->addWidget( samhainFind, 0, 1 );

    sebek_log = new QGroupBox( samhain_log, "sebek_log" );
    sebek_log->setGeometry( QRect( 0, 0, 550, 430 ) );

    QWidget* privateLayoutWidget_7 = new QWidget( sebek_log, "layout38_2_2" );
    privateLayoutWidget_7->setGeometry( QRect( 20, 20, 450, 80 ) );
    layout38_2_2 = new QHBoxLayout( privateLayoutWidget_7, 11, 6, "layout38_2_2"); 

    layout36_2_2 = new QVBoxLayout( 0, 0, 6, "layout36_2_2"); 

    command_checkBox1 = new QCheckBox( privateLayoutWidget_7, "command_checkBox1" );
    QFont command_checkBox1_font(  command_checkBox1->font() );
    command_checkBox1_font.setPointSize( 9 );
    command_checkBox1->setFont( command_checkBox1_font ); 
    layout36_2_2->addWidget( command_checkBox1 );

    command_lineEdit1 = new QLineEdit( privateLayoutWidget_7, "command_lineEdit1" );
    layout36_2_2->addWidget( command_lineEdit1 );
    layout38_2_2->addLayout( layout36_2_2 );

    layout35_2_2 = new QVBoxLayout( 0, 0, 6, "layout35_2_2"); 

    command_checkBox2 = new QCheckBox( privateLayoutWidget_7, "command_checkBox2" );
    QFont command_checkBox2_font(  command_checkBox2->font() );
    command_checkBox2_font.setPointSize( 9 );
    command_checkBox2->setFont( command_checkBox2_font ); 
    layout35_2_2->addWidget( command_checkBox2 );

    command_lineEdit2 = new QLineEdit( privateLayoutWidget_7, "command_lineEdit2" );
    layout35_2_2->addWidget( command_lineEdit2 );
    layout38_2_2->addLayout( layout35_2_2 );

    layout34_2_2 = new QVBoxLayout( 0, 0, 6, "layout34_2_2"); 

    command_checkBox3 = new QCheckBox( privateLayoutWidget_7, "command_checkBox3" );
    QFont command_checkBox3_font(  command_checkBox3->font() );
    command_checkBox3_font.setPointSize( 9 );
    command_checkBox3->setFont( command_checkBox3_font ); 
    layout34_2_2->addWidget( command_checkBox3 );

    command_lineEdit3 = new QLineEdit( privateLayoutWidget_7, "command_lineEdit3" );
    layout34_2_2->addWidget( command_lineEdit3 );
    layout38_2_2->addLayout( layout34_2_2 );

    sebekLogTable = new QTable( sebek_log, "sebekLogTable" );
    sebekLogTable->setNumCols( sebekLogTable->numCols() + 1 );
    sebekLogTable->horizontalHeader()->setLabel( sebekLogTable->numCols() - 1, tr( "ip_addr" ) );
    sebekLogTable->setNumCols( sebekLogTable->numCols() + 1 );
    sebekLogTable->horizontalHeader()->setLabel( sebekLogTable->numCols() - 1, tr( "insert_time" ) );
    sebekLogTable->setNumCols( sebekLogTable->numCols() + 1 );
    sebekLogTable->horizontalHeader()->setLabel( sebekLogTable->numCols() - 1, tr( "command" ) );
    sebekLogTable->setNumCols( sebekLogTable->numCols() + 1 );
    sebekLogTable->horizontalHeader()->setLabel( sebekLogTable->numCols() - 1, tr( "counter" ) );
    sebekLogTable->setNumCols( sebekLogTable->numCols() + 1 );
    sebekLogTable->horizontalHeader()->setLabel( sebekLogTable->numCols() - 1, tr( "filed" ) );
    sebekLogTable->setNumCols( sebekLogTable->numCols() + 1 );
    sebekLogTable->horizontalHeader()->setLabel( sebekLogTable->numCols() - 1, tr( "pid" ) );
    sebekLogTable->setNumCols( sebekLogTable->numCols() + 1 );
    sebekLogTable->horizontalHeader()->setLabel( sebekLogTable->numCols() - 1, tr( "uid" ) );
    sebekLogTable->setNumCols( sebekLogTable->numCols() + 1 );
    sebekLogTable->horizontalHeader()->setLabel( sebekLogTable->numCols() - 1, tr( "length" ) );
    sebekLogTable->setGeometry( QRect( 20, 110, 511, 300 ) );
    QFont sebekLogTable_font(  sebekLogTable->font() );
    sebekLogTable_font.setPointSize( 9 );
    sebekLogTable->setFont( sebekLogTable_font ); 
    sebekLogTable->setNumRows( 0 );
    sebekLogTable->setNumCols( 8 );

    sebekFind = new QPushButton( sebek_log, "sebekFind" );
    sebekFind->setGeometry( QRect( 480, 60, 55, 26 ) );
    QFont sebekFind_font(  sebekFind->font() );
    sebekFind_font.setPointSize( 9 );
    sebekFind->setFont( sebekFind_font ); 

    LogcomboBox2 = new QComboBox( FALSE, eventPage, "LogcomboBox2" );
    LogcomboBox2->setGeometry( QRect( 320, 20, 91, 31 ) );
    QFont LogcomboBox2_font(  LogcomboBox2->font() );
    LogcomboBox2_font.setPointSize( 9 );
    LogcomboBox2->setFont( LogcomboBox2_font ); 

    LogcomboBox = new QComboBox( FALSE, eventPage, "LogcomboBox" );
    LogcomboBox->setGeometry( QRect( 30, 20, 140, 31 ) );
    QFont LogcomboBox_font(  LogcomboBox->font() );
    LogcomboBox_font.setPointSize( 9 );
    LogcomboBox->setFont( LogcomboBox_font ); 

    textLabel2_3 = new QLabel( eventPage, "textLabel2_3" );
    textLabel2_3->setGeometry( QRect( 270, 26, 40, 20 ) );
    QFont textLabel2_3_font(  textLabel2_3->font() );
    textLabel2_3_font.setPointSize( 9 );
    textLabel2_3->setFont( textLabel2_3_font ); 

    textLabel3_2 = new QLabel( eventPage, "textLabel3_2" );
    textLabel3_2->setGeometry( QRect( 427, 26, 60, 20 ) );
    QFont textLabel3_2_font(  textLabel3_2->font() );
    textLabel3_2_font.setPointSize( 9 );
    textLabel3_2->setFont( textLabel3_2_font ); 
    tabPage->insertTab( eventPage, QString::fromLatin1("") );
    languageChange();
    resize( QSize(636, 720).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( cage1StartButton, SIGNAL( clicked() ), this, SLOT( startcage1() ) );
    connect( cage1SuspendButton, SIGNAL( clicked() ), this, SLOT( suspendcage1() ) );
    connect( cage2StartButton, SIGNAL( clicked() ), this, SLOT( startcage2() ) );
    connect( cage2SuspendButton, SIGNAL( clicked() ), this, SLOT( suspendcage2() ) );
    connect( cage3StartButton, SIGNAL( clicked() ), this, SLOT( startcage3() ) );
    connect( cage3SuspendButton, SIGNAL( clicked() ), this, SLOT( suspendcage3() ) );
    connect( command_checkBox1, SIGNAL( clicked() ), this, SLOT( showLog() ) );
    connect( command_checkBox2, SIGNAL( clicked() ), this, SLOT( showLog() ) );
    connect( command_checkBox3, SIGNAL( clicked() ), this, SLOT( showLog() ) );
    connect( configPushButton, SIGNAL( clicked() ), this, SLOT( configTartarus() ) );
    connect( groupCheck, SIGNAL( stateChanged(int) ), this, SLOT( dataChange() ) );
    connect( h1StartButton, SIGNAL( clicked() ), this, SLOT( starth1() ) );
    connect( h1StopButton, SIGNAL( clicked() ), this, SLOT( stoph1() ) );
    connect( ipCage, SIGNAL( textChanged(const QString&) ), this, SLOT( dataChange() ) );
    connect( ip_dst_checkBox, SIGNAL( clicked() ), this, SLOT( showLog() ) );
    connect( ip_src_checkBox, SIGNAL( clicked() ), this, SLOT( showLog() ) );
    connect( LogcomboBox, SIGNAL( activated(const QString&) ), this, SLOT( showLog() ) );
    connect( LogcomboBox2, SIGNAL( activated(const QString&) ), this, SLOT( showLog() ) );
    connect( modeCheck, SIGNAL( stateChanged(int) ), this, SLOT( dataChange() ) );
    connect( nameCage, SIGNAL( textChanged(const QString&) ), this, SLOT( dataChange() ) );
    connect( numCheck, SIGNAL( stateChanged(int) ), this, SLOT( dataChange() ) );
    connect( ownCheck, SIGNAL( stateChanged(int) ), this, SLOT( dataChange() ) );
    connect( owner_new_checkBox, SIGNAL( clicked() ), this, SLOT( showLog() ) );
    connect( owner_old_checkBox, SIGNAL( clicked() ), this, SLOT( showLog() ) );
    connect( passCheck, SIGNAL( stateChanged(int) ), this, SLOT( dataChange() ) );
    connect( pathCage, SIGNAL( textChanged(const QString&) ), this, SLOT( dataChange() ) );
    connect( path_checkBox, SIGNAL( clicked() ), this, SLOT( showLog() ) );
    connect( PushButtonClear, SIGNAL( pressed() ), this, SLOT( checkButton() ) );
    connect( PushButtonDelete, SIGNAL( pressed() ), this, SLOT( checkButton() ) );
    connect( PushButtonFirst, SIGNAL( pressed() ), this, SLOT( checkButton() ) );
    connect( PushButtonInsert, SIGNAL( pressed() ), this, SLOT( checkButton() ) );
    connect( PushButtonLast, SIGNAL( pressed() ), this, SLOT( checkButton() ) );
    connect( PushButtonNext, SIGNAL( pressed() ), this, SLOT( checkButton() ) );
    connect( PushButtonPrev, SIGNAL( pressed() ), this, SLOT( checkButton() ) );
    connect( resetConfigButton, SIGNAL( pressed() ), this, SLOT( createCageConfig() ) );
    connect( RuleCancleButton, SIGNAL( clicked() ), this, SLOT( clearRule() ) );
    connect( RuleOkButton, SIGNAL( clicked() ), this, SLOT( applyRule() ) );
    connect( samhainFind, SIGNAL( clicked() ), this, SLOT( showLog() ) );
    connect( sebekFind, SIGNAL( clicked() ), this, SLOT( showLog() ) );
    connect( saveConfigButton, SIGNAL( pressed() ), this, SLOT( createCageConfig() ) );
    connect( SelectRuleButton, SIGNAL( clicked() ), this, SLOT( selectRule() ) );
    connect( sig_name_checkBox, SIGNAL( clicked() ), this, SLOT( showLog() ) );
    connect( snortFind, SIGNAL( clicked() ), this, SLOT( showLog() ) );
    connect( UnselectRuleButton, SIGNAL( clicked() ), this, SLOT( removeRule() ) );
    connect( aboutPushButton, SIGNAL( clicked() ), this, SLOT( about() ) );
    connect( refreshPushButton, SIGNAL( clicked() ), this, SLOT( refresh() ) );

    // tab order
    setTabOrder( tabPage, h1StartButton );
    setTabOrder( h1StartButton, h1StopButton );
    setTabOrder( h1StopButton, cage1StartButton );
    setTabOrder( cage1StartButton, cage1SuspendButton );
    setTabOrder( cage1SuspendButton, cage2StartButton );
    setTabOrder( cage2StartButton, cage2SuspendButton );
    setTabOrder( cage2SuspendButton, cage3StartButton );
    setTabOrder( cage3StartButton, cage3SuspendButton );
    setTabOrder( cage3SuspendButton, RuleChoiceListbox );
    setTabOrder( RuleChoiceListbox, SelectRuleButton );
    setTabOrder( SelectRuleButton, UnselectRuleButton );
    setTabOrder( UnselectRuleButton, selectRuleListbox );
    setTabOrder( selectRuleListbox, RuleOkButton );
    setTabOrder( RuleOkButton, RuleCancleButton );
    setTabOrder( RuleCancleButton, nameCage );
    setTabOrder( nameCage, ipCage );
    setTabOrder( ipCage, pathCage );
    setTabOrder( pathCage, hostnamecomboBox );
    setTabOrder( hostnamecomboBox, PushButtonFirst );
    setTabOrder( PushButtonFirst, PushButtonPrev );
    setTabOrder( PushButtonPrev, PushButtonNext );
    setTabOrder( PushButtonNext, PushButtonLast );
    setTabOrder( PushButtonLast, PushButtonClear );
    setTabOrder( PushButtonClear, PushButtonInsert );
    setTabOrder( PushButtonInsert, PushButtonDelete );
    setTabOrder( PushButtonDelete, numCheck );
    setTabOrder( numCheck, numUser );
    setTabOrder( numUser, groupCheck );
    setTabOrder( groupCheck, groupRoot );
    setTabOrder( groupRoot, ownCheck );
    setTabOrder( ownCheck, ownerPass );
    setTabOrder( ownerPass, passCheck );
    setTabOrder( passCheck, passCh );
    setTabOrder( passCh, modeCheck );
    setTabOrder( modeCheck, modePass );
    setTabOrder( modePass, saveConfigButton );
    setTabOrder( saveConfigButton, resetConfigButton );
    setTabOrder( resetConfigButton, cageTable );
    setTabOrder( cageTable, LogcomboBox );
    setTabOrder( LogcomboBox, LogcomboBox2 );
    setTabOrder( LogcomboBox2, command_checkBox1 );
    setTabOrder( command_checkBox1, command_lineEdit1 );
    setTabOrder( command_lineEdit1, command_checkBox2 );
    setTabOrder( command_checkBox2, command_lineEdit2 );
    setTabOrder( command_lineEdit2, command_checkBox3 );
    setTabOrder( command_checkBox3, command_lineEdit3 );
    setTabOrder( command_lineEdit3, sebekFind );
    setTabOrder( sebekFind, sebekLogTable );
    setTabOrder( sebekLogTable, ip_src_checkBox );
    setTabOrder( ip_src_checkBox, ip_src_lineEdit );
    setTabOrder( ip_src_lineEdit, ip_dst_checkBox );
    setTabOrder( ip_dst_checkBox, ip_dst_lineEdit );
    setTabOrder( ip_dst_lineEdit, sig_name_checkBox );
    setTabOrder( sig_name_checkBox, sig_lineEdit );
    setTabOrder( sig_lineEdit, snortFind );
    setTabOrder( snortFind, snortLogTable );
    setTabOrder( snortLogTable, path_checkBox );
    setTabOrder( path_checkBox, path_lineEdit );
    setTabOrder( path_lineEdit, owner_old_checkBox );
    setTabOrder( owner_old_checkBox, owner_old_lineEdit );
    setTabOrder( owner_old_lineEdit, owner_new_checkBox );
    setTabOrder( owner_new_checkBox, owner_new_lineEdit );
    setTabOrder( owner_new_lineEdit, samhainLogTable );
    setTabOrder( samhainLogTable, samhainFind );

    // buddies
    textLabel3->setBuddy( ipCage );
    textLabel1->setBuddy( nameCage );
    textLabel2->setBuddy( pathCage );
    init();
}

/*
 *  Destroys the object and frees any allocated resources
 */
HoneywallMM::~HoneywallMM()
{
    destroy();
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void HoneywallMM::languageChange()
{
    setCaption( tr( "Tartarus Management" ) );
    configPushButton->setText( QString::null );
    QToolTip::add( configPushButton, tr( "Configuration" ) );
    refreshPushButton->setText( QString::null );
    QToolTip::add( refreshPushButton, tr( "Refresh" ) );
    aboutPushButton->setText( QString::null );
    QToolTip::add( aboutPushButton, tr( "About" ) );
    textLabel17->setText( tr( "<font size=\"+1\"><font size=\"+1\"><b><p align=\"center\">Cage</p></b></font></font>" ) );
    textLabel12_3->setText( tr( "<b><p align=\"center\"><i>State</i></p></b>" ) );
    textLabel13_3_2->setText( tr( "<b><p align=\"center\"><i>Name</i></p></b>" ) );
    textLabel13_3->setText( tr( "<b><p align=\"center\"><i>Type</i></p></b>" ) );
    cage3Status->setText( QString::null );
    cage2Status->setText( QString::null );
    nameCage3->setText( QString::null );
    hostNametextLabel1->setText( QString::null );
    cage1Status->setText( QString::null );
    nameCage2->setText( QString::null );
    hostNametextLabel3->setText( QString::null );
    hostNametextLabel2->setText( QString::null );
    nameCage1->setText( QString::null );
    cage1SuspendButton->setText( tr( "Suspend" ) );
    cage3StartButton->setText( tr( "Start" ) );
    cage3SuspendButton->setText( tr( "Suspend" ) );
    cage2SuspendButton->setText( tr( "Suspend" ) );
    cage1StartButton->setText( tr( "Start" ) );
    cage1StartButton->setAccel( QKeySequence( QString::null ) );
    cage2StartButton->setText( tr( "Start" ) );
    textLabel17_2->setText( tr( "<font size=\"+1\"><font size=\"+1\"><b><p align=\"center\">Honeywall</p></b></font></font>" ) );
    textLabel16->setText( tr( "<b><p align=\"center\"><i>Location</i></p></b>" ) );
    textLabel12->setText( tr( "<b><p align=\"center\"><i>Status</i></p></b>" ) );
    textLabel13->setText( tr( "<b><p align=\"center\"><i>Hostname</i></p></b>" ) );
    hostnameLabel->setText( tr( "Honeywall_01" ) );
    textLabel15_3->setText( tr( "<p align=\"center\"><font size=\"-1\">Internet<font size=\"-1\"></font></font></p>" ) );
    h1Status->setText( tr( "Active" ) );
    h1StopButton->setText( tr( "Stop" ) );
    h1StartButton->setText( tr( "Start" ) );
    tabPage->changeTab( statusPage, tr( "&Status" ) );
    SelectRuleButton->setText( QString::null );
    UnselectRuleButton->setText( QString::null );
    RuleOkButton->setText( tr( "Apply" ) );
    RuleCancleButton->setText( tr( "Clear" ) );
    textLabel1_3->setText( tr( "Avaliable" ) );
    textLabel2_4->setText( tr( "Selected" ) );
    tabPage->changeTab( rulePage, tr( "&Rules" ) );
    numCheck->setText( tr( "&Number of Limt Users" ) );
    numCheck->setAccel( QKeySequence( tr( "Alt+N" ) ) );
    groupCheck->setText( tr( "Number User of &Group \"root\"" ) );
    groupCheck->setAccel( QKeySequence( tr( "Alt+G" ) ) );
    ownCheck->setText( tr( "&Owner of file \"/etc/passwd\"" ) );
    ownCheck->setAccel( QKeySequence( tr( "Alt+O" ) ) );
    passCheck->setText( tr( "&Password root changed" ) );
    passCheck->setAccel( QKeySequence( tr( "Alt+P" ) ) );
    modeCheck->setText( tr( "&Mode of file \"/etc/passwd\"" ) );
    modeCheck->setAccel( QKeySequence( tr( "Alt+M" ) ) );
    ownerPass->setText( tr( "root" ) );
    passCh->clear();
    passCh->insertItem( tr( "Yes" ) );
    passCh->insertItem( tr( "No" ) );
    modePass->clear();
    modePass->insertItem( tr( "-rw-r--r--" ) );
    saveConfigButton->setText( tr( "Save" ) );
    resetConfigButton->setText( tr( "Reset" ) );
    textLabel5->setText( tr( "Cage Configuration" ) );
    textLabel3->setText( tr( "IP" ) );
    PushButtonNext->setText( tr( "Next" ) );
    PushButtonPrev->setText( tr( "Previous" ) );
    PushButtonLast->setText( tr( "Last" ) );
    PushButtonFirst->setText( tr( "First" ) );
    textLabel4->setText( tr( "Hostname" ) );
    textLabel1->setText( tr( "Name" ) );
    textLabel2->setText( tr( "Path" ) );
    QWhatsThis::add( ipCage, tr( "you can edit cage's ip here" ) );
    textLabel6->setText( tr( "Cage Information" ) );
    PushButtonDelete->setText( tr( "Delete Cage" ) );
    PushButtonClear->setText( tr( "Clear" ) );
    PushButtonInsert->setText( tr( "Add Cage" ) );
    hostnamecomboBox->clear();
    hostnamecomboBox->insertItem( tr( "WWW" ) );
    hostnamecomboBox->insertItem( tr( "FTP" ) );
    tabPage->changeTab( managePage, tr( "Cage &Management" ) );
    textLabel1_2->setText( tr( "Cage Information" ) );
    cageTable->horizontalHeader()->setLabel( 0, tr( "Name" ) );
    cageTable->horizontalHeader()->setLabel( 1, tr( "IP" ) );
    cageTable->horizontalHeader()->setLabel( 2, tr( "Path" ) );
    cageTable->horizontalHeader()->setLabel( 3, tr( "Hostname" ) );
    cageTable->horizontalHeader()->setLabel( 4, tr( "State" ) );
    cageTable->horizontalHeader()->setLabel( 5, tr( "Current User" ) );
    cageTable->horizontalHeader()->setLabel( 6, tr( "Limit User" ) );
    cageTable->horizontalHeader()->setLabel( 7, tr( "User of group root" ) );
    cageTable->horizontalHeader()->setLabel( 8, tr( "Limit of group root" ) );
    tabPage->changeTab( controlPage, tr( "Cage &Information" ) );
    snort_inline_log->setTitle( tr( "Events" ) );
    ip_src_checkBox->setText( tr( "Souce IP" ) );
    ip_dst_checkBox->setText( tr( "Destination IP" ) );
    sig_name_checkBox->setText( tr( "Signature name" ) );
    snortFind->setText( tr( "Filter" ) );
    snortLogTable->horizontalHeader()->setLabel( 0, tr( "time" ) );
    snortLogTable->horizontalHeader()->setLabel( 1, tr( "sid" ) );
    snortLogTable->horizontalHeader()->setLabel( 2, tr( "cid" ) );
    snortLogTable->horizontalHeader()->setLabel( 3, tr( "signature" ) );
    snortLogTable->horizontalHeader()->setLabel( 4, tr( "sig_name" ) );
    snortLogTable->horizontalHeader()->setLabel( 5, tr( "sig_class_id" ) );
    snortLogTable->horizontalHeader()->setLabel( 6, tr( "sig_priority" ) );
    snortLogTable->horizontalHeader()->setLabel( 7, tr( "ip_src" ) );
    snortLogTable->horizontalHeader()->setLabel( 8, tr( "ip_dst" ) );
    snortLogTable->horizontalHeader()->setLabel( 9, tr( "sport" ) );
    snortLogTable->horizontalHeader()->setLabel( 10, tr( "dport" ) );
    samhain_log->setTitle( tr( "Events" ) );
    path_checkBox->setText( tr( "Path" ) );
    owner_old_checkBox->setText( tr( "Owner_old" ) );
    owner_new_checkBox->setText( tr( "Owner_new" ) );
    samhainLogTable->horizontalHeader()->setLabel( 0, tr( "time" ) );
    samhainLogTable->horizontalHeader()->setLabel( 1, tr( "host" ) );
    samhainLogTable->horizontalHeader()->setLabel( 2, tr( "messege" ) );
    samhainLogTable->horizontalHeader()->setLabel( 3, tr( "path" ) );
    samhainLogTable->horizontalHeader()->setLabel( 4, tr( "mode_old" ) );
    samhainLogTable->horizontalHeader()->setLabel( 5, tr( "mode_new" ) );
    samhainLogTable->horizontalHeader()->setLabel( 6, tr( "owner_old" ) );
    samhainLogTable->horizontalHeader()->setLabel( 7, tr( "owner_new" ) );
    samhainLogTable->horizontalHeader()->setLabel( 8, tr( "group_old" ) );
    samhainLogTable->horizontalHeader()->setLabel( 9, tr( "group_new" ) );
    samhainLogTable->horizontalHeader()->setLabel( 10, tr( "ctime_old" ) );
    samhainLogTable->horizontalHeader()->setLabel( 11, tr( "ctime_new" ) );
    samhainLogTable->horizontalHeader()->setLabel( 12, tr( "link_old" ) );
    samhainLogTable->horizontalHeader()->setLabel( 13, tr( "link_new" ) );
    samhainLogTable->horizontalHeader()->setLabel( 14, tr( "hardlink_old" ) );
    samhainLogTable->horizontalHeader()->setLabel( 15, tr( "hardlink_new" ) );
    samhainFind->setText( tr( "Filter" ) );
    sebek_log->setTitle( tr( "Events" ) );
    command_checkBox1->setText( tr( "IP address" ) );
    command_checkBox2->setText( tr( "Command1" ) );
    command_checkBox3->setText( tr( "Command2" ) );
    sebekLogTable->horizontalHeader()->setLabel( 0, tr( "ip_addr" ) );
    sebekLogTable->horizontalHeader()->setLabel( 1, tr( "insert_time" ) );
    sebekLogTable->horizontalHeader()->setLabel( 2, tr( "command" ) );
    sebekLogTable->horizontalHeader()->setLabel( 3, tr( "counter" ) );
    sebekLogTable->horizontalHeader()->setLabel( 4, tr( "filed" ) );
    sebekLogTable->horizontalHeader()->setLabel( 5, tr( "pid" ) );
    sebekLogTable->horizontalHeader()->setLabel( 6, tr( "uid" ) );
    sebekLogTable->horizontalHeader()->setLabel( 7, tr( "length" ) );
    sebekFind->setText( tr( "Filter" ) );
    LogcomboBox2->clear();
    LogcomboBox2->insertItem( tr( "50" ) );
    LogcomboBox2->insertItem( tr( "100" ) );
    LogcomboBox->clear();
    LogcomboBox->insertItem( tr( "snort_inline" ) );
    LogcomboBox->insertItem( tr( "samhain" ) );
    LogcomboBox->insertItem( tr( "sebek" ) );
    textLabel2_3->setText( tr( "Show" ) );
    textLabel3_2->setText( tr( "Records" ) );
    tabPage->changeTab( eventPage, tr( "&Logging" ) );
}

