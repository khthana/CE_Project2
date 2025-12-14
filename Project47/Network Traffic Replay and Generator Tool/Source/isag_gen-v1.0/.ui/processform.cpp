/****************************************************************************
** Form implementation generated from reading ui file 'processform.ui'
**
** Created: Sat Jan 29 21:52:24 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "processform.h"

#include <qvariant.h>
#include <qpushbutton.h>
#include <qlabel.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qimage.h>
#include <qpixmap.h>

#include "../processform.ui.h"
/*
 *  Constructs a processForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
processForm::processForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "processForm" );
    setIcon( QPixmap::fromMimeSource( "designer_project.png" ) );

    stopButton = new QPushButton( this, "stopButton" );
    stopButton->setGeometry( QRect( 70, 80, 90, 32 ) );

    textLabel1 = new QLabel( this, "textLabel1" );
    textLabel1->setGeometry( QRect( 20, 20, 220, 50 ) );
    languageChange();
    resize( QSize(254, 120).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );

    // signals and slots connections
    connect( stopButton, SIGNAL( clicked() ), this, SLOT( stopProcess() ) );
    connect( stopButton, SIGNAL( clicked() ), this, SLOT( close() ) );
}

/*
 *  Destroys the object and frees any allocated resources
 */
processForm::~processForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void processForm::languageChange()
{
    setCaption( tr( "Display" ) );
    stopButton->setText( tr( "OK" ) );
    textLabel1->setText( tr( "Complete    " ) );
}

