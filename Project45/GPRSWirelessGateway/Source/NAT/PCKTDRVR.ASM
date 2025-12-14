; File: SRC\PCKTDRVR.ASM

; /**************************************************************************
; The Internet Extender ver. 1.0 beta is a software based Network Address 
; Translating Router designed to allow for multiple machines on a LAN to 
; simultaneously connect through a single IP address to the Internet.
; Copyright (C) 1999  Jason Sarich, Dr. Dan Lewis, Santa Clara University

; This program is free software; you can redistribute it and/or
; modify it under the terms of the GNU General Public License
; as published by the Free Software Foundation; either version 2
; of the License, or (at your option) any later version.

; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.

; You should have received a copy of the GNU General Public License
; along with this program; if not, write to the Free Software
; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
; **************************************************************************/

	org	$

EMPTY		equ	0	; These must correspond to the values
BUSY		equ	1	; #define'd for identifiers with the
LCL_ARP		equ	2	; same name and prefixed by "PKT_"
REM_ARP		equ	3	; in DEFINES.H
LCL_IP		equ	4
LCL_ICMP	equ	5	; Numbering has been chosen so that
REM_IP		equ	6	; *_IP can be identified by looking 
REM_ICMP	equ	7	; for >= 4 (when not ICMP).

ENET_HDR_SIZE	equ	14
IP_PROTO_FIELD	equ	(1+ENET_HDR_SIZE+9)
ICMP_PROTO	equ	1	; protocol code for ICMP

bfr_base	dw	0	; offset of base address of buffer set
bfr_end		dw	0	; last offset (plus 1) in buffer set
bfr_prev	dw	0,0	; adrs (offset, segment) of previous buffer
bfr_numb	dw	0	; number of buffers in the pool
bfr_size	dw	0	; total size of each buffer, including headers
pending		dw	0
rem_ip		dw	REM_IP
rem_arp		dw	REM_ARP
lcl_ip		dw	LCL_IP
lcl_arp		dw	LCL_ARP
lcl_off		dw	1
rem_off		dw	ENET_HDR_SIZE + 1

	idt	_rem_ip
	ldef	_rem_ip
;------------------------------------------------------------------------
_rem_ip:
;------------------------------------------------------------------------
	push	cs:[rem_ip]
	push	cs:[rem_off]
	call	pkt_isr
	add	sp,4
	retfar

	idt	_rem_arp
	ldef	_rem_arp
;------------------------------------------------------------------------
_rem_arp:
;------------------------------------------------------------------------
	push	cs:[rem_arp]
	push	cs:[rem_off]
	call	pkt_isr
	add	sp,4
	retfar


	idt	_lcl_ip
	ldef	_lcl_ip
;------------------------------------------------------------------------
_lcl_ip:
;------------------------------------------------------------------------
	push	cs:[lcl_ip]
	push	cs:[lcl_off]
	call	pkt_isr
	add	sp,4
	retfar

	idt	_lcl_arp
	ldef	_lcl_arp
;------------------------------------------------------------------------
_lcl_arp:
;------------------------------------------------------------------------
	push	cs:[lcl_arp]
	push	cs:[lcl_off]
	call	pkt_isr
	add	sp,4
	retfar

;------------------------------------------------------------------------
pkt_isr:	; pkt_isr(type, offset)
;------------------------------------------------------------------------
	push	bp
	mov	bp,sp
	pushf
	cli				; no interruptions now!
	push	cx

	cmp	al,01h
	je	pkt_encue		; branch if 1 - must encue packet now

	cmp	al,00h
	jne	pkt_out

	; Buffer allocate request (compare packet length to buffer size)

	cmp	cx,cs:[bfr_size]
	jae	pkt_not_fnd		; pretend none were found

	mov	cx,cs:[bfr_numb]	; This is a "round-robin" allocation.
	les	di,cs:[bfr_prev]	; Start where we left off last time.
pkt_loop:
	add	di,cs:[bfr_size]	; Move forward to next buffer in pool.
	cmp	di,cs:[bfr_end]
	jb	pkt_save
	mov	di,cs:[bfr_base]	; Wrap if at the end of the pool.
pkt_save:
	mov	cs:[bfr_prev],di	; Save for next time around.
	cmp     byte ptr es:[di],EMPTY
	je	pkt_found
	loop	pkt_loop

pkt_not_found:
	xor	di,di			; for whatever error, throw away 
	mov	es,di			; the buffer by returning 0000:0000
	jmp	pkt_out

pkt_found:
	mov	byte ptr es:[di],BUSY
	add	di,[bp+4] 		; [offset]
	jmp	pkt_out			; Return ES:DI -> where to put data

	; Encue Packet: Data has been stored in packet - now tell application
	;
pkt_encue:
	or	si,si
	jz	pkt_out			; not a valid pointer, cannot encue
	push	si
	sub	si,[bp+4]		; [offset]
	mov	cx,[bp+6]		; [type]
	cmp	byte ptr ds:[si+IP_PROTO_FIELD],ICMP_PROTO
	jne	not_icmp
	cmp	cl,LCL_IP		; If LCL_IP (REM_IP), 
	jb	not_icmp
	inc	cx			;   change to LCL_ICMP (REM_ICMP).
not_icmp:
	mov     byte ptr ds:[si],cl	; Mark as filled and waiting.
	mov	si,cx
	shl	si,1
	add	si,cs:[pending]		; Increment count of pending
	inc	word ptr ds:[si]	;      packets of this type.
	pop	si
pkt_out:
	pop	cx
	popf
	pop	bp
	ret

	idt	_bfr_init
	ldef	_bfr_init
;------------------------------------------------------------------------
_bfr_init:		; buf_off, bfr_numb, bfr_size, pending
;------------------------------------------------------------------------
	push	bp
	mov	bp,sp

	mov	ax,[bp+6]
	mov	cs:[bfr_base],ax
	mov	cs:[bfr_prev+0],ax
	mov	cs:[bfr_prev+2],ds

	mov	ax,[bp+8]
	mov	cs:[bfr_numb],ax

	mov	ax,[bp+10]
	mov	cs:[bfr_size],ax

	mul	cs:[bfr_numb]
	add	ax,cs:[bfr_prev]
	mov	cs:[bfr_end],ax

	mov	ax,[bp+12]
	mov	cs:[pending],ax

	pop	bp
	retfar

	idt	_off_init
	ldef	_off_init
;------------------------------------------------------------------------
_off_init:		; remote.offset, local.offset
;------------------------------------------------------------------------
	push	bp
	mov	bp,sp

	mov	ax,[bp+6]
	mov	cs:[rem_off],ax

	mov	ax,[bp+8]
	mov	cs:[lcl_off],ax

	pop	bp
	retfar

	idt	_pkt_sync_send
	ldef	_pkt_sync_send
;------------------------------------------------------------------------
_pkt_sync_send:	; _pkt_sync_send(void interrupt (far *)(), void *, unsigned)
;------------------------------------------------------------------------
	push	bp
	mov	bp,sp
	mov	ah,4
	mov	si,[bp+10]
	mov	cx,[bp+12]
	pushf
	cli
	callseg	[bp+6]
	mov	ax,0
	jnc	sync_done
	mov	al,dh
sync_done:
	pop	bp
	retfar

	idt	_pkt_async_send
	ldef	_pkt_async_send
;------------------------------------------------------------------------
_pkt_async_send:	; _pkt_async_send(void interrupt (far *)(), IOCB *)
;------------------------------------------------------------------------
	push	bp
	mov	bp,sp
	mov	ah,12
	mov	di,ds
	mov	es,di
	mov	di,[bp+10]
	pushf
	cli
	callseg	[bp+6]
	mov	ax,0
	jnc	async_done
	mov	al,dh
async_done:
	pop	bp
	retfar

        end
