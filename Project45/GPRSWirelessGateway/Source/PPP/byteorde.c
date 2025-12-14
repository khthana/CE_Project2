unsigned long _fastcall htonl(unsigned long lv)
{
 asm {
     xchg ah,al;
     xchg ax,dx;
     xchg ah,al;
 }
}

unsigned short _fastcall htons(unsigned short sv)
{
 asm {
     xchg ah,al;
 }
}

