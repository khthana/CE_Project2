/****************************************************************************
** ui.h extension file, included from the uic-generated form implementation.
**
** If you want to add, delete, or rename functions or slots, use
** Qt Designer to update this file, preserving your code.
**
** You should not define a constructor or destructor in this file.
** Instead, write your code in functions called init() and destroy().
** These will automatically be called by the form's constructor and
** destructor.
*****************************************************************************/

#include "templateform.h"
#include "configform.h"
#include "replayform.h" 
#include <qfiledialog.h> 
#include <qmessagebox.h>
#include <qapplication.h>
#include <qmenubar.h>
#include <qfile.h>
#include <qstatusbar.h>
#include <qimage.h>
#include <qpixmap.h>
#include <qaccel.h>
#include <qtextstream.h>


void firstForm::fileOpen()
{  
    QString fileName = QFileDialog::getOpenFileName(
                    "/home",
                    "Pcap (*.pcap)",
                    this,
                    "open file dialog",
                    "Choose a file to open" );
  
       if ( !fileName.isEmpty() )
    load( fileName );
       else
    statusBar()->message( "Loading aborted", 2000 );
}

void  firstForm::load( const QString &fileName )
{
   QFile f( fileName );
   if ( !f.open( IO_ReadOnly ) )
       return;

   QTextStream ts( &f );
    
  
    setCaption( fileName );
    statusBar()->message( "Loaded document " + fileName, 2000 );
}


void firstForm::fileSave()
{
    if ( filename.isEmpty() ) {
 fileSaveAs();
 return;
    }
   //String text = e->text();
   QFile f( filename );
   if ( !f.open( IO_WriteOnly ) ) {
      statusBar()->message( QString("Could not write to %1").arg(filename), 2000 );
      return;
   }
    QTextStream t( &f );
    //t << text;
    f.close();
    
  //  e->setModified( FALSE );
    
    setCaption( filename );

    statusBar()->message( QString( "File %1 saved" ).arg( filename ), 2000 );
}


void firstForm::fileSaveAs()
{
   QString fn = QFileDialog::getSaveFileName( QString::null, QString::null, this );
    if ( !fn.isEmpty() ) {
 filename = fn;
 fileSave();
   } else {
       statusBar()->message( "Saving aborted", 2000 );
   }
}



void firstForm::fileExit()
{
    //saveSettings();
    QApplication::exit( 0 );
}


void firstForm::editUndo()
{

}


void firstForm::editRedo()
{

}




void firstForm::editPaste()
{

}


void firstForm::editFind()
{

}


void firstForm::helpIndex()
{

}


void firstForm::helpContents()
{

}


void firstForm::helpAbout()
{

}


void firstForm::changeFunction( QAction* action)
{
    if( action == generateAction )
 functionWidgetStack->raiseWidget(generatePage);
    else
 functionWidgetStack->raiseWidget(replayPage);
}
 
void firstForm::changeMode()
{
    if (  templateRadioButton->isChecked())
    {
 templateForm o;
 o.show();
 //o.connect( &o, SIGNAL( lastWindowClosed() ), &o, SLOT( quit() ) );
              o.exec();
    }
    else 
    {
 configForm o;
 o.show();
 //o.connect( &o, SIGNAL( lastWindowClosed() ), &o, SLOT( quit() ) );
              o.exec();
    }
}


void firstForm::showReplay()
{
    replayForm o;
    o.show();
    //o.connect( &o, SIGNAL( lastWindowClosed() ), &o, SLOT( quit() ) );
    o.exec();

}


