		; �����׬� Level ?
		ORG	0H			;�t�ζ}���������}��0
		JMP	INIT
		ORG	30H          
INIT:           			;��J���ո��
		MOV	R2,#0
		MOV	20H, #7;
		MOV	21H, #50		
		MOV	22H, #60		
		MOV	23H, #30		
		MOV	24H, #40		
		MOV	25H, #45		
		MOV	26H, #35
		MOV	27H, #25
MAIN:               	;�ϥΪ̥D�{��
		MOV	R4, #4		;�H�ƭ���
		MOV	R5, #200		;�`���q����
		MOV	R6, #32		;��J, ���Ȱ}�C
		MOV	R7, #0		;��X, �C���ƶq

		CALL		TRAIN
		JMP	$   		;���^�ۤv�A�L���j��, �b���ˬd��X

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
			;?��???�P?���q,R2,R3�i��
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

