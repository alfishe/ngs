// part of NeoGS project
//
// (c) NedoPC 2007-2019

module chan_ctrl
(
	input  wire clk, // 24.0 MHz
	input  wire rst_n,

	input  wire ena, // global enable

	// memory interface
	output wire [ 6:0] rd_addr,
	input  wire [31:0] rd_data,
	//
	output wire [ 6:0] wr_addr,
	output wire [31:0] wr_data,
	output wire        wr_stb,

	// 37500 Hz period strobe (1-cycle strobe)
	input  wire        sync_stb,

	// channel enables
	input  wire [31:0] ch_enas,

	// output data
	output reg  [ 7:0] out_data; 
	output reg         out_data_stb; // goes to fifo
	// sequence: addrhi, addrmid, addrlo, frac, vl, vr (6 bytes)
);

	reg [ 5:0] curr_ch; // current channel number
	wire       stop = curr_ch[5];



	always @(posedge clk, negedge rst_n)
	if( !rst_n )
		curr_ch[5] <= 1'b1;
	else if( sync_stb )
		curr_ch[5:0] <= 6'd0;
	else if( !stop && хзчто )
		curr_ch[5:0] <= curr_ch[5:0] + 6'd1;














endmodule

