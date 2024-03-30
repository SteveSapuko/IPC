#include "IPC.asm"

wait:
    in r1
    prop r1
    bze! wait

    ldi r6, 0b00000100
    rmov r6
    and r1
    bnz! up

    ldi r6, 0b00001000
    rmov r6
    and r1
    bnz! down

    ldi r6, 0b00000001
    rmov r6
    and r1
    bnz! left

    ldi r6, 0b00000010
    rmov r6
    and r1
    bnz! right

    jmp! wait

up:
    ldi r6, 1
    rmov r6
    add r2
    amov r2

    jmp! wait

down:
    ldi r6, 1
    rmov r2
    sub r6
    amov r2

    jmp! wait

left:
    rmov r2
    add r2
    amov r2

    jmp! wait

right:
    clc
    ror r2
    amov r2

    jmp! wait