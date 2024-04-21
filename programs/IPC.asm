; instructions
#ruledef {
    add {r: register} => r @ 0`5
    sub {r: register} => r @ 1`5
    adc {r: register} => r @ 2`5
    sbc {r: register} => r @ 3`5
    ror {r: register} => r @ 4`5
    nor {r: register} => r @ 5`5
    and {r: register} => r @ 6`5

    stc =>  0`3 @ 9`5
    clc => 0`3 @ 10`5
    rmov {r: register} => r @ 11`5
    amov {r: register} => r @ 12`5
    jmp => 0`3 @ 13`5
    bca => 0`3 @ 14`5
    bnc => 0`3 @ 15`5
    bze => 0`3 @ 16`5
    bnz => 0`3 @ 17`5
    bsi => 0`3 @ 18`5
    bpa => 0`3 @ 19`5
    acz => 0`3 @ 20`5
    ima {v: i8} => 0`3 @ 21`5 @ v
    imr {r: register}, {v: i8}=> r @ 22`5 @ v
    spc => 0`3 @ 23`5
    str {r: register} => r @ 24`5
    ld {r: register} => r @ 25`5
    in {r: register} => r @ 26`5
    out {r: register} => r @ 27`5
    nop => 0`3 @ 28`5
    hlt => 0`3 @ 29`5
    push {r: register} => r @ 30`5
    pop {r: register} => r @ 31`5
}

; sugarcoating for address instructions
#ruledef {
    jmp! {a: u16} => asm {
        imr marh, {a}[15:8]
        imr marl, {a}[7:0]
        jmp
    }

    bca! {a: u16} => asm {
        imr marh, {a}[15:8]
        imr marl, {a}[7:0]
        bca
    }

    bnc! {a: u16} => asm {
        imr marh, {a}[15:8]
        imr marl, {a}[7:0]
        bnc
    }

    bze! {a: u16} => asm {
        imr marh, {a}[15:8]
        imr marl, {a}[7:0]
        bze
    }

    bnz! {a: u16} => asm {
        imr marh, {a}[15:8]
        imr marl, {a}[7:0]
        bnz
    }

    bsi! {a: u16} => asm {
        imr marh, {a}[15:8]
        imr marl, {a}[7:0]
        bsi
    }


    bpa! {a: u16} => asm {
        imr marh, {a}[15:8]
        imr marl, {a}[7:0]
        bpa
    }

    str! {r: register}, {a: u16} => asm {
        imr marh, {a}[15:8]
        imr marl, {a}[7:0]
        str {r}
    }

    ld! {r: register}, {a: u16} => asm {
        imr marh, {a}[15:8]
        imr marl, {a}[7:0]
        ld {r}
    }
}

#subruledef register {
    r0 => 0`3
    r1 => 1`3
    r2 => 2`3
    r3 => 3`3
    r4 => 4`3
    r5 => 5`3
    r6 => 6`3
    r7 => 7`3
    
    bpl => 2`3
    bph => 3`3

    spl => 4`3
    sph => 5`3

    marl => 6`3
    marh => 7`3


}

