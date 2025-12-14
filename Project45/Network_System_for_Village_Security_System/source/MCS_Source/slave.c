#include <AT89X51.H>
unsigned int i;
unsigned char index,maxlength,state;
idata char packet[11];
void init(void);
void flowcontrol(void);
void main(void) {
	init();	
	while(1){
		if(state!=0) {
			i++;	
			if(i==1750) {//--> time for request time out
				flowcontrol();
				packet[1]=3;
				maxlength=3;
				index=3;
				packet[2]=5;//request time out by slave
				SBUF=packet[maxlength-index];
				index--;
				i=0;
			}
		}
		
		
	}
}
void flowcontrol(void) {
		i=0;
		switch(state){
			case 0 :  //----> send to home or master
				if(packet[2]==5 && packet[3]==0 && packet[4]==1) { //packet check slave
					P1_1=0;
					P1_0=1;
					state=1;
					SBUF=packet[maxlength-index];
					index--;
				}
				else if (packet[2]==5) { //packet all of slave
					P1_1=1;
					P1_0=1;
					state=3;
					SBUF=packet[maxlength-index];
					index--;
				}
				else //--->this isn't my packet 
					index=0;
				break;
			case 1 : // recive from master
				P1_1=0;
				P1_0=0;
				state=0;
				break;
			case 2 : //send to master
				P1_1=0;
				P1_0=1;
				state=1;
				SBUF=packet[maxlength-index];
				index--;
				break;
			case 3 : // recive from home
				P1_1=1;
				P1_0=0;
				state=2;
			
	   }
}
serial() interrupt 4 using 2 {
		if (RI){
			packet[index] = SBUF;
			RI=0;
			if(index==1) { //-----> init maxlength
				if(packet[1]>11){
					packet[1]=5;
					maxlength=5;
				}
				else
					maxlength=packet[1];
			}
			if(packet[0]==':') //----> check start bit
				index++;
			if(index==(maxlength)){ //---->check maxlength
				flowcontrol();
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
