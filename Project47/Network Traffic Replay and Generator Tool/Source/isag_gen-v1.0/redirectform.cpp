/****************************************************************************
** Form implementation generated from reading ui file 'redirectform.ui'
**
** Created: Thu Jan 27 19:28:12 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "redirectform.h"

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

#include "redirectform.ui.h"
/*
 *  Constructs a redirectForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
redirectForm::redirectForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "redirectForm" );
    setIcon( QPixmap::fromMimeSource( "designer_project.png" ) );
    redirectFormLayout = new QGridLayout( this, 1, 1, 11, 6, "redirectFormLayout"); 

    layout80 = new QVBoxLayout( 0, 0, 6, "layout80"); 

    redirectGroupBox = new QGroupBox( this, "redirectGroupBox" );
    redirectGroupBox->setColumnLayout(0, Qt::Vertical );
    redirectGroupBox->layout()->setSpacing( 6 );
    redirectGroupBox->layout()->setMargin( 11 );
    redirectGroupBoxLayout = new QGridLayout( redirectGroupBox->layout() );
    redirectGroupBoxLayout->setAlignment( Qt::AlignTop );

    layout145 = new QHBoxLayout( 0, 0, 6, "layout145"); 

    textLabel4 = new QLabel( redirectGroupBox, "textLabel4" );
    layout145->addWidget( textLabel4 );

    lineEdit_redirect_Device = new QLineEdit( redirectGroupBox, "lineEdit_redirect_Device" );
    lineEdit_redirect_Device->setAlignment( int( QLineEdit::AlignRight ) );
    layout145->addWidget( lineEdit_redirect_Device );

    redirectGroupBoxLayout->addLayout( layout145, 0, 0 );

    layout146 = new QHBoxLayout( 0, 0, 6, "layout146"); 

    sIPTextLabel = new QLabel( redirectGroupBox, "sIPTextLabel" );
    layout146->addWidget( sIPTextLabel );

    sIPLineEdit = new QLineEdit( redirectGroupBox, "sIPLineEdit" );
    sIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout146->addWidget( sIPLineEdit );

    redirectGroupBoxLayout->addLayout( layout146, 1, 0 );

    layout147 = new QHBoxLayout( 0, 0, 6, "layout147"); 

    dIPTextLabel = new QLabel( redirectGroupBox, "dIPTextLabel" );
    layout147->addWidget( dIPTextLabel );

    dIPLineEdit = new QLineEdit( redirectGroupBox, "dIPLineEdit" );
    dIPLineEdit->setFrameShape( QLineEdit::LineEditPanel );
    dIPLineEdit->setFrameShadow( QLineEdit::Sunken );
    dIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout147->addWidget( dIPLineEdit );

    redirectGroupBoxLayout->addLayout( layout147, 2, 0 );

    layout148 = new QHBoxLayout( 0, 0, 6, "layout148"); 

    gatewayIPTextLabel = new QLabel( redirectGroupBox, "gatewayIPTextLabel" );
    layout148->addWidget( gatewayIPTextLabel );

    gatewayIPLineEdit = new QLineEdit( redirectGroupBox, "gatewayIPLineEdit" );
    gatewayIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout148->addWidget( gatewayIPLineEdit );

    redirectGroupBoxLayout->addLayout( layout148, 3, 0 );

    layout149 = new QHBoxLayout( 0, 0, 6, "layout149"); 

    countTextLabel = new QLabel( redirectGroupBox, "countTextLabel" );
    layout149->addWidget( countTextLabel );

    numberPacketlineEdit = new QLineEdit( redirectGroupBox, "numberPacketlineEdit" );
    numberPacketlineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout149->addWidget( numberPacketlineEdit );

    redirectGroupBoxLayout->addLayout( layout149, 4, 0 );
    layout80->addWidget( redirectGroupBox );
    spacer210 = new QSpacerItem( 20, 30, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout80->addItem( spacer210 );

    layout231 = new QHBoxLayout( 0, 0, 6, "layout231"); 
    spacer209 = new QSpacerItem( 190, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout231->addItem( spacer209 );

    layout230 = new QHBoxLayout( 0, 0, 6, "layout230"); 

    generatePushButton = new QPushButton( this, "generatePushButton" );
    layout230->addWidget( generatePushButton );

    cancelPushButton = new QPushButton( this, "cancelPushButton" );
    layout230->addWidget( cancelPushButton );
    layout231->addLayout( layout230 );
    layout80->addLayout( layout231 );

    redirectFormLayout->addLayout( layout80, 0, 0 );
    languageChange();
    resize( QSize(402, 304).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( cancelPushButton, SIGNAL( clicked() ), this, SLOT( reject() ) );
    connect( generatePushButton, SIGNAL( clicked() ), this, SLOT( GenerateRedirect() ) );
}

/*
 *  Destroys the object and frees any allocated resources
 */
redirectForm::~redirectForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void redirectForm::languageChange()
{
    setCaption( tr( "ICMP Redirect" ) );
    redirectGroupBox->setTitle( tr( "ICMP Redirect Detail" ) );
    textLabel4->setText( tr( "Devic                                " ) );
    lineEdit_redirect_Device->setText( tr( "eth0" ) );
    sIPTextLabel->setText( tr( "Source IP:                        " ) );
    sIPLineEdit->setText( tr( "161.246.5.12" ) );
    dIPTextLabel->setText( tr( "Destination IP:                  " ) );
    dIPLineEdit->setText( tr( "161.246.5.6" ) );
    gatewayIPTextLabel->setText( tr( "Gateway IP:                      " ) );
    gatewayIPLineEdit->setText( tr( "161.246.5.254" ) );
    countTextLabel->setText( tr( "Number of Packet:            " ) );
    numberPacketlineEdit->setText( tr( "5" ) );
    generatePushButton->setText( tr( "Generate" ) );
    cancelPushButton->setText( tr( "Cancel" ) );
}

