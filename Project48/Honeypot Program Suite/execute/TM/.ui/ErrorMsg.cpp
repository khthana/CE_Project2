/****************************************************************************
** Form implementation generated from reading ui file 'ErrorMsg.ui'
**
** Created: Tue Jan 3 14:39:50 2006
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.4   edited Nov 24 2003 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "ErrorMsg.h"

#include <qvariant.h>
#include <qpushbutton.h>
#include <qlabel.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qimage.h>
#include <qpixmap.h>

/*
 *  Constructs a ErrorMsg as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
ErrorMsg::ErrorMsg( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "ErrorMsg" );
    ErrorMsgLayout = new QVBoxLayout( this, 11, 6, "ErrorMsgLayout"); 

    layout30 = new QVBoxLayout( 0, 0, 6, "layout30"); 

    textLabel = new QLabel( this, "textLabel" );
    QFont textLabel_font(  textLabel->font() );
    textLabel_font.setPointSize( 12 );
    textLabel_font.setBold( TRUE );
    textLabel->setFont( textLabel_font ); 
    layout30->addWidget( textLabel );

    layout28 = new QHBoxLayout( 0, 0, 6, "layout28"); 
    spacer25 = new QSpacerItem( 150, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout28->addItem( spacer25 );

    pushButton20 = new QPushButton( this, "pushButton20" );
    layout28->addWidget( pushButton20 );
    spacer26 = new QSpacerItem( 161, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout28->addItem( spacer26 );
    layout30->addLayout( layout28 );
    ErrorMsgLayout->addLayout( layout30 );
    languageChange();
    resize( QSize(438, 104).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( pushButton20, SIGNAL( clicked() ), this, SLOT( close() ) );
}

/*
 *  Destroys the object and frees any allocated resources
 */
ErrorMsg::~ErrorMsg()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void ErrorMsg::languageChange()
{
    setCaption( tr( "Error" ) );
    textLabel->setText( tr( "<p align=\"center\">Your Username or Password is incorrect!!!</p>" ) );
    pushButton20->setText( tr( "&OK" ) );
    pushButton20->setAccel( QKeySequence( tr( "Alt+O" ) ) );
}

