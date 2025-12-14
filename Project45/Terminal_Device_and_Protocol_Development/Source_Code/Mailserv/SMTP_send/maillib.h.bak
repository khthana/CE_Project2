



//Mail Library header Demo version 1.0 (^_^)
//by Ataya P 

//Last Update  :6/12/2002
#include <string.h>
#include <stdlib.h> 

#include <dev/uartavr.h>
#include <dev/nicrtl.h>

#include <sys/heap.h>
#include <sys/thread.h>
#include <sys/timer.h>
#include <sys/print.h>
#include <sys/kprint.h>
#include <mail/maillib.c>
#include <netinet/sostream.h>
#include <arpa/inet.h>
#include <net/route.h>
#include <netdb.h> 


u_long IPresolve(u_char * servername);

int MailConnect(TCPSOCKET *sock,u_long  mailip,int port);

int GetMailEhlo(TCPSOCKET *sock,u_char *buff,u_char *server,NUTDEVICE *sostream);

int SendMailFrom(TCPSOCKET *sock,u_char *buff,u_char *mailfrom,NUTDEVICE *sostream);

int SendRctpTo(TCPSOCKET *sock,u_char *buff,u_char *rcpt,NUTDEVICE *sostream);

int SendData(TCPSOCKET *sock,u_char *buff,u_char *text,NUTDEVICE *sostream);

int QuitMail(TCPSOCKET *sock,u_char *buff,NUTDEVICE *sostream);

//End of program (-_-)

