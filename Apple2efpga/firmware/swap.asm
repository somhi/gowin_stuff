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
	.global	_SwapBBBB
_SwapBBBB:
	stdec	r6
	mt	r3
	stdec	r6
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
						// allocreg r1

						//../DeMiSTify/firmware/swap.c, line 21
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 103
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	24
	shr	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/swap.c, line 21
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
	and	r1
						// (save result) // isreg
						// allocreg r2

						//../DeMiSTify/firmware/swap.c, line 22
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						// (obj to r2) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	shr	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/swap.c, line 22
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	65280
	and	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/swap.c, line 22
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	or	r1
						// (save result) // isreg
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/swap.c, line 23
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						// (obj to r2) flags 42 type 103
						// matchobj comparing flags 66 with 74
						// reg r3 - only match against tmp
	mt	r3
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	shl	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/swap.c, line 23
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	16711680
	and	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/swap.c, line 23
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	or	r1
						// (save result) // isreg
						// freereg r2
						// allocreg r2

						//../DeMiSTify/firmware/swap.c, line 24
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						// (obj to r2) flags 42 type 103
						// matchobj comparing flags 66 with 74
						// reg r3 - only match against tmp
	mt	r3
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	24
	shl	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/swap.c, line 24
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	-16777216
	and	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/swap.c, line 24
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	or	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/swap.c, line 25
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// freereg r1
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

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.1
	.global	_SwapBB
_SwapBB:
	stdec	r6
	mt	r3
	stdec	r6
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
						// allocreg r2

						//../DeMiSTify/firmware/swap.c, line 30
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						// (obj to r2) flags 42 type 103
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
	mr	r2
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	shr	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/swap.c, line 30
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	255
	and	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/swap.c, line 30
						//FIXME convert
						// (convert - reducing type 103 to 102
						// matchobj comparing flags 1 with 1
	.liconst	65535
	and	r2
						// allocreg r1

						//../DeMiSTify/firmware/swap.c, line 31
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 103
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
	mr	r1
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	8
	shl	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/swap.c, line 31
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	65280
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/swap.c, line 31
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	or	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/swap.c, line 31
						//FIXME convert
						// (convert - reducing type 103 to 102
						// matchobj comparing flags 1 with 74
	.liconst	65535
	and	r1

						//../DeMiSTify/firmware/swap.c, line 32
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// freereg r1
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

	//registers used:
		//r1: yes
		//r2: yes
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.2
	.global	_SwapWW
_SwapWW:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3
						// allocreg r1
						// Q1 disposable
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 40 type 104
						// reg r1 - only match against tmp
	mt	r1
						// (save temp)isreg
	mr	r3
						//save_temp done
						// freereg r1
						// allocreg r1

						//../DeMiSTify/firmware/swap.c, line 37
						// (bitwise/arithmetic) 	//ops: 4, 0, 2
						// (obj to r1) flags 42 type 104
						// matchobj comparing flags 66 with 64
						// reg r3 - only match against tmp
	//mt
	mr	r1
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	16
	shr	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/swap.c, line 37
						// (bitwise/arithmetic) 	//ops: 2, 0, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	65535
	and	r1
						// (save result) // isreg

						//../DeMiSTify/firmware/swap.c, line 37
						//FIXME convert
						// (convert - reducing type 104 to 103
						//No need to mask - same size
						// allocreg r2

						//../DeMiSTify/firmware/swap.c, line 38
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 4, 0, 3
						// (obj to r2) flags 42 type 104
						// matchobj comparing flags 66 with 1
						// reg r3 - only match against tmp
	mt	r3
	mr	r2
						// (obj to tmp) flags 1 type 104
						// matchobj comparing flags 1 with 66
						// const
						// matchobj comparing flags 1 with 66
	.liconst	16
	shl	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/swap.c, line 38
						//FIXME convert
						// (convert - reducing type 104 to 103
						//No need to mask - same size

						//../DeMiSTify/firmware/swap.c, line 38
						// (bitwise/arithmetic) 	//ops: 3, 0, 3
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 1 type 103
						// matchobj comparing flags 1 with 1
						// const
						// matchobj comparing flags 1 with 1
	.liconst	-65536
	and	r2
						// (save result) // isreg

						//../DeMiSTify/firmware/swap.c, line 38
						// Q1 disposable
						// (bitwise/arithmetic) 	//ops: 3, 2, 2
						// WARNING - q1 and target collision - check code for correctness.
						// (obj to tmp) flags 4a type 103
						// matchobj comparing flags 74 with 1
						// reg r2 - only match against tmp
	mt	r2
	or	r1
						// (save result) // isreg
						// freereg r2

						//../DeMiSTify/firmware/swap.c, line 39
						//FIXME convert
						// (convert - reducing type 103 to 104
						//No need to mask - same size

						//../DeMiSTify/firmware/swap.c, line 39
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 4a type 104
						// matchobj comparing flags 74 with 74
						// reg r1 - only match against tmp
	mt	r1
	mr	r0
						// freereg r1
						// freereg r3
	.lipcrel	.functiontail, 4
	add	r7

