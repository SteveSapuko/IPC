#include "IPC.asm"

start:
    ldi r0, 255
    rmov r0
    adc r0
    bca! done
    jmp! start

done:
    hlt