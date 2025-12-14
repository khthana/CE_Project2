#pragma	SMALL
#pragma	CODE DEBUG

#include	"c:\c51\inc\reg51.h"

//////////////////////////////////////////////////////////////////
//define I2C operation
//////////////////////////////////////////////////////////////////
#ifndef READ
    #define	READ	1
#endif

#ifndef WRITE
    #define	WRITE	0
#endif
#define	I2CGetByte()		_I2CGetByte(0)
#define	I2CGetLastByte()	_I2CGetByte(1)

#define ADDRESS		0x06
#define I2CEEPROM	0xA0
#define CONTROLLER	0x55

#define GET_DATA		0x01
#define GET_LENGTH_US01	0x02
#define GET_LENGTH_US02	0x03
#define ENA_INT			0x11
#define DIS_INT			0x12
#define TEST_DATA		0x55

#define MAX_LENGTH		150
#define PULSE_ACTIVE	15
#define DELAY_CAPTION	0x40
#define TIMEOUT			0xFF
sbit	IN1  = P2^0;
sbit	OUT1 = P2^1;
sbit	IN2  = P2^2;
sbit	OUT2 = P2^3;
sbit	TEST1 = P2^4;
sbit	TEST2 = P2^5;

//////////////////////////////////////////////////////////////////
//define port
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

unsigned char length01;
unsigned char length02;

unsigned char countdown;
unsigned char enable_interrupt;

//////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
//define i2c
//////////////////////////////////////////////////////////////////
unsigned char	TempDelay;
unsigned	char _i2c_error;      // bit array of error types
#define I2CReceiveCode	I2CReceiveDataByte

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

//////////////////////////////////////////////////////////////////
//----------------- I2C Routine ------------------------
//////////////////////////////////////////////////////////////////
void _I2CBitDelay(void)         // wait 4.7uS, or thereabouts
{                             // tune to xtal. This works at 11.0592MHz
	TempDelay = 0;
	TempDelay = 0;
	TempDelay = 0;
	TempDelay = 0;
	return;
}

void _I2CSCLHigh(void)        // set SCL high, and wait for it to go high
{
	register int err;
	SCL_PIN = 1;
	while (!SCL_PIN)
	{
		err++;
		if (!err)
		{
			_i2c_error &= 0x02;     // SCL stuck, something's holding it down
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
    _I2CBitDelay();
    SCL_PIN = 0;
    _I2CBitDelay();
	bt = bt << 1;
  }
  SDA_PIN = 1;                       // listen for ACK
  _I2CSCLHigh();
  _I2CBitDelay();
  if (SDA_PIN)
    _i2c_error &= 0x01;          // ack didn't happen, may be nothing out there
  SCL_PIN = 0;
  _I2CBitDelay();
}

void I2CSendAddr(unsigned char addr, unsigned char rd)
{
  SCL_PIN = 1;
  _I2CBitDelay();
  SDA_PIN = 0;               // generate start
  _I2CBitDelay();
  SCL_PIN = 0;
  _I2CBitDelay();
  I2CSendByte(addr+rd);  // send address byte
}

void I2CSendStop(void)
{
	SDA_PIN = 0;
	_I2CBitDelay();
	_I2CSCLHigh();
	_I2CBitDelay();
	SDA_PIN = 1;
	_I2CBitDelay();
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

void int0_int(void) interrupt 0
{
	unsigned char res;
	ACK = 0;
	command = I2CReceiveCode();
	switch (command)
	{
	case GET_DATA :
				//delay(10,10);
				WriteI2C(CONTROLLER,length01);
				delay(10,10);
				WriteI2C(CONTROLLER,length02);
				break;
	case GET_LENGTH_US01 :
				WriteI2C(CONTROLLER,length01);
				break;
	case GET_LENGTH_US02 :
				WriteI2C(CONTROLLER,length02);
				break;
	case TEST_DATA :
				WriteI2C(CONTROLLER,'k');
				delay(10,10);
				WriteI2C(CONTROLLER,'o');
				break;
	case ENA_INT :
				enable_interrupt = 1;
				break;
	case DIS_INT :
				enable_interrupt = 0;
				break;
	}
	delay(10,10);
	while (!INT) {}
	ACK = 1;
}

//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

void main()
{
	unsigned char temp01;
	unsigned char temp02;
	unsigned char flag01;
	unsigned char flag02;
	bit temp_out1;
	bit temp_out2;
	// initial data
	P0 = 0xff;
	P1 = 0xff;
	P2 = 0xff;
	P3 = 0xff;

	IN1 = 0;
	IN2 = 0;

	length01 = 0;
	length02 = 0;

	flag01 = 0;
	flag02 = 0;

	countdown = 0;
	enable_interrupt = 0;

//	TMOD = 0x22;
//	TH0  = 0x00;
	IT0  = 1;
//	TR0  = 1;
	IE   = 0x81;	//	1000 0011 enable timer0 and interrupt0


	while (1)
	{
		temp01 = 0;
		IN1 = 1;
		while (OUT1 && (temp01 < MAX_LENGTH))
		{
			temp01++;
			if (IN1 && (temp01 > PULSE_ACTIVE)) IN1 = 0;
		}
		if (temp01 < MAX_LENGTH)
		{
			flag01 = 0;
			length01 = temp01;
		}
		else
		{
			flag01++;
			if (flag01 > DELAY_CAPTION)
			{
				length01 = 0;
				flag01 = 0;
			}
		}
		IN1 = 0;

		temp02 = 0;
		IN2 = 1;
		while (OUT2 && (temp02 < MAX_LENGTH))
		{
			temp02++;
			if (IN2 && (temp02 > PULSE_ACTIVE)) IN2 = 0;
		}
		if (temp02 < MAX_LENGTH)
		{
			flag02 = 0;
			length02 = temp02;
		}
		else
		{
			flag02++;
			if (flag02 > DELAY_CAPTION)
			{
				length02 = 0;
				flag02 = 0;
			}
		}
		IN1 = 0;

/////////////////////////////////////////////
//enable interrupt
/////////////////////////////////////////////

		if (enable_interrupt && ACK)
		{
			if ((length01 != 0) || (length02 != 0))
//			if ((OUT1 == 0) || (OUT2 == 0))
			{
				IN_INT = 0;
				ACK = 1;
				countdown = 0;
				while (ACK && (countdown < TIMEOUT)) {countdown++;}
				if (countdown < TIMEOUT)
				{
					WriteI2C(CONTROLLER,ADDRESS);
					delay(50,50);
					WriteI2C(CONTROLLER,length01);
					WriteI2C(CONTROLLER,length02);
					IN_INT = 1;
					while (!ACK) {}
				}
				else IN_INT = 1;
			}
		}
	}
}