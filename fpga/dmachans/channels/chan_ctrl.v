// part of NeoGS project
//
// (c) NedoPC 2007-2019

module chan_ctrl
(
	input  wire clk, // 24.0 MHz
	input  wire rst_n,

	input  wire ena, // global enable

	// memory interface
	output reg  [ 6:0] rd_addr,
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
	output reg         out_stb_addr; // strobes address sequence (addrhi/mid/lo)
	output reg         out_stb_mix;  // strobes mix sequence (frac/vl/vr)
	// sequence: addrhi, addrmid, addrlo, frac, vl, vr (6 bytes)
);

	reg [ 5:0] curr_ch; // current channel number
	wire       stop = curr_ch[5];

	// channel fetch state machine
	reg [3:0] st;
	reg [3:0] next_st;

	// enable
	wire ch_ena = ch_enas[curr_ch[4:0]];


	always @(posedge clk)
	     if( st==ST_WAIT )
		curr_ch[5:0] <= 6'd0;
	else if( st==ST_NEXT )
		curr_ch[5:0] <= curr_ch[5:0] + 6'd1;





	localparam ST_BEGIN   = 4'd0;
	localparam ST_GETOFFS = 4'd1;
	//localparam ST_ = 4'd;
	//localparam ST_ = 4'd;
	//localparam ST_ = 4'd;
	//localparam ST_ = 4'd;
	//localparam ST_ = 4'd;
	//localparam ST_ = 4'd;
	//localparam ST_ = 4'd;
	//localparam ST_ = 4'd;
	//localparam ST_ = 4'd;
	localparam ST_NEXT = 4'd14;
	localparam ST_WAIT = 4'd15;

	always @(posedge clk, negedge rst_n)
	if( !rst_n )
		st <= ST_WAIT;
	else
		st <= next_st;
	//
	always @*
	case( st )
	//////////////////////////////////////////////////////////////////////
	ST_BEGIN:
	if( stop )
		next_st = ST_WAIT;
	else if( !ch_ena )
		next_st = ST_NEXT;
	else
		next_st = ST_GETOFFS;
	///////////////////////////////////////////////////////////////////////
	ST_GETOFFS:
	///////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////
	ST_NEXT:
		next_st = ST_BEGIN;
	///////////////////////////////////////////////////////////////////////
	ST_WAIT:
	if( sync_stb )
		next_st = ST_BEGIN;
	else
		next_st = ST_WAIT;
	///////////////////////////////////////////////////////////////////////
	default: next_st = ST_WAIT;
	///////////////////////////////////////////////////////////////////////
	endcase


	// state memory address control
	always @*
		rd_addr[6:2] <= curr_ch[4:0];
	//
	always @(posedge clk)
	if( st==ST_NEXT )
	begin
		rd_addr[1:0] <= 2'd0;
	end
	else if( st==ST_BEGIN )
	begin
		rd_addr[1:0] <= rd_addr[1:0] + 2'd1;
	end




endmodule

