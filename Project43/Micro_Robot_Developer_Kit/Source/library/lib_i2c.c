#include "c:\c51\inc\reg51.h"
#define		L_ADDRESS			0x55
#define		L_I2CEEPROM			0xA0

#define		L_TIMEOUT			0xFF

#ifndef READ
    #define	READ	1
#endif

#ifndef WRITE
    #define	WRITE	0
#endif

#define		MEM_SIZE		0x8000
#define		MEMORY			0x8000

//define port//////////////////////////////////////// 
sbit	SCL_PIN = P1^0;
sbit	SDA_PIN = P1^1;
sbit	LED = P1^2;

sbit	INT_0 = P1^2;
sbit	INT_1 = P1^3;
sbit	INT_2 = P1^4;
sbit	INT_3 = P1^5;
sbit	INT_4 = P1^6;
sbit	INT_5 = P1^7;
sbit	INT_6 = P3^5;
sbit	INT_7 = P3^4;

sbit	IN_INT = P3^2;
sbit	ACK    = P3^3;
/////////////////////////////////////////////////////
unsigned char	countdown;
//define i2c/////////////////////////////////////////
unsigned char	TempDelay;
unsigned	char _i2c_error = 0;      // bit array of error types

//define external memory 
idata	unsigned char	xdata	*memory;

//define general routine
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

void write(unsigned int address, unsigned char mem_data)
{
	memory = address;
	*memory = mem_data;
}

unsigned char read(unsigned int address)
{
	memory = address;
	return *memory;
}

//----------------- I2C Routine ------------------------

void _I2CBitDly(void)         // wait 4.7uS, or thereabouts
{                             // tune to xtal. This works at 11.0592MHz
	TempDelay = 0;	//1
	TempDelay = 0;	//2
	TempDelay = 0;	//3
	TempDelay = 0;	//4
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
      _i2c_error &= 0x02;     // SCL_PIN stuck, something's holding it down
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
  SDA_PIN = 1;							// listen for ACK
  _I2CSCLHigh();
  _I2CBitDly();
  if (SDA_PIN)
    _i2c_error += 0x01;					// ack didn't happen, may be nothing out there
  SCL_PIN = 0;
  _I2CBitDly();
}

void I2CSendAddr(unsigned char addr, unsigned char rd)
{
  SCL_PIN = 1;
  _I2CBitDly();  
  SDA_PIN = 0;				// generate start
  _I2CBitDly();
  SCL_PIN = 0;
  _I2CBitDly();
  I2CSendByte(addr+rd);		// send L_ADDRESS byte
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
		if (address == L_ADDRESS)
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