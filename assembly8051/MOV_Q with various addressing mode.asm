
; Title: MOV with various addressing mode
; Note: 
; 	location of operand = Code Memory | Data Memory | Register

	ORG	0H
	JMP	Start

	ORG	30H
Start:
Qset1:
	MOV 	A,#7BH
	MOV 	B,#0E5H
	MOV 	R0,#32
	MOV	R4,#89H
	MOV 	R7,#0C3H
; For the 2nd operand of last instruction
; Address = [Code Memory 39H] 
; Machine Code = [7FH C3H] 
; Addressing mode = [Indirect Addressing Mode] 
; The location of the operand = [Code Memory 3AH] 
; The content of Register R4 = [89H]

Qset2:
	MOV	A,R0
	MOV	R1,A
; Please turn on switches 0, 1, 3, 4, and 6
	MOV	A,P2
	MOV	P1,A
; For the 2nd operand of last instruction
; Addressing mode  = [Direct Addresing]
; The location of the operand = [Code Memory, 40H]
; The digit displayed in the left most 7-segment = [2] 

Qset3:
	MOV	A,07H
	MOV	67H,A
	MOV	06H,A
; For the 1st operand of last instruction
; Addressing mode of last instruction = [Index Addressing]
; The location of the operand = [Code Memory 46H]
; Switch from "Code Memory" to "Data Memory", the data content of address 06H = [C3H]

Qset4:
	MOV	R0,#04H
	MOV	R1,#40H	
	MOV	A,@R0
	MOV	@R1,A
; For the 2nd operand of last instruction
; Addressing mode = [Indirect Addressing]
; The location of the operand = [Code Memory, 4CH]
; The data content of address 40H = [89H] 

Qset5:
	MOV 	DPH,#HIGH(table_of_LED_pattern)	;ref 1
	MOV 	DPL,#LOW(table_of_LED_pattern)	;ref 2
	MOV	A,#0
	MOVC	A,@A+DPTR
	MOV	P1,A
	MOV	A,#1
	MOVC	A,@A+DPTR
; For the 2nd operand of last instruction
; Addressing mode = [Index Addressing]
; The location of the operand  = [Code Memory, 5AH]
; Hint: Please check the definition of MOVC and MOVX
; The operand is obtained from a table pointed by [A/ ACC], 
;    and indexed by [DPTR] 

; "table_of_LED_pattern: is a label, it also has a value, what is its address? [5F]
; Hint: There are two ways to find out the address
;	(1)Check the first two MOV instructions (ref 1 and ref 2), 
;		the content of DPH is [00] , the content of DPL is [5F]
;	(2)The declaration of table_of_LED_pattern (ref 3)
;		it define a table, whose first element (byte) is 0AAH
;		so please switch from "Data Memory" to "Code Memory", 
;		then search the content of code memory to find out the value "0AA", 
; 		the address of "0AA" is [5F]
	MOV	P1,A
	JMP	start

table_of_LED_pattern:		;ref 3
	db	0AAH
	db	0FH
	END
