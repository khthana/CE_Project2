#ifndef	_INCLUDED
#define _INCLUDED 1
#include "c:\c51\bin\library\lib_i2c.c"
#endif

#define		L_ULTRASONIC		0x06
//interrupt 2

unsigned char	ultrasonic_01 = 0;
unsigned char	ultrasonic_02 = 0;

void US_get_data(void)
{
	if (ACK)
	{
		countdown = 0;
		INT_2 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_ULTRASONIC,0x01);
			ultrasonic_01 = I2CReceiveDataByte();
			ultrasonic_02 = I2CReceiveDataByte();
			INT_2 = 1;
			while (!ACK) {}
		}
		else INT_2 = 1;
	}
}

unsigned char US_get_data01(void)
{
	unsigned char left = 0;
	if (ACK)
	{
		countdown = 0;
		INT_2 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_ULTRASONIC,0x02);
			left = I2CReceiveDataByte();
			INT_2 = 1;
			while (!ACK) {}
		}
		else INT_2 = 1;
	}
	return left;
}

unsigned char US_get_data02(void)
{
	unsigned char right = 0;
	if (ACK)
	{
		countdown = 0;
		INT_2 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_ULTRASONIC,0x03);
			right = I2CReceiveDataByte();
			INT_2 = 1;
			while (!ACK) {}
		}
		else INT_2 = 1;
	}
	return right;
}

void US_get_sample(void)
{
	unsigned char temp = 0;
	if (ACK)
	{
		countdown = 0;
		INT_2 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_ULTRASONIC,L_ADDRESS);
			ultrasonic_01 = I2CReceiveDataByte();
			ultrasonic_02 = I2CReceiveDataByte();
			
			INT_2 = 1;
			while (!ACK) {}
		}
		else INT_2 = 1;
	}
}

void US_enable_interrupt(void)
{
	if (ACK)
	{
		countdown = 0;
		INT_2 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_ULTRASONIC,0x11);
			//delay(10,10);
			INT_2 = 1;
			while (!ACK) {}
		}
		else INT_2 = 1;
	}
}

void US_disable_interrupt(void)
{
	if (ACK)
	{
		countdown = 0;
		INT_2 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_ULTRASONIC,0x12);
			INT_2 = 1;
			while (!ACK) {}
		}
		else INT_2 = 1;
	}
}