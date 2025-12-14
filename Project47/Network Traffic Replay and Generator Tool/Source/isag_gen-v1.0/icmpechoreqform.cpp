/****************************************************************************
** Form implementation generated from reading ui file 'icmpechoreqform.ui'
**
** Created: Thu Jan 27 19:28:08 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "icmpechoreqform.h"

#include <qvariant.h>
#include <qpushbutton.h>
#include <qgroupbox.h>
#include <qlabel.h>
#include <qlineedit.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qimage.h>
#include <qpixmap.h>

#include "icmpechoreqform.ui.h"
/*
 *  Constructs a icmpEchoReqForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
icmpEchoReqForm::icmpEchoReqForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "icmpEchoReqForm" );
    setIcon( QPixmap::fromMimeSource( "designer_project.png" ) );
    icmpEchoReqFormLayout = new QGridLayout( this, 1, 1, 11, 6, "icmpEchoReqFormLayout"); 

    layout70 = new QVBoxLayout( 0, 0, 6, "layout70"); 

    icmpEchoReqGroupBox = new QGroupBox( this, "icmpEchoReqGroupBox" );
    icmpEchoReqGroupBox->setColumnLayout(0, Qt::Vertical );
    icmpEchoReqGroupBox->layout()->setSpacing( 6 );
    icmpEchoReqGroupBox->layout()->setMargin( 11 );
    icmpEchoReqGroupBoxLayout = new QGridLayout( icmpEchoReqGroupBox->layout() );
    icmpEchoReqGroupBoxLayout->setAlignment( Qt::AlignTop );

    layout218 = new QHBoxLayout( 0, 0, 6, "layout218"); 

    sIPTextLabel = new QLabel( icmpEchoReqGroupBox, "sIPTextLabel" );
    layout218->addWidget( sIPTextLabel );
    spacer43 = new QSpacerItem( 101, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout218->addItem( spacer43 );

    sIPLineEdit = new QLineEdit( icmpEchoReqGroupBox, "sIPLineEdit" );
    sIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout218->addWidget( sIPLineEdit );

    icmpEchoReqGroupBoxLayout->addLayout( layout218, 1, 0 );

    layout219 = new QHBoxLayout( 0, 0, 6, "layout219"); 

    dIPTextLabel = new QLabel( icmpEchoReqGroupBox, "dIPTextLabel" );
    layout219->addWidget( dIPTextLabel );
    spacer44 = new QSpacerItem( 70, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout219->addItem( spacer44 );

    dIPLineEdit = new QLineEdit( icmpEchoReqGroupBox, "dIPLineEdit" );
    dIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout219->addWidget( dIPLineEdit );

    icmpEchoReqGroupBoxLayout->addLayout( layout219, 2, 0 );

    layout220 = new QHBoxLayout( 0, 0, 6, "layout220"); 

    countTextLabel = new QLabel( icmpEchoReqGroupBox, "countTextLabel" );
    layout220->addWidget( countTextLabel );
    spacer45 = new QSpacerItem( 110, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout220->addItem( spacer45 );

    numberPacketlineEdit = new QLineEdit( icmpEchoReqGroupBox, "numberPacketlineEdit" );
    numberPacketlineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout220->addWidget( numberPacketlineEdit );

    icmpEchoReqGroupBoxLayout->addLayout( layout220, 3, 0 );

    layout220_2 = new QHBoxLayout( 0, 0, 6, "layout220_2"); 

    payloadTextLabel = new QLabel( icmpEchoReqGroupBox, "payloadTextLabel" );
    layout220_2->addWidget( payloadTextLabel );
    spacer45_2 = new QSpacerItem( 110, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout220_2->addItem( spacer45_2 );

    payloadLineEdit = new QLineEdit( icmpEchoReqGroupBox, "payloadLineEdit" );
    payloadLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout220_2->addWidget( payloadLineEdit );

    icmpEchoReqGroupBoxLayout->addLayout( layout220_2, 4, 0 );

    layout47 = new QHBoxLayout( 0, 0, 6, "layout47"); 

    deviceTextLabel = new QLabel( icmpEchoReqGroupBox, "deviceTextLabel" );
    layout47->addWidget( deviceTextLabel );
    spacer42 = new QSpacerItem( 50, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout47->addItem( spacer42 );

    deviceLineEdit = new QLineEdit( icmpEchoReqGroupBox, "deviceLineEdit" );
    deviceLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout47->addWidget( deviceLineEdit );

    icmpEchoReqGroupBoxLayout->addLayout( layout47, 0, 0 );
    layout70->addWidget( icmpEchoReqGroupBox );
    spacer47 = new QSpacerItem( 20, 20, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout70->addItem( spacer47 );

    layout53 = new QHBoxLayout( 0, 0, 6, "layout53"); 
    spacer46 = new QSpacerItem( 90, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout53->addItem( spacer46 );

    generatePushButton = new QPushButton( this, "generatePushButton" );
    generatePushButton->setDefault( TRUE );
    layout53->addWidget( generatePushButton );

    cancelPushButton = new QPushButton( this, "cancelPushButton" );
    layout53->addWidget( cancelPushButton );
    layout70->addLayout( layout53 );

    icmpEchoReqFormLayout->addLayout( layout70, 0, 0 );
    languageChange();
    resize( QSize(420, 307).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( cancelPushButton, SIGNAL( clicked() ), this, SLOT( reject() ) );
    connect( generatePushButton, SIGNAL( clicked() ), this, SLOT( GenerateICMPReq() ) );
}

/*
 *  Destroys the object and frees any allocated resources
 */
icmpEchoReqForm::~icmpEchoReqForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void icmpEchoReqForm::languageChange()
{
    setCaption( tr( "ICMP Echo Request Form" ) );
    icmpEchoReqGroupBox->setTitle( tr( "ICMP Echo Request Detail" ) );
    sIPTextLabel->setText( tr( "Source IP            " ) );
    sIPLineEdit->setText( tr( "161.246.5.12" ) );
    dIPTextLabel->setText( tr( "Destination IP      " ) );
    dIPLineEdit->setText( tr( "161.246.5.6" ) );
    countTextLabel->setText( tr( "Number of Packet" ) );
    numberPacketlineEdit->setText( tr( "5" ) );
    payloadTextLabel->setText( tr( "Payload:              " ) );
    payloadLineEdit->setText( tr( "5" ) );
    deviceTextLabel->setText( tr( "Device                " ) );
    deviceLineEdit->setText( tr( "eth0" ) );
    generatePushButton->setText( tr( "Generate" ) );
    cancelPushButton->setText( tr( "Cancel" ) );
}

