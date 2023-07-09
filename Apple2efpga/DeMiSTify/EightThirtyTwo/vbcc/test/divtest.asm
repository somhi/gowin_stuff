	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_sdiv
_sdiv:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r4

						//divtest.c, line 13
						//Call division routine
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	12
	ldidx	r6
	mr	r2
	.lipcrel	_div_s32bys32
	add	r7
	mt	r0
	mr	r4
						// (save result) // isreg

						//divtest.c, line 13
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	16
	ldidx	r6
	cmp	r4

						//divtest.c, line 13
	cond	NEQ
						//conditional branch reversed
						//pcreltotemp
	.lipcrel	l4
		add	r7

						//divtest.c, line 14
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l5,0
						// static pe is varadr
	stdec	r6

						//divtest.c, line 14
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6

						//divtest.c, line 16
						//pcreltotemp
	.lipcrel	l6
	add	r7
l4: # 

						//divtest.c, line 16
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l7,0
						// static pe is varadr
	stdec	r6

						//divtest.c, line 16
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
l6: # 

						//divtest.c, line 17
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	16
	ldidx	r6
	stdec	r6

						//divtest.c, line 17
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	mt	r4
	stdec	r6

						//divtest.c, line 17
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	20
	ldidx	r6
	stdec	r6

						//divtest.c, line 17
						// (a/p push)
						// a: pushed 12, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6

						//divtest.c, line 17
						// (a/p push)
						// a: pushed 16, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l8,0
						// static pe is varadr
	stdec	r6

						//divtest.c, line 17
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Deferred popping of 20 bytes (20 in total)
						// freereg r3
						// freereg r4
	.liconst	-20
	sub	r6
	.lipcrel	.functiontail, 2
	add	r7

.functiontail:
	ldinc	r6
	mr	r5

	ldinc	r6
	mr	r4

	ldinc	r6
	mr	r3

	ldinc	r6
	mr	r7

	.section	.rodata.1
l5:
	.byte	27
	.byte	91
	.byte	51
	.byte	50
	.byte	109
	.byte	80
	.byte	97
	.byte	115
	.byte	115
	.byte	101
	.byte	100
	.byte	58
	.byte	27
	.byte	91
	.byte	48
	.byte	109
	.byte	32
	.byte	0
	.section	.rodata.2
l7:
	.byte	27
	.byte	91
	.byte	51
	.byte	49
	.byte	109
	.byte	70
	.byte	97
	.byte	105
	.byte	108
	.byte	101
	.byte	100
	.byte	58
	.byte	27
	.byte	91
	.byte	48
	.byte	109
	.byte	32
	.byte	0
	.section	.rodata.3
l8:
	.byte	37
	.byte	100
	.byte	32
	.byte	47
	.byte	32
	.byte	37
	.byte	100
	.byte	58
	.byte	32
	.byte	37
	.byte	100
	.byte	44
	.byte	32
	.byte	101
	.byte	120
	.byte	112
	.byte	101
	.byte	99
	.byte	116
	.byte	101
	.byte	100
	.byte	58
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.4
	.global	_smod
_smod:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 3
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r4

						//divtest.c, line 22
						//Call division routine
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	12
	ldidx	r6
	mr	r2
	.lipcrel	_div_s32bys32
	add	r7
	mt	r1
	mr	r4
						// (save result) // isreg

						//divtest.c, line 22
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	16
	ldidx	r6
	cmp	r4

						//divtest.c, line 22
	cond	NEQ
						//conditional branch reversed
						//pcreltotemp
	.lipcrel	l12
		add	r7

						//divtest.c, line 23
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l13,0
						// static pe is varadr
	stdec	r6

						//divtest.c, line 23
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6

						//divtest.c, line 25
						//pcreltotemp
	.lipcrel	l14
	add	r7
l12: # 

						//divtest.c, line 25
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l15,0
						// static pe is varadr
	stdec	r6

						//divtest.c, line 25
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
l14: # 

						//divtest.c, line 26
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// var, auto|reg
	.liconst	16
	ldidx	r6
	stdec	r6

						//divtest.c, line 26
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	mt	r4
	stdec	r6

						//divtest.c, line 26
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 2 type 3
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	20
	ldidx	r6
	stdec	r6

						//divtest.c, line 26
						// (a/p push)
						// a: pushed 12, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6

						//divtest.c, line 26
						// (a/p push)
						// a: pushed 16, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l16,0
						// static pe is varadr
	stdec	r6

						//divtest.c, line 26
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Deferred popping of 20 bytes (20 in total)
						// freereg r3
						// freereg r4
	.liconst	-20
	sub	r6
	.lipcrel	.functiontail, 2
	add	r7

	.section	.rodata.5
l13:
	.byte	27
	.byte	91
	.byte	51
	.byte	50
	.byte	109
	.byte	80
	.byte	97
	.byte	115
	.byte	115
	.byte	101
	.byte	100
	.byte	58
	.byte	27
	.byte	91
	.byte	48
	.byte	109
	.byte	32
	.byte	0
	.section	.rodata.6
l15:
	.byte	27
	.byte	91
	.byte	51
	.byte	49
	.byte	109
	.byte	70
	.byte	97
	.byte	105
	.byte	108
	.byte	101
	.byte	100
	.byte	58
	.byte	27
	.byte	91
	.byte	48
	.byte	109
	.byte	32
	.byte	0
	.section	.rodata.7
l16:
	.byte	37
	.byte	100
	.byte	32
	.byte	37
	.byte	37
	.byte	32
	.byte	37
	.byte	100
	.byte	58
	.byte	32
	.byte	37
	.byte	100
	.byte	44
	.byte	32
	.byte	101
	.byte	120
	.byte	112
	.byte	101
	.byte	99
	.byte	116
	.byte	101
	.byte	100
	.byte	58
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.8
	.global	_udiv
_udiv:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 103
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r4

						//divtest.c, line 31
						//Call division routine
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	12
	ldidx	r6
	mr	r2
	.lipcrel	_div_u32byu32
	add	r7
	mt	r0
	mr	r4
						// (save result) // isreg

						//divtest.c, line 31
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 2 type 103
						// var, auto|reg
	.liconst	16
	ldidx	r6
	cmp	r4

						//divtest.c, line 31
	cond	NEQ
						//conditional branch reversed
						//pcreltotemp
	.lipcrel	l20
		add	r7

						//divtest.c, line 32
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l21,0
						// static pe is varadr
	stdec	r6

						//divtest.c, line 32
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6

						//divtest.c, line 34
						//pcreltotemp
	.lipcrel	l22
	add	r7
l20: # 

						//divtest.c, line 34
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l23,0
						// static pe is varadr
	stdec	r6

						//divtest.c, line 34
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
l22: # 

						//divtest.c, line 35
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 103
						// var, auto|reg
	.liconst	16
	ldidx	r6
	stdec	r6

						//divtest.c, line 35
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	mt	r4
	stdec	r6

						//divtest.c, line 35
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	20
	ldidx	r6
	stdec	r6

						//divtest.c, line 35
						// (a/p push)
						// a: pushed 12, regnames[sp] r6
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6

						//divtest.c, line 35
						// (a/p push)
						// a: pushed 16, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l24,0
						// static pe is varadr
	stdec	r6

						//divtest.c, line 35
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Deferred popping of 20 bytes (20 in total)
						// freereg r3
						// freereg r4
	.liconst	-20
	sub	r6
	.lipcrel	.functiontail, 2
	add	r7

	.section	.rodata.9
l21:
	.byte	27
	.byte	91
	.byte	51
	.byte	50
	.byte	109
	.byte	80
	.byte	97
	.byte	115
	.byte	115
	.byte	101
	.byte	100
	.byte	58
	.byte	27
	.byte	91
	.byte	48
	.byte	109
	.byte	32
	.byte	0
	.section	.rodata.a
l23:
	.byte	27
	.byte	91
	.byte	51
	.byte	49
	.byte	109
	.byte	70
	.byte	97
	.byte	105
	.byte	108
	.byte	101
	.byte	100
	.byte	58
	.byte	27
	.byte	91
	.byte	48
	.byte	109
	.byte	32
	.byte	0
	.section	.rodata.b
l24:
	.byte	37
	.byte	117
	.byte	32
	.byte	47
	.byte	32
	.byte	37
	.byte	117
	.byte	58
	.byte	32
	.byte	37
	.byte	117
	.byte	44
	.byte	32
	.byte	101
	.byte	120
	.byte	112
	.byte	101
	.byte	99
	.byte	116
	.byte	101
	.byte	100
	.byte	58
	.byte	32
	.byte	37
	.byte	117
	.byte	10
	.byte	0
	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.c
	.global	_umod
_umod:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 103
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r4

						//divtest.c, line 40
						//Call division routine
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	12
	ldidx	r6
	mr	r2
	.lipcrel	_div_u32byu32
	add	r7
	mt	r1
	mr	r4
						// (save result) // isreg

						//divtest.c, line 40
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 2 type 103
						// var, auto|reg
	.liconst	16
	ldidx	r6
	cmp	r4

						//divtest.c, line 40
	cond	NEQ
						//conditional branch reversed
						//pcreltotemp
	.lipcrel	l28
		add	r7

						//divtest.c, line 41
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// static
	.liabs	l29,0
						// static pe is varadr
	stdec	r6

						//divtest.c, line 41
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6

						//divtest.c, line 43
						//pcreltotemp
	.lipcrel	l30
	add	r7
l28: # 

						//divtest.c, line 43
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l31,0
						// static pe is varadr
	stdec	r6

						//divtest.c, line 43
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
l30: # 

						//divtest.c, line 44
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 2 type 103
						// var, auto|reg
	.liconst	16
	ldidx	r6
	stdec	r6

						//divtest.c, line 44
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	mt	r4
	stdec	r6

						//divtest.c, line 44
						// (a/p push)
						// a: pushed 8, regnames[sp] r6
						// (obj to tmp) flags 2 type 103
						// matchobj comparing flags 2 with 66
						// var, auto|reg
						// matchobj comparing flags 1 with 66
	.liconst	20
	ldidx	r6
	stdec	r6

						//divtest.c, line 44
						// (a/p push)
						// a: pushed 12, regnames[sp] r6
						// (obj to tmp) flags 42 type 103
						// matchobj comparing flags 66 with 2
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6

						//divtest.c, line 44
						// (a/p push)
						// a: pushed 16, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l32,0
						// static pe is varadr
	stdec	r6

						//divtest.c, line 44
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Deferred popping of 20 bytes (20 in total)
						// freereg r3
						// freereg r4
	.liconst	-20
	sub	r6
	.lipcrel	.functiontail, 2
	add	r7

	.section	.rodata.d
l29:
	.byte	27
	.byte	91
	.byte	51
	.byte	50
	.byte	109
	.byte	80
	.byte	97
	.byte	115
	.byte	115
	.byte	101
	.byte	100
	.byte	58
	.byte	27
	.byte	91
	.byte	48
	.byte	109
	.byte	32
	.byte	0
	.section	.rodata.e
l31:
	.byte	27
	.byte	91
	.byte	51
	.byte	49
	.byte	109
	.byte	70
	.byte	97
	.byte	105
	.byte	108
	.byte	101
	.byte	100
	.byte	58
	.byte	27
	.byte	91
	.byte	48
	.byte	109
	.byte	32
	.byte	0
	.section	.rodata.f
l32:
	.byte	37
	.byte	117
	.byte	32
	.byte	37
	.byte	37
	.byte	32
	.byte	37
	.byte	117
	.byte	58
	.byte	32
	.byte	37
	.byte	117
	.byte	44
	.byte	32
	.byte	101
	.byte	120
	.byte	112
	.byte	101
	.byte	99
	.byte	116
	.byte	101
	.byte	100
	.byte	58
	.byte	32
	.byte	37
	.byte	117
	.byte	10
	.byte	0
	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: yes
		//r5: yes
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.10
	.global	_main
_main:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	stmpdec	r5
	exg	r6
						// allocreg r5
						// (a/p assign)
						// (prepobj r0)
 						// reg r5 - no need to prep
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	-843409290
						// (save temp)isreg
	mr	r5
						//save_temp done
						// allocreg r4
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	305419896
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r3
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	-2023406815
						// (save temp)isreg
	mr	r3
						//save_temp done

						//divtest.c, line 49
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	-65540
	stdec	r6

						//divtest.c, line 49
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	-4660
	stdec	r6
						// allocreg r1

						//divtest.c, line 49
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 240 type 3
						// matchobj comparing flags 576 with 1
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//divtest.c, line 49
						//call
						//pcreltotemp
	.lipcrel	_sdiv
	add	r7
						// Deferred popping of 8 bytes (8 in total)
						// freereg r1

						//divtest.c, line 50
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	3496
	stdec	r6

						//divtest.c, line 50
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	-4660
	stdec	r6
						// allocreg r1

						//divtest.c, line 50
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 240 type 3
						// matchobj comparing flags 576 with 1
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//divtest.c, line 50
						//call
						//pcreltotemp
	.lipcrel	_smod
	add	r7
						// Deferred popping of 8 bytes (16 in total)
						// freereg r1

						//divtest.c, line 51
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	-130
	stdec	r6

						//divtest.c, line 51
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	33
	stdec	r6
						// allocreg r1

						//divtest.c, line 51
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	-4321
						// (save temp)isreg
	mr	r1
						//save_temp done

						//divtest.c, line 51
						//call
						//pcreltotemp
	.lipcrel	_sdiv
	add	r7
						// Deferred popping of 8 bytes (24 in total)
						// freereg r1

						//divtest.c, line 52
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	-31
	stdec	r6

						//divtest.c, line 52
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	33
	stdec	r6
						// allocreg r1

						//divtest.c, line 52
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	-4321
						// (save temp)isreg
	mr	r1
						//save_temp done

						//divtest.c, line 52
						//call
						//pcreltotemp
	.lipcrel	_smod
	add	r7
						// Deferred popping of 8 bytes (32 in total)
						// freereg r1

						//divtest.c, line 53
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	130150393
	stdec	r6

						//divtest.c, line 53
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	33
	stdec	r6
						// allocreg r1

						//divtest.c, line 53
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	-4321
						// (save temp)isreg
	mr	r1
						//save_temp done

						//divtest.c, line 53
						//call
						//pcreltotemp
	.lipcrel	_udiv
	add	r7
						// Deferred popping of 8 bytes (40 in total)
						// freereg r1

						//divtest.c, line 54
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	6
	stdec	r6

						//divtest.c, line 54
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	33
	stdec	r6
						// allocreg r1

						//divtest.c, line 54
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	-4321
						// (save temp)isreg
	mr	r1
						//save_temp done

						//divtest.c, line 54
						//call
						//pcreltotemp
	.lipcrel	_umod
	add	r7
						// Deferred popping of 8 bytes (48 in total)
						// freereg r1

						//divtest.c, line 55
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	46289
	stdec	r6

						//divtest.c, line 55
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	74565
	stdec	r6
						// allocreg r1

						//divtest.c, line 55
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 240 type 103
						// matchobj comparing flags 576 with 1
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//divtest.c, line 55
						//call
						//pcreltotemp
	.lipcrel	_udiv
	add	r7
						// Deferred popping of 8 bytes (56 in total)
						// freereg r1

						//divtest.c, line 56
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	18721
	stdec	r6

						//divtest.c, line 56
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	74565
	stdec	r6
						// allocreg r1

						//divtest.c, line 56
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 240 type 103
						// matchobj comparing flags 576 with 1
						// reg r5 - only match against tmp
	mt	r5
						// (save temp)isreg
	mr	r1
						//save_temp done

						//divtest.c, line 56
						//call
						//pcreltotemp
	.lipcrel	_umod
	add	r7
						// Deferred popping of 8 bytes (64 in total)
						// freereg r1

						//divtest.c, line 57
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 240 type 103
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6

						//divtest.c, line 57
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 576
						// const
						// matchobj comparing flags 1 with 576
	.liconst	1
	stdec	r6
						// allocreg r1

						//divtest.c, line 57
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 240 type 103
						// matchobj comparing flags 576 with 1
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//divtest.c, line 57
						//call
						//pcreltotemp
	.lipcrel	_udiv
	add	r7
						// Deferred popping of 8 bytes (72 in total)
						// freereg r1

						//divtest.c, line 58
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	0
	stdec	r6

						//divtest.c, line 58
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	stdec	r6
						// allocreg r1

						//divtest.c, line 58
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 240 type 103
						// matchobj comparing flags 576 with 1
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//divtest.c, line 58
						//call
						//pcreltotemp
	.lipcrel	_umod
	add	r7
						// Deferred popping of 8 bytes (80 in total)
						// freereg r1

						//divtest.c, line 59
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	65540
	stdec	r6

						//divtest.c, line 59
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	4660
	stdec	r6
						// allocreg r1

						//divtest.c, line 59
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 240 type 103
						// matchobj comparing flags 576 with 1
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//divtest.c, line 59
						//call
						//pcreltotemp
	.lipcrel	_udiv
	add	r7
						// Deferred popping of 8 bytes (88 in total)
						// freereg r1

						//divtest.c, line 60
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	3496
	stdec	r6

						//divtest.c, line 60
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	4660
	stdec	r6
						// allocreg r1

						//divtest.c, line 60
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 240 type 103
						// matchobj comparing flags 576 with 1
						// reg r4 - only match against tmp
	mt	r4
						// (save temp)isreg
	mr	r1
						//save_temp done

						//divtest.c, line 60
						//call
						//pcreltotemp
	.lipcrel	_umod
	add	r7
						// Deferred popping of 8 bytes (96 in total)
						// freereg r1

						//divtest.c, line 61
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 240 type 103
						// reg r3 - only match against tmp
	mt	r3
	stdec	r6

						//divtest.c, line 61
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 576
						// const
						// matchobj comparing flags 1 with 576
	.liconst	1
	stdec	r6
						// allocreg r1

						//divtest.c, line 61
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 240 type 103
						// matchobj comparing flags 576 with 1
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//divtest.c, line 61
						//call
						//pcreltotemp
	.lipcrel	_udiv
	add	r7
						// Deferred popping of 8 bytes (104 in total)
						// freereg r1

						//divtest.c, line 62
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	0
	stdec	r6

						//divtest.c, line 62
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
	stdec	r6
						// allocreg r1

						//divtest.c, line 62
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 240 type 103
						// matchobj comparing flags 576 with 1
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//divtest.c, line 62
						//call
						//pcreltotemp
	.lipcrel	_umod
	add	r7
						// Deferred popping of 8 bytes (112 in total)
						// freereg r1

						//divtest.c, line 63
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
	stdec	r6

						//divtest.c, line 63
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	4660
	stdec	r6
						// allocreg r1

						//divtest.c, line 63
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	291
						// (save temp)isreg
	mr	r1
						//save_temp done

						//divtest.c, line 63
						//call
						//pcreltotemp
	.lipcrel	_sdiv
	add	r7
						// Deferred popping of 8 bytes (120 in total)
						// freereg r1

						//divtest.c, line 64
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	291
	stdec	r6

						//divtest.c, line 64
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	4660
	stdec	r6
						// allocreg r1

						//divtest.c, line 64
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	291
						// (save temp)isreg
	mr	r1
						//save_temp done

						//divtest.c, line 64
						//call
						//pcreltotemp
	.lipcrel	_smod
	add	r7
						// Deferred popping of 8 bytes (128 in total)
						// freereg r1

						//divtest.c, line 66
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0
						// freereg r3
						// freereg r4
						// freereg r5
						// matchobj comparing flags 1 with 1
						// matchobj comparing flags 1 with 1
	.liconst	-128
	sub	r6
	.lipcrel	.functiontail, 0
	add	r7

