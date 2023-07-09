	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: yes
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_main
_main:
	exg	r6
	stmpdec	r6
	stmpdec	r3
	stmpdec	r4
	exg	r6
						// allocreg r4
						// allocreg r3
						// allocreg r2

						//strcpytest.c, line 20
						// (a/p assign)
						// (prepobj r0)
 						// extern (offset 0)
	.liabs	_st
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l3,0
						// static pe is varadr
						// (save temp)store type a
	st	r0
						//save_temp done

						//strcpytest.c, line 22
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r1

						//strcpytest.c, line 23
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// matchobj comparing flags 130 with 130
						// static
	.liabs	l3,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//strcpytest.c, line 23
						//call
						//pcreltotemp
	.lipcrel	___strlen
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//strcpytest.c, line 23
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	0
	cmp	r0
						// freereg r1

						//strcpytest.c, line 23
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l69
		add	r7
						// freereg r2
						// freereg r3
l65: # 
						// allocreg r2

						//strcpytest.c, line 23
						// (bitwise/arithmetic) 	//ops: 0, 5, 3
						// (obj to r2) flags 2 type a
						// extern
	.liabs	_st
						//extern deref
						//sizemod based on type 0xa
	ldt
	mr	r2
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	mt	r4
	add	r2
						// (save result) // isreg
						// allocreg r1

						//strcpytest.c, line 23
						// Q1 disposable
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 66
						// deref 
	ldbinc	r2
//Disposable, postinc doesn't matter.
						// (save temp)isreg
	mr	r1
						//save_temp done
						// freereg r2

						//strcpytest.c, line 23
						//call
						//pcreltotemp
	.lipcrel	_tolower
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r2

						//strcpytest.c, line 23
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r2
						// allocreg r1

						//strcpytest.c, line 23
						// (bitwise/arithmetic) 	//ops: 0, 5, 2
						// (obj to r1) flags 2 type a
						// matchobj comparing flags 2 with 74
						// extern
	.liabs	_st
						//extern deref
						//sizemod based on type 0xa
	ldt
	mr	r1
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 2
						// reg r4 - only match against tmp
	mt	r4
	add	r1
						// (save result) // isreg

						//strcpytest.c, line 23
						// Q1 disposable
						// Z disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 66
						// reg r2 - only match against tmp
	mt	r2
						// (save temp)store type 1
	stbinc	r1
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r2
						// freereg r1

						//strcpytest.c, line 23
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	add	r4
						// (save result) // isreg
						// allocreg r3

						//strcpytest.c, line 23
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
						//Saving to reg r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						//No need to mask - same size
						// allocreg r1

						//strcpytest.c, line 23
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 66
						// extern
	.liabs	_st
						//extern deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//strcpytest.c, line 23
						//call
						//pcreltotemp
	.lipcrel	___strlen
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//strcpytest.c, line 23
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//strcpytest.c, line 23
						// Q1 disposable
						// Q2 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	cmp	r3
						// freereg r3
						// freereg r1

						//strcpytest.c, line 23
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l65
		add	r7
l69: # 

						//strcpytest.c, line 25
						// (a/p assign)
					// (char with size!=1 -> array of unknown type)
						// (obj to r0) flags 2 type b
						//static not varadr
						//statictotemp (FIXME - make PC-relative?)
	.liabs	l8,0
	mr	r0
						// (prepobj r1)
 						// matchobj comparing flags 130 with 2
						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_strbuf
						// extern pe not varadr
	mr	r1
					// Copying 2 words and 2 bytes to strbuf
					// Copying 2 words to strbuf
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 2
	.liconst	8
	addt	r1
	mr	r2
.cpystrbufwordloop0:
	ldinc	r0
	stinc	r1
	mt	r1
	cmp	r2
	cond	NEQ
		.lipcrel	.cpystrbufwordloop0
		add	r7
					// Copying 2 byte tail to strbuf
	ldbinc	r0
	stbinc	r1
	ldbinc	r0
	stbinc	r1
						// allocreg r1

						//strcpytest.c, line 26
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// extern
	.liabs	_st
						//extern deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r2

						//strcpytest.c, line 26
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_strbuf
						// extern pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done

						//strcpytest.c, line 26
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	//mr
						//save_temp done
						// allocreg r3

						//strcpytest.c, line 26
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	5
						// (save temp)isreg
	mr	r3
						//save_temp done

						//strcpytest.c, line 26
						//call
						//pcreltotemp
	.lipcrel	___strncat
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1
						// freereg r3
						// allocreg r1

						//strcpytest.c, line 27
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// extern
	.liabs	_st
						//extern deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done
						// allocreg r2

						//strcpytest.c, line 27
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 2
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 2
						// extern (offset 0)
	.liabs	_strbuf
						// extern pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done

						//strcpytest.c, line 27
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 4a type a
						// matchobj comparing flags 74 with 130
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	//mr
						//save_temp done

						//strcpytest.c, line 27
						//call
						//pcreltotemp
	.lipcrel	___strcat
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1

						//strcpytest.c, line 28
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	0
						// (save temp)isreg
	mr	r4
						//save_temp done
						// allocreg r1

						//strcpytest.c, line 29
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_strbuf
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//strcpytest.c, line 29
						//call
						//pcreltotemp
	.lipcrel	___strlen
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//strcpytest.c, line 29
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 1 type 103
						// const
	.liconst	0
	cmp	r0
						// freereg r1

						//strcpytest.c, line 29
	cond	LE
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l70
		add	r7
l66: # 
						// allocreg r2
						// allocreg r3

						//strcpytest.c, line 29
						// (bitwise/arithmetic) 	//ops: 0, 5, 4
						// (obj to r3) flags 82 type a
						// (prepobj r3)
 						// extern (offset 0)
	.liabs	_strbuf
						// extern pe is varadr
	mr	r3
						// (obj to tmp) flags 42 type a
						// matchobj comparing flags 66 with 130
						// reg r4 - only match against tmp
	mt	r4
	add	r3
						// (save result) // isreg
						// allocreg r1

						//strcpytest.c, line 29
						//FIXME convert
						//Converting to wider type...
						//But unsigned, so no need to extend
						// (prepobj r1)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 6a type 101
						// matchobj comparing flags 106 with 66
						// deref 
	byt
	ld	r3
						// (save temp)isreg
	mr	r1
						//save_temp done

						//strcpytest.c, line 29
						//call
						//pcreltotemp
	.lipcrel	___toupper
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//strcpytest.c, line 29
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//strcpytest.c, line 29
						// Q1 disposable
						// Z disposable
						//FIXME convert
						// (convert - reducing type 3 to 101
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 4a type 3
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
						// (save temp)store type 1
	stbinc	r3
						//Disposable, postinc doesn't matter.
						//save_temp done
						// freereg r1
						// freereg r3

						//strcpytest.c, line 29
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	1
	add	r4
						// (save result) // isreg
						// allocreg r3

						//strcpytest.c, line 29
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 42 type 3
						// matchobj comparing flags 66 with 1
						// reg r4 - only match against tmp
	mt	r4
						//Saving to reg r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						//No need to mask - same size
						// allocreg r1

						//strcpytest.c, line 29
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// extern (offset 0)
	.liabs	_strbuf
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//strcpytest.c, line 29
						//call
						//pcreltotemp
	.lipcrel	___strlen
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//strcpytest.c, line 29
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//strcpytest.c, line 29
						// Q1 disposable
						// Q2 disposable
						// (compare) (q1 unsigned) (q2 unsigned)
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	cmp	r3
						// freereg r3
						// freereg r1

						//strcpytest.c, line 29
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l66
		add	r7
l70: # 
						// allocreg r3
						// allocreg r1

						//strcpytest.c, line 31
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_strbuf
						// extern pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//strcpytest.c, line 31
						//call
						//pcreltotemp
	.lipcrel	___strlen
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//strcpytest.c, line 31
						// (getreturn)						// (save result) // isreg
	mt	r0
	mr	r1

						//strcpytest.c, line 31
						// Q1 disposable
						//FIXME convert
						// (convert - reducing type 103 to 3
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
						//Saving to reg r4
						// (save temp)isreg
	mr	r4
						//save_temp done
						//No need to mask - same size
						// freereg r1

						//strcpytest.c, line 32
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	28
	cmp	r4

						//strcpytest.c, line 32
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l14
		add	r7
						// allocreg r1

						//strcpytest.c, line 33
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l15,0
						// static pe is varadr
	stdec	r6

						//strcpytest.c, line 33
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6

						//strcpytest.c, line 35
						//pcreltotemp
	.lipcrel	l16
	add	r7
l14: # 

						//strcpytest.c, line 35
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	stdec	r6

						//strcpytest.c, line 35
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l17,0
						// static pe is varadr
	stdec	r6

						//strcpytest.c, line 35
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1
						// freereg r2
						// freereg r3
l16: # 
						// allocreg r3

						//strcpytest.c, line 37
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_strbuf
						// extern pe is varadr
						// (save temp)isreg
	mr	r3
						//save_temp done
						// allocreg r2

						//strcpytest.c, line 37
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// static
	.liabs	l18,0
						// static pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//strcpytest.c, line 37
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
	.liconst	7
						// (save temp)isreg
	mr	r1
						//save_temp done

						//strcpytest.c, line 37
						//call
						//pcreltotemp
	.lipcrel	___strncpy
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r3
						// freereg r2
						// freereg r1
						// allocreg r2

						//strcpytest.c, line 38
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_strbuf
						// extern pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//strcpytest.c, line 38
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// static
	.liabs	l21,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//strcpytest.c, line 38
						//call
						//pcreltotemp
	.lipcrel	___strcmp
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1
						// allocreg r1

						//strcpytest.c, line 38
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//strcpytest.c, line 38
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l20
		add	r7
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//strcpytest.c, line 39
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// static
	.liabs	l22,0
						// static pe is varadr
	stdec	r6

						//strcpytest.c, line 39
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6

						//strcpytest.c, line 41
						//pcreltotemp
	.lipcrel	l23
	add	r7
l20: # 

						//strcpytest.c, line 41
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// extern (offset 0)
	.liabs	_strbuf
						// extern pe is varadr
	stdec	r6

						//strcpytest.c, line 41
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// static
	.liabs	l24,0
						// static pe is varadr
	stdec	r6

						//strcpytest.c, line 41
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
						// freereg r1
						// freereg r2
l23: # 
						// allocreg r2

						//strcpytest.c, line 43
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l28,0
						// static pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//strcpytest.c, line 43
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// static
	.liabs	l27,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//strcpytest.c, line 43
						//call
						//pcreltotemp
	.lipcrel	___strcmp
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1
						// allocreg r1

						//strcpytest.c, line 43
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//strcpytest.c, line 43
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l26
		add	r7
						// allocreg r2
						// allocreg r1

						//strcpytest.c, line 44
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// static
	.liabs	l29,0
						// static pe is varadr
	stdec	r6

						//strcpytest.c, line 44
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6

						//strcpytest.c, line 46
						//pcreltotemp
	.lipcrel	l30
	add	r7
l26: # 

						//strcpytest.c, line 46
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l31,0
						// static pe is varadr
	stdec	r6

						//strcpytest.c, line 46
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
						// freereg r1
						// freereg r2
l30: # 
						// allocreg r2

						//strcpytest.c, line 48
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l35,0
						// static pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//strcpytest.c, line 48
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// static
	.liabs	l34,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//strcpytest.c, line 48
						//call
						//pcreltotemp
	.lipcrel	___strcmp
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1
						// allocreg r1

						//strcpytest.c, line 48
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//strcpytest.c, line 48
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l33
		add	r7
						// allocreg r2
						// allocreg r1

						//strcpytest.c, line 49
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// static
	.liabs	l36,0
						// static pe is varadr
	stdec	r6

						//strcpytest.c, line 49
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6

						//strcpytest.c, line 51
						//pcreltotemp
	.lipcrel	l37
	add	r7
l33: # 

						//strcpytest.c, line 51
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// (prepobj tmp)
 						// static
	.liabs	l38,0
						// static pe is varadr
	stdec	r6

						//strcpytest.c, line 51
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6
l37: # 

						//strcpytest.c, line 53
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
						// freereg r2
						// freereg r3
l67: # 
						// allocreg r3

						//strcpytest.c, line 55
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
						//Saving to reg r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						//No need to mask - same size
						// allocreg r2

						//strcpytest.c, line 55
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l46,0
						// static pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//strcpytest.c, line 55
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// static
	.liabs	l45,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//strcpytest.c, line 55
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 130
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	//mr
						//save_temp done

						//strcpytest.c, line 55
						//call
						//pcreltotemp
	.lipcrel	___strncmp
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1
						// freereg r3
						// allocreg r1

						//strcpytest.c, line 55
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//strcpytest.c, line 55
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l44
		add	r7
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//strcpytest.c, line 57
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	9
	cmp	r4

						//strcpytest.c, line 57
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l48
		add	r7

						//strcpytest.c, line 58
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l49,0
						// static pe is varadr
	stdec	r6

						//strcpytest.c, line 58
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6

						//strcpytest.c, line 60
						//pcreltotemp
	.lipcrel	l50
	add	r7
l48: # 

						//strcpytest.c, line 60
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	stdec	r6

						//strcpytest.c, line 60
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l51,0
						// static pe is varadr
	stdec	r6

						//strcpytest.c, line 60
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
l50: # 

						//strcpytest.c, line 61
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	15
						// (save temp)isreg
	mr	r4
						//save_temp done
l44: # 

						//strcpytest.c, line 54
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	add	r4
						// (save result) // isreg

						//strcpytest.c, line 54
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	15
	sgn
	cmp	r4

						//strcpytest.c, line 54
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l67
		add	r7
						// freereg r1
						// freereg r2
						// freereg r3
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//strcpytest.c, line 65
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	1
						// (save temp)isreg
	mr	r4
						//save_temp done
						// freereg r1
						// freereg r2
						// freereg r3
l68: # 
						// allocreg r3

						//strcpytest.c, line 67
						//FIXME convert
						// (convert - reducing type 3 to 103
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
						//Saving to reg r3
						// (save temp)isreg
	mr	r3
						//save_temp done
						//No need to mask - same size
						// allocreg r2

						//strcpytest.c, line 67
						// (a/p assign)
						// (prepobj r0)
 						// reg r2 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l59,0
						// static pe is varadr
						// (save temp)isreg
	mr	r2
						//save_temp done
						// allocreg r1

						//strcpytest.c, line 67
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 130
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 130
						// static
	.liabs	l58,0
						// static pe is varadr
						// (save temp)isreg
	mr	r1
						//save_temp done

						//strcpytest.c, line 67
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 130
						// reg r3 - only match against tmp
	mt	r3
						// (save temp)isreg
	//mr
						//save_temp done

						//strcpytest.c, line 67
						//call
						//pcreltotemp
	.lipcrel	___strncasecmp
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r2
						// freereg r1
						// freereg r3
						// allocreg r1

						//strcpytest.c, line 67
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//strcpytest.c, line 67
	cond	EQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l57
		add	r7
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//strcpytest.c, line 69
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 74
						// const
						// matchobj comparing flags 1 with 74
	.liconst	13
	cmp	r4

						//strcpytest.c, line 69
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l61
		add	r7

						//strcpytest.c, line 70
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 1
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 1
						// static
	.liabs	l62,0
						// static pe is varadr
	stdec	r6

						//strcpytest.c, line 70
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 4 + 0 bytes
	.liconst	4
	add	r6

						//strcpytest.c, line 72
						//pcreltotemp
	.lipcrel	l63
	add	r7
l61: # 

						//strcpytest.c, line 72
						// (a/p push)
						// a: pushed 0, regnames[sp] r6
						// (obj to tmp) flags 42 type 3
						// reg r4 - only match against tmp
	mt	r4
	stdec	r6

						//strcpytest.c, line 72
						// (a/p push)
						// a: pushed 4, regnames[sp] r6
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 66
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 66
						// static
	.liabs	l64,0
						// static pe is varadr
	stdec	r6

						//strcpytest.c, line 72
						//call
						//pcreltotemp
	.lipcrel	_printf
	add	r7
						// Flow control - popping 8 + 0 bytes
	.liconst	8
	add	r6
l63: # 

						//strcpytest.c, line 73
						// (a/p assign)
						// (prepobj r0)
 						// reg r4 - no need to prep
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	15
						// (save temp)isreg
	mr	r4
						//save_temp done
l57: # 

						//strcpytest.c, line 66
						// (bitwise/arithmetic) 	//ops: 5, 0, 5
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 3
						// const
	.liconst	1
	add	r4
						// (save result) // isreg

						//strcpytest.c, line 66
						// (compare) (q1 signed) (q2 signed)
						// (obj to tmp) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	15
	sgn
	cmp	r4

						//strcpytest.c, line 66
	cond	SLT
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l68
		add	r7
						// freereg r1
						// freereg r2
						// freereg r3
						// allocreg r3
						// allocreg r2
						// allocreg r1

						//strcpytest.c, line 76
						//setreturn
						// (obj to r0) flags 1 type 3
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	0
	mr	r0
						// freereg r1
						// freereg r2
						// freereg r3
						// freereg r4
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
l49:
	.byte	115
	.byte	116
	.byte	114
	.byte	110
	.byte	99
	.byte	109
	.byte	112
	.byte	58
	.byte	32
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
	.section	.rodata.2
l51:
	.byte	115
	.byte	116
	.byte	114
	.byte	110
	.byte	99
	.byte	109
	.byte	112
	.byte	58
	.byte	32
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
	.byte	103
	.byte	111
	.byte	116
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
	.section	.rodata.3
l45:
	.byte	72
	.byte	101
	.byte	108
	.byte	108
	.byte	111
	.byte	44
	.byte	32
	.byte	87
	.byte	79
	.byte	82
	.byte	76
	.byte	68
	.byte	0
	.section	.rodata.4
l46:
	.byte	72
	.byte	101
	.byte	108
	.byte	108
	.byte	111
	.byte	44
	.byte	32
	.byte	87
	.byte	111
	.byte	114
	.byte	108
	.byte	100
	.byte	0
	.section	.rodata.5
l62:
	.byte	115
	.byte	116
	.byte	114
	.byte	110
	.byte	99
	.byte	97
	.byte	115
	.byte	101
	.byte	99
	.byte	109
	.byte	112
	.byte	58
	.byte	32
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
	.section	.rodata.6
l64:
	.byte	115
	.byte	116
	.byte	114
	.byte	110
	.byte	99
	.byte	97
	.byte	115
	.byte	101
	.byte	99
	.byte	109
	.byte	112
	.byte	58
	.byte	32
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
	.byte	103
	.byte	111
	.byte	116
	.byte	32
	.byte	37
	.byte	100
	.byte	10
	.byte	0
	.section	.rodata.7
l58:
	.byte	72
	.byte	101
	.byte	108
	.byte	108
	.byte	111
	.byte	44
	.byte	32
	.byte	87
	.byte	79
	.byte	82
	.byte	76
	.byte	68
	.byte	0
	.section	.rodata.8
l59:
	.byte	72
	.byte	69
	.byte	76
	.byte	76
	.byte	79
	.byte	44
	.byte	32
	.byte	87
	.byte	111
	.byte	114
	.byte	108
	.byte	100
	.byte	33
	.byte	0
	.section	.rodata.9
l3:
	.byte	72
	.byte	69
	.byte	76
	.byte	76
	.byte	79
	.byte	44
	.byte	32
	.byte	119
	.byte	111
	.byte	114
	.byte	108
	.byte	100
	.byte	33
	.byte	10
	.byte	0
	.section	.rodata.a
l8:
	.byte	84
	.byte	101
	.byte	115
	.byte	116
	.byte	105
	.byte	110
	.byte	103
	.byte	58
	.byte	32
	.byte	0
	.section	.rodata.b
l15:
	.byte	115
	.byte	116
	.byte	114
	.byte	108
	.byte	101
	.byte	110
	.byte	58
	.byte	32
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
	.section	.rodata.c
l17:
	.byte	115
	.byte	116
	.byte	114
	.byte	108
	.byte	101
	.byte	110
	.byte	58
	.byte	32
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
	.byte	103
	.byte	111
	.byte	116
	.byte	32
	.byte	37
	.byte	100
	.byte	44
	.byte	32
	.byte	115
	.byte	104
	.byte	111
	.byte	117
	.byte	108
	.byte	100
	.byte	32
	.byte	98
	.byte	101
	.byte	32
	.byte	50
	.byte	56
	.byte	10
	.byte	0
	.section	.rodata.d
l18:
	.byte	72
	.byte	101
	.byte	108
	.byte	108
	.byte	111
	.byte	44
	.byte	32
	.byte	87
	.byte	111
	.byte	114
	.byte	108
	.byte	100
	.byte	10
	.byte	0
	.section	.rodata.e
l21:
	.byte	72
	.byte	101
	.byte	108
	.byte	108
	.byte	111
	.byte	44
	.byte	32
	.byte	58
	.byte	32
	.byte	72
	.byte	69
	.byte	76
	.byte	76
	.byte	79
	.byte	72
	.byte	69
	.byte	76
	.byte	76
	.byte	79
	.byte	44
	.byte	32
	.byte	87
	.byte	79
	.byte	82
	.byte	76
	.byte	68
	.byte	33
	.byte	10
	.byte	0
	.section	.rodata.f
l22:
	.byte	115
	.byte	116
	.byte	114
	.byte	99
	.byte	109
	.byte	112
	.byte	58
	.byte	32
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
	.section	.rodata.10
l24:
	.byte	115
	.byte	116
	.byte	114
	.byte	99
	.byte	109
	.byte	112
	.byte	58
	.byte	32
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
	.byte	103
	.byte	111
	.byte	116
	.byte	32
	.byte	37
	.byte	115
	.byte	10
	.byte	0
	.section	.rodata.11
l27:
	.byte	72
	.byte	101
	.byte	108
	.byte	108
	.byte	111
	.byte	44
	.byte	32
	.byte	87
	.byte	111
	.byte	114
	.byte	108
	.byte	100
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.section	.rodata.12
l28:
	.byte	72
	.byte	101
	.byte	108
	.byte	108
	.byte	111
	.byte	44
	.byte	32
	.byte	87
	.byte	111
	.byte	114
	.byte	108
	.byte	100
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.section	.rodata.13
l29:
	.byte	115
	.byte	116
	.byte	114
	.byte	99
	.byte	109
	.byte	112
	.byte	50
	.byte	58
	.byte	32
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
	.section	.rodata.14
l31:
	.byte	115
	.byte	116
	.byte	114
	.byte	99
	.byte	109
	.byte	112
	.byte	50
	.byte	58
	.byte	32
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
	.byte	10
	.byte	0
	.section	.rodata.15
l34:
	.byte	72
	.byte	101
	.byte	108
	.byte	108
	.byte	111
	.byte	44
	.byte	32
	.byte	87
	.byte	79
	.byte	82
	.byte	76
	.byte	68
	.byte	0
	.section	.rodata.16
l35:
	.byte	72
	.byte	69
	.byte	76
	.byte	76
	.byte	79
	.byte	44
	.byte	32
	.byte	87
	.byte	111
	.byte	114
	.byte	108
	.byte	100
	.byte	32
	.byte	32
	.byte	32
	.byte	0
	.section	.rodata.17
l36:
	.byte	115
	.byte	116
	.byte	114
	.byte	99
	.byte	97
	.byte	115
	.byte	101
	.byte	99
	.byte	109
	.byte	112
	.byte	58
	.byte	32
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
	.section	.rodata.18
l38:
	.byte	115
	.byte	116
	.byte	114
	.byte	99
	.byte	97
	.byte	115
	.byte	101
	.byte	99
	.byte	109
	.byte	112
	.byte	58
	.byte	32
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
	.byte	10
	.byte	0
	.section	.bss.19
	.global	_st
	.comm	_st,4
	.section	.bss.1a
	.global	_strbuf
	.comm	_strbuf,20
