		ORG	0000H          	;�t�ζ}���������}��0
		LJMP	MAIN
		ORG	000BH
T0ISR:	CPL	P0.2
		RETI
		ORG		0030H          	;�ϥΪ̵{���_�l��}
MAIN:
		MOV	DPTR, #TABLE
		MOV		TMOD,#02H	
		MOV		TH0,#-250
		SETB		TR0
		MOV		IE,#82H
LOOP:
		CLR	A
		INC	A		;��1�}�l
		JNB	P3.0, KEYIN
		INC	A
		JNB	P3.1, KEYIN
		INC	A
		JNB	P3.2, KEYIN
		INC	A
		JNB	P3.3, KEYIN
		INC	A
		JNB	P3.4, KEYIN
		INC	A
		JNB	P3.5, KEYIN
		INC	A
		JNB	P3.6, KEYIN
		INC	A
		JNB	P3.7, KEYIN
		JMP	LOOP

KEYIN:
		MOVC	A, @A+DPTR
		MOV	P1, A
		JMP	LOOP

TABLE:		DB	0C0H, 0F9H, 0A4H, 0B0H
		DB	99H, 92H, 82H, 0F8H
		DB	80H, 90H
		END
