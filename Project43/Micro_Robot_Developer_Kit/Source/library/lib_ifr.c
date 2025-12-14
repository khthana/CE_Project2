#ifndef	_INCLUDED
#define _INCLUDED 1
#include "c:\c51\bin\library\lib_i2c.c"
#endif
#define		L_INFRARED			0x04
//interrupt 1

bdata	unsigned char infrared_data_lo = 0xFF;
bdata	unsigned char infrared_data_hi = 0xFF;
sbit	infrared_01 = infrared_data_lo^0;
sbit	infrared_02 = infrared_data_lo^1;
sbit	infrared_03 = infrared_data_lo^2;
sbit	infrared_04 = infrared_data_lo^3;
sbit	infrared_05 = infrared_data_lo^4;
sbit	infrared_06 = infrared_data_lo^5;
sbit	infrared_07 = infrared_data_lo^6;
sbit	infrared_08 = infrared_data_lo^7;
sbit	infrared_09 = infrared_data_hi^0;
sbit	infrared_10 = infrared_data_hi^1;
sbit	infrared_11 = infrared_data_hi^2;
sbit	infrared_12 = infrared_data_hi^3;

unsigned char IR_get_data_no(unsigned char no)
{
	unsigned char temp = 0xFF;		//error value flag
	if (ACK)
	{
		if (no > 11)
		{
			no = 11;
		}
		countdown = 0;
		INT_1 = 0;
		ACK = 1;
		temp = 0;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_INFRARED,no);
			//delay(10,10);
			temp = I2CReceiveDataByte();
			//delay(10,50);
			INT_1 = 1;
			while (!ACK) {}
		}
		else INT_1 = 1;
	}
	return temp;
}

void IR_get_data(void)
{
	if (ACK)
	{
		countdown = 0;
		INT_1 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_INFRARED,0x0F);
			//delay(10,10);
			infrared_data_hi = I2CReceiveDataByte();
			//delay(10,50);
			infrared_data_lo = I2CReceiveDataByte();
			//delay(10,50);
			INT_1 = 1;
			while (!ACK) {}
		}
		else INT_1 = 1;
	}
}

void IR_get_sample(void)
{
	if (ACK)
	{
		countdown = 0;
		INT_1 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_INFRARED,L_ADDRESS);
			//delay(10,10);
			infrared_data_hi = I2CReceiveDataByte();
			//delay(10,50);
			infrared_data_lo = I2CReceiveDataByte();
			//delay(10,50);
			INT_1 = 1;
			while (!ACK) {}
		}
		else INT_1 = 1;
	}
}

void IR_enable_interrupt(void)
{
	if (ACK)
	{
		countdown = 0;
		INT_1 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_INFRARED,0x11);
			//delay(10,50);
			INT_1 = 1;
			while (!ACK) {}
		}
		else INT_1 = 1;
	}
}

void IR_disable_interrupt(void)
{
	if (ACK)
	{
		countdown = 0;
		INT_1 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_INFRARED,0x12);
			//delay(10,50);
			INT_1 = 1;
			while (!ACK) {}
		}
		else INT_1 = 1;
	}
}