/****************************************************************************
** Form implementation generated from reading ui file 'main_form.ui'
**
** Created: Thu Jan 13 13:01:25 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.3   edited Nov 24 2003 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "main_form.h"

#include <qvariant.h>
#include <qpushbutton.h>
#include <qgroupbox.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qaction.h>
#include <qmenubar.h>
#include <qpopupmenu.h>
#include <qtoolbar.h>
#include <qimage.h>
#include <qpixmap.h>

#include "main_form.ui.h"
/*
 *  Constructs a Main_Form as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 */
Main_Form::Main_Form( QWidget* parent, const char* name, WFlags fl )
    : QMainWindow( parent, name, fl )
{
    (void)statusBar();
    if ( !name )
	setName( "Main_Form" );
    setCentralWidget( new QWidget( this, "qt_central_widget" ) );

    formatGroupBox = new QGroupBox( centralWidget(), "formatGroupBox" );
    formatGroupBox->setGeometry( QRect( 40, 30, 130, 215 ) );
    formatGroupBox->setColumnLayout(0, Qt::Vertical );
    formatGroupBox->layout()->setSpacing( 6 );
    formatGroupBox->layout()->setMargin( 11 );
    formatGroupBoxLayout = new QVBoxLayout( formatGroupBox->layout() );
    formatGroupBoxLayout->setAlignment( Qt::AlignTop );

    layout37 = new QVBoxLayout( 0, 0, 6, "layout37"); 

    Button_Arp = new QPushButton( formatGroupBox, "Button_Arp" );
    layout37->addWidget( Button_Arp );

    Button_ICMP = new QPushButton( formatGroupBox, "Button_ICMP" );
    layout37->addWidget( Button_ICMP );

    Button_Tcp = new QPushButton( formatGroupBox, "Button_Tcp" );
    layout37->addWidget( Button_Tcp );

    Button_Udp = new QPushButton( formatGroupBox, "Button_Udp" );
    layout37->addWidget( Button_Udp );

    Button_Dns = new QPushButton( formatGroupBox, "Button_Dns" );
    layout37->addWidget( Button_Dns );
    formatGroupBoxLayout->addLayout( layout37 );

    attackGroupBox = new QGroupBox( centralWidget(), "attackGroupBox" );
    attackGroupBox->setGeometry( QRect( 200, 50, 116, 104 ) );
    attackGroupBox->setColumnLayout(0, Qt::Vertical );
    attackGroupBox->layout()->setSpacing( 6 );
    attackGroupBox->layout()->setMargin( 11 );
    attackGroupBoxLayout = new QVBoxLayout( attackGroupBox->layout() );
    attackGroupBoxLayout->setAlignment( Qt::AlignTop );

    layout38 = new QVBoxLayout( 0, 0, 6, "layout38"); 

    Button_Synflood = new QPushButton( attackGroupBox, "Button_Synflood" );
    layout38->addWidget( Button_Synflood );

    Button_Smurf = new QPushButton( attackGroupBox, "Button_Smurf" );
    layout38->addWidget( Button_Smurf );
    attackGroupBoxLayout->addLayout( layout38 );

    Button_Quit = new QPushButton( centralWidget(), "Button_Quit" );
    Button_Quit->setGeometry( QRect( 210, 190, 90, 30 ) );

    // actions
    fileNewAction = new QAction( this, "fileNewAction" );
    fileNewAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "filenew" ) ) );
    fileOpenAction = new QAction( this, "fileOpenAction" );
    fileOpenAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "fileopen" ) ) );
    fileSaveAction = new QAction( this, "fileSaveAction" );
    fileSaveAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "filesave" ) ) );
    fileSaveAsAction = new QAction( this, "fileSaveAsAction" );
    filePrintAction = new QAction( this, "filePrintAction" );
    filePrintAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "print" ) ) );
    fileExitAction = new QAction( this, "fileExitAction" );
    editUndoAction = new QAction( this, "editUndoAction" );
    editUndoAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "undo" ) ) );
    editRedoAction = new QAction( this, "editRedoAction" );
    editRedoAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "redo" ) ) );
    editCutAction = new QAction( this, "editCutAction" );
    editCutAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "editcut" ) ) );
    editCopyAction = new QAction( this, "editCopyAction" );
    editCopyAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "editcopy" ) ) );
    editPasteAction = new QAction( this, "editPasteAction" );
    editPasteAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "editpaste" ) ) );
    editFindAction = new QAction( this, "editFindAction" );
    editFindAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "searchfind" ) ) );
    helpContentsAction = new QAction( this, "helpContentsAction" );
    helpIndexAction = new QAction( this, "helpIndexAction" );
    helpAboutAction = new QAction( this, "helpAboutAction" );


    // toolbars
    toolBar = new QToolBar( QString(""), this, DockTop ); 

    toolBar->setGeometry( QRect( 0, 0, 188, 29 ) );
    fileNewAction->addTo( toolBar );
    fileOpenAction->addTo( toolBar );
    fileSaveAction->addTo( toolBar );
    toolBar->addSeparator();
    editCutAction->addTo( toolBar );
    editCopyAction->addTo( toolBar );
    editFindAction->addTo( toolBar );


    // menubar
    MenuBar = new QMenuBar( this, "MenuBar" );

    MenuBar->setGeometry( QRect( 0, 0, 481, 25 ) );

    fileMenu = new QPopupMenu( this );
    fileNewAction->addTo( fileMenu );
    fileOpenAction->addTo( fileMenu );
    fileSaveAction->addTo( fileMenu );
    fileSaveAsAction->addTo( fileMenu );
    fileMenu->insertSeparator();
    filePrintAction->addTo( fileMenu );
    fileMenu->insertSeparator();
    fileExitAction->addTo( fileMenu );
    MenuBar->insertItem( QString(""), fileMenu, 2 );

    editMenu = new QPopupMenu( this );
    editUndoAction->addTo( editMenu );
    editRedoAction->addTo( editMenu );
    editMenu->insertSeparator();
    editCutAction->addTo( editMenu );
    editCopyAction->addTo( editMenu );
    editPasteAction->addTo( editMenu );
    editMenu->insertSeparator();
    editFindAction->addTo( editMenu );
    MenuBar->insertItem( QString(""), editMenu, 3 );

    helpMenu = new QPopupMenu( this );
    helpContentsAction->addTo( helpMenu );
    helpIndexAction->addTo( helpMenu );
    helpMenu->insertSeparator();
    helpAboutAction->addTo( helpMenu );
    MenuBar->insertItem( QString(""), helpMenu, 4 );

    languageChange();
    resize( QSize(481, 411).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( fileNewAction, SIGNAL( activated() ), this, SLOT( fileNew() ) );
    connect( fileOpenAction, SIGNAL( activated() ), this, SLOT( fileOpen() ) );
    connect( fileSaveAction, SIGNAL( activated() ), this, SLOT( fileSave() ) );
    connect( fileSaveAsAction, SIGNAL( activated() ), this, SLOT( fileSaveAs() ) );
    connect( filePrintAction, SIGNAL( activated() ), this, SLOT( filePrint() ) );
    connect( fileExitAction, SIGNAL( activated() ), this, SLOT( fileExit() ) );
    connect( editUndoAction, SIGNAL( activated() ), this, SLOT( editUndo() ) );
    connect( editRedoAction, SIGNAL( activated() ), this, SLOT( editRedo() ) );
    connect( editCutAction, SIGNAL( activated() ), this, SLOT( editCut() ) );
    connect( editCopyAction, SIGNAL( activated() ), this, SLOT( editCopy() ) );
    connect( editPasteAction, SIGNAL( activated() ), this, SLOT( editPaste() ) );
    connect( editFindAction, SIGNAL( activated() ), this, SLOT( editFind() ) );
    connect( helpIndexAction, SIGNAL( activated() ), this, SLOT( helpIndex() ) );
    connect( helpContentsAction, SIGNAL( activated() ), this, SLOT( helpContents() ) );
    connect( helpAboutAction, SIGNAL( activated() ), this, SLOT( helpAbout() ) );
    connect( Button_Arp, SIGNAL( clicked() ), this, SLOT( ArpForm() ) );
    connect( Button_Quit, SIGNAL( clicked() ), this, SLOT( close() ) );
    connect( Button_ICMP, SIGNAL( clicked() ), this, SLOT( icmp_form() ) );
    connect( Button_Tcp, SIGNAL( clicked() ), this, SLOT( tcp_form() ) );
    connect( Button_Udp, SIGNAL( clicked() ), this, SLOT( udp_form() ) );
    connect( Button_Smurf, SIGNAL( clicked() ), this, SLOT( smurf_form() ) );
    connect( Button_Synflood, SIGNAL( clicked() ), this, SLOT( syncflood_form() ) );
}

/*
 *  Destroys the object and frees any allocated resources
 */
Main_Form::~Main_Form()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void Main_Form::languageChange()
{
    setCaption( tr( "Packet Generator" ) );
    formatGroupBox->setTitle( tr( "Format Packet " ) );
    Button_Arp->setText( tr( "ARP" ) );
    Button_ICMP->setText( tr( "ICMP" ) );
    Button_Tcp->setText( tr( "TCP" ) );
    Button_Udp->setText( tr( "UDP" ) );
    Button_Dns->setText( tr( "DNS" ) );
    attackGroupBox->setTitle( tr( "Attack Packet" ) );
    Button_Synflood->setText( tr( "SYNFLOOD" ) );
    Button_Smurf->setText( tr( "SMURF" ) );
    Button_Quit->setText( tr( "Quit" ) );
    fileNewAction->setText( tr( "New" ) );
    fileNewAction->setMenuText( tr( "&New" ) );
    fileNewAction->setAccel( tr( "Ctrl+N" ) );
    fileOpenAction->setText( tr( "Open" ) );
    fileOpenAction->setMenuText( tr( "&Open..." ) );
    fileOpenAction->setAccel( tr( "Ctrl+O" ) );
    fileSaveAction->setText( tr( "Save" ) );
    fileSaveAction->setMenuText( tr( "&Save" ) );
    fileSaveAction->setAccel( tr( "Ctrl+S" ) );
    fileSaveAsAction->setText( tr( "Save As" ) );
    fileSaveAsAction->setMenuText( tr( "Save &As..." ) );
    fileSaveAsAction->setAccel( QString::null );
    filePrintAction->setText( tr( "Print" ) );
    filePrintAction->setMenuText( tr( "&Print..." ) );
    filePrintAction->setAccel( tr( "Ctrl+P" ) );
    fileExitAction->setText( tr( "Exit" ) );
    fileExitAction->setMenuText( tr( "E&xit" ) );
    fileExitAction->setAccel( QString::null );
    editUndoAction->setText( tr( "Undo" ) );
    editUndoAction->setMenuText( tr( "&Undo" ) );
    editUndoAction->setAccel( tr( "Ctrl+Z" ) );
    editRedoAction->setText( tr( "Redo" ) );
    editRedoAction->setMenuText( tr( "&Redo" ) );
    editRedoAction->setAccel( tr( "Ctrl+Y" ) );
    editCutAction->setText( tr( "Cut" ) );
    editCutAction->setMenuText( tr( "Cu&t" ) );
    editCutAction->setAccel( tr( "Ctrl+X" ) );
    editCopyAction->setText( tr( "Copy" ) );
    editCopyAction->setMenuText( tr( "&Copy" ) );
    editCopyAction->setAccel( tr( "Ctrl+C" ) );
    editPasteAction->setText( tr( "Paste" ) );
    editPasteAction->setMenuText( tr( "&Paste" ) );
    editPasteAction->setAccel( tr( "Ctrl+V" ) );
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
    toolBar->setLabel( QString::null );
    if (MenuBar->findItem(2))
        MenuBar->findItem(2)->setText( tr( "&File" ) );
    if (MenuBar->findItem(3))
        MenuBar->findItem(3)->setText( tr( "&Edit" ) );
    if (MenuBar->findItem(4))
        MenuBar->findItem(4)->setText( tr( "&Help" ) );
}

