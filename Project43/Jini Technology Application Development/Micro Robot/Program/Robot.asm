;Robot ID is #1
	org	00h
	ljmp	main

	org	03h
	ljmp	crashing

	org	0Bh
	ljmp	pinging

	org	013h
	ljmp	alerting

	org	40h

;+---------------------------------------------+
;|             Robot to Deamon                 |
;+---------------------------------------------+
;REQSEND	equ	10000000b
CRASHEVENT	equ	11110000b
CRASHEALERT	equ	11111000b
PING		equ	11000000b

;+---------------------------------------------+
;|             Deamon to Robot                 |
;+---------------------------------------------+
;ACKFORSEND	equ	01111000b
F_CONTROL	equ	01001000b
B_CONTROL	equ	01010000b
L_CONTROL	equ	01011000b
R_CONTROL	equ	01100000b
S_CONTROL	equ	01101000b

;+---------------------------------------------+
;|                 Subrutine                   |
;+---------------------------------------------+
packID:				;signal must in ACC
	push	B
	mov	P0,#0FFh
	mov	B,P0
	anl	B,#0F0h

	push	ACC
	mov	A,B
	swap	A
	mov	B,A
	pop	ACC

	orl	A,B
	pop	B
	ret

initSerial:
	mov     TMOD,#20H
	mov     SCON,#52H  
	mov     TH1,#0E8H      ;1200 Hz
;	mov     TH1,#0fdH       ;9600 Hz
	setb	TR1
	ret

printString:			;use DPTR point to String label
	push	ACC
	mov	A,0h
again:	push	ACC
	movc	A,@A+DPTR
	cjne	A,#0h,printIt
	sjmp	stringExhaust
printIt:
	lcall	sendByte
	pop	ACC
	inc	ACC
	sjmp	again
stringExhaust:
	pop	ACC
	pop	ACC
	ret

sendByte:
        jnb     TI,$
        clr     TI
	mov     SBUF,A
;	mov	P3,A
	clr     TI
        ret

receive:
;        jnb     RI,$
        clr     RI
        mov     A,SBUF ;Data entry must be in A
	clr	RI
        ret

delay:      

	push	07h
	push	06h
	push	05h
	push	04h
	push	03h
	push	02h

	mov	R2,#0FFh
d0:
	mov	R3,#0FFh
d1:	
	mov	R4,#0FFh
d2:	
	mov	R5,#0FFh
d3:       
	mov     R6,#0FFH
D4:       
	mov     R7,#0FFH
	djnz    R6,$
        djnz    R7,$
	djnz	R5,$
	djnz	R4,$
	djnz	R3,$
	djnz	R2,d0

	pop	02h
	pop	03h
	pop	04h
	pop	05h
	pop	06h
	pop	07h
	ret

forward:
        mov     P2,#0Dh
        ret

backward:
        mov     P2,#07h
        ret

turnLeft:
        mov     P2,#01h
        push    ACC
        push    B
        mov     a,#0f0h
        mov     b,#0f0h
	lcall   delay
        pop     B
        pop     ACC
	lcall	forward
        ret

turnRight:
        mov     P2,#0Ch
        push    ACC
        push    B
        mov     a,#0f0h
        mov     b,#0f0h
	lcall   delay
        pop     B
        pop     ACC
	lcall	forward
        ret

stop:
        mov     P2,#0h
        ret

cwSpin:
        mov     P2,#0Fh
        ret

ccwSpin:
        mov     P2,#05h
        ret

control:
	push	ACC
	anl	A,#00111000b
	cjne	A,#00001000b,not_forward
	lcall	forward
	sjmp	control_done
not_forward:
	cjne	A,#00010000b,not_backward
	lcall	backward
	sjmp	control_done
not_backward:
	cjne	A,#00011000b,not_turnLeft
	lcall	ccwSpin
	sjmp	control_done
not_turnLeft:
	cjne	A,#00100000b,not_turnRight
	lcall	cwSpin
	sjmp	control_done
not_turnRight:
	cjne	A,#00101000b,not_stop
	lcall	stop
	sjmp	control_done
not_stop:
control_done:
	pop	ACC
	ret

;+---------------------------------------------+
;|                Main Program                 |
;+---------------------------------------------+
main:
	lcall	stop
	lcall	initSerial

;---------- init interrupt ------------------
	setb	EA
	mov	IP,#0FDh
		;----------------------- init external interrupt
	setb	IT0			;use edge trick
	setb	EX0			;set it enable

	setb	IT1			;use edge trick
	setb	EX1			;set it enable

		;----------------------- init timer 1 interrupt
	mov	TH0,#0FFh
	setb	ET0			;set it enable
	setb	TR0			;starting

begin:
	clr	A
	jnb	RI,$
	lcall	receive
;	mov	A,P1
;	lcall	sendByte
	push	ACC
	mov	P0,#0FFh
	mov	B,P0
	push	ACC
	mov	A,B
	swap	A
	mov	B,A
	pop	ACC
	anl	B,#07h
	anl	A,#07h
	cjne	A,B,not_my_byte
	pop	ACC
	jnb	ACC.7,controlCommand
AckSend:
	sjmp	loop_again
controlCommand:
	
	lcall	control
	sjmp	loop_again
not_my_byte:
;	mov	A,#'N'
;	lcall	sendByte
	pop	ACC
loop_again:
	sjmp	begin
;end_main

;+---------------------------------------------+
;|                Service Rutine               |
;+---------------------------------------------+
alerting:
	push	ACC
	push	B
	push	01h
	push	PSW

	mov	R1,#021h

	push	ACC
	mov	A,@R1
	anl	A,#0F0h
	mov	@R1,A
	pop	ACC

	cjne	@R1,#10h,send_signal_alert
	mov	@R1,#00h
	sjmp	alert_done
;--- before send must be request to send
	
send_signal_alert:
;	mov	P0,#0FFh
;	mov	B,P0
;	anl	B,#0F0h

;	push	ACC
;	mov	A,B
;	swap	A
;	mov	B,A
;	pop	ACC

	mov	A,#CRASHEALERT
	lcall	packID
;	orl	A,B
	lcall	sendByte
	mov	@R1,#10h
;	mov	DPTR,#CrashAlert
;	lcall	printString

;	mov	A,#'1'
;	lcall	sendByte

alert_done:
	pop	PSW
	pop	01h
	pop	B
	pop	ACC
	reti

crashing:
	push	ACC
	push	B
	push	01h
	push	PSW

	mov	R1,#022h

	push	ACC
	mov	A,@R1
	anl	A,#0Fh
	mov	@R1,A
	pop	ACC

	cjne	@R1,#01h,send_signal_crash
	mov	@R1,#00h
	sjmp	crash_done
;--- before send must be request to send
send_signal_crash:
;	mov	P0,#0FFh
;	mov	B,P0
;	anl	B,#0F0h

;	push	ACC
;	mov	A,B
;	swap	A
;	mov	B,A
;	pop	ACC
	mov	A,#CRASHEVENT
	lcall	packID
;	orl	A,B
	
	lcall	sendByte
	lcall	stop
	lcall	cwSpin
	lcall	delay
	lcall	delay
	lcall	stop
	mov	@R1,#01h

;	mov	DPTR,#Crash
;	lcall	printString

;	mov	A,#'0'
;	lcall	sendByte

crash_done:
	pop	PSW
	pop	02h
	pop	B
	pop	ACC
	reti

pinging:
	push	ACC
	push	B
        push    01h
	push	PSW

        mov     R1,#20h

        cjne    @R1,#00h,not_send
        mov     @R1,#0FFh

;	mov	P0,#0FFh
;	mov	B,P0
;	anl	B,#0F0h
;	push	ACC
;	mov	A,B
;	swap	A
;	mov	B,A
;	pop	ACC

	mov	A,#PING
	lcall	packID
;	mov	P1,A
	lcall	sendByte
        sjmp    ready_to_ret

;	mov	DPTR,#Stanby
;	lcall	printString

;	mov	A,#'P'
;	lcall	sendByte
not_send:
        dec     @R1

ready_to_ret:
        pop     PSW
        pop     01h
	pop	B
	pop	ACC
	reti
end
