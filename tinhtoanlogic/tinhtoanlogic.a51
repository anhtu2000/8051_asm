$include(reg51.inc)
mov a,#0c3h
mov r0,#55h
anl a,r0
mov r2,a
end
