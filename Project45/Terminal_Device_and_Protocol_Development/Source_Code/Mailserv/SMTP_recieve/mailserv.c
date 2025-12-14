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
#define DNSSERVERIP     "161.246.4.3"
#define INETSERVER	    "chaokhun.kmitl.ac.th"
#define INETSERVERPORT  80
#define INETURL         "/search?q=ethernut"
#define MY_MAC          {0x00,0x06,0x98,0x20,0x00,0x00}
#define MY_IP           "161.246.5.135"
#define MY_MASK         "255.255.255.0"
#define MY_GATE         "161.246.5.254"

#include <string.h>

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

static u_char buff[1024];
static u_char my_mac[] = MY_MAC;
  
  NUTDEVICE *uart0;
    u_long baud = 115200;
    TCPSOCKET *sock;
    NUTDEVICE *sostream;

    u_long rip;
    
    u_short    lport=25;  
    u_short    rport=25;

/*
 * Main application routine. 
 *
 * Nut/OS automatically calls this entry after initialization.
 */


void checkcommand(u_char *buff)
{            int i=0;
             
             //cut mail header
             for(i=0;i<20;i++)
             buff[i]=' ';   
          
             if(strstr(buff,"LEDONEON")!=NULL)     
             {NutKPrintString("on led 1\r\n");outp(inp(DDRD)|1,DDRD);outp(inp(PORTD)|1,PORTD);  NutSleep(500);}
            
             if(strstr(buff,"LEDTWOON")!=NULL)
             {NutKPrintString("on led 2\r\n");outp(inp(DDRD)|2,DDRD);outp(inp(PORTD)|2,PORTD);  NutSleep(500);}
             
             if(strstr(buff,"LEDTHREEON")!=NULL)
             {NutKPrintString("on led 3\r\n");outp(inp(DDRD)|4,DDRD);outp(inp(PORTD)|4,PORTD);  NutSleep(500);}
             
             if(strstr(buff,"LEDFOURON")!=NULL)
             {NutKPrintString("on led 4\r\n");outp(inp(DDRD)|8,DDRD);outp(inp(PORTD)|8,PORTD);  NutSleep(500);}


}

THREAD(NutMain, arg)
{
      int state=0;
      int first=0;
      int dataflag=0;
      int quit=0;

    NutRegisterDevice(&devUart0, 0, 0);
    uart0 = NutDeviceOpen("uart0");
    NutDeviceIOCtl(uart0, UART_SETSPEED, &baud);
    NutKPrintString("\r\nATAmail server ver  1.9\r\n");

    /*
    * Register Realtek controller at address 8300 hex
    * and interrupt 5 and configure lan interface.
    */
    NutKPrintString("Configuring Ethernet interface\r\n");
    NutRegisterDevice(&devEth0, 0x8300, 5);
    
    if(NutNetIfConfig("eth0", my_mac, inet_addr(MY_IP), inet_addr(MY_MASK))==-1)
      NutKPrintString("Can't config NET\r\n");;
    NutIpRouteAdd(0, 0, inet_addr(MY_GATE), &devEth0);
    NutDnsConfig(0, 0, inet_addr(DNSSERVERIP));

    rip=NutDnsGetHostByName(INETSERVER);
    
    outp(inp(DDRD)|0xff,DDRD);
    outp(inp(PORTD)|0x00,PORTD);
    for(;;)
    {
            dataflag=0;
            quit=0;
            if((sock = NutTcpCreateSocket()) == 0) 
            {
             NutKPrintString("\r\n Create Socket Error ");
             NutSleep(5000);
            
            }
            
          
          
            if((sostream = NutSoStreamCreate(sock)) == 0) 
            {  NutKPrintString("\r\n Create sostream Error ");
               
            }
            else
            {
             
             NutKPrintString("\r\n Create sostream O.K ");
             
             NutTcpAccept(sock,25); 
          
              if(first==0){
                           NutPrintString(sostream, "220 Hello boy (^_^) \r\n");
                           NutPrintFlush(sostream); 
                           first=1;
                     
                          }
                       
             
             
             while(quit==0)
             {
               
              
              NutDeviceGetLine(sostream, buff, sizeof(buff) - 1);
              
        
               
              strupr(buff);//convert to uppercase
              
              //CHECK command
              if(dataflag == 0)
              {          
                	//check ehlo command
                	if((strstr(buff,"EHLO")!=NULL)||(strstr(buff,"HELO")!=NULL))
                	{   NutPrintString(sostream, "250 (Ethernut mail server ) Hello USER pleased to meet you \r\n");
                   	    //NutPrintString(sostream, "250-VRFY\r\n ");
                   	    //NutPrintString(sostream, "250 HELP\r\n ");
               		    NutPrintFlush(sostream);               
                	}
                        else
                	//check verfy
                	if(strstr(buff,"VERFY")!=NULL)
               		 {   if(strstr(buff,"ATAYA")!=NULL) //test user
                   	     {                 
                    		NutPrintString(sostream, "250 User Verify \r\n");
                    		NutPrintFlush(sostream); 
                   	     }
                   	     else
                   	     {                 
                    		NutPrintString(sostream, "501 User Unverify \r\n");
                    		NutPrintFlush(sostream); 
                   	     }
                   	     
                 	 }
                 	 else
                 	 if(strstr(buff,"RSET")!=NULL)               	
                   	     {                 
                    		NutPrintString(sostream, "250 Reset State OK \r\n");
                    		NutPrintFlush(sostream); 
                   	        state=0;
                   	     }
                   	  else  
                   	  if(strstr(buff,"NOOP")!=NULL)               	
                   	     {                 
                    		NutPrintString(sostream, "250 OK \r\n");
                    		NutPrintFlush(sostream); 
                   	        state=0;
                   	     }    
                 	else 
                        
                       
                	//check mail from
              		if((strstr(buff,"MAIL")!=NULL)&(state==0))
              		{   if(strstr(buff,"ATAYA_P")!=NULL) //test user
                  	    {                 
                   	    NutPrintString(sostream, "250 Mail From Verify \r\n");
                   	    NutPrintFlush(sostream); 
                  	    state=1;
                  	  
                  	    }
                  	    else
                  	    {
                  	     NutPrintString(sostream, "501 User name none valid \r\n");
                   	     NutPrintFlush(sostream); 
                  	    
                  	    }
              		}
                        else
              		//check RCPT to
              		if((strstr(buff,"RCPT")!=NULL)&(state==1))
            		{  if(strstr(buff,"ATAYA")!=NULL) //test user
                  	   {                 
                  	    NutPrintString(sostream, "250 RCPT to Verify \r\n");
                            NutPrintFlush(sostream); 
                  	    state=2; 
                  	   }
                  	   else
                  	   {
                  	    NutPrintString(sostream, "550 User UNknown \r\n");
                            NutPrintFlush(sostream); 
                           
                  	   }
              		}
              		else
              		//check data
              		if((strstr(buff,"DATA")!=NULL)&(state==2))
              		{   //if(strstr(buff,"ataya_p")!=NULL) //test user
                 	    //{       
                   	 dataflag=1;          
                   	 NutPrintString(sostream, "345 Input DATA and Stop by . \r\n");
                   	 NutPrintFlush(sostream); 
                  	     //}
             		 }
             		else 
             		if(strstr(buff,"QUIT")!=NULL)
            		{   //if(strstr(buff,"ataya_p")!=NULL) //test user
                  	   //{                 
                  	   NutPrintString(sostream, "221 Quit O.K nice to serve you(-_-)\r\n");
                           NutPrintFlush(sostream); 
                  	   quit=1;
                  	   //}  	   
              		}
              		else//Unregconize Command
              		{
              		   NutPrintString(sostream, "500 Unregonize your command\r\n");
                           NutPrintFlush(sostream); 
              		
              		}
              		
              }//end  if data flag
              else //dataflag set
               {          
                    
                   
                    
                    NutTcpReceive(sock, buff, sizeof(buff) - 1); //read mail and showing
                    
                    while(strstr(buff,".\r\n")==NULL)
                    NutTcpReceive(sock, buff, sizeof(buff) - 1);
                  
                    NutKPrintString(buff);
                    
                    NutKPrintString("\r\n");
                    NutPrintString(sostream, "250 Mail recieve O.K \r\n");
                    NutPrintFlush(sostream); 
                    checkcommand(buff);
                    dataflag=0;//clear dataflag
                   
               }
                      
             }//end while dataflag=0;
             NutSoStreamDestroy(sostream);
             NutTcpCloseSocket(sock);                      
             NutSleep(60000);
           
           
         }//end while  
    
 }//end for      
}

