$include(reg51.inc)
ORG 0000h 
start:
MOV P2,#0FFh
main:
clr c
mov a,p2
rlc a
mov p2,a
acall delay
jc main
jmp start
RET
delay:
W3:MOV R2,#10
W2:MOV R1,#200
W1:MOV R0,#200
W:DJNZ R0,W
	DJNZ R1,W1
	DJNZ R2,W2
RET
END
