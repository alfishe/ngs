// testbench for chan_ctrl.v

`timescale 10ns/1ns

`define HALF_CLK (5.0)


module tb;

	reg clk;
	reg rst_n;



	// sync counter
	integer sync_cnt;


	// DUT connections
	wire [ 6:0] rd_addr;
	tri0 [31:0] rd_data;

	wire [ 6:0] wr_addr;
	wire [31:0] wr_data;
	wire        wr_stb;

	reg         sync_stb;

	reg  [31:0] ch_enas;

	wire [ 7:0] out_data; 
	wire        out_stb_addr;
	wire        out_stb_mix;


	// channels memory
	reg [31:0] channels [0:128];






	// clock and reset gen
	initial
	begin
		rst_n = 1'b0;
		clk = 1'b1;
		forever #(`HALF_CLK) clk = ~clk;
	end
	//
	initial
	begin
		#(1);
		repeat (3) @(posedge clk);

		rst_n <= 1'b1;
	end


	// sync generator
	initial
	begin
		sync_cnt = 0;
		sync_stb = 1'b0;
	end
	//
	always @(posedge clk)
	if( !rst_n )
	begin
		sync_cnt <= 637;
		sync_stb <= 1'b0;
	end
	else
	begin
		if( sync_cnt<(640-1) )
			sync_cnt <= sync_cnt + 1;
		else
			sync_cnt <= 0;

		sync_stb <= !sync_cnt;
	end




	// channels memory emulator
	always @(posedge clk)
	хуй





	always @(posedge clk)
		ch_enas = 32'hFFFF_FFFF;



	// DUT
	chan_ctrl chan_ctrl
	(
		.clk  (clk  ),
		.rst_n(rst_n),

		.rd_addr(rd_addr),
		.rd_data(rd_data),
                                
		.wr_addr(wr_addr),
		.wr_data(wr_data),
		.wr_stb (wr_stb ),

		.sync_stb(sync_stb),

		.ch_enas(ch_enas),

		.out_data    (out_data    ), 
		.out_stb_addr(out_stb_addr),
		.out_stb_mix (out_stb_mix )
	);






endmodule

