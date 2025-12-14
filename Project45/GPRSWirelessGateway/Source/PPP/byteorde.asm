_TEXT	segment byte public 'CODE'
_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:_TEXT,ds:DGROUP
_DATA	segment word public 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	unsigned long _fastcall htonl(unsigned long lv)
   ;	
	assume	cs:_TEXT
@htonl	proc	near
	xchg	ah,al
	xchg	ax,dx
	xchg	ah,al
	ret	
@htonl	endp
   ;	
   ;	unsigned short _fastcall htons(unsigned short sv)
   ;	
	assume	cs:_TEXT
@htons	proc	near
	xchg	ah,al
	ret	
@htons	endp
   ;	
   ;	unsigned long _fastcall rolc(unsigned log v, int n)
   ;	
	assume	cs:_TEXT
@rolc	proc	near
        mov     cx,bx
        and     cx,01Fh
        jz      Rotated
Rotating:
        rcl     ax,1
        rcl     dx,1
        adc     ax,0
        loop    Rotating
Rotated:
	ret	
@rolc	endp
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	@htons
	public	@htonl
        public  @rolc
_s@	equ	s@
	end
