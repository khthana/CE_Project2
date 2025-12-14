#ifndef	_INCLUDED
#define _INCLUDED 1
#include "c:\c51\bin\library\lib_i2c.c"
#endif

#define		L_GEN_MOTOR			0x02
//interrupt 0
#define		L_DC_MOTOR			0x02
//interrupt 0
#define		L_STEPPING_MOTOR	0x02
//interrupt 0
#define		L_SERVO				0x02
//interrupt 0
////////////////////////////////////////////////////////////////////
//		General Routine for every module
////////////////////////////////////////////////////////////////////
void MT_go_forward()
{
	if (ACK)
	{
		countdown = 0;
		INT_0 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_GEN_MOTOR,0x01);
			//delay(10,10);
			INT_0 = 1;
			while (!ACK) {}
		}
		else INT_0 = 1;
	}
}

void MT_go_backward()
{
	if (ACK)
	{
		countdown = 0;
		INT_0 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_GEN_MOTOR,0x02);
			//delay(10,10);
			INT_0 = 1;
			while (!ACK) {}
		}
		else INT_0 = 1;
	}
}

void MT_turn_left()
{
	if (ACK)
	{
		countdown = 0;
		INT_0 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_GEN_MOTOR,0x03);
			//delay(10,10);
			INT_0 = 1;
			while (!ACK) {}
		}
		else INT_0 = 1;
	}
}

void MT_turn_right()
{
	if (ACK)
	{
		countdown = 0;
		INT_0 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_GEN_MOTOR,0x04);
			//delay(10,10);
			INT_0 = 1;
			while (!ACK) {}
		}
		else INT_0 = 1;
	}
}

void MT_stop_move()
{
	if (ACK)
	{
		countdown = 0;
		INT_0 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_GEN_MOTOR,0x05);
			//delay(10,10);
			INT_0 = 1;
			while (!ACK) {}
		}
		else INT_0 = 1;
	}
}

void MT_set_speed(unsigned char speed)
{
	if (ACK)
	{
		if (speed > 3)
		{
			speed = 3;
		}
		countdown = 0;
		INT_0 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_GEN_MOTOR,0x06);
			delay(10,10);
			WriteI2C(L_GEN_MOTOR,speed);
			//delay(10,10);
			INT_0 = 1;
			while (!ACK) {}
		}
		else INT_0 = 1;
	}
}

void MT_set_run_time(unsigned int time)
{
	unsigned char time_hi,time_lo;
	if (ACK)
	{
		countdown = 0;
		INT_0 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			time_hi = (unsigned char)(time >> 8);
			time <<= 8;
			time_lo = (unsigned char)(time >>= 8);
			WriteI2C(L_GEN_MOTOR,0x07);
			delay(10,10);
			WriteI2C(L_GEN_MOTOR,time_hi);
			delay(10,10);
			WriteI2C(L_GEN_MOTOR,time_lo);
			//delay(10,10);
			INT_0 = 1;
			while (!ACK) {}
		}
		else INT_0 = 1;
	}
}

void STEPPING_set_single_phase_mode()
{
	if (ACK)
	{
		countdown = 0;
		INT_0 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_STEPPING_MOTOR,0x08);
			delay(10,10);
			WriteI2C(L_STEPPING_MOTOR,1);
			//delay(10,10);
			INT_0 = 1;
			while (!ACK) {};
		}
		else INT_0 = 1;
	}
}

void STEPPING_set_double_phase_mode()
{
	if (ACK)
	{
		countdown = 0;
		INT_0 = 0;
		ACK = 1;
		while (ACK && (countdown < L_TIMEOUT)) {countdown++;}
		if (countdown < L_TIMEOUT)
		{
			WriteI2C(L_STEPPING_MOTOR,0x08);
			delay(10,10);
			WriteI2C(L_STEPPING_MOTOR,2);
			//delay(10,10);
			INT_0 = 1;
			while (!ACK) {};
		}
		else INT_0 = 1;
	}
}