PORTS_INC=../../../docs/ports.inc




all: ports.inc rom_loader.bin


ports.inc: $(PORTS_INC)
	cat $(PORTS_INC) | sed s/#/0x/ >ports.inc

rom_loader.bin: ports.inc rom_loader.s
	asl -U -L rom_loader.s
	p2bin rom_loader.p rom_loader.bin -r \$$-$$ -k

clean:
	rm rom_loader.bin ports.inc

