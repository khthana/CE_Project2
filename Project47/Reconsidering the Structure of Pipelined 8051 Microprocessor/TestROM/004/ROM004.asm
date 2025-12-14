	ORG		0
;Basic Data for Test
	MOV		A,#00000011B			;mov	a,data          
	MOV		R0,#00000001B           ;mov	Rn,data         
	MOV		R1,#00001111B          	;mov	Rn,data         
;Test MOV Operation - MOV Direct,???
    MOV		30H,A					;mov	direct,A		
    MOV		31H,R0					;mov	direct,Rn       
    MOV		32H,30H                 ;mov	direct,direct	
    MOV		33H,@R0					;mov	direct,@Ri		
    MOV		34H,#11110000B			;mov	direct,#data	
MAIN:
	AJMP	MAIN                							
    NOP
    NOP
    NOP
    NOP
    NOP
	
