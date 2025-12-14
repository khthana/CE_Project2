	ORG		0
;Basic Data for Test
	MOV		A,#30H
	ADD		A,#99H
;Test DA Operation
	DA		A
;Basic Data for Test
	MOV		A,#00000001B
;Test DEC Operation - DEC A	
	DEC		A                           ;worked
;Test INC Operation - INC A
	INC		A                           ;worked							
MAIN:
	AJMP	MAIN                							
    NOP
    NOP
    NOP
    NOP
    NOP
	
