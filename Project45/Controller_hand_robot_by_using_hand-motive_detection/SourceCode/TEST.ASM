        ORG 0000H        
        Port1A EQU 06800H
        Port1B EQU 06801H
        Port1C EQU 06802H
        Port2A EQU 0A800H
        Port2B EQU 0A801H
        Port2C EQU 0A802H
        Port3A EQU 0C800H
        Port3B EQU 0C801H
        Port3C EQU 0C802H
        ST_ADC EQU P2.4
        OUT_EN EQU P2.3
        D_Buff EQU 60H
;****** Main Program **********
MAIN:

M_DRV:  MOV DPTR,#Port2C
        MOV A,#00010001B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00100010B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#01000100B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#10001000B
        MOVX @DPTR,A
        CALL DELAY
        JMP MAIN

;**********DELAY**********
DELAY:  MOV R0,#0FFH                    
DELAY2: MOV R1,#04H                    
DELAY1: DJNZ R1,DELAY1
        DJNZ R0,DELAY2
	RET
	END
