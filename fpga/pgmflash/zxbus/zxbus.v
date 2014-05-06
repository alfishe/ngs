// part of NeoGS flash programmer project (c) 2014 lvd^NedoPC
//
// zxbus controller

module zxbus
(
	input  wire clk,
	input  wire rst_n,
	
	zxid, // zxbus DATA BUS in/out [7:0]
	zxa, // zxbus ADDRESS 7-0 in [7:0]
	zxa14,zxa15, // zxbus ADDRESS 14,15
	zxiorq_n,zxmreq_n, // zxbus /IORQ,/MREQ
	zxrd_n,zxwr_n, // zxbus /RD, /WR
	zxblkiorq_n, // active low - signals to generate IORQGE
	zxbusin, // controls 74hct245 buffer direction (1 - input from bus, 0 - output to zx)
	zxbusena_n, // 74hct245 buffer enable signal



);


endmodule

