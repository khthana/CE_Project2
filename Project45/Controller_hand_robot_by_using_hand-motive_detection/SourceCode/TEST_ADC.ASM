        ORG 0000H        
        Port3C EQU 0A002H
;****** Main Program **********
MAIN:   MOV DPTR,#Port3C
        MOV A,#00000000B
        MOVX @DPTR,A
        SETB P2.3
        SETB P2.4
        CLR  P2.4
        CALL DELAY 
        SJMP MAIN

;**********DELAY**********
DELAY:  MOV R0,#0FFH                    
DELAY2: MOV R1,#0AH                    
DELAY1: DJNZ R1,DELAY1
        DJNZ R0,DELAY2
	RET
	END
