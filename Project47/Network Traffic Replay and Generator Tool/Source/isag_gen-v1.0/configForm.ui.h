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
#include <qapplication.h>
#include <qfile.h>
#include <qtextstream.h>
#include <qfiledialog.h>
#include <qstatusbar.h>
#include <qmessagebox.h> 
#include <qprinter.h>
#include <qpaintdevicemetrics.h>
#include <qpainter.h>
#include <qsimplerichtext.h>
#include <qprogressdialog.h> 
#include "errorform.h"
#include <qthread.h> 
#include "MyThread.h"

QString fileName;
MyThread cg;
void ConfigForm::init()
{           
    textEdit->setFocus();    
}

void ConfigForm::fileNew()
{
    if ( saveAndContinue( "New" ) )
    textEdit->clear();   
    this->setCaption("File new");
    this->show();
}

void ConfigForm::fileOpen()
{
    QString fn( QFileDialog::getOpenFileName( QString::null,"Config Files (*.txt*)", this ) );   
     if ( !fn.isEmpty() ) 
  load(fn);
     else
  statusBar()->message( "Loading aborted", 2000 );   
}

void ConfigForm::fileOpen2()
{
    //QString fileName ;
    fileName = QFileDialog::getOpenFileName( QString::null,
                    "Config Files (*.txt*)",
                    this,
                    "open file dialog",
                    "Choose a file to open"  );    
    if ( !fileName.isEmpty() ) {
 fileConfLineEdit->setText(fileName);
 load(fileName);
 //emit FileNameSelected( fileName ); 
    }
    else
 statusBar()->message( "Loading aborted", 2000 );
}
    
void ConfigForm::load( const QString &fileName )
{
    QFile f( fileName );
    if ( !f.open( IO_ReadOnly ) )
 return;
    QTextStream ts( &f );
    textEdit->setText( ts.read() );
    textEdit->setModified( FALSE );
    setCaption( fileName );
    statusBar()->message( "Loaded document " + fileName, 2000 );
}

void ConfigForm::fileSave()
{
    
    //printf("fileSave() \n");
    if ( fileName.isEmpty() ) {
 fileSaveAs();
 return;
    }  
    QString text = textEdit->text();
    QFile f( fileName );
    if ( !f.open( IO_WriteOnly ) ) {
 statusBar()->message( QString("Could not write to %1").arg(fileName),2000 );
 return;
    }
    QTextStream ts( &f );
    ts << text;
    f.close();
    textEdit->setModified( FALSE );
    setCaption(fileName);
    statusBar()->message( QString( "File %1 saved" ).arg( fileName ), 2000 );  
}

void ConfigForm::fileSaveAs()
{
     QString fn = QFileDialog::getSaveFileName(
      QString::null,
      "Config Files (*.txt*)",
      this,
      "save file dialog",
      "Choose a filename to save under" );
     //printf("fileSaveAs() \n");  
     if ( !fn.isEmpty() ) 
     {
  fileName = fn;
  fileSave();
     }
    else 
 statusBar()->message("Saving aborted",2000); 
}

int ConfigForm::saveAndContinue(const QString & action)
{
    int continueAction = 1;    
    if ( textEdit->isModified() ) {  
 switch( QMessageBox::information( this, "Config File", 
       "The document contains unsaved changes.\n"
       "Do you want to save the changes?", 
       "&Save", "&Don't Save", "&Cancel " + action, 
       0, // Enter == button 0   
                                                                        2 ) )  // Escape == button 2 
                      {
                        case 0: // Save; continue  
       fileSave();  
                                 break;   
           case 1: // Do not save; continue
        break;   
           case 2: // Cancel
        continueAction = 0;
        break;  
                      }   
    }  
    return continueAction;
}

void ConfigForm::filePrint()
{
     QPrinter printer( QPrinter::HighResolution );
     printer.setFullPage( TRUE );
     if ( printer.setup(this) ) {  // printer dialog
  statusBar()->message( "Printing..." );
  QPainter p( &printer );
  // Check that there is a valid device to print to
               if ( !p.device() ) return;  
  QPaintDeviceMetrics metrics( p.device() );
  int dpiy = metrics.logicalDpiY();
  int margin = (int) ( (2/2.54)*dpiy ); // 2 cm margins
  QRect body( margin, margin, metrics.width() - 2*margin, metrics.height() - 2*margin );
  QSimpleRichText richText( QStyleSheet::convertFromPlainText(textEdit->text()),
       QFont(),
       textEdit->context(),
       textEdit->styleSheet(),
       textEdit->mimeSourceFactory(),
       body.height() );
                richText.setWidth( &p, body.width() );
   QRect view( body );
   int page = 1;
   do {
       richText.draw( &p, body.left(), body.top(), view, colorGroup() );
       view.moveBy( 0, body.height() );
       p.translate( 0 , -body.height() );
       p.drawText( view.right() - p.fontMetrics().width( QString::number( page ) ),
     view.bottom() + p.fontMetrics().ascent() + 5, QString::number( page
                                  ) );
                if ( view.top()  >= richText.height() )
      break;
   printer.newPage();
   page++;
                } while (TRUE);
                statusBar()->message( "Printing completed", 2000 );
   } else {
       statusBar()->message( "Printing aborted", 2000 );
   }
}

void ConfigForm::fileExit()
{
    this->close();
}

void ConfigForm::editUndo()
{
    textEdit->undo();
}


void ConfigForm::editRedo()
{
     textEdit->redo();
}


void ConfigForm::editCut()
{
    textEdit->cut();
}


void ConfigForm::editCopy()
{
    textEdit->copy();
}


void ConfigForm::editPaste()
{
    textEdit->paste();
}

void ConfigForm::GenerateConfig()
{    
    FILE *stream;   
    char Line[1000];
    char order[50];   
   
    char fC[100];
    strcpy(fC,fileConfLineEdit->text());   
    sprintf(order,"isag_gen -1 -i eth0 -f %s ",fC );
    cg.setfile(order);
    cg.start(); 
    this->ConfigProgress();
  
    
    //Popup Error From File Error.txt
     if( (stream = fopen( "error.txt", "r" )) != NULL )
     { 
                  fgets( Line, 1000, stream ) ;
                  if( (strcmp(Line,""))==0)   
                  {
                       //printf("NULL = %s \n",Line);
                  } 
     else
     {
          //printf("not Null = %s \n",Line);
          errorForm o;
          o.show();
          o.setTextLabel(Line);
          o.exec();   
     }
     fclose( stream );
 }
}

void ConfigForm::FileNameSelected( const QString & fileName )
{

}


void ConfigForm::ConfigProgress()
{
      int check = 0;
     QProgressDialog *progress = new QProgressDialog("Sending Packet .....", "Cancel", 0, this,"progress", TRUE);
   
      progress->setCaption("Please Wait");
     
while(1)
      {    
    for (u_long x =0; x<60000000; x++)
    {
 //if ( ex.finished() ) break;
    }
  
    progress->setProgress( check );
   
        //if ( progress.wasCanceled() )
    if ( progress->wasCancelled() )
		  {
		system("killall isag_gen");
      break;
		  }
    if ( cg.finished() ) break;
   
    check = check+1;
    //... copy one file
 }
     cg.terminate();
    delete progress;
}
