	ORG		0
;Basic Data for Test
	MOV		A,#11110000B				
;Test RL,RR,RLC,RRC Operation
	RL		A                        
	RL		A                        
	RLC		A                        
	RLC		A                        
	RRC		A                        
	RRC		A                        
	RR		A                        
	RR		A                        
;Basic Data for Test	
	MOV		A,#11000000B
;Test SWAP Operation
	SWAP	A                        
;Test CPL Operation
	CPL		A                        
;Test CLR Operation
	CLR		A                        
MAIN:
	AJMP	MAIN                							
    NOP
    NOP
    NOP
    NOP
    NOP
	
