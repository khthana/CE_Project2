#ifndef	_INCLUDED
#define _INCLUDED 1
#include "c:\c51\bin\library\lib_i2c.c"
#endif

#define		L_INTERFACE			0x08
//interrupt 3

void LCD_write_char(unsigned char ch)
{
	if (ACK)
	{
		countdown =0;
		INT_3 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_INTERFACE,0x01);
			delay(10,20);
			WriteI2C(L_INTERFACE,ch);
			//delay(10,20);
			INT_3 = 1;
			while (!ACK) {}
		}
		else INT_3 = 1;
	}
}

void LCD_write_byte(unsigned char in)
{
	unsigned char first = 0;
	if (in / 100 > 0)
	{
		LCD_write_char((in / 100)+48);
		first = 1;
		in %= 100;
	}
	if (in / 10 > 0)
	{
		LCD_write_char((in / 10)+48);
		first = 1;
		in %= 10;
	}
	else
	{
		if (first)
		{
			LCD_write_char('0');
		}
	}
	LCD_write_char((in+48));
	first = 1;
}

void LCD_write_int(unsigned int in)
{
	unsigned char first = 0;
	if (in / 10000 > 0)
	{
		LCD_write_char((in / 10000)+48);
		first = 1;
		in %= 10000;
	}
	if (in / 1000 > 0)
	{
		LCD_write_char((in / 1000)+48);
		first = 1;
		in %= 1000;
	}
	else
	{
		if (first)
		{
			LCD_write_char('0');
		}
	}
	if (in / 100 > 0)
	{
		LCD_write_char((in / 100)+48);
		first = 1;
		in %= 100;
	}
	else
	{
		if (first)
		{
			LCD_write_char('0');
		}
	}
	if (in / 10 > 0)
	{
		LCD_write_char((in / 10)+48);
		first = 1;
		in %= 10;
	}
	else
	{
		if (first)
		{
			LCD_write_char('0');
		}
	}
	LCD_write_char((in+48));
	first = 1;
}

void LCD_write_string(unsigned char* str)
{
	while (*str != '\0')
	{
		LCD_write_char(*str);
		str++;
	}
}

void LCD_gotoxy(unsigned char x,y)
{
	if (ACK)
	{
		countdown = 0;
		INT_3 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_INTERFACE,0x02);
			delay(10,20);
			WriteI2C(L_INTERFACE,x);
			delay(10,20);
			WriteI2C(L_INTERFACE,y);
			//delay(10,20);
			INT_3 = 1;
			while (!ACK) {}
		}
		else INT_3 = 1;
	}
}

void LCD_clear(void)
{
	if (ACK)
	{
		countdown = 0;
		INT_3 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_INTERFACE,0x03);
			//delay(10,20);
			INT_3 = 1;
			while (!ACK) {}
		}
		else INT_3 = 1;
	}
}

unsigned char KBD_get_key(void)
{
	unsigned char temp;
	temp = 0;
	if (ACK)
	{
		countdown = 0;
		INT_3 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_INTERFACE,0x07);
			//delay(10,10);
			temp = I2CReceiveDataByte();
			//delay(10,10);
			INT_3 = 1;
			while (!ACK) {}
			delay(80,255);
		}
		else INT_3 = 1;
	}
	return temp;
}

unsigned char KBD_scan_key(void)
{
	unsigned char temp;
	temp = 0xFF;
	if (ACK)
	{
		countdown = 0;
		INT_3 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_INTERFACE,0x08);
			//delay(10,10);
			temp = I2CReceiveDataByte();
			//delay(10,10);
			INT_3 = 1;
			while (!ACK) {}
		}
		else INT_3 = 1;
	}
	return temp;
}

void SND_gen_freq(unsigned int freq)
{
	unsigned char freq_hi,freq_lo;
	if (ACK)
	{
		countdown = 0;
		INT_3 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			freq_hi = (unsigned char)(freq >> 8);
			freq <<= 8;
			freq >>= 8;
			freq_lo = (unsigned char)(freq);
			WriteI2C(L_INTERFACE,0x05);
			delay(10,10);
			WriteI2C(L_INTERFACE,freq_hi);
			delay(10,10);
			WriteI2C(L_INTERFACE,freq_lo);
			//delay(10,10);
			INT_3 = 1;
			while (!ACK) {}
		}
		else INT_3 = 1;
	}
}

void SND_stop_freq(void)
{
	if (ACK)
	{
		countdown = 0;
		INT_3 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_INTERFACE,0x06);
			//delay(10,10);
			INT_3 = 1;
			while (!ACK) {}
		}
		else INT_3 = 1;
	}
}
