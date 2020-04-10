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

control2:
	setb c
	Rlc a
	Mov p3,a
	mov p2,a
	acall lap
	jnb acc.7,control2
mov dph,#03h
mov r3,#00h
loop:
	mov r4,#50
lap1:
	mov 01h,03h
	Mov r2,#0f0h
	Mov r0,#8
next:
	mov dpl,r1
	Clr a
	Movc a,@a+dptr
	Mov p0,a
	clr a
	Mov dpl,r2
	Movc a,@a+dptr
	Mov p3,a
	Acall delay
	Mov p3,#0ffh
	Mov p0,#0ffh
	Inc r1
	Inc r2
	Djnz r0,next
	Djnz r4,lap1
	Inc r3
	Cjne r3,#16,loop
	Jmp start
delay:
	mov r6,#200h
w1:mov r7,#255h
	djnz r7,$
	Djnz r6,w1
	Ret
	
org 0300hs
Db 0c0h,0f9h,0a4h,0b0h,99h,92h,82h,0f8h
Org 03f0h
Db 7fh,0bfh,0dfh,0efh,0f7h,0fbh,0fdh,0feh

jmp main
lap:mov r2,#10
w3:mov r1,#20
w2:mov r0,#220
w1:djnz r0,w1
	djnz r1,w2
	Djnz r2,w3
	ret
end

