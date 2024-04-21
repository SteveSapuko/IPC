#include "IPC.asm"

acz
amov r0
imr r5, 1

first:
    rmov r5
    add r0
    amov r0
    bca! second
    jmp! first

second:
    acz
    adc r1
    amov r1
    bca! third
    jmp! first

third:
    acz
    adc r2
    amov r2
    jmp! first