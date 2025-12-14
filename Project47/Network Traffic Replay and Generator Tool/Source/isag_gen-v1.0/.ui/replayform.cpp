/****************************************************************************
** Form implementation generated from reading ui file 'replayform.ui'
**
** Created: Wed Jan 5 10:19:37 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.3   edited Nov 24 2003 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#include "replayform.h"

#include <qvariant.h>
#include <qheader.h>
#include <qlistview.h>
#include <qlayout.h>
#include <qtooltip.h>
#include <qwhatsthis.h>
#include <qimage.h>
#include <qpixmap.h>

/*
 *  Constructs a replayForm as a child of 'parent', with the
 *  name 'name' and widget flags set to 'f'.
 *
 *  The dialog will by default be modeless, unless you set 'modal' to
 *  TRUE to construct a modal dialog.
 */
replayForm::replayForm( QWidget* parent, const char* name, bool modal, WFlags fl )
    : QDialog( parent, name, modal, fl )
{
    if ( !name )
	setName( "replayForm" );
    setIcon( QPixmap::fromMimeSource( "designer_d_project.png" ) );
    replayFormLayout = new QGridLayout( this, 1, 1, 11, 6, "replayFormLayout"); 

    listView1 = new QListView( this, "listView1" );
    listView1->addColumn( tr( "No." ) );
    listView1->addColumn( tr( "Time." ) );
    listView1->addColumn( tr( "Source" ) );
    listView1->addColumn( tr( "Destination" ) );
    listView1->addColumn( tr( "Protocol" ) );
    listView1->addColumn( tr( "Info." ) );

    replayFormLayout->addWidget( listView1, 0, 0 );
    languageChange();
    resize( QSize(410, 412).expandedTo(minimumSizeHint()) );
    clearWState( WState_Polished );
}

/*
 *  Destroys the object and frees any allocated resources
 */
replayForm::~replayForm()
{
    // no need to delete child widgets, Qt does it all for us
}

/*
 *  Sets the strings of the subwidgets using the current
 *  language.
 */
void replayForm::languageChange()
{
    setCaption( tr( "Show Replay Packet" ) );
    listView1->header()->setLabel( 0, tr( "No." ) );
    listView1->header()->setLabel( 1, tr( "Time." ) );
    listView1->header()->setLabel( 2, tr( "Source" ) );
    listView1->header()->setLabel( 3, tr( "Destination" ) );
    listView1->header()->setLabel( 4, tr( "Protocol" ) );
    listView1->header()->setLabel( 5, tr( "Info." ) );
}

