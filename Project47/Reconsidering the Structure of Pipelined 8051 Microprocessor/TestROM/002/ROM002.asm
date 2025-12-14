	ORG		0
;Basic Data for Test
	MOV		A,#00000011B			;mov	a,data          
	MOV		R0,#00000001B           ;mov	Rn,data         
	MOV		0F0H,#00111100B         ;mov	direct,data     
	MOV		R1,#00001111B           
;Test MOV Operation - MOV A,???
	MOV		A,R0					;mov	a,Rn            
	MOV		A,0F0H					;mov	a,direct		
	MOV		A,@R0					;mov	a,@Ri          	
	MOV		A,#00110011B            ;mov	a,data          

MAIN:
	AJMP	MAIN                							
	NOP
    NOP
    NOP
    NOP
    NOP
	
