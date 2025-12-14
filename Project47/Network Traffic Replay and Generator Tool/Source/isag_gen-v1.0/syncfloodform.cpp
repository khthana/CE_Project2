/****************************************************************************
** Form implementation generated from reading ui file 'syncfloodform.ui'
**
** Created: Thu Jan 27 19:28:19 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "syncfloodform.h"

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

#include "syncfloodform.ui.h"
/*
 *  Constructs a syncfloodForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
syncfloodForm::syncfloodForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "syncfloodForm" );
    setIcon( QPixmap::fromMimeSource( "designer_project.png" ) );
    syncfloodFormLayout = new QGridLayout( this, 1, 1, 11, 6, "syncfloodFormLayout"); 

    layout43 = new QVBoxLayout( 0, 0, 6, "layout43"); 

    synfloodGroupBox = new QGroupBox( this, "synfloodGroupBox" );
    synfloodGroupBox->setColumnLayout(0, Qt::Vertical );
    synfloodGroupBox->layout()->setSpacing( 6 );
    synfloodGroupBox->layout()->setMargin( 11 );
    synfloodGroupBoxLayout = new QGridLayout( synfloodGroupBox->layout() );
    synfloodGroupBoxLayout->setAlignment( Qt::AlignTop );

    layout42 = new QVBoxLayout( 0, 0, 6, "layout42"); 

    layout33 = new QHBoxLayout( 0, 0, 6, "layout33"); 

    deviceTextLabel = new QLabel( synfloodGroupBox, "deviceTextLabel" );
    layout33->addWidget( deviceTextLabel );
    spacer144 = new QSpacerItem( 180, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout33->addItem( spacer144 );

    deviceLineEdit = new QLineEdit( synfloodGroupBox, "deviceLineEdit" );
    deviceLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout33->addWidget( deviceLineEdit );
    layout42->addLayout( layout33 );

    layout41 = new QHBoxLayout( 0, 0, 6, "layout41"); 

    targetTextLabel = new QLabel( synfloodGroupBox, "targetTextLabel" );
    layout41->addWidget( targetTextLabel );

    targetIPLineEdit = new QLineEdit( synfloodGroupBox, "targetIPLineEdit" );
    targetIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout41->addWidget( targetIPLineEdit );
    layout42->addLayout( layout41 );

    layout170 = new QHBoxLayout( 0, 0, 6, "layout170"); 

    dPortTextLabel = new QLabel( synfloodGroupBox, "dPortTextLabel" );
    layout170->addWidget( dPortTextLabel );
    spacer40 = new QSpacerItem( 141, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout170->addItem( spacer40 );

    dPortLineEdit = new QLineEdit( synfloodGroupBox, "dPortLineEdit" );
    dPortLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout170->addWidget( dPortLineEdit );
    layout42->addLayout( layout170 );

    layout36 = new QHBoxLayout( 0, 0, 6, "layout36"); 

    numberPacketTextLabel = new QLabel( synfloodGroupBox, "numberPacketTextLabel" );
    layout36->addWidget( numberPacketTextLabel );

    numberPacketLineEdit = new QLineEdit( synfloodGroupBox, "numberPacketLineEdit" );
    numberPacketLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout36->addWidget( numberPacketLineEdit );
    layout42->addLayout( layout36 );

    layout40 = new QHBoxLayout( 0, 0, 6, "layout40"); 

    numberPacketSendTextLabel = new QLabel( synfloodGroupBox, "numberPacketSendTextLabel" );
    layout40->addWidget( numberPacketSendTextLabel );

    numberBurstLineEdit = new QLineEdit( synfloodGroupBox, "numberBurstLineEdit" );
    numberBurstLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout40->addWidget( numberBurstLineEdit );
    layout42->addLayout( layout40 );

    synfloodGroupBoxLayout->addLayout( layout42, 0, 0 );
    layout43->addWidget( synfloodGroupBox );

    layout38 = new QVBoxLayout( 0, 0, 6, "layout38"); 
    spacer9 = new QSpacerItem( 20, 50, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout38->addItem( spacer9 );

    layout13 = new QHBoxLayout( 0, 0, 6, "layout13"); 
    spacer8 = new QSpacerItem( 351, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout13->addItem( spacer8 );

    layout12 = new QHBoxLayout( 0, 0, 6, "layout12"); 

    generatePushButton = new QPushButton( this, "generatePushButton" );
    generatePushButton->setDefault( TRUE );
    layout12->addWidget( generatePushButton );

    cancelPushButton = new QPushButton( this, "cancelPushButton" );
    layout12->addWidget( cancelPushButton );
    layout13->addLayout( layout12 );
    layout38->addLayout( layout13 );
    layout43->addLayout( layout38 );

    syncfloodFormLayout->addLayout( layout43, 0, 0 );
    languageChange();
    resize( QSize(492, 345).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( cancelPushButton, SIGNAL( clicked() ), this, SLOT( close() ) );
    connect( generatePushButton, SIGNAL( clicked() ), this, SLOT( GenerateSyncflood() ) );
}

/*
 *  Destroys the object and frees any allocated resources
 */
syncfloodForm::~syncfloodForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void syncfloodForm::languageChange()
{
    setCaption( tr( "Syncflood Form" ) );
    synfloodGroupBox->setTitle( tr( "Synflood Form" ) );
    deviceTextLabel->setText( tr( "Device                     " ) );
    deviceLineEdit->setText( tr( "eth0" ) );
    targetTextLabel->setText( tr( "Target ( Destination IP ):                                      " ) );
    targetIPLineEdit->setText( tr( "161.246.5.6" ) );
    dPortTextLabel->setText( tr( "Destination Port:               " ) );
    dPortLineEdit->setText( tr( "21" ) );
    numberPacketTextLabel->setText( tr( "Number of packets to send per burst                   " ) );
    numberPacketLineEdit->setText( tr( "10" ) );
    numberPacketSendTextLabel->setText( tr( "Number packet bursts to send (defaults to 1) :    " ) );
    numberBurstLineEdit->setText( tr( "1" ) );
    generatePushButton->setText( tr( "Generate" ) );
    cancelPushButton->setText( tr( "Cancel" ) );
}

