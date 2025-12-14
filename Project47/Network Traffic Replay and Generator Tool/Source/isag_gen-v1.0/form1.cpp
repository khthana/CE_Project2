/****************************************************************************
** Form implementation generated from reading ui file 'form1.ui'
**
** Created: Thu Jan 13 09:22:02 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.3   edited Nov 24 2003 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "form1.h"

#include <qvariant.h>
#include <qpushbutton.h>
#include <qwidgetstack.h>
#include <qwidget.h>
#include <qbuttongroup.h>
#include <qradiobutton.h>
#include <qcheckbox.h>
#include <qgroupbox.h>
#include <qlineedit.h>
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
#include "form1.ui.h"
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
    firstFormLayout = new QVBoxLayout( centralWidget(), 11, 6, "firstFormLayout"); 

    functionWidgetStack = new QWidgetStack( centralWidget(), "functionWidgetStack" );

    generatePage = new QWidget( functionWidgetStack, "generatePage" );

    generatePacketButtonGroup = new QButtonGroup( generatePage, "generatePacketButtonGroup" );
    generatePacketButtonGroup->setGeometry( QRect( 50, 50, 280, 190 ) );

    templateRadioButton = new QRadioButton( generatePacketButtonGroup, "templateRadioButton" );
    templateRadioButton->setGeometry( QRect( 30, 50, 140, 22 ) );
    templateRadioButton->setChecked( TRUE );

    configFileRadioButton = new QRadioButton( generatePacketButtonGroup, "configFileRadioButton" );
    configFileRadioButton->setGeometry( QRect( 30, 110, 140, 22 ) );

    acceptPushButton = new QPushButton( generatePage, "acceptPushButton" );
    acceptPushButton->setGeometry( QRect( 260, 260, 80, 30 ) );
    acceptPushButton->setDefault( TRUE );
    functionWidgetStack->addWidget( generatePage, 0 );

    replayPage = new QWidget( functionWidgetStack, "replayPage" );

    checkBox1 = new QCheckBox( replayPage, "checkBox1" );
    checkBox1->setGeometry( QRect( 379, 147, 97, 21 ) );

    replayGroupBox = new QGroupBox( replayPage, "replayGroupBox" );
    replayGroupBox->setGeometry( QRect( 30, 30, 333, 214 ) );
    replayGroupBox->setColumnLayout(0, Qt::Vertical );
    replayGroupBox->layout()->setSpacing( 6 );
    replayGroupBox->layout()->setMargin( 11 );
    replayGroupBoxLayout = new QGridLayout( replayGroupBox->layout() );
    replayGroupBoxLayout->setAlignment( Qt::AlignTop );

    layout206 = new QVBoxLayout( 0, 0, 6, "layout206"); 

    layout203 = new QHBoxLayout( 0, 0, 6, "layout203"); 

    fileLineEdit1 = new QLineEdit( replayGroupBox, "fileLineEdit1" );
    fileLineEdit1->setAlignment( int( QLineEdit::AlignLeft ) );
    layout203->addWidget( fileLineEdit1 );

    browsePushButton1 = new QPushButton( replayGroupBox, "browsePushButton1" );
    layout203->addWidget( browsePushButton1 );
    layout206->addLayout( layout203 );

    layout204 = new QHBoxLayout( 0, 0, 6, "layout204"); 

    fileLineEdit2 = new QLineEdit( replayGroupBox, "fileLineEdit2" );
    fileLineEdit2->setAlignment( int( QLineEdit::AlignLeft ) );
    layout204->addWidget( fileLineEdit2 );

    browsePushButton2 = new QPushButton( replayGroupBox, "browsePushButton2" );
    layout204->addWidget( browsePushButton2 );
    layout206->addLayout( layout204 );

    layout205 = new QHBoxLayout( 0, 0, 6, "layout205"); 

    fileLineEdit3 = new QLineEdit( replayGroupBox, "fileLineEdit3" );
    fileLineEdit3->setAlignment( int( QLineEdit::AlignLeft ) );
    layout205->addWidget( fileLineEdit3 );

    browsePushButton3 = new QPushButton( replayGroupBox, "browsePushButton3" );
    layout205->addWidget( browsePushButton3 );
    layout206->addLayout( layout205 );
    spacer141 = new QSpacerItem( 20, 20, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout206->addItem( spacer141 );

    layout127 = new QHBoxLayout( 0, 0, 6, "layout127"); 
    spacer140 = new QSpacerItem( 141, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout127->addItem( spacer140 );

    layout123 = new QHBoxLayout( 0, 0, 6, "layout123"); 

    sendPushButton = new QPushButton( replayGroupBox, "sendPushButton" );
    layout123->addWidget( sendPushButton );

    cancelPushButton = new QPushButton( replayGroupBox, "cancelPushButton" );
    layout123->addWidget( cancelPushButton );
    layout127->addLayout( layout123 );
    layout206->addLayout( layout127 );

    replayGroupBoxLayout->addLayout( layout206, 0, 0 );
    functionWidgetStack->addWidget( replayPage, 1 );
    firstFormLayout->addWidget( functionWidgetStack );

    // actions
    fileOpenAction = new QAction( this, "fileOpenAction" );
    fileOpenAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "fileopen" ) ) );
    fileSaveAction = new QAction( this, "fileSaveAction" );
    fileSaveAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "filesave" ) ) );
    fileSaveAsAction = new QAction( this, "fileSaveAsAction" );
    fileExitAction = new QAction( this, "fileExitAction" );
    editUndoAction = new QAction( this, "editUndoAction" );
    editUndoAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "undo" ) ) );
    editRedoAction = new QAction( this, "editRedoAction" );
    editRedoAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "redo" ) ) );
    editFindAction = new QAction( this, "editFindAction" );
    editFindAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "searchfind" ) ) );
    helpContentsAction = new QAction( this, "helpContentsAction" );
    helpIndexAction = new QAction( this, "helpIndexAction" );
    helpAboutAction = new QAction( this, "helpAboutAction" );
    functionActionGroup = new QActionGroup( this, "functionActionGroup" );
    functionActionGroup->setUsesDropDown( FALSE );
    generateAction = new QAction( functionActionGroup, "generateAction" );
    generateAction->setToggleAction( TRUE );
    generateAction->setOn( TRUE );
    generateAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "filenew" ) ) );
    replayAction = new QAction( functionActionGroup, "replayAction" );
    replayAction->setToggleAction( TRUE );
    replayAction->setOn( FALSE );
    replayAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "fileopen" ) ) );
    Action = new QAction( this, "Action" );
    Action_2 = new QAction( this, "Action_2" );
    Action_3 = new QAction( this, "Action_3" );
    Action_4 = new QAction( this, "Action_4" );
    Action_5 = new QAction( this, "Action_5" );
    Action_6 = new QAction( this, "Action_6" );


    // toolbars
    toolBar = new QToolBar( QString(""), this, DockTop ); 

    toolBar->setGeometry( QRect( 0, 0, 254, 29 ) );
    fileOpenAction->addTo( toolBar );
    fileSaveAction->addTo( toolBar );
    fileSaveAsAction->addTo( toolBar );
    fileExitAction->addTo( toolBar );
    toolBar->addSeparator();
    editUndoAction->addTo( toolBar );
    editRedoAction->addTo( toolBar );
    editFindAction->addTo( toolBar );
    toolBar->addSeparator();
    helpContentsAction->addTo( toolBar );
    replayAction->addTo( toolBar );
    helpIndexAction->addTo( toolBar );
    generateAction->addTo( toolBar );
    helpAboutAction->addTo( toolBar );
    toolBar->addSeparator();


    // menubar
    MenuBar = new QMenuBar( this, "MenuBar" );


    fileMenu = new QPopupMenu( this );
    fileOpenAction->addTo( fileMenu );
    fileSaveAction->addTo( fileMenu );
    fileSaveAsAction->addTo( fileMenu );
    fileMenu->insertSeparator();
    fileMenu->insertSeparator();
    fileExitAction->addTo( fileMenu );
    MenuBar->insertItem( QString(""), fileMenu, 1 );

    editMenu = new QPopupMenu( this );
    editUndoAction->addTo( editMenu );
    editRedoAction->addTo( editMenu );
    editMenu->insertSeparator();
    editMenu->insertSeparator();
    editFindAction->addTo( editMenu );
    MenuBar->insertItem( QString(""), editMenu, 2 );

    Function = new QPopupMenu( this );
    generateAction->addTo( Function );
    replayAction->addTo( Function );
    MenuBar->insertItem( QString(""), Function, 3 );

    helpMenu = new QPopupMenu( this );
    helpContentsAction->addTo( helpMenu );
    helpIndexAction->addTo( helpMenu );
    helpMenu->insertSeparator();
    helpAboutAction->addTo( helpMenu );
    MenuBar->insertItem( QString(""), helpMenu, 4 );

    MenuBar->insertSeparator( 5 );

    languageChange();
    resize( QSize(415, 412).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( fileOpenAction, SIGNAL( activated() ), this, SLOT( fileOpen() ) );
    connect( fileSaveAction, SIGNAL( activated() ), this, SLOT( fileSave() ) );
    connect( fileSaveAsAction, SIGNAL( activated() ), this, SLOT( fileSaveAs() ) );
    connect( fileExitAction, SIGNAL( activated() ), this, SLOT( fileExit() ) );
    connect( editUndoAction, SIGNAL( activated() ), this, SLOT( editUndo() ) );
    connect( editRedoAction, SIGNAL( activated() ), this, SLOT( editRedo() ) );
    connect( editFindAction, SIGNAL( activated() ), this, SLOT( editFind() ) );
    connect( helpIndexAction, SIGNAL( activated() ), this, SLOT( helpIndex() ) );
    connect( helpContentsAction, SIGNAL( activated() ), this, SLOT( helpContents() ) );
    connect( helpAboutAction, SIGNAL( activated() ), this, SLOT( helpAbout() ) );
    connect( functionActionGroup, SIGNAL( selected(QAction*) ), this, SLOT( changeFunction(QAction*) ) );
    connect( acceptPushButton, SIGNAL( clicked() ), this, SLOT( changeMode() ) );
    connect( cancelPushButton, SIGNAL( clicked() ), this, SLOT( close() ) );
    connect( sendPushButton, SIGNAL( clicked() ), this, SLOT( showReplay() ) );
    connect( browsePushButton1, SIGNAL( clicked() ), this, SLOT( fileOpen() ) );
    connect( browsePushButton2, SIGNAL( clicked() ), this, SLOT( fileOpen() ) );
    connect( browsePushButton3, SIGNAL( clicked() ), this, SLOT( fileOpen() ) );

    // tab order
    setTabOrder( fileLineEdit1, browsePushButton1 );
    setTabOrder( browsePushButton1, fileLineEdit2 );
    setTabOrder( fileLineEdit2, browsePushButton2 );
    setTabOrder( browsePushButton2, fileLineEdit3 );
    setTabOrder( fileLineEdit3, browsePushButton3 );
    setTabOrder( browsePushButton3, sendPushButton );
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
    setCaption( tr( "Packet Generator Program" ) );
    generatePacketButtonGroup->setTitle( tr( "Generate Pakcet Mode" ) );
    templateRadioButton->setText( tr( "Template Packet" ) );
    configFileRadioButton->setText( tr( "Configuration File" ) );
    acceptPushButton->setText( tr( "Accept" ) );
    checkBox1->setText( tr( "checkBox1" ) );
    replayGroupBox->setTitle( tr( "Replay Packet" ) );
    browsePushButton1->setText( tr( "Selecte File" ) );
    browsePushButton2->setText( tr( "Selecte File" ) );
    browsePushButton3->setText( tr( "Selecte File" ) );
    sendPushButton->setText( tr( "Send" ) );
    cancelPushButton->setText( tr( "Cancel" ) );
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
    editUndoAction->setText( tr( "Undo" ) );
    editUndoAction->setMenuText( tr( "&Undo" ) );
    editUndoAction->setAccel( tr( "Ctrl+Z" ) );
    editRedoAction->setText( tr( "Redo" ) );
    editRedoAction->setMenuText( tr( "&Redo" ) );
    editRedoAction->setAccel( tr( "Ctrl+Y" ) );
    editFindAction->setText( tr( "Find" ) );
    editFindAction->setMenuText( tr( "&Find..." ) );
    editFindAction->setAccel( tr( "Ctrl+F" ) );
    helpContentsAction->setText( tr( "Contents" ) );
    helpContentsAction->setMenuText( tr( "&Contents..." ) );
    helpContentsAction->setAccel( QString::null );
    helpIndexAction->setText( tr( "Index" ) );
    helpIndexAction->setMenuText( tr( "&Index..." ) );
    helpIndexAction->setAccel( QString::null );
    helpAboutAction->setText( tr( "About" ) );
    helpAboutAction->setMenuText( tr( "&About" ) );
    helpAboutAction->setAccel( QString::null );
    functionActionGroup->setText( tr( "Function" ) );
    generateAction->setText( tr( "Generate Function" ) );
    generateAction->setMenuText( tr( "&Generate Function" ) );
    generateAction->setToolTip( tr( "Generate Function(Ctrl+G)" ) );
    generateAction->setAccel( tr( "Ctrl+G" ) );
    replayAction->setText( tr( "Replay Function" ) );
    replayAction->setMenuText( tr( "&Replay Function" ) );
    replayAction->setToolTip( tr( "Replay Function(Ctrl+R)" ) );
    replayAction->setWhatsThis( QString::null );
    replayAction->setAccel( tr( "Ctrl+R" ) );
    Action->setText( tr( "Unnamed" ) );
    Action_2->setText( tr( "Unnamed" ) );
    Action_3->setText( tr( "Unnamed" ) );
    Action_4->setText( tr( "Unnamed" ) );
    Action_5->setText( tr( "Unnamed" ) );
    Action_6->setText( tr( "Unnamed" ) );
    toolBar->setLabel( tr( "Tools" ) );
    if (MenuBar->findItem(1))
        MenuBar->findItem(1)->setText( tr( "&File" ) );
    if (MenuBar->findItem(2))
        MenuBar->findItem(2)->setText( tr( "&Edit" ) );
    if (MenuBar->findItem(3))
        MenuBar->findItem(3)->setText( tr( "Function" ) );
    if (MenuBar->findItem(4))
        MenuBar->findItem(4)->setText( tr( "&Help" ) );
}

