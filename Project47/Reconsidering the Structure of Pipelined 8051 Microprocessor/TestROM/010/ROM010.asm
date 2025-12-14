	ORG		0
;Basic Data for Test
	MOV		A,#00000001B
	MOV     R0,#00000010B
	MOV		33H,#00000100B
	MOV		R2,#00001000B
;Test ADD Operation - ADD A,???	
	ADD		A,R0                        
	ADD		A,33H                       
	ADD		A,@R0                       
	ADD		A,#00010000B	            
MAIN:
	AJMP	MAIN                							
    NOP
    NOP
    NOP
    NOP
    NOP
	
