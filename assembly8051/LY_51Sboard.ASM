;�������ˮ��
;ʹ�öŰ�������P1��LED�˿�J9
       ORG   00H

START:  MOV   DPTR,#TABLE    ; �����ĵ�ַ��������ָ��
LOOP:   CLR   A
        MOVC  A,@A+DPTR      ;������ָ����ָ�ĵ�ַȡ��
        CJNE  A,#01,LOOP1    ; ȡ�������Ƿ�01H����������LOOP1
        JMP   START
LOOP1:  MOV   P1,A           ;ȡ����ֵ�����P1�˿�
        MOV   R3,#20         ;���ڸı���ʱ����
        CALL  DELAY
        INC   DPTR
        JMP   LOOP
DELAY: MOV   R0,#12000H
D1:    MOV   R7,#14000H
        DJNZ  R7,$
        DJNZ  R0,D1
        RET
TABLE:  DB    0FEH,0FDH,0FBH,0F7H  ;����
        DB    0EFH,0DFH,0BFH,7FH
        DB    0FEH,0FDH,0FBH,0F7H  ;����
        DB    0EFH,0DFH,0BFH,7FH
        DB    7FH,0BFH,0DFH,0EFH    ;����
        DB    0F7H,0FBH,0FDH,0FEH
        DB    7FH,0BFH,0DFH,0EFH    ;����
        DB    0F7H,0FBH,0FDH,0FEH
        DB    00H,0FFH,00H,0FFH     ;��˸
        DB    01H                   ;������
        END
