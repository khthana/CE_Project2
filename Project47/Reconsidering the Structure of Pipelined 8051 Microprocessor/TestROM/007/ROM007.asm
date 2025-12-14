	ORG		0
;Basic Data for Test
	MOV		A,#11111111B
	MOV		R0,#11111110B
	MOV		31H,#11111101B
	MOV		R1,#00000010B
	MOV		R2,#11111011B
;Test ANL Operation - ANL A,???
	ANL		A,R0					
	ANL		A,31H                   
	ANL		A,@R1                   
	ANL		A,#11110111B
;Basic Data for Test
	MOV		31H,#11111100B
	MOV		A,#11111111B
;Test ANL Operation - ANL direct,???
	ANL		31H,A                   
	ANL		31H,#11110000B          
MAIN:
	AJMP	MAIN                							
    NOP
    NOP
    NOP
    NOP
    NOP