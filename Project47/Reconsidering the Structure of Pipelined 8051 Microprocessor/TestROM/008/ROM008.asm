	ORG		0
;Basic Data for Test
	MOV		A,#11111111B
	MOV		R0,#11111110B
	MOV		32H,#11111101B
	MOV		R1,#00000010B
	MOV		R2,#11111011B
;Test XRL Operation - XRL A,???
	XRL		A,R0                     
	XRL		A,32H                    
	XRL		A,@R1                                       
	XRL		A,#11110111B
;Basic Data for Test
	MOV		31H,#11111100B
	MOV		A,#11111111B
;Test XRL Operation - XRL direct,???
	XRL		31H,A                   
	XRL		31H,#11110000B          
MAIN:
	AJMP	MAIN                							
    NOP
    NOP
    NOP
    NOP
    NOP