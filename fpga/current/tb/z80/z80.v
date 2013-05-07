// (c) NedoPC 2013
//
// wrapper for T80.vhd
//
// fixes WR_N signal behavior, adds delays to outputs

`timescale 1ns/100ps

// as of z0840008
`define DLY_DN 34.0
`define DLY_UP 30.0

module z80
(
	input  wire rst_n,
	input  wire clk,

	input  wire int_n,
	input  wire nmi_n,
	input  wire busrq_n,
	input  wire wait_n,
	
	output wire [15:0] a,
	inout  wire [ 7:0] d,

	output wire mreq_n,
	output wire iorq_n,
	output wire rd_n,
	output reg  wr_n,

	output wire m1_n,
	output wire rfsh_n,
	output wire busak_n,
	output wire halt_n
);


	wire [15:0] #(`DLY_UP,`DLY_DN) za;
	wire [ 7:0] di;
	wire [ 7:0] #(`DLY_UP,`DLY_DN) do;

	wire #(`DLY_UP,`DLY_DN) zmreq_n;
	wire #(`DLY_UP,`DLY_DN) ziorq_n;
	wire #(`DLY_UP,`DLY_DN) zrd_n;

	wire iwr_n;
	wire im1_n;
	wire iiorq_n;
	wire ird_n;

	wire #(`DLY_UP,`DLY_DN) zm1_n;
	wire #(`DLY_UP,`DLY_DN) zrfsh_n;
	wire #(`DLY_UP,`DLY_DN) zbusak_n;
	wire #(`DLY_UP,`DLY_DN) zhalt_n;

	reg  mreq_wr_n;
	wire iorq_wr_n;
	wire full_wr_n;


	// attach T80 module
	T80a T80a
	(
		.RESET_n(rst_n),
		.CLK_n  (clk  ),

		.INT_n  (int_n  ),
		.NMI_n  (nmi_n  ),
		.BUSRQ_n(busrq_n),
		.WAIT_n (wait_n ),
		
		.A  (za),
		.D_I(di),
		.D_O(do)
		
		.MREQ_n(zmreq_n),
		.IORQ_n(iiorq_n),
		.RD_n  (ird_n  ),
		.WR_n  (iwr_n  ),

		.M1_n   (im1_n   ),
		.RFSH_n (zrfsh_n ),
		.BUSAK_n(zbusak_n),
		.HALT_n (zhalt_n )
	);

	assign ziorq_n = iiorq_n;
	assign zrd_n   = ird_n;
	assign zm1_n   = im1_n;


	assign a = za;

	assign mreq_n = zmreq_n;
	assign iorq_n = ziorq_n;
	assign rd_n   = zrd_n  ;
	assign wr_n   = zwr_n  ;

	assign m1_n    = zm1_n   ;
	assign rfsh_n  = zrfsh_n ;
	assign busak_n = zbusak_n;
	assign halt_n  = zhalt_n ;


	// fix broken wr_n of T80
	always @(negedge clk)
		mreq_wr_n <= iwr_n;
	//
	assign iorq_wr_n = iiorq_n | (~ird_n) | (~im1_n);
	assign full_wr_n = mreq_wr_n & iorq_wr_n;
	//
	always @(full_wr_n)
		if( !full_wr_n )
			#`DLY_DN wr_n <= full_wr_n;
		else
			#`DLY_UP wr_n <= full_wr_n;


	// data bus
	assign di =  d;
	assign d  = do;





endmodule

