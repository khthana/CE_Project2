	ORG		0
;Basic Data for Test
    MOV		A,#00000000B
    MOV		R0,#00000001B
    MOV		30H,#00000010B
    MOV		R1,#00000100B
;Test ORL Operation - ORL A,???
	ORL		A,R0                                
	ORL		A,30H					        
	ORL		A,@R0                              
	ORL		A,#00001000B						
;Basic Data for Test
	MOV		30H,#00000011B
	MOV		A,#00000000B			
;Test ORL Operation - ORL direct,???
	ORL		30H,A                   		
	ORL		30H,#00001100B     
MAIN:
	AJMP	MAIN                							
    NOP
    NOP
    NOP
    NOP
    NOP