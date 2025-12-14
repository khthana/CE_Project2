;***********************************************************************
;# $RCSfile: testI.asm,v $
;# $Revision: 1.18 $
;# last change by $Author: sirikhum $
;# at $Date: 2002/12/17 03:26:08 $
;***********************************************************************
;#
;#   GNU Lesser General Public License Version 2.1
;#   ===============================================
;#   Copyright 2002 by Noppadon Sirikhum
;#
;#   This library is free software; you can redistribute it and/or
;#   modify it under the terms of the GNU Lesser General Public
;#   License version 2.1, as published by the Free Software Foundation.
;#
;#   This library is distributed in the hope that it will be useful,
;#   but WITHOUT ANY WARRANTY; without even the implied warranty of
;#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;#   Lesser General Public License for more details.
;#
;#   You should have received a copy of the GNU Lesser General Public
;#   License along with this library; if not, write to the Free Software
;#   Foundation, Inc., 59 Temple Place, Suite 330, Boston,
;#   MA  02111-1307  USA
;#
;***********************************************************************

.model small
.stack 100h
.data
	perror_msg	db "======= Printing Error =======",10,13,'$'
	phase_msg	db "Phase I ",10,13, '$'
			;   01234567
	dash_msg	db "==============================",10,13,'$'
	din_msg		db "data_in : XX-XX-XX-XX-XX-XX-XX-XX",10,13, '$'
	key_msg		db "key__in : XX-XX-XX-XX-XX-XX-XX",10,13, '$'
	dout_msg	db "crypted : XX-XX-XX-XX-XX-XX-XX-XX",10,13, '$'
	;		    0123456789abcdef0123456789abcdef0
	;		    0               1               2
;        din     db 0,   0ffh,0,   0ffh,0,   0ffh,0,   0ffh
;        key     db 0ffh,0,   0ffh,0,   0ffh,0,   0ffh,0
;        cdataI  db 0,   0ffh,0,   0ffh,0,   0ffh,0,   0ffh
;        cdataII db 0ffh,0,   0ffh,0,   0ffh,0,   0ffh,0

;        din     db 0fh, 0f0h,   0h, 0fh,    0h, 0f0h,   0h, 0fh
;        key     db 0h,  0fh, 0f0h,   0h, 0fh,    0h, 0f0h,   0h

;        din     db 0ffh, 0ffh,   0ffh, 0ffh,    0ffh, 0ffh,   0ffh, 0ffh
        key     db 0h, 0h,  0h, 0h,   0h, 0h,    0h, 0h

        din     db 0h, 0h,      0h, 0h,   0h, 0h,    0h, 0h
;        key     db 0ffh, 0ffh,   0ffh, 0ffh,    0ffh, 0ffh,   0ffh, 0h

;        key     db 0fh, 0f0h,   0h, 0fh,    0h, 0f0h,   0h, 0fh
        cdataI  db 0, 0, 0, 0, 0, 0, 0, 0
	cdataII	db 0ffh,0,   0ffh,0,   0ffh,0,   0ffh,0
	;             7    6    5    4    3    2    1    0 

        port_din                dw      110h, 112h, 114h, 116h
        ; used to out()
        port_key                dw      118h, 11ah, 11ch, 11eh
	port_dout	dw	120h, 122h, 124h, 126h
        ; used to in()

.code
     crypted_flag db 1

polling   proc near
        push ds
	push cs	; our flag is at Text Segment.
	pop ds
not_rdy:	; loop here until crypted.
	cmp crypted_flag, 1
;        jl not_rdy
; comment out for testing purpose only
; and will be remove comment in real life.
	mov crypted_flag, 0	; clear our flag.
        pop ds
        ret
polling	endp

print_banner  proc near
; Pass argument via dx which mean as describe below
; Mode 1 = Print 'din'
; Mode 2 = Print 'key'
; Mode 3 = Print 'cdataI' as dout
; Mode 4 = Print 'cdataI' as din
; Mode 5 = Print 'cdataII' as dout
	push dx
	push cx
	push bx
	push ax
	push si
	push di
	push bp
	sub bx, bx
	cmp dx, 1
	jne not_dinI
; First Part of Printing
; We parse different Mode by using Mode
; that passed via dx. 
; Mode 1.
	mov di, offset din	; load din.
	mov si, offset din_msg	; load din's banner.
	mov bp, 0ah	; point to the 'X' in banner.
	jmp loop_cal
; Mode 2.
not_dinI:
	cmp dx, 2
	jne not_key		; ! Mode 2.
	mov di, offset key	; load key.
	mov si, offset key_msg	; load key's banner.
	mov bp, 0ah
	jmp loop_cal
; Mode 3.
not_key:
	cmp dx, 3
	jne not_doutI		; ! Mode 3.
	mov di, offset cdataI	; load Crypted data I.
	mov si, offset dout_msg	; load dout'banner.
	mov bp, 0ah
	jmp loop_cal
; Mode 4.
not_doutI:
	cmp dx, 4
	jne not_dinII		; ! Mode 4.
	mov di, offset cdataI	; load Crypted data I.
	mov si, offset din_msg	; load din's banner.
	mov bp, 0ah
	jmp loop_cal
; Mode 5.
not_dinII:
	cmp dx, 5		; ! Mode 1-5 mean.
	jne Print_error		; some error occured.
	mov di, offset cdataII	; load Crypted data II.
	mov si, offset dout_msg ; load dount's banner.
	mov bp, 0ah
	jmp loop_cal
Print_error:
	mov dx, offset perror_msg
	mov ah, 9
	int 21h
	jmp exiting

; The Main Part of PRINTING.
loop_cal:
	sub ax, ax	; clear 'ax'
	sub cx, cx	; cleat 'cx'
	mov al, [di+bx]	; load din[bx]
        mov cl, 10h     ; load divider
	div cl	; split 8 bits value in to 2 char.
        cmp ah, 0ah     ; check the right-side.
	jge more_thanA1
	add ah, '0'
        jmp finished1
more_thanA1:
        add ah, 'W' ; 'a'=='W'+0ah
finished1:      ; finished the right-side.

        cmp al, 0ah     ; check the left-side.
	jge more_thanA2
	add al, '0'
        jmp finished2
more_thanA2:
        add al, 'W'
finished2:      ; finished the left-side.
        push di
        push si ; point to X_msg but will use 'ss' instead of 'ds'
        pop di
        push bx
        push bp
        push bp
        pop bx
        mov [di+bx], al ; store left-value.
        inc bx
        mov [di+bx], ah ; store right-value.
        pop bp
        pop bx
        pop di
	inc bx	; increment counter.
        add bp, 3       ; we have 2 characters and 1 white-space
                        ; within 8-bits datas.
	cmp bx,7	; every Modes has at least
			; 7 bytes to calculate.
	jl loop_cal	; So, Loop !!
	cmp dx, 2	; Mode 2 (key) FINished here !!
	je printing	
	cmp bx, 8	; The last byte of Mode 1(din), 3(crypted), etc..
	jl loop_cal	; processed here.

; This is the last part, we'll restore every registers those
; we used in our routine. So, Mail program can run it without
; special check(register).
printing:	; the last thing to do is printing.
	mov dx, si
	mov ah, 9
	int 21h
exiting:	; exting proc.
	pop bp
	pop di
	pop si
	pop ax
	pop bx
	pop cx
	pop dx
	ret	
;outing	endp

print_banner	endp


ISR     proc near
        pushf
        push ds
        push cs	; out flag is at Text Segment.
        pop ds
        push ax
        push bx
        push cx
        push dx
        cmp crypted_flag,0   ; crypted data ready to fetch.
        jg outisr
	mov crypted_flag,1
outisr : pop dx
        pop cx
        pop bx
        pop ax
        pop ds
        popf
        iret
ISR     endp

ISR_INITIAL     proc near
                push ds
                push cs
                pop ds
		lea dx,isr  	; put table in interupt vector.
                mov al,0dh
		mov ah,25h
		int 21h
		in al,21h	; set 8259A for unmark irq 5.
				; this line read old mark.
                and al,11011111b	; unmark IRQ5.
		out 21h,al	; send to 8259A.
                pop ds
                ret
ISR_INITIAL     endp

out_dinI	proc near
		push dx
		push ax
		push di
		push bx
		push cx
		sub bx, bx
		sub cx, cx
		mov di, offset din
                mov si, offset port_din
loop_dinI :
                mov ax,[si]
		inc si
                inc si
		mov dx, ax
		mov ah, [di+bx]
		inc bx
		mov al, [di+bx]
		inc bx
		out dx, ax
		inc cx
		cmp cx, 4
		jl loop_dinI
		pop cx
		pop bx
		pop di
		pop ax
		pop dx
		ret
out_dinI	endp

out_key	proc near
		push dx
		push ax
		push di
		push bx
		push cx
		sub bx, bx
		sub cx, cx
		mov di, offset key
		mov si, offset port_key
loop_key :
                mov ax,[si]
		inc si
                inc si
		mov dx, ax
		mov ah, [di+bx]
		inc bx
		mov al, [di+bx]
		inc bx
		out dx, ax
		inc cx
		cmp cx, 4
		jl loop_key
		pop cx
		pop bx
		pop di
		pop ax
		pop dx
		ret
out_key	endp


out_dinII	proc near
		push dx
		push ax
		push di
		push bx
		push cx
		sub bx, bx
		sub cx, cx
		mov di, offset cdataI
                mov si, offset port_din
loop_dinII :
                mov ax,[si]
		inc si
                inc si
		mov dx, ax
		mov ah, [di+bx]
		inc bx
		mov al, [di+bx]
		inc bx
		out dx, ax
		inc cx
		cmp cx, 4
		jl loop_dinII
		pop cx
		pop bx
		pop di
		pop ax
		pop dx
		ret
out_dinII	endp


in_cryptedI	proc near
		push dx
		push ax
		push di
		push bx
		push cx
		sub bx, bx
		sub cx, cx
		mov di, offset cdataI
                mov si, offset port_dout
loop_cryptedI :
                mov ax,[si]
		inc si
                inc si
		mov dx, ax
		in ax, dx
		mov [di+bx], ah
		inc bx
		mov [di+bx], al
		inc bx
		inc cx
		cmp cx, 4
		jl loop_cryptedI
		pop cx
		pop bx
		pop di
		pop ax
		pop dx
		ret
in_cryptedI	endp

in_cryptedII	proc near
		push dx
		push ax
		push di
		push bx
		push cx
		sub bx, bx
		sub cx, cx
		mov di, offset cdataII
                mov si, offset port_dout
loop_cryptedII :
                mov ax,[si]
		inc si
                inc si
		mov dx, ax
		in ax, dx
		mov [di+bx], ah
		inc bx
		mov [di+bx], al
		inc bx
		inc cx
		cmp cx, 4
		jl loop_cryptedII
		pop cx
		pop bx
		pop di
		pop ax
		pop dx
		ret
in_cryptedII	endp

print_dinI	proc near
			push dx
			mov dx,1
			call print_banner
			pop dx
			ret
print_dinI	endp

print_key	 	proc near
			push dx
			mov dx,2
			call print_banner
			pop dx
			ret
print_key		endp

print_cdataI	proc near
			push dx
			mov dx,3
			call print_banner
			pop dx
			ret
print_cdataI	endp

print_dinII	proc near
			push dx
			mov dx,4
			call print_banner
			pop dx
			ret
print_dinII	endp

print_cdataII   proc near
			push dx
			mov dx,5
			call print_banner
			pop dx
			ret
print_cdataII	endp

test_out proc near
                push dx
                push ax
                push cx
                push bx
                sub dx,dx
;                sub ax,ax
                sub bx,bx
                sub cx,cx
                mov dx, 0110h

delayo2:        inc cx
                cmp cx, 1000h
;                jge exit_delayo;
                sub bx,bx
delayo1:        inc bx
                out dx,ax
                cmp bx, 0eff0h
;                jle delayo2
;                jmp delayo1
exit_delayo:
                pop bx
                pop cx
                pop ax
                pop dx
                ret
test_out endp



begin :	mov ax,@data
		mov ds,ax
;		xor bx,bx
;               mov dx,300h
;                mov al,11111111b
;                out dx,al
;                call ISR_INITIAL

start:
		mov dx,offset dash_msg 	; print_dashs
		mov ah,9
                int 21h
		mov dx,offset phase_msg	; print welcome I.
		mov ah, 9
                int 21h

                push dx
                push ax
                sub dx,dx
                sub ax,ax
                jmp exit_delay

delay2:         inc dx
                cmp dx, 2000h
                jge exit_delay;
                sub ax,ax
delay1:         inc ax
                cmp ax, 0eff0h
                jle delay2
                jmp delay1

exit_delay:
                pop ax
                pop dx

		mov dx,offset dash_msg 	; print_dashs
		mov ah,9
                int 21h
;                call test_out



                call out_dinI   ; out dinI.
                call print_dinI ; print dinI.
                call out_key    ; out key.
                call print_key  ; print key.
;                call polling    ; wait for crypted from irq5.
                call in_cryptedI        ; fetch crypted_data(cdataI)
                call print_cdataI       ; print crypted_data(cdataI)

		mov dx,offset dash_msg 	; print_dashs
		mov ah,9
                int 21h
                mov [phase_msg+7], 'I'   ; print welcome II
                mov dx, offset phase_msg
		mov ah,9
                int 21h

                call out_dinII  ; dinII = crypted_dataI(cdataI)
                call print_dinII        ; print dataII
                call out_key    ; use the same_key
                call print_key
;                call polling    ; wait for crypted from irq5
                call in_cryptedII       ; fetch crypted_data(cdataII)
               call print_cdataII      ; print crypted_data(cdataII)

		mov dx,offset dash_msg 	; print_dashs
		mov ah,9	; if cdataII = dinI then
                int 21h         ; out crypted_chip WORKING !!
	
quit :	mov ax,4c00h
		int 21h
end begin
