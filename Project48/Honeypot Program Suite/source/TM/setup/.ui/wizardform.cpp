/****************************************************************************
** Form implementation generated from reading ui file 'wizardform.ui'
**
** Created: Sun Jan 29 15:43:29 2006
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.5   edited Aug 31 12:13 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "wizardform.h"

#include <qvariant.h>
#include <stdio.h>
#include <stdlib.h>
#include <qdialog.h>
#include <qstring.h>
#include <qlabel.h>
#include <qlistbox.h>
#include <qmessagebox.h>
#include <qwidget.h>
#include <qpushbutton.h>
#include <qlineedit.h>
#include <qbuttongroup.h>
#include <qcombobox.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qimage.h>
#include <qpixmap.h>

#include "../wizardform.ui.h"
/*
 *  Constructs a WizardForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The wizard will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal wizard.
 */
WizardForm::WizardForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QWizard( parent, name, modal, fl )
{
    if ( !name )
	setName( "WizardForm" );
    setEnabled( TRUE );

    WizardPage = new QWidget( this, "WizardPage" );

    textLabel1 = new QLabel( WizardPage, "textLabel1" );
    textLabel1->setGeometry( QRect( 92, 86, 182, 24 ) );

    resetPath = new QPushButton( WizardPage, "resetPath" );
    resetPath->setGeometry( QRect( 298, 220, 201, 29 ) );

    rulePath = new QLineEdit( WizardPage, "rulePath" );
    rulePath->setGeometry( QRect( 280, 130, 218, 24 ) );

    textLabel3 = new QLabel( WizardPage, "textLabel3" );
    textLabel3->setGeometry( QRect( 92, 174, 182, 24 ) );

    textLabel2 = new QLabel( WizardPage, "textLabel2" );
    textLabel2->setGeometry( QRect( 92, 130, 182, 24 ) );

    cagePath = new QLineEdit( WizardPage, "cagePath" );
    cagePath->setGeometry( QRect( 280, 174, 218, 24 ) );

    savePath = new QPushButton( WizardPage, "savePath" );
    savePath->setGeometry( QRect( 91, 220, 201, 29 ) );

    confPath = new QLineEdit( WizardPage, "confPath" );
    confPath->setGeometry( QRect( 280, 86, 218, 24 ) );

    textLabel1_2 = new QLabel( WizardPage, "textLabel1_2" );
    textLabel1_2->setGeometry( QRect( 90, 40, 181, 21 ) );

    ipHoneywall = new QLineEdit( WizardPage, "ipHoneywall" );
    ipHoneywall->setGeometry( QRect( 280, 40, 220, 24 ) );
    addPage( WizardPage, QString("") );

    WizardPage_2 = new QWidget( this, "WizardPage_2" );

    connectbuttonGroup = new QButtonGroup( WizardPage_2, "connectbuttonGroup" );
    connectbuttonGroup->setGeometry( QRect( 314, 10, 250, 246 ) );
    connectbuttonGroup->setColumnLayout(0, Qt::Vertical );
    connectbuttonGroup->layout()->setSpacing( 6 );
    connectbuttonGroup->layout()->setMargin( 11 );
    connectbuttonGroupLayout = new QGridLayout( connectbuttonGroup->layout() );
    connectbuttonGroupLayout->setAlignment( Qt::AlignTop );

    textLabel11 = new QLabel( connectbuttonGroup, "textLabel11" );

    connectbuttonGroupLayout->addWidget( textLabel11, 6, 0 );

    textLabel5 = new QLabel( connectbuttonGroup, "textLabel5" );

    connectbuttonGroupLayout->addWidget( textLabel5, 0, 0 );

    textLabel7 = new QLabel( connectbuttonGroup, "textLabel7" );

    connectbuttonGroupLayout->addWidget( textLabel7, 2, 0 );

    textLabel6 = new QLabel( connectbuttonGroup, "textLabel6" );

    connectbuttonGroupLayout->addWidget( textLabel6, 1, 0 );

    nameLineEdit = new QLineEdit( connectbuttonGroup, "nameLineEdit" );

    connectbuttonGroupLayout->addWidget( nameLineEdit, 0, 1 );

    driverComboBox = new QComboBox( FALSE, connectbuttonGroup, "driverComboBox" );

    connectbuttonGroupLayout->addWidget( driverComboBox, 1, 1 );

    dbnameLineEdit = new QLineEdit( connectbuttonGroup, "dbnameLineEdit" );

    connectbuttonGroupLayout->addWidget( dbnameLineEdit, 2, 1 );

    usernameLineEdit = new QLineEdit( connectbuttonGroup, "usernameLineEdit" );

    connectbuttonGroupLayout->addWidget( usernameLineEdit, 3, 1 );

    passwordLineEdit = new QLineEdit( connectbuttonGroup, "passwordLineEdit" );

    connectbuttonGroupLayout->addWidget( passwordLineEdit, 4, 1 );

    textLabel8 = new QLabel( connectbuttonGroup, "textLabel8" );

    connectbuttonGroupLayout->addWidget( textLabel8, 3, 0 );

    textLabel9 = new QLabel( connectbuttonGroup, "textLabel9" );

    connectbuttonGroupLayout->addWidget( textLabel9, 4, 0 );

    textLabel10 = new QLabel( connectbuttonGroup, "textLabel10" );

    connectbuttonGroupLayout->addWidget( textLabel10, 5, 0 );

    hostnameLineEdit = new QLineEdit( connectbuttonGroup, "hostnameLineEdit" );

    connectbuttonGroupLayout->addWidget( hostnameLineEdit, 5, 1 );

    portLineEdit = new QLineEdit( connectbuttonGroup, "portLineEdit" );

    connectbuttonGroupLayout->addWidget( portLineEdit, 6, 1 );

    connectPushButton = new QPushButton( WizardPage_2, "connectPushButton" );
    connectPushButton->setGeometry( QRect( 410, 270, 90, 26 ) );

    dbListBox = new QListBox( WizardPage_2, "dbListBox" );
    dbListBox->setGeometry( QRect( 4, 14, 130, 280 ) );

    newPushButton = new QPushButton( WizardPage_2, "newPushButton" );
    newPushButton->setGeometry( QRect( 141, 21, 162, 30 ) );

    delPushButton = new QPushButton( WizardPage_2, "delPushButton" );
    delPushButton->setGeometry( QRect( 141, 61, 162, 30 ) );
    addPage( WizardPage_2, QString("") );
    languageChange();
    resize( QSize(590, 410).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( resetPath, SIGNAL( clicked() ), cagePath, SLOT( clear() ) );
    connect( resetPath, SIGNAL( clicked() ), confPath, SLOT( clear() ) );
    connect( resetPath, SIGNAL( clicked() ), rulePath, SLOT( clear() ) );
    connect( cagePath, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( confPath, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( rulePath, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( newPushButton, SIGNAL( clicked() ), this, SLOT( newConnect() ) );
    connect( nameLineEdit, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( driverComboBox, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( dbnameLineEdit, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( usernameLineEdit, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( passwordLineEdit, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( hostnameLineEdit, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( portLineEdit, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( connectPushButton, SIGNAL( clicked() ), this, SLOT( connectdb() ) );
    connect( delPushButton, SIGNAL( clicked() ), this, SLOT( disconnectdb() ) );
    connect( savePath, SIGNAL( clicked() ), this, SLOT( saveConfig() ) );
    connect( dbListBox, SIGNAL( selectionChanged() ), this, SLOT( datachange() ) );

    // tab order
    setTabOrder( confPath, rulePath );
    setTabOrder( rulePath, cagePath );
    setTabOrder( cagePath, savePath );
    setTabOrder( savePath, resetPath );
    setTabOrder( resetPath, nameLineEdit );
    setTabOrder( nameLineEdit, driverComboBox );
    setTabOrder( driverComboBox, dbnameLineEdit );
    setTabOrder( dbnameLineEdit, usernameLineEdit );
    setTabOrder( usernameLineEdit, passwordLineEdit );
    setTabOrder( passwordLineEdit, hostnameLineEdit );
    setTabOrder( hostnameLineEdit, portLineEdit );
    setTabOrder( portLineEdit, connectPushButton );
    setTabOrder( connectPushButton, newPushButton );
    setTabOrder( newPushButton, dbListBox );
    setTabOrder( dbListBox, delPushButton );
    init();
}

/*
 *  Destroys the object and frees any allocated resources
 */
WizardForm::~WizardForm()
{
    destroy();
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void WizardForm::languageChange()
{
    setCaption( tr( "Setup Configuration Wizard" ) );
    textLabel1->setText( tr( "Path of snort_inline.conf" ) );
    QWhatsThis::add( textLabel1, tr( "Path to collect snort_inline configuration\n"
"ex. /etc/snort/" ) );
    resetPath->setText( tr( "Reset" ) );
    rulePath->setText( QString::null );
    textLabel3->setText( tr( "Path of cages" ) );
    QWhatsThis::add( textLabel3, tr( "Path to save original cage\n"
"ex. /home/vmware/" ) );
    textLabel2->setText( tr( "Path of snort_inline's rules" ) );
    QWhatsThis::add( textLabel2, tr( "Path to collect all snort_inline rules\n"
"ex. /etc/snort/rules/" ) );
    cagePath->setText( QString::null );
    savePath->setText( tr( "Save" ) );
    confPath->setText( QString::null );
    textLabel1_2->setText( tr( "Honeywall Address" ) );
    QWhatsThis::add( textLabel1_2, tr( "IP address of Honeywall" ) );
    setTitle( WizardPage, tr( "Setting Honeywall and Working path" ) );
    connectbuttonGroup->setTitle( tr( "Connection" ) );
    textLabel11->setText( tr( "Port:" ) );
    textLabel5->setText( tr( "Name:" ) );
    textLabel7->setText( tr( "Database Name:" ) );
    textLabel6->setText( tr( "Driver" ) );
    nameLineEdit->setText( QString::null );
    textLabel8->setText( tr( "Username:" ) );
    textLabel9->setText( tr( "Password:" ) );
    textLabel10->setText( tr( "Hostname:" ) );
    connectPushButton->setText( tr( "Connect" ) );
    newPushButton->setText( tr( "New connection" ) );
    delPushButton->setText( tr( "Delete connection" ) );
    setTitle( WizardPage_2, tr( "Database connections" ) );
}

