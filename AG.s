	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 14, 0
	.globl	_fitness                        ; -- Begin function fitness
	.p2align	2
_fitness:                               ; @fitness
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #16]
	str	x1, [sp, #24]
	str	wzr, [sp, #12]
	str	wzr, [sp, #8]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #8]
	subs	w8, w8, #4
	b.ge	LBB0_4
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldrsw	x9, [sp, #8]
	add	x8, sp, #16
	ldr	w9, [x8, x9, lsl #2]
	ldr	w8, [sp, #12]
	add	w8, w8, w9
	str	w8, [sp, #12]
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	b	LBB0_1
LBB0_4:
	ldr	w8, [sp, #12]
	subs	w8, w8, #50
	b.le	LBB0_6
	b	LBB0_5
LBB0_5:
	mov	w8, #50                         ; =0x32
	str	w8, [sp, #12]
	b	LBB0_6
LBB0_6:
	ldr	w0, [sp, #12]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_generate_individual            ; -- Begin function generate_individual
	.p2align	2
_generate_individual:                   ; @generate_individual
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	wzr, [sp, #12]
	b	LBB1_1
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #12]
	subs	w8, w8, #4
	b.ge	LBB1_4
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	bl	_rand
	mov	w9, #50                         ; =0x32
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	ldrsw	x10, [sp, #12]
	add	x9, sp, #16
	str	w8, [x9, x10, lsl #2]
	b	LBB1_3
LBB1_3:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB1_1
LBB1_4:
	ldr	x0, [sp, #16]
	ldr	x1, [sp, #24]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_mutate                         ; -- Begin function mutate
	.p2align	2
_mutate:                                ; @mutate
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	add	x8, sp, #16
	str	x8, [sp]                        ; 8-byte Folded Spill
	str	x0, [sp, #16]
	str	x1, [sp, #24]
	bl	_rand
	mov	w9, #4                          ; =0x4
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	str	w8, [sp, #12]
	bl	_rand
	ldr	x9, [sp]                        ; 8-byte Folded Reload
	mov	w10, #50                        ; =0x32
	sdiv	w8, w0, w10
	mul	w8, w8, w10
	subs	w8, w0, w8
	ldrsw	x10, [sp, #12]
	str	w8, [x9, x10, lsl #2]
	ldr	q0, [sp, #16]
	stur	q0, [x29, #-16]
	ldur	x0, [x29, #-16]
	ldur	x1, [x29, #-8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_crossover                      ; -- Begin function crossover
	.p2align	2
_crossover:                             ; @crossover
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	stur	x1, [x29, #-8]
	str	x2, [sp, #32]
	str	x3, [sp, #40]
	str	x4, [sp, #24]
	str	x5, [sp, #16]
	bl	_rand
	mov	w9, #3                          ; =0x3
	sdiv	w8, w0, w9
	mul	w8, w8, w9
	subs	w8, w0, w8
	add	w8, w8, #1
	str	w8, [sp, #12]
	str	wzr, [sp, #8]
	b	LBB3_1
LBB3_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #8]
	ldr	w9, [sp, #12]
	subs	w8, w8, w9
	b.ge	LBB3_4
	b	LBB3_2
LBB3_2:                                 ;   in Loop: Header=BB3_1 Depth=1
	ldrsw	x9, [sp, #8]
	sub	x8, x29, #16
	ldr	w8, [x8, x9, lsl #2]
	ldr	x9, [sp, #24]
	ldrsw	x10, [sp, #8]
	str	w8, [x9, x10, lsl #2]
	ldrsw	x9, [sp, #8]
	add	x8, sp, #32
	ldr	w8, [x8, x9, lsl #2]
	ldr	x9, [sp, #16]
	ldrsw	x10, [sp, #8]
	str	w8, [x9, x10, lsl #2]
	b	LBB3_3
LBB3_3:                                 ;   in Loop: Header=BB3_1 Depth=1
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	b	LBB3_1
LBB3_4:
	ldr	w8, [sp, #12]
	str	w8, [sp, #4]
	b	LBB3_5
LBB3_5:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #4]
	subs	w8, w8, #4
	b.ge	LBB3_8
	b	LBB3_6
LBB3_6:                                 ;   in Loop: Header=BB3_5 Depth=1
	ldrsw	x9, [sp, #4]
	add	x8, sp, #32
	ldr	w8, [x8, x9, lsl #2]
	ldr	x9, [sp, #24]
	ldrsw	x10, [sp, #4]
	str	w8, [x9, x10, lsl #2]
	ldrsw	x9, [sp, #4]
	sub	x8, x29, #16
	ldr	w8, [x8, x9, lsl #2]
	ldr	x9, [sp, #16]
	ldrsw	x10, [sp, #4]
	str	w8, [x9, x10, lsl #2]
	b	LBB3_7
LBB3_7:                                 ;   in Loop: Header=BB3_5 Depth=1
	ldr	w8, [sp, #4]
	add	w8, w8, #1
	str	w8, [sp, #4]
	b	LBB3_5
LBB3_8:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	sub	sp, sp, #3072
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
	str	wzr, [sp, #260]
	mov	x0, #0                          ; =0x0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	str	wzr, [sp, #256]
	b	LBB4_1
LBB4_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #256]
	subs	w8, w8, #50
	b.ge	LBB4_4
	b	LBB4_2
LBB4_2:                                 ;   in Loop: Header=BB4_1 Depth=1
	ldrsw	x8, [sp, #256]
	str	x8, [sp, #104]                  ; 8-byte Folded Spill
	add	x8, sp, #2264
	str	x8, [sp, #112]                  ; 8-byte Folded Spill
	bl	_generate_individual
	ldr	x9, [sp, #104]                  ; 8-byte Folded Reload
	ldr	x8, [sp, #112]                  ; 8-byte Folded Reload
	str	x0, [sp, #240]
	str	x1, [sp, #248]
	ldr	q0, [sp, #240]
	str	q0, [x8, x9, lsl #4]
	b	LBB4_3
LBB4_3:                                 ;   in Loop: Header=BB4_1 Depth=1
	ldr	w8, [sp, #256]
	add	w8, w8, #1
	str	w8, [sp, #256]
	b	LBB4_1
LBB4_4:
	str	wzr, [sp, #236]
	b	LBB4_5
LBB4_5:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_7 Depth 2
                                        ;     Child Loop BB4_11 Depth 2
                                        ;     Child Loop BB4_17 Depth 2
                                        ;     Child Loop BB4_21 Depth 2
                                        ;     Child Loop BB4_29 Depth 2
	ldr	w8, [sp, #236]
	mov	w9, #19072                      ; =0x4a80
	movk	w9, #1373, lsl #16
	subs	w8, w8, w9
	b.ge	LBB4_34
	b	LBB4_6
LBB4_6:                                 ;   in Loop: Header=BB4_5 Depth=1
	str	wzr, [sp, #232]
	b	LBB4_7
LBB4_7:                                 ;   Parent Loop BB4_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #232]
	subs	w8, w8, #50
	b.ge	LBB4_10
	b	LBB4_8
LBB4_8:                                 ;   in Loop: Header=BB4_7 Depth=2
	ldrsw	x9, [sp, #232]
	add	x8, sp, #2264
	add	x8, x8, x9, lsl #4
	ldr	x0, [x8]
	ldr	x1, [x8, #8]
	bl	_fitness
	ldrsw	x9, [sp, #232]
	add	x8, sp, #2064
	str	w0, [x8, x9, lsl #2]
	b	LBB4_9
LBB4_9:                                 ;   in Loop: Header=BB4_7 Depth=2
	ldr	w8, [sp, #232]
	add	w8, w8, #1
	str	w8, [sp, #232]
	b	LBB4_7
LBB4_10:                                ;   in Loop: Header=BB4_5 Depth=1
	str	wzr, [sp, #228]
	str	wzr, [sp, #204]
	b	LBB4_11
LBB4_11:                                ;   Parent Loop BB4_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #204]
	subs	w8, w8, #50
	b.ge	LBB4_16
	b	LBB4_12
LBB4_12:                                ;   in Loop: Header=BB4_11 Depth=2
	ldrsw	x9, [sp, #204]
	add	x8, sp, #2064
	ldr	w8, [x8, x9, lsl #2]
	ldr	w9, [sp, #228]
	subs	w8, w8, w9
	b.le	LBB4_14
	b	LBB4_13
LBB4_13:                                ;   in Loop: Header=BB4_11 Depth=2
	ldrsw	x9, [sp, #204]
	add	x8, sp, #2064
	ldr	w8, [x8, x9, lsl #2]
	str	w8, [sp, #228]
	ldrsw	x9, [sp, #204]
	add	x8, sp, #2264
	ldr	q0, [x8, x9, lsl #4]
	str	q0, [sp, #208]
	b	LBB4_14
LBB4_14:                                ;   in Loop: Header=BB4_11 Depth=2
	b	LBB4_15
LBB4_15:                                ;   in Loop: Header=BB4_11 Depth=2
	ldr	w8, [sp, #204]
	add	w8, w8, #1
	str	w8, [sp, #204]
	b	LBB4_11
LBB4_16:                                ;   in Loop: Header=BB4_5 Depth=1
	ldr	w8, [sp, #236]
	mov	x14, x8
	ldr	w8, [sp, #228]
	mov	x13, x8
	ldr	w8, [sp, #208]
	mov	x12, x8
	ldr	w8, [sp, #212]
	mov	x11, x8
	ldr	w8, [sp, #216]
	mov	x10, x8
	ldr	w8, [sp, #220]
                                        ; kill: def $x8 killed $w8
	mov	x9, sp
	str	x14, [x9]
	str	x13, [x9, #8]
	str	x12, [x9, #16]
	str	x11, [x9, #24]
	str	x10, [x9, #32]
	str	x8, [x9, #40]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	str	wzr, [sp, #200]
	b	LBB4_17
LBB4_17:                                ;   Parent Loop BB4_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #200]
	subs	w8, w8, #50
	b.ge	LBB4_20
	b	LBB4_18
LBB4_18:                                ;   in Loop: Header=BB4_17 Depth=2
	ldrsw	x8, [sp, #200]
	str	x8, [sp, #88]                   ; 8-byte Folded Spill
	add	x8, sp, #1264
	str	x8, [sp, #96]                   ; 8-byte Folded Spill
	bl	_rand
	ldr	x9, [sp, #88]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #96]                   ; 8-byte Folded Reload
	mov	w11, #50                        ; =0x32
	sdiv	w10, w0, w11
	mul	w10, w10, w11
	subs	w11, w0, w10
	add	x10, sp, #2264
	ldr	q0, [x10, w11, sxtw #4]
	str	q0, [x8, x9, lsl #4]
	b	LBB4_19
LBB4_19:                                ;   in Loop: Header=BB4_17 Depth=2
	ldr	w8, [sp, #200]
	add	w8, w8, #1
	str	w8, [sp, #200]
	b	LBB4_17
LBB4_20:                                ;   in Loop: Header=BB4_5 Depth=1
	str	wzr, [sp, #196]
	b	LBB4_21
LBB4_21:                                ;   Parent Loop BB4_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #196]
	subs	w8, w8, #50
	b.ge	LBB4_28
	b	LBB4_22
LBB4_22:                                ;   in Loop: Header=BB4_21 Depth=2
	ldrsw	x10, [sp, #196]
	add	x8, sp, #1264
	mov	x9, x8
	add	x9, x9, x10, lsl #4
	ldr	w10, [sp, #196]
	add	w10, w10, #1
	add	x8, x8, w10, sxtw #4
	ldrsw	x12, [sp, #196]
	add	x10, sp, #464
	mov	x11, x10
	add	x4, x11, x12, lsl #4
	ldr	w11, [sp, #196]
	add	w11, w11, #1
	add	x5, x10, w11, sxtw #4
	ldr	x0, [x9]
	ldr	x1, [x9, #8]
	ldr	x2, [x8]
	ldr	x3, [x8, #8]
	bl	_crossover
	bl	_rand
	scvtf	d0, w0
	mov	x8, #281474972516352            ; =0xffffffc00000
	movk	x8, #16863, lsl #48
	fmov	d1, x8
	fdiv	d0, d0, d1
	mov	x8, #26865                      ; =0x68f1
	movk	x8, #35043, lsl #16
	movk	x8, #63669, lsl #32
	movk	x8, #16100, lsl #48
	fmov	d1, x8
	fcmp	d0, d1
	b.pl	LBB4_24
	b	LBB4_23
LBB4_23:                                ;   in Loop: Header=BB4_21 Depth=2
	ldrsw	x8, [sp, #196]
	str	x8, [sp, #72]                   ; 8-byte Folded Spill
	add	x8, sp, #464
	str	x8, [sp, #80]                   ; 8-byte Folded Spill
	ldrsw	x9, [sp, #196]
	add	x8, x8, x9, lsl #4
	ldr	x0, [x8]
	ldr	x1, [x8, #8]
	bl	_mutate
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	ldr	x8, [sp, #80]                   ; 8-byte Folded Reload
	stur	x0, [sp, #180]
	stur	x1, [sp, #188]
	ldur	q0, [sp, #180]
	str	q0, [x8, x9, lsl #4]
	b	LBB4_24
LBB4_24:                                ;   in Loop: Header=BB4_21 Depth=2
	bl	_rand
	scvtf	d0, w0
	mov	x8, #281474972516352            ; =0xffffffc00000
	movk	x8, #16863, lsl #48
	fmov	d1, x8
	fdiv	d0, d0, d1
	mov	x8, #26865                      ; =0x68f1
	movk	x8, #35043, lsl #16
	movk	x8, #63669, lsl #32
	movk	x8, #16100, lsl #48
	fmov	d1, x8
	fcmp	d0, d1
	b.pl	LBB4_26
	b	LBB4_25
LBB4_25:                                ;   in Loop: Header=BB4_21 Depth=2
	ldr	w8, [sp, #196]
	add	w8, w8, #1
	str	w8, [sp, #60]                   ; 4-byte Folded Spill
	add	x8, sp, #464
	str	x8, [sp, #64]                   ; 8-byte Folded Spill
	ldr	w9, [sp, #196]
	add	w9, w9, #1
	add	x8, x8, w9, sxtw #4
	ldr	x0, [x8]
	ldr	x1, [x8, #8]
	bl	_mutate
	ldr	w9, [sp, #60]                   ; 4-byte Folded Reload
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	stur	x0, [sp, #164]
	stur	x1, [sp, #172]
	ldur	q0, [sp, #164]
	str	q0, [x8, w9, sxtw #4]
	b	LBB4_26
LBB4_26:                                ;   in Loop: Header=BB4_21 Depth=2
	b	LBB4_27
LBB4_27:                                ;   in Loop: Header=BB4_21 Depth=2
	ldr	w8, [sp, #196]
	add	w8, w8, #2
	str	w8, [sp, #196]
	b	LBB4_21
LBB4_28:                                ;   in Loop: Header=BB4_5 Depth=1
	str	wzr, [sp, #160]
	b	LBB4_29
LBB4_29:                                ;   Parent Loop BB4_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #160]
	subs	w8, w8, #50
	b.ge	LBB4_32
	b	LBB4_30
LBB4_30:                                ;   in Loop: Header=BB4_29 Depth=2
	ldrsw	x9, [sp, #160]
	add	x8, sp, #2264
	ldrsw	x11, [sp, #160]
	add	x10, sp, #464
	ldr	q0, [x10, x11, lsl #4]
	str	q0, [x8, x9, lsl #4]
	b	LBB4_31
LBB4_31:                                ;   in Loop: Header=BB4_29 Depth=2
	ldr	w8, [sp, #160]
	add	w8, w8, #1
	str	w8, [sp, #160]
	b	LBB4_29
LBB4_32:                                ;   in Loop: Header=BB4_5 Depth=1
	b	LBB4_33
LBB4_33:                                ;   in Loop: Header=BB4_5 Depth=1
	ldr	w8, [sp, #236]
	add	w8, w8, #1
	str	w8, [sp, #236]
	b	LBB4_5
LBB4_34:
	str	wzr, [sp, #156]
	b	LBB4_35
LBB4_35:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #156]
	subs	w8, w8, #50
	b.ge	LBB4_38
	b	LBB4_36
LBB4_36:                                ;   in Loop: Header=BB4_35 Depth=1
	ldrsw	x9, [sp, #156]
	add	x8, sp, #2264
	add	x8, x8, x9, lsl #4
	ldr	x0, [x8]
	ldr	x1, [x8, #8]
	bl	_fitness
	ldrsw	x9, [sp, #156]
	add	x8, sp, #264
	str	w0, [x8, x9, lsl #2]
	b	LBB4_37
LBB4_37:                                ;   in Loop: Header=BB4_35 Depth=1
	ldr	w8, [sp, #156]
	add	w8, w8, #1
	str	w8, [sp, #156]
	b	LBB4_35
LBB4_38:
	str	wzr, [sp, #152]
	str	wzr, [sp, #124]
	b	LBB4_39
LBB4_39:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #124]
	subs	w8, w8, #50
	b.ge	LBB4_44
	b	LBB4_40
LBB4_40:                                ;   in Loop: Header=BB4_39 Depth=1
	ldrsw	x9, [sp, #124]
	add	x8, sp, #264
	ldr	w8, [x8, x9, lsl #2]
	ldr	w9, [sp, #152]
	subs	w8, w8, w9
	b.le	LBB4_42
	b	LBB4_41
LBB4_41:                                ;   in Loop: Header=BB4_39 Depth=1
	ldrsw	x9, [sp, #124]
	add	x8, sp, #264
	ldr	w8, [x8, x9, lsl #2]
	str	w8, [sp, #152]
	ldrsw	x9, [sp, #124]
	add	x8, sp, #2264
	ldr	q0, [x8, x9, lsl #4]
	str	q0, [sp, #128]
	b	LBB4_42
LBB4_42:                                ;   in Loop: Header=BB4_39 Depth=1
	b	LBB4_43
LBB4_43:                                ;   in Loop: Header=BB4_39 Depth=1
	ldr	w8, [sp, #124]
	add	w8, w8, #1
	str	w8, [sp, #124]
	b	LBB4_39
LBB4_44:
	ldr	w8, [sp, #152]
	mov	x13, x8
	ldr	w8, [sp, #128]
	mov	x12, x8
	ldr	w8, [sp, #132]
	mov	x11, x8
	ldr	w8, [sp, #136]
	mov	x10, x8
	ldr	w8, [sp, #140]
                                        ; kill: def $x8 killed $w8
	mov	x9, sp
	str	x13, [x9]
	str	x12, [x9, #8]
	str	x11, [x9, #16]
	str	x10, [x9, #24]
	str	x8, [x9, #32]
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	ldur	x9, [x29, #-24]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	b.eq	LBB4_46
	b	LBB4_45
LBB4_45:
	bl	___stack_chk_fail
LBB4_46:
	mov	w0, #0                          ; =0x0
	add	sp, sp, #3072
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Generation %d: Best fitness = %d, Best individual = {%d, %d, %d, %d}\n"

l_.str.1:                               ; @.str.1
	.asciz	"Final Best Fitness = %d, Best Individual = {%d, %d, %d, %d}\n"

.subsections_via_symbols
