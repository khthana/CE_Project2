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

MyThread req;
void icmpEchoReqForm::GenerateICMPReq()
{
   
    char device[5] ;
    strcpy(device,deviceLineEdit->text());
    printf("%s\n",device);    
    
   
    char sip[16];
    strcpy(sip, sIPLineEdit->text());    
  
    char dip[16];
    strcpy(dip,dIPLineEdit->text());     
   
    char number[10];
    strcpy(number,numberPacketlineEdit->text());
    //printf("%s\n",number);
    
  
    char payload[100];
    strcpy(payload,payloadLineEdit->text());
    
    char order[500];
    sprintf(order,"isag_gen -1 -i %s -G icmp_echo_cq -s %s  -d %s  -c %s -L %s", device ,sip,dip ,number,payload);
    //system(order);
    req.setfile(order);
    req.start();
    this->progressecho();
      //Popup Error From File Error.txt
    FILE *stream;
   char Line[200];
    if( (stream = fopen( "error.txt", "r" )) != NULL )
   { 
                 fgets( Line, 1000, stream ) ;
   if( (strcmp(Line,""))==0)   
   {
        printf("NULL = %s \n",Line);       
    }
    else
    {
                  printf("not Null = %s \n",Line);
     errorForm o;
     o.show();
     o.setTextLabel(Line);  
     o.exec();   
                  }
                 fclose( stream );
    }     

}






void icmpEchoReqForm::progressecho()
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
    if (req.finished() ) break;
    //printf(arp.finished());
    //printf("\n");
      //  break;
    check = check+1;
    //... copy one file
}
req.terminate () ;
delete progress;
}
