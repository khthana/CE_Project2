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
; Data memory
;--------------------------------------

; 21H-29H       Account 1
; 2AH-32H       Account 2
; 33H-3BH       Account 3
; 3CH-44H       Account 4
; 45H-4DH       Account 5
; 4EH-56H       Account 6
; 57H-6FH       Account 7
; 70H-78H       Account 8


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

REG     EQU 20H
Flag    EQU REG+0

;--------------------------------------
; Main Program
;--------------------------------------

                ORG     0000H
                LJMP    MAIN
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

                MOV     R0,#31H                     ; Init recieve pointer
                MOV     R1,#31H
                
                SETB    EA                          ; Enable all interupt
                SETB    ES                          ; Enable serial port interupt
                SETB    REN                         ; Enable recieve 
                SETB    ET0                         ; Enable timer0 interupt 
                SETB    TR1                         ; Start timer1

                
                MOV     A,#11111110B
MAIN1:          MOV     P1,A
                CLR     Flag                        ; Tell not have data 
                LCALL   DELAY_50ms
                RL      A
                LJMP    MAIN1

;--------------------------------------
; Delay 1 sec
;--------------------------------------

DELAY_50ms:     MOV     7,#50            	; Do 50 time
DELAY_50ms_1:   MOV     6,#0E6H           	; Each loop = 1 ms
DELAY_50ms_2:   JB      FLAG,END_DELAY_50ms
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
                
                
                CLR     TR0
                CLR     RI                          ; Ready to recieve data
                MOV     @R0,SBUF
                INC     R0                          ; Increment Rx pointer
                
                CJNE    R0,#3BH,Serial_ISR2         ; If data not equal 9 then start timer

                
                CLR     TR0
                LCALL   SEND_DATA
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
                MOV     R0,#31H

                SETB    Flag
                POP     ACC
                POP     PSW
                RETI

;--------------------------------------
; INT0 interupt service routine
;--------------------------------------

SEND_DATA:      PUSH    PSW
                PUSH    ACC

                MOV     R3,#10
SEND_DATA1:     MOV     A,@R1
                MOV     SBUF,A
                JNB     TI,$
                CLR     TI
                INC     R1
                DJNZ    R3,SEND_DATA1

; Send Floor number and enter

;                MOV     SBUF,#'1'
;                JNB     TI,$
;                CLR     TI
                
                MOV     R0,#31H
                MOV     R1,#31H

                
END_INT0:       SETB    Flag
                POP     ACC
                POP     PSW
                RET

                END