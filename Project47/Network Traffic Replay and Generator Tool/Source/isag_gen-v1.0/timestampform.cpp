/****************************************************************************
** Form implementation generated from reading ui file 'timestampform.ui'
**
** Created: Thu Jan 27 19:35:28 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "timestampform.h"

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

#include "timestampform.ui.h"
/*
 *  Constructs a timestampForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
timestampForm::timestampForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "timestampForm" );
    setIcon( QPixmap::fromMimeSource( "designer_project.png" ) );
    timestampFormLayout = new QGridLayout( this, 1, 1, 11, 6, "timestampFormLayout"); 

    layout98 = new QGridLayout( 0, 1, 1, 0, 6, "layout98"); 
    spacer214 = new QSpacerItem( 20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout98->addItem( spacer214, 1, 0 );

    layout235 = new QHBoxLayout( 0, 0, 6, "layout235"); 
    spacer211 = new QSpacerItem( 181, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout235->addItem( spacer211 );

    layout234 = new QHBoxLayout( 0, 0, 6, "layout234"); 

    generatePushButton = new QPushButton( this, "generatePushButton" );
    layout234->addWidget( generatePushButton );

    cancelPushButton = new QPushButton( this, "cancelPushButton" );
    layout234->addWidget( cancelPushButton );
    layout235->addLayout( layout234 );

    layout98->addLayout( layout235, 2, 0 );

    timestampGroupBox = new QGroupBox( this, "timestampGroupBox" );
    timestampGroupBox->setColumnLayout(0, Qt::Vertical );
    timestampGroupBox->layout()->setSpacing( 6 );
    timestampGroupBox->layout()->setMargin( 11 );
    timestampGroupBoxLayout = new QGridLayout( timestampGroupBox->layout() );
    timestampGroupBoxLayout->setAlignment( Qt::AlignTop );

    layout195 = new QVBoxLayout( 0, 0, 6, "layout195"); 

    layout194 = new QHBoxLayout( 0, 0, 6, "layout194"); 

    deviceTextLabel = new QLabel( timestampGroupBox, "deviceTextLabel" );
    layout194->addWidget( deviceTextLabel );

    deviceLineEdit = new QLineEdit( timestampGroupBox, "deviceLineEdit" );
    deviceLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout194->addWidget( deviceLineEdit );
    layout195->addLayout( layout194 );

    layout236 = new QHBoxLayout( 0, 0, 6, "layout236"); 

    sIPTextLabel = new QLabel( timestampGroupBox, "sIPTextLabel" );
    layout236->addWidget( sIPTextLabel );

    sIPLineEdit = new QLineEdit( timestampGroupBox, "sIPLineEdit" );
    sIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout236->addWidget( sIPLineEdit );
    layout195->addLayout( layout236 );

    layout237 = new QHBoxLayout( 0, 0, 6, "layout237"); 

    dIPTextLabel = new QLabel( timestampGroupBox, "dIPTextLabel" );
    layout237->addWidget( dIPTextLabel );

    dIPLineEdit = new QLineEdit( timestampGroupBox, "dIPLineEdit" );
    dIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout237->addWidget( dIPLineEdit );
    layout195->addLayout( layout237 );

    layout78 = new QHBoxLayout( 0, 0, 6, "layout78"); 

    countTextLabel = new QLabel( timestampGroupBox, "countTextLabel" );
    layout78->addWidget( countTextLabel );

    numberPacketlineEdit = new QLineEdit( timestampGroupBox, "numberPacketlineEdit" );
    numberPacketlineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout78->addWidget( numberPacketlineEdit );
    layout195->addLayout( layout78 );

    timestampGroupBoxLayout->addLayout( layout195, 0, 0 );

    layout98->addWidget( timestampGroupBox, 0, 0 );

    timestampFormLayout->addLayout( layout98, 0, 0 );
    languageChange();
    resize( QSize(405, 280).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( cancelPushButton, SIGNAL( clicked() ), this, SLOT( reject() ) );
    connect( generatePushButton, SIGNAL( clicked() ), this, SLOT( GenerateTimeStamp() ) );
}

/*
 *  Destroys the object and frees any allocated resources
 */
timestampForm::~timestampForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void timestampForm::languageChange()
{
    setCaption( tr( "ICMP Timestamp" ) );
    generatePushButton->setText( tr( "Generate" ) );
    cancelPushButton->setText( tr( "Cancel" ) );
    timestampGroupBox->setTitle( tr( "ICMP TimeStamp Detail" ) );
    deviceTextLabel->setText( tr( "Device                              " ) );
    deviceLineEdit->setText( tr( "eth0" ) );
    sIPTextLabel->setText( tr( "Source IP:                        " ) );
    sIPLineEdit->setText( tr( "161.246.5.12" ) );
    dIPTextLabel->setText( tr( "Destination IP:                 " ) );
    dIPLineEdit->setText( tr( "161.246.5.6" ) );
    countTextLabel->setText( tr( "Number of Packet:           " ) );
    numberPacketlineEdit->setText( tr( "5" ) );
}

