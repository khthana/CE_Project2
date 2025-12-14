	ORG		0
;Basic Data for Test
	MOV     R0,#00000001B
	MOV		35H,#00000001B
	MOV		R1,#00000001B
;Test SUBB Operation - SUBB A,??? - without carry flag
	MOV		A,#00001000B
	SUBB	A,R0						
	MOV		A,#00001000B
	SUBB	A,35H                       
	MOV     A,#00001000B
	SUBB	A,@R0                       
	MOV		A,#00001000B
	SUBB	A,#00000001B            
MAIN:
	AJMP	MAIN                							
    NOP
    NOP
    NOP
    NOP
    NOP
	
