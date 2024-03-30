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
		MOV	R7, #20		;delay parameter
		CALL	DISPLAY
		JMP	CALL_LOOP

DELAY:			;input R7
D1:		
		MOV 	R3,#32
		DJNZ 	R3,$		;R3 is responsible for storing the delay count, so when writing the display function, R3 should not be used.
		DJNZ 	R7,D1
		RET 

DISPLAY:
;BEGIN OF YOUR CODE
	MOV		A,R5
	MOV		R2,A	;start at
	MOV		A,R4	
	MOV		R0,A	;array position

SEGLOOP:
	MOV		A,R2
	CLR		C
	SUBB		A,#0
	JNZ		ONEP
	MOV		P0,#0FEH
	SETB		P2.3
	CLR		P2.3

ONEP:
	MOV		A,R2
	CLR		C
	SUBB		A,#1
	JNZ		TWOP
	MOV		P0,#0FDH
	SETB		P2.3
	CLR		P2.3
TWOP:
	MOV		A,R2
	CLR		C
	SUBB		A,#2
	JNZ		THREEP
	MOV		P0,#0FBH
	SETB		P2.3
	CLR		P2.3
THREEP:
	MOV		A,R2
	CLR		C
	SUBB		A,#3
	JNZ		FOURP
	MOV		P0,#0F7H
	SETB		P2.3
	CLR		P2.3
FOURP:
	MOV		A,R2
	CLR		C
	SUBB		A,#4
	JNZ		FIVEP
	MOV		P0,#0EFH
	SETB		P2.3
	CLR		P2.3
FIVEP:
	MOV		A,R2
	CLR		C
	SUBB		A,#5
	JNZ		SIXP
	MOV		P0,#0DFH
	SETB		P2.3
	CLR		P2.3
SIXP:
	MOV		A,R2
	CLR		C
	SUBB		A,#6
	JNZ		SEVENP
	MOV		P0,#0BFH
	SETB		P2.3
	CLR		P2.3
SEVENP:
	MOV		A,R2
	CLR		C
	SUBB		A,#7
	JNZ		SETOUTPUT
	MOV		P0,#07FH
	SETB		P2.3
	CLR		P2.3

SETOUTPUT:
	MOV		A,@R0
	MOV		R1,A	;num inside array
	
	MOV		A,R1
	CLR		C
	SUBB		A,#0
	JNZ		ONE
	MOV		P0,#03FH
	SETB		P2.2
	CLR		P2.2
	CALL		DELAY
ONE:
	MOV		A,R1
	CLR		C
	SUBB		A,#1
	JNZ		TWO
	MOV		P0,#06H
	SETB		P2.2
	CLR		P2.2
	CALL		DELAY
TWO:
	MOV		A,R1
	CLR		C
	SUBB		A,#2
	JNZ		THREE
	MOV		P0,#05BH
	SETB		P2.2
	CLR		P2.2
	CALL		DELAY
THREE:
	MOV		A,R1
	CLR		C
	SUBB		A,#3
	JNZ		FOUR
	MOV		P0,#04FH
	SETB		P2.2
	CLR		P2.2
	CALL		DELAY
FOUR:
	MOV		A,R1
	CLR		C
	SUBB		A,#4
	JNZ		FIVE
	MOV		P0,#066H
	SETB		P2.2
	CLR		P2.2
	CALL		DELAY
FIVE:
	MOV		A,R1
	CLR		C
	SUBB		A,#5
	JNZ		SIX
	MOV		P0,#06DH
	SETB		P2.2
	CLR		P2.2
	CALL		DELAY
SIX:
	MOV		A,R1
	CLR		C
	SUBB		A,#6
	JNZ		SEVEN
	MOV		P0,#07DH
	SETB		P2.2
	CLR		P2.2
	CALL		DELAY
SEVEN:
	MOV		A,R1
	CLR		C
	SUBB		A,#7
	JNZ		EIGHT
	MOV		P0,#07H
	SETB		P2.2
	CLR		P2.2
	CALL		DELAY
EIGHT:
	MOV		A,R1
	CLR		C
	SUBB		A,#8
	JNZ		NINE
	MOV		P0,#07FH
	SETB		P2.2
	CLR		P2.2
	CALL		DELAY
NINE:
	MOV		A,R1
	CLR		C
	SUBB		A,#9
	JNZ		NEXT
	MOV		P0,#06FH
	SETB		P2.2
	CLR		P2.2
	CALL		DELAY
NEXT:
	INC		R0
	INC		R2
	DEC		R6
	MOV		A,R6
	
	JZ		ENDFUNC
	JMP		SEGLOOP
ENDFUNC:
;END OF YOUR CODE
		RET

SEGMENT:
		DB	03FH, 06H, 05BH, 04FH
		DB	066H, 06DH, 07DH, 07H
		DB	07FH, 06FH
POSITION:
		DB	0FEH, 0FDH, 0FBH, 0F7H
		DB	0EFH, 0DFH, 0BFH, 07FH
		END