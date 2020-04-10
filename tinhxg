  $INCLUDE(REG51.INC)
ORG 0000H
main:
mov p3,#0ffh
mov p2,#0ffh
mov a,#0ffh

control1:
	clr c
	Rrc a
	Mov p3,a
	mov p2,a
	acall lap
	jb acc.0,control1
mov a,#0ffh
control2:
	clr c
	Rlc a
	Mov p3,a
	mov p2,a
	acall lap
	jb acc.7,control2	
jmp main
lap:mov r2,#10
w3:mov r1,#20
w2:mov r0,#220
w1:djnz r0,w1
	djnz r1,w2
	Djnz r2,w3
	ret
end

