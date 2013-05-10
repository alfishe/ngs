
	CPU	Z80UNDOC
	RELAXED	ON

	include	"ports.inc"


halfper	equ	3000000

	org	0x4000


	ld	a,M_NOROM
	out	(GSCFG0),a

	ld	hl,0x38
	ld	(hl),0xc3
	inc	l
	ld	(hl),intt&255
	inc	l
	ld	(hl),intt/256
	im	0

	ld	hl,0
	ld	(counter),hl
	xor	a
	ld	(counter+2),a
	ld	(mode),a


	ei


loop
	ld	hl,65535
	ld	d,h
	ld	e,l
wai
	ld	b,15
	djnz	$
	add	hl,de
	jp	c,wai

	ld	a,(mode)
	inc	a
	and	7
	ld	(mode),a
	out	(TIM_FRQ),a

	jr	loop


intt
	exx
	ex	af,af'

	ld	a,(mode)
	add	a,a
	add	a,a
	add	a,tbladd&255
	ld	e,a
	adc	a,tbladd/256
	sub	e
	ld	d,a

	ld	hl,counter

	ld	a,(de)
	add	a,(hl)
	ld	(hl),a
	inc	de
	inc	hl
	ld	a,(de)
	adc	a,(hl)
	ld	(hl),a
	inc	de
	inc	hl
	ld	a,(de)
	adc	a,(hl)
	ld	(hl),a

	dec	hl
	dec	hl

	ld	a,(hl)
	sub	halfper&255
	ld	c,a
	inc	hl
	ld	a,(hl)
	sbc	a,(halfper>>8)&255
	ld	b,a
	inc	hl
	ld	a,(hl)
	sbc	a,(halfper>>16)&255

	jp	c,eintt

	ld	(hl),a
	dec	hl
	ld	(hl),b
	dec	hl
	ld	(hl),c

	ld	a,0
	inc	a
	ld	($-2),a
	out	(LEDCTR),a

eintt
	exx
	ex	af,af'
	ei
	ret

tbladd
	dw	640,0
	dw	1280,0
	dw	2560,0
	dw	5120,0
	dw	10240,0
	dw	40960,0
	dw	32768,2
	dw	0,10


counter	equ	$

mode	equ	counter+3


