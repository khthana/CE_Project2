/****************************************************************************
** Form implementation generated from reading ui file 'unreachform.ui'
**
** Created: Thu Jan 27 19:35:35 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "unreachform.h"

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

#include "unreachform.ui.h"
/*
 *  Constructs a unreachForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
unreachForm::unreachForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "unreachForm" );
    setIcon( QPixmap::fromMimeSource( "designer_project.png" ) );
    unreachFormLayout = new QGridLayout( this, 1, 1, 11, 6, "unreachFormLayout"); 

    layout210 = new QVBoxLayout( 0, 0, 6, "layout210"); 

    redirectGroupBox = new QGroupBox( this, "redirectGroupBox" );
    redirectGroupBox->setColumnLayout(0, Qt::Vertical );
    redirectGroupBox->layout()->setSpacing( 6 );
    redirectGroupBox->layout()->setMargin( 11 );
    redirectGroupBoxLayout = new QGridLayout( redirectGroupBox->layout() );
    redirectGroupBoxLayout->setAlignment( Qt::AlignTop );

    layout209 = new QVBoxLayout( 0, 0, 6, "layout209"); 

    layout208 = new QHBoxLayout( 0, 0, 6, "layout208"); 

    deviceTextLabel = new QLabel( redirectGroupBox, "deviceTextLabel" );
    layout208->addWidget( deviceTextLabel );

    deviceLineEdit = new QLineEdit( redirectGroupBox, "deviceLineEdit" );
    deviceLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout208->addWidget( deviceLineEdit );
    layout209->addLayout( layout208 );

    layout269 = new QHBoxLayout( 0, 0, 6, "layout269"); 

    modeTextLabel = new QLabel( redirectGroupBox, "modeTextLabel" );
    layout269->addWidget( modeTextLabel );
    spacer235 = new QSpacerItem( 171, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout269->addItem( spacer235 );

    modeComboBox = new QComboBox( FALSE, redirectGroupBox, "modeComboBox" );
    layout269->addWidget( modeComboBox );
    layout209->addLayout( layout269 );

    layout227 = new QHBoxLayout( 0, 0, 6, "layout227"); 

    sIPTextLabel = new QLabel( redirectGroupBox, "sIPTextLabel" );
    layout227->addWidget( sIPTextLabel );
    spacer206 = new QSpacerItem( 91, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout227->addItem( spacer206 );

    sIPLineEdit = new QLineEdit( redirectGroupBox, "sIPLineEdit" );
    sIPLineEdit->setEnabled( TRUE );
    sIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout227->addWidget( sIPLineEdit );
    layout209->addLayout( layout227 );

    layout98 = new QHBoxLayout( 0, 0, 6, "layout98"); 

    textLabel3_3_3 = new QLabel( redirectGroupBox, "textLabel3_3_3" );
    layout98->addWidget( textLabel3_3_3 );

    lineEdit_Arp_Smac1_3 = new QLineEdit( redirectGroupBox, "lineEdit_Arp_Smac1_3" );
    lineEdit_Arp_Smac1_3->setEnabled( FALSE );
    layout98->addWidget( lineEdit_Arp_Smac1_3 );

    lineEdit_Arp_Smac2_3 = new QLineEdit( redirectGroupBox, "lineEdit_Arp_Smac2_3" );
    lineEdit_Arp_Smac2_3->setEnabled( FALSE );
    layout98->addWidget( lineEdit_Arp_Smac2_3 );

    lineEdit_Arp_Smac3_3 = new QLineEdit( redirectGroupBox, "lineEdit_Arp_Smac3_3" );
    lineEdit_Arp_Smac3_3->setEnabled( FALSE );
    layout98->addWidget( lineEdit_Arp_Smac3_3 );

    lineEdit_Arp_Smac4_3 = new QLineEdit( redirectGroupBox, "lineEdit_Arp_Smac4_3" );
    lineEdit_Arp_Smac4_3->setEnabled( FALSE );
    layout98->addWidget( lineEdit_Arp_Smac4_3 );

    lineEdit_Arp_Smac5_3 = new QLineEdit( redirectGroupBox, "lineEdit_Arp_Smac5_3" );
    lineEdit_Arp_Smac5_3->setEnabled( FALSE );
    layout98->addWidget( lineEdit_Arp_Smac5_3 );

    lineEdit_Arp_Smac6_3 = new QLineEdit( redirectGroupBox, "lineEdit_Arp_Smac6_3" );
    lineEdit_Arp_Smac6_3->setEnabled( FALSE );
    layout98->addWidget( lineEdit_Arp_Smac6_3 );
    layout209->addLayout( layout98 );

    layout228 = new QHBoxLayout( 0, 0, 6, "layout228"); 

    dIPTextLabel = new QLabel( redirectGroupBox, "dIPTextLabel" );
    layout228->addWidget( dIPTextLabel );
    spacer207 = new QSpacerItem( 71, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout228->addItem( spacer207 );

    dIPLineEdit = new QLineEdit( redirectGroupBox, "dIPLineEdit" );
    dIPLineEdit->setFrameShape( QLineEdit::LineEditPanel );
    dIPLineEdit->setFrameShadow( QLineEdit::Sunken );
    dIPLineEdit->setAlignment( int( QLineEdit::AlignRight ) );
    layout228->addWidget( dIPLineEdit );
    layout209->addLayout( layout228 );

    layout99 = new QHBoxLayout( 0, 0, 6, "layout99"); 

    textLabel3_4_3 = new QLabel( redirectGroupBox, "textLabel3_4_3" );
    layout99->addWidget( textLabel3_4_3 );

    lineEdit_Arp_Dmac1_3 = new QLineEdit( redirectGroupBox, "lineEdit_Arp_Dmac1_3" );
    lineEdit_Arp_Dmac1_3->setEnabled( FALSE );
    layout99->addWidget( lineEdit_Arp_Dmac1_3 );

    lineEdit_Arp_Dmac2_3 = new QLineEdit( redirectGroupBox, "lineEdit_Arp_Dmac2_3" );
    lineEdit_Arp_Dmac2_3->setEnabled( FALSE );
    layout99->addWidget( lineEdit_Arp_Dmac2_3 );

    lineEdit_Arp_Dmac3_3 = new QLineEdit( redirectGroupBox, "lineEdit_Arp_Dmac3_3" );
    lineEdit_Arp_Dmac3_3->setEnabled( FALSE );
    layout99->addWidget( lineEdit_Arp_Dmac3_3 );

    lineEdit_Arp_Dmac4_3 = new QLineEdit( redirectGroupBox, "lineEdit_Arp_Dmac4_3" );
    lineEdit_Arp_Dmac4_3->setEnabled( FALSE );
    layout99->addWidget( lineEdit_Arp_Dmac4_3 );

    lineEdit_Arp_Dmac5_3 = new QLineEdit( redirectGroupBox, "lineEdit_Arp_Dmac5_3" );
    lineEdit_Arp_Dmac5_3->setEnabled( FALSE );
    layout99->addWidget( lineEdit_Arp_Dmac5_3 );

    lineEdit_Arp_Dmac6_3 = new QLineEdit( redirectGroupBox, "lineEdit_Arp_Dmac6_3" );
    lineEdit_Arp_Dmac6_3->setEnabled( FALSE );
    layout99->addWidget( lineEdit_Arp_Dmac6_3 );
    layout209->addLayout( layout99 );

    layout100 = new QHBoxLayout( 0, 0, 6, "layout100"); 

    textLabel1_3 = new QLabel( redirectGroupBox, "textLabel1_3" );
    layout100->addWidget( textLabel1_3 );

    numberPacketlineEdit_3 = new QLineEdit( redirectGroupBox, "numberPacketlineEdit_3" );
    numberPacketlineEdit_3->setAlignment( int( QLineEdit::AlignRight ) );
    layout100->addWidget( numberPacketlineEdit_3 );
    layout209->addLayout( layout100 );

    redirectGroupBoxLayout->addLayout( layout209, 0, 0 );
    layout210->addWidget( redirectGroupBox );
    spacer210 = new QSpacerItem( 20, 36, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout210->addItem( spacer210 );

    layout231 = new QHBoxLayout( 0, 0, 6, "layout231"); 
    spacer209 = new QSpacerItem( 190, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout231->addItem( spacer209 );

    layout230 = new QHBoxLayout( 0, 0, 6, "layout230"); 

    generatePushButton = new QPushButton( this, "generatePushButton" );
    layout230->addWidget( generatePushButton );

    cancelPushButton = new QPushButton( this, "cancelPushButton" );
    layout230->addWidget( cancelPushButton );
    layout231->addLayout( layout230 );
    layout210->addLayout( layout231 );

    unreachFormLayout->addLayout( layout210, 0, 0 );
    languageChange();
    resize( QSize(594, 403).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( generatePushButton, SIGNAL( clicked() ), this, SLOT( GenerateUnreach() ) );
    connect( cancelPushButton, SIGNAL( clicked() ), this, SLOT( close() ) );
    connect( modeComboBox, SIGNAL( activated(const QString&) ), this, SLOT( ChangeMode() ) );
}

/*
 *  Destroys the object and frees any allocated resources
 */
unreachForm::~unreachForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void unreachForm::languageChange()
{
    setCaption( tr( "ICMP Unreach" ) );
    redirectGroupBox->setTitle( tr( "ICMP Redirect Detail" ) );
    deviceTextLabel->setText( tr( "Device:                                                                    " ) );
    deviceLineEdit->setText( tr( "eth0" ) );
    modeTextLabel->setText( tr( "Mode:" ) );
    modeComboBox->clear();
    modeComboBox->insertItem( tr( "RawLayer" ) );
    modeComboBox->insertItem( tr( "LinkLayer" ) );
    sIPTextLabel->setText( tr( "Source IP:      " ) );
    sIPLineEdit->setText( tr( "161.246.5.12" ) );
    textLabel3_3_3->setText( tr( "Source Mac:      " ) );
    lineEdit_Arp_Smac1_3->setText( tr( "0x000" ) );
    lineEdit_Arp_Smac2_3->setText( tr( "x0E0" ) );
    lineEdit_Arp_Smac3_3->setText( tr( "x029" ) );
    lineEdit_Arp_Smac4_3->setText( tr( "x046" ) );
    lineEdit_Arp_Smac5_3->setText( tr( "x071" ) );
    lineEdit_Arp_Smac6_3->setText( tr( "xEF" ) );
    dIPTextLabel->setText( tr( "Destination IP:" ) );
    dIPLineEdit->setText( tr( "161.246.5.6" ) );
    textLabel3_4_3->setText( tr( "Destination Mac:" ) );
    lineEdit_Arp_Dmac1_3->setText( tr( "0x000" ) );
    lineEdit_Arp_Dmac2_3->setText( tr( "x010" ) );
    lineEdit_Arp_Dmac3_3->setText( tr( "x0B5" ) );
    lineEdit_Arp_Dmac4_3->setText( tr( "x054" ) );
    lineEdit_Arp_Dmac5_3->setText( tr( "x020" ) );
    lineEdit_Arp_Dmac6_3->setText( tr( "xC0" ) );
    textLabel1_3->setText( tr( "Number of Packets:                                                 " ) );
    numberPacketlineEdit_3->setText( tr( "5" ) );
    generatePushButton->setText( tr( "Generate" ) );
    cancelPushButton->setText( tr( "Cancel" ) );
}

