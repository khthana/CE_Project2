	ORG		0
;Basic Data for Test
	MOV		A,#00000011B			;mov	a,data          
	MOV		R0,#00000001B           ;mov	Rn,data         
	MOV		34H,#00001111B          ;mov	direct,data         
;Test MOV Operation - MOV Direct,???
	MOV		@R0,A                   ;mov	@Ri,A     		
	MOV		@R0,34H					;mov	@Ri,direct      
	MOV		@R0,#11111111B			;mov	@Ri,data        

MAIN:
	AJMP	MAIN                							
    NOP
    NOP
    NOP
    NOP
    NOP