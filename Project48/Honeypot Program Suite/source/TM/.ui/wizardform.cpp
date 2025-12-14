/****************************************************************************
** Form implementation generated from reading ui file 'wizardform.ui'
**
** Created: Tue Jan 31 12:21:24 2006
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
#include <qpushbutton.h>
#include <qwidget.h>
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

    QWidget* privateLayoutWidget = new QWidget( WizardPage, "layout3" );
    privateLayoutWidget->setGeometry( QRect( 40, 40, 410, 220 ) );
    layout3 = new QGridLayout( privateLayoutWidget, 1, 1, 11, 6, "layout3"); 

    savePath = new QPushButton( privateLayoutWidget, "savePath" );

    layout3->addWidget( savePath, 1, 0 );

    layout2 = new QGridLayout( 0, 1, 1, 0, 6, "layout2"); 

    textLabel1 = new QLabel( privateLayoutWidget, "textLabel1" );

    layout2->addWidget( textLabel1, 0, 0 );

    textLabel2 = new QLabel( privateLayoutWidget, "textLabel2" );

    layout2->addWidget( textLabel2, 1, 0 );

    confPath = new QLineEdit( privateLayoutWidget, "confPath" );

    layout2->addWidget( confPath, 0, 1 );

    textLabel3 = new QLabel( privateLayoutWidget, "textLabel3" );

    layout2->addWidget( textLabel3, 2, 0 );

    rulePath = new QLineEdit( privateLayoutWidget, "rulePath" );

    layout2->addWidget( rulePath, 1, 1 );

    cagePath = new QLineEdit( privateLayoutWidget, "cagePath" );

    layout2->addWidget( cagePath, 2, 1 );

    layout3->addMultiCellLayout( layout2, 0, 0, 0, 1 );

    resetPath = new QPushButton( privateLayoutWidget, "resetPath" );

    layout3->addWidget( resetPath, 1, 1 );
    addPage( WizardPage, QString("") );

    WizardPage_2 = new QWidget( this, "WizardPage_2" );

    connectbuttonGroup = new QButtonGroup( WizardPage_2, "connectbuttonGroup" );
    connectbuttonGroup->setGeometry( QRect( 224, 10, 250, 246 ) );
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

    editPushButton = new QPushButton( WizardPage_2, "editPushButton" );
    editPushButton->setGeometry( QRect( 310, 266, 90, 30 ) );

    dbListBox = new QListBox( WizardPage_2, "dbListBox" );
    dbListBox->setGeometry( QRect( 14, 4, 190, 290 ) );
    addPage( WizardPage_2, QString("") );
    languageChange();
    resize( QSize(503, 392).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( resetPath, SIGNAL( clicked() ), cagePath, SLOT( clear() ) );
    connect( resetPath, SIGNAL( clicked() ), confPath, SLOT( clear() ) );
    connect( resetPath, SIGNAL( clicked() ), rulePath, SLOT( clear() ) );
    connect( cagePath, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( confPath, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( rulePath, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( nameLineEdit, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( driverComboBox, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( dbnameLineEdit, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( usernameLineEdit, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( passwordLineEdit, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( hostnameLineEdit, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( portLineEdit, SIGNAL( textChanged(const QString&) ), this, SLOT( checkInput() ) );
    connect( editPushButton, SIGNAL( clicked() ), this, SLOT( editdb() ) );
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
    setTabOrder( portLineEdit, editPushButton );
    setTabOrder( editPushButton, dbListBox );
    init();
}

/*
 *  Destroys the object and frees any allocated resources
 */
WizardForm::~WizardForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void WizardForm::languageChange()
{
    setCaption( tr( "Setup Configuration Wizard" ) );
    savePath->setText( tr( "Save" ) );
    QToolTip::add( savePath, tr( "Save Configuration" ) );
    textLabel1->setText( tr( "Path of snort_inline.conf" ) );
    QWhatsThis::add( textLabel1, tr( "Path to collect snort_inline configuration\n"
"ex. /etc/snort/" ) );
    textLabel2->setText( tr( "Path of snort_inline's rules" ) );
    QWhatsThis::add( textLabel2, tr( "Path to collect all snort_inline rules\n"
"ex. /etc/snort/rules/" ) );
    confPath->setText( QString::null );
    QToolTip::add( confPath, tr( "Configuration of snort_inline path" ) );
    textLabel3->setText( tr( "Path of cages" ) );
    QWhatsThis::add( textLabel3, tr( "Path to save all cage\n"
"ex. /home/vmware/" ) );
    rulePath->setText( QString::null );
    QToolTip::add( rulePath, tr( "Path to keep rules file" ) );
    cagePath->setText( QString::null );
    QToolTip::add( cagePath, tr( "Path to keep original cages" ) );
    resetPath->setText( tr( "Reset" ) );
    QToolTip::add( resetPath, tr( "Clear Configuration" ) );
    setTitle( WizardPage, tr( "Setting working path" ) );
    connectbuttonGroup->setTitle( tr( "Connection" ) );
    textLabel11->setText( tr( "Port:" ) );
    textLabel5->setText( tr( "Name:" ) );
    textLabel7->setText( tr( "Database Name:" ) );
    textLabel6->setText( tr( "Driver" ) );
    nameLineEdit->setText( QString::null );
    QToolTip::add( nameLineEdit, tr( "Name" ) );
    QToolTip::add( driverComboBox, tr( "Type of driver" ) );
    QToolTip::add( dbnameLineEdit, tr( "Database name" ) );
    QToolTip::add( usernameLineEdit, tr( "Username to connect database" ) );
    QToolTip::add( passwordLineEdit, tr( "Password of user" ) );
    textLabel8->setText( tr( "Username:" ) );
    textLabel9->setText( tr( "Password:" ) );
    textLabel10->setText( tr( "Hostname:" ) );
    QToolTip::add( hostnameLineEdit, QString::null );
    editPushButton->setText( tr( "Edit" ) );
    QToolTip::add( editPushButton, tr( "Edit database connection" ) );
    setTitle( WizardPage_2, tr( "Database connections" ) );
}

