
	CPU	Z80UNDOC
	RELAXED	ON

	include	"ports.inc"




LFSR	MACRO

	;23bit lfsr, bits 22,17 -- 0100_0010__0000_0000__0000_0000
	;
	; regs BDE

	srl	b
	rr	d
	rr	e
	sbc	a,a
	and	0x42
	xor	b
	ld	b,a

	ENDM

TSTRAM	MACRO

	push	bc
	push	de

.wrloop
	ld	a,ixl
	out	(c),a
	LFSR
	ld	(hl),a
	inc	ixl
	jr	nz,.wrloop


	pop	de
	pop	bc

.rdloop
	ld	a,ixl
	out	(c),a
	LFSR
	cp	(hl)
	jr	nz,.error
	inc	ixl
	jr	nz,.rdloop
	jr	.end

.error
	inc	a
	out	(LEDCTR),a
	jr	.error

.end
	ENDM



	org	0x4000
; we are in 3rd 16k page now

	; norom, no ramro, 24mhz

	ld	a,M_NOROM+C_24MHZ+M_EXPAG
	out	(GSCFG0),a

	
	xor	a
	ld	(led),a

	ld	l,a
	ld	ixl,a

	ld	b,0xcc
	ld	de,0x5aa5

testloop
	ld	a,(led)
	inc	a
	ld	(led),a
	rrca
	rrca
	out	(LEDCTR),a


	ld	h,0xE0
	ld	c,WIN3
	TSTRAM


	ld	h,0xA0
	ld	c,WIN2
	TSTRAM


	ld	a,3
	out	(WIN2),a
	ld	sp,0xc000
	jp	$+0x4000+3

	ld	h,0x60
	ld	c,WIN1
	TSTRAM
	
	ld	a,3
	out	(WIN1),a
	ld	sp,0x8000
	jp	$+3


	ld	h,0x20
	ld	c,WIN0
	TSTRAM


	ld	h,0xA0
	ld	c,MPAG
	TSTRAM

	ld	h,0xE0
	ld	c,MPAGEX
	TSTRAM




	jp	testloop

led	equ	$

