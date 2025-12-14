/****************************************************************************
** Form implementation generated from reading ui file 'findform.ui'
**
** Created: พ. ธ.ค. 21 20:09:11 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.5   edited Aug 31 12:13 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "findform.h"

#include <qvariant.h>
#include <qpushbutton.h>
#include <qlabel.h>
#include <qlineedit.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qimage.h>
#include <qpixmap.h>

#include "../findform.ui.h"
/*
 *  Constructs a FindForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
FindForm::FindForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "FindForm" );
    FindFormLayout = new QVBoxLayout( this, 11, 6, "FindFormLayout"); 

    layout13 = new QVBoxLayout( 0, 0, 6, "layout13"); 

    layout10 = new QHBoxLayout( 0, 0, 6, "layout10"); 

    textLabel1 = new QLabel( this, "textLabel1" );
    layout10->addWidget( textLabel1 );

    findEdit = new QLineEdit( this, "findEdit" );
    layout10->addWidget( findEdit );
    layout13->addLayout( layout10 );

    layout12 = new QHBoxLayout( 0, 0, 6, "layout12"); 
    spacer3 = new QSpacerItem( 91, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout12->addItem( spacer3 );

    okButton = new QPushButton( this, "okButton" );
    layout12->addWidget( okButton );

    cancelButton = new QPushButton( this, "cancelButton" );
    layout12->addWidget( cancelButton );
    layout13->addLayout( layout12 );
    FindFormLayout->addLayout( layout13 );
    languageChange();
    resize( QSize(281, 101).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( cancelButton, SIGNAL( clicked() ), this, SLOT( reject() ) );
    connect( findEdit, SIGNAL( textChanged(const QString&) ), this, SLOT( dataChange() ) );
    init();
}

/*
 *  Destroys the object and frees any allocated resources
 */
FindForm::~FindForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void FindForm::languageChange()
{
    setCaption( tr( "Find Cage" ) );
    textLabel1->setText( tr( "Enter Cage's ID:" ) );
    okButton->setText( tr( "&OK" ) );
    okButton->setAccel( QKeySequence( tr( "Alt+O" ) ) );
    cancelButton->setText( tr( "&Cancel" ) );
    cancelButton->setAccel( QKeySequence( tr( "Alt+C" ) ) );
}

