/****************************************************************************
** Form implementation generated from reading ui file 'udpform.ui'
**
** Created: Thu Jan 27 19:39:40 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "udpform.h"

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

#include "udpform.ui.h"
/*
 *  Constructs a udpForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
udpForm::udpForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "udpForm" );
    setIcon( QPixmap::fromMimeSource( "designer_project.png" ) );
    udpFormLayout = new QGridLayout( this, 1, 1, 11, 6, "udpFormLayout"); 

    layout127 = new QGridLayout( 0, 1, 1, 0, 6, "layout127"); 

    layout40 = new QHBoxLayout( 0, 0, 6, "layout40"); 
    spacer28 = new QSpacerItem( 221, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout40->addItem( spacer28 );

    layout39 = new QHBoxLayout( 0, 0, 6, "layout39"); 

    generatePushButton = new QPushButton( this, "generatePushButton" );
    generatePushButton->setDefault( TRUE );
    layout39->addWidget( generatePushButton );

    cancelPushButton = new QPushButton( this, "cancelPushButton" );
    layout39->addWidget( cancelPushButton );
    layout40->addLayout( layout39 );

    layout127->addLayout( layout40, 2, 0 );
    spacer30 = new QSpacerItem( 20, 68, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout127->addItem( spacer30, 1, 0 );

    utpGroupBox = new QGroupBox( this, "utpGroupBox" );
    utpGroupBox->setColumnLayout(0, Qt::Vertical );
    utpGroupBox->layout()->setSpacing( 6 );
    utpGroupBox->layout()->setMargin( 11 );
    utpGroupBoxLayout = new QGridLayout( utpGroupBox->layout() );
    utpGroupBoxLayout->setAlignment( Qt::AlignTop );

    devicetextLabel = new QLabel( utpGroupBox, "devicetextLabel" );

    utpGroupBoxLayout->addWidget( devicetextLabel, 0, 0 );

    sIPtextLabel = new QLabel( utpGroupBox, "sIPtextLabel" );

    utpGroupBoxLayout->addMultiCellWidget( sIPtextLabel, 1, 1, 0, 1 );

    dIPtextLabel = new QLabel( utpGroupBox, "dIPtextLabel" );

    utpGroupBoxLayout->addMultiCellWidget( dIPtextLabel, 2, 2, 0, 3 );

    sPortTextLabel = new QLabel( utpGroupBox, "sPortTextLabel" );

    utpGroupBoxLayout->addMultiCellWidget( sPortTextLabel, 3, 3, 0, 2 );

    dPortTextLabel = new QLabel( utpGroupBox, "dPortTextLabel" );

    utpGroupBoxLayout->addMultiCellWidget( dPortTextLabel, 4, 4, 0, 3 );

    payloadTextLabel = new QLabel( utpGroupBox, "payloadTextLabel" );

    utpGroupBoxLayout->addWidget( payloadTextLabel, 5, 0 );

    deviceLineEdit = new QLineEdit( utpGroupBox, "deviceLineEdit" );
    deviceLineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    utpGroupBoxLayout->addWidget( deviceLineEdit, 0, 5 );

    sourceIPLineEdit = new QLineEdit( utpGroupBox, "sourceIPLineEdit" );
    sourceIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    utpGroupBoxLayout->addWidget( sourceIPLineEdit, 1, 5 );

    desIPLineEdit = new QLineEdit( utpGroupBox, "desIPLineEdit" );
    desIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    utpGroupBoxLayout->addWidget( desIPLineEdit, 2, 5 );

    sPortLineEdit = new QLineEdit( utpGroupBox, "sPortLineEdit" );
    sPortLineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    utpGroupBoxLayout->addWidget( sPortLineEdit, 3, 5 );

    dPortLineEdit = new QLineEdit( utpGroupBox, "dPortLineEdit" );
    dPortLineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    utpGroupBoxLayout->addWidget( dPortLineEdit, 4, 5 );

    numberPacketlineEdit = new QLineEdit( utpGroupBox, "numberPacketlineEdit" );
    numberPacketlineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    utpGroupBoxLayout->addWidget( numberPacketlineEdit, 5, 5 );

    layout127->addWidget( utpGroupBox, 0, 0 );

    udpFormLayout->addLayout( layout127, 0, 0 );
    languageChange();
    resize( QSize(356, 349).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( cancelPushButton, SIGNAL( clicked() ), this, SLOT( reject() ) );
    connect( generatePushButton, SIGNAL( clicked() ), this, SLOT( GenerateUDP() ) );

    // tab order
    setTabOrder( deviceLineEdit, sourceIPLineEdit );
    setTabOrder( sourceIPLineEdit, desIPLineEdit );
    setTabOrder( desIPLineEdit, sPortLineEdit );
    setTabOrder( sPortLineEdit, dPortLineEdit );
    setTabOrder( dPortLineEdit, numberPacketlineEdit );
    setTabOrder( numberPacketlineEdit, generatePushButton );
    setTabOrder( generatePushButton, cancelPushButton );
}

/*
 *  Destroys the object and frees any allocated resources
 */
udpForm::~udpForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void udpForm::languageChange()
{
    setCaption( tr( "UDP Form" ) );
    generatePushButton->setText( tr( "Generate" ) );
    cancelPushButton->setText( tr( "Cancel" ) );
    utpGroupBox->setTitle( tr( "UTP Detail" ) );
    devicetextLabel->setText( tr( "Device" ) );
    sIPtextLabel->setText( tr( "Source IP" ) );
    dIPtextLabel->setText( tr( "Destination  IP" ) );
    sPortTextLabel->setText( tr( "Source Port" ) );
    dPortTextLabel->setText( tr( "Destination Port" ) );
    payloadTextLabel->setText( tr( "Number Of Packet" ) );
    deviceLineEdit->setText( tr( "eth0" ) );
    sourceIPLineEdit->setText( tr( "161.246.5.12" ) );
    desIPLineEdit->setText( tr( "161.246.5.6" ) );
    sPortLineEdit->setText( tr( "20" ) );
    dPortLineEdit->setText( tr( "21" ) );
    numberPacketlineEdit->setText( tr( "5" ) );
}

