$INCLUDE(REG51.INC)
ORG 0000H
X2:
   MOV P0,#0FFH
   MOV P2,#0FFH
   MOV A,#0FFH
 X22:
   CLR C
   RLC A
   MOV P0,A
   CALL TRE
   JC X22
   MOV A,#0FFH
 X23:
   CLR C
   RLC A
   MOV P2,A
   CALL TRE
   JC X23
 X24:
   SETB C
   RRC A
   MOV P2,A
   CALL TRE
   JNC X24
   MOV A,#00H
   
 X25:
   SETB C
   RRC A
   MOV P0,A
   CALL TRE
   JNC X25
   
   
   MOV P0,#0FFH
   MOV P2,#0FFH
   MOV A,#0FFH
X1:
  MOV P3,#0FFH
  MOV A,#0
  MOV R2,#0
  MOV DPTR,#BANG_MA
X10:
  MOV A,R2
  MOVC A,@A+DPTR
  MOV P3,A
  CALL TRE
  INC R2
  CJNE R2,#11,X10
  JMP X2
BANG_MA: DB 0C0H,0F9H,0A4H,0B0H,99H,92H,82H,0F8H,80H,90H,0FFH

TRE:
    MOV TMOD,#01H
    MOV R0,#3
 LAP:
    CLR TF0
    MOV TH0,#3CH
    MOV TL0,#0B0H
    SETB TR0
    JNB TF0,$
    DJNZ R0,LAP
    CLR TR0
    RET
END 
