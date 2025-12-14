/****************************************************************************
** Form implementation generated from reading ui file 'sending.ui'
**
** Created: Sun Jan 30 05:25:29 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "sending.h"

#include <qvariant.h>
#include <qlabel.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qimage.h>
#include <qpixmap.h>

#include "../sending.ui.h"
/*
 *  Constructs a Sending as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
Sending::Sending( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "Sending" );

    sendLabel = new QLabel( this, "sendLabel" );
    sendLabel->setGeometry( QRect( 20, 40, 250, 22 ) );
    languageChange();
    resize( QSize(287, 109).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );
}

/*
 *  Destroys the object and frees any allocated resources
 */
Sending::~Sending()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void Sending::languageChange()
{
    setCaption( tr( "Replay Packet" ) );
    sendLabel->setText( QString::null );
}

