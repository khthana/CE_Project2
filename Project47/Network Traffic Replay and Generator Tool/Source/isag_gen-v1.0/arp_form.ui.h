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
//#include "processForm.h"
MyThread arp;
void ARP_Form::set_value()
{
    enum Typeunits
    {
 Request,
 Reply
    };
    
    
    char device[10] ;
    strcpy(device,lineEdit_Arp_Device->text());
   
    // get type 
    char type[7];
    switch (comboBox_Arp_Type->currentItem())
    {
    case Request:
 strcpy(type,"request");
 break;
    case Reply: 
 strcpy(type,"reply");
 break; 
    }
   
    char sip[16];
    strcpy(sip, lineEdit_Arp_Sip->text());    
  
    char smac[24];
    char temp[4];
    char temp2[2];
    
    strcpy(temp2,lineEdit_Arp_Smac1->text());
    sprintf(smac,"0x%s",temp2);
    strcpy(temp,"");
    strcpy(temp2,lineEdit_Arp_Smac2->text());
    sprintf(temp,"0x%s",temp2);
    strcat(smac,temp);
    strcpy(temp,"");
    strcpy(temp2,lineEdit_Arp_Smac3->text());
    sprintf(temp,"0x%s",temp2);
    strcat(smac,temp);
    strcpy(temp,"");
    strcpy(temp2,lineEdit_Arp_Smac4->text());
    sprintf(temp,"0x%s",temp2);
    strcat(smac,temp);
    strcpy(temp,"");
    strcpy(temp2,lineEdit_Arp_Smac5->text());
    sprintf(temp,"0x%s",temp2);
    strcat(smac,temp);
    strcpy(temp,"");
    strcpy(temp2,lineEdit_Arp_Smac6->text());   
    sprintf(temp,"0x%s",temp2);
    strcat(smac,temp);
    strcpy(temp,"");
    
   // printf("smac = %s \n",smac);
   
    char dip[16];
    strcpy(dip,lineEdit_Arp_Dip->text());     
  
    char dmac[24];
    strcpy(temp2,lineEdit_Arp_Dmac1->text());
    sprintf(dmac,"0x%s",temp2);
    strcpy(temp2,lineEdit_Arp_Dmac2->text());
    sprintf(temp,"0x%s",temp2);
    strcat(dmac,temp);
    strcpy(temp2,lineEdit_Arp_Dmac3->text());
    sprintf(temp,"0x%s",temp2);
    strcat(dmac,temp);
    strcpy(temp2,lineEdit_Arp_Dmac4->text());
    sprintf(temp,"0x%s",temp2);
    strcat(dmac,temp);
    strcpy(temp2,lineEdit_Arp_Dmac5->text());
    sprintf(temp,"0x%s",temp2);
    strcat(dmac,temp);
    strcpy(temp2,lineEdit_Arp_Dmac6->text());
    sprintf(temp,"0x%s",temp2);
    strcat(dmac,temp);
  // printf("dmac = %s \n",smac);
    char number[3];
    strcpy(number,numberPacketlineEdit->text());
  
    char order[500];
    sprintf(order,"isag_gen -1 -i %s -G arp -s %s  -d %s -m %s -M %s  -t %s -c %s > /dev/null", device ,sip,dip , smac ,dmac,type ,number);
    //sprintf(order,"./project -3 -i eth0 -f ademo.pcap");
    arp.setfile(order);
    arp.start();
 
    
    this->ProgressArp();    
   // system(order);
    
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
}//end


void ARP_Form::ProgressArp()
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
  
    if ( progress->wasCancelled() )
    {
      system("killall isag_gen > /dev/null");
      break;
     }
    //if ( !(arp.running()) ) break;
    if (arp.finished() ) break;
 
    check = check+1;
    //... copy one file
}
arp.terminate () ;

delete progress;
}
