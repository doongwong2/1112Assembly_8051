		ORG	0000H          	;系統開機的執行位址為0
		LJMP	MAIN
		ORG	000BH
T0ISR:	
		CPL	P1.2
		MOV		A,R1
		MOV		R0,A
		MOVC	A, @A+DPTR
		MOV		TL0,A
		MOV		A,R0
		DEC		A
		MOVC	A, @A+DPTR
		MOV		TH0,A
		RETI
		ORG		0030H 
MAIN:
		MOV	DPTR, #TABLE2
		MOV		TMOD,#01H
		MOV		IE,#82H
LOOP:
		CLR	A
	;	INC	A	;由1開始
		INC	A
		JNB	P3.0, KEYIN
		INC	A
		INC	A
		JNB	P3.1, KEYIN
		INC	A
		INC	A
		JNB	P3.2, KEYIN
		INC	A
		INC	A
		JNB	P3.3, KEYIN
		INC	A
		INC	A
		JNB	P3.4, KEYIN
		INC	A
		INC	A
		JNB	P3.5, KEYIN
		INC	A
		INC	A
		JNB	P3.6, KEYIN
		INC	A
		INC	A
		JNB	P3.7, KEYIN
		CLR	TR0
		JMP	LOOP

KEYIN:
		MOV		R1,A
		SETB		TR0
		JMP	LOOP

TABLE2:	DB	F8H
		DB	88H

		DB	F9H
		DB	58H

		DB	FAH
		DB	13H

		DB	FAH
		DB	68H

		DB	FBH
		DB	04H

		DB	FBH
		DB	8FH

		DB	FCH
		DB	0BH

		DB	FCH
		DB	44H
		END
