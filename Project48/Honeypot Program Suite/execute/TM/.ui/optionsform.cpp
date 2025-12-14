/****************************************************************************
** Form implementation generated from reading ui file 'optionsform.ui'
**
** Created: Tue Jan 3 21:17:29 2006
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.4   edited Nov 24 2003 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "optionsform.h"

#include <qvariant.h>
#include <qpushbutton.h>
#include <qlabel.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qimage.h>
#include <qpixmap.h>

#include "qlineedit.h"
#include "qtimer.h"
#include "honeywallmm.h"
#include "../optionsform.ui.h"
/*
 *  Constructs a OptionsForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
OptionsForm::OptionsForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "OptionsForm" );
    setPaletteBackgroundColor( QColor( 255, 170, 0 ) );
    OptionsFormLayout = new QVBoxLayout( this, 11, 6, "OptionsFormLayout"); 

    layout140 = new QVBoxLayout( 0, 0, 6, "layout140"); 

    textLabel3 = new QLabel( this, "textLabel3" );
    textLabel3->setBackgroundMode( QLabel::PaletteText );
    textLabel3->setPaletteForegroundColor( QColor( 255, 255, 255 ) );
    textLabel3->setPaletteBackgroundColor( QColor( 255, 170, 0 ) );
    layout140->addWidget( textLabel3 );

    layout139 = new QHBoxLayout( 0, 0, 6, "layout139"); 
    spacer16 = new QSpacerItem( 120, 28, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout139->addItem( spacer16 );

    yesButton = new QPushButton( this, "yesButton" );
    yesButton->setDefault( TRUE );
    layout139->addWidget( yesButton );

    noButton = new QPushButton( this, "noButton" );
    layout139->addWidget( noButton );
    spacer45 = new QSpacerItem( 141, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout139->addItem( spacer45 );
    layout140->addLayout( layout139 );
    OptionsFormLayout->addLayout( layout140 );
    languageChange();
    resize( QSize(461, 91).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( yesButton, SIGNAL( clicked() ), this, SLOT( regis() ) );
    connect( noButton, SIGNAL( clicked() ), this, SLOT( noregis() ) );
    connect( yesButton, SIGNAL( clicked() ), this, SLOT( reject() ) );
    connect( noButton, SIGNAL( clicked() ), this, SLOT( reject() ) );

    // tab order
    setTabOrder( yesButton, noButton );
}

/*
 *  Destroys the object and frees any allocated resources
 */
OptionsForm::~OptionsForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void OptionsForm::languageChange()
{
    setCaption( tr( "Register Cage" ) );
    textLabel3->setText( tr( "Do you want to Register your's cage to Honeypot System ?" ) );
    yesButton->setText( tr( "&Yes" ) );
    yesButton->setAccel( QKeySequence( tr( "Alt+Y" ) ) );
    QWhatsThis::add( yesButton, tr( "This is Auswer that you want to auswer" ) );
    noButton->setText( tr( "&No" ) );
    noButton->setAccel( QKeySequence( tr( "Alt+N" ) ) );
}

