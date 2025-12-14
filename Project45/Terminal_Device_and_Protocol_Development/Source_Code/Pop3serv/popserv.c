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
 * \example inetq/inetq.c
 *
 * Requests an URL from the Internet. 
 * Demonstrates DNS query and default route usage.
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



#define DNSSERVERIP     "161.246.4.3"
#define INETSERVER	"chaokhun.kmitl.ac.th"
#define INETSERVERPORT  80
#define INETURL         "/search?q=ethernut"
#define MY_MAC          {0x00,0x06,0x98,0x20,0x00,0x00}
#define MY_IP           "161.246.5.135"
#define MY_MASK         "255.255.255.0"
#define MY_GATE         "161.246.5.1"





static u_char buff[1024];
static u_char my_mac[] = MY_MAC;




  
 NUTDEVICE *uart0;
 u_long baud = 115200;
 TCPSOCKET *sock;
 TCPSOCKET *sock2;
 NUTDEVICE *sostream;



    u_long rip;
    u_long rip2;
    
    u_short    lport=25;  
    u_short    rport=25;
    

THREAD(Auth,arg)
{
      if((sock2 = NutTcpCreateSocket()) == 0) 
            {
             NutKPrintString("\r\n Create Socket2 Error ");
             NutSleep(5000);
            
            }    
             
           sock2->so_retransmits=0;              
           NutKPrintFormat("\r\n Auth at %s ",inet_ntoa(rip2));              	
                                	
           NutTcpConnect(sock2,rip2,113);//auth check
                           	                            	                                                          
           NutTcpCloseSocket(sock2);//destroy sock2 
           NutKPrintString("\r\n Detroy sostream2 & sock2 O.K ");

          for(;;)
          NutSleep(5000);


 
}





/*
 * Main application routine. 
 *
 * Nut/OS automatically calls this entry after initialization.
 */


THREAD(NutMain, arg)
{
       
      int first=0;
      int quit=0;
      int mailid=0;
      int state=0;
      int nomail=1;
      u_char mail1[]="Received:from Ethernut[Ethernut (161.246.5.99)]\r\n NOW system heap is \r\n.\r\n ";
      u_char ctemp[30];

  
    NutRegisterDevice(&devUart0, 0, 0);
    uart0 = NutDeviceOpen("uart0");
    NutDeviceIOCtl(uart0, UART_SETSPEED, &baud);
    NutKPrintString("\r\nATApop3 server ver  2.0\r\n");

    /*
    * Register Realtek controller at address 8300 hex
    * and interrupt 5 and configure lan interface.
    */
    NutKPrintString("Configuring Ethernet interface\r\n");
    NutRegisterDevice(&devEth0, 0x8300, 5);
    NutNetIfConfig("eth0", my_mac, inet_addr(MY_IP), inet_addr(MY_MASK));
    NutIpRouteAdd(0, 0, inet_addr(MY_GATE), &devEth0);
    NutDnsConfig(0, 0, inet_addr(DNSSERVERIP));


    
    /*
    * Register Realtek controller at address 8300 hex
    * and interrupt 5 and configure lan interface.
    */


   // rip=NutDnsGetHostByName(INETSERVER);
    
           
     for(;;)
     {      //for next time
             first=0;
             quit=0; 
             strcpy(mail1,"Received:from Ethernut[Ethernut (161.246.5.99)]\r\n NOW system heap is ");
             itoa(NutHeapAvailable(),ctemp,10);
             strcat( mail1,ctemp);
             strcat(mail1,"\r\n.\r\n");
                     
            if((sock = NutTcpCreateSocket()) == 0) 
            {
             NutKPrintString("\r\n Create Socket1 Error ");
             NutSleep(5000);            
            }  
             
                                         
          
            if((sostream = NutSoStreamCreate(sock)) == 0)             
            
              NutKPrintString("\r\n Create sostream Error ");              
            else
             NutKPrintString("\r\n Create sostream O.K ");
                      
                               
             while(quit==0)
             {
              
                 if(first==0){ //connected negotiable first
                          
                           NutTcpAccept(sock,110); 
                           
                           rip2=sock->so_remote_addr;
                         
                          
                          
                           // NutThreadCreate("Auth",Auth,0,1024);
                          //  NutSleep(300);
                            
                          
    
                           	 NutPrintString(sostream, "+OK POP3 161.246.5.99 ver 1.0 server ready\r\n");
                                 NutPrintFlush(sostream); 
                            	 first=1;                     
                           
                          }
                
                          
                            NutTcpAccept(sock,110); 
                            //NutTcpReceive(sock, buff, sizeof(buff) - 1);
                           NutDeviceGetLine(sostream, buff, sizeof(buff) - 1);
                                  
                          
              
               
              strupr(buff);//convert to uppercase
              NutKPrintString(buff);   
              //CHECK command
             	        //check user command
                	if(strstr(buff,"USER")!=NULL)               	 
                	{   
                	    if(strstr(buff,"ATAYA")!=NULL)  
                	    NutPrintString(sostream, "+OK user name valid,password please\r\n ");                   	    
               		    else
               		    NutPrintString(sostream, "-ERR user name not valid\r\n "); 
               		    NutPrintFlush(sostream);               
                	}
                
                	//check verfy
                	if(strstr(buff,"PASS")!=NULL)
               		 {  if(strstr(buff,"KNIGHT")!=NULL)   //test user
                   	     { 
                   	        NutSleep(300);
                   	               
                    		NutPrintFormat(sostream,"+OK Mailbox open, %d Messages\r\n",nomail);
                    		NutPrintFlush(sostream); 

                    	        NutSleep(300);
                    	        NutPrintFormat(sostream,"+OK Mailbox open, %d Messages\r\n",nomail);//for Eudora bug
                    		NutPrintFlush(sostream); 
                    	         state=1; //auth verify
                                
                              }
                    	      else
                    	      {
                    	        NutPrintString(sostream,"-ERR invalid password\r\n");
                    		NutPrintFlush(sostream); 
                    	      }                    	      
                   	                         	                     	
                 	   }
                 	 
                 	 
                        if(state==1)
                        {
                       
                	//check mail from
              		if(strstr(buff,"STAT")!=NULL)
              		{ 
                  	                 
                   	    NutPrintFormat(sostream, "+OK %d %d\r\n",nomail,sizeof(mail1)-1);
                   	    NutPrintFlush(sostream); 
                  	  
              		}
              
              		//check RCPT to
              		if(strstr(buff,"LIST")!=NULL)
            		{   //if(strstr(buff,"ataya_p")!=NULL) //test user
                  	   //{
                  	                   
                  	   NutPrintFormat(sostream, "+OK mail has detail \r\n %d %d\r\n.\r\n",nomail,sizeof(mail1)-1);
                           NutPrintFlush(sostream); 
                  	   //}
              		}
              		//check data
              		if(strstr(buff,"RETR")!=NULL)
              		{   //if(strstr(buff,"ataya_p")!=NULL) //test user
                 	    //{            
                   	          
                   	 NutPrintFormat(sostream, "+OK %d octets \r\n %s",sizeof(mail1)-1,mail1);
                   	 NutPrintFlush(sostream); 
                  	    
                  	     //}
             		 }
             		 
             		 if(strstr(buff,"DELE")!=NULL)
              		{   //if(strstr(buff,"ataya_p")!=NULL) //test user
                 	    //{       
                   	         
                   	 NutPrintString(sostream, "+OK delete fine\r\n");
                   	 NutPrintFlush(sostream); 
                   	  NutSleep(300);
                   	 NutPrintString(sostream, "+OK delete fine\r\n"); //Eudora bug
                   	 NutPrintFlush(sostream);                    
                   	
                  	     //}
             		 }
             		 
             		if(strstr(buff,"CAPA")!=NULL)
            		{   //if(strstr(buff,"ataya_p")!=NULL) //test user
                  	   //{                 
                  	   NutPrintString(sostream, "-ERR udora connected \r\n");
                           NutPrintFlush(sostream); 
                  	  
                  	   //}                  	                 	                                              
                   
                       } 
                       
                       
                       if(strstr(buff,"UIDL")!=NULL)
            		{   //if(strstr(buff,"ataya_p")!=NULL) //test user
                  	   //{                 
                  	  
                          	
                  	   NutPrintString(sostream,"+OK Unique-ID listing  follows\r\n");
                           
                           NutPrintFormat(sostream,"%d  %x \r\n.\r\n",nomail,mailid);
                           NutPrintFlush(sostream); 
                  	  
                  	   //}                  	                 	                                              
                   
                       } 
                      }//end state=1
             		
             		if(strstr(buff,"NOOP")!=NULL)
            		{   //if(strstr(buff,"ataya_p")!=NULL) //test user
                  	   //{                 
                  	   NutPrintString(sostream, "+OK NOOP done\r\n");
                           NutPrintFlush(sostream); 
                  	  
                  	   //}                  	                 	                                              
                   
                        }
                        if(strstr(buff,"RSET")!=NULL)
            		{   //if(strstr(buff,"ataya_p")!=NULL) //test user
                  	   //{                 
                  	   NutPrintString(sostream, "+OK Reset done\r\n");
                           NutPrintFlush(sostream); 
                  	   state=0;
                  	   //}                  	                 	                                              
                   
                        }
             		
             		if(strstr(buff,"QUIT")!=NULL)
            		{   //if(strstr(buff,"ataya_p")!=NULL) //test user
                  	   //{                 
                  	   NutPrintString(sostream, "+OK Quit O.K nice to serve you(-_-)\r\n");
                           NutPrintFlush(sostream); 
                  	   quit=1;
                  	   mailid++;
                  	   //}                  	                 	                                              
                   
                        }
                          
             }//end while
             NutSoStreamDestroy(sostream);
             NutTcpCloseSocket(sock);                      
             NutSleep(600);
            
          
        
    }//end for(;;);
        
}

