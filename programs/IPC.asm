#ruledef {
    ldi {r: register}, {data: i8} => r @ 22`5 @ data
}

; instructions
#ruledef {
    add {r: register} => r @ 0`5
    sub {r: register} => r @ 1`5
    adc {r: register} => r @ 2`5
    sbc {r: register} => r @ 3`5
    ror {r: register} => r @ 4`5
    nor {r: register} => r @ 5`5
    and {r: register} => r @ 6`5
    cmp {r: register} => r @ 8`5
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
    bns => 0`3 @ 19`5
    bpa => 0`3 @ 20`5
    bnp => 0`3 @ 21`5
    spc => 0`3 @ 23`5
    str => 0`3 @ 24`5
    ld => 0`3 @ 25`5
    in {r: register} => r @ 26`5
    out {r: register} => r @ 27`5
    nop => 0`3 @ 28`5
    hlt => 0`3 @ 29`5
    prop {r: register} => r @ 30`5
}

; sugarcoating for address instructions
#ruledef {
    jmp! {a: u16} => asm {
        ldi mah, {a}[15:8]
        ldi mal, {a}[7:0]
        jmp
    }

    bca! {a: u16} => asm {
        ldi mah, {a}[15:8]
        ldi mal, {a}[7:0]
        bca
    }

    bnc! {a: u16} => asm {
        ldi mah, {a}[15:8]
        ldi mal, {a}[7:0]
        bnc
    }

    bze! {a: u16} => asm {
        ldi mah, {a}[15:8]
        ldi mal, {a}[7:0]
        bze
    }

    bnz! {a: u16} => asm {
        ldi mah, {a}[15:8]
        ldi mal, {a}[7:0]
        bnz
    }

    bsi! {a: u16} => asm {
        ldi mah, {a}[15:8]
        ldi mal, {a}[7:0]
        bsi
    }

    bns! {a: u16} => asm {
        ldi mah, {a}[15:8]
        ldi mal, {a}[7:0]
        bns
    }

    bpa! {a: u16} => asm {
        ldi mah, {a}[15:8]
        ldi mal, {a}[7:0]
        bpa
    }

    bnp! {a: u16} => asm {
        ldi mah, {a}[15:8]
        ldi mal, {a}[7:0]
        bnp
    }

    str! {r: register}, {a: u16} => asm {
        ldi mah, {a}[15:8]
        ldi mal, {a}[7:0]
        str {r}
    }

    ld! {r: register}, {a: u16} => asm {
        ldi mah, {a}[15:8]
        ldi mal, {a}[7:0]
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

    sf => 4`3
    sp => 5`3

    mal => 6`3
    mah => 7`3
}

