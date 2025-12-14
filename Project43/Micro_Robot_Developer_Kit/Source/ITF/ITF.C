#pragma	SMALL
#pragma	CODE DEBUG

#include	"c:\c51\inc\reg51.h"

//////////////////////////////////////////////////////////////////
//define address module
//////////////////////////////////////////////////////////////////
//#define		DC_MOTOR		0x72	//0111 0010	//interrupt t1
//#define		STEPPING_MOTOR	0x72	//0111 0010	//interrupt t1
//#define		INFRARED		0x74	//0111 0100	//interrupt int1
//#define		ULTRASONIC		0x76	//0111 0110	//interrupt int0
//#define		INTERFACE		0x78	//0111 1000	//interrupt t0
//#define		OTHER			0x7a	//0111 1010	//interrupt t2
//#define		OTHER			0x7c	//0111 1100	//interrupt t2ex

//////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////
//define I2C operation
//////////////////////////////////////////////////////////////////
#ifndef READ
    #define	READ	1
#endif

#ifndef WRITE
    #define	WRITE	0
#endif

#define ADDRESS		0x08

#define WRITE_CHAR	0x01
#define GOTO_XY		0x02
#define CLEAR_LCD	0x03

//#define VOLUME		0x04
#define FREQUENCY	0x05
#define OFF_FREQ	0x06

#define GET_KEY		0x07
#define SCAN_KEY	0x08


//////////////////////////////////////////////////////////////////
// define port for interface module
//////////////////////////////////////////////////////////////////
sbit	D0	=	P0^0;
sbit	D1	=	P0^1;
sbit	D2	=	P0^2;
sbit	D3	=	P0^3;
sbit	D4	=	P0^4;
sbit	D5	=	P0^5;
sbit	D6	=	P0^6;
sbit	D7	=	P0^7;

sbit	EN	=	P1^5;
sbit	RS	=	P1^6;
sbit	LIGHT		=	P1^4;
sfr		LCD_DATA	=	0x80;

sbit	SPEAKER		=	P1^7;

sbit	COL1	=	P2^1;
sbit	COL2	=	P2^2;
sbit	COL3	=	P2^3;
sbit	ROW1	=	P2^4;
sbit	ROW2	=	P2^5;
sbit	ROW3	=	P2^6;
sbit	ROW4	=	P2^7;

//////////////////////////////////////////////////////////////////
//define port standard
//////////////////////////////////////////////////////////////////
sbit	SCL_PIN = P1^0;
sbit	SDA_PIN = P1^1;

sbit	IN_INT = P1^2;

sbit	INT = P3^2;
sbit	ACK = P3^3;

//////////////////////////////////////////////////////////////////
//define general variable
//////////////////////////////////////////////////////////////////
unsigned char	command;
unsigned char	current_cursor;
unsigned int	freq = 0;
unsigned int	count_timer = 0;
#define	CONST_TIMER		500
unsigned int	count_period = 0;
#define	CONST_PERIOD	10

//////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////
//define i2c
//////////////////////////////////////////////////////////////////
unsigned char	TempDelay;
unsigned	char _i2c_error;      // bit array of error types
#define I2CReceiveCode I2CReceiveDataByte
//////////////////////////////////////////////////////////////////
//define general routine
//////////////////////////////////////////////////////////////////
void delay(unsigned char count1,unsigned char count2)
{
	unsigned char	xx,yy;
	for (xx=0;xx<count1;xx++)
	{
		for (yy=0;yy<count2;yy++)
		{
		}
	}
}
//////////////////////////////////////////////////////////////////

//----------------- I2C Routine ------------------------

void _I2CBitDly(void)         // wait 4.7uS, or thereabouts
{                             // tune to xtal. This works at 11.0592MHz
//      asm("   NOP");              // delay is 5.4uS, only 4.3uS without
	TempDelay = 0;
	TempDelay = 0;
	TempDelay = 0;
	TempDelay = 0;
	return;
}

void _I2CSCLHigh(void)        // set SCL_PIN high, and wait for it to go high
{
  register int err;
  SCL_PIN = 1;
  while (! SCL_PIN)
  {
    err++;
    if (!err)
    {
      _i2c_error += 0x02;     // SCL_PIN stuck, something's holding it down
      return;
    }
  }
}

void _I2CSlaveStop(void)
{
	while (SDA_PIN) {}
	while (!SCL_PIN) {}
	while (!SDA_PIN) {}
}

unsigned char _I2CReceiveByte(void) // lastone == 1 for last unsigned char
{
	register unsigned char i, res;
	res = 0;
	SCL_PIN = 1;
	for (i=0;i<8;i++)         // each bit at a time, MSB first
	{
		while (!SCL_PIN) {}
		res *= 2;
 		if (SDA_PIN)
		{
			res++;
		}
		while (SCL_PIN) {}
	}
	SDA_PIN = 0;         // send ACK according to 'lastone'
	while (!SCL_PIN) {}
	while (SCL_PIN) {}
	SDA_PIN = 1;
	SCL_PIN = 1;
	return res;
}

void I2CSendByte(unsigned char bt)
{
  register unsigned char i;
  for (i=0; i<8; i++)
  {
    if (bt & 0x80) SDA_PIN = 1;      // send each bit, MSB first
    else SDA_PIN = 0;
    _I2CSCLHigh();
    _I2CBitDly();
    SCL_PIN = 0;
    _I2CBitDly();
    bt = bt << 1;
  }
  SDA_PIN = 1;                       // listen for ACK
  _I2CSCLHigh();
  _I2CBitDly();
  if (SDA_PIN)
    _i2c_error &= 0x01;          // ack didn't happen, may be nothing out there
  SCL_PIN = 0;
  _I2CBitDly();
}

void I2CSendAddr(unsigned char addr, unsigned char rd)
{
  SCL_PIN = 1;
  _I2CBitDly();
  SDA_PIN = 0;               // generate start
  _I2CBitDly();
  SCL_PIN = 0;
  _I2CBitDly();
  I2CSendByte(addr+rd);  // send address byte
}

void I2CSendStop(void)
{
	SDA_PIN = 0;
	_I2CBitDly();
	_I2CSCLHigh();
	_I2CBitDly();
	SDA_PIN = 1;
	_I2CBitDly();
}

unsigned char I2CReceiveDataByte(void)
{
	unsigned char address,ret;

	while ((SDA_PIN)&&(SCL_PIN)) {}
	if ((!SDA_PIN) && (SCL_PIN))
	{
		while (SCL_PIN) {}
		address = _I2CReceiveByte();
		if (address == ADDRESS)
		{
			ret = _I2CReceiveByte();
			_I2CSlaveStop();
		}
		else
			ret = 0x00;
	}
	return ret;
}

void WriteI2C(unsigned char Addr, unsigned char Data)
{
	I2CSendAddr(Addr, WRITE);
	I2CSendByte(Data);
	I2CSendStop();
}

void clear_lcd(void)
{
	RS = 0;
	LCD_DATA = 0x01;	//clear display
	current_cursor = 0x00;
	EN = 1;
	EN = 0;
	delay(1,255);
}

void gohome_lcd(void)
{
	RS = 0;
	LCD_DATA = 0x02;
	current_cursor = 0x00;
	EN = 1;
	EN = 0;
	delay(1,255);
}

void onoff_lcd(unsigned char on,unsigned char cursor,unsigned char blink)
{
	RS = 0;
	LCD_DATA = 0x08;
	D2 = on;
	D1 = cursor;
	D0 = blink;
	EN = 1;
	EN = 0;
	delay(1,50);
}

void init_lcd(void)
{
	clear_lcd();
	onoff_lcd(1,1,1);
	RS = 0;
	LCD_DATA = 0x38;	//set 2 line display and show blink cursor
	EN = 1;
	EN = 0;
	delay(1,50);
}

void write_char(unsigned char ch)
{
	if (current_cursor == 0x10)
	{
		current_cursor = 0x40;
	}
	if (current_cursor == 0x50)
	{
		clear_lcd();
	}

	RS = 0;
	LCD_DATA = 0x80;
	LCD_DATA = LCD_DATA | current_cursor;
	EN = 1;
	EN = 0;
	delay(1,50);
	
	RS = 1;
	LCD_DATA = ch;
	EN = 1;
	EN = 0;
	delay(1,50);

	current_cursor++;
}

void goto_xy(unsigned char x,unsigned char y)
{
	RS = 0;
	LCD_DATA = 0x80;
	if (x < 1)  x = 1;
	if (y < 1)  y = 1;
	if (x > 16) x = 16;
	if (y > 2)  y = 2;

	if (y == 1)
		current_cursor = 0x00;
	else
		current_cursor = 0x40;

	current_cursor += x;
	current_cursor--;
	LCD_DATA = LCD_DATA | current_cursor;

	EN = 1;
	EN = 0;
	delay(1,50);
}


unsigned char scan_key(void)
{
	unsigned char ch = 0xFF;
	COL1 = 0;	COL2 = 0;	COL3 = 0;
	if (ROW1 == 0)
	{
		COL1 = 0;	COL2 = 1;	COL3 = 1;
		if (ROW1 == 0)
			{
			ch = '#';
		}
		COL1 = 1;	COL2 = 0;	COL3 = 1;
		if (ROW1 == 0)
		{
			ch = '0';
		}
		COL1 = 1;	COL2 = 1;	COL3 = 0;
		if (ROW1 == 0)
		{
			ch = '*';
		}
	} else
	if (ROW2 == 0)
	{
		COL1 = 0;	COL2 = 1;	COL3 = 1;
		if (ROW2 == 0)
		{
			ch = '9';
		}
		COL1 = 1;	COL2 = 0;	COL3 = 1;
		if (ROW2 == 0)
		{
			ch = '8';
		}
		COL1 = 1;	COL2 = 1;	COL3 = 0;
		if (ROW2 == 0)
		{
			ch = '7';
		}
	} else
	if (ROW3 == 0)
	{
		COL1 = 0;	COL2 = 1;	COL3 = 1;
		if (ROW3 == 0)
		{
			ch = '6';
		}
		COL1 = 1;	COL2 = 0;	COL3 = 1;
		if (ROW3 == 0)
		{
			ch = '5';
		}
		COL1 = 1;	COL2 = 1;	COL3 = 0;
		if (ROW3 == 0)
		{
			ch = '4';
		}
	} else
	if (ROW4 == 0)
	{
		COL1 = 0;	COL2 = 1;	COL3 = 1;
		if (ROW4 == 0)
		{
			ch = '3';
		}
		COL1 = 1;	COL2 = 0;	COL3 = 1;
		if (ROW4 == 0)
		{
			ch = '2';
		}
		COL1 = 1;	COL2 = 1;	COL3 = 0;
		if (ROW4 == 0)
		{
			ch = '1';
		}
	}
	COL1 = 1;	COL2 = 1;	COL3 = 1;
	return ch;
}

void gen_freq(unsigned int freq)
{
	count_timer = 0;
	count_period = 0;
	TR0 = 1;
}

void stop_freq(void)
{
	TR0 = 0;
}

void timer0_int(void) interrupt 1
{
	bit	temp;
	TR0 = 0;
	if (count_period < CONST_PERIOD)
	{
		count_period++;
	}
	else
	{
		SPEAKER = !SPEAKER;
		count_period = 0;
	}
	TR0 = 1;
/*	if (count_timer < freq)
	{
		count_timer++;
		temp = 1;
	}
	else
	{
		SPEAKER != SPEAKER;
		count_timer = 0;
		count_period++;
		if (count_period < CONST_PERIOD)
		{
			count_period++;
			temp = 1;
		}
		else
		{
			count_period = 0;
			freq = 0;
			temp = 0;
		}
	}
	TR0 = temp;*/
}

void int0_int(void) interrupt 0
{
	unsigned char temp1,temp2;
	unsigned int temp_int;
	ACK = 0;
	command = I2CReceiveCode();
	switch (command)
	{
	case WRITE_CHAR :	temp1 = I2CReceiveDataByte();
						write_char(temp1);
						break;

	case GOTO_XY	: 
						temp1 = I2CReceiveDataByte();
						temp2 = I2CReceiveDataByte();
						goto_xy(temp1,temp2);
						break;

	case CLEAR_LCD	:	clear_lcd();
						break;

	case FREQUENCY	:	temp1 = I2CReceiveDataByte();	//high byte
						temp2 = I2CReceiveDataByte();	//low byte
						temp_int = temp1;
						temp_int <<= 8;
						temp_int += temp2;
						goto_xy(1,2);
						gen_freq(temp_int);
						break;

	case OFF_FREQ	:	stop_freq();
						break;

	case GET_KEY	:	temp1 = 0xFF;
						while (temp1 == 0xFF)
						{
							temp1 = scan_key();
						}
						WriteI2C(0x55,temp1);
						break;

	case SCAN_KEY	:	temp1 = scan_key();
						WriteI2C(0x55,temp1);
						break;
	}
	while (INT == 0) {}
	ACK = 1;
}

//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
void main()
{
	unsigned char i = 0;
	// initial data
	P0 = 0xff;
	P1 = 0xff;
	P2 = 0xff;
	P3 = 0xff;

	init_lcd();

	TMOD = 0x22;	//	timer1 8bit auto reload - timer0 8bit autoreload
	TH0  = 6;		//	timer0 count lo value

	TR0  = 0;		//	enable timer0
	IT0  = 1;		//level interrupt type

	IE   = 0x83;	//1000 0011 enable int0 and timer0

	while (1)
	{
	}
}