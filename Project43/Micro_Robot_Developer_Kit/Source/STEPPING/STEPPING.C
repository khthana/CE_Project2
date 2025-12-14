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

#define ADDRESS			0x02

#define FORWARD					0x01
#define BACKWARD				0x02
#define TURN_LEFT				0x03
#define TURN_RIGHT				0x04
#define STOP					0x05
#define	SET_SPEED				0x06
#define	SET_RUN_TIME			0x07
#define SET_PHASE_SHIFT_MODE	0x08

// dc motor module	/////////////////////////////////
#define PERIOD	40

sbit	LM1 = P2^0;
sbit	LM2 = P2^1;
sbit	LM3 = P2^2;
sbit	LM4 = P2^3;
sbit	RM1 = P2^4;
sbit	RM2 = P2^5;
sbit	RM3 = P2^6;
sbit	RM4 = P2^7;
bit		temp_bit;

sbit	LED1 = P0^0;
sbit	LED2 = P0^1;
sbit	LED3 = P0^2;
sbit	LED4 = P0^3;
sbit	LED5 = P0^4;
sbit	LED6 = P0^5;
sbit	LED7 = P0^6;
sbit	LED8 = P0^7;
sbit	LED9 = P1^6;
sbit	LED10 = P1^7;

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
//////////////////////////////////////////////////////////////////

unsigned char	stepping_left;
unsigned char	stepping_right;
unsigned char	sampling_time;
unsigned char	phase_shift_mode;

unsigned char	enable;
unsigned char	start_timer = 0;
unsigned int	count_time = 0;
unsigned char	speed;
//////////////////////////////////////////////////////////////////
//define i2c
//////////////////////////////////////////////////////////////////
unsigned char	TempDelay;
unsigned char	_i2c_error;      // bit array of error types
#define I2CReceiveCode I2CReceiveDataByte
//////////////////////////////////////////////////////////////////

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

void _I2CSCLHigh(void)        // set SCL_PIN high, and wait for it to go high
{
	register int err;
	SCL_PIN = 1;
	while (!SCL_PIN)
	{
		err++;
		if (!err)
		{
			_i2c_error += 0x02;     // SCL_PIN stuck, something's holding it down
			return;
		}
	}
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

void _I2CSlaveStop(void)
{
	while (SDA_PIN) {}
	while (!SCL_PIN) {}
	while (!SDA_PIN) {}
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

void	I2CSendStop(void)
{
	SDA_PIN = 0;
	_I2CBitDelay();
	_I2CSCLHigh();
	_I2CBitDelay();
	SDA_PIN = 1;
	_I2CBitDelay();
}

void	WriteI2C(unsigned char Addr, unsigned char Data)
{
	I2CSendAddr(Addr, WRITE);
	I2CSendByte(Data);
	I2CSendStop();
}

//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

void int0_int(void) interrupt 0
{
	unsigned char count_time_hi,count_time_lo;
	ACK = 0;
	command = I2CReceiveCode();
	switch (command)
	{
		case FORWARD :
				enable = 1;
				stepping_left = 1;
				stepping_right = 1;
				start_timer = 0;
				break;
		case BACKWARD :
				enable = 1;
				stepping_left = 0;
				stepping_right = 0;
				start_timer = 0;
				break;
		case TURN_LEFT :
				enable = 1;
				stepping_left = 1;
				stepping_right = 0;
				start_timer = 0;
				break;
		case TURN_RIGHT :
				enable = 1;
				stepping_left = 0;
				stepping_right = 1;
				start_timer = 0;
				break;
		case STOP :
				enable = 0;
				start_timer = 0;
				break;
		case SET_SPEED :
				speed = 10 * I2CReceiveDataByte();
				sampling_time = 0;
				break;
		case SET_RUN_TIME :
				count_time_hi = I2CReceiveDataByte();
				delay(10,10);
				count_time_lo = I2CReceiveDataByte();
				count_time = count_time_hi;
				count_time << 8;
				count_time += count_time_lo;
				start_timer = 1;
				break;
		case SET_PHASE_SHIFT_MODE :
				phase_shift_mode = I2CReceiveDataByte();
				switch (phase_shift_mode)
				{
				case 1 :	LM1 = 0; LM2 = 1; LM3 = 1; LM4 = 1;
							RM1 = 0; RM2 = 1; RM3 = 1; RM4 = 1;
							break;
				case 2 :	LM1 = 0; LM2 = 0; LM3 = 1; LM4 = 1;
							RM1 = 0; RM2 = 0; RM4 = 1; RM4 = 1;
							break;
				}
				break;
	}
	while (!INT) {}
	ACK = 1;
}

void timer0_int(void) interrupt 1
{
	TR0 = 0;
	if (enable == 1)
	{
		if (sampling_time > (PERIOD - speed))
		{
			sampling_time = 0;
			if (stepping_left)
			{
				temp_bit = LM4;
				LM4 = LM3;
				LM3 = LM2;
				LM2 = LM1;
				LM1 = temp_bit;
			}
			else
			{
				temp_bit = LM1;
				LM1 = LM2;
				LM2 = LM3;
				LM3 = LM4;
				LM4 = temp_bit;
			}

			if (stepping_right)
			{
				temp_bit = RM1;
				RM1 = RM2;
				RM2 = RM3;
				RM3 = RM4;
				RM4 = temp_bit;
			}
			else
			{
				temp_bit = RM4;
				RM4 = RM3;
				RM3 = RM2;
				RM2 = RM1;
				RM1 = temp_bit;
			}
		}
		else
		{
			sampling_time++;
		}
	}
	else
	{
	}

	if (start_timer)
	{
		if (count_time > 0)
		{
			count_time--;
		}
		else
		{
			start_timer = 0;
			enable = 0;
			LM1 = 1;
			LM2 = 1;
			LM3 = 1;
			LM4 = 1;
			RM1 = 1;
			RM2 = 1;
			RM3 = 1;
			RM4 = 1;
		}
	}
	TR0 = 1;
}

//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
void main()
{
	// initial data
	P0 = 0xff;
	P1 = 0xff;
	P2 = 0xff;
	P3 = 0xff;

	stepping_left = 1;
	stepping_right = 1;
	sampling_time = 0;
	enable = 0;
	speed = 30;

	LM1 = 1;
	LM2 = 1;
	LM3 = 0;
	LM4 = 0;

	RM1 = 1;
	RM2 = 1;
	RM3 = 0;
	RM4 = 0;

	TMOD = 0x22;	//	timer1 8bit auto reload - timer0 8bit autoreload
	TH0  = 0x11;	//	timer0 count lo value

	TR0  = 1;		//	enable timer0
	IT0  = 1;

	IE   = 0x83;	//	1000 0010 enable timer0
	
	while (1)
	{
	}
}