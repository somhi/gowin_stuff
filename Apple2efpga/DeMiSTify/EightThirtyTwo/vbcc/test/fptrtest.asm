	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_f1
_f1:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type a
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r2

						//fptrtest.c, line 15
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//fptrtest.c, line 15
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l8,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//fptrtest.c, line 15
						//call
						//pcreltotemp
	.lipcrel	___strcmp
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1
						// allocreg r1

						//fptrtest.c, line 15
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//fptrtest.c, line 15
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l7
		add	r7
						// allocreg r2
						// allocreg r1

						//fptrtest.c, line 16
						// (bitwise/arithmetic) 	//ops: 0, 0, 1
						// (obj to r0) flags 2 type 3
						// matchobj comparing flags 2 with 74
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l3,0
						//static deref
						//sizemod based on type 0x3
	ldt
	mr	r0
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
						// matchobj comparing flags 1 with 2
	.liconst	1
	add	r0
						// (save result) // not reg
						// Store_reg to type 0x3, flags 0x2
						// (prepobj tmp)
 						// static
	.liabs	l3,4
						// static pe not varadr
	stmpdec	r0
 						// WARNING - check that 4 has been added.
l7: # 

						//fptrtest.c, line 17
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0
						// freereg r1
						// freereg r2
						// freereg r3
	.lipcrel	.functiontail, 4
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
l8:
	.byte	72
	.byte	101
	.byte	108
	.byte	108
	.byte	111
	.byte	32
	.byte	119
	.byte	111
	.byte	114
	.byte	108
	.byte	100
	.byte	33
	.byte	10
	.byte	0
	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.2
	.global	_call
_call:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r1

						//fptrtest.c, line 22
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l11,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//fptrtest.c, line 22
						//call
						//pcreltotemp
	.lipcrel	l1
	addt	r7	//Deref function pointer
	ldt
	exg	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r1
						// allocreg r1

						//fptrtest.c, line 23
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l12,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r3

						//fptrtest.c, line 23
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 22 type a
						// matchobj comparing flags 34 with 130
						// deref 
						// (prepobj tmp)
 						// matchobj comparing flags 162 with 130
						// deref
						// var FIXME - deref?
						// static
	ldinc	r7
	.ref	l2,0
	ldt
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r3
						//save_temp done

						//fptrtest.c, line 23
						// Q1 disposable
						//call
						// (obj to tmp) flags 6a type f
						// matchobj comparing flags 106 with 34
						// deref 
	//mt
	exg	r7
						// Deferred popping of 0 bytes (0 in total)
						// freereg r3
						// freereg r1

						//fptrtest.c, line 24
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0
	.lipcrel	.functiontail, 4
	add	r7

	.section	.rodata.3
l11:
	.byte	72
	.byte	101
	.byte	108
	.byte	108
	.byte	111
	.byte	32
	.byte	119
	.byte	111
	.byte	114
	.byte	108
	.byte	100
	.byte	33
	.byte	10
	.byte	0
	.section	.rodata.4
l12:
	.byte	72
	.byte	101
	.byte	108
	.byte	108
	.byte	111
	.byte	32
	.byte	119
	.byte	111
	.byte	114
	.byte	108
	.byte	100
	.byte	33
	.byte	10
	.byte	0
	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.5
	.global	_main
_main:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r2

						//fptrtest.c, line 30
						// (a/p assign)
						// (prepobj r0)
 						// static
	.liabs	l1,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// extern (offset 0)
	.liabs	_f1
						// extern pe is varadr
						// (save temp)store type a
	st	r0
						//save_temp done

						//fptrtest.c, line 31
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l2,0
						// static pe not varadr
	mr	r0
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l1,0
						// static pe is varadr
						// (save temp)store type a
	st	r0
						//save_temp done
						// allocreg r3

						//fptrtest.c, line 32
						//FIXME convert
						// (convert - reducing type a to 3
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// extern (offset 0)
	.liabs	_f1
						// extern pe is varadr
						//Saving to reg r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						//No need to mask - same size

						//fptrtest.c, line 33
						//FIXME convert
						// (convert - reducing type 3 to a
						//No need to mask - same size
						// allocreg r1

						//fptrtest.c, line 33
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l15,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//fptrtest.c, line 33
						// Q1 disposable
						//call
						// (obj to tmp) flags 6a type f
						// matchobj comparing flags 106 with 130
						// matchobj comparing flags 106 with 130
						// deref 
	mt	r3
	exg	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r1

						//fptrtest.c, line 34
						//call
						//pcreltotemp
	.lipcrel	_call
	add	r7
						// Flow control - popping 0 + 0 bytes
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 2 type 3
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l3,0
						//static deref
						//sizemod based on type 0x3
	ldt
						// (save temp)isreg
	mr	r2
						//save_temp done

						//fptrtest.c, line 35
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 2
						// const
						// matchobj comparing flags 1 with 2
	.liconst	3
	cmp	r2

						//fptrtest.c, line 35
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l17
		add	r7
						// allocreg r1

						//fptrtest.c, line 36
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l18,0
						// static pe is varadr
	stdec	r6

						//fptrtest.c, line 36
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6

						//fptrtest.c, line 38
						//pcreltotemp
	.lipcrel	l19
	add	r7
l17: # 

						//fptrtest.c, line 38
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// reg r2 - only match against tmp
	mt	r2
	stdec	r6

						//fptrtest.c, line 38
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l20,0
						// static pe is varadr
	stdec	r6

						//fptrtest.c, line 38
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
l19: # 

						//fptrtest.c, line 39
						//setreturn
						// (obj to r0) flags 1 type 3
						// const
	.liconst	0
	mr	r0
						// freereg r1
						// freereg r2
	.lipcrel	.functiontail, 4
	add	r7

	.section	.rodata.6
l15:
	.byte	72
	.byte	101
	.byte	108
	.byte	108
	.byte	111
	.byte	32
	.byte	119
	.byte	111
	.byte	114
	.byte	108
	.byte	100
	.byte	33
	.byte	10
	.byte	0
	.section	.rodata.7
l18:
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
	.byte	27
	.byte	91
	.byte	48
	.byte	109
	.byte	10
	.byte	0
	.section	.rodata.8
l20:
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
	.byte	27
	.byte	91
	.byte	48
	.byte	109
	.byte	32
	.byte	45
	.byte	32
	.byte	114
	.byte	101
	.byte	115
	.byte	117
	.byte	108
	.byte	116
	.byte	58
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
	.section	.data.9
l3:
	.int	0
	.section	.bss.a
	.lcomm	l1,4
	.section	.bss.b
	.lcomm	l2,4
