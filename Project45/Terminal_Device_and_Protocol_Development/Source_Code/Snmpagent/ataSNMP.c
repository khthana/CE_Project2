/*!
 * Copyright (C) 2001-2002 by egnite Software GmbH. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this
 *    software must display the following acknowledgement:
 *
 *    This product includes software developed by egnite Software GmbH
 *    and its contributors.
 * 
 * THIS SOFTWARE IS PROVIDED BY EGNITE SOFTWARE GMBH AND CONTRIBUTORS
 * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL EGNITE
 * SOFTWARE GMBH OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
 * THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 * For additional information see http://www.ethernut.de/
 */
 
/*!
 * $Log: inetq.c,v $
 * Revision 1.4  2002/06/12 10:55:54  harald
 * *** empty log message ***
 *
 * Revision 1.3  2002/06/04 19:11:29  harald
 * *** empty log message ***
 *
 * Revision 1.2  2002/05/08 16:02:30  harald
 * First Imagecraft compilation
 *
 */

/*!
 * 
 *
 *  This program is made by ataya p (DigiForce)
 */
#include <string.h>
#include <stdlib.h> 

#include <dev/uartavr.h>
#include <dev/nicrtl.h>

#include <sys/heap.h> 
#include <sys/thread.h>
#include <sys/timer.h>
#include <sys/print.h>
#include <sys/kprint.h>  

#include <netinet/sostream.h>
#include <arpa/inet.h>
#include <net/route.h>
#include <netdb.h>  
#include <ds/DS1820.h> 

//#include <mib/mib.c>

#define DNSSERVERIP     "161.246.4.3"
#define MY_MAC          {0x00,0x06,0x98,0x20,0x00,0x00}
#define MY_IP           "161.246.5.135"
#define MY_MASK         "255.255.255.0"
#define MY_GATE         "161.246.5.254"
#define ManagerAdd      "161.246.5.134" 
  

static u_char my_mac[] = MY_MAC; 
static u_short SNMPport=161;
static u_short TRAPport=162;
static int bufflen=0;//total length for sending packet
static u_char buff[500];
static int maxtemp=28;

 NUTDEVICE *uart0;
 u_long baud = 115200;
    
static u_char setpassword[]="private";
static u_char getpassword[]="public";   
//Mini MIB
//Object in systems   
static  u_char sysDescrID[]={0x2b,0x06,0x01,0x02,0x01,0x01,0x01,0x00};
static  u_char sysDescr[]="EtherNut 128KbyteFlashROM 32KbyteSRAM";//read-only

static  u_char sysObjIDID[]={0x2b,0x06,0x01,0x02,0x01,0x01,0x02,0x00};
//static  u_char sysObjID[]="";//Null  read-only

static  u_char sysUpTimeID[]={0x2b,0x06,0x01,0x02,0x01,0x01,0x03,0x00};
static  int    sysUpTime;//read-only

static  u_char sysContactID[]={0x2b,0x06,0x01,0x02,0x01,0x01,0x04,0x00};
static  u_char sysContact[]="Ataya P KMITL bangkok"; //read-write

static  u_char sysNameID[]={0x2b,0x06,0x01,0x02,0x01,0x01,0x05,0x00};
static  u_char sysName[]="Ethernut SNMP demo";//read-write

static  u_char sysLocateID[]={0x2b,0x06,0x01,0x02,0x01,0x01,0x06,0x00};
static  u_char sysLocate[]="ESL,Room 603";//read-write

static  u_char sysServID[]={0x2b,0x06,0x01,0x02,0x01,0x01,0x07,0x00};
static  int    sysServ=1;//only snmp   //read-only

//enterprise 1.3.6.1.4.1
//static  u_char led1DescrID[]={0x2b,0x06,0x01,0x04,0x01,0x07,0x01,0x01,0x01,0x00};
static  u_char led1Descr[]="LED 1 value > 0 : ON"; //read-write
//static  u_char led1ValueID[]={0x2b,0x06,0x01,0x04,0x01,0x07,0x01,0x01,0x02,0x00};
static   int   led1Value=0;//read-write

//static  u_char led2DescrID[]={0x2b,0x06,0x01,0x04,0x01,0x07,0x01,0x01,0x03,0x00};
static  u_char led2Descr[]="LED 2 value > 0 : ON"; //read-write
//static  u_char led2ValueID[]={0x2b,0x06,0x01,0x04,0x01,0x07,0x01,0x01,0x04,0x00};
static   int   led2Value=0;


//static  u_char led3DescrID[]={0x2b,0x06,0x01,0x04,0x01,0x07,0x01,0x01,0x05,0x00};
static  u_char led3Descr[]="LED 3 value > 0 : ON"; //read-write
//static  u_char led3ValueID[]={0x2b,0x06,0x01,0x04,0x01,0x07,0x01,0x01,0x06,0x00};
static   int   led3Value=0;


//static  u_char led4DescrID[]={0x2b,0x06,0x01,0x04,0x01,0x07,0x01,0x01,0x07,0x00};
static  u_char led4Descr[]="LED 4 value > 0 : ON"; //read-write
//static  u_char led4ValueID[]={0x2b,0x06,0x01,0x04,0x01,0x07,0x01,0x01,0x08,0x00};
static   int   led4Value=0;

//staticu_char temp1DescrID[]={0x2b,0x06,0x01,0x04,0x01,0x07,0x01,0x02,0x01,0x00};
static  u_char temp1Descr[]="Temperature Sensor : DS1820"; //read-only
static u_char temp1ValueID[]={0x2b,0x06,0x01,0x04,0x01,0x07,0x01,0x02,0x02,0x00};
static  int temp1Value=0;

//trap variable
static u_char TrapEnterprise[]={0x2b,0x06,0x01,0x04,0x01,0x09,0x01,0x01,0x01,0x00};      
static u_char TrapIP[]={0xA1,0xF6,0x05,0x87};//161.246.5.135



struct BERin
{  int length;   //length of data
   int version;  //version of SNMP
   int commlen ; //communicationlen 
   u_char community[10]; //community 
   enum PDUtype {get_request=0xA0,get_next_request=0xA1,get_response=0xA2,set_request=0xA3,trap=0xA4}pdutype;
   int reqlen; //requestID len
   u_char requestID[5];
   enum ErrStatus {noError=0,tooBig=1,noSuchName=2,badValue=3,readOnly=4,genErr=25}errstat;
   int  ErrIndex;
   u_char OID[5][60];  //max OID request = 5
   u_char Value[5][50];
   int  ObjItem;
   
   
   //Trap define here
   u_char trapcommu[10];
   u_char enterprise[10];
   u_char agentadd[10];
   enum   Generaltrap{coldstart=0,warmstart=1,linkdown=2,linkup=3,authenfail=4,egpneighborloss=5,enterprisespec=6}gentrap; 
   int    spectrap;//?
   int    timestamp;
    
  
}berin;




void SNMPgetMIB(u_char *buff)
{  
   u_char temp[300]; 
   u_char value[60];
   int len=0;
   int p=0;
   int pl[1];//pointer at len
   int i=0,j=-1,m=0,n=0,l=0;
   
   //Didn't debug the length over 127 byte
   
   temp[p]=0x30;//sequence
   temp[++p]=len;//len of object
    
    if(berin.pdutype==set_request)
    {
      
      if(!strstr(berin.community,setpassword))
      {      
           
           berin.errstat=genErr;           
           berin.ErrIndex=1;
        
        temp[++p]=0x30; 
        ++p;
        pl[0]=p;//len
       
        m++;//object Item
    
        temp[++p]=0x06;//object                     
        temp[++p]=strlen(berin.OID[m])+1;//add .0

        n=0;
        while(berin.OID[m][++j]!=0x00)
        {
          temp[++p]=berin.OID[m][j]; 
          n++; 
        } 
        temp[++p]=0x00; //add 0;
        
           temp[++p]=0x05;//null
           temp[++p]=0x00;   
        
        temp[pl[0]]=p-pl[0]; 
      }else
      while(m<berin.ObjItem)
      { 
        if(berin.ObjItem>3)berin.ObjItem=2;//limit packet
        
        
        temp[++p]=0x30; 
        ++p;
        pl[0]=p;//len
       
        m++;//object Item
    
        temp[++p]=0x06;//object                     
        temp[++p]=strlen(berin.OID[m])+1;//add .0
        
       
        n=0;
        while(berin.OID[m][++j]!=0x00)
        {
          temp[++p]=berin.OID[m][j]; 
          n++; 
        } 
        temp[++p]=0x00; //add 0;
      
         
        //NutKPrintFormat("\r\n ObjItem is NOW %d ,j is %d ,n is %d",m,j,n); 
        //check 1.3.6.1.2.1.1.x
        if(berin.OID[m][j-n]!=0x2B) //1.3
        {
          berin.errstat=noSuchName;
          berin.ErrIndex=0;
         
        }
        else
        if(berin.OID[m][(j-n)+1]!=0x06) //.6 
        {
          berin.errstat=noSuchName;
          berin.ErrIndex=1;
           
        }
        else
        if(berin.OID[m][(j-n)+2]!=0x01) //.1
        { 
          berin.errstat=noSuchName;
          berin.ErrIndex=2;
                       
        }
        else
        if(berin.OID[m][(j-n)+3]!=0x02) //.2  
        { 
          //check private 1.3.6.1.4.1.x.x.x
          if(berin.OID[m][(j-n)+3]!=0x04)//.4   private
          {
           berin.errstat=noSuchName;
           berin.ErrIndex=3;
          }           
          else
          if(berin.OID[m][(j-n)+4]!=0x01)//.1   enterprise
          {
            berin.errstat=noSuchName;
           berin.ErrIndex=3;          
          }
          else
          if(berin.OID[m][(j-n)+5]!=0x07)//.7   digiforce
          {
           berin.errstat=noSuchName;
           berin.ErrIndex=3;          
          }
          else
          if(berin.OID[m][(j-n)+6]!=0x01)//.1   ethernut
          {
            berin.errstat=noSuchName;
           berin.ErrIndex=3;          
          }
          else
          if(berin.OID[m][(j-n)+7]!=0x01)//.1    led
          { 
             if(berin.OID[m][(j-n)+7]==0x02)//.2    led
             {
              if(berin.OID[m][(j-n)+8]==0x01) // .1 temp1 description
              {      
                        if(berin.Value[m][0]==0x04)  //string check
                        {
                          l=berin.Value[m][1];
                        
                          for(i=2;i<l+3;i++)//plus 0
                          {
                            temp1Descr[i-2]=berin.Value[m][i];
                            NutKPrintFormat("\r\n con is %c",berin.Value[m][i]);
                          }
                        
                          temp[++p]=0x04;//string
                          strcpy(value,temp1Descr);
                          temp[++p]=strlen(value);                         
                          for(i=0;i<strlen(value);i++)
         	            temp[++p]=value[i];            	        
                        }
                        else //type mistake
                        {
                           berin.errstat=badValue;
                           berin.ErrIndex=7;
                        }    
              }
              else
              if(berin.OID[m][(j-n)+8]==0x02) // .2 temp1 value
                     {
                         //this node is read-only
                        berin.errstat=readOnly;
                        berin.ErrIndex=6;
                     }  
              else
                     {
                         berin.errstat=noSuchName;
                         berin.ErrIndex=3;   
                     }                   
             }//end check temp
             else
             {
                 berin.errstat=noSuchName;
                 berin.ErrIndex=3;   
               
             }
          
                        
          }
          else
          switch(berin.OID[m][(j-n)+8])
          {
            case (0x01) :{  //"Description of Led 1"
                        
                        if(berin.Value[m][0]==0x04)  //string check
                        {
                          l=berin.Value[m][1];
                        
                          for(i=2;i<l+3;i++)//plus 0
                          {
                            led1Descr[i-2]=berin.Value[m][i];
                            NutKPrintFormat("\r\n con is %c",berin.Value[m][i]);
                          }
                        
                          temp[++p]=0x04;//string
                          strcpy(value,led1Descr);
                          temp[++p]=strlen(value);                         
                          for(i=0;i<strlen(value);i++)
         	          temp[++p]=value[i];
         	        }
         	        else //type mistake
                        {
                           berin.errstat=badValue;
                           berin.ErrIndex=7;
                        }    
         	        }
                      break;
           case (0x02) :{  //"Value of Led 1"
                         if(berin.Value[m][0]==0x02)//integer check
                         {
                           l=berin.Value[m][1];
                           led1Value=berin.Value[m][2];
         	        
         	           temp[++p]=0x02;//Integer
         	           temp[++p]=0x01;//len 1
         	           temp[++p]=led1Value;
         	         
         	         
         	           NutKPrintFormat("\r\n Led 1 set is %d",led1Value);
         	         
         	           if(led1Value>0)
         	           {
         	            outp(inp(DDRD)|1,DDRD);
         	            outp(inp(PORTD)|1,PORTD); 
         	           }
         	           else
         	           {
         	            outp(inp(DDRD)|1,DDRD);
         	            outp(inp(PORTD)&254,PORTD);         	          
         	           }
         	          }   
         	           else //type mistake
                          {
                           berin.errstat=badValue;
                           berin.ErrIndex=7;
                           }    
         	        }  
                       break;
           case (0x03) :{  //"Description of Led 2"
                         if(berin.Value[m][0]==0x04)  //string check
                         {
                           l=berin.Value[m][1];
                        
                           for(i=2;i<l+3;i++)//plus 0
                           {
                             led2Descr[i-2]=berin.Value[m][i];
                             NutKPrintFormat("\r\n con is %c",berin.Value[m][i]);
                           }
                        
                           temp[++p]=0x04;//string
                           strcpy(value,led2Descr);
                           temp[++p]=strlen(value);                         
                           for(i=0;i<strlen(value);i++)
         	           temp[++p]=value[i];
         	         }
         	         else //type mistake
                         {
                           berin.errstat=badValue;
                           berin.ErrIndex=7;
                         }    
                       }  
                       break;
           case (0x04) :{  //"Value of Led 2"
                        if(berin.Value[m][0]==0x02)//integer check
                        {
                          l=berin.Value[m][1];
                          led2Value=berin.Value[m][2];
                                   	         
         	          temp[++p]=0x02;//Integer
         	          temp[++p]=0x01;//len 1
         	          temp[++p]=led2Value;
         	         
         	         
         	          NutKPrintFormat("\r\n Led 2 set is %d",led2Value);
         	         
         	          if(led2Value>0)
         	          {
         	           outp(inp(DDRD)|2,DDRD);
         	           outp(inp(PORTD)|2,PORTD); 
         	          }
         	          else
         	          {
         	           outp(inp(DDRD)|2,DDRD);
         	           outp(inp(PORTD)&253,PORTD);         	          
         	          }
         	        }
         	          else //type mistake
                        {
                           berin.errstat=badValue;
                           berin.ErrIndex=7;
                        }    
         	          
         	       }  
                       break;            
           case (0x05) :{  //"Description of Led 3"
                         if(berin.Value[m][0]==0x04)  //string check
                         {
                           l=berin.Value[m][1];
                        
                           for(i=2;i<l+3;i++)//plus 0
                           {
                            led3Descr[i-2]=berin.Value[m][i];
                            NutKPrintFormat("\r\n con is %c",berin.Value[m][i]);
                           }
                        
                           temp[++p]=0x04;//string
                           strcpy(value,led3Descr);
                           temp[++p]=strlen(value);                         
                           for(i=0;i<strlen(value);i++)
         	           temp[++p]=value[i];
         	         } 
         	         else //type mistake
                         {
                           berin.errstat=badValue;
                           berin.ErrIndex=7;
                         } 
                       }    
                       break;
           case (0x06) :{  //"Value of Led 3"
                          if(berin.Value[m][0]==0x02)//integer check
                          {
                           l=berin.Value[m][1];
                           led3Value=berin.Value[m][2];
         	         
         	           temp[++p]=0x02;//Integer
         	           temp[++p]=0x01;//len 1
         	           temp[++p]=led3Value;
         	         
         	         
         	           NutKPrintFormat("\r\n Led 3 set is %d",led3Value);
         	          
         	           if(led3Value>0)
         	           {
         	            outp(inp(DDRD)|4,DDRD);
         	            outp(inp(PORTD)|4,PORTD); 
         	           }
         	           else
         	           {
         	            outp(inp(DDRD)|4,DDRD);
         	            outp(inp(PORTD)&251,PORTD);         	          
         	           }
         	        }
         	          else //type mistake
                        {
                           berin.errstat=badValue;
                           berin.ErrIndex=7;
                        }    
                       }  
                       break;  
           case (0x07) :{  //"Description of Led 4"
                         if(berin.Value[m][0]==0x04)  //string check
                         {
                          l=berin.Value[m][1];
                        
                          for(i=2;i<l+3;i++)//plus 0
                          {
                           led4Descr[i-2]=berin.Value[m][i];
                           NutKPrintFormat("\r\n con is %c",berin.Value[m][i]);
                          }
                        
                          temp[++p]=0x04;//string
                          strcpy(value,led4Descr);
                          temp[++p]=strlen(value);                         
                          for(i=0;i<strlen(value);i++)
         	           temp[++p]=value[i];
         	         } 
         	         else //type mistake
                         {
                           berin.errstat=badValue;
                           berin.ErrIndex=7;
                         } 
                        }     
                       break;
          case (0x08) :{  //"Value of Led 4"
                        if(berin.Value[m][0]==0x02)//integer check
                        {
                          l=berin.Value[m][1];
                          led4Value=berin.Value[m][2];
         	         
         	          temp[++p]=0x02;//Integer
         	          temp[++p]=0x01;//len 1
         	          temp[++p]=led4Value;
         	         
         	         
         	          NutKPrintFormat("\r\n Led 4 set is %d",led4Value);
         	         
         	          if(led4Value>0)
         	          {
         	           outp(inp(DDRD)|8,DDRD);
         	           outp(inp(PORTD)|8,PORTD); 
         	          }
         	          else
         	          {
         	           outp(inp(DDRD)|8,DDRD);
         	           outp(inp(PORTD)&247,PORTD);         	          
         	          }
         	        }
         	        else //type mistake
                        {
                           berin.errstat=badValue;
                           berin.ErrIndex=7;
                        }    
         	       }  
                       break;                                         
                       
           
          }//end case led
                     
        }//end of led
        else
        if(berin.OID[m][(j-n)+4]!=0x01) //.1
        { 
          berin.errstat=noSuchName;
          berin.ErrIndex=4;        
        
        }
        else
        if(berin.OID[m][(j-n)+5]!=0x01) //.1
        {  
          berin.errstat=noSuchName;
          berin.ErrIndex=5;        
       
        }
        else
        if(berin.OID[m][(j-n)+7]!=0x00) //check end of object
        { 
          berin.errstat=noSuchName;
          berin.ErrIndex=5;
           
        }
        else
        switch(berin.OID[m][(j-n)+6])
        {  case(0x01):{  //"Description of this machine."
                        //this node is read-only
                        berin.errstat=readOnly;
                        berin.ErrIndex=6; 
                        
         	      }  
                      break;
           case(0x02):{  //"The Vendor's authoritative identification of the network management subsystem contained in the entity"
                         berin.errstat=readOnly;
                         berin.ErrIndex=6; 
                                                   
                      }           
                      break;        
           case(0x03):{  //"The Time in hundreadths of second since system last re-initial" 
                         berin.errstat=readOnly;
                         berin.ErrIndex=6; 
                         	        
                      }
                      break;
           case(0x04):{ //"Text idenification of contact person for this managed node.";
                        if(berin.Value[m][0]==0x04)  //string check
                        {
                         l=berin.Value[m][1];
                        
                         for(i=2;i<l+3;i++)//plus 0
                         {
                          sysContact[i-2]=berin.Value[m][i];
                          NutKPrintFormat("\r\n con is %c",berin.Value[m][i]);
                         }
                        
                         temp[++p]=0x04;//string
                         strcpy(value,sysContact);
                         temp[++p]=strlen(value);                         
                         for(i=0;i<strlen(value);i++)
         	          temp[++p]=value[i];
                        }  
                        else //type mistake
                        {
                           berin.errstat=badValue;
                           berin.ErrIndex=7;
                        }   
                      }           
                      break;  
           case(0x05):{ //"An administration-assined name of this system";
                       if(berin.Value[m][0]==0x04)  //string check
                       {
                         l=berin.Value[m][1];
                        
                         for(i=2;i<l+3;i++)//plus 0
                         {
                          sysName[i-2]=berin.Value[m][i];
                          NutKPrintFormat("\r\n con is %c",berin.Value[m][i]);
                         }
                        
                         temp[++p]=0x04;//string
                         strcpy(value,sysName);
                         temp[++p]=strlen(value);                         
                         for(i=0;i<strlen(value);i++)
         	           temp[++p]=value[i];
                       }
                       else //type mistake
                       {
                           berin.errstat=badValue;
                           berin.ErrIndex=7;
                       }                                                   
                      }           
                      break;        
           case(0x06):{  //"The physical location of this system");                          
                       if(berin.Value[m][0]==0x04)  //string check
                       {
                         l=berin.Value[m][1];
                        
                         for(i=2;i<l+3;i++)//plus 0
                         {
                          sysLocate[i-2]=berin.Value[m][i];
                          NutKPrintFormat("\r\n con is %c",berin.Value[m][i]);
                         }
                         
                          temp[++p]=0x04;//string
                          strcpy(value,sysLocate);
                          temp[++p]=strlen(value);                         
                          for(i=0;i<strlen(value);i++)
         	            temp[++p]=value[i];                    
                       }
                       else //type mistake
                       {
                           berin.errstat=badValue;
                           berin.ErrIndex=7;
                       }    
                      }
                      break;
           case(0x07):{ //"the value which indicates the set of service that this entity offers" 
                        berin.errstat=readOnly;
                        berin.ErrIndex=6; 	      
                      }           
                      break;  
              default:{
                        berin.errstat=noSuchName;
                        berin.ErrIndex=6;
                      }
                      break;
        }
        
        if((berin.errstat==noSuchName)|(berin.errstat==readOnly)|(berin.errstat==badValue))
        {
          temp[++p]=0x05;//null
          temp[++p]=0x00;   
        }  
     
        
        //len of each Object
        temp[pl[0]]=p-pl[0];    
      }//end of while m < berin.ObjItem          
    }//set request
   
      
    if(berin.pdutype==get_next_request)
    {
        
        temp[++p]=0x30; 
        ++p;
        pl[0]=p;//len
       
    
        temp[++p]=0x06;//object
                     
        //check 1.3.6.1.2.1.1.x
        
        j=0;
        n=0; 
        m=0;
                
      while(m<berin.ObjItem)
      { 
        if(berin.ObjItem>3)berin.ObjItem=2;//limit packet
        
        m++;
        
        if((berin.OID[m][j]==0x2B)&(berin.OID[m][j+1]!=0x06)) //1.3
        {
                                   		 
       			  temp[++p]=strlen(sysDescrID)+1; //len of OID   +.0     
        		 for(i=0;i<strlen(sysDescrID);i++)
        		  temp[++p]=sysDescrID[i]; 
                          temp[++p]=0x00;//+ .0
                          
                          temp[++p]=0x04;//string
                        strcpy(value,sysDescr);  
                         temp[++p]=strlen(value);                         
                        for(i=0;i<strlen(value);i++)
         	          temp[++p]=value[i];
                         
                         
        
        }else
        if(berin.OID[m][j]==0x2B) //1.3
        if(berin.OID[m][(j-n)+1]==0x06) //.6 
        if(berin.OID[m][(j-n)+2]==0x01) //.1
        if(berin.OID[m][(j-n)+3]==0x02) //.2  
        if(berin.OID[m][(j-n)+4]==0x01) //.1
        if(berin.OID[m][(j-n)+5]==0x01) //.1                            
        switch(berin.OID[m][(j-n)+6])
        {  case(0x01):{ //-->0x02
                          strcpy(value,sysObjIDID);        		 
       			  temp[++p]=strlen(sysObjIDID)+1; //len of OID   +.0     
        		 for(i=0;i<strlen(sysObjIDID);i++)
        		  temp[++p]=sysObjIDID[i]; 
                          temp[++p]=0x00;//+ .0
                         
                         temp[++p]=0x05;//null
                         temp[++p]=0x00;          
                         
                         
         	      }  
                      break;
           case(0x02):{ //-->0x03
                         strcpy(value,sysUpTimeID);        		 
       			  temp[++p]=strlen(sysUpTimeID)+1; //len of OID   +.0     
        		 for(i=0;i<strlen(sysUpTimeID);i++)
        		  temp[++p]=sysUpTimeID[i]; 
                          temp[++p]=0x00;//+ .0
                         
                         temp[++p]=0x043;//time tick
                         temp[++p]=0x01;//len 1;
                         temp[++p]=sysUpTime=NutHeapAvailable();                     
                      }           
                      break;        
           case(0x03):{  //-->0x04	        
                     
                             		 
       			  temp[++p]=strlen(sysContactID)+1; //len of OID   +.0     
        		 for(i=0;i<strlen(sysContactID);i++)
        		  temp[++p]=sysContactID[i]; 
                          temp[++p]=0x00;//+ .0
                     
                        temp[++p]=0x04;//string
                        strcpy(value,sysContact);  
                         temp[++p]=strlen(value);                         
                        for(i=0;i<strlen(value);i++)
         	          temp[++p]=value[i];
                      }
                      break;
           case(0x04):{// -->0x05
                      
                        temp[++p]=strlen( sysNameID)+1; //len of OID   +.0     
        		 for(i=0;i<strlen( sysNameID);i++)
        		  temp[++p]= sysNameID[i]; 
                          temp[++p]=0x00;//+ .0
                          
                        temp[++p]=0x04;//string
                        strcpy(value,sysName);  
                        temp[++p]=strlen(value);                         
                        for(i=0;i<strlen(value);i++)
         	          temp[++p]=value[i];
                      }           
                      break;  
           case(0x05):{ //-->0x06
                          temp[++p]=strlen(sysLocateID)+1; //len of OID   +.0     
        		 for(i=0;i<strlen(sysLocateID);i++)
        		  temp[++p]= sysLocateID[i]; 
                          temp[++p]=0x00;//+ .0
                         
                         temp[++p]=0x04;//string
                        strcpy(value,sysLocate);
                         temp[++p]=strlen(value);                         
                        for(i=0;i<strlen(value);i++)
         	          temp[++p]=value[i];       
                         
                      }           
                      break;        
           case(0x06):{ //-->0x07
                        temp[++p]=strlen(sysServID)+1; //len of OID   +.0     
        		 for(i=0;i<strlen(sysServID);i++)
        		  temp[++p]= sysServID[i]; 
                          temp[++p]=0x00;//+ .0               
                         
                         
                         temp[++p]=0x043;//time tick
                         temp[++p]=0x01;//len 1;
                         temp[++p]=sysServ;//SNMP only	  
                      
                      }
                      break;
           case(0x07):{ //add other
                        temp[++p]=strlen(sysServID)+1; //len of OID   +.0     
        		for(i=0;i<strlen(sysServID);i++)
        		  temp[++p]= sysServID[i]; 
                          temp[++p]=0x00;//+ .0      
                       
                        temp[++p]=0x043;//time tick
                        temp[++p]=0x01;//len 1;
                        temp[++p]=sysServ;//SNMP only	  
                      }           
                      break;  
              default:{
                        berin.errstat=noSuchName;
                        berin.ErrIndex=6;
                      }
                      break;
        }
        
        if(berin.errstat==noSuchName)
        {
          temp[++p]=0x05;//null
          temp[++p]=0x00;   
        }  
      
                      
                  
      
     
       temp[pl[0]]=p-pl[0]; //length 0f each object 
     
      }//end of while m < berin.ObjItem    
     }//end get_next_request
   
        
   //get request 
   if(berin.pdutype==get_request)
   {    
      if(!strstr(berin.community,getpassword))
      {      
           
           berin.errstat=genErr;           
           berin.ErrIndex=1;
        
        temp[++p]=0x30; 
        ++p;
        pl[0]=p;//len
       
        m++;//object Item
    
        temp[++p]=0x06;//object                     
        temp[++p]=strlen(berin.OID[m])+1;//add .0

        n=0;
        while(berin.OID[m][++j]!=0x00)
        {
          temp[++p]=berin.OID[m][j]; 
          n++; 
        } 
        temp[++p]=0x00; //add 0;
        
           temp[++p]=0x05;//null
           temp[++p]=0x00;   
        
        temp[pl[0]]=p-pl[0]; 
      }else
      while(m<berin.ObjItem)
      { 
        if(berin.ObjItem>3)berin.ObjItem=2;//limit packet
        
        m++;//object Item
        
        temp[++p]=0x30; 
        ++p;
        pl[0]=p;//len
       
    
        temp[++p]=0x06;//object                     
        temp[++p]=strlen(berin.OID[m])+1;//add .0
        
       
        n=0;
        while(berin.OID[m][++j]!=0x00)
        {
          temp[++p]=berin.OID[m][j]; 
          n++; 
        } 
        temp[++p]=0x00; //add 0;
       
         
        //NutKPrintFormat("\r\n ObjItem is NOW %d ,j is %d ,n is %d",m,j,n); 
        //check 1.3.6.1.2.1.1.x
        if(berin.OID[m][j-n]!=0x2B) //1.3
        {
          berin.errstat=noSuchName;
          berin.ErrIndex=0;
         
        }
        else
        if(berin.OID[m][(j-n)+1]!=0x06) //.6 
        {       
          berin.errstat=noSuchName;
          berin.ErrIndex=1;
           
        }
        else
        if(berin.OID[m][(j-n)+2]!=0x01) //.1
        { 
          berin.errstat=noSuchName;
          berin.ErrIndex=2;
                       
        }
        else
        if(berin.OID[m][(j-n)+3]!=0x02) //.2  
        { 
          
          
          //check private 1.3.6.1.4.1.x.x.x
          if(berin.OID[m][(j-n)+3]!=0x04)//.4  private
          {
           berin.errstat=noSuchName;
           berin.ErrIndex=3;
          }           
          else
          if(berin.OID[m][(j-n)+4]!=0x01)//.1  enterprise
          {
            berin.errstat=noSuchName;
           berin.ErrIndex=3;          
          }
          else
          if(berin.OID[m][(j-n)+5]!=0x07)//.7  DigiForce
          {
            berin.errstat=noSuchName;
           berin.ErrIndex=3;          
          }
          else
          if(berin.OID[m][(j-n)+6]!=0x01)//.1  Ethernut
          {
            berin.errstat=noSuchName;
           berin.ErrIndex=3;          
          }
          if(berin.OID[m][(j-n)+7]!=0x01)//.1  LED
          {
           
            if(berin.OID[m][(j-n)+7]==0x02)//.2    temperature
            {
              if(berin.OID[m][(j-n)+8]==0x01) // .1 temp1 description
              { 
                         temp[++p]=0x04;//string
                         strcpy(value,temp1Descr);
                         temp[++p]=strlen(value);                         
                         for(i=0;i<strlen(value);i++)
         	         { 
         	           temp[++p]=value[i];
         	         } 
         	                 	         
         	        
              }  
              else
              if(berin.OID[m][(j-n)+8]==0x02)//.2 temp1 Value
              {
                     temp[++p]=0x02;//Integer
         	     temp[++p]=0x01;//len 1
         	    
         	     temp1Value=gettemp();
         	     temp[++p]= temp1Value/2;  
         	       
         	     NutKPrintFormat("\r\n read temp is %d",temp1Value/2);        
              }
                 
              
            }
            else  
            {
                  berin.errstat=noSuchName;
                 berin.ErrIndex=3;  
            }       
          } 
          else
          switch(berin.OID[m][(j-n)+8])
          {
            case (0x01) :{  //"Description of Led 1"
                         temp[++p]=0x04;//string
                         strcpy(value,led1Descr);
                         temp[++p]=strlen(value);                         
                         for(i=0;i<strlen(value);i++)
         	         { 
         	           temp[++p]=value[i];
         	         } 
         	      }  
                      break;
           case (0x02) :{  //"Value of Led 1"
                         temp[++p]=0x02;//integer
                         temp[++p]=0x01;//len=1
                         temp[++p]=led1Value;
         	          
         	        }  
                       break;
           case (0x03) :{  //"Description of Led 2"
                         temp[++p]=0x04;//string
                         strcpy(value,led2Descr);
                         temp[++p]=strlen(value);                         
                         for(i=0;i<strlen(value);i++)
         	         { 
         	           temp[++p]=value[i];
         	         } 
         	       }  
                       break;
           case (0x04) :{  //"Value of Led 2"
                         temp[++p]=0x02;//integer
                         temp[++p]=0x01;//len=1
                         temp[++p]=led2Value;
         	          
         	        }  
                       break;            
           case (0x05) :{  //"Description of Led 3"
                         temp[++p]=0x04;//string
                         strcpy(value,led3Descr);
                         temp[++p]=strlen(value);                         
                         for(i=0;i<strlen(value);i++)
         	         { 
         	           temp[++p]=value[i];
         	         } 
         	       }  
                       break;
           case (0x06) :{  //"Value of Led 2"
                         temp[++p]=0x02;//integer
                         temp[++p]=0x01;//len=1
                         temp[++p]=led3Value;
         	          
         	        }  
                       break;  
           case (0x07) :{  //"Description of Led 4"
                         temp[++p]=0x04;//string
                         strcpy(value,led4Descr);
                         temp[++p]=strlen(value);                         
                         for(i=0;i<strlen(value);i++)
         	         { 
         	           temp[++p]=value[i];
         	         } 
         	       }  
                       break;
          case (0x08) :{  //"Value of Led 4"
                         temp[++p]=0x02;//integer
                         temp[++p]=0x01;//len=1
                         temp[++p]=led4Value;
         	          
         	        }  
                       break;                                         
                      
           
          }
          
          
          
        
  // led1DescrID[]={0x2b,0x06,0x01,0x04,0x01,0x01,0x01,0x00};
  //static  u_char led1Descr[]="LED 1 value > 0 : ON"; //read-write       
        
        
        
        
        //end enterprise check
        }
        else
        if(berin.OID[m][(j-n)+4]!=0x01) //.1
        { 
          berin.errstat=noSuchName;
          berin.ErrIndex=4;        
        
        }
        else
        if(berin.OID[m][(j-n)+5]!=0x01) //.1
        {  
          berin.errstat=noSuchName;
          berin.ErrIndex=5;      
       
        }
        else
        if(berin.OID[m][(j-n)+7]!=0x00) //check end of object
        { 
          berin.errstat=noSuchName;
          berin.ErrIndex=5;
           
        }
        else
        switch(berin.OID[m][(j-n)+6])
        {  case(0x01):{  //"Description of this machine."
                         temp[++p]=0x04;//string
                         strcpy(value,sysDescr);
                         temp[++p]=strlen(value);                         
                         for(i=0;i<strlen(value);i++)
         	         { 
         	           temp[++p]=value[i];
         	         } 
         	      }  
                      break;
           case(0x02):{  //"The Vendor's authoritative identification of the network management subsystem contained in the entity"
                         temp[++p]=0x05;//null
                         temp[++p]=0x00;                               
                      }           
                      break;        
           case(0x03):{  //"The Time in hundreadths of second since system last re-initial" 
                         temp[++p]=0x043;//time tick
                         temp[++p]=0x01;//len 1;
                         temp[++p]=sysUpTime=NutHeapAvailable();	        
                      }
                      break;
           case(0x04):{ //"Text idenification of contact person for this managed node.";
                        temp[++p]=0x04;//string
                        strcpy(value,sysContact);
                         temp[++p]=strlen(value);                         
                        for(i=0;i<strlen(value);i++)
         	          temp[++p]=value[i];
                      }           
                      break;  
           case(0x05):{ //"An administration-assined name of this system";
                         temp[++p]=0x04;//string
                         strcpy(value,sysName);
                         temp[++p]=strlen(value);                         
                        for(i=0;i<strlen(value);i++)
         	          temp[++p]=value[i];
                      }           
                      break;        
           case(0x06):{  //"The physical location of this system");
                          temp[++p]=0x04;//string
                        strcpy(value,sysLocate);
                         temp[++p]=strlen(value);                         
                        for(i=0;i<strlen(value);i++)
         	          temp[++p]=value[i];                    
                      }
                      break;
           case(0x07):{ //"the value which indicates the set of service that this entity offers" 
                         temp[++p]=0x043;//time tick
                         temp[++p]=0x01;//len 1;
                         temp[++p]=sysServ;//SNMP only	      
                      }           
                      break;  
              default:{
                        berin.errstat=noSuchName;
                        berin.ErrIndex=6;
                      }
                      break;
        }
        
        if(berin.errstat==noSuchName)
        {
          temp[++p]=0x05;//null
          temp[++p]=0x00;   
        }  
     
        
        //len of each Object
        temp[pl[0]]=p-pl[0];    
      }//end of while m < berin.ObjItem
   }//end get request
   
    
       
 
    len=p-1; 
    bufflen=len+2; //length for making packet  
 
    temp[1]=len;//length of all block
  //  temp[pl[0]]=len-pl[0]+1;//length at pdu type
    
    
   
   for(i=0;i<bufflen;i++) 
    buff[i]=temp[i];
     
       
}

void SNMPsending(u_char *buff,int bl)
{ 
  int length=0; 
  int p=0;
  int i=0;
  int pl[1];
  //int fin=0; //fin flag
  //int lp=0;//looping
  u_char buffout[300];  
       
        
   
   buffout[p]=0x30; //snmp header     
   buffout[++p]=length;//length of all block
   
   buffout[++p]=0x02;//integer
   buffout[++p]=0x01;//length of 1
   buffout[++p]=0x00;//SNMP ver 1
   
   buffout[++p]=0x04;//string
   buffout[++p]=berin.commlen;
   
   ++p;
    
   for(i=0;i<berin.commlen;i++)
      buffout[p+i]=berin.community[i];
     

   p=p+i;//point of end of community     
  
   
   switch (berin.pdutype)
   {
  
   case get_request      :buffout[p]=get_response;
                          break;
   case get_next_request :buffout[p]=get_response;
                          break;
   case get_response     :buffout[p]=get_response;
                          break;
   case set_request      :buffout[p]=get_response;
                          break;
   case trap             :buffout[p]=trap;
                          break; 
   }
  
   pl[0]=++p;//total block left
  
  
   buffout[++p]=0x02;//integer
   buffout[++p]=berin.reqlen;   
   for(i=0;i<berin.reqlen;i++)
      buffout[++p]=berin.requestID[i];
      
   buffout[++p]=0x02;//integer
   buffout[++p]=0x01;//length
   buffout[++p]=berin.errstat;//error;   
   berin.errstat=p;
   
   buffout[++p]=0x02;//integer
   buffout[++p]=0x01;//length
   buffout[++p]=berin.ErrIndex;//error index;
   berin.ErrIndex=p; 
  
   for(i=0;i<bl;i++)
     buffout[++p]=buff[i];  
   
   length=p-1;   
   
   if(length<=127)//length in limited or 1 loop already
   {
    buffout[1]=length;//length of all block
    buffout[pl[0]]=length-pl[0]+1;//length at pdu type
   
   }
   else
   {  NutKPrintString("\r\nError:OverLoad for this SNMP demo");
      //buffout[berin.errstat]=tooBig;
      //buffout[berin.ErrIndex]=1;//length of frame
   
   }
    
   bufflen=length+2;//+2 for packet
    
   
   //copy all to buff
   for(i=0;i<sizeof(buffout);i++)
   { buff[i]=buffout[i];            
     //NutKPrintFormat("\r\n Buff[%d] is %x",i,buff[i]);
   }
   

}




int SNMPdecode(u_char *buff)
{ int p=0;//byte pointer
  int l,i=0,m=0,n=0;//length of block   
  
     
    if(buff[0]==0x30)//snmp detect 
    {     
        
        berin.length=buff[1];//packet length              
    
        
        //version of SNMP
        if(buff[2]==0x02)//integer  
          if(buff[3]==0x01)//interger length 1
            berin.version=buff[4]+1;//version of SNMP
        
        p=4; //point at version
          
       // if(berin.version==1)NutKPrintString("\r\n SNMP ver 1 \r\n"); 
                
        //community check 
         if(buff[5]==0x04)//string (check community)
         {                     
           berin.commlen=buff[6];   
           l=7+buff[6]; //length of string          
           p=7; //point at string
          
           for(p=p;p<l;p++)
           {
                                 
             berin.community[i]=buff[p];
             i++;
           }  
           berin.community[i]=0x00;//add 0x00                       
         } //end of community

       
       //if(strstr(berin.community,"public")!=NULL) NutKPrintString("\r\n Public in  ");                
       
 
        //PDU type  
         berin.pdutype=buff[p];                   
         l=buff[++p];//point at total char left          
   
         if(l>0x80)l=l+buff[++p];//case over integer 
         
         
         //chekc ID request of UDP
         if(buff[++p]==0x02)//check integer
         l=buff[++p];//get length of id
         berin.reqlen=buff[p];
          
           i=0;         
         for(p=++p;i<l;i++)
           {
                                 
             berin.requestID[i]=buff[p];
           //  NutKPrintFormat("\r\n requestID is %x",berin.requestID[i]); 
             p++;
           }  
        
         //check Err 
         if(buff[p]==0x02)//check integer
          if(buff[++p]==0x01)//length 1
            berin.errstat=buff[++p];
                                              
         //check Err index
         if(buff[++p]==0x02)//check integer
          if(buff[++p]==0x01)//length 1
           berin.ErrIndex=buff[++p];
      
 
       
        //get object id 
        if(buff[++p]==0x30)//check sequence
          l=buff[++p]; //get length           
        
        while(p<berin.length)
        {
             if(buff[++p]==0x30)//check sequence
             {	l=buff[++p]; //get length  
       		
       	       if(buff[++p]==0x06) //object id
       	       { berin.ObjItem++; //object request +1
       		 l=buff[++p]; //get length 
       		
       		 for(p=++p,i=0;i<l;i++)
           	 {
          	   berin.OID[berin.ObjItem][m]=buff[p];
             	   NutKPrintFormat("\r\n OID[%d] on p[%d] is %x",m,p,berin.OID[berin.ObjItem][m]); 
             	   p++;
      	           m++;
      	         }
      	        
      	        if(buff[p]==0x05){p++;NutKPrintString("\r\n Null value comming");}//Null value                
                else 
                {  n=0;//start Value[]
                   berin.Value[berin.ObjItem][n]=buff[p];//type of value in
                   l=buff[++p]; //get length 
                   berin.Value[berin.ObjItem][++n]=l; //len
                   
                   ++n;
                   
                   for(p=++p,i=n;i<l+n;i++)
                   {
                     berin.Value[berin.ObjItem][i]=buff[p];
                     NutKPrintFormat("\r\n Value[%d][%d] is %x",berin.ObjItem,i,berin.Value[berin.ObjItem][i]);
                     p++;                    
                      
                   }
                   if(berin.Value[berin.ObjItem][0]==0x04) // == string in
                     berin.Value[berin.ObjItem][i]=0x00;//add end of line
                }//end value
              
               }//end if  0x06
             }//end if 0x30
             
        }//end while p<length        
     
    }//end  if snmp detect
    else
    return -1;//unreconition of packet
   
   
    return 0;//ok

}
 
//***** fix buff from port 
u_short changePORT(u_short temp)
{u_short t1;
 u_short t2;
 
 t1=temp<<8;
 t2=temp>>8;

 temp=t1|t2;
 return temp; 
}  


THREAD(MyTime,arg)
{ for(;;)
  { 
   if(sysUpTime<0xff)sysUpTime++; 
   else sysUpTime=0;
   NutSleep(1000);
  }
}  

THREAD(MyTrap,arg)
{
   UDPSOCKET *sock;          
    u_long  Raddr=inet_addr(ManagerAdd);
    u_short Rport=162; //SNMP trap
 
  
  u_char buff[300];
  u_char value[60];
  int p=0;
  int i=0,length=0,pl[2];
  int first=0;
   
  temp1Value=gettemp(); //init temp
 for(;;)
 { 
 if(first==0)
 {
   //initial trap here
   strcpy(berin.trapcommu,"Warning!!");
   strcpy(berin.enterprise,TrapEnterprise);
   strcpy(berin.agentadd,TrapIP);
   berin.gentrap=coldstart;
   berin.spectrap=7;
   
   //make snmp trap udp
   buff[p]=0x30; //snmp header     
   buff[++p]=length;//length of all block
   
   buff[++p]=0x02;//integer
   buff[++p]=0x01;//length of 1
   buff[++p]=0x00;//SNMP ver 1
   
   buff[++p]=0x04;//string
   buff[++p]=strlen(berin.trapcommu);   
   ++p;   
   for(i=0;i<strlen(berin.trapcommu);i++)
      buff[p+i]=berin.trapcommu[i];
   p=p+i;//point of end of community   
   
   buff[p]=trap; //UDP trap
   pl[0]=++p;//
   
   
   buff[++p]=0x06;//OID
   buff[++p]=strlen(berin.enterprise);   
   ++p;    
   for(i=0;i<strlen(berin.enterprise);i++)
      buff[p+i]=berin.enterprise[i];
   p=p+i;//point of end of enterprise 
    
   buff[p]=0x40;//IP add
   buff[++p]=4;//fix len for IP  
   ++p;    
   for(i=0;i<4;i++)
      buff[p+i]=berin.agentadd[i];
   p=p+i;//point of end of enterprise    
   
   //general trap
   buff[p]=0x02;//integer
   buff[++p]=0x01;//len 1
   buff[++p]=berin.gentrap;
   //spec trap
   buff[++p]=0x02;//integer
   buff[++p]=0x01;//len 1
   buff[++p]=berin.spectrap;
   
   
   buff[++p]=0x43;//TimeStamp
   buff[++p]=0x01;//len 1
   buff[++p]=sysUpTime;
   
   
   buff[++p]=0x30;//sequence
   pl[1]=++p;//len of object
   
   if(berin.gentrap==coldstart)
   { 
   
     buff[++p]=0x30;//sequence
     pl[2]=++p;//len of object 
    
     buff[++p]=0x06;//OID
     strcpy(value,sysDescr);        		 
     buff[++p]=strlen(sysDescrID)+1; //len of OID   +.0     
     for(i=0;i<strlen(sysDescrID);i++)
     buff[++p]=sysDescrID[i]; 
     buff[++p]=0x00;//+ .0
                          
     buff[++p]=0x04;//string          		 
     buff[++p]=strlen(value);                         
     for(i=0;i<strlen(value);i++)
       buff[++p]=value[i];                     
  
    
   }
    
    length=p;   
    
    buff[1]=length-1;//length of all block
    buff[pl[0]]=length-pl[0];//length at pdu type
    buff[pl[1]]=length-pl[1];//length at pdu type
    buff[pl[2]]=length-pl[2];//length at pdu type
 
     
     if((sock=NutUdpCreateSocket(TRAPport)) == 0) 
    {
             NutKPrintString("\r\n Create Trap Socket Error ");
             NutSleep(5000);
    }     
    else     
    NutKPrintString("\r\n Create Trap Socket O.K"); 
    
     if(NutUdpSendTo(sock,Raddr,Rport,buff,length+1)== -1)//bufflen is the total lenght of packet to send
      NutKPrintString("\r\nError Trap Send to\r\n\n");
     else 
      NutKPrintString("\r\nSend Trap O.K \r\n");
    
    //NutUdpDestroySocket(sock);   
    first=1;
  }//end if first==0
  else
  if(first==1)
  {
  
   temp1Value=gettemp();
   temp1Value=temp1Value/2;
  if(temp1Value>=maxtemp)
  {
   p=0;      	   
   //initial trap here
   strcpy(berin.trapcommu,"Warning!!");
   strcpy(berin.enterprise,TrapEnterprise);
   strcpy(berin.agentadd,TrapIP);
   berin.gentrap=enterprisespec;
   berin.spectrap=7;
   
   //make snmp trap udp
   buff[p]=0x30; //snmp header     
   buff[++p]=length;//length of all block
   
   buff[++p]=0x02;//integer
   buff[++p]=0x01;//length of 1
   buff[++p]=0x00;//SNMP ver 1
   
   buff[++p]=0x04;//string
   buff[++p]=strlen(berin.trapcommu);   
   ++p;   
   for(i=0;i<strlen(berin.trapcommu);i++)
      buff[p+i]=berin.trapcommu[i];
   p=p+i;//point of end of community   
   
   buff[p]=trap; //UDP trap
   pl[0]=++p;//
   
   
   buff[++p]=0x06;//OID
   buff[++p]=strlen(berin.enterprise);   
   ++p;    
   for(i=0;i<strlen(berin.enterprise);i++)
      buff[p+i]=berin.enterprise[i];
   p=p+i;//point of end of enterprise 
    
   buff[p]=0x40;//IP add
   buff[++p]=4;//fix len for IP  
   ++p;    
   for(i=0;i<4;i++)
      buff[p+i]=berin.agentadd[i];
   p=p+i;//point of end of enterprise    
   
   //general trap
   buff[p]=0x02;//integer
   buff[++p]=0x01;//len 1
   buff[++p]=berin.gentrap;
   //spec trap
   buff[++p]=0x02;//integer
   buff[++p]=0x01;//len 1
   buff[++p]=berin.spectrap;
   
   
   buff[++p]=0x43;//TimeStamp
   buff[++p]=0x01;//len 1
   buff[++p]=sysUpTime;
   
   
   buff[++p]=0x30;//sequence
   pl[1]=++p;//len of object
   
   
     buff[++p]=0x30;//sequence
     pl[2]=++p;//len of object 
    
     buff[++p]=0x06;//OID  		 
     buff[++p]=strlen(temp1ValueID)+1; //len of OID   +.0     
     for(i=0;i<strlen(temp1ValueID);i++)
     buff[++p]=temp1ValueID[i]; 
     buff[++p]=0x00;//+ .0
                          
     buff[++p]=0x02;//integer          		 
     buff[++p]=1;                         
     buff[++p]=temp1Value;             
  
   
    
    length=p;   
    
    buff[1]=length-1;//length of all block
    buff[pl[0]]=length-pl[0];//length at pdu type
    buff[pl[1]]=length-pl[1];//length at pdu type
    buff[pl[2]]=length-pl[2];//length at pdu type
 
     
     if((sock=NutUdpCreateSocket(TRAPport)) == 0) 
    {
             NutKPrintString("\r\n Create Trap Socket Error ");
             NutSleep(5000);
    }     
    else     
    NutKPrintString("\r\n Create Trap Socket O.K"); 
    
     if(NutUdpSendTo(sock,Raddr,Rport,buff,length+1)== -1)//bufflen is the total lenght of packet to send
      NutKPrintString("\r\nError Trap Send to\r\n\n");
     else 
      NutKPrintString("\r\nSend Trap Temp O.K \r\n");
    
    //NutUdpDestroySocket(sock); 
  
  
  }//end it temp>maxtemp
     
     first=3;//send one time
  }  //end else if first==0
    
    
    
       
      NutSleep(8000);
      first=1;
    }//end for(;;) 
        
   

}

THREAD(Service,arg)
{      

   UDPSOCKET *sock;
   
   int recflag=0;
   //int i=0;
    u_long  timeout=3000;  
    u_char  testbuff[300];         
    u_long  Raddr=0;
    u_short Rport=0; 
          
       
    
    
    if((sock=NutUdpCreateSocket(SNMPport)) == 0) 
    {
             NutKPrintString("\r\n Create Socket Error ");
             NutSleep(5000);
    }     
    else     
    NutKPrintString("\r\n Create Socket O.K");   
        
   for(;;)   
   {      
          //reset all
         recflag=0; 
         strcpy(buff,"");  
         //strcpy(berin.OID,"");  
         strcpy(berin.community,"");       
         strcpy(berin.requestID," ");
         berin.ObjItem=0;
            	
   	while(recflag==0) //wait for incoming on port 161
        {   
                                              
            if(NutUdpReceiveFrom(sock,&Raddr,&Rport,buff,sizeof(buff)-1,timeout)== -1)
              NutKPrintString("\r\nError Receive\r\n\n");   	 
            else          
    	      if(strlen(buff)>0)   	         
    	         recflag=1;                       
        }//end while
        
        //***** fix bug from port udp
        Rport=changePORT(Rport); 
       
       
         SNMPdecode(buff);
         
         SNMPgetMIB(testbuff);
        
         SNMPsending(testbuff,bufflen);//buff to send and they length
        

         if(NutUdpSendTo(sock,Raddr,Rport,testbuff,bufflen)== -1)//bufflen is the total lenght of packet to send
            NutKPrintString("\r\nError Send to\r\n\n");
         NutKPrintString("\r\nSend O.K \r\n");
          NutSleep(500);  
         
     }//end for(;;)
} 


 /*
 * Main application routine. 
 *
 * Nut/OS automatically calls this entry after initialization.
 */
THREAD(NutMain, arg)
{   
    
    NutRegisterDevice(&devUart0, 0, 0);
    uart0 = NutDeviceOpen("uart0");
    NutDeviceIOCtl(uart0, UART_SETSPEED, &baud);
    
    NutKPrintString(PSTR("\x0C"));//clear screen       
    NutKPrintString("\r\n ATA SNMP server ver  1.4 (-_-)\r\n");

    /*
    * Register Realtek controller at address 8300 hex
    * and interrupt 5 and configure lan interface.
    */
    
    NutKPrintString("Configuring Ethernet interface\r\n");
    NutRegisterDevice(&devEth0, 0x8300, 5);
    
    NutNetIfConfig("eth0", my_mac, inet_addr(MY_IP),inet_addr(MY_MASK));
  
    
    NutIpRouteAdd(0, 0, inet_addr(MY_GATE),&devEth0);
    NutDnsConfig(0, 0, inet_addr(DNSSERVERIP));
   
    //reset D port
    outp(inp(DDRD)|0xff,DDRD);
    outp(inp(PORTD)&0x00,PORTD); 
    
   
   
        NutThreadCreate("sevice",Service,(void *)(u_short)0,1000);
        NutThreadCreate("mytime",MyTime,(void *)(u_short)1,600);       
        NutThreadCreate("mytrap",MyTrap,(void *)(u_short)2,600);  
        
        
   for(;;)   
    NutSleep(500);
     

}//end of file(-_-)
