//ICC-AVR application builder : 4/6/2001 6:17:12 PM

// Target: AT90S8535

//ICC needs these helper files...
#include <io8535.h>
#include <macros.h>
#include <eeprom.h> 

#define ACL_LINK 1

/* Defines for the packet types */
#define CMD_PKT 0x01
#define ACL_PKT 0x02
#define EVENT_PKT 0x04

/* Define the different OCF values */
/* Link control commands */
#define CREATE_CONNECTION 0x05
#define ACCEPT_CONNECTION_REQUEST 0x09

/* Link policy commands */
/* Host-controller and basebands commands */
#define WRITE_SCAN_ENABLE 0x1A

/* Define the different OGF values */
#define HCI_LC 0x04 //0x01   /* Link Control Command */
#define HCI_LP 0x08 //0x02   /* Link Policy Command */
#define HCI_HC 0x0c //0x03   /* Host Controller and Baseband Commands */
#define HCI_IP 0x10 //0x04   /* Informational Parameters */

/* Defines of the different events */
#define CONNECTION_COMPLETE 0x03
#define CONNECTION_REQUEST 0x04
#define DISCONNECTION_COMPLETE 0x05
#define COMMAND_COMPLETE 0x0E
#define COMMAND_STATUS 0x0F

/* The flags in the HCI header */
#define HCI_HDR_LEN 1
#define ACL_HDR_LEN 4
#define SCO_HDR_LEN 3
#define CMD_HDR_LEN 3
#define EVENT_HDR_LEN 2

/* Special events */
#define INQUIRY_SCAN_ENABLE 1
#define PAGE_SCAN_ENABLE 2
#define RX_SIZE 30

#define minLR -5
#define maxLR 5

typedef struct cmd_pkt {
	unsigned char  type;
	unsigned char ocf;
	unsigned char ogf;
	unsigned char len;
	unsigned char cmdData[20];
}cmd_pkt;
static cmd_pkt c_pkt;

#define L2CAP_IMPLEMENT 1
typedef struct aclPkt{
   unsigned char type[1];
   unsigned char conn_flag[2];
   unsigned char hci_len[2];

#ifdef L2CAP_IMPLEMENT
   unsigned char l2cap_len[2];
   unsigned char l2cap_cid[2];
#endif
   unsigned char acl_Data[160];
}aclPkt;
static aclPkt aclData;

enum states{WAIT_FOR_PACKET_TYPE, WAIT_FOR_EVENT_TYPE, WAIT_FOR_EVENT_LENGTH,
            WAIT_FOR_EVENT_PARAM, WAIT_FOR_ACL_CON_FLAG1, WAIT_FOR_ACL_CON_FLAG2,
            WAIT_FOR_ACL_HCI_LEN1, WAIT_FOR_ACL_HCI_LEN2, WAIT_FOR_ACL_L2CAP_LEN1,
            WAIT_FOR_ACL_L2CAP_LEN2, WAIT_FOR_ACL_L2CAP_CID1, WAIT_FOR_ACL_L2CAP_CID2,
            WAIT_FOR_ACL_DATA};
static enum states state;

// variable for data in
unsigned char *wdata;
unsigned char packetType;
unsigned char eventType;
unsigned char eventLen;
static unsigned char eventParam[20];
unsigned char posParam;
int getPacketResult,getAclResult;

static unsigned char aclDataBuf[160];
static unsigned char aclDataBuf2[10];
unsigned int aclDataLen;
static unsigned char rxBuf;

void uart0_init(void);
void port_init(void);

int getRxSize(void);
int read(void);
//void TransmitByte( unsigned char data );
static unsigned char dInSerialTmp[RX_SIZE];
int head=0,tail=0;

#pragma interrupt_handler uart0_rx_isr:12
void uart0_rx_isr(void);


void init_devices(void);
void TransmitByte( unsigned char data );

void init_lcd(void);
void clearLCD(void);
void gotoxyLCD(unsigned char x_pos);
void writeDataLCD(unsigned char datalcd);   
void writeCmdLCD(unsigned char datacmdlcd);     
void latchLCD(void);
//void DmSec(unsigned int count);

//======== Bluetooth's prototype function ================
void init_stack();
void write_scan_enable(unsigned int enable);
void set_ericsson_baudrate();
void accept_connection_request();
void send_acl_packet(unsigned char *data,int len);//(unsigned char *data, int len)
int con_complete;
unsigned char sendAgain;

//===== Motor control =====
void TurnLeft(void);
void TurnRight(void);
void GenMlrClk(void);
int lrPos = 0;

int aclInCount = 0;
unsigned char varForFn;
int delay1,delay2;

void main(void)
{
int a,b,i,j,k,dl;
int count,count2;
unsigned char tmp;
   init_devices();
   PORTB &= 0xDF;   //Clear Pin BlackLight (PB5)
   //DmSec(500);
	for(delay1=0;delay1<500;delay1++)
	   for(delay2=0;delay2<1700;delay2++) ;
   gotoxyLCD(0x00);
   writeDataLCD(' ');
   writeDataLCD(' ');
   writeDataLCD(' ');
   writeDataLCD(' ');
   writeDataLCD(' ');
   writeDataLCD('R');
   writeDataLCD('E');
   writeDataLCD('A');
   gotoxyLCD(0x40);
   writeDataLCD('D');
   writeDataLCD('Y');
   writeDataLCD(' ');
   writeDataLCD(' ');
   writeDataLCD(' ');
   writeDataLCD(' ');
   writeDataLCD(' ');
   writeDataLCD(' ');
   //DmSec(3000);
	for(delay1=0;delay1<1500;delay1++)
	   for(delay2=0;delay2<1700;delay2++) ;

   init_stack();
   con_complete=0;
   sendAgain = 0;
   //DmSec(500);
	for(delay1=0;delay1<500;delay1++)
	   for(delay2=0;delay2<1700;delay2++) ;

   gotoxyLCD(0x00);
   state = WAIT_FOR_PACKET_TYPE;
   posParam = 0;
   getPacketResult = 0;//NOT_COMPLETE;
   getAclResult = 0;

   while(1){
		//DmSec(10);
		for(delay1=0;delay1<10;delay1++)
	     for(delay2=0;delay2<1700;delay2++) ;
		i = read();	 
      if(i>0){
			 //for(count=0;count<i;count++) {
               switch(state){
                  case WAIT_FOR_PACKET_TYPE :
                     if(rxBuf==EVENT_PKT){
                        packetType = EVENT_PKT;
                        state = WAIT_FOR_EVENT_TYPE;
                     }
                     else if(rxBuf==ACL_PKT){
                        packetType = ACL_PKT;
                     	state = WAIT_FOR_ACL_CON_FLAG1;
							}
                  break;

               	case WAIT_FOR_EVENT_TYPE :
							if(rxBuf == CONNECTION_COMPLETE) eventType = CONNECTION_COMPLETE;
                  	else if(rxBuf == CONNECTION_REQUEST) eventType = CONNECTION_REQUEST;
                  	else if(rxBuf == DISCONNECTION_COMPLETE) eventType = DISCONNECTION_COMPLETE;
                  	else if(rxBuf == COMMAND_COMPLETE) eventType = COMMAND_COMPLETE;
                  	else if(rxBuf == COMMAND_STATUS) eventType = COMMAND_STATUS;
                  	state = WAIT_FOR_EVENT_LENGTH;
                  break;

               	case WAIT_FOR_EVENT_LENGTH :
                  	eventLen = rxBuf;
                  	state = WAIT_FOR_EVENT_PARAM;
                  break;

               	case WAIT_FOR_EVENT_PARAM :
                  	eventParam[posParam] = rxBuf;
                  	posParam++;
                  	if (posParam==(eventLen)) {
                        getPacketResult = 1;
                        state = WAIT_FOR_PACKET_TYPE ;
                        posParam = 0;
                     }
                  break;

                  case WAIT_FOR_ACL_CON_FLAG1 :
                     state = WAIT_FOR_ACL_CON_FLAG2;
                  break;

                  case WAIT_FOR_ACL_CON_FLAG2 :
                     state = WAIT_FOR_ACL_HCI_LEN1;
                  break;

                  case WAIT_FOR_ACL_HCI_LEN1 :
                     state = WAIT_FOR_ACL_HCI_LEN2;
                  break;

                  case WAIT_FOR_ACL_HCI_LEN2 :
                     state = WAIT_FOR_ACL_L2CAP_LEN1;
                  break;

                  case WAIT_FOR_ACL_L2CAP_LEN1 :
                     aclDataLen = rxBuf;
                     state = WAIT_FOR_ACL_L2CAP_LEN2;
                  break;

                  case WAIT_FOR_ACL_L2CAP_LEN2 :
                     aclDataLen += rxBuf * 256;
                     state = WAIT_FOR_ACL_L2CAP_CID1;
                  break;

                  case WAIT_FOR_ACL_L2CAP_CID1 :
                     state = WAIT_FOR_ACL_L2CAP_CID2;
                  break;

                  case WAIT_FOR_ACL_L2CAP_CID2 :
                     state = WAIT_FOR_ACL_DATA;
                  break;

                  case WAIT_FOR_ACL_DATA :
                     aclDataBuf2[posParam] = rxBuf;
                     posParam++;
                     if (posParam==(aclDataLen)){
                        state = WAIT_FOR_PACKET_TYPE;
                        posParam = 0;
                        getAclResult = 1;
                     }
                  break;
            	}

               if (getPacketResult == 1) {
                  // Show result of COMMAND_COMPLETE event.
                  if(eventType == COMMAND_COMPLETE){
					      if((eventParam[1] == WRITE_SCAN_ENABLE)&&(eventParam[2] == HCI_HC)&&(eventParam[3] == 0x00)) {
					         gotoxyLCD(0x00);
							   writeDataLCD('W');
               		   writeDataLCD('a');
			      		   writeDataLCD('i');
				   		   writeDataLCD('t');
				   		   writeDataLCD(' ');
							   writeDataLCD('f');
               		   writeDataLCD('o');
               		   writeDataLCD('r');
  							   gotoxyLCD(0x40);
							   writeDataLCD(' ');
							   writeDataLCD('C');
							   writeDataLCD('O');
							   writeDataLCD('N');
							   writeDataLCD('N');
							   writeDataLCD('E');
							   writeDataLCD('C');
							   writeDataLCD('T');
               	   }
                  }
                  // Show result of COMMAND_STATUS event.
                  else if(eventType == COMMAND_STATUS){
                     if((eventParam[2] == CREATE_CONNECTION)&&(eventParam[3] == HCI_LC)&&(eventParam[0] == 0x00)) {
							}
						}
                  // Show result of CONNECTION_REQUEST event.
                  else if(eventType == CONNECTION_REQUEST){
			   		   accept_connection_request();
					   }
                  // Show result of CONNECTION_REQUEST event.
                  else if(eventType == CONNECTION_COMPLETE){
                     if(eventParam[0]==0x00) {
						      gotoxyLCD(0x00);
							   writeDataLCD('C');
					  		   writeDataLCD('O');
					 		   writeDataLCD('N');
					 		   writeDataLCD('N');
					 		   writeDataLCD('E');
					 		   writeDataLCD('C');
					 		   writeDataLCD('T');
					 		   writeDataLCD(' ');
					 		   gotoxyLCD(0x40);
					 		   writeDataLCD('C');
					 		   writeDataLCD('o');
					 		   writeDataLCD('m');
					 		   writeDataLCD('p');
					 		   writeDataLCD('l');
					 		   writeDataLCD('e');
					 		   writeDataLCD('t');
					 		   writeDataLCD('e');					 
                        con_complete = 1;
							   //DmSec(1000);
							   for(delay1=0;delay1<500;delay1++)
	  						      for(delay2=0;delay2<1700;delay2++) ;

    							clearLCD();
						   }
                  }
					   else if(eventType == DISCONNECTION_COMPLETE){
                     if(eventParam[0]==0x00) {
						      gotoxyLCD(0x00);
							   writeDataLCD(' ');
					  		   writeDataLCD(' ');
					 		   writeDataLCD(' ');
					 		   writeDataLCD('D');
					 		   writeDataLCD('I');
					 		   writeDataLCD('S');
					 		   writeDataLCD('C');
					 		   writeDataLCD('O');
					 		   gotoxyLCD(0x40);
					 		   writeDataLCD('N');
					 		   writeDataLCD('N');
					 		   writeDataLCD('E');
					 		   writeDataLCD('C');
					 		   writeDataLCD('T');
					 		   writeDataLCD(' ');
					 		   writeDataLCD(' ');
					 		   writeDataLCD(' ');					 
                        con_complete = 0;
							   //DmSec(1000);
							   for(delay1=0;delay1<500;delay1++)
	  						      for(delay2=0;delay2<1700;delay2++) ;

							   //clearLCD();
						   }
                  }
					
                  getPacketResult = 0;
               }
             
	            if(getAclResult== 1){
                  for(i=0;i<aclDataLen;i++) {
               }
		   
					if(aclDataBuf2[0]=='A') {
					   gotoxyLCD(0x00);
				  		writeDataLCD('S');
				  		writeDataLCD('e');
    			  		writeDataLCD('n');
				  		writeDataLCD('d');
				  		writeDataLCD('i');
				  		writeDataLCD('n');
				  		writeDataLCD('g');
				  		writeDataLCD(' ');
				  		gotoxyLCD(0x40);
				  		writeDataLCD('p');
				  		writeDataLCD('i');
				  		writeDataLCD('c');
				  		writeDataLCD('t');
				  		writeDataLCD('u');
				  		writeDataLCD('r');
				  		writeDataLCD('e');
				  		writeDataLCD('.');
				  	   sendAgain = 1;
			   	}
			      else if(aclDataBuf2[0]=='Z') {
			         gotoxyLCD(0x00);
				  		writeDataLCD(' ');
				  		writeDataLCD(' ');
				  		writeDataLCD(' ');
				  		writeDataLCD(' ');
				  		writeDataLCD(' ');
				  		writeDataLCD('P');
				  		writeDataLCD('a');
				  		writeDataLCD('u');
				  		gotoxyLCD(0x40);
				  		writeDataLCD('s');
				  		writeDataLCD('i');
				  		writeDataLCD('n');
				  		writeDataLCD('g');
				  		writeDataLCD(' ');
				  		writeDataLCD(' ');
				  		writeDataLCD(' ');
				  		writeDataLCD(' ');
				  	   sendAgain = 0;
			   	}
					else if(aclDataBuf2[0]=='L') {
				   	TurnLeft();	  
			   	}
			      else if(aclDataBuf2[0]=='R') {
					   TurnRight();
			      }				
               getAclResult = 0;
            }
         //}
      }
	  
	   if((con_complete==1)&&(sendAgain==1)){
		   // Check VSYNC for taka a picture
   	   while(1){
            tmp = PIND&0x80;
	   		if(tmp==0x80){
			      PORTB |= 0x04;  // 4040RESET = 1; (PB2)
   			   PORTB &= 0xfb;  // 4040RESET = 0; (PB2)
               PORTB &= 0xfd;  // WE = 0; (PB1)
			      tmp = PIND&0x80;
			      while(1){
				      if(tmp==0x00) goto aa;
				      tmp = PIND&0x80;
			      }
			   }	
		   }
		   aa:
		   while(1){
		      tmp = PIND&0x80;
            if(tmp==0x80){    // Check VSYNC
			      PORTB |= 0x02; // WE = 1; (PB1)
			      break;
			   }
		   }
		 			
		 // Reset 4040 counter
		PORTB |= 0x04;  // 4040RESET = 1; (PB2)
		PORTB &= 0xfb;  // 4040RESET = 0; (PB2)

		for (a=0;a<161;a++) {
		   for(b=0;b<646;b++) {
			   if ((b>=251)&&(b<=410)&&(a>=41)&&(a<=160)) {
				   aclDataBuf[b-251] = PINA;//b-251;				
			   }
			   PORTB |= 0x01; // 4040CLK = 1; (PB0)
			   if ((b>=251)&&(b<=410)&&(a>=41)&&(a<=160)) ;//Delay();
			   PORTB &= 0xfe; // 4040CLK = 0; (PB0)
			}
			//send pic's data (line 41 to line 160 (160 bytes per line)) 
			//through aclPkt
			if((a>=41)&&(a<=160)){
			   send_acl_packet((unsigned char *) &aclDataBuf,160);																					 
			}
		}
 	}
}//while(1) {} 

}

//*************************** System function *********************************
void port_init(void)
{
 PORTA = 0x00;
 DDRA = 0x00;
 PORTB = 0xFF;
 DDRB = 0xFF;
 PORTC = 0xFF;
 DDRC = 0xFF;
 PORTD = 0x00;
 DDRD = 0x00;
}

//***************************************************************************
void uart0_init(void)
{
 UCR  = 0x00; //disable while setting baud rate
 UBRR = 0x07; //set baud rate = 57600
 UCR  = 0x98; //enable
}

int getRxSize(void)
{
   if(head<=tail) return tail-head;
	else return RX_SIZE-head+tail; 
}
//***************************************************************************
#pragma interrupt_handler uart0_rx_isr:12
void uart0_rx_isr(void)
{
 //uart has received a character in UDR
 if(getRxSize() < (RX_SIZE-1)){
    dInSerialTmp[tail] = UDR;
    tail++;
    if(tail>=RX_SIZE) tail=0;
 }
 else {
 //portIn = UDR;
 }
}


//***************************************************************************
int read(void)
{
	if(getRxSize()<=0) return 0;
	else{
	   rxBuf = dInSerialTmp[head];
		head++;
		if (head>=RX_SIZE) head=0;
		return 1;
	}
}		

//************** call this routine to initialise all peripherals **************
void init_devices(void)
{
 //stop errant interrupts until set up
 CLI(); //disable all interrupts

 port_init();
 uart0_init();

 MCUCR = 0x00; 
 GIMSK = 0x00;
 TIMSK = 0x00;
 SEI(); //re-enable interrupts
 //all peripherals are now initialised
 init_lcd();
}

//***************************************************************************
void TransmitByte(unsigned char data )
{
	while ( !(USR & (1<<UDRE)) )
		; /* wait for empty transmit buffer */
	UDR = data; /* start transmittion */
}

//***************************************************************************
void init_lcd(void){
  for (varForFn=0;varForFn<0xff;varForFn++) ;  //delayx(0xFF);
  writeCmdLCD(0x33);
  for (varForFn=0;varForFn<0xff;varForFn++) ;  //delayx(0xFF);                      
  writeCmdLCD(0x32);
  for (varForFn=0;varForFn<0xff;varForFn++) ;  //delayx(0xFF);
  writeCmdLCD(0x38);
  for (varForFn=0;varForFn<0xff;varForFn++) ;  //delayx(0xFF);
  writeCmdLCD(0x0F);
  for (varForFn=0;varForFn<0xff;varForFn++) ;  //delayx(0xFF);
  writeCmdLCD(0x06);
  for (varForFn=0;varForFn<0xff;varForFn++) ;  //delayx(0xFF);
  writeCmdLCD(0x01);
}
   
//***************************************************************************
void writeCmdLCD(unsigned char datacmdlcd){     
  PORTB &= 0xBF;      //Clear Pin RS (PB6)
  PORTC = datacmdlcd;
  latchLCD();
  for (varForFn=0;varForFn<0xff;varForFn++) ;  //delayx(0xFF);
}

//***************************************************************************
void writeDataLCD(unsigned char datalcd){
  PORTB |= 0x40;    //Set Pin RS (PB6)
  PORTC = datalcd;
  latchLCD();
  PORTB &= 0xBF;   //Clear Pin RS (PB6)
  for (varForFn=0;varForFn<0xff;varForFn++) ;  //delayx(0xFF);
}

//***************************************************************************
void gotoxyLCD(unsigned char x_pos){
  x_pos = x_pos | 0x80;
  PORTB &= 0xBF;      //Clear Pin RS (PB6)
  PORTC = x_pos;
  latchLCD();
  for (varForFn=0;varForFn<0xff;varForFn++) ;  //delayx(0xFF);
}

//***************************************************************************
void clearLCD(void){
  PORTB &= 0xBF;      //Clear Pin RS (PB6)
  PORTC = 0x01;
  latchLCD();
  for (varForFn=0;varForFn<0xff;varForFn++) ;  //delayx(0xFF);
  PORTC = 0x02;
  latchLCD();
  for (varForFn=0;varForFn<0xff;varForFn++) ;  //delayx(0xFF);
}

//***************************************************************************
void latchLCD(void){
  PORTB &= 0x7F;    //Clear Pin E (PB7)
  for (varForFn=0;varForFn<0xff;varForFn++) ;  //delayx(0xFF);
  PORTB |= 0x80;    //Set Pin E (PB7)
}

//************************** Bluetooth function *****************************
//***************************************************************************
void init_stack()
{
	write_scan_enable(PAGE_SCAN_ENABLE|INQUIRY_SCAN_ENABLE);
	//DmSec(1);
	for(delay1=0;delay1<1;delay1++)
	   for(delay2=0;delay2<1700;delay2++) ;

}

//***************************************************************************
void write_scan_enable(unsigned int enable)
{
	c_pkt.type = CMD_PKT;
	c_pkt.ocf = WRITE_SCAN_ENABLE;
	c_pkt.ogf = HCI_HC;
	c_pkt.cmdData[0] = enable;
	c_pkt.len = 1;
	TransmitByte(c_pkt.type);
	TransmitByte(c_pkt.ocf);
	TransmitByte(c_pkt.ogf);
	TransmitByte(c_pkt.len);
	TransmitByte(c_pkt.cmdData[0]);
}

//***************************************************************************
void accept_connection_request()
{
	c_pkt.type = CMD_PKT;
	c_pkt.ocf = ACCEPT_CONNECTION_REQUEST;
	c_pkt.ogf = HCI_LC;
	c_pkt.cmdData[0] = 0x44;
	c_pkt.cmdData[1] = 0x44;
	c_pkt.cmdData[2] = 0x44;
	c_pkt.cmdData[3] = 0x44;
	c_pkt.cmdData[4] = 0x44;
	c_pkt.cmdData[5] = 0x44;
	c_pkt.cmdData[6] = 0x01;
	c_pkt.len = 7;
	TransmitByte(c_pkt.type);
	TransmitByte(c_pkt.ocf);
	TransmitByte(c_pkt.ogf);
	TransmitByte(c_pkt.len);
	TransmitByte(c_pkt.cmdData[0]);
	TransmitByte(c_pkt.cmdData[1]);
	TransmitByte(c_pkt.cmdData[2]);
	TransmitByte(c_pkt.cmdData[3]);
	TransmitByte(c_pkt.cmdData[4]);
	TransmitByte(c_pkt.cmdData[5]);
	TransmitByte(c_pkt.cmdData[6]);				
}

//***************************************************************************
void send_acl_packet(unsigned char *data,int len)//(unsigned char *data, int len)
{
  	aclData.type[0] = ACL_PKT;
  	aclData.conn_flag[0] = 0x01;
  	aclData.conn_flag[1] = 0x20;
  	for (varForFn=0;varForFn<len;varForFn++) aclData.acl_Data[varForFn] = *(data+varForFn);
  	//l2cap_write(len)
  	aclData.l2cap_len[0] = len % 256;
  	aclData.l2cap_len[1] = len / 256;
  	aclData.l2cap_cid[0] = 0x41;
  	aclData.l2cap_cid[1] = 0x00;
  	len=len+4;
  	//hci_write(len);
  	aclData.hci_len[0] = len % 256;
  	aclData.hci_len[1] = len / 256;
	len = len+5;
	TransmitByte(aclData.type[0]);
   TransmitByte(aclData.conn_flag[0]);
	TransmitByte(aclData.conn_flag[1]);
	TransmitByte(aclData.hci_len[0]);
	TransmitByte(aclData.hci_len[1]);
	TransmitByte(aclData.l2cap_len[0]);
	TransmitByte(aclData.l2cap_len[1]);
	TransmitByte(aclData.l2cap_cid[0]);
	TransmitByte(aclData.l2cap_cid[1]);
	for(varForFn=0;varForFn<len-9;varForFn++)	
		TransmitByte(aclData.acl_Data[varForFn]);
} 
	
//***************************************************************************
/*
void DmSec(unsigned int count)
{
int i;
	while(count)
	{
		for(i=0;i<1700;i++) ;
		count--;
	}
}
*/
//***************************************************************************
void TurnLeft(void)
{
   lrPos -= 1;
	if(lrPos<minLR) lrPos = minLR;
	else{
	   PORTB |= 0x08;
	   GenMlrClk();
		GenMlrClk();
    	GenMlrClk();
	   GenMlrClk();
   	GenMlrClk();
   	GenMlrClk();
   	GenMlrClk();
   	GenMlrClk();
   	GenMlrClk();
		GenMlrClk();
	}						
}

//***************************************************************************
void TurnRight(void)
{
   lrPos += 1;
	if(lrPos>maxLR) lrPos = maxLR;
	else{
		PORTB &= 0xf7;
		GenMlrClk();
		GenMlrClk();
		GenMlrClk();
		GenMlrClk();
		GenMlrClk();
		GenMlrClk();
		GenMlrClk();
		GenMlrClk();
		GenMlrClk();
		GenMlrClk();
	}						
}

//***************************************************************************
void GenMlrClk(void)
{
int a;
   PORTB &= 0xef;
	for(a=0;a<11000;a++) ;
	PORTB |= 0x10;
	for(a=0;a<11000;a++) ;
}

