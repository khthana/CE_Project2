; File: SRC\ASSEMBLY.ASM

; /**************************************************************************
; The Internet Extender ver. 1.0 beta is a software based Network Address 
; Translating Router designed to allow for multiple machines on a LAN to 
; simultaneously connect through a single IP address to the Internet.
; Copyright (C) 1999  Jason Sarich, Dr. Dan Lewis, Santa Clara University
;
; This program is free software; you can redistribute it and/or
; modify it under the terms of the GNU General Public License
; as published by the Free Software Foundation; either version 2
; of the License, or (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program; if not, write to the Free Software
; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
; **************************************************************************/

	org	$

BIOSCLK	equ	046Ch
HI_MAX	equ	0018h
LO_MAX	equ     00B0h

        ; code segment variables

date    dw 0,0
oldhour db 0

	idt	No_Op
	ldef	No_Op
;----------------------------------------------------------------------
No_Op:	; BOOL No_Op(void)
;----------------------------------------------------------------------
	xor	ax,ax
	retfar

	idt	Set_Timeout
	ldef	Set_Timeout
;----------------------------------------------------------------------
Set_Timeout:	; longword Set_Timeout(int seconds) ;
;----------------------------------------------------------------------
	push	bp
	mov	bp,sp
	xor	AX, AX			; reference low memory
	mov	ES, AX
        mov     AX, [BP+6]           ; seconds
	mov	DX, 1165
	mul	DX			; 1165/64 = 18.203...
	mov	CX, 6
tmp:	shr	DX, 1
	rcr	AX, 1
	loop	tmp
	adc	ax,0
	adc	dx,0
        pushf
        cli
        add     AX, ES:[ BIOSCLK ]
	adc	DX, ES:[ BIOSCLK + 2 ]
        add     AX, CS: [date]            ; date extend
        adc     DX, CS: [date + 2]
        popf
	pop	bp
	retfar

	idt	Check_Timeout
	ldef	Check_Timeout
;----------------------------------------------------------------------
Check_Timeout:	; int Check_Timeout(longword value) ;
;----------------------------------------------------------------------
	push	bp
	mov	bp,sp

	xor	AX, AX
	mov	ES, AX
        pushf
        cli
	mov	CX, ES:[BIOSCLK]
	mov	BX, ES:[BIOSCLK+2]
        popf

        ; see if new date
        cmp     BL, CS:[oldhour]          ; is it earlier modulo one day
        je      samehr
        jge     sameday

        ; update the new date stuff
        add     CS:[date], LO_MAX
        adc     CS:[date+2], HI_MAX

sameday:mov     CS:[oldhour], BL          ; save new hour for next time

samehr:	add     CX, CS: [date]            ; date extend current time
        adc     BX, CS: [date + 2]

        mov     AX, [BP+6]       ; get supplied timeout value
	mov	DX, [BP+8]
        
        cmp     DX, BX                  ; if timeout < clock has expired
        jb      ret_tru
        ja      ret_fal
        cmp     AX, CX                  ; still checking timeout < clock
        jb      ret_tru

ret_fal:xor     AX, AX                  ; false
        jmp     retern

ret_tru:mov     AX, 1
retern:	pop	bp
	retfar

	idt	Rev32
	ldef	Rev32
;----------------------------------------------------------------------
Rev32:	; longword Rev32(longword) ;
;----------------------------------------------------------------------
	push	bp
	mov	bp,sp
	mov	ax,[bp+8]
	mov	dx,[bp+6]
	xchg	al,ah
	xchg	dl,dh
	pop	bp
	retfar

	idt	Rev16
	ldef	Rev16
;----------------------------------------------------------------------
Rev16:	; word Rev16(word) ;
;----------------------------------------------------------------------
	push	bp
	mov	bp,sp
	mov	ax,[bp+6]
	xchg	al,ah
	pop	bp
	retfar

	idt	Checksum
	ldef	Checksum
;----------------------------------------------------------------------
Checksum:	; unsigned Checksum(void *buf, unsigned cnt) ;
;----------------------------------------------------------------------
	push	bp
	mov	bp,sp
        mov     si,[bp+6]	; &buf
	mov     cx,[bp+8]	; cnt
        mov     bl,cl
	shr     cx,1		; group into words
	xor	dx,dx		; set checksum to 0 (also clears CF)
        cld
        jcxz    remain
deloop: lodsw
	adc	dx,ax		; worst case 1.FFFF
	loop	deloop
        adc     dx,0		; and thus 1.0000
        adc     dx,0		; and thus 0.0001
remain: and     bl,1
        jz      done
        xor     ah,ah
        lodsb
        add     dx,ax		; worst case 1.00FE
        adc     dx,0		; and thus 0.00FF
done:   mov	ax,dx		; result into ax
	pop	bp
	retfar

	idt	Adjust_Checksum
	ldef	Adjust_Checksum
;----------------------------------------------------------------------
; void Adjust_Checksum(word *old_cksm, void *old, void *new, int bytes)
Adjust_Checksum:
;----------------------------------------------------------------------
	push	bp
	mov	bp,sp
	mov	di,[bp+6]	; &old_cksm
	mov	dx,[di]		; old_cksm

	mov	si,[bp+8]	; &old
	mov	cx,[bp+12]	; bytes (always even)
	shr	cx,1		; also clears CF
	cld
Adj1:	lodsw
	adc	dx,ax		; worst case 1.FFFF
	loop	Adj1
	adc	dx,0		; and thus 1.0000
	adc	dx,0		; and thus 0.0001

	mov	si,[bp+10]	; &new
	mov	cx,[bp+12]
	shr	cx,1		; also clears CF
Adj2:	lodsw
	sbb	dx,ax		; worst case 1.0000
	loop	Adj2
	sbb	dx,0		; and thus 1.FFFF
	sbb	dx,0		; and thus 0.FFFE

	mov	[di],dx
	pop	bp
	retfar

	idt	Delta_Checksum
	ldef	Delta_Checksum
;----------------------------------------------------------------------
Delta_Checksum:	; void Delta_Checksum(word *old_cksm, word delta)
;----------------------------------------------------------------------
	push	bp
	mov	bp,sp
	mov	si,[bp+6]	; &old_cksm
	mov	ax,[si]		; old_cksm
	sub	ax,[bp+8]	; subtract delta: worst case 1.0000
	sbb	ax,0		; and thus 1.FFFF
	sbb	ax,0		; and thus 0.FFFE
	mov	[si],ax
	pop	bp
	retfar
	end

