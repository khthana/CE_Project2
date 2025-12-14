	ORG		0
;Basic Data for Test
	MOV     R0,#00000010B
	MOV		33H,#00000100B
	MOV		R2,#00001000B
;Test ADDC Operation - ADDC A,???
	MOV		A,#10000000B
	RLC		A                           ;set carry flag for test
	MOV		A,#00000000B
	ADDC	A,R0                        
	MOV		A,#10000000B
	RLC		A                           ;set carry flag for test
	MOV		A,#00000010B
	ADDC	A,33H                       
	MOV		A,#10000000B
	RLC		A                           ;set carry flag for test
	MOV		A,#00000110B
	ADDC	A,@R0                       
	MOV		A,#10000000B
	RLC		A                           ;set carry flag for test
	MOV		A,#00001110B
	ADDC	A,#00010000B	            
MAIN:
	AJMP	MAIN                							
	NOP
    NOP
    NOP
    NOP
    NOP
	
