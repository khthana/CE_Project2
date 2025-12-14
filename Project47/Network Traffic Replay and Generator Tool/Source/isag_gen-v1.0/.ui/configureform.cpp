/****************************************************************************
** Form implementation generated from reading ui file 'configureform.ui'
**
** Created: Mon Jan 10 10:41:49 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.3   edited Nov 24 2003 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "configureform.h"

#include <qvariant.h>
#include <qfile.h>
#include <qfontdatabase.h>
#include <qmessagebox.h>
#include <qapplication.h>
#include <qfiledialog.h>
#include <qtextstream.h>
#include <qtextedit.h>
#include <qcombobox.h>
#include <qspinbox.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qaction.h>
#include <qmenubar.h>
#include <qpopupmenu.h>
#include <qtoolbar.h>
#include <qimage.h>
#include <qpixmap.h>

#include "../configureform.ui.h"
/*
 *  Constructs a configureForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 */
configureForm::configureForm( QWidget* parent, const char* name, WFlags fl )
    : QMainWindow( parent, name, fl )
{
    (void)statusBar();
    if ( !name )
	setName( "configureForm" );
    setIcon( QPixmap::fromMimeSource( "designer_project.png" ) );
    setCentralWidget( new QWidget( this, "qt_central_widget" ) );
    configureFormLayout = new QHBoxLayout( centralWidget(), 11, 6, "configureFormLayout"); 

    textEdit = new QTextEdit( centralWidget(), "textEdit" );
    textEdit->setSizePolicy( QSizePolicy( (QSizePolicy::SizeType)7, (QSizePolicy::SizeType)7, 0, 0, textEdit->sizePolicy().hasHeightForWidth() ) );
    textEdit->setTextFormat( QTextEdit::RichText );
    configureFormLayout->addWidget( textEdit );

    // actions
    fileNewAction = new QAction( this, "fileNewAction" );
    fileNewAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_filenew.png" ) ) );
    fileOpenAction = new QAction( this, "fileOpenAction" );
    fileOpenAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_fileopen.png" ) ) );
    fileSaveAction = new QAction( this, "fileSaveAction" );
    fileSaveAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_filesave.png" ) ) );
    fileSaveAsAction = new QAction( this, "fileSaveAsAction" );
    fileExitAction = new QAction( this, "fileExitAction" );
    editUndoAction = new QAction( this, "editUndoAction" );
    editUndoAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_d_undo.png" ) ) );
    editRedoAction = new QAction( this, "editRedoAction" );
    editRedoAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_redo.png" ) ) );
    editCutAction = new QAction( this, "editCutAction" );
    editCutAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_editcut.png" ) ) );
    editCopyAction = new QAction( this, "editCopyAction" );
    editCopyAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_editcopy.png" ) ) );
    editPasteAction = new QAction( this, "editPasteAction" );
    editPasteAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_editpaste.png" ) ) );
    boldAction = new QAction( this, "boldAction" );
    boldAction->setToggleAction( TRUE );
    boldAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_textbold.png" ) ) );
    italicAction = new QAction( this, "italicAction" );
    italicAction->setToggleAction( TRUE );
    italicAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_textitalic.png" ) ) );
    underlineAction = new QAction( this, "underlineAction" );
    underlineAction->setToggleAction( TRUE );
    underlineAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_textunderline.png" ) ) );
    alignActionGroup = new QActionGroup( this, "alignActionGroup" );
    alignActionGroup->setUsesDropDown( FALSE );
    leftAlignAction = new QAction( alignActionGroup, "leftAlignAction" );
    leftAlignAction->setToggleAction( TRUE );
    leftAlignAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_textleft.png" ) ) );
    rightAlignAction = new QAction( alignActionGroup, "rightAlignAction" );
    rightAlignAction->setToggleAction( TRUE );
    rightAlignAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_textright.png" ) ) );
    centerAlignAction = new QAction( alignActionGroup, "centerAlignAction" );
    centerAlignAction->setToggleAction( TRUE );
    centerAlignAction->setIconSet( QIconSet( QPixmap::fromMimeSource( "designer_textcenter.png" ) ) );


    // toolbars
    toolBar = new QToolBar( QString(""), this, DockTop ); 

    toolBar->setGeometry( QRect( 0, 0, 244, 29 ) );
    fileNewAction->addTo( toolBar );
    fileOpenAction->addTo( toolBar );
    fileSaveAction->addTo( toolBar );
    toolBar->addSeparator();
    editUndoAction->addTo( toolBar );
    editRedoAction->addTo( toolBar );
    editCutAction->addTo( toolBar );
    editCopyAction->addTo( toolBar );
    editPasteAction->addTo( toolBar );
    Toolbar = new QToolBar( QString(""), this, DockTop ); 

    Toolbar->setGeometry( QRect( 0, 29, 331, 29 ) );
    leftAlignAction->addTo( Toolbar );
    centerAlignAction->addTo( Toolbar );
    rightAlignAction->addTo( Toolbar );
    Toolbar->addSeparator();
    boldAction->addTo( Toolbar );
    italicAction->addTo( Toolbar );
    underlineAction->addTo( Toolbar );
    Toolbar->addSeparator();

    fontComboBox = new QComboBox( FALSE, Toolbar, "fontComboBox" );

    SpinBox2 = new QSpinBox( Toolbar, "SpinBox2" );
    SpinBox2->setMinValue( 6 );
    SpinBox2->setValue( 10 );


    // menubar
    menubar = new QMenuBar( this, "menubar" );


    fileMenu = new QPopupMenu( this );
    fileNewAction->addTo( fileMenu );
    fileOpenAction->addTo( fileMenu );
    fileSaveAction->addTo( fileMenu );
    fileSaveAsAction->addTo( fileMenu );
    fileMenu->insertSeparator();
    fileExitAction->addTo( fileMenu );
    menubar->insertItem( QString(""), fileMenu, 1 );

    editMenu = new QPopupMenu( this );
    editUndoAction->addTo( editMenu );
    editRedoAction->addTo( editMenu );
    editMenu->insertSeparator();
    editCutAction->addTo( editMenu );
    editCopyAction->addTo( editMenu );
    editPasteAction->addTo( editMenu );
    menubar->insertItem( QString(""), editMenu, 2 );

    PopupMenu_2 = new QPopupMenu( this );
    leftAlignAction->addTo( PopupMenu_2 );
    rightAlignAction->addTo( PopupMenu_2 );
    centerAlignAction->addTo( PopupMenu_2 );
    PopupMenu_2->insertSeparator();
    boldAction->addTo( PopupMenu_2 );
    italicAction->addTo( PopupMenu_2 );
    underlineAction->addTo( PopupMenu_2 );
    menubar->insertItem( QString(""), PopupMenu_2, 3 );

    helpMenu = new QPopupMenu( this );
    helpMenu->insertSeparator();
    menubar->insertItem( QString(""), helpMenu, 4 );

    languageChange();
    resize( QSize(524, 376).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( fileOpenAction, SIGNAL( activated() ), this, SLOT( fileOpen() ) );
    connect( fileSaveAction, SIGNAL( activated() ), this, SLOT( fileSave() ) );
    connect( fileSaveAsAction, SIGNAL( activated() ), this, SLOT( fileSaveAs() ) );
    connect( fileExitAction, SIGNAL( activated() ), this, SLOT( fileExit() ) );
    connect( SpinBox2, SIGNAL( valueChanged(int) ), textEdit, SLOT( setPointSize(int) ) );
    connect( editCutAction, SIGNAL( activated() ), textEdit, SLOT( cut() ) );
    connect( editPasteAction, SIGNAL( activated() ), textEdit, SLOT( paste() ) );
    connect( editCopyAction, SIGNAL( activated() ), textEdit, SLOT( copy() ) );
    connect( editRedoAction, SIGNAL( activated() ), textEdit, SLOT( redo() ) );
    connect( editUndoAction, SIGNAL( activated() ), textEdit, SLOT( undo() ) );
    connect( alignActionGroup, SIGNAL( selected(QAction*) ), this, SLOT( changeAlignment(QAction*) ) );
    connect( underlineAction, SIGNAL( toggled(bool) ), textEdit, SLOT( setUnderline(bool) ) );
    connect( italicAction, SIGNAL( toggled(bool) ), textEdit, SLOT( setItalic(bool) ) );
    connect( boldAction, SIGNAL( toggled(bool) ), textEdit, SLOT( setBold(bool) ) );
    connect( fontComboBox, SIGNAL( activated(const QString&) ), textEdit, SLOT( setFamily(const QString&) ) );
    connect( fontComboBox, SIGNAL( activated(const QString&) ), textEdit, SLOT( setFocus() ) );
    connect( fileNewAction, SIGNAL( activated() ), this, SLOT( fileNew() ) );
    init();
}

/*
 *  Destroys the object and frees any allocated resources
 */
configureForm::~configureForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void configureForm::languageChange()
{
    setCaption( tr( "Configuration" ) );
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
    fileExitAction->setText( tr( "Exit" ) );
    fileExitAction->setMenuText( tr( "E&xit" ) );
    fileExitAction->setAccel( tr( "Ctrl+Q" ) );
    editUndoAction->setText( tr( "Undo" ) );
    editUndoAction->setMenuText( tr( "&Undo" ) );
    editUndoAction->setAccel( tr( "Ctrl+Z" ) );
    editRedoAction->setText( tr( "Redo" ) );
    editRedoAction->setMenuText( tr( "&Redo" ) );
    editRedoAction->setAccel( tr( "Ctrl+Y" ) );
    editCutAction->setText( tr( "Cut" ) );
    editCutAction->setMenuText( tr( "&Cut" ) );
    editCutAction->setAccel( tr( "Ctrl+X" ) );
    editCopyAction->setText( tr( "Copy" ) );
    editCopyAction->setMenuText( tr( "C&opy" ) );
    editCopyAction->setAccel( tr( "Ctrl+C" ) );
    editPasteAction->setText( tr( "Paste" ) );
    editPasteAction->setMenuText( tr( "&Paste" ) );
    editPasteAction->setAccel( tr( "Ctrl+V" ) );
    boldAction->setText( tr( "bold" ) );
    boldAction->setMenuText( tr( "&Bold" ) );
    boldAction->setAccel( tr( "Ctrl+B" ) );
    italicAction->setText( tr( "italic" ) );
    italicAction->setMenuText( tr( "&Italic" ) );
    italicAction->setAccel( tr( "Ctrl+I" ) );
    underlineAction->setText( tr( "underline" ) );
    underlineAction->setMenuText( tr( "&Underline" ) );
    underlineAction->setAccel( tr( "Ctrl+U" ) );
    alignActionGroup->setText( tr( "align" ) );
    alignActionGroup->setMenuText( tr( "align" ) );
    leftAlignAction->setText( tr( "left" ) );
    leftAlignAction->setMenuText( tr( "&Left" ) );
    leftAlignAction->setAccel( tr( "Ctrl+L" ) );
    rightAlignAction->setText( tr( "right" ) );
    rightAlignAction->setMenuText( tr( "&Right" ) );
    rightAlignAction->setAccel( tr( "Ctrl+R" ) );
    centerAlignAction->setText( tr( "center" ) );
    centerAlignAction->setMenuText( tr( "&Center" ) );
    toolBar->setLabel( tr( "Tools" ) );
    Toolbar->setLabel( tr( "Toolbar" ) );
    if (menubar->findItem(1))
        menubar->findItem(1)->setText( tr( "&File" ) );
    if (menubar->findItem(2))
        menubar->findItem(2)->setText( tr( "&Edit" ) );
    if (menubar->findItem(3))
        menubar->findItem(3)->setText( tr( "F&ormat" ) );
    if (menubar->findItem(4))
        menubar->findItem(4)->setText( tr( "&Help" ) );
}

