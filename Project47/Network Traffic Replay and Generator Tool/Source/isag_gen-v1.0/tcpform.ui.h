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

#include "libnet.h"
#include "errorform.h"
#include <qthread.h> 
#include "MyThread.h"
#include <qprogressdialog.h> 

MyThread tcp;
void tcpForm::GenerateTCP()
{
   
    char device[5] ;
    strcpy(device,deviceLineEdit->text());
   
    char sip[16];
    strcpy(sip, sourceIPLineEdit->text());    
  
    char dip[16];
    strcpy(dip,desIPLineEdit->text());     
   
    char sport[6];
    strcpy(sport,sPortLineEdit->text());
   
    char dport[6];
    strcpy(dport,dPortLineEdit->text());
   
    char number[10];
    strcpy(number,numberPacketlineEdit->text());
    //printf("%s\n",number);
    char payload[100];
    strcpy(payload,payloadlineEdit->text());
    
    int size_payload=0;
    size_payload = atoi(size_payloadlineEdit->text());
    
   //printf("%s payload %d size \n",payload,size_payload);
     char order[500];
   if (strlen(payload) != 0 )
    {
       if (size_payload == 0)
	   size_payload = strlen(payload);
       sprintf(order,"isag_gen -1 -i %s -G tcp -s %s  -d %s -p %s -P %s  -c %s -l %s -L %d ", device ,sip,dip , sport ,dport ,number,payload,size_payload);
   }
     else
   {
    sprintf(order,"isag_gen  -1 -i %s -G tcp -s %s  -d %s -p %s -P %s  -c %s", device ,sip,dip , sport ,dport ,number);
}
    tcp.setfile(order);
    tcp.start();
    //system(order);
    this->progresstcp();
      //Popup Error From File Error.txt
    FILE *stream;
   char Line[200];
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


void tcpForm::progresstcp()
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
      system("killall isag_gen > /dev/null");
      break;
     }
    //if ( !(arp.running()) ) break;
    if (tcp.finished() ) break;
   
    check = check+1;
    //... copy one file
}
tcp.terminate () ;
delete progress;
}
