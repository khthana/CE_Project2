;******************************************************
;*          Program Test 4 Bits LCD                 	*
;*          Dot Matrix LCD 16X1                  	*
;*          HardWare :Project SAN       		*
;*          Complier : SXA51                        	*
;******************************************************
CS_LCD 	EQU 	P3.6          	; E  LCD (Pin WR)
RS_LCD 	EQU    	P3.7          	; RS LCD (Pin RD)
I2C_WPT EQU     	P2.2                    	; I2C-Bus Write Protect
I2C_SCL  EQU     	P2.1                    	; I2C-Bus Clock  >P2.1
I2C_SDA  EQU     	P2.0                    	; I2C-Bus Data  >P2.0
NUM	EQU	31H
TIMER_H	EQU	32H
TIMER_L	EQU	33H
TIM1_H	EQU	34H
TIM1_L	EQU	35H
TIM2_H	EQU	36H
TIM2_L	EQU	37H
POS	EQU	38H
TIME_H	EQU	39H	
TIME_L	EQU	3AH
ADDRL	EQU	3BH
ADDRH	EQU	3CH
DISNUM	EQU	3DH
BITC	EQU	00H
bitA	EQU	01H
            	ORG     	0000H
            	LJMP   	MAIN
	
	ORG	000BH       	;INTERRUPT TIMER0
        	LJMP	TIME0

	;ORG	0003H
	;LJMP	INTER0		;INTERRUPT0

	ORG	0023H
	LJMP	SEND

        org	0040h    
MAIN:   mov	sp,#40h	
	SETB    	CS_LCD        	; initial LCD
            	LCALL   	DELAY         	; initial delay
            	LCALL   	INIT_LCD      	; initial LCD
	MOV	TIMER_H,#00
	MOV	TIMER_L,#00
	SETB    	I2C_WPT                 ; Enable I2C Write Protect
            	CLR     	I2C_SCL                 	; Initial Bus For Stop
            	CLR     	I2C_SDA
            	SETB    	I2C_SCL
            	SETB    	I2C_SDA                 	; Stop Condition (SCL=1,SDA=1)
	MOV	POS,#00H
	MOV	TIME_H,POS
	MOV	TIME_L,POS
START:   	
        	MOV     	TMOD,#21H        	;SET TIMER1 MODE2(AUTO RE-LOAD)
				;SET TIMER0 MODE1(16 BIT)
        	MOV     	TH1,#0FDH        	;SET BAUD RATE=9600(1200=E8,2400=F4,4800=FA,600=D0,300=A0)
	MOV     	TH0,#0FCH	;5 msec TIMER #0EE00H
	MOV     	TL0,#67H		;1 msec TIMER #0FC67H
	MOV	SCON,#01010000B
        	MOV     	IE,#10010010B    	;SET INTERRUPT ENABLE SERIAL AND TIMER0    (10010011B) INTERRUPT0
	;MOV     	IP,#00000001B	;HIGHER PRIORITY TIMER0			(01H)
        	SETB    	TR1		;START TIMER1
	SETB    	TR0              	;START TIMER0
	setb	bitA

	MOV     	A,#0
	LCALL		GOTO_LCD
	MOV     	A,#0
        MOV     	DPTR,#LCD_STR
STR1:  PUSH    	ACC    	
	MOVC    	A,@A+DPTR
        CJNE    	A,#00H,STR2
        POP    	ACC
	INC	ACC
            	LJMP    	STR3
STR2:   	LCALL   	WR_LCD
            	POP     	ACC
            	INC     	ACC
            	LJMP    	STR1
STR3:
	lcall	delay
	lcall	delay
	lcall	delay
	lcall	delay
	lcall	delay
;******************************************************
;*                    show LCD                      		*
;******************************************************
	
;AAA:	MOV	DISNUM,NUM
;	LCALL	NUM_LCD
;	jb	p3.2,AAA2
;	jnb	bitA,AAA3
;	lcall	inter0
;AAA3:	clr	bitA
;	sjmp	AAA
;AAA2:	setb	bitA
;	sjmp	AAA

;	MOV     	A,#0
;        MOV     	DPTR,#LCD_TAB
;WRITE1:  PUSH    	ACC
;            	MOVC    	A,@A+DPTR
;            	CJNE    	A,#00H,WRITE
;            	POP    	ACC
;	INC	ACC
;            	LJMP    	WRITE2
;WRITE:   	LCALL   	WR_LCD
;            	POP     	ACC
;            	INC     	ACC
;            	LJMP    	WRITE1

;WRITE2: 	PUSH    	ACC
;            	MOVC    	A,@A+DPTR
;            	CJNE    	A,#00H,WRITE3
;	CLR	ACC
;	LCALL	GOTO_LCD
;            	POP    	ACC
;	INC	ACC
;            	LJMP    	WRITE4
;WRITE3: 	LCALL   	WR_LCD
;            	POP     	ACC
;            	INC     	ACC
;	LCALL	DELAY
;            	LJMP    	WRITE2
;WRITE4: 	PUSH    	ACC
;            	MOVC    	A,@A+DPTR
;            	CJNE    	A,#00H,WRITE5
;            	POP    	ACC
;	INC	ACC
;            	LJMP    	WRITE6
;WRITE5: 	LCALL   	WR_LCD
;            	POP     	ACC
;            	INC     	ACC
;            	LJMP    	WRITE4
;WRITE6:	
;	MOV	DPTR,#0001H
;	LCALL	I2C_READ1
;	MOV	POS,#0
;	MOV	DISNUM,A
;	LCALL	NUM_LCD

;	MOV	R5,#00H
;WR6:	MOV	NUM,R5
WR6:	LCALL	INTER0
;	MOV	POS,#5
	MOV	DISNUM,NUM
	LCALL	NUM_LCD
	LCALL	DELAY
	LCALL	DELAY
	LCALL	DELAY
	LCALL	DELAY
	LCALL	DELAY
;	DJNZ	R5,WR6
	SJMP	WR6
           
;******************************************************
;*                Input  : ACC  (ASCII)             		*
;*                Output : Data bus LCD             	*
;******************************************************
WR_LCD:PUSH	02H	
	MOV     	B,A
            	ANL     	A,#0F0H
            	SETB   	RS_LCD		;RS HI
            	MOV     	R2,A
            	MOV     	A,P0
            	ANL     	A,#00001111B
            	ORL     	A,R2
           	MOV     	P0,A
            	LCALL   	EN_LCD
            	MOV     	A,B             	;Low byte
            	SWAP    	A
            	ANL     	A,#0F0H
            	SETB   	RS_LCD		;RS HI
            	MOV     	R2,A
            	MOV     	A,P0
            	ANL     	A,#00001111B
            	ORL     	A,R2
            	MOV     	P0,A
            	LCALL   	EN_LCD
	POP	02H
            	RET

;******************************************************
;*                Write Instruction LCD             	*
;*                Input  : ACC (Command)            	*
;*                Output : Data bus LCD             	*
;******************************************************
WR_INS:	PUSH	02H
	MOV     	B,A
            	ANL     	A,#0F0H
            	MOV     	R2,A
            	MOV     	A,P0
            	ANL     	A,#00001111B    	;else bit
            	CLR   	RS_LCD		;RS LOW
            	ORL     	A,R2
            	MOV     	P0,A            	; High byte
            	LCALL   	EN_LCD
            	MOV     	A,B             	; Low byte
            	SWAP    	A
            	ANL     	A,#0F0H
            	MOV     	R2,A
            	MOV     	A,P0
            	ANL    	A,#00001111B
            	CLR   	RS_LCD		;RS LOW
            	ORL     	A,R2
            	MOV     	P0,A
            	LCALL   	EN_LCD
	POP	02H
            	RET

;******************************************************
;*                 Goto position of LCD             	*
;*                 Input : ACC (addr.)              		*
;******************************************************
GOTO_LCD:   
	SETB    	ACC.7
            	LCALL   	WR_INS
            	RET

;******************************************************
;*                      Initial LCD                 		*
;*                      4-Bit Interface             		*
;******************************************************
INIT_LCD:   
	CLR     	RS_LCD
            	MOV     	A,#33H          	; Set DL = 1 3-time
            	LCALL   	WR_INS
            	MOV     	A,#32H          	; Clear DL = 0 1-time
            	LCALL   	WR_INS
            	MOV     	A,#20H          	; Function set  (28)
            	LCALL   	WR_INS          	; DL=0 4Bit,N=1 2Line,F=0 5X7
            	MOV     	A,#0CH
            	LCALL   	WR_INS          	; Entry display,cursor off,cursor not blink
            	MOV     	A,#06H          	; Entry mode set
            	LCALL   	WR_INS          	; I/D=1 Increment,S=0 cursor shift
            	MOV     	A,#01H          	; Clear display
            	LCALL   	WR_INS          	; Clear display,set DD RAM address=0
            	RET
;******************************************************
;*                    Enable Pin E LCD              	*
;*                    Active Chip select            		*
;******************************************************
EN_LCD:	CLR     	CS_LCD          	; Enable LCD
            	LCALL   	BUSY            	; Busy delay time
            	SETB    	CS_LCD          	; Disable LCD
            	RET

;******************************************************
;*                Delay time for Busy               	* 
;*                  Wait LCD Ready                  	*
;******************************************************
BUSY:    	PUSH  	07H
            	PUSH    	06H
            	MOV     	R6,#05H
BUSY1: 	MOV     	R7,#0FFH
            	DJNZ    	R7,$
            	DJNZ    	R6,BUSY1
            	POP     	06H
            	POP     	07H
            	RET


;/*****************************/;
;/* I2C-BUS 24LC256 Interface */;
;/* Write Data to I2C-EEPROM  */;
;/* Input  : DPTR (Address)   */;
;/*        : ACC (Data)       */;
;/*****************************/;
;
I2C_WRITE:  
	PUSH    	B                       	; Save Register
            	PUSH    	ACC                     	; Save Data to Write
            	CLR     	I2C_WPT                 ; Disable Write Protect
            	CLR     	I2C_SCL                 	; Initial Bus For Start
            	SETB    	I2C_SDA                 
            	SETB    	I2C_SCL
            	NOP                             	; TSU:STA Delay (5us)
            	NOP
            	NOP
            	NOP
            	NOP
            	CLR     	I2C_SDA                 	; Start Condition
            	NOP                             	; THD:STA Delay (4us)
            	NOP
            	NOP
            	NOP
            ;/* Ready to Start 1st Byte Send */;
            	MOV     	B,#8                    	; Write Control Byte 8-Bit Count
            	MOV     	A,#10100000B        	; 1010-Slave000,Write
I2C_WR1:    
	CLR     	I2C_SCL                 	;/* Change Data to SDA Signal */;
            	SETB    	I2C_SDA                 	; Release Data Line
            	RLC     	A                       	; Write MSB First
            	MOV     	I2C_SDA,C             	; Write Bit Data to SDA Signal
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	; Stobe Data to I2C-EEPROM
            	NOP                             	; T-High Delay (4uS)
            	NOP
            	NOP
            	NOP
            	DJNZ    	B,I2C_WR1           	; Loop to Write Control Byte
            	CLR     	I2C_SCL                 	;*/ Falling 9'th Clock For ACK */;
            	SETB    	I2C_SDA                 	; Release Data Line
            	NOP
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	;*/ Rising 9'th Clock for Get ACK */;
            	NOP
            	CLR     	CY
            	JNB     	I2C_SDA,I2C_WR2	; If ACK Jump
            	SETB    	CY                      	; Not ACK From EEPROM
            	POP     	ACC
            	LJMP    	I2C_WR8
I2C_WR2:    
	MOV     	B,#8                    	; Write Addr High-Byte Count
            	MOV     	A,DPH                   	; Address High Byte
I2C_WR3:    
	CLR     	I2C_SCL                 	;/* Change Data to SDA Signal */;
            	SETB    	I2C_SDA                 	; Release Data Line
            	RLC     	A                       	; Write MSB First
            	MOV     	I2C_SDA,C               ; Write Bit Data to SDA Signal
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	; Stobe Data to I2C-EEPROM
           	NOP                             	; T-High Delay (4uS)
            	NOP
            	NOP
            	NOP
            	DJNZ    	B,I2C_WR3          	; Loop to Write Addr High-Byte
            	CLR     	I2C_SCL                 	;*/ Falling 9'th Clock For ACK */;
            	SETB    	I2C_SDA                 	; Release Data Line
            	NOP
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	;*/ Rising 9'th Clock for Get ACK */;
            	NOP
            	CLR     	CY
            	JNB     	I2C_SDA,I2C_WR4	; If ACK Jump
            	SETB    	CY                      	; Not ACK From EEPROM
            	POP     	ACC
            	LJMP    	I2C_WR8
I2C_WR4:    
	MOV     	B,#8                    	; Write Addr Low-Byte Count
            	MOV     	A,DPL                   	; Address Low Byte
I2C_WR5:    
	CLR     	I2C_SCL                 	;/* Change Data to SDA Signal */;
            	SETB    	I2C_SDA                 	; Release Data Line
            	RLC     	A                       	; Write MSB First
            	MOV     	I2C_SDA,C               ; Write Bit Data to SDA Signal
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	; Stobe Data to I2C-EEPROM
            	NOP                             	; T-High Delay (4uS)
            	NOP
            	NOP
            	NOP
            	DJNZ    	B,I2C_WR5         	; Loop to Write Addr Low-Byte
            	CLR     	I2C_SCL                 	;*/ Falling 9'th Clock For ACK */;
            	SETB    	I2C_SDA                 	; Release Data Line
            	NOP
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	;*/ Rising 9'th Clock for Get ACK */;
            	NOP
            	CLR     	CY
            	JNB     	I2C_SDA,I2C_WR6	; If ACK Jump
            	SETB    	CY                      	; Not ACK From EEPROM
            	POP     	ACC
            	LJMP    	I2C_WR8
I2C_WR6:    
	MOV     	B,#8                    	; Write Data 8-Bit Count
            	POP     	ACC                     	; Restore Data For Write
I2C_WR7:    
	CLR     	I2C_SCL                 	;/* Change Data to SDA Signal */;
            	SETB    	I2C_SDA                 	; Release Data Line
            	RLC     	A                       	; Write MSB First
            	MOV     	I2C_SDA,C               ; Write Bit Data to SDA Signal
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	; Stobe Data to I2C-EEPROM
            	NOP                             	; T-High Delay (4uS)
            	NOP
            	NOP
            	NOP
            	DJNZ    	B,I2C_WR7          	; Loop to Write Data
            	CLR     	I2C_SCL                 	;*/ Falling 9'th Clock For ACK */;
            	SETB    	I2C_SDA                 	; Release Data Line
            	NOP
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	;*/ Rising 9'th Clock for Get ACK */;
            	NOP
            	CLR     	CY
            	JNB     	I2C_SDA,I2C_WR8 	; If ACK Jump
            	SETB    	CY                      	; Not ACK From EEPROM
I2C_WR8:    
	CLR     	I2C_SCL                 	; Falling Stop Clock
            	CLR     	I2C_SDA
            	NOP
            	NOP
            	SETB    	I2C_SCL
            	NOP                             	; TSU:STO (4us)
            	NOP
            	NOP
            	NOP
I2C_WR9:    
	SETB    	I2C_SDA                 	; Stop Condition (SCL=1,SDA=1)
            	JNB     	I2C_SDA,I2C_WR9	; Wait Until Stop
            	SETB    	I2C_WPT                 ; Enable Write Protect
            	POP     	B                       	; Restore Register
            	RET

;/*****************************/;
;/* I2C-BUS 24LC256 Interface */;
;/* Read Data From I2C-EEPROM */;
;/* -I2C_READ1 = Random Read  */;
;/*  Input  : DPTR (Address)  */;
;/*  Output : ACC (Data)      */;
;/* -I2C_READ2 = Current Read */;
;/*  Input  : None (Continue) */;
;/*  Output : ACC (Data)      */;
;/*****************************/;
;
I2C_READ1:  
	PUSH    	B                       	; Save Register
            	CLR     	I2C_SCL                 	; Initial Bus For Start
            	SETB    	I2C_SDA                 
            	SETB    	I2C_SCL
            	NOP                             	; TSU:STA Delay (5us)
            	NOP
            	NOP
            	NOP
            	NOP
            	CLR     	I2C_SDA                 	; Start Condition
            	NOP                             	; THD:STA Delay (4us)
            	NOP
            	NOP
            	NOP
            	;/* Ready to Start 1st Byte Send */;
            	MOV     	B,#8                    	; Write Control Byte 8-Bit Count
            	MOV     	A,#10100000B       	; 1010-Slave000,Write
I2C_RD1:    
	CLR     	I2C_SCL                 	;/* Change Data to SDA Signal */;
            	SETB    	I2C_SDA                 	; Release Data Line
            	RLC     	A                       	; Write MSB First
            	MOV     	I2C_SDA,C             	; Write Bit Data to SDA Signal
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	; Stobe Data to I2C-EEPROM
            	NOP                             	; T-High Delay (4uS)
            	NOP
            	NOP
            	NOP
            	DJNZ    	B,I2C_RD1            	; Loop to Write Control Byte
            	CLR     	I2C_SCL                 	;*/ Falling 9'th Clock For ACK */;
            	SETB    	I2C_SDA                 	; Release Data Line
            	NOP
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	;*/ Rising 9'th Clock for Get ACK */;
            	NOP
            	CLR    	CY
            	JNB     	I2C_SDA,I2C_RD2	; If ACK Jump
            	SETB    	CY                      	; Not ACK From EEPROM
            	LJMP    	I2C_RD10
I2C_RD2:    
	MOV     	B,#8                    	; Write Addr High-Byte Count
            	MOV     	A,DPH                   	; Address High Byte
I2C_RD3:    
	CLR     	I2C_SCL                 	;/* Change Data to SDA Signal */;
            	SETB    	I2C_SDA                 	; Release Data Line
            	RLC     	A                       	; Write MSB First
            	MOV     	I2C_SDA,C               ; Write Bit Data to SDA Signal
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	; Stobe Data to I2C-EEPROM
            	NOP                             	; T-High Delay (4uS)
            	NOP
            	NOP
            	NOP
            	DJNZ    	B,I2C_RD3          	; Loop to Write Addr High-Byte
            	CLR     	I2C_SCL                 	;*/ Falling 9'th Clock For ACK */;
           	SETB    	I2C_SDA                 	; Release Data Line
            	NOP
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	;*/ Rising 9'th Clock for Get ACK */;
            	NOP
            	CLR     	CY
            	JNB     	I2C_SDA,I2C_RD4	; If ACK Jump
            	SETB    	CY                      	; Not ACK From EEPROM
            	LJMP    	I2C_RD10
I2C_RD4:    
	MOV     	B,#8                    	; Write Addr Low-Byte Count
            	MOV     	A,DPL                   	; Address Low Byte
I2C_RD5:    
	CLR     	I2C_SCL                 	;/* Change Data to SDA Signal */;
            	SETB    	I2C_SDA                 	; Release Data Line
            	RLC     	A                       	; Write MSB First
            	MOV     	I2C_SDA,C               ; Write Bit Data to SDA Signal
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	; Stobe Data to I2C-EEPROM
            	NOP                             	; T-High Delay (4uS)
            	NOP
            	NOP
            	NOP
            	DJNZ    	B,I2C_RD5            	; Loop to Write Addr Low-Byte
            	CLR     	I2C_SCL                 	;*/ Falling 9'th Clock For ACK */;
            	SETB    	I2C_SDA                 	; Release Data Line
            	NOP
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	;*/ Rising 9'th Clock for Get ACK */;
            	NOP
            	CLR     	CY
            	JNB     	I2C_SDA,I2C_RD6	; If ACK Jump
            	SETB    	CY                      	; Not ACK From EEPROM
            	LJMP    	I2C_RD10
            ;/* Current Address Read Operation */;
I2C_READ2:  
	PUSH    	B                       	; Save Register
I2C_RD6:    
	CLR     	I2C_SCL                 	; Falling New Start Clock
            	SETB    	I2C_SDA                 	; Initial Bus For Start
            	SETB    	I2C_SCL
            	NOP                             	; TSU:STA Delay (5us)
            	NOP
            	NOP
            	NOP
            	NOP
            	CLR     	I2C_SDA                 ; Start Condition
            	NOP                             	; THD:STA Delay (4us)
            	NOP
            	NOP
            	NOP
            	MOV     	B,#8                    	; Write Control Byte 8-Bit Count
            	MOV     	A,#10100001B      	; 1010-Slave000,Read
I2C_RD7:    
	CLR     	I2C_SCL                 	;/* Change Data to SDA Signal */;
            	SETB    	I2C_SDA                 	; Release Data Line
            	RLC     	A                       	; Write MSB First
            	MOV     	I2C_SDA,C               ; Write Bit Data to SDA Signal
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	; Stobe Data to I2C-EEPROM
            	NOP                             	; T-High Delay (4uS)
            	NOP
            	NOP
            	NOP
            	DJNZ    	B,I2C_RD7               ; Loop to Write Control Byte
            	CLR     	I2C_SCL                 	;*/ Falling 9'th Clock For ACK */;
            	SETB    	I2C_SDA                 	; Release Data Line
            	NOP
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	;*/ Rising 9'th Clock for Get ACK */;
            	NOP
            	CLR     	CY
            	JNB     	I2C_SDA,I2C_RD8	; If ACK Jump
            	SETB    	CY                      	; Not ACK From EEPROM
            	LJMP    	I2C_RD10
I2C_RD8:    
	MOV     	B,#8                    	; Read Data 8-Bit Count
            	CLR     	CY
            	CLR     	A                       	; Clera Buffer For Read
I2C_RD9:    
	CLR     	I2C_SCL                 	;/* Wait to Receive SDA Signal */;
            	SETB    	I2C_SDA                 	; Release Data Signal
            	NOP
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	; Read Data From I2C-EEPROM
            	NOP
            	MOV     	C,I2C_SDA               ; Get Data From SDA Signal
            	RLC     	A
            	NOP
            	DJNZ    	B,I2C_RD9               ; Loop to Read Data 8-Bit
            	CLR     	I2C_SCL                 	;*/ Falling 9'th Clock For ACK */;
            	SETB    	I2C_SDA                 	; Release Data Line
            	NOP
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL                 	;*/ Rising 9'th Clock for Send ACK */;
            	NOP
            	NOP
            	NOP
            	NOP
I2C_RD10:   
	CLR     	I2C_SCL                 	; Falling Stop Clock
            	CLR     	I2C_SDA
            	NOP
            	NOP
            	NOP
            	SETB    	I2C_SCL
            	NOP                             	; TSU:STO (4us)
            	NOP
            	NOP
            	NOP
I2C_RD11:   
	SETB    	I2C_SDA                 	; Stop Condition (SCL=1,SDA=1)
            	JNB     	I2C_SDA,I2C_RD11	; Wait Until Stop
            	POP     	B                       	; Restore Register
            	RET
;***************************************
NUM_LCD:
	PUSH	00H
	PUSH	01H
	PUSH	02H
	PUSH	06H
	PUSH	ACC
	MOV	A,#00h
	LCALL	GOTO_LCD
	mov	a,#'H'
	LCALL	WR_LCD
	mov	a,#'R'
	LCALL	WR_LCD
	mov	a,#'T'
	LCALL	WR_LCD
	mov	a,#'-'
	LCALL	WR_LCD
	mov	a,#'>'
	LCALL	WR_LCD
	CLR	A
	MOV	R0,A
	MOV	R1,A
	MOV	R2,A
	MOV	R6,DISNUM	
	MOV	A,R6
	JZ	VAL6
VAL2:	INC	R0
	CJNE	R0,#10D,VAL3
	MOV	R0,#00H
	INC	R1
	CJNE	R1,#10D,VAL3
	MOV	R1,#00H
	INC	R2
VAL3:	DJNZ	R6,VAL2
VAL6:	MOV	A,R2
	SETB	ACC.5
	SETB	ACC.4
	LCALL	WR_LCD
	MOV	A,R1
	SETB	ACC.5
	SETB	ACC.4
	LCALL	WR_LCD
	MOV	A,R0
	SETB	ACC.5
	SETB	ACC.4
	LCALL	WR_LCD
	POP	ACC
	POP	06H
	POP	02H
	POP	01H
	POP	00H
	RET

;******************************************************
;*                      Delay Time                  		*
;******************************************************
DELAY:  	PUSH    07H
            	PUSH    06H
DEL1:     	MOV     R6,#0FFH
DEL2:     	MOV     R7,#0FFH
            	DJNZ    R7,$
            	DJNZ    R6,DEL2
            	POP     06H
            	POP     07H
            	RET
;***********TIMER0****************
TIME0:	clr	tr0
	MOV	TH0,#0FCH
	MOV	TL0,#67H
	CLR	TF0
	;SETB	TR0
	PUSH	DPH
	PUSH	DPL
	PUSH	ACC
	PUSH	B
	MOV	DPH,TIMER_H
	MOV	DPL,TIMER_L
	INC	DPTR
	MOV	TIMER_H,DPH
	MOV	TIMER_L,DPL
	MOV	A,DPL	
	CJNE	A,#0D1H ,TIM00
	MOV	A,DPH
	CJNE	A,#7H,TIM00
	MOV	TIMER_H,#00H
	MOV	TIMER_L,#00H
	MOV	NUM,#00H
TIM00:
	MOV	DPH,TIME_H
	MOV	DPL,TIME_L
	INC	DPTR
	MOV	TIME_L,DPL
	MOV	TIME_H,DPH	
	MOV	A,DPL
	CJNE	A,#060H,TIM01
	MOV	A,DPH
	CJNE	A,#0EAH,TIM01
	CLR	IE.0
	;CLR	TR0
	MOV	TIME_H,#00H
	MOV	TIME_L,#00H
	;XXXXXXXXXXXXXXXXXXXXXXX MEM 1MIN XXXXXXXXXX
	MOV	DPTR,#0000H
	LCALL	I2C_READ1
	MOV	B,A
	LCALL	I2C_READ2
	MOV	DPL,A
	MOV	DPH,B
	;MOV	POS,#2
	;MOV	DISNUM,A
	;LCALL	NUM_LCD
	MOV	A,DPL
	CJNE	A,#0FFH,TIM02
	MOV	A,DPH
	CJNE	A,#07FH,TIM02
	MOV	TIMER_H,#00H
	MOV	TIMER_L,#00H
	SETB	TR0
	SJMP	TIM01	

TIM02:	MOV	A,NUM
	INC	DPTR
	MOV	R1,DPH
	MOV	R2,DPL
	;MOV	POS,#1
	;MOV	DISNUM,R2
	;LCALL	NUM_LCD
	LCALL	BUSY
	LCALL	I2C_WRITE
	MOV	TH0,#0FCH
	LCALL	BUSY
	MOV	DPTR,#0000H
	MOV	A,R1
	LCALL	I2C_WRITE
	LCALL	BUSY
	MOV	DPTR,#0001H
	MOV	A,R2
	LCALL	I2C_WRITE
	;MOV	POS,#0
	;MOV	DISNUM,A
	;LCALL	NUM_LCD
	MOV	TH0,#0FCH
	MOV	TL0,#67H
	SETB	TR0
	;SETB	IE.0
	;XXXXXXXXXXXXXXXXXXXXXXXXX
TIM01:	POP	B
	POP	ACC
	POP	DPL
	POP	DPH
	SETB	TR0
	RETI

SEND:   	JB	RI,RES
	CLR 	TI
	;MOV 	SBUF,
	RETI

RES:	CLR	RI
	PUSH	ACC
	PUSH	DPL
	PUSH	DPH
	MOV	A,SBUF
	CJNE	A,#55D,REC1	;READ DATA
	CLR	IE.4		;DISENABLE INTERRUPT SERIAL
	CLR	IE.0		;DISENABLE INTERRUPT0
	CLR	REN		;DISENABLE RECEIVE 
	CLR	TR0

	MOV     	A,#0h
	LCALL		GOTO_LCD
	MOV     	A,#0h
        MOV     	DPTR,#LCD_TAB
rec01:  PUSH    	ACC    	
	MOVC    	A,@A+DPTR
        CJNE    	A,#00H,rec02
        POP    	ACC
	INC	ACC
            	LJMP    	rec03
rec02:   	LCALL   	WR_LCD
            	POP     	ACC
            	INC     	ACC
            	LJMP    	rec01
rec03:
	MOV	DPTR,#0000H
	LCALL	I2C_READ1
	MOV	ADDRH,A
	MOV	SBUF,A
	LCALL	I2C_READ2
	MOV	ADDRL,A
	JNB	TI,$
	CLR	TI
	MOV	SBUF,A
	INC	DPTR
REC3:	INC	DPTR
	LCALL	I2C_READ1
	JNB	TI,$
	CLR	TI
	MOV	SBUF,A

	MOV	A,DPL
	CJNE	A,#0FFH,REC3
	MOV	A,DPH
	CJNE	A,#07FH,REC3

	setb	IE.4		;DISENABLE INTERRUPT SERIAL
	;setb	IE.0		;DISENABLE INTERRUPT0
	setb	REN		;DISENABLE RECEIVE 
	setb	TR0
	;XXXXXXXXXXXXXXXXXXXX
	SETB	REN
	SJMP	REC2	
REC1:	CJNE	A,#99D,REC2	;CLEAR DATA
	CLR	TR0
	MOV     	A,#0
	LCALL		GOTO_LCD
	MOV     	A,#0
        MOV     	DPTR,#LCD_C
rec001:  PUSH    	ACC    	
	MOVC    	A,@A+DPTR
        CJNE    	A,#00H,rec002
        POP    	ACC
	INC	ACC
            	LJMP    	rec003
rec002:   	LCALL   	WR_LCD
            	POP     	ACC
            	INC     	ACC
            	LJMP    	rec001
rec003:
	LCALL	BUSY
	MOV	A,#00D
	MOV	DPTR,#0000H
	LCALL	I2C_WRITE
	LCALL	BUSY
	MOV	A,#01D
	MOV	DPTR,#0001H
	LCALL	I2C_WRITE
	lcall	busy
	setb	IE.4		;DISENABLE INTERRUPT SERIAL
	;setb	IE.0		;DISENABLE INTERRUPT0
	setb	REN		;DISENABLE RECEIVE 
	setb	TR0
	;XXXXXXXXXXXXXXXXXXXX
	SETB	REN
	
REC2:	POP	DPH
	POP	DPL
	POP	ACC
	setb	tr0
	setb	reset
	clr	reset
	mov	sp,#40h
	ljmp	main
	RETI

INTER0:	PUSH	ACC
	PUSH	DPH
	PUSH	DPL
	CLR	A
	MOV	TIM1_H,TIMER_H
	MOV	TIM1_L,TIMER_L
	MOV	TIMER_H,A
	MOV	TIMER_L,A
	MOV	A,TIM1_H
	CJNE	A,#00H,IN02
	MOV	NUM,#01H
	SJMP	IN03
IN02:	CLR	A
	MOV	TIM2_H,#01H
	MOV	TIM2_L,#02CH
	MOV	DPTR,#MEM
	
IN01:	PUSH	ACC
	MOVC	A,@A+DPTR
	ADD	A,TIM2_L
	MOV	TIM2_L,A
	CLR	A
	ADDC	A,TIM2_H
	MOV	TIM2_H,A
	POP	ACC
	INC	A
	LCALL	CHECK
	JC	IN01
	CLR	C
	MOV	B,A
	MOV	A,#200D
	SUBB	A,B
	MOV	NUM,A
IN03:
	POP	DPL
	POP	DPH
	POP	ACC
	ret

	;RETI
CHECK:
	PUSH	ACC
  	MOV 	A,TIM2_L  	
  	CLR 	C     	
  	SUBB 	A,TIM1_L 	
  	MOV 	A,TIM2_H  	
  	SUBB 	A,TIM1_H	
	POP	ACC
  	RET
;****************************************

LCD_TAB:    
	DB   ' Upload ',00H
LCD_STR:
	DB   'STARTING',00H
LCD_C:
	DB   ' Clear ',00H	;ADDRESS 10

MEM:	
DB     1D,2D,1D,2D,1D,2D,1D,2D,2D,1D	;START AT 300D	;0
DB     2D,2D,1D,2D,2D,2D,1D,2D,2D,2D			;10
DB     2D,2D,1D,2D,2D,2D,2D,2D,2D,2D			;20
DB     3D,2D,2D,2D,2D,2D,3D,2D,2D,3D			;30
DB     2D,2D,3D,2D,3D,2D,3D,2D,3D,3D			;40
DB     2D,3D,3D,2D,3D,3D,3D,3D,3D,3D			;50
DB     3D,3D,3D,4D,3D,3D,4D,3D,4D,3D			;60
DB     4D,3D,4D,4D,4D,3D,4D,4D,4D,5D			;70
DB     4D,4D,4D,5D,4D,5D,4D,5D,5D,5D			;80
DB     5D,5D,5D,6D,5D,5D,6D,6D,6D,6D			;90
DB     6D,6D,6D,7D,6D,7D,7D,7D,7D,7D			;100
DB     8D,7D,8D,8D,8D,9D,8D,9D,9D,10D			;110
DB     9D,10D,10D,10D,11D,10D,11D,12D,12D,12D		;120
DB     12D,13D,13D,14D,14D,14D,15D,15D,16D,17D		;130
DB     16D,18D,18D,19D,19D,21D,21D,21D,23D,24D		;140
DB     24D,26D,26D,28D,29D,30D,32D,33D,35D,37D		;150
DB     38D,40D,43D,45D,48D,50D,54D,57D,60D,65D	;STOP AT 2000D

            	END

