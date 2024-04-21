; This program multiplies two 8-bit numbers in r0 and r1 and stores the result in r2 and r3 (r2: most significant byte, r3: least significant byte)

; Clear accumulator
acz

; Load first number (multiplicand) into accumulator
rmov r0

; Loop counter for multiplication (8 bits, so 8 iterations)
imr r4, 8

loop:
  ; Check if carry flag is set from previous addition (indicates overflow during multiplication)
  bca overflow ; Branch to overflow handling if carry flag is set

  ; Initialize partial product register (result accumulator for this iteration)
  acz

  ; Inner loop to perform addition based on bits in second number (multiplier)
  imr r5, 0 ; Loop counter for inner loop (set to 0 initially)

inner_loop:
  ; Check if least significant bit of multiplier (in r1) is set
  bsi bit_set ; Branch to bit_set if sign bit (LSB) is set

  ; Add multiplicand (in accumulator) to partial product if bit is not set
  add r0

bit_set:
  ; Check if carry flag is set from addition
  bca carry_add ; Branch to carry_add if carry flag is set from addition

  ; Shift partial product left by 1 bit (multiply by 2)
