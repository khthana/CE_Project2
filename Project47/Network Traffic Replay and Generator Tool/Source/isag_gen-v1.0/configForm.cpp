/****************************************************************************
** Form implementation generated from reading ui file 'configForm.ui'
**
** Created: Wed Jan 26 12:26:53 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "configForm.h"

#include <qvariant.h>
#include <qpushbutton.h>
#include <qframe.h>
#include <qtextedit.h>
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

#include "configForm.ui.h"
/*
 *  Constructs a ConfigForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 */
ConfigForm::ConfigForm( QWidget* parent, const char* name, WFlags fl )
    : QMainWindow( parent, name, fl )
{
    (void)statusBar();
    if ( !name )
	setName( "ConfigForm" );
    setIcon( QPixmap::fromMimeSource( "designer_project.png" ) );
    setCentralWidget( new QWidget( this, "qt_central_widget" ) );
    ConfigFormLayout = new QGridLayout( centralWidget(), 1, 1, 11, 6, "ConfigFormLayout"); 

    frameEdit = new QFrame( centralWidget(), "frameEdit" );
    frameEdit->setFrameShape( QFrame::StyledPanel );
    frameEdit->setFrameShadow( QFrame::Raised );
    frameEditLayout = new QGridLayout( frameEdit, 1, 1, 11, 6, "frameEditLayout"); 

    textEdit = new QTextEdit( frameEdit, "textEdit" );

    frameEditLayout->addWidget( textEdit, 0, 0 );

    layout9 = new QHBoxLayout( 0, 0, 6, "layout9"); 

    layout203_2 = new QHBoxLayout( 0, 0, 6, "layout203_2"); 

    fileConfLineEdit = new QLineEdit( frameEdit, "fileConfLineEdit" );
    fileConfLineEdit->setAlignment( int( QLineEdit::AlignLeft ) );
    layout203_2->addWidget( fileConfLineEdit );

    browseConfPushButton = new QPushButton( frameEdit, "browseConfPushButton" );
    layout203_2->addWidget( browseConfPushButton );
    layout9->addLayout( layout203_2 );

    GenerateConfButton = new QPushButton( frameEdit, "GenerateConfButton" );
    layout9->addWidget( GenerateConfButton );

    cancleButton = new QPushButton( frameEdit, "cancleButton" );
    layout9->addWidget( cancleButton );

    frameEditLayout->addLayout( layout9, 1, 0 );

    ConfigFormLayout->addWidget( frameEdit, 0, 0 );

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


    // toolbars
    toolBar = new QToolBar( QString(""), this, DockTop ); 

    fileNewAction->addTo( toolBar );
    fileOpenAction->addTo( toolBar );
    fileSaveAction->addTo( toolBar );
    fileSaveAsAction->addTo( toolBar );
    filePrintAction->addTo( toolBar );
    fileExitAction->addTo( toolBar );
    editUndoAction->addTo( toolBar );
    editRedoAction->addTo( toolBar );
    editCutAction->addTo( toolBar );
    editCopyAction->addTo( toolBar );
    editPasteAction->addTo( toolBar );


    // menubar
    MenuBar = new QMenuBar( this, "MenuBar" );


    fileMenu = new QPopupMenu( this );
    fileNewAction->addTo( fileMenu );
    fileOpenAction->addTo( fileMenu );
    fileSaveAction->addTo( fileMenu );
    fileSaveAsAction->addTo( fileMenu );
    fileMenu->insertSeparator();
    filePrintAction->addTo( fileMenu );
    fileMenu->insertSeparator();
    fileExitAction->addTo( fileMenu );
    MenuBar->insertItem( QString(""), fileMenu, 1 );

    editMenu = new QPopupMenu( this );
    editUndoAction->addTo( editMenu );
    editRedoAction->addTo( editMenu );
    editMenu->insertSeparator();
    editCutAction->addTo( editMenu );
    editCopyAction->addTo( editMenu );
    editPasteAction->addTo( editMenu );
    editMenu->insertSeparator();
    MenuBar->insertItem( QString(""), editMenu, 2 );

    languageChange();
    resize( QSize(600, 480).expandedTo(minimumSizeHint()) );
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
    connect( cancleButton, SIGNAL( clicked() ), this, SLOT( close() ) );
    connect( GenerateConfButton, SIGNAL( clicked() ), this, SLOT( GenerateConfig() ) );
    connect( fileConfLineEdit, SIGNAL( textChanged(const QString&) ), this, SLOT( FileNameSelected(const QString&) ) );
    connect( browseConfPushButton, SIGNAL( clicked() ), this, SLOT( fileOpen2() ) );
    init();
}

/*
 *  Destroys the object and frees any allocated resources
 */
ConfigForm::~ConfigForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void ConfigForm::languageChange()
{
    setCaption( tr( "Configure Form" ) );
    fileConfLineEdit->setText( QString::null );
    browseConfPushButton->setText( tr( "Selecte File" ) );
    GenerateConfButton->setText( tr( "Generate" ) );
    cancleButton->setText( tr( "Cancel" ) );
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
    toolBar->setLabel( tr( "Tools" ) );
    if (MenuBar->findItem(1))
        MenuBar->findItem(1)->setText( tr( "&File" ) );
    if (MenuBar->findItem(2))
        MenuBar->findItem(2)->setText( tr( "&Edit" ) );
}

