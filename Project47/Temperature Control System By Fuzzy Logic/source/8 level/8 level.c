#include <Atmel/AT89X51.h>
#include <stdio.h>
#include <intrins.h>
#include <math.h>

// GLOBAL VARIABLE - and define
#define BUFFER_SIZE 3
#define MAX_LEVEL 7	// Number of level - 1
#define divide 32

sbit CH = 0x93;
sbit sync=0xB3;
sbit DQ = 0xA7;

data unsigned short PhaseLen;	// 'ON' Phase length (in cycles unit)
data unsigned short StepLen;		// How long does a level runs (cycles)
data unsigned short MapTable[8];	// Each level cycles
data unsigned short Remain;
data unsigned char CHLevel = 0;	//  Level of channel
data unsigned char TmpLev = 0;
data unsigned char start=0;
idata unsigned char buffer[BUFFER_SIZE];
//unsigned char ff = 0xff;
int i,j,k;
int loop = 0;
bit loaded = 0;
char set_p[1];

// SERIAL - Get SBUF to buffer
void receive(void) interrupt 4
{
	if(RI)
	{
		RI = 0;
		if (loop < 1) 
		{
			buffer[loop] = SBUF;
			loop++;
		}
		else 
		{
			buffer[loop] = SBUF;
			loop = 0;
			loaded = 1;
		}
	}
}
// GET_DATA - get data from serial port
int get_data(char* co) 
{
	//unsigned char a[16];

	if (loaded==1) 
	{
		co[0] = ((buffer[0] - 0x30) * 10) +(buffer[1]-0x30); 
		loaded=0;
		//TI = 1;
		printf("Setpoint = %d degrees C \n ",(int)co[0]);
		TI = 0;
		return(0);
	}
	return(1);
}
// DELAY - with an 11.059MHz crystal. Calling 24us, and count 16us.
void delay(int seconds) {
	for (k=0; k<seconds; k++);
}
// OW_RESET - Reset the one-wire bus and returns the presence detect.
unsigned char ow_reset(void) {
	unsigned char presence;

	DQ = 0; 					//pull DQ line low
	delay(29); 					// leave it low for 480us
	DQ = 1; 					// allow line to return high
	delay(3); 					// wait for presence
	presence = DQ; 				// get presence signal
	delay(25); 					// wait for end of timeslot
	return(presence); 			// presence signal returned
} 								// 0=presence, 1 = no part
// READ_BIT - reads a bit from the one-wire bus.
unsigned char read_bit(void) {
	bit dat;
	DQ = 0; 					// pull DQ low to start timeslot
	_nop_ ();
	_nop_ ();
	DQ = 1; 					// then return high
	_nop_ ();
	_nop_ ();
	_nop_ ();
	_nop_ ();
	dat = DQ;	
	for(k=0; k<8; k++) _nop_();	// delay 15us from start of timeslot
	return(dat); 				// return value of DQ line
}
// WRITE_BIT - writes a bit to the one-wire bus, passed in bitval.
void write_bit(char bitval) {
	DQ = 0; 					// pull DQ low to start timeslot
	if(bitval==1) DQ =1; 		// return DQ high if write 1
	delay(5); 					// hold value for remainder of timeslot
	DQ = 1;
}
// READ_BYTE - reads a byte from the one-wire bus.
unsigned char read_byte(void) {
	unsigned char value = 0;

	for (j=0; j<8; j++) {
		if(read_bit()) value|=0x01<<j; // reads byte in, one byte at a time and then shifts it left
		delay(6);				// wait for rest of timeslot
	}
	return(value);
}
// WRITE_BYTE - writes a byte to the one-wire bus.
void write_byte(char val) {
	unsigned char temp;

	for (j=0; j<8; j++) { 		// writes byte, one bit at a time
		temp = val>>j; 			// shifts val right 'i' spaces
		temp &= 0x01; 			// copy that bit to temp
		write_bit(temp); 		// write bit in temp into
	}
	delay(5);
}
// READ_TEMP - read temperature by skiprom
char Read_Temp(char* sensor) {
	char get[2];//secode[8];
	char temp_lsb,temp_msb;

	ow_reset();
	write_byte(0x55); 									// math ROM
	for (i=0;i<8;i++) write_byte(sensor[i]);
	write_byte(0x44); 									// Convert T
	ES = 1;
	delay(20000);
	ES = 0;
	ow_reset();
	write_byte(0x55); 									// math ROM
	for (i=0;i<8;i++) write_byte(sensor[i]);
	write_byte(0xBE); 									// Read Scratch Pad
	for (i=0; i<2; i++) get[i]=read_byte();
	temp_msb = get[1]; 									// Sign byte + lsbit
	temp_lsb = get[0]; 									// Temp data plus lsb
	if (temp_msb <= 0x80) temp_lsb = (temp_lsb/2);	 	// shift to get whole degree
	temp_msb = temp_msb & 0x80; 						// mask all but the sign bit
	if (temp_msb >= 0x80) temp_lsb = (~temp_lsb)+1; 	// twos complement
	if (temp_msb >= 0x80) temp_lsb = (temp_lsb/2);		// shift to get whole degree
	if (temp_msb >= 0x80) temp_lsb = ((-1)*temp_lsb); 	// add sign bit
	return(temp_lsb);
}

// READ_ROM - ROM by 1 device
/*void Read_ROM(void) {
	char dat[8];

	ow_reset();
	write_byte(0x33);
	for (i=0; i<8; i++) dat[i]=read_byte();
	printf("$");
	printf("%x",ff,dat[7]);
	printf("%x",ff,dat[6]);
	printf("%x",ff,dat[5]);
	printf("%x",ff,dat[4]);
	printf("%x",ff,dat[3]);
	printf("%x",ff,dat[2]);
	printf("%x",ff,dat[1]);
	printf("%x",ff,dat[0]);
	printf("@\n");
}*/
void fan_1()  //Front fan 
{
	P2_0 = 1;
	P2_1 = 0;
	P2_2 = 1;
	P2_3 = 0;
	P2_4 = 1;
	P2_5 = 0;
} 
void fan_2()	//Back fan
{
	P2_0 = 0;
	P2_1 = 0;
	P2_2 = 1;
	P2_3 = 0;
	P2_4 = 0;
	P2_5 = 1;
}
void fan_s()	//stop fan
{
	P2_0 = 1;
	P2_1 = 0;
	P2_2 = 1;
	P2_3 = 0;
	P2_4 = 0;
	P2_5 = 0;
}
void init_serial(void) {
	TMOD |= 0x20;
	TCON = 0x40;
	SCON = 0x50;
	PCON &= 0x7F;
	TH1 = 0xFD;
	//TL1 = 0xFD; 
	TR1 = 1;
	TI = 1; 
}
/*void initialize_serial()
{
// Initialize the serial port (9600, 8, N, 1) 
	PCON &= 0x7F;		 					// Clear bit 7 of the PCON register (SMOD1 = 0)  
	SCON = 0x50;							// 0101,0000 (Mode 1 and RxD enable)			
	TMOD |= 0x20;							// Timer #1 in autoreload 8 bit mode
	TCON = 0x40;							// Set Timer #1 to run mode
	TH1 = 0xFD;//FA = 4800 FD=9600			// Baud rate is determined by
											// Timer #1 overflow rate
											// Baud Rate = (Fcpu / 384) / (256 - TH1)
											// Fcpu = 11.0592 MHz
											// TH1 = 253
	TR1 = 1;								// Turn on Timer 1
}*/
 
void onoff() interrupt 1			// timer 0 interrupt TF0
{
	if (start==1 && TmpLev>0)
	{
		start=0;
		CH=0;//turn off light
		Remain=0xFFFF-(MapTable[TmpLev]-PhaseLen);
		TH0 = ((unsigned short)Remain >> 8);//load remain timer
		TL0 = Remain;
 	    TR0 = 1;//enable timer 
	}
	else 
	{
		CH=1;//turn on light
		TmpLev=CHLevel;
	}
}
void synchronize() interrupt 2		//external interrupt 
{
	start=1;	
	TH0 = ((unsigned short)MapTable[TmpLev] >> 8);//load timer
 	TL0 = MapTable[TmpLev];
	TR0 = 1;//Enable timer 0*/
}
void GetPhaseLen(void)
{
	// Init Timer 0
	TMOD |= 0x01;	// Timer 0, Mode 1, 16-bit timer
	TR0 = 0;		// Disable timer 0
	TH0 = 0;		// Reload timer
	TL0 = 0;

	// Wait for falling edge
	while (!sync) {}
	while (sync) {}
	TR0 = 1;		// Enable timer 0

	// Wait for rising edge
	while (!sync) {}
	TR0 = 0;		// Disable timer 0
}

unsigned short GetAvgPhaseLen(void)
{
	unsigned short avg;
	//unsigned char i;

	GetPhaseLen();
	avg = ((unsigned short)TH0 << 8) | (unsigned short)TL0;  	// TH0 or TL0 
	for (i=0;i<19;i++) // Use 20 samples
	{	
		GetPhaseLen();
		avg = (avg + (((unsigned short)TH0 << 8) | (unsigned short)TL0)) / 2;
	}
	return avg;
}


void main(void) 
{
 	//unsigned char start;
	int temp1,temp2,err1,err2,c_err;
	char secode1[8],secode2[8];
 	secode1[0] = 0x10;
	secode1[1] = 0xA4;
	secode1[2] = 0x6D;
	secode1[3] = 0x92;
	secode1[4] = 0x00;
	secode1[5] = 0x08;
	secode1[6] = 0x00;
	secode1[7] = 0x16;
	//16 00 08 00 92 6D A4 10
	secode2[0] = 0x10;
	secode2[1] = 0x24;
	secode2[2] = 0x99;
	secode2[3] = 0x92;
	secode2[4] = 0x00;
	secode2[5] = 0x08;
	secode2[6] = 0x00;
	secode2[7] = 0x45;
	// 45 00 08 00 92 99 24 10

	// Find phase length
	PhaseLen = GetAvgPhaseLen();
	StepLen = PhaseLen / (MAX_LEVEL+1);
	PhaseLen = 0xFFFF-PhaseLen;
	for (i=0; i<MAX_LEVEL; i++) {	// Create map table
		MapTable[i] = 0xFFFF-((MAX_LEVEL-i) * StepLen);
	}
	MapTable[MAX_LEVEL]=MapTable[MAX_LEVEL-1]+(StepLen/2);
	init_serial();
	/*printf("PhaseLen %x \n",(int)PhaseLen);
	printf("MapTable[0] %x \n",(int)MapTable[0]);
	printf("MapTable[1] %x \n",(int)MapTable[1]);
	printf("MapTable[2] %x \n",(int)MapTable[2]);
	printf("MapTable[3] %x \n",(int)MapTable[3]);
	printf("MapTable[4] %x \n",(int)MapTable[4]);
	printf("MapTable[5] %x \n",(int)MapTable[5]);
	printf("MapTable[6] %x \n",(int)MapTable[6]);
	printf("MapTable[7] %x \n",(int)MapTable[7]);*/

while(1){
	//init_serial();
	TMOD |= 0x01;	// Timer 0, Mode 1, 16-bit timer
	TR0 = 0;		// Disable timer 0
	IT1 = 0x01;	//External interrupt1 active falling edge
	IE	= 0x96; //10010110//enable global,External interupt1 and interrupt Timer0
	
	printf("enter setpoint \n");
	TI =0;
	loop = 0;
	while(get_data(set_p));
	//printf("Setpoint = ",co);
	EA = 0;
	temp1 = Read_Temp(secode1);
	EA = 1;
	EA = 0;
	temp2 = Read_Temp(secode2);
	EA = 0;

		err2 = set_p[0] - temp2;
		for (i=0;i<100;i++)
			for (j=0;j<1000;j++);

			while(1) {
				//ES = 0;
				EA = 0;
				CH=1;
				temp1 = Read_Temp(secode1);
				EA =1;
				//TI = 1;
				printf("Temp1 %d degrees C \n",(int)temp1);
				TI =0;
				EA =0;
				CH=1;
				temp2 = Read_Temp(secode2);
				EA =1;
				printf("Temp2 %d degrees C \n",(int)temp2);
				TI =0;
					err1 = err2; 
					err2 = set_p[0] - temp2;
		 	    	c_err = err2 -err1;
				//ES = 1;
					//if (!RI)
						//{
						
						printf("Setpoint = %d degrees C\n",(int)set_p[0]);
						TI =0;
						///////////////////////
						if ((err2 < -4) && (c_err == -2))
							{
								CHLevel = 0 ;
								printf("CHLevel 0 \n");
								TI =0;
							}
						if ((err2 < -4) && (c_err == -1))
							{
								CHLevel = 0 ;
								printf("CHLevel 0 \n");
								TI =0;
							}
						if ((err2 < -4) && (c_err == 0))
							{
								CHLevel = 0 ;
								printf("CHLevel 0 \n");
								TI =0;
							}
						if ((err2 < -4) && (c_err == 1))
							{
								CHLevel = 0 ;
								printf("CHLevel 0 \n");
								TI =0;
							}
						if ((err2 < -4) && (c_err == 2))
							{
								CHLevel = 0 ;
								printf("CHLevel 0 \n");
								TI =0;
							}
					///////////////////////////
						if ((err2 == -4) && (c_err == -2))
							{
								CHLevel = 0 ;
								printf("CHLevel 0 \n");
								TI =0;
							}
						if ((err2 == -4) && (c_err == -1))
							{
								CHLevel = 0 ;
								printf("CHLevel 0 \n");
								TI =0;
							}
						if ((err2 == -4) && (c_err == 0))
							{
								CHLevel = 0 ;
								printf("CHLevel 0 \n");
								TI =0;
							}
						if ((err2 == -4) && (c_err == 1))
							{
								CHLevel = 0 ;
								printf("CHLevel 0 \n");
								TI =0;
							}
						if ((err2 == -4) && (c_err == 2))
							{
								CHLevel = 1 ;
								printf("CHLevel 1 \n");
								TI =0;
							}
					//////////////////////////////////
						if ((err2 == -3) && (c_err == -2))
							{
								CHLevel = 0 ;
								printf("CHLevel 0 \n");
								TI =0;
							}
						if ((err2 == -3) && (c_err == -1))
							{
								CHLevel = 0 ;
								printf("CHLevel 0 \n");
								TI =0;
							}
						if ((err2 == -3) && (c_err == 0))
							{
								CHLevel = 0 ;
								printf("CHLevel 0 \n");
								TI =0;
							}
						if ((err2 == -3) && (c_err == 1))
							{
								CHLevel = 0 ;
								printf("CHLevel 0 \n");
								TI =0;
							}
						if ((err2 == -3) && (c_err == 2))
							{
								CHLevel = 1 ;
								printf("CHLevel 1 \n");
								TI =0;
							}
					///////////////////////
						if ((err2 == -2) && (c_err == -2))
							{
								CHLevel = 0 ;
								printf("CHLevel 0 \n");
								TI =0;
							}
						if ((err2 == -2) && (c_err == -1))
							{
								CHLevel = 1 ;
								printf("CHLevel 1 \n");
								TI =0;
							}
						if ((err2 == -2) && (c_err == 0))
							{
								CHLevel = 1 ;
								printf("CHLevel 1 \n");
								TI =0;
							}
						if ((err2 == -2) && (c_err == 1))
							{
								CHLevel = 1 ;
								printf("CHLevel 1 \n");
								TI =0;
							}
						if ((err2 == -2) && (c_err == 2))
							{
								CHLevel = 2 ;
								printf("CHLevel 2 \n");
								TI =0;
							}
					///////////////////////
						if ((err2 == -1) && (c_err == -2))
							{
								CHLevel = 1 ;
								printf("CHLevel 1 \n");
								TI =0;
							}
						if ((err2 == -1) && (c_err == -1))
							{
								CHLevel = 2 ;
								printf("CHLevel 2 \n");
								TI =0;
							}
						if ((err2 == -1) && (c_err == 0))
							{
								CHLevel = 2 ;
								printf("CHLevel 2 \n");
								TI =0;
							}
						if ((err2 == -1) && (c_err == 1))
							{
								CHLevel = 2 ;
								printf("CHLevel 2 \n");
								TI =0;
							}
						if ((err2 == -1) && (c_err == 2))
							{
								CHLevel = 3 ;
								printf("CHLevel 3 \n");
								TI =0;
							}
					///////////////////////////
						if ((err2 == 0) && (c_err == -2))
							{
								CHLevel = 2 ;
								printf("CHLevel 2 \n");
								TI =0;
							}
						if ((err2 == 0) && (c_err == -1))
							{
								CHLevel = 3 ;
								printf("CHLevel 3 \n");
								TI =0;
							}
						if ((err2 == 0) && (c_err == 0))
							{
								CHLevel = 3 ;
								printf("CHLevel 3 \n");
								TI =0;
							}
						if ((err2 == 0) && (c_err == 1))
							{
								CHLevel = 3 ;
								printf("CHLevel 3 \n");
								TI =0;
							}
						if ((err2 == 0) && (c_err == 2))
							{
								CHLevel = 4 ;
								printf("CHLevel 4 \n");
								TI =0;
							}
					////////////////////////
						if ((err2 == 1) && (c_err == -2))
							{
								CHLevel = 3 ;
								printf("CHLevel 3 \n");
								TI =0;
							}
						if ((err2 == 1) && (c_err == -1))
							{
								CHLevel = 4 ;
								printf("CHLevel 4 \n");
								TI =0;
							}
						if ((err2 == 1) && (c_err == 0))
							{
								CHLevel = 4 ;
								printf("CHLevel 4 \n");
								TI =0;
							}
						if ((err2 == 1) && (c_err == 1))
							{
								CHLevel = 4 ;
								printf("CHLevel 4 \n");
								TI =0;
							}
						if ((err2 == 1) && (c_err == 2))
							{
								CHLevel = 5 ;
								printf("CHLevel 5 \n");
								TI =0;
							}
					//////////////////////////	
						if ((err2 == 2) && (c_err == -2))
							{
								CHLevel = 4 ;
								printf("CHLevel 4 \n");
								TI =0;
							}
						if ((err2 == 2) && (c_err == -1))
							{
								CHLevel = 5 ;
								printf("CHLevel 5 \n");
								TI =0;
							}
						if ((err2 == 2) && (c_err == 0))
							{
								CHLevel = 5 ;
								printf("CHLevel 5 \n");
								TI =0;
							}
						if ((err2 == 2) && (c_err == 1))
							{
								CHLevel = 5 ;
								printf("CHLevel 5 \n");
								TI =0;
							}
						if ((err2 == 2) && (c_err == 2))
							{
								CHLevel = 6 ;
								printf("CHLevel 6 \n");
								TI =0;
							}
					/////////////////////////////	
						if ((err2 == 3) && (c_err == -2))
							{
								CHLevel = 5 ;
								printf("CHLevel 5 \n");
								TI =0;
							}
						if ((err2 == 3) && (c_err == -1))
							{
								CHLevel = 6 ;
								printf("CHLevel 6 \n");
								TI =0;
							}
						if ((err2 == 3) && (c_err == 0))
							{
								CHLevel = 6;
								printf("CHLevel 6 \n");
								TI =0;
							}
						if ((err2 == 3) && (c_err == 1))
							{
								CHLevel = 6 ;
								printf("CHLevel 6 \n");
								TI =0;
							}
						if ((err2 == 3) && (c_err == 2))
							{
								CHLevel = 7 ;
								printf("CHLevel 7 \n");
								TI =0;
							}
					///////////////////////
						if ((err2 == 4) && (c_err == -2))
							{
								CHLevel = 6 ;
								printf("CHLevel 6 \n");
								TI =0;
							}
						if ((err2 == 4) && (c_err == -1))
							{
								CHLevel = 6 ;
								printf("CHLevel 6 \n");
								TI =0;
							}
						if ((err2 == 4) && (c_err == 0))
							{
								CHLevel = 7 ;
								printf("CHLevel 7 \n");
								TI =0;
							}
						if ((err2 == 4) && (c_err == 1))
							{
								CHLevel = 7 ;
								printf("CHLevel 7 \n");
								TI =0;
							}
						if ((err2 == 4) && (c_err == 2))
							{
								CHLevel = 7 ;
								printf("CHLevel 7 \n");
								TI =0;
							}
					/////////////////////////////	
						if ((err2 > 4) && (c_err == -2))
							{
								CHLevel = 6 ;
								printf("CHLevel 6 \n");
								TI =0;
							}
						if ((err2 > 4) && (c_err == -1))
							{
								CHLevel = 7 ;
								printf("CHLevel 7 \n");
								TI =0;
							}
						if ((err2 > 4) && (c_err == 0))
							{
								CHLevel = 7 ;
								printf("CHLevel 7 \n");
								TI =0;
							}
						if ((err2 > 4) && (c_err == 1))
							{
								CHLevel = 7 ;
								printf("CHLevel 7 \n");
								TI =0;
							}
						if ((err2 > 4) && (c_err == 2))
							{
								CHLevel = 7 ;
								printf("CHLevel 7 \n");
								TI =0;
							}
					//////////////////////////////	
						if ((temp1 - temp2 ) > (1))
							{
								fan_2();
								printf("Fan2 \n\n");
								TI =0;
							} 
						if ((temp2 - temp1 ) > (1))
						{
							fan_1();
							printf("Fan1 \n\n");
							TI =0;
						}
						if (abs(temp1 - temp2 ) <= (1))
						{
							fan_s();
							printf("Stop \n\n");
							TI =0;
						}
						if (((temp1-set_p[0]) > (1)) || ((temp2-set_p[0]) > (1)))
						{
							fan_1();
							fan_2();
							printf("Fan1 and Fan2 \n\n");
							TI =0;
						}
						//Read_ROM();
						for (i=0;i<200;i++)						
							for (j=0;j<1000;j++);
			//}
						if (RI && (SBUF == 'r')) 
						{
						break;
						}
						else
						RI = 0;
	}
}	
}



