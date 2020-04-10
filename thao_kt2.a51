      $include (reg51.inc)
    org 0000h
start:
    mov p0,#00h
    mov p2,#00h
    acall sang_dan_tat_dan                 ;loai1
    acall sang_dan_tat_dan
    acall sang_dan_tat_dan
    acall sang_tu_giua_ra_tat_nguoc_lai   ;loai2
    acall sang_tu_giua_ra_tat_nguoc_lai
    acall sang_tu_giua_ra_tat_nguoc_lai
    acall sang_tu_ngoai_vao_tat_nguoc_lai   ;loai3
    acall sang_tu_ngoai_vao_tat_nguoc_lai
    acall sang_tu_ngoai_vao_tat_nguoc_lai
    acall chop_tat_xen_ke                   ; loai4
    acall chop_tat_xen_ke
    acall chop_tat_xen_ke
    acall chop_tat_xen_ke
    acall chop_tat_xen_ke
    acall chop_tat_xen_ke
    acall chop_tat_ba_lan_lien_tuc         ;loai5
    acall chop_tat_ba_lan_lien_tuc
    acall chop_tat_ba_lan_lien_tuc
    acall mot_led_chay                      ;loai6
    acall mot_led_chay
    acall mot_led_chay
    acall led_7_thanh
    acall led_7_thanh
    acall led_7_thanh
    jmp start
sang_dan_tat_dan:
    mov a,p0                     
lap0:
    setb c
    rlc a
    mov p0,a
    acall delay
    jnb p0.7,lap0
    mov a,p2
lap:
    setb c
    rlc a
    mov p2,a
    acall delay
    jnb p2.7,lap
    mov a,p2
lap1:
    clr c
    rrc a
    mov p2,a
    acall delay
    jb p2.0,lap1
    mov a,p0
lap2:
    clr c
    rrc a
    mov p0,a
    acall delay
    jb p0.0,lap2
    ret
sang_tu_giua_ra_tat_nguoc_lai:
lap3:                      
    mov a,p0
    setb c
    rrc a
    mov p0,a
    mov a,p2
    setb c
    rlc a
    mov p2,a
    acall delay
    jnb p2.7,lap3
lap4:
    mov a,p2
    clr c
    rrc a
    mov p2,a
    mov a,p0
    clr c
    rlc a
    mov p0,a
    acall delay
    jb p0.7,lap4
    ret
sang_tu_ngoai_vao_tat_nguoc_lai:
lap5:                               
    mov a,p0
    setb c
    rlc a
    mov p0,a
    mov a,p2
    setb c
    rrc a
    mov p2,a
    acall delay
    jnb p2.0,lap5
lap6:
    mov a,p2
    clr c
    rlc a
    mov p2,a
    mov a,p0
    clr c
    rrc a
    mov p0,a
    acall delay
    jb p0.0,lap6
    ret
chop_tat_xen_ke:
    mov p0,#00h              
    mov p2,#0ffh
    acall delay3
    mov p0,#0ffh
    mov p2,#00h
    acall delay3
    ret
chop_tat_ba_lan_lien_tuc:
    mov p0,#0ffh          
    mov p2,#0ffh
    acall delay1
    mov p0,#00h
    mov p2,#00h
    acall delay1
    mov p0,#0ffh
    mov p2,#0ffh
    acall delay1
    mov p0,#00h           
    mov p2,#00h
    acall delay1
    mov p0,#0ffh
    mov p2,#0ffh
    acall delay1
    mov p0,#00h
    mov p2,#00h
    ret
    
mot_led_chay:
    mov a,#00000001b
    mov p0,a
lap23:
   clr c
   rlc a
   acall delay
   mov p0,a
   jnb p0.7,lap23
   acall delay
   mov p0,#00h
   acall delay
   mov a,#00000001b
   mov p2,a
lap24:
   clr c
   rlc a
   acall delay
   mov p2,a
   jnb p2.7,lap24
   acall delay
   mov p2,#00h
   ret
   
led_7_thanh:
 setb p1.0
 mov p3,#06h
 clr p1.1
 clr p1.2
 clr p1.3
 clr p1.4
 clr p1.5
 clr p1.6
 clr p1.7
 acall delay7
 clr p1.0
 mov p3,#5bh
 setb p1.1
 acall delay7
 clr p1.1
 mov p3,#4fh
 setb p1.2
 acall delay7
 clr p1.2
 mov p3,#66h
 setb p1.3
 acall delay7
 clr p1.3
 mov p3,#6dh
 setb p1.4
 acall delay7
 clr p1.4
 mov p3,#7dh
 setb p1.5
 acall delay7
 clr p1.5
 mov p3,#07h
 setb p1.6
 acall delay7
 clr p1.6
 mov p3,#7fh
 setb p1.7
 acall delay7
 clr p1.7
 ret
   
   
delay1:
    mov r3,#250
w3:
    mov r4,#250
    djnz r4,$
    djnz r3,w3
delay:
    mov r0,#1
w2:
    mov r1,#200
w1:
    mov r2,#200
    djnz r2,$
    djnz r1,w1
    djnz r0,w2
    ret
delay2:
    mov r0,#10
w5:
    mov r1,#200
w4:
    mov r2,#200
    djnz r2,$
    djnz r1,w4
    djnz r0,w5
    ret
delay3:
    mov r0,#3
w6:
    mov r1,#200
w7:
    mov r2,#200
    djnz r2,$
    djnz r1,w7
    djnz r0,w6
    ret
delay7:
 mov r7,#10h
 ;x2:
 mov tmod,#10h
lap99:
 clr tf1
 mov th1,#3ch
 mov tl1,#0afh
 setb tr1
 jnb tf1,$
 djnz r7,lap99
 ;x1:
 ;mov r5,#200
 ;djnz r5,$
 ;djnz r6,x1
 ;djnz r7,x2
 ret
    end
