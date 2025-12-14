/****************************************************************************
** Form implementation generated from reading ui file 'tcpform.ui'
**
** Created: Thu Jan 27 19:39:33 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "tcpform.h"

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

#include "tcpform.ui.h"
/*
 *  Constructs a tcpForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
tcpForm::tcpForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "tcpForm" );
    setIcon( QPixmap::fromMimeSource( "designer_project.png" ) );
    tcpFormLayout = new QGridLayout( this, 1, 1, 11, 6, "tcpFormLayout"); 

    layout123 = new QVBoxLayout( 0, 0, 6, "layout123"); 

    tcpGroupBox = new QGroupBox( this, "tcpGroupBox" );
    tcpGroupBox->setFrameShape( QGroupBox::GroupBoxPanel );
    tcpGroupBox->setFrameShadow( QGroupBox::Sunken );
    tcpGroupBox->setColumnLayout(0, Qt::Vertical );
    tcpGroupBox->layout()->setSpacing( 6 );
    tcpGroupBox->layout()->setMargin( 11 );
    tcpGroupBoxLayout = new QGridLayout( tcpGroupBox->layout() );
    tcpGroupBoxLayout->setAlignment( Qt::AlignTop );

    dPortTextLabel = new QLabel( tcpGroupBox, "dPortTextLabel" );

    tcpGroupBoxLayout->addMultiCellWidget( dPortTextLabel, 4, 4, 0, 3 );

    sPortTextLabel = new QLabel( tcpGroupBox, "sPortTextLabel" );

    tcpGroupBoxLayout->addMultiCellWidget( sPortTextLabel, 3, 3, 0, 2 );

    dIPTextLabe = new QLabel( tcpGroupBox, "dIPTextLabe" );

    tcpGroupBoxLayout->addMultiCellWidget( dIPTextLabe, 2, 2, 0, 3 );

    deviceTextLabel = new QLabel( tcpGroupBox, "deviceTextLabel" );

    tcpGroupBoxLayout->addWidget( deviceTextLabel, 0, 0 );

    sIPTextLabel = new QLabel( tcpGroupBox, "sIPTextLabel" );

    tcpGroupBoxLayout->addMultiCellWidget( sIPTextLabel, 1, 1, 0, 1 );

    deviceLineEdit = new QLineEdit( tcpGroupBox, "deviceLineEdit" );
    deviceLineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    tcpGroupBoxLayout->addWidget( deviceLineEdit, 0, 5 );

    sourceIPLineEdit = new QLineEdit( tcpGroupBox, "sourceIPLineEdit" );
    sourceIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    tcpGroupBoxLayout->addWidget( sourceIPLineEdit, 1, 5 );

    desIPLineEdit = new QLineEdit( tcpGroupBox, "desIPLineEdit" );
    desIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    tcpGroupBoxLayout->addWidget( desIPLineEdit, 2, 5 );

    sPortLineEdit = new QLineEdit( tcpGroupBox, "sPortLineEdit" );
    sPortLineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    tcpGroupBoxLayout->addWidget( sPortLineEdit, 3, 5 );

    dPortLineEdit = new QLineEdit( tcpGroupBox, "dPortLineEdit" );
    dPortLineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    tcpGroupBoxLayout->addWidget( dPortLineEdit, 4, 5 );

    payloadTextLabel = new QLabel( tcpGroupBox, "payloadTextLabel" );

    tcpGroupBoxLayout->addWidget( payloadTextLabel, 5, 0 );

    numberPacketlineEdit = new QLineEdit( tcpGroupBox, "numberPacketlineEdit" );
    numberPacketlineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    tcpGroupBoxLayout->addWidget( numberPacketlineEdit, 5, 5 );
    layout123->addWidget( tcpGroupBox );
    spacer30 = new QSpacerItem( 20, 69, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout123->addItem( spacer30 );

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
    layout123->addLayout( layout40 );

    tcpFormLayout->addLayout( layout123, 0, 0 );
    languageChange();
    resize( QSize(367, 350).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( cancelPushButton, SIGNAL( clicked() ), this, SLOT( reject() ) );
    connect( generatePushButton, SIGNAL( clicked() ), this, SLOT( GenerateTCP() ) );

    // tab order
    setTabOrder( deviceLineEdit, sourceIPLineEdit );
    setTabOrder( sourceIPLineEdit, desIPLineEdit );
    setTabOrder( desIPLineEdit, sPortLineEdit );
    setTabOrder( sPortLineEdit, dPortLineEdit );
    setTabOrder( dPortLineEdit, generatePushButton );
    setTabOrder( generatePushButton, cancelPushButton );
}

/*
 *  Destroys the object and frees any allocated resources
 */
tcpForm::~tcpForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void tcpForm::languageChange()
{
    setCaption( tr( "TCP Form" ) );
    tcpGroupBox->setTitle( tr( "TCP Detail" ) );
    dPortTextLabel->setText( tr( "Destination Port:" ) );
    sPortTextLabel->setText( tr( "Source Port:" ) );
    dIPTextLabe->setText( tr( "Destination  IP:" ) );
    deviceTextLabel->setText( tr( "Device:" ) );
    sIPTextLabel->setText( tr( "Source IP:" ) );
    deviceLineEdit->setText( tr( "eth0" ) );
    sourceIPLineEdit->setText( tr( "161.246.5.12" ) );
    desIPLineEdit->setText( tr( "161.246.5.6" ) );
    sPortLineEdit->setText( tr( "20" ) );
    dPortLineEdit->setText( tr( "21" ) );
    payloadTextLabel->setText( tr( "Number Of Packet:" ) );
    numberPacketlineEdit->setText( tr( "5" ) );
    generatePushButton->setText( tr( "Generate" ) );
    cancelPushButton->setText( tr( "Cancel" ) );
}

