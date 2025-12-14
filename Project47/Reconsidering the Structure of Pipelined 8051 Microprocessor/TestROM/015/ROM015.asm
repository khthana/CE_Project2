	ORG		0
;Basic Data for Test
    MOV		A,#00110000B
    MOV		R0,#00000011B
    MOV		36H,#00110000B
    MOV		R1,#00000010B
    MOV		R2,#00001100B
;Test XCH Operation - XCH A,???    
	XCH		A,R0						
	XCH		A,36H                       
	XCH		A,@R1                       
;Test XCHD Operation
	XCHD	A,@R1                       
MAIN:
	AJMP	MAIN                							
    NOP
    NOP
    NOP
    NOP
    NOP
	
