		ORG	0H          	;系統開機的執行位址為0
		JMP	INIT
D_ARRAY		EQU	40H		;display information
		
		ORG	30H          	;使用者程式起始位址

INIT:
		MOV	R0, #D_ARRAY	;prepare display content
		MOV 	@R0,#0
		INC	R0
		MOV 	@R0,#5
		INC	R0
		MOV 	@R0,#1
		INC	R0
		MOV 	@R0,#8
MAIN:
CALL_LOOP:
		MOV	R4, #D_ARRAY	;display content
		MOV	R5, #2		;start position
		MOV	R6, #4		;display length
		MOV	R7, #200		;delay parameter
		CALL	DISPLAY
		JMP	CALL_LOOP

DELAY:			;input R7
D1:		
		MOV		TL0,#LOW(-100)
		MOV		TH0,#HIGH(-100)
		SETB		TR0
WAIT:	JNB		TF0,WAIT
		CLR		TR0
		CLR		TF0
		DJNZ 	R7,D1
		RET 

DISPLAY:

;將資訊輸出到數碼管
		MOV	R0, AR4		;R0=pointer of content
		MOV	R1, AR5		;R1=position index

LOOP1:
;Output Position Code
		MOV	DPTR, #POSITION
		MOV	A, R1
		MOVC	A, @A+DPTR	;A=position code
		MOV	P0, A
		SETB	P2.3
		CLR	P2.3
;Output Segment Code
		MOV	DPTR, #SEGMENT
		MOV	A, @R0
		MOVC	A, @A+DPTR	;A=segment code
		MOV	P0, A
		SETB	P2.2
		CLR	P2.2
;move pointer
		INC	R1
		INC	R0

;call delay, 
		CALL	DELAY
		DJNZ	R6, LOOP1
		RET

SEGMENT:
		DB	03FH, 06H, 05BH, 04FH
		DB	066H, 06DH, 07DH, 07H
		DB	07FH, 06FH
POSITION:
		DB	0FEH, 0FDH, 0FBH, 0F7H
		DB	0EFH, 0DFH, 0BFH, 07FH
		END
