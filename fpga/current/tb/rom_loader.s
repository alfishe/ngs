	CPU	Z80UNDOC
	RELAXED	ON

	include	"ports.inc"

	org	0

	ld	sp,0x8000
	im	0
	ei
	ld	a,0
loop
	out	(LEDCTR),a
	inc	a
	jp	loop



	org	0x38

	ei
	ret

