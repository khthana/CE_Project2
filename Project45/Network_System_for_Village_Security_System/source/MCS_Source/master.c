#include <AT89X51.H>
unsigned int i;
unsigned char index,maxlength,state;
idata char packet[11];
void init(void);
void flowcontrol(void);
void resetstate(void);
void main(void) {
	init();	
	while(1){
		resetstate();
		;
	}
}
void resetstate(void) { 
		if(state!=0) {
			i++;	
			if(i==60000) {
				flowcontrol();
				packet[1]=3;
				maxlength=3;
				index=3;
				packet[2]='x';//request time out
				SBUF=packet[maxlength-index];
				index--;				
				i=0;
			}
		}
		
}
void flowcontrol(void) {
		i=0;
		switch(state){
			case 0 : 
				if(packet[2]=='s'){//id master ==>0
					P1_1=0;
					P1_0=1;
					state=1;
				}
				else {
					P1_1=1;
					P1_0=1;
					state=3;							
				}
				break;
			case 1 :
				P1_1=0;
				P1_0=0;
				state=0;
				break;
			case 2 : 
				P1_1=0;
				P1_0=1;
				state=1;
				break;
			case 3 : 
				P1_1=1;
				P1_0=0;
				state=2;
			
	   }
}
serial() interrupt 4 using 2 {
		if (RI){
			packet[index] = SBUF;
			RI=0;
			if(index==1) {
				if(packet[1]>11){
					packet[1]=11;
					maxlength=11;
				}
				else
					maxlength=packet[1];
			}
			if(packet[0]==':')
				index++;
			if(index==(maxlength)){
				flowcontrol();
				SBUF=packet[maxlength-index];
				index--;
			}
		}
		if(TI){
			TI=0;
			if(index==0) {
				flowcontrol();
			}
			else {

				SBUF=packet[maxlength-index];
				index--;
			}
		}
}
void init(void)
{
		PCON   &= 0x7f;
		SCON  	= 0x50;                      /* mode 1: 8-bit UART, enable receiver   */
		TMOD   |= 0x20;                      /* timer 1 mode 2: 8-Bit reload          */
		TH1   	= 0xfd;                      /* reload value 2400 baud                */
		TR1   	= 1;                         /* timer 1 run                           */
		ES    	= 1;                         /* enable serial port interrupt          */
		EA		= 1;
		maxlength = 2;
		P1_1=0;
		P1_0=0;
}
