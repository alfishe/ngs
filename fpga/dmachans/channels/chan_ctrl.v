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
	output reg  [ 6:0] wr_addr,
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

	// channel enable
	wire ch_ena = ch_enas[curr_ch[4:0]];

	// offset storage
	reg [31:0] offset;
	reg        off_cy; // extra carry [32th bit]

	// offset>=size flag
	reg oversize;

	// volumes storage
	reg [5:0] vol_left;
	reg [5:0] vol_right;
	// miscellaneous
	reg loopena;
	reg surround;
	
	// base address
	reg [13:0] base;




	always @(posedge clk)
	     if( st==ST_WAIT )
		curr_ch[5:0] <= 6'd0;
	else if( st==ST_NEXT )
		curr_ch[5:0] <= curr_ch[5:0] + 6'd1;





	localparam ST_BEGIN     = 4'd0;
	localparam ST_GETOFFS   = 4'd1; // when offset value arrives
	localparam ST_GETADDVOL = 4'd2; // whed add and volumes arrive
	localparam ST_GETSIZE   = 4'd3; // size and part of base address arrive
	localparam ST_GETLOOP   = 4'd4; // when loop and last part of base address arrive
	localparam ST_SAVEOFFS  = 4'd5;
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
		next_st = ST_GETADDVOL;
	///////////////////////////////////////////////////////////////////////
	ST_GETADDVOL:
		next_st = ST_GETSIZE;
	///////////////////////////////////////////////////////////////////////
	ST_GETSIZE:
		next_st = ST_GETLOOP;
	///////////////////////////////////////////////////////////////////////
	ST_GETLOOP:
		next_st = ST_SAVEOFFS;
	///////////////////////////////////////////////////////////////////////
	ST_SAVEOFFS:
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
	////////////////////////////////////////////////
	///////////////////////
	default: next_st = ST_WAIT;
	///////////////////////////////////////////////////////////////////////
	endcase


	// state memory address control
	always @*
		rd_addr[6:2] <= curr_ch[4:0];
	always @*
		wr_addr[6:2] <= curr_ch[4:0];
	always @(posedge clk)
		wr_addr[1:0] <= 2'd0;
	//
	always @(posedge clk)
	if( st==ST_NEXT )
	begin
		rd_addr[1:0] <= 2'd0;
	end
	else if( st==ST_BEGIN || st==ST_GETOFFS )
	begin
		rd_addr[1:0] <= rd_addr[1:0] + 2'd1;
	end



	// offset register control
	always @(posedge clk)
	if( st==ST_GETOFFS )
		offset <= rd_data;
	else if( st==ST_GETADDVOL )
		{off_cy, offset} <= {1'b0, offset} + {1'b0, 14'd0, rd_data[31:14]};
	else if( st==ST_GETLOOP )
		offset[31:12] <= oversize ? (offset[31:12]+rd_data[27:8]) : offset[31:12]; // TODO: or maybe rd_data & {20{oversize}} ?

	// offset overflow control
	always @(posedge clk)
	if( st==ST_GETSIZE )
		oversize <= ( {off_cy,offset[31:12]} >= {1'b0, rd_data[27:8]} );



	// volumes and miscellaneous
	always @(posedge clk)
	if( st==ST_GETADDVOL )
	begin
		vol_left  <= rd_data[11:6];
		vol_right <= rd_data[ 5:0];

		loopena  <= rd_data[13];
		surround <= rd_data[12];
	end



	// base address
	always @(posedge clk)
	if( st==ST_GETSIZE )
		base[13:8] <= rd_data[7:0];
	//
	always @(posedge clk)
	if( st==ST_GETLOOP )
		base[7:0] <= rd_data[7:0];





endmodule

