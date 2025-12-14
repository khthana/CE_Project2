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
 * $Log: httpserv.c,v $
 * Revision 1.2  2002/10/31 16:02:19  harald
 * *** empty log message ***
 *
 * Revision 1.1  2002/08/09 18:27:18  harald
 * Renamed to avoid conficts with lib name
 *
 * Revision 1.8  2002/06/26 17:29:00  harald
 * First pre-release with 2.4 stack
 *
 * Revision 1.7  2002/06/12 10:55:29  harald
 * *** empty log message ***
 *
 * Revision 1.6  2002/06/04 19:11:06  harald
 * *** empty log message ***
 *
 * Revision 1.5  2002/05/11 20:59:22  harald
 * Using new standard output
 *
 * Revision 1.4  2002/05/08 16:02:29  harald
 * First Imagecraft compilation
 */
 

/*
 *
 * ATAYA P mail DEMO ver 1.0 
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
#include <mail/maillib.h>
#include <netinet/sostream.h>
#include <arpa/inet.h>
#include <net/route.h>
#include <netdb.h> 


#define DNSSERVERIP     "161.246.4.3"
#define INETSERVER	"chaokhun.kmitl.ac.th"
#define INETSERVERPORT  25
#define INETURL         "/search?q=ethernut"
#define MY_MAC          {0x00,0x06,0x98,0x20,0x00,0x00}
#define MY_IP           "161.246.5.135"
#define MY_MASK         "255.255.255.0"
#define MY_GATE         "161.246.5.254"


/*
 * Main application routine. 
 *
 * Nut/OS automatically calls this entry after initialization.
 */


THREAD(NutMain, arg)
{
    NUTDEVICE *uart0;
    u_long baud = 115200;
    TCPSOCKET *sock;
    NUTDEVICE *sostream;
   static u_char buff[1024];
   static u_char my_mac[] = MY_MAC; 
    u_long mailip;
    u_char mailadd1[40]="s2010439@kmitl.ac.th"; 
    u_char mailadd2[40]="ataya_p@yahoo.com"; 
    u_char text[500]="hello word \r\n this is a test from Ethernut\r\n By ATAYA P";
   

    NutRegisterDevice(&devUart0, 0, 0);
    uart0 = NutDeviceOpen("uart0");
    NutDeviceIOCtl(uart0, UART_SETSPEED, &baud);
	NutKPrintString("\r\n==== (^_^) ATA mail ver  1.0 ====\r\n");

    /*
    * Register Realtek controller at address 8300 hex
    * and interrupt 5 and configure lan interface.
    */
    NutKPrintString("Configuring Ethernet interface\r\n");
    NutRegisterDevice(&devEth0, 0x8300, 5);
   
    NutNetIfConfig("eth0", my_mac, inet_addr(MY_IP), inet_addr(MY_MASK));
    NutIpRouteAdd(0, 0, inet_addr(MY_GATE), &devEth0);
    NutDnsConfig(0, 0, inet_addr(DNSSERVERIP));

    if((mailip=IPresolve(INETSERVER) ) != 0) {
    
        /*
         * Create a socket.
         */
        if((sock = NutTcpCreateSocket()) != 0) {
            NutKPrintFormat("Connecting to %s on %u\r\n", inet_ntoa(mailip), INETSERVERPORT);
            if(MailConnect(sock, mailip, INETSERVERPORT) == 0)
             {   NutKPrintString("TCP connect ok\r\n");
                if((sostream = NutSoStreamCreate(sock)) != 0) 
                {
        
                      GetMailEhlo(sock,buff,INETSERVER,sostream);
                      NutKPrintString(buff);
                    
                      NutKPrintString("\n\r\n ==== NOW sending mail ====\r\n");
                    
                      
                      SendMailFrom(sock,buff,mailadd1,sostream);
                      NutKPrintString(buff);
                      
                      
                      SendRctpTo(sock,buff,mailadd2,sostream);
                      NutKPrintString(buff);
                      
                      
                      SendData(sock,buff,text,sostream);
                      NutKPrintString(buff);
                    
                      QuitMail(sock,buff,sostream); 
                       NutKPrintString(buff);
                    
                   
                    
                  
                }
                else
                    NutKPrintString("Creating stream device failed\r\n");

            }
            NutKPrintFormat("==== (-_-) Disonnecting %s:%u ====\r\n", inet_ntoa(mailip), INETSERVERPORT);
            NutTcpCloseSocket(sock);
        }
    }
    else
        NutKPrintFormat("Can't resolve %s\r\n", INETSERVER);
        /*
         * Close our socket and take a nap.
         */
        
        NutSleep(1000);
    
        //infinite loop
        for(;;);
        
}

