 #include <REG2051.H>
 #include<stdio.h>
 #include<intrins.h>

sbit start = P1^7;
sbit out1 = P1^0;
sbit out2 = P1^1;
sbit out3 = P1^2;
sbit out4 = P1^3;
sbit out5 = P1^4;
sbit out6 = P1^5;
sbit out7 = P1^6;
sbit out8 = P1^7;

unsigned long   temp1;
unsigned long  temp2;	
unsigned int      T,freq;

void demsec (unsigned int count)
	{ 
		unsigned char i;
		while(count)
		{		
		for(i=1;i<152;i++);
		count--;
	    }
   }
 
void main(void)
{
     
	SCON=0x52;    // rs232
	TMOD=0x22;    // auto relood timmer 0
	TH1=0xfd;          //11.059 
	TR1=1;
//------int  timer0 set ----------------
   TH0=0x00;    // 100 usec  11.059 * 2 
   TL0=0x00;
   TR0=1;
   ET0=0;    
//------ int EX0 --P3.2-------------------
   EX0=1;
   IT0=1;
   EA=1;  //----int all

    while(1)

	{ 
		 temp2 = temp2 * 0x100;
	     T = temp2 | temp1;
		 freq=1/T;
		 demsec(200);

		  if((freq>500)&(freq <510)) {out7=0;}   //1125
		  if((freq>530)&(freq <540)) {out7=1;}    //1145

		  if((freq>560)&(freq <570)) {out6=0;}  //1165
		  if((freq>580)&(freq < 590)) {out6=1;}  //1185

		  if((freq>600)&(freq < 610)) {out5=0;}  //1205
		  if((freq>620)&(freq < 630)) {out5=1;}  //1225

		  if((freq>640)&(freq <650)) {out4=0;}  //1245
		  if((freq>660)&(freq <670)) {out4=1;}  //1265

		  if((freq>680)&(freq < 690)) {out3=0;}  //1285
		  if((freq>700)&(freq < 710)) {out3=1;}  //1305

		  if((freq>720)&(freq < 730)) {out2=0;}  //1325
		  if((freq>740)&(freq < 750)) {out2=1;}  //1345

		  if((freq>760)&(freq < 770)) {out1=0;}  //1365
		  if((freq>780)&(freq < 790)) {out1=1;}  //1385

		  if((freq>800)&(freq < 810)) {out8=0;}  //1405
		  if((freq>820)&(freq < 830)) {out8=1;}  //1425

    }     

}
// int t0---------------------------------------------------
void Ex0(void) interrupt 0
{
     
         round_count_low=TL0;
         round_count_high=TH0; 
         TL0=0x00;
         TH0=0x00;
}

//--int1 ----------------------------------------------------

void timer0(void) interrupt 1
{     
  
}

