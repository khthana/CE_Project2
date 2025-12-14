/****************************************************************************
** Form implementation generated from reading ui file 'arp_form.ui'
**
** Created: Thu Jan 27 19:27:48 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "arp_form.h"

#include <qvariant.h>
#include <qpushbutton.h>
#include <qgroupbox.h>
#include <qlabel.h>
#include <qlineedit.h>
#include <qcombobox.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qimage.h>
#include <qpixmap.h>

#include "arp_form.ui.h"
/*
 *  Constructs a ARP_Form as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
ARP_Form::ARP_Form( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "ARP_Form" );
    setIcon( QPixmap::fromMimeSource( "designer_project.png" ) );
    ARP_FormLayout = new QGridLayout( this, 1, 1, 11, 6, "ARP_FormLayout"); 
    spacer114 = new QSpacerItem( 20, 16, QSizePolicy::Minimum, QSizePolicy::Expanding );
    ARP_FormLayout->addItem( spacer114, 1, 0 );

    layout85 = new QHBoxLayout( 0, 0, 6, "layout85"); 
    spacer113 = new QSpacerItem( 320, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout85->addItem( spacer113 );

    layout84 = new QHBoxLayout( 0, 0, 6, "layout84"); 

    Button_Arp_Generate = new QPushButton( this, "Button_Arp_Generate" );
    Button_Arp_Generate->setDefault( TRUE );
    layout84->addWidget( Button_Arp_Generate );

    Button_Arp_cancel = new QPushButton( this, "Button_Arp_cancel" );
    layout84->addWidget( Button_Arp_cancel );
    layout85->addLayout( layout84 );

    ARP_FormLayout->addLayout( layout85, 2, 0 );

    arpGroupBox = new QGroupBox( this, "arpGroupBox" );
    arpGroupBox->setColumnLayout(0, Qt::Vertical );
    arpGroupBox->layout()->setSpacing( 6 );
    arpGroupBox->layout()->setMargin( 11 );
    arpGroupBoxLayout = new QGridLayout( arpGroupBox->layout() );
    arpGroupBoxLayout->setAlignment( Qt::AlignTop );

    layout105 = new QHBoxLayout( 0, 0, 6, "layout105"); 

    textLabel3_3 = new QLabel( arpGroupBox, "textLabel3_3" );
    layout105->addWidget( textLabel3_3 );

    lineEdit_Arp_Smac1 = new QLineEdit( arpGroupBox, "lineEdit_Arp_Smac1" );
    layout105->addWidget( lineEdit_Arp_Smac1 );

    lineEdit_Arp_Smac2 = new QLineEdit( arpGroupBox, "lineEdit_Arp_Smac2" );
    layout105->addWidget( lineEdit_Arp_Smac2 );

    lineEdit_Arp_Smac3 = new QLineEdit( arpGroupBox, "lineEdit_Arp_Smac3" );
    layout105->addWidget( lineEdit_Arp_Smac3 );

    lineEdit_Arp_Smac4 = new QLineEdit( arpGroupBox, "lineEdit_Arp_Smac4" );
    layout105->addWidget( lineEdit_Arp_Smac4 );

    lineEdit_Arp_Smac5 = new QLineEdit( arpGroupBox, "lineEdit_Arp_Smac5" );
    layout105->addWidget( lineEdit_Arp_Smac5 );

    lineEdit_Arp_Smac6 = new QLineEdit( arpGroupBox, "lineEdit_Arp_Smac6" );
    layout105->addWidget( lineEdit_Arp_Smac6 );

    arpGroupBoxLayout->addLayout( layout105, 3, 0 );

    layout107 = new QHBoxLayout( 0, 0, 6, "layout107"); 

    textLabel3_4 = new QLabel( arpGroupBox, "textLabel3_4" );
    layout107->addWidget( textLabel3_4 );

    lineEdit_Arp_Dmac1 = new QLineEdit( arpGroupBox, "lineEdit_Arp_Dmac1" );
    layout107->addWidget( lineEdit_Arp_Dmac1 );

    lineEdit_Arp_Dmac2 = new QLineEdit( arpGroupBox, "lineEdit_Arp_Dmac2" );
    layout107->addWidget( lineEdit_Arp_Dmac2 );

    lineEdit_Arp_Dmac3 = new QLineEdit( arpGroupBox, "lineEdit_Arp_Dmac3" );
    layout107->addWidget( lineEdit_Arp_Dmac3 );

    lineEdit_Arp_Dmac4 = new QLineEdit( arpGroupBox, "lineEdit_Arp_Dmac4" );
    layout107->addWidget( lineEdit_Arp_Dmac4 );

    lineEdit_Arp_Dmac5 = new QLineEdit( arpGroupBox, "lineEdit_Arp_Dmac5" );
    layout107->addWidget( lineEdit_Arp_Dmac5 );

    lineEdit_Arp_Dmac6 = new QLineEdit( arpGroupBox, "lineEdit_Arp_Dmac6" );
    layout107->addWidget( lineEdit_Arp_Dmac6 );

    arpGroupBoxLayout->addLayout( layout107, 5, 0 );

    layout112 = new QHBoxLayout( 0, 0, 6, "layout112"); 

    textLabel2 = new QLabel( arpGroupBox, "textLabel2" );
    layout112->addWidget( textLabel2 );
    spacer94 = new QSpacerItem( 240, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout112->addItem( spacer94 );

    comboBox_Arp_Type = new QComboBox( FALSE, arpGroupBox, "comboBox_Arp_Type" );
    layout112->addWidget( comboBox_Arp_Type );

    arpGroupBoxLayout->addLayout( layout112, 1, 0 );

    layout116 = new QHBoxLayout( 0, 0, 6, "layout116"); 

    textLabel3 = new QLabel( arpGroupBox, "textLabel3" );
    layout116->addWidget( textLabel3 );
    spacer96 = new QSpacerItem( 241, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout116->addItem( spacer96 );

    lineEdit_Arp_Sip = new QLineEdit( arpGroupBox, "lineEdit_Arp_Sip" );
    lineEdit_Arp_Sip->setAlignment( int( QLineEdit::AlignRight ) );
    layout116->addWidget( lineEdit_Arp_Sip );

    arpGroupBoxLayout->addLayout( layout116, 2, 0 );

    layout115 = new QHBoxLayout( 0, 0, 6, "layout115"); 

    textLabel4 = new QLabel( arpGroupBox, "textLabel4" );
    layout115->addWidget( textLabel4 );
    spacer95 = new QSpacerItem( 240, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout115->addItem( spacer95 );

    lineEdit_Arp_Device = new QLineEdit( arpGroupBox, "lineEdit_Arp_Device" );
    lineEdit_Arp_Device->setAlignment( int( QLineEdit::AlignRight ) );
    layout115->addWidget( lineEdit_Arp_Device );

    arpGroupBoxLayout->addLayout( layout115, 0, 0 );

    layout117 = new QHBoxLayout( 0, 0, 6, "layout117"); 

    textLabel3_2 = new QLabel( arpGroupBox, "textLabel3_2" );
    layout117->addWidget( textLabel3_2 );
    spacer97 = new QSpacerItem( 221, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout117->addItem( spacer97 );

    lineEdit_Arp_Dip = new QLineEdit( arpGroupBox, "lineEdit_Arp_Dip" );
    lineEdit_Arp_Dip->setAlignment( int( QLineEdit::AlignRight ) );
    layout117->addWidget( lineEdit_Arp_Dip );

    arpGroupBoxLayout->addLayout( layout117, 4, 0 );

    layout118 = new QHBoxLayout( 0, 0, 6, "layout118"); 

    textLabel1 = new QLabel( arpGroupBox, "textLabel1" );
    layout118->addWidget( textLabel1 );
    spacer98 = new QSpacerItem( 211, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout118->addItem( spacer98 );

    numberPacketlineEdit = new QLineEdit( arpGroupBox, "numberPacketlineEdit" );
    numberPacketlineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout118->addWidget( numberPacketlineEdit );

    arpGroupBoxLayout->addLayout( layout118, 6, 0 );

    ARP_FormLayout->addWidget( arpGroupBox, 0, 0 );
    languageChange();
    resize( QSize(577, 329).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( Button_Arp_cancel, SIGNAL( clicked() ), this, SLOT( close() ) );
    connect( Button_Arp_Generate, SIGNAL( clicked() ), this, SLOT( set_value() ) );

    // tab order
    setTabOrder( lineEdit_Arp_Device, comboBox_Arp_Type );
    setTabOrder( comboBox_Arp_Type, lineEdit_Arp_Sip );
    setTabOrder( lineEdit_Arp_Sip, lineEdit_Arp_Smac1 );
    setTabOrder( lineEdit_Arp_Smac1, lineEdit_Arp_Smac2 );
    setTabOrder( lineEdit_Arp_Smac2, lineEdit_Arp_Smac3 );
    setTabOrder( lineEdit_Arp_Smac3, lineEdit_Arp_Smac4 );
    setTabOrder( lineEdit_Arp_Smac4, lineEdit_Arp_Smac5 );
    setTabOrder( lineEdit_Arp_Smac5, lineEdit_Arp_Smac6 );
    setTabOrder( lineEdit_Arp_Smac6, lineEdit_Arp_Dip );
    setTabOrder( lineEdit_Arp_Dip, lineEdit_Arp_Dmac1 );
    setTabOrder( lineEdit_Arp_Dmac1, lineEdit_Arp_Dmac2 );
    setTabOrder( lineEdit_Arp_Dmac2, lineEdit_Arp_Dmac3 );
    setTabOrder( lineEdit_Arp_Dmac3, lineEdit_Arp_Dmac4 );
    setTabOrder( lineEdit_Arp_Dmac4, lineEdit_Arp_Dmac5 );
    setTabOrder( lineEdit_Arp_Dmac5, lineEdit_Arp_Dmac6 );
    setTabOrder( lineEdit_Arp_Dmac6, Button_Arp_Generate );
    setTabOrder( Button_Arp_Generate, Button_Arp_cancel );
}

/*
 *  Destroys the object and frees any allocated resources
 */
ARP_Form::~ARP_Form()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void ARP_Form::languageChange()
{
    setCaption( tr( "ARP" ) );
    Button_Arp_Generate->setText( tr( "Generate" ) );
    Button_Arp_cancel->setText( tr( "Cancel" ) );
    arpGroupBox->setTitle( tr( "ARP Detail" ) );
    textLabel3_3->setText( tr( "Source Mac      " ) );
    lineEdit_Arp_Smac1->setText( tr( "0x000" ) );
    lineEdit_Arp_Smac2->setText( tr( "x0E0" ) );
    lineEdit_Arp_Smac3->setText( tr( "x029" ) );
    lineEdit_Arp_Smac4->setText( tr( "x046" ) );
    lineEdit_Arp_Smac5->setText( tr( "x071" ) );
    lineEdit_Arp_Smac6->setText( tr( "xEF" ) );
    textLabel3_4->setText( tr( "Destination Mac" ) );
    lineEdit_Arp_Dmac1->setText( tr( "0x000" ) );
    lineEdit_Arp_Dmac2->setText( tr( "x010" ) );
    lineEdit_Arp_Dmac3->setText( tr( "x0B5" ) );
    lineEdit_Arp_Dmac4->setText( tr( "x054" ) );
    lineEdit_Arp_Dmac5->setText( tr( "x020" ) );
    lineEdit_Arp_Dmac6->setText( tr( "xC0" ) );
    textLabel2->setText( tr( "Type" ) );
    comboBox_Arp_Type->clear();
    comboBox_Arp_Type->insertItem( tr( "Request" ) );
    comboBox_Arp_Type->insertItem( tr( "Reply" ) );
    textLabel3->setText( tr( "Source IP      " ) );
    lineEdit_Arp_Sip->setText( tr( "161.246.5.12" ) );
    textLabel4->setText( tr( "Device           " ) );
    lineEdit_Arp_Device->setText( tr( "eth0" ) );
    textLabel3_2->setText( tr( "Destination  IP    " ) );
    lineEdit_Arp_Dip->setText( tr( "161.246.5.6" ) );
    textLabel1->setText( tr( "Number of Packets" ) );
    numberPacketlineEdit->setText( tr( "5" ) );
}

