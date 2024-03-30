#include "IPC.asm"

ldi r5, 0
ldi r4, 255

first:
    stc
    rmov r5
    adc r0
    amov r0
    bca! second
    jmp! first

second:
    rmov r5
    adc r1
    amov r1
    bca! third
    jmp! first

third:
    rmov r5
    adc r2
    amov r2
    bca! fourth
    jmp! first

fourth:
    rmov r5
    adc r3
    amov r3
    cmp r4
    bze! done
    jmp! first

done:
    hlt