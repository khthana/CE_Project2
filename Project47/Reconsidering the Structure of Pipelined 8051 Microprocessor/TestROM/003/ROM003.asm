	ORG		0
;Basic Data for Test
	MOV		A,#00000011B			;mov	a,data          
	MOV		0F1H,#00110000B         ;mov	...........     
;Test MOV Operation - MOV Rn,???
	MOV		R2,A					;mov	Rn,A			
	MOV		R3,0F1H					;mov	Rn,direct		
	MOV		R4,#11000000B			;mov	Rn,data			

MAIN:
	AJMP	MAIN                							
    NOP
    NOP
    NOP
    NOP
    NOP
	
