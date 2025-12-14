/****************************************************************************
** Form implementation generated from reading ui file 'templateform.ui'
**
** Created: Wed Jan 26 14:01:22 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "templateform.h"

#include <qvariant.h>
#include <qpushbutton.h>
#include <qgroupbox.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qimage.h>
#include <qpixmap.h>

#include "templateform.ui.h"
/*
 *  Constructs a templateForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
templateForm::templateForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "templateForm" );
    setIcon( QPixmap::fromMimeSource( "designer_project.png" ) );
    templateFormLayout = new QGridLayout( this, 1, 1, 11, 6, "templateFormLayout"); 

    groupBox13 = new QGroupBox( this, "groupBox13" );
    groupBox13->setColumnLayout(0, Qt::Vertical );
    groupBox13->layout()->setSpacing( 6 );
    groupBox13->layout()->setMargin( 11 );
    groupBox13Layout = new QGridLayout( groupBox13->layout() );
    groupBox13Layout->setAlignment( Qt::AlignTop );

    formatGroupBox = new QGroupBox( groupBox13, "formatGroupBox" );
    formatGroupBox->setFrameShape( QGroupBox::GroupBoxPanel );
    formatGroupBox->setFrameShadow( QGroupBox::Sunken );
    formatGroupBox->setColumnLayout(0, Qt::Vertical );
    formatGroupBox->layout()->setSpacing( 6 );
    formatGroupBox->layout()->setMargin( 11 );
    formatGroupBoxLayout = new QGridLayout( formatGroupBox->layout() );
    formatGroupBoxLayout->setAlignment( Qt::AlignTop );

    layout73 = new QVBoxLayout( 0, 0, 6, "layout73"); 

    Button_Arp = new QPushButton( formatGroupBox, "Button_Arp" );
    layout73->addWidget( Button_Arp );

    Button_ICMP = new QPushButton( formatGroupBox, "Button_ICMP" );
    layout73->addWidget( Button_ICMP );

    Button_Tcp = new QPushButton( formatGroupBox, "Button_Tcp" );
    layout73->addWidget( Button_Tcp );

    Button_Udp = new QPushButton( formatGroupBox, "Button_Udp" );
    layout73->addWidget( Button_Udp );

    Button_Dns = new QPushButton( formatGroupBox, "Button_Dns" );
    layout73->addWidget( Button_Dns );

    formatGroupBoxLayout->addLayout( layout73, 0, 0 );

    groupBox13Layout->addWidget( formatGroupBox, 0, 0 );

    layout178 = new QVBoxLayout( 0, 0, 6, "layout178"); 

    attackGroupBox = new QGroupBox( groupBox13, "attackGroupBox" );
    attackGroupBox->setColumnLayout(0, Qt::Vertical );
    attackGroupBox->layout()->setSpacing( 6 );
    attackGroupBox->layout()->setMargin( 11 );
    attackGroupBoxLayout = new QGridLayout( attackGroupBox->layout() );
    attackGroupBoxLayout->setAlignment( Qt::AlignTop );

    Button_Synflood = new QPushButton( attackGroupBox, "Button_Synflood" );

    attackGroupBoxLayout->addWidget( Button_Synflood, 0, 0 );

    Button_Smurf = new QPushButton( attackGroupBox, "Button_Smurf" );

    attackGroupBoxLayout->addWidget( Button_Smurf, 1, 0 );
    layout178->addWidget( attackGroupBox );
    spacer47 = new QSpacerItem( 20, 70, QSizePolicy::Minimum, QSizePolicy::Expanding );
    layout178->addItem( spacer47 );

    layout177 = new QHBoxLayout( 0, 0, 6, "layout177"); 
    spacer154 = new QSpacerItem( 51, 20, QSizePolicy::Expanding, QSizePolicy::Minimum );
    layout177->addItem( spacer154 );

    Button_Quit = new QPushButton( groupBox13, "Button_Quit" );
    layout177->addWidget( Button_Quit );
    layout178->addLayout( layout177 );

    groupBox13Layout->addLayout( layout178, 0, 1 );

    templateFormLayout->addWidget( groupBox13, 0, 0 );
    languageChange();
    resize( QSize(313, 283).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( Button_Arp, SIGNAL( clicked() ), this, SLOT( ArpFunc() ) );
    connect( Button_ICMP, SIGNAL( clicked() ), this, SLOT( icmpFunc() ) );
    connect( Button_Smurf, SIGNAL( clicked() ), this, SLOT( smurfFunc() ) );
    connect( Button_Synflood, SIGNAL( clicked() ), this, SLOT( syncfloodFunc() ) );
    connect( Button_Tcp, SIGNAL( clicked() ), this, SLOT( tcpFunc() ) );
    connect( Button_Udp, SIGNAL( clicked() ), this, SLOT( udpFunc() ) );
    connect( Button_Quit, SIGNAL( clicked() ), this, SLOT( reject() ) );

    // tab order
    setTabOrder( Button_Arp, Button_ICMP );
    setTabOrder( Button_ICMP, Button_Tcp );
    setTabOrder( Button_Tcp, Button_Udp );
    setTabOrder( Button_Udp, Button_Dns );
    setTabOrder( Button_Dns, Button_Synflood );
    setTabOrder( Button_Synflood, Button_Smurf );
    setTabOrder( Button_Smurf, Button_Quit );
}

/*
 *  Destroys the object and frees any allocated resources
 */
templateForm::~templateForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void templateForm::languageChange()
{
    setCaption( tr( "Template Form" ) );
    groupBox13->setTitle( tr( "Generate Packets" ) );
    formatGroupBox->setTitle( tr( "Format Packet " ) );
    Button_Arp->setText( tr( "ARP" ) );
    Button_ICMP->setText( tr( "ICMP" ) );
    Button_Tcp->setText( tr( "TCP" ) );
    Button_Udp->setText( tr( "UDP" ) );
    Button_Dns->setText( tr( "DNS" ) );
    attackGroupBox->setTitle( tr( "Attack Packet" ) );
    Button_Synflood->setText( tr( "SYNFLOOD" ) );
    Button_Smurf->setText( tr( "SMURF" ) );
    Button_Quit->setText( tr( "Quit" ) );
}

