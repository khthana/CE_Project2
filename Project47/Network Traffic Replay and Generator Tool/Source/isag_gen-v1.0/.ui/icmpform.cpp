/****************************************************************************
** Form implementation generated from reading ui file 'icmpform.ui'
**
** Created: Fri Nov 19 09:56:15 2004
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.3   edited Nov 24 2003 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "icmpform.h"

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

#include "../icmpform.ui.h"
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

    QWidget* privateLayoutWidget = new QWidget( this, "layout53" );
    privateLayoutWidget->setGeometry( QRect( 32, 285, 388, 35 ) );
    layout53 = new QHBoxLayout( privateLayoutWidget, 11, 6, "layout53"); 
    spacer46 = new QSpacerItem( 90, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout53->addItem( spacer46 );

    backPushButton = new QPushButton( privateLayoutWidget, "backPushButton" );
    layout53->addWidget( backPushButton );

    generatePushButton = new QPushButton( privateLayoutWidget, "generatePushButton" );
    generatePushButton->setDefault( TRUE );
    layout53->addWidget( generatePushButton );

    cancelPushButton = new QPushButton( privateLayoutWidget, "cancelPushButton" );
    layout53->addWidget( cancelPushButton );

    icmpEchoReqGroupBox = new QGroupBox( this, "icmpEchoReqGroupBox" );
    icmpEchoReqGroupBox->setGeometry( QRect( 32, 32, 388, 210 ) );
    icmpEchoReqGroupBox->setColumnLayout(0, Qt::Vertical );
    icmpEchoReqGroupBox->layout()->setSpacing( 6 );
    icmpEchoReqGroupBox->layout()->setMargin( 11 );
    icmpEchoReqGroupBoxLayout = new QGridLayout( icmpEchoReqGroupBox->layout() );
    icmpEchoReqGroupBoxLayout->setAlignment( Qt::AlignTop );

    deviceTextLabel = new QLabel( icmpEchoReqGroupBox, "deviceTextLabel" );

    icmpEchoReqGroupBoxLayout->addMultiCellWidget( deviceTextLabel, 0, 1, 0, 1 );

    deviceLineEdit = new QLineEdit( icmpEchoReqGroupBox, "deviceLineEdit" );
    deviceLineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    icmpEchoReqGroupBoxLayout->addMultiCellWidget( deviceLineEdit, 0, 1, 4, 4 );
    spacer42 = new QSpacerItem( 110, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    icmpEchoReqGroupBoxLayout->addMultiCell( spacer42, 1, 1, 1, 3 );
    spacer43 = new QSpacerItem( 101, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    icmpEchoReqGroupBoxLayout->addMultiCell( spacer43, 2, 2, 2, 3 );

    sIPTextLabel = new QLabel( icmpEchoReqGroupBox, "sIPTextLabel" );

    icmpEchoReqGroupBoxLayout->addMultiCellWidget( sIPTextLabel, 2, 2, 0, 1 );

    sIPLineEdit = new QLineEdit( icmpEchoReqGroupBox, "sIPLineEdit" );
    sIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    icmpEchoReqGroupBoxLayout->addWidget( sIPLineEdit, 2, 4 );

    dIPLineEdit = new QLineEdit( icmpEchoReqGroupBox, "dIPLineEdit" );
    dIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    icmpEchoReqGroupBoxLayout->addWidget( dIPLineEdit, 3, 4 );
    spacer44 = new QSpacerItem( 70, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    icmpEchoReqGroupBoxLayout->addItem( spacer44, 3, 3 );

    dIPTextLabel = new QLabel( icmpEchoReqGroupBox, "dIPTextLabel" );

    icmpEchoReqGroupBoxLayout->addMultiCellWidget( dIPTextLabel, 3, 3, 0, 2 );

    countLineEdit = new QLineEdit( icmpEchoReqGroupBox, "countLineEdit" );
    countLineEdit->setAlignment( int( QLineEdit::AlignRight ) );

    icmpEchoReqGroupBoxLayout->addWidget( countLineEdit, 4, 4 );

    countTextLabel = new QLabel( icmpEchoReqGroupBox, "countTextLabel" );

    icmpEchoReqGroupBoxLayout->addWidget( countTextLabel, 4, 0 );
    spacer45 = new QSpacerItem( 110, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    icmpEchoReqGroupBoxLayout->addMultiCell( spacer45, 4, 4, 1, 3 );
    languageChange();
    resize( QSize(452, 352).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( cancelPushButton, SIGNAL( clicked() ), this, SLOT( reject() ) );
    connect( generatePushButton, SIGNAL( clicked() ), this, SLOT( GenerateICMP() ) );
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
    backPushButton->setText( tr( "Back" ) );
    generatePushButton->setText( tr( "Generate" ) );
    cancelPushButton->setText( tr( "Cancel" ) );
    icmpEchoReqGroupBox->setTitle( tr( "ICMP Echo Request Detail" ) );
    deviceTextLabel->setText( tr( "Device" ) );
    deviceLineEdit->setText( tr( "eth0" ) );
    sIPTextLabel->setText( tr( "Source IP" ) );
    sIPLineEdit->setText( tr( "161.246.5.5" ) );
    dIPTextLabel->setText( tr( "Destination IP" ) );
    countTextLabel->setText( tr( "Count" ) );
}

