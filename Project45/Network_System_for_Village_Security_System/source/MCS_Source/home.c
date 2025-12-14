#include <AT89X51.H>
unsigned int i;
unsigned char index,maxlength,state,dev1,dev2;
idata char packet[20];
void init(void);
void flowcontrol(void);
void main(void) {
	init();	
	while(1){
	;}
} 
void application() {
	if(packet[4]==3) { //------------command to device of home node
		dev1=packet[5];
		dev2=packet[6];
		P1 |= 0x0c; // set ----11--
		P0=dev1;
		P1 &= 0xfb;// set 11--->10	
		P0=dev2;
		P1 |= 0x0c; // set ----11--
	}else if (packet[4]==1) { //-------check status of home node 
			packet[1]=11;
			maxlength=11;
			index=11;
//------------sensor
			P1 &= 0xf3;// set 00
			packet[5]=P0;
			P1 |= 0x04;// set 00--->01
			packet[6]=P0;					
//------------device
			packet[7]=dev1;
			packet[8]=dev2;							
	}
	else { //error commond
		packet[1]=3;
		maxlength=3;
		index=3;
		packet[2]='e';
	}

}			
void flowcontrol(void) {
		i=0;
		switch(state){
			case 0 : //wait recive from com--------->send
				if(packet[3]==2){ // id of home
					application();
					P1_1=0;
					P1_0=1;
					state=1;
					if(index!=0) {
						SBUF=packet[maxlength-index];
						index--;
					}
				}
				else
					index=0;
				break;
			case 1 : //send to com----------------->recive
				P1_1=0;
				P1_0=0;
				state=0;
				packet[0]='^';
				break;
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
			if(packet[0]==':' )
				index++;
			if(index==(maxlength)){
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
		P1_4=0;
		P1_1=0;
		P1_0=0;
		dev1=0xff;
		dev2=0xff;
		P0=0xff;
		P1 |= 0x0c; // set ----11--
		P0=0xff;
		P1 &= 0xfb;// set 11--->10
}
