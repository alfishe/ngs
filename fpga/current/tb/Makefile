PORTS_INC=../../../docs/ports.inc




all: rom_loader.bin


ports.inc: $(PORTS_INC)
	cat $(PORTS_INC) | sed s/#/0x/ >ports.inc

rom_loader.bin: ports.inc rom_loader.s timer_test.bin
	asl -U -L rom_loader.s
	p2bin rom_loader.p rom_loader.bin -r \$$-$$ -k

timer_test.bin: timer_test.s ports.inc
	asl -U -L timer_test.s
	p2bin timer_test.p timer_test.bin -r \$$-$$ -k


clean:
	rm rom_loader.bin ports.inc timer_test.bin

