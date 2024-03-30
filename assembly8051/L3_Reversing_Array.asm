;本程式為簡易版
		ORG	0H			;系統開機的執行位址為0
		JMP	INIT
LENGTH	EQU	40H			;length
ARRAY	EQU	41H 
		ORG	30H          
INIT:           			;填入起始的資料
		MOV	30H, #0;
		MOV	31H, #0;
		MOV	32H, #0;
		MOV	33H, #0;
		MOV	34H, #0;
		MOV	35H, #0;
		MOV	36H, #0;
		MOV	37H, #0;
		MOV	40H, #0;
		MOV	41H, #0;
		MOV	42H, #0;
		MOV	43H, #0;
		MOV	44H, #0;
		MOV	45H, #0;
		MOV	46H, #0;
		MOV	47H, #0;
		MOV	40H, #7;
		MOV	41H, #'K';
		MOV	42H, #'e';
		MOV	43H, #'i';
		MOV	44H, #'l';
		MOV	45H, #'A';
		MOV	46H, #'5';
		MOV	47H, #'1';
MAIN:               	;使用者程式起始位址
DSTA EQU 37H
	BLKMOV:
		MOV R2,LENGTH
		MOV R0,#ARRAY
		MOV R1,#DSTA
	MLOOP:
		MOV A,@R0
		MOV @R1,A
		INC R0
		DEC R1
		DEC R2
		CJNE R2,#0,MLOOP
MOV R2,LENGTH
MOV R0,#ARRAY
INC R1


	MLOOPSEC:
		MOV A,@R1
		MOV @R0,A
		INC R0
		INC R1
		DEC R2
		CJNE R2,#0,MLOOPSEC




		JMP	$   ;跳回自己，無限迴圈
