/****************************************************************************
** Form implementation generated from reading ui file 'smurfform.ui'
**
** Created: Thu Jan 27 19:28:15 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "smurfform.h"

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

#include "smurfform.ui.h"
/*
 *  Constructs a smurfForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
smurfForm::smurfForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "smurfForm" );
    setIcon( QPixmap::fromMimeSource( "designer_project.png" ) );
    smurfFormLayout = new QGridLayout( this, 1, 1, 11, 6, "smurfFormLayout"); 

    layout54 = new QVBoxLayout( 0, 0, 6, "layout54"); 

    smurfGroupBox = new QGroupBox( this, "smurfGroupBox" );
    smurfGroupBox->setColumnLayout(0, Qt::Vertical );
    smurfGroupBox->layout()->setSpacing( 6 );
    smurfGroupBox->layout()->setMargin( 11 );
    smurfGroupBoxLayout = new QGridLayout( smurfGroupBox->layout() );
    smurfGroupBoxLayout->setAlignment( Qt::AlignTop );

    layout52 = new QVBoxLayout( 0, 0, 6, "layout52"); 

    layout158 = new QHBoxLayout( 0, 0, 6, "layout158"); 

    deviceTextLabel = new QLabel( smurfGroupBox, "deviceTextLabel" );
    layout158->addWidget( deviceTextLabel );
    spacer139 = new QSpacerItem( 171, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout158->addItem( spacer139 );

    lineEdit_smurf_Device = new QLineEdit( smurfGroupBox, "lineEdit_smurf_Device" );
    lineEdit_smurf_Device->setAlignment( int( QLineEdit::AlignRight ) );
    layout158->addWidget( lineEdit_smurf_Device );
    layout52->addLayout( layout158 );

    layout187 = new QHBoxLayout( 0, 0, 6, "layout187"); 

    targetTextLabel = new QLabel( smurfGroupBox, "targetTextLabel" );
    layout187->addWidget( targetTextLabel );

    dIPLineEdit = new QLineEdit( smurfGroupBox, "dIPLineEdit" );
    dIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout187->addWidget( dIPLineEdit );
    layout52->addLayout( layout187 );

    layout189 = new QHBoxLayout( 0, 0, 6, "layout189"); 

    countTextLabel = new QLabel( smurfGroupBox, "countTextLabel" );
    layout189->addWidget( countTextLabel );
    spacer12 = new QSpacerItem( 148, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout189->addItem( spacer12 );

    numberPacketlineEdit = new QLineEdit( smurfGroupBox, "numberPacketlineEdit" );
    numberPacketlineEdit->setCursorPosition( 2 );
    numberPacketlineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout189->addWidget( numberPacketlineEdit );
    layout52->addLayout( layout189 );

    layout190 = new QHBoxLayout( 0, 0, 6, "layout190"); 

    amplifierTextLabel = new QLabel( smurfGroupBox, "amplifierTextLabel" );
    layout190->addWidget( amplifierTextLabel );

    networkIPlineEdit = new QLineEdit( smurfGroupBox, "networkIPlineEdit" );
    networkIPlineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout190->addWidget( networkIPlineEdit );
    layout52->addLayout( layout190 );

    smurfGroupBoxLayout->addLayout( layout52, 0, 0 );
    layout54->addWidget( smurfGroupBox );
    spacer14 = new QSpacerItem( 20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout54->addItem( spacer14 );

    layout16 = new QHBoxLayout( 0, 0, 6, "layout16"); 
    spacer13 = new QSpacerItem( 241, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout16->addItem( spacer13 );

    layout15 = new QHBoxLayout( 0, 0, 6, "layout15"); 

    generatePushButton = new QPushButton( this, "generatePushButton" );
    generatePushButton->setDefault( TRUE );
    layout15->addWidget( generatePushButton );

    cancelPushButton = new QPushButton( this, "cancelPushButton" );
    layout15->addWidget( cancelPushButton );
    layout16->addLayout( layout15 );
    layout54->addLayout( layout16 );

    smurfFormLayout->addLayout( layout54, 0, 0 );
    languageChange();
    resize( QSize(457, 278).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( cancelPushButton, SIGNAL( clicked() ), this, SLOT( reject() ) );
    connect( generatePushButton, SIGNAL( clicked() ), this, SLOT( GenerateSmurf() ) );

    // tab order
    setTabOrder( dIPLineEdit, numberPacketlineEdit );
    setTabOrder( numberPacketlineEdit, networkIPlineEdit );
    setTabOrder( networkIPlineEdit, generatePushButton );
    setTabOrder( generatePushButton, cancelPushButton );
}

/*
 *  Destroys the object and frees any allocated resources
 */
smurfForm::~smurfForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void smurfForm::languageChange()
{
    setCaption( tr( "Smurf Form" ) );
    smurfGroupBox->setTitle( tr( "Smurf Form" ) );
    deviceTextLabel->setText( tr( "Device         " ) );
    lineEdit_smurf_Device->setText( tr( "eth0" ) );
    targetTextLabel->setText( tr( "Target ( Destination IP ) :                      " ) );
    dIPLineEdit->setText( tr( "161.246.5.6" ) );
    countTextLabel->setText( tr( "Count :             " ) );
    numberPacketlineEdit->setText( tr( "10" ) );
    amplifierTextLabel->setText( tr( "Amplifier (IP network):                           " ) );
    networkIPlineEdit->setText( tr( "161.246.5.254" ) );
    generatePushButton->setText( tr( "Generate" ) );
    cancelPushButton->setText( tr( "Cancel" ) );
}

