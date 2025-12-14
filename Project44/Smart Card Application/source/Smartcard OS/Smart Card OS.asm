            LIST      P=16F84, F=INHX8M
            include "P16F84.inc"

            ORG     0x0000

            GOTO    Main

buf	equ	0x0C
i	equ	0x0D
count	equ	0x12
offset	equ	0x13
ACCaLO  	equ     	0x14
ACCaHI  	equ     	0x15
ACCaHI2 	equ     	0x16
ACCaHI3 	equ	0x17  
ACCbLO  	equ     	0x18
ACCbHI  	equ 	0x19    
ACCbHI2 	equ	0x1A     
ACCbHI3 	equ	0x1B
Lcnt    	equ     	0x1C
Rcnt    	equ	0x1D	     
strpointer	equ	0x20

A0	equ	0x32
A1	equ	0x33
A2	equ	0x34
A3	equ	0x35
B0	equ	0x36
B1	equ	0x37
B2	equ	0x38
B3	equ	0x39
C0	equ	0x3A
C1	equ	0x3B
C2	equ	0x3C
C3	equ	0x3D
D0	equ	0x3E
D1	equ	0x3F
D2	equ	0x40
D3	equ	0x41

Inst	equ	0x45
Byte3	equ	0x48
Byte4	equ	0x49
Byte5	equ	0x4A
Length	equ	0x4B
CRC	equ	0x4C
pages	equ	0x4F



Add32   	movf    ACCaLO,W
	addwf   ACCbLO,f       ;add lsb
	
	movf    ACCbHI,w
	btfsc   STATUS,C        ;add in carry
	addlw   0x01
	movwf   ACCbHI
	
	movf    ACCbHI2,w
	btfsc   STATUS,C
	addlw   0x01 
	movwf   ACCbHI2

	movf    ACCbHI3,w
	btfsc   STATUS,C
	addlw   0x01 
	movwf   ACCbHI3
	
	movf    ACCaHI,W        ;add ACCbHI+ACCaHI
	addwf   ACCbHI, F       
	
	movf    ACCbHI2,w
	btfsc   STATUS,C
	addlw   0x01 
	movwf   ACCbHI2
	
	movf    ACCbHI3,w
	btfsc   STATUS,C
	addlw   0x01
	movwf   ACCbHI3
	
	movf    ACCaHI2,w       ;add ACCbHI2+
	addwf   ACCbHI2,f
	
	movf    ACCbHI3,w
	btfsc   STATUS,C
	addlw   0x01
	movwf   ACCbHI3
	
	movf    ACCaHI3,w      ;add ACCbHI3
	addwf   ACCbHI3,f
	return

LShf32	bcf     STATUS,C
	rlf     ACCaLO
	rlf     ACCaHI
	rlf     ACCaHI2
	rlf     ACCaHI3
                decfsz  Lcnt
	goto    LShf32
	return

RShf32          bcf     STATUS,C
	rrf     ACCbHI3
	rrf     ACCbHI2
	rrf     ACCbHI
	rrf     ACCbLO
	decfsz  Rcnt
	goto    RShf32
	return

LRot32	movwf   Lcnt
	call    LShf32  

	sublw   020
	movwf   Rcnt
	call    RShf32
	call    Add32
  	return

Init	movlw   0x01
	movwf   A0
	movlw   0x23
	movwf   A1
	movlw   0x45
	movwf   A2
	movlw   0x67
	movwf   A3

	
	movlw   0x89
	movwf   B0
	movlw   0xAB
	movwf   B1
	movlw   0xCD
	movwf   B2
	movlw   0xEF
	movwf   B3


	movlw   0xFE
	movwf   C0
	movlw   0xDC
	movwf   C1
	movlw   0xBA
	movwf   C2
	movlw   0x98
	movwf   C3


	movlw   0x76
	movwf   D0
	movlw   0x54
	movwf   D1
	movlw   0x32
	movwf   D2
	movlw   0x10
	movwf   D3
	return

Compress	movf    D0,w		;row 1
	xorwf   C0,w
	andwf   B0,w
	xorwf   D0,w
	movwf   ACCbLO
	
	movf    D1,w
	xorwf   C1,w
	andwf   B1,w
	xorwf   D1,w
	movwf   ACCbHI	

	movf    D2,w
	xorwf   C2,w
	andwf   B2,w
	xorwf   D2,w
	movwf   ACCbHI2

	movf    D3,w
	xorwf   C3,w
	andwf   B3,w
	xorwf   D3,w
	movwf   ACCbHI3

	movf    A0,w
	movwf   ACCaLO
	movf    A1,w
	movwf   ACCaHI
	movf    A2,w
	movwf   ACCaHI2
	movf    A3,w
	movwf   ACCaHI3
	call    Add32

	movlw   0x78
	movwf   ACCaLO
	movlw   0xA4
	movwf   ACCaHI
	movlw   0x6A
	movwf   ACCaHI2
	movlw   0xD7
	movwf   ACCaHI3
	call    Add32

	movf    0x25,w
	movwf   ACCaHI3
	movf    0x24,w
	movwf   ACCaHI2
	movf    0x23,w
	movwf   ACCaHI
	movf    0x22,w
	movwf   ACCaLO
	call    Add32

			;ACCa:=ACCb
	movf    ACCbLO,w
	movwf   ACCaLO
	movf    ACCbHI,w
	movwf   ACCaHI
	movf    ACCbHI2,w
	movwf   ACCaHI2
	movf    ACCbHI3,w
	movwf   ACCaHI3
	movlw   0x07
	call    LRot32

	movf    B0,w	;B+
	movwf   ACCaLO
	movf    B1,w
	movwf   ACCaHI
	movf    B2,w
	movwf   ACCaHI2
	movf    B3,w
	movwf   ACCaHI3
	call    Add32

	movf    ACCbLO,w	;assign value :=
	movwf   A0
	movf    ACCbHI,w
	movwf   A1
	movf    ACCbHI2,w
	movwf   A2
	movf    ACCbHI3,w
	movwf   A3		;end row

	movf    C0,w		;step 2
	xorwf   B0,w
	andwf   A0,w
	xorwf   C0,w
	movwf   ACCbLO
	
	movf    C1,w
	xorwf   B1,w
	andwf   A1,w
	xorwf   C1,w
	movwf   ACCbHI	

	movf    C2,w
	xorwf   B2,w
	andwf   A2,w
	xorwf   C2,w
	movwf   ACCbHI2

	movf    C3,w
	xorwf   B3,w
	andwf   A3,w
	xorwf   C3,w
	movwf   ACCbHI3

	movf    D0,w
	movwf   ACCaLO
	movf    D1,w
	movwf   ACCaHI
	movf    D2,w
	movwf   ACCaHI2
	movf    D3,w
	movwf   ACCaHI3
	call    Add32

	movlw   0x56
	movwf   ACCaLO
	movlw   0xB7
	movwf   ACCaHI
	movlw   0xC7
	movwf   ACCaHI2
	movlw   0xE8
	movwf   ACCaHI3
	call    Add32

	movf    0x29,w
	movwf   ACCaHI3
	movf    0x28,w
	movwf   ACCaHI2
	movf    0x27,w
	movwf   ACCaHI
	movf    0x26,w
	movwf   ACCaLO
	call    Add32

			;ACCa:=ACCb
	movf    ACCbLO,w
	movwf   ACCaLO
	movf    ACCbHI,w
	movwf   ACCaHI
	movf    ACCbHI2,w
	movwf   ACCaHI2
	movf    ACCbHI3,w
	movwf   ACCaHI3
	movlw   0x0C
	call    LRot32

	movf    A0,w	;A+
	movwf   ACCaLO
	movf    A1,w
	movwf   ACCaHI
	movf    A2,w
	movwf   ACCaHI2
	movf    A3,w
	movwf   ACCaHI3
	call    Add32

	movf    ACCbLO,w	;assign value :=
	movwf   D0
	movf    ACCbHI,w
	movwf   D1
	movf    ACCbHI2,w
	movwf   D2
	movf    ACCbHI3,w
	movwf   D3		;end step 2

;step 3
	movf    B0,w		;****
	xorwf   A0,w
	andwf   D0,w
	xorwf   B0,w
	movwf   ACCbLO
	
	movf    B1,w		;****
	xorwf   A1,w
	andwf   D1,w
	xorwf   B1,w
	movwf   ACCbHI	

	movf    B2,w		;****
	xorwf   A2,w
	andwf   D2,w
	xorwf   B2,w
	movwf   ACCbHI2

	movf    B3,w		;****
	xorwf   A3,w
	andwf   D3,w
	xorwf   B3,w
	movwf   ACCbHI3

	movf    C0,w		;*****
	movwf   ACCaLO
	movf    C1,w
	movwf   ACCaHI
	movf    C2,w
	movwf   ACCaHI2
	movf    C3,w
	movwf   ACCaHI3
	call    Add32

	movlw   0xDB		;*******secret
	movwf   ACCaLO
	movlw   0x70
	movwf   ACCaHI
	movlw   0x20
	movwf   ACCaHI2
	movlw   0x24
	movwf   ACCaHI3
	call    Add32

	movf    0x2D,w		;*****data
	movwf   ACCaHI3
	movf    0x2C,w
	movwf   ACCaHI2
	movf    0x2B,w
	movwf   ACCaHI
	movf    0x2A,w
	movwf   ACCaLO
	call    Add32

			
	movf    ACCbLO,w
	movwf   ACCaLO
	movf    ACCbHI,w
	movwf   ACCaHI
	movf    ACCbHI2,w
	movwf   ACCaHI2
	movf    ACCbHI3,w
	movwf   ACCaHI3
	movlw   0x11		;****Rotate
	call    LRot32

	movf    D0,w		;*****
	movwf   ACCaLO
	movf    D1,w
	movwf   ACCaHI
	movf    D2,w
	movwf   ACCaHI2
	movf    D3,w
	movwf   ACCaHI3
	call    Add32

	movf    ACCbLO,w	;*****assign value :=
	movwf   C0
	movf    ACCbHI,w
	movwf   C1
	movf    ACCbHI2,w
	movwf   C2
	movf    ACCbHI3,w
	movwf   C3		;end step 3

;step 4
	movf    A0,w		;****
	xorwf   D0,w
	andwf   C0,w
	xorwf   A0,w
	movwf   ACCbLO
	
	movf    A1,w		;****
	xorwf   D1,w
	andwf   C1,w
	xorwf   A1,w
	movwf   ACCbHI	

	movf    A2,w		;****
	xorwf   D2,w
	andwf   C2,w
	xorwf   A2,w
	movwf   ACCbHI2

	movf    A3,w		;****
	xorwf   D3,w
	andwf   C3,w
	xorwf   A3,w
	movwf   ACCbHI3

	movf    B0,w		;*****
	movwf   ACCaLO
	movf    B1,w
	movwf   ACCaHI
	movf    B2,w
	movwf   ACCaHI2
	movf    B3,w
	movwf   ACCaHI3
	call    Add32

	movlw   0xEE		;*******secret
	movwf   ACCaLO
	movlw   0xCE
	movwf   ACCaHI
	movlw   0xBD
	movwf   ACCaHI2
	movlw   0xC1
	movwf   ACCaHI3
	call    Add32

	movf    0x31,w		;*****data
	movwf   ACCaHI3
	movf    0x30,w
	movwf   ACCaHI2
	movf    0x2F,w
	movwf   ACCaHI
	movf    0x2E,w
	movwf   ACCaLO
	call    Add32

			
	movf    ACCbLO,w
	movwf   ACCaLO
	movf    ACCbHI,w
	movwf   ACCaHI
	movf    ACCbHI2,w
	movwf   ACCaHI2
	movf    ACCbHI3,w
	movwf   ACCaHI3
	movlw   0x16		;****Rotate
	call    LRot32

	movf    C0,w		;*****
	movwf   ACCaLO
	movf    C1,w
	movwf   ACCaHI
	movf    C2,w
	movwf   ACCaHI2
	movf    C3,w
	movwf   ACCaHI3
	call    Add32

	movf    ACCbLO,w	;*****assign value :=
	movwf   B0
	movf    ACCbHI,w
	movwf   B1
	movf    ACCbHI2,w
	movwf   B2
	movf    ACCbHI3,w
	movwf   B3		;end step 4


	
	return


;serial transmission to CAM - complete String

Tx2Com 	movlw 0x3F	;value for checksum
	movwf CRC	
	movlw 0x00
	btfsc Inst,01
	movlw 0x01
	call  Byte2Com  ;send 0x01 to Com
	movlw 0x45
	movwf FSR	;FSR point to Inst
	movlw 0x07
	movwf count	;send 7 bytes
Send2Com	movf  INDF,W
	call  Byte2Com
	incf  FSR,f
	decfsz count,f
	goto  Send2Com  ;loop until count=0
		
	btfss Inst,01
	return

	movf  Length,f
	btfsc STATUS,Z
	goto  CRC2Com   ;send Checksum to Com
	movf  offset,f
	btfsc STATUS,Z
	return
;send data from External EEPROM to Com
	movf  Length,W
	movwf count	;count=length
EE2Com	call  RdEE
	call  Byte2Com
	decfsz count,f
	goto  EE2Com
;send checksum to com
CRC2Com	movf  CRC,W

;serial transmission to com 1 byte(W)
	
Byte2Com	movwf buf
	xorwf CRC,f
	movlw 0x08
	movwf i
	movlw 0xE0
	call  DelayLoop
SendPort	btfss PORTB,07
	goto  SendPort
	BSF   STATUS,RP0
	BCF   TRISB,07
	BCF   STATUS,RP0
	BCF   PORTB,07
	movlw 0xDB
	call  DelayLoop
SendPort2	rrf   buf,f	;rotate buf 1 bit right through carry
	btfsc STATUS,C
	BSF   PORTB,07
	btfss STATUS,C
	BCF   PORTB,07	;clear Bit 0x07 in PORTB register
                MOVLW 0xDC	;load W with 0xDC
                CALL  DelayLoop	;call delayloop - W holds the amount of loops
	DECFSZ i,f	;decrement f 0x0D skip next command if f = 0
                GOTO  SendPort2	;goto SendPort2 - 8 Bit Loop
				
            	BSF   PORTB,07	;set Bit 0x07 in PORTB register
            	BSF   STATUS,RP0;select bank 1
            	BSF   TRISB,07	;set Bit 0x07 in TRISB register
            	BCF   STATUS,RP0;select bank 0
            	MOVLW 0xCE	;load W with 0xCE

;delayloop - on input W holds the loopcounter


DelayLoop	addlw 0x01
	btfss STATUS,Z
	goto  DelayLoop
	return

RxCom  	MOVLW 0x08		;load W with 0x08 - 8 Bits to receive
            	MOVWF i		;move W to i

RxCom2  	BTFSS PORTB,07	;test Bit 0x07 in PORTB register (RB7)
            	GOTO  RxCom2	;if set then skip this loop

RxCom3  	BTFSC PORTB,07	;test Bit 0x07 in PORTB register (RB7)
            	GOTO  RxCom3	;if not set then skip this loop
            	MOVLW 0xCA	;load W with 0xCA
            	CALL  DelayLoop	;call delayloop - W holds the amount of loops
	
RxCom4	BCF   STATUS,C	;clear CARRY Bit in STATUS
            	BTFSC PORTB,07	;test Bit 0x07 in PORTB register - skip if clear
                BSF   STATUS,C	;set CARRY Bit in STATUS
                RRF   buf,f	;rotate buf through carry
            	MOVLW 0xDE	;load W with 0xDE
                CALL  DelayLoop	;call delayloop - W holds the amount of loops
            	DECFSZ i,f	;decrement i skip next command if f = 0
            	GOTO  RxCom4	;goto RxCom4 - 8 Bit Loop

             	MOVF  buf,W	;move buf to W - W holds the received Byte
            	XORWF CRC,f	;XOR W with CRC result to CRC
            	RETURN	;return

;read incoming string from Com 

RdCommand   MOVLW   0x3F		;load W with 0x3F
            MOVWF   CRC		;move W to CRC
            CALL    RxCom		;call serial reception from Com
            XORLW   0x01		;check first Byte 0x01 ?
            BTFSS   STATUS,Z		;if not loop RdCommand
            GOTO    RdCommand		;goto RdCommand loop

            CALL    RxCom		;read second Byte
            MOVWF   Inst		;save to Inst - Instruction byte		2nd Byte to f 0x45 - classbyte

            CALL    RxCom		;call serial reception from Com	3rd Byte to f 0x48
            MOVWF   Byte3		;move W to Byte3

            CALL    RxCom		;call serial reception from Com		4th Byte to f 0x49
            MOVWF   Byte4		;move W to Byte4

            CALL    RxCom		;call serial reception from Com		5th Byte to f 0x4A
            MOVWF   Byte5		;move W to Byte5

            CALL    RxCom		;call serial reception from Com	6th Byte to Length - stringlength
            MOVWF   Length

;sort out any other inst than  02  and FF
		
            MOVF    Inst,W		;load W with instruction byte
            XORLW   0x02		;Inst2 command (02 xor 02  = 0)
            BTFSC   STATUS    , Z	;if inst 2 then goto RdCommand2
            GOTO    RdCommand2		;goto RdCommand2

            XORLW   0xFD		;classFF command (FF xor 02 xor FD = 0)
            BTFSC   STATUS    , Z	;if class FF then continue at RdCommand2 else loop
            GOTO    RdCommand2
            XORLW   0xFF
            BTFSS   STATUS,Z
            GOTO    RdCommand		;goto RdCommand loop


RdCommand2  MOVF    Length      , W	;stringslength to W
            BTFSC   STATUS    , Z	;if 0x4B = 0 then we have only to read the CRC Byte
            GOTO    RdCRC		;read the CRC Byte

            MOVWF   count		;W to count - Loopcounter for remaining Bytes

            MOVF    Inst      , W	;inst byte to W
            XORLW   0x00
            BTFSC   STATUS,Z
            GOTO    RdInst00_1
            XORLW   0xFF		;Check for inst FF
            BTFSC   STATUS    , Z	;test Bit Z in STATUS skip if clear	
            GOTO    InstFF	
            
            GOTO    Ignore		;if not classFF then continue at Ignore

;discard the remaining bytes
Ignore      call    RxCom
            decfsz  count,f
            goto    Ignore

RdCRC       call    RxCom
            movf    CRC,f
            btfss   STATUS,Z		;if checksum correct return
            goto    RdCommand
            return

RdInst00_1    	movlw   0x22
              	movwf   FSR
RdInst00_2    	call    RxCom
	movwf   INDF
	incf    FSR,f
	decfsz  count,f
	goto    RdInst00_2
	call    RxCom
	return


InstFF      movlw   0x20
            movwf   FSR
InstFF2     call    RxCom
            movwf   INDF
            incf    FSR,f
            decfsz  count,f
            goto    InstFF2
            call    RxCom
            movlw   0x22
            movwf   Inst		;store first address byte in Inst
	

;write the received bytes to external EEPROM
InstFF3     movf    0x20,w		;w=PAGE BYTE
            movwf   pages
            MOVF    0x21,W		;load W with startoffset in EEPROM
            CALL    WtEE		;initiate write sequence to external EEPROM
            MOVLW   0x02		;correction value for the amount of Bytes
            SUBWF   Length,W		;how many bytes to write?
            MOVWF   count		;load in loopcounter
            MOVF    Inst,W		;first addressbyte in buffer
            MOVWF   FSR		;load in FSR
InstFF4     MOVF    INDF,W		;Load W with Databyte to write
            CALL    Tx2EE		;transmit data to external EEPROM
            INCF    FSR       , f	;increment FSR
            DECFSZ  count      , f	;decrement loopcounter
            GOTO    InstFF4		;loop while counter <> 0
InstFF5     CALL    StopBit		;generate stopbit
            MOVLW   0x80		;app. 16ms @ 6MHz, 12mS @ 8MHz
            MOVWF   count
InstFF6     CALL    DelayLoop		
            DECFSZ  count      , f
            GOTO    InstFF6
            RETURN

            

;program starts here
;initialise the ports	

Main	movlw 0xFF
	TRIS  PORTA
            	TRIS  PORTB
            	MOVWF PORTA
            	MOVWF PORTB
            	MOVLW 0x7F
            	OPTION

            	BSF   PORTB,07

            	MOVLW 0x00
            	CALL  DelayLoop

;output the ATR to CAM

            	CLRF  offset	;clear pointer offset
            	MOVLW 0x14	;load W with outputstringlength for ATR
            	MOVWF count	;save it in pointer count
ATR2Com  	CALL  RdEE	;read one Byte from external EEPROM
            	CALL  Byte2Com  ;and send it to CAM
            	DECFSZ count,f	;decrement loopcounter
            	GOTO  ATR2Com	;loop until all Bytes are sent

;main loop

MainLoop  	call RdCommand
	CLRF 0x46	;clear f 0x46
            	CLRF 0x47	;clear f 0x47
            	MOVF Inst,W	;load W with Inst byte
            	XORLW 0x00
	BTFSC STATUS,Z
	GOTO  Inst00
	XORLW 0x02	;check for Inst 2 command (02 xor 02 = 0)
            	BTFSS STATUS,Z	;if Inst 2 then goto Inst2
            	GOTO  OtherInst
     
;class2 handling
Inst2	movf    Byte3,W		;01 02 00 .. .. ? - Get Cards ID
	BTFSC   STATUS,Z	;if 3rd byte = 0x00 then continue at GetCardID
            	GOTO    GetCardSerial
                
	XORLW   0x03		;01 02 03 .. .. ? -  Get Balance
            	BTFSC   STATUS,Z	;if 3rd byte = 0x03 then continue at GetBal
            	GOTO    GetBal
	
	xorlw   0x02
	btfsc   STATUS,Z
	goto    GetVer

                xorlw   0x03
	btfsc   STATUS,Z
	goto    GetCountry

	xorlw   0x06
	btfsc   STATUS,Z
	goto    GetCurrency

	xorlw   0x01
	btfsc   STATUS,Z
	goto    GetName

            	movf    Byte3,w
	xorlw   0x06
                btfsc   STATUS,Z
	goto    GetSurname

	xorlw   0x01
	btfsc   STATUS,Z
	goto    GetTel

	xorlw   0x0F
	btfsc   STATUS,Z
 	goto    GetExt

	movf    Byte3,w
	xorlw   0x09
	btfsc   STATUS,Z
	goto    GetAddress

	xorlw   0x03
	btfsc   STATUS,Z
	goto    GetDateExpire

            	GOTO    OtherInst	;echo all other requests to output


Inst00	call    Init
	call    Compress
	call    Tx2Com

	movlw   0x10
	movwf   count
	movlw   0x32
	movwf   FSR
SendDigest      movf    INDF,w
	call    Byte2Com
	incf    FSR
	decfsz  count
	goto    SendDigest
	call    CRC2Com
	goto    MainLoop




;Cards Serial No.

GetCardSerial   MOVLW   0x14		;offset in external EEPROM - 0x15 + 0x14 + 0x200)
                MOVWF   offset		;move W to f 0x13
                MOVLW   0x08		;load W with stringlength
                GOTO    Out2Com		;output data to Com end to beginning - 20 20 20 42 33 31 38 33 36 43 37 39 38 36 30 31 30 31 30 30)

GetVer	movlw   0x1C
	movwf   offset
	movlw   0x04
	goto    Out2Com

GetCountry	movlw   0x21
	movwf   offset
	movlw   0x03
	goto    Out2Com

GetCurrency     movlw   0x24
	movwf   offset
	movlw   0x03
	goto    Out2Com

GetName	movlw   0x27
	movwf   offset
	movlw   0x14
	goto    Out2Com

GetSurname	movlw   0x48
	movwf   offset
	movlw   0x14
	goto    Out2Com

GetTel	movlw   0x3B
	movwf   offset
	movlw   0x09
	goto    Out2Com

GetExt	movlw   0x44
	movwf   offset
	movlw   0x04
	goto    Out2Com

GetAddress      movlw   0x63
	movwf   offset
	movlw   0x5C
	goto    Out2Com

GetDateExpire   movlw   0xBF
	movwf   offset
	movlw   0x08
	goto    Out2Com
		

;Get Balance

GetBal      MOVLW   0x60		;offset in external EEPROM - 0x4C + 0x18 + 0x200) <- provider 00
            MOVWF   offset		;move W to offset
            MOVLW   0x03		;load W with 0x18
            GOTO    Out2Com		;output data to Com end to beginning

OtherInst   clrf    offset
            clrf    Length
            goto    Out2Com2 

Out2Com     MOVWF   Length		;move W to Length 
Out2Com2    CALL    Tx2Com		;call transmission data to Com 
            GOTO    MainLoop		;goto main Loop



;Handle the communication with external EEPROM

;generate controlbyte

CtrlByte    RLF     pages,W
            ANDLW   0x0F
            IORLW   0xA0

;transmit data

Tx2EE       MOVWF   EEDATA
            MOVLW   0xCF
            TRIS    PORTB
            CALL    Tx2EE2
            CALL    Tx2EE2
            GOTO    BitIn
Tx2EE2      CALL    Tx2EE3
            CALL    Tx2EE3
            CALL    Tx2EE3
Tx2EE3      RLF     EEDATA,f
            GOTO    BitOut2

;receive data

RxEE        MOVLW   0xDF
            TRIS    PORTB
            CALL    RxEE2
            CALL    RxEE2
            BSF     STATUS,C
            GOTO    BitOut
RxEE2       CALL    RxEE3
            CALL    RxEE3
            CALL    RxEE3
RxEE3       CALL    BitIn2
            RLF     EEDATA,f
            RETURN

;start bit

StartBit    BSF     PORTB,04
            MOVLW   0xCF
            TRIS    PORTB
            BSF     PORTB,05
            NOP
            BCF     PORTB,04
            GOTO    StopBit3

;stop bit

StopBit     BCF     PORTB,04
            MOVLW   0xCF
            TRIS    PORTB
            NOP
            BSF     PORTB,05
            NOP
            BSF     PORTB,04
StopBit2    NOP
StopBit3    BCF     PORTB,05
            RETURN

;bit out

BitOut      MOVLW   0xCF
            TRIS    PORTB
BitOut2     BTFSS   STATUS,C
            BCF     PORTB,04
            BTFSC   STATUS,C
            BSF     PORTB,04
            BSF     PORTB,05
            GOTO    StopBit2

;bit in

BitIn       MOVLW   0xDF
            TRIS    PORTB
BitIn2      BSF     PORTB,05
            NOP
            BSF     STATUS,C
            BTFSS   PORTB,04
            BCF     STATUS,C
            GOTO    StopBit3

RdEE        MOVLW   0x02		;load W with 0x02 - Page 02 in external EEPROM
            MOVWF   pages		
            MOVF    offset,W		;move offset to W
            ADDWF   count,W		;add W and count - result to W

;external EEPROM read

RdEE2       MOVWF   EEADR		;move W to f EEADR
            CALL    StartBit		;call start bit
            BCF     STATUS,C		;clear CARRY in STATUS
            CALL    CtrlByte		;call generate control byte
            MOVF    EEADR,W		;move f EEADR to W
            CALL    Tx2EE		;call Tx2EE
            CALL    StartBit		;call start bit
            BSF     STATUS,C		;set CARRY in STATUS
            CALL    CtrlByte		;call control byte
            CALL    RxEE		;call RxEE
            CALL    StopBit		;call stop bit
            MOVF    EEDATA,W		;move f EEDATA to W
            RETURN		;return

;external EEPROM write

WtEE        MOVWF   EEADR		;save lowbyte Adress to EEADR
            CALL    StartBit		;generate Startbit
            BCF     STATUS,C		;clear Carry in Status -> WRITE
            CALL    CtrlByte		;generate controlbyte
            MOVF    EEADR,W		;lowbyte address to W
            GOTO    Tx2EE		;transmit data



END
