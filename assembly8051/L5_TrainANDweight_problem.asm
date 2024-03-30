		; 完成度為 Level ?
		ORG	0H			;系統開機的執行位址為0
		JMP	INIT
		ORG	30H          
INIT:           			;填入測試資料
		MOV	R2,#0
		MOV	20H, #7;
		MOV	21H, #50		
		MOV	22H, #60		
		MOV	23H, #30		
		MOV	24H, #40		
		MOV	25H, #45		
		MOV	26H, #35
		MOV	27H, #25
MAIN:               	;使用者主程式
		MOV	R4, #4		;人數限制
		MOV	R5, #200		;總重量限制
		MOV	R6, #32		;輸入, 乘客陣列
		MOV	R7, #0		;輸出, 列車數量

		CALL		TRAIN
		JMP	$   		;跳回自己，無限迴圈, 在此檢查輸出

TRAIN:
		MOV		R2,A
		MOV		A,R4
		MOV		R3,A
		MOV		A,R6
		MOV		R0,A
		MOV		A,@R0
	LOOP:
			SUBB		A,#1
			MOV		R1,A
			;?里???判?重量,R2,R3可用
			MOV		A,R6
			INC		A
			MOV		R0,A
			MOV		R6,A
			MOV		A,@R0
			
			
			

			MOV		A,R1
			JZ		NEXT
			DJNZ		R3,LOOP
	NEXT:
			MOV		@R0,A
			INC		@R0
			MOV		A,@R0
			MOV		R3,A
			INC	R7
			DJNZ		R3,TRAIN
		RET
		END

