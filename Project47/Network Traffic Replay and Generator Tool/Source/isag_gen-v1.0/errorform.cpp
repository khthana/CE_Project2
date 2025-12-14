/****************************************************************************
** Form implementation generated from reading ui file 'errorform.ui'
**
** Created: Wed Jan 26 12:27:01 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "errorform.h"

#include <qvariant.h>
#include <qpushbutton.h>
#include <qgroupbox.h>
#include <qlabel.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qimage.h>
#include <qpixmap.h>

#include "errorform.ui.h"
/*
 *  Constructs a errorForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
errorForm::errorForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "errorForm" );
    setPaletteBackgroundColor( QColor( 240, 240, 240 ) );
    setIcon( QPixmap::fromMimeSource( "designer_editdelete.png" ) );
    errorFormLayout = new QGridLayout( this, 1, 1, 11, 6, "errorFormLayout"); 

    errorGroupBox = new QGroupBox( this, "errorGroupBox" );
    errorGroupBox->setPaletteForegroundColor( QColor( 0, 0, 0 ) );
    errorGroupBox->setColumnLayout(0, Qt::Vertical );
    errorGroupBox->layout()->setSpacing( 6 );
    errorGroupBox->layout()->setMargin( 11 );
    errorGroupBoxLayout = new QGridLayout( errorGroupBox->layout() );
    errorGroupBoxLayout->setAlignment( Qt::AlignTop );

    layout35 = new QVBoxLayout( 0, 0, 6, "layout35"); 

    errorLabel = new QLabel( errorGroupBox, "errorLabel" );
    errorLabel->setEnabled( TRUE );
    errorLabel->setPaletteForegroundColor( QColor( 255, 0, 0 ) );
    QFont errorLabel_font(  errorLabel->font() );
    errorLabel_font.setBold( TRUE );
    errorLabel->setFont( errorLabel_font ); 
    errorLabel->setLineWidth( 2 );
    layout35->addWidget( errorLabel );

    layout6 = new QHBoxLayout( 0, 0, 6, "layout6"); 
    spacer5 = new QSpacerItem( 161, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout6->addItem( spacer5 );

    okButton = new QPushButton( errorGroupBox, "okButton" );
    layout6->addWidget( okButton );
    layout35->addLayout( layout6 );

    errorGroupBoxLayout->addLayout( layout35, 0, 0 );

    errorFormLayout->addWidget( errorGroupBox, 0, 0 );
    languageChange();
    resize( QSize(315, 113).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( okButton, SIGNAL( clicked() ), this, SLOT( close() ) );
}

/*
 *  Destroys the object and frees any allocated resources
 */
errorForm::~errorForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void errorForm::languageChange()
{
    setCaption( tr( "! Error Form" ) );
    errorGroupBox->setTitle( tr( "ERROR TEXT!!!" ) );
    errorLabel->setText( tr( "123" ) );
    okButton->setText( tr( "OK" ) );
}

