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

;****** Main Program *********************
START:  MOV A,#00H
        CALL RD_SEN
        MOV 60H,A

        MOV A,#01H
        CALL RD_SEN
        MOV 61H,A

        MOV A,#02H
        CALL RD_SEN
        MOV 62H,A

        MOV A,#03H
        CALL RD_SEN
        MOV 63H,A

        MOV A,#04H
        CALL RD_SEN
        MOV 64H,A

        MOV A,#05H
        CALL RD_SEN
        MOV 65H,A

        MOV A,#06H
        CALL RD_SEN
        MOV 66H,A

        MOV A,#07H
        CALL RD_SEN
        MOV 67H,A

        MOV A,#08H
        CALL RD_SEN
        MOV 68H,A

        MOV A,#09H
        CALL RD_SEN
        MOV 69H,A

        MOV A,#0AH
        CALL RD_SEN
        MOV 6AH,A

        MOV A,#0BH
        CALL RD_SEN
        MOV 6BH,A

        MOV A,#0CH
        CALL RD_SEN
        MOV 6CH,A

        MOV A,#0DH
        CALL RD_SEN
        MOV 6DH,A

        MOV A,#0EH
        CALL RD_SEN
        MOV 6EH,A

        MOV A,#0FH
        CALL RD_SEN
        MOV 6FH,A

MAIN_0: MOV A,#00H
        CALL RD_SEN
        MOV A,R3
        CJNE A,60H,COMP_0
        JMP MAIN_1 
COMP_0: JC J_MR0
        JMP ML0
J_MR0:  JMP MR0

MAIN_1: MOV A,#01H
        CALL RD_SEN
        MOV A,R3
        CJNE A,61H,COMP_1
        JMP MAIN_2 
COMP_1: JC J_MR1
        JMP ML1
J_MR1:  JMP MR1


MAIN_2: MOV A,#02H
        CALL RD_SEN
        MOV A,R3
        CJNE A,62H,COMP_2
        JMP MAIN_3 
COMP_2: JC J_MR2
        JMP ML2
J_MR2:  JMP MR2

MAIN_3: MOV A,#03H
        CALL RD_SEN
        MOV A,R3
        CJNE A,63H,COMP_3
        JMP MAIN_4 
COMP_3: JC J_MR3
        JMP ML3
J_MR3:  JMP MR3

MAIN_4: MOV A,#04H
        CALL RD_SEN
        MOV A,R3
        CJNE A,64H,COMP_4
        JMP MAIN_5 
COMP_4: JC J_MR4
        JMP ML4
J_MR4:  JMP MR4

MAIN_5: MOV A,#05H
        CALL RD_SEN
        MOV A,R3
        CJNE A,65H,COMP_5
        JMP MAIN_6 
COMP_5: JC J_MR5
        JMP ML5
J_MR5:  JMP MR5

MAIN_6: MOV A,#06H
        CALL RD_SEN
        MOV A,R3
        CJNE A,66H,COMP_6
        JMP MAIN_7 
COMP_6: JC J_MR6
        JMP ML6
J_MR6:  JMP MR6

MAIN_7: MOV A,#07H
        CALL RD_SEN
        MOV A,R3
        CJNE A,67H,COMP_7
        JMP MAIN_8 
COMP_7: JC J_MR7
        JMP ML7
J_MR7:  JMP MR7

MAIN_8: MOV A,#08H
        CALL RD_SEN
        MOV A,R3
        CJNE A,68H,COMP_8
        JMP MAIN_9 
COMP_8: JC J_MR8
        JMP ML8
J_MR8:  JMP MR8

MAIN_9: MOV A,#09H
        CALL RD_SEN
        MOV A,R3
        CJNE A,69H,COMP_9
        JMP MAIN_A 
COMP_9: JC J_MR9
        JMP ML9
J_MR9:  JMP MR9

MAIN_A: MOV A,#0AH
        CALL RD_SEN
        MOV A,R3
        CJNE A,6AH,COMP_A
        JMP MAIN_B 
COMP_A: JC J_MRA
        JMP MLA
J_MRA:  JMP MRA

MAIN_B: MOV A,#0BH
        CALL RD_SEN
        MOV A,R3
        CJNE A,6BH,COMP_B
        JMP MAIN_D
COMP_B: JC J_MRB
        JMP MLB
J_MRB:  JMP MRB

;MAIN_C: MOV A,#0CH
;        CALL RD_SEN
;        MOV A,R3
;        CJNE A,6CH,COMP_C
;        JMP MAIN_D 
;COMP_C: JC J_MRC
;        JMP MLC
;J_MRC:  JMP MRC

MAIN_D: MOV A,#0DH
        CALL RD_SEN
        MOV A,R3
        CJNE A,6DH,COMP_D
        JMP MAIN_E 
COMP_D: JC J_MRD
        JMP MLD
J_MRD:  JMP MRD

MAIN_E: MOV A,#0EH
        CALL RD_SEN
        MOV A,R3
        CJNE A,6EH,COMP_E
        JMP MAIN_0 
COMP_E: JC J_MRE
        JMP MLE
J_MRE:  JMP MRE

;------ Drive 1st motor --------
MR0:    MOV DPTR,#Port1A
        CLR C          
        MOV A,60H
        SUBB A,R3
        MOV R7,A
MR0_1:  MOV R6,#0AH
MR0_2:  CALL DRV_R1
        DJNZ R6,MR0_2
        DJNZ R7,MR0_1
        MOV A,R3
        MOV 60H,A
        JMP MAIN_1

ML0:    MOV DPTR,#Port1A
        CLR C
        MOV A,R3
        SUBB A,60H
        MOV R7,A
ML0_1:  MOV R6,#0AH
ML0_2:  CALL DRV_L1
        DJNZ R6,ML0_2
        DJNZ R7,ML0_1
        MOV A,R3
        MOV 60H,A
        JMP MAIN_1

;------ Drive 2nd motor --------
MR1:    MOV DPTR,#Port1B
        CLR C
        MOV A,61H
        SUBB A,R3
        MOV R7,A
MR1_1:  MOV R6,#0AH
MR1_2:  CALL DRV_R1
        DJNZ R6,MR1_2
        DJNZ R7,MR1_1
        MOV A,R3
        MOV 61H,A
        JMP MAIN_2

ML1:    MOV DPTR,#Port1B
        CLR C
        MOV A,R3
        SUBB A,61H
        MOV R7,A
ML1_1:  MOV R6,#0AH
ML1_2:  CALL DRV_L1
        DJNZ R6,ML1_2
        DJNZ R7,ML1_1
        MOV A,R3
        MOV 61H,A
        JMP MAIN_2

;------ Drive 3rd motor --------
MR2:    MOV DPTR,#Port1B
        CLR C
        MOV A,62H
        SUBB A,R3
        MOV R7,A
MR2_1:  MOV R6,#0FH
MR2_2:  CALL DRV_R2
        DJNZ R6,MR2_2
        DJNZ R7,MR2_1
        MOV A,R3
        MOV 62H,A
        JMP MAIN_3

ML2:    MOV DPTR,#Port1B
        CLR C
        MOV A,R3
        SUBB A,62H
        MOV R7,A
ML2_1:  MOV R6,#0FH
ML2_2:  CALL DRV_L2
        DJNZ R6,ML2_2
        DJNZ R7,ML2_1
        MOV A,R3
        MOV 62H,A
        JMP MAIN_3

;------ Drive 4th motor --------
MR3:    MOV DPTR,#Port1C
        CLR C
        MOV A,63H
        SUBB A,R3
        MOV R7,A
MR3_1:  MOV R6,#08H
MR3_2:  CALL DRV_R1
        DJNZ R6,MR3_2
        DJNZ R7,MR3_1
        MOV A,R3
        MOV 63H,A
        JMP MAIN_4

ML3:    MOV DPTR,#Port1C
        CLR C
        MOV A,R3
        SUBB A,63H
        MOV R7,A
ML3_1:  MOV R6,#08H
ML3_2:  CALL DRV_L1
        DJNZ R6,ML3_2
        DJNZ R7,ML3_1
        MOV A,R3
        MOV 63H,A
        JMP MAIN_4

;------ Drive 5th motor --------
MR4:    MOV DPTR,#Port2A
        CLR C
        MOV A,64H
        SUBB A,R3
        MOV R7,A
MR4_1:  MOV R6,#08H
MR4_2:  CALL DRV_R1
        DJNZ R6,MR4_2
        DJNZ R7,MR4_1
        MOV A,R3
        MOV 64H,A
        JMP MAIN_5

ML4:    MOV DPTR,#Port2A
        CLR C
        MOV A,R3
        SUBB A,64H
        MOV R7,A
ML4_1:  MOV R6,#08H
ML4_2:  CALL DRV_L1
        DJNZ R6,ML4_2
        DJNZ R7,ML4_1
        MOV A,R3
        MOV 64H,A
        JMP MAIN_5

;------ Drive 6th motor --------
MR5:    MOV DPTR,#Port2A
        CLR C
        MOV A,65H
        SUBB A,R3
        MOV R7,A
MR5_1:  MOV R6,#0AH
MR5_2:  CALL DRV_R2
        DJNZ R6,MR5_2
        DJNZ R7,MR5_1
        MOV A,R3
        MOV 65H,A
        JMP MAIN_6

ML5:    MOV DPTR,#Port2A
        CLR C
        MOV A,R3
        SUBB A,65H
        MOV R7,A
ML5_1:  MOV R6,#0AH
ML5_2:  CALL DRV_L2
        DJNZ R6,ML5_2
        DJNZ R7,ML5_1
        MOV A,R3
        MOV 65H,A
        JMP MAIN_6

;------ Drive 7th motor --------
MR6:    MOV DPTR,#Port2B
        CLR C
        MOV A,66H
        SUBB A,R3
        MOV R7,A
MR6_1:  MOV R6,#08H
MR6_2:  CALL DRV_R1
        DJNZ R6,MR6_2
        DJNZ R7,MR6_1
        MOV A,R3
        MOV 66H,A
        JMP MAIN_7

ML6:    MOV DPTR,#Port2B
        CLR C
        MOV A,R3
        SUBB A,66H
        MOV R7,A
ML6_1:  MOV R6,#08H
ML6_2:  CALL DRV_L1
        DJNZ R6,ML6_2
        DJNZ R7,ML6_1
        MOV A,R3
        MOV 66H,A
        JMP MAIN_7

;------ Drive 8th motor --------
MR7:    MOV DPTR,#Port2B
        CLR C
        MOV A,67H
        SUBB A,R3
        MOV R7,A
MR7_1:  MOV R6,#08H
MR7_2:  CALL DRV_R2
        DJNZ R6,MR7_2
        DJNZ R7,MR7_1
        MOV A,R3
        MOV 67H,A
        JMP MAIN_8

ML7:    MOV DPTR,#Port2B
        CLR C
        MOV A,R3
        SUBB A,67H
        MOV R7,A
ML7_1:  MOV R6,#08H
ML7_2:  CALL DRV_L2
        DJNZ R6,ML7_2
        DJNZ R7,ML7_1
        MOV A,R3
        MOV 67H,A
        JMP MAIN_8

;------ Drive 9th motor --------
MR8:    MOV DPTR,#Port2C
        CLR C
        MOV A,68H
        SUBB A,R3
        MOV R7,A
MR8_1:  MOV R6,#0AH
MR8_2:  CALL DRV_R1
        DJNZ R6,MR8_2
        DJNZ R7,MR8_1
        MOV A,R3
        MOV 68H,A
        JMP MAIN_9

ML8:    MOV DPTR,#Port2C
        CLR C
        MOV A,R3
        SUBB A,68H
        MOV R7,A
ML8_1:  MOV R6,#0AH
ML8_2:  CALL DRV_L2
        DJNZ R6,ML8_2
        DJNZ R7,ML8_1
        MOV A,R3
        MOV 68H,A
        JMP MAIN_9

;------ Drive 10th motor --------
MR9:    MOV DPTR,#Port3A
        CLR C
        MOV A,69H
        SUBB A,R3
        MOV R7,A
MR9_1:  MOV R6,#08H
MR9_2:  CALL DRV_R1
        DJNZ R6,MR9_2
        DJNZ R7,MR9_1
        MOV A,R3
        MOV 69H,A
        JMP MAIN_A

ML9:    MOV DPTR,#Port3A
        CLR C
        MOV A,R3
        SUBB A,69H
        MOV R7,A
ML9_1:  MOV R6,#08H
ML9_2:  CALL DRV_L1
        DJNZ R6,ML9_2
        DJNZ R7,ML9_1
        MOV A,R3
        MOV 69H,A
        JMP MAIN_A

;------ Drive 11th motor --------
MRA:    MOV DPTR,#Port3A
        CLR C
        MOV A,6AH
        SUBB A,R3
        MOV R7,A
MRA_1:  MOV R6,#08H
MRA_2:  CALL DRV_R2
        DJNZ R6,MRA_2
        DJNZ R7,MRA_1
        MOV A,R3
        MOV 6AH,A
        JMP MAIN_B

MLA:    MOV DPTR,#Port3A
        CLR C
        MOV A,R3
        SUBB A,6AH
        MOV R7,A
MLA_1:  MOV R6,#08H
MLA_2:  CALL DRV_L2
        DJNZ R6,MLA_2
        DJNZ R7,MLA_1
        MOV A,R3
        MOV 6AH,A
        JMP MAIN_B

;------ Drive 12th motor --------
MRB:    MOV DPTR,#Port3B
        CLR C
        MOV A,6BH
        SUBB A,R3
        MOV R7,A
MRB_1:  MOV R6,#0AH
MRB_2:  CALL DRV_R1
        DJNZ R6,MRB_2
        DJNZ R7,MRB_1
        MOV A,R3
        MOV 6BH,A
        JMP MAIN_D

MLB:    MOV DPTR,#Port3B
        CLR C
        MOV A,R3
        SUBB A,6BH
        MOV R7,A
MLB_1:  MOV R6,#0AH
MLB_2:  CALL DRV_L1
        DJNZ R6,MLB_2
        DJNZ R7,MLB_1
        MOV A,R3
        MOV 6BH,A
        JMP MAIN_D

;------ Drive 13th motor --------
;MRC:    MOV DPTR,#Port3B
;        CLR C
;        MOV A,6CH
;        SUBB A,R3
;        MOV R7,A
;MRC_1:  MOV R6,#08H
;MRC_2:  CALL DRV_R1
;        DJNZ R6,MRC_2
;        DJNZ R7,MRC_1
;        MOV A,R3
;        MOV 6CH,A
;        JMP MAIN_D
;
;MLC:    MOV DPTR,#Port3B
;        CLR C
;        MOV A,R3
;        SUBB A,6CH
;        MOV R7,A
;MLC_1:  MOV R6,#08H
;MLC_2:  CALL DRV_L1
;        DJNZ R6,MLC_2
;        DJNZ R7,MLC_1
;        MOV A,R3
;        MOV 6CH,A
;        JMP MAIN_D
;
;------ Drive 14th motor --------
MRD:    MOV DPTR,#Port3B
        CLR C
        MOV A,6DH
        SUBB A,R3
        MOV R7,A
MRD_1:  MOV R6,#08H
MRD_2:  CALL DRV_R2
        DJNZ R6,MRD_2
        DJNZ R7,MRD_1
        MOV A,R3
        MOV 6DH,A
        JMP MAIN_E

MLD:    MOV DPTR,#Port3B
        CLR C
        MOV A,R3
        SUBB A,6DH
        MOV R7,A
MLD_1:  MOV R6,#08H
MLD_2:  CALL DRV_L2
        DJNZ R6,MLD_2
        DJNZ R7,MLD_1
        MOV A,R3
        MOV 6DH,A
        JMP MAIN_E

;------ Drive 15th motor --------
;MRE:    MOV DPTR,#Port3B
;        CLR C
;        MOV A,6EH
;        SUBB A,R3
;        MOV R7,A
;MRE_1:  MOV R6,#0AH
;MRE_2:  CALL DRV_R1
;        DJNZ R6,MRE_2
;        DJNZ R7,MRE_1
;        MOV A,R3
;        MOV 6EH,A
;        JMP MAIN_F
;
;MLE:    MOV DPTR,#Port3B
;        CLR C
;        MOV A,R3
;        SUBB A,6EH
;        MOV R7,A
;MLE_1:  MOV R6,#0AH
;MLE_2:  CALL DRV_L1
;        DJNZ R6,MLE_2
;        DJNZ R7,MLE_1
;        MOV A,R3
;        MOV 6EH,A
;        JMP MAIN_F
;
;------ Drive 16th motor --------
MRE:    MOV DPTR,#Port1A
        CLR C
        MOV A,6EH
        SUBB A,R3
        MOV B,#0FH
        DIV AB
        MOV R7,A
MRE_1:  CALL DRV_R1
        DJNZ R7,MRE_1
        MOV A,R3
        MOV 6EH,A
        JMP MAIN_0

MLE:    MOV DPTR,#Port1A
        CLR C
        MOV A,R3
        SUBB A,6EH
        MOV B,#0FH
        DIV AB
        MOV R7,A
MLF_1:  CALL DRV_L1
        DJNZ R7,MLF_1
        MOV A,R3
        MOV 6FH,A
        JMP MAIN_0

;****** Read Sensor ****************
RD_SEN: MOV DPTR,#Port3C
        ;MOV A,#00H
        MOVX @DPTR,A
        SETB ST_ADC
        CLR ST_ADC
        SETB OUT_EN
        CALL DLAY
        MOV R3,P1
        MOV A,R3
        RET

;**********DELAY SENSOR**********
DLAY:   MOV R0,#0F0H                    
DLAY2:  MOV R1,#02H                    
DLAY1:  DJNZ R1,DLAY1
        DJNZ R0,DLAY2
	RET 

;****** Drive Motor Right Hand ***********
DRV_R1: MOV A,#00000001B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00000011B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00000010B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00000110B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00000100B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00001100B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00001000B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00001001B
        MOVX @DPTR,A
        CALL DELAY
        RET

;****** Drive Motor Left Hand ********
DRV_L1:  MOV A,#00001001B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00001000B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00001100B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00000100B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00000110B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00000010B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00000011B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00000001B
        MOVX @DPTR,A
        CALL DELAY
        RET

;****** Drive Motor Right Hand 2 ***********
DRV_R2: MOV A,#00010000B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00110000B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00100000B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#01100000B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#01000000B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#11000000B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#10000000B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#10010000B
        MOVX @DPTR,A
        CALL DELAY
        RET

;****** Drive Motor Left Hand 2********
DRV_L2: MOV A,#10010000B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#10000000B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#11000000B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#01000000B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#01100000B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00100000B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00110000B
        MOVX @DPTR,A
        CALL DELAY
        MOV A,#00010000B
        MOVX @DPTR,A
        CALL DELAY
        RET

;**********DELAY**********
DELAY:  MOV R0,#0F0H                    
DELAY2: MOV R1,#01H                    
DELAY1: DJNZ R1,DELAY1
        DJNZ R0,DELAY2
	RET
        END 
