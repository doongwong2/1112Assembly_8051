normal:
	MOV P1,#11000000B
	NOP
	MOV P1,#11111001B
	NOP
	MOV P1,#10100100B
	NOP
	MOV P1,#10110000B
	NOP
	MOV P1,#10011001B
	NOP
	MOV P1,#10010010B
	NOP
	MOV P1,#10000010B
	NOP
	MOV P1,#11111000B
	NOP
	MOV P1,#10000000B
	NOP
	MOV P1,#10010000B
	NOP
	MOV P1,#10001000B
	NOP
	MOV P1,#10000011B
	NOP
	MOV P1,#11000110B
	NOP
	MOV P1,#10100001B
	NOP
	MOV P1,#10000110B
	NOP
	MOV P1,#10001110B
	NOP
	JNB P2.0,reverse
	JMP normal

reverse:
	MOV P1,#10001110B
	NOP
	MOV P1,#10000110B
	NOP
	MOV P1,#10100001B
	NOP
	MOV P1,#11000110B
	NOP
	MOV P1,#10000011B
	NOP
	MOV P1,#10001000B
	NOP
	MOV P1,#10010000B
	NOP
	MOV P1,#10000000B
	NOP
	MOV P1,#11111000B
	NOP
	MOV P1,#10000010B
	NOP
	MOV P1,#10010010B
	NOP
	MOV P1,#10011001B
	NOP
	MOV P1,#10110000B
	NOP
	MOV P1,#10100100B
	NOP
	MOV P1,#11111001B
	NOP
	MOV P1,#11000000B
	NOP
	JB P2.0,jmpnormal
	JMP reverse

jmpnormal:
	JMP normal