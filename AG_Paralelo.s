.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 14, 0
.globl    _fitness
.p2align    2
_fitness:
.cfi_startproc
sub    sp, sp, #32
.cfi_def_cfa_offset 32
str    x0, [sp, #16]
str    x1, [sp, #24]
str    wzr, [sp, #12]
str    wzr, [sp, #8]
b    LBB0_1
LBB0_1:
ldr    w8, [sp, #8]
subs    w8, w8, #4
b.ge    LBB0_4
b    LBB0_2
LBB0_2:
ldrsw    x9, [sp, #8]
add    x8, sp, #16
ldr    w9, [x8, x9, lsl #2]
ldr    w8, [sp, #12]
add    w8, w8, w9
str    w8, [sp, #12]
b    LBB0_3
LBB0_3:
ldr    w8, [sp, #8]
add    w8, w8, #1
str    w8, [sp, #8]
b    LBB0_1
LBB0_4:
ldr    w8, [sp, #12]
subs    w8, w8, #50
b.le    LBB0_6
b    LBB0_5
LBB0_5:
mov    w8, #50
str    w8, [sp, #12]
b    LBB0_6
LBB0_6:
ldr    w0, [sp, #12]
add    sp, sp, #32
ret
.cfi_endproc

.globl    _generate_individual
.p2align    2
_generate_individual:
.cfi_startproc
sub    sp, sp, #48
stp    x29, x30, [sp, #32]
add    x29, sp, #32
.cfi_def_cfa w29, 16
.cfi_offset w30, -8
.cfi_offset w29, -16
str    wzr, [sp, #12]
b    LBB1_1
LBB1_1:
ldr    w8, [sp, #12]
subs    w8, w8, #4
b.ge    LBB1_4
b    LBB1_2
LBB1_2:
bl    _rand
mov    w9, #50
sdiv    w8, w0, w9
mul    w8, w8, w9
subs    w8, w0, w8
ldrsw    x10, [sp, #12]
add    x9, sp, #16
str    w8, [x9, x10, lsl #2]
b    LBB1_3
LBB1_3:
ldr    w8, [sp, #12]
add    w8, w8, #1
str    w8, [sp, #12]
b    LBB1_1
LBB1_4:
ldr    x0, [sp, #16]
ldr    x1, [sp, #24]
ldp    x29, x30, [sp, #32]
add    sp, sp, #48
ret
.cfi_endproc

.globl    _mutate
.p2align    2
_mutate:
.cfi_startproc
sub    sp, sp, #64
stp    x29, x30, [sp, #48]
add    x29, sp, #48
.cfi_def_cfa w29, 16
.cfi_offset w30, -8
.cfi_offset w29, -16
add    x8, sp, #16
str    x8, [sp]
str    x0, [sp, #16]
str    x1, [sp, #24]
bl    _rand
mov    w9, #4
sdiv    w8, w0, w9
mul    w8, w8, w9
subs    w8, w0, w8
str    w8, [sp, #12]
bl    _rand
ldr    x9, [sp]
mov    w10, #50
sdiv    w8, w0, w10
mul    w8, w8, w10
subs    w8, w0, w8
ldrsw    x10, [sp, #12]
str    w8, [x9, x10, lsl #2]
ldr    q0, [sp, #16]
stur    q0, [x29, #-16]
ldur    x0, [x29, #-16]
ldur    x1, [x29, #-8]
ldp    x29, x30, [sp, #48]
add    sp, sp, #64
ret
.cfi_endproc

.globl    _crossover
.p2align    2
_crossover:
.cfi_startproc
sub    sp, sp, #80
stp    x29, x30, [sp, #64]
add    x29, sp, #64
.cfi_def_cfa w29, 16
.cfi_offset w30, -8
.cfi_offset w29, -16
stur    x0, [x29, #-16]
stur    x1, [x29, #-8]
str    x2, [sp, #32]
str    x3, [sp, #40]
str    x4, [sp, #24]
str    x5, [sp, #16]
bl    _rand
mov    w9, #3
sdiv    w8, w0, w9
mul    w8, w8, w9
subs    w8, w0, w8
add    w8, w8, #1
str    w8, [sp, #12]
str    wzr, [sp, #8]
b    LBB3_1
LBB3_1:
ldr    w8, [sp, #8]
ldr    w9, [sp, #12]
subs    w8, w8, w9
b.ge    LBB3_4
b    LBB3_2
LBB3_2:
ldrsw    x9, [sp, #8]
sub    x8, x29, #16
ldr    w8, [x8, x9, lsl #2]
ldr    x9, [sp, #24]
ldrsw    x10, [sp, #8]
str    w8, [x9, x10, lsl #2]
ldrsw    x9, [sp, #8]
add    x8, sp, #32
ldr    w8, [x8, x9, lsl #2]
ldr    x9, [sp, #16]
ldrsw    x10, [sp, #8]
str    w8, [x9, x10, lsl #2]
b    LBB3_3
LBB3_3:
ldr    w8, [sp, #8]
add    w8, w8, #1
str    w8, [sp, #8]
b    LBB3_1
LBB3_4:
ldr    w8, [sp, #12]
str    w8, [sp, #4]
b    LBB3_5
LBB3_5:
ldr    w8, [sp, #4]
subs    w8, w8, #4
b.ge    LBB3_8
b    LBB3_6
LBB3_6:
ldrsw    x9, [sp, #4]
add    x8, sp, #32
ldr    w8, [x8, x9, lsl #2]
ldr    x9, [sp, #24]
ldrsw    x10, [sp, #4]
str    w8, [x9, x10, lsl #2]
ldrsw    x9, [sp, #4]
sub    x8, x29, #16
ldr    w8, [x8, x9, lsl #2]
ldr    x9, [sp, #16]
ldrsw    x10, [sp, #4]
str    w8, [x9, x10, lsl #2]
b    LBB3_7
LBB3_7:
ldr    w8, [sp, #4]
add    w8, w8, #1
str    w8, [sp, #4]
b    LBB3_5
LBB3_8:
ldp    x29, x30, [sp, #64]
add    sp, sp, #80
ret
.cfi_endproc

.globl    _parallel_fitness
.p2align    2
_parallel_fitness:
.cfi_startproc
stp    x28, x27, [sp, #-32]!
stp    x29, x30, [sp, #16]
add    x29, sp, #16
sub    sp, sp, #3072
.cfi_def_cfa w29, 16
.cfi_offset w30, -8
.cfi_offset w29, -16
.cfi_offset w27, -24
.cfi_offset w28, -32
adrp    x8, ___stack_chk_guard@GOTPAGE
ldr    x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
ldr    x8, [x8]
stur    x8, [x29, #-24]
str    wzr, [sp, #260]
mov    x0, #0
bl    _time
bl    _srand
str    wzr, [sp, #256]
b    LBB4_1
LBB4_1:
ldr    w8, [sp, #256]
subs    w8, w8, #50
b.ge    LBB4_4
b    LBB4_2
LBB4_2:
ldrsw    x8, [sp, #256]
str    x8, [sp, #104]
add    x8, sp, #2264
str    x8, [sp, #112]
bl    _generate_individual
ldr    x9, [sp, #104]
ldr    x8, [sp, #112]
str    x0, [sp, #240]
str    x1, [sp, #248]
ldr    q0, [sp, #240]
str    q0, [x8, x9, lsl #4]
b    LBB4_3
LBB4_3:
ldr    w8, [sp, #256]
add    w8, w8, #1
str    w8, [sp, #256]
b    LBB4_1
LBB4_4:
str    wzr, [sp, #236]
b    LBB4_5
LBB4_5:
ldr    w8, [sp, #236]
mov    w9, #19072
movk    w9, #1373, lsl #16
subs    w8, w8, w9
b.ge    LBB4_34
b    LBB4_6
LBB4_6:
; Parallel fitness evaluation using GCD
adrp    x0, _dispatch_get_global_queue@PAGE
add    x0, x0, _dispatch_get_global_queue@PAGEOFF
mov    x1, #0
bl      _dispatch_get_global_queue
str     x0, [sp, #96]

mov     w0, #50
bl      _dispatch_queue_create
str     x0, [sp, #88]

; Create dispatch group
bl      _dispatch_group_create
str     x0, [sp, #80]

str     wzr, [sp, #232]
b       LBB4_7_parallel

LBB4_7_parallel:
ldr     w8, [sp, #232]
subs    w8, w8, #50
b.ge    LBB4_10_parallel

; Dispatch fitness evaluation in parallel
ldr     x0, [sp, #96]     ; queue
ldr     x1, [sp, #80]     ; group
ldr     w2, [sp, #232]    ; index
add     x3, sp, #2264     ; population
add     x4, sp, #2064     ; fitness values

bl      _evaluate_fitness_parallel

ldr    w8, [sp, #232]
add    w8, w8, #1
str    w8, [sp, #232]
b    LBB4_7_parallel

LBB4_10_parallel:
; Wait for all fitness evaluations to complete
ldr     x0, [sp, #80]
mov     x1, #-1
bl      _dispatch_group_wait

str    wzr, [sp, #228]
str    wzr, [sp, #204]
b    LBB4_11
LBB4_11:
ldr    w8, [sp, #204]
subs    w8, w8, #50
b.ge    LBB4_16
b    LBB4_12
LBB4_12:
ldrsw    x9, [sp, #204]
add    x8, sp, #2064
ldr    w8, [x8, x9, lsl #2]
ldr    w9, [sp, #228]
subs    w8, w8, w9
b.le    LBB4_14
b    LBB4_13
LBB4_13:
ldrsw    x9, [sp, #204]
add    x8, sp, #2064
ldr    w8, [x8, x9, lsl #2]
str    w8, [sp, #228]
ldrsw    x9, [sp, #204]
add    x8, sp, #2264
ldr    q0, [x8, x9, lsl #4]
str    q0, [sp, #208]
b    LBB4_14
LBB4_14:
b    LBB4_15
LBB4_15:
ldr    w8, [sp, #204]
add    w8, w8, #1
str    w8, [sp, #204]
b    LBB4_11
LBB4_16:
ldr    w8, [sp, #236]
mov    x14, x8
ldr    w8, [sp, #228]
mov    x13, x8
ldr    w8, [sp, #208]
mov    x12, x8
ldr    w8, [sp, #212]
mov    x11, x8
ldr    w8, [sp, #216]
mov    x10, x8
ldr    w8, [sp, #220]
mov    x9, sp
str    x14, [x9]
str    x13, [x9, #8]
str    x12, [x9, #16]
str    x11, [x9, #24]
str    x10, [x9, #32]
str    x8, [x9, #40]
adrp    x0, l_.str@PAGE
add    x0, x0, l_.str@PAGEOFF
bl    _printf

; Parallel selection and crossover
adrp    x0, _dispatch_get_global_queue@PAGE
add    x0, x0, _dispatch_get_global_queue@PAGEOFF
mov    x1, #0
bl      _dispatch_get_global_queue
str     x0, [sp, #72]

bl      _dispatch_group_create
str     x0, [sp, #64]

str     wzr, [sp, #200]
b       LBB4_17_parallel

LBB4_17_parallel:
ldr    w8, [sp, #200]
subs    w8, w8, #50
b.ge    LBB4_20_parallel

; Dispatch selection in parallel
ldr     x0, [sp, #72]     ; queue
ldr     x1, [sp, #64]     ; group
ldr     w2, [sp, #200]    ; index
add     x3, sp, #2264     ; population
add     x4, sp, #1264     ; selected population

bl      _select_individual_parallel

ldr    w8, [sp, #200]
add    w8, w8, #1
str    w8, [sp, #200]
b    LBB4_17_parallel

LBB4_20_parallel:
; Wait for all selections to complete
ldr     x0, [sp, #64]
mov     x1, #-1
bl      _dispatch_group_wait

; Parallel crossover and mutation
bl      _dispatch_group_create
str     x0, [sp, #56]

str    wzr, [sp, #196]
b    LBB4_21_parallel

LBB4_21_parallel:
ldr    w8, [sp, #196]
subs    w8, w8, #50
b.ge    LBB4_28_parallel

; Dispatch crossover in parallel
ldr     x0, [sp, #72]     ; queue
ldr     x1, [sp, #56]     ; group
ldr     w2, [sp, #196]    ; index
add     x3, sp, #1264     ; selected population
add     x4, sp, #464      ; new population

bl      _crossover_parallel

ldr    w8, [sp, #196]
add    w8, w8, #2
str    w8, [sp, #196]
b    LBB4_21_parallel

LBB4_28_parallel:
; Wait for all crossovers to complete
ldr     x0, [sp, #56]
mov     x1, #-1
bl      _dispatch_group_wait

str    wzr, [sp, #160]
b    LBB4_29
LBB4_29:
ldr    w8, [sp, #160]
subs    w8, w8, #50
b.ge    LBB4_32
b    LBB4_30
LBB4_30:
ldrsw    x9, [sp, #160]
add    x8, sp, #2264
ldrsw    x11, [sp, #160]
add    x10, sp, #464
ldr    q0, [x10, x11, lsl #4]
str    q0, [x8, x9, lsl #4]
b    LBB4_31
LBB4_31:
ldr    w8, [sp, #160]
add    w8, w8, #1
str    w8, [sp, #160]
b    LBB4_29
LBB4_32:
b    LBB4_33
LBB4_33:
ldr    w8, [sp, #236]
add    w8, w8, #1
str    w8, [sp, #236]
b    LBB4_5
LBB4_34:
; Parallel final fitness evaluation
adrp    x0, _dispatch_get_global_queue@PAGE
add    x0, x0, _dispatch_get_global_queue@PAGEOFF
mov    x1, #0
bl      _dispatch_get_global_queue
str     x0, [sp, #48]

bl      _dispatch_group_create
str     x0, [sp, #40]

str     wzr, [sp, #156]
b       LBB4_35_parallel

LBB4_35_parallel:
ldr    w8, [sp, #156]
subs    w8, w8, #50
b.ge    LBB4_38_parallel

; Dispatch final fitness evaluation in parallel
ldr     x0, [sp, #48]     ; queue
ldr     x1, [sp, #40]     ; group
ldr     w2, [sp, #156]    ; index
add     x3, sp, #2264     ; population
add     x4, sp, #264      ; fitness values

bl      _evaluate_fitness_parallel

ldr    w8, [sp, #156]
add    w8, w8, #1
str    w8, [sp, #156]
b    LBB4_35_parallel

LBB4_38_parallel:
; Wait for all fitness evaluations to complete
ldr     x0, [sp, #40]
mov     x1, #-1
bl      _dispatch_group_wait

str    wzr, [sp, #152]
str    wzr, [sp, #124]
b    LBB4_39
LBB4_39:
ldr    w8, [sp, #124]
subs    w8, w8, #50
b.ge    LBB4_44
b    LBB4_40
LBB4_40:
ldrsw    x9, [sp, #124]
add    x8, sp, #264
ldr    w8, [x8, x9, lsl #2]
ldr    w9, [sp, #152]
subs    w8, w8, w9
b.le    LBB4_42
b    LBB4_41
LBB4_41:
ldrsw    x9, [sp, #124]
add    x8, sp, #264
ldr    w8, [x8, x9, lsl #2]
str    w8, [sp, #152]
ldrsw    x9, [sp, #124]
add    x8, sp, #2264
ldr    q0, [x8, x9, lsl #4]
str    q0, [sp, #128]
b    LBB4_42
LBB4_42:
b    LBB4_43
LBB4_43:
ldr    w8, [sp, #124]
add    w8, w8, #1
str    w8, [sp, #124]
b    LBB4_39
LBB4_44:
ldr    w8, [sp, #152]
mov    x13, x8
ldr    w8, [sp, #128]
mov    x12, x8
ldr    w8, [sp, #132]
mov    x11, x8
ldr    w8, [sp, #136]
mov    x10, x8
ldr    w8, [sp, #140]
mov    x9, sp
str    x13, [x9]
str    x12, [x9, #8]
str    x11, [x9, #16]
str    x10, [x9, #24]
str    x8, [x9, #32]
adrp    x0, l_.str.1@PAGE
add    x0, x0, l_.str.1@PAGEOFF
bl    _printf
ldur    x9, [x29, #-24]
adrp    x8, ___stack_chk_guard@GOTPAGE
ldr    x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
ldr    x8, [x8]
subs    x8, x8, x9
b.eq    LBB4_46
b    LBB4_45
LBB4_45:
bl    ___stack_chk_fail
LBB4_46:
mov    w0, #0
add    sp, sp, #3072
ldp    x29, x30, [sp, #16]
ldp    x28, x27, [sp], #32
ret
.cfi_endproc

; Parallel evaluation function
.globl    _evaluate_fitness_parallel
.p2align    2
_evaluate_fitness_parallel:
.cfi_startproc
stp    x29, x30, [sp, #-16]!
mov    x29, sp
.cfi_def_cfa w29, 16
.cfi_offset w30, -8
.cfi_offset w29, -16

; Get individual from population
add    x5, x3, x2, lsl #4
ldr    x0, [x5]
ldr    x1, [x5, #8]

; Calculate fitness
bl     _fitness

; Store fitness value
str    w0, [x4, x2, lsl #2]

ldp    x29, x30, [sp], #16
ret
.cfi_endproc

; Parallel selection function
.globl    _select_individual_parallel
.p2align    2
_select_individual_parallel:
.cfi_startproc
stp    x29, x30, [sp, #-16]!
mov    x29, sp
.cfi_def_cfa w29, 16
.cfi_offset w30, -8
.cfi_offset w29, -16

; Random selection
bl    _rand
mov    w5, #50
sdiv   w6, w0, w5
mul    w6, w6, w5
subs   w5, w0, w6

; Copy selected individual
add    x6, x3, x5, lsl #4
add    x7, x4, x2, lsl #4
ldr    q0, [x6]
str    q0, [x7]

ldp    x29, x30, [sp], #16
ret
.cfi_endproc

; Parallel crossover function
.globl    _crossover_parallel
.p2align    2
_crossover_parallel:
.cfi_startproc
stp    x29, x30, [sp, #-32]!
mov    x29, sp
.cfi_def_cfa w29, 16
.cfi_offset w30, -8
.cfi_offset w29, -16

; Get parents
add    x5, x3, x2, lsl #4
add    x6, x3, x2, lsl #4
add    x6, x6, #16

; Get children
add    x7, x4, x2, lsl #4
add    x8, x4, x2, lsl #4
add    x8, x8, #16

; Perform crossover
ldr    x0, [x5]
ldr    x1, [x5, #8]
ldr    x2, [x6]
ldr    x3, [x6, #8]
mov    x4, x7
mov    x5, x8

bl     _crossover

; Random mutation with 50% probability
bl    _rand
scvtf  d0, w0
mov    x8, #281474972516352
movk   x8, #16863, lsl #48
fmov   d1, x8
fdiv   d0, d0, d1
mov    x8, #26865
movk   x8, #35043, lsl #16
movk   x8, #63669, lsl #32
movk   x8, #16100, lsl #48
fmov   d1, x8
fcmp   d0, d1
b.pl   L_crossover_skip_mutation

; Mutate first child
ldr    x0, [x7]
ldr    x1, [x7, #8]
bl     _mutate
str    x0, [x7]
str    x1, [x7, #8]

L_crossover_skip_mutation:
; Random mutation for second child
bl    _rand
scvtf  d0, w0
mov    x8, #281474972516352
movk   x8, #16863, lsl #48
fmov   d1, x8
fdiv   d0, d0, d1
mov    x8, #26865
movk   x8, #35043, lsl #16
movk   x8, #63669, lsl #32
movk   x8, #16100, lsl #48
fmov   d1, x8
fcmp   d0, d1
b.pl   L_crossover_end

; Mutate second child
ldr    x0, [x8]
ldr    x1, [x8, #8]
bl     _mutate
str    x0, [x8]
str    x1, [x8, #8]

L_crossover_end:
ldp    x29, x30, [sp], #32
ret
.cfi_endproc

.section    __TEXT,__cstring,cstring_literals
l_.str:
.asciz    "Generation %d: Best fitness = %d, Best individual = {%d, %d, %d, %d}\n"

l_.str.1:
.asciz    "Final Best Fitness = %d, Best Individual = {%d, %d, %d, %d}\n"

.subsections_via_symbols
