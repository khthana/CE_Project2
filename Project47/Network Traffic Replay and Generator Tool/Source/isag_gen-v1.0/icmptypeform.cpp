/****************************************************************************
** Form implementation generated from reading ui file 'icmptypeform.ui'
**
** Created: Wed Jan 26 12:27:18 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "icmptypeform.h"

#include <qvariant.h>
#include <qpushbutton.h>
#include <qbuttongroup.h>
#include <qradiobutton.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qimage.h>
#include <qpixmap.h>

#include "icmptypeform.ui.h"
/*
 *  Constructs a icmpTypeForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
icmpTypeForm::icmpTypeForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "icmpTypeForm" );
    setIcon( QPixmap::fromMimeSource( "designer_project.png" ) );

    QWidget* privateLayoutWidget = new QWidget( this, "layout226" );
    privateLayoutWidget->setGeometry( QRect( 30, 41, 256, 230 ) );
    layout226 = new QVBoxLayout( privateLayoutWidget, 11, 6, "layout226"); 

    icmpbuttonGroup = new QButtonGroup( privateLayoutWidget, "icmpbuttonGroup" );
    icmpbuttonGroup->setColumnLayout(0, Qt::Vertical );
    icmpbuttonGroup->layout()->setSpacing( 6 );
    icmpbuttonGroup->layout()->setMargin( 11 );
    icmpbuttonGroupLayout = new QVBoxLayout( icmpbuttonGroup->layout() );
    icmpbuttonGroupLayout->setAlignment( Qt::AlignTop );

    layout190 = new QVBoxLayout( 0, 0, 6, "layout190"); 

    echoreqRadioButton = new QRadioButton( icmpbuttonGroup, "echoreqRadioButton" );
    echoreqRadioButton->setChecked( TRUE );
    layout190->addWidget( echoreqRadioButton );

    redirectRadioButton = new QRadioButton( icmpbuttonGroup, "redirectRadioButton" );
    layout190->addWidget( redirectRadioButton );

    timeExceedRadioButton = new QRadioButton( icmpbuttonGroup, "timeExceedRadioButton" );
    layout190->addWidget( timeExceedRadioButton );

    timeStampRadioButton = new QRadioButton( icmpbuttonGroup, "timeStampRadioButton" );
    layout190->addWidget( timeStampRadioButton );

    unreachRadioButton = new QRadioButton( icmpbuttonGroup, "unreachRadioButton" );
    layout190->addWidget( unreachRadioButton );
    icmpbuttonGroupLayout->addLayout( layout190 );
    layout226->addWidget( icmpbuttonGroup );
    spacer205 = new QSpacerItem( 20, 31, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout226->addItem( spacer205 );

    layout191 = new QHBoxLayout( 0, 0, 6, "layout191"); 
    spacer188 = new QSpacerItem( 80, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout191->addItem( spacer188 );

    NextPushButton = new QPushButton( privateLayoutWidget, "NextPushButton" );
    layout191->addWidget( NextPushButton );

    cancelPushButton = new QPushButton( privateLayoutWidget, "cancelPushButton" );
    layout191->addWidget( cancelPushButton );
    layout226->addLayout( layout191 );
    languageChange();
    resize( QSize(308, 312).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( cancelPushButton, SIGNAL( clicked() ), this, SLOT( reject() ) );
    connect( NextPushButton, SIGNAL( clicked() ), this, SLOT( selecteIcmpType() ) );
}

/*
 *  Destroys the object and frees any allocated resources
 */
icmpTypeForm::~icmpTypeForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void icmpTypeForm::languageChange()
{
    setCaption( tr( "ICMP TYPE" ) );
    icmpbuttonGroup->setTitle( tr( "ICMP Type" ) );
    echoreqRadioButton->setText( tr( "echo request" ) );
    redirectRadioButton->setText( tr( "Redirect" ) );
    timeExceedRadioButton->setText( tr( "Time exceed" ) );
    timeStampRadioButton->setText( tr( "Time stamp" ) );
    unreachRadioButton->setText( tr( "Unreach" ) );
    NextPushButton->setText( tr( "Next" ) );
    cancelPushButton->setText( tr( "Cancel" ) );
}

