;**************************************
; Program    : Multi Keyboard
; Date       : 2 November 2001
; Program by : MR. Samart   Sangunsup
; Email      : au_goblin@yahoo.com
;**************************************

;--------------------------------------
; Data
;--------------------------------------

; pcon.7 SMOD set Timer 1 is used to generate baud rate

; TMOD.7 GATE
;       Gating control when set. Timer/Counter x is enabled only
;       while INTx pin is high and TRx control pin is set. When
;       cleared, Timer x is enabled whenever TRx control bit is set.
; TMOD.6 C/T(bar)
;       Timer or Counter Selector cleared for Timer operation
;       (input from internal system clock). Set for Counter
;       operation (input from Tx input pin).
; TMOD.5 M1
;       Mode bit 1
; TMOD.4 M2
;       Mode bit 0
; TMOD.3 - TMOD.0
;       Same TMOD.7-TMOD.4 it is TMOD.7-.4 is Timer1 TMOD.3-.0 is Timer0


; Baud rate     Fosc        SMOD       C/T(bar)    Mode    Reload value
;   19.2K     11.059 MHz      1           0          2          FDH
;    9.6K     11.059 MHz      0           0          2          FDH
;    4.8K     11.059 MHz      0           0          2          FAH
;    2.4K     11.059 MHz      0           0          2          F4H
;    1.2K     11.059 MHz      0           0          2          E8H                


; SCON.7 SM0
; SCON.6 SM1
; SCON.5 SM2
;       Serial port mode
; SCON.4 REN
;       Enables serial reception. Set by software to enable reception. 
;       Clear by software to disable reception.
; SCON.3 TB8
;       The 9th data bit that will be transmitted in Modes 2 and 3. Set or clear by software.
; SCON.2 RB8
;       In Modes 2 and 3, the 9th data bit that was received. In Mode 1, if SM2 = 0, 
;       RB8 is the stop bit that was received. In Mode 0, RB8 is not used.
; SCON.1 TI
;       Transmit interrupt flag. Set by hardware at the end of the 8th bit time in Mode 0, 
;       or at the beginning of the stop bit in the other modes, in any serial transmission. 
;       Must be cleared by software.
; SCON.0 RI
;       Receive interrupt flag. Set by hardware at the end of the 8th bit time in Mode 0, 
;       or halfway through the stop bit time in the other modes, in any serial reception 
;       (except see SM2). Must be cleared by software.


; TCON.7 TF1
;       Timer 1 overflow flag.
; TCON.6 TR1
;       Timer 1 run control bit.
; TCON.5 TF0
;       Timer 0 overflow flag.
; TCON.4 TR0
;       Timer 0 run control bit.
; TCON.3 IE1
;       Interrupt 1 edge flag. Set by hardware when external interrupt edge detected. 
;       Cleared when interrupt processed.
; TCON.2 IT1
;       Interrupt 1 type control bit. Set/cleared by software to specify falling 
;       edge/low level triggered external interrupts.
; TCON.1 IE0
;       Interrupt 0 edge flag. Set by hardware when external interrupt edge detected. 
;       Cleared when interrupt processed.
; TCON.0 IT0
;       Interrupt 0 type control bit. Set/cleared by software to specify falling 
;       edge/low level triggered external interrupts.


;--------------------------------------
; Memory
;--------------------------------------

; 20H-27H   Account 1
; 28H-2FH   Account 2
; 30H-37H   Account 3
; 38H-3FH   Account 4
; 40H-47H   Account 5
; 48H-4FH   Account 6
; 50H-57H   Account 7
; 58H-5FH   Account 8
; 60H-67H   Account 9
; 68H-6FH   Account 10
; 70H-77H   Account 11
; 78H-7FH   Account 12

;--------------------------------------
; Defind Port
;--------------------------------------


;--------------------------------------
; Defind user registry
;--------------------------------------

PCON    EQU 87H
TCON    EQU 88H
TR0     EQU TCON+4
TR1     EQU TCON+6
TMOD    EQU 89H
TL1     EQU 8BH
TH1     EQU 8DH
SCON    EQU 98H
RI      EQU SCON+0
TI      EQU SCON+1
REN     EQU SCON+4
ACC     EQU 0E0H
IE      EQU 0A8H
EX0     EQU IE+0
ET0     EQU IE+1
ES      EQU IE+4
EA      EQU IE+7
PSW     EQU 0D0H
P0      EQU 80H
P1      EQU 90H
P2      EQU 0A0H
P3      EQU 0B0H
SBUF    EQU 99H
TH0     EQU 8CH
TL0     EQU 8AH

;--------------------------------------
; Main Program
;--------------------------------------

                ORG     0000H
                LJMP    MAIN
                ORG     0003H
                LJMP    INT0_ISR
                ORG     000BH
                LJMP    Timer0_ISR
                ORG     0023H
                LJMP    Serial_ISR
                ORG     0040H
                
MAIN:           MOV     A,PCON                      ; pcon.7 set Timer 1 is used to generate baud rate
                CLR     ACC.7
                MOV     PCON,A
                MOV     SCON,#50H                   ; Serial mode2 reception claer TI clear RI
                MOV     TMOD,#21H                   ; 0010 0010 set timer0 mode 1, timer1 mode 2
                MOV     TH1,#0FDH
                MOV     TL1,#0FDH

                MOV     R0,#20H                     ; Init recieve pointer
                MOV     R1,#20H                     ; Init transmit pointer
                MOV     R2,#0                       ; Init counter
                CLR     P3.7                        ; Enable Rx Disable Tx
               
                SETB    EA                          ; Enable all interupt
                SETB    ES                          ; Enable serial port interupt
                SETB    REN                         ; Enable recieve 
                SETB    ET0                         ; Enable timer0 interupt 
                SETB    TR1                         ; Start timer1
                
LOOP:           LJMP    LOOP

;--------------------------------------
; Delay 1 sec
;--------------------------------------

DELAY_50ms:     MOV     7,#50            	; Do 50 time
DELAY_50ms_1:   MOV     6,#0E6H           	; Each loop = 1 ms
DELAY_50ms_2:   NOP
                NOP
                DJNZ    R6,DELAY_50ms_2
                DJNZ    R7,DELAY_50ms_1
END_DELAY_50ms: RET


DELAY_10ms:     MOV     7,#010            	; Do 10 time
DELAY_10ms_1:   MOV     6,#0E6H           	; Each loop = 1 ms
DELAY_10ms_2:   NOP
                NOP
                DJNZ    R6,DELAY_10ms_2
                DJNZ    R7,DELAY_10ms_1
                RET

DELAY_1s:       MOV     5,#100            	; Do 100 times
DELAY_1s_1:     LCALL   DELAY_10ms
                DJNZ    R5,DELAY_1s_1
                RET
                
;--------------------------------------
; Serial service routine 
;--------------------------------------

Serial_ISR:     PUSH    PSW
                PUSH    ACC
                
                JNB     RI,End_Serial               ; If not recieve then end ISR
                
                CLR     RI                          ; Ready to recieve data
                CLR     EX0                         ; Disable Tx
                MOV     @R0,SBUF
                INC     R0                          ; Increment Rx pointer
                INC     R2
                
                CJNE    R2,#09H,Serial_ISR2          ; If data not equal 8 then start timer

                CLR     TR0                         ; Disable timer
                ;DEC     R0                          ; Not keep 'Enter'
                MOV     R2,#0                       ; Reset counter
                SETB    EX0                         ; Enable INT0 to show have data
                CJNE    R0,#80H,End_Serial
                MOV     R0,#20H
                LJMP    End_Serial

Serial_ISR2:    MOV     TH0,#00H
                MOV     TL0,#00H
                SETB    TR0

End_Serial:     POP     ACC
                POP     PSW
                RETI

;--------------------------------------
; Timer0 interupt service routine
;--------------------------------------

Timer0_ISR:     PUSH    PSW
                PUSH    ACC

                CLR     TR0
                CLR     C
                MOV     A,R0                        ; Subb Rx pointer with counter
                SUBB    A,R2
                MOV     R0,A
                MOV     R2,#0

END_Timer0:     POP     ACC
                POP     PSW
                RETI

;--------------------------------------
; INT0 interupt service routine
;--------------------------------------

INT0_ISR:       PUSH    PSW
                PUSH    ACC

                SETB    P3.7
                MOV     R3,#9
INT0_ISR1:      MOV     A,@R1
                MOV     SBUF,A
                JNB     TI,$
                CLR     TI
                INC     R1
                DJNZ    R3,INT0_ISR1

; Send door number and enter

                MOV     SBUF,#'8'
                JNB     TI,$
                CLR     TI

; Delay for send only 1 account a time

                LCALL   DELAY_50ms

; if pointer equal last data address then move it point to first address
                CJNE    R1,#80H,INT0_ISR2
                MOV     R1,#20H
                
INT0_ISR2:      MOV     A,R0
                CLR     C
                SUBB    A,R1
                JNZ     END_INT0
                CLR     EX0                

END_INT0:       CLR     P3.7
                POP     ACC
                POP     PSW
                RETI

                END