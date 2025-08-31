; To see how LLVM-MOS encodes this file, run:
;
;    llvm-mc -mcpu=mos45gs02 --show-encoding memory_asm.s
;
.global lpeek
.section .text.lpeek,"ax",@progbits
lpeek:
        ; copy 32-bit input address (a, x, rc2-rc3) to rc4-rc7
        sta __rc4
        stx __rc5
        lda __rc2
        sta __rc6
        lda __rc3
        sta __rc7
        ldz #0
        lda [__rc4], z
        rts
