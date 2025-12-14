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
#include "configForm.h"
#include <qprogressdialog.h> 
#include "processform.h"
#include <qthread.h> 
#include "MyThread.h"
#include "libnet.h"
#include "errorform.h"


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
#include <qmainwindow.h> 
#include <qlineedit.h> 

#include <unistd.h>

MyThread ex;
MyThread com;
int stop=0;
void firstForm::fileOpen()
{  
    QString fileName ;
    fileName = QFileDialog::getOpenFileName( fileLineEdit1->text(),
                    "Pcap (*.pcap)",
                    this,
                    "open file dialog",
                    "Choose a file to open"  );
    
    if ( !fileName.isEmpty() ) {
 fileLineEdit1->setText(fileName);
 emit fileNameChanged( fileName ); 
    }
    else
 statusBar()->message( "Loading aborted", 2000 );
}

void firstForm::fileOpen2()
{
    QString fileName ;
    fileName = QFileDialog::getOpenFileName( fileLineEdit2->text(),
                    "Pcap (*.pcap)",
                    this,
                    "open file dialog",
                    "Choose a file to open"  );
    
    if ( !fileName.isEmpty() ) {
 fileLineEdit2->setText(fileName);
 emit fileNameChanged( fileName ); 
    }
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
   
   QFile f( filename );
   if ( !f.open( IO_WriteOnly ) ) {
      statusBar()->message( QString("Could not write to %1").arg(filename), 2000 );
      return;
   }
    QTextStream t( &f );   
    f.close();
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
    QApplication::exit( 0 );
}

void firstForm::helpAbout()
{
     QMessageBox::about( this,"Generater Tools Application", "Program Traffic Replay and Generator Tool version 1.0");
}


void firstForm::changeFunction( QAction* action)
{
    if( action == generateAction )
 functionWidgetStack->raiseWidget(generatePage);
    else if( action == replayAction )
 functionWidgetStack->raiseWidget(replayPage);
    else
 functionWidgetStack->raiseWidget(capturePage);
}

void firstForm::ChangeMode( )
{
      enum Typeunits
    {	 
    blank,
    SourceIP,
   DestinationIP,
   SourceANDDestinationIP,
   SourceORDestinationIP,
   ListofPacketNumbers,
   Protocol
    };
       enum Protocolunits
    {
	   Blank,
    TCP,
    UDP,
    ARP,
    ICMP
    };
       
    char type=' ';
    switch (patturnComboBox->currentItem())
    {
    case SourceIP:
 type='S';
 break;
    case DestinationIP: 
 type='D';
 break; 
    case SourceANDDestinationIP: 
 type='B';
 break; 
     case SourceORDestinationIP: 
  type='E';
  break; 
     case ListofPacketNumbers: 
  type='P';
  break; 
     case Protocol: 
  type='F';
  break; 
case blank:
  type='N';
  break;
    }
   
 
    char protocol[10];
    strcpy(protocol," ");
    switch (protocolComboBox->currentItem())
    {
    case TCP:
 strcpy(protocol,"'tcp'");
 break;
    case UDP: 
 strcpy(protocol,"'udp'");
 break; 
    case ARP: 
 strcpy(protocol,"'arp'");
 break; 
    case ICMP: 
 strcpy(protocol,"'icmp'");
 break; 
       }
    
    if ( (type  == 'S') || (type  == 'D') || (type  == 'B') || (type  == 'E') )
    {
 //printf("if type: %c \n",type);
 ipLineEdit->setEnabled(TRUE);
 listNumberLineEdit->setEnabled(FALSE);
 protocolComboBox->setEnabled(FALSE);
    }
    else if ( type  == 'P')
     {
 //printf("else type: %c \n",type);
 listNumberLineEdit->setEnabled(TRUE);
 ipLineEdit->setEnabled(FALSE);
 protocolComboBox->setEnabled(FALSE);
    }
    else if ( type == 'F')
    {
 //printf("else type: %c \n",type);
 listNumberLineEdit->setEnabled(FALSE);
 ipLineEdit->setEnabled(FALSE);
 protocolComboBox->setEnabled(TRUE);  
    }
    else if (type == 'N'){
	ipLineEdit->setEnabled(FALSE);
 listNumberLineEdit->setEnabled(FALSE);
 protocolComboBox->setEnabled(FALSE);
    }
    
   
 
}
 
void firstForm::showReplay()
{
    
    
    FILE *stream;
    
    char order[500];
    
    char dip[16];
   
    char ip[16];
    char protocol[10];
    
     char fl1[100];
    char sip[16];
     char list[100];
     int count=0;
    char cat[100];
    char buffer[100];
    char Line[1000];
    system("rm -f result");
    
    enum Typeunits
    {
blank,
 SourceIP,
 DestinationIP,
 SourceANDDestinationIP,
 SourceORDestinationIP,
 ListofPacketNumbers,
 Protocol
    };
    enum Protocolunits
    {
	Blank,
 TCP,
 UDP,
 ARP,
 ICMP
    };
    
      // get type 
    char type=' ';
    switch (patturnComboBox->currentItem())
    {
    case SourceIP:
 type='S';
 break;
    case DestinationIP: 
 type='D';
 break; 
    case SourceANDDestinationIP: 
 type='B';
 break; 
     case SourceORDestinationIP: 
  type='E';
  break; 
     case ListofPacketNumbers: 
  type='P';
  break; 
     case Protocol: 
  type='F';
  break; 
case blank:
  type='N';
 break;
    }
   // printf("1 :%c \n",type);    
       
   
    strcpy(fl1,fileLineEdit1->text());    
    sprintf(fl1,"%s",fl1);
    strcpy(list,listNumberLineEdit->text());     
    strcpy(dip,dIPLineEdit->text());    
    strcpy(sip,sIPLineEdit->text());   
    strcpy(ip,ipLineEdit->text());    
    sprintf(sip,"%s",sip);
    
    char device[10] ;
    strcpy(device,lineEdit_Replay_inf->text());
    
  
    
    char option= ' ';
    if ( matchRadioButton->isChecked() )
 option ='x';
    else if ( nMatchRadioButton->isChecked() )
 option='X';
    //printf("%c\n",option );
  
        
   
    switch (protocolComboBox->currentItem())
    {
    case TCP:
 strcpy(protocol,"'tcp'");
 break;
    case UDP: 
 strcpy(protocol,"'udp'");
 break; 
    case ARP: 
 strcpy(protocol,"'arp'");
 break; 
    case ICMP: 
 strcpy(protocol,"'icmp'");
 break; 
       }
  
   
     if ( (type  == 'S') || (type  == 'D') || (type  == 'B') || (type  == 'E')  )
    {
 
  if ( (strlen(sip) != 0 ) && (strlen(dip) != 0))
  {
      //strcpy(fl1,fileLineEdit1->text());   
      if (fastRadioButton->isChecked() )
   sprintf(order,"isag_gen -3 -i %s -%c %c:%s -f %s -S  -N 0.0.0.0/0:%s -N 0.0.0.0/0:%s -v  > result", device,option ,type ,ip ,fl1, sip, dip);
      else if ( normalRadioButton->isChecked() )   
   sprintf(order,"isag_gen -3 -i %s -%c %c:%s -f %s  -N 0.0.0.0/0:%s -N 0.0.0.0/0:%s -v  > result", device,option ,type ,ip ,fl1, sip, dip);      
      //printf("./project -3 -i eth0 -%c %c:%s -f %s -S %c -e %s:%s \n", option  , type, ip, fl1,speed, sip, dip );
  }
  else
  {
     // strcpy(fl1,fileLineEdit1->text());   
      if (fastRadioButton->isChecked() )
   sprintf(order,"isag_gen -3 -i %s -%c %c:%s -f %s -S  -v > result ", device,option ,type ,ip ,fl1);
      else if ( normalRadioButton->isChecked() )
   sprintf(order,"isag_gen -3 -i %s -%c %c:%s -f %s  -v > result ", device,option ,type ,ip ,fl1); 
      //printf("./isag_gen -3 -i eth0 -%c %c:%s -f %s  \n", option  , type, ip, fl1);
   }
   //printf("order = %s \n",order);
 
   ex.setfile(order);
   ex.start(); 

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
		        stop = 1;
     }
                  fclose( stream );
		  
 }     
     }
     else if ( type  == 'P')
     {
 
 
   
  if ( (strlen(sip) != 0 ) && (strlen(dip) != 0)) //change ip
  {
      if (fastRadioButton->isChecked() )
   sprintf(order,"isag_gen -3 -i %s -%c %c:%s -f %s -S -N 0.0.0.0/0:%s -N 0.0.0.0/0:%s -v > result",device,option, type, list, fl1, sip, dip);
      else if ( normalRadioButton->isChecked() )
   sprintf(order,"isag_gen -3 -i %s -%c %c:%s -f %s  -N 0.0.0.0/0:%s -N 0.0.0.0/0:%s -v > result",device,option, type, list, fl1, sip, dip);
  }
  else //not change ip
  {
      if (fastRadioButton->isChecked() )
   sprintf(order,"isag_gen -3 -i %s -%c %c:%s -f %s -S  -v > result",device,option, type, list, fl1);
      else if ( normalRadioButton->isChecked() )
   sprintf(order,"isag_gen -3 -i %s -%c %c:%s -f %s -v > result",device,option, type, list, fl1);
  }

  ex.setfile(order);
 ex.start();  
 
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
	stop = 1;
     }
                  fclose( stream );
		   
              }     
     }
    else if ( type == 'F')
    {
 
 if ( (strlen(sip) != 0 ) && (strlen(dip) != 0)) //change ip
    {
     if (fastRadioButton->isChecked() )
  sprintf(order,"isag_gen -3 -i %s -%c %c:%s -f %s -S -N 0.0.0.0/0:%s -N 0.0.0.0/0:%s -v > result ",device,option , type, protocol, fl1, sip, dip);
     else if ( normalRadioButton->isChecked() )
  sprintf(order,"isag_gen -3 -i %s -%c %c:%s -f %s -N 0.0.0.0/0:%s -N 0.0.0.0/0:%s -v > result ",device,option , type, protocol, fl1, sip, dip);
 }
 else //not change ip
 {
     if (fastRadioButton->isChecked() )
  sprintf(order,"isag_gen -3 -i %s -%c %c:%s -f %s -S  -v > result ",device,option , type, protocol, fl1);
     else if ( normalRadioButton->isChecked() )
  sprintf(order,"isag_gen -3 -i %s -%c %c:%s -f %s  -v > result ",device,option , type, protocol, fl1);
 }

 ex.setfile(order);
 ex.start(); 
 //system(order);.h:337: error: `project' undeclared (first use this function)
 
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
  stop = 1;
    }
    fclose( stream );
   
}     
}
    else if (type == 'N')
    {
	 if ( (strlen(sip) != 0 ) && (strlen(dip) != 0)) //change ip
    {
     if (fastRadioButton->isChecked() )
  sprintf(order,"isag_gen -3 -i %s -f %s -S -N 0.0.0.0/0:%s -N 0.0.0.0/0:%s -v > result ",device, fl1, sip, dip);
     else if ( normalRadioButton->isChecked() )
  sprintf(order,"isag_gen -3 -i %s -f %s -N 0.0.0.0/0:%s -N 0.0.0.0/0:%s -v > result ",device, fl1, sip, dip);
 }
 else //not change ip
 {
     if (fastRadioButton->isChecked() )
  sprintf(order,"isag_gen -3 -i %s -f %s -S  -v > result ",device, fl1);
     else if ( normalRadioButton->isChecked() )
  sprintf(order,"isag_gen -3 -i %s -f %s  -v > result ",device,fl1);
 }
 ex.setfile(order);
 ex.start(); 
 //system(order);.h:337: error: `project' undeclared (first use this function)
 
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
 stop = 1;
    }
    fclose( stream );
   
}     
	
	
    }
  printf("stop %d \n",stop);
     this->Showprogress();
 
     if (stop != 1){
  
       if( (stream= fopen( "result", "r" )) != NULL )
   { 
  while(1)
 {
   fgets( Line, 1000, stream ) ;
   if( Line[0] == ' ')   
   {
       // printf("NULL = %s \n",Line);       
       break;
   }
   else
   {
       // printf("not Null = %s \n",Line);
       count++;
                              }
               }
               fclose( stream );
   }  else return;      
   
   
    //printf("count %d \n",count);   
    tableResult->setNumRows(count);
    tableResult->setNumCols(5);
    stream = fopen( "result", "r" );
    int k;
 
    for (int x=0; x<count; x++)
    {
 strcpy(Line,"");
 strcpy(buffer,"");  
 fgets( Line, 1000, stream ) ;
 int line =0;
 line = strlen(Line);
                 ///////////time
                 for (k=0; k<1000; k++) 
     { 
    strcpy(cat,"");       
    if (Line[k] == ' ') break; 
    sprintf( cat , "%c", Line[k]); 
    strcat(buffer,cat);        
     }
    //printf("time =%s ",buffer);
     
                   tableResult->setText( x, 0, buffer);    
                   strcpy(buffer,"");  
 //protocol   
    for (k=k+1; k<1000; k++) 
                 { 
           strcpy(cat,"");       
           if (Line[k] == ' ') break; 
           sprintf( cat , "%c", Line[k]); 
           strcat(buffer,cat);        
                   }     
    //printf("protocol %s ",buffer);
     
                 
     if ( strcmp(buffer,"arp") == 0 )
    {
   tableResult->setText( x, 3, buffer);    
   strcpy(buffer,"");  
   int temp_k = k;
     for (k=k+1; k<line; k++)
               {
                       strcpy(cat,"");      
                       if (Line[k] == ' ') break; 
                       sprintf( cat , "%c", Line[k]); 
                              strcat(buffer,cat);       
               } 
     
               if (strcmp(buffer,"reply") == 0)
               {
                       strcpy(buffer,"");
		       //destination ip
                         for (k=k+1; k<line; k++)
               {
                       strcpy(cat,"");      
                       if (Line[k] == ' ') break; 
                       sprintf( cat , "%c", Line[k]); 
                              strcat(buffer,cat);       
               } 
               tableResult->setText( x, 2, buffer);    
               strcpy(buffer,"");
	    //.....is-at.....   
	  for (k=k+1; k<line; k++)
               {
                       //strcpy(cat,"");      
                       if (Line[k] == ' ') break; 
                       //sprintf( cat , "%c", Line[k]); 
                              //strcat(buffer,cat);       
               } 
	  //source mac
	 for (k=k+1; k<line; k++)
               {
                       strcpy(cat,"");      
                       if (Line[k] == ' ') break; 
                       sprintf( cat , "%c", Line[k]); 
                              strcat(buffer,cat);       
               } 
	 
	 tableResult->setText( x, 1, buffer);    
               strcpy(buffer,"");
	       
	 k = temp_k;
	 //info
	 for (k=k+1; k<line; k++)
               {
                       strcpy(cat,"");      
                       //if (Line[k] == ' ') break; 
                       sprintf( cat , "%c", Line[k]); 
                              strcat(buffer,cat);       
               } 
	 
	 tableResult->setText( x, 4, buffer);    
               strcpy(buffer,"");		 
	
	 continue;       
	       
	 }
               k = temp_k;
	 for (k=k+1; k<line; k++)
               {
                       strcpy(cat,"");      
                       //if (Line[k] == ' ') break; 
                       sprintf( cat , "%c", Line[k]); 
                              strcat(buffer,cat);       
               } 
  
  
               tableResult->setText( x, 4, buffer);    
               strcpy(buffer,"");
   
               for (k=k-1; k>1; k--)
 {                  
                   if (Line[k] == ' ') break;      
                   //printf("c = %c %d \n",Line[c],c);
              }
              for (k=k+1; k<line; k++)
              {
                   strcpy(cat,"");      
                   if (Line[k] == ' ') break; 
                   sprintf( cat , "%c", Line[k]); 
                              strcat(buffer,cat);                 
 }
       //printf("s = %s \n",buffer);
      tableResult->setText( x, 1, buffer);    
                   strcpy(buffer,"");  
                tableResult->setText( x, 2, "boardcast");    
                 //  strcpy(buffer,"");  
                continue;
     }
      if ( strcmp(buffer,"802.1d") == 0 )
    {
    tableResult->setText( x, 3, "stp");  
      strcpy(buffer,""); 
                  for (k=k+1; k<line; k++)
              {
                   strcpy(cat,"");      
                   //if (Line[k] == ' ') break; 
                   sprintf( cat , "%c", Line[k]); 
                              strcat(buffer,cat);                 
             }
      tableResult->setText( x, 4, buffer);    
                   strcpy(buffer,"");  
       //printf("s = %s \n",buffer)
      tableResult->setText( x, 1, "Cisco");    
       tableResult->setText( x, 2, "spanning-tree");    
     
      
 continue;
   
      }
      tableResult->setText( x, 3, buffer);   
                  strcpy(buffer,"");  
      
 
 //ip address source   
                 for ( k=k+1; k<1000; k++) 
                 { 
           strcpy(cat,"");       
           if (Line[k] == ' ') break; 
           sprintf( cat , "%c", Line[k]); 
           strcat(buffer,cat);        
                   }   
   //printf("sip =%s ",buffer);     
                   tableResult->setText( x, 1, buffer);    
                   strcpy(buffer,"");  
 //ip address destination    
                   for (k=k+3; k<1000; k++) 
                 { 
           strcpy(cat,"");           
           if (Line[k] == ' ') break; 
           sprintf( cat , "%c", Line[k]); 
           strcat(buffer,cat);        
                   }     
       //printf("dstip=%s ",buffer);
     
                   tableResult->setText( x, 2, buffer);    
                   strcpy(buffer,"");  
                  for (k=k+1; k<line; k++) 
                 { 
        strcpy(cat,"");       
        //if (Line[k] == ' ') break;  
        sprintf( cat , "%c", Line[k]); 
                     strcat(buffer,cat);        
                   }     
    
     
                   //printf("%s \n",buffer);
                   tableResult->setText( x, 4, buffer);  
                   strcpy(buffer,"");  
                   k=0;
                 
    }
    fclose( stream );
}
     else stop = 0;
    
}

void firstForm::ModeChange()
{
    if (  templateRadioButton->isChecked() )
    {
 templateForm o;
 o.show();
 o.exec();
    }
    else 
    {
 ConfigForm *mw = new ConfigForm();
 mw->setCaption( "Configuration File" );
 mw->show();
    }
}


void firstForm::fileNameChanged( const QString & )
{

}

void firstForm::ShowCapture()
{
    char fileshow[100];
    char command[100];
    int count=0;
    char cat[100];
    char buffer[100];
    char Line[1000];
     FILE *stream;
    strcpy(buffer,"");
    strcpy(fileshow,"");
    system("rm -f capture");
   
    
    strcpy(fileshow,fileLineEdit2->text());
    if ( (strcmp(fileLineEdit2->text(),"")) == 0) return;
    sprintf(command,"isag_gen -2 -H -f %s > capture",fileshow);
    system(command);
    
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
 fclose( stream );
 return;
    }
    fclose( stream );
    
}     
    //Popup Error From File Error.txt
   
   
    if( (stream = fopen( "capture", "r" )) != NULL )
   { 
 while(1)
 {
     fgets( Line, 1000, stream ) ;
     int jo = strlen(Line);
   if( jo == 1)   
   {   
       //printf("NULL = %s \n",Line);   
       break;
   }
   else
   {
       
     // printf("not Null = %s \n",Line);
   
       count++;
   }
}
               fclose( stream );
    }      
    else {
 
 return;    
}
    capturetable->setNumRows(count);
    capturetable->setNumCols(5);
    stream = fopen( "capture", "r" );
    //int col=0;
    int j;
    int line;
    for (int x=0; x<count; x++)
    {
 strcpy(Line,"");
 fgets( Line, 1000, stream ) ;
 line = strlen(Line);
        
                  ///////////time
                  for (j=0; j<1000; j++) 
     { 
    strcpy(cat,"");       
    if (Line[j] == ' ') break; 
    sprintf( cat , "%c", Line[j]); 
    strcat(buffer,cat);        
     }
                   capturetable->setText( x, 0, buffer);    
                   strcpy(buffer,"");  
 //lenght   
    for (j=j+5; j<1000; j++) 
                 { 
           strcpy(cat,"");       
           if (Line[j] == ' ') break; 
           sprintf( cat , "%c", Line[j]); 
           strcat(buffer,cat);        
                   }    
                  // capturetable->setText( x, 1, buffer);    
                   strcpy(buffer,"");  
 //protocol   
                     for (j=j+1; j<1000; j++) 
                 { 
           strcpy(cat,"");       
           if (Line[j] == ' ') break; 
           sprintf( cat , "%c", Line[j]); 
           strcat(buffer,cat);        
                   } 
   
   if ( strcmp(buffer,"ARP") == 0 )
    {
      
   capturetable->setText( x, 2, "boardcast");
   capturetable->setText( x, 3, buffer);    
   strcpy(buffer,"");  
   int k;
  for (k=j+1; k<line; k++)
               {
                       strcpy(cat,"");      
                       if (Line[k] == ' ') break; 
                       sprintf( cat , "%c", Line[k]); 
                              strcat(buffer,cat);       
               } 
                capturetable->setText( x, 1, buffer);    
                   strcpy(buffer,"");
   
               
              for (k=k+1; k<line; k++)
              {
                   strcpy(cat,"");      
                   //if (Line[k] == ' ') break; 
                   sprintf( cat , "%c", Line[k]); 
                              strcat(buffer,cat);                 
          }     
      capturetable->setText( x,4, buffer);    

                   strcpy(buffer,"");  
               
                continue;
     }
   
         if ( strcmp(buffer,"STP") == 0 )
    {
	 
	  capturetable->setText( x, 3, buffer);   
	  capturetable->setText( x,1, "Cisco");    
	  capturetable->setText( x,2, "Spanning-tree");    
	  capturetable->setText( x,4, "Cisco Spanning-tree");    
	  strcpy(buffer,"");  
	  continue;	  
      }
   
                   capturetable->setText( x, 3, buffer);   
   
                   strcpy(buffer,"");  
 //ip address source   
                           for ( j+1; j<1000; j++) 
                 { 
           strcpy(cat,"");       
           if (Line[j] == '-') break; 
           sprintf( cat , "%c", Line[j]); 
           strcat(buffer,cat);        
                   }   
                   capturetable->setText( x, 1, buffer);    
                   strcpy(buffer,"");  
 //ip address destination    
                            for (j=j+2; j<1000; j++) 
                 { 
           strcpy(cat,"");           
           if (Line[j] == ' ') break; 
           sprintf( cat , "%c", Line[j]); 
           strcat(buffer,cat);        
                   }     
                   capturetable->setText( x, 2, buffer);    
                   strcpy(buffer,"");  
     
             //info
                  for (j=j+1; j<1000; j++) 
                 { 
        strcpy(cat,"");       
        if (Line[j] == '.') break; 
        sprintf( cat , "%c", Line[j]); 
                     strcat(buffer,cat);        
                   }     
                   //printf("%s \n",buffer);
                   capturetable->setText( x, 4, buffer);  
                   strcpy(buffer,"");  
                   j=0;
                
    }
    fclose( stream );
}

void firstForm::clickTable( int row, int col )
{
    char bufferRow[50];
    char Row[3];
    
    strcpy(Row,"");
    strcpy(bufferRow,"");
    row = row +1;
    sprintf(Row,"%d,",row);
  
    strcpy(bufferRow,listNumberLineEdit->text());
   
    if (row != 0)
    {
    strcat(bufferRow,Row);
    listNumberLineEdit->setEnabled(TRUE);
    listNumberLineEdit->setText(bufferRow);   
    patturnComboBox->setCurrentItem(5);
    }
}

void firstForm::startCapture()
{   
   
    char file[100];
    char capture[100];
    
   char device[10] ;
    strcpy(device,lineEdit_Capture_inf->text());
    
    strcpy(file,fileLineEdit2->text());
    sprintf(capture,"isag_gen -2 -i %s -f %s",device,file);
   
    com.setfile(capture);
    com.start();
   
    this->ShowCaptureprogress();
 
    
    
    }
void firstForm::Showprogress()
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
   // printf("debug\n");
    progress->setProgress( check );
    //this->processEvents();
        //if ( progress.wasCanceled() )
    if ( progress->wasCancelled() )
    {
      stop = 1;
      system("killall isag_gen > /dev/null");
      break;
     }
    if ( ex.finished() ) break;
      //  break;
    check = check+1;
    //... copy one file
 }
  
    ex.terminate();
    //ex.wait();
    //ex.exit();
    delete progress;
}


void firstForm::ShowCaptureprogress()
{
     int check = 0;
     QProgressDialog *progress = new QProgressDialog("Capture Packet .....", "Stop", 0, this,"progress", TRUE);
    
      progress->setCaption("Please Wait");
    
while(1)
      {    
    for (u_long x =0; x<60000000; x++)
    {
 //if ( ex.finished() ) break;
    }
  
    progress->setProgress( check );
  
    if ( progress->wasCancelled() )
    {
      system("killall isag_gen > /dev/null");
      break;
     }
    //if ( ex.finished() ) break;
      //  break;
    check = check+1;
    //... copy one file
 }
    com.terminate () ;
    //com.wait();
    //com.exit();
    delete progress;
}


void firstForm::displayshow()
{
     char fileshow[100];
    char command[100];
    int count=0;
    char cat[100];
    char buffer[100];
    char Line[1000];
     FILE *stream;
    strcpy(buffer,"");
    strcpy(fileshow,"");
    system("rm -f capture");
  
    printf("replay \n");
    strcpy(fileshow,fileLineEdit1->text());
    if ( (strcmp(fileLineEdit1->text(),"")) == 0) return;
    sprintf(command,"isag_gen -2 -H -f %s > capture",fileshow);
    system(command);
    
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
 fclose( stream );
 return;
    }
    fclose( stream );
    
}     
    //Popup Error From File Error.txt
   
   
    if( (stream = fopen( "capture", "r" )) != NULL )
   { 
 while(1)
 {
     fgets( Line, 1000, stream ) ;
     int jo = strlen(Line);
   if( jo == 1)   
   {   
       //printf("NULL = %s \n",Line);   
       break;
   }
   else
   {
       
    
       count++;
   }
}
               fclose( stream );
    }      
    else {

 return;    
}
    tableResult->setNumRows(count);
    tableResult->setNumCols(5);
    stream = fopen( "capture", "r" );
    //int col=0;
    int j;
    int line;
    for (int x=0; x<count; x++)
    {
 strcpy(Line,"");
 fgets( Line, 1000, stream ) ;
 line = strlen(Line);
            
                  ///////////time
                  for (j=0; j<1000; j++) 
     { 
    strcpy(cat,"");       
    if (Line[j] == ' ') break; 
    sprintf( cat , "%c", Line[j]); 
    strcat(buffer,cat);        
     }
                   tableResult->setText( x, 0, buffer);    
                   strcpy(buffer,"");  
 //lenght   
    for (j=j+5; j<1000; j++) 
                 { 
           strcpy(cat,"");       
           if (Line[j] == ' ') break; 
           sprintf( cat , "%c", Line[j]); 
           strcat(buffer,cat);        
                   }    
                  // capturetable->setText( x, 1, buffer);    
                   strcpy(buffer,"");  
 //protocol   
                     for (j=j+1; j<1000; j++) 
                 { 
           strcpy(cat,"");       
           if (Line[j] == ' ') break; 
           sprintf( cat , "%c", Line[j]); 
           strcat(buffer,cat);        
                   } 
   
   if ( strcmp(buffer,"ARP") == 0 )
    {
      
 tableResult->setText( x, 2, "boardcast");
   tableResult->setText( x, 3, buffer);    
   strcpy(buffer,"");  
   int k;
  for (k=j+1; k<line; k++)
               {
                       strcpy(cat,"");      
                       if (Line[k] == ' ') break; 
                       sprintf( cat , "%c", Line[k]); 
                              strcat(buffer,cat);       
               } 
                tableResult->setText( x, 1, buffer);    
                   strcpy(buffer,"");
   
               
              for (k=k+1; k<line; k++)
              {
                   strcpy(cat,"");      
                   //if (Line[k] == ' ') break; 
                   sprintf( cat , "%c", Line[k]); 
                              strcat(buffer,cat);                 
          }     
      tableResult->setText( x,4, buffer);    

                   strcpy(buffer,"");  
               
                continue;
     }
   
      if ( strcmp(buffer,"STP") == 0 )
    {
	  tableResult->setText( x, 3, buffer);   
	   tableResult->setText( x,1, "Cisco");    
	    tableResult->setText( x,2, "Spanning-tree");    
	     tableResult->setText( x,4, "Cisco Spanning-tree");    
	  strcpy(buffer,"");  
	  continue;	  
      }
                   tableResult->setText( x, 3, buffer);   
   
                   strcpy(buffer,"");  
 //ip address source   
                           for ( j+1; j<1000; j++) 
                 { 
           strcpy(cat,"");       
           if (Line[j] == '-') break; 
           sprintf( cat , "%c", Line[j]); 
           strcat(buffer,cat);        
                   }   
                   tableResult->setText( x, 1, buffer);    
                   strcpy(buffer,"");  
 //ip address destination    
                            for (j=j+2; j<1000; j++) 
                 { 
           strcpy(cat,"");           
           if (Line[j] == ' ') break; 
           sprintf( cat , "%c", Line[j]); 
           strcat(buffer,cat);        
                   }     
                   tableResult->setText( x, 2, buffer);    
                   strcpy(buffer,"");  
     
             //info
                  for (j=j+1; j<1000; j++) 
                 { 
        strcpy(cat,"");       
        if (Line[j] == '.') break; 
        sprintf( cat , "%c", Line[j]); 
                     strcat(buffer,cat);        
                   }     
                   //printf("%s \n",buffer);
                   tableResult->setText( x, 4, buffer);  
                   strcpy(buffer,"");  
                   j=0;
             
    }
    fclose( stream );
}


