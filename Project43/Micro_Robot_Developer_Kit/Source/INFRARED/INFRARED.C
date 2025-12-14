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
//#define	I2CGetByte()		_I2CGetByte(0)
//#define	I2CGetLastByte()	_I2CGetByte(1)

#define	TIMEOUT		0XFF
#define ADDRESS		0x04
#define I2CEEPROM	0xA0
#define CONTROLLER	0x55

#define GET_IR01	0x01
#define GET_IR02	0x02
#define GET_IR03	0x03
#define GET_IR04	0x04
#define GET_IR05	0x05
#define GET_IR06	0x06
#define GET_IR07	0x07
#define GET_IR08	0x08
#define GET_IR09	0x09
#define GET_IR10	0x0A
#define GET_IR11	0x0B
#define GET_IR12	0x0C
#define GET_STATUS	0x0F
#define ENA_INT		0x11
#define DIS_INT		0x12
#define TEST_DATA	0x55

// dc motor module	/////////////////////////////////
sbit	IN01 = P2^0;
sbit	IN02 = P2^3;
sbit	IN03 = P0^4;
sbit	IN04 = P0^7;
sbit	IN05 = P0^0;
sbit	IN06 = P0^2;
sbit	IN07 = P2^1;
sbit	IN08 = P2^2;
sbit	IN09 = P0^5;
sbit	IN10 = P0^6;
sbit	IN11 = P0^1;
sbit	IN12 = P0^3;

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
unsigned char	i = 48;
unsigned char	enable_interrupt;
//////////////////////////////////////////////////////////////////

bdata	unsigned char output_hi;
bdata	unsigned char output_lo;

sbit	out_11 = output_hi^3;
sbit	out_10 = output_hi^2;
sbit	out_09 = output_hi^1;
sbit	out_08 = output_hi^0;
sbit	out_07 = output_lo^7;
sbit	out_06 = output_lo^6;
sbit	out_05 = output_lo^5;
sbit	out_04 = output_lo^4;
sbit	out_03 = output_lo^3;
sbit	out_02 = output_lo^2;
sbit	out_01 = output_lo^1;
sbit	out_00 = output_lo^0;

//////////////////////////////////////////////////////////////////
//define i2c
//////////////////////////////////////////////////////////////////
unsigned char	TempDelay;
unsigned	char _i2c_error = 0;      // bit array of error types
#define I2CReceiveCode()	I2CReceiveDataByte()

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
    _i2c_error += 0x01;          // ack didn't happen, may be nothing out there
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
	ACK = 0;
	command = I2CReceiveCode();
//	WriteI2C(0x55,i);
//	i++;
	switch (command)
	{
	case GET_IR01 : WriteI2C(CONTROLLER,(unsigned char)IN01); break;
	case GET_IR02 : WriteI2C(CONTROLLER,(unsigned char)IN02); break;
	case GET_IR03 : WriteI2C(CONTROLLER,(unsigned char)IN03); break;
	case GET_IR04 : WriteI2C(CONTROLLER,(unsigned char)IN04); break;
	case GET_IR05 : WriteI2C(CONTROLLER,(unsigned char)IN05); break;
	case GET_IR06 : WriteI2C(CONTROLLER,(unsigned char)IN06); break;
	case GET_IR07 : WriteI2C(CONTROLLER,(unsigned char)IN07); break;
	case GET_IR08 : WriteI2C(CONTROLLER,(unsigned char)IN08); break;
	case GET_IR09 : WriteI2C(CONTROLLER,(unsigned char)IN09); break;
	case GET_IR10 : WriteI2C(CONTROLLER,(unsigned char)IN10); break;
	case GET_IR11 : WriteI2C(CONTROLLER,(unsigned char)IN11); break;
	case GET_IR12 : WriteI2C(CONTROLLER,(unsigned char)IN12); break;
	case GET_STATUS :
					output_hi = 0x00;
					output_lo = 0x00;
					out_00 = IN01;	out_01 = IN02;
					out_02 = IN03;	out_03 = IN04;
					out_04 = IN05;	out_05 = IN06;
					out_06 = IN07;	out_07 = IN08;
					out_08 = IN09;	out_09 = IN10;
					out_10 = IN11;	out_11 = IN12;

					WriteI2C(CONTROLLER,output_hi);
					delay(10,10);
					WriteI2C(CONTROLLER,output_lo);
					break;
	case TEST_DATA :
					WriteI2C(CONTROLLER,107);	//ascii = 107	hex = 6B	char = 'k'
					delay(10,10);
					WriteI2C(CONTROLLER,111);	//ascii = 111	hex = 6F	char = 'o'
					break;
	case ENA_INT :	enable_interrupt = 1;
					break;
	case DIS_INT :	enable_interrupt = 0;
					break;
	}
	delay(10,50);
	while (!INT) {}
	ACK = 1;
}

//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
void main()
{
	unsigned char countdown = 0;
	// initial data
	P0 = 0xff;
	P1 = 0xff;
	P2 = 0xff;
	P3 = 0xff;

	IT0  = 1;		//level interrupt type
	IE   = 0x81;	//1000 0001 enable int0
	enable_interrupt = 0;

	while (1)
	{
		if (enable_interrupt && ACK && IN_INT)
		{
			if ((P0 != 0xFF) || (!IN01) || (!IN02) || (!IN07) || (!IN08))
			{
				ACK = 0;
				output_hi = 0x00;
				output_lo = 0x00;
				out_00 = IN01;	out_01 = IN02;
				out_02 = IN03;	out_03 = IN04;
				out_04 = IN05;	out_05 = IN06;
				out_06 = IN07;	out_07 = IN08;
				out_08 = IN09;	out_09 = IN10;
				out_10 = IN11;	out_11 = IN12;

				I2CSendAddr(I2CEEPROM,WRITE);
				I2CSendByte(ADDRESS);		//address of infrared module on at24c01
				I2CSendByte(output_hi);
				I2CSendStop();
				I2CSendAddr(I2CEEPROM,WRITE);
				I2CSendByte(ADDRESS+1);	//address of infrared module on at24c01
				I2CSendByte(output_lo);
				I2CSendStop();

				ACK = 1;
				IE = 0x00;
				IN_INT = 0;
				while (ACK && (countdown < TIMEOUT)) {countdown++;}
				if (countdown < TIMEOUT)
				{
					IN_INT = 1;
					while (!ACK) {}
				}
				else IN_INT = 1;
			}
		}
	}
}