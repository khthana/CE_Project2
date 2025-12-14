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
MyThread un;
void unreachForm::GenerateUnreach()
{
     enum Typeunits
     {
  RawLayer,
  LinkLayer
      };
     
      // get type 
    char type[11];
    switch (modeComboBox->currentItem())
    {
    case RawLayer:
 strcpy(type,"LIBNET_RAW4");
 break;
    case LinkLayer: 
 strcpy(type,"LIBNET_LINK");
 break; 
    }
    //printf("%s\n",type);
   
    char device[10] ;
    strcpy(device,deviceLineEdit->text());
   
    char sip[16];
    strcpy(sip,sIPLineEdit->text());    
 
    char dip[16];
    strcpy(dip,dIPLineEdit->text());     
  
    char smac[24];
    char temp[4];
    char temp2[2];
    
    strcpy(temp2,lineEdit_Arp_Smac1_3->text());
    sprintf(smac,"0x%s",temp2);
    strcpy(temp,"");
    strcpy(temp2,lineEdit_Arp_Smac2_3->text());
    sprintf(temp,"0x%s",temp2);
    strcat(smac,temp);
    strcpy(temp,"");
    strcpy(temp2,lineEdit_Arp_Smac3_3->text());
    sprintf(temp,"0x%s",temp2);
    strcat(smac,temp);
    strcpy(temp,"");
    strcpy(temp2,lineEdit_Arp_Smac4_3->text());
    sprintf(temp,"0x%s",temp2);
    strcat(smac,temp);
    strcpy(temp,"");
    strcpy(temp2,lineEdit_Arp_Smac5_3->text());
    sprintf(temp,"0x%s",temp2);
    strcat(smac,temp);
    strcpy(temp,"");
    strcpy(temp2,lineEdit_Arp_Smac6_3->text());   
    sprintf(temp,"0x%s",temp2);
    strcat(smac,temp);
    strcpy(temp,"");
    
     
    
     
    char dmac[24];
     strcpy(temp2,lineEdit_Arp_Dmac1_3->text());
    sprintf(dmac,"0x%s",temp2);
    strcpy(temp2,lineEdit_Arp_Dmac2_3->text());
    sprintf(temp,"0x%s",temp2);
    strcat(dmac,temp);
    strcpy(temp2,lineEdit_Arp_Dmac3_3->text());
    sprintf(temp,"0x%s",temp2);
    strcat(dmac,temp);
    strcpy(temp2,lineEdit_Arp_Dmac4_3->text());
    sprintf(temp,"0x%s",temp2);
    strcat(dmac,temp);
    strcpy(temp2,lineEdit_Arp_Dmac5_3->text());
    sprintf(temp,"0x%s",temp2);
    strcat(dmac,temp);
    strcpy(temp2,lineEdit_Arp_Dmac6_3->text());
    sprintf(temp,"0x%s",temp2);
    strcat(dmac,temp);
    //printf("%s\n",dmac);    
    
    //get Number of packets
     //QString number = numberPacketlineEdit_3->text();
    char number[100];
    strcpy(number,numberPacketlineEdit_3->text());
    printf("%s\n",number);
    
    //set Command
    char order[500];
     if ( (strcmp(type,"LIBNET_LINK"))==0)
    { 
  sprintf(order,"isag_gen -1 -i%s -G icmp_unreach -s %s  -d %s -m %s -M %s  -t %s -c %s " ,device,sip,dip , smac ,dmac,type ,number);
  //printf("./isg_gen -1 -i eth0 -G icmp_unreach -s %s  -d %s -m %s -M %s  -t %s -c %s " ,sip,dip , smac ,dmac,type ,number);
    }
    else 
    {
 sprintf(order,"isag_gen -1 -i eth0 -G icmp_unreach -s %s  -d %s -t %s -c %s " ,sip,dip ,type ,number);
 //printf("./isg_gen -1 -i eth0 -G icmp_unreach -s %s  -d %s -t %s -c %s " ,sip,dip ,type ,number);
     }  
    un.setfile(order);
    un.start();
    this->progressun();
    //system(order);
    
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
                 else {
        //printf("not Null = %s \n",Line);
        errorForm o;
        o.show();
        o.setTextLabel(Line); 
        o.exec();   
                  }
     fclose( stream );
    }    
}

void unreachForm::ChangeMode()
{
   
     enum Typeunits
     {
  RawLayer,
  LinkLayer
      };
     
      // get type 
    char type[11];
    switch (modeComboBox->currentItem())
    {
    case RawLayer:
 strcpy(type,"LIBNET_RAW4");
 break;
    case LinkLayer: 
 strcpy(type,"LIBNET_LINK");
 break; 
    }
     printf("chageMode %s \n ",type);
     printf("%d\n",strlen(type));
     
    
   // if ( type == "LIBNET_RAW4" ) 
    if ( (strcmp(type,"LIBNET_RAW4"))==0) 
    {
 printf(" if Raw \n %s", type);
 lineEdit_Arp_Smac1_3->setEnabled(FALSE);
 lineEdit_Arp_Smac2_3->setEnabled(FALSE);
 lineEdit_Arp_Smac3_3->setEnabled(FALSE);
 lineEdit_Arp_Smac4_3->setEnabled(FALSE);
 lineEdit_Arp_Smac5_3->setEnabled(FALSE);
 lineEdit_Arp_Smac6_3->setEnabled(FALSE); 
 
 lineEdit_Arp_Dmac1_3->setEnabled(FALSE);
 lineEdit_Arp_Dmac2_3->setEnabled(FALSE);
 lineEdit_Arp_Dmac3_3->setEnabled(FALSE);
 lineEdit_Arp_Dmac4_3->setEnabled(FALSE);
 lineEdit_Arp_Dmac5_3->setEnabled(FALSE);
 lineEdit_Arp_Dmac6_3->setEnabled(FALSE); 
    }
    //if ( type == "LIBNET_LINK" )
     if ( (strcmp(type,"LIBNET_LINK"))==0)
    { 
  printf("if Link \n %s", type);
  lineEdit_Arp_Smac1_3->setEnabled(TRUE);
  lineEdit_Arp_Smac2_3->setEnabled(TRUE);
  lineEdit_Arp_Smac3_3->setEnabled(TRUE);
  lineEdit_Arp_Smac4_3->setEnabled(TRUE);
  lineEdit_Arp_Smac5_3->setEnabled(TRUE);
  lineEdit_Arp_Smac6_3->setEnabled(TRUE); 
  
  lineEdit_Arp_Dmac1_3->setEnabled(TRUE);
  lineEdit_Arp_Dmac2_3->setEnabled(TRUE);
  lineEdit_Arp_Dmac3_3->setEnabled(TRUE);
  lineEdit_Arp_Dmac4_3->setEnabled(TRUE);
  lineEdit_Arp_Dmac5_3->setEnabled(TRUE);
  lineEdit_Arp_Dmac6_3->setEnabled(TRUE); 
    }

}


void unreachForm::progressun()
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
   
    if ( progress->wasCancelled() )
   {
      system("killall isag_gen > /dev/null");
      break;
     }
    //if ( !(arp.running()) ) break;
    if (un.finished() ) break;
   
    check = check+1;
    //... copy one file
}
un.terminate () ;
delete progress;
}
