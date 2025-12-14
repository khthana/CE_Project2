/****************************************************************************
** Form implementation generated from reading ui file 'userpass.ui'
**
** Created: Tue Jan 31 10:53:11 2006
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.5   edited Aug 31 12:13 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "userpass.h"

#include <qvariant.h>
#include <qmessagebox.h>
#include <qpushbutton.h>
#include <qlabel.h>
#include <qlineedit.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qimage.h>
#include <qpixmap.h>

#include "../userpass.ui.h"
/*
 *  Constructs a UserPass as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
UserPass::UserPass( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "UserPass" );
    setFocusPolicy( QDialog::StrongFocus );
    UserPassLayout = new QVBoxLayout( this, 11, 6, "UserPassLayout"); 

    layout26 = new QHBoxLayout( 0, 0, 6, "layout26"); 
    spacer24 = new QSpacerItem( 20, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout26->addItem( spacer24 );

    layout25 = new QGridLayout( 0, 1, 1, 0, 6, "layout25"); 

    layout24 = new QVBoxLayout( 0, 0, 6, "layout24"); 

    textLabel1 = new QLabel( this, "textLabel1" );
    layout24->addWidget( textLabel1 );

    textLabel2 = new QLabel( this, "textLabel2" );
    layout24->addWidget( textLabel2 );

    layout25->addLayout( layout24, 0, 0 );

    layout23 = new QVBoxLayout( 0, 0, 6, "layout23"); 

    userEdit = new QLineEdit( this, "userEdit" );
    layout23->addWidget( userEdit );

    passEdit = new QLineEdit( this, "passEdit" );
    QFont passEdit_font(  passEdit->font() );
    passEdit->setFont( passEdit_font ); 
    passEdit->setMaxLength( 100 );
    passEdit->setEchoMode( QLineEdit::Password );
    layout23->addWidget( passEdit );

    layout25->addLayout( layout23, 0, 1 );
    layout26->addLayout( layout25 );
    spacer26 = new QSpacerItem( 30, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout26->addItem( spacer26 );
    UserPassLayout->addLayout( layout26 );

    layout21 = new QHBoxLayout( 0, 0, 6, "layout21"); 
    spacer21 = new QSpacerItem( 71, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout21->addItem( spacer21 );

    layout20 = new QHBoxLayout( 0, 0, 6, "layout20"); 

    loginButton = new QPushButton( this, "loginButton" );
    layout20->addWidget( loginButton );

    cancleLogin = new QPushButton( this, "cancleLogin" );
    layout20->addWidget( cancleLogin );
    layout21->addLayout( layout20 );
    spacer22 = new QSpacerItem( 71, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout21->addItem( spacer22 );
    UserPassLayout->addLayout( layout21 );
    languageChange();
    resize( QSize(309, 160).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( userEdit, SIGNAL( textChanged(const QString&) ), this, SLOT( dataChange() ) );
    connect( passEdit, SIGNAL( textChanged(const QString&) ), this, SLOT( dataChange() ) );
    connect( loginButton, SIGNAL( clicked() ), this, SLOT( chkUser() ) );
    connect( cancleLogin, SIGNAL( clicked() ), this, SLOT( cancelLogin() ) );

    // buddies
    textLabel1->setBuddy( userEdit );
    textLabel2->setBuddy( passEdit );
    init();
}

/*
 *  Destroys the object and frees any allocated resources
 */
UserPass::~UserPass()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void UserPass::languageChange()
{
    setCaption( tr( "Input Username" ) );
    textLabel1->setText( tr( "&Username" ) );
    textLabel2->setText( tr( "&Password" ) );
    loginButton->setText( tr( "&Login" ) );
    loginButton->setAccel( QKeySequence( tr( "Alt+L" ) ) );
    cancleLogin->setText( tr( "&Cancel" ) );
    cancleLogin->setAccel( QKeySequence( tr( "Alt+C" ) ) );
}

