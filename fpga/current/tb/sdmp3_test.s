

	CPU	Z80UNDOC
	RELAXED	ON

	include	"ports.inc"

	org	0x4000

	di

	ld	a,M_NOROM+C_24MHZ+M_EXPAG
	out	(GSCFG0),a



	ld	a,C_DMA_SD
	out	(DMA_MOD),a

	ld	a,1
	out	(DMA_HAD),a
	xor	a
	out	(DMA_MAD),a
	out	(DMA_LAD),a

	ld	a,0x80
	out	(DMA_CST),a

	jp	$

