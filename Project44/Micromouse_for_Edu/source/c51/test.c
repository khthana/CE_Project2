#include <reg51.h>

sbit DIGIT0 = P3^2;
sbit DIGIT1 = P3^3;
sbit KEY = P3^0;
sbit RELAY = P3^7;
sbit DOT = P1^7;

bit flag, zero, dot;
unsigned char sec,min;

void convert(unsigned char *prt)    // convert hex to 7-seg. code
{
    unsigned char code table[]={0xc0,0xf9,0xa4,0xb0,0x99,
                                0x92,0x82,0xf8,0x80,0x90};
    *prt++ = table[min/10];
    *prt = table[min%10];
}

void initialize(void)
{
    RELAY = 0; DIGIT0 = 0; DIGIT1 = 0; P1=0xff;     // clear I/O
    TMOD = 0x22;
    TL0 = 0x06;
    TH0 = 0x06;
    ET0 = 1;
    EA = 1;
    TR0 = 1;
    flag=0;
    zero=0;
}

timer0() interrupt 1 using 1
{
    static unsigned int count = 0;
    if(++count == 4000)
    {
        dot = !dot;
         if(sec-- == 0)
         {
            sec = 59;
            if(min-- == 0)
                zero=1;
        }
        flag = 1;
        count = 0;
    }
}


main()
{
    unsigned char delay=255;
    unsigned char disbuf[2];
    disbuf[0]=0xff;
    disbuf[1]=0xff;
    sec=0;
    min=3;
    initialize();
    convert(disbuf);
    do
    {
        DIGIT1 = 1;
        P1=disbuf[0];
        DIGIT0 = 0;
        while(--delay);

        DIGIT0 = 1;
        P1=disbuf[1];
        DOT = dot;
        DIGIT1 = 0;
        while(--delay);

        if(flag)
        {
            flag = 0;
            convert(disbuf);
            if(zero)
            {
                dot = 1;
                EA = 0;
                min = 0;
            }
        }            
    }while(1);
}


