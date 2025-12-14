/****************************************************************************
** Form implementation generated from reading ui file 'timeexceedform.ui'
**
** Created: Thu Jan 27 19:35:21 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "timeexceedform.h"

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

#include "timeexceedform.ui.h"
/*
 *  Constructs a timeexceedForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
timeexceedForm::timeexceedForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "timeexceedForm" );
    setIcon( QPixmap::fromMimeSource( "designer_project.png" ) );
    timeexceedFormLayout = new QGridLayout( this, 1, 1, 11, 6, "timeexceedFormLayout"); 

    layout89 = new QVBoxLayout( 0, 0, 6, "layout89"); 

    timeexceedGroupBox = new QGroupBox( this, "timeexceedGroupBox" );
    timeexceedGroupBox->setColumnLayout(0, Qt::Vertical );
    timeexceedGroupBox->layout()->setSpacing( 6 );
    timeexceedGroupBox->layout()->setMargin( 11 );
    timeexceedGroupBoxLayout = new QGridLayout( timeexceedGroupBox->layout() );
    timeexceedGroupBoxLayout->setAlignment( Qt::AlignTop );

    layout186 = new QVBoxLayout( 0, 0, 6, "layout186"); 

    layout185 = new QHBoxLayout( 0, 0, 6, "layout185"); 

    deviceTextLabel = new QLabel( timeexceedGroupBox, "deviceTextLabel" );
    layout185->addWidget( deviceTextLabel );

    deviceLineEdit = new QLineEdit( timeexceedGroupBox, "deviceLineEdit" );
    deviceLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout185->addWidget( deviceLineEdit );
    layout186->addLayout( layout185 );

    layout236 = new QHBoxLayout( 0, 0, 6, "layout236"); 

    sIPTextLabel = new QLabel( timeexceedGroupBox, "sIPTextLabel" );
    layout236->addWidget( sIPTextLabel );

    sIPLineEdit = new QLineEdit( timeexceedGroupBox, "sIPLineEdit" );
    sIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout236->addWidget( sIPLineEdit );
    layout186->addLayout( layout236 );

    layout237 = new QHBoxLayout( 0, 0, 6, "layout237"); 

    dIPTextLabel = new QLabel( timeexceedGroupBox, "dIPTextLabel" );
    layout237->addWidget( dIPTextLabel );

    dIPLineEdit = new QLineEdit( timeexceedGroupBox, "dIPLineEdit" );
    dIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout237->addWidget( dIPLineEdit );
    layout186->addLayout( layout237 );

    layout70 = new QHBoxLayout( 0, 0, 6, "layout70"); 

    countTextLabel = new QLabel( timeexceedGroupBox, "countTextLabel" );
    layout70->addWidget( countTextLabel );

    numberPacketlineEdit = new QLineEdit( timeexceedGroupBox, "numberPacketlineEdit" );
    numberPacketlineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout70->addWidget( numberPacketlineEdit );
    layout186->addLayout( layout70 );

    timeexceedGroupBoxLayout->addLayout( layout186, 0, 0 );
    layout89->addWidget( timeexceedGroupBox );
    spacer214 = new QSpacerItem( 20, 45, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout89->addItem( spacer214 );

    layout235 = new QHBoxLayout( 0, 0, 6, "layout235"); 
    spacer211 = new QSpacerItem( 181, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout235->addItem( spacer211 );

    layout234 = new QHBoxLayout( 0, 0, 6, "layout234"); 

    generatePushButton = new QPushButton( this, "generatePushButton" );
    layout234->addWidget( generatePushButton );

    cancelPushButton = new QPushButton( this, "cancelPushButton" );
    layout234->addWidget( cancelPushButton );
    layout235->addLayout( layout234 );
    layout89->addLayout( layout235 );

    timeexceedFormLayout->addLayout( layout89, 0, 0 );
    languageChange();
    resize( QSize(404, 276).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( cancelPushButton, SIGNAL( clicked() ), this, SLOT( reject() ) );
    connect( generatePushButton, SIGNAL( clicked() ), this, SLOT( GenerateTimeExceed() ) );

    // tab order
    setTabOrder( sIPLineEdit, dIPLineEdit );
    setTabOrder( dIPLineEdit, generatePushButton );
    setTabOrder( generatePushButton, cancelPushButton );
}

/*
 *  Destroys the object and frees any allocated resources
 */
timeexceedForm::~timeexceedForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void timeexceedForm::languageChange()
{
    setCaption( tr( "ICMP Timeexceed" ) );
    timeexceedGroupBox->setTitle( tr( "ICMP TimeExceed Detail" ) );
    deviceTextLabel->setText( tr( "Device                            " ) );
    deviceLineEdit->setText( tr( "eth0" ) );
    sIPTextLabel->setText( tr( "Source IP:                      " ) );
    sIPLineEdit->setText( tr( "161.246.5.12" ) );
    dIPTextLabel->setText( tr( "Destination IP:                " ) );
    dIPLineEdit->setText( tr( "161.246.5.6" ) );
    countTextLabel->setText( tr( "Number of Packet:          " ) );
    numberPacketlineEdit->setText( tr( "5" ) );
    generatePushButton->setText( tr( "Generate" ) );
    cancelPushButton->setText( tr( "Cancel" ) );
}

