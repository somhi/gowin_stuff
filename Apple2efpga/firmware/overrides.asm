	//registers used:
		//r1: yes
		//r2: no
		//r3: yes
		//r4: no
		//r5: no
		//r6: yes
		//r7: yes
		//tmp: yes
	.section	.text.0
	.global	_autoboot
_autoboot:
	stdec	r6
	mt	r3
	stdec	r6
						// allocreg r3

						//overrides.c, line 29
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 1 type a
						// const
	.liconst	0
						// (save temp)isreg
	mr	r3
						//save_temp done

						//overrides.c, line 30
						// (a/p assign)
						// (prepobj r0)
 						// matchobj comparing flags 130 with 1
						// extern (offset 0)
	.liabs	_romtype
						// extern pe not varadr
	mr	r0
						// (obj to tmp) flags 1 type 101
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
						// const
						// matchobj comparing flags 1 with 130
						// matchobj comparing flags 1 with 130
	.liconst	0
						// (save temp)store type 1
	stbinc	r0
						//Disposable, postinc doesn't matter.
						//save_temp done
						// allocreg r1

						//overrides.c, line 32
						// (a/p assign)
						// (prepobj r0)
 						// reg r1 - no need to prep
						// (obj to tmp) flags 2 type a
						// matchobj comparing flags 2 with 1
						// matchobj comparing flags 2 with 130
						// extern
	.liabs	_bootrom_name
						//extern deref
						//sizemod based on type 0xa
	ldt
						// (save temp)isreg
	mr	r1
						//save_temp done

						//overrides.c, line 32
						//call
						//pcreltotemp
	.lipcrel	_LoadROM
	add	r7
						// Flow control - popping 0 + 0 bytes
						// freereg r1
						// allocreg r1

						//overrides.c, line 32
						// (test)
						// (obj to tmp) flags 4a type 3
						// reg r0 - only match against tmp
	mt	r0
				// flags 4a
	and	r0
						// freereg r1

						//overrides.c, line 32
	cond	NEQ
						//conditional branch regular
						//pcreltotemp
	.lipcrel	l5
		add	r7
						// allocreg r1

						//overrides.c, line 33
						// (a/p assign)
						// (prepobj r0)
 						// reg r3 - no need to prep
						// (obj to tmp) flags 82 type a
						// matchobj comparing flags 130 with 74
						// (prepobj tmp)
 						// matchobj comparing flags 130 with 74
						// static
	.liabs	l6,0
						// static pe is varadr
						// (save temp)isreg
	mr	r3
						//save_temp done
l5: # 

						//overrides.c, line 34
						// Q1 disposable
						//setreturn
						// (obj to r0) flags 42 type a
						// reg r3 - only match against tmp
	mt	r3
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

	.section	.rodata.1
l6:
	.byte	83
	.byte	104
	.byte	111
	.byte	119
	.byte	47
	.byte	104
	.byte	105
	.byte	100
	.byte	101
	.byte	32
	.byte	79
	.byte	83
	.byte	68
	.byte	32
	.byte	61
	.byte	32
	.byte	107
	.byte	101
	.byte	121
	.byte	32
	.byte	70
	.byte	49
	.byte	50
	.byte	0
	.section	.data.2
	.global	_bootrom_name
_bootrom_name:
						// Declaring from tree
						// static
	.ref	l1
	.section	.data.3
	.global	_romtype
_romtype:
	.byte	0
	.section	.rodata.4
l1:
	.byte	65
	.byte	85
	.byte	84
	.byte	79
	.byte	66
	.byte	79
	.byte	79
	.byte	84
	.byte	78
	.byte	69
	.byte	83
	.byte	0
